Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873887;
	b=SyjwF8xEg++yK4HnNppcQzCyhX7xKfs2iFXMegu6bkXfO8e/UaVfv1GgcPuLOn7XMMhj
	 YBfvTyFvKqcofa4yEx670Jxxt5vyN3pzzNn5SRci+GlqWssc2NqiYG1Hp3f0Bv2yWe6KT
	 uk8beXizAuUWQcnq11lGZUC+nZvY65Ij2+JFmP5diIxWZ8KNHI/E8W2+BJgvc4ZnR7mWA
	 5c18cfaSNBIdBMHFRafGg0j88r+eYFx08mhwjNn6y4g21HUV993Ew2eeQshU5sXhbzrGB
	 76c3lau1Z5ilRqOK+kYtoPl/NNPsg6j68UMmHNO/FTOz6tRuhMVuf+oXwn/uhquD7Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NgGSt8h/WNnYW96twK1QcR8mvYOaOPJ4mg8us3LTyWY=;
	b=YY2p67WoIEW5uHi4JMoWT6lWJ54bEMY8ccFZVe8pd18m23dsWzY2omcbHyU8eaUmfEea
	 KQAXekKrCbyGMxH8KkoWu39dzEK87oiuQQzWhXFnatqXetDYObxonhxPWNkaMSlrCzQg5
	 /NONECPciCdWy1D4JhgbcD9vYsJCuBA1+uG7khYnRDoQR/P230uciVo3p0ub5pWsSS6TM
	 GeYohNg6tCjkTevq1AI2Uiyr0n1RGMDcIvA7kEZV6RLWW/E4vmzFbPTRJrJlZPpGsr1YU
	 G8UFtybKwuMmMkustYJutPS3I89nvY9UlVM8Jdo0f85LBjcpYZLz8W1EVkNWbdE+1Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LgX4y3PN;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC9F606A337
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 10:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFC9F606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LgX4y3PN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214af2076so11946415e9.0
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 02:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793873885; x=1794478685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NgGSt8h/WNnYW96twK1QcR8mvYOaOPJ4mg8us3LTyWY=;
        b=LgX4y3PNt5jk2iTaof3UboJZm0FA/kvjZIGPB1nfdUoLBitaOZrRW0XCor2/S8Mjp4
         r16Mu5p1u8Z9pSq0HsT1MkbuI4RGpz3ZOJX0mBfkW4mc87XmYcYsgkLZgg/aBitQeGwM
         BL3UIlc7HpM5e10CRlPCwzuMKPGTVlkVlkKci5mFmnXM/XLbPj2TiKD4+ac+ryRsZzLT
         fVu25necDza8LgDjPj51/sW+s1bnSSnvxItEUN8NPLrlmClpdFKe8mGTMmNQ7GO6qYCK
         xCf0TQMKlzMNvCBNDdXQix4OCkve9p4DSqB/UWAJAu7WCUNfAgFh6G/jnBahuoD53C2F
         5hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873885; x=1794478685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgGSt8h/WNnYW96twK1QcR8mvYOaOPJ4mg8us3LTyWY=;
        b=TTP+ClxeXV3iWa7BfuBg70l97A5fzjsfhF/ZozFBb4sBvn8K4i2GRdahTbBsuQf0S2
         /USIjzWtpM8wlJs7jugDAs48WLeMR5q/RWFAkZJsKhRbHwol+ap8/fCTHq/WeLJtwB28
         OoRwXrCHHhyDNG4fB5CaGq1mf5q1TEmY36uAEGgc49/jB44oaQ0fVPERbj3XIYDKJhQr
         II9TQT8lxKNjvYrtFzCPEkk4Pa5A2FCAiFnX1M+9iOv6y/+eiP4ZQ8bU5zwUHSRvytbK
         AAC9LFcpio2k6H++L+eUY2eK0HnoQ32BV46ek5Lj3x46srwXLh+/9ZzqO7PNK0rkWI6f
         LWSA==
