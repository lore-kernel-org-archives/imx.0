Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9F42D9ECD;
	Mon, 13 Jul 2026 06:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922665; cv=none; b=fBZ13wcDZ6LBo5k1WZqC4S72dn0A7eTvZxx5356It2d1HnG+53ZwVcEQqVNansKCl35suQxALysVKunggZaZHx3UT0gdra5xGyx7LCtrrR2X7gq53Hu3u7wQh+h5sm1h98jWTINgiI7+Mkne2QbuqGaJGsH1KEEUtZMbS8jPGxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922665; c=relaxed/simple;
	bh=U8Z3KMvT07Hn5kHGgku2KE+XiwV5ntpez3/rbYrPjv4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uEPheA+mqLxWU8hhDr3sVdVJx9TnUBE8mcBGXidu0Ooflu4z04NarRbwHhAouv/EMymirjeXbFfZT0B3Wx6wI9ayWUne+HK8LFPCOf1/7wOsFC6cuSLuFHc2D+/XeXRLSFEp4Mx/f6mq1fP7Ho2KcgLi+ixUkzkM4AHHMiUGwF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+6MFv4Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+6MFv4Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3801F000E9;
	Mon, 13 Jul 2026 06:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783922664;
	bh=ZwkgoAx9sQwchO/02kiLeBrTBoKYcIvULajs4w5rp3k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K+6MFv4YULyxMBET+bxFZagZcsLHHaOUR56ti8WX+yZ4ZWNAPHZkEe6WsKCOl3KQG
	 WleVfcQHrhcBYRDiZNYy0QJMaXQDfTn+H5OX31ba8fLGdo6WMy9rwuwp5CPFbu4Gmk
	 N5LyGMyxJVUejvy46zcug+svGerx1fDvml1M2bpl3ye6v7LcLGKwHZ3fFgZ4rO9t5b
	 3OwEHJH2Qn6ZxNq2rqK+pX+RrBP6m5kvGgDzLvVR+htfBIhBfHrNqqW9fJbKLEjoNY
	 g5zpHIAqFenLzqlfozNWTefLqqZBxVOneoLb5K4V7YHEBFPf0gSKmkfXI36XP8ZvVG
	 ArM++/0rgD5uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] thermal/drivers/imx: Add calibration offset
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "HaoNing Cheng" <Haoning.CHENG@cn.bosch.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v5-2-69405c306c6b@cn.bosch.com>
References: <20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v5-0-69405c306c6b@cn.bosch.com>
 <20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v5-2-69405c306c6b@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 06:04:23 +0000
Message-Id: <20260713060423.BC3801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Hardware register corruption due to unmasked ALARM and PANIC values

Pre-existing issues:
- [Critical] Use-After-Free of device data due to skipped thermal zone unre=
gistration on probe error path
- [High] TOCTOU race on data->irq_enabled leads to permanent IRQ disablement
--

--- Patch [2]: [PATCH v5 2/2] thermal/drivers/imx: Add calibration offset s=
upport ---
commit 7348b3f0668ad3ef81c3864d07e94723c70b031c
Author: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>

thermal/drivers/imx: Add calibration offset support

This patch reads an optional fsl,temp-calibration-offset-millicelsius
property from the device tree and applies it to the calibration formulas
for i.MX6/6SX/7D devices.

> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 5aaacbc534786..5e3cff69aced7 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c

[ ... ]

