Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D08D5226AD
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870076; cv=none; b=KXkRio3v3znBAkh2cEd83IRES5K2i8wVi0FOelwglygVPPqfLmWUQb4xVLMPPIdf7ZclhBKrxIBFNtspR24g/6GySYQ2cWMiE+tAxP3yFwDMm3PmWTGzqxbAefQCsGY0uuP+psIf4ygu5TY2k2HTm+R9dIi+cYYIhfUt1B7ai2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870076; c=relaxed/simple;
	bh=ezdc2eXx+yuZWZufbn3+r0w/2tqaSbs3K97a+T2XLdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l4KUa+RSXb/SxQ5/vx6gp3H8KBLkh27ny/1pDSWIQB1oe/enxrM89Go4f5lzBcoGb2t5AnvnSbEg4b8NI9YDgeBopTeH8tXMft/KxTx3yZeqdvtqC6PEXhJf0GT5jNjwklDeZ7HJ1HYVWQGKYXyTU1g3opZw+eNLLaEHiXgBl0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JI22lcvb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JI22lcvb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48870973bddso304136f8f.1
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 08:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870071; x=1791474871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DWEN958qzdMHbLCQjYOa4dCZMqLVicSMtaPk1knnWCI=;
        b=JI22lcvbEw6ka8DFEkUHU3DqgTmOPnofLa69tU5Qfxa5vYvssfS9ANrOPpB3PttcZs
         Y9xQZx+/BlPR2xaGJra2KTH/DOT0HI0U3UMKQ1JrnUjyoXOpUlKepnkGPOBBvwsvpvty
         kbBbkrwBQiSXU1UKfiRRwtTNtTMnzd0dkvlPS0V6RE81HxRrwcow8XhbBguFqec1KL23
         NjBuLM1sIMFVGyQKdQDnfREIUIvH4wnTby/fpmMB0vg8HSLhsjgiT3JcJwYD77mVJRhb
         mnxmML+dFoqAE3Verak5sSHO3EPaLr126dvAg7H05UVzLjkCsSpisipG/zVwhOnm8bV/
         iRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870071; x=1791474871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWEN958qzdMHbLCQjYOa4dCZMqLVicSMtaPk1knnWCI=;
        b=F0leeHpRJMeGHCVzqQhIR6jk4HCvMe9ip7CfEctUTIrw4z4KzvrCm/npJJ0nnAGJ5P
         lSSjKVbv2qW5AS1HOTTKcBEaiaQSwqJehrL7orTCus4yxR1UGtzfGu9pCovgjJ2bFZp8
         wDnkvn+vjNjrKQ3YhA1T+AczWZu5bLkoHINCbKeZb2ZEtbhRWZZlcT/jqlNhKPp1/L2W
         9EOaujHYk4r1i3gaH4Y1We80PSII+KUepZStTGWrcTeFzruU4+6HHurnQxmtnwane+KH
         xNlFRUt2egy01BMCA0kPYfz6P7eGUMq/+ypC3QeWiF0+/MRqTgvx9LGqqpIGGlSkV7FP
         AhAg==
X-Forwarded-Encrypted: i=1; AKwUvBw49T9vBx852p+iQopHqYV2tCWulherQBsu/YPiou73Wogs5rurdBYUCFnj0FniAJdSxB8=@lists.linux.dev
X-Gm-Message-State: AFq9FYK+sLBmF6Mo7q/SVdjtNwGq19Z00k2bnq2YS4sbo9XtmBMIHsH7
	PqRC1VCgpCkCddCPszbEp3pLlXBcbJ2F7v5FOWNUhayGP+Bw0XAAV0oW
X-Gm-Gg: AYBFou0eW4Rn97sz3Z0CWV8YIAxDCX40QsCGx1nF4rHcTJWQARGYP4lVtWRQTI2aS8z
	MRpg3u/HTm908QeRc3/r0Lf6e8tSPa+K0ZBRlp+uoM+oq5M19tOpgSNNHsWiHgdLXgZ29g/YWZV
	WG37fNShC/HT1rgPeVyevXuch2c8Pvy4S4tsdihxkkUmcCWJOTf3fzMvhgI9usezAkL2E7nGJo+
	/EcjUaRGNhoz6YkBPii+q55GGxoyP24DTXdWFHHQZnxYj+L2rRLPThCs2h62NIvlIWnMFp/XKY9
	WQsnIL7u9RyuV60XrA2GDu/P5rOV0zl1/FYAWOa+D0vYiBwkEPSO7iaFQ+X9BaQ4WyA/EEpNdP3
	uqPlUvKT+a+z8B3rU/n0de6g/3P8ZY6x/y8jSEB/o8sTsYge9U8i0hpDvLlcCZtyTYy6T2b/Wkt
	BlXeDWvefdIhWTjJVRQsKLT+K302TmT7L3IUJHkb4eu/CTdy9rMYGLusHR3X5WdTkgXW3OnsIDk
	KU9xbLnN1O9aEMtQ8WOOAWhlMwVKZ5mBhayUvJt6IYly8UUTpa3xsjwu4d89sNWCA==
X-Received: by 2002:a5d:54cd:0:b0:487:1577:9e33 with SMTP id ffacd0b85a97d-48b068bf670mr5217869f8f.25.1790870070993;
        Thu, 01 Oct 2026 08:54:30 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:30 -0700 (PDT)
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
Subject: [PATCH 4/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 7" Parallel
Date: Thu,  1 Oct 2026 12:52:54 -0300
Message-ID: <20261001155412.3177428-5-leoreis.costa@gmail.com>
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

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Apalis iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Ixora carrier board and Apalis
Evaluation Board.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 ++++
 ...apalis-panel-cap-touch-7inch-parallel.dtso | 34 +++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 23fcc80d7f309..5f35771cc3626 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -103,6 +103,10 @@ imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -238,6 +242,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
+	imx6q-apalis-panel-cap-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -249,6 +254,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..f04516e3c5cfa
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Ixora carrier board and Apalis Evaluation Board).
+ *
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ */
+
+/dts-v1/;
+/plugin/;
+
+&atmel_mxt_ts {
+	status = "okay";
+};
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
+	compatible = "logictechno,lt161010-2nhc";
+	power-supply = <&reg_3v3_sw>;
+
+	status = "okay";
+};
