Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5663F23A3;
	Tue,  9 Jun 2026 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996833; cv=none; b=YUxFi8axhaMKfeXXuOE1pbqtuiztoIkDhjWGxzX5bxVz3lYu/KAhGjm2h8VENij4C+akyxBfpQgdLpk0hflmX4RAAekQ7aOfhNeqJgGdoMHNjedT+/63UUWf7epLsL9NKxpWqshulENfZaIkRIfk+Dm5hj7+JgEGME2P1Q3PWqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996833; c=relaxed/simple;
	bh=EGpuywrMFvIJ/NR0ZmZWeiuZJWlFPn5br6T5L7tYaZs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YEjsfDhDlmknNkMrqMPzJlFPE7PEgs6Gnt3WLvJ0pOTNydL1Spf1fO52+sQ60Vlq+dZkQZi5Blt47BxMcfQ7/Sr1N5mVfagEmhPJR9LH1TLMgTPURRann1RUWQueXU5olIHMZxZ5NxExYANn0WlprPc2wwoyZiVpog3IMApO/xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFjRBxJh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFjRBxJh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF951F00893;
	Tue,  9 Jun 2026 09:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780996832;
	bh=GIAqmmytw0m86Q/bglfEZcFtWa9k3dE+R/Vo+FizQiQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TFjRBxJhSBdSzEGHAAPIZpbARSljmHbYfQNz3xyiEL6b5t7qq6rzQLMSdpgbtGaat
	 jmRk4M6Gvw6s1IlbibVYVTEiRbox62j6QhWJT8qumQytjdB+kXOsAAJ3PuwLQa41Kk
	 eNWxZsZmMyAn0PfwZK3bSxFzYn0Ik0WY6T1gnkrkWavchzuXEFtI0zhTIyiSa8LjeJ
	 U0h+ZGrQw5HtqzwXGPxLgwzpC7D+WU5f3ndoKnV1BGzoDEeAGVN6eeueK0ImppLyvf
	 hyb2CvcJE7Xzq/7/FZ3vX5tUpCsgju+JuaYPmdcTGc0qp0d+6U5BrHj8339gblZfte
	 sNVu2NIBias4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX8M-PLUS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <85af11e85dbb7cf5097d7c0ee567272ff6e87ec5.1780995737.git.stefano.r@variscite.com>
References: <85af11e85dbb7cf5097d7c0ee567272ff6e87ec5.1780995737.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 09:20:30 +0000
Message-Id: <20260609092031.2BF951F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The SAI3 audio clock is assigned a non-standard frequency of 11536=
000 Hz, which is highly likely a typographical error for 11289600 Hz.
- [Medium] Bluetooth wakeup and enable GPIOs (GPIO2_IO06, GPIO2_IO09) are c=
onfigured in pinctrl but never bound to the bluetooth driver, which breaks =
hardware sleep/wake signaling.
- [Low] The MX8MP_IOMUXC_SD2_WP__GPIO2_IO20 pin is configured in `pinctrl_e=
qos` but is never consumed by the Ethernet PHY or any regulator node, poten=
tially leaving the Ethernet PHY unpowered or unnecessarily reserving a pin.
--

commit e84f7acfef4ae4e4d84c5c3a27b481c085785d37
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: Add support for Variscite DART-MX8M-PLUS

Add device tree support for the Variscite DART-MX8MP system on module.
This SOM is designed to be used with various carrier boards. Only
SOM-specific peripherals are enabled by default.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8m-plus/dart-m=
x8m-plus/

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi b/arch/ar=
m64/boot/dts/freescale/imx8mp-var-dart.dtsi
> new file mode 100644
> index 0000000000000..a647a2e0ab94b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart.dtsi

[ ... ]

> +&sai3 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_sai3>;
> +	assigned-clocks =3D <&clk IMX8MP_CLK_SAI3>;
> +	assigned-clock-parents =3D <&clk IMX8MP_AUDIO_PLL1_OUT>;
> +	assigned-clock-rates =3D <11536000>;

[Severity: High]
Does this assigned clock rate contain a typo?

A frequency of 11536000 Hz does not map to any standard audio sample
rate (e.g., 11289600 Hz is standard for 44.1kHz * 256fs).

Could this cause the ALSA framework to operate the codec at an incorrect,
non-standard drift frequency, resulting in subtle pitch shifts or failing
to configure the audio PLL cleanly?

> +	clocks =3D <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>,
> +		<&clk IMX8MP_CLK_DUMMY>,

[ ... ]

> +/* BT module */
> +&uart4 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_uart4>, <&pinctrl_bt>;
> +	assigned-clocks =3D <&clk IMX8MP_CLK_UART4>;
> +	assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_80M>;
> +	uart-has-rtscts;
> +	status =3D "okay";
> +
> +	bluetooth_iw61x: bluetooth {
> +		compatible =3D "nxp,88w8987-bt";
> +	};

[Severity: Medium]
Should this node include the GPIO bindings required to utilize the pins
configured in pinctrl_bt?

The pinctrl_bt group configures GPIO2_IO06 and GPIO2_IO09, but this bluetoo=
th
node never references these pins via device-wakeup-gpios or reset-gpios.

Without the kernel driving or monitoring these lines, do we risk optimal
low-power state transitions failing and the system relying entirely on
implicit hardware pull-ups?

> +};

[ ... ]

> +&iomuxc {
> +	pinctrl_bt: btgrp {

[ ... ]

> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
> +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2
> +			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90

[ ... ]

> +			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
> +			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20					0x10

[Severity: Low]
Is the GPIO2_IO20 pin correctly reserved here?

This GPIO is configured in pinctrl_eqos but is never consumed by the Ethern=
et
PHY or any regulator node.

If it is genuinely unused on this module, should it be removed from the pin=
ctrl
to prevent incorrectly reserving a pin that should be left available for the
carrier board?

> +			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11				0x150
> +		>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780995737.gi=
t.stefano.r@variscite.com?part=3D2
