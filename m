Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021130.outbound.protection.outlook.com [52.101.65.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82D41A9F97
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 12:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383535; cv=fail; b=pv1rSBKjXL4+SOjaM+LNl0w8X97dze29zm0VjPBlaNQcs2NPGMfrxp1bcu0LdedbrlQ5WnatOQIH9vVKC2+BqL+VacsokLKV/jsO1dnGe0ABRyVC4m4Xy971CXk+iMrnAmZCIPaI823r/jPQJ+YHSl10THQc1iSMwE9e5mmO/9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383535; c=relaxed/simple;
	bh=++VRDaKoYxZKIJ2LtR2cdCO3ZSvGnJA36v8W5wsg6LE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=miIXEwQLu/zTylYpYmVy5epfOFIBOleS5gf6peURuovXlqxwUuQukUb0qWei2ry5HoKd5DAly2urtrtb+JMBIVnITr/7XS+SPZQQaH8mAfXXHqkKUsy64SmQA9vZEVIrm+zRFtAHjsh558XpVLu/9hyqfYDckIHboCYan6yWZZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=OyLpptOX; arc=fail smtp.client-ip=52.101.65.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="OyLpptOX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSEGsY19wHLgsirlGduFFwrI6Eyl9z2xvTHsgtxCyW4HqDDi3Z8ZJaHqdNuGlBhmHZKrRktntoUvpiiS3Kp4sRMd+HmK+AaazFFcKHX1TQ3etLkIoV7zhxOGtDSzDYBsuVDi5hd065id8aT42pvPJLgXq9Ph1uP5RuQmFjXRLmZQpXIod3s6OjSvDBMG1TbTbnxsA4Cl/0Yx0e8g0tdfC1cwRo6iH8tylhgmBwusrVen5aXPhzIJ1CxIAmT1uW5tB7Kw3Ls46GMBjZgvbvQmjG5J6xFJU5YJ8ffkO78DNAAlbfcTkvKYMiJ+jIS6O4Q2qThI3SWszCS0waYVKVrQEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaAmxrRzEp4qfDn12QiOBYLssJHAG7Z/rbKUTiRH9yI=;
 b=OSTybAOpkd2mtsCdI7YfVI5fDxgxzsw+a7410XPD6VAnAIYic6U6OqB7khVBiove7heiqkMz6MuhY5yRr3JNjU9JODaLT9n6enD2WajdH7GY99SJYS7ENzWwghr9HqQnv4n2CZJYPh/TxP8GRHbOm+UfjB70pL3EznmYNEDjMZ5tQZjBqsjeG4D7QNVpCNIG12il+PkDfjTJND3C6lYKBqmKr4fwnHRazMnzGyIBbo0OTyP+0L9EqVSj0Dk/iXN1a59mj2HyJ52UzRTQbBsllqWmz9RHyjtYUfHf/C4eKav7LytuEwY2pD0pL8QSBWBRgpdiq63zoSwZU/hui3ggrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaAmxrRzEp4qfDn12QiOBYLssJHAG7Z/rbKUTiRH9yI=;
 b=OyLpptOXDUmoOf8WZxLCcjeffUluJRwxHK4lsaipID8KkpxR7eN39u9EBhajKkYaRScqxalOE040TV0GcizaaLDnlJO5IMO8okNOUcIkR9upjB49yEK8xjs6CWdKadBlegj/VGAxp/UiiG+Tq4DyyCsxFDjfx6Qw4YoxtExN9lO8LUq3FuEOUVvJj8PAYg+2bffiIYMfY3I2k7fvRtE3Ubk3SeoYhZJEUomwlG5FV9Gj7Wus3YGkWrboirdsf48s6MrZVqnXO38Ll+ga/CzJnzZLDMNdQO0IgXEiGNVNEuiHtI7zSyHbN22ssxhDBNDG2cfWqjf4PJcUWowfCjHTIg==
Received: from DU6P191CA0052.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::12)
 by AMBP195MB3197.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:6f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Mon, 17 Nov
 2025 12:45:27 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:53e:cafe::b9) by DU6P191CA0052.outlook.office365.com
 (2603:10a6:10:53e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 12:45:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 12:45:27 +0000
Received: from llp-varakala.phytec.de (172.25.39.183) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 17 Nov
 2025 13:45:26 +0100
From: Yashwanth Varakala <y.varakala@phytec.de>
To: <shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, <peng.fan@nxp.com>, <y.varakala@phytec.de>
Subject: [PATCH v2 2/2] arm64: dts: imx8mp libra: add peb-av-10 expansion board overlay
Date: Mon, 17 Nov 2025 13:45:15 +0100
Message-ID: <20251117124515.26675-3-y.varakala@phytec.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117124515.26675-1-y.varakala@phytec.de>
References: <20251117124515.26675-1-y.varakala@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0A:EE_|AMBP195MB3197:EE_
X-MS-Office365-Filtering-Correlation-Id: a153c4dc-105e-4fc3-e191-08de25d72f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m0Wi++3ZD+iXBoorAz+YwwXXqvyqenJKxx3sOXB8WOemp/IkvhRD0ckcllrN?=
 =?us-ascii?Q?gAnYcXFf32ZiBAcAfLPL1JeAVB3Euqjk0NykS+ye0KqDUCr/IVyjPHlfzzXP?=
 =?us-ascii?Q?GshkPYbUgNgcNOyXt/LfK7zpJLies3YNC06OYXEFS/83ld63Bu/womWrHVjh?=
 =?us-ascii?Q?uUIe3ilAS+r4v6/T08XvUqosUGouKRIh0/qrpMf6dpCUokumRdwRoZyczx2s?=
 =?us-ascii?Q?qa3asnrqppsmAoGxNWChj+v0nd8o5E3UT7/6hH7TZReoV23pn+gZj530biPH?=
 =?us-ascii?Q?H6HMt0h3XzZzk0kT+6YFbB0WMLC57nlAm8kPgsOvC3Nt9TRqsF7weSEj1Eep?=
 =?us-ascii?Q?MRA7kmQtLK41zEf2MmYr9ALn0dEkfhQ282CVewCmgrh4j5+/kYpEPpc0+Est?=
 =?us-ascii?Q?v3N4TS9Rre5O9m0GTAEO8lH+x7ydBvafJIth03wNGwAfCA08Q2dTtNXJuKWA?=
 =?us-ascii?Q?I4YkzgIcDKAnBsUZenXMiTaxr+8pDfMKSJi7yIrLxRATpZf3RAXDo8Du7ro8?=
 =?us-ascii?Q?4z59hoENEAd1vN5SFcywch9nqShbRdg2et+bsNfbxdfVXxa31ppN/TWihz6b?=
 =?us-ascii?Q?4qDyknYuAOvQf3X0ON69BhenY566mR9S/W3wLARs4gW+zSnG/PdiHoUrjb7g?=
 =?us-ascii?Q?XqZY5R4Y0VNhkR7SKPTzE3VUU9bkvIAsRkDkLMW2T6C/IpHBIftn53vVEqXF?=
 =?us-ascii?Q?PSH4h2IAe72WSbKToIuTDSpqvPVC5TglUbW6c9uR8zGsfqosNc6vA7jhHXuU?=
 =?us-ascii?Q?SqHQx2nAn6wOmNROm+676Klx7WWmV11l3/GzFsxRmotPVJs3iR8QWf8a1PlR?=
 =?us-ascii?Q?qoaaC0B6WYktCHo857CxsEaEHoE4QEbmRmc07WOY5FBic3Z/s4AJYp0M4dNl?=
 =?us-ascii?Q?Oo4SU7nNcDKf8h44MOlkVM12zArZsrPkz+qdaDKh3XB6AidTQ6GQvCeBM/mn?=
 =?us-ascii?Q?14Xux0f4RCBh/zQnsbgUyzL8Qksew1oC9wlY1EpjFT9onlVyy+L2ZDMvKZfw?=
 =?us-ascii?Q?LTL6uqgWYs87NmVYDHpuxzVF8DLTXcp15B8kpkG1De1QEjmA1Xtlk8Hok0uH?=
 =?us-ascii?Q?dX2PxtlLU350Qq+hn4PpTI5WH0lXFU0GAzZiD2AJVvuvBanXpf72JTsVbAbO?=
 =?us-ascii?Q?VTaAwyoNvucrYF1e0Vq8tZbNM0s5Rm41xPIfCzlm+f8nkPrfazPv0QS3LN6P?=
 =?us-ascii?Q?fOwb1Odei/uPpcwDNLZb69FchPUVUm48toBmjmYiQ+pG+cVmJk5M17pIVW/3?=
 =?us-ascii?Q?7W+c3YOnquzJQ9m7Jjcn6erab29l3Eytgo1XxWkoTiLC7uV/nGoRpJT9MsIj?=
 =?us-ascii?Q?mfskda/3QX5OR8CpCwUUEjNx4+r6Zl1zt1N5tkfjRco3gBZjSa859zrmgk87?=
 =?us-ascii?Q?B3hTzYHfmsU9IsUr4RlxX1dkKx/ThyjzQZ2LKtiPbhlijdKRRofLx+vuXuD9?=
 =?us-ascii?Q?d4/PavNJLUTV3KajJJksroJDsEXh7do5lJL+cNyWNnwQ6VYNmwK99P0cCwy9?=
 =?us-ascii?Q?wvA4ed+f8PcJfpcMT/jcoygRGkro8khLOv2RKfIshjbjJtPslks/vGdvSWCK?=
 =?us-ascii?Q?rrrgggtvzJa+F2eSkss=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:45:27.7348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a153c4dc-105e-4fc3-e191-08de25d72f7c
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP195MB3197

Add an overlay of expansion board (PEB-AV-10) that supports multimedia
interfaces, 3.5mm headphone jack, a USB-A port and LVDS, backlight
connectors can be connected to the imx8mp libra. Audio works when no
display is connected to expansion board.

A separate overlay for Powertip display, based on peb-av-10.dtsi and
intended for use with PEB-AV-10 expansion board, will be added
later as display support is not yet available.

Signed-off-by: Yashwanth Varakala <y.varakala@phytec.de>
---
Changes in v2:
 - Change codec node name to audio-codec in peb-av-10.dtsi

 arch/arm64/boot/dts/freescale/Makefile        |   3 +
 .../imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi | 196 ++++++++++++++++++
 .../imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso |   9 +
 3 files changed, 208 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index eb38dcc76b84..0d2bd8d1d3b6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -223,8 +223,11 @@ imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra-dtbs += imx8mp-libra-rdk-fpsc.dtb \
 	imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtbo
 imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01-dtbs += imx8mp-libra-rdk-fpsc.dtb \
 	imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtbo
+imx8mp-libra-rdk-fpsc-lvds-peb-av-10-dtbs += imx8mp-libra-rdk-fpsc.dtb \
+	imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-navqp.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-enc-carrier-board.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi
new file mode 100644
index 000000000000..57bbbdd734e7
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/imx8mp-clock.h>
+#include "imx8mp-pinfunc.h"
+
+&{/} {
+
+	backlight_lvds1: backlight-lvds1 {
+		compatible = "pwm-backlight";
+		pinctrl-0 = <&pinctrl_lvds1>;
+		pinctrl-names = "default";
+		power-supply = <&reg_vcc_12v>;
+		status = "disabled";
+	};
+
+	panel_lvds1: panel-lvds1 {
+		backlight = <&backlight_lvds1>;
+		power-supply = <&reg_vdd_3v3>;
+		status = "disabled";
+
+		port {
+			panel1_in: endpoint {
+				remote-endpoint = <&ldb_lvds_ch1>;
+			};
+		};
+	};
+
+	reg_vcc_12v: regulator-12v {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <12000000>;
+		regulator-min-microvolt = <12000000>;
+		regulator-name = "VCC_12V";
+	};
+
+	reg_vcc_1v8_audio: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <1800000>;
+		regulator-min-microvolt = <1800000>;
+		regulator-name = "VCC_1V8_Audio";
+	};
+
+	reg_vcc_3v3_analog: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "VCC_3V3_Analog";
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "snd-peb-av-10";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&dailink_master>;
+		simple-audio-card,frame-master = <&dailink_master>;
+		simple-audio-card,mclk-fs = <32>;
+		simple-audio-card,widgets =
+			"Line", "Line In",
+			"Speaker", "Speaker",
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack";
+		simple-audio-card,routing =
+			"Speaker", "SPOP",
+			"Speaker", "SPOM",
+			"Headphone Jack", "HPLOUT",
+			"Headphone Jack", "HPROUT",
+			"LINE1L", "Line In",
+			"LINE1R", "Line In",
+			"MIC3R", "Microphone Jack",
+			"Microphone Jack", "Mic Bias";
+
+		simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+
+		dailink_master: simple-audio-card,cpu {
+			sound-dai = <&sai5>;
+		};
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_i2c5>;
+	pinctrl-1 = <&pinctrl_i2c5_gpio>;
+	pinctrl-names = "default", "gpio";
+	scl-gpios = <&gpio3 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	codec: audio-codec@18 {
+		compatible = "ti,tlv320aic3007";
+		reg = <0x18>;
+		pinctrl-0 = <&pinctrl_tlv320>;
+		pinctrl-names = "default";
+		#sound-dai-cells = <0>;
+		ai3x-gpio-func = <0xd 0x0>;
+		ai3x-micbias-vg = <2>;
+		AVDD-supply = <&reg_vcc_3v3_analog>;
+		DRVDD-supply = <&reg_vcc_3v3_analog>;
+		DVDD-supply = <&reg_vcc_1v8_audio>;
+		IOVDD-supply = <&reg_vdd_3v3>;
+	};
+
+	eeprom@57 {
+		compatible = "atmel,24c32";
+		reg = <0x57>;
+		pagesize = <32>;
+		vcc-supply = <&reg_vdd_3v3>;
+	};
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel1_in>;
+};
+
+&pwm2 {
+	pinctrl-0 = <&pinctrl_pwm2>;
+	pinctrl-names = "default";
+};
+
+&sai5 {
+	pinctrl-0 = <&pinctrl_sai5>;
+	pinctrl-names = "default";
+	assigned-clocks = <&clk IMX8MP_CLK_SAI5>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <12288000>;
+	clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_CLK_DUMMY>,
+		 <&clk IMX8MP_AUDIO_PLL1_OUT>,
+		 <&clk IMX8MP_AUDIO_PLL2_OUT>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k",
+		      "pll11k";
+	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
+	fsl,sai-synchronous-rx;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_i2c5: i2c5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXD0__I2C5_SCL	0x400001c2
+			MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA		0x400001c2
+		>;
+	};
+
+	pinctrl_i2c5_gpio: i2c5gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI5_RXD0__GPIO3_IO21	0x1e2
+			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04	0x1e2
+		>;
+	};
+
+	pinctrl_lvds1: lvds1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28	0x12
+		>;
+	};
+
+	pinctrl_pwm2: pwm2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO09__PWM2_OUT	0x12
+		>;
+	};
+
+	pinctrl_sai5: sai5grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI5_TX_DATA00 0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI5_RX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI5_MCLK__AUDIOMIX_SAI5_MCLK	0xd6
+			MX8MP_IOMUXC_SAI5_RXD1__AUDIOMIX_SAI5_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI5_RXD2__AUDIOMIX_SAI5_TX_BCLK	0xd6
+		>;
+	};
+
+	pinctrl_tlv320: tlv320grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29	0x16
+		>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso
new file mode 100644
index 000000000000..803a199dffa3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright (C) 2025 PHYTEC Messtechnik GmbH
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi"
--
2.34.1

