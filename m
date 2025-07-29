Received: from outbound.mr.icloud.com (p-west2-cluster5-host10-snip4-2.eps.apple.com [57.103.71.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CE6286A9
	for <imx@lists.linux.dev>; Tue, 29 Jul 2025 03:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.71.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753758466; cv=none; b=Y1/PMSIeSgadfmmK0wBTti3nvDstnqfrkaLkalMfeLoqzpdXFN9/CW8hkCbXl38u8X1ONvfUoFkZtW8397hVFeiDqN4oZ/eC/ScXSKGjPPwivG983tRI81VK7eh/aCf5DwyjAJTSGzmmZx5WwV53NSpIVTe3VU55w5LH77ewoaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753758466; c=relaxed/simple;
	bh=yDyDaSTUnLnonduJnOg92pmy1zlopbZ1tcbHSKWc3Yw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aCX1vvJ0zRCMoIZC2tHRtB2SnPD4Ek8RR/Q0nMBoPjul/RkNZ4rEhLM88fNwr41ZOHnrLukD4JHayAgx1s6njD6B94ScCriXheE0RwZ4Z3w3wGu1PCkXVzisr884GCSq2MaFvuCyqhFkEVN6eh8m2d7BdRoSxYmB3qSWjWu8QAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=wsBckVmQ; arc=none smtp.client-ip=57.103.71.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="wsBckVmQ"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-11 (Postfix) with ESMTPS id 188011800239;
	Tue, 29 Jul 2025 03:07:39 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; bh=CiyNl8O39FfOJsM3/F+IKagy4fMiX2l2TB+XzsiXFQE=; h=From:To:Subject:Date:Message-Id:MIME-Version:x-icloud-hme; b=wsBckVmQ7r3zLzpAGdhxJHugxaNiyDtNdh1ZEMjcTR+fYZpNZ/uhmCAcn2SWvysClQlrKGo0Qhz8uXEs+Z0THJ3X71SZX+zL/oBftf+Hj2DQRgunPrZlOgVb28wlUuClw5kFW/XK/69kRZ8aJBSEZ6gzkRiDgU55PPgUZf8K4r68fgWDq2TP6ttgl6ibwrCspZC8rghYX7uP0TQkfl7Rb1yf6iY/nuC50c7NQaByRRNTgjYt6tP2b+9LaksIrtr0dlM8POQuBhelMcT7hmgOVlbSKET4zg0IMX/bn3X9yfsEOzVsWqWRnxeCLKMxltt5AjWI9W1dXKH4/IaZsmpKww==
Received: from localhost.localdomain (mr-asmtp-me-k8s.p00.prod.me.com [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-11 (Postfix) with ESMTPSA id 9302C1800223;
	Tue, 29 Jul 2025 03:07:36 +0000 (UTC)
From: WangErQian <WangErQianY@icloud.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	WangErQian <WangErQianY@icloud.com>
Subject: [PATCH v1 staging] staging: debix-model-a: update DTS for debix model a
Date: Tue, 29 Jul 2025 11:04:49 +0800
Message-Id: <20250729030448.3872138-1-WangErQianY@icloud.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sGAQAkf2VmqxQpU6aH_PQBNtxmT1Hwvv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAyMiBTYWx0ZWRfX/m2++B6rIl7q
 AZ31Vv5T9lJmU/KF7Me9f/ViSD3pjFYOvZgrYV83/BJD/kNMo0Tnxs26emEDYbNj8Q4NW9tLAfZ
 9E78gXi7zR2WM0vs6Ii/ztBmKjJxmCtrE/rJE2dFuNd8BVXwStpBB/9XAcgNF3v4f0E4yVAvmFP
 4RecpYk5JzIaZxQqT7bs34xFqC2V+Pr9RG3Vr2Pe4Qz1X9/SMo7lZVOkO3TL5Y34aq8TFYqCPNi
 vncaigIwiEIj80/2HgUAH14aHJcgWswq9ARvIJWV9LtDQCRJJeO6YryajvykNU4K8NKXp58/U=
X-Proofpoint-ORIG-GUID: sGAQAkf2VmqxQpU6aH_PQBNtxmT1Hwvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_05,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 suspectscore=0 clxscore=1011 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507290022
X-Apple-Category-Label: MTEwNTIxNzAyOTk6JGNhdGVnb3J5JF9QZXJzb25hbCw=

Update the device tree for Debix Model A

Signed-off-by: WangErQian <WangErQianY@icloud.com>
---
 .../dts/freescale/imx8mp-debix-model-a.dts    | 871 +++++++++++++++---
 1 file changed, 752 insertions(+), 119 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
index af02af9e5334..c398be341ff8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
 
 #include "imx8mp.dtsi"
 
@@ -20,13 +21,22 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	bt_rfkill {
+		compatible = "fsl,mxc_bt_rfkill";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_bt_ctrl>;
+		bt-power-gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
+		wake-bt-gpios =  <&gpio2 7 GPIO_ACTIVE_LOW>;
+		wake-host-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
+		status ="okay";
+	};
+
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "hdmi";
 		type = "a";
-
 		port {
-			hdmi_connector_in: endpoint {
+			hdmi_connector_out: endpoint {
 				remote-endpoint = <&hdmi_tx_out>;
 			};
 		};
@@ -45,6 +55,59 @@ led-0 {
 		};
 	};
 
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+		constraint-rate = <44100>,
+				<88200>,
+				<176400>,
+				<32000>,
+				<48000>,
+				<96000>,
+				<192000>;
+		status = "okay";
+	};
+
+	sound-es8316 {
+		compatible = "fsl,imx-audio-es8316";
+		model = "es8316-audio";
+		audio-cpu = <&sai3>;
+		audio-codec = <&codec>;
+		format = "i2s";
+		hp-det-gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		audio-routing =
+			"Mic Jack", "MIC2",
+			"Headphone Jack", "HPOL",
+			"Headphone Jack", "HPOR";
+	};
+
+	usdhc1_pwrseq: usdhc1_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_wlan_reg_on>;
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	reg_pcie0: regulator-pcie {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_pcie0_reg>;
+		regulator-name = "MPCIE_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -56,15 +119,23 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		enable-active-high;
 	};
 
-	reg_usb_hub: regulator-usb-hub {
-		compatible = "regulator-fixed";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_reg_usb_hub>;
-		regulator-name = "USB_HUB";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio4 26 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
+	lvds_backlight: lvds_backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm2 0 100000 0>;
+		status = "disabled";
+
+		brightness-levels = < 0  1  2  3  4  5  6  7  8  9
+				     10 11 12 13 14 15 16 17 18 19
+				     20 21 22 23 24 25 26 27 28 29
+				     30 31 32 33 34 35 36 37 38 39
+				     40 41 42 43 44 45 46 47 48 49
+				     50 51 52 53 54 55 56 57 58 59
+				     60 61 62 63 64 65 66 67 68 69
+				     70 71 72 73 74 75 76 77 78 79
+				     80 81 82 83 84 85 86 87 88 89
+				     90 91 92 93 94 95 96 97 98 99
+				    100>;
+		default-brightness-level = <80>;
 	};
 };
 
@@ -84,28 +155,196 @@ &A53_3 {
 	cpu-supply = <&buck2>;
 };
 
+&aud2htx {
+	status = "okay";
+};
+
+&easrc {
+	fsl,asrc-rate  = <48000>;
+	status = "okay";
+};
+
+&ecspi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	fsl,spi-num-chipselects = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1_cs>;
+	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+	status = "okay";
+	spidev1: spi@0 {
+		reg = <0>;
+		compatible = "rohm,dh2228fv";
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&ecspi2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	fsl,spi-num-chipselects = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	spidev2: spi@0 {
+		reg = <0>;
+		compatible = "rohm,dh2228fv";
+		spi-max-frequency = <20000000>;
+	};
+};
+
 &eqos {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_eqos>;
 	phy-mode = "rgmii-id";
 	phy-handle = <&ethphy0>;
+	snps,force_thresh_dma_mode;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
+	snps,reset-delays-us = <10 20 200000>;
 	status = "okay";
 
 	mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
 		#size-cells = <0>;
+		ethphy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			at803x,led-act-blind-workaround;
+			at803x,eee-disabled;
+			at803x,vddio-1p8v;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <5>;
+		snps,tx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+		};
+
+		queue2 {
+			snps,dcb-algorithm;
+			snps,priority = <0x4>;
+		};
+
+		queue3 {
+			snps,dcb-algorithm;
+			snps,priority = <0x8>;
+		};
+
+		queue4 {
+			snps,dcb-algorithm;
+			snps,priority = <0xf0>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <5>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+			snps,map-to-dma-channel = <0>;
+		};
 
-		ethphy0: ethernet-phy@0 { /* RTL8211E */
+		queue1 {
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+			snps,map-to-dma-channel = <1>;
+		};
+
+		queue2 {
+			snps,dcb-algorithm;
+			snps,priority = <0x4>;
+			snps,map-to-dma-channel = <2>;
+		};
+
+		queue3 {
+			snps,dcb-algorithm;
+			snps,priority = <0x8>;
+			snps,map-to-dma-channel = <3>;
+		};
+
+		queue4 {
+			snps,dcb-algorithm;
+			snps,priority = <0xf0>;
+			snps,map-to-dma-channel = <4>;
+		};
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy1>;
+	fsl,magic-packet;
+	fsl,rgmii_rxc_dly;
+	phy-reset-gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
+	phy-reset-duration = <10>;
+	phy-reset-post-delay = <150>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy1: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
-			reset-gpios = <&gpio4 18 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <20>;
-			reset-deassert-us = <200000>;
+			at803x,led-act-blind-workaround;
+			at803x,eee-disabled;
+			at803x,vddio-1p8v;
 		};
 	};
 };
 
