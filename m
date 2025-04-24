Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4BC22AE76
	for <imx@lists.linux.dev>; Thu, 24 Apr 2025 08:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484489; cv=none; b=Nt8YP6c5aHRJ6YH2l86Wq7zXp1XnFfs9q4s7cb0cgBaEz27YVT/4VnjeLLAB7I5j5YOVAGkO408OORoXUJiUnVIVh68P1tYnZmIQB/wCiZkmt+GCNTANzdDKsG04jhPIRcwn4hieMRNHOWMOKsphQL4AfNzM2yN4hZ0Hm482lDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484489; c=relaxed/simple;
	bh=LHO0E99+mqsaN7Q7RfkAZViQIO66yzeP+zbhS0t6qIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPhwd0as+m6j5VOu+It+1oThJGnuR+jSvK80upFFdwuhMj8vGKq3EqbLf0ATjqjjXnR5kkeEyA3bHjVxhwdOkD8mkh8oc2lT4v5TkZIkr7/eta8Hgr3fir57pJ1bZjQR4nPC66fzeMWGXWe4T6FjxlPQ9+Ia92y+fENs6tbPkMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BeFDIuYD; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BeFDIuYD"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5ebf57360b6so120295a12.3
        for <imx@lists.linux.dev>; Thu, 24 Apr 2025 01:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484486; x=1746089286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OYyQh2WrGx5C4Z4w/0Sz/FjCGm+vwC4M1ks09hw0k+w=;
        b=BeFDIuYD7nWUcjLgb/rGNjK3s6XgtRYXuf4k1JCr5zLnpGrcs1kQbHXTZigQTVl82M
         qIG3BLZ5hvnlMrZPwqzYCTCJxKarI7lPWJEAL8TtLJZcT0rB+gbeuubl6pyyRKWmuK3n
         rEA2XIt1eTh3zocsWEQ0SuIaNXpLFsvzm22bYoz24C+JZbvyslYJ64wlsrrBGqETFOF1
         W3tj7uEom31Bm3FlGbNB7M94Qu3M5GYK+h0b9U4/+Cc0aHjnLBBHmHnzws31Ew9ykhPV
         Rb5/t1eXhfCcAiuEf/zDrtotsVy7ZcAHciM0EgVeZ5xgbok1259EpXA3ojhfBmz7d1zb
         53Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484486; x=1746089286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYyQh2WrGx5C4Z4w/0Sz/FjCGm+vwC4M1ks09hw0k+w=;
        b=f+ET9o3sWSMAkdK1vW5Or1bPW8Ckr0o5tSLlFyLr6xLN7IMS1oKecWydE7Xoaqvwme
         ueZuTijbugnc9gcSPSvmEs1CBrltRo+v1kvtCRzvrE7T/yL4JiZZnj+XnEynovw4j7Ds
         +W/B1QT3menjrLZlgveZ5ORfxE7yZnk0cZcti5S972fzn2TQXpUYUr3EzDcLLBZyEiAS
         lQvEo+fiRUv7L7tpwu+hVzS1SvCD34KgF0lG7558eGyGhMR5cHFW/fE6hvKcYULKXWi9
         TNxBhCFxlh6h3I5cNq33+1/ygUG4xix0hRVTmNOtlBPwBQ0JXn3cG2jz6BvCYIhfwGMf
         amTg==
X-Forwarded-Encrypted: i=1; AJvYcCUWvOZrMwGO/Wrlnpth5kPnEqf7brOFSJi8kkzMOUkFL011YhpviGa9/3DPDaM7TujcmYk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDHtgDi5c26CMtBMuNlxkt9isQe9SLXOpxdxioStcgnVwPZA5Z
	V+bFH4dpWoLnwulX5GT4AtAaJLwzW3ed57pCXEdfCwTqorMRN8i6QuB0eAfCWOQ=
X-Gm-Gg: ASbGncsLqNv7Zu53mCGYB955kp0i5bIWPQL/vPFZNUr+CrOI36AK1SDq4JdL52DXR5N
	LeVIYFHWDYj6ehFtnZK6eI+pTEXdNBFG2mjVoCPJuFAMsl58bprTYFNvPjsOZctBcI85ZqPzQIS
	EjPA7zQpeq8ewglnjUvMaGr9DZUuqZELp/+yWQLwVzXxWCHSzbJo8nhWSUlwRXazbleAIf4hItJ
	89uzKZIaD47QmSCVjTXvRW1WcivyjWzaD5sMK5H0d85mSOj20NWV6bVv7aMA3A+0MTcnc4RNf/t
	SjtngGEVcW2Seh4WpAVYM804zVaATwwQTspYhg/ovGTu+JKQaQ==
X-Google-Smtp-Source: AGHT+IHf70Oe4hiSF1tedfQvdAAS0RVFcgU5DnHiUpIFgTF7Q4luw0vTUVOjeQvCbbh328Kf2cO9bA==
X-Received: by 2002:a05:6402:2793:b0:5f4:35c7:ff65 with SMTP id 4fb4d7f45d1cf-5f6de3b0cdfmr705505a12.4.1745484485612;
        Thu, 24 Apr 2025 01:48:05 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6f45fd3c1sm118998a12.3.2025.04.24.01.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:48:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@dh-electronics.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: imx: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:59 +0200
Message-ID: <20250424084800.105300-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  imx8mm-var-som-symphony.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi        | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi           | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi         | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 62ed64663f49..6fe0602b5b9a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -269,7 +269,7 @@ &usdhc1 {
 	mmc-pwrseq = <&usdhc1_pwrseq>;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index cdfacbc35db5..190bde4edcd7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -306,7 +306,7 @@ &usdhc1 {
 	keep-power-in-suspend;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index 2a64115eebf1..0ee7420f964b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -280,7 +280,7 @@ &usdhc1 {
 	mmc-pwrseq = <&usdhc1_pwrseq>;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index bbb07c650da9..d20393c2d901 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -265,7 +265,7 @@ &usdhc2 {
 	non-removable;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		compatible = "brcm,bcm4329-fmac";
 		reg = <1>;
 		pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index b364307868f2..38ef9e4fdf07 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -300,7 +300,7 @@ &usdhc1 {
 	keep-power-in-suspend;
 	status = "okay";
 
-	brcmf: bcrmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
index a90e28c07e3f..7f754e0a5d69 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi
@@ -590,7 +590,7 @@ &usdhc1 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 
-	brcmf: bcrmf@1 {	/* muRata 2AE */
+	brcmf: wifi@1 {	/* muRata 2AE */
 		reg = <1>;
 		compatible = "cypress,cyw4373-fmac", "brcm,bcm4329-fmac";
 		/*
-- 
2.45.2

