Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D24341AB3
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 13:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609490; cv=none; b=YmHg5wuh3erGJf33NquEz+bKYhEUxcxFQPPl0I5/tLENScCLFIW6hjwu/rEm17exPR5cNKcW+ztFNT9X+83wRcSDaHj3MAQUnYFwDVcnUPG1noxRIc17dVbCVX4e3wiE9W1UW3KBqlox/QKcwhIbEO4+0kk9GlpJeLCxoBi9qlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609490; c=relaxed/simple;
	bh=Z7ZJtSXgHh9PWOTDmz4uF6v50jelxpYxfcgTFPx7DJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bbq6L2aCL8RHiCkEeM7hAbLlJprZBToRHUHnG+fh32FBaXu7o9T0uts8tMK2PEzwIZNAIz1NNpgTK0CM4SiB3a7Zn82TJN7FYiQ4TFIzvWWGAv2/m7P9fRiLAXigwEpwtNcCHH2hG3J4Ut9nX5nPYKksV3LUntefO+RI4HWwzN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=awDn3m45; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="awDn3m45"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb78fd0c2so74183366b.1
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 06:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609487; x=1756214287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulpUZhqfESE2Vkv73Vq8o6AJ5DJINj6XxiR4N0/qC2o=;
        b=awDn3m45w+qm2UqXILggaHv84RpqkEf7yjA7jIpWlCllxSESBNzKm4thQxSxpwlNQT
         O185D6s4Eboo9+3WmrxEqzRVmy4Jt0C9Ly3hCwBt0gTLMC/XmV1JXOIuJ+k44lJXUys2
         eFHLdGd5AH8p9qNh/+DwLquk3PlLmoQ5wMbXp+mIigtcQTtC5pPZb8JkpzrulGJ/ORUo
         8HPwinKD+7dCA7WvbmkyzPuXS0z7PEB3x1D3Z5GNZcxOo5SGRdtJhCc9TkC25WfUSUqQ
         btxenpxw7L1f0PID98coySWL37RUlBr+1wOswyol0CoIbNG1pqaJDXzw8ctWmJ7hEE8V
         z9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609487; x=1756214287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ulpUZhqfESE2Vkv73Vq8o6AJ5DJINj6XxiR4N0/qC2o=;
        b=R5ZNIdLTbT8WCYCj8L2o/Mu/jB/DR/wwD0yudsExSrS/m13yi0vEbGsK7cBbZ3rVZ3
         f/MqmEXsIlwG4NYyK4AXTWAUkfpe2y10xzI8SLDNWhZQZlRjMluRVu2ibZFRAtsSjDsV
         VwAgnWqX1MdE6VSldWFVB4p/upb5ym85vNc0H1+tp4HXiqkgQCVjzl9bv7XS1Nd9iNld
         5JtnCsIW4CMoU/YnKwAMuEdhLYttV8juM8mLVmAmH0Y7G2Imuc8kbw3cXcfQ/wGZPotf
         DqVc9/RPLubvgc1xCZtKZp0f/5P7jK3iUVki748lXknyP/I/QSTPKn3L5LpExktVUxh4
         vfSA==
X-Forwarded-Encrypted: i=1; AJvYcCU0WiJDKTUOqcH9XexLPZ066Z1SRAK27Og38a1P0M+T0yAVZOvUwegoPfRDdHl3sxcYfpQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSrcncPDZtITtG62ghKi/8z6sb0SDeTQ+UTbqIUvmvn9hhOKo9
	2Q2n8j59+Ixt/EgCeyqS+s5uP2LhSldGvmoyiHKB8dNRkvTSv9G7W2VIdWgEK3sGCFQ=
X-Gm-Gg: ASbGncsM0pmUcjlXXkROSKeWNOSB39LFq+RrRktkYRJU8Ovso5kEoBYt/cjdfB1pNKq
	tX37AX85ToPMCupiGTNeXVkiH4HHN8yTH+7H1kelMnqZ4jjrCcTBTMBcXBxAeFU3mitgd621GX2
	azgUdElzXKnN6Nzr6Qmjomq8FaUVNQ6ftMUbQkWts9CP5R+DD/9OT9n4YAcBChD39H0e41SIPkj
	Bkc1FNmze2j9TQuCc/vQYxXlT+FWE6CCMMpx221P+WgC2Gs3oLGqjWpTzeisXR5H7GBkjiBDXOB
	mWJ8QYCCBNp8pAjbGeq836AG8achiU7aQIuLO5++W7CXwO6NGfaEt428P9iR4yLtRegN7d5dSRa
	KJUqQmUKFiw/XStle1I1/IZXuPnv3kCzW9A==
