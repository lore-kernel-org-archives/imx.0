Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574514;
	b=VkVCxZHcFnd6/LKdzb/ybyjXqhFmSvHHpnSHfbSvEQxlvdUgDs1tZghZYe4P9gaTkAKm
	 hVNyQUgvHCZmKVZd0r1J4n9mq87V29lK2lWL3MQ3CmT0uJ+gNh337wcyJyO0E0AJsA9d6
	 q3uChffpZyjcFcrbEyDCPQIO6YOEdS4Dvn1ImFmzMBdkf2pMaHTb/KwgBrHifkCkGvMyc
	 ECb0ZuK41AhYtaH8EHv9Z2mjf1GXO+y+niSzG7wJrqVPp2DHEqJNGt7xSjEtqoGtgKzpf
	 wzwd382rnmaM+P7m5E2aSxRx+UePHU3/w1dQGteL57hhGJIgmue0/mfiCIy1THMKgXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fmQtxD5ltcvpFoaJbm6dtzVdLv6aa0Yf3BVfvtcHkks=;
	b=mttsAz8IFUyGPJhURf1RMbYFBFtoMFEfcy5R9hGidFvKW2tw0/MAmCQD0w3wDaAIrE5i
	 Yw89DBvnIPeXMJofHdgs7M5oG3yoaMP0G/7PE41reiR075wpTlRLXTRgs1d63/WLEsO+X
	 bn45whTSNX/6tWh7XO9RyAOd06esSguZ9OAA7uy5azT7sjnI3BiKQc3tKJqJH14FVXPaF
	 gWgG4nYqDGaxWHd+RtnnlQJTCtu+GN5ikNS1SzjxZo7U7QxWSXpQRGjbiS2ljaOgS3Y/P
	 QlRk79ARU9XsArznU1w72L+I9nbqsqMZjJivrNfm0g1yv6ImPz0YOAIAa0iJ984cEWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=InaWGdVS;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A6D606A325
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 09:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A6D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=InaWGdVS
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so2800825e9.1
        for <imx@lists.linux.dev>; Wed, 21 Oct 2026 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792574511; x=1793179311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmQtxD5ltcvpFoaJbm6dtzVdLv6aa0Yf3BVfvtcHkks=;
        b=InaWGdVSJ/J2xD5SATUp4JplguClhfCXdgNBVX3dFsqq3WW6At5QbXQfqcFgSaP/Yh
         MBDmrUU6c4NHLvDhSRhQfk96+NtxcGU9C93IWLudUH5lrGkK3vzHiayMg1m0/WhB/vTK
         JwfF7J0wEg4aTXrRbpQsEaco/jJlV8vJsG9oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574511; x=1793179311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fmQtxD5ltcvpFoaJbm6dtzVdLv6aa0Yf3BVfvtcHkks=;
        b=YJneBuzV/gfC18i5Y6Fq50N2OWTZd3d/cgClTpxmPDvKbeUhLbhkfgtCvBvVchMga0
         vsfZJKwYuGM7n0QWcfqGMMw+fhEZDhPZ/cgsMOKFgkMvqKqQSD309yEI6Nxb7/2QU0YY
         93tpyjVYooqeV4vQPsTuE282mmmYjxgybXNuYUZVAAiX0H4ut1CgTApDlrpqeOVUBlDT
         TOHncSXYYXr/Q2nkME+nmu2+oXJqTSc1FycPCueRocDwO5yVatdvu/V4Mh+k9baTMgB9
         Hu8hOzhDaz+CbqSepFIrNHFgBHP9HQSqgV29kYKVYVihwvw/kM+hhl3H50AN75pcttWT
         +6GA==
X-Forwarded-Encrypted: i=1; AKwUvBwDSwqOOrYjEfM7pE69SmD4rKNCYZzivHtVQ606+YshKugvsoIjJwSBhDgt8Bj/rtQ4Avs=@lists.linux.dev
X-Gm-Message-State: AFq9FYLD5uDVuIuoyn5CHuwOsuEbtXeDrsiPporXK4CBM7iwr537RkRS
	TMvRWz5FnACi1EnifV7sUam5W7q67yuNgmSNuGF9ebdjGm5ncJLLt/ud19gAc+EL010=
