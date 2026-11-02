Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629635;
	b=iKPR+QZv7HCfr6eeyAsw0tEf3aR1yWyVmHzBnhBwA8HhcSr5fn72llo6QH5T+WWRaS+g
	 4NA2f6+jnvR5nPrVG5LpCueMG9XtzceO2iMQCZrIUSCbzqHvlP72RLNwxZVEcDtjb87e5
	 GTHqo6loQF2ulrGAl8nXEHo2J1k6dHIh2KHu+ql+n17C5SeGuGac8uoxgw9OMTF6+8NsS
	 MQ1giP4gGb9hQKBZWmKQhZK5YVScLSqpwPwVNBO/qBwwFQbNtTtykuFWkDzKf+nBJLZRi
	 1HV2hQHoS5UGzt3AHkoJPbUWAHt3bIEFcj2pMmgrdB1/dfx4vyyfzguy1y42MvIBeQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629635;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=MRW8yQZRaCPeqMsTXiHuhP142YZvSkdk7pkM6fo6QlE=;
	b=kOq8CbisZ5DjA1NxDf/LXznCRjqNP5OqcIQ95F1wqrdaLgPcRv7hvhltwQs2mB2qf2gS
	 ccTpDZGeRBi+QbXvvcUHkxXODzP3IG7SPliSHZuYCe9lPpwxc+RIFGlk3dFYS6oSD6qwW
	 txi+qfrfviOyGUuowqT5EqUlsiHd7NTAT+4VXRvAfrdFikqVfbeOn+olY0mnHtIRDmamT
	 t2lfVaeXaE8NS52RzhK5WNM1LDWgrTgKC/YKqs+orgt7XIESt9un1w357y3/e6XX1vdO7
	 v9Wof1XX/D891XNn2GnVGJ33r3VUi8UJonXCosTyxknhDXL9F4yCpa7CBulZMtvVmFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=q2clcIO1;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A436B60A5BE6
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 14:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A436B60A5BE6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=q2clcIO1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1793629619; x=1794234419; i=wahrenst@gmx.net;
	bh=MRW8yQZRaCPeqMsTXiHuhP142YZvSkdk7pkM6fo6QlE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=q2clcIO18an33MTZKEkIIR8ltBwtK3n32diD4iN9yYPOp9iEWwJmixV1mPrN/FtD
	 9+9LUqNJ19g9qCsFScJh95ikqjUOT5926gpT6eYnIbJR3mE016mw4Dl+wSR3ehhwp
	 LfYqUyFAwTQpbZyv7Yq0qP2vtJc1lCad5wxJGwlkHaCJ1Ppco9mzM3TC+N/mgn/ou
	 lK14ChFTmNIJm/z9/lfeh+xedEUaGxOZ3iSOuWajzRxAgaHTokoTU1j4kT+51GqLf
	 VgpuyUxtXdf8VqHHnyc9+4YVaGSrWPjrT0zFys6kwZjUmMbMEc7kg9P8j0Xo8Cbba
	 Di10qqpyG+C5x2WwZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAwXr-1xDBcI0Cb3-006H5w; Mon, 02
 Nov 2026 15:26:59 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Martin Lukas <martin.lukas@chargebyte.com>,
	Michael Heimpold <michael.heimpold@chargebyte.com>
Subject: [PATCH V7 2/2] arm64: dts: freescale: Add chargebyte Charge Control Y
Date: Mon,  2 Nov 2026 15:26:49 +0100
Message-ID: <20261102142649.8566-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102142649.8566-1-wahrenst@gmx.net>
References: <20261102142649.8566-1-wahrenst@gmx.net>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QPqXkvIr393cvm/Xn7KQZQrSX3hpkiWtFLKwX443HOVTxhPg3LC
 XIsu1NY77Put71DrvNNWsGaZWh177HuR8HiyLZPHo/iCc3c5nicLZUhSSJr9mK+wfNzcMlq
 NIMvs2xjTZddqnRnXFW2vaPr4TUlXXXFE1ade5+TWyPWrxGP2n8EwDHNRA4J2H9O19OQU1f
 8webmq6KobTR0jOTAfP0w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7IkkfRls+N0=;1yM4hszelWpZwFDaaySsbL6n2Pp
 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
 +NEbezP6ojzZ87lFcd5Gtr04layuXw=

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
 .../dts/freescale/imx93-charge-control-y.dts  | 437 ++++++++++++++++++
 .../boot/dts/freescale/imx93-phycore-som.dtsi |   4 +-
 3 files changed, 440 insertions(+), 2 deletions(-)
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
index 000000000000..cbd91c9b66ce
=2D-- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-charge-control-y.dts
@@ -0,0 +1,437 @@
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
+/* Heartbeat LED of phyCore is not populated */
+&som_leds {
+	status =3D "disabled";
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
index 325e465d0056..1822398f0f9a 100644
=2D-- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -35,7 +35,7 @@ linux,cma {
 		};
 	};
=20
-	leds {
+	som_leds: leds {
 		compatible =3D "gpio-leds";
 		pinctrl-names =3D "default";
 		pinctrl-0 =3D <&pinctrl_leds>;
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
2.34.1

