Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A84298CAB
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 19:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142567; cv=none; b=IjgUK8jhUth7H1nAIsj/F5jWAcYZV2V0J3eGK0V5b0A8/crRFjInh5Cb7yAuVI0gc+jIWYccI7Bbhbg52uautXl7bgpgB2821lQy+K83MV+Fr6al9AU2xhsKglv7pDy7Mzq28ptNJtKJOwwhbXCOJskR5hSM2Uok5F2HhoSOTII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142567; c=relaxed/simple;
	bh=3O4UxIFO/h5ffJjfrBu+TO3Urd31DIETXrLKFCgY3uU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNT4Tun5k/FgVfAY4VbEGoDpNHlVNWSBjjVc2gTJ/B4LPyMa1els8BYdnmNH18j82R58D4Q38DB9GoE+tR9yb8ZkBr440KPtELJQ3bpn6xBHWjjXV43xm22FLQ+Gt/fKMnLgpvI9eAIEiAIPhMMWkgAvKQjr69nA33oCTfQZdPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkO8A3bx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkO8A3bx"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c7902f47so48059635e9.1
        for <imx@lists.linux.dev>; Wed, 15 Jul 2026 12:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784142556; x=1784747356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fv9umQ6k9AYmo0dKCqNs7HYkNt4I5paAKMEenHsDbUM=;
        b=LkO8A3bxB86EUqTTRNXAWadbXd18Xh5KU8o1N0z1FWEAJB5Ohi+IpK0BzfWyiXSQvZ
         pMJ84CKntUaVf/aXzrlzryj3wVZs0KuXq0hxzVxBfqhGk7Ke5Tkoh0DVQn43tP56jJam
         h7HRpKfp4tWhhSeNl6t3NmnBUaHoeQKsV7lippusH0nto0h0n4M/yEuyUbtssryUeShD
         bVbIvuqPwSU1XxnalGZp+yXuNs1RrH51AU+GUBH6E82D8ojJs9vW6kAYYtnKOVrcKpUJ
         XKbim6DSoKQdIqQWtosFQqB+2mXyOSoK8fcUn+hZpS70RrItanAsysGRj8GNGoqgHSTN
         VFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784142556; x=1784747356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fv9umQ6k9AYmo0dKCqNs7HYkNt4I5paAKMEenHsDbUM=;
        b=BqgK4xed1vOV5EzXI3yQ4MxIn+2JwZf93Knw719aN4x5UlLudbOeaMFsC0QSXctMkM
         GjcASAXR7KG9zbSLUXKKWiXsTdMx5OHQtRth5ygL7sfzQFl/4Lp6auaP+zlS3pQ+3CH0
         RqVkpVZujJdVWccg+WwolJnwGomPE+erZi1HOCv72T4Y+QkOXNL8rFSq2jLfAzGN3/iI
         5D2CUCrLq+C+UpIVKzBuKsSTNU0cRbkcWDwkRGC8/lo6kZ4ULdAwq9srSCOUjZn8K+LZ
         Qw7Lx3cQ8ZUOAM853ikwlwcOagPhZvrDVZAQ5eOa9svRaS55eALnB4ZmRs3MWrBIFDCS
         sUiw==
X-Forwarded-Encrypted: i=1; AHgh+Rr067fDc4sjJFHgd/1FjnZbedGtB3q/TYLktqGSkflx92WtFN5qmqYQ9gjG2J+jAAWtks8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAmsg9h19+58tTTy3RaWDCWiwqt+QF7bl0lqumhRIpqffKHGXh
	G2SwNtqC6YHbvMfc1CjqiMGZuhYPiCoJVoyoTxTMLfdqOot9EMFJPqVI
X-Gm-Gg: AfdE7cnIMQtQwR+vRcQAxSEOn5C1UbV0p6VqGR9IY49tZHRX+06obmBTuhiC7j1qTcH
	3/xkOFwa/RTUMFq5naBcYaAZ3OZSSfKL6Adoxd0oAtFsI2dxRTEZO+S8OZCRgDv2MY5xf5FohKl
	RITnlsPjgedpYA4NKimGVGQCPB8+sWnmPt23dzqgcmrOxCBxns1rYZoOI5/KoyMFqYSlzZT3MML
	3ryXfZvphHPXip8LwW94cMRY5p28PvaRdYwIVsVLlwJ27gEatuXutGznl14Gsd/RwnrVUv64r/V
	Rxq9ALK9Hrn1rpCwUOTWo7eRhWsWE8QFxxOAVA55EDQx7H2z7IOTxhsugX5w2Ktgh/sEAkJktvB
	iwi1rCKlN2eCZeiloyyRcLtb87h8L1g6lXB/vzxzx/wPXaIBKNhPntBVTCYIjxZuAKLnu6Gdf0Z
	BiZBMmdBs45yJVu0cRLATJ8fEFWEPCeXvUAPqs43a2DBLy+KofIbTH8M5BxLK1oQGnAcP01LZ0r
	oy1MU3UFo14rsJf0uxiKp4zF8PVVsUrPpyf
