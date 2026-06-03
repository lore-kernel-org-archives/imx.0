Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E3E46AF1B
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 12:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488005; cv=none; b=Dh9IZ+stPaZt9TsVvCttQTiXa3iLM+s7YNwPFpjs0bM4dwP4kYlU8CIDZBYiw8JeZ58vnlnpIDv5e69ihD+3542lqP7IRedmW5aeFWL/Nvy266xlm0eE9Wrkq2A1wHCFfa4njdC1Kfo3tXzQHBh0hvzYlHezmgH/vSQXrcGGVi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488005; c=relaxed/simple;
	bh=KKXR58sn63bRTQCGBqv54xyTr+snqZL+yHVCEQsoGrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PxZJtIlUd0S+P3+jtMsGyl3IIEDOrPOoZL5u2RRwBuyoyYDSEDHrBtjecThBsY+/hQSpWNqqUx/F5FAPTa/FDZ4oweri00ZdHD0X4m5dQ1+Ip7swxXU/itedg32xup+v+Fsplxvv1EYXMKInNDHvtcTf3iPtx9qCAzChP2QeRBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKP4P5cY; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKP4P5cY"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so4836629f8f.2
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488002; x=1781092802; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOAXMQJRInvRkdYBQodwzb/O3fe/WllfMF2583czUuU=;
        b=WKP4P5cYaozfMFwmwWrw3CvOO8EpTjz4Xtk7S980uSh6OsfnSz1UxcWSnzAai2OEJR
         lkdmtTqMoprBS0mRPDHv39jgkcJCjkEh0yJFawsDBvD8rkk6rthB+C8PqUP7s8P1QYic
         BhShbjowCnBlVW3wIoo0z5IEt5ExHytcRo2fvxxxKkUrzatUrFRP4pBP1juTMTYrQGdh
         TKg+D9BqFXiQTAkJUetehK5Orts0q8JBKReJOZ79jc8lDcxjDT45Roj4LcaxgLRLrtxn
         VEMkfn61gspLC5H5DiKLtoFXK7EJIrh8HyXQWTahIQfBH3fPeWMUiMd6TSJqzFPgbtr2
         Z9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488002; x=1781092802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BOAXMQJRInvRkdYBQodwzb/O3fe/WllfMF2583czUuU=;
        b=kI84350/yCjYNXzP5UFrk1PiQnhz2ln6axSHN1txeWtF01jijaTeWta4zVlffz5ZJe
         FfRdxZsLtvAUMcHA9razU4gfMJmYsvcEPwDIGX5DGCA8VQof6byGQ9fWXZl76HlQ+Bwz
         hPA+WSQEGakUGjk3KqVnYjxw75RvfJCoF61hcn/mvoqfJrUIDnn3HCC40aC9auiurwSc
         czpM3IFE0i8IHRoI3KG8FO+AfU/8NZzsokF98JkqcPlkRZbJdchJmwV+dn3i/2mpfD6Y
         YCydHmJF8yP9e/rSMDGGOvlV/+/FhcNAMNHMj708cEg+vF2NQtZnRaLfKn/5omJ0YqOw
         OiZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1dUqePKcsfNA/rMn+ROqTuXUSYVqnO4RbFpqxvr+GySIdO2QgpfoKYBKS5l8nddMZ480=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7UPCyljwYIQ3+O0EkExw5ZLfUAU6pPLzif3WRcdmv9IvIP4TN
	RrTIlT8kQ8+dpTPk8+spa/tQQpRs6/LWmfjaaGFKsVnUdJdBXIcE5qdr
X-Gm-Gg: Acq92OGt4d6jIQzLe+uaojWusYqJTyrUBIgRqyOMushF8lwSP6FA7ier/aFVtVwdmrv
	ZUeDajaEVC63JYYlkUhO4aLeu06BUv82Y6d0F5Qe2/bb+aQndiFiGITe2/lfKq0XO3cp+pf6zB4
	n2mmBPMLb2COX357f6DOo11q7AlG9DQpY3tw6bVksAoXZJX1x/inai4Ix22TAoplLmIrscfWU4x
	gid6r93AWOnVmWllZMBwdsjgqoW9ixjnoX9sor5JqTcb9IhZS9J1lDK2TWD9ONBvm/hMnBELkbF
	XFyJGqxLfjSXf+i3HT8kNoD5CJVPGj2J8Hdz748/+PliGXh2FwI3LMiVhDWyBV8wTtTrl439qcC
	P9BxNL6PglY8SD8Gfa0lliTKE+a7adwBJ2wWChVzcUWoBiloQjCqBcP/Ehnl62vc34v/mKtwYbk
	q3u/WUdiQbMQg+6xUeWbC5f5oLdZm4oU+AjU3ArGKnoBXyBpxNaZVjsBP+K1nRB83hrDUihyFjb
	DyTuqmulTkjhBh/7uBaaWMZQWMmNchcVbAApF/jYT2RpCdK
X-Received: by 2002:a05:6000:18ab:b0:45e:a0ab:8bcb with SMTP id ffacd0b85a97d-460217de189mr4934181f8f.15.1780488002109;
        Wed, 03 Jun 2026 05:00:02 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:01 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 02/12] arm64: dts: imx8mp-var-som-symphony: enable USB support
Date: Wed,  3 Jun 2026 13:55:40 +0200
Message-ID: <36b7fad5b7cc932f502449cf4082e57f732e8bb2.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the USB controllers on the Symphony carrier board.

Add the PTN5150 Type-C controller for USB role switching, enable the USB3
PHYs and controllers, configure the I2C bus used by the Type-C
controller, and set the first USB port in OTG mode and the second port
in host mode.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 80 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 25f707012f62..de1b8b842848 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -72,8 +72,11 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 
 &i2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	/* GPIO expander */
@@ -95,6 +98,22 @@ usb3-sata-sel-hog {
 			line-name = "usb3_sata_sel";
 		};
 	};
+
+	/* USB Type-C Controller */
+	typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+
+		port {
+			typec_dr_sw: endpoint {
+				remote-endpoint = <&usb3_drd_sw>;
+			};
+		};
+	};
 };
 
 &snvs_pwrkey {
@@ -108,6 +127,52 @@ &uart2 {
 	status = "okay";
 };
 
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	srp-disable;
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb3_drd_sw: endpoint {
+			remote-endpoint = <&typec_dr_sw>;
+		};
+	};
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-comp-dis-tune-percent = <115>;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <33>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <122>;
+	status = "okay";
+};
+
+&usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vref-tune-percent = <116>;
+	status = "okay";
+};
+
 /* SD-card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -129,12 +194,25 @@ MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA                                 0x400001c2
 		>;
 	};
 
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18				0x1c2
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
 		>;
 	};
 
+	pinctrl_ptn5150: ptn5150grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
-- 
2.47.3

