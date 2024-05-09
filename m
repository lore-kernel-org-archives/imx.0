Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E045C14C596
	for <imx@lists.linux.dev>; Thu,  9 May 2024 10:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715251731; cv=none; b=SUmajACpYi0C8kGODrRciXfzI0Dqhbo9NpoxgCb3xBRGZH1WZKNhah78GGSKwmcRRJoY8GbyTPMkuIu6rDpGRUBcfit7BtUlxprt6jhpC0w0YwqLzObkevTKWM3Gp6xByCC0sa4j+tK/pA6jGdE/D2pYhH8dFG/BHpPus5iv8Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715251731; c=relaxed/simple;
	bh=aPzqlco7XsixPyzCXTVco8ktdIB66kEc2nTRRwiR/3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kh5AusA8m2qU4yu//BGOkhViggWhKZTjnqhMjLpLWnmZz4XhTydeqaff5BYcPp/lQkcZWKdWYB2vgWhUoVLZQSW/7XAyrwRTitiZIJUotz+8Cc8ttq9JliqNUtEO4GpErgvo/kl1gtVRe1QS9vd2S7lliuzV0juwnBYzW1dJYzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WokuOx57; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WokuOx57"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a59a5f81af4so171561366b.3
        for <imx@lists.linux.dev>; Thu, 09 May 2024 03:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715251728; x=1715856528; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIdN4MR8ysP0CcOVaWDr/atwyhcItV6HcCM2wmXc11Y=;
        b=WokuOx57AEuPRR/BCYiillEcGLQcYHbDDl/ZT3/q+2X7OFPf3MzGn+KdKOu75aWF+/
         Dx4yvtkCXFCc1n+m4u7s+p+PiOvQP1dxanhgYOF5cINMztG4UaTNBKkpui36xFzVbXg/
         d/tnXZfqes2kRQsuVEsO2W8onRP4Xr/+aUyD2Xbf9aZCsQYMn4cyITcvy1//sGGCAqP7
         HMWZ3g+JUDystKR4IcedzgzwG+9JrZsfH4+tkLGyeHtCmWeQzXdOESG4reabiU6pzUBc
         I1fuin4blhlxuxVnFxGL/OXwytPqvisriFsXE1m04NeKVxIQwPcaTDr2/xmGLKEW08RQ
         utUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715251728; x=1715856528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIdN4MR8ysP0CcOVaWDr/atwyhcItV6HcCM2wmXc11Y=;
        b=F8JDQGSDL4q+HD8Ux4INFVq9eV6KdyPaGH0pJk59dOw9x+3WMUsQ32Y3LebKAUBz4V
         MMRqBkw89/sO3ysiZxp3wXeqcr++LoFw5rZ8zdgQJFDj23wJV4X9ZtzDpMBf5X9CtbYi
         ud2n+8vBUeG7zksjqyKLXX3Mn51zR1cWJ5ms8rKVba1Oi051gqaeeqF6NzXCoh2ZDcRr
         c72TkuXX0GTzHivPoFlDlCbXWcP20E5inZYMBYUOWE5sSqq9RJc6JG4o0SaATHsVe1z6
         nmWeeWdeXw3dLrNI9VJukHFVKuSy3hZVsn86QjFV4yh28/lvGAFqZo2inBMZVUpBmSun
         kLZw==
X-Forwarded-Encrypted: i=1; AJvYcCWhHWY1sAlyDxtqaHWEz1wJvhp0JOOi4HCqzZuX8K4m6TmP83Z2CFXNVZzrdVSCVtISr4WuWBEeiZCpfrg5Rt4Vdh7I
X-Gm-Message-State: AOJu0YyafvTINAm+k8w7lluoEBocV/9kTq5HBrtsv1emSjWwwFy7Apbo
	eDRe9Dg5vOvG2pj0WWrmVbCEtk3lUmUWjXWaO57HGhDiA8cvPeVMiBcVRYMRl9s=
