Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707193;
	b=32XoJnfUOOfYkK7r5Aj8q4QQ4wPVM9a0dOfEei7gIavEJCwcig2Pfbusd914QsVm/Oy3
	 NO7fUGS3N0TucW2LrQFQDFK7ZcWjeMjVDN1BJkRdTasCtrvtYXXT+mk2IvENSxyBTf9Jt
	 Ce59drwkD9cVES4KWf84InANc5lKoAaU/GJ22MgJpi5GtxU8XXg2g78DRQn4wx/TP5bDf
	 IHASziLrIBOHhkl0Mti95j32p/wQNYFY/9APK7XwMnCpZeMbnB2gZZh0IWM3XVPbgNRDc
	 iBAPhesBZ8ZsTn1eeBilDhUeVXjNL6Y0pqVUFCSR9wZDvNrU99HI/XuUVwcoVsB2Mbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707193;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A3Ax0lwyOpCC0MDtRi1mKidzPU6SwPp2p+tk94ZfCDo=;
	b=Wtnw6CTCgcgM1QH0isM/WKqOTkK5ldKElJZminl+HUxfvoXjrawvyJ+yNwCf1HaI82uK
	 aBgrvVRsBI8P1+6HN2S5Fxwm8OGWTpbsf/aXOzVy+uKY9OnQ4sP/sDxVkuANh/SOD6Y4J
	 gB1PWhu+ZUrWmQYdmLzfBGW5AwSM5ImF5CEwg5HvnYsWhiEQV1itbo9hnyMYELEYWq7Zw
	 tcyJktULps3yoGzoGeW1/84A76opqmU/412d8UcMPBogT/wvBS3cXo73EeimD/Ds+Ig8H
	 LFlhOMM5MI3Z4UQ8/+Yngx5VruzgPbf8+d+oOwRpB7DsoT7+QRUNSa+KeP6Onfz6CIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cBVi354s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CD8606A321;
	Thu, 26 Nov 2026 15:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cBVi354s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F3C1F000C6;
	Thu, 26 Nov 2026 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707193;
	bh=A3Ax0lwyOpCC0MDtRi1mKidzPU6SwPp2p+tk94ZfCDo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cBVi354sryH0oArg7cqjMSvPLkGejS+SMaCGc4zGUlTMEN7wLWrEciVDIRx9/Ap4R
	 blEQrRDbOW8DcJA2TBt+Ut5CyWXXHOoKjSZk8KECmSHMyTYKqhK0WzVQPu+aLo9lIn
	 bkJx+qf00BP5mldVMNKyb2PEnCBXpL551Xr4p4cUeL4CEJwhm7K9x19hR8TUhBJnVF
	 IKym9DQG1Tad28Mejgxr+0hg+IXekVc9vh0NNU2TBZfOnBDpS6vSiPhMAG/858dT2q
	 tVSdmC4OZZ7eugKtEC7wHFIq0GrD+OvqQAaViHcgN7uNvEbIeYT9x1zMGMICtIApTc
	 JwAhv6JvzF2Xw==
Message-ID: <sashiko-outbox-235805@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] arm64: dts: imx95-phyflex-libra-rdk: Add
 phyFLEX-i.MX 95 Libra RDK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Hahn" <B.Hahn@phytec.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261126-wip-bhahn-imx95_upstreaming-v3-2-a2bda009bac8@phytec.de>
References: <20261126-wip-bhahn-imx95_upstreaming-v3-0-a2bda009bac8@phytec.de>
 <20261126-wip-bhahn-imx95_upstreaming-v3-2-a2bda009bac8@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 15:33:12 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] arm64: dts: freescale: missing OF graph ports on M.2 connectors
  disable radios
- [Medium] arm64: dts: imx95-phyflex-libra-rdk: descending
  cooling-levels breaks pwm-fan
- [Low] arm64: dts: freescale: custom aliases in
  imx95-phyflex-fpsc-g-som.dtsi
- [Low] arm64: dts: imx95-phyflex-libra-rdk: deprecated clock name and
  dummy regulator
--

commit 344d2e7761b7f7fe50aadecc9f7055eddf8720b0
Author: Benjamin Hahn <B.Hahn@phytec.de>

arm64: dts: imx95-phyflex-libra-rdk: Add phyFLEX-i.MX 95 Libra RDK

This commit adds devicetree support for the PHYTEC phyFLEX-i.MX 95 FPSC
Gamma SoM and the phyFLEX Libra RDK baseboard.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi =
b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi
> new file mode 100644
> index 0000000000000..2611f6ee5a1b7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi
> @@ -0,0 +1,746 @@
[ ... ]
> +	aliases {
> +		/* FPSC alias definitions */
> +		ethernet1 =3D &enetc_port1;
> +		ethernet2 =3D &enetc_port0;
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		gpio2 =3D &gpio3;
> +		gpio3 =3D &gpio4;
> +		gpio4 =3D &gpio5;
> +		i2c1 =3D &lpi2c2;
> +		i2c2 =3D &lpi2c5;
> +		i2c3 =3D &lpi2c3;
> +		i2c4 =3D &lpi2c4;
> +		i2c5 =3D &lpi2c1;
> +		pcie1 =3D &pcie0;
> +		pcie2 =3D &pcie1;
> +		pwm1 =3D &tpm3;
> +		pwm2 =3D &tpm5;
> +		sai1 =3D &sai5;
> +		serial1 =3D &lpuart8;
> +		serial2 =3D &lpuart5;
> +		serial3 =3D &lpuart7;
> +		spi1 =3D &lpspi7;
> +		spi2 =3D &lpspi3;
> +		spi3 =3D &lpspi4;
> +		usb1 =3D &usb3;
> +	};

