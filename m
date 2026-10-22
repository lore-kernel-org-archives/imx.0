Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677782;
	b=oNdUq54QPzDss9DVCOmB8rOItjP5d6F8btUYCrDM65jVorEAA4PGucbxEEcQCMx12CGE
	 xj+A+I538vknFsR9TtGtAmHw49OKF87SbhxBJy/dX2ox2YK6ReNR2dveJpmNOz8/dwUwS
	 cng539dEjztmFDWHGEM2RWDtfIT36J2FNx7yUiQR5famucm5PywwHO51nM++lX+P5E+Gi
	 IRQMpZtxFSuxMxExIJuvWyCIZ1bDQSxcFpJN4Davb6472ZP/+MP/oV/DlOfDHlWoNXz9R
	 WpdSu6nYiFE6FW5Q75rzXaMBfcX1Y+vGMfWkhblS/7gGkRuzKKeQ8KHruQ7j0or6GAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yV1RxJJscrXOeI7Q/8W59C0ANld22tAuW0rA5vcBUxc=;
	b=zVy4ItHePR0W+YQBwU6RSJbxz8Lp+ymNMi7QI6RLrb/jFy5SCIuPUs0LMG0/+drbn5vj
	 ryzfLeO9+6VB8UVorEfp1WEa7s59psMuZ9Cns/P/fRGg7/RjCHzP8j1RzIhnGW4cb7QtI
	 uB5haa/bwJacYP5nVhoWWbJc/eD5uO9B0GJAUhCIFWMkGKOQTNGMLSFrSpRicltH+rlPn
	 r9v0NJn9qHFLuPnFUso3IvjaeM4qn5oUGfFjPH5UW3Au/wy88t4Eqh99gY5UxigoniCFP
	 vSCq5+8KQ8dO3SVzJuEgRayMe5XGLG500m3f7Gv9N7qmZDPq/LV2+ibAVB03706AX7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=MWy7IWjj;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE38606A33D
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE38606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=MWy7IWjj
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso24251195e9.2
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792677780; x=1793282580; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yV1RxJJscrXOeI7Q/8W59C0ANld22tAuW0rA5vcBUxc=;
        b=MWy7IWjjxEf1LPsZQYe+Or2IE/tpZ+jVWDDUNo2/cfA+uAirooVg0Q8b+3rl4hOfe9
         PqT0Jh/eMWR77yulqqNKTbiIIc41uOkyT1uRoVs4V8mPxp0ottRKG79H0tmQSsziet4p
         X8IGQeXTdk9bu8MmJ38BnOhCd35hfHuQj/0Yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677780; x=1793282580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yV1RxJJscrXOeI7Q/8W59C0ANld22tAuW0rA5vcBUxc=;
        b=Ld3QegsfoKLPYHwCCWVR/0qevYDgDuPImaVdQ6pgOUfJNgb3t08979URkibCXILQeC
         cToKCcidb4ryP4ongoPNmtQ/R7iE7/123XNk43v4qA5VjqNQi4s9FDkB5fgAMLBJDZsJ
         vylYDBGjQnLDpx83dEMO0BMwsUPpHQryTmVk32m6pUlPnoAhoz/ZFA/a/avjQ+4AODWe
         8hWrY5kDxc+wgTyAGXeCebRgV46n93RE+9zlGRg4UgC/xv4qoPmmmL+rq//x/XD6jXLg
         dWKYy5HIdls1SEohqcLTBuNo7M18P3Yzq1puRQOLOGLX5e3hMN5byVbJcmoJYMoXLtaA
         oNDA==
X-Forwarded-Encrypted: i=1; AKwUvBzkhXqNW7olgO8Oicpl0R1bwZwrJP90Ac56M0ZjCt0OdB3rYJzVuBo2b+OEMNSz8U0IkTs=@lists.linux.dev
X-Gm-Message-State: AFq9FYI2jaTZzruwbGcL83DuUTkaA/77kZKMi97IlywEecy6fx0ud67F
	d1GWctqBGoZ7fyz8ndT/YNwEXPO4C3sLH3cPlBdVUCycJArn7ur304/fd6pcCRoJCDE=
X-Gm-Gg: AYBFou0sGPWQAuBlkX/1YJZd07DOsCrG1XIrEbtC4NNeyLYmd7/MfpbzpYLA8CNiWDd
	xUnF+3z36HJJYEMkzZbTTSq8z/UXtg/TTKx/whidhvoRCmQzB7C6UAGo2tYRpnbnmjEjQ2WIHxh
	BOgVrLcvbicQw4rmpgO9LWBugJ7yHXPLhqQSpYz6OuExp6+8Znj8JV0ZS6rh0jVYHQbkWUBf+66
	f5VaLNwLmCLvbu9HaVrWLpTtLUoW92VWbBvzcs4sVnAU2ZbLU7hqO79oXX6zJkg5GJ1Pq7dNYbQ
	u3Kasnm5hASBT5QYapQIOHMexWAWAIUk22bqG+AcN1lEFZNN1mMWuT/mCka+2hLly1cZgdDVeWY
	oVB9P6pd0W+g6V3FaJXDvZV9LzDi6OjKeoMcftrDqMS1kHbTA/bQj1XmcCJotgL1EjRre2iMaDK
	srd6NDVMHUVR0syCoJ+sL2bQ9ft8aAvjK3w06Lmh5Y0+t5w25nZFIiTSqryeBbJYRLvuuYCJNSf
	osif7ucdEuzrEbzcOj90+ShzGOjb+mYuXhLi8FX8fFs7FPdhNJYFQs3/tuGcX/NvyaSW/bR
X-Received: by 2002:a5d:584d:0:b0:48e:28bd:e010 with SMTP id ffacd0b85a97d-48e28bde4b0mr8838292f8f.7.1792677779627;
        Thu, 22 Oct 2026 07:02:59 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm12538258f8f.32.2026.10.22.07.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:02:59 -0700 (PDT)
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
Subject: [PATCH v4 2/2] arm: dts: nxp: imx: Add devicetree files for M48
Date: Thu, 22 Oct 2026 17:02:43 +0300
Message-ID: <20261022140244.3476844-3-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022140244.3476844-1-petko.manolov@konsulko.com>
References: <20261022140244.3476844-1-petko.manolov@konsulko.com>
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
index 000000000000..bb2c149c64bb
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
+	scl-gpios = <&gpio4 12 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio4 13 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
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
+	scl-gpios = <&gpio3 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio3 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
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
+				clock-frequency = <142380000>;
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
+			MX6QDL_PAD_EIM_D16__HDMI_TX_DDC_SDA	0x4001b8b1
+			MX6QDL_PAD_EIM_EB2__HDMI_TX_DDC_SCL	0x4001b8b1
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
+			MX6QDL_PAD_KEY_COL3__GPIO4_IO12		0x4001b820
+			MX6QDL_PAD_KEY_ROW3__GPIO4_IO13		0x4001b820
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
+			MX6QDL_PAD_EIM_D17__GPIO3_IO17		0x4001b820
+			MX6QDL_PAD_EIM_D18__GPIO3_IO18		0x4001b820
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

