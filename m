Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368804;
	b=OK2j3C7K7Q32mIIhDVHWjG/HnZZyNj9CLSz5yU57XFWD5bVLB5hPLvZBQltYxGgoCtXt
	 0POIa/ARS0x4Y2ROwlVveE+VveXcC495iMFmvjK28SBD1MZN1eR//F59BDQOfPArE84E7
	 s9kEYgYdiFCZGuYvXaQoxHF73UYiLbOeT1vXc0mBqSD9kJ1AmcRdwwZC2APTkWiwTn+82
	 LBDGJCxteMJCQa7eoLjpIvia138IN2xJAhi53qkeOkm1ZAkbfJ9eUm+9M1zK2I8Moz8g/
	 roPQce6/YO+gsTyrV0nqIRL8mb3Idx/F/bBXT2aKOAnlrjVzZdK6TM+W3d5lNG6S25Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368804;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vT6/7ipJEJAd6dPGly6FzWQtBousVWhJ8szBQKhsIog=;
	b=LZ4ZBkrg70OorqM9b/Fb0OAf+s6ONgFyHHGZUwgBuBcjIGz52iG8vgGpCyLOFOcX+utp
	 F5sJiUL2D3pew4r/i3iOve5HFFzoPA0YXRhmHUSkF35wNX9iHZWmPpwnzax9uNrcCpvEI
	 6hkTRTOr2vWm7QtJsIuxwyUyJIacMRseSDptB3zCq04SGQ3/x+evQ+ucyR7lU2FLHFeQl
	 5LKbkNk6ysVX+xaHFqHelj2nL4Yu4BU47phwDncfk2+dbRTbCEE/mFlsUhlM86hkqY67y
	 BdwmdPmjD9/OymABZTcsWeEeSQiPo/bwY3c5B97CkQXavM3v3YBOKzosb+pZFu16Uww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SkyUoxAP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518C5606A320;
	Fri, 30 Oct 2026 14:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SkyUoxAP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F251F000C1;
	Fri, 30 Oct 2026 14:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793368803;
	bh=vT6/7ipJEJAd6dPGly6FzWQtBousVWhJ8szBQKhsIog=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SkyUoxAP7fKbyRpePvYNVH0gyWdo4ZKBzil3OrXPvHeAz4tlRDe7YQUA+KHapL+CE
	 QUlizcemiIMyCT3bVsY71yHT68rU2zrYOMi0BVAIUlqGPIHVa3O/N2AqvGzkLt0LN5
	 ya5YeCYPArwBaOABuV2DhLJAwVO+VYe0/CxW4Ot5e+L+dA2BxSgmfNfIvXYcBbuIyZ
	 QXttBnG/pTK1nr94VXHcbsYatWqFKQe4MZWGaedop6jEOLYITEyTZ9FPEtb6eNGoVV
	 erv3GA8nk0jPW6e4c81ngoMupDzgP9Gq3vaYl9Ok6PV7HeBWOzEnGK3Nd1gM8qN03P
	 x6cJ4H+gpVnAA==
Message-ID: <sashiko-outbox-191084@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] dts: imx95-phyflex-libra-rdk: Add dts for
 phyFLEX-i.MX 95 Libra RDK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Hahn" <B.Hahn@phytec.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261030-wip-bhahn-imx95_upstreaming-v1-2-1c1cebb5be99@phytec.de>
References: <20261030-wip-bhahn-imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de>
 <20261030-wip-bhahn-imx95_upstreaming-v1-2-1c1cebb5be99@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 14:00:02 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] arm64: dts: freescale: duplicate usdhc2-200mhzgrp node overwrites =
usdhc2 pins
- [High] arm64: dts: freescale: missing OF graph ports on M.2 connectors di=
sables radios
- [High] arm64: dts: freescale: descending cooling-levels ending in 0 break=
s pwm-fan
- [Medium] arm64: dts: freescale: misplaced external-facing and wake-gpios =
on pcie0/pcie1
- [Medium] arm64: dts: freescale: stale gpio2 gpio-line-names collide with =
gpio_expander2
--

commit 01cb871eca78a3c506a85dce8f3e949939c4a0cb
Author: Benjamin Hahn <B.Hahn@phytec.de>

dts: imx95-phyflex-libra-rdk: Add dts for phyFLEX-i.MX 95 Libra RDK

This commit adds the device tree source files for the PHYTEC phyFLEX Libra
RDK baseboard (revision 1618.2) and phyFLEX-i.MX 95 FPSC Gamma SoM (revision
1620.3).

> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi =
b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi
> new file mode 100644
> index 0000000000000..4b37d76cced1b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi
> @@ -0,0 +1,736 @@

[ ... ]

> +&scmi_iomuxc {

[ ... ]

> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins =3D <
> +			IMX95_PAD_SD2_CD_B__USDHC2_CD_B		0x31e	/* CD */
> +			IMX95_PAD_SD2_CLK__USDHC2_CLK		0x158e	/* CLK */
> +			IMX95_PAD_SD2_CMD__USDHC2_CMD		0x138e	/* CMD */
> +			IMX95_PAD_SD2_DATA0__USDHC2_DATA0	0x138e	/* DATA0 */
> +			IMX95_PAD_SD2_DATA1__USDHC2_DATA1	0x138e	/* DATA1 */
> +			IMX95_PAD_SD2_DATA2__USDHC2_DATA2	0x138e	/* DATA2 */
> +			IMX95_PAD_SD2_DATA3__USDHC2_DATA3	0x138e	/* DATA3 */
> +			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> +		>;
> +		bootph-all;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins =3D <
> +			IMX95_PAD_SD3_CLK__USDHC3_CLK		0x159e	/* SDIO_CLK */
> +			IMX95_PAD_SD3_CMD__USDHC3_CMD		0x139e	/* SDIO_CMD */
> +			IMX95_PAD_SD3_DATA0__USDHC3_DATA0	0x139e	/* SDIO_DATA0 */
> +			IMX95_PAD_SD3_DATA1__USDHC3_DATA1	0x139e	/* SDIO_DATA1 */
> +			IMX95_PAD_SD3_DATA2__USDHC3_DATA2	0x139e	/* SDIO_DATA2 */
> +			IMX95_PAD_SD3_DATA3__USDHC3_DATA3	0x139e	/* SDIO_DATA3 */
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins =3D <
> +			IMX95_PAD_SD3_CLK__USDHC3_CLK		0x159e	/* SDIO_CLK */
> +			IMX95_PAD_SD3_CMD__USDHC3_CMD		0x139e	/* SDIO_CMD */
> +			IMX95_PAD_SD3_DATA0__USDHC3_DATA0	0x139e	/* SDIO_DATA0 */
> +			IMX95_PAD_SD3_DATA1__USDHC3_DATA1	0x139e	/* SDIO_DATA1 */
> +			IMX95_PAD_SD3_DATA2__USDHC3_DATA2	0x139e	/* SDIO_DATA2 */
> +			IMX95_PAD_SD3_DATA3__USDHC3_DATA3	0x139e	/* SDIO_DATA3 */
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins =3D <
> +			IMX95_PAD_SD3_CLK__USDHC3_CLK		0x159e	/* SDIO_CLK */
> +			IMX95_PAD_SD3_CMD__USDHC3_CMD		0x139e	/* SDIO_CMD */
> +			IMX95_PAD_SD3_DATA0__USDHC3_DATA0	0x139e	/* SDIO_DATA0 */
> +			IMX95_PAD_SD3_DATA1__USDHC3_DATA1	0x139e	/* SDIO_DATA1 */
> +			IMX95_PAD_SD3_DATA2__USDHC3_DATA2	0x139e	/* SDIO_DATA2 */
> +			IMX95_PAD_SD3_DATA3__USDHC3_DATA3	0x139e	/* SDIO_DATA3 */
> +		>;
> +	};

[Severity: High]
Should pinctrl_usdhc3_200mhz be named usdhc3-200mhzgrp instead of
usdhc2-200mhzgrp?

Because both pinctrl_usdhc2_200mhz and pinctrl_usdhc3_200mhz use the node
name usdhc2-200mhzgrp under &scmi_iomuxc, dtc merges them into a single
node and overwrites the SD2 fsl,pins array in pinctrl_usdhc2_200mhz with
the SD3 pins from pinctrl_usdhc3_200mhz.

When usdhc2 (which has sd-uhs-sdr104 enabled) switches to its state_200mhz
pinctrl state, it will attempt to claim the SD3 pads instead of configuring
the SD2 pads, breaking 200MHz SD card operation and conflicting with usdhc3.

Also, both pinctrl_usdhc2_200mhz and pinctrl_usdhc3_200mhz appear to use
100MHz pad settings (0x158e/0x138e and 0x159e/0x139e) rather than 200MHz
slew rate settings (such as 0x15fe/0x13fe used in pinctrl_usdhc1_200mhz).

> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts b/=
arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts
> new file mode 100644
> index 0000000000000..55d49f8109567
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts
> @@ -0,0 +1,558 @@

[ ... ]

