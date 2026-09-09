Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362B235C1AE;
	Wed,  9 Sep 2026 17:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973758; cv=none; b=bHjdDPagRxyvnRWhWddgxS6ZmSGMssMDX1mTNiRgMmO+Wk+VlV1lJW/2Shd+qfxQFK3f06OUv5Y4A6haEZSyEtQ0ms1rWv+4btMqilYuTKXXKFlSyBv4Cwa2xspDRRPYDD66pAHnRTG+SBOQ6DKrpMKFLXVuI/MRZ2WVVOciWns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973758; c=relaxed/simple;
	bh=GEiN4jMUciIfL7jGFmnCJViga5R1IfaMx7x0DCv1xQ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Te651uN8ONshQ//IU21pW/Vd+Y04306JD4G0e95Uf+teIkd9wZBSiYAKUk+VLMIgciqQ27YXTXD6GaEtMKz/2HlrqF7pArQN568WbDDGxoHlbbOHtn48eao0ECYvFxuFHnRsDdScGBNSQpogmF5TZ2jADdG6xg1j4HeqFJbRDbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/29XeJu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/29XeJu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ABD81F000FF;
	Wed,  9 Sep 2026 17:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788973757;
	bh=780WOgTbPpjCwAj9rTJ8vw/M2+D2yvQvdSsmZ6fR/wk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R/29XeJu67Odk4F/2J5Tx59rr4SFJDG+cMhFyKn4QlKOqSkIM8/DzER5kBqfGFDqc
	 SW6HkB1E/y1bvfv0tVnbfQVJWldRtYHUqq6g/90OzbRLsvt7wCwHAZRmWtM/f1Lxg9
	 cTnQUZHKJTZ4+nOZ5AEwcuW7sF8Hbly3DcL2PY7vFH6mZtU5oGRgWmqOHFo6ka429F
	 wFu8xWcgAV2O7MQmd6Up70lLu9pv9aAiLpna4cd7bV8f0LiZp0HAB2jRt0yJvwRRMD
	 Lb37ncPasnZSLdd9X1XOGuN6p1ZpVTII2w7ktLhPRlDeQiTKsnluxpDlnc6FXVfPeH
	 QwZTohI1wtdUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v14 03/10] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-3-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
 <20260908-qcom-sa8255p-emac-v14-3-ec212b747a7d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 17:09:16 +0000
Message-Id: <20260909170916.8ABD81F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The driver's devres teardown sequence cancels an asynchronous susp=
end of the platform device, leaving the device permanently active.
- [High] Missing cleanup of the genpd performance state on driver unbind le=
aves a persistent power vote on the PM domain.
- [Low] The driver forcefully selects the user-visible PM subsystem from a =
leaf hardware driver, overriding user configuration.
--

commit dae3dafc17dff2635ed1048ccc9e18ab67fdf8a3
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: phy: qcom: add the SGMII SerDes PHY driver for SCMI systems

This commit adds a new firmware-managed variant of the Qualcomm DWMAC SGMII=
=20
SerDes/PHY driver. It introduces a separate driver from the HLOS-managed=20
variant since they share little code.

> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
> index d910a5d1a1ac3..677662f642e42 100644
> --- a/drivers/phy/qualcomm/Kconfig
> +++ b/drivers/phy/qualcomm/Kconfig
[ ... ]
> +config PHY_QCOM_SGMII_ETH_SCMI
> +	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
> +	depends on OF && (ARCH_QCOM || COMPILE_TEST)
> +	select GENERIC_PHY
> +	select PM
> +	select PM_GENERIC_DOMAINS

[Severity: Low]
Is it intended to forcefully select the user-visible PM subsystem from a le=
af=20
hardware driver?=20

Leaf drivers typically use "depends on" for user-visible features like PM=20
to avoid overriding user configurations.

> +	help
> +	  Enable this to support the internal SerDes/SGMII PHY on Qualcomm
> +	  chipsets where the SerDes hardware (clocks and registers) is owned
> +	  by the firmware.
> diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy=
/qualcomm/phy-qcom-sgmii-eth-scmi.c
> new file mode 100644
> index 0000000000000..ae961975dcd87
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
[ ... ]
> +static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_=
mode mode,
> +					      int submode)
> +{
> +	struct device *dev =3D phy->dev.parent;
> +	unsigned int perf_state;
> +	int ret;
> +
> +	ret =3D qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
> +	if (ret)
> +		return ret;
> +
> +	perf_state =3D (submode =3D=3D PHY_INTERFACE_MODE_2500BASEX) ?
> +		     SPEED_2500 : SPEED_1000;
> +
> +	return dev_pm_genpd_set_performance_state(dev, perf_state);

[Severity: High]
If the genpd performance state is dynamically set to a value greater than 0
here, where does it get reset to 0?=20

Without a teardown path (such as a .remove callback or a dedicated devres=20
action) to explicitly reset the performance state, the PM domain hardware=20
might remain forced at a high performance state permanently after driver=20
unbind, wasting power. The genpd core does not automatically drop dynamical=
ly=20
set performance states on unbind.

> +}
[ ... ]
> +static void qcom_dwmac_sgmii_phy_scmi_runtime_disable(void *data)
> +{
> +	struct device *dev =3D data;
> +
> +	pm_runtime_disable(dev);

[Severity: High]
Will this devres teardown sequence cancel the asynchronous suspend of the=20
platform device?=20

In the devres unwinding sequence, phy_destroy() unregisters the PHY child,=
=20
which causes the PM core to queue an asynchronous pm_request_idle() for the=
=20
parent platform device.=20

If qcom_dwmac_sgmii_phy_scmi_runtime_disable() executes pm_runtime_disable()
immediately after, it aborts the pending idle request. This leaves the=20
platform device permanently locked in the active state. Could this be avoid=
ed=20
by ensuring the device suspends synchronously before disabling runtime PM?

> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-qcom-sa825=
5p-emac-v14-0-ec212b747a7d@oss.qualcomm.com?part=3D3
