Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD8F3E49CD
	for <imx@lists.linux.dev>; Sun, 27 Sep 2026 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513210; cv=none; b=ZOIJ19oATOH/D1S70iYir7hbGBu4p34WmjxSYISsfzvCA3w+uVEheaKRMUHjItQJWMF6yqYAvGj1OIiuWP+hIx/YIruYTmbow18xePXQhW4veFEChoUN39ZdudEnlmkxRzna1nXC7uwuKIii9orstqDRShhbMI2hmmELgg9APNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513210; c=relaxed/simple;
	bh=aO0jfTeBBUtrn88kIm9oVPFxK0MaKaOchSL/DtYqXIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hu+5osTVMgg91KlU/5JZy2bgeRzMXz7TnJWEbgFhKdYNGvTyLyekRxLwxdIS2liJ3VuRgb5k+Ta30C6o/DCTH+7hwstE9EgvNbfgXMsdDq0c3OjUBFSB4zT9oNuuns4dAayf9AQCDXEIHZI5KDMZdyLazSD5w02zaqUA5CaGLo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pDnq58nT; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDnq58nT"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so16093595e9.2
        for <imx@lists.linux.dev>; Sun, 27 Sep 2026 05:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513205; x=1791118005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G2qVhNq/ulYcGTI2MPiVjpYeX+WOZy3cqFCk18HRP7A=;
        b=pDnq58nTNnMYH4H7Daj9z5Hm7fgUwp20xn8ekJztbiuxXCuWDaVboDBOh3gyKVnM2U
         l/YU3a9C6PhgEVCheoQBO1ToRnL3bb9nWVE+4y/WCB1ZYrz9ra32U8man1sC9B9ryMpe
         N5uH2M5G7zsdkeZnSaLJPx3ZHmIBKHxVCZ/EGq/kSljXnrfEXYKgu98g1unub1GoVyiB
         JTW1vraRwvCQCN6jPe/f2N6qgk0BPOzZQhqP0FvUcc1V/ACeYjHrzQs5IAFFiX4fJbnu
         XI0BgN1/+TU0+W1WIl1QS9wldRJmkzFHm3Eu14LidXkhLSqwxvV8IfqBGQJUENqhSxvh
         mojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513205; x=1791118005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G2qVhNq/ulYcGTI2MPiVjpYeX+WOZy3cqFCk18HRP7A=;
        b=dBZe93GDX6W6r9QYp24A+pk1hJA21diEcVwbBcznFf3yEX6rsuvG/PR1WFgjGMDsyA
         R+H2I/+KFkct/lFft+SLXq6MpLAinWGE3DAiik/3q8xbcchPXW5k7jUeWn21KKAaIYU/
         1hR67eLqPhLLbP44hsaL6TVksrDV0hD4VmEjZaL5mRi66RzK+Yhpf9ifJEoe3P/iDj+r
         +Nm5d5vpz27ymOJXjtnYB8yNQniFyumpkO0e+gk9YTKJ1Z4nr8GCrZRpH2gh9j+hTt3y
         zTLtPt9QTSXjTWXlSZw1+Bqchz52Zmj6sqzPU+xM1yr0P1Fi7/khATuFFFDREmkMcutH
         Umeg==
X-Forwarded-Encrypted: i=1; AKwUvBxCs97/iUYzSrpAdfLJAJJD38hFBthAj+aQWDAM3nQD5lsjsSBV1W/AZA1k+Dgf8a84a88=@lists.linux.dev
X-Gm-Message-State: AFuF++k0Z2DOA7v+KyRb9SD0ZTytoRQynY+Zn7RrvEMA5pRnGFIB6DP2
	qPtzqGR5ZvnuDpc1dwVrNs4m2yxnz+eCpdtV9EwTPGylnLzbkKay1ur2
X-Gm-Gg: AYBFou2gj0Ey4ZZG0KGOBotdRLZxEU/2AEsg1bEg8hjBXHsUepZ+NiCskJw5AdfiWoP
	HJId6+grCOk4wAXLeuumM+CTZgSjQSTqg9s22oMvHU5JAQEP9BWXHYunEhIEJVE96+RgwD+YylW
	pkZJPvOu65x100nbasFT9zjnRTs5kmlGDLz2YtlmTHIW/VpUdLNg1i0yOnh7xGUdMrMylxsaOVd
	Qr7uWjclqv7kb/0ttv/aIVrsDJr2RteL+q5D6F1ZnxlwG0YIPofGIuI6tqCm9KA64/M9UAXuRnw
	AUcaLj5q4XaswcFhI2y4KlkZJh3GkDroJYBD94rSuP48F55AHyxnboTvV3X0h0qbDUxcYGfqXJ3
	769n0l7YeaSiKdweDc+ilvD8iHQ82d0OFeT67tG4kA964+6iOf/uiiPPgc8lkaruZg5ojAz6I8g
	dUzHnBbmzON4027/R2WD0N17rubgIb5Eb3vzdLG+hMPFOeAwLmfUQ7+cN40BuLxkY7+Y6hk5RBJ
	JwoNjr0INeZtRTX2vbGZ2XJImbh2KqXkDJ23DLPunYYEFeZH0KwHr9r3iX/Bv2R4kKGq87hOa7w
	fu2TGDJdSiYPuOacHbUaUw==