> +	m2-key-m-connector {
> +		compatible =3D "pcie-m2-m-connector";
> +		clocks =3D <&rv3028>;
> +		i2c-parent =3D <&lpi2c5>;
> +		vpcie3v3-supply =3D <&reg_vdd_3v3>;
> +	};
> +
> +	m2-key-e-connector {
> +		compatible =3D "pcie-m2-e-connector";
> +		clocks =3D <&rv3028>;
> +		i2c-parent =3D <&lpi2c3>;
> +		sdio-reset-gpios =3D <&gpio_expander2 6 GPIO_ACTIVE_LOW>;
> +		sdio-wake-gpios =3D <&gpio_expander2 5 GPIO_ACTIVE_LOW>;
> +		uart-wake-gpios =3D <&gpio_expander1 13 GPIO_ACTIVE_LOW>;
> +		vpcie3v3-supply =3D <&reg_vdd_3v3>;
> +		w-disable1-gpios =3D <&gpio_expander1 9 GPIO_ACTIVE_LOW>;
> +		w-disable2-gpios =3D <&gpio_expander1 10 GPIO_ACTIVE_LOW>;
> +	};

[Severity: High]
Are the OF graph ports missing from m2-key-m-connector and
m2-key-e-connector?

When pwrseq_pcie_m2_probe() in drivers/power/sequencing/pwrseq-pcie-m2.c
probes m2-key-e-connector, it requests w-disable1-gpios and w-disable2-gpios
with GPIOD_OUT_HIGH, asserting the active-low W_DISABLE1# and W_DISABLE2#
lines and disabling the M.2 module's Wi-Fi and Bluetooth radios:

drivers/power/sequencing/pwrseq-pcie-m2.c:pwrseq_pcie_m2_probe() {
	...
	ctx->w_disable1_gpio =3D devm_gpiod_get_optional(dev, "w-disable1",
						       GPIOD_OUT_HIGH);
	...
	ctx->w_disable2_gpio =3D devm_gpiod_get_optional(dev, "w-disable2",
						       GPIOD_OUT_HIGH);
}

Those lines are only deasserted when a consumer matches via
pwrseq_pcie_m2_match(), which walks the connector's OF graph endpoints via
for_each_endpoint_of_node(ctx->of_node, endpoint). Without the ports nodes
linking m2-key-e-connector and m2-key-m-connector to the PCIe Root Ports,
UART, and SDIO controller (which are also required by
pcie-m2-e-connector.yaml and pcie-m2-m-connector.yaml), no consumer can
match and the radios remain permanently disabled.

> +	osc_mclk: oscillator-mclk {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <19200000>;
> +		status =3D "disabled";
> +	};
> +
> +	osc_mclk_gated: oscillator-mclk-gated {
> +		compatible =3D "gpio-gate-clock";
> +		#clock-cells =3D <0>;
> +		clocks =3D <&osc_mclk>;
> +		enable-gpios =3D <&gpio_expander1 8 GPIO_ACTIVE_HIGH>;
> +		status =3D "disabled";
> +	};
> +
> +	fan: pwm-fan {
> +		compatible =3D "pwm-fan";
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <4 IRQ_TYPE_EDGE_RISING>;
> +		#cooling-cells =3D <2>;
> +		/* startup 35%, duty cycle 30%-100%;
> +		 * polarity inversion does not appear to work
> +		 */
> +		cooling-levels =3D <255 166 96 0>;
> +		/* fan-supply =3D <&reg_vdd_5v0>;  probe fails with this set */
> +		pwms =3D <&tpm5 3 86958 0>;
> +		pulses-per-revolution =3D <2>;
> +	};

[Severity: High]
Will cooling-levels =3D <255 166 96 0> turn the fan off when the thermal zo=
ne
reaches its highest temperature trip point (trip4 at 75C)?

In drivers/hwmon/pwm-fan.c, __set_pwm() treats a PWM value of 0 as fan
power-off rather than driving a 0% duty cycle:

drivers/hwmon/pwm-fan.c:__set_pwm() {
	...
	if (pwm > 0) {
		...
		state->duty_cycle =3D DIV_ROUND_UP(pwm * (period - 1), MAX_PWM);
		ret =3D pwm_apply_might_sleep(ctx->pwm, state);
		if (ret)
			return ret;
		ret =3D pwm_fan_power_on(ctx);
	} else {
		ret =3D pwm_fan_power_off(ctx, false);
	}
	...
}

