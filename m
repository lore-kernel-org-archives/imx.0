Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00461F0E32
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 13:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736255435; cv=none; b=Rs2hMDJ1o9KaBn2st7qQi15hrJAj4cc7DPhqtXAU0GrFJ3YvkjynLuVvc4h98IV4fB17j9g9HvEd5vZCGuwGBuBWJT34Rnd+AViYsmE4VsdJdIsJRPB5RChKXbZK0zDz3vtImxAqdwfJF+57U53048qSopovPWnERrpzO3sZvfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736255435; c=relaxed/simple;
	bh=Yp7wtG/6fbwK5J4heCVRQsbeAIaIxac6wdVB/naceR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R4wxb76fWtXB3gjiTn2VLF+QwqRRZVGJXlEgSb8Zzt98h/ZdKa45cV1UQyFMaxE0NMuTUleazthqzi2s3aZTB0uV72SlJHrC/xN2lgMl+ZPcAbDbEHw/mL7QGVGQDa6VEVGZ5h2rD9e/KiTw7QkBwDi/BN8hCKQ7IhwFhOO+ivA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UVEi7kfT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UVEi7kfT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436381876e2so22120255e9.1
        for <imx@lists.linux.dev>; Tue, 07 Jan 2025 05:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736255430; x=1736860230; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cV4oC9+EL8srSyzO8Y7L+t+TVZRrKU1b9fLi0ltBXl4=;
        b=UVEi7kfTIuZHl6NzSlrXxaXoXXz74b3J8O+ptDn6ULJwgnF3cY8c384NNnhjKXLKgI
         JmxDRPcVpGJ9SFeQgm26jSEUtzgf/zymZyRmGsUGNx1FGRIc7TUJ37un4CZInxLLHYOr
         mWhVmGL/djG0gy+OfEvuloUA1THivXh7SbdVrkbkRW88bhlPyu1bv0maK2TYkkDdm64a
         A0jDlBs77esrPHXanlUvHPvjhBy4rhkixukuarU0tlu5sAzQQ92lJg6VCCxTojmPfHAJ
         WPXp1z8zF2lQ/8pnrqmu8k+3RAEEN9MfuxAo3r8fiNDkoqn4JhB+3ineXPsJDYP3K6BJ
         Po1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736255430; x=1736860230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cV4oC9+EL8srSyzO8Y7L+t+TVZRrKU1b9fLi0ltBXl4=;
        b=boZLHvY29euQ9SfFZCyKB8VOIBen0XzISAZmfgyK6hhq0NpGN/dEsfGjTCPpbr84Hf
         opudvK+Vkdl9ciu0P/zJEvNOl3uSm84mIqQkX4SZORI/3AWVcrrooWlqLJbVpTsRj3js
         IiQHsRpnh8lWFWieGcMED+fh+GTyXzeg3QxfSuV8TaeqTKwV57+78TSWSMSb8PU/g2Nc
         aMiJm3zdk0yfS3YkedWHQNscNClez4fWF9WUzuVCwyeQyNoSKJExhSwkuKRdLTEHB7fg
         2uzfRAptpSTIPdrOy7qZr60bs8YaqPOQcWHM5K8eR/Ag/7kV8JYF6o2bqqOEXXcXxIaq
         WnbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoUocrjrpTYPjmkgTTRrQI99Ist9qgtMcGHYEX1i/nS5OKeEOtTxfwlosboXedAKhgJrY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSRnhTqeh22erchc/ng5G6QqWff84EZOSQzhWfHnnFsxiC1j/E
	91iJt7Lrh5tieCA2R8tTcdnSAX+B+meOLVVQxhBuCcOQaVMpxQ+Iqw2HAEtSilc=
X-Gm-Gg: ASbGncuWlnl7A/ov+WZ1F3savR4ePNTJ84EHG428puHulWO2hY3oQFdYoJPOkOXW1iY
	Bc6dRkrOS00pHCPEARfn1i+mvrR/GcX6tQb7cxqDxSebMkbvuivwAJHHcWNF+g4t3YPrcMxtOeE
	uhZN+xRwTOuvlrWKGQmcuLpg8B5STUZjOjxepLNFWk8JvyEKHpcpy8eMJWABPl6vgBnnZmhcbCv
	zosJs2e9sObhQMQQffa0K1wyKwknUtdBzNygvxojEsE5ylz8DEQ1pr73rfpppAEUFwpYXU=
X-Google-Smtp-Source: AGHT+IFojlvlfBDLwc4jTLHA9St8h6hsy3yqCuHX8QBdkRJhEHjq4U9E5nYclZkRpdSwtLeTTkzBFQ==
X-Received: by 2002:a05:600c:1da0:b0:42c:aeee:80a with SMTP id 5b1f17b1804b1-43668b7a8b8mr201416125e9.7.1736255430084;
        Tue, 07 Jan 2025 05:10:30 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea387sm603189915e9.6.2025.01.07.05.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:10:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: thermal: Correct indentation and style in DTS example
Date: Tue,  7 Jan 2025 14:10:26 +0100
Message-ID: <20250107131027.246608-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DTS example in the bindings should be indented with 2- or 4-spaces and
aligned with opening '- |', so correct any differences like 3-spaces or
mixtures 2- and 4-spaces in one binding.

