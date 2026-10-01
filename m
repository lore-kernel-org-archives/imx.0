Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373313AE6F4
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870074; cv=none; b=djmA/gQjkVTC25NGz0p5IW2scxkOExIKKFf/ct3nHE75zKqsS7kCqdKmGNjBxjJ4Zbziu3nNOHfXGR1knQ4bZaBW1a/eSFLcMB8sVYHyhoUAEI3t+ASrdj2P8wIDuuofrxT1/edG5BHNbS9WGWwSC+OsCanSOyhavDZnIijbD5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870074; c=relaxed/simple;
	bh=dHV1S0743ZWwIgXm5VDJrijPJE34+rYwyTI38JNTUhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LAdUBYZDIBAeJ7kJvIpHx7wmvkt5IzpG7t6sObbmn9GoZ2IuSwEBIglyA2EHKYBQm+c51xSWRqwuMiO8k05l2znI5pDmcLo6EuyP2rfdLEwGWtmtM62ck/FsYGUiD5fy8sBe2oBSWeTX4MGPuRcsReLxJ1ITImbL+9pKf8ksj/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1ddCskA; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1ddCskA"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so3943245f8f.1
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870069; x=1791474869; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5CGv0/6w5gVrsPF9zExhSI+JtnFir6oWba07h7nJSU=;
        b=g1ddCskA05FdsvKc8bcvqaUhAsSkRefMx6HXe+bRv0JGlpvbFI5D/97Tfn4pcOApJM
         WPRJ61NLHlFLaMMxS/SJ2ef9oCC9BBXqy8Iee9ihnLK2bvlX1NS5DhYuckSATTW1ERv+
         N3ih1rJfK74vw9gazmhgJa4XYfvGkfSSvh/qCDNMK6/Cx51AEi6coTiOGxwnE23bd3fd
         yFCbLQvaMz5N+R/p09TjB2ihfVXMYfAPE1OMw5kkrxLmNvCU8iM+gmWXElcrWd65pAUG
         +hXKvC51Az5t7bcjfPkx35rtiKGevekhEwuF6lQo6GQcgjRcq+bwXS8X1ygC/a3mzEzs
         ZGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870069; x=1791474869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5CGv0/6w5gVrsPF9zExhSI+JtnFir6oWba07h7nJSU=;
        b=ukucOZ/6pRrCXQ33s3+HnifqzgajGgWH2jYn2Q8XqaAmm04F/5a6rC/wwQZTnC7MDv
         fpRgY1d8ShxwY6sNE1Eys0LYGIVXBJU/PtJy9WfvExkYjIxKmop69CGCGtOb772GKrmF
         E8NPJ3vXW7K9IM6hCM/rCrsNL3RPBnAeCKrLDl2DuiENUu00vcueRB5RMx1Yp7+UcSJT
         XLdqnOkFgHu/j74NZEk3lcpubRBtmmLbDIahDLhxygp7FArApUUVtX7CUgML+w1Xx3ea
         D8LFzdJp3kHmIp2xVZWs4M1BLkkmoIs80ZVeGiaKvmhlb3VFxnkY8EN8g1LNq7V2Xg/N
         8C1g==
X-Forwarded-Encrypted: i=1; AKwUvBzlPJz7i79g46ApPodSN6kD/24CrZAh1dHqlpHNxzUZqKkFXKPcsg1F3mg+5iG/yC+j134=@lists.linux.dev
X-Gm-Message-State: AFq9FYJynBVAcWCtPiGWxi1VyFPoX+N7qfgWBNUT/tMmLX1cqc3UELrI
	aKMTm8fBO4YgNbkBPaSWJC+QwOgf0En9ObpYflwGJlLd1zTrPuOOEVgG
X-Gm-Gg: AYBFou0mDbfHoHNQXj6KmiT4AdHXnupyOCmbLu+PLQiLAQCUiyCj6rBgUBlmViGiBPC
	iMFOW6rAHxen7GHgKyAB/rWuUUXbXn5IJcI+DqQBBaEn2J1r4kOCKLndG1tqqboPK2mRgtpoCbd
	QbwIBNiRvCqNCZOLuBofgAN2wH0O/nIXYNicqahlJoH0yYoa9L5dLe7bmU0d8J7s81XozAO/jiB
	1sBxGp50n8Oo56Bf2sLeE5kxr64h+X1ASmE+qVkIUAUMgROJS2rDRukjDhQaSzeQ8PrG0TbCFQY
	jRNiclzVReeEn1lw7RXnx8WHVDZ9YwoPUKmc+9JoBc5ltTQRef+S6+X/9/b8bt52xmVshFNkmov
	uMHznBhsrfmxqnhZ4hd2ik4f81NsPKbKraoNwKg/hpVCzLoVX5WAVMsOtaOJb0fcybBEEHItkAv
	jL7S5BD72PApHlP+ugQTmA6SNBVJD99KDv4fqOeoqwnJEp8z9nskGU9nbku5jnnnVywAHfnMFKH
	x+wPsFdqZgaAtkGI8mGDHA3feodItQ+70utyP0AJsP+ghl9hmLHYJPaQAX3/ZmK0unvTmIWFEzU
X-Received: by 2002:a05:6000:41c6:b0:487:81c:6de with SMTP id ffacd0b85a97d-48b1271f670mr44164f8f.34.1790870069033;
        Thu, 01 Oct 2026 08:54:29 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:28 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 10.1" LVDS
Date: Thu,  1 Oct 2026 12:52:53 -0300
Message-ID: <20261001155412.3177428-4-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via the Apalis iMX6 LDB.

The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the
touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Remove the panel-lvds node from the Apalis iMX6 dtsi, as it is an
external component that does not exist at the SoM level.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++
 ...6q-apalis-panel-cap-touch-10inch-lvds.dtso | 53 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 13 -----
 3 files changed, 59 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 32d77a59c4358..23fcc80d7f309 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -99,6 +99,10 @@ imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-hdmi.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -233,6 +237,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -243,6 +248,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 0000000000000..a84114e1d3fba
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Apalis iMX6 LDB
+ * on carrier boards with a Toradex standard LVDS display connector.
+ *
+ * https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	panel-lvds {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3_sw>;
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+};
+
+&atmel_mxt_ts {
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	lvds-channel@0 {
+		reg = <0>;
+
+		status = "okay";
+	};
+};
+
+&lvds0_out {
+	remote-endpoint = <&lvds_panel_in>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index 5fcd7cdb7001f..e52b55a386f7a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -95,18 +95,6 @@ lcd_panel_in: endpoint {
 		};
 	};
 
-	panel_lvds: panel-lvds {
-		compatible = "panel-lvds";
-		backlight = <&backlight>;
-		status = "disabled";
-
-		port {
-			lvds_panel_in: endpoint {
-				remote-endpoint = <&lvds0_out>;
-			};
-		};
-	};
-
 	poweroff {
 		compatible = "regulator-poweroff";
 		cpu-supply = <&vgen2_reg>;
@@ -738,7 +726,6 @@ port@4 {
 			reg = <4>;
 
 			lvds0_out: endpoint {
-				remote-endpoint = <&lvds_panel_in>;
 			};
 		};
 	};
