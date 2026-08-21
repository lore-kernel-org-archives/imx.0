Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879CE1DDC37;
	Fri, 21 Aug 2026 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316069; cv=none; b=tTWbeLynkTaghn6W9jmUf5GqLwTnBjPMOT6rVDliJhLIkbY+cSF5wvsNYsMKTDiGy4kGUq+puzDVY4tSxN7RJYAJkSn3J86C9JklZ3D/ihzsojDA20l6r1gQSTPFp1lehcOiVZNoPR/QNP6k8BJNDtGCGsV4UxFWW5d6xSoAAMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316069; c=relaxed/simple;
	bh=jSfkbJwvr5Lvh2CXUluZ5wdA39/BKoUXbeuTHiJXQXg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OrPu6OBAkl4Cci5X8Nxgw1WJVKAlmNkqPQXLbxnKUjqnMN7LT4fgOymtZ7UUFkeA4yn4ognz2e4wuXtefoelgWeRTFbjvpn46D/OqBzIPBBfSmbfrlXyeDpoeXrHEw+3CBED+E24VIx21eNHPOgBTdZ2maSGVCtHkf7NMtTd09I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhCWLvGF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhCWLvGF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5971F000E9;
	Fri, 21 Aug 2026 12:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787316068;
	bh=x8fZVUD+VLPFYzy/zOla+LFds2QmZK25F7ld8li6UC0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WhCWLvGFpFhUj779R0kdSKuSdvLH5S5iJlpnlx7g6LimXhWNH7k7dI6aYbrXlprzx
	 PGghi9TFlMecurk5f3UrFwx/QwlhgXHFeR3ss2lKNMGyQITPrR9QxoGrJUJXnpsdfL
	 YWDsQlfmkpfTjTCwt7TehGlsQplrpS77TaSP2kuOQ1dBnoYy8DnlDeupw28yCWvjzi
	 xw+Dx03rMXlcLNM2pFya0N6a3B9wofYwhG12LU8NRs7o8hdDVndrr2FhhtXHhlhe2z
	 eei4dWm+xojX8M3noR5ZfXbDaj4yKNGCHz22AAd7Od0rb5WnKyKCPnsfnO0rU8gzOV
	 BgWsB7RYhiodQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <d709664186f2a85b6c3173b5e5a8a297464fd7f7.1787314780.git.stefano.r@variscite.com>
References: <cover.1787314780.git.stefano.r@variscite.com>
 <d709664186f2a85b6c3173b5e5a8a297464fd7f7.1787314780.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 12:41:07 +0000
Message-Id: <20260821124107.DA5971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The Ethernet PHY reset pin for `ethphy1` is muxed on the `fec2` no=
de instead of `fec1`, causing PHY detection to fail during MDIO bus probe.
- [Medium] Use of `IRQ_TYPE_NONE` (0) for touchscreen controller interrupts.
- [Low] Duplicate `assigned-clock-rates` property in the `&sai1` node.
- [Low] Attempting to delete a non-existent child node `bcrmf@1` instead of=
 `wifi@1`.
- [Low] Missing required `color` property in the GPIO LED definition.
- [Low] Use of deprecated `reset-gpio` property instead of `reset-gpios` in=
 the PCIe node.
--