X-Gm-Gg: AYBFou2i2MlritCHhaQPyng34du/SF/CaiP6cIpMvvEO3UY2H0XdoLnkxXyL3EviKQW
	Y2TeDi/ZrdKeS7UgPTlpbPJxfbdMtkZn6sFXiFfLa79m9VcvFc7677CELgj/gOFT3poM0w3H9Fm
	RKlH6cq09A9KiO1xD3VVKvcKjUBZ3hfsvmGxpGdXepvhZfIijyZmdPc9Z0vbXrIEP1N2o9qJvKX
	hIPRO20SYsdhdeD4L4KX59vDIK2e9HgldZhg+6eY3iTBwaeiqCoscGN+TmCAbOV72CLc4TOzgH5
	A4x0grhryvyZZvWjuQrRbsHQusfJKh5wlyYlP7hRfT36w4RVAAzGBYEbewBqmj3Ut8E9YWHmQYL
	BwFXoTfrfNWJ7+9e3ZdnEECSLVf3khEMOdHf6oaHkx9ddFOmHEfhMtruRxKBYMdOndLUCnxp9gR
	KHP3HKwcAIzDyESp3yM+uA3rHR4Q4h1aeaW9xTlp6hXCRsKhJ3+JBYG4cHVgA/gD31zGHhbia3v
	IRv7fLzMuvpuqcQJS5gn8rvNjr2gXVM6p36oy1bWpsi4xeKYlZ1IRls+3qI3q+8GvjvERP7A1A4
	GHFip5ThDyAN/89udA==
X-Received: by 2002:a05:600c:4e03:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a1fdd14200mr25024955e9.12.1792574511333;
        Wed, 21 Oct 2026 02:21:51 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm16130845e9.11.2026.10.21.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:21:50 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v3 2/2] arm: dts: nxp: imx: Add devicetree files for M48
Date: Wed, 21 Oct 2026 12:21:38 +0300
Message-ID: <20261021092140.4142493-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021092140.4142493-1-petko.manolov@konsulko.com>
References: <20261021092140.4142493-1-petko.manolov@konsulko.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

Add the DT for the two variants of M48 that are based on imx6q and
imx6dl.

Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  16 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  16 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 213 ++++++++++++++++++
 4 files changed, 247 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1a2539fa19b4..cdd252fd5109 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -104,6 +104,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-dfi-fs700-m60.dtb \
 	imx6dl-dhcom-pdk2.dtb \
 	imx6dl-dhcom-picoitx.dtb \
+	imx6dl-draeger-m48.dtb \
 	imx6dl-eckelmann-ci4x10.dtb \
 	imx6dl-emcon-avari.dtb \
 	imx6dl-gw51xx.dtb \
@@ -219,6 +220,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-display5-tianma-tm070-1280x768.dtb \
 	imx6q-dmo-edmqmx6.dtb \
 	imx6q-dms-ba16.dtb \
+	imx6q-draeger-m48.dtb \
 	imx6q-ds.dtb \
 	imx6q-emcon-avari.dtb \
 	imx6q-evi.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
