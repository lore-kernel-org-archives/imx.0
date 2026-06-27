Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005D43BB673;
	Sat, 27 Jun 2026 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782572448; cv=none; b=FAEsqvlw2+DSyh7wdYsMZUY8ZOBCrOBWfVflXSGjjNTdu2r4FEwYdEHkLgLNcRvufl/AtcJ0uxa3RjgxaDweJsiEwPYDYMEGY9K909yu+Ce6kx8ofkbCbl9HBU7GU7sr2vnUctP6jhppLT88qH4aV6OjjuTmIcn068MlRl7TnCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782572448; c=relaxed/simple;
	bh=956UaQ8wk6PA1AUAewo3GkxQFXRL7E2xvUa/sGNXhaI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SUIs/jXMUbtEtGSJj+9sHTiwnfIC2VaaLP7ZoNbvdle10XiqZf+j1JJudLBqfpS40DRg4CDzeLyJI9BTOVyuCjZ+L5G1NFtGANP0eJTSJKLquF+foqUBtuV/Dvfq9QbjbneZYu/syZYoq6Tlzd5uBKTzYfwcna+pPun0TsVGtFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gsr+PBPc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gsr+PBPc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9A91F000E9;
	Sat, 27 Jun 2026 15:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782572443;
	bh=0RbWgaOi1yWwhMT1EQoDJ8K4OF97lNzZ7KUDExFQJMM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gsr+PBPcyxRXI3cVSVwaKzbqoclitr6kEryNpLVr68KasgINHGmOdfI+d+Dpcqcbj
	 Yaqn06O7xlMCz1HLNZmahLuN6XwHqcj6+dlcLdCFUs3q/lfXo5nEJzmQ+Koyfm3JGS
	 2V2gVUpBp1uT6mG3WGVYT++EMEzYR0WCAFUH5RpZmIVnq4w2RY1aciN54aIe9Khf0S
	 GxaRQPvGWiu9sz0aloocwuCTscIKFj+NPgbcxAJNJTASuarDYOaN2Mq/PZkpFPnX6v
	 5NpG2y6fBgCZs1bdrB3fLKsV/r/TJJFOnVKY2klYjLzBLCN18BAv+1sH3H3JD2FQFX
	 7qM0XXxSPghwA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX8M-MINI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <17f248241982c2d421e83475d7e0f8b61ba50198.1782571383.git.stefano.r@variscite.com>
References: <cover.1782571383.git.stefano.r@variscite.com>
 <17f248241982c2d421e83475d7e0f8b61ba50198.1782571383.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Jun 2026 15:00:42 +0000
Message-Id: <20260627150042.8F9A91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Simultaneous assertion/deassertion of Wi-Fi power enable and res=
et pins in `wifi_pwrseq`, violating typical SDIO Wi-Fi power sequencing req=
uirements.
- [Medium] Bluetooth GPIOs configured in `pinctrl_bt` are not assigned to o=
r claimed by the Bluetooth device node, leaving them as unmanaged floating =
inputs.
- [Medium] WM8904 codec configuration contains contradictory settings blind=
ly copied from binding examples, likely breaking microphone functionality.
--

commit 4642338fef518c3eba73b9681507dd2dd37ee845
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI

Add device tree support for the Variscite DART-MX8MM system on module.
This SOM is designed to be used with various carrier boards. Only
SOM-specific peripherals are enabled by default.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-mini/dart-m=
x8m-mini/

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8mm-var-dart.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi

[ ... ]