X-Received: by 2002:a05:600c:4e0d:b0:495:39dc:583d with SMTP id 5b1f17b1804b1-4953c150667mr46493555e9.6.1784142555852;
        Wed, 15 Jul 2026 12:09:15 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49541eb7372sm3786325e9.13.2026.07.15.12.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:09:15 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: [PATCH v5 2/3] arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
Date: Wed, 15 Jul 2026 21:09:08 +0200
Message-ID: <0dab340bd29e1f4b1fab05a29532cad3177abc7f.1784142385.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784142385.git.stefano.r@variscite.com>
References: <cover.1784142385.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite VAR-SOM-MX8 QuadMax
system on module.
This SOM is designed to be used with various carrier boards.

The module includes:
- NXP i.MX8 QuadMax MPU processor
- Up to 8GB of LPDDR4 memory
- Up to 128GB of eMMC storage memory
- Integrated 10/100/1000 Mbps Ethernet Transceiver
- Codec audio WM8904
- WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth

Only SOM-specific peripherals are enabled by default. Carrier board
specific interfaces are left disabled to be enabled in the respective
carrier board device trees.

Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-quadplus/var-som-mx8/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Fix sai7 clock
 - Fix codec regulator voltage

v3->v4:
 - Fix sai peripherals clocks
 - Add comment to clarify 1GB variant

v2->v3:
 - 

v1->v2:
 - Added non-removable property to usdhc3
 - Removed unused fec gpio pinctrl

 .../boot/dts/freescale/imx8qm-var-som.dtsi    | 531 ++++++++++++++++++
 1 file changed, 531 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
