Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4741448D2
	for <imx@lists.linux.dev>; Thu, 13 Jun 2024 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718286131; cv=none; b=MXb0+0x8utycQ2yrx0+LdR8oQqJrmnMZ0VyLwVlOCaikXFkoYU4BLSi8+CYeVOpQLrUzwbB+jlClgtMUNMJaNv+pZ2Mwaa7MylULOvhREbirU3mq/zzeoLM8jeSvCSTRTZ+t1S0KMhEXhPuGFockRNKhgbrU62U2aC9kWlymkSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718286131; c=relaxed/simple;
	bh=+z1xN1OTCuBZhemyLLfzhdSbywBRDNkNMUnB3Ii0GhY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sHw6cXYIlrKXFugNx18ZdcplJkTC7GMEEdHwTNY+kmfxdtyheFpXjzE/jc/0BP+Od0LYhAajWfPWwcy2KDyGqCfjYHfazSx1qevaOPtoZNcJNZFJtpuMtSx2xY7vAdk0OU2Id1pEpNkE2wr/OZCck5cEoI+sqNDrMdtREOU5/IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K+UPKDkz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K+UPKDkz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42179dafd6bso13731355e9.0
        for <imx@lists.linux.dev>; Thu, 13 Jun 2024 06:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718286128; x=1718890928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lubbqAl7HTS/g4vv056FMCQ1RskN3TIsl6kZl33uIes=;
        b=K+UPKDkzmNwgxb2FJQsvxfDp/vnkVgmbVsIz7qr0UI71o6cVZBtmPN7XsTLbL+df9n
         44LvL0B3jiZs3zgPvEON79Wk37TRkjhvNNOqAttRwlnyeeXbxz/tKGL2iEhsW2kHbmRK
         kn2a3yvZXOW4mCzOQPekHv8TQJpWUYozH32kOjlAeuudzzD9PJhWgOf+9uHnh3gbN9xf
         JG27JvGfYI6Kcbma49YbuOIK6Ycqm/ah6Zx0fNLnYTGqNluTrOc6F5Jvem+D3kLl+h2w
         h9etLgtsDwRaE0D6qhBtLTh1UxGZB4DvWPuocUpCMLgrKBXsII7ILzYA9HuoSB+3aEBc
         509Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718286128; x=1718890928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lubbqAl7HTS/g4vv056FMCQ1RskN3TIsl6kZl33uIes=;
        b=EGrL6eHzHS0UkjNgS0EYIm/rnAiF6Pih5OzbXRQA1WGnBo+HdVbKqviKbtRBCaWKqK
         EdNOP+p4lJlbvXIgpM5+P5mjhSkMURkh8y4RznUyXDuHtF6iznBBr37vby/QOIuJZKVZ
         eVySg8/9aJzShacJ+T/dHAkNL20OkJcHo18FMhxvxYUNQNAT9sP5PzDwH+OGLDqoiIXy
         IQ0ngf05LSTRksF8LALHVH2+kB6FXV/FG3lzQKq+ef0+1Z4E7zEVOZZoX6QsNjPp3yi2
         0XqcRhKs/pyYPZxaHhgJgeXLZOVWIp+Dhjn72ghcxJteNB2SHa0vAvHZmKvqnOTnm6m9
         8Osw==
X-Forwarded-Encrypted: i=1; AJvYcCWnWX+O/7SZIU/1ZQms4uMSH0GgD6fIX+2FnTX6lai5gDXb8mNOSvQn/GfyM74RIheIuGhiHs54zioskk7V0dNb0zue
X-Gm-Message-State: AOJu0YzP9R4y/p9geFdCoTsSGFypuRjR7UdV5fQ/tR0E/pmzZiJCs3ba
	7SmrQVekODncyfk39aqPWmU/+cI9WJ8b6IbTddX18f50Cuc+Vlg4
X-Google-Smtp-Source: AGHT+IGIY6ndnCADtxtse3SR/xy0iRVIQrBFXYYemePOyTtkI45JeF87lLvJm1bcyxDFEq0ydLiMKw==
X-Received: by 2002:a05:600c:4f81:b0:422:1446:378 with SMTP id 5b1f17b1804b1-422b6dc80cdmr28634765e9.2.1718286127564;
        Thu, 13 Jun 2024 06:42:07 -0700 (PDT)
Received: from vitor-nb.. ([2001:8a0:e622:f700:d16e:d9b2:b631:537a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874e73b1sm63852415e9.45.2024.06.13.06.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 06:42:07 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com
Subject: [PATCH v1] arm64: dts: imx8mm-verdin: add TPM device
Date: Thu, 13 Jun 2024 14:41:50 +0100
Message-Id: <20240613134150.318755-1-ivitro@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add TPM device found on Verdin iMX8M Mini PID4 0090 variant.

Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 4768b05fd765..c9ae5f0bb526 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -227,15 +227,16 @@ &ecspi2 {
 	pinctrl-0 = <&pinctrl_ecspi2>;
 };
 
-/* Verdin CAN_1 (On-module) */
+/* On-module SPI */
 &ecspi3 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>;
+	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>, <&gpio4 19 GPIO_ACTIVE_LOW>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_ecspi3>;
+	pinctrl-0 = <&pinctrl_ecspi3>, <&pinctrl_pmic_tpm_ena>;
 	status = "okay";
 
+	/* Verdin CAN_1 */
 	can1: can@0 {
 		compatible = "microchip,mcp251xfd";
 		clocks = <&clk40m>;
@@ -245,6 +246,12 @@ can1: can@0 {
 		reg = <0>;
 		spi-max-frequency = <8500000>;
 	};
+
+	verdin_som_tpm: tpm@1 {
+		compatible = "atmel,attpm20p", "tcg,tpm_tis-spi";
+		reg = <0x1>;
+		spi-max-frequency = <36000000>;
+	};
 };
 
 /* Verdin ETH_1 (On-module PHY) */
@@ -807,8 +814,7 @@ &iomuxc {
 	pinctrl-0 = <&pinctrl_gpio1>, <&pinctrl_gpio2>,
 		    <&pinctrl_gpio3>, <&pinctrl_gpio4>,
 		    <&pinctrl_gpio7>, <&pinctrl_gpio8>,
-		    <&pinctrl_gpio_hog1>, <&pinctrl_gpio_hog2>, <&pinctrl_gpio_hog3>,
-		    <&pinctrl_pmic_tpm_ena>;
+		    <&pinctrl_gpio_hog1>, <&pinctrl_gpio_hog2>, <&pinctrl_gpio_hog3>;
 
 	pinctrl_can1_int: can1intgrp {
 		fsl,pins =
-- 
2.34.1

