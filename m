Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795689191;
	b=1rW7pheEtMXaPHCTnt4LpCDKPbNxkstFBVuxPdAKKie4iM7Up079VA+R02FUPFHr7k/s
	 qihneef6bDQhcfsEcLyeT7gq7BbkWYBfbloPtDozUXlvITjjCrNjLu0hpfq0okwBWKTui
	 puuaSvPRCb3H+yC1wboy7GH/0/dLb922/VNGex3zN+QeyaHyED+TIGmjOU9vXNOpjyFrs
	 teUo1/81IuPwUbVMGGa1KDiLZ/i+WBEbx/CwmypWTwGCxA+ZNV169z1ermFMFa8wrNlYO
	 V6pJPCQ2Rx5ObtR0PXvHRu5z2ZvnFOUCh+dgAz0CPXKAymRN5wzEBdHaHSbDr40Yg0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689191;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=URBTmVc5HIt3ARgLVG0dLuL2usV497Fl4XWuyk4JQdg=;
	b=rwydPpiBlVjiOPSa5NMiA+CdfdKRRbo3DzCHMI5X5Ne10Z+Ejqa9wCpDQ3ZzuWyhOoLz
	 Znw3ZogIE2EhWQ6L5CqRXracrDEIBUVoY2lRLEYIt/LUg3UStfGpbaNYRdAz8aAmciPTW
	 D1S+taU18cyjfCTrbC6BWpQjhsRSbaXECZ1IuBhpItt5EAnH7mH6wdsd7v+C5Q+j6/0lU
	 bQncImgm6A2jKSn6xYndX0Yn6pSz0dRDOfUMqGcZ6eI7W2+dsSUmLNGlj8JJkRZjZhski
	 7ifmGAEx+gK7umt01EBBZe3NDZ9ddzU0H+tK9kU+QOp7EXAGUIRCG/dJkZl50ifoiwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BB2g20zR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DF7606A31C;
	Thu, 26 Nov 2026 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BB2g20zR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EEB51F000C6;
	Thu, 26 Nov 2026 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795689191;
	bh=URBTmVc5HIt3ARgLVG0dLuL2usV497Fl4XWuyk4JQdg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BB2g20zRswiZ9KqntoR35uyxA8IZjI/qZYq6s5sEHxf7usYcPLx2Yk+UKSrPiznjR
	 wM7p+bucwVEVGZ0YwtPfwxnA4nBLkEYPO0I4OB/8p1Lw3jhltc/YEYVWC7VIj22d/g
	 T0VL96mGwscsmLrCPksM4auxji3DzDZhuz9p8CaX71uhliYfcLb6oLleYBldcG56yx
	 47lGlrZFaIxZY2eP1t7qRe8nDpokGAJSY+eayrqcbrlfKeae8xE3/JvTIbfn3SUeHO
	 X0/Funxcg/XlyXpu0xKEvagcbPtAZoHfn51e3Cl2QOweYJwaLI3kw0iIXlUlP5n9to
	 5aiUKjSvs0t2A==
Message-ID: <sashiko-outbox-235295@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] ASoC: SOF: imx8: Switch imx8ulp DSP control to reset
 framework
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com, linux-sound@vger.kernel.org, imx@lists.linux.dev
Cc: Frank.Li@kernel.org
In-Reply-To: <20261126102528.1531824-1-shengjiu.wang@oss.nxp.com>
References: <20261126102528.1531824-1-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:33:09 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ASoC: SOF: imx8: undocumented dbgreset and optional resets in
  imx8ulp_probe()
--

commit e612ef7d377466215d3164c95469326c85ff2571
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

ASoC: SOF: imx8: Switch imx8ulp DSP control to reset framework

This commit replaces direct syscon regmap accesses in the i.MX8ULP SOF
DSP driver with the reset controller framework using named reset controls.

> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index 5cd3f44c90d2b..80326d2eb1fc0 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
[ ... ]
> @@ -202,42 +201,31 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
> =20
>  static int imx8ulp_run(struct snd_sof_dev *sdev)
>  {
> -	struct regmap *regmap =3D get_chip_pdata(sdev);
> +	struct imx8ulp_chip_data *chip =3D get_chip_pdata(sdev);
> =20
> -	/* Controls the HiFi4 DSP Reset: 1 in reset, 0 out of reset */
> -	regmap_update_bits(regmap, SYSCTRL0, RESET_BIT, 0);
> +	reset_control_deassert(chip->soft_rst);
> =20
> -	/* Reset HiFi4 DSP Debug logic: 1 debug reset, 0  out of reset*/
> -	regmap_update_bits(regmap, SYSCTRL0, DEBUG_LOGIC_BIT, 0);
> +	/* Release HiFi4 DSP Debug logic */
> +	reset_control_deassert(chip->dbg_rst);
> =20
> -	/* Stall HIFI4 DSP Execution: 1 stall, 0 run */
> -	regmap_update_bits(regmap, SYSCTRL0, EXECUTE_BIT, 0);
> +	/* Run HIFI4 DSP Execution */
> +	reset_control_deassert(chip->run_stall);
> =20
>  	return 0;
>  }
> =20
>  static int imx8ulp_reset(struct snd_sof_dev *sdev)
>  {
> +	struct imx8ulp_chip_data *chip =3D get_chip_pdata(sdev);
>  	struct arm_smccc_res smc_res;
> -	struct regmap *regmap;
> -
> -	regmap =3D get_chip_pdata(sdev);
> -
> -	/* HiFi4 Platform Clock Enable: 1 enabled, 0 disabled */
> -	regmap_update_bits(regmap, SYSCTRL0, PLAT_CLK_BIT, PLAT_CLK_BIT);
> =20
> -	/* HiFi4 PBCLK clock enable: 1 enabled, 0 disabled */
> -	regmap_update_bits(regmap, SYSCTRL0, PB_CLK_BIT, PB_CLK_BIT);
> -
> -	/* HiFi4 Clock Enable: 1 enabled, 0 disabled */
> -	regmap_update_bits(regmap, SYSCTRL0, HIFI4_CLK_BIT, HIFI4_CLK_BIT);
> -
> -	regmap_update_bits(regmap, SYSCTRL0, RESET_BIT, RESET_BIT);
> +	reset_control_assert(chip->soft_rst);
> =20
>  	usleep_range(1, 2);
> =20
> -	/* Stall HIFI4 DSP Execution: 1 stall, 0 not stall */
> -	regmap_update_bits(regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
> +	/* Stall HIFI4 DSP Execution: */
> +	reset_control_assert(chip->run_stall);
> +
>  	usleep_range(1, 2);
> =20
>  	arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &smc_res);
> @@ -248,16 +236,30 @@ static int imx8ulp_reset(struct snd_sof_dev *sdev)
>  static int imx8ulp_probe(struct snd_sof_dev *sdev)
>  {
>  	struct imx_common_data *common;
> -	struct regmap *regmap;
> +	struct imx8ulp_chip_data *chip;
> +
> +	chip =3D devm_kzalloc(sdev->dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> =20
>  	common =3D sdev->pdata->hw_pdata;
> =20
> -	regmap =3D syscon_regmap_lookup_by_phandle(sdev->dev->of_node, "fsl,dsp=
-ctrl");
> -	if (IS_ERR(regmap))
> -		return dev_err_probe(sdev->dev, PTR_ERR(regmap),
> -				     "failed to fetch dsp ctrl regmap\n");
> +	chip->run_stall =3D devm_reset_control_get_exclusive(sdev->dev, "runsta=
ll");
> +	if (IS_ERR(chip->run_stall))
> +		return dev_err_probe(sdev->dev, PTR_ERR(chip->run_stall),
> +				     "failed to get dsp runstall reset control\n");
> +
> +	chip->soft_rst =3D devm_reset_control_get_optional_exclusive(sdev->dev,=
 "softreset");
> +	if (IS_ERR(chip->soft_rst))
> +		return dev_err_probe(sdev->dev, PTR_ERR(chip->soft_rst),
> +				     "failed to get dsp softreset reset control\n");
> =20
> -	common->chip_pdata =3D regmap;
> +	chip->dbg_rst =3D devm_reset_control_get_optional_exclusive(sdev->dev, =
"dbgreset");
> +	if (IS_ERR(chip->dbg_rst))
> +		return dev_err_probe(sdev->dev, PTR_ERR(chip->dbg_rst),
> +				     "failed to get dsp dbgreset reset control\n");
> +
> +	common->chip_pdata =3D chip;
> =20
>  	return 0;
>  }

[Severity: Medium]
Does requesting "dbgreset" here match the fsl,dsp.yaml Devicetree binding,
and should chip->soft_rst and chip->dbg_rst be optional on i.MX8ULP?

Documentation/devicetree/bindings/dsp/fsl,dsp.yaml only allows "runstall"
and "softreset" in reset-names:

  reset-names:
    minItems: 1
    items:
      - const: runstall
      - const: softreset

A Devicetree conforming to that schema cannot specify "dbgreset" (and may
omit "softreset"), leaving chip->dbg_rst or chip->soft_rst NULL so
reset_control_assert() in imx8ulp_reset() and reset_control_deassert() in
imx8ulp_run() become no-ops instead of toggling the SIM_LPAV SYSCTRL0 DSP
reset and debug reset bits.  In addition, removing the fsl,dsp-ctrl
syscon lookup without a fallback breaks compatibility with existing DTBs
that still use fsl,dsp-ctrl, and leaves the linux/mfd/syscon.h include in
sound/soc/sof/imx/imx8.c unused.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126102528.1531=
824-1-shengjiu.wang@oss.nxp.com?part=3D1
