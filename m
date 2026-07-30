Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A006F380FCE;
	Thu, 30 Jul 2026 22:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785452192; cv=none; b=m4Q/OIot5dbtkjcLuTo8ebE+FOH/5yHFELAzG481hMECKwPdRwbcEIPXb3Yf3SsgpIkqCmhC7KZopWTAGvnApbqiHgs6feUsGEBxAwDJ6pDNqQb29swN0F27FF2Mqm13OMp9X0/iHF1yF+bhIqxwRxQiocH8p2JFFZQrXCzoKiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785452192; c=relaxed/simple;
	bh=QX2IIuMiCOWzd8pk3ZystqKOjj58uoG7vx6r9l9shVw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jfU7q6qWsbmv38lvBb3u1a1Ig3Z5krgT6PSGaq9Pi7NYdzX0xsbbtjESdxB+ZYLhR73pTDPlYEdwVOWbPF3k2bhRzTaI9AUEnBmTtoYVJjJAb9LFeSk6ii4D/07IS0RGx2XOVAtMxCAfCVianeOaKLKielM1b8FCo5WAkmHy2Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niUQCfDK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niUQCfDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988661F000E9;
	Thu, 30 Jul 2026 22:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785452191;
	bh=hEaNL3Az34kdOh5jqjGaOWGmKgSDrHb9AGJHoJfBpvc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=niUQCfDKpG4bY+Tg3rb3dUByAAqK38XF09LhnGx0ZR50JLJN5py+Vo4dzlTCDABCj
	 euPPBVuRyrT8AUoxLUNmyo+QR3QaFcBivFxH2ZppP3EJ6PyOeHgUEZhu1HnGTpjDJj
	 8qIvVuw/5Y0pY4y0CKXgLlxKSgFvkrZZe4av8BMXvVY9yXmC2+SQWEz1seah41F4vS
	 WhvMJYNy9zvz+T07DlJgTf/sEgfCDRT12Wt97zKbx2xRctf8q+OJW32R57R3xzpVqr
	 ddBoLaB8eMPo6u907AUbpkY0L1EVHduuKnC/7adviXJHj4cJTvxY7EekRNI07YvCj8
	 qmfIPKUYU7YcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 6/7] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260730224351.95006-6-marex@nabladev.com>
References: <20260730224351.95006-1-marex@nabladev.com>
 <20260730224351.95006-6-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 22:56:30 +0000
Message-Id: <20260730225630.988661F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] DT Node Collision and I2C Address Conflict for `io-expander@20` on=
 i.MX8M Plus.
- [Medium] Unreliable CAN controller initialization due to missing/floating=
 reset pin configuration.
--

--- Patch [6]: [PATCH v8 6/7] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for=
 Data Modul i.MX8M Mini and Plus eDM SBC ---
commit 3ad13178c36ef65c3e892b7d6366f879de8eeb81
Author: Marek Vasut <marex@nabladev.com>
arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for Data Modul i.MX8M Mini and Pl=
us eDM SBC

Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1
providing additional UARTs, CAN, PWM Beeper, I2C, SPI and GPIO breakout.
This adapter can be optionally populated onto the eDM SBC.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-mo=
dul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi
> new file mode 100644
> index 0000000000000..905db21d57c21
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1.dtsi

[ ... ]

> +&ecspi2 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +
> +	can_fio: can@0 {
> +		compatible =3D "microchip,mcp2515";
> +		reg =3D <0>;

[Severity: Medium]
The MCP2515 binding doesn't use reset-gpios. Does this require a gpio-hog to
take the device out of reset?

> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_can>;
> +		clocks =3D <&can_osc>;
> +		spi-max-frequency =3D <5000000>;
> +	};
> +};
> +
> +&i2c_feature {	/* Feature connector I2C */
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +
> +	gpio_feature: io-expander@20 {
> +		compatible =3D "nxp,pca9554";
> +		reg =3D <0x20>;

[Severity: High]
On the i.MX8M Plus base board, i2c_feature is an alias to i2c2, which alrea=
dy
has an LVDS GPIO expander at address 0x20 (gpiolvds: io-expander@20).

When this overlay is applied on the i.MX8M Plus baseboard, the DT compiler
will merge gpio_feature into gpiolvds. Will this silently overwrite critical
properties like gpio-line-names and interrupts, breaking LVDS panel power
control?

Is there a hardware I2C address collision between the LVDS expander and the
FIO1 expander on the Plus board?

> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_gpio_expander>;
> +		#gpio-cells =3D <2>;
> +		gpio-controller;

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-mo=
dul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
> new file mode 100644
> index 0000000000000..ad410db5f5b76
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1.dtso

[ ... ]

> +&iomuxc {
> +	pinctrl_can: can-feature-grp {
> +		fsl,pins =3D <
> +			/* CAN_INT# */
> +			MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25		0x400000d6
> +			/* CAN_RST# */
> +			MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26		0x6
> +		>;
> +	};

[Severity: Medium]
The CAN_RST# pin is muxed but lacks a gpio-hog to drive it as an output.

Will this leave the line floating or weakly pulled, leading to unreliable
CAN controller initialization?

> +
> +	pinctrl_gpio_expander: gpio-expander-feature-grp {
> +		fsl,pins =3D <
> +			/* GPIO4_IO27 */
> +			MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27		0x6
> +		>;
> +	};

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-over=
lay-edm-mod-imx8mm-fio1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-mo=
dul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
> new file mode 100644
> index 0000000000000..0eccb7f7c0a8c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm=
-mod-imx8mm-fio1.dtso

[ ... ]

> +&iomuxc {
> +	pinctrl_can: can-feature-grp {
> +		fsl,pins =3D <
> +			/* CAN_INT# */
> +			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10		0x400000d6
> +		>;
> +	};

[Severity: Medium]
The CAN_RST# pin configuration appears to be completely missing here.

Is the reset pin state undefined on the IMX8MP base board when this overlay
is applied?

> +
> +	pinctrl_gpio_expander: gpio-expander-feature-grp {
> +		fsl,pins =3D <
> +			/* GPIO4_IO27 */
> +			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27		0x6
> +		>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730224351.9500=
6-1-marex@nabladev.com?part=3D6