> +	sound-wm8904 {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,bitclock-master =3D <&codec_dai>;
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,frame-master =3D <&codec_dai>;
> +		simple-audio-card,mclk-fs =3D <256>;
> +		simple-audio-card,name =3D "wm8904-audio";
> +		simple-audio-card,routing =3D
> +			"Headphone Jack", "HPOUTL",
> +			"Headphone Jack", "HPOUTR",
> +			"IN2L", "Line In Jack",
> +			"IN2R", "Line In Jack",
> +			"IN1L", "Microphone Jack",
> +			"IN1R", "Microphone Jack";

[Severity: Medium]
Is this analog microphone routing missing a connection to MICBIAS?

The simple-audio-card,routing property routes the Microphone Jack to the
codec's analog inputs (IN1L/IN1R), but without a connection to the codec's
MICBIAS pin, the analog microphone will likely not receive the required bias
voltage to function.

> +		simple-audio-card,widgets =3D
> +			"Microphone", "Microphone Jack",
> +			"Headphone", "Headphone Jack",
> +			"Line", "Line In Jack";

[ ... ]

> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		post-power-on-delay-ms =3D <100>;
> +		power-off-delay-us =3D <10000>;
> +		reset-gpios =3D <&gpio2 10 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
> +			      <&gpio2 20 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
> +	};

[Severity: Medium]
Does grouping both the power enable and reset pins in this single reset-gpi=
os
array violate SDIO Wi-Fi power sequencing requirements?

The mmc-pwrseq-simple driver toggles all GPIOs in the reset-gpios array
simultaneously. During power-on, the Wi-Fi chip's power enable and reset li=
nes
will be driven high at the exact same moment.

Standard Wi-Fi power sequencing typically requires the power supply to be
fully ramped and stable before the reset line is released.

[ ... ]

> +&i2c3 {
> +	clock-frequency =3D <100000>;
> +	pinctrl-names =3D "default", "gpio";
> +	pinctrl-0 =3D <&pinctrl_i2c3>;
> +	pinctrl-1 =3D <&pinctrl_i2c3_gpio>;
> +	scl-gpios =3D <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios =3D <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status =3D "okay";
> +
> +	wm8904: audio-codec@1a {
> +		compatible =3D "wlf,wm8904";
> +		reg =3D <0x1a>;

[ ... ]

> +		/* GPIO1 =3D DMIC_CLK, don't touch others */
> +		wlf,gpio-cfg =3D <0x0018>, <0xffff>, <0xffff>, <0xffff>;
> +	};
> +};

[Severity: Medium]
Does this digital microphone clock configuration contradict the analog audio
routing defined above?

Configuring GPIO1 as a digital microphone clock appears to be a direct copy
from the wlf,wm8904 binding example, but it contradicts the analog routing =
for
the Microphone Jack to IN1L/IN1R.

This might expose unintended side-effects by driving a digital clock out of
GPIO1 when it's not needed for an analog microphone setup.

[ ... ]

> +/* BT module */
> +&uart4 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_uart4>, <&pinctrl_bt>;
> +	assigned-clocks =3D <&clk IMX8MM_CLK_UART4>;
> +	assigned-clock-parents =3D <&clk IMX8MM_SYS_PLL1_80M>;
> +	uart-has-rtscts;
> +	status =3D "okay";
> +
> +	bluetooth_iw61x: bluetooth {
> +		compatible =3D "nxp,88w8987-bt";
> +	};
> +};

[Severity: Medium]
Are the Bluetooth GPIOs defined in pinctrl_bt missing their assignments her=
e?

The pinctrl_bt group defines GPIO2_IO6 and GPIO5_IO5 with floating pad
configurations (0xc1), and the parent uart4 node applies them. However,
because this bluetooth node doesn't map them to expected driver properties
(such as device-wakeup-gpios or host-wakeup-gpios), they are left as
unmanaged floating inputs.

If one of these acts as an enable or reset pin, floating inputs can cause
erratic behavior due to voltage drift.

> +/* WIFI */
> +&usdhc1 {
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_wifi>;
> +	pinctrl-1 =3D <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
> +	pinctrl-2 =3D <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
> +	bus-width =3D <4>;
> +	keep-power-in-suspend;
> +	mmc-pwrseq =3D <&wifi_pwrseq>;
> +	non-removable;
> +	status =3D "okay";
> +};

[Severity: Medium]
Should this node include a vmmc-supply linking to a regulator for the Wi-Fi
power enable?

Modeling WIFI_PWR_EN as a regulator-fixed assigned to vmmc-supply in this
usdhc1 node, while leaving only WIFI_RESET in the mmc-pwrseq-simple node,
would ensure the power sequencing is handled correctly.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782571383.gi=
t.stefano.r@variscite.com?part=3D2
