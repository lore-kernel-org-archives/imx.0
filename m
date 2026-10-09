Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBC84FB9C6
	for <imx@lists.linux.dev>; Fri,  9 Oct 2026 18:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569768; cv=none; b=AqwwZQGn/WPS7SrPuxQj175+qYhAjrUvcxVQVjZwtTGWt4eFEwLCThjhQ+xIkM5Plc6NZoocOkVGVAjqyRMUci1jLR86PXxqGSuyBI3weQhgHrUEt7dJ4q7HmUw3XEIixnqQX16sGC5QzwiwX8BpS7iEmv0OrKPUZpi8FdDi87Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569768; c=relaxed/simple;
	bh=lkq2EHiXYJrgaH1Z906bP2CQTSgVcW4UbC7H4TvzVEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CylAFxeqSKziafwE5a2PCs6Fzb3ViONMWy6UACYYin1Re0j4GSaoNW4Ef22khFl2OhuinicIuD+haHcwj7uVYUkFR+dqDzhiJnLzv44OkHMCxM+zC5hEN/L1ScLfoptnEfI1lzCa0iS5WZO1vB/jxAdChX/Tf9/GydfXD8bOixw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=X+jDgJ2A; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="X+jDgJ2A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1791569756; x=1792174556; i=wahrenst@gmx.net;
	bh=TJHZ1AcdRDwlkFVaL5rTzfCFgPELy2bGbbzQmRqRW3k=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=X+jDgJ2ARwLEvAwbxkXZ9nLGLzZbe3wsapL0tp+nrdwDR2m4sblJmOiCXgQGfu3e
	 ZFwsjswXMZPNkCbLpaiS2mpdHWPCEvkcxlzZpN2RfJVcyNDZEcOM6W9MSaZQFVlLG
	 1/cibY8ZwECwIpJcsBxDWq4tKrEA92WJnUXFGYTnh2HQOAy86e8YaSIsQXkBv3wwg
	 vfuO4Sj6wQ41cnKqTNxZgNxqmU1f38pbGUkPQzxYcKla/saXjBGLu5D3e9ikLMG7h
	 hMX3zqg+ABQ9a8nQAOX+fCpkvVmpUOixui6DAxlpeyFTMPFoSlO77Np7D+hqsAGdx
	 ReVxK6bKY8N+PTGSzg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYPi-1wiOLk17AO-00kQMG; Fri, 09
 Oct 2026 20:15:56 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Martin Lukas <martin.lukas@chargebyte.com>,
	Michael Heimpold <michael.heimpold@chargebyte.com>
Subject: [PATCH V6 2/2] arm64: dts: freescale: Add chargebyte Charge Control Y
Date: Fri,  9 Oct 2026 20:15:51 +0200
Message-ID: <20261009181551.6478-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009181551.6478-1-wahrenst@gmx.net>
References: <20261009181551.6478-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bQobZd8VSnMmTh9sVRJJKiY7GFK2gp1ltlPjykRWFVoSdt/O9/F
 OXYHChDb36BuV0W5Gh517xuLmgnoVOczGgivDT0quieUowH/VbIlz8goJFt0btvjnjliLAs
 ZTbmJWY7z0ETeDalfjELZihfjVC6o8t1IzMpPDaFlfcd/80PswxG5y2sUWXHCzH8LbpuYI7
 jmHdus8fVdx3a9Ekv4FWw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wMmgpVF1sZI=;6Yn4IOD6/H+7gZKeM0bEWUT7x7O
 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
 Rjs5IGH43Zc=

This adds the support for chargebyte Charge Control Y, which is
an Electrical Vehicle Supply Equipment (EVSE) for MCS (Megawatt
Charging System) charging stations (according to IEC 61851-23-1).

chargebyte Charge Control Y uses phyCORE-i.MX 93 ARM
- NXP i.MX93 1.7 GHz
- 1 GB DDR4 RAM
- up to 8 GB eMMC
- 2x 100 MBit/s Ethernet interfaces
- 10BASE-T1S Ethernet for MCS communication
- CAN interface
- separate safety chip
- TPM chip
- power buffered RTC

