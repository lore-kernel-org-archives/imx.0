Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F6C3AA1BD
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 06:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785307768; cv=none; b=UtIGM1N7AqzY1lneLummeWUgGSWEiDGRB0HJBRNe5I5vpOh7VnHMDf53L+5VgXnfq/GFLImxBTmnZMzVCaqHdFZaWou2Q0VLR+G8qQJk1mDlkIcfTMB5Ay2v4OO22Oy8f6tgFACM38wSahy8epY7/abPQd5dgl8ib4ln0aa+8V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785307768; c=relaxed/simple;
	bh=VYHU+2eXCMfTHIki5jwjn941K4NBc5hLnLXZ06VkHd4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q16QmO4Ga1IfJ62RAcov7CkJ5vkNKSZN9zQPQcL02ryEbBgbOtMcGKuxiexBmraJZM0KVl7okZ2vP8UoF5U92xGafPsnHEV9XParw6uEt207icssjeUAeACHLyRM2mowZVzq5MP81aPVPar5a6MR+c1UZNDBbV1XGytcViTqjIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jG0y84tz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jG0y84tz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F751F000E9;
	Wed, 29 Jul 2026 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785307765;
	bh=a5XST+XBsWG9hKzIlTdRSHZnzT9UyERw2f83xdwRgko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jG0y84tzKq6V7OyJI68Y+Dj9DM+vUzXtM5oBc32/ZVaaOdRpgSFNMNHrrxfdrXm3G
	 YzQl75J9P06J6DRBoJr7VvEA82u47z5/Kh9pTeXzSXEVx2EzhCjQ3RsJsdP6J+RVPF
	 +e43gB9+JrGeEhPHj1FywXyewmzqntjvxi3Zl0yIs+XHdBMWrS9O1kMdCTGGVvdFxP
	 u/r9fcPPuO/GuHo/vjSFGSFT1DCXEVOrkYPAKyNSnOQptokZJ8gGCDBOecyiH9ufJ6
	 Orvu2WRRuaQTjTJR6prEvlc6wwEKr72ozya0VRebNYa8naFRLqRHNFxY5631wdFf3T
	 BrqY42l9ejzmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/6] phy: fsl-imx8mq-usb: add control register regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, olteanv@gmail.com
In-Reply-To: <20260729-imx8mp-usb-phy-improvement-v7-4-c385ee40ade6@nxp.com>
References: <20260729-imx8mp-usb-phy-improvement-v7-0-c385ee40ade6@nxp.com>
 <20260729-imx8mp-usb-phy-improvement-v7-4-c385ee40ade6@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 06:49:23 +0000
Message-Id: <20260729064925.79F751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Incorrect error handling of pm_runtime_get_sync() treats a succe=
ssful active state as a failure.
- [Low] Missing Kconfig dependency for REGMAP_MMIO.
--

--- Patch [4]: [PATCH v7 4/6] phy: fsl-imx8mq-usb: add control register reg=
map ---
commit 3be8b97176fdd5e159a3f1a8541ee32a8755658b
Author: Xu Yang <xu.yang_2@nxp.com>

phy: fsl-imx8mq-usb: add control register regmap

This commit adds a 32-bit MMIO control register regmap for on-chip access
to the control registers inside the USB 3.0 femtoPHY. It exports these
registers via debugfs to help with PHY diagnostic.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index 74e665525ec48..83d5a44c40848 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
[ ... ]
> @@ -696,6 +708,13 @@ static int imx8mq_usb_phy_probe(struct platform_devi=
ce *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
> =20
> +	imx_phy->cr_regmap =3D devm_regmap_init_mmio(dev, imx_phy->base + PHY_C=
RCTL,
> +						   &imx_cr_regmap_config);

[Severity: Low]
Does this new regmap initialization require a Kconfig update?

Since the driver now uses devm_regmap_init_mmio(), it depends on the MMIO
regmap subsystem. However, PHY_FSL_IMX8MQ_USB in drivers/phy/freescale/Kcon=
fig
does not select REGMAP_MMIO.

Could this lead to build failures (such as missing module or undefined
reference to __devm_regmap_init_mmio_clk) in configurations where no other
component selects REGMAP_MMIO?

> +	if (IS_ERR(imx_phy->cr_regmap)) {
> +		dev_warn(dev, "Fail to init debug register regmap\n");
> +		imx_phy->cr_regmap =3D NULL;
> +	}
> +
[ ... ]

[Severity: Medium]
Looking at the driver's unbind path in imx8mq_usb_phy_remove():

static void imx8mq_usb_phy_remove(struct platform_device *pdev)
{
	...
	ret =3D pm_runtime_get_sync(dev);
	if (ret)
		dev_warn(dev, "failed to resume on remove: %d\n", ret);

According to the PM subsystem rules, pm_runtime_get_sync() returns 1 when t=
he
device is already active. Does checking if (ret) instead of if (ret < 0)
treat this success condition as a failure, potentially causing a spurious
kernel warning during driver unbind?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-imx8mp-usb=
-phy-improvement-v7-0-c385ee40ade6@nxp.com?part=3D4
