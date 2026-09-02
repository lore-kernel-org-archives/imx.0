Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D0217993
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 06:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331061; cv=none; b=qMNc82WDHUDVzTBL0Mzri9Hf1A+koTk46yT3H4HstkwD/vhjuyfAMEc9j20/YHWBCtF8wAQXiBADDNtc4Y6cfY3w5Xv40cYcxA9XQGsbcHshfIa57PJUf4pnFRvmxA5nU9gAUNNjEGkSMKwVwYx7x/U5x9Fh3a/D/BYLzsinIsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331061; c=relaxed/simple;
	bh=DAMRlVtmA28kda6Owrw41n0uPeI1Qr5W4+Bz3OWbK7U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vFU5XJPdMpvECVIfe1k8KsLEGlUY0p1t2UxAXk6yCP3pumqSpaXIUE8fVMbLYKYqMscEG8jqqLPEukseIlekVgQCW9uQ2BD2b4Gj0BDMV6LG/ETH6WhvvuT8+EsLj98X4vdRDt/xbsswsiwn4a008f9s2OjZoKo5LgA0qyzk8yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaCtWr+z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaCtWr+z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89F01F000E9;
	Wed,  2 Sep 2026 06:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788331060;
	bh=evEWGuZzVDl7tYLIwIWKDjKI1FnsdO+4xSf02ZLfOqs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EaCtWr+zmn4QKxnx/s/kzKDYLqsjWTabQxzotOATee/CA6dzP7WY68TBVgN233tco
	 Hv4bv12SSbpFkL7AmuEQ26qvlCTtGRnLleGlszwRInRNBJaDDnegpLfyQzNmLTQbwV
	 IF5VHig0Gigv3mDOXtPdQlyZk4rvYQY91gX+Z61KECAdfB8x6NY5C0DABlrEOiaJNI
	 IUCQv728nmLadATbgxCqf/UltTg50Fh+3p6eMq2FlVCWXlszoSnv0AtepXMhq/7ZfD
	 nWR8X9WQ2qxMhxtXtIiFZlALM8uVFfn02hHuwSwKW/i9JaFRW0qEjNVnyZwUafltoS
	 z4F+EnXYdCZBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE
 queries from the pad register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260902062352.3600368-2-mehmet.fide@gmail.com>
References: <20260902062352.3600368-1-mehmet.fide@gmail.com>
 <20260902062352.3600368-2-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 06:37:39 +0000
Message-Id: <20260902063739.A89F01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The patch introduces a read of an uninitialized stack variable, =
causing non-deterministic behavior and a cascading state trap that corrupts=
 debugfs output.

Pre-existing issues:
- [High] Generic queries for unsupported SoCs fall through to the legacy pa=
th and return raw register bits instead of -ENOTSUPP, violating the generic=
 API contract.
--

commit b3256a64d0ea28cb67caa6371dfdc4e8b8b48f42
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad regist=
er
   =20
The mmio pinconf get callback ignores which parameter was requested and
returns the raw conf register, so a generic query through
pinctrl_gpio_get_config() gets register bits back instead of the packed
parameter it asked for.

> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/fr=
eescale/pinctrl-imx.c
> index 9a45b376d36f9..5da1a76b01412 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c

[ ... ]

> @@ -297,6 +298,35 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev *=
pctldev, unsigned pin_id,
>  	struct imx_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
>  	const struct imx_pinctrl_soc_info *info =3D ipctl->info;
>  	const struct imx_pin_reg *pin_reg =3D &ipctl->pin_regs[pin_id];
> +	enum pin_config_param param =3D pinconf_to_config_param(*config);
> +	unsigned int mask =3D 0;
> +	u32 raw;
> +
> +	/*
> +	 * Only OUTPUT_ENABLE/INPUT_ENABLE are decoded, and only when the SoC
> +	 * declares the bits. Everything else still returns the raw conf
> +	 * register, the debugfs dump depends on it.
> +	 */
> +	switch (param) {
> +	case PIN_CONFIG_OUTPUT_ENABLE:
> +		mask =3D info->obe_mask;
> +		break;
> +	case PIN_CONFIG_INPUT_ENABLE:
> +		mask =3D info->ibe_mask;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (mask) {
> +		/* pin not configured, nothing to report */
> +		if (pin_reg->conf_reg =3D=3D -1)
> +			return -ENOTSUPP;
> +
> +		raw =3D readl(ipctl->base + pin_reg->conf_reg);
> +		*config =3D pinconf_to_config_packed(param, !!(raw & mask));

[Severity: Medium]
Is it safe to extract a parameter from the incoming *config pointer?

Looking at imx_pinconf_group_dbg_show() in the same file, config is passed
to imx_pinconf_get() uninitialized:

drivers/pinctrl/freescale/pinctrl-imx.c:imx_pinconf_group_dbg_show() {
	...
	unsigned long config;
	...
	for (i =3D 0; i < grp->grp.npins; i++) {
		...
		ret =3D imx_pinconf_get(pctldev, pin->pin, &config);
	...
}

Since config contains stack garbage on the first iteration, and its
value is retained across loop iterations, could pinconf_to_config_param()
randomly decode into PIN_CONFIG_OUTPUT_ENABLE or PIN_CONFIG_INPUT_ENABLE?

If it does, or if a previous pin's raw register ends in the same byte,
won't this path embed the parameter back into the lowest 8 bits via
pinconf_to_config_packed()?

This appears to permanently trap all subsequent loop iterations into falsely
triggering the generic decoding path instead of returning raw registers.

> +		return 0;
> +	}
> =20
>  	if (pin_reg->conf_reg =3D=3D -1) {
>  		dev_err(ipctl->dev, "Pin(%s) does not support config function\n",

[Severity: High]
This is a pre-existing issue, but does this correctly handle generic queries
on SoCs that lack the requested masks?

If a generic caller requests PIN_CONFIG_OUTPUT_ENABLE via
pinctrl_gpio_get_config(), and the SoC does not define obe_mask, the
mask remains 0 and bypasses the if (mask) decoding block.

Does this cause the query to fall through to the default path:

drivers/pinctrl/freescale/pinctrl-imx.c:imx_pinconf_get_mmio() {
	...
	*config =3D readl(ipctl->base + pin_reg->conf_reg);

	if (info->flags & SHARE_MUX_CONF_REG)
		*config &=3D ~info->mux_mask;

	return 0;
}

and succeed, returning raw pad register bits to a generic caller instead of
rejecting the unsupported generic parameter with -ENOTSUPP?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902062352.3600=
368-1-mehmet.fide@gmail.com?part=3D1