Co-developed-by: Martin Lukas <martin.lukas@chargebyte.com>
Signed-off-by: Martin Lukas <martin.lukas@chargebyte.com>
Co-developed-by: Michael Heimpold <michael.heimpold@chargebyte.com>
Signed-off-by: Michael Heimpold <michael.heimpold@chargebyte.com>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-charge-control-y.dts  | 438 ++++++++++++++++++
 .../boot/dts/freescale/imx93-phycore-som.dtsi |   2 +-
 3 files changed, 440 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-charge-control-y.d=
ts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/=
freescale/Makefile
index a80cccf34eb5..5984d3742ef8 100644
=2D-- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -898,6 +898,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx93-11x11-frdm-pixpaper.=
dtb
 dtb-$(CONFIG_ARCH_MXC) +=3D imx93-14x14-evk.dtb
 imx93-14x14-evk-mqs-dtbs +=3D imx93-14x14-evk.dtb imx9-mqs.dtbo
 dtb-$(CONFIG_ARCH_MXC) +=3D imx93-14x14-evk-mqs.dtb
+dtb-$(CONFIG_ARCH_MXC) +=3D imx93-charge-control-y.dtb
 dtb-$(CONFIG_ARCH_MXC) +=3D imx93-kontron-bl-osm-s.dtb
 dtb-$(CONFIG_ARCH_MXC) +=3D imx93-lino-verdin-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) +=3D imx93-lino-verdin-dev.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx93-charge-control-y.dts b/ar=
