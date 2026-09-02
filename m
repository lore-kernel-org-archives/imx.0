Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60702D2385
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 06:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331247; cv=none; b=SSAbcC/MtMqJ0K51ttQAhX488CdlwqbjvxNuW/VDYVk6bO62j5s43oPtcYvTTLuWH2C1AYArXzxlPMy8w8UUfGegeIcFjESrZ5l8DaGSbLvT6fKZe4lvMEKspbdkZuHSZMbjLPZoArYFDLQRJQWz3+pJVwpoA7IpSLHjnQAQwck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331247; c=relaxed/simple;
	bh=L/3A2y4xPtt1wOZuYZZ3Lw4j4SJ9IVquJ3Cva4J7bFc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uDL8NJDHYpWlRwY2hawobgpofdtPlohSTLYh455bLbJ4XUk3aDYyxn/DnKVpTygv696AML4E25cpyhvr3s6QiU169Oti/DLp+8Z2BRHDACSidV0wvlDKD+Cj1gUPSFiNkwEpIH8R7G2cSf5bJQeMHJigkUcaSOm/Ef9kKcTWM5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erA5/RNA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erA5/RNA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F621F000E9;
	Wed,  2 Sep 2026 06:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788331245;
	bh=ICAkQVRfr4MzrC1F9i8OWhDeTtE9AZP4og28bSX2oGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=erA5/RNAHq5Lme1mOdsl2uVWRgnqz0CaO1mItULC3b92FH65Wr3bDrGKvhuTI3p+S
	 7/7H8UsfPEoMuGhVNN5BF5GPwWIgjZQewBRv9Hn+qdvU335re+qCCMJ/i64iCknzM+
	 joR6Fgz8HI6exwQmH8umL/mme+qKa5Chlati764NvbVXfiMKVLehjjKLdFUGrPub+e
	 bAQMtjZ+aJKIOOgqqlyt3QSDZd4MvthGXjLxOZf5k5ocq1eCMxVrL9XbMvchGjq87E
	 dBqlfQV4rUd4nKLw3/sgPhGXqGPtI30TxA6ww0Zv7WnpsrGKURlMyHFF/e4Uf/LtLh
	 t2ikHrQcOfGEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] gpio: mmio: get the direction from pinctrl when
 there are no direction registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260902062352.3600368-3-mehmet.fide@gmail.com>
References: <20260902062352.3600368-1-mehmet.fide@gmail.com>
 <20260902062352.3600368-3-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 06:40:44 +0000
Message-Id: <20260902064045.60F621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] `gpiochip_lock_as_irq()` breaks for valid GPIOs that lack a pinctr=
l mapping or are fixed inputs, returning `-EPROBE_DEFER` or `-ENOTSUPP`.
- [High] The newly added `get_direction` callback for generic MMIO GPIO chi=
ps acquires a mutex via the pinctrl subsystem, but these chips are marked a=
s non-sleeping (`can_sleep =3D false`). This leads to a scheduling-while-at=
omic bug when called from atomic contexts.
- [Medium] The patch fails to achieve its stated goal of preventing the ini=
tial line direction from being guessed, because `get_direction` is queried =
before pinctrl ranges are populated.
--

commit 58325f6a7a3ffea5ecb0fe02708d9e2517757ca9
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

gpio: mmio: get the direction from pinctrl when there are no direction regi=
sters
   =20
A generic chip with GPIO_GENERIC_PINCTRL_BACKEND and no direction
registers is given a get_direction callback to prevent gpiolib from guessing
the initial line state. The callback reads the direction from the pinctrl
backend.

> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index e9c531eef4521..25c8faa41749e 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
[ ... ]
> @@ -360,6 +361,28 @@ static int gpio_mmio_dir_return(struct gpio_chip *gc=
, unsigned int gpio,
>  		return pinctrl_gpio_direction_input(gc, gpio);
>  }
> =20
> +/*
> + * Without direction registers the direction lives in the pin controller
> + * (Vybrid: the OBE bit in the iomuxc pad), so ask pinctrl.
> + */
> +static int gpio_mmio_pinctrl_get_dir(struct gpio_chip *gc, unsigned int =
gpio)
> +{
> +	unsigned long config;
> +	int ret;
> +
> +#ifdef CONFIG_PINCTRL
> +	if (list_empty(&gc->gpiodev->pin_ranges))
> +		return -EOPNOTSUPP;

[Severity: Medium]
Will this early exit prevent the patch from determining the initial line st=
ate?

During chip initialization in gpiolib, the initial line state is queried by
gpiochip_add_data_with_key() calling gc->get_direction(). However, this
happens before gpiochip_add_pin_ranges() populates the pin ranges.

Since the pin ranges list is empty during this setup phase, this function w=
ill
always return -EOPNOTSUPP, which causes gpiolib to fall back to guessing the
state anyway.

> +#endif
> +
> +	config =3D pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
> +	ret =3D pinctrl_gpio_get_config(gc, gpio, &config);
> +	if (ret)
> +		return ret;

[Severity: High]
Does returning these pinctrl errors break interrupt setup for valid GPIOs?

When an IRQ is requested, gpiochip_lock_as_irq() checks the line direction.=
 If
the pin lacks a pinctrl mapping or is a fixed input, pinctrl_gpio_get_confi=
g()
returns an error such as -ENOTSUPP or -EPROBE_DEFER.

Because this error is now propagated back to gpiochip_lock_as_irq(), wouldn=
't
this cause the IRQ setup to fail for hardware configurations that were work=
ing
previously when get_direction was unset?

> +
> +	return config ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
> +}
[ ... ]
> @@ -596,6 +619,10 @@ static int gpio_mmio_setup_direction(struct gpio_gen=
eric_chip *chip,
>  			gc->direction_input =3D gpio_mmio_dir_in_err;
>  		else
>  			gc->direction_input =3D gpio_mmio_simple_dir_in;
> +
> +		if (IS_ENABLED(CONFIG_PINCTRL) &&
> +		    cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND)
> +			gc->get_direction =3D gpio_mmio_pinctrl_get_dir;

[Severity: High]
Can assigning this callback cause a scheduling-while-atomic bug?

Generic MMIO GPIO chips are initialized with gc->can_sleep set to false.

When an interrupt is activated, gpiochip_lock_as_irq() executes with the
IRQ descriptor's raw spinlock held. Since it sees the chip is non-sleeping,
it invokes this new get_direction callback directly in atomic context:

gpiochip_lock_as_irq()
  if (!gc->can_sleep && gc->get_direction)
    gpiod_get_direction()

However, the new callback delegates to pinctrl_gpio_get_config(), which
unconditionally acquires a sleepable mutex. Doesn't this result in taking a
mutex while local interrupts are disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902062352.3600=
368-1-mehmet.fide@gmail.com?part=3D2
