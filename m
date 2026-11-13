Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588152;
	b=JbvS3NtGbUuwWaKLC4JxAPYUHvSEGTrDONWIJ7H7O1CXzo9gCDdBhdr+InFjZb7wC5P0
	 Kq5UhTqSJryoIinEK/lh3nhfU0qKhiSwR1SVqUzuElMQg/1Z1IpG2vkK0J3UWYkyduVFh
	 O2p4aoddUtLUHh1ZYFz8y7nFE5VD47zqK3/EOoACk6FWuQO5317EQKuu46BYh/FRos1VP
	 ihI0tfhHAnO87lPX3RXLiQeG8nylhTMCp145YIv9YmQtDELwrfIk/Xh5VeIxUmShIAUXg
	 h4hXiuygzOrohrJdUAoze9bxwYLlcIE3b/6FjOYjbjmiuTtYcfSOgje8ru+mZOlKFcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588152;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=m/PpC4O3NzjAavCAj87Bv2LPOvh9Te54rBz9fHCqCGE=;
	b=CbpBe+e8nA69tQaO/bENtx/9fbIkd6XDGWnTnbqehQIVlsEVqxhUyccFDlxQu0WCskaD
	 /sRXbo16632qTrORume+C1EVKHidgt3VmDwFoWv4mgzynuUsoDXwTmFaFrJtNDboPvsOr
	 OkEkecAE9WjC+2nr/72YLDkIbJBLDXTfAh6D5OiJcrzn/WNty4mI5VVr/kTlruJ6G6sAl
	 9Wni5sB4frN8qV/QA097cdqhksdU2jwfMcyv3wYsRtwYt/0LxSkur35qj8VlX49LrKgTM
	 ZRcxR4iXFwTRhFb/o7RQMw8eGX5MHrZmTUnrHwSGECctNlZ954SqyealXRLnE0WMFNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cg7ZwTKz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A999D6073F66;
	Fri, 13 Nov 2026 16:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cg7ZwTKz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B88A1F000C9;
	Fri, 13 Nov 2026 16:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588152;
	bh=m/PpC4O3NzjAavCAj87Bv2LPOvh9Te54rBz9fHCqCGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cg7ZwTKzaL5cIghRSQIAmUB1l2GCAW2rXSTKzHi9SiGYeQuOlMGpXkT7uE5PT2/W3
	 yzLLZnpw/b/Vu+YzxNu7PFMNJKGPAoexQG6oJiSJTECpFlukpwypsJnaGlm6SUgwqY
	 EddF/XrR5eaeKYAgrd3mxk4rEN7hhquh+rwg+/+IYhQ23pC7yoqc3QO0iMyhl1cRHL
	 v/7myZBX4tgFETu7qGM00lpohIPJgkbBZyvA+LQExLHSWLxyV9XFM2xYP4sRwIcVPv
	 3zKF8HWpiV9ckP6W8Mu8/lcff4WoGjBz4ciMFZ5pYBrBx+IlUsnPhdSjtqBH2r89PF
	 j7NCmg7tbJAGA==
Message-ID: <sashiko-outbox-213219@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: imx95-phyflex-libra-rdk: Add
 phyFLEX-i.MX 95 Libra RDK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Hahn" <B.Hahn@phytec.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261113-wip-bhahn-imx95_upstreaming-v2-2-3ef58af5e689@phytec.de>
References: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
 <20261113-wip-bhahn-imx95_upstreaming-v2-2-3ef58af5e689@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 16:42:31 +0000
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
- [High] arm64: dts: freescale: usb2 missing dr_mode, vbus-supply, and
  pinctrl_usb2
- [Medium] arm64: dts: freescale: eeprom@58 uses 4 KiB 24c32 compatible
  for 32B ID page
- [Medium] arm64: dts: imx95-phyflex-libra-rdk: descending
  cooling-levels breaks pwm-fan
--

commit 831b01c8ff6e8f1f1ec13e354da0a278c7f495db
Author: Benjamin Hahn <B.Hahn@phytec.de>