new file mode 100644
index 000000000000..28964de3b080
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
@@ -0,0 +1,531 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common dtsi for Variscite VAR-SOM-MX8
+ *
+ * Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-quadplus/var-som-mx8/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx8qm.dtsi"
+
+/ {
+	model = "Variscite i.MX8QM VAR-SOM-MX8 Module";
+	compatible = "variscite,var-som-imx8qm", "fsl,imx8qm";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000 0 0x40000000>;
+	};
+
+	reg_audio_supply: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "wm8904-supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	reg_phy_vddio: regulator-phy-vddio {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		vdev0vring0: memory@90000000 {
+			reg = <0 0x90000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@90008000 {
+			reg = <0 0x90008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@90010000 {
+			reg = <0 0x90010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@90018000 {
+			reg = <0 0x90018000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table0: memory@900ff000 {
+			reg = <0 0x900ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev2vring0: memory@90100000 {
+			reg = <0 0x90100000 0 0x8000>;
+			no-map;
+		};
+
+		vdev2vring1: memory@90108000 {
+			reg = <0 0x90108000 0 0x8000>;
+			no-map;
+		};
+
+		vdev3vring0: memory@90110000 {
+			reg = <0 0x90110000 0 0x8000>;
+			no-map;
+		};
+
+		vdev3vring1: memory@90118000 {
+			reg = <0 0x90118000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table1: memory@901ff000 {
+			reg = <0 0x901ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: memory@90400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90400000 0 0x100000>;
+			no-map;
+		};
+
+		dsp_reserved: memory@92400000 {
+			reg = <0 0x92400000 0 0x1000000>;
+			no-map;
+		};
+
+		dsp_vdev0vring0: memory@942f0000 {
+			reg = <0 0x942f0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: memory@942f8000 {
+			reg = <0 0x942f8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: memory@94300000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x94300000 0 0x100000>;
+			no-map;
+		};
+
+		/* global autoconfigured region for contiguous allocations */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			/* VAR-SOM-MX8QM doesn't have 1GB variant */
+			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
+			size = <0 0x3c000000>;
+			linux,cma-default;
+			reusable;
+		};
+	};
+
+	sound-wm8904 {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&codec_dai>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&codec_dai>;
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,name = "wm8904-audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN2L", "Line In Jack",
+			"IN2R", "Line In Jack",
+			"IN1L", "Microphone Jack",
+			"IN1R", "Microphone Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&wm8904>;
+		};
+
+		simple-audio-card,cpu {
+			sound-dai = <&esai0>;
+		};
+	};
+};
+
+&acm {
+	status = "okay";
+};
+
+&asrc0 {
+	fsl,asrc-rate  = <48000>;
+	status = "okay";
+};
+
+&asrc1 {
+	fsl,asrc-rate = <48000>;
+	status = "okay";
+};
+
+&cm41_intmux {
+	status = "okay";
+};
+
+&esai0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_esai0>;
+	assigned-clocks = <&acm IMX_ADMA_ACM_ESAI0_MCLK_SEL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+			  <&esai0_lpcg IMX_LPCG_CLK_4>;
+	assigned-clock-parents = <&aud_pll_div0_lpcg IMX_LPCG_CLK_0>;
+	assigned-clock-rates = <0>, <786432000>, <49152000>, <12288000>, <49152000>;
+	#sound-dai-cells = <0>;
+	status = "okay";
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1>;
+	/*
+	 * The required RGMII TX and RX 2ns delays are implemented directly
+	 * in hardware via passive delay elements on the SOM PCB.
+	 * No delay configuration is needed in software via PHY driver.
+	 */
+	phy-mode = "rgmii";
+	phy-handle = <&ethphy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <4>;
+			reset-gpios = <&lsio_gpio2 28 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <20000>;
+			vddio-supply = <&reg_phy_vddio>;
+		};
+	};
+};
+
+&gpio0_mipi_csi0 {
+	status = "disabled";
+};
+
+&gpio0_mipi_csi1 {
+	status = "disabled";
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c0>;
+	status = "okay";
+
+	wm8904: codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&mclkout0_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "mclk";
+		assigned-clocks = <&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_PLL>,
+				<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_SLV_BUS>,
+				<&clk IMX_SC_R_AUDIO_PLL_0 IMX_SC_PM_CLK_MST_BUS>,
+				<&mclkout0_lpcg IMX_LPCG_CLK_0>;
+		assigned-clock-rates = <786432000>, <49152000>, <12288000>, <12288000>;
+		AVDD-supply = <&reg_audio_supply>;
+		CPVDD-supply = <&reg_audio_supply>;
+		DBVDD-supply = <&reg_audio_supply>;
+		DCVDD-supply = <&reg_audio_supply>;
+		MICVDD-supply = <&reg_audio_supply>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+		/* GPIO1 = DMIC_CLK, don't touch others */
+		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
+	};
+};
+
+/* Bluetooth */
+&lpuart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart1>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&mu_m0{
+	status = "okay";
+};
+
+&mu1_m0{
+	status = "okay";
+};
+
+&mu2_m0{
+	status = "okay";
+};
+
+&rtc {
+	status = "disabled";
+};
+
+&sai6 {
+	assigned-clocks = <&acm IMX_ADMA_ACM_SAI6_MCLK_SEL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
+			  <&sai6_lpcg IMX_LPCG_CLK_4>;
+	assigned-clock-parents = <&aud_pll_div1_lpcg IMX_LPCG_CLK_0>;
+	assigned-clock-rates = <0>, <786432000>, <98304000>, <12288000>, <98304000>;
+	fsl,sai-asynchronous;
+	status = "okay";
+};
+
+&sai7 {
+	assigned-clocks = <&acm IMX_ADMA_ACM_SAI7_MCLK_SEL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
+			  <&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
+			  <&sai7_lpcg IMX_LPCG_CLK_4>;
+	assigned-clock-parents = <&aud_pll_div1_lpcg IMX_LPCG_CLK_0>;
+	assigned-clock-rates = <0>, <786432000>, <98304000>, <12288000>, <98304000>;
+	fsl,sai-asynchronous;
+	status = "okay";
+};
+
+&thermal_zones {
+	pmic-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <2000>;
+		thermal-sensors = <&tsens IMX_SC_R_PMIC_0>;
+		trips {
+			pmic_alert0: trip0 {
+				temperature = <110000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+			pmic_crit0: trip1 {
+				temperature = <125000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+		cooling-maps {
+			map0 {
+				trip = <&pmic_alert0>;
+				cooling-device = <&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
+
+/* eMMC */
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+/* WIFI */
+&usdhc3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_wifi>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+	};
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog>;
+
+	pinctrl_esai0: esai0grp {
+		fsl,pins = <
+			IMX8QM_ESAI0_FSR_AUD_ESAI0_FSR				0xc6000040
+			IMX8QM_ESAI0_FST_AUD_ESAI0_FST				0xc6000040
+			IMX8QM_ESAI0_SCKR_AUD_ESAI0_SCKR			0xc6000040
+			IMX8QM_ESAI0_SCKT_AUD_ESAI0_SCKT			0xc6000040
+			IMX8QM_ESAI0_TX0_AUD_ESAI0_TX0				0xc6000040
+			IMX8QM_ESAI0_TX5_RX0_AUD_ESAI0_TX5_RX0			0xc6000040
+			IMX8QM_MCLK_OUT0_AUD_ACM_MCLK_OUT0			0xc600004c
+		>;
+	};
+
+	pinctrl_fec1: fec1grp {
+		fsl,pins = <
+			IMX8QM_ENET0_MDC_CONN_ENET0_MDC				0x06000048
+			IMX8QM_ENET0_MDIO_CONN_ENET0_MDIO			0x06000048
+			IMX8QM_ENET0_RGMII_TX_CTL_CONN_ENET0_RGMII_TX_CTL	0x06000048
+			IMX8QM_ENET0_RGMII_TXC_CONN_ENET0_RGMII_TXC		0x06000048
+			IMX8QM_ENET0_RGMII_TXD0_CONN_ENET0_RGMII_TXD0		0x06000048
+			IMX8QM_ENET0_RGMII_TXD1_CONN_ENET0_RGMII_TXD1		0x06000048
+			IMX8QM_ENET0_RGMII_TXD2_CONN_ENET0_RGMII_TXD2		0x06000048
+			IMX8QM_ENET0_RGMII_TXD3_CONN_ENET0_RGMII_TXD3		0x06000048
+			IMX8QM_ENET0_RGMII_RXC_CONN_ENET0_RGMII_RXC		0x06000048
+			IMX8QM_ENET0_RGMII_RX_CTL_CONN_ENET0_RGMII_RX_CTL	0x06000048
+			IMX8QM_ENET0_RGMII_RXD0_CONN_ENET0_RGMII_RXD0		0x06000048
+			IMX8QM_ENET0_RGMII_RXD1_CONN_ENET0_RGMII_RXD1		0x06000048
+			IMX8QM_ENET0_RGMII_RXD2_CONN_ENET0_RGMII_RXD2		0x06000048
+			IMX8QM_ENET0_RGMII_RXD3_CONN_ENET0_RGMII_RXD3		0x06000048
+			IMX8QM_ESAI0_TX2_RX3_LSIO_GPIO2_IO28			0x06000028
+		>;
+	};
+
+	pinctrl_hog: hoggrp {
+		fsl,pins = <
+			IMX8QM_ESAI1_FSR_LSIO_GPIO2_IO04			0x00000041
+			IMX8QM_ESAI1_FST_LSIO_GPIO2_IO05			0x00000041
+			IMX8QM_ESAI1_SCKR_LSIO_GPIO2_IO06			0x00000041
+			IMX8QM_ESAI1_SCKT_LSIO_GPIO2_IO07			0x00000041
+			IMX8QM_SPDIF0_EXT_CLK_LSIO_GPIO2_IO16			0x00000041
+		>;
+	};
+
+	pinctrl_i2c0: i2c0grp {
+		fsl,pins = <
+			IMX8QM_HDMI_TX0_TS_SCL_DMA_I2C0_SCL			0xc6000020
+			IMX8QM_HDMI_TX0_TS_SDA_DMA_I2C0_SDA			0xc6000020
+		>;
+	};
+
+	pinctrl_lpuart1: lpuart1grp {
+		fsl,pins = <
+			IMX8QM_UART1_RX_DMA_UART1_RX				0x06000020
+			IMX8QM_UART1_TX_DMA_UART1_TX				0x06000020
+			IMX8QM_UART1_CTS_B_DMA_UART1_RTS_B			0x06000020
+			IMX8QM_UART1_RTS_B_DMA_UART1_CTS_B			0x06000020
+		>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		fsl,pins = <
+			IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK				0x06000041
+			IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD				0x00000021
+			IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0			0x00000021
+			IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1			0x00000021
+			IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2			0x00000021
+			IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3			0x00000021
+			IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4			0x00000021
+			IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5			0x00000021
+			IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6			0x00000021
+			IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7			0x00000021
+			IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE			0x06000041
+			IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B			0x00000021
+		>;
+	};
+
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
+		fsl,pins = <
+			IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK				0x06000040
+			IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD				0x00000020
+			IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0			0x00000020
+			IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1			0x00000020
+			IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2			0x00000020
+			IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3			0x00000020
+			IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4			0x00000020
+			IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5			0x00000020
+			IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6			0x00000020
+			IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7			0x00000020
+			IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE			0x06000040
+			IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B			0x00000020
+		>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		fsl,pins = <
+			IMX8QM_EMMC0_CLK_CONN_EMMC0_CLK				0x06000040
+			IMX8QM_EMMC0_CMD_CONN_EMMC0_CMD				0x00000020
+			IMX8QM_EMMC0_DATA0_CONN_EMMC0_DATA0			0x00000020
+			IMX8QM_EMMC0_DATA1_CONN_EMMC0_DATA1			0x00000020
+			IMX8QM_EMMC0_DATA2_CONN_EMMC0_DATA2			0x00000020
+			IMX8QM_EMMC0_DATA3_CONN_EMMC0_DATA3			0x00000020
+			IMX8QM_EMMC0_DATA4_CONN_EMMC0_DATA4			0x00000020
+			IMX8QM_EMMC0_DATA5_CONN_EMMC0_DATA5			0x00000020
+			IMX8QM_EMMC0_DATA6_CONN_EMMC0_DATA6			0x00000020
+			IMX8QM_EMMC0_DATA7_CONN_EMMC0_DATA7			0x00000020
+			IMX8QM_EMMC0_STROBE_CONN_EMMC0_STROBE			0x06000040
+			IMX8QM_EMMC0_RESET_B_CONN_EMMC0_RESET_B			0x00000020
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			IMX8QM_USDHC2_CLK_CONN_USDHC2_CLK			0x06000041
+			IMX8QM_USDHC2_CMD_CONN_USDHC2_CMD			0x00000021
+			IMX8QM_USDHC2_DATA0_CONN_USDHC2_DATA0			0x00000021
+			IMX8QM_USDHC2_DATA1_CONN_USDHC2_DATA1			0x00000021
+			IMX8QM_USDHC2_DATA2_CONN_USDHC2_DATA2			0x00000021
+			IMX8QM_USDHC2_DATA3_CONN_USDHC2_DATA3			0x00000021
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3100mhzgrp {
+		fsl,pins = <
+			IMX8QM_USDHC2_CLK_CONN_USDHC2_CLK			0x06000040
+			IMX8QM_USDHC2_CMD_CONN_USDHC2_CMD			0x00000020
+			IMX8QM_USDHC2_DATA0_CONN_USDHC2_DATA0			0x00000020
+			IMX8QM_USDHC2_DATA1_CONN_USDHC2_DATA1			0x00000020
+			IMX8QM_USDHC2_DATA2_CONN_USDHC2_DATA2			0x00000020
+			IMX8QM_USDHC2_DATA3_CONN_USDHC2_DATA3			0x00000020
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			IMX8QM_USDHC2_CLK_CONN_USDHC2_CLK			0x06000040
+			IMX8QM_USDHC2_CMD_CONN_USDHC2_CMD			0x00000020
+			IMX8QM_USDHC2_DATA0_CONN_USDHC2_DATA0			0x00000020
+			IMX8QM_USDHC2_DATA1_CONN_USDHC2_DATA1			0x00000020
+			IMX8QM_USDHC2_DATA2_CONN_USDHC2_DATA2			0x00000020
+			IMX8QM_USDHC2_DATA3_CONN_USDHC2_DATA3			0x00000020
+		>;
+	};
+
+	pinctrl_wifi: wifigrp {
+		fsl,pins = <
+			/* GPIOs used by user space WiFi init */
+			IMX8QM_SCU_GPIO0_07_SCU_DSC_RTC_CLOCK_OUTPUT_32K	0xc600004c
+			IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31			0x06000021
+			IMX8QM_SCU_GPIO0_02_LSIO_GPIO0_IO30			0x00000021
+			IMX8QM_QSPI1A_DATA0_LSIO_GPIO4_IO26			0x00000021
+		>;
+	};
+};
-- 
2.47.3

