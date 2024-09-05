Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16510101E6
	for <imx@lists.linux.dev>; Thu,  5 Sep 2024 15:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725551056; cv=none; b=YZQ3sVkbmaJdbsxyAvH3f2wb4Hc2y83ue+IW8Ad3KmytFL0q3f+TOCjnZkyiDOb35rU2Ovf+F1ufWFaCFT3wdDa/GhWfqtHDJKcJ3b7wbXks9Ogivbx1RTw8qqXTWRiZ/B2/+0LSg/X+u1i9cdhreSG9t2KcQI38si9ce2i1zjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725551056; c=relaxed/simple;
	bh=kVHucip9iuBiEd53Vq2p/XquN6XA0tIzFSrHpuUQiLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DHONCTaJngFaVFZ5r+b+cf+OYgPQcgMIzhmjPnznjh5gAosDdUzIax4/5u00H1yZ6gG95XtCGfPs/JSqXDG0uV3mBM7SEGQnh0bT4/saG4IWL33E0xfj6yBshzyBAyOkm73uM2Gb4hdvOQSm/jZM8oPu3dYKvWpP+9ezeJIVf5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EHpXBJZu; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EHpXBJZu"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8a7dddd2c3so2880666b.3
        for <imx@lists.linux.dev>; Thu, 05 Sep 2024 08:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725551053; x=1726155853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iqi65QfaP95CNJyR6Va4WBN+o1z2XcxCEgZA0A1M7nA=;
        b=EHpXBJZuIsMfRU/CHDgFp/wFeJ+9ExLiyT89BSyIHdURw9dCcg/j/m+U/DWbrg+6VR
         CsiSJwmbe7UrdCxuSqxIyWFtu4fymmXJFdfwFWzkd/L2WYvXIaCOMod+9nZc0OQS2U/B
         DJ0sb6GtSPbc181VbABMdXP9dA5hVu/ZXKnTwk0hc8AtszhFatsOLWtPEdHeqtS4feP2
         2aRfTiTT2PNR8tk6AOrXgBFaz4OjJJmoOSKWXrzmQAD2P+ZPDS/tXJRyOVddoubXuwvL
         c9vyaN+tAiK64ihFCXLUKBJiDndPTBa57bbVIBiAJzHhENpMPuHw+mwqZO8dGqjq5i+x
         tGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725551053; x=1726155853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqi65QfaP95CNJyR6Va4WBN+o1z2XcxCEgZA0A1M7nA=;
        b=mFJ8PiCmOnq4siuwQT2ObEyKbKQw30bm99raKxRwSAL/MN/59YWWk8dWclkdkMz4nD
         OAVg4u11xZHEAKSY57mj7uGrn7t8RzYSWD07G0Ur8iKsFD3nHxd95cfFiaE554fcYTF8
         100m03xTDry+4E9L1HKyxYGK6Gv3kXOlY3Xi23tv16eUk+6f7cePAcHf4lkXVHBU2ERq
         Q+Ydhc70+rNlupb+NPE9zPsEZG6nkH64HCAHN8Cc+htraXf6ZuVIiqwP5JxJ2ogzI2I/
         kom7spe0zjrcw+FnbJlK+/4AwFUyF2nA9EzB7IC9W5YsDpC3HyooiML3yno2V/SUrdHP
         YHSw==
X-Forwarded-Encrypted: i=1; AJvYcCVKDBRHQFUuYUJIsJQCtB1T9/LmXsmt7INx4x/ExF2PjMBt7/wXcLQ1J9Wz3s/yvMSixVo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/icJJsWzjh6WSuy3vf6u+S6geIwOz/ghOGJ/IlXVCnQhPFq9b
	1GC+vADD9UAin886wHDgD6zkvmVdN61MwvLGENZyAa0zBiKXJSCgWXnhilum4Iw=
X-Google-Smtp-Source: AGHT+IHX+C4MbO/LsDmFFyfXxLAhaaorECoyZRHzh6xPFmaFoT+NdzZ7FPM591/lDkqiw7J7rS29pg==
X-Received: by 2002:a17:907:9689:b0:a7a:a2e3:3736 with SMTP id a640c23a62f3a-a89a37675f5mr830109266b.5.1725551053278;
        Thu, 05 Sep 2024 08:44:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623e2f7dsm150265966b.210.2024.09.05.08.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 08:44:12 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: freescale: minor whitespace cleanup
Date: Thu,  5 Sep 2024 17:44:10 +0200
Message-ID: <20240905154410.423991-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space before '{'
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    | 2 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
index a4a10ce03bfe..ce6ef160fd55 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
@@ -350,7 +350,7 @@ dma_apbh: dma-controller@5b810000 {
 		power-domains = <&pd IMX_SC_R_NAND>;
 	};
 
-	gpmi: nand-controller@5b812000{
+	gpmi: nand-controller@5b812000 {
 		compatible = "fsl,imx8qxp-gpmi-nand";
 		reg = <0x5b812000 0x2000>, <0x5b814000 0x2000>;
 		reg-names = "gpmi-nand", "bch";
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi
index 3036af49fc85..e24e639b98ee 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi
@@ -304,7 +304,7 @@ &dsp_ram_lpcg {
 };
 
 /* edma2 called in imx8qm RM with the same address in edma0 of imx8qxp */
-&edma0{
+&edma0 {
 	reg = <0x591f0000 0x150000>;
 	dma-channels = <20>;
 	dma-channel-mask = <0>;
@@ -351,7 +351,7 @@ &edma0{
 };
 
 /* edma3 called in imx8qm RM with the same address in edma1 of imx8qxp */
-&edma1{
+&edma1 {
 	reg = <0x599f0000 0xc0000>;
 	dma-channels = <11>;
 	dma-channel-mask = <0xc0>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 8d036b3962e9..6ec37aac5ef1 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -273,7 +273,7 @@ buck2: BUCK2 {
 				regulator-ramp-delay = <3125>;
 			};
 
-			buck4: BUCK4{
+			buck4: BUCK4 {
 				regulator-name = "BUCK4";
 				regulator-min-microvolt = <1620000>;
 				regulator-max-microvolt = <3400000>;
@@ -281,7 +281,7 @@ buck4: BUCK4{
 				regulator-always-on;
 			};
 
-			buck5: BUCK5{
+			buck5: BUCK5 {
 				regulator-name = "BUCK5";
 				regulator-min-microvolt = <1620000>;
 				regulator-max-microvolt = <3400000>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index f8a73612fa05..d7ea2a86de5f 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -221,7 +221,7 @@ buck2: BUCK2 {
 				regulator-ramp-delay = <3125>;
 			};
 
-			buck4: BUCK4{
+			buck4: BUCK4 {
 				regulator-name = "BUCK4";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <3400000>;
@@ -229,7 +229,7 @@ buck4: BUCK4{
 				regulator-always-on;
 			};
 
-			buck5: BUCK5{
+			buck5: BUCK5 {
 				regulator-name = "BUCK5";
 				regulator-min-microvolt = <600000>;
 				regulator-max-microvolt = <3400000>;
-- 
2.43.0

