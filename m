Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DA7171080
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 16:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712333261; cv=none; b=fAMCKhw/ejB5irIwlFk40saXCcrXB/Y5btLRHrHqUYuMsF2CEh4eYD3wBvZo6aa9UhmpGMHjsf4dYxoS+E1Y5d86hY46M9NKe/GdRm4mVlt3CE7EEskCK4tHZlxgHwGtOTswcrhYOLNNBwJOlxf+Ux9bB19/8xkKcQLgUQ9lOqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712333261; c=relaxed/simple;
	bh=dBH1j/h1dRu0ygt9hNbmwa87jEdhv9yAzGW6ZwQoLsM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M1qQPZ86GtgRGlmFt3Fycw7ETdGiaTXkpikPN0c645679HuAp3AmsYhJQ6YuNFAr7JAuEjJBe13nRUwXFBa7/vVCnLMvHPL+JS3uvBTI1tKzA26TvP+BlDFVN9mW68k9ybO1Pl0ytRCZABQxjVS6VFk2wSvoQrUCaqm4gCA2ge0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOyit0hT; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOyit0hT"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d700beb6beso26390581fa.2
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 09:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712333258; x=1712938058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgmM3Xbata7VzEXtxd2ThwevKFI1uBmzRn4wOr+9OFw=;
        b=mOyit0hTgtcz0H9HdHDNN1ghE0j9KnCtjZs6wWdqxzq5WFheQlsCllZxRJMWNmirnl
         Y8epFksUOLEt77u7rMsimbNaIQGvkW+kws5ZVO4tKYQN6AkuhwDQYDuI4NB5wkO18XxX
         GND2wT3E0YwrVHpz2Gw8IhMmdX2mthl0vmZE2uIRbMvZd/XD4cPvSJX7Vgd7Eog4mPJL
         tGBdLreFvGQaRlLjH6COeVsA0Cc9Q/i4vzlPYcbe/O2hrAgNMEgu3zWLpNKUiQQ1ix5a
         VU+a6uGuhfkrzETo6QnXT+N/v/sNLjJgw3oK+FAnEF/b+OVX0PE8SAP0K/5m2fJO2C2o
         EKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712333258; x=1712938058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgmM3Xbata7VzEXtxd2ThwevKFI1uBmzRn4wOr+9OFw=;
        b=LA67QQ5e7mqcwNihTj01pNvBMsAUzbMXxWCCYmFJ/GmsL0FWOLArL1SSDpRRpHQBCD
         wfXaThp/4XK1vzHOMUvkib6V4qONGbHuPowNrlYInboeejFb3/sbB6UuVNpaf32Eb+4Y
         cTdgIaCSGAwb18ikV11xOY2Xg3/gXyqKouw23/NIqBEPGRL+6Oy0Aa6cXVm9rnce9kJH
         oB7vEfw85gtpnrHA6uq9r46ss5DCvbXtiMeduwS/enqyr7O9JWV+uUpzIjL4ZkElwUer
         7L0b9jUqgRNwG4x/KzGnmYkJjE1S8x598p95go7yURNmnJSJzgiDS+LZXYw5vy9/xK9o
         8Jjw==
X-Forwarded-Encrypted: i=1; AJvYcCVKYCVhE08/CwHiZq27UbP3vt1xikZvG/9iWh1qcs/0p4yeRrCNKIaXSWta6b2K0n3aWvx/duxycdU+zz9Uc09bvqKv
X-Gm-Message-State: AOJu0YznWtepLuYEtvzBu+6E6eP1NkpcHQEBeZpi82V9++oIWUOBMg0B
	IKsSrZlaq3DKNFnXOkghil795RF2OuOJh8rmTXqHZ7qyqYRXenKT
X-Google-Smtp-Source: AGHT+IGcCu7kSbpvYBdqwmxAjtE9WbGU1f3WKzshRVZ88A/8Ug7BCKSWBua5SkDNKu2NdPeTUB5Puw==
X-Received: by 2002:a2e:9045:0:b0:2d8:681:dc9e with SMTP id n5-20020a2e9045000000b002d80681dc9emr1448379ljg.41.1712333258017;
        Fri, 05 Apr 2024 09:07:38 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:f624:ad13:2091:c808])
        by smtp.gmail.com with ESMTPSA id k41-20020a05600c1ca900b004156c501e24sm6902651wms.12.2024.04.05.09.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 09:07:36 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 2/4] arm64: dts: freescale: imx8mp-verdin-dahlia: support sleep-moci
Date: Fri,  5 Apr 2024 18:07:18 +0200
Message-Id: <20240405160720.5977-3-eichest@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240405160720.5977-1-eichest@gmail.com>
References: <20240405160720.5977-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Previously, we had the sleep-moci pin set to always on. However, the
Dahlia carrier board supports disabling the sleep-moci when the system
is suspended to power down peripherals that support it. This reduces
overall power consumption. This commit adds support for this feature by
disabling the reg_force_sleep_moci regulator and adding two new
regulators for the USB hub and PCIe that can be turned off when the
system is suspended.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 .../dts/freescale/imx8mp-verdin-dahlia.dtsi   | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
index e68e0e6f21e9..abad1887040a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-dahlia.dtsi
@@ -32,6 +32,25 @@ simple-audio-card,cpu {
 			sound-dai = <&sai1>;
 		};
 	};
+
+	reg_usb_hub: regulator-usb-hub {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		regulator-name = "HUB_PWR_EN";
+	};
+
+	reg_pcie: regulator-pcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		/* Verdin CTRL_SLEEP_MOCI# (SODIMM 256) */
+		gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		regulator-boot-on;
+		regulator-name = "PCIE_1_PWR_EN";
+		startup-delay-us = <100000>;
+	};
 };
 
 &backlight {
@@ -117,6 +136,7 @@ wm8904_1a: audio-codec@1a {
 
 /* Verdin PCIE_1 */
 &pcie {
+	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
 
@@ -143,6 +163,11 @@ &reg_usdhc2_vmmc {
 	vin-supply = <&reg_3p3v>;
 };
 
+/* We support turning off sleep moci on Dahlia */
+&reg_force_sleep_moci {
+	status = "disabled";
+};
+
 /* Verdin I2S_1 */
 &sai1 {
 	assigned-clocks = <&clk IMX8MP_CLK_SAI1>;
@@ -186,6 +211,25 @@ &usb3_phy1 {
 	status = "okay";
 };
 
+&usb_dwc3_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	usb_hub_3_0: usb-hub@1 {
+		compatible = "usb424,5744";
+		reg = <1>;
+		peer-hub = <&usb_hub_2_0>;
+		vdd-supply = <&reg_usb_hub>;
+	};
+
+	usb_hub_2_0: usb-hub@2 {
+		compatible = "usb424,2744";
+		reg = <2>;
+		peer-hub = <&usb_hub_3_0>;
+		vdd-supply = <&reg_usb_hub>;
+	};
+};
+
 /* Verdin SD_1 */
 &usdhc2 {
 	status = "okay";
-- 
2.40.1