> @@ -223,6 +224,7 @@ static void imx_set_panic_temp(struct imx_thermal_dat=
a *data,
>  	struct regmap *map =3D data->tempmon;
>  	int critical_value;
> =20
> +	panic_temp -=3D data->calibration_offset;
>  	critical_value =3D (data->c2 - panic_temp) / data->c1;
> =20
>  	regmap_write(map, soc_data->panic_alarm_ctrl + REG_CLR,

[Severity: High]
Does this code risk corrupting the panic_alarm_ctrl register if a large
calibration offset is provided?

The calibration_offset is subtracted from panic_temp, and critical_value
is not masked before being shifted and written to the REG_SET register:

drivers/thermal/imx_thermal.c:imx_set_panic_temp() {
    critical_value =3D (data->c2 - panic_temp) / data->c1;
    ...
    regmap_write(map, soc_data->panic_alarm_ctrl + REG_SET,
                 critical_value << soc_data->panic_alarm_shift);
}

If the offset causes critical_value to exceed its bitfield width, could the
overhanging bits corrupt adjacent control bits?

> @@ -239,11 +241,14 @@ static void imx_set_alarm_temp(struct imx_thermal_d=
ata *data,
>  	int alarm_value;
> =20
>  	data->alarm_temp =3D alarm_temp;
> +	alarm_temp -=3D data->calibration_offset;
> =20
> -	if (data->socdata->version =3D=3D TEMPMON_IMX7D)
> -		alarm_value =3D alarm_temp / 1000 + data->c1 - 25;
> -	else
> +	if (data->socdata->version =3D=3D TEMPMON_IMX7D) {
> +		alarm_value =3D DIV_ROUND_UP(alarm_temp, 1000) + data->c1 - 25;
> +		alarm_value =3D clamp(alarm_value, 0, 0x1ff);
> +	} else {
>  		alarm_value =3D (data->c2 - alarm_temp) / data->c1;
> +	}
> =20
>  	regmap_write(map, soc_data->high_alarm_ctrl + REG_CLR,

[Severity: High]
Can similar register corruption occur here for IMX6/IMX6SX devices?

While a clamp() was added for TEMPMON_IMX7D, the else branch for
other versions calculates alarm_value without masking or clamping:

drivers/thermal/imx_thermal.c:imx_set_alarm_temp() {
    } else {
        alarm_value =3D (data->c2 - alarm_temp) / data->c1;
    }
    ...
    regmap_write(map, soc_data->high_alarm_ctrl + REG_SET,
                 alarm_value << soc_data->high_alarm_shift);
}

Could an excessively large positive or negative calibration offset result
in unmasked bits corrupting the high_alarm_ctrl register?

[ ... ]

> @@ -629,6 +635,10 @@ static int imx_thermal_probe(struct platform_device =
*pdev)
> =20
>  	platform_set_drvdata(pdev, data);
> =20
> +	of_property_read_s32(dev->of_node,
> +			     "fsl,temp-calibration-offset-millicelsius",
> +			     &data->calibration_offset);
> +
>  	if (of_property_present(dev->of_node, "nvmem-cells")) {

[Severity: Critical]
This is a pre-existing issue, but does this function leave the thermal
zone registered if pm_runtime_resume_and_get() fails later in the probe?

If pm_runtime_resume_and_get() fails near the end of probe, the error
path jumps to disable_runtime_pm:

drivers/thermal/imx_thermal.c:imx_thermal_probe() {
    ...
    ret =3D pm_runtime_resume_and_get(data->dev);
    if (ret < 0)
        goto disable_runtime_pm;
    ...
thermal_zone_unregister:
    thermal_zone_device_unregister(data->tz);
disable_runtime_pm:
    pm_runtime_put_noidle(data->dev);
    pm_runtime_disable(data->dev);
    ...
}

Because disable_runtime_pm is located after thermal_zone_unregister,
it skips unregistering the thermal zone. Since the device data is managed
by devm_kzalloc(), it will be freed when probe fails.

Could subsequent polling by the thermal core invoke imx_get_temp() and
dereference the freed data pointer, leading to a use-after-free?

[Severity: High]
This is a pre-existing issue, but is there a race condition that can
lead to permanent loss of thermal interrupts?

If a user-space process toggles the thermal zone mode via sysfs, it
calls imx_change_mode() which performs a non-atomic check:

drivers/thermal/imx_thermal.c:imx_change_mode() {
    if (data->irq_enabled) {
        disable_irq(data->irq);
        data->irq_enabled =3D false;
    }
}

If a hardware interrupt fires between the check and the call to
disable_irq(), the hardirq handler modifies the same flag and disables
the interrupt:

drivers/thermal/imx_thermal.c:imx_thermal_alarm_irq() {
    ...
    disable_irq_nosync(irq);
    data->irq_enabled =3D false;
    ...
}

Would imx_change_mode() then call disable_irq() a second time,
increasing the disable depth to 2? Since future enable attempts will only
decrement the depth to 1, could this leave the interrupt permanently
disabled and force the system to rely on slower polling?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-b4-symana2=
1-11221-imx-thermal-support-upstream-6-18-v5-0-69405c306c6b@cn.bosch.com?pa=
rt=3D2