No functional changes here, but saves some comments during reviews of
new patches built on existing code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../thermal/allwinner,sun8i-a83t-ths.yaml     | 48 +++++++++----------
 .../bindings/thermal/imx-thermal.yaml         | 36 +++++++-------
 .../bindings/thermal/imx8mm-thermal.yaml      |  8 ++--
 3 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
index dad8de900495..3e61689f6dd4 100644
--- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
+++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
@@ -142,38 +142,38 @@ unevaluatedProperties: false
 examples:
   - |
     thermal-sensor@1f04000 {
-         compatible = "allwinner,sun8i-a83t-ths";
-         reg = <0x01f04000 0x100>;
-         interrupts = <0 31 0>;
-         nvmem-cells = <&ths_calibration>;
-         nvmem-cell-names = "calibration";
-         #thermal-sensor-cells = <1>;
+        compatible = "allwinner,sun8i-a83t-ths";
+        reg = <0x01f04000 0x100>;
+        interrupts = <0 31 0>;
+        nvmem-cells = <&ths_calibration>;
+        nvmem-cell-names = "calibration";
+        #thermal-sensor-cells = <1>;
     };
 
   - |
     thermal-sensor@1c25000 {
-         compatible = "allwinner,sun8i-h3-ths";
-         reg = <0x01c25000 0x400>;
-         clocks = <&ccu 0>, <&ccu 1>;
-         clock-names = "bus", "mod";
-         resets = <&ccu 2>;
-         interrupts = <0 31 0>;
-         nvmem-cells = <&ths_calibration>;
-         nvmem-cell-names = "calibration";
-         #thermal-sensor-cells = <0>;
+        compatible = "allwinner,sun8i-h3-ths";
+        reg = <0x01c25000 0x400>;
+        clocks = <&ccu 0>, <&ccu 1>;
+        clock-names = "bus", "mod";
+        resets = <&ccu 2>;
+        interrupts = <0 31 0>;
+        nvmem-cells = <&ths_calibration>;
+        nvmem-cell-names = "calibration";
+        #thermal-sensor-cells = <0>;
     };
 
   - |
     thermal-sensor@5070400 {
-         compatible = "allwinner,sun50i-h6-ths";
-         reg = <0x05070400 0x100>;
-         clocks = <&ccu 0>;
-         clock-names = "bus";
-         resets = <&ccu 2>;
-         interrupts = <0 15 0>;
-         nvmem-cells = <&ths_calibration>;
-         nvmem-cell-names = "calibration";
-         #thermal-sensor-cells = <1>;
+        compatible = "allwinner,sun50i-h6-ths";
+        reg = <0x05070400 0x100>;
+        clocks = <&ccu 0>;
+        clock-names = "bus";
+        resets = <&ccu 2>;
+        interrupts = <0 15 0>;
+        nvmem-cells = <&ths_calibration>;
+        nvmem-cell-names = "calibration";
+        #thermal-sensor-cells = <1>;
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
index 337560562337..949b154856c5 100644
--- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
@@ -80,19 +80,19 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     efuse@21bc000 {
-         #address-cells = <1>;
-         #size-cells = <1>;
-         compatible = "fsl,imx6sx-ocotp", "syscon";
-         reg = <0x021bc000 0x4000>;
-         clocks = <&clks IMX6SX_CLK_OCOTP>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        compatible = "fsl,imx6sx-ocotp", "syscon";
+        reg = <0x021bc000 0x4000>;
+        clocks = <&clks IMX6SX_CLK_OCOTP>;
 
-         tempmon_calib: calib@38 {
-             reg = <0x38 4>;
-         };
+        tempmon_calib: calib@38 {
+            reg = <0x38 4>;
+        };
 
-         tempmon_temp_grade: temp-grade@20 {
-             reg = <0x20 4>;
-         };
+        tempmon_temp_grade: temp-grade@20 {
+            reg = <0x20 4>;
+        };
     };
 
     anatop@20c8000 {
@@ -103,12 +103,12 @@ examples:
                      <0 127 IRQ_TYPE_LEVEL_HIGH>;
 
         tempmon {
-             compatible = "fsl,imx6sx-tempmon";
-             interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-             fsl,tempmon = <&anatop>;
-             nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
-             nvmem-cell-names = "calib", "temp_grade";
-             clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
-             #thermal-sensor-cells = <0>;
+            compatible = "fsl,imx6sx-tempmon";
+            interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+            fsl,tempmon = <&anatop>;
+            nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
+            nvmem-cell-names = "calib", "temp_grade";
+            clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
+            #thermal-sensor-cells = <0>;
         };
     };
diff --git a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
index bef0e95e7416..df6c7c5d519f 100644
--- a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
@@ -63,10 +63,10 @@ examples:
     #include <dt-bindings/clock/imx8mm-clock.h>
 
     thermal-sensor@30260000 {
-         compatible = "fsl,imx8mm-tmu";
-         reg = <0x30260000 0x10000>;
-         clocks = <&clk IMX8MM_CLK_TMU_ROOT>;
-         #thermal-sensor-cells = <0>;
+        compatible = "fsl,imx8mm-tmu";
+        reg = <0x30260000 0x10000>;
+        clocks = <&clk IMX8MM_CLK_TMU_ROOT>;
+        #thermal-sensor-cells = <0>;
     };
 
 ...
-- 
2.43.0

