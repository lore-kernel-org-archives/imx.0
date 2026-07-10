Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8205B2E413;
	Fri, 10 Jul 2026 03:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783653325; cv=none; b=nfR0cXzHTAAVQG7IK7m8Jqrf3HkoMYvv6IRWTqK2THHP9cvLArIqu0ouPCtBNRsmgzR1tQNgIfUabHVNy4WLtI2zXs8LSOU3uVPhrp56HAnaQQ8Ztj8LcvZuQEdpfA34DK6iH68OHgCZuWkEDuKjhzwyBmXdm6ALqEz2TgZ7Huw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783653325; c=relaxed/simple;
	bh=B9PeC5OZ9gkvfuD6X3PWNLBhhaAvzuSZBwYabGIVX+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H383icpTUENnPXZ9YapvUF2uQsBq+OKF+zhHlWHxSI4LjG++SfDt6PiqLTuV7pCm0haV/5LzfAW6Vu6s7bFEzDsTyIICfeiwtxTUHLlN6rmCzYvpJrlmmq4i0Tlp0H+IK1juRVduuKLgzxVug2fZ8Wpkg9N9ZgI1BxAbkO+e6yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5/ISWmO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5/ISWmO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5D01F000E9;
	Fri, 10 Jul 2026 03:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783653324;
	bh=6Mdu3H1efRBkZm3WQ0fxlKQcKZKN6mjGw1y4g6q5EgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l5/ISWmO2/cLPLuwxM6C+lPDnyL5Fbr+sSIy5nRV/6ob4hLVVRmivWoaLNd0/UU8F
	 AaNWQMOAsTAjsCHOfilUQyYtxP/LdypVqznP4fvMidqgnVaqL50rF+vQ1KKgeQpo1s
	 xhaXCdKuIs88G6vOZI8I2Rsv4mekHnUIj4mTZYw1DjGu8MqQjvLil6VYjT2ND2NOkg
	 Qp0sinFzBEv/XWU62Mq/aPiPYaaOBUhKg6kfl1okiyWTZZSfqtYokbdUhaMB8kahze
	 tVmHu7r9dDs29oMLYoObkiiQ4ovj3uMi85XuWO5f33O+6S4+nevtM5mZP+8e3/0S0A
	 vBNkCp4Ct2Cuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] thermal/drivers/imx: Add calibration offset
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "HaoNing Cheng" <Haoning.CHENG@cn.bosch.com>
Cc: robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v4-2-1fef97d1c750@cn.bosch.com>
References: <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v4-0-1fef97d1c750@cn.bosch.com>
 <20260710-b4-symana21-11221-imx-thermal-support-upstream-6-18-v4-2-1fef97d1c750@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 03:15:23 +0000
Message-Id: <20260710031523.AF5D01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The new `calibration_offset` is added to `data->c2`. This unvalida=
ted offset can cause `alarm_value` and `critical_value` in `imx_set_alarm_t=
emp()` and `imx_set_panic_temp()` to exceed the 12-bit hardware mask for i.=
MX6. Since these values are left-shifted and written using `REG_SET` withou=
t clamping, it will corrupt adjacent register fields (e.g., powering down t=
he sensor unintentionally). Additionally, negative values left-shifted trig=
ger Undefined Behavior.
- [Medium] The macro `DIV_ROUND_UP(n, d)` expands to `((n) + (d) - 1) / (d)=
`. Because C integer division truncates towards zero, this macro produces m=
athematically incorrect results when the numerator is negative. In `imx_set=
_alarm_temp`, if `alarm_temp` is smaller than `data->calibration_offset` (e=
.g., a low trip threshold combined with a large DT offset), the numerator b=
ecomes negative. This results in an off-by-one error (1=C2=B0C) when calcul=
ating the hardware alarm threshold for i.MX7D. A safe division approach tha=
t handles negative values should be used.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but both `imx_get_te=
mp()` and `imx_set_trip_temp()` acquire a runtime PM reference using `pm_ru=
ntime_resume_and_get()`. However, if an early return condition is met (e.g.=
, the sensor measurement is not yet valid returning `-EAGAIN`, or the trip =
temperature is out of bounds returning `-EINVAL`), the functions return dir=
ectly without dropping the runtime PM reference. This permanently leaks the=
 reference.
- [High] This problem wasn't introduced by this patch, but the thermal cloc=
k `data->thermal_clk` is successfully prepared and enabled in `imx_thermal_=
probe()`. However, the driver's removal function, `imx_thermal_remove()`, c=
ompletely lacks the corresponding `clk_disable_unprepare()` call. This lead=
s to a clock reference leak every time the driver module is unloaded.
--

--- Patch [2]: [PATCH v4 2/2] thermal/drivers/imx: Add calibration offset s=
upport ---
commit 0856324278f99d619114b6ca18250e57e7dbf3ca
Author: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>

thermal/drivers/imx: Add calibration offset support

Some boards need a small per-design correction to align the reported CPU
temperature with board-level measurements. Read the optional
fsl,temp-calibration-offset-millicelsius property from DT and apply it to
the i.MX6/6SX/7D calibration formulas.

> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 5aaacbc534786..971d6b4737c68 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c

[ ... ]

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

[Severity: Medium]
Since C integer division truncates toward zero, does DIV_ROUND_UP() produce
mathematically incorrect results if alarm_temp is smaller than
data->calibration_offset and the numerator becomes negative?

> +		alarm_value =3D clamp(alarm_value, 0, 0x1ff);
> +	} else {
>  		alarm_value =3D (data->c2 - alarm_temp) / data->c1;
> +	}

[Severity: High]
With the unvalidated calibration_offset now added to data->c2, can
alarm_value exceed the hardware mask for i.MX6 or become negative?

If so, does the left-shift and REG_SET occurring just below this block:

	regmap_write(map, soc_data->high_alarm_ctrl + REG_SET,
		     alarm_value << soc_data->high_alarm_shift);

corrupt adjacent register fields? A similar sequence exists in
imx_set_panic_temp() with critical_value.

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
This is a pre-existing issue, but does this function leak the runtime PM
reference if the sensor measurement is not yet valid?

Earlier in imx_get_temp(), pm_runtime_resume_and_get() is called, but the
error path returns without dropping the reference:

	ret =3D pm_runtime_resume_and_get(data->dev);
	if (ret < 0)
		return ret;

	regmap_read(map, soc_data->temp_data, &val);

	if ((val & soc_data->temp_valid_mask) =3D=3D 0)
		return -EAGAIN;

This same pattern also appears in imx_set_trip_temp() when returning -EINVA=
L.

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
>  	if (of_property_present(dev->of_node, "nvmem-cells")) {
>  		ret =3D imx_init_from_nvmem_cells(pdev);
>  		if (ret)

[Severity: High]
This is a pre-existing issue, but does the driver leak the thermal clock
reference when removed?

imx_thermal_probe() prepares and enables data->thermal_clk:

	ret =3D clk_prepare_enable(data->thermal_clk);
	if (ret) {
		dev_err(dev, "failed to enable thermal clk: %d\n", ret);

However, imx_thermal_remove() does not appear to call clk_disable_unprepare=
()
when the driver module is unloaded.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-b4-symana2=
1-11221-imx-thermal-support-upstream-6-18-v4-0-1fef97d1c750@cn.bosch.com?pa=
rt=3D2
