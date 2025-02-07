Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B2B1B0404
	for <imx@lists.linux.dev>; Fri,  7 Feb 2025 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917445; cv=none; b=aGXlmcTWGremKzVbqeRxreeSxfTB9i8M4NMlxHBujxaYXrCSK4wgK53QnmYk3Hu+q3fbaEwB6HvodMm42hVFba988H5hAEWGx799xjUNgJGp/Jlkroqf7xrFqBTjvmksvVnGG+5U0e2t8ZEx35ZuqEkAPJ32sd0k91lfOD+CLbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917445; c=relaxed/simple;
	bh=bq/lLCjQ6VWIRxCR+ZE8uIvjiTU4fucNbZqeRS7diDY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eB5kePf3pHn7fZlv3Qvd4Ebece7nXnxRhZuSL1A/rfOI3dOep6Nd66RfO4HBuhK+Fh12hTMOvwv76heCzTtonl6+N3sL88sx+9UgVpQOgzh9/NOUmQZU3gMbANYcbVMXicBUbfBs33TwQ7c4mFd0OjFH1nH41fl1vc49XjxYuK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=VOfWmxdH; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=VshXCGBP reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="VOfWmxdH";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="VshXCGBP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917444; x=1770453444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=98XzszvcCjQJEF2tXVldV+69/mXg+DLRoGxZouujLP8=;
  b=VOfWmxdHKJZzUsW7LKUO6vkMtDGlTBGaajr3ZFVDVQq+ur7qRtSFGI88
   XCzczz4GngMoPt9lZPE4WTyIrwFvCADBtfWMJ7kkEhJLU4uyUXLOeldNo
   WxyDcd30BZGqJvKULyL2nZ4TTWg6gQgvj4DsnPYiO7ySU7rOTa5x/fnQR
   oSP98UywPXCd83j7pZ7OKVssdNeC3KlKGC1JNccb79e8CkJ9bNcgO5faV
   8C/6ir55Yn0Jlu63k2FuxDoQnD8LM1eN61GJQSZVRdSjGENwd82ZP/NuI
   YEoJnys46BnHBkHiMgkdd3SkRa2nfQ1z7HtDo6LlYNSKUq++sR12/ZBcs
   Q==;
X-CSE-ConnectionGUID: MsRTS5XDS8OnJS4kJdkQgw==
X-CSE-MsgGUID: 9Sqk+iM+RYS04VqIBbh2RQ==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636102"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:37:02 +0100
X-CheckPoint: {67A5C62C-2D-FED1349E-E4B4C63E}
X-MAIL-CPID: 607DE8D44A58629E98D921862FA3EA60_2
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D87B168339;
	Fri,  7 Feb 2025 09:36:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=98XzszvcCjQJEF2tXVldV+69/mXg+DLRoGxZouujLP8=;
	b=VshXCGBPZlVEaw1abS7AnpJ4PuKTqvHcMNMksPfryWbQ4WpxY9T36XQjnh0Uu/6W3Apgtx
	zd6PQUlR7xY3o15z3+uVNLJhO2um8Y8mJSyCABTjtx7EbY2Cxj2BHEuUc+vfLrSeg/xmFm
	pLeo5TgHm8RlxEUleJX773rVBPZTGf2eXiA7J2KKoU7UCH4oEQYSeiIdSo83GBn7aBfuX1
	midqM9skdaE65Sz0sPkN/9Ht2Ft1aL/vLPL1HhNSbo7oyNbzok1Q9KePypOJBMI+mo3TS0
	DTOA4Y8ENkpykbujpslZLGEcoQQFpPR4xk6LUKhedT3m5zi+pYcwm8mtiIkP8w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/10] arm64: dts: imx8mp: Add access-controller references
