Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C470F280A29
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353798; cv=none; b=Kdos6dZJifBJKtFYJhjJ3bIWGqMUtILmzS9eczcMQ086yzZl9DHkf0r/3+q9WzOYHY+yuNVYBms9tREKaOBZ6sha7AX0mI2Dd2R7sZ4Z+2umsrWfMOcnHAvHr1i9EDnwiL1s/2+YY2GJcyC/zSYgdAhNc06CiUObyHzvLOBamIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353798; c=relaxed/simple;
	bh=tbhuD1aUMxOGf9FSw16T/Sjkh7LYSFUT2z4kZfsbikQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CzXvb2oZUoYT4o4Ck5sL0YdXmDJwd7NZEwWtmEsWKuW/zyf4ccGbnMoC3RWK38Qp6B6CCLjGE+xcIqWotNg/CwNlO2cYVI06G1p8qw3rwl6lFtkFK7wwcPmAXrx1Y0S2zGsXGqTzqhLIHq0ickykReeyEHMmq7fZL+zre/TwBKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pkh25DGv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pkh25DGv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so50844945e9.1
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353795; x=1771958595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8l290N01INdEGDV46RV1qE15ZPFcOjbnuocE2MfqwE=;
        b=Pkh25DGvGqciFfgeU0n6HEY0F3WsGJ6GiHXrAvopeLo5Jj/gG3JNglak21hXkgZ7c4
         YVjW9YF6PKJCBC8gMiB/RwP6FJpxgT8YAqwenlKz+D6qquMayWfU98Zzh31QXvCbOOMd
         w+R0I56t0ujCa9IiBLcFXhbT6nYLJpeItkuseRcou8k0Dou4Xen+yZii51LFm7EacE3Z
         xYR6MZeY6NG+1ijxSTHWqtIAOH7YliZd6+BTVcqn+/1UP01hcf/5bsKdL2AX0antlr2q
         icaMwX+FitBRidmA1eZ1TwAMH6iN5K4HncBav8XnFiWaDpbKxoqCGcSxbxk/j2sVn2wf
         vgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353795; x=1771958595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X8l290N01INdEGDV46RV1qE15ZPFcOjbnuocE2MfqwE=;
        b=fRO99UYD9hEvOtqmRnlZjsppx6PpqZtyxKO2CUII/mENu9cEUsdflb8GRSyq8NanSh
         eAvrzSiTrntTGO+maUUBzttMXNOqX0pAc/19kwtqszeOeKkGnblcghPKVPALMu6fWJCa
         grIHTUETwnASBLvgPCL6MGpt4V8XOfUGyo7jXaDOof3cqnv7Ja6Y8Kr3uOP1rslGsZsp
         8AH7TLOOf07E8Pou6tL8T17i6MSKvbo6k1ls4XOXg7BMuvvxSrznIx5yiJao+XvNwesl
         Zeyzfi2e6zfdc5FPlFBa7x+5dW6CTgc3r2MtMc5yAstqG72dY0VdOoSHf0gqDEC5Liad
         w2fw==
X-Forwarded-Encrypted: i=1; AJvYcCW4zbs8GfdHP9YSNHsoR/DdCM3cB6SQTrglOOmzw8lvUnTONcDSIYYxy0kBbdvhMnhWimM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yznuxtin3bvItS8nlOFCxnHPgfCIYkCtV7BqyTwaxlE9iub9QFm
	p0V7UcUO6eXNy9SOquXKaoIzyfBqBzPU3hQvnWxnp+WD8D4/lufnf7yz
X-Gm-Gg: AZuq6aIJncn/4M9CHUF3N4rrQRjrEXWPKYaR3HaWWb8Kvy4nONzzgvbzgKWdIlOnNc0
	v/DB1a8JuV3xK4fRm/pVYdCG7vVqLagzgJWJqaZ85ynolCfxJuHkIabhZY+GEDjOkzDz9yal9C0
	lG2/OZ2UsHlgAXiR03sN9RMNdA/aSSGWa4todO6ZAwEeD8bDk3AFl1p05wUD3w2vyXQnjwkEt1L
	CyiTfVcAmkDw0loizxwmkouUu7dMIJed5tbeZ81WSWQfiEWBpHaH4TULx3Ah7UbqtTzBZ+Ei/FA
	4XognkZWdaJ/P0flUIpd+mxulZBG2IZ9RQxKWY1AJsSgMBdGAD8P5CJWvwfBlDooEUFTduGgg/B
	iG3JWm90nbe7YJsp5cxyvGwDZSA50WIjc3GMiWtae5yg/pfi7pfdCggFdQCacaF1EcB4Or8dk2g
	d+s2cjQXbYTbVq0cxNyIeVGkPRB+G0kgi6OaEhg3t+/a+bmBSEFB7RDeuDvxIkcvnqwTzBI+VSY
	4x/hBLmxQt7nJsSE7BW51e3JOcxYSozsj7oRoJUTwoAI1M7C0Q=
X-Received: by 2002:a05:600c:3f0c:b0:47d:5e02:14e5 with SMTP id 5b1f17b1804b1-483739ffa1emr277408295e9.5.1771353794807;
        Tue, 17 Feb 2026 10:43:14 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:14 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 01/11] arm64: dts: imx8mm-var-som: Move UART4 description to Symphony carrier
Date: Tue, 17 Feb 2026 19:42:35 +0100
Message-ID: <0ccc14794f4c77dc10b1d900597374061cd65919.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MM module does not provide an onboard debug console.
UART4 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART4 node from the SOM device tree to the
imx8mm-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mm-var-som-symphony.dts  | 18 ++++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-som.dtsi     | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index affbc67c2ef6..819707e6f3bf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -11,6 +11,10 @@ / {
 	model = "Variscite VAR-SOM-MX8MM Symphony evaluation board";
 	compatible = "variscite,var-som-mx8mm-symphony", "variscite,var-som-mx8mm", "fsl,imx8mm";
 
+	chosen {
+		stdout-path = &uart4;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -156,6 +160,13 @@ &uart3 {
 	status = "okay";
 };
 
+/* Console */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usbotg1 {
 	disable-over-current;
 	extcon = <&extcon_usbotg1>, <&extcon_usbotg1>;
@@ -251,4 +262,11 @@ MX8MM_IOMUXC_UART3_RXD_UART3_DCE_RX	0x140
 			MX8MM_IOMUXC_UART3_TXD_UART3_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MM_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 190bde4edcd7..b6560c03639e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -9,10 +9,6 @@
 / {
 	model = "Variscite VAR-SOM-MX8MM module";
 
-	chosen {
-		stdout-path = &uart4;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x80000000>;
@@ -274,13 +270,6 @@ &uart2 {
 	status = "okay";
 };
 
-/* Console */
-&uart4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart4>;
-	status = "okay";
-};
-
 &usbotg1 {
 	dr_mode = "otg";
 	usb-role-switch;
@@ -418,13 +407,6 @@ MX8MM_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
 		>;
 	};
 
-	pinctrl_uart4: uart4grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
-			MX8MM_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
-		>;
-	};
-
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-- 
2.47.3

