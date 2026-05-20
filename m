Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20280373BF2;
	Wed, 20 May 2026 11:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278359; cv=none; b=ubSPuOoOZeP1W3uRBhaNuHxpH4cv/7cCl6dDW0f5U/jFfrOC698ZrqrMpyFt12fJ8RPX0sKTcw6bCh0rfAWzJICWiPt7UoYdoFxFKfwNffkWK5UOn/tFS7JsZNtJL/XYb/X8oUrj0SwHHLsQYQqhOBh3e39drhlHGpjiYT+mlkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278359; c=relaxed/simple;
	bh=1S++i96JDFQjS97dK4xYoTMS0qYDHU5MteH1/znkST0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t6vA8fG5LqZnEL6CPQpK2JBtc5CFApoKeg+tA8U+z1BIGOt8u+hlYCNBGyd9OxyMSX2mLi7U18AY3u9MzJo7KcTpHWpimWoDdzkSf/lQkJ2hdV2BK6MvhzRxrttjCrXo8FnU5KfFdOqAKB814j8N1U/EGKBTx0dJkq7qsP+23oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/YMjFhn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/YMjFhn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8521F000E9;
	Wed, 20 May 2026 11:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779278357;
	bh=/JrQZaBwZX3lsxf2XAZJsTlzsnuZdkW7GF2WdgexCMw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z/YMjFhnkoBfsIGGTlk66ItiybL+2V9ptHEBFzljMnSPO3ovydffwb7nCIpSig5ZF
	 cXDHn8vQCEk/ShPb95yMfyuXWpyud4KmzKPWZfuCTswOFTriR6fCsyZPgXMMurZzLT
	 s/Q2nOj9mnof5cgbryn0nlKVdvIhvsySONEOhebksueh7U3B/czev0hZXMgZJl7NS4
	 y7UXQNSm+FgYv1OSndff+T/fEzlVTvUWe8ALH5/JpUCvN/M6osUjqC1qPKfMCdxKgA
	 cmjN/yDnmP6C5nvtrur93gRMsGT3Oss5hYRsqPU1ncEfpnmi3qaJayEsCdZZOZbuRk
	 GJiwlr8T7LOUQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: add Aquila iMX95 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Franz Schnyder" <fra.schnyder@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260520-add-aquila-imx95-v2-2-06424a51e33a@toradex.com>
References: <20260520-add-aquila-imx95-v2-2-06424a51e33a@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 11:59:16 +0000
Message-Id: <20260520115917.8C8521F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The pinctrl nodes for 8-bit and 4-bit FlexSPI configurations share=
 the exact same node name, causing unintended merging and overwriting.
- [High] The DisplayPort bridge (`som_dsi2dp_bridge`) input endpoint is dis=
connected, rendering the DisplayPort output non-functional.
- [Low] Cadence-specific QSPI timing properties are defined within a flash =
node connected to an NXP FlexSPI controller.
- [Low] The commit message claims support for hardware interfaces (10GbE, L=
VDS, CSI) that are omitted from the Device Tree.
--

commit cac45cd52355d1edaa432d9d405d04c96f38d7b2
Author: Jo=C3=A3o Paulo Gon=C3=A7alves <joao.goncalves@toradex.com>

arm64: dts: freescale: add Aquila iMX95 support

This commit adds device tree support for the Toradex Aquila iMX95 computer
on module and its corresponding development carrier board.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx=
95
Link: https://www.toradex.com/products/carrier-board/aquila-development-boa=
rd-kit

>     The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR5 RA=
M,
>     up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
>     Ethernet PHY, a 10 Gigabit Ethernet interface, an I2C EEPROM and
>     Temperature Sensor, an RX8130 RTC, one Quad lane CSI interface, one Q=
uad
>     lane DSI or CSI interface, one LVDS interface (one or two channels), =
and
>     some optional addons: DisplayPort (through a DSI-DP bridge), TPM 2.0,
>     and a WiFi/BT module.

[Severity: Low]
Does this commit message accurately reflect the contents of the patch?

The commit message claims support for a 10 Gigabit Ethernet interface, one
LVDS interface, and one Quad lane CSI interface, but there doesn't seem to =
be
any device tree node configurations, enablement, or pin multiplexing for th=
ese
interfaces.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/ar=
m64/boot/dts/freescale/imx95-aquila-dev.dts
> new file mode 100644
> index 0000000000000..b2a53847d5079
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
[ ... ]
> +	flash@0 {
> +		compatible =3D "jedec,spi-nor";
> +		reg =3D <0x0>;
> +		spi-max-frequency =3D <66000000>;
> +		spi-rx-bus-width =3D <4>;
> +		spi-tx-bus-width =3D <4>;
> +		cdns,read-delay =3D <0>;
> +		cdns,tchsh-ns =3D <3>;
> +		cdns,tsd2d-ns =3D <10>;
> +		cdns,tshsl-ns =3D <30>;
> +		cdns,tslch-ns =3D <8>;

[Severity: Low]
Is it necessary to include these Cadence-specific timing properties here?

The parent controller is the NXP FlexSPI controller, which doesn't appear to
use or parse the cdns,* properties.

> +	};
> +};

> diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64=
/boot/dts/freescale/imx95-aquila.dtsi
> new file mode 100644
> index 0000000000000..c6dc48852ac6c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
[ ... ]
> +			port@0 {
> +				reg =3D <0>;
> +
> +				dsi2dp_in: endpoint {
> +				};

[Severity: High]
Does this DisplayPort bridge configuration work without a remote-endpoint?

The input endpoint dsi2dp_in is declared without any remote-endpoint
linking it to the SoC's DSI controller, which breaks the video pipeline and
prevents the DisplayPort output from functioning.

> +			};
> +
> +			port@1 {
> +				reg =3D <1>;
[ ... ]
> +	/* Aquila QSPI_1 (8 bit) */
> +	pinctrl_flexspi1_8bit: flexspi18bitgrp {
> +		fsl,pins =3D <IMX95_PAD_XSPI1_SCLK__FLEXSPI1_A_SCLK	0x3fe>, /* Aquila =
B65 */
> +			   <IMX95_PAD_XSPI1_DATA0__FLEXSPI1_A_DATA_BIT0	0x3fe>, /* Aquila B68=
 */
> +			   <IMX95_PAD_XSPI1_DATA1__FLEXSPI1_A_DATA_BIT1	0x3fe>, /* Aquila B67=
 */
> +			   <IMX95_PAD_XSPI1_DATA2__FLEXSPI1_A_DATA_BIT2	0x3fe>, /* Aquila B61=
 */
> +			   <IMX95_PAD_XSPI1_DATA3__FLEXSPI1_A_DATA_BIT3	0x3fe>, /* Aquila B60=
 */
> +			   <IMX95_PAD_XSPI1_DATA4__FLEXSPI1_A_DATA_BIT4	0x3fe>, /* Aquila B70=
 */
> +			   <IMX95_PAD_XSPI1_DATA5__FLEXSPI1_A_DATA_BIT5	0x3fe>, /* Aquila B71=
 */
> +			   <IMX95_PAD_XSPI1_DATA6__FLEXSPI1_A_DATA_BIT6	0x3fe>, /* Aquila B72=
 */
> +			   <IMX95_PAD_XSPI1_DATA7__FLEXSPI1_A_DATA_BIT7	0x3fe>, /* Aquila B73=
 */
> +			   <IMX95_PAD_XSPI1_DQS__FLEXSPI1_A_DQS		0x3fe>; /* Aquila B63 */
> +	};
> +
> +	/* Aquila QSPI_1 (4 bit) */
> +	pinctrl_flexspi1_4bit: flexspi18bitgrp {

[Severity: High]
Is this node name meant to be different from the 8-bit configuration above?

Because this 4-bit configuration shares the exact same node name
(flexspi18bitgrp) as the 8-bit configuration under the same parent
(&scmi_iomuxc), the device tree compiler will merge them.

This silently overwrites the 8-bit configuration with the 4-bit properties,
causing 8-bit QSPI transfers to fail because data pins 4-7 are left
unconfigured.

> +		fsl,pins =3D <IMX95_PAD_XSPI1_SCLK__FLEXSPI1_A_SCLK	0x3fe>, /* Aquila =
B65 */
> +			   <IMX95_PAD_XSPI1_DATA0__FLEXSPI1_A_DATA_BIT0	0x3fe>, /* Aquila B68=
 */
> +			   <IMX95_PAD_XSPI1_DATA1__FLEXSPI1_A_DATA_BIT1	0x3fe>, /* Aquila B67=
 */
> +			   <IMX95_PAD_XSPI1_DATA2__FLEXSPI1_A_DATA_BIT2	0x3fe>, /* Aquila B61=
 */
> +			   <IMX95_PAD_XSPI1_DATA3__FLEXSPI1_A_DATA_BIT3	0x3fe>, /* Aquila B60=
 */
> +			   <IMX95_PAD_XSPI1_DQS__FLEXSPI1_A_DQS		0x3fe>; /* Aquila B63 */
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-add-aquila=
-imx95-v2-0-06424a51e33a@toradex.com?part=3D2
