Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500B937189A;
	Fri, 19 Jun 2026 10:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781864192; cv=none; b=ZraxPkpkie2RvmAb5oPcjVH6raNyxpb2BmkO3JX7zFHpLWnFwjXtqIj8YObeYPXpJZgs5plQu2tw3PpM5CZSPo5Fl/8Yn2oDnBoXPS77HEGNHzAJxQjAQtYrgIsob3ck1eKWHevuAAMuuvS5lNpQB44fwFcSRED4l+lDBmA0zeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781864192; c=relaxed/simple;
	bh=X+cBU7Sh2zfHj0A4Kx+gUFN8SXH8Q+m7AttIi8T6IVo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OEwFrLJnp7Zx4efFnA7DpMPo4M0U75p42N/4FDPmYfwHkwv1C7acL+hXoxeNn0iFcMjnukfxIoInaHnXmajTUwMc9Cm68uu4NA7ZWOkbnygtNLhZIk92T6tA0EggumcaYr9Uf+OVc1NMSM5PyAXaY5KOFRiqYkrC/RSZZKio/14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmaU3EDF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmaU3EDF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A6C1F000E9;
	Fri, 19 Jun 2026 10:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781864190;
	bh=AXhMXnBpV1PcHrrbnnVg6HiUPRNNnXPEIicioDDy2BE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JmaU3EDFB83HNW5jzyEEP2TTX/k4jckDvm/+44oEts1tfRWJZXZrx5g4a2uDkVEYG
	 LTooxfY+HoY/XKq3gxEQgh9R+JakCEQ8BHHfQ3AjZpkKJaXv/Lczw4kFmMM8jdfRL6
	 VjVivHE2vCRKKqI1BhoIG5CucmS+xNkl6YGwmOfSifhL4+rlu0imStnWkQ6wV7gz4i
	 JEWr1E39R/4Wnsmp9cUE5KauJ0ptDOnBqvkJT8u7EmO7CUiooNN0WMjbe+CBLxbVi+
	 87pf2TqvRL3AQu0V5Rw49slqo4R1MJ7i7cQoNCxUqZSdCvE0qzz6DaOqW3rrnv03p7
	 TiQy604Qu7pSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] media: i2c: ov5640: Add reset controller support
 with GPIO fallback
Reply-To: sashiko-reviews@lists.linux.dev
To: robby.cai@oss.nxp.com
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260619100532.3779934-3-robby.cai@oss.nxp.com>
References: <20260619100532.3779934-1-robby.cai@oss.nxp.com>
 <20260619100532.3779934-3-robby.cai@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 10:16:29 +0000
Message-Id: <20260619101629.E5A6C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Misuse of the shared reset controller API violates hardware power-=
up sequencing, risking sensor damage via latch-up, and causes a power manag=
ement resource leak.
- [Medium] Unbalanced shared reset control deassert_count triggers a kernel=
 WARN_ON on the `ov5640_reset_deassert()` error path.
--

commit 08ff61c49c74c476ab99932a1e24e30024577ace
Author: Robby Cai <robby.cai@nxp.com>

media: i2c: ov5640: Add reset controller support with GPIO fallback

Add support for the reset controller framework by acquiring the reset
line using devm_reset_control_get_optional_shared_deasserted(). This
allows the driver to handle reset lines provided by a reset controller,
including shared ones, while avoiding unbalanced deassert counts.

> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 85ecc23b35877..5e6db8aacb118 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c

[ ... ]

> @@ -2431,6 +2433,48 @@ static int ov5640_restore_mode(struct ov5640_dev *=
sensor)
>  	return ov5640_set_framefmt(sensor, &sensor->fmt);
>  }
> =20
> +static int ov5640_get_reset(struct device *dev, struct ov5640_dev *senso=
r)
> +{
> +	/* use deasserted version to avoid unbalanced deassert counts */
> +	sensor->reset =3D
> +	    devm_reset_control_get_optional_shared_deasserted(dev, NULL);

[Severity: High]
Does acquiring the reset control in the deasserted state risk hardware
damage and cause a power management leak?

Because this API call deasserts the reset line during probe, it pulls the
reset IO line HIGH before VDD regulators are enabled in
ov5640_set_power_on(). Applying voltage to the reset pin while VDD is off
can cause a destructive latch-up condition.

Additionally, because devm_reset_control_get_optional_shared_deasserted()
acquires a base deassert vote, and the driver never explicitly asserts the
reset line during ov5640_set_power_off() on runtime PM suspend, does this
permanently prevent the reset controller and parent power domains from
suspending?

Also, the inline comment below claims GPIOD_OUT_HIGH ensures a deasserted
state for an ACTIVE_LOW reset, but GPIOD_OUT_HIGH sets the logical value
to 1, which drives an ACTIVE_LOW line physically LOW (asserted).

> +	if (IS_ERR(sensor->reset))
> +		return dev_err_probe(dev, PTR_ERR(sensor->reset),
> +				     "Failed to get reset\n");
> +	else if (sensor->reset)
> +		return 0;
> +
> +	/*
> +	 * fallback to legacy reset-gpios
> +	 * GPIOD_OUT_HIGH ensures deasserted state for ACTIVE_LOW reset
> +	 */
> +	sensor->reset_gpio =3D devm_gpiod_get_optional(dev, "reset",
> +						     GPIOD_OUT_HIGH);

[ ... ]

> -static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
> +static int ov5640_powerup_sequence(struct ov5640_dev *sensor)
>  {
> +	int ret;
> +
>  	if (sensor->pwdn_gpio) {
> -		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> +		ret =3D ov5640_reset_assert(sensor);

[Severity: High]
If the reset line is shared with an active device, will this actually
assert the reset line?=20

For shared reset controls, reset_control_assert() merely drops the local
vote. If another device is keeping the line deasserted, the physical pin
will remain HIGH.

Since the driver proceeds to power-cycle the OV5640's VDD regulators below:

> +		if (ret) {
> +			dev_err(&sensor->i2c_client->dev,
> +				"Failed to assert reset: %d\n", ret);
> +			return ret;
> +		}
> =20
>  		/* camera power cycle */
>  		ov5640_power(sensor, false);

Doesn't power-cycling the sensor while the shared reset pin is driven HIGH
violate hardware sequencing and risk latch-up?

>  		usleep_range(5000, 10000);	/* t2 */
>  		ov5640_power(sensor, true);
>  		usleep_range(1000, 2000);	/* t3 */
> =20
> -		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> +		ret =3D ov5640_reset_deassert(sensor);
> +		if (ret) {
> +			dev_err(&sensor->i2c_client->dev,
> +				"Failed to deassert reset: %d\n", ret);
> +			ov5640_power(sensor, false);
> +			return ret;
> +		}

[Severity: Medium]
If ov5640_reset_deassert() fails here, does this cause a WARN_ON in the
reset core during cleanup?

The devm_reset_control_get_optional_shared_deasserted() call during probe
initializes the deassert_count to 1. The ov5640_reset_assert() call above
drops it to 0.

If this function returns an error without reclaiming the vote, the count
remains at 0. When probe subsequently fails, the devm framework will call
reset_control_assert() to balance the initial acquisition. Since the count
is already 0, this will underflow the counter and trigger a kernel warning
in drivers/reset/core.c.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619100532.3779=
934-1-robby.cai@oss.nxp.com?part=3D2
