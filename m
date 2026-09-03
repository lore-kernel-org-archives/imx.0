Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F94634E777
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 07:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421823; cv=none; b=vArNZ0XCyPLYU3xUKK0S3S/SGgVJjUVwzpIrsmeDEF0np46ykzyhqFVZUy8GKiScJaFd+d0ANSGiM0uAEtGSigRs6HMe1kGJBXTU/S5aljj1TCriXGhf7t4CeGosqEnf7gEsDCe+I5hDZM7Hzepg5xVWCvh3XjY2yMV30loRRI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421823; c=relaxed/simple;
	bh=QP9L560ivZu/0EU/cxcR/tyACH1xzQvygp6BsgEOKpM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RQQSdzZcY6I7nH83KyV92VcKKQDs1CkuuCtPMMzDcZOK1XXxZufFf9hKt0iy7GEVkRyIuriVEJPeJCFHq1GSEvJc+qr6TWClhnN3uMchl1Q/S45U5T787S7WOyA8gwqbMBKW1N+Ju/+iIIVm3tt+2LsZVyXgdpQp8tSg5c5AUb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lif81weC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lif81weC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF3F1F000E9;
	Thu,  3 Sep 2026 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788421821;
	bh=THMrjoSHXx/YdNfm8PS7Z3gTknh1GfxYVfs8fiMHBs4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lif81weCyPogdGcYxAPcPW0O88GTQ0vCD8sXxD1AjoLD0bzK2ghrHzY6NSfWs7AdK
	 IAuUfY0hTgkzY7ksZKaijEGGUEY80YOMa5vmifswspvpw0Xxau9BAl8BC2x5kUcYLb
	 gxvziilC1rlRNbLObmOt8gaKnxwqqEP4Vp1BZ2zdkQ6pklSm/yxbDvx5Kz3pdEo2gp
	 70StXFC0Pyiu+LTXtOl4mFw81kfKkIcMtbUK4+dBgifAoDW0SAaJJs9/ZEg6RcRsr/
	 fzv9okmAq1jLh9wcPH5lIW3QLiw2LyR75fda8rMm5pqAwGLDaLtyIDEYfTX+neSux1
	 7GaH1wbFyGAjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] gpio: mmio: track the direction of chips without
 direction registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260903073143.2068494-4-mehmet.fide@gmail.com>
References: <20260903073143.2068494-1-mehmet.fide@gmail.com>
 <20260903073143.2068494-4-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 07:50:21 +0000
Message-Id: <20260903075021.7AF3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect parsing of packed pin configuration value in `gpio_mmi=
o_seed_dir_from_pinctrl()` due to conflicting API contract.
--

commit 38b44b07fd26f5fd809a77e8d6044980715db7d8
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

    gpio: mmio: track the direction of chips without direction registers

This commit tracks the direction of generic GPIO chips with a pinctrl
backend and no direction registers. It keeps the direction in the existing
shadow and updates it under the chip lock, reading the state once during
line request from the pin controller.

> diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
> index 7e4b3e8d609f3..0709ffaab4dec 100644
> --- a/drivers/gpio/gpio-mmio.c
> +++ b/drivers/gpio/gpio-mmio.c
[ ... ]
> @@ -601,20 +622,51 @@ static int gpio_mmio_setup_direction(struct gpio_ge=
neric_chip *chip,
[ ... ]
> +static void gpio_mmio_seed_dir_from_pinctrl(struct gpio_chip *gc,
> +					    unsigned int gpio)
> +{
> +	struct gpio_generic_chip *chip =3D to_gpio_generic_chip(gc);
> +	unsigned long config;
> +
> +	if (!gc->get_config || chip->reg_dir_out || chip->reg_dir_in)
> +		return;
> +
> +	config =3D pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
> +	if (gc->get_config(gc, gpio, &config))
> +		return;
> +
> +	guard(raw_spinlock_irqsave)(&chip->lock);
> +	if (config)
> +		chip->sdir |=3D gpio_mmio_line2mask(gc, gpio);
> +	else
> +		chip->sdir &=3D ~gpio_mmio_line2mask(gc, gpio);
> +}

[Severity: Medium]
Are we correctly parsing the packed pin configuration value here?

The documentation for gc->get_config in include/linux/gpio/driver.h states =
it
uses the packed config format where the packed parameter and argument come =
out.

Because the packed format places the non-zero parameter ID
(PIN_CONFIG_OUTPUT_ENABLE) in the lower 8 bits, will evaluating config dire=
ctly
as a boolean always be true?

If a conforming custom GPIO driver implements gc->get_config according to t=
he
documented API, will its direction be unconditionally forced to output mode=
 by
this check?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903073143.2068=
494-1-mehmet.fide@gmail.com?part=3D3
