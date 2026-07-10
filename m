Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811F71A268;
	Fri, 10 Jul 2026 03:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783652476; cv=none; b=QropjA7QF9uSwTqxIL0fZ9AFANfk2wdEMx2dzv6qlCEHiBsAByh+zP1As3trNl34fq2cCdrtc7y3w6bordr3pgl0DpTQQLb2OcG4DYLZZPKKSTGWjXqLJi/uYZvnqFGBTTvzMUeptZTn9A0aj35p1yaiY7GneuFY6Y8tV929Guw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783652476; c=relaxed/simple;
	bh=oo++XuOYo7l3icNv3kwFfCLZv0Qm73O4s9a1wGBTIhM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Hw9FMIPj1BEyJhaqN6bs7KT4cbvc9NtXMFyE+24Xt0SfoiVCdBNSsPqMfdny9vV1o8e3e+eeXwIIshAs1+vWLb7HKHx6GZxIQEbT3MT2hdwTFazTHk56MJP601E52x8mxl6HDQMc9VfiPXsXwSobMZzEdoSGcAIAPIXakQCa6KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CG6ZzRJx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CG6ZzRJx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076FD1F000E9;
	Fri, 10 Jul 2026 03:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783652475;
	bh=TKKui7vhq2/fmwC4nd9vrFCyZJ7U5YgBkhMA8O9xkrw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CG6ZzRJxepUe0CHbgrxmRIkCErGaue3xC52UuXYaTd0W8r1zMpH1pEcvvnPj6PfiS
	 yMqJzcQnMf79cXVn9tl2j5FUBg11Z5nEuj10XwaIYxXkKVuzYDtPSvvue+Id0Y7cmt
	 mYn6sfM3llXWpaHP2+NcaRkKWmNUFHboQO6A0fT8dFYxpzAJlpdqrXkG3vwhhKdRS/
	 UPSoAF2e2gfOeF8Jl69pe7t7PiFt8vJXmODRKIfa1rXXau0qAxomcinMD72e/pKO40
	 +DN6R2bvg5biNELYEDzdd7ZjY3CCW18D2g1QC0569Cy2foU9+4RspY90fkbDJHWTtK
	 y4jOZT2lvAPhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] thermal/drivers/imx: Add calibration offset
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "HaoNing Cheng" <Haoning.CHENG@cn.bosch.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v3-2-db9fc2947c55@cn.bosch.com>
References: <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v3-0-db9fc2947c55@cn.bosch.com>
 <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v3-2-db9fc2947c55@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 03:01:14 +0000
Message-Id: <20260710030115.076FD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Medium] The patch introduces `fsl,temp-calibration-offset-millicelsius` =
without bounding its value. For non-IMX7D platforms, an accidentally or mal=
iciously large calibration offset will cause `alarm_value` (and `critical_v=
alue`) to exceed their bitmask, corrupting adjacent register fields during =
the unbounded shift and `REG_SET` operation.

Pre-existing issues:
- [High] If `pm_runtime_resume_and_get()` fails in probe, the error path le=
aks the thermal zone device and triggers a double-put of the runtime PM usa=
ge count. Additionally, `imx_thermal_remove` has an unconditional PM usage =
count underflow.
- [High] Early error returns in `imx_get_temp` fail to drop the PM runtime =
reference, causing a resource leak.
- [High] A data race on the boolean flag `data->irq_enabled` between `imx_c=
hange_mode` and the hardirq handler can cause the thermal alarm IRQ to beco=
me permanently disabled.
- [High] The thermal alarm IRQ thread can execute after the thermal zone ha=
s been unregistered and freed during driver removal.
--

--- Patch [2]: [PATCH v3 2/2] thermal/drivers/imx: Add calibration offset s=
upport ---
commit 311020e0627d8a262b45753877ad91b58881323e
Author: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>

thermal/drivers/imx: Add calibration offset support

This patch introduces a device tree property to apply a small calibration=20
offset to the reported CPU temperature. It reads the property and applies i=
t=20
to the i.MX6/6SX/7D calibration formulas while preserving the default behav=
ior.

> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c
> @@ -240,10 +241,13 @@ static void imx_set_alarm_temp(struct imx_thermal_d=
ata *data,
> =20
>  	data->alarm_temp =3D alarm_temp;
> =20
> -	if (data->socdata->version =3D=3D TEMPMON_IMX7D)
> -		alarm_value =3D alarm_temp / 1000 + data->c1 - 25;
> -	else
> +	if (data->socdata->version =3D=3D TEMPMON_IMX7D) {
> +		alarm_value =3D DIV_ROUND_UP(alarm_temp - data->calibration_offset,
> +					   1000) + data->c1 - 25;
> +		alarm_value =3D clamp(alarm_value, 0, 0x1ff);
> +	} else {
>  		alarm_value =3D (data->c2 - alarm_temp) / data->c1;
> +	}
> =20
>  	regmap_write(map, soc_data->high_alarm_ctrl + REG_CLR,
>  		     soc_data->high_alarm_mask);

[Severity: Medium]
For non-IMX7D platforms, does this code allow an unbounded calibration offs=
et
from the device tree to overflow the alarm_value?

If a large offset is provided, data->c2 will be skewed. This could cause
alarm_value to exceed its bitmask since it is not clamped in the else branc=
h.
Could this corrupt adjacent register fields during the shifted REG_SET
operation below?

> @@ -274,7 +278,7 @@ static int imx_get_temp(struct thermal_zone_device *t=
z, int *temp)
> =20
>  	/* See imx_init_calib() for formula derivation */
>  	if (data->socdata->version =3D=3D TEMPMON_IMX7D)
> -		*temp =3D (n_meas - data->c1 + 25) * 1000;
> +		*temp =3D (n_meas - data->c1 + 25) * 1000 + data->calibration_offset;
>  	else
>  		*temp =3D data->c2 - n_meas * data->c1;

[Severity: High]
This is a pre-existing issue, but looking earlier in imx_get_temp(), if the
sensor is busy, the function returns early without dropping the PM runtime
reference:

drivers/thermal/imx_thermal.c:imx_get_temp() {
    ret =3D pm_runtime_resume_and_get(data->dev);
    if (ret < 0)
        return ret;

    regmap_read(map, soc_data->temp_data, &val);

    if ((val & soc_data->temp_valid_mask) =3D=3D 0)
        return -EAGAIN;
    ...
}

Does this cause a permanent resource leak of the device PM runtime usage
counter when -EAGAIN is returned?

> @@ -629,6 +633,10 @@ static int imx_thermal_probe(struct platform_device =
*pdev)
> =20
>  	platform_set_drvdata(pdev, data);
> =20
> +	of_property_read_s32(dev->of_node,
> +			     "fsl,temp-calibration-offset-millicelsius",
> +			     &data->calibration_offset);
> +
>  	if (of_property_present(dev->of_node, "nvmem-cells")) {
>  		ret =3D imx_init_from_nvmem_cells(pdev);

[Severity: High]
This is a pre-existing issue, but further down in imx_thermal_probe(), if
pm_runtime_resume_and_get() fails, the error path jumps to disable_runtime_=
pm:

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

Since the jump bypasses thermal_zone_device_unregister(), and data is devres
managed, does this leave an orphaned thermal zone registered that will caus=
e a
use-after-free when polled? Additionally, since the usage count is already 0
on resume failure, does the pm_runtime_put_noidle() cause an underflow?

[Severity: High]
This is a pre-existing issue, but there appears to be a use-after-free duri=
ng
driver removal.

In imx_thermal_remove(), thermal_zone_device_unregister(data->tz) is explic=
itly
called, but the IRQ thread is devres-managed and continues to be active unt=
il
after the remove function returns:

drivers/thermal/imx_thermal.c:imx_thermal_alarm_irq_thread() {
    ...
    thermal_zone_device_update(data->tz, THERMAL_EVENT_UNSPECIFIED);
    ...
}

Can the devm-managed IRQ fire during module teardown and access the freed
data->tz pointer here?

[Severity: High]
This is a pre-existing issue, but there seems to be a data race on the
data->irq_enabled flag that can permanently disable the thermal alarm IRQ.

If the thermal zone mode is changed via sysfs concurrently with a hardware
thermal alarm interrupt, both paths check and modify the flag locklessly:

drivers/thermal/imx_thermal.c:imx_change_mode() {
    if (data->irq_enabled) {
        disable_irq(data->irq);
        data->irq_enabled =3D false;
    }
    ...
}

drivers/thermal/imx_thermal.c:imx_thermal_alarm_irq() {
    ...
    disable_irq_nosync(irq);
    data->irq_enabled =3D false;
    ...
}

Could both paths execute their disable function, incrementing the IRQ depth
twice, such that subsequent enables leave the IRQ physically disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-b4-symana2=
1-11221-imx-thermal-support-upstream-6-18-v3-0-db9fc2947c55@cn.bosch.com?pa=
rt=3D2
