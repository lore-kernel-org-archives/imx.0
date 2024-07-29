Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB40A77F1B
	for <imx@lists.linux.dev>; Mon, 29 Jul 2024 01:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722218364; cv=none; b=TqomYXLy3Eh37TQKa5kwhje2ss6UCoZ3AiKpJK16QNrvMAGNAnAgwqjeNChxDyHUHTb9p6xkFv6Wm4DPkjpBua8fE4JoIH1u2IQxcPadamcPoK8Rz8BQE+RpKgqjjY2g6qfdwE8VWZrxbR1aRCsCoyawS6Z6G6gsxMzPjWWHyLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722218364; c=relaxed/simple;
	bh=RY6dQrLhBnat8376gBmKhLU6cahF5wDO87eQQG+/kLI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=LQYVPNeFXeZn/Xkq2Wl4RAB9oPmL3jrQO1sHUkaU0hqwTbiMqoBQBlehzae6UIcmsP+BuA/UV42XQfEH90ymzBmUEmpxz5NK3qTHh//ekuHCiZstqSctKXqn9L49CNFq7MAhF7ohoMRbyz3GyoOkzinRvakdFNJ//S/Yl9dEuJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 913F0200134;
	Mon, 29 Jul 2024 03:59:14 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5954A201262;
	Mon, 29 Jul 2024 03:59:14 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B9F62181D0F9;
	Mon, 29 Jul 2024 09:59:12 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: shengjiu.wang@gmail.com
Subject: [PATCH v2 2/4] arm64: dts: imx93-11x11-evk: add bt-sco sound card support
Date: Mon, 29 Jul 2024 09:39:57 +0800
Message-Id: <1722217199-10640-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1722217199-10640-1-git-send-email-shengjiu.wang@nxp.com>
References: <1722217199-10640-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Add bt-sco sound card, which is used by BT HFP case.
It supports wb profile as default

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index a15987f49e8d..5ebf25726c33 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -80,6 +80,30 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		off-on-delay-us = <12000>;
 		enable-active-high;
 	};
+
+	bt_sco_codec: bt-sco-codec {
+		compatible = "linux,bt-sco";
+		#sound-dai-cells = <1>;
+	};
+
+	sound-bt-sco {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "bt-sco-audio";
+		simple-audio-card,format = "dsp_a";
+		simple-audio-card,bitclock-inversion;
+		simple-audio-card,frame-master = <&btcpu>;
+		simple-audio-card,bitclock-master = <&btcpu>;
+
+		btcpu: simple-audio-card,cpu {
+			sound-dai = <&sai1>;
+			dai-tdm-slot-num = <2>;
+			dai-tdm-slot-width = <16>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&bt_sco_codec 1>;
+		};
+	};
 };
 
 &adc1 {
@@ -345,6 +369,17 @@ &mu2 {
 	status = "okay";
 };
 
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_sai1>;
+	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	assigned-clocks = <&clk IMX93_CLK_SAI1>;
+	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -528,6 +563,24 @@ MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
 		>;
 	};
 
+	pinctrl_sai1: sai1grp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
+			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
+			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00		0x31e
+			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00		0x31e
+		>;
+	};
+
+	pinctrl_sai1_sleep: sai1sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
+			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
+			MX93_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
+			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
+		>;
+	};
+
 	/* need to config the SION for data and cmd pad, refer to ERR052021 */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-- 
2.34.1