X-Forwarded-Encrypted: i=1; AKwUvBxNmbRz/KNcY9lAUD+MX0S9YJ5ongJxwxL5Mo/BOBBx/baXgkG70KWUwp+ZikGZ/Qu+sTg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/me79zs3ULErNUNgUfccQndVMtef7DYdkfonhHuMOLv2aBl5Or
	wZVeWmBRL4Fjv+QwmJ2NqOZ/lzJQKcUJgoJWo85vBBYQZvGRX5e3JJwj
X-Gm-Gg: AYBFou2gDu2T1k1T7DVrJafnGGd3cSlFgmz5KmvpLYR+5tXi7BJjggoXusasM3az1zl
	INcetYv4+pe1Y9+2B/2hehfXPLrtUVS8aSaVKQYqDvtsuN090H6zlU4WhjllkxKAnlJKttlpPKO
	Ea1YGajb+gjuY+wyZh8ysbe0NOwrqjg2aDvrP+wpjzejf3B7VRrSNsjngmcK1AK9H/0aHiZBUD7
	Zmo5PYXQhP3IO6dlFiushaS50Fg7mrtk3lNF6pI/gCJpdiEWkcrgjqsW/UXo8JJ5pcedsQLoy+i
	K3jEReEWo4uCb4wXHlxouqwyXA+tBpGGhY42889oRC+/MUpSYdJIYzf+mT2oQ29cQZgyq7aXNH9
	IUIilVTK+X58Nh8XnZrNyVpw1B8QcVif2sHWEMeiJBalOuzWRsFYnGfrOobwZtbivgGz06yQuVN
	0T1mERUZ3akgj6rmR2LwOV5fU+Bh80wJQulbWSgQzWELIzCIW1X9adgoEeVchCW13I0Aaq2SVOT
	4Dm9OuYiyskHasdttQBI0ufguG4DIfCBMMI7kz9Rq0Bka83iND9FDHMpXUOISN+hyWfPmSk4qtE
	B/w9phXGDJTMBfKIc1uzYPuM+ktPu76CiUdnbSg1N8Xx1tqWdbe6FCMEX9nln34pPuOI0Qh6gs7
	lG5YS7lHsIoBhLW7BdBxoae3hBmDXKWa5yYYCHVqQDl0oXmC5b1Gt
X-Received: by 2002:a05:600c:4704:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4ac18992a21mr374298825e9.29.1793873884933;
        Thu, 05 Nov 2026 02:18:04 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e59d3sm59305215e9.10.2026.11.05.02.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:18:04 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Nate.D@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet LEDs to carrier boards
Date: Thu,  5 Nov 2026 11:17:39 +0100
Message-ID: <20261105101739.10614-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The Ethernet LEDs are physically on the carrier boards, but the
VAR-SOM-MX8MP, DART-MX91, VAR-SOM-MX93 and DART-MX95 module descriptions
include their LED nodes. Other carriers therefore inherit LED definitions
that may not match their wiring.

Move the LED nodes to the Symphony and Sonata board descriptions through
ethphy0 references, along with the LED binding includes where needed.
Keep the existing LED properties unchanged.

Fixes: c277a3d535bb ("arm64: dts: freescale: imx8mp-var-som: Add EQoS support with MaxLinear PHY")
Fixes: d3ad2ce2116f ("arm64: dts: freescale: Add support for Variscite DART-MX91")
Fixes: 947771d00bdc ("arm64: dts: freescale: imx93-var-som: update eqos support for MaxLinear PHY")
Fixes: bec2988b470e ("arm64: dts: freescale: Add support for Variscite DART-MX95")
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 20 -----------------
 .../dts/freescale/imx91-var-dart-sonata.dts   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx91-var-dart.dtsi    | 20 -----------------
 .../dts/freescale/imx93-var-som-symphony.dts  | 21 ++++++++++++++++++
 .../boot/dts/freescale/imx93-var-som.dtsi     | 19 ----------------
 .../dts/freescale/imx95-var-dart-sonata.dts   | 22 +++++++++++++++++++
 .../boot/dts/freescale/imx95-var-dart.dtsi    | 20 -----------------
 8 files changed, 87 insertions(+), 79 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index e928a3d44b1d..49d20db7de5f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -3,6 +3,7 @@
  * Copyright 2024 Variscite Ltd.
  */
 
