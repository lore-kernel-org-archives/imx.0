Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12B847A86A
	for <imx@lists.linux.dev>; Fri, 25 Sep 2026 14:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345017; cv=none; b=X/POS4sJchm7tMD/nqokVXlLyOqJ2ojzLe+8lBIGbVin7mtT+pc3rqlQ8cwrc4SDGCVKC2v6E5qppX5c9+w+nG3IqIrSJ+Ehm0PeCjCnoN5YxCFlGYRoizcLp7ycrQaACPYEYbwtqVQ70iOkBNq2XJIL5dRGKdQnko10V799/vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345017; c=relaxed/simple;
	bh=A+S8zM70++2CyTh5w44EgNHlA4fthPXMOminnTCsz0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qt9JT19hFRm1sL62hroKwVfesdDfHdH+SvEoYVmzmxRCoIeKOkWPWJ9ZPL8vka6+oHJiNR+UE0Dw/+5TwHuKHZ4ClW6qS+uVauz1t8cf7JGG/3g6ARayk+VaZPHi/0mTPI0DqHbtcSXeq2SAmd2yaigxhYNg8saDMWJxTzqNRIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRTM/nVL; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRTM/nVL"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48877902c99so781232f8f.2
        for <imx@lists.linux.dev>; Fri, 25 Sep 2026 07:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790345012; x=1790949812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZHL25+9BtzIxeyN3O079v7dWv7/2sidG/Nr5MSNkz30=;
        b=jRTM/nVLvNK7i0vR2bhT4UQ4feFjVLvYRYAk/h4+jwio5+Uej6+ZKCStcqSTeBlmyZ
         z/5WGUADZrCDHMcGfcM2BJ8J3401ySPCkVd5ZREBAUqVaNsvixC4Fwmjx+lNn50E7HDv
         DRO1uzSusJXiDza8Mi5sXpz5ylrtHsfXhc3vmOMoufwiA4hV0JBqhrnXU3tvElrY0fyB
         vPmVcMnHo974fkK4o+5MPfvjTmEmYzR1KdhY2/0dV0Y6/cr6ZuXnY1R9SaPZcxqb+MjP
         ixC9gHp6PWlsSRgfUUP7YuOi4JWExuQSLvrclHRxaFwAQ9n65yfkYk3a7gqwi0Lbzmnj
         N/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345012; x=1790949812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZHL25+9BtzIxeyN3O079v7dWv7/2sidG/Nr5MSNkz30=;
        b=tz9wnSkPS/ojFsxoSGxIpOIzbsS3nA1YcSc2WvPDH3nME0HEaLbBm4PbrymDhYeAj5
         Ga0u3C4QN9s66m3murjcIUHoUBuzSGQ2drE6RmG18UZNWAcpVcJsQLjanNIRJqCC7ufB
         pGQm/ldiGpphrTjh/BxbLtwMZC8pvcvvP4oOIb7K1j6RsOub3cxrtmtnpm16K0XKSp6e
         lyqRJuZehouS+XZ8w18WdBqN8XsLxA7o09fF2LC7mWIxbmT2urXFv5/7kWp1e+KegcO4
         1reKCdalyfdERbLm4f1E350dpt+7k1S2hYhWX9c53VWBPt2KgRJiSyxU5gzY1+RV+ddu
         iOgw==
X-Forwarded-Encrypted: i=1; AKwUvBwpY2txB3X0PWjtoVYlFlAmt5aQBvMtxAQTWbIe8ls+MlFC44ClYA+9+WRQ/fTfCcKi/Pk=@lists.linux.dev
X-Gm-Message-State: AFuF++mCMIDqjxjTkb2a+WrQAfBQQwlgo2jE70X5BNoTIDPUx94ne0Bp
	I3orAu6WHWZXJeY7B4BP9s8he7MiwOakQvE1Xw8eIy2Q6nCY5NV7lnXV
X-Gm-Gg: AYBFou3i6v7sQnI/hveFVzqDkMkjUBL5sPVzxmAxyBg5wYS8lkaoWvlo1MZTlqoMBUA
	2g1UaOKYJWcpAtQkZEVVH+Y/BxjFI/9M+74/cxG3GoVUnf3x7/IrMt+9OnuX/OMbAimjMENhrEt
	TYKI7nfYLpyYfIkbGgsAs/TGzHLGNNFpUCx3OH284qdwjBX32v4TZDuDmleCjFSTPMf4dtoQRTr
	FYbdxV/0lR6f4iFy+MFaLBuGIyab3kI5e23pCEP6BVgBFd56dRgLWB4LpD9NAGUYNUzpKq7hQ/D
	BxODtydnqcM76eZjejzRczk+DJaF0FhCvkXnztQ2MiFxsnC5ChDHLpdwYAbi7rt62m30DhE5Hgg
	+BtpI1wgA1uycDAqlMlS8JAhA/iQceVqodZITc+CZfDzOoa04EM8PKPW0Y83ez/x0nFW20bOZNc
	maoL7g5y6pZR0npRTxSz4rSudttYbbBdJRRRvM8AgnggWpI0Cksjv224IOGcnLgLfnDRR5u9Ej8
	hlcAMlXtVl/tSMqDhzO4EjpmSd/CX23OlE2jnDwCT1gT+ZOHE/3eZzMOr2SKFiZhoDvy2IPFowz
	sW4EZKtilr2nFg1Q2kEUHg==
X-Received: by 2002:a05:6000:178d:b0:488:8192:c765 with SMTP id ffacd0b85a97d-4888192c938mr3117134f8f.18.1790345012149;
        Fri, 25 Sep 2026 07:03:32 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355c65sm7522431f8f.19.2026.09.25.07.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:03:31 -0700 (PDT)
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
Subject: [PATCH v1 05/11] ARM: dts: imx6ul: Add Variscite storage and wireless files
Date: Fri, 25 Sep 2026 16:02:22 +0200
Message-ID: <778be59a32afc9054147fc40143b502d49d37ffb.1790344389.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790344389.git.stefano.r@variscite.com>
References: <cover.1790344389.git.stefano.r@variscite.com>
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

