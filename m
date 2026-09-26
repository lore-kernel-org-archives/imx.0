Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056D542AFAA
	for <imx@lists.linux.dev>; Sat, 26 Sep 2026 11:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790420769; cv=none; b=QA006hQk9ZvXxUSz6DzjhHgHOWvKc+yLOKBIXkCx1tqDUHN4Sz4LlqxFP/5Gtptds2nofOJNNJCo6+A87farz0/0GEU6Nt/vsosYBLj1lgFdxt7iOzGxmwlY6kb50PrNUfq8bpD98h6rfGMNRfFhzMNwDs6UaEM88lnWOOS5u5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790420769; c=relaxed/simple;
	bh=aruVQx06i4LkfKwlD46G4CXS/WOtsSq/4ICYAfLWvU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=amDVzLKLUIa/SUdp2u3uYksohQbM6c9OgF4P6Tc8Why/1hippxzuTG0Rx+OHfbz+mjL2dTkFHmSKxPSRObSEvWG883m5fS5EWUq9H8AI00az86HC7GfErLHkggm2eYYPv3scHBZmYMr+Wu98TGqVKTCm4e9KJO45FSqQX7Thv2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWNWXA4F; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWNWXA4F"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so902100f8f.3
        for <imx@lists.linux.dev>; Sat, 26 Sep 2026 04:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790420759; x=1791025559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/bdy8O6UKcoopmYKubXLBN3M33FI6ha6vesfsO/nUpQ=;
        b=CWNWXA4F1W4cQBl/U4UgSN0KIiJHI3PMp+n6xi/ga4ZgO7DqiEwYjdMnHUQEgKr/eC
         XP2Vbt3btjbRkicXJsCS3RQSQ7BW2a8oX/mI91N3gyIMgoitbl9ShBUjKmynEh5cdVki
         i4EdGSrzwKcGN92kG4zFeZU3cIp2MwCOPvEtt8NxnfVVf+t3QYYg7t98pONJ1vMCWiqk
         a7lgGCI7kTgKLOmAw5jTdqqmmOQ83CNu8YB0MS21ZJ8t42zFtVcmou7o3p03B2ZXT9Yj
         F9sOT4NaDKsZxIFWab9dbkizI8C1Aci4Jq59V9wzdaiT1XAf9rW/yk6VgwqIzaciHc1D
         Yb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790420759; x=1791025559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/bdy8O6UKcoopmYKubXLBN3M33FI6ha6vesfsO/nUpQ=;
        b=dysmacV/tUFchyy3Fvh0kv8JZc/sszEZEw30ZWkuan1FMQphJ3x9muPe6DMIC4yJqk
         MG4GzVnRkPogvlfsjEhY+cpoX/h3tK3y7Jm+lDzBvstSYLKKfjXkVCSi8VU+96J17veJ
         CmpRJPoFS4LOCjcSiGEEWFOTE1KEqMz72kl28RLumX2DBAGrIQe5X77owSwPFFMqXIYJ
         /pdwGB7CAR9oYLCDxTJVg79PTZzmcPzknsS9xLKSHFCxNys38gztSa3DCR+uiimfy4BB
         quj2RfDXBW5S884GJuNkgTEud7/qvs+wTLmCLfGxWr5J6Dj+KZiQ2Lklg89v5QdtApYb
         +C1A==
X-Forwarded-Encrypted: i=1; AKwUvByiri85yAX7jt2kcbCH88oV+tqbs6TOBmroYXOZhFoMHzEzxlM0tm9gOnMwwglrA+AaJDo=@lists.linux.dev
X-Gm-Message-State: AFq9FYLL/VcmURV9dBVmaTI9rwHwyW7XIhPE4qENuwRb3pFzDOY+YAVs
	sQLwAzS+SGxrQGNhTGjxyP51uX07gP75G07xZgDy4aoqfK2Le0DGZzOA
