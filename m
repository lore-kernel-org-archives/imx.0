Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBD937F014;
	Mon, 13 Jul 2026 10:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939096; cv=none; b=f2kxtxz9w62uM/hKBEfeggLeAT4FyAEMRXAcHp12YwZH82xWJA8IzSZ6HonCO5EC2lMrycaERmSdxZOzo1FU5Gw3dJT3VQ1ZzKplRVMUC92wpKcFu/PvMsVgeRCrVzbhgT+2saDpkD9xuYZZiQ0tH5ijpo6PWM3mZYQjx3GZjnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939096; c=relaxed/simple;
	bh=x+v673bKrdgstSOS0sJiHKh2VJoMJZweqnnDh3JsuMM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m41DAAnNT9MN/Kk4W4O1fC8PfTgf5DzMtxvnkbe6g3KgZvZ3H6Q92/c4oor73+jFkqIb65yyOUVjoVACpe/SJHOF6+z2Ai0lRujOWjrCV4y7psIpj8tWMkr0lnjoQRLR/++xVVCJLe6tNzFOARFUoAig2PBsR2k9eBEtk22OaQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgcxN4wj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgcxN4wj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511071F00A3A;
	Mon, 13 Jul 2026 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783939094;
	bh=nkqspIWUgAzrrTdV947aloI+ENHvEkQkZlse1QuKFCg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mgcxN4wj9YdV9caDsMVretPOHZnOxLd3wGSEe2qDzHyxnZRqYqkmQknnQlXfkP+jD
	 ovl5YxouXQC/nFIoQgVqg+qWP2X17vbQ65eX0vHF91w9r+GN4MiWoLKAjEHW1ZqLRS
	 XKJSz2FGL7Jj2F1UdsXryNvoy3jbPWpH/sephxyzZ+NMGUldUOnEvM/59s87in6Ba/
	 O5q59/FtVV+nJhiofe0kQ1Pvk4zqRUAmwR4QewFR0yihMf1SLFedl3HpcH0K40JQkw
	 T3JJDS3dfoYLqGAc3nJgZ0bvzLJm8ZNxef/ZMAaC/9uOQDWzUQZeh0NFdyzjtbMHZ/
	 7QaM6ZHpAlIMQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] thermal/drivers/imx: Add calibration offset
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haoning CHENG" <Haoning.CHENG@cn.bosch.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v7-2-09b6b7669be1@cn.bosch.com>
References: <20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v7-0-09b6b7669be1@cn.bosch.com>
 <20260713-b4-symana21-11221-imx-thermal-support-upstream-6-18-v7-2-09b6b7669be1@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 10:38:13 +0000
Message-Id: <20260713103814.511071F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] An unbounded DT property causes integer underflow in the alarm cal=
culation, leading to out-of-bounds register bit manipulation.

Pre-existing issues:
- [High] Use-after-free of `data->tz` in the thermal alarm IRQ thread durin=
g device removal.
--

--- Patch [2]: [PATCH v7 2/2] thermal/drivers/imx: Add calibration offset s=
upport ---
commit 09bf5f606220dc9c50fce508974c8440db8631c3
Author: Haoning CHENG <Haoning.CHENG@cn.bosch.com>

thermal/drivers/imx: Add calibration offset support

This patch introduces support for a per-design temperature calibration
offset to align reported CPU temperatures with board-level measurements.
It reads the fsl,temp-calibration-offset-millicelsius property from the
device tree and applies it to the calibration formulas.

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
Does subtracting an unvalidated calibration_offset allow critical_value to
exceed the register bitfield width?

If the device tree provides an extremely large positive or negative value,
critical_value could overflow or underflow. When shifted and written to
REG_SET:

    regmap_write(map, soc_data->panic_alarm_ctrl + REG_SET,
                 critical_value << soc_data->panic_alarm_shift);

Could this out-of-bounds value pollute adjacent register fields, since REG_=
SET
applies any bits that are 1? Should data->calibration_offset be clamped bef=
ore
use?

> @@ -239,11 +241,14 @@ static void imx_set_alarm_temp(struct imx_thermal_d=
ata *data,
>  	int alarm_temp)
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
>  		     soc_data->high_alarm_mask);

[Severity: High]
Can alarm_value overflow the register bitfield for non-IMX7D variants?

The IMX7D variant uses clamp(), but the else branch does not:

    } else {
        alarm_value =3D (data->c2 - alarm_temp) / data->c1;
    }

Since alarm_temp is adjusted by an unbounded calibration_offset, this could
result in an out-of-bounds alarm_value that pollutes adjacent fields when
written to soc_data->high_alarm_ctrl.

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
>  		ret =3D imx_init_from_nvmem_cells(pdev);
>  		if (ret)

[Severity: High]
This is a pre-existing issue, but does this driver have a use-after-free
during device removal?

The driver requests its interrupt via devm_request_threaded_irq() in
imx_thermal_probe(). Because it uses devres, the IRQ is freed after
imx_thermal_remove() returns.

However, imx_thermal_remove() manually unregisters the thermal zone:

imx_thermal_remove()
    ...
    thermal_zone_device_unregister(data->tz);

This frees data->tz. If the hardware thermal alarm triggers after this
unregister but before the devres cleanup, the IRQ handler
imx_thermal_alarm_irq_thread() will execute:

imx_thermal_alarm_irq_thread()
    ...
    thermal_zone_device_update(data->tz, THERMAL_EVENT_UNSPECIFIED);

Could this dereference the freed data->tz pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-b4-symana2=
1-11221-imx-thermal-support-upstream-6-18-v7-0-09b6b7669be1@cn.bosch.com?pa=
rt=3D2