[Severity: Low]
Should custom non-standard aliases such as pcie1, pcie2, pwm1, pwm2,
sai1, and usb1 be dropped from /aliases?

Devicetree sources only allow established subsystem-generic aliases, and
pcie1 =3D &pcie0 / pcie2 =3D &pcie1 also conflict with the 0-based
linux,pci-domain values (<0> and <1>) defined on pcie0 and pcie1 in
imx95.dtsi.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts b/=
arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts
> new file mode 100644
> index 0000000000000..0f44d7f99707d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts
> @@ -0,0 +1,576 @@
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
Without OF graph ports linking m2-key-e-connector and m2-key-m-connector
to their host interfaces, does pwrseq_pcie_m2_probe() leave the M.2 Key-E
radios permanently disabled?

When pwrseq_pcie_m2_probe() binds to m2-key-e-connector, it requests
w-disable1-gpios and w-disable2-gpios with GPIOD_OUT_HIGH, asserting both
active-low disable lines.  Because neither the connectors nor pcie0_port0
and pcie1_port0 define OF graph endpoints, slot_pwrctrl_probe() sees
of_graph_is_present() as false and pwrseq_pcie_m2_match() never matches a
consumer to deassert w-disable1-gpios or w-disable2-gpios.

Connecting port@0 (PCIe) between the M.2 connectors and
pcie0_port0/pcie1_port0 in the base DTS does not claim lpuart8 as a
serdev (which only happens when port@3 is linked), while connecting
port@3 to lpuart8 in the Bluetooth overlay allows btnxpuart and the power
sequencer to deassert w-disable2-gpios when Bluetooth is enabled.

> +
> +	uart1_bt_rs_mux: mux-controller-uart1 {
> +		compatible =3D "gpio-mux";
> +		#mux-control-cells =3D <0>;
> +		mux-gpios =3D <&gpio_expander1 14 GPIO_ACTIVE_HIGH>;
> +		idle-state =3D <0>;
> +	};
> +
> +	osc_mclk: oscillator-mclk {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <19200000>;
> +
> +		status =3D "disabled";
> +	};
> +
> +	osc_mclk_gated: oscillator-mclk-gated {
> +		compatible =3D "gpio-gate-clock";
> +		#clock-cells =3D <0>;
> +		clocks =3D <&osc_mclk>;
> +		enable-gpios =3D <&gpio_expander1 8 GPIO_ACTIVE_HIGH>;
> +
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
> +		fan-supply =3D <&reg_vdd_5v0>;
> +		pwms =3D <&tpm5 3 86958 0>;
> +		pulses-per-revolution =3D <2>;
> +	};

[Severity: Medium]
Does configuring pwm-fan with descending cooling-levels =3D <255 166 96 0>
and a pull-down (0x51e) on IMX95_PAD_GPIO_IO26__TPM5_CH3 cause the fan to
run at 100% speed during system suspend and after shutdown?

At cooling state 3 (level 0), set_pwm() calls pwm_fan_power_off(), which
disables the TPM5_CH3 output driver so the pad pull-down pulls the
inverted fan input low (full speed).  Because reg_vdd_5v0 is always on,
pwm_fan_suspend() and pwm_fan_cleanup() enter that same disabled PWM
state on suspend, shutdown, or unbind and spin the fan at 100% speed.

In addition, pwm_fan_probe() starts at initial_pwm =3D 0 and skips enabling
the PWM and fan-supply, and pwm_fan_update_state() assumes cooling-levels
is in ascending order (`if (pwm < ctx->pwm_fan_cooling_levels[i + 1])
break;`), so writing to pwm1 or pwm1_enable corrupts ctx->pwm_fan_state
and causes pwm_fan_set_cur_state() to skip thermal state transitions.
Configuring IMX95_PAD_GPIO_IO26__TPM5_CH3 with a pull-up (0x31e),
PWM_POLARITY_INVERTED, and ascending cooling-levels with a non-zero
minimum (such as <1 89 159 255>, as on imx95-19x19-evk.dts) keeps the fan
off when disabled and preserves ascending state order.

> +
> +	reg_usb3_phy: regulator-usb-vbus {
> +		compatible =3D "regulator-fixed";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-name =3D "usb3-phy-dummy";
> +	};

[Severity: Low]
This isn't a runtime bug, but there are a few devicetree binding and
cleanup issues in this file:

1. reg_usb3_phy defines a dummy regulator ("usb3-phy-dummy") only to
populate vbus-supply on &usb3_phy; vbus-supply is optional in
fsl,imx8mq-usb-phy.yaml and VBUS is already supplied by reg_vdd_vbus on
the usb-c-connector node, so reg_usb3_phy and vbus-supply on &usb3_phy
can be dropped.

2. fixed-clock.yaml deprecates node names not matching
^clock-([0-9]+|[a-z0-9-]+)$, so oscillator-mclk above should be named
clock-mclk.

3. &flexspi1 below repeats pinctrl-0 and pinctrl-names already defined in
imx95-phyflex-fpsc-g-som.dtsi, and the dt-bindings/mux/mux.h and
dt-bindings/pwm/pwm.h includes at the top of this file are unused
(unless PWM_POLARITY_INVERTED from pwm.h is used for the fan node).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-wip-bhahn-=
imx95_upstreaming-v3-0-a2bda009bac8@phytec.de?part=3D2
