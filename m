Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A280A1E49F
	for <imx@lists.linux.dev>; Sun, 16 Nov 2025 04:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763265694; cv=none; b=XH1LOt/sFZ/o29a2p6Wlq/QPMwkbXdbM8p6iE8ZSHblez0rXY2YJzj3KtC0PRtkFP5x/T/anQom+PdoCymWAl/RHLpifbfsSJILDq5zsV1G4+LXTI8Iw/DurE96d9Fq/pf5pBFQUCnTcCnT0j/tg4PEIC1pE//q3TQVS9LLNRFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763265694; c=relaxed/simple;
	bh=ND4KCHfiUxnV6TdIZNHhpGVtHA8PoHAKBDYSB4GEi0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JP+zAk4+jQiu4a1vA5BBZjS1HdlYVGzcxmg2uRWqA4xSChmQs8hBxZUmBQSmKU2Fp+NV1jc5Ri/51orCSVcEGa8qoXyK4ok42J2sDJ2+aa5eUvTADpt3faVnSyR5g6xfRmoesrcb4URnleLU1hW79u49ISAgx7B+5dzArS1F9Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=QIJEwQwU; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="QIJEwQwU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=GUGusZfe145+eEbMJVj+/EtKqHE8jsKCBjwGyIRMTTA=;
	b=QIJEwQwUirCh0324WDk3CW2YlGjZW30pyyaYzmo/2O7w72GTqq1+WPe/uPkdst
	gd72SSYS00TMlc0X3skWrGhAbldtvWbWtw5jPikf4aNArg1deO+6Y+EeNMq7CqMd
	zS2N2dn+WZmCL0wO6vSK5hWRz4zFBe1tAkSOZzIfLA508=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDn6XV+TBlpo6gSAg--.7801S3;
	Sun, 16 Nov 2025 12:01:04 +0800 (CST)
Date: Sun, 16 Nov 2025 12:01:02 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH v3 2/2] arm64: dts: ls1028a: Add mbls1028a and
 mbls1028a-ind devicetrees
Message-ID: <aRlMft4X0dZ1CxDs@dragon>
References: <20251027110459.420857-1-alexander.stein@ew.tq-group.com>
 <20251027110459.420857-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027110459.420857-2-alexander.stein@ew.tq-group.com>
X-CM-TRANSID:M88vCgDn6XV+TBlpo6gSAg--.7801S3
X-Coremail-Antispam: 1Uf129KBjvAXoW3tF1UZrykKr4fAr15GFWDCFg_yoW8WF18Zo
	Wayr4vkFW5J34Iy3W7KrWxWa10yrs5Xw4YkayUXF4fGa10yrWDAw1Yva18tFWUAr1fKryk
	Jry3Ga48Ja1Yv3s5n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUj8nYUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNADTOWkZTIBc1QAA3r

