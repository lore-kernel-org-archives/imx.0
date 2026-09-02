Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794662D59E8
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335791; cv=none; b=fKls1iWUi+FHyxZtqSApJiwXV+TpFw4QlwNeONEY/rlMf1WM+RtB9auGeaZhmcvx/SSeY3pIsSR5y4DtC2kNbbal4XF8wjo6n0o4lEBS+Fy/j85hOIeYmAY3dCzOveeWYO0wcElEVQtdYQhLsxGnYb2ks2bjOj46Z6txg8Vu67E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335791; c=relaxed/simple;
	bh=QJ/Dsd944z4Ekjrme7Mrncs4p8H7IZ0/KNvM9W3/8iw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lEBzSwXftnLkLXFiKbV0WiMoEmrWMcw5l+mPN/TuvURPOiQTHoKE+0D1yOu0am5gZzKb5eec77ACbq44yQ4HO29CewldUuXwkqVgpKhYrvU7xHZDNVQZNCkllrRmlNOt4Ktl7Unz/+cnhrrgyT6a+zKxvdHeV8eRk0l+3Iy57xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fFC2B1B8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fFC2B1B8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B1C1F000E9;
	Wed,  2 Sep 2026 07:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788335790;
	bh=dTVNdDTkN+VS2EQMSrM7t0zDvtE5+8GWNnBUgNlVh6U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fFC2B1B8LLnDOO5uXbUt8GDYo9SVjN3ESiroItxiUSG2cTqTjlEHF1UujpseCUydO
	 dDazG39pnMBhrG4CM0GnqoBh+8ImSBvW45suI4ylsTkyHWda2ecJd6FaX2Gm8v7DT6
	 tEazUzZ9/eBc93Ay8X5xO2+fO6XEDyGG2NtxqMvZdDOshTobYs6SXnVcJbZncPAfSF
	 fgIbLT/cDayUlIzaPIJ1c0bDMxDwonYLcZ0K2U2dp2cmk1NtwpiWNqUWXF/z3lMjub
	 cja27kweNZsHn4KuqkNC17VbYVXsYHxO/UC8lBOlwgvnhIRlHziVjQVIcicBI8M/dB
	 FBodLTJcRRqiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE
 queries from the pad register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260902073946.3709080-2-mehmet.fide@gmail.com>
References: <20260902073946.3709080-1-mehmet.fide@gmail.com>
 <20260902073946.3709080-2-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 07:56:29 +0000
Message-Id: <20260902075629.D0B1C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Dangerous asymmetry between `pin_config_get` (generic) and `pin_co=
nfig_set` (raw) causes hardware register corruption.
- [Medium] Incomplete transition to generic pinconf API breaks SCU-based pl=
atforms.

Pre-existing issues:
- [Critical] Out-of-bounds write during Device Tree parsing in imx_pinctrl_=
parse_pin_mmio
--

commit 5ebc05bfe4b54b3133759fc4096ed3eedaf8a185
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad regist=
er

The mmio pinconf get callback ignores which parameter was requested and
returns the raw conf register, so a generic query through
pinctrl_gpio_get_config() gets register bits back instead of the packed
parameter it asked for. Decode the requested parameter and answer
PIN_CONFIG_OUTPUT_ENABLE and PIN_CONFIG_INPUT_ENABLE on SoCs that declare
where those bits live in the pad register.

> diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/fr=
eescale/pinctrl-imx.c
> index 9a45b376d36f9..506ee6627c827 100644
> --- a/drivers/pinctrl/freescale/pinctrl-imx.c
> +++ b/drivers/pinctrl/freescale/pinctrl-imx.c
[ ... ]
> @@ -312,6 +313,38 @@ static int imx_pinconf_get_mmio(struct pinctrl_dev *=
pctldev, unsigned pin_id,
>  	return 0;
>  }
> =20
> +static int imx_pinconf_get_mmio(struct pinctrl_dev *pctldev,
> +				unsigned int pin_id, unsigned long *config)
> +{
> +	struct imx_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
> +	const struct imx_pinctrl_soc_info *info =3D ipctl->info;
> +	const struct imx_pin_reg *pin_reg =3D &ipctl->pin_regs[pin_id];
> +	enum pin_config_param param =3D pinconf_to_config_param(*config);
> +	unsigned int mask;
> +	u32 raw;
> +
> +	/* only the parameters the SoC declares a pad bit for */
> +	switch (param) {
> +	case PIN_CONFIG_OUTPUT_ENABLE:
> +		mask =3D info->obe_mask;
> +		break;
> +	case PIN_CONFIG_INPUT_ENABLE:
> +		mask =3D info->ibe_mask;
> +		break;
> +	default:
> +		mask =3D 0;
> +		break;
> +	}
> +
> +	if (!mask || pin_reg->conf_reg =3D=3D -1)
> +		return -ENOTSUPP;
> +
> +	raw =3D readl(ipctl->base + pin_reg->conf_reg);
> +	*config =3D pinconf_to_config_packed(param, !!(raw & mask));
> +
> +	return 0;
> +}
> +
>  static int imx_pinconf_get(struct pinctrl_dev *pctldev,
>  			   unsigned pin_id, unsigned long *config)
>  {
> @@ -324,6 +357,18 @@ static int imx_pinconf_get(struct pinctrl_dev *pctld=
ev,
>  		return imx_pinconf_get_mmio(pctldev, pin_id, config);
>  }

[Severity: Medium]
Does this bypass the generic decoding logic for SCU platforms?

If a generic caller like pinctrl_gpio_get_config() queries an SCU-based
platform, it appears the SCU path (info->imx_pinconf_get) will overwrite
the generic parameter in *config with a raw hardware register value instead
of unpacking it.

> +static int imx_pinconf_get_raw(struct pinctrl_dev *pctldev,
> +			       unsigned int pin_id, unsigned long *config)
> +{
> +	struct imx_pinctrl *ipctl =3D pinctrl_dev_get_drvdata(pctldev);
> +	const struct imx_pinctrl_soc_info *info =3D ipctl->info;
> +
> +	if (info->flags & IMX_USE_SCU)
> +		return info->imx_pinconf_get(pctldev, pin_id, config);
> +	else
> +		return imx_pinconf_get_raw_mmio(pctldev, pin_id, config);
> +}
> +
>  static int imx_pinconf_set_mmio(struct pinctrl_dev *pctldev,
>  				unsigned pin_id, unsigned long *configs,
>  				unsigned num_configs)

[Severity: High]
Does this introduce an asymmetry between the get and set callbacks causing
hardware corruption?

While the get callback now unpacks generic parameters, imx_pinconf_set_mmio=
()
remains completely raw. If a generic caller like pinctrl_gpio_set_config()
passes a packed config (e.g., PIN_CONFIG_LEVEL), will it be blindly written
into the hardware pad configuration register here?

[Severity: Critical]
This is a pre-existing issue, but can the Device Tree parsing cause an
out-of-bounds write here?

Looking at imx_pinctrl_parse_pin_mmio() in drivers/pinctrl/freescale/pinctr=
l-imx.c:

    *pin_id =3D (mux_reg !=3D -1) ? mux_reg / 4 : conf_reg / 4;
    pin_reg =3D &ipctl->pin_regs[*pin_id];
    pin->pin =3D *pin_id;
    pin_reg->mux_reg =3D mux_reg;
    pin_reg->conf_reg =3D conf_reg;

If a maliciously crafted Device Tree overlay provides an excessively large
mux_reg or conf_reg value, the unvalidated pin_id is used to index into
ipctl->pin_regs, potentially overwriting arbitrary memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902073946.3709=
080-1-mehmet.fide@gmail.com?part=3D1