arm64: dts: imx95-phyflex-libra-rdk: Add phyFLEX-i.MX 95 Libra RDK

This commit adds device tree support for the PHYTEC phyFLEX-i.MX 95 FPSC
Gamma SoM and the phyFLEX Libra RDK baseboard.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi =
b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi
> new file mode 100644
> index 0000000000000..7cc4fa0104c36
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som.dtsi

[ ... ]

> +	/* User EEPROM ID page */
> +	eeprom@58 {
> +		compatible =3D "atmel,24c32";
> +		reg =3D <0x58>;
> +		pagesize =3D <32>;
> +		vcc-supply =3D <&reg_nvcc_aon>;
> +	};

[Severity: Medium]
Should eeprom@58 use compatible =3D "atmel,24c32d-wl" (or specify size =3D =
<32>)
instead of "atmel,24c32"?

"atmel,24c32" registers a 4096-byte NVMEM device for the 32-byte
identification page, so reads past 32 bytes wrap around and writes at
offsets >=3D 0x400 set address bit A10, which permanently locks the
identification page on M24C32-D devices.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts b/=
arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts
> new file mode 100644
> index 0000000000000..ccd05932e9557
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk.dts

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
Are m2-key-m-connector and m2-key-e-connector missing OF graph ports linking
them to pcie1_port0 and pcie0_port0?

When pwrseq_pcie_m2_probe() binds to m2-key-e-connector, it requests
w-disable1-gpios and w-disable2-gpios with GPIOD_OUT_HIGH, holding both
active-low disable lines asserted.  Because neither the connector nodes nor
pcie0_port0 and pcie1_port0 define OF graph endpoints, slot_pwrctrl_probe()
and pwrseq_pcie_m2_match() never match the PCIe consumers to enable the
sequencers and deassert W_DISABLE1#.

[ ... ]

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

[Severity: Medium]
Does using descending cooling-levels =3D <255 166 96 0> with normal PWM
polarity break pwm-fan suspend/shutdown and cooling state tracking?

On suspend and shutdown, pwm_fan_power_off() disables TPM5_CH3, which lets
the 0x51e pad pull-down on IMX95_PAD_GPIO_IO26__TPM5_CH3 pull the inverted
fan control line low and spin the fan at 100%.  In addition,
pwm_fan_update_state() assumes cooling-levels is sorted in ascending order
(pwm < ctx->pwm_fan_cooling_levels[i + 1]), so writing pwm1 or pwm1_enable
via sysfs records the wrong cooling state and causes pwm_fan_set_cur_state()
to skip thermal transitions.

Using PWM_POLARITY_INVERTED with ascending levels and a non-zero off state
(such as cooling-levels =3D <1 96 166 255>) or a pull-up on
IMX95_PAD_GPIO_IO26__TPM5_CH3 avoids disabling the output into a pull-down.

[ ... ]

> +&usb2 {
> +	disable-over-current;
> +	status =3D "okay";
> +};

[ ... ]

> +&usbphynop {
> +	vbus-supply =3D <&reg_vdd_5v0>;
> +};

[Severity: High]
Is usb2 missing dr_mode =3D "host", pinctrl_usb2, and its VBUS supply?

Without dr_mode, ci_get_platdata() defaults to USB_DR_MODE_OTG, and because
no ID pin or role switch is wired to usb2, ci_hdrc_otg_fsm_init() leaves the
controller in peripheral B-idle mode instead of host mode.  Furthermore,
fsl,imx95-usb does not set CI_HDRC_PHY_VBUS_CONTROL, so ehci_ci_portpower()
only controls vbus-supply on &usb2, while placing vbus-supply =3D <&reg_vdd=
_5v0>
on &usbphynop causes usb_phy_gen_create_phy() to claim reg_vdd_5v0 via
devm_regulator_get_exclusive() and block other consumers such as pwm-fan.
Finally, pinctrl_usb2 in imx95-phyflex-fpsc-g-som.dtsi is never referenced.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-wip-bhahn-=
imx95_upstreaming-v2-0-3ef58af5e689@phytec.de?part=3D2