X-Google-Smtp-Source: AGHT+IF6Gzin6S8zveSklDH6azaQ/Zt4eVSrZ3ApV9V3k0QaGLNN/377jOXR6gIAndbfiNv1LCNbyA==
X-Received: by 2002:a17:906:dc93:b0:af9:3c7f:7447 with SMTP id a640c23a62f3a-afddc961dbemr117508066b.2.1755609487050;
        Tue, 19 Aug 2025 06:18:07 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01ab3fsm1006508966b.102.2025.08.19.06.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:18:06 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: freescale: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:18:02 +0200
Message-ID: <20250819131800.86990-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819131800.86990-3-krzysztof.kozlowski@linaro.org>
References: <20250819131800.86990-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12221; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Z7ZJtSXgHh9PWOTDmz4uF6v50jelxpYxfcgTFPx7DJs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHmJJ547d13e7h+Ug2PbMtIqWwrpixpMzjYce
 8LpQAtBFCOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5iQAKCRDBN2bmhouD
 1waWD/0WxZFcZdftmXNp7AaxVxKsDNkFpXh3EPpcXZ1e5i5fWnDndcjC9XUuWkwpRNx+HIenKit
 QCpko2I5X1H8IJfdV/zq+ouLobGXca4xpDtyI3uxWZwV/pqelOm/b2Xpl+c85MqJdM3m/guAky5
 a2fJPjg6eiQLW+UW1eq5AXIgd/EOLO2blVVs86af6QxPhQX338xg41lSC/rjs9Mi8Gfo9zA+6Jy
 NCxJmyeN/8xNJBzmViM+UPI0e5DMH6dtJkDc5wmVra1OwM23zZxxuUCMDog8faNRU56gC32igfB
 NBtSKEHsyWNaRkjd1/IuPBgUdKVwwhOG12bOKIc2kvP/y4ApOADP8tHt4k5QZ12ezezfBRkWCYU
 Rr6jaJr2jdglqcZcZH5+2ve94GuMzmuCjMT0awIbX+vQNVWhRcfuuUP6zGVpoYL0Jni7AsIu66G
 xrYzDbKKk7a6AioDRqm3PBTBLq+fxBbCt0Rt9/2S1Ap/b1vRjN+2mPGdKIVIdm5T++1RxqDw9JQ
 Urc3TUqeLnAWQ6qEHBkmIYfvRtobAlPfyZfmxV0SdzT9LoUpjkAnPqBRcBx2KuSBJT2LXZiNy0Y
 P6A/fmAPSUPcko1yEoU5IVEld8CCerdTUzTCvhn7zytUrZQZbJ1u/n14rgIzb5enUV6GWY0U/rK Cll05CBp40agsQg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space around '=' or '{'