X-Gm-Gg: AYBFou12mikWLlbcSGEGhh1zd3tgzq/5UlRtyigLDYUEq2cRA99QImffXbJD9F0FCTm
	ObKbHc8bDZHpPie63HW58QiKh+Y7L+bH/mFaDNbvaPOmF4GhLXu5SMFwF7hwzMGLGtRZcIOKzv/
	6YTo9+O/ce+L6gOr/zCAJsxNTwNxIlixURO4lf8UcsdU5UM88H0uUennwuiEJaoCzh3Kaq3dsTe
	8hFBukYnRDg1BqTP1YLUD9oSZHGWm0JfAgxCvSz+NoVKQPbFDrIOeWd0delHTT7hyhdOh6dnMdl
	iuv+chaKCT1qCFcduTIsE8bppZVWdX33KFqRP4BrYhpc7/tja6jTupEt9Q52TrnpTPn/R3fNR3D
	qB163g8nFHcHJg8hwsVNikrnoKiWCNtxNe+GCeP4KJ7LkuVwb7Saxi2cypRox0hkNUgHNjFrbBs
	9morXj1Pzxp8780I7fCEwdSShvuvmX3mvMmcj6ufK/6Tc99h817580H98nixz5mDpv/ETndW885
	kQprSr5Zw6Y47G3rz9sC/Ekudc5LTbZl0qTCrPIqaDEs9wVEhlGQkwjO32EbO6Tgty52aSMg2tN
	kHLFufyv3Bxa6iTbi9BD8w==
X-Received: by 2002:a05:6000:178c:b0:485:8ee5:5ffa with SMTP id ffacd0b85a97d-48871703b57mr15258937f8f.38.1790420759144;
        Sat, 26 Sep 2026 04:05:59 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f795sm12124664f8f.31.2026.09.26.04.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:05:58 -0700 (PDT)
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
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v2 05/11] ARM: dts: imx6ul: Add Variscite storage and wireless files
Date: Sat, 26 Sep 2026 13:05:33 +0200
Message-ID: <656354d10e3adb6ac84fdc0c6fa2043db7320805.1790413032.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790413032.git.stefano.r@variscite.com>
References: <cover.1790413032.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add reusable DTSI files for eMMC, NAND, Broadcom Wi-Fi and NXP IW61x
options on VAR-SOM-6UL and DART-6UL modules.

Keep the module options independent of the carrier board so each
board DTS can select its assembled storage and wireless devices.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../nxp/imx/imx6ul-imx6ull-var-dart-emmc.dtsi | 32 ++++++++++
 .../nxp/imx/imx6ul-imx6ull-var-dart-nand.dtsi | 63 +++++++++++++++++++
 .../imx6ul-imx6ull-var-dart-wifi-brcm.dtsi    | 42 +++++++++++++
 .../imx6ul-imx6ull-var-dart-wifi-iw61x.dtsi   | 45 +++++++++++++
 .../nxp/imx/imx6ul-imx6ull-var-som-emmc.dtsi  | 32 ++++++++++
 .../nxp/imx/imx6ul-imx6ull-var-som-nand.dtsi  | 63 +++++++++++++++++++
 .../imx/imx6ul-imx6ull-var-som-wifi-brcm.dtsi | 42 +++++++++++++
 .../imx6ul-imx6ull-var-som-wifi-iw61x.dtsi    | 45 +++++++++++++
 8 files changed, 364 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-brcm.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-iw61x.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-brcm.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-iw61x.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-emmc.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-emmc.dtsi
new file mode 100644
index 000000000000..26c8ca8f21a0
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-emmc.dtsi
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-nand.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-nand.dtsi
new file mode 100644
index 000000000000..1522b5d7e092
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-nand.dtsi
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-brcm.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-brcm.dtsi
new file mode 100644
index 000000000000..d7952233a1ee
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-brcm.dtsi
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-iw61x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-iw61x.dtsi
new file mode 100644
index 000000000000..4d47cea982ec
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wifi-iw61x.dtsi
@@ -0,0 +1,45 @@
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
+	#address-cells = <1>;
+	#size-cells = <0>;
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-emmc.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-emmc.dtsi
new file mode 100644
index 000000000000..26c8ca8f21a0
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-emmc.dtsi
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-nand.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-nand.dtsi
new file mode 100644
index 000000000000..1522b5d7e092
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-nand.dtsi
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-brcm.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-brcm.dtsi
new file mode 100644
index 000000000000..d7952233a1ee
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-brcm.dtsi
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
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-iw61x.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-iw61x.dtsi
new file mode 100644
index 000000000000..4d47cea982ec
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-som-wifi-iw61x.dtsi
@@ -0,0 +1,45 @@
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
+	#address-cells = <1>;
+	#size-cells = <0>;
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

