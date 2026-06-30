Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBD03F5BC3
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 11:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817986; cv=none; b=pB6PssAMQmd/LrzWqDsTs2C6JjP67sEZt0d2+FKNVUuez7pOG4nqEd1saWmIMUgMiELA6WTWt421jZLSI0v5bZkT+5Y+RhPtGRpQ323vXmznjGMU9iYmaSZ6KXqHKS8jD0dEW4X8wiR1mg4i9uSmlJSkKv15jJh8XLICZAKfqhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817986; c=relaxed/simple;
	bh=L24rF51Aof3u1CWR8fzeo8bfupF0h4rfgQwMRoff4JY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oy3cnYTAmIfci5JvNTOPNQNAta13HP9yU0SPoMh4pZCTzSkVjQ434nGorZccY85YGrVPQLR5SgSl+csyMpYump+qqxg4Z9Jn36g9T8m7TmHsSqXQwMny7eq+QnS+fvKQ4Aq5p4X4wRwMiJNdnxodGg/VuPJrbFOPk+9qbRHGNkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQ0HFW0y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQ0HFW0y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B971F000E9;
	Tue, 30 Jun 2026 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782817984;
	bh=dXwf9MFnxmrskbOpPhh4KPZhCD/mf9AcUlE163bmeQ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bQ0HFW0ybAJeXdTzjFRJKMTpqk/CtAI6YHNolFN1WTxuPl6e3GiImUAhpfWnqN7++
	 SbEvaKX9R1OxsM0t7lfRm5DaJPp+Gze58I+LwKMKKsqZ5nxcjQvFaH66/ggxUtNF77
	 g7fZ5NNvSnDUlmLgMUPNSUlNts5N94+o4M35AA8jRdlPZuf5lYW9BSHIYskpqXQIfW
	 qhXVQOEMK5xcSFLbng2F91Yt5vWOVH2nC34Vw5Mi5I+cXTd6mVMLRmiMJAANU+PaoH
	 OgY+3AM5SYpv6WpLw/CKfncpR0ukA3BCZWLikCkxdk5Y5kOpHzvKvkQjGVEu1liQv1
	 OphrZSvZoFoDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] phy: fsl-imx8mq-usb: add control register regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: Frank.Li@kernel.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, imx@lists.linux.dev, neil.armstrong@linaro.org
In-Reply-To: <20260630-imx8mp-usb-phy-improvement-v5-4-25d616403844@nxp.com>
References: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
 <20260630-imx8mp-usb-phy-improvement-v5-4-25d616403844@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 11:13:03 +0000
Message-Id: <20260630111304.68B971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Runtime PM enablement is leaked on probe error paths.
--

commit 487a0a8551844cc9b5c38e7f8d7cbf2ec3f1435d
Author: Xu Yang <xu.yang_2@nxp.com>

phy: fsl-imx8mq-usb: add control register regmap

This commit adds a control register regmap for the USB 3.0 femtoPHY.
It exposes these registers through debugfs to assist with diagnostic
efforts.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index 9d1dd0e7352ed..4949ec78d3044 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
[ ... ]
> @@ -695,6 +707,13 @@ static int imx8mq_usb_phy_probe(struct platform_devi=
ce *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
> =20
> +	imx_phy->cr_regmap =3D devm_regmap_init_mmio(dev, imx_phy->base + PHY_C=
RCTL,
> +						   &imx_cr_regmap_config);
> +	if (IS_ERR(imx_phy->cr_regmap)) {
> +		dev_warn(dev, "Fail to init debug register regmap\n");
> +		imx_phy->cr_regmap =3D NULL;
> +	}
> +
>  	pm_runtime_set_active(dev);
>  	pm_runtime_enable(dev);

[Severity: Medium]
Is there a leak of the runtime PM enablement state on probe error paths her=
e?

In imx8mq_usb_phy_probe(), pm_runtime_enable() is called, but subsequent
initialization steps (like devm_phy_create() or devm_regulator_get()) can f=
ail
and return directly without calling pm_runtime_disable().

Could this leave the disable_depth counter at 0 on a probe failure like
-EPROBE_DEFER, resulting in an 'Unbalanced pm_runtime_enable!' warning on t=
he
next probe attempt? Would using devm_pm_runtime_enable() ensure this state =
is
properly cleaned up?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-imx8mp-usb=
-phy-improvement-v5-0-25d616403844@nxp.com?part=3D4