+&flexcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan1>;
+	//xceiver-supply = <&reg_can1_stby>;
+	status = "okay";
+};
+
+&flexcan2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexcan2>;
+	//xceiver-supply = <&reg_can2_stby>;
+	//pinctrl-assert-gpios = <&pca6416 3 GPIO_ACTIVE_HIGH>;
+	status = "okay";/* can2 pin conflict with pdm */
+};
+
+&flexspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexspi0>;
+	status = "disabled";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <80000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&hdmi_blk_ctrl {
+	status = "okay";
+};
+
 &hdmi_pvi {
 	status = "okay";
 };
@@ -114,11 +353,11 @@ &hdmi_tx {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hdmi>;
 	status = "okay";
-
 	ports {
 		port@1 {
+			reg = <1>;
 			hdmi_tx_out: endpoint {
-				remote-endpoint = <&hdmi_connector_in>;
+				remote-endpoint = <&hdmi_connector_out>;
 			};
 		};
 	};
@@ -128,6 +367,10 @@ &hdmi_tx_phy {
 	status = "okay";
 };
 
+&irqsteer_hdmi {
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -140,7 +383,7 @@ pmic@25 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 
 		regulators {
 			buck1: BUCK1 {
@@ -163,7 +406,7 @@ buck2: BUCK2 {
 				nxp,dvs-standby-voltage = <850000>;
 			};
 
-			buck4: BUCK4 {
+			buck4: BUCK4{
 				regulator-name = "BUCK4";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <3400000>;
@@ -171,7 +414,7 @@ buck4: BUCK4 {
 				regulator-always-on;
 			};
 
-			buck5: BUCK5 {
+			buck5: BUCK5{
 				regulator-name = "BUCK5";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <3400000>;
@@ -231,8 +474,10 @@ ldo5: LDO5 {
 };
 
 &i2c2 {
+	clock-frequency = <400000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
 };
 
 &i2c3 {
@@ -240,30 +485,72 @@ &i2c3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
+
+	codec: es8316@10 {
+		compatible = "everest,es8316";
+		reg = <0x10>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
+		clock-names = "mclk";
+	};
 };
 
 &i2c4 {
-	clock-frequency = <100000>;
+	clock-frequency = <50000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c4>;
 	status = "okay";
 
-	eeprom@50 {
+	eeprom1: eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
 		pagesize = <16>;
 	};
 
-	rtc@51 {
+	hym8563: hym8563@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
 		#clock-cells = <0>;
+		clock-frequency = <32768>;
 		clock-output-names = "xin32k";
+		init_date="2022/04/12";
 		interrupt-parent = <&gpio2>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_rtc_int>;
 	};
+	ads1115: ads1115@48 {
+		compatible = "ti,ads1115";
+		status = "okay";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x48>;
+		channel@4 {
+		 reg = <4>;
+		 ti,gain = <1>;
+		 ti,datarate = <4>;
+		};
+		channel@5 {
+		 reg = <5>;
+		 ti,gain = <1>;
+		 ti,datarate = <4>;
+		};
+		channel@3 {
+		 reg = <3>;
+		 ti,gain = <1>;
+		 ti,datarate = <4>;
+		};
+		channel@6 {
+		 reg = <6>;
+		 ti,gain = <1>;
+		 ti,datarate = <4>;
+		};
+		channel@7 {
+		 reg = <7>;
+		 ti,gain = <1>;
+		 ti,datarate = <4>;
+		};
+	};
 };
 
 &i2c6 {
@@ -273,14 +560,85 @@ &i2c6 {
 	status = "okay";
 };
 
+&lcdif1 {
+	status = "okay";
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
 &lcdif3 {
 	status = "okay";
+
+	thres-low  = <1 2>;
+	thres-high = <3 4>;
+};
+
+&lvds_bridge {
+	status = "disabled";
+};
+
+&media_blk_ctrl {
+	status = "disabled";
+};
+
+&mipi_dsi {
+	status = "disabled";
+};
+
+&pcie {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie0>;
+	reset-gpio = <&gpio4 27 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pcie0>;
+	status = "disabled";
+};
+
+&pcie_phy {
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	status = "disabled";
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm2>;
+	status = "disabled";
+};
+
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <12288000>;
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_IPG>, <&clk IMX8MP_CLK_DUMMY>,
+		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>, <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_CLK_DUMMY>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&sdma2 {
+	status = "okay";
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&uart1 { /* BT */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	assigned-clocks = <&clk IMX8MP_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
 &uart2 {
 	/* console */
 	pinctrl-names = "default";
@@ -300,7 +658,28 @@ &uart4 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+};
+
 &usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune = <3>;
+	fsl,phy-tx-vref-tune = <0xb>;
 	status = "okay";
 };
 
@@ -309,32 +688,45 @@ &usb3_1 {
 };
 
 &usb_dwc3_1 {
-	#address-cells = <1>;
-	#size-cells = <0>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_usb1>;
+	pinctrl-0 = <&pinctrl_usb1_vbus>;
+	hub-pwd-gpio = <&gpio4 26 GPIO_ACTIVE_LOW>;
+	hub-reset-gpio = <&gpio4 25 GPIO_ACTIVE_LOW>;
 	dr_mode = "host";
 	status = "okay";
+};
 
-	/* 2.x hub on port 1 */
-	usb_hub_2_x: hub@1 {
-		compatible = "usbbda,5411";
-		reg = <1>;
-		vdd-supply = <&reg_usb_hub>;
-		peer-hub = <&usb_hub_3_x>;
-	};
+/*WIFI */
+&usdhc1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wlan_wake_host>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wlan_wake_host>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wlan_wake_host>;
+	bus-width = <4>;
+	pm-ignore-notify;
+	keep-power-in-suspend;
+	non-removable;
+	cap-power-off-card;
+	/delete-property/ vmmc-supply;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	status = "okay";
+	max-frequency = <100000000>;
 
-	/* 3.x hub on port 2 */
-	usb_hub_3_x: hub@2 {
-		compatible = "usbbda,411";
-		reg = <2>;
-		vdd-supply = <&reg_usb_hub>;
-		peer-hub = <&usb_hub_2_x>;
+	brcmf: bcrmf@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&gpio2>;
+		interrupts = <9 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
 	};
 };
 
 /* SD Card */
 &usdhc2 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
+	assigned-clock-rates = <400000000>;
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
 	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
@@ -366,25 +758,108 @@ &wdog1 {
 };
 
 &iomuxc {
+	pinctrl_bt_ctrl: btctrlgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06        0x41
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07        0x41
+			MX8MP_IOMUXC_SD1_DATA6__GPIO2_IO08        0x16
+		>;
+	};
+
+	pinctrl_ecspi1: ecspi1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK		0x82
+			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI		0x82
+			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO		0x82
+		>;
+	};
+
+	pinctrl_ecspi1_cs: ecspi1cs {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x40000
+		>;
+	};
+
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x82
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x82
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x82
+		>;
+	};
+
+	pinctrl_ecspi2_cs: ecspi2cs {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x40000
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x3
-			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x3
-			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x91
-			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x91
-			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x91
-			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x91
-			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x91
-			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x91
-			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x1f
-			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x1f
-			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x1f
-			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x1f
-			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x1f
-			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x1f
-			MX8MP_IOMUXC_SAI1_RXFS__ENET1_1588_EVENT0_IN			0x1f
-			MX8MP_IOMUXC_SAI1_RXC__ENET1_1588_EVENT0_OUT			0x1f
-			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18				0x19
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x90
+			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x90
+			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x90
+			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x90
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x16
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x16
+			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x16
+			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x16
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x16
+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
+			MX8MP_IOMUXC_SAI1_RXFS__ENET1_1588_EVENT0_IN    0x16
+			MX8MP_IOMUXC_SAI1_RXC__ENET1_1588_EVENT0_OUT    0x16
+			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18		0x10
+		>;
+	};
+
+	pinctrl_fec: fecgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD2__ENET1_MDC		0x2
+			MX8MP_IOMUXC_SAI1_RXD3__ENET1_MDIO		0x2
+			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0		0x90
+			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1		0x90
+			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2		0x90
+			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3		0x90
+			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC		0x90
+			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL	0x90
+			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0		0x16
+			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1		0x16
+			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2		0x16
+			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3		0x16
+			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL	0x16
+			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC		0x16
+			MX8MP_IOMUXC_SAI1_RXD1__ENET1_1588_EVENT1_OUT   0x16
+			MX8MP_IOMUXC_SAI1_RXD0__ENET1_1588_EVENT1_IN    0x16
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19		0x10
+		>;
+	};
+
+	pinctrl_flexcan1: flexcan1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXD2__CAN1_RX          0x154
+			MX8MP_IOMUXC_SAI5_RXD1__CAN1_TX          0x154
+		>;
+	};
+
+	pinctrl_flexcan2: flexcan2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX         0x154
+			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX         0x154
+		>;
+	};
+
+	pinctrl_flexspi0: flexspi0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_ALE__FLEXSPI_A_SCLK           0x1c2
+			MX8MP_IOMUXC_NAND_CE0_B__FLEXSPI_A_SS0_B        0x82
+			MX8MP_IOMUXC_NAND_DATA00__FLEXSPI_A_DATA00      0x82
+			MX8MP_IOMUXC_NAND_DATA01__FLEXSPI_A_DATA01      0x82
+			MX8MP_IOMUXC_NAND_DATA02__FLEXSPI_A_DATA02      0x82
+			MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03      0x82
 		>;
 	};
 
@@ -396,10 +871,10 @@ MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16				0x19
 
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c3
-			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c3
-			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD				0x19
-			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x19
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x1c3
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x1c3
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x19
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x19
 		>;
 	};
 
@@ -438,21 +913,35 @@ MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA					0x400001c3
 		>;
 	};
 
+	pinctrl_pcie0: pcie0grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__PCIE_CLKREQ_B	0x60
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07	0x40
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21	0x1c4
+		>;
+	};
+
+	pinctrl_pcie0_reg: pcie0reggrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x40
+		>;
+	};
+
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x000001c0
 		>;
 	};
 