X-Google-Smtp-Source: AGHT+IHzxyO5fKOhzl1H1hoKpa6CXJoOBaKE4zW9xgfQNDPQNYWH/OVRT8MGIP39ltU081+X08S3Vg==
X-Received: by 2002:a17:906:1b08:b0:a59:c9b1:cb68 with SMTP id a640c23a62f3a-a59fb94a628mr352359966b.7.1715251728286;
        Thu, 09 May 2024 03:48:48 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17894d85sm60195966b.72.2024.05.09.03.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 03:48:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/5] ARM: dts: imx: drop redundant 'u-boot,panel-name' property
Date: Thu,  9 May 2024 12:48:37 +0200
Message-ID: <20240509104838.216773-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240509104838.216773-1-krzysztof.kozlowski@linaro.org>
References: <20240509104838.216773-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Panel timing bindings do not allow 'u-boot,panel-name' and there seems
to be no users of it: neither Linux kernel drivers, nor U-boot as of
v2024.07-rc2.  Reported by dtbs_check:

  imx6qp-tx6qp-8037.dtb: display-timings: timing-et0700: 'u-boot,panel-name' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lcd.dtsi  | 5 -----
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lvds.dtsi | 4 ----
 2 files changed, 9 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lcd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lcd.dtsi
index 7ae495bdc48f..ded241a39906 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lcd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lcd.dtsi
@@ -127,7 +127,6 @@ timing-vga {
 			};
 
 			timing-etv570 {
-				u-boot,panel-name = "edt,et057090dhu";
 				clock-frequency = <25200000>;
 				hactive = <640>;
 				vactive = <480>;
@@ -144,7 +143,6 @@ timing-etv570 {
 			};
 
 			timing-et0350 {
-				u-boot,panel-name = "edt,et0350g0dh6";
 				clock-frequency = <6413760>;
 				hactive = <320>;
 				vactive = <240>;
@@ -161,7 +159,6 @@ timing-et0350 {
 			};
 
 			timing-et0430 {
-				u-boot,panel-name = "edt,et0430g0dh6";
 				clock-frequency = <9009000>;
 				hactive = <480>;
 				vactive = <272>;
@@ -194,7 +191,6 @@ timing-et0500 {
 			};
 
 			timing-et0700 { /* same as ET0500 */
-				u-boot,panel-name = "edt,etm0700g0dh6";
 				clock-frequency = <33264000>;
 				hactive = <800>;
 				vactive = <480>;
@@ -227,7 +223,6 @@ timing-etq570 {
 			};
 
 			timing-comtft { /* same as ET0700 but with inverted pixel clock */
-				u-boot,panel-name = "edt,etm0700g0edh6";
 				clock-frequency = <33264000>;
 				hactive = <800>;
 				vactive = <480>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lvds.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lvds.dtsi
index dfbdbb87aec4..4eb53d5677a6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lvds.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lvds.dtsi
@@ -128,7 +128,6 @@ lvds0_out: endpoint {
 
 		display-timings {
 			timing-hsd100pxn1 {
-				u-boot,panel-name = "hannstar,hsd100pxn1";
 				clock-frequency = <65000000>;
 				hactive = <1024>;
 				vactive = <768>;
@@ -159,7 +158,6 @@ timing-vga {
 			};
 
 			timing-nl12880bc20 {
-				u-boot,panel-name = "nlt,nl12880bc20-spwg-24";
 				clock-frequency = <71000000>;
 				hactive = <1280>;
 				vactive = <800>;
@@ -176,7 +174,6 @@ timing-nl12880bc20 {
 			};
 
 			timing-et0700 {
-				u-boot,panel-name = "edt,etm0700g0dh6";
 				clock-frequency = <33264000>;
 				hactive = <800>;
 				vactive = <480>;
@@ -193,7 +190,6 @@ timing-et0700 {
 			};
 
 			timing-etv570 {
-				u-boot,panel-name = "edt,et057090dhu";
 				clock-frequency = <25200000>;
 				hactive = <640>;
 				vactive = <480>;
-- 
2.43.0

