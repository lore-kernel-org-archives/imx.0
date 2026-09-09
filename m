Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBE656E048
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 15:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788968460; cv=none; b=ljt+ybaWtoRIW4lUSii7gxFo24U08A97oVBbJHiMsGkfLS98J9P0l8H7dRId/vZ4C8adfmjcHoH7UtZSCWCbPvH/3qSneKZFrEixqptl6hmHcQ9EccU76hLcF/w4s48izKJoPNWnCDNXJ2WKEAt6qwzyZlvvR9FaDeZMilyp/ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788968460; c=relaxed/simple;
	bh=WSolhf7YA/xPQUkpCkMMdj9OqWG13/xqVBq3ZFzwV4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oiuxXnyX0WMQr+4sS0TG23dkev4P5qyMny9X591KSmdvT31t7VhXdIQMZNSB+edr9Ln3We1lGCTWqDdu3mnKWjvRBWROmvWB1GTJ+bDtVNp9FdUwqpZulY8MOAKgpmBjavG1nFndTK+RVnpfzhmAuCoNk4nFxTVu2YZqVEIt2vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlRX7ZmS; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlRX7ZmS"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so14056195e9.1
        for <imx@lists.linux.dev>; Wed, 09 Sep 2026 08:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788968455; x=1789573255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/AMO1xY4JP5kH64PX2GgDemefdP3ZI3LO1e7DC60jI=;
        b=dlRX7ZmSQbStbQSFtlGuvrpNqKgkLKvtlqfDlXG8hdRubkaGc5FR3KfkhHLTQ3hBcR
         vKma0ar4nb8y/dfVoyW8cTHBdKN4x24o9xvq10phLXtkS2QryMvFL7HLKp7YonsVDvl7
         Uucg+z9ZuFnm8LsMLXgAuYy675OZymcQHxX6hzYnuDFdeGWrOuKP/UJxv9aVIjvs1Wf0
         9Ok8vS+kr06WooxUSvh6jwCu8/4MCerPANYmgb25U41Bi5p8quKVCn9wL79bLjiC1eh6
         ZGqEkZ9xecJoPB+Etfsp/ZRLju3aogQPBn37KxWoTS/IjhUmgEA7XW/YJLcRarVoAYsq
         MgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968455; x=1789573255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/AMO1xY4JP5kH64PX2GgDemefdP3ZI3LO1e7DC60jI=;
        b=DUdjtX/RENuYwYA9XkoMp87ztH57u6Xr+t8NaTQXtNf/gfphPEoZnyyb2mQJFhlU5B
         ErnfO/mjKLilfEVJOtZ64SYtirqJ7x02ouDt1ZXDjGPJxsP+qM2SMISGqD1AHS9yaUBE
         hSyJPNS+snNL85A1e/BCnCI5TJhMVWdmCpz36A6lqiQhCmNf3tHX56TWFmbDExzIDzyG
         axtEW3OXV5VgdySbO5s18OhQbJzDJTyr5L7RXRC0N7gTZGJ8E4V4s5t9qeQtmVaYJBqE
         4j+r/N8JAYBOfny4ramFcVRqQRhEA4N06+mFZsde7sEiQxtY1RGM0lizKdFXsL18ap42
         o1gA==
X-Forwarded-Encrypted: i=1; AKwUvBxcihPxkRteJC9hpXRLVQ0U1S+1m1eKioO4LBmuqqHQQesnotKoLRLwsui3xUonQ+BgsIU=@lists.linux.dev
X-Gm-Message-State: AFuF++m1c7sgvRa51pUIgnFCYF9S2Gbogy6o3S5nJsrvJah2OduQCCdC
	p1VrQoi9YnLc4hbred7v/3g9MerowcDrOiVuC4P6KC21Hx2p2xJ2KyEZ
X-Gm-Gg: AYBFou0d1OFH7BQRgjqOIJ96QmGsM34tVB2QLM8iuFwCOXeJqFw19oiid1TefX5e25h
	H2XBE0yo18s8QCKkYCG879f5TIAdhlAma04sHr3S9QtOrsokdhrsUcZMpMIxtmv5Iswt1ciakdH
	dfnmwFNi1ooFuk/pdOmo6XnOVgdhMEQ6mpGhvfQUZ+WOhhTu4wV5WtQk/DlM3SJLOa7nXuiqvRm
	TLE+vvgFqXlDlqRrZ/0+ODe2f/P4fQj9Zm4a5pyr09KZ8JIF+I0TEC410xAdNIs85e026B7e5/A
	m9p0hifB3QM2kJyDUZ7/FxHiUPggfR9rJo/VMBZ2VgV5lp6HQbqqZY2AdDaQ9/YPKI5k8Kdsgr1
	6LJB5S6YemLFpDssqqmvILX9tf/WmQpWnqcLnn70CAQ9ur+/oB7P2pJRxymKfzmmr9hr1mPfm8Z
	Lmciik+CiHedofURjwJSdxeTf5TRfl1kVWfvfSdWLaf1hdWR32EZZ+Srg3SRVH/RSMKgxvWoTRB
	ao3pwLhTqe+relWly/TN+6FSQ==
X-Received: by 2002:a05:600c:6216:b0:49c:799a:177b with SMTP id 5b1f17b1804b1-49d1754394emr171816965e9.2.1788968455450;
        Wed, 09 Sep 2026 08:40:55 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm43810943f8f.32.2026.09.09.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:40:55 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	consmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board support
Date: Wed,  9 Sep 2026 08:39:43 -0700
Message-ID: <20260909153943.1048-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
References: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add basic support for NXP's MR-NAVQ95 board. This board is designed for
robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
following hardware feats (list is not exhaustive):

