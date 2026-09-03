Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B83334EEF7
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 07:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421511; cv=none; b=gJped4tqSF12sgKQahuo/RBwXsTY337kIb/2/QeKN0T53BjdpQkCCdpKxLN8hpP6+uIoARUGstF0i2sjb9wY0M6M9VyKiYy2d7e9juiHOEFe5Vj+bSWKXu0XrS1UT9jzgBmLco+pGyWfagPeqtIAvxz6NgZGqA4Ds9ci5H6qL2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421511; c=relaxed/simple;
	bh=lDV1uyktUbn9hYMZccCC4edlyLPG72uGF8tJF8wTOkE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hPnWSDXWgpyMPm+N8MNS1LYgKYTQCRdqdrer/cpDsn0HdLnqC3UDdihCbQkMpyiWGe/oEViOUmpFxxcfBIepmjvUh0rsVvgSuUcOJXOxoOWY9D1qnplY5dpUGes90SAJ+O54CopkXGV0nOBtZ7Y6vThC1xefnKWRz3KkW8QduFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eTE2+TCE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eTE2+TCE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36471F000E9;
	Thu,  3 Sep 2026 07:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788421510;
	bh=+VLag8x7GyfPr3iuEPJiKL7aCyMlYsE2d5zc0S0Ok2I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eTE2+TCE59w0K6UHQQ8RAUp4vaoZjFivlVELFt4SxXMTcbYpWVnP8Ll46NQA3uGvU
	 VZpFv1siPyn0pY/ykJUxgyMs/QYPacL2nBvPeL4+bTutxykAkXMOeVD9EzpdfU+pZB
	 F/W2Bg2mHJA5S+L4pGA1sFFURjMTjgF7s6HIyhq5WDmLTuL7oV/iFzzRfSxbfi8xV8
	 pFGYmoT6kE9xAEvHRYpVHF+EwDLDQUNlDS2TbHfkEHelyuqtcpnkKFvMlDAfJJwodg
	 iRtqiuKgiyBoDypHxYk/YwAQlWgN4yu5xvDb9qkKtFOsxP3nYG3qlZPfE+vhmBJKiS
	 TxThw8ljtZ8Tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] gpiolib: add get_config() and
 gpiochip_generic_get_config()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260903073143.2068494-3-mehmet.fide@gmail.com>
References: <20260903073143.2068494-1-mehmet.fide@gmail.com>
 <20260903073143.2068494-3-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 07:45:08 +0000
Message-Id: <20260903074509.F36471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] gpiochip_generic_get_config() returns an unpacked argument inste=
ad of the documented packed configuration format.
--

commit 76e13bb42cd8827a4ba44cd0214563286c510f1f
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

gpiolib: add get_config() and gpiochip_generic_get_config()

A chip with a pin control backend sets a line's configuration through
set_config() and gpiochip_generic_config(), but has no way to read one
back. gpio-mmio needs that to learn the direction of a line whose
direction lives in the pin controller.

>     Add the optional get_config() callback, taking the packed parameter to
>     query and returning the packed answer the way pinctrl_gpio_get_config=
()
>     does, and gpiochip_generic_get_config() as the pin control backed

[Severity: Medium]
Does pinctrl_gpio_get_config() actually return a packed answer?

Looking at drivers/pinctrl/core.c, pinctrl_gpio_get_config() intentionally
strips the parameter and returns only the unpacked argument:

int pinctrl_gpio_get_config(...) {
    ...
    *config =3D pinconf_to_config_argument(*config);
    return 0;
}

[ ... ]

> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 17511434ed077..5c81cce691738 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -359,6 +359,10 @@ struct gpio_irq_chip {
>   * @set_config: optional hook for all kinds of settings. Uses the same
>   *	packed config format as generic pinconf. Must return 0 on success and
>   *	a negative error number on failure.
> + * @get_config: optional hook to read back a setting. Uses the same pack=
ed
> + *	config format as generic pinconf: the parameter to query goes in, the
> + *	packed parameter and argument come out. Must return 0 on success and a
> + *	negative error number on failure.

[Severity: Medium]
Because pinctrl_gpio_get_config() unpacks the argument, does this documented
API contract contradict the actual implementation?

If a driver follows this documentation and parses the returned value using
pinconf_to_config_argument(), it will shift the already-unpacked value right
by 8 bits, yielding 0.

[ ... ]

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index ef8ccaf17c9ce..44328aed16465 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2440,6 +2440,29 @@ int gpiochip_generic_config(struct gpio_chip *gc, =
unsigned int offset,
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_generic_config);
> =20
> +/**
> + * gpiochip_generic_get_config() - read back the configuration of a pin
> + * @gc: the gpiochip owning the GPIO
> + * @offset: the offset of the GPIO to query
> + * @config: the packed parameter to query, replaced by the packed answer
> + *
> + * Returns:
> + * 0 on success, or negative errno on failure.
> + */
> +int gpiochip_generic_get_config(struct gpio_chip *gc, unsigned int offse=
t,
> +				unsigned long *config)
> +{
> +#ifdef CONFIG_PINCTRL
> +	if (list_empty(&gc->gpiodev->pin_ranges))
> +		return -ENOTSUPP;
> +
> +	return pinctrl_gpio_get_config(gc, offset, config);

[Severity: Medium]
Will returning this unpacked value directly cause logic errors for drivers
expecting a packed configuration?

Returning the unpacked output of pinctrl_gpio_get_config() here finalizes
the API contract violation.

Any callers, such as the gpio-mmio driver in patch 3/3, that rely on the
actual returned unpacked value will bypass the documented API contract. If
the value was truly packed as documented, config would always evaluate to
true since the parameter is non-zero.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903073143.2068=
494-1-mehmet.fide@gmail.com?part=3D2