new file mode 100644
index 000000000000..b0bc9a67f5b3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ *
+ * Device Tree file for Draeger M48 Board
+ */
+
+/dts-v1/;
+
+#include "imx6dl.dtsi"
+#include "imx6qdl-draeger-m48.dtsi"
+
+/ {
+	model = "Draeger M48 i.MX6 DualLite";
+	compatible = "draeger,imx6dl-m48", "fsl,imx6dl";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts b/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
new file mode 100644
index 000000000000..ff9c337e93fb
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ *
+ * Device Tree file for Draeger M48 Board
+ */
+
+/dts-v1/;
+
+#include "imx6q.dtsi"
+#include "imx6qdl-draeger-m48.dtsi"
+
+/ {
+	model = "Draeger M48 i.MX6 Quad";
+	compatible = "draeger,imx6q-m48", "fsl,imx6q";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
new file mode 100644
index 000000000000..19207d45764c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * (C) Copyright 2020 Draeger and Licensors, info@draeger.com
+ * Based on work by Russell King
+ *
+ * Device Tree file for Draeger M48 Board
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	aliases {
+		mmc0 = &usdhc3;
+	};
+
+	chosen {
+		stdout-path = &uart1;
+	};
+
+	/* Will be filled by the bootloader */
+	memory@10000000 {
+		device_type = "memory";
+		reg = <0x10000000 0x80000000>;
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet>;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy: ethernet-phy@0 {
+			reg = <0>;
+			rxc-skew-ps = <1380>;
+			rxd0-skew-ps = <0>;
+			rxd1-skew-ps = <0>;
+			rxd2-skew-ps = <0>;
+			rxd3-skew-ps = <0>;
+			rxdv-skew-ps = <0>;
+			txc-skew-ps = <1860>;
+			txd0-skew-ps = <0>;
+			txd1-skew-ps = <0>;
+			txd2-skew-ps = <0>;
+			txd3-skew-ps = <0>;
+			txen-skew-ps = <0>;
+		};
+	};
+};
+
+&hdmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+	sda-gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	eeprom_mac: eeprom@50 {
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&i2c3 {
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio3 17 GPIO_ACTIVE_HIGH>;
+	sda-gpios = <&gpio3 18 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+};
+
+&ldb {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lvds>;
+	fsl,dual-channel;
+	status = "okay";
+
+	lvds-channel@0 {
+		fsl,data-mapping = "spwg";
+		fsl,data-width = <24>;
+		status = "okay";
+
+		display-timings {
+			native-mode = <&timing0>;
+
+			/* LVDS split mode */
+			timing0: timing-1920x1080 {
+				clock-frequency = <71190000>;	/* pixclk / 2 */
+				hactive = <1920>;
+				vactive = <1080>;
+				hback-porch = <60>;		/* left * 2 */
+				hfront-porch = <60>;		/* right * 2 */
+				vback-porch = <30>;
+				vfront-porch = <3>;
+				hsync-len = <60>;		/* hsync * 2 */
+				vsync-len = <17>;
+			};
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
+&usdhc3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL1__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_RGMII_TXC__RGMII_TXC		0x13018
+			MX6QDL_PAD_RGMII_TD0__RGMII_TD0		0x1b018
+			MX6QDL_PAD_RGMII_TD1__RGMII_TD1		0x1b018
+			MX6QDL_PAD_RGMII_TD2__RGMII_TD2		0x1b018
+			MX6QDL_PAD_RGMII_TD3__RGMII_TD3		0x1b018
+			MX6QDL_PAD_RGMII_TX_CTL__RGMII_TX_CTL	0x13018
+			MX6QDL_PAD_ENET_REF_CLK__ENET_TX_CLK	0x1b0b0
+			MX6QDL_PAD_RGMII_RXC__RGMII_RXC		0x13030
+			MX6QDL_PAD_RGMII_RD0__RGMII_RD0		0x1b030
+			MX6QDL_PAD_RGMII_RD1__RGMII_RD1		0x1b030
+			MX6QDL_PAD_RGMII_RD2__RGMII_RD2		0x1b030
+			MX6QDL_PAD_RGMII_RD3__RGMII_RD3		0x1b030
+			MX6QDL_PAD_RGMII_RX_CTL__RGMII_RX_CTL	0x13030
+		>;
+	};
+
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D16__HDMI_TX_DDC_SDA	0x1b0b0
+			MX6QDL_PAD_EIM_EB2__HDMI_TX_DDC_SCL	0x1b0b0
+		>;
+	};
+
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__I2C2_SCL		0x4001b820
+			MX6QDL_PAD_KEY_ROW3__I2C2_SDA		0x4001b820
+		>;
+	};
+
+	pinctrl_i2c2_gpio: i2c2gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_KEY_COL3__GPIO4_IO12		0x1b820
+			MX6QDL_PAD_KEY_ROW3__GPIO4_IO13		0x1b820
+		>;
+	};
+
+	pinctrl_i2c3: i2c3grp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__I2C3_SCL		0x4001b820
+			MX6QDL_PAD_EIM_D18__I2C3_SDA		0x4001b820
+		>;
+	};
+
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_D17__GPIO3_IO17		0x1b820
+			MX6QDL_PAD_EIM_D18__GPIO3_IO18		0x1b820
+		>;
+	};
+
+	pinctrl_lvds: lvdsgrp {
+		fsl,pins = <
+			MX6QDL_PAD_EIM_A22__GPIO2_IO16		0x1b010	/* DISPLAY_EN */
+			MX6QDL_PAD_EIM_A20__GPIO2_IO18		0x1b010	/* BACKLIGHT_EN */
+			MX6QDL_PAD_EIM_A18__GPIO2_IO20		0x1b010	/* DISP0_CONTRAST */
+		>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_DAT7__UART1_TX_DATA	0x1b010
+			MX6QDL_PAD_SD3_DAT6__UART1_RX_DATA	0x1b010
+		>;
+	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX6QDL_PAD_SD3_CMD__SD3_CMD		0x1b060
+			MX6QDL_PAD_SD3_CLK__SD3_CLK		0x1b060
+			MX6QDL_PAD_SD3_DAT0__SD3_DATA0		0x1b060
+			MX6QDL_PAD_SD3_DAT1__SD3_DATA1		0x1b060
+			MX6QDL_PAD_SD3_DAT2__SD3_DATA2		0x1b060
+			MX6QDL_PAD_SD3_DAT3__SD3_DATA3		0x1b060
+			MX6QDL_PAD_NANDF_CS1__SD3_VSELECT	0x1b060
+		>;
+	};
+};
-- 
2.47.3

