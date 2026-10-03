Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD41E37E2E2
	for <imx@lists.linux.dev>; Sat,  3 Oct 2026 01:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991248; cv=none; b=ZaaskKNXilG9qE9u+btZ7zgSNg2wsvHsEBNCZoLJCJ63Mn8aF4wSmC/JrvAanQ/zq+PkvogZ4oTWoZsvJhUZ2YtDwS340WPnm7dFc1IM7dSW749D7FvlKWdWUnb8CqbSMZ4wtdCb/iFvAd3aso86ZVuMlvkaolV3rdwqRCObw64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991248; c=relaxed/simple;
	bh=HGSx0EMs/MbRmYY6VpsViGHeoQ97sGae1ycpOmdIOxc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WGvJjM8fTTiuAIt90Xgonf8gV6E3ftf48nLrSXWZ40Z6wwDNUBMk2IAYzJogFPIrmKvDVWZzZnatDk0d3/KP7z+xQa9ya5oPJvJHqonYOmMWS8d7HYgaq6R6tVbWMUh2aV9c1L7qFIcG3dZsYZ0DdCv1KgC/N9TUenvXuXrUDkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7xAevDx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7xAevDx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536AF1F00898;
	Sat,  3 Oct 2026 01:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790991246;
	bh=deQd6HxiL0bbS03kKalXkiTwQWeYZILfsn1/YbteEvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M7xAevDxGM0gA7hkN1/wbYu+x3yUlFP1ySrD9Z5xKFgBFn6wPzYqKwgqkrnYAWtUG
	 1K26zn8zxTE+FCxTZ0MD6FtoX5y0ErhvAMmLaSMIGSGWRQmU0Z5eFvFfbVP0h11e25
	 OW+ZNCF894SivmkEuN6r07uCBTJ3OA6FBOAhlUz4wM8nEIEJNq3y0+f2dsUBVFo5Ap
	 uGic3FJv8SRDCZQoEHdxZf4+RW5fk8b8Pu88KiaCEYNlaMrJVqu6kVHqP9ZlpM7GhH
	 0jrd8/lfxEjxhyyv6GTTGl4mMrj2smDO/6X18KIyyi2u1VaoDHoT0ma5g9nBLUkH/w
	 1tB3b+Li1gIFA==
From: sashiko-bot@kernel.org
Subject: Re: [net-next,PATCH] enetc: Set eMDIO MDC rate to 2.5 MHz only on
 i.MX95
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261001223947.60189-1-marex@nabladev.com>
References: <20261001223947.60189-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 01:34:05 +0000
Message-Id: <20261003013406.536AF1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: enetc: uninitialized mdc_div breaks MDIO for non-PCI users
--

commit 324eeacc2ec0cb1fd98e9f3ac96f2fe7f653ae78
Author: Marek Vasut <marex@nabladev.com>

enetc: Set eMDIO MDC rate to 2.5 MHz only on i.MX95

The current eMDIO MDC rate is 2.5 MHz on i.MX95 B0. It was pointed
out by NXP, that the MDC rate is divided down from clock of different
frequency and using different division ratio on different SoCs. Configure
the i.MX95 eMDIO MDC rate to 2.5 MHz to match the 802.3 specification
and reinstate previous divider ratio for all other SoCs.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c b/drivers/=
net/ethernet/freescale/enetc/enetc_mdio.c
> index a90a04a47befd..7ed9b9120f447 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
[ ... ]
> @@ -63,7 +63,7 @@ int enetc_mdio_write_c22(struct mii_bus *bus, int phy_i=
d, int regnum,
>  	u16 dev_addr;
>  	int ret;
> =20
> -	mdio_cfg =3D ENETC_EMDIO_CFG;
> +	mdio_cfg =3D ENETC_EMDIO_CFG(mdio_priv->mdc_div);

[Severity: High]
Does this code break MDIO communication for non-PCI users?

The mdio_priv struct is allocated and zero-initialized by drivers such as
the enetc PF driver (drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
in enetc_mdio_probe() and enetc_imdio_create()), the DSA NETC driver
(drivers/net/dsa/netc/netc_main.c in netc_port_create_emdio_bus()), and the
Ocelot driver (drivers/net/dsa/ocelot/felix_vsc9959.c in
vsc9959_mdio_bus_alloc()) via devm_mdiobus_alloc_size() or
mdiobus_alloc_size().

Since this patch only initializes mdc_div in enetc_pci_mdio_probe(), mdc_div
remains 0 for these other drivers.

When enetc_mdio_write_c22() and other MDIO accessors use
ENETC_EMDIO_CFG(mdio_priv->mdc_div), the MDC clock divisor will be set to 0
instead of a valid value (like 66). This results in a clock rate that
violates the IEEE 802.3 2.5 MHz limit, breaking PHY probing and leaving
network interfaces unusable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001223947.6018=
9-1-marex@nabladev.com?part=3D1
