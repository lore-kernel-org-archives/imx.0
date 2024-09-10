Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41348186E56
	for <imx@lists.linux.dev>; Tue, 10 Sep 2024 07:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725954080; cv=none; b=rNaHwkgo+/ciLP4UmowBYlRFDT+gCev1xX9LKIHUsDOfz2cP70TuYA1dzF6xj+OOPwgdJnFBPXkkOnSiZHC3p5gY92L8ssU1/5Id37n7sZKMalXA/NMvAUXXHFcfprNGZ1wWyX4IFhYq96AMGaKkmZ2JxUwM4EpNzHAprCylAX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725954080; c=relaxed/simple;
	bh=8uO+euh4dZ2JsdT0ibbqmLE0P4Hx3ZTvP4vIhWtm14Y=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=tj9MmRP2TIpiPaJZBwOSCL11YhLlgejXl+p6RleDFFJX4DlD82fuRzZpI405wRmBHsbXjM9rCNjor5PNM9I64H6H0jZ4s2b9S+EvTajl53Vahi+TnUDC4Ly2UIdlz11w0YnoU84/pi6zlIZaOi95TxzrnjKVA7L3sdVU4EcVPcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5A90F200633;
	Tue, 10 Sep 2024 09:41:10 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 202E7200649;
	Tue, 10 Sep 2024 09:41:10 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7F089180031E;
	Tue, 10 Sep 2024 15:41:08 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com
Subject: [PATCH 3/3] arm64: dts: imx93-9x9-qsb: Add PDM microphone sound card support
Date: Tue, 10 Sep 2024 15:19:32 +0800
Message-Id: <1725952772-30357-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1725952772-30357-1-git-send-email-shengjiu.wang@nxp.com>
References: <1725952772-30357-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Add PDM micphone sound card support, configure the pinmux.

This sound card supports recording sound from PDM microphone
and convert the PDM format data to PCM data.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../boot/dts/freescale/imx93-9x9-qsb.dts      | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index d213a5343803..1340f5462d11 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -122,6 +122,18 @@ simple-audio-card,codec {
 		};
 	};
 
+	sound-micfil {
+		compatible = "fsl,imx-audio-card";
+		model = "micfil-audio";
+		pri-dai-link {
+			link-name = "micfil hifi";
+			format = "i2s";
+			cpu {
+				sound-dai = <&micfil>;
+			};
+		};
+	};
+
 	sound-wm8962 {
 		compatible = "fsl,imx-audio-wm8962";
 		model = "wm8962-audio";
@@ -266,6 +278,12 @@ pcal6524: gpio@22 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pcal6524>;
 
+		mic-can-sel-hog {
+			gpio-hog;
+			gpios = <17 GPIO_ACTIVE_HIGH>;
+			output-low;
+		};
+
 		exp-sel-hog {
 			gpio-hog;
 			gpios = <22 GPIO_ACTIVE_HIGH>;
@@ -355,6 +373,15 @@ &lpuart1 { /* console */
 	status = "okay";
 };
 
+&micfil {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pdm>;
+	assigned-clocks = <&clk IMX93_CLK_PDM>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <49152000>;
+	status = "okay";
+};
+
 &mu1 {
 	status = "okay";
 };
@@ -535,6 +562,14 @@ MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
 		>;
 	};
 
+	pinctrl_pdm: pdmgrp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
+			MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
+			MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
-- 
2.34.1