-	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+	pinctrl_pwm2: pwm2grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19				0x41
+			//MX8MP_IOMUXC_GPIO1_IO11__PWM2_OUT	0x116
 		>;
 	};
 
-	pinctrl_reg_usb_hub: regusbhubgrp {
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SAI2_TXD0__GPIO4_IO26				0x19
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19				0x41
 		>;
 	};
 
@@ -462,6 +951,29 @@ MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11				0x140
 		>;
 	};
 
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK	0xd6
+			MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI3_RX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0xd6
+			>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX	0x140
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX	0x140
+			//MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS	0x140
+			//MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS	0x140
+			MX8MP_IOMUXC_SAI2_TXFS__UART1_DCE_CTS	0x140
+			MX8MP_IOMUXC_SAI2_RXD0__UART1_DCE_RTS	0x140
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX				0x14f
@@ -483,96 +995,147 @@ MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX				0x49
 		>;
 	};
 
-	pinctrl_usb1: usb1grp {
+	pinctrl_usb1_vbus: usb1grp {
+		fsl,pins = <
+			//MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14		0x10
+			MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25	 0x19 /*rst*/
+			MX8MP_IOMUXC_SAI2_TXD0__GPIO4_IO26	0x19  /*pwd*/
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1grp100mhz {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK         0x194
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD         0x1d4
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0     0x1d4
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1     0x1d4
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2     0x1d4
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3     0x1d4
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1grp200mhz {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR				0x10
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK         0x196
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD         0x1d6
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0     0x1d6
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1     0x1d6
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2     0x1d6
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3     0x1d6
 		>;
 	};
 
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK				0x190
-			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD				0x1d0
-			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0				0x1d0
-			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1				0x1d0
-			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2				0x1d0
-			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3				0x1d0
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc1
 		>;
 	};
 
 	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK				0x194
-			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD				0x1d4
-			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0				0x1d4
-			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1				0x1d4
-			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2				0x1d4
-			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3				0x1d4
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc1
 		>;
 	};
 
 	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK				0x196
-			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD				0x1d6
-			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0				0x1d6
-			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1				0x1d6
-			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2				0x1d6
-			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3				0x1d6
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc1
 		>;
 	};
 
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12				0x1c4
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
 		>;
 	};
 
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x190
-			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD				0x1d0
-			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0				0x1d0
-			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1				0x1d0
-			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2				0x1d0
-			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3				0x1d0
-			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4				0x1d0
-			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5				0x1d0
-			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6				0x1d0
-			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7				0x1d0
-			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE				0x190
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
 		>;
 	};
 
 	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x194