X-Received: by 2002:a05:600c:628c:b0:4a0:f4:1c76 with SMTP id 5b1f17b1804b1-4a000f41d51mr30627785e9.4.1790513204572;
        Sun, 27 Sep 2026 05:46:44 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm148440605e9.4.2026.09.27.05.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:46:43 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v3 06/12] ARM: dts: imx6ul: Add Variscite storage and wireless files
Date: Sun, 27 Sep 2026 14:46:21 +0200
Message-ID: <335592bb96129d875cf77bd87cabb77f1f9476da.1790512621.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add shared DTSI files for eMMC, NAND, Broadcom Wi-Fi and NXP
IW61x options on VAR-SOM-6UL and DART-6UL. These options have the
same descriptions on both modules, so use one file for each.

Keep the module options independent of the carrier board so each
board DTS can select its assembled storage and wireless devices.
The IW61x SDIO host has no child node, so it needs no address or
size cell properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Share identical eMMC, NAND, Broadcom Wi-Fi and IW61x DTSI files
   between the two modules.
 - Drop address and size cells from the IW61x SDIO host, which has no
   child node.

 .../dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi  | 32 ++++++++++
 .../dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi  | 63 +++++++++++++++++++
 .../nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi | 42 +++++++++++++
 .../imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi    | 43 +++++++++++++
 4 files changed, 180 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi
new file mode 100644
index 000000000000..26c8ca8f21a0
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-emmc.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2>;
+	bus-width = <8>;
+	no-1-8-v;
+	non-removable;
+	keep-power-in-suspend;
+	wakeup-source;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_usdhc2: usdhc2-grp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10069
+			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x17059
+			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x17059
+			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x17059
+			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x17059
+			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x17059
+			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x17059
+			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x17059
+			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x17059
+			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x17059
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi
new file mode 100644
index 000000000000..1522b5d7e092
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-nand.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+&gpmi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpmi_nand_1>;
+	status = "okay";
+
+	partitions {
+		compatible = "fixed-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "spl";
+			reg = <0x00000000 0x00200000>;
+		};
+
+		partition@200000 {
+			label = "uboot";
+			reg = <0x00200000 0x00200000>;
+		};
+
+		partition@400000 {
+			label = "uboot-env";
+			reg = <0x00400000 0x00100000>;
+		};
+
+		partition@500000 {
+			label = "kernel";
+			reg = <0x00500000 0x00c00000>;
+		};
+
+		partition@1100000 {
+			label = "rootfs";
+			reg = <0x01100000 0x3ef00000>;
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_gpmi_nand_1: gpmi-nand-1-grp {
+		fsl,pins = <
+			MX6UL_PAD_NAND_CLE__RAWNAND_CLE		0xb0b1
+			MX6UL_PAD_NAND_ALE__RAWNAND_ALE		0xb0b1
+			MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B	0xb0b1
+			MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B	0xb000
+			MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B	0xb0b1
+			MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B	0xb0b1
+			MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B	0xb0b1
+			MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0xb0b1
+			MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01	0xb0b1
+			MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02	0xb0b1
+			MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03	0xb0b1
+			MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04	0xb0b1
+			MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05	0xb0b1
+			MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06	0xb0b1
+			MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07	0xb0b1
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi
new file mode 100644
index 000000000000..d7952233a1ee
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-brcm.dtsi
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	reg_sd1_vmmc: regulator-sd1-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&tsc {
+	status = "disabled";
+};
+
+&usdhc1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_32k_clk>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_32k_clk>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_32k_clk>, <&pinctrl_wifi>;
+	keep-power-in-suspend;
+	vmmc-supply = <&reg_sd1_vmmc>;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+	};
+};
+
+&iomuxc {
+	pinctrl_32k_clk: 32k-clk-grp {
+		fsl,pins = <
+			MX6UL_PAD_GPIO1_IO03__OSC32K_32K_OUT	0x03029
+		>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi
new file mode 100644
index 000000000000..d2f116bc8d70
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/ {
+	reg_sd1_vmmc: regulator-sd1-vmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	iw61x_pwrseq: mmc-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		post-power-on-delay-ms = <100>;
+		power-off-delay-us = <10000>;
+		reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
+			      <&gpio5 2 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
+	};
+};
+
+&tsc {
+	status = "disabled";
+};
+
+&uart2 {
+	bluetooth_iw61x: bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
+&usdhc1 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_wifi>;
+	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_wifi>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_wifi>;
+	keep-power-in-suspend;
+	non-removable;
+	vmmc-supply = <&reg_sd1_vmmc>;
+	mmc-pwrseq = <&iw61x_pwrseq>;
+	status = "okay";
+};
-- 
2.47.3
