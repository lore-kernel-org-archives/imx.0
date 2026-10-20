Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483261;
	b=Oc/7+LNFGuVB6G2+oxhifJHYVaNAk6JooWOakf6Ol/ZiLCbugW4Fnlp14uID+SIMQb/2
	 1H/EuOM3+XLTfwczIBbg43TrxJchHVJnU7AVa8p0hpgWwVcVhRY51Z4Pc91wS3UaagHVr
	 EjC1rGY51pZKNnuxtN9FDsYcRhOg150LM8Vx7b/gllwFPsTnRhEw6090Ea7hkM61qcFef
	 XzmWDw9mSg5FB0tCTSHJWktg5hItEQbkO4/Es1FFkeVxg9D+tstgHrKLkxpMUi/j2WdA/
	 vq53BL1uM1z2RZ7jO40PEbFK7X+AtOtpNLpCTEnsxQ/d8iy7gVAPREy2AxLJQRp5b7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483261;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UBotgRTFrFy65yan3gjmTdGhM0soWJEp61xSEN3kB/U=;
	b=vrlzfKr6HDraHZ80dIaybtGexvkTQHa328d4qlOdciHDn7dDbDZBVB5IEqSHJVzX1lQC
	 fvPSpugXuHyd4GoHKQFAvh4pz/KYhVC6oYwy/1h6moRRY5KwCUE6lJKpit43A/idSnNqb
	 4tedo5LzK6xEKdYDnROLgBL2L575mFhoVvj28WgENT7RCJNhN9Ouy85O6+kFk/je+Y/VO
	 AKREzWrkFBc6rMv0dow8auucDjuQooQvDLnmCNJMt+6o7p3W3xVoE1ER5WAbJLZXHGTpN
	 g8dB3hyLgj6bdIKTHeTSUR1YxEsL5fqPypG201va43Z8JbVBt1WXTU1ZqlcbazwJDAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jz1Q8djX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C23606A319
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 08:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jz1Q8djX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8EC1F000C4;
	Tue, 20 Oct 2026 08:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792483261;
	bh=UBotgRTFrFy65yan3gjmTdGhM0soWJEp61xSEN3kB/U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jz1Q8djXYQ+dYSGj3QVARdK4vxI/ygrt0rsutm1wZuM9u5G3259n32fM5k9lb+hZj
	 tV7UHn4oUhNZYmCNo9q1vUGSgTSjvEtsycvEtDF+7N9ZzDf6vG7O8hUNGXPh3BEPrv
	 24eCI/j7TkgAi5ZWKeT2R9H1EHwj1YhiT9lZB5vVCQVOHdiGks6kx8txcYxZ1E0wCs
	 FNKRLfm7wLzwp5EDfTtg5BukoesfMm1PHfxCxTHuMUkKyReaYMNmSepqEUvUHOsd1a
	 vb7fovsPcgvV285LOeMYlkpTLymZyGfsG+tbw39hLIytg7EfqpxaiPHdbb8eDx3dvH
	 iuVjVhOj7xGpw==
Message-ID: <sashiko-outbox-178465@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: synopsys: dw-mipi-csi2rx: Fix DPHY testclr reset
 sequence
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261020-dw-csi2rx-v1-1-c58a2e5cd43d@oss.nxp.com>
References: <20261020-dw-csi2rx-v1-1-c58a2e5cd43d@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:01:00 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: missing MMIO flush before ndelay() in imx93_csi2rx_dphy_a=
ssert_reset()
--

commit b3d3c4c8602e49d8fd933f7b1d722f45a1287b01
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

media: synopsys: dw-mipi-csi2rx: Fix DPHY testclr reset sequence

This commit updates imx93_csi2rx_dphy_assert_reset() so that the DPHY test
clear bit is asserted first, held for 15ns, and then deasserted.

> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/m=
edia/platform/synopsys/dw-mipi-csi2rx.c
> index b7247d597c9cc..b9f7ba25bd3ba 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -830,18 +830,23 @@ static void imx93_csi2rx_dphy_assert_reset(struct d=
w_mipi_csi2rx_device *csi2)
>  {
>  	u32 val;
> =20
> -	/* Release Synopsys DPHY test codes from reset */
> +	/* Put PHY in shutdown mode for configuration */
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ, 0);
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ, 0);
> =20
> +	/*
> +	 * Apply testclr pulse to load analog programmability defaults
> +	 * and release the test interface for configuration.
> +	 */
>  	val =3D dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
> -	val &=3D ~DPHY_TEST_CTRL0_TEST_CLR;
> +	val |=3D DPHY_TEST_CTRL0_TEST_CLR;
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
> =20
> -	val =3D dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
>  	/* Wait for at least 15ns */
>  	ndelay(15);
> -	val |=3D DPHY_TEST_CTRL0_TEST_CLR;
> +
> +	val =3D dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
> +	val &=3D ~DPHY_TEST_CTRL0_TEST_CLR;
>  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
>  }

[Severity: Medium]
Should dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0) remain before
ndelay(15) in imx93_csi2rx_dphy_assert_reset()?

When streaming is started via dw_mipi_csi2rx_start() ->
imx93_csi2rx_dphy_assert_reset(), moving the read of
DW_MIPI_CSI2RX_PHY_TST_CTRL0 to after ndelay(15) means the posted writel()
asserting DPHY_TEST_CTRL0_TEST_CLR is no longer flushed to the target
register before the 15ns CPU delay loop executes.

If that write remains buffered in the interconnect while ndelay(15) runs, t=
he
subsequent read will flush the assertion and immediately clear and write
DPHY_TEST_CTRL0_TEST_CLR back without waiting 15ns, which could violate the
minimum pulse width.

Note that imx93_csi2rx_dphy_deassert_reset() right below this function
specifically performs a readback before ndelay() for this reason:

	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ, 0x1);
	/*
	 * ndelay() is not necessary have MMIO operation, need dummy read to
	 * ensure that the write operation above reaches its target.
	 */
	dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ);
	ndelay(5);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-dw-csi2rx-=
v1-1-c58a2e5cd43d@oss.nxp.com?part=3D1
