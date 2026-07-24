Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AB43A963A
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 20:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784924842; cv=none; b=badzFpcBAR0wGAbTmtoUf/ziN4P7AmOI67hZmKvvcSUhrQgDu10rw/+5UsoQOO9+q+Q43PUnnjgcNSC8Yp7TOpr7jdjFGjdBHaJkwb/YOBba3ik9iOUzDXeKbxGzpZUgaz/XJVbWGcHQ/8QQzY8dm+qMuknFL/xZgkYgh4e0kpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784924842; c=relaxed/simple;
	bh=NmdW/v/N0c+PE/SqfnVhPQymTpmAPFEyzJKabl7magw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=if7xWf9LCyYCRfNXg3UuMO3QacmLtRTEgLy4p/Tb8ArCvg3cqc+FDbeJvFsQ9qL+otRJFoXjzG3kuJZHSAdWRKBj2hv5I2Nz60lA6C7ry873obWtDiL4CLDrQkMUrqr8gQnRLtCYxkqzGVCdcBi5XnDOpaTJAxAXCqjYHL0nLKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxLrHSPX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxLrHSPX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAA21F000E9;
	Fri, 24 Jul 2026 20:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784924841;
	bh=BoZGHY+v15n9nGbGJWtCGcSuSVTkmACMg7DWs7rklfQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VxLrHSPXa4tNUuygmRuxVaDfoX/VT5mSHfR4qZS+1VvB8IaCKXKdnY+ehWB5eSZRB
	 GKqJn82usO2gAPjkAdJZhIR8KxWZ/0rFWAzQE0R7qOYLj5uplNZI4BrjPyGSnwhjRT
	 aeJfAeiCTv+SZjQMFkmHnHkve+DfnjXl1r1yH4Cand9k5DVFILHOIs8RYJDx9rvKRZ
	 OK5Cmeb4XHOtoVhe8BNbu6To2DqZoykg3RuKNgHa8F0wY5WtEXjDUaEU4EXptcm4FE
	 cw2OW4d1H4xJDRei0nGAo0HU0zLPgGtWZTWJHk+zVeilnNtVK3jIcsjQD3W5N1vOht
	 zMxUcfGfwndTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] regulator: pca9450: Support regulator-off-in-suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260724201322.73937-1-festevam@gmail.com>
References: <20260724201322.73937-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 20:27:20 +0000
Message-Id: <20260724202720.DBAA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] set_suspend_disable unconditionally overwrites the regulator's RUN=
 state, forcing disabled regulators to turn ON upon resume.
- [High] Setting a buck regulator's suspend-disable state breaks the regula=
tor_is_enabled() API contract, causing state desynchronization.

Pre-existing issues:
- [High] LDO5 suspend and runtime enable operations are hardcoded to LDO5CT=
RL_L, silently failing when the SD_VSEL pin is HIGH.
--

--- Patch [1]: [PATCH] regulator: pca9450: Support regulator-off-in-suspend=
 ---
commit 906a14c015dd9c2836b5ec2820d49824597625f2
Author: Fabio Estevam <festevam@nabladev.com>
Subject: regulator: pca9450: Support regulator-off-in-suspend

The PCA9450 uses each regulator's ENMODE field to control whether the
regulator remains enabled when the PMIC transitions from RUN to STANDBY
mode.

Implement set_suspend_disable() for the buck regulators and LDO3-LDO5
by programming ENMODE to 10b to keep the regulator enabled in RUN
mode and off when PMIC_STBY_REQ is asserted.

> diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pc=
a9450-regulator.c
> index c41db70fa0529..13082585140f4 100644
> --- a/drivers/regulator/pca9450-regulator.c
> +++ b/drivers/regulator/pca9450-regulator.c
> @@ -77,6 +77,24 @@ static const unsigned int pca9450_dvs_buck_ramp_table[=
] =3D {
>  	25000, 12500, 6250, 3125
>  };
> =20
> +/*
> + * ENMODE =3D 10b keeps the regulator enabled in RUN mode and disables it
> + * while PMIC_STBY_REQ is asserted.
> + */
> +static int pca9450_buck_set_suspend_disable(struct regulator_dev *rdev)
> +{
> +	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
> +				  rdev->desc->enable_mask,
> +				  BUCK_ENMODE_ONREQ_STBYREQ);
> +}

[Severity: High]
Does this unconditionally overwrite the regulator's RUN state? If a regulat=
or
is currently disabled at runtime but its device tree node has the
regulator-off-in-suspend constraint, the regulator core's regulator_suspend=
()
will still call this function. Writing BUCK_ENMODE_ONREQ_STBYREQ (0x02)
encodes 'ON in RUN mode, OFF in STANDBY mode', which would bypass the kerne=
l's
state machine and force the regulator to turn ON when the system resumes to
RUN mode.

Could this also cause a state desynchronization with regulator_is_enabled()?
The driver uses regulator_is_enabled_regmap(), which performs a strict
equality check against rdev->desc->enable_val. Since most buck regulators
define enable_val as BUCK_ENMODE_ONREQ (0x01), updating the bits to 0x02
here will cause the core to incorrectly report an active regulator as
disabled.

> +
> +static int pca9450_ldo_set_suspend_disable(struct regulator_dev *rdev)
> +{
> +	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
> +				  rdev->desc->enable_mask,
> +				  LDO_ENMODE_ONREQ_STBYREQ);
> +}

[Severity: High]
Similar to the buck regulators, will this unconditionally overwrite the sha=
red
ENMODE bits for LDOs? If the regulator was disabled in RUN mode, this writes
LDO_ENMODE_ONREQ_STBYREQ (0x80) and forces it ON in RUN mode.

[ ... ]

> @@ -164,6 +194,7 @@ static const struct regulator_ops pca9450_ldo5_regula=
tor_ops =3D {
>  	.list_voltage =3D regulator_list_voltage_linear_range,
>  	.set_voltage_sel =3D pca9450_ldo5_set_voltage_sel_regmap,
>  	.get_voltage_sel =3D pca9450_ldo5_get_voltage_sel_regmap,
> +	.set_suspend_disable =3D pca9450_ldo_set_suspend_disable,
>  };

[Severity: High]
This is a pre-existing issue, but will pca9450_ldo_set_suspend_disable()
silently fail to apply to LDO5 if the external SD_VSEL pin is driven HIGH?

Looking at the pca9450a_regulators[] definition, LDO5 statically hardcodes
enable_reg to PCA9450_REG_LDO5CTRL_L:

    .vsel_reg =3D PCA9450_REG_LDO5CTRL_H,
    .vsel_mask =3D LDO5HOUT_MASK,
    .enable_reg =3D PCA9450_REG_LDO5CTRL_L,
    .enable_mask =3D LDO5H_EN_MASK,

When SD_VSEL is HIGH (e.g., during 1.8V UHS SD card operation), the PMIC
hardware uses the ENMODE bits from LDO5CTRL_H. Writing to LDO5CTRL_L here
and in the standard regulator_enable_regmap() operation will be completely
ignored by the hardware.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724201322.7393=
7-1-festevam@gmail.com?part=3D1
