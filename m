Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1133FC5AA;
	Wed, 10 Jun 2026 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098663; cv=none; b=BrLuPlWU1OR6Lhu3VlPXT1HhmVgBSFWyTTY9xVl2XDkhwwuFrLgcBMPlM6mSJqb4TEWAULRA5fS4dTg1MHSJDpsPHir6pxL6gBq6iW2lLAxCHOcJgSYBGvkvy6YXzcsb8V2U7ssIb3DKliUUoOR7RW0I3SMNTzYGzMsLOzIewUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098663; c=relaxed/simple;
	bh=q94zWef7Qkd0mxpUoDA9kd/VIbrRAwMIlZai1Pev1TQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=joTKSP6mRakDC0jA0XI2bu2n5zo/Nl3WrfzhFvAkuW3HTLiwAxMV93TxiUPigrvfdyffHDJHwt/RICPchH0RyB3e4ALUg5D0x0mxrTriZWjU6CoyUlQGJfMoRUiWh1z3hRUEiV/ENGJi/Kix77PeVrxWj1c74GLKuVAhgclCiOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/dReVcj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/dReVcj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4061F00898;
	Wed, 10 Jun 2026 13:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781098657;
	bh=dw8b1ZpeuXZJ/RlLCZ2T7gwP48XB/UBzyTCpYaVznzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z/dReVcjuvT3vPi5WqG8b3Fw8TptS+c0AjWrJggqFHN19/gyDYXlBhsqvUO81yt/G
	 ww+/E3nrHfryuUAYXrg74a/xhlJAeiIGBwYqb1GNWdsnGh3Vm29DQPWn9sljqNZWaG
	 IJAs34spwqmG4x7r27TCiGhH0JfsAKdiH2f5pfMEIGCF1ZLCo+Ophc263cjFO1WcoK
	 /leL4g2u1D8oc/btl24Sj0GT4dnbXXLoJFV0tzFfTi3fwOOGJwZFYkIJrHujZJK71D
	 lkHfnx568rMQo2ThZN8TaECdiWEu9TVkj5tjHUzCpqb+33u0lPS7JwzAkJDVaknxD2
	 cEuZ2X4QPjgZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 5/6] pinctrl: s32cc: implement GPIO functionality
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260610132116.1998140-6-khristineandreea.barbulescu@oss.nxp.com>
References: <20260610132116.1998140-6-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 13:37:36 +0000
Message-Id: <20260610133737.1C4061F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] GPIO output states (PGPDO) are lost during system suspend and resu=
me, causing hardware glitches or data loss upon resume.
- [Low] Semantic mismatch and confusing naming in `s32_gpio_pad_map_xlate()=
` where a pin ID is compared against properties documented as GPIO line off=
sets.
--

commit ff45721a707b92abe04df6541806874a10e772ee
Author: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

pinctrl: s32cc: implement GPIO functionality

This commit introduces GPIO functionality to the S32CC pin controller
using the gpio-regmap library. It adds virtual regmaps to translate GPIO
operations to the underlying SIUL2 registers (MSCR, PGPDI, PGPDO) and
supports both legacy and extended DT bindings.

Link: https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristine=
andreea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
Link: https://lore.kernel.org/all/20260504131148.3622697-7-khristineandreea=
.barbulescu@oss.nxp.com/

> diff --git a/drivers/pinctrl/nxp/pinctrl-s32.h b/drivers/pinctrl/nxp/pinc=
trl-s32.h
> --- a/drivers/pinctrl/nxp/pinctrl-s32.h
> +++ b/drivers/pinctrl/nxp/pinctrl-s32.h

[ ... ]

> +/**
> + * struct s32_gpio_pad_map - mapping between GPIO ranges and PGPD pads
> + * @gpio_start: first GPIO line offset in the range
> + * @gpio_end: last GPIO line offset in the range
> + * @pad: PGPD pad number serving the range
> + */
> +struct s32_gpio_pad_map {
> +	unsigned int gpio_start;
> +	unsigned int gpio_end;
> +	unsigned int pad;
> +};

[ ... ]

> diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pi=
nctrl-s32cc.c
> --- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c

[ ... ]

> +static int s32_gpio_pad_map_xlate(struct s32_pinctrl *ipctl,
> +				  unsigned int gpio,
> +				  unsigned int *reg_offset,
> +				  u16 *mask)
> +{

[ ... ]

> +	for (i =3D 0; i < soc_data->num_gpio_pad_maps; i++) {
> +		map =3D &soc_data->gpio_pad_maps[i];
> +
> +		if (gpio < map->gpio_start || gpio > map->gpio_end)
> +			continue;

[Severity: Low]
Are gpio_start and gpio_end actually meant to be pin IDs instead of GPIO
line offsets?

The documentation in struct s32_gpio_pad_map says they are GPIO line
offsets, but here they are compared against the incoming gpio parameter
which actually receives a pin ID from s32_gpio_xlate_pgpd().

While this does not break functionality currently because gpio_base equals
pin_base for all sparse ranges, is it worth updating the naming and
documentation to reflect that these variables map to pin IDs?

> +
> +		bit =3D gpio - map->gpio_start;
> +		*mask =3D BIT(S32_PGPD_SIZE - 1 - bit);
> +		*reg_offset =3D S32_PGPD(map->pad);

[ ... ]

> @@ -709,8 +1238,7 @@ int s32_pinctrl_suspend(struct device *dev)
>  	const struct pinctrl_pin_desc *pin;
>  	const struct s32_pinctrl_soc_info *info =3D ipctl->info;
>  	struct s32_pinctrl_context *saved_context =3D &ipctl->saved_context;
> -	int i;
> -	int ret;
> +	int i, ret;
>  	unsigned int config;
> =20
>  	for (i =3D 0; i < info->soc_data->npins; i++) {
> @@ -721,7 +1249,7 @@ int s32_pinctrl_suspend(struct device *dev)
> =20
>  		ret =3D s32_regmap_read(ipctl->pctl, pin->number, &config);
>  		if (ret)
> -			return -EINVAL;
> +			return ret;
> =20
>  		saved_context->pads[i] =3D config;
>  	}

[Severity: High]
Should PGPDO output register states be saved and restored during system
suspend and resume?

Currently, s32_pinctrl_suspend() saves the MSCR configurations but omits
saving the newly introduced PGPDO registers.

> @@ -736,7 +1264,7 @@ int s32_pinctrl_resume(struct device *dev)
>  	const struct s32_pinctrl_soc_info *info =3D ipctl->info;
>  	const struct pinctrl_pin_desc *pin;
>  	struct s32_pinctrl_context *saved_context =3D &ipctl->saved_context;
> -	int ret, i;
> +	int i, ret;
> =20
>  	for (i =3D 0; i < info->soc_data->npins; i++) {
>  		pin =3D &info->soc_data->pins[i];
> @@ -745,7 +1273,7 @@ int s32_pinctrl_resume(struct device *dev)
>  			continue;
> =20
>  		ret =3D s32_regmap_write(ipctl->pctl, pin->number,
> -					 saved_context->pads[i]);
> +				 saved_context->pads[i]);

During s32_pinctrl_resume(), when the MSCR registers are restored, the
Output Buffer Enable (OBE) bits are re-enabled.

Because PGPDO registers lose power and reset to 0 during suspend, and
they are not explicitly restored here, could active GPIO outputs immediately
drive their hardware reset values instead of their pre-suspend states
upon resume, potentially causing hardware glitches?

>  		if (ret)
>  			return ret;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610132116.1998=
140-1-khristineandreea.barbulescu@oss.nxp.com?part=3D5
