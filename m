Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82FA3C416A
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171258; cv=none; b=ed64+UoWMMIjYUaEfIwu8GGr7+N/kpxkPbWS81UZNlH1+cfg1XZ/6m6XZHvw3b4te5rdswqym41eq9VZQJnWkM6nX78fIA39ejq2RMuv7jra5CP8W0++jAEP2mqP1lZmW0bnUeAKdYkLosLxXYtxeo7aBkaLFIdewgmlxk+ONo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171258; c=relaxed/simple;
	bh=eJb17ENCe+ABveHK5Org8W3FvP/3M3PabRLFk0+Kjrg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D00kJGJQ1cFf79KO4ttEUN9RTiuqEjVDEkZS8k/YT5wlY2ktj8RoImAMUGSyrzIM7555B+fk8YhVRNLKJ1A+pprDAia9VpmLCZQ+pf9fpvUlSR0BJ5P559qjjmqnOnEO16wf4McPiscr4IDl6zDBFTyqTUiXgoaydcPtKe7GzPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gwx+E/Y5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gwx+E/Y5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47BA1F00893;
	Thu, 11 Jun 2026 09:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171257;
	bh=6FvaCK8UPiXZhdYTP/N/3vL7NQ/U2wiK+8tqJbETg6M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gwx+E/Y5GBatYmcnkXNSBYk8apATioyzRBSyQt6jJaLFmMeYPwMtSlQ9l6w/Wr3DN
	 /jGVe34jyrbwt/+Z12vK0HgPnd6sriSdoGEKWuUnjZ/57E/XYejfPKhwQZjAbf+TWW
	 e0ypAE0Ll47s6j4WX90BK33N0NWx47G50UsNRXWaIFjBgzPjy9Pm73xsVARmHv1j9F
	 PBW8Q2Xz9rVYN6LYvx445ZRgbkuTOUOs+Wg2vtbf7fIhz7kyLdv7zb3s13NSfQLkgj
	 e4bVxy27h0IPUTBptpWf1l2QOwMffsZC4sbIofIYKdJxZRQbcT00WUDIbKi5X3qhmt
	 eoSy2PhLM+Ftg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 07/15] net: enetc: add .ndo_set_vf_mac() to
 the enetc v4 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260610091844.3423693-8-wei.fang@oss.nxp.com>
References: <20260610091844.3423693-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:47:35 +0000
Message-Id: <20260611094736.D47BA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The v4 driver's MAC address programming functions (`enetc4_pf_set_=
si_primary_mac` and `enetc4_pf_get_si_primary_mac`) use `__raw_writel` and =
`__raw_readl` coupled with LE-unaligned helpers, which silently breaks the =
MAC address configuration on Big Endian architectures.
--

commit fb7fbde8e308b4c501381b6a15d58e74e9aff89a
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add .ndo_set_vf_mac() to the enetc v4 driver
   =20
Add .ndo_set_vf_mac() to the enetc v4 driver to configure the MAC
addresses of VFs.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> index 4b69c19b23194..d310506a6fd4b 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -575,6 +575,7 @@ static const struct net_device_ops enetc4_ndev_ops =
=3D {
>  	.ndo_hwtstamp_get	=3D enetc_hwtstamp_get,
>  	.ndo_hwtstamp_set	=3D enetc_hwtstamp_set,
>  	.ndo_set_vf_trust	=3D enetc_pf_set_vf_trust,
> +	.ndo_set_vf_mac		=3D enetc_pf_set_vf_mac,

[Severity: High]
This is a pre-existing issue, but I'd like to ask about the endianness hand=
ling
in the underlying v4 hardware accessors used for MAC configuration.

Looking at enetc4_pf_set_si_primary_mac() and enetc4_pf_get_si_primary_mac()
in drivers/net/ethernet/freescale/enetc/enetc4_pf.c, they use __raw_writel()
and __raw_readl():

    __raw_writel(lower, hw->port + ENETC4_PSIPMAR1(si));
    ...
    lower =3D __raw_readl(hw->port + ENETC4_PSIPMAR1(si));

Does this silently break MAC address configuration on Big Endian architectu=
res?

get_unaligned_le32() reads the first 4 bytes of the MAC address and returns
them as a host-endian 32-bit integer. __raw_writel() then writes this value
directly to memory without byte swapping. On a Big Endian system, this caus=
es
the bytes to be written in reverse order to the little-endian PCIe device.

For the remaining 16 bits, get_unaligned_le16() returns a host-endian 16-bit
value which is passed into __raw_writel(). The value is zero-extended to
32 bits. On a Big Endian system, writing this directly via __raw_writel()
places the non-zero MAC bytes at offset +2 and +3 instead of offset +0 and =
+1,
effectively programming 00:00 into the device's MAC address.

The read function enetc4_pf_get_si_primary_mac() is also broken on Big Endi=
an:
__raw_readl() places the MAC bytes into the upper 16 bits of the 32-bit ret=
urn
value. When assigned to a u16 variable, the value is truncated and the MAC
address is discarded, resulting in 00:00.

Should the driver use standard writel() / readl() or the driver's
enetc_port_wr() to ensure correct host-to-little-endian conversion?

>  };
> =20
>  static struct phylink_pcs *

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610091844.3423=
693-1-wei.fang@oss.nxp.com?part=3D7
