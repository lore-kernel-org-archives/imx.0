Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4565399358;
	Wed, 10 Jun 2026 09:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082815; cv=none; b=qn5FPXZAG5R1fGM996UVZjI2J9EtPiR+zJ3rqF+D6NeeNjM4gjGbyR67j1u6/13IgKb3TGmX/uW28FU9UYRMjx8QIDHyJslfPv+y2ZDya6nYhK1NpJ8b+oEvadzK7kJiGcx2i/KCjx7dR751gSYlfmbm0jhVy+GzvyqnVIUQ0Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082815; c=relaxed/simple;
	bh=c2seZj/4N1GpPRjt5SFIYdPB2GWxw4DeCRtxgP6VQh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=APDGKjEJYrLUJrrS3RUdSFfX4PQK5mLXkExFH4mxec0kj9657qKYOdvxokyH3EKSRHCHhFLVJHMbjxWZUccPnatIUE6QQ4hxLapy0hJZyaUMtgtySFnDxvBwDjkdqjDe4qEim+FDxEM02JjISW0gHyUpS1Oh20/NJXiVyd6f67o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DeAAxPI2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DeAAxPI2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3126C1F00893;
	Wed, 10 Jun 2026 09:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781082814;
	bh=5R9v0LrbDrEdT77CFp455h0GS9gPaJ+bryl8LTPspEo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DeAAxPI27pvbdphZ42brMgc/EhkSqbY6uJwYMHAMuEflbMQ4Dup64D+PKX6WJZ34X
	 8+j3thNBaqliJ3RmjBijXG7sOrUIfF7Tt4VYXN2YP6j2R8mCtt244Ub3AxfCzd0aE0
	 zjZUSqagjpSYECHI2l9pW4fe+iPSMhshU1rxtPndsSA37rUsQtNxhYiRi+EiCJWmNe
	 4thcwlK5WmeEB+tl/Q9ZLNNiivLXvsn5OyEjn/2sN5jFtbyAX9IUrXw6VqRNMl3Wa2
	 wvPz2QASVLXQqf8YwB1SSi3/iUVZijkUyHSy7wzXyo/u9NC3W5DwtJVDF8/owLwJfw
	 nsGuaTkSYJDog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX8M-MINI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <3b7987d3021b1f0e4c0730b5fdb5ea6b2a192c4b.1781024557.git.stefano.r@variscite.com>
References: <3b7987d3021b1f0e4c0730b5fdb5ea6b2a192c4b.1781024557.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 09:13:33 +0000
Message-Id: <20260610091334.3126C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Contradictory GPIO polarity in fixed regulator `reg_eth_phy` betwe=
en `enable-active-high` and `GPIO_ACTIVE_LOW`.
- [High] Simultaneous deassertion of power enable and reset in `wifi_pwrseq=
` violates hardware sequencing requirements.
- [Medium] The audio card hardcodes carrier-board-specific jacks in the SOM=
 .dtsi, violating the module separation described in the commit message.
- [Low] The `bluetooth` node is missing the necessary GPIO property assignm=
ents (`device-wakeup-gpios`, etc.) required to control the Bluetooth chip, =
despite the pins being configured in `pinctrl_bt`.
--

commit 9e70fb8b6cc043ee758ca5e7801e30846eec594b
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: Add support for Variscite DART-MX8M-MINI

Add device tree support for the Variscite DART-MX8MM system on module.
This SOM is designed to be used with various carrier boards.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-mini/dart-m=
x8m-mini/

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8mm-var-dart.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
> @@ -0,0 +1,559 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Common dtsi for Variscite DART-MX8M-MINI
[ ... ]
> +	reg_eth_phy: regulator-eth-phy {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_reg_eth_phy>;
> +		regulator-name =3D "eth_phy_pwr";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-enable-ramp-delay =3D <20000>;
> +		gpio =3D <&gpio1 7 GPIO_ACTIVE_LOW>;
> +		enable-active-high;
> +	};

[Severity: High]
Does the PHY power switch require an active-low or active-high signal?

The reg_eth_phy node uses GPIO_ACTIVE_LOW but also specifies
enable-active-high. Under the regulator framework, enable-active-high forces
the GPIO to be treated as active-high, overriding the GPIO_ACTIVE_LOW flag.

If the power switch requires an active-low signal, it might fail to enable
the PHY. If it requires an active-high signal, the GPIO_ACTIVE_LOW flag
seems misleading.

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
> +		simple-audio-card,widgets =3D
> +			"Microphone", "Microphone Jack",
> +			"Headphone", "Headphone Jack",
> +			"Line", "Line In Jack";

[Severity: Medium]
Should this routing and widget configuration be moved to the carrier board
device tree instead?

The commit message states that carrier board specific interfaces are left
disabled to be enabled in respective carrier board device trees. However,
this sound-wm8904 node hardcodes routing for physical jacks (Headphone, Line
In, Microphone) which normally reside on the carrier board.

Including this directly in the module's .dtsi forces all carrier boards to
inherit this exact jack topology.

[ ... ]
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		post-power-on-delay-ms =3D <100>;
> +		power-off-delay-us =3D <10000>;
> +		reset-gpios =3D <&gpio2 10 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
> +			      <&gpio2 20 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
> +	};

[Severity: High]
Does toggling these GPIOs simultaneously violate the hardware sequencing
requirements for the Wi-Fi chip?

Grouping both WIFI_RESET and WIFI_PWR_EN in the reset-gpios property of
mmc-pwrseq-simple causes the driver to toggle both lines at the exact same
moment.

Would it be safer to model the power enable signal as a vmmc-supply with a
startup-delay-us? This would allow the power rail to fully stabilize before
the reset line is released.

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

[ ... ]
> +&iomuxc {
> +	pinctrl_bt: btgrp {
> +		fsl,pins =3D <
> +			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6		0xc1
> +			MX8MM_IOMUXC_SPDIF_EXT_CLK_GPIO5_IO5		0xc1
> +		>;
> +	};

[Severity: Low]
Are we missing driver property assignments for these Bluetooth pins?

The pinctrl_bt group configures GPIO2_IO6 and GPIO5_IO5 with pull-ups
disabled (0xc1), and assigns them to the uart4 node. However, the
bluetooth_iw61x node does not assign these pins to any driver properties
(like device-wakeup-gpios).

Because the driver cannot manage them, does this leave the pins physically
floating, which could cause spurious wakeups or increased power consumption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781024557.gi=
t.stefano.r@variscite.com?part=3D2
