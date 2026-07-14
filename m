Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDB535E1AC;
	Tue, 14 Jul 2026 15:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784043746; cv=none; b=j5SQLn6MfQ65OD1WqU1WQz8x1D5+SbA/mXR1gTq8NbtEHGXBKVE4ZhxB5KQdPpGMA3LG1A642dH/sIBc6GBc/Y4gtsr0nIGst/fKnZ7W6aT4ek9+DBwxoyu+AkHA1/LsLNhIsgw/Mm/uGeKzFww/sgbW0JG6q5aJkN4AjawnDoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784043746; c=relaxed/simple;
	bh=ig1hG+7+DBuFH47tDbXMea4fuZF4ZHlMw/BtC6FWLGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JI/htZvfHc8Hrl+wkAYkUd7yxHN1FggpZv00lVd7Acl17oxb6dEtbX8lZAz82UyqBFtIGU5QV0D7uWKaopDyTNyvOPiqWeMPuX79gwr004up8V8p70vpRie8bk8P3H16fRo5xxlYoA3CivHal/lfeexmB5/XAOPxXVtgHvbUKgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZpyfP2C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZpyfP2C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A9B1F000E9;
	Tue, 14 Jul 2026 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784043744;
	bh=XRSGnp37P7V/hHnzD0w7ISEEzHsh3cgvggr8mR3zMAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NZpyfP2Cwe17C/IxzJRIACJYfYB+w7TMO56n9ivRxsX5BHwIyYdJyqclYkL5sW7RW
	 F9Id+t+aHKZx2b4sT2WiLbXmQ8I4QjVdd9qtq8hFH2VVlEQ113LVHiU+FvK5e4/jPC
	 d0z30lT0VeoBZuoS4oD1I0jg2gbXrUwKjCdUuD93Eg4yyS5BMyayrOXrOyBkZeBG5d
	 AtkW1cqvPjkmQXReVpwdmRyktpB/vtAUKN/wdOZAascGJTyF7A/DZba2Xp3V99L8Gv
	 fDjZ9fIcjFXVul19GAczRM/qma13t3CLNXOeJ7FEIcmvAy6+3uOv1TLHmMqn86hC/W
	 Ny0y6SyO41UTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 03/10] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, robh@kernel.org, devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-3-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
 <20260713-qcom-sa8255p-emac-v13-3-119f8699ef8e@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 15:42:23 +0000
Message-Id: <20260714154223.E0A9B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Improper GenPD performance state management causes hardware to res=
ume with insufficient voltage.
- [Medium] Explicit PM runtime management in PHY power callbacks is redunda=
nt and double-increments usage counters.
- [Low] The local `perf_state` cache is updated before the hardware call, c=
ausing state mismatch on failure.
--

--- Patch [3]: [PATCH net-next v13 03/10] phy: qcom: add the SGMII SerDes P=
HY driver for SCMI systems ---
commit 15d41616bc0d5eacc339e6ee3b574f4d5ac6e400
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

phy: qcom: add the SGMII SerDes PHY driver for SCMI systems
   =20
Implement support for the firmware-managed SGMII/SerDes PHY present on
Qualcomm platforms. Do this as a separate driver from the HLOS-managed
variant as they don't share almost any code.

> diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy=
/qualcomm/phy-qcom-sgmii-eth-scmi.c
> new file mode 100644
> index 0000000000000..aa7ce9393b285
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
> @@ -0,0 +1,165 @@

[ ... ]

> +static int qcom_dwmac_sgmii_phy_scmi_power_on(struct phy *phy)
> +{
> +	struct qcom_dwmac_sgmii_phy_scmi *priv =3D phy_get_drvdata(phy);
> +	struct device *dev =3D phy->dev.parent;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);

[Severity: Medium]
Is this explicit pm_runtime_resume_and_get() necessary?=20

The PHY core automatically handles runtime PM for the PHY device, and becau=
se
devm_phy_create() is used, the PHY core invokes phy_pm_runtime_get_sync()
which fully resumes the parent device before qcom_dwmac_sgmii_phy_scmi_powe=
r_on()
executes. Does this explicit call just double-increment the usage counter?

> +	if (ret)
> +		return ret;
> +
> +	ret =3D dev_pm_genpd_set_performance_state(dev, priv->perf_state);

[Severity: High]
Will this sequence cause the hardware to resume with insufficient voltage?

Because the PHY core already resumed the device prior to this callback, the=
=20
domain is already powered on by GenPD. Since qcom_dwmac_sgmii_phy_scmi_powe=
r_off()
manually zeroes the performance state, GenPD will cache a 0 voltage request
and power on the domain with 0 state.

This dev_pm_genpd_set_performance_state() then raises the voltage only after
the hardware has already been resumed. GenPD natively supports dropping the
performance state of runtime-suspended devices. Could we unconditionally set
the performance state in probe() and set_mode() instead of manually toggling
it in the power callbacks?

> +	if (ret) {
> +		pm_runtime_put(dev);
> +		return ret;
> +	}
> +
> +	usleep_range(5000, 10000);
> +
> +	return 0;
> +}
> +
> +static int qcom_dwmac_sgmii_phy_scmi_power_off(struct phy *phy)
> +{
> +	struct device *dev =3D phy->dev.parent;
> +
> +	dev_pm_genpd_set_performance_state(dev, 0);

[Severity: High]
Does manually zeroing the performance state here interfere with GenPD's
built-in state caching, forcing the next resume to happen at 0 voltage?

> +	pm_runtime_put(dev);

[Severity: Medium]
Is this pm_runtime_put() redundant since the PHY core will drop the runtime=
 PM
reference after this callback completes?

> +
> +	return 0;
> +}

[ ... ]

> +static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_=
mode mode,
> +					      int submode)
> +{
> +	struct qcom_dwmac_sgmii_phy_scmi *priv =3D phy_get_drvdata(phy);
> +	struct device *dev =3D phy->dev.parent;
> +	int ret;
> +
> +	ret =3D qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
> +	if (ret)
> +		return ret;
> +
> +	priv->perf_state =3D (submode =3D=3D PHY_INTERFACE_MODE_2500BASEX) ?
> +			   SPEED_2500 : SPEED_1000;
> +
> +	if (phy->power_count =3D=3D 0)
> +		return 0;

[Severity: High]
Is it necessary to explicitly skip the GenPD call when the device is suspen=
ded?

GenPD automatically handles caching performance states for suspended device=
s.
Bypassing the framework here prevents GenPD from knowing the new state befo=
re
the next resume.

> +
> +	return dev_pm_genpd_set_performance_state(dev, priv->perf_state);

[Severity: Low]
If dev_pm_genpd_set_performance_state() fails and returns an error,
priv->perf_state has already been updated.

Will this cause a state mismatch where the software caches the new mode but
the hardware remains in the old mode, causing a subsequent power_on() to
apply the wrong state?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-qcom-sa825=
5p-emac-v13-0-119f8699ef8e@oss.qualcomm.com?part=3D3
