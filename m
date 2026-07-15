Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1B63502A6
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125379; cv=none; b=Q0rpGqJhoMaESmXBaGokzXXoz1bpVuLCg9vEH4X8QT4cPbOJv71WzrmJitMlHj5CjLNlefpH+e9U5t4a/mVKOqH3I3hqmzY20yNWhqGeDi1vebakX2tCFQ3LMnYv+SXt+I9Mjyr9cvlxsu2oPVyyb8Q9PZKO2TTJjQCe/Q03NNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125379; c=relaxed/simple;
	bh=4EldnH2ExTffP0z0gITXODHOKRoDxNq6UHbk0zExkao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RI4DdN9vBBsVd/lGc0xojNlgACc4YPNYVJsFyGFGe/lBGqOOgcjZsHuA+4ZVF9W8xrRGJQyk1RzF68zoMglOHGcD1dqhQE+Imz51emiuCRLb7H8G8dDjInvOS8V5N+BhbjM+l93yD4Zfk9saLhOAgA4u11bveP8LUVhoF3yDk5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=r7C1eKLS; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="r7C1eKLS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D49444E40DE6;
	Wed, 15 Jul 2026 14:22:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A791A6035C;
	Wed, 15 Jul 2026 14:22:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC25611BD1518;
	Wed, 15 Jul 2026 16:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784125373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xkPDvJCyj18SKQgS56+fB0yY1lwLuFQi8fyXnXcclp0=;
	b=r7C1eKLS2Yo3OAp/FoJ0P/5zMJidOL2VfmZsIHbrp79XtBeFdRkutsS1NhdEPly0rQ6AGU
	ZmG7p3EQ0l3EptFpsHkwZM+FffAfG25YvVqRrPenVk40RjR12i2QF9OP1vvohiFfExOSxT
	BCgQ29e+PpVPocP/EDbRhgQtvKMszHJyevK78fBteZ7iyy9mPa8hS3OHm3agaEYxOaOAsp
	fmbi2PRvR6RzrMOtqHnHa43pQnIwM/jZJMHmhJyloqhvTtE4wZPdvnEG0396/Kf8TyYCyD
	qdMKpE0dPKnk5Yl6leW/x5pOuZkXwySddaEuzXJFe2GLeQTjcudJoP7M1zkFww==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 15 Jul 2026 16:22:18 +0200
Subject: [PATCH v2 1/7] arm64: dts: freescale: Import optee node from
 u-boot i.MX91 and i.MX93 device trees
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-mathieu-uboot-dts-import-v2-1-bc931417bd0e@bootlin.com>
References: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
In-Reply-To: <20260715-mathieu-uboot-dts-import-v2-0-bc931417bd0e@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Wei Xu <xuwei5@hisilicon.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, openbmc@lists.ozlabs.org, 
 Tom Rini <trini@konsulko.com>, Peter Robinson <pbrobinson@gmail.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784125361; l=5282;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=4EldnH2ExTffP0z0gITXODHOKRoDxNq6UHbk0zExkao=;
 b=CzJFdxaRArl0cMxpwFzbbL5/P9a3yqG/Hgcykp8YYcWOSX4s1cPjEYsuqfHZ+H7yF0FD5mIwt
 /tBKKNpR8QKD3MxahEsgGYs86rN7MeXs9MIvZnQQXJcORKp8KLsx2ub
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3

U-Boot is importing kernel device trees for these platforms, but adding
a firmware node to enable communication with OP-TEE. Importing
changes here will allow to remove these additions in U-Boot.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts        | 7 +++++++
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts       | 7 +++++++
 arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts   | 7 +++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts        | 7 +++++++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts          | 7 +++++++
 arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts | 7 +++++++
 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts   | 7 +++++++
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 7 +++++++
 8 files changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 5716febb5a50..c7050bafacae 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -110,6 +110,13 @@ linux,cma {
 		};
 	};
 
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
 	sound-wm8962 {
 		compatible = "fsl,imx-audio-wm8962";
 		model = "wm8962-audio";
diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
index c25561574d3f..c0156921414f 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
@@ -152,6 +152,13 @@ linux,cma {
 		};
 	};
 
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
 	soc@0 {
 		bootph-all;
 		bootph-pre-ram;
diff --git a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
index 022e9c6841ef..62b6eff013f1 100644
--- a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
@@ -35,6 +35,13 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
 	flexcan1_tc: can-phy0 {
 		/* TI SN65HVD234D CAN-CC 1MBit/s */
 		compatible = "ti,tcan1043";
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index c6db9c85f2ac..0bea169d7029 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -42,6 +42,13 @@ reg_usdhc3_vmmc: regulator-usdhc3 {
 		enable-active-high;
 	};
 
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
 	usdhc3_pwrseq: usdhc3_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 01c11c517986..6b99c0594125 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -147,6 +147,13 @@ reg_usdhc3_vmmc: regulator-usdhc3 {
 		enable-active-high;
 	};
 
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
 	sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
index 4620c070f4d7..b8fa0cda33b2 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
@@ -62,6 +62,13 @@ reg_vcc_panel: regulator-vcc-panel {
 		regulator-min-microvolt = <3300000>;
 		regulator-name = "VCC_PANEL";
 	};
+
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
 };
 
 &eqos { /* Second ethernet (OSM-S ETH_B) */
diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index d929aa9ff255..e96b8437f922 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -36,6 +36,13 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
 	flexcan1_tc: can-phy0 {
 		compatible = "ti,tcan1043";
 		#phy-cells = <0>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 409c7e74ffe3..20eaabc23b49 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -125,6 +125,13 @@ ele_reserved: ele-reserved@87de0000 {
 		};
 	};
 
+	firmware {
+		optee: optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 

-- 
2.47.3

