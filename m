Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDE43822AA;
	Thu,  9 Jul 2026 08:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585342; cv=none; b=QUYuFy2ls/yjOcIFGb8YYaDi4UXA96fXC8OfAcy2D/FinDVkHQ3xqjW68gzK5FZL30KBjlrJuGyjbwfayik22CAOtuLLzFlEpE/Bks4/QfhQNHKu/w1KObeYSe6tPDFbYtuQPJ8d1sseWWn4pbyj+I7C6JqQ+xix7fqKaRdMNWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585342; c=relaxed/simple;
	bh=NLms4Xe5J7APb9pVInZUqfnYHA58Y/jk/Hgfv79l1/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c8yOir1WQhwfYXQjFFKDlebk2I6ui76bGz49/h3TIzlHaHhloYrfjtVmUCK3s/CA4fgirQCfnxd2cS8P60KDl5y1gGtmL1enMjEculwG7EE0VOd/RsTgOuVn+zM9lxTKxFMb5SWOnd0kddTT+5K9FmbbGq9Y6hpB7TAuc4ZJnN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2NZYQ1b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2NZYQ1b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D6E1F000E9;
	Thu,  9 Jul 2026 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783585341;
	bh=YHIupDpuUzdRT4ikQZYN1LzFeo2ys/t6QlxuMJq5TB8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G2NZYQ1bEXnWCoZjC8N/ekkMvkk4g1Bj9skTR9T0aEVfSLBW5H9v8AxkuOtAI43hp
	 dbO1Az6yYO1eqjgrKqzteFAHy7btSqAe8STCxwR8KfnWPVEOviUbn4NoPlBc48eaVD
	 5ht/658AJ3cIBk5DQK1f86kxeGp1RRTyr+AoDGH9je4hv2PWr6dG+kCWtaKO5Sc/XG
	 HlMAc1k88TacVSr0Dj9e2bmxV4/4wHDOx0eS+XvNMoQf9Jdd/QQ6wr909qL1wrLGil
	 Qc8QL/WcGlPwro0hqs7gaLOXYV+tu/rx2+seOKwsYOIGCfT6s4CG2N6MF871JUOVJw
	 wq5W3w90T68tQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] thermal/drivers/imx: Add calibration offset
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "HaoNing Cheng" <Haoning.CHENG@cn.bosch.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v2-2-00ff72495e24@cn.bosch.com>
References: <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v2-0-00ff72495e24@cn.bosch.com>
 <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v2-2-00ff72495e24@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 08:22:20 +0000
Message-Id: <20260709082220.D4D6E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Premature thermal zone registration exposes sysfs before the IRQ i=
s requested, allowing unbalanced IRQ enable/disable operations.
- [High] Data race on `data->irq_enabled` between process context and hardi=
rq context leads to unbalanced IRQ disable depths and permanently disabled =
interrupts.
- [High] Use-After-Free of `data->tz` in the thermal alarm IRQ thread durin=
g driver removal due to skipped `disable_irq()` synchronization.
--

--- Patch [2]: [PATCH v2 2/2] thermal/drivers/imx: Add calibration offset s=
upport ---
commit 7cfd21023fa90494618a836d7b36a5a78f4f8447
Author: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>

thermal/drivers/imx: Add calibration offset support
   =20
Some boards need a small per-design correction to align the reported CPU
temperature with board-level measurements.

Read the optional fsl,temp-calibration-offset-millicelsius property from
DT and apply it to the i.MX6/6SX/7D calibration formulas.

> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 5aaacbc534786..971d6b4737c68 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c

[ ... ]

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
This isn't a bug introduced by this patch, but I noticed a potential race
condition involving the sysfs exposure of this temperature read.

In imx_thermal_probe(), the thermal zone is registered before the IRQ is
requested:

imx_thermal_probe() {
    data->tz =3D thermal_zone_device_register_with_trips(...)
    ...
    ret =3D devm_request_threaded_irq(...)
}

Could userspace trigger a read through sysfs immediately after registration,
calling into imx_get_temp() before the IRQ is fully requested?

If so, and if it reaches this path:

imx_get_temp() {
    if (!data->irq_enabled && *temp < data->alarm_temp) {
        data->irq_enabled =3D true;
        enable_irq(data->irq);
    }
}

Would it call enable_irq() on an unrequested IRQ, leading to unbalanced IRQ
enable/disable operations?

Furthermore, if devm_request_threaded_irq() fails, the error path
unregisters the thermal zone, which calls
imx_change_mode(THERMAL_DEVICE_DISABLED).  Since data->irq_enabled was set
to true, would it deterministically call disable_irq() on the unrequested I=
RQ?

[ ... ]

> @@ -629,6 +633,10 @@ static int imx_thermal_probe(struct platform_device =
*pdev)
> =20
>  	platform_set_drvdata(pdev, data);
> =20
> +	of_property_read_s32(dev->of_node,
> +			     "fsl,temp-calibration-offset-millicelsius",
> +			     &data->calibration_offset);
> +

[Severity: High]
This is a pre-existing issue, but while reviewing the IRQ handling in this
driver, I noticed a potential data race on data->irq_enabled between process
context and hardirq context.

The flag is accessed and modified in imx_change_mode() without
synchronization:

imx_change_mode() {
    if (data->irq_enabled) {
        disable_irq(data->irq);
        data->irq_enabled =3D false;
    }
}

It is also concurrently modified in hardirq context:

imx_thermal_alarm_irq() {
    disable_irq_nosync(data->irq);
    data->irq_enabled =3D false;
}

If imx_change_mode(THERMAL_DEVICE_DISABLED) reads data->irq_enabled as true,
and an alarm interrupt fires immediately after on another CPU, the hardirq
handler will run, call disable_irq_nosync(), and set the flag to false.

When the hardirq completes, would imx_change_mode() resume and
unconditionally call disable_irq(), incrementing the IRQ disable depth to 2?

Would subsequent reenables only decrement it by 1, leaving the hardware IRQ
permanently disabled?

[Severity: High]
This is another pre-existing issue related to the IRQ handling, but I
noticed a potential use-after-free of data->tz in the thermal alarm IRQ
thread during driver removal.

During imx_thermal_remove(), thermal_zone_device_unregister() is called,
which internally sets the mode to disabled by calling
imx_change_mode(THERMAL_DEVICE_DISABLED).

If a thermal alarm interrupt fired just prior, the hardirq handler will have
set data->irq_enabled =3D false and woken up the IRQ thread.  Because
data->irq_enabled is now false, imx_change_mode() skips calling disable_irq=
():

imx_change_mode() {
    if (data->irq_enabled) {
        disable_irq(data->irq);
    }
}

By skipping disable_irq(), does it fail to provide the required
synchronization barrier to wait for the IRQ thread to complete?

If thermal_zone_device_unregister() proceeds to free data->tz, could the
still-running imx_thermal_alarm_irq_thread() then dereference the freed
pointer:

imx_thermal_alarm_irq_thread() {
    thermal_zone_device_update(data->tz, THERMAL_EVENT_UNSPECIFIED);
}

Would this lead to a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-b4-symana2=
1-11221-imx-thermal-support-upstream-6-18-v2-0-00ff72495e24@cn.bosch.com?pa=
rt=3D2
