Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2692E173B;
	Thu,  9 Jul 2026 05:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783576449; cv=none; b=iqecfInXrCwrqwHawuaJBg217i8NLJA6WC0wYskvL8SDRNxIfWWDoo3dwQXvSU72A56pslAX1a/LJxrpLujofihO4lccqTQUH0hbn/eVT6VwEpPECKVrdVy5kVA3ZATcX26bd4Dp7cRRQlxhKr8loW66o1MU5+Tti7h9rJoeEUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783576449; c=relaxed/simple;
	bh=VH6bVmiNH4nbZJBBw2HuSqwGIDZUgDGeJSQoz+HxKaU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NXtG3Up9NFuyd+Y9NyNpLiroUGLvrtjByKsgPs9wvrnTFZP7Ac0xYN/feqE82+fnzJUOofKIXqB5W27lf/25FYvbxTMXxWhV3cO94V5hSLaDo2KbGKqMV0Zu/L3RuoHU4WuSYM3jdJvJZisMv0tidLLIblRT4o9N1rwifBp66ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEdhUuZG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEdhUuZG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040201F000E9;
	Thu,  9 Jul 2026 05:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783576448;
	bh=namYQtzeSTib3/PgrQCBvhYcGPphyRkijlDWXFdDpk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FEdhUuZGgeUimWzzxAEueR7ixE+B2+FHfVqfcfHyRXKAKu6Zpdvj6sCLYVpD0kVzk
	 /84JsaSkIoA02NyOV5SQxri3rQSomehQFuFKuWVRuNq1buanTq1YaNEfL63mJvD+CP
	 K+xLEEj7TPSlMpN1bAhWUUmek1QwrtijHAOSgZ1qTpKPKeXAIP/JjObyGuGSCdnJaL
	 Bxr4bhbHn+jTVI6GGES+6MHpCLNvcb695M7WMBa+3x6EmNk9LriQmfmI6YAcKcuOva
	 QjoAaTL57tDrlF16y6bUN9Y4P1Xhgi1t6pNDfw/0XvnzYKyGQ5+1VCbg+VTL+1C7Hz
	 25GsDNM/ee3rw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] thermal/drivers/imx: Add calibration offset support
Reply-To: sashiko-reviews@lists.linux.dev
To: "HaoNing Cheng" <Haoning.CHENG@cn.bosch.com>
Cc: conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v1-2-00f88f42930b@cn.bosch.com>
References: <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v1-0-00f88f42930b@cn.bosch.com>
 <20260709-b4-symana21-11221-imx-thermal-support-upstream-6-18-v1-2-00f88f42930b@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 05:54:07 +0000
Message-Id: <20260709055408.040201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The i.MX7D alarm temperature calculation truncates towards zero, l=
eading to an early hardware trigger and an IRQ storm when the calibration o=
ffset is not a multiple of 1000.

Pre-existing issues:
- [High] The computed `alarm_value` is shifted and written to the high alar=
m control hardware register without bitwise masking, allowing out-of-bounds=
 or negative values to corrupt adjacent register fields.
--

--- Patch [2]: [PATCH 2/2] thermal/drivers/imx: Add calibration offset supp=
ort ---
commit b15c0dce27dccd66bd58b8f22bb746933db67a41
Author: HaoNing Cheng <Haoning.CHENG@cn.bosch.com>

thermal/drivers/imx: Add calibration offset support

Some boards need a small per-design correction to align the reported CPU
temperature with board-level measurements.

> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 5aaacbc534786..3e1eec2fc3613 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c
> @@ -241,7 +242,7 @@ static void imx_set_alarm_temp(struct imx_thermal_dat=
a *data,
>  	data->alarm_temp =3D alarm_temp;
> =20
>  	if (data->socdata->version =3D=3D TEMPMON_IMX7D)
> -		alarm_value =3D alarm_temp / 1000 + data->c1 - 25;
> +		alarm_value =3D (alarm_temp - data->calibration_offset) / 1000 + data-=
>c1 - 25;

[Severity: High]
If the device tree property fsl,temp-calibration-offset-millicelsius is set
to a value that is not a multiple of 1000 (e.g., 500), does this integer
division truncate towards zero and cause an early hardware alarm trigger?

When the hardware asserts the thermal interrupt due to the truncated thresh=
old,
the IRQ handler would read the temperature, calculate that the temperature =
is
still below the alarm_temp, and immediately re-enable the IRQ. Could this
regression lead to an infinite IRQ storm?

[Severity: High]
This is a pre-existing issue, but the computed alarm_value is shifted and
written to the high alarm control register shortly after this without maski=
ng:

    regmap_write(map, soc_data->high_alarm_ctrl + REG_SET,
                 alarm_value << soc_data->high_alarm_shift);

Since the newly introduced calibration offset could make alarm_value negati=
ve
or exceed its 9-bit mask, shifting a negative signed value will set the upp=
er
bits to 1.=20

Because this is a bit-set operation, could writing this value overwrite and
corrupt the adjacent IMX7_TEMPSENSE0_PANIC_ALARM field (bits 18-26)? The sa=
me
pattern appears to exist for the panic alarm threshold in imx_set_panic_tem=
p().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-b4-symana2=
1-11221-imx-thermal-support-upstream-6-18-v1-0-00f88f42930b@cn.bosch.com?pa=
rt=3D2