characters.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/freescale/imx8-apalis-v1.1.dtsi  |  2 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts |  2 +-
 .../dts/freescale/imx8mm-emtop-baseboard.dts  |  2 +-
 .../imx8mm-phyboard-polis-peb-av-10.dtso      |  2 +-
 .../imx8mp-aristainetos3-proton2s.dts         |  2 +-
 .../imx8mp-aristainetos3a-som-v1.dtsi         |  6 +--
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  2 +-
 .../dts/freescale/imx8mp-skov-revb-lt6.dts    |  2 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  |  2 +-
 .../boot/dts/freescale/imx8x-colibri.dtsi     |  4 +-
 .../boot/dts/freescale/imx93-14x14-evk.dts    |  4 +-
 .../boot/dts/freescale/imx95-19x19-evk.dts    |  2 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi      | 40 +++++++++----------
 13 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 6f27a9cc2494..86d018f470c1 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -256,7 +256,7 @@ touchscreen: touchscreen {
 };
 
 &asrc0 {
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 };
 
 &adc0 {
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index b6d64d3906ea..25a77cac6f0b 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -652,7 +652,7 @@ &pcie0 {
 	status = "okay";
 };
 
-&pcie0_ep{
+&pcie0_ep {
 	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts b/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
index 90e638b8e92a..87fe3ebedb8d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
@@ -333,7 +333,7 @@ MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3             0x1d0
 		>;
 	};
 
-	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp{
+	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK         	0x194
 			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD         	0x1d4
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
index e5ca5a664b61..79e4c3710ac3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
@@ -20,7 +20,7 @@ backlight: backlight {
 		pwms = <&pwm4 0 50000 0>;
 		power-supply = <&reg_vdd_3v3_s>;
 		enable-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
-		brightness-levels= <0 4 8 16 32 64 128 255>;
+		brightness-levels = <0 4 8 16 32 64 128 255>;
 	};
 
 	panel {
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts
index 2a736dbe96b4..58e36de7a2cd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts
@@ -36,7 +36,7 @@ &eqos {
 	max-speed = <100>;
 };
 
-&ecspi1{
+&ecspi1 {
 	pinctrl-0 = <&pinctrl_ecspi1>;
 	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
index 231e480acfd4..f654d866e58c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
@@ -167,7 +167,7 @@ &clk {
 			  <&clk IMX8MP_VIDEO_PLL1>;
 };
 
-&ecspi1{
+&ecspi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1_cs2>;
 	cs-gpios = <&gpio5 9 GPIO_ACTIVE_LOW &gpio1 6 GPIO_ACTIVE_LOW>;
@@ -565,7 +565,7 @@ &mipi_dsi {
 	status = "disabled";
 };
 
-&pcie{
+&pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
 	reset-gpio = <&gpio4 20 GPIO_ACTIVE_LOW>;
@@ -574,7 +574,7 @@ &pcie{
 	status = "okay";
 };
 
-&pcie_phy{
+&pcie_phy {
 	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
 	clocks = <&pcie0_refclk>;
 	clock-names = "ref";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index c0cc5611048e..3730792daf50 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -309,7 +309,7 @@ &dsp {
 };
 
 &easrc {
-	fsl,asrc-rate  = <48000>;
+	fsl,asrc-rate = <48000>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dts
index baecf768a2ee..e602c1c96143 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dts
@@ -83,7 +83,7 @@ adc_ts: adc@0 {
 		compatible = "ti,tsc2046e-adc";
 		reg = <0>;
 		pinctrl-0 = <&pinctrl_touch>;
-		pinctrl-names ="default";
+		pinctrl-names = "default";
 		spi-max-frequency = <1000000>;
 		interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
 		#io-channel-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 95523c538135..de971af87f3f 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -407,7 +407,7 @@ sound-wm8960 {
 		audio-cpu = <&sai1>;
 		audio-codec = <&wm8960>;
 		hp-det-gpio = <&lsio_gpio0 31 GPIO_ACTIVE_HIGH>;
-		audio-routing =	"Headphone Jack", "HP_L",
+		audio-routing = "Headphone Jack", "HP_L",
 				"Headphone Jack", "HP_R",
 				"Ext Spk", "SPK_LP",
 				"Ext Spk", "SPK_LN",
diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index e602d147e39b..8e9e841cc828 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -462,11 +462,11 @@ &lsio_pwm2 {
 
 /* VPU Mailboxes */
 &mu_m0 {
-	status="okay";
+	status = "okay";
 };
 
 &mu1_m0 {
-	status="okay";
+	status = "okay";
 };
 
 /* TODO MIPI CSI */
diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index c5d86b54ad33..8c5769f90746 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -276,7 +276,7 @@ buck2: BUCK2 {
 				regulator-ramp-delay = <3125>;
 			};
 
-			buck4: BUCK4{
+			buck4: BUCK4 {
 				regulator-name = "BUCK4";
 				regulator-min-microvolt = <1620000>;
 				regulator-max-microvolt = <3400000>;
@@ -284,7 +284,7 @@ buck4: BUCK4{
 				regulator-always-on;
 			};
 
-			buck5: BUCK5{
+			buck5: BUCK5 {
 				regulator-name = "BUCK5";
 				regulator-min-microvolt = <1620000>;
 				regulator-max-microvolt = <3400000>;
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 2f949a0d48d2..0bfa4a8799a5 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -671,7 +671,7 @@ &wdog3 {
 };
 
 &scmi_iomuxc {
-	pinctrl_emdio: emdiogrp{
+	pinctrl_emdio: emdiogrp {
 		fsl,pins = <
 			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x50e
 			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x90e
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 4ca6a7ea586e..3279a9b9c3c2 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -260,35 +260,35 @@ clk_ext1: clock-ext1 {
 	sai1_mclk: clock-sai-mclk1 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency= <0>;
+		clock-frequency = <0>;
 		clock-output-names = "sai1_mclk";
 	};
 
 	sai2_mclk: clock-sai-mclk2 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency= <0>;
+		clock-frequency = <0>;
 		clock-output-names = "sai2_mclk";
 	};
 
 	sai3_mclk: clock-sai-mclk3 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency= <0>;
+		clock-frequency = <0>;
 		clock-output-names = "sai3_mclk";
 	};
 
 	sai4_mclk: clock-sai-mclk4 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency= <0>;
+		clock-frequency = <0>;
 		clock-output-names = "sai4_mclk";
 	};
 
 	sai5_mclk: clock-sai-mclk5 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency= <0>;
+		clock-frequency = <0>;
 		clock-output-names = "sai5_mclk";
 	};
 
@@ -1100,7 +1100,7 @@ usdhc1: mmc@42850000 {
 				assigned-clock-rates = <400000000>;
 				bus-width = <8>;
 				fsl,tuning-start-tap = <1>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				status = "disabled";
 			};
 
@@ -1117,7 +1117,7 @@ usdhc2: mmc@42860000 {
 				assigned-clock-rates = <400000000>;
 				bus-width = <4>;
 				fsl,tuning-start-tap = <1>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				status = "disabled";
 			};
 
@@ -1134,7 +1134,7 @@ usdhc3: mmc@428b0000 {
 				assigned-clock-rates = <400000000>;
 				bus-width = <4>;
 				fsl,tuning-start-tap = <1>;
-				fsl,tuning-step= <2>;
+				fsl,tuning-step = <2>;
 				status = "disabled";
 			};
 		};
@@ -1685,9 +1685,9 @@ pcie0: pcie@4c300000 {
 				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
 				 <&hsio_blk_ctl 0>;
 			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
-			assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-					 <&scmi_clk IMX95_CLK_HSIOPLL>,
-					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
+			assigned-clocks = <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
+					  <&scmi_clk IMX95_CLK_HSIOPLL>,
+					  <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
 			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
 			assigned-clock-parents = <0>, <0>,
 						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
@@ -1719,9 +1719,9 @@ pcie0_ep: pcie-ep@4c300000 {
 				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
 				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
 			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
-			assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-					 <&scmi_clk IMX95_CLK_HSIOPLL>,
-					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
+			assigned-clocks = <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
+					  <&scmi_clk IMX95_CLK_HSIOPLL>,
+					  <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
 			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
 			assigned-clock-parents = <0>, <0>,
 						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
@@ -1759,9 +1759,9 @@ pcie1: pcie@4c380000 {
 				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
 				 <&hsio_blk_ctl 0>;
 			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
-			assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-					 <&scmi_clk IMX95_CLK_HSIOPLL>,
-					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
+			assigned-clocks = <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
+					  <&scmi_clk IMX95_CLK_HSIOPLL>,
+					  <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
 			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
 			assigned-clock-parents = <0>, <0>,
 						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
@@ -1795,9 +1795,9 @@ pcie1_ep: pcie-ep@4c380000 {
 				 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
 				 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
 			clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
-			assigned-clocks =<&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-					 <&scmi_clk IMX95_CLK_HSIOPLL>,
-					 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
+			assigned-clocks = <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
+					  <&scmi_clk IMX95_CLK_HSIOPLL>,
+					  <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
 			assigned-clock-rates = <3600000000>, <100000000>, <10000000>;
 			assigned-clock-parents = <0>, <0>,
 						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD1_DIV2>;
-- 
2.48.1

