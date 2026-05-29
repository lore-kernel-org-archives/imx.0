Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615C73E5594;
	Fri, 29 May 2026 14:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780064120; cv=none; b=Iu4RvvOkOtwGh3n4WmBer+Oq7wzFf50vU3UIolRVBgu36JvuFBNu/JTOuQ7kwf4WyDMPwMqwqr7xXfFal+c2P/cgrtkHQgGF4whcliuBbVt+0q65XCh7Qq53NCfp16KsA+cZAWCl4d+vmr9Vk/gdyLpmosB/337Jn95elut8vQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780064120; c=relaxed/simple;
	bh=YcLRsrQfBFy/GFnBmiJKzr1VH1MdI7Ckend86R64jWQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z/KPSSplnhuK3xkkqOJkXuUUFxXT37yvTiR1ZJPSDfW971imd5nItNxgCiHM6abyCDH34m8XRDpnisnKfzGbFY8a7B7gcDyXC5xyUuOp8BtrrpxNSf8lbLWWGVrQLkU30SgrfGSGNKoYUqL5aHzUtw36Wuc2OoNYQgCNStlmOds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1pspLB7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1pspLB7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAAC51F00893;
	Fri, 29 May 2026 14:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780064119;
	bh=ghlS8AIjjCknMlhe6Yd2SZ9QhJwb1MzCg5ESsvdUj48=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A1pspLB7XBfg25XHuJqAoZCQcnyYdr4HgSKhu81PkNoS2x9lT7yF2Ha99S1vqUub2
	 eFcS79J8brojgvIqkCWMpMKF96ssKP0F/X9nV+fJig4a/aoUSQnrIYr1Dq89GBNhEG
	 1N/FCW/mKG+sjOZXlPt/MgEqGYg9E6qeOdIo+qD/0NqqyfLmmGavx3shSEHQJmhmDs
	 so7YrvrshL8bJGoQcDG73S4Z18yC3WX0wWr2kbA1Tew1zMHbW+9jWFB/A5LlANwEr5
	 5U8iU7aE8v09Zpxd8nSiH/obs9BQAvP+R7xFJXC2xhsvjaR0k8Kz5Gf7zoUzkTakqe
	 w7Dv/Q/xxHKOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: ov5640: Use reset control framework
 to support shared reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robby Cai" <robby.cai@nxp.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260529132334.3333294-3-robby.cai@nxp.com>
References: <20260529132334.3333294-3-robby.cai@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 14:15:18 +0000
Message-Id: <20260529141518.BAAC51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver misuses the shared reset control by attempting to pulse=
 it, which triggers kernel warnings, leaks references, and disrupts other s=
hared devices.
- [High] Switching to the reset control framework breaks backward compatibi=
lity for existing DTs using the 'reset-gpios' property unless CONFIG_RESET_=
GPIO is enabled.
- [Medium] The driver ignores the return values of reset control API calls,=
 which can fail and cause silent hardware initialization errors.
--

commit 2545a9466cdd3cc29f140f86a12d3e3cb61a174f
Author: Robby Cai <robby.cai@nxp.com>

media: i2c: ov5640: Use reset control framework to support shared reset

This commit replaces the direct GPIO-based reset handling in the ov5640
driver with the reset control framework. It uses
devm_reset_control_get_optional_shared() to acquire the reset line, aiming
to support both dedicated and shared reset signals described via reset-gpios
in DT.

> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 92d2d6cd4ba48..427feedede75c 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c

[ ... ]

> @@ -2448,12 +2449,12 @@ static void ov5640_power(struct ov5640_dev *senso=
r, bool enable)
>   *
>   * In such cases, this gpio should be mapped to pwdn_gpio in the driver,=
 and we
>   * should still toggle the pwdn_gpio below with the appropriate delays, =
while
> - * the calls to reset_gpio will be ignored.
> + * the calls to reset will be ignored.
>   */
>  static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
>  {
>  	if (sensor->pwdn_gpio) {
> -		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> +		reset_control_assert(sensor->reset);

[Severity: High]
Does this code incorrectly pulse a shared reset line?

For shared reset controls, the initial deassert_count is 0. Calling
reset_control_assert() when deassert_count =3D=3D 0 triggers a WARN_ON in t=
he
reset core and fails with -EINVAL.

Additionally, if multiple devices share the line and another device is
currently active (so deassert_count > 0), calling reset_control_assert()
here will decrement the count.

If the count reaches 0, it physically resets the line while the other device
is actively using it, which could cause that device to crash.

[Severity: Medium]
Should the return value of reset_control_assert() be checked?

Unlike simple memory-mapped GPIOs, reset controllers may reside on slow
buses (like I2C/SPI) and their operations can fail.

If this fails, the driver will silently proceed, which might result in
unexplained I2C transfer errors later.

> =20
>  		/* camera power cycle */
>  		ov5640_power(sensor, false);
> @@ -2461,7 +2462,7 @@ static void ov5640_powerup_sequence(struct ov5640_d=
ev *sensor)
>  		ov5640_power(sensor, true);
>  		usleep_range(1000, 2000);	/* t3 */
> =20
> -		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> +		reset_control_deassert(sensor->reset);

[Severity: High]
Does this leak the reset control reference?

Because the reset control is never asserted during a power-down sequence,
the deassert_count incremented by this reset_control_deassert() call will
never be decremented, leaking the reference.

[Severity: Medium]
Should the return value of reset_control_deassert() be checked?

If a reset deassertion fails (e.g., due to an I2C bus timeout), the hardware
remains physically in reset. The driver will silently proceed to communicate
with the sensor, resulting in unexplained errors.

>  	} else {
>  		/* software reset */
>  		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,

[ ... ]

> @@ -3914,11 +3915,10 @@ static int ov5640_probe(struct i2c_client *client)
>  	if (IS_ERR(sensor->pwdn_gpio))
>  		return PTR_ERR(sensor->pwdn_gpio);
> =20
> -	/* request optional reset pin */
> -	sensor->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> -						     GPIOD_OUT_HIGH);
> -	if (IS_ERR(sensor->reset_gpio))
> -		return PTR_ERR(sensor->reset_gpio);
> +	sensor->reset =3D devm_reset_control_get_optional_shared(dev, NULL);
> +	if (IS_ERR(sensor->reset))
> +		return dev_err_probe(dev, PTR_ERR(sensor->reset),
> +				     "Failed to get reset\n");

[Severity: High]
Does switching to the reset control framework break backward compatibility
for existing device trees using the reset-gpios property?

When the resets property is absent, the reset framework has a fallback to
parse reset-gpios. However, this fallback explicitly checks
IS_ENABLED(CONFIG_RESET_GPIO). If this config is disabled, it silently
returns NULL for optional resets.

Because VIDEO_OV5640 does not select RESET_GPIO in Kconfig, any existing
platform using reset-gpios without CONFIG_RESET_GPIO enabled will silently
skip the reset sequence entirely, leading to initialization failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529132334.3333=
294-1-robby.cai@nxp.com?part=3D2