--- Patch [2]: [PATCH v1 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 su=
pport ---
commit 910d1859fce3905900b424cb29918719c63275b0
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support

This commit adds device tree support for the Variscite VAR-SOM-MX7 system on
module. It provides the common SoM description along with configurations for
eMMC, NAND, WM8731 audio codec, and the V2 hardware revision.

Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi =
b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> index 0000000000000..82814535fb93e 100644
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
> @@ -0,0 +1,378 @@
[ ... ]
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_gpio_leds>;
> +
> +		led-d10 {
> +			function =3D LED_FUNCTION_STATUS;
> +			gpios =3D <&gpio1 13 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};

[Severity: Low]
Does this led-d10 node also need a color property? When function is
specified, modern LED bindings generally require the color property to form
sysfs directories in the format color:function.

[ ... ]
> +&i2c4 {
> +	clock-frequency =3D <100000>;
> +	pinctrl-names =3D "default", "gpio";
> +	pinctrl-0 =3D <&pinctrl_i2c4>;
> +	pinctrl-1 =3D <&pinctrl_i2c4_gpio>;
> +	scl-gpios =3D <&gpio4 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios =3D <&gpio4 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status =3D "okay";
> +
> +	ft5x06_ts: touchscreen@38 {
> +		compatible =3D "edt,edt-ft5206";
> +		reg =3D <0x38>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_touch>;
> +		interrupt-parent =3D <&gpio2>;
> +		interrupts =3D <30 0>;

[Severity: Medium]
Is it intentional to use 0 (IRQ_TYPE_NONE) for the touchscreen interrupt
trigger type here? This can cause the interrupt to be unconfigured or
incorrectly configured by default, which may lead to missed touch events or
an interrupt storm.

[ ... ]
> +&pcie {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_pcie>;
> +	reset-gpio =3D <&gpio2 31 GPIO_ACTIVE_LOW>;

[Severity: Low]
Could this use the standard reset-gpios property instead? The reset-gpio
property is deprecated, and dtbs_check validation may emit warnings for it.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi b/arch/arm/b=
oot/dts/nxp/imx/imx7d-var-som-v2.dtsi
> index 0000000000000..724aa6fb36de2 100644
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
> @@ -0,0 +1,64 @@
[ ... ]
> +/* WiFi */
> +&usdhc2 {
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	/delete-node/ bcrmf@1;
> +};

[Severity: Low]
Is there a typo in the node name here? The node defined in the base dtsi is
wifi@1 (with the label brcmf). Trying to delete bcrmf@1 will cause the
device tree compiler to fail since the node doesn't exist.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi b/arch/a=
rm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> index 0000000000000..5fab164a64820 100644
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> @@ -0,0 +1,65 @@
[ ... ]
> +&sai1 {
> +	assigned-clock-rates =3D <0>, <36864000>;
> +	assigned-clocks =3D <&clks IMX7D_AUDIO_MCLK_ROOT_SRC>,
> +			  <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
> +	assigned-clock-parents =3D <&clks IMX7D_PLL_AUDIO_POST_DIV>;
> +	assigned-clock-rates =3D <0>, <12288000>;

[Severity: Low]
Does this node intend to duplicate the assigned-clock-rates property? The
second definition (<0>, <12288000>) will silently overwrite the first one
(<0>, <36864000>), which will cause DTC to emit a duplicate property warning
and the intended 36.864MHz clock rate configuration to be lost.

> +	/delete-property/ fsl,sai-mclk-direction-output;
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot=
/dts/nxp/imx/imx7d-var-som.dtsi
> index 0000000000000..cbd6252bd18f3 100644
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> @@ -0,0 +1,633 @@
[ ... ]
> +&ecspi1 {
> +	pinctrl-names =3D "default", "sleep";
> +	pinctrl-0 =3D <&pinctrl_ecspi1>;
> +	pinctrl-1 =3D <&pinctrl_ecspi1_sleep>;
> +	cs-gpios =3D <&gpio4 19 GPIO_ACTIVE_LOW>;
> +	status =3D "okay";
> +
> +	/* Resistive touch controller */
> +	ads7846_ts: ads7846@0 {
> +		reg =3D <0>;
> +		compatible =3D "ti,ads7846";
> +		pinctrl-names =3D"default";
> +		pinctrl-0 =3D <&pinctrl_restouch>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <9 0>;

[Severity: Medium]
Is it intentional to use 0 (IRQ_TYPE_NONE) for this touch controller interr=
upt
trigger type? This might result in the interrupt being unconfigured by defa=
ult.

[ ... ]
> +&fec1 {
> +	pinctrl-names =3D "default","sleep";
> +	pinctrl-0 =3D <&pinctrl_enet1>, <&pinctrl_enet1_rst>;
[ ... ]
> +	mdio {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <0>;
> +			reset-gpios =3D <&gpio5 11 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <20000>;
> +			reset-deassert-us =3D <80000>;
> +			vddio-supply =3D <&reg_phy_vddio>;
> +		};
> +
> +		ethphy1: ethernet-phy@1 {
> +			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <1>;
> +			reset-gpios =3D <&gpio4 3 GPIO_ACTIVE_LOW>;
> +			reset-assert-us =3D <20000>;
> +			reset-deassert-us =3D <80000>;
> +			vddio-supply =3D <&reg_phy_vddio>;
> +		};
> +	};
> +};
> +
> +&fec2 {
> +	pinctrl-names =3D "default","sleep";
> +	pinctrl-0 =3D <&pinctrl_enet2>, <&pinctrl_enet2_rst>;

[Severity: High]
Does ethphy1 fail to reset during the MDIO bus probe on fec1?

Since ethphy1 is a child of the fec1 MDIO bus, fec1 will attempt to toggle
its reset GPIO (&gpio4 3) when it probes. However, the pinctrl for this GPIO
(&pinctrl_enet2_rst) is attached to fec2 instead of fec1. Since fec2 has
not probed yet, the reset pin may not be muxed properly, preventing the res=
et
toggle from reaching the PHY and causing detection to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787314780.gi=
t.stefano.r@variscite.com?part=3D2