Date: Fri,  7 Feb 2025 09:36:11 +0100
Message-Id: <20250207083616.1442887-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Mark ocotp as a access-controller and add references on peripherals
which can be disabled (fused).

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 66f7988271493..ee1cdfb660cf3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include "imx8mp-ocotp.h"
 #include "imx8mp-pinfunc.h"
 
 / {
@@ -670,6 +671,7 @@ ocotp: efuse@30350000 {
 				/* For nvmem subnodes */
 				#address-cells = <1>;
 				#size-cells = <1>;
+				#access-controller-cells = <2>;
 
 				/*
 				 * The register address below maps to the MX8M
@@ -1137,6 +1139,7 @@ flexcan1: can@308c0000 {
 					assigned-clock-rates = <40000000>;
 					fsl,clk-source = /bits/ 8 <0>;
 					fsl,stop-mode = <&gpr 0x10 4>;
+					access-controllers = <&ocotp IMX8MP_OCOTP_CAN_DISABLE>;
 					status = "disabled";
 				};
 
@@ -1152,6 +1155,7 @@ flexcan2: can@308d0000 {
 					assigned-clock-rates = <40000000>;
 					fsl,clk-source = /bits/ 8 <0>;
 					fsl,stop-mode = <&gpr 0x10 5>;
+					access-controllers = <&ocotp IMX8MP_OCOTP_CAN_DISABLE>;
 					status = "disabled";
 				};
 			};
@@ -1371,6 +1375,7 @@ fec: ethernet@30be0000 {
 				nvmem-cells = <&eth_mac1>;
 				nvmem-cell-names = "mac-address";
 				fsl,stop-mode = <&gpr 0x10 3>;
+				access-controllers = <&ocotp IMX8MP_OCOTP_ENET1_DISABLE>;
 				status = "disabled";
 			};
 
@@ -1395,6 +1400,7 @@ eqos: ethernet@30bf0000 {
 				nvmem-cells = <&eth_mac2>;
 				nvmem-cell-names = "mac-address";
 				intf_mode = <&gpr 0x4>;
+				access-controllers = <&ocotp IMX8MP_OCOTP_ENET2_DISABLE>;
 				status = "disabled";
 			};
 		};
@@ -1526,6 +1532,7 @@ easrc: easrc@30c90000 {
 					firmware-name = "imx/easrc/easrc-imx8mn.bin";
 					fsl,asrc-rate = <8000>;
 					fsl,asrc-format = <2>;
+					access-controllers = <&ocotp IMX8MP_OCOTP_ASRC_DISABLE>;
 					status = "disabled";
 				};
 
@@ -1582,6 +1589,7 @@ xcvr: xcvr@30cc0000 {
 					dmas = <&sdma2 30 2 0>, <&sdma2 31 2 0>;
 					dma-names = "rx", "tx";
 					resets = <&audio_blk_ctrl 0>;
+
 					status = "disabled";
 				};
 			};
@@ -1701,6 +1709,7 @@ isp_0: isp@32e10000 {
 				clock-names = "isp", "aclk", "hclk";
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
 				fsl,blk-ctrl = <&media_blk_ctrl 0>;
+				access-controllers = <&ocotp IMX8MP_OCOTP_IMG_ISP1_DISABLE>;
 				status = "disabled";
 
 				ports {
@@ -1723,6 +1732,7 @@ isp_1: isp@32e20000 {
 				clock-names = "isp", "aclk", "hclk";
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_ISP>;
 				fsl,blk-ctrl = <&media_blk_ctrl 1>;
+				access-controllers = <&ocotp IMX8MP_OCOTP_IMG_ISP2_DISABLE>;
 				status = "disabled";
 
 				ports {
@@ -1743,6 +1753,7 @@ dewarp: dwe@32e30000 {
 					 <&clk IMX8MP_CLK_MEDIA_APB_ROOT>;
 				clock-names = "axi", "ahb";
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_DWE>;
+				access-controllers = <&ocotp IMX8MP_OCOTP_IMG_DEWARP_DISABLE>;
 			};
 
 			mipi_csi_0: csi@32e40000 {
@@ -1760,6 +1771,7 @@ mipi_csi_0: csi@32e40000 {
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
 							 <&clk IMX8MP_CLK_24M>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_1>;
+				access-controllers = <&ocotp IMX8MP_OCOTP_MIPI_CSI1_DISABLE>;
 				status = "disabled";
 
 				ports {
@@ -1795,6 +1807,7 @@ mipi_csi_1: csi@32e50000 {
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_250M>,
 							 <&clk IMX8MP_CLK_24M>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_CSI2_2>;
+				access-controllers = <&ocotp IMX8MP_OCOTP_MIPI_CSI2_DISABLE>;
 				status = "disabled";
 
 				ports {
@@ -1829,6 +1842,7 @@ mipi_dsi: dsi@32e60000 {
 				samsung,pll-clock-frequency = <24000000>;
 				interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 				power-domains = <&media_blk_ctrl IMX8MP_MEDIABLK_PD_MIPI_DSI_1>;
+				access-controllers = <&ocotp IMX8MP_OCOTP_MIPI_DSI1_DISABLE>;
 				status = "disabled";
 
 				ports {
@@ -1976,6 +1990,7 @@ ldb_from_lcdif2: endpoint {
 						};
 
 						port@1 {
+							access-controllers = <&ocotp IMX8MP_OCOTP_LVDS1_DISABLE>;
 							reg = <1>;
 
 							ldb_lvds_ch0: endpoint {
@@ -1983,6 +1998,7 @@ ldb_lvds_ch0: endpoint {
 						};
 
 						port@2 {
+							access-controllers = <&ocotp IMX8MP_OCOTP_LVDS2_DISABLE>;
 							reg = <2>;
 
 							ldb_lvds_ch1: endpoint {
@@ -2198,6 +2214,7 @@ pcie: pcie@33800000 {
 			reset-names = "apps", "turnoff";
 			phys = <&pcie_phy>;
 			phy-names = "pcie-phy";
+			access-controllers = <&ocotp IMX8MP_OCOTP_PCIE1_DISABLE>;
 			status = "disabled";
 		};
 
@@ -2227,6 +2244,7 @@ pcie_ep: pcie-ep@33800000 {
 			phy-names = "pcie-phy";
 			num-ib-windows = <4>;
 			num-ob-windows = <4>;
+			access-controllers = <&ocotp IMX8MP_OCOTP_PCIE1_DISABLE>;
 			status = "disabled";
 		};
 
@@ -2245,6 +2263,7 @@ gpu3d: gpu@38000000 {
 						 <&clk IMX8MP_SYS_PLL1_800M>;
 			assigned-clock-rates = <800000000>, <800000000>;
 			power-domains = <&pgc_gpu3d>;
+			access-controllers = <&ocotp IMX8MP_OCOTP_GPU3_DISABLE>;
 		};
 
 		gpu2d: gpu@38008000 {
@@ -2259,6 +2278,7 @@ gpu2d: gpu@38008000 {
 			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
 			assigned-clock-rates = <800000000>;
 			power-domains = <&pgc_gpu2d>;
+			access-controllers = <&ocotp IMX8MP_OCOTP_GPU2_DISABLE>;
 		};
 
 		vpu_g1: video-codec@38300000 {
@@ -2270,6 +2290,7 @@ vpu_g1: video-codec@38300000 {
 			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
 			assigned-clock-rates = <600000000>;
 			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G1>;
+			access-controllers = <&ocotp IMX8MP_OCOTP_VPU_G1_DISABLE>;
 		};
 
 		vpu_g2: video-codec@38310000 {
@@ -2281,6 +2302,7 @@ vpu_g2: video-codec@38310000 {
 			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
 			assigned-clock-rates = <500000000>;
 			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
+			access-controllers = <&ocotp IMX8MP_OCOTP_VPU_G2_DISABLE>;
 		};
 
 		vpumix_blk_ctrl: blk-ctrl@38330000 {
@@ -2313,6 +2335,7 @@ npu: npu@38500000 {
 				 <&clk IMX8MP_CLK_ML_AHB>;
 			clock-names = "core", "shader", "bus", "reg";
 			power-domains = <&pgc_mlmix>;
+			access-controllers = <&ocotp IMX8MP_OCOTP_NPU_DISABLE>;
 		};
 
 		gic: interrupt-controller@38800000 {
@@ -2362,6 +2385,7 @@ usb3_0: usb@32f10100 {
 			#size-cells = <1>;
 			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
 			ranges;
+			access-controllers = <&ocotp IMX8MP_OCOTP_USB1_DISABLE>;
 			status = "disabled";
 
 			usb_dwc3_0: usb@38100000 {
@@ -2405,6 +2429,7 @@ usb3_1: usb@32f10108 {
 			#size-cells = <1>;
 			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
 			ranges;
+			access-controllers = <&ocotp IMX8MP_OCOTP_USB2_DISABLE>;
 			status = "disabled";
 
 			usb_dwc3_1: usb@38200000 {
@@ -2430,6 +2455,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&ocotp IMX8MP_OCOTP_AUDIO_PROCESSOR_DISABLE>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1

