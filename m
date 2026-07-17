Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F312A383C87;
	Fri, 17 Jul 2026 06:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784270759; cv=none; b=thJgLImSxRnBZ/aNCB4d6z5SPHVng+Gvkdc3uMaEm6knFGUs8gRv6As76AsrfIMip+icYwT6eIkqvhHNq0xSAUbay0uzHqACD9OERMKuEyKi1Mh6Fh3Gc9vwc3h6Rbh7lzvnpmEy9QDJRC3QBJ8/2nMust1b+KID64Icu2a0fyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784270759; c=relaxed/simple;
	bh=SsfHd1FK/rhwwRbEtX4gmTSyu/TeXvPFeN4/dF1UF00=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jLrm/Bv3WvUKtzhy47ooE0EyGzLelSvO9zsuck/veAuJqIGoDRDzwHRG1v/kQQZu0b4teZZqNyVN5F9YLtp6twIYhOyJEytvT7ntr8cBuIFBSUbkwlrZLtjeLcGggxquGTnx+OY1IYDw5hSO74H65/IWtQpeK8oNCEnjFuvsqAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQ6X377W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQ6X377W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B2E1F000E9;
	Fri, 17 Jul 2026 06:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784270745;
	bh=hPWUSEM2+SGrPMu6D65JP0GQcGB9y/PSQu2ZBCzeC1Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VQ6X377WI3K+26WNFNieYLEPcC4R5CpEZ6I0IDzgRkqCDzqBwNIYG9DBbRe6d6eRB
	 U3f3FOUb4Ps5wjCj6bZ/6lN+Rs15lfvQmAml1HlQU7ft9XHQIy6v5kE4y6sS8bmqbM
	 XCkc1YVkEt2AfcpFFleSy2NVX3voQZKO9Dh8rmvsQoCLBHUGuIOxuYUXMRXy86BSo2
	 4KHVljfPDZCGcTCFnS560cIFKfJt2mWegaDyUQrbLeeTNFMmNRYtqD8xV1bG/3OBi+
	 GMvqzsKF2WsuIHuaXCGz1/X5tbUC3Y1P/lN/7rskyB26HxZyUeWW3hM2qutwLV3fu0
	 gb6ULSENwBoOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 3/3] thermal/drivers/imx: Add temperature offset
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haoning CHENG" <Haoning.CHENG@cn.bosch.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260717-b4-symana21-11221-imx-thermal-support-upstream-6-18-v9-3-75f4af8974f4@cn.bosch.com>
References: <20260717-b4-symana21-11221-imx-thermal-support-upstream-6-18-v9-0-75f4af8974f4@cn.bosch.com>
 <20260717-b4-symana21-11221-imx-thermal-support-upstream-6-18-v9-3-75f4af8974f4@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 06:45:44 +0000
Message-Id: <20260717064544.D3B2E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Critical] Temperature calibration offset compromises hardware die protec=
tion limits.

Pre-existing issues:
- [High] Use-After-Free of thermal zone device in the alarm IRQ thread duri=
ng driver removal.
- [High] Race condition between imx_change_mode and the hardirq handler per=
manently disables the thermal alarm IRQ.
- [High] Missing pm_runtime_put calls in error paths leak runtime PM usage =
counters.
--

--- Patch [3]: [PATCH v9 3/3] thermal/drivers/imx: Add temperature offset s=
upport ---
commit 481f612125b42a851957ea2af55ad414681bb494
Author: Haoning CHENG <Haoning.CHENG@cn.bosch.com>

thermal/drivers/imx: Add temperature offset support
   =20
Some boards need a small per-design offset to make the TEMPMON reading
better correspond to the SoC package-surface temperature. This reads the
optional fsl,temp-calibration-offset-millicelsius property from DT and
applies it uniformly to the i.MX6/6SX/7D formulas.

> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 168069a16e930..87ae2e40cc6fe 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c

[ ... ]

> @@ -223,6 +228,7 @@ static void imx_set_panic_temp(struct imx_thermal_dat=
a *data,
>  	struct regmap *map =3D data->tempmon;
>  	int critical_value;
> =20
> +	panic_temp -=3D data->calibration_offset;

[Severity: Critical]
Can a negative calibration offset cause the hardware panic limit to exceed
the safe maximum die temperature?

If a negative offset is specified in the device tree for a cooler package,
subtracting it here shifts the hardware panic limit higher. For example,
if the OCOTP die limit is 95C and the offset is -20C, does this program
the hardware to alarm at 115C, which exceeds the safe threshold specified in
the SoC fuses?

[ ... ]

> @@ -283,6 +290,7 @@ static int imx_get_temp(struct thermal_zone_device *t=
z, int *temp)
>  		*temp =3D (n_meas - data->c1 + 25) * 1000;
>  	else
>  		*temp =3D data->c2 - n_meas * data->c1;
> +	*temp +=3D data->calibration_offset;
> =20
>  	/* Update alarm value to next higher trip point for TEMPMON_IMX6Q */
>  	if (data->socdata->version =3D=3D TEMPMON_IMX6Q) {

[Severity: High]
This is a pre-existing issue, but does this function leak runtime PM usage
counters on error paths?

Looking at imx_get_temp(), if the sensor data is invalid, it returns
without dropping the reference:

    ret =3D pm_runtime_resume_and_get(data->dev);
    if (ret < 0)
        return ret;

    regmap_read(map, soc_data->temp_data, &val);

    if ((val & soc_data->temp_valid_mask) =3D=3D 0)
        return -EAGAIN;

Similarly, in imx_set_trip_temp(), if the requested temperature is out of
bounds, it returns -EINVAL without calling pm_runtime_put(). Do these
paths permanently prevent the device from suspending?

[Severity: High]
This isn't a bug introduced by this patch, but is there a use-after-free
of the thermal zone device during driver removal?

When the driver is removed, thermal_zone_device_unregister() is called
which frees data->tz:

imx_thermal_remove()
    ...
    thermal_zone_device_unregister(data->tz);

However, the devm-managed IRQ is still registered and active until after
remove completes. If the thermal alarm fires in this window, will the IRQ
thread dereference the freed pointer here:

imx_thermal_alarm_irq_thread()
    ...
    thermal_zone_device_update(data->tz, THERMAL_EVENT_UNSPECIFIED);

[Severity: High]
This is a pre-existing issue, but can a race condition permanently disable
the thermal alarm IRQ?

If imx_change_mode() is called to disable the thermal device, it performs
a check-then-act without locking against the hardirq:

imx_change_mode()
    ...
    if (data->irq_enabled) {
        disable_irq(data->irq);
        data->irq_enabled =3D false;
    }

If the thermal alarm fires concurrently, the hardirq handler will also
disable the IRQ:

imx_thermal_alarm_irq()
    ...
    disable_irq_nosync(irq);
    data->irq_enabled =3D false;

Does this cause the IRQ disable depth to increment to 2, meaning a
subsequent enable_irq() will leave the hardware alarm permanently disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-b4-symana2=
1-11221-imx-thermal-support-upstream-6-18-v9-0-75f4af8974f4@cn.bosch.com?pa=
rt=3D3
