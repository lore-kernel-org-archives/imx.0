Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E238D206E71
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 10:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729074013; cv=none; b=DCMMiZYRoOx/sxhaxvG4SFGiGKmq+Z27HTJRUpWpi5/rQ0hZ/O2NHKOi4N4zHnpVBeYB5cpEEJSe4cvldChZg0Voa8e5cIzmT0JzUxA1QPdS3A/I7L7gqEf8zG0jmuVNC2afNXY+uH9LsVxblxXHSK4FrPHOZx1KTfWqo3+1Yzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729074013; c=relaxed/simple;
	bh=Te3L1RQ5DewJWd1Z3e2P5wkvR0V2l67blCbbLb58RjQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=GBQjWbwy3P1y5xua4i41thuqV5BbS++oSFAQn3QsrE1/oSYMtCG849n7HO6aZhCNIsdTMuUqrJFawx5n3NikbXzuCjuNCRA8mXDgOMGMsGI7cOKQ3hCBTPQvqIz7zL6oLj8m992OmjVb5QZ5qYHytr4t6wUA/ysUWpRRjkz/n6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 56BCB201F6C;
	Wed, 16 Oct 2024 12:20:09 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 24D09201F78;
	Wed, 16 Oct 2024 12:20:09 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7939F183DC03;
	Wed, 16 Oct 2024 18:20:07 +0800 (+08)
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
Subject: [PATCH 3/3] arm64: dts: imx8ulp-evk: Add spdif sound card support
Date: Wed, 16 Oct 2024 17:56:31 +0800
Message-Id: <1729072591-10439-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1729072591-10439-1-git-send-email-shengjiu.wang@nxp.com>
References: <1729072591-10439-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Add spdif sound card support, configure the pinmux.

This sound card supports only playback sound
through HDMI interface.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 7d6d332fa779..290a49bea2f7 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -107,6 +107,18 @@ simple-audio-card,codec {
 			sound-dai = <&bt_sco_codec 1>;
 		};
 	};
+
+	sound-spdif {
+		compatible = "fsl,imx-audio-spdif";
+		model = "imx-spdif";
+		audio-cpu = <&spdif>;
+		audio-codec = <&spdif_out>;
+	};
+
+	spdif_out: spdif-out {
+		compatible = "linux,spdif-dit";
+		#sound-dai-cells = <0>;
+	};
 };
 
 &cm33 {
@@ -187,6 +199,15 @@ &sai5 {
 	status = "okay";
 };
 
+&spdif {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&pinctrl_spdif>;
+	pinctrl-1 = <&pinctrl_spdif>;
+	assigned-clocks = <&cgc2 IMX8ULP_CLK_SPDIF_SEL>;
+	assigned-clock-parents = <&cgc1 IMX8ULP_CLK_SPLL3_PFD1_DIV1>;
+	status = "okay";
+};
+
 &usbotg1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_usb1>;
@@ -325,6 +346,12 @@ MX8ULP_PAD_PTF24__I2S5_RXD3	0x43
 		>;
 	};
 
+	pinctrl_spdif: spdifgrp {
+		fsl,pins = <
+			MX8ULP_PAD_PTF25__SPDIF_OUT1    0x43
+		>;
+	};
+
 	pinctrl_typec1: typec1grp {
 		fsl,pins = <
 			MX8ULP_PAD_PTF3__PTF3           0x3
-- 
2.34.1