On Mon, Oct 27, 2025 at 12:04:56PM +0100, Alexander Stein wrote:
> From: Gregor Herburger <gregor.herburger@tq-group.com>
> 
> Add device trees for the MBLS1028A and the MBLS1028A-IND and the SoM
> TQMLS1028A.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v3:
> * Fix ethernet PHY interrupt polarity
> * Remove downstream properties
> 
> Changes in v2:
> * Sort node and properties alphabetically
> * Add clock-frequency to i2c nodes
> * Add eMMC supplies
> * Add comment about unused TMU
> 
>  arch/arm64/boot/dts/freescale/Makefile        |   2 +
>  .../fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts  |  68 ++++
>  .../fsl-ls1028a-tqmls1028a-mbls1028a.dts      | 118 +++++++
>  .../fsl-ls1028a-tqmls1028a-mbls1028a.dtsi     | 290 ++++++++++++++++++
>  .../dts/freescale/fsl-ls1028a-tqmls1028a.dtsi | 124 ++++++++
>  5 files changed, 602 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index ca6cf40dd00be..59d3d76a3194c 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -16,6 +16,8 @@ dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-sl28-var3-ads2.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-kontron-sl28-var4.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-qds.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-rdb.dtb
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-tqmls1028a-mbls1028a.dtb
> +dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1028a-tqmls1028a-mbls1028a-ind.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1043a-qds.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1043a-rdb.dtb
>  dtb-$(CONFIG_ARCH_LAYERSCAPE) += fsl-ls1043a-tqmls1043a-mbls10xxa.dtb
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts
> new file mode 100644
> index 0000000000000..571b801c4f145
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2019-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Michael Krummsdorf
> + * Author: Matthias Schiffer
> + * Author: Alexander Stein
> + */
> +
> +/dts-v1/;
> +
> +#include "fsl-ls1028a-tqmls1028a-mbls1028a.dtsi"
> +
> +/ {
> +	model = "MBLS1028A-IND starterkit";
> +	compatible = "tq,ls1028a-tqmls1028a-mbls1028a-ind", "tq,ls1028a-tqmls1028a", "fsl,ls1028a";
> +};
> +
> +&i2c5 {
> +	gpio_exp_3v3: gpio@71 {
> +		compatible = "nxp,pca9538";
> +		reg = <0x71>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +
> +		clk-intn-hog {
> +			gpio-hog;
> +			gpios = <0 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "CLK_INT#";
> +		};
> +
> +		mpcie-waken-hog {
> +			gpio-hog;
> +			gpios = <2 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "MPCIE_WAKE#";
> +		};
> +
> +		mpcie-disn-hog {
> +			gpio-hog;
> +			gpios = <3 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "MPCIE_DIS#";
> +		};
> +
> +		mpcie-rstn-hog {
> +			gpio-hog;
> +			gpios = <4 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "MPCIE_RST#";
> +		};
> +
> +		sata-perstn-hog {
> +			gpio-hog;
> +			gpios = <6 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "SATA_PERST#";
> +		};
> +
> +		dcdc-reset-hog {
> +			gpio-hog;
> +			gpios = <7 GPIO_ACTIVE_HIGH>;
> +			output-low;
> +			line-name = "DCDC_RESET";
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts
> new file mode 100644
> index 0000000000000..02563f982ff81
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2019-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Michael Krummsdorf
> + * Author: Matthias Schiffer
> + * Author: Alexander Stein
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include "fsl-ls1028a-tqmls1028a-mbls1028a.dtsi"
> +
> +/ {
> +	model = "MBLS1028A starterkit";
> +	compatible = "tq,ls1028a-tqmls1028a-mbls1028a", "tq,ls1028a-tqmls1028a", "fsl,ls1028a";
> +
> +	gpio-beeper {
> +		compatible = "gpio-beeper";
> +		gpios = <&gpio_exp_3v3 15 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +
> +		button-0 {
> +			label = "S4";
> +			linux,code = <BTN_0>;
> +			gpios = <&gpio_exp_3v3 11 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		button-1 {
> +			label = "S5";
> +			linux,code = <BTN_1>;
> +			gpios = <&gpio_exp_3v3 12 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		led-1 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			function-enumerator = <1>;
> +			gpios = <&gpio_exp_3v3 14 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "default-on";
> +		};
> +
> +		led-2 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +			gpios = <&gpio_exp_3v3 13 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +};
> +
> +&gpio_exp_1v8 {
> +	dcdc-reset-hog {
> +		gpio-hog;
> +		gpios = <6 GPIO_ACTIVE_HIGH>;
> +		line-name = "DCDC_RESET";
> +		output-low;
> +	};
> +};
> +
> +&i2c5 {
> +	gpio_exp_3v3: gpio@25 {
> +		compatible = "nxp,pca9555";
> +		reg = <0x25>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
> +		vcc-supply = <&reg_3p3v>;
> +
> +		clk-intn-hog {
> +			gpio-hog;
> +			gpios = <0 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "CLK_INT#";
> +		};
> +
> +		mpcie-waken-hog {
> +			gpio-hog;
> +			gpios = <2 GPIO_ACTIVE_HIGH>;
> +			input;
> +			line-name = "MPCIE_WAKE#";
> +		};
> +
> +		mpcie-disn-hog {
> +			gpio-hog;
> +			gpios = <3 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "MPCIE_DIS#";
> +		};
> +
> +		mpcie-rstn-hog {
> +			gpio-hog;
> +			gpios = <4 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "MPCIE_RST#";
> +		};
> +
> +		sata-perstn-hog {
> +			gpio-hog;
> +			gpios = <6 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "SATA_PERST#";
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
> new file mode 100644
> index 0000000000000..8f9dc0f138a63
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
> @@ -0,0 +1,290 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2019-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Michael Krummsdorf
> + * Author: Matthias Schiffer
> + * Author: Alexander Stein
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include "fsl-ls1028a-tqmls1028a.dtsi"
> +
> +/ {
> +	aliases {
> +		gpio0 = &gpio1;
> +		gpio1 = &gpio2;
> +		gpio2 = &gpio3;
> +
> +		crypto = &crypto;
> +

Can we drop these newlines and keep aliases sort alphabetically?

Shawn

> +		mmc0 = &esdhc; /* SD-Card */
> +		mmc1 = &esdhc1; /* eMMC */
> +
> +		serial0 = &duart0;
> +		serial1 = &duart1;
> +	};
> +
> +	chosen {
> +		stdout-path = &duart0;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "V_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "V_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* global autoconfigured region for contiguous allocations */
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			/* 256 MiB */
> +			size = <0 0x10000000>;
> +			linux,cma-default;
> +		};
> +	};
> +};
> +
> +&can0 {
> +	status = "okay";
> +};
> +
> +&can1 {
> +	status = "okay";
> +};
> +
> +&dspi2 {
> +	bus-num = <2>;
> +	status = "okay";
> +};
> +
> +&duart0 {
> +	status = "okay";
> +};
> +
> +&duart1 {
> +	status = "okay";
> +};
> +
> +&esdhc {
> +	cd-gpios = <&gpio1 31 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	no-mmc;
> +	no-sdio;
> +	no-1-8-v;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +/* When switched to baseboard-internal i2c bus,
> + * IIC5 has access to the following devices.
> + */
> +&i2c4 {
> +	/* TUSB8041 only supports 100 KHz, but it is not connected */
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	/* SI5338 - set up in U-Boot */
> +	/* clockgen@70 */
> +};
> +
> +&i2c5 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	gpio_exp_1v8: gpio@70 {
> +		compatible = "nxp,pca9538";
> +		reg = <0x70>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <30 IRQ_TYPE_LEVEL_LOW>;
> +		vcc-supply = <&reg_1p8v>;
> +
> +		ec1-intn-hog {
> +			gpio-hog;
> +			gpios = <0 0>;
> +			input;
> +			line-name = "EC1_INT#";
> +		};
> +
> +		sgmii-intn-hog {
> +			gpio-hog;
> +			gpios = <2 0>;
> +			input;
> +			line-name = "SGMII_INT#";
> +		};
> +
> +		qsgmii-intn-hog {
> +			gpio-hog;
> +			gpios = <4 0>;
> +			input;
> +			line-name = "QSGMII_INT#";
> +		};
> +
> +		qsgmii-rstn-hog {
> +			gpio-hog;
> +			gpios = <5 0>;
> +			output-high;
> +			line-name = "QSGMII_RESET#";
> +		};
> +	};
> +};
> +
> +&enetc_mdio_pf3 {
> +	mdio0_rgmii_phy00: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x00>;
> +		reset-gpios = <&gpio_exp_1v8 1 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <1>;
> +		reset-deassert-us = <200>;
> +		interrupt-parent = <&gpio_exp_1v8>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_50_NS>;
> +		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +	};
> +
> +	mdio0_sgmii_phy03: ethernet-phy@3 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0x03>;
> +		reset-gpios = <&gpio_exp_1v8 3 GPIO_ACTIVE_LOW>;
> +		/*
> +		 * Long reset to work around PHY incorrect strap pin sampling
> +		 * due to external capacitors for SGMII
> +		 */
> +		reset-assert-us = <2500>;
> +		reset-deassert-us = <200>;
> +		interrupt-parent = <&gpio_exp_1v8>;
> +		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
> +		ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +	};
> +
> +	qsgmii_phy1: ethernet-phy@1c {
> +		reg = <0x1c>;
> +	};
> +
> +	qsgmii_phy2: ethernet-phy@1d {
> +		reg = <0x1d>;
> +	};
> +
> +	qsgmii_phy3: ethernet-phy@1e {
> +		reg = <0x1e>;
> +	};
> +
> +	qsgmii_phy4: ethernet-phy@1f {
> +		reg = <0x1f>;
> +	};
> +};
> +
> +&enetc_port0 {
> +	phy-handle = <&mdio0_sgmii_phy03>;
> +	phy-mode = "sgmii";
> +	managed = "in-band-status";
> +	status = "okay";
> +};
> +
> +&enetc_port1 {
> +	phy-handle = <&mdio0_rgmii_phy00>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};
> +
> +&enetc_port2 {
> +	status = "okay";
> +};
> +
> +&mscc_felix {
> +	status = "okay";
> +};
> +
> +/* l2switch ports */
> +&mscc_felix_port0 {
> +	phy-handle = <&qsgmii_phy1>;
> +	phy-mode = "qsgmii";
> +	status = "okay";
> +};
> +
> +&mscc_felix_port1 {
> +	phy-handle = <&qsgmii_phy2>;
> +	phy-mode = "qsgmii";
> +	status = "okay";
> +};
> +
> +&mscc_felix_port2 {
> +	phy-handle = <&qsgmii_phy3>;
> +	phy-mode = "qsgmii";
> +	status = "okay";
> +};
> +
> +&mscc_felix_port3 {
> +	phy-handle = <&qsgmii_phy4>;
> +	phy-mode = "qsgmii";
> +	status = "okay";
> +};
> +
> +&mscc_felix_port4 {
> +	ethernet = <&enetc_port2>;
> +	status = "okay";
> +};
> +
> +&pcie2 {
> +	status = "okay";
> +};
> +
> +&sata {
> +	status = "okay";
> +};
> +
> +&usb0 {
> +	/* dual role is implemented, but not a full featured OTG */
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	dr_mode = "otg";
> +	status = "okay";
> +};
> +
> +&usb1 {
> +	dr_mode = "host";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb451,8142";
> +		reg = <1>;
> +		peer-hub = <&hub_3_0>;
> +		reset-gpios = <&gpio_exp_3v3 1 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&reg_3p3v>;
> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible = "usb451,8140";
> +		reg = <2>;
> +		peer-hub = <&hub_2_0>;
> +		reset-gpios = <&gpio_exp_3v3 1 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&reg_3p3v>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi
> new file mode 100644
> index 0000000000000..dbf24dbc043b7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright 2019-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Michael Krummsdorf
> + * Author: Matthias Schiffer
> + * Author: Alexander Stein
> + */
> +
> +#include "fsl-ls1028a.dtsi"
> +
> +/ {
> +	compatible = "tq,ls1028a-tqmls1028a", "fsl,ls1028a";
> +
> +	reg_1p8v_som: regulator-1p8v-som {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P8V_SOM";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_3p3v_som: regulator-3p3v-som {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V_SOM";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	thermal-zones {
> +		/*
> +		 * TQMLS1028A uses an external temperature sensor
> +		 * instead of TMU
> +		 */
> +		/delete-node/ ddr-controller;
> +
> +		cluster-thermal {
> +			thermal-sensors = <&sa56004_4c 1>;
> +		};
> +	};
> +};
> +
> +&esdhc1 {
> +	no-sdio;
> +	no-sd;
> +	non-removable;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-ddr-1_8v;
> +	bus-width = <8>;
> +	vmmc-supply = <&reg_3p3v_som>;
> +	vqmmc-supply = <&reg_1p8v_som>;
> +	status = "okay";
> +};
> +
> +&fspi {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <100000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +		vcc-supply = <&reg_1p8v_som>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	js42_18: temperature-sensor@18 {
> +		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
> +		reg = <0x18>;
> +	};
> +
> +	sa56004_4c: temperature-sensor@4c {
> +		compatible = "nxp,sa56004";
> +		reg = <0x4c>;
> +		#thermal-sensor-cells = <1>;
> +		vcc-supply = <&reg_3p3v_som>;
> +	};
> +
> +	se97_50: eeprom@50 {
> +		compatible = "nxp,se97b", "atmel,24c02";
> +		read-only;
> +		reg = <0x50>;
> +		pagesize = <16>;
> +		vcc-supply = <&reg_3p3v_som>;
> +	};
> +
> +	rtc1: rtc@51 {
> +		compatible = "nxp,pcf85063a";
> +		reg = <0x51>;
> +		quartz-load-femtofarads = <12500>;
> +	};
> +
> +	m24c256_57: eeprom@57 {
> +		compatible = "atmel,24c256";
> +		reg = <0x57>;
> +		pagesize = <32>;
> +		vcc-supply = <&reg_3p3v_som>;
> +	};
> +};
> +
> +/*
> + * We use a separate sensor IC to measure core temperature. Disable the TMU
> + * as its driver can cause log spam outside of its measurement range (0-125C).
> + *
> + * Will have to be reevaluated if this DTS is ported to a mainline kernel,
> + * as both sensors of the TMU are referenced by the default LS1028A
> + * thermal-zones definitions there.
> + */
> +&tmu {
> +	status = "disabled";
> +};
> -- 
> 2.43.0
> 