When cooling state 3 selects cooling-levels[3] =3D=3D 0, pwm_fan_power_off(=
) sets
state->enabled =3D false. In drivers/pwm/pwm-imx-tpm.c, pwm_imx_tpm_apply_h=
w()
disables the TPM5_CH3 output driver when state->enabled is false, allowing =
the
pad pull-up on IMX95_PAD_GPIO_IO26__TPM5_CH3 (0x51e) to pull the inverted P=
WM
line high and stop the fan at 75C.

Additionally, pwm_fan_probe() sets the initial state to
cooling_levels[pwm_fan_max_state] (0), so the PWM channel is not enabled at
boot, and pwm_fan_update_state() expects cooling-levels to be ordered in
ascending order. Using a non-zero minimum value (such as 1) or configuring
active-high/inverted PWM handling would avoid disabling the channel at stat=
e 3.

[ ... ]

> +&gpio2 {
> +	gpio-line-names =3D "", "", "", "", "",
> +			  "", "", "", "", "",
> +			  "", "", "", "", "",
> +			  "", "RGMII2_nINT", "GPIO4", "RTC_INT", "",
> +			  "LVDS1_BL_EN";
> +};
> +
> +&lpi2c1 {
> +	temperature-sensor@4f {
> +		compatible =3D "nxp,p3t1755";
> +		reg =3D <0x4f>;
> +		vs-supply =3D <&reg_vdd_1v8>;
> +	};
> +};
> +
> +&lpi2c3 {
> +	status =3D "okay";
> +
> +	gpio_expander2: gpio@21 {
> +		compatible =3D "ti,tcal6416";
> +		reg =3D <0x21>;
> +		interrupt-parent =3D <&gpio2>;
> +		interrupts =3D <17 IRQ_TYPE_LEVEL_LOW>;
> +		#interrupt-cells =3D <2>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		gpio-line-names =3D "CAN1_STBY", "CAN2_STBY", "NC",
> +				  "KEY-E_nALERT", "KEY-M_nALERT",
> +				  "SDIO_nWAKE", "SDIO_nRESET", "HDMI_EN",
> +				  "RTC_nINT", "LVDS1_BL_EN", "SFP_TX_FAULT",
> +				  "SFP_TX_DISABLE", "SFP_MOD_ABS", "SFP_RS0",
> +				  "SFP_RX_LOSS", "SFP_RS1";

[Severity: Medium]
Should the &gpio2 gpio-line-names override in imx95-phyflex-libra-rdk.dts be
dropped?

On the SoM (imx95-phyflex-fpsc-g-som.dtsi), GPIO2 lines 18 and 20 are muxed=
 to
SPI3_CS and SPI3_MOSI for lpspi4, while on the baseboard RTC_nINT and
LVDS1_BL_EN are on gpio_expander2 lines 8 and 9. Keeping "RTC_INT" and
"LVDS1_BL_EN" on &gpio2 duplicates the "LVDS1_BL_EN" line name and causes
userspace lookups by name to match gpio2 line 20 instead of gpio_expander2
line 9.

[ ... ]

> +/* M.2 Key-E PCIe */
> +&pcie0 {
> +	external-facing;
> +	supports-clkreq;
> +	wake-gpios =3D <&gpio_expander1 11 GPIO_ACTIVE_LOW>;
> +	status =3D "okay";
> +};
> +
> +&pcie0_port0 {
> +	reset-gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>;
> +	vpcie3v3-supply =3D <&reg_vdd_3v3>;
> +};
> +
> +/* M.2 Key-M PCIe */
> +&pcie1 {
> +	external-facing;
> +	supports-clkreq;
> +	wake-gpios =3D <&gpio_expander1 12 GPIO_ACTIVE_LOW>;
> +	status =3D "okay";
> +};
> +
> +&pcie1_port0 {
> +	reset-gpios =3D <&gpio1 14 GPIO_ACTIVE_LOW>;
> +	vpcie3v3-supply =3D <&reg_vdd_3v3>;
> +};

[Severity: Medium]
Should external-facing and wake-gpios be placed on &pcie0_port0 and
&pcie1_port0 rather than on &pcie0 and &pcie1?

In drivers/pci/of.c, pci_set_bus_of_node() only checks external-facing when
bus->self is non-NULL (reading from the Root Port node rather than the host
bridge node), and pci_configure_of_wake_gpio() requests wake-gpios from the
enumerated pci_dev's OF node (&pcie0_port0 and &pcie1_port0). The
fsl,imx6q-pcie.yaml binding also only allows pci-pci-bridge.yaml properties
like external-facing and wake-gpios on the Root Port child node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-wip-bhahn-=
imx95_upstreaming-v1-0-1c1cebb5be99@phytec.de?part=3D2