* based on i.MX95 19x19 SoC
* 64GB eMMC
* up to 16GB of LPDDR5 memory
* 1 x USB 2.0 TypeC
* 1 x USB 3.0 TypeC
* 1 x RJ45 port with RTL8211 PHY

The support targets revision B of the board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |   1 +
 arch/arm64/boot/dts/freescale/imx95-navq.dts | 228 +++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-navq.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 984642146dd9..b6dd7040c385 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -947,6 +947,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-clover.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-aquila-dev.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-navq.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596la-mba95xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
new file mode 100644
index 000000000000..ab206fb726b5
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+
+#include "imx95.dtsi"
+
+/ {
+	model = "NXP MR-NAVQ95";
+	compatible = "fsl,imx95-navq", "fsl,imx95";
+
+	aliases {
+		ethernet0 = &enetc_port0;
+		mmc0 = &usdhc1;
+		mmc1 = &usdhc2;
+		serial0 = &lpuart1;
+	};
+
+	chosen {
+		stdout-path = &lpuart1;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* actual size filled in by the bootloader */
+		reg = <0x0 0x80000000 0 0x80000000>;
+	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		bootph-pre-ram;
+		enable-active-high;
+		gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		off-on-delay-us = <12000>;
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		pinctrl-names = "default";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VDD_SD2_3V3";
+	};
+};
+
+&edma1 {
+	/* owned by M7 */
+	status = "reserved";
+};
+
+&edma2 {
+	/* channels 30-63 owned by M7 */
+	dma-channels = <30>;
+};
+
+&enetc_port0 {
+	phy-handle = <&ethphy0>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&pinctrl_enetc0>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	i2c3_gpio_expander_21: gpio-expander@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio4>;
+		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&pinctrl_i2c3_gpio_expander_21>;
+		pinctrl-names = "default";
+	};
+};
+
+&lpuart1 {
+	bootph-pre-ram;
+	pinctrl-0 = <&pinctrl_uart1>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&netc_blk_ctrl {
+	status = "okay";
+};
+
+&netc_emdio {
+	pinctrl-0 = <&pinctrl_emdio>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	ethphy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <1>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <80000>;
+		reset-gpios = <&i2c3_gpio_expander_21 1 GPIO_ACTIVE_LOW>;
+		realtek,clkout-disable;
+	};
+};
+
+&scmi_iomuxc {
+	pinctrl_emdio: emdiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC			0x57e>,
+			   <IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO			0x97e>;
+	};
+
+	pinctrl_enetc0: enetc0grp {
+		fsl,pins = <IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x57e>,
+			   <IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x57e>,
+			   <IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x57e>,
+			   <IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x57e>,
+			   <IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e>,
+			   <IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK		0x58e>,
+			   <IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e>,
+			   <IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK		0x58e>,
+			   <IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e>,
+			   <IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e>,
+			   <IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e>,
+			   <IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e>;
+	};
+
+	pinctrl_i2c3_gpio_expander_21: i2c3gpioexpander21grp {
+		fsl,pins = <IMX95_PAD_ENET2_RD3__GPIO4_IO_BIT27				0x31e>;
+	};
+
+	pinctrl_lpi2c3: lpi2c3grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO28__LPI2C3_SDA				0x40000b9e>,
+			   <IMX95_PAD_GPIO_IO29__LPI2C3_SCL				0x40000b9e>;
+	};
+
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e>;
+	};
+
+	pinctrl_uart1: uart1grp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX			0x31e>,
+			   <IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX			0x31e>;
+	};
+
+	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK				0x15fe>,
+			   <IMX95_PAD_SD1_CMD__USDHC1_CMD				0x13fe>,
+			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x13fe>,
+			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x13fe>,
+			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x13fe>,
+			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x13fe>,
+			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x13fe>,
+			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x13fe>,
+			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x13fe>,
+			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x13fe>,
+			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x15fe>;
+	};
+
+	pinctrl_usdhc1: usdhc1grp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e>,
+			   <IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e>,
+			   <IMX95_PAD_SD1_DATA0__USDHC1_DATA0				0x138e>,
+			   <IMX95_PAD_SD1_DATA1__USDHC1_DATA1				0x138e>,
+			   <IMX95_PAD_SD1_DATA2__USDHC1_DATA2				0x138e>,
+			   <IMX95_PAD_SD1_DATA3__USDHC1_DATA3				0x138e>,
+			   <IMX95_PAD_SD1_DATA4__USDHC1_DATA4				0x138e>,
+			   <IMX95_PAD_SD1_DATA5__USDHC1_DATA5				0x138e>,
+			   <IMX95_PAD_SD1_DATA6__USDHC1_DATA6				0x138e>,
+			   <IMX95_PAD_SD1_DATA7__USDHC1_DATA7				0x138e>,
+			   <IMX95_PAD_SD1_STROBE__USDHC1_STROBE				0x158e>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0				0x31e>;
+	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		bootph-pre-ram;
+		fsl,pins = <IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e>,
+			   <IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e>,
+			   <IMX95_PAD_SD2_DATA0__USDHC2_DATA0				0x138e>,
+			   <IMX95_PAD_SD2_DATA1__USDHC2_DATA1				0x138e>,
+			   <IMX95_PAD_SD2_DATA2__USDHC2_DATA2				0x138e>,
+			   <IMX95_PAD_SD2_DATA3__USDHC2_DATA3				0x138e>,
+			   <IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e>;
+	};
+};
+
+&usdhc1 {
+	bootph-pre-ram;
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc1>;
+	pinctrl-1 = <&pinctrl_usdhc1>;
+	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc1>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+
+	status = "okay";
+};
+
+&usdhc2 {
+	bootph-pre-ram;
+	bus-width = <4>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+
+	status = "okay";
+};
-- 
2.53.0

