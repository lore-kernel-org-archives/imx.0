Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6E252B1F3
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870077; cv=none; b=bhg8xiyhgExH0DI3DL/TkJdCiGSSTPrqdB5yyuqFqqMC/loH/KfOorwT+6AZTL5PBYlXHq9cjcEjQXS90nbu9gv7jXDK0H77VSVnUKW50iYuYc79zHlGQxrEJ8t+ZWfIaw+krpwpYyA/mPl4A7rXDNFCtj1Q2cG/PjWQcEFRA9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870077; c=relaxed/simple;
	bh=9bZ3n8SEQUaRJFAktv+2UUvSvnhVyiwRZSDjh7U7/3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sPAHJXLPBVIWWZzS3DWqr24OjteU4+fzsqxhKniWzqVs1gB1C22O6YQv+t+kdR78GuB/Eyc1pu3nlM8y09LvC1acrWLsY+tVKzEMx+uvcUjhfk8qYEsAwZBcJXqo3NWUFE3BsKW+5USIJxyFXWuM0Lh2vsyAXuzSZ5x4HdFGEFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9OxhvKV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9OxhvKV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so44231015e9.0
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870073; x=1791474873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxLL8/GhtZ1Sfah1ve0H9FwsCRorx+JEuAG5P+fUACg=;
        b=p9OxhvKVl2q3R8r4kGBTMkGGzK1tDSgwMUjrlM6KdpxsGClejJUMRoXzmIVS76YM07
         pGEfjk4L3xVW+oCS54V55pKr6MnZ6pHep9nhVYg+i4M8sHTs6qOqnxBHMcdyq7gFAYiR
         EpvfgqX1DwMll1ym5tVLUk270bjbCyo47HP60Dz8J8GZ3zIYqR9wFaejIZwmLkckR6Sg
         tGGfzsuElq1w8TAh9QL426/r7j9BI1fnLsqclZYKteGN+Q8Qwm6LoT4bI1oOHZhOSwZG
         0+bGlgJGNO10nZMckixBp+Hn+Yw78pSKuv9vEc4G1xlijFjOjXOjg0EVZbp/zJ5pTH2V
         GKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870073; x=1791474873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DxLL8/GhtZ1Sfah1ve0H9FwsCRorx+JEuAG5P+fUACg=;
        b=GYTu7tuls4NyjXNlzcIjppWb4UsxiPxz1QTRr2l1ZSVZSMuS39/YVTmNxHNKvfecSC
         Tdh0yzUSh/q7za+NZHZ+D8At8M1f/qxiRNReUx9gXF7RpVNMl0e+YEfOsE2FiYSZZjEG
         5Z5CRmCzJeFdLGXrJ9/Ez0RrbDBDzWf4OhqOSkea4Q+qxS0amM+s1GBSiMpikpRQ0qIq
         UoMgP9FP5h5oqduA9O7Y2U6BRO7BZmrOk0KKaD9MbI/4YZTJLrp8uN3BBjUQTafOcJ46
         JZjR4bAGZN0wjnUDifzgAr0K8PIHoNCQXD2Lbcoyz3XBWSNVyEMJprAxLElEzYz1eOXR
         2cLw==
X-Forwarded-Encrypted: i=1; AKwUvBzv6A3PzSoNjWF1KYJenx5542vz+sSx5UWkbodHF0E2r2zLRPCaqEHoxCUsNOXLqWQn2o4=@lists.linux.dev
X-Gm-Message-State: AFuF++l2Ei2+22wjVSaWqrpIcoPo8/9U6gRBW9j2Ij4QbD4aeaTT0xrD
	HAGJKrX0yBB70rkTvw+MocL3LxcfcdxSwvaIzyUvqXoldqiMH5pSm5zf
X-Gm-Gg: AYBFou3ehnqbFc7jaVUy4nmx1rKNgno9lKECHgcdco11QFmZJtNXDIbvGita5XVyJTR
	DqsULnegZzwprV20bjEwNjQX/ZmJasjBPWsvN/RtulJZE7szUDiI1bHcstYUhev2kN2EgFdfAGg
	tu/W7+AYjCTManFiDJ4RUL5hkYVnvxPIzq+PhtmPLsWVV9MQP92npNOmPTxE3Qny9P5iBTdjQOa
	WCSYcpgFCcdWdS8ZNBd4nzSslbcaIn1vOISDbrYyfYuwBYH/wUhJIT1g9DE6iYowIIWPbdcNOb9
	NSW11BArfyAKnQXlF1ovIcKtFiSCxcm/te8iaIERr6DWOYxBGlNJQot6czhOfTKp17HEHeUjWc8
	E6Zwzw5hrA0WgnU1PegEjEEI9OCH0qK9voVdpZxJADN4bN/6gWYA1g1XC9pTB0iPwNj0qIcVGNF
	lPJbFJGqLsRsUwcCMn3P8l5ateV8QqKS9NcIoZi2X/V3sP3DtoligTaFIUZTwJFwh/gwS8R9Xpa
	IrIvVoZWR1Th6rO5p4L93G60ObLNHe8Vh0eK2WFj9uwJa2rBaH06CF7qjZKRa/0d82+I+iLLAx8
X-Received: by 2002:a05:600c:608d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a02750fa51mr1517275e9.4.1790870072609;
        Thu, 01 Oct 2026 08:54:32 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:32 -0700 (PDT)
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
Subject: [PATCH 5/7] ARM: dts: imx6q-apalis: Add Toradex Resistive Touch Display 7" Parallel
Date: Thu,  1 Oct 2026 12:52:55 -0300
Message-ID: <20261001155412.3177428-6-leoreis.costa@gmail.com>
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

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Apalis iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 ++++
 ...apalis-panel-res-touch-7inch-parallel.dtso | 30 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 5f35771cc3626..cd1b095ce06f4 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -107,6 +107,10 @@ imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-panel-res-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-panel-res-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -243,6 +247,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
 	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo \
+	imx6q-apalis-panel-res-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -255,6 +260,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-panel-res-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..be2164dcd0369
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector (as featured on Ixora carrier board and
+ * Apalis Evaluation Board). Touchscreen is available only on Apalis iMX6 v1.2.
+ *
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/resistive-touch-display
+ */
+
+/dts-v1/;
+/plugin/;
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhr";
+	power-supply = <&reg_3v3_sw>;
+
+	status = "okay";
+};
