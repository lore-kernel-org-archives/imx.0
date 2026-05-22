Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED22349CCB
	for <imx@lists.linux.dev>; Fri, 22 May 2026 19:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779478727; cv=none; b=GpIejP9Qudpqint3LNkXxwuwZXO368L1K1ebHOR+WNQ4xNVQybSNHjGp3Rtv8BZmZj/OGzzKbgHaEMTS/z8rKvZfYId86urrxkdshTfeIC49O4ihpUzq7XBDi0Mtltd52a8c6PK0jTbDKVw749CKJIE20GvstYy7+TNpXo5NBwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779478727; c=relaxed/simple;
	bh=+3x0GIpMgBJoV0ZksV/DA0IVYVwcGJ961xsAYEyP6go=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hlx+RYC680quOGIgFvE/zZapDyxxHFL+NCrH0Z175vLFw3jsvs/FgIsYNxR7VKvzYerPalv+/JsRpupw7hJbevQ0ycfrL3U0Oi6eNSAHHtuWgS+J22dvYu/zTe5i3DSgFirPdiMCN+FZE8LnStaie4m1RsC7Th1ZhwyRsVdv3j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lElB4XvA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lElB4XvA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384761F000E9;
	Fri, 22 May 2026 19:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779478726;
	bh=2+mJLEF6FCzPOaRXd9vaEU8oJ770cweynjDCGVRfTJM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lElB4XvAknbwrT4iSp/dHqgPx9ZcKOpnnE0+opKX411u21MxTGRQiWvl80F9Ebe4R
	 9drkMcVERoH3Z8yEhlWfZBQ/UIs2MwukWFLD9xhNL8jtK10CxuItyr/vdx8F3J+syY
	 d9Y5h8dnJLEpxLMVVM2Ea9+B55oIjQreNAAUtt7v4osuPWeAtl5jKHjdWCJcs0WBbA
	 SA3sQJgORVz4iBkBLt0jKxNV2SxeifUJ5ivm5SL3Anw8H7gFkDv0Wrivtrsd/isDDM
	 wzsN35ePmfw8Jot5OnowGHb415Tl9TPfRakodPrASMpkdM+y7YfnPfm0L9olBRsZxF
	 vO3eoe4ecoGfA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] pwm: imx27: Fix variable truncation in .apply()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronaldo Nunez" <rnunez@baylibre.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260522191348.6227-1-rnunez@baylibre.com>
References: <20260522191348.6227-1-rnunez@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 19:38:45 +0000
Message-Id: <20260522193846.384761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Division by zero kernel panic if `clk_get_rate()` returns 0.
- [High] Missing bounds check on `state->period` causes integer overflows a=
nd silent hardware misconfiguration.
- [High] The 1.5us safety margin in the ERR051198 workaround mixes unpresca=
led and prescaled clock units.
--

commit e248ca7d296d611230c3b9bc5da0d73a70d0c358
Author: Ronaldo Nunez <rnunez@baylibre.com>

pwm: imx27: Fix variable truncation in .apply()

Fix a variable truncation when calculating period in microseconds as
part of the solution for the ERR051198 in .apply() callback.

> diff --git a/drivers/pwm/pwm-imx27.c b/drivers/pwm/pwm-imx27.c
> index 3d34cdc4a3a51..c8b801fcb5251 100644
> --- a/drivers/pwm/pwm-imx27.c
> +++ b/drivers/pwm/pwm-imx27.c
[ ... ]
> @@ -208,6 +208,7 @@ static int pwm_imx27_apply(struct pwm_chip *chip, str=
uct pwm_device *pwm,
>  	int val;
>  	int ret;
>  	u32 cr;
> +	u64 tmp;
> =20
>  	clkrate =3D clk_get_rate(imx->clks[PWM_IMX27_PER].clk);
>  	c =3D clkrate * state->period;

[Severity: High]
This is a pre-existing issue, but does this calculation handle excessively
large periods correctly?

Userspace can request an arbitrarily large state->period. This can cause a
cascading failure:

1. c =3D clkrate * state->period can overflow a 64-bit integer.
2. The 64-bit result is assigned to unsigned long period_cycles, which
truncates it on 32-bit ARM architectures.
3. The calculation prescale =3D period_cycles / 0x10000 + 1 can produce a v=
alue
exceeding the hardware's 12-bit limit (4096).
4. MX3_PWMCR_PRESCALER_SET(prescale) uses FIELD_PREP, which masks out higher
bits, writing incorrect configurations to the hardware instead of rejecting
unachievable periods with -EINVAL.

Could this lead to silent hardware misconfiguration?

[ ... ]
> @@ -249,6 +250,11 @@ static int pwm_imx27_apply(struct pwm_chip *chip, st=
ruct pwm_device *pwm,
>  	val =3D readl(imx->mmio_base + MX3_PWMPR);
>  	val =3D val >=3D MX3_PWMPR_MAX ? MX3_PWMPR_MAX : val;
>  	cr =3D readl(imx->mmio_base + MX3_PWMCR);
> +
> +	/*
> +	 * tmp stores period in nanoseconds. Result fits in u64 since
> +	 * val <=3D 0xfffe and prescaler in [1, 0x1000].
> +	 */
>  	tmp =3D NSEC_PER_SEC * (u64)(val + 2) * MX3_PWMCR_PRESCALER_GET(cr);
>  	tmp =3D DIV_ROUND_UP_ULL(tmp, clkrate);

[Severity: High]
This is a pre-existing issue, but could this lead to a division by zero pan=
ic?

If the clock is disabled, unparented, or misconfigured, clk_get_rate() will
return 0.

Since clkrate is directly used as a divisor here, the kernel would panic.
Should the driver validate that clkrate > 0 before proceeding?

>  	period_us =3D DIV_ROUND_UP_ULL(tmp, 1000);

[Severity: High]
This is a pre-existing issue, but is the 1.5us safety margin mixing
unprescaled and prescaled clock units?

Later in pwm_imx27_apply(), the safety margin is calculated as:

	c =3D clkrate * 1500;
	do_div(c, NSEC_PER_SEC);

This yields unprescaled clock cycles. However, val is read from MX3_PWMCNR,
which increments in prescaled units:

			if ((val + c >=3D duty_cycles && val < imx->duty_cycle) ||
			    val + c >=3D period_cycles)

Adding c to val directly adds unprescaled ticks to prescaled ticks. When the
active prescaler is large (e.g., 4096), does this overestimate the safety
margin by a factor of 4096 (e.g., ~6.1ms instead of 1.5us)?

Could this artificially force the workaround to trigger and unnecessarily
delay valid duty cycle updates by a full PWM period?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522191348.6227=
-1-rnunez@baylibre.com?part=3D1