-			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD				0x1d4
-			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0				0x1d4
-			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1				0x1d4
-			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2				0x1d4
-			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3				0x1d4
-			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4				0x1d4
-			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5				0x1d4
-			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6				0x1d4
-			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7				0x1d4
-			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE				0x194
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
 		>;
 	};
 
 	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x196
-			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD				0x1d6
-			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0				0x1d6
-			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1				0x1d6
-			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2				0x1d6
-			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3				0x1d6
-			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4				0x1d6
-			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5				0x1d6
-			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6				0x1d6
-			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7				0x1d6
-			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE				0x196
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d6
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d6
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d6
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d6
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d6
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d6
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d6
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
+		>;
+	};
+
+	pinctrl_wlan_reg_on: wlan_reg_on_grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10     0x41
+		>;
+	};
+
+	pinctrl_wlan_wake_host: wlanwakehostgrp {
+		fsl,pins = <
+			//MX8MP_IOMUXC_GPIO1_IO00__ANAMIX_REF_CLK_32K      0x141
+		MX8MP_IOMUXC_SD1_DATA7__GPIO2_IO09               0x111
 		>;
 	};
 
@@ -582,3 +1145,73 @@ MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B				0xc6
 		>;
 	};
 };
+
+&dsp {
+	status = "okay";
+};
+
+&gpu2d {
+	status = "okay";
+};
+
+&gpu3d {
+	status = "okay";
+};
+
+&npu {
+	status = "okay";
+};
+
+&vpumix_blk_ctrl {
+	status = "okay";
+};
+
+&vpu_g1 {
+	status = "okay";
+};
+
+&vpu_g2 {
+	status = "okay";
+};
+
+&mipi_csi_0 {
+	status = "disabled";
+};
+
+&mipi_csi_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "disabled";
+};
+
+&aips4 {
+	status = "okay";
+};
+
+&isi_in_0 {
+	status = "disabled";
+
+	cap_device {
+		status = "okay";
+	};
+
+	m2m_device {
+		status = "disabled";
+	};
+};
+
+&isi_in_1 {
+	status = "disabled";
+
+	cap_device {
+		status = "okay";
+	};
+};
+
+&isp_0 {
+	status = "okay";
+};
+
+&dewarp {
+	status = "okay";
+};
-- 
2.25.1

