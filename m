Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C5D2FD1B3;
	Thu,  9 Jul 2026 17:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617565; cv=none; b=B+f4aomDbkrMsOwCZArnHgoquJOoPnoYN0W8cLVxeLpOTNY1MlfvvPRn+7YmhgFIAIx5LOrgp3CmmvkdH90dgTHDkwzvSCVwsiUYeAemabyp7O09AEfkzNdVs4kWOnjVA9gu4HkEqs5fIhKIvnPnaVolzrSLpZpSAUMqvsgONlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617565; c=relaxed/simple;
	bh=0nHkn/5OroKaJJXmYKfkhRK2Blfe7GwZ6bV2Lasn1ZY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mV0YsJwskjq6ivAkw7lTCiiONSlNa4GICVdx3f37ZIi6kI2tlkDZMxlAw+UgZXiUhHRb5fzFZVo+90e+VUmf3QlPr2Oz20cSkRhWESJSlQsLrQXd4TGxnjbpiZDMYg8SksqXEUrbqD0r7n71WcH8+WcoVWOXxhhJCoGr/BOuyjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpJA2Kdm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpJA2Kdm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325291F00A3A;
	Thu,  9 Jul 2026 17:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617563;
	bh=I/APwcgRGdwy4hkrXbtaBGQerUWhJgbrlnQXqsjEeX0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XpJA2KdmM6cHjeabRitYF0Sol+y+db66eipHSpa7xqLzMz0c7BWcyi5BNcgN2wCP4
	 ph3nCp4A4CBCaEh3dlqNZ4WuGgZIfqsdHmtE9BkZQWSvYEpxyJB0HaaYajiTRG7nKz
	 fFxsssG5vO/s9TzzRKiUffq6KbZiFBOJP5vDLz7kphqZO0ikl0q6W9gVipOLydb0Yx
	 l5ZDBDs+pyWshmOZy8SR2O4N/4aBMmQ4imEbnChPcr1bCIu1kl7ah26u1p5LEGidjl
	 anZfi8n+m1SE37cXbvrKW+FzB8JfGuPT4GBUiPp5gPvC5ZJZYlxOu2AEj1HNE8HGEp
	 yAsaqRs5O9kyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 21/23] mfd: Unify style of of_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: linux-sunxi@lists.linux.dev, lee@kernel.org, mfd@lists.linux.dev, imx@lists.linux.dev, Frank.Li@kernel.org, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com, linux-amlogic@lists.infradead.org
In-Reply-To: <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:19:22 +0000
Message-Id: <20260709171923.325291F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Complex platform data and child device structures passed via match=
 data
- [High] Dynamic modification of global mfd_cell arrays introduces data rac=
es
- [High] Data race on global da9063_regmap_config struct during probe
- [High] IRQ handler leak and subsequent Use-After-Free in twl6030_exit_irq
--

--- Patch [21]: [PATCH v3 21/23] mfd: Unify style of of_device_id arrays ---
commit 99f4911da67f8c43f41d211ea0ad4e7a3a4972cd
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Unify style of of_device_id arrays

This commit unifies the coding style of of_device_id arrays across multiple
MFD drivers. It removes trailing commas after list terminators, adds spaces
before closing braces, and ensures consistent formatting.

> diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
> --- a/drivers/mfd/da9063-i2c.c
> +++ b/drivers/mfd/da9063-i2c.c
[ ... ]
> @@ -361,11 +361,12 @@ static struct regmap_config da9063_regmap_config =
=3D {
>  };
> =20
>  static const struct of_device_id da9063_dt_ids[] =3D {
> -	{ .compatible =3D "dlg,da9063", },
> -	{ .compatible =3D "dlg,da9063l", },
> +	{ .compatible =3D "dlg,da9063" },
> +	{ .compatible =3D "dlg,da9063l" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, da9063_dt_ids);
> +
>  static int da9063_i2c_probe(struct i2c_client *i2c)
>  {
>  	const struct i2c_device_id *id =3D i2c_client_get_device_id(i2c);

[Severity: High]
This is a pre-existing issue, but does da9063_i2c_probe() mutate the shared
global da9063_regmap_config struct during probe?

Depending on the device variant, the probe function dynamically assigns
different tables:

    da9063_regmap_config.rd_table =3D &da9063_ad_readable_table;

Could this lead to a data race causing incorrect configuration if multiple
instances of the device (or different variants) are probed at the same time?

> diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
> --- a/drivers/mfd/rohm-bd9576.c
> +++ b/drivers/mfd/rohm-bd9576.c
[ ... ]
> @@ -167,9 +167,9 @@ static int bd957x_i2c_probe(struct i2c_client *i2c)
>  }
> =20
>  static const struct of_device_id bd957x_of_match[] =3D {
> -	{ .compatible =3D "rohm,bd9576", .data =3D (void *)ROHM_CHIP_TYPE_BD957=
6, },
> -	{ .compatible =3D "rohm,bd9573", .data =3D (void *)ROHM_CHIP_TYPE_BD957=
3, },
> -	{ },
> +	{ .compatible =3D "rohm,bd9576", .data =3D (void *)ROHM_CHIP_TYPE_BD957=
6 },
> +	{ .compatible =3D "rohm,bd9573", .data =3D (void *)ROHM_CHIP_TYPE_BD957=
3 },
> +	{ }
>  };

[Severity: High]
This isn't a bug introduced by this patch, but does the probe function for
this device dynamically modify a shared global mfd_cell array?

bd957x_i2c_probe() contains:

    regulators =3D &bd9576_mfd_cells[BD957X_REGULATOR_CELL];
    regulators->resources =3D bd9576_regulator_irqs;

If multiple instances of this device are probed concurrently, could they ra=
ce
to modify the same global array? A similar issue also seems to exist in
88pm860x-core.c and as3711.c.

> diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
> --- a/drivers/mfd/simple-mfd-i2c.c
> +++ b/drivers/mfd/simple-mfd-i2c.c
[ ... ]
> @@ -126,7 +126,7 @@ static const struct of_device_id simple_mfd_i2c_of_ma=
tch[] =3D {
>  	{ .compatible =3D "maxim,max77705-battery", .data =3D &maxim_mon_max777=
05 },
>  	{ .compatible =3D "silergy,sy7636a", .data =3D &silergy_sy7636a },
>  	{ .compatible =3D "spacemit,p1", .data =3D &spacemit_p1 },
> -	{}
> +	{ }
>  };

[Severity: High]
This is a pre-existing issue, but does passing complex struct pointers
through the match data violate the MFD subsystem guidelines? The
documentation recommends using an integer or enum ID instead to avoid memory
safety hazards and initialization ordering races.

This pattern appears here as well as in mc13xxx-spi.c, rk8xx-i2c.c,
sec-acpm.c, sec-i2c.c, and sun6i-prcm.c.

> diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
> --- a/drivers/mfd/twl6030-irq.c
> +++ b/drivers/mfd/twl6030-irq.c
[ ... ]
> @@ -285,7 +285,7 @@ static const struct irq_domain_ops twl6030_irq_domain=
_ops =3D {
>  static const struct of_device_id twl6030_of_match[] __maybe_unused =3D {
>  	{ .compatible =3D "ti,twl6030", .data =3D &twl6030_interrupt_mapping },
>  	{ .compatible =3D "ti,twl6032", .data =3D &twl6032_interrupt_mapping },
> -	{ },
> +	{ }
>  };
> =20
>  int twl6030_init_irq(struct device *dev, int irq_num)

[Severity: High]
This is a pre-existing issue, but is there an IRQ handler leak and potential
use-after-free during device removal here?

In twl6030_init_irq(), the interrupt is requested with twl6030_irq as the
dev_id:

    status =3D request_threaded_irq(irq_num, NULL, twl6030_irq_thread,
                                  IRQF_ONESHOT, "TWL6030-PIH", twl6030_irq);

However, in twl6030_exit_irq(), it appears NULL is passed to free_irq()
instead of twl6030_irq:

    free_irq(twl6030_irq->twl_irq, NULL);

Will free_irq() silently fail to remove the handler due to the mismatched
dev_id, leaving the handler registered after the twl6030_irq struct is free=
d?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D21