+#include <dt-bindings/leds/common.h>
 #include "imx8mp-var-som.dtsi"
 
 / {
@@ -129,6 +130,27 @@ ethphy1: ethernet-phy@5 {
 	};
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 61786eee0e82..cbf58aed180a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -8,7 +8,6 @@
 /dts-v1/;
 
 #include <dt-bindings/phy/phy-imx8-pcie.h>
-#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx8mp.dtsi"
 
@@ -155,25 +154,6 @@ ethphy0: ethernet-phy@4 {
 			reset-assert-us = <10000>;
 			reset-deassert-us = <100000>;
 			vddio-supply = <&reg_phy_vddio>;
-
-			leds {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				led@0 {
-					reg = <0>;
-					color = <LED_COLOR_ID_YELLOW>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-
-				led@1 {
-					reg = <1>;
-					color = <LED_COLOR_ID_GREEN>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
index f7e32f9375f5..0f2be56ff7ca 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
@@ -10,6 +10,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "imx91-var-dart.dtsi"
 
 / {
@@ -173,6 +174,27 @@ led@1 {
 	};
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_fec>;
diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
index a9e44efad13f..ec65cd42c195 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
@@ -10,7 +10,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx91.dtsi"
 
@@ -81,25 +80,6 @@ ethphy0: ethernet-phy@0 {
 			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <15000>;
 			reset-deassert-us = <100000>;
-
-			leds {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				led@0 {
-					reg = <0>;
-					color = <LED_COLOR_ID_YELLOW>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-
-				led@1 {
-					reg = <1>;
-					color = <LED_COLOR_ID_GREEN>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 1f0954620195..477f31a4cf88 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -189,6 +189,27 @@ vddio1: vddio-regulator {
 	};
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &fec {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_fec>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index b0ffcb534cb6..d9ecbc3e9a6d 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -75,25 +75,6 @@ ethphy0: ethernet-phy@0 {
 			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <100000>;
-
-			leds {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				led@0 {
-					reg = <0>;
-					color = <LED_COLOR_ID_YELLOW>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-
-				led@1 {
-					reg = <1>;
-					color = <LED_COLOR_ID_GREEN>;
-					function = LED_FUNCTION_LAN;
-					linux,default-trigger = "netdev";
-				};
-			};
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 9344a0d99418..ed3e2e1b995c 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -8,6 +8,7 @@
  *
  */
 
+#include <dt-bindings/leds/common.h>
 #include "imx95-var-dart.dtsi"
 
 / {
@@ -163,6 +164,27 @@ &enetc_port2 {
 	status = "okay";
 };
 
+&ethphy0 {
+	leds {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@0 {
+			reg = <0>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+
+		led@1 {
+			reg = <1>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
 &flexcan1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan1>;
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
index b4c55bd33858..92ff09fe64a7 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart.dtsi
@@ -10,7 +10,6 @@
 
 /dts-v1/;
 
-#include <dt-bindings/leds/common.h>
 #include <dt-bindings/usb/pd.h>
 #include "imx95.dtsi"
 
@@ -193,25 +192,6 @@ ethphy0: ethernet-phy@0 {
 		reset-gpios = <&gpio5 16 GPIO_ACTIVE_LOW>;
 		reset-assert-us = <10000>;
 		reset-deassert-us = <100000>;
-
-		leds {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			led@0 {
-				reg = <0>;
-				color = <LED_COLOR_ID_YELLOW>;
-				function = LED_FUNCTION_LAN;
-				linux,default-trigger = "netdev";
-			};
-
-			led@1 {
-				reg = <1>;
-				color = <LED_COLOR_ID_GREEN>;
-				function = LED_FUNCTION_LAN;
-				linux,default-trigger = "netdev";
-			};
-		};
 	};
 };
 
-- 
2.47.3