ch/arm64/boot/dts/freescale/imx93-charge-control-y.dts
new file mode 100644
index 000000000000..7c5666cd4730
=2D-- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-charge-control-y.dts
@@ -0,0 +1,438 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2025-2026 chargebyte GmbH
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "imx93-phycore-som.dtsi"
+
+/ {
+	model =3D "chargebyte Charge Control Y";
+	compatible =3D "chargebyte,imx93-charge-control-y", "phytec,imx93-phycor=
e-som", "fsl,imx93";
+
+	aliases {
+		ethernet0 =3D &fec;
+		ethernet1 =3D &lan8651;
+		ethernet2 =3D &eqos;
+		gpio0 =3D &gpio1;
+		gpio1 =3D &gpio2;
+		gpio2 =3D &gpio3;
+		gpio3 =3D &gpio4;
+		mmc0 =3D &usdhc1;
+		mmc1 =3D &usdhc2;
+		rtc0 =3D &rv3028;
+		rtc1 =3D &bbnsm_rtc;
+		serial0 =3D &lpuart1;
+		serial1 =3D &lpuart2;
+		serial2 =3D &lpuart3;
+		serial3 =3D &lpuart4;
+		serial4 =3D &lpuart5;
+	};
+
+	chosen {
+		stdout-path =3D &lpuart1;
+	};
+
+	// Heartbeat LED of phyCore is not populated
+	/delete-node/ leds;
+
+	flexcan1_tc: can-phy0 {
+		compatible =3D "microchip,mcp2542", "ti,tcan1042";
+		#phy-cells =3D <0>;
+		max-bitrate =3D <1000000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible =3D "regulator-fixed";
+		enable-active-high;
+		gpio =3D <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-min-microvolt =3D <3300000>;
+		regulator-max-microvolt =3D <3300000>;
+		regulator-name =3D "VCC_SD";
+	};
+
+	user_leds: user-leds {
+		compatible =3D "gpio-leds";
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_user_leds>;
+
+		led_user_green: led-user-green {
+			color =3D <LED_COLOR_ID_GREEN>;
+			function =3D LED_FUNCTION_BOOT;
+			gpios =3D <&gpio2 24 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger =3D "timer";
+		};
+
+		led_user_red: led-user-red {
+			color =3D <LED_COLOR_ID_RED>;
+			function =3D LED_FUNCTION_SD;
+			gpios =3D <&gpio2 25 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger =3D "mmc1";
+		};
+	};
+};
+
+// Heartbeat LED of phyCore is not populated
+/delete-node/ &pinctrl_leds;
+
+&eeprom0 {
+	nvmem-layout {
+		compatible =3D "fixed-layout";
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+
+		/* Wired ethernet interface */
+		eth1_mac_address: base-mac-address@100 {
+			compatible =3D "mac-base";
+			reg =3D <0x100 0x6>;
+			#nvmem-cell-cells =3D <1>;
+		};
+
+		/* MCS ethernet interface */
+		eth2_mac_address: base-mac-address@108 {
+			compatible =3D "mac-base";
+			reg =3D <0x108 0x6>;
+			#nvmem-cell-cells =3D <1>;
+		};
+	};
+};
+
+/* Ethernet 2 */
+&eqos {
+	phy-mode =3D "rmii";
+	phy-handle =3D <&ethphy2>;
+	assigned-clocks =3D <&clk IMX93_CLK_ENET_TIMER2>,
+			  <&clk IMX93_CLK_ENET>;
+	assigned-clock-parents =3D <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
+				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
+	assigned-clock-rates =3D <100000000>, <50000000>;
+
+	nvmem-cells =3D <&eth1_mac_address 0>;
+	nvmem-cell-names =3D "mac-address";
+
+	status =3D "okay";
+};
+
+/* Ethernet 1 */
+&fec {
+	/* Since MDIO bus is handled by FEC, all PHY strap pins and
+	 * reference clock must be initialized at the same time.
+	 */
+	pinctrl-0 =3D <&pinctrl_fec &pinctrl_eqos &pinctrl_eqos_strap>;
+};
+
+&flexcan1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_flexcan1>;
+	phys =3D <&flexcan1_tc>;
+	status =3D "okay";
+};
+
+&gpio1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_gpio1>, <&pinctrl_lan8651_rst>;
+	gpio-line-names =3D "", "", "", "X_nRST_LAN", "",
+			  "", "LPUART2_RX", "LPUART2_TX", "CAN1_TX", "CAN1_RX",
+			  "", "SPI_TPM_nCS0", "", "", "",
+			  "";
+};
+
+&gpio2 {
+	gpio-line-names =3D "", "", "", "", "",
+			  "", "", "X_LAN_nIRQ", "X_LAN_nCS", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "GREEN_LED",
+			  "RED_LED", "", "", "", "";
+};
+
+&gpio3 {
+	gpio-line-names =3D "SD2_nCD", "", "", "", "",
+			  "", "", "SD2_nRESET", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "SOM_EMMC_nRESET", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "";
+};
+
+&gpio4 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_gpio4>;
+	gpio-line-names =3D "", "", "X_RTC_nINT", "", "",
+			  "", "", "", "", "",
+			  "", "", "SAFETY_BOOTMODE_SET", "ENET1_RST", "",
+			  "", "", "", "", "",
+			  "", "SOM_EEPROM_WP", "", "SOM_PHY_RESET", "",
+			  "", "", "PMIC_IRQ_B", "nSAFETY_RESET_INT", "SPI_TPM_nINT0";
+};
+
+&lpi2c1 {
+	clock-frequency =3D <400000>;
+	pinctrl-names =3D "default", "gpio";
+	pinctrl-0 =3D <&pinctrl_lpi2c1>;
+	pinctrl-1 =3D <&pinctrl_lpi2c1_gpio>;
+	scl-gpios =3D <&gpio1 00 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios =3D <&gpio1 01 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	#address-cells =3D <1>;
+	#size-cells =3D <0>;
+	status =3D "okay";
+
+	rv3028: rtc@52 {
+		compatible =3D "microcrystal,rv3028";
+		interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent =3D <&gpio4>;
+		wakeup-source;
+		trickle-resistor-ohms =3D <3000>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pinctrl_rtc>;
+		reg =3D <0x52>;
+	};
+};
+
+&lpspi1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_lpspi1>;
+	num-cs =3D <1>;
+	cs-gpios =3D <&gpio1 11 GPIO_ACTIVE_LOW>;
+	status =3D "okay";
+
+	tpm@0 {
+		compatible =3D "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg =3D <0>;
+		spi-max-frequency =3D <10000000>;
+		interrupt-parent =3D <&gpio4>;
+		interrupts =3D <29 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+/* MCS Ethernet SPI */
+&lpspi3 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_lpspi3>;
+	num-cs =3D <1>;
+	cs-gpios =3D <&gpio2 8 GPIO_ACTIVE_LOW>;
+	status =3D "okay";
+
+	lan8651: ethernet@0 {
+		compatible =3D "microchip,lan8651", "microchip,lan8650";
+		reg =3D <0>;
+		interrupt-parent =3D <&gpio2>;
+		interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
+		spi-max-frequency =3D <25000000>;
+
+		nvmem-cells =3D <&eth2_mac_address 0>;
+		nvmem-cell-names =3D "mac-address";
+
+		/*
+		 * Since GPIO reset management for the LAN8651 has not yet been
+		 * implemented, X_nRST_LAN should be retained as a GPIO in
+		 * userspace for the rare case that a reset via SPI does not work.
+		 */
+	};
+};
+
+&lpuart1 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart1>;
+	status =3D "okay";
+};
+
+&lpuart3 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart3>;
+	status =3D "okay";
+};
+
+/* Ethernet 2 PHY */
+&mdio {
+	ethphy2: ethernet-phy@2 {
+		reg =3D <2>;
+		compatible =3D "ethernet-phy-id2000.a140";
+		clocks =3D <&clk IMX93_CLK_ENET_REF_PHY>;
+		reset-gpios =3D <&gpio4 13 GPIO_ACTIVE_HIGH>;
+		reset-assert-us =3D <30>;
+		reset-deassert-us =3D <50000>;
+	};
+};
+
+/* SD */
+&usdhc2 {
+	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 =3D <&pinctrl_usdhc2_default>, <&pinctrl_usdhc2_cd>;
+	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_cd>;
+	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_cd>;
+	cd-gpios =3D <&gpio3 00 GPIO_ACTIVE_LOW>;
+	vmmc-supply =3D <&reg_usdhc2_vmmc>;
+	bus-width =3D <4>;
+	disable-wp;
+	no-sdio;
+	no-mmc;
+	status =3D "okay";
+};
+
+&iomuxc {
+	pinctrl_eqos: eqosgrp {
+		fsl,pins =3D <
+			MX93_PAD_ENET1_TD2__CCM_ENET_QOS_CLOCK_GENERATE_REF_CLK		0x4000057e
+			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0				0x50e
+			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1				0x50e
+			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x50e
+		>;
+	};
+
+	pinctrl_eqos_strap: eqosstrapgrp {
+		fsl,pins =3D <
+			MX93_PAD_ENET1_RXC__ENET_QOS_RX_ER		0x17e
+			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0		0x17e
+			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1		0x17e
+			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL	0x17e
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins =3D <
+			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
+			MX93_PAD_PDM_CLK__CAN1_TX		0x1382
+		>;
+	};
+
+	pinctrl_gpio1: gpio1grp {
+		fsl,pins =3D <
+			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10	0x382
+		>;
+	};
+
+	pinctrl_gpio4: gpio4grp {
+		fsl,pins =3D <
+			MX93_PAD_ENET1_TXC__GPIO4_IO07		0x382
+			MX93_PAD_ENET1_RD2__GPIO4_IO12		0x39e
+			MX93_PAD_CCM_CLKO3__GPIO4_IO28		0x39e
+			MX93_PAD_ENET1_RD3__GPIO4_IO13		0x31e
+		>;
+	};
+
+	/* X_nRST_LAN is wired to a pull resistor, so it's not floating */
+	pinctrl_lan8651_rst: lan8651rstgrp {
+		fsl,pins =3D <
+			MX93_PAD_I2C2_SDA__GPIO1_IO03		0x31e
+		>;
+	};
+
+	pinctrl_lpi2c1: lpi2c1grp {
+		fsl,pins =3D <
+			MX93_PAD_I2C1_SCL__LPI2C1_SCL		0x40000b86
+			MX93_PAD_I2C1_SDA__LPI2C1_SDA		0x40000b86
+		>;
+	};
+
+	pinctrl_lpi2c1_gpio: lpi2c1gpiogrp {
+		fsl,pins =3D <
+			MX93_PAD_I2C1_SCL__GPIO1_IO00		0x40000b9e
+			MX93_PAD_I2C1_SDA__GPIO1_IO01		0x40000b9e
+		>;
+	};
+
+	pinctrl_lpspi1: lpspi1grp {
+		fsl,pins =3D <
+			MX93_PAD_CCM_CLKO4__GPIO4_IO29		0x186
+			MX93_PAD_SAI1_TXFS__GPIO1_IO11		0x186
+			MX93_PAD_SAI1_TXC__LPSPI1_SIN		0x186
+			MX93_PAD_SAI1_TXD0__LPSPI1_SCK		0x186
+			MX93_PAD_SAI1_RXD0__LPSPI1_SOUT		0x186
+		>;
+	};
+
+	/* PinCtrl MCS LAN SPI */
+	pinctrl_lpspi3: lpspi3grp {
+		fsl,pins =3D <
+			MX93_PAD_GPIO_IO07__GPIO2_IO07		0x186
+			MX93_PAD_GPIO_IO08__GPIO2_IO08		0x186
+			MX93_PAD_GPIO_IO09__LPSPI3_SIN		0x186
+			MX93_PAD_GPIO_IO10__LPSPI3_SOUT		0x186
+			MX93_PAD_GPIO_IO11__LPSPI3_SCK		0x186
+		>;
+	};
+
+	pinctrl_rtc: rtcgrp {
+		fsl,pins =3D <
+			MX93_PAD_ENET1_TD3__GPIO4_IO02		0x31e
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins =3D <
+			MX93_PAD_UART1_RXD__LPUART1_RX		0x31e
+			MX93_PAD_UART1_TXD__LPUART1_TX		0x30e
+		>;
+	};
+
+	pinctrl_uart3: uart3grp {
+		fsl,pins =3D <
+			MX93_PAD_GPIO_IO15__LPUART3_RX		0x31e
+			MX93_PAD_GPIO_IO14__LPUART3_TX		0x30e
+		>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins =3D <
+			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
+		>;
+	};
+
+	pinctrl_usdhc2_cd: usdhc2cdgrp {
+		fsl,pins =3D <
+			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2_default: usdhc2grp {
+		fsl,pins =3D <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x119e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins =3D <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x119e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000139e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins =3D <
+			MX93_PAD_SD2_CLK__USDHC2_CLK		0x118e
+			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e
+			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000139e
+			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000139e
+			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000139e
+			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000139e
+			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
+		>;
+	};
+
+	pinctrl_user_leds: userledgrp {
+		fsl,pins =3D <
+			MX93_PAD_GPIO_IO24__GPIO2_IO24		0x31e
+			MX93_PAD_GPIO_IO25__GPIO2_IO25		0x31e
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/a=
rm64/boot/dts/freescale/imx93-phycore-som.dtsi
index 325e465d0056..489ed3f7fb61 100644
=2D-- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -201,7 +201,7 @@ ldo5: LDO5 {
 	};
=20
 	/* EEPROM */
-	eeprom@50 {
+	eeprom0: eeprom@50 {
 		compatible =3D "atmel,24c32";
 		reg =3D <0x50>;
 		pagesize =3D <32>;
=2D-=20
2.43.0

