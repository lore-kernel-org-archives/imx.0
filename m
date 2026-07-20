Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1270A5FDA7;
	Mon, 20 Jul 2026 02:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784514611; cv=none; b=tuNG6gf+BE/ccSQQG6QyhyqJZFlA6hQQFbX33fr9C5jVxbX8Vw5dfMU5VLeQKyTV/kPiayVl83s73LXbbHuoy+3oiLX0PjvxM685oEUw5OFe59mc57CYBkiDgsplqG9m0XpEMM6NgaK9m6I8fwkWZ+AsLDq3uiyqopBZUQBmE/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784514611; c=relaxed/simple;
	bh=sya+iu+BO8ag8PsFzPpJU1+OV6SIdvGJx+s+L2QzvS0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tg8Cq5IfJtYI3534LnYaQ34b1TnkssrR/DbkzZtpWdyWkpE8hTLQzogAZB/U5GFDnYMvfatc0pCz1LluliVO2ZwmZ+822mhuL+nGdJ6F0ql55FugHPvYa3F1OVm1W6SS/QZHBADoy/2WbfrKx3DwTvfnzsJhKT1ZgI44HbiyS7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqtD21b+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqtD21b+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404A31F000E9;
	Mon, 20 Jul 2026 02:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784514609;
	bh=FYDWGowRhI+kcWX02s+8sXeatK6lNdfYycqLuH4WLsg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XqtD21b+VuCl1FaSBwzn8V7I4NxPFNSaudgiQ+QidyldtIH+8ouhmcp1OdD1aBuen
	 FNyApKB8f4Uj9lUZke7zQ2HOmLxPt2JvEen7zraHE3wnd5+87/Q2Xjb3paLqYiH6Su
	 Mu4jRl2k//SaQD/i5kCkgUN3M8pYnvmKW44IlHEQc65F9OlJXRyvNU9gEDU7mjplt8
	 tOcr1UKzjgDYDoQqAU5vh/sjW+w8vfmeVAUiUG2x82+A8Dek1YGtl9C6VUn0FCM0gD
	 cTw1+BNwTVtuGY2MCrsfIVdYsDVMuS/4eY1EBIzKIhVSCiDG7wmdmmR5AEu2CO4DNR
	 t2W+K7bxCDy+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/3] thermal/drivers/imx: Add calibration offset
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haoning CHENG" <Haoning.CHENG@cn.bosch.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260720-b4-symana21-11221-imx-thermal-support-upstream-6-18-v10-3-f8c3dcd9a57e@cn.bosch.com>
References: <20260720-b4-symana21-11221-imx-thermal-support-upstream-6-18-v10-0-f8c3dcd9a57e@cn.bosch.com>
 <20260720-b4-symana21-11221-imx-thermal-support-upstream-6-18-v10-3-f8c3dcd9a57e@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 02:30:08 +0000
Message-Id: <20260720023009.404A31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Alarm IRQ can fire after thermal zone is unregistered, causing=
 a Use-After-Free.
--

--- Patch [3]: [PATCH v10 3/3] thermal/drivers/imx: Add calibration offset =
support ---
commit bb0e3bef4010d2e2be1d5402d29e194aaf49548f
Author: Haoning CHENG <Haoning.CHENG@cn.bosch.com>

thermal/drivers/imx: Add calibration offset support

The TEMPMON sensor reading may deviate from the theoretical SoC junction
temperature. This commit adds support for an optional DT property to apply a
calibration offset to the temperature readings. The offset is used when set=
ting
alarm/panic thresholds and reading the current temperature.

> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 168069a16e930..87ae2e40cc6fe 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c

[ ... ]

> @@ -635,6 +643,25 @@ static int imx_thermal_probe(struct platform_device =
*pdev)
> =20
>  	platform_set_drvdata(pdev, data);
> =20
> +	if (of_property_present(dev->of_node,
> +				"fsl,temp-calibration-offset-millicelsius")) {
> +		ret =3D of_property_read_s32(dev->of_node,
> +					   "fsl,temp-calibration-offset-millicelsius",
> +					   &data->calibration_offset);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to read calibration offset\n");
> +
> +		if (data->calibration_offset < IMX_TEMP_CALIB_OFFSET_MIN ||
> +		    data->calibration_offset > IMX_TEMP_CALIB_OFFSET_MAX)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "calibration offset %d millicelsius out of range\n",
> +					     data->calibration_offset);
> +
> +		dev_dbg(dev, "calibration offset: %d millicelsius\n",
> +			data->calibration_offset);
> +	}
> +
>  	if (of_property_present(dev->of_node, "nvmem-cells")) {
>  		ret =3D imx_init_from_nvmem_cells(pdev);
>  		if (ret)

[Severity: Critical]
This isn't a bug introduced by this patch, but while reviewing the probe
routine, I noticed a use-after-free issue related to how the alarm IRQ is
managed.

Can an interrupt fire after the thermal zone has been unregistered?

The alarm IRQ is requested with devres in probe:

drivers/thermal/imx_thermal.c:imx_thermal_probe() {
    ...
    ret =3D devm_request_threaded_irq(dev, data->irq,
			imx_thermal_alarm_irq, imx_thermal_alarm_irq_thread,
			0, "imx_thermal", data);
    ...
}

Because it is a devm-managed resource, it is not freed until after
imx_thermal_remove() completes. However, the remove path manually unregiste=
rs
and frees the thermal zone:

drivers/thermal/imx_thermal.c:imx_thermal_remove() {
    ...
    thermal_zone_device_unregister(data->tz);
    ...
}

If an administrative module unload or device unbind is triggered while the
SoC is hot, could an interrupt fire during or immediately after the unregis=
ter
call? If so, would the still-active IRQ thread dereference the freed data->=
tz
pointer?

drivers/thermal/imx_thermal.c:imx_thermal_alarm_irq_thread() {
    ...
    thermal_zone_device_update(data->tz, THERMAL_EVENT_UNSPECIFIED);
    ...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-b4-symana2=
1-11221-imx-thermal-support-upstream-6-18-v10-0-f8c3dcd9a57e@cn.bosch.com?p=
art=3D3
