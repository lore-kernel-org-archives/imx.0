Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43273B3BF0;
	Mon,  8 Jun 2026 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929611; cv=none; b=Grua3sGWo+4ogBucJMgJ3thtCF7I7BGHuWISo4JpAvGW3ufgkhcFEE6GOrVmkxJzE7+ojxRo29sdtc7SsvF1uB6xfEcypbx855cjbta45Is3y4tPaAbNW5ImWiMLD2IC9bYKdDvpuTCP5yb+5JIQt25EtH33VjcKVT8pWlTxPq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929611; c=relaxed/simple;
	bh=pc5KgDDfBUpeSS+ethb+diBYBB7fvh0257nUv2wQ7Uk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hX1+bz8lmWGEFZk30TJlAiEkLP2rVUaFM3bEzZJK8UnrB4WTRxJIQ1WVU+p8XQsfEmQ39RXgHFs32h4qpnrAKbINreo3Q0kZCOT86aJX3javjgd1l6L54sYsUelLhu4vXxEILrgtmDaBPiJ4z7VUxum1mlcSnuhHeyvuRudG4xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSnltNVf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSnltNVf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406801F00893;
	Mon,  8 Jun 2026 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929610;
	bh=xxJFOLNTcjcr4KYGxInqQFoOAc8L/4p2jjmZkVRdyw0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eSnltNVfb+eUappQKZYkcyV88hNhVJbVHUdch6lhRz0KJacyDvNYJCJHWpo7/M7cd
	 u1KCin/M+MZdn1QT+5hX7f4s/CEWcUGn7w4UB5zC4oM1m99g6uivUTCPo7HL5gMrqY
	 LdK2cd2mdOLdcBMTmdNDWMt0ez+Jh6veoeCHh9Lpppd3eTrpNdpJVnc0qON3SsbHgS
	 2OgtAORa/2oQ1ojbVeEpDQd5jpcgMBb+m88GGi7QCqI79eTFUMRheIeHMyahE4j78L
	 YyrzSfCAP0XaE9cMN9dNap+xX0ZrZFnKlp4+Q4JpVHoPFIemp6ancDqftFiQs2CNng
	 RIPBSvSy8QhmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/4] arm64: dts: freescale: add initial device tree
 for TQMa8MPQS with i.MX8MP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com, Frank.Li@kernel.org
In-Reply-To: <20260608142144.564871-2-alexander.stein@ew.tq-group.com>
References: <20260608142144.564871-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 14:40:09 +0000
Message-Id: <20260608144010.406801F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Incorrect GPIO polarity for the DisplayPort bridge `reset-gpios`.
- [Medium] Missing `interrupts` property for the DisplayPort bridge, preven=
ting hardware Hot-Plug Detect (HPD) interrupts.
- [Medium] Missing high-speed capability flags on SD/eMMC nodes, causing fa=
llback to legacy speeds.
--

commit fb67de7a11b79a2d50aaec8dc9df977e8f195879
Author: Paul Gerber <paul.gerber@tq-group.com>

arm64: dts: freescale: add initial device tree for TQMa8MPQS with i.MX8MP

This adds support for the TQMa8MPQS module on the MB-SMARC-2 board.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi b/arch/a=
rm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi
> new file mode 100644
> index 0000000000000..9cff5bf9162a4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs.dtsi
[ ... ]
> +&i2c3 {
> +	clock-frequency =3D <384000>;
> +	pinctrl-names =3D "default", "gpio";
> +	pinctrl-0 =3D <&pinctrl_i2c3>;
> +	pinctrl-1 =3D <&pinctrl_i2c3_gpio>;
> +	scl-gpios =3D <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios =3D <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status =3D "okay";
> +
> +	dp_bridge: dp-bridge@f {
> +		compatible =3D "toshiba,tc9595", "toshiba,tc358767";

[Severity: Medium]
Since the DP_HPD_INT signal is routed to GPIO5_IO21 (as defined in the
dp-hpd-int-hog node), should this node include the interrupts and
interrupt-parent properties?

Without them, the driver will not register an IRQ handler for Hot-Plug
Detect events and will fall back to 10-second DRM polling.

> +		reg =3D <0xf>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_tc9595>;
> +		clock-names =3D "ref";
> +		clocks =3D <&clk_dp>;
> +		reset-gpios =3D <&expander0 4 GPIO_ACTIVE_HIGH>;

[Severity: High]
Does this leave the DP bridge permanently disabled?

The tc358767 driver initializes the reset GPIO with GPIOD_OUT_LOW
(logical 0), and returns it to logical 0 during normal operation after
pulsing it. Since the target hardware pin is an active-high enable
(DP_BRIDGE_EN), it must be physically HIGH during operation.

With GPIO_ACTIVE_HIGH, the driver's logical 0 translates to a physical LOW.
Should this use GPIO_ACTIVE_LOW instead to map the deasserted reset state
to a physical HIGH?

> +		toshiba,hpd-pin =3D <0>;
> +		status =3D "disabled";

[ ... ]

> +&usdhc2 {
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	bus-width =3D <4>;
> +	vqmmc-supply =3D <&reg_usdhc2_vqmmc>;

[Severity: Medium]
Will this node fall back to legacy 50MHz speeds despite having 200MHz
pinctrl states?

The MMC subsystem requires explicit capability properties (like
sd-uhs-sdr104) to negotiate higher speeds. Without them, the state_100mhz
and state_200mhz definitions will not be used.

> +	/* NOTE: CD / WP and VMMC support depends on mainboard */
> +};
> +
> +&usdhc3 {
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc3>;
> +	pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> +	bus-width =3D <8>;
> +	non-removable;
> +	no-sdio;
> +	no-sd;
> +	vmmc-supply =3D <&buck4>;
> +	vqmmc-supply =3D <&buck5>;

[Severity: Medium]
Similar to usdhc2, is this missing eMMC high-speed capability flags like
mmc-hs200-1_8v, mmc-hs400-1_8v, or mmc-hs400-enhanced-strobe?

Without these flags, the interface will operate at legacy speeds instead
of utilizing the 100MHz or 200MHz hardware capabilities.

> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608142144.5648=
71-1-alexander.stein@ew.tq-group.com?part=3D2
