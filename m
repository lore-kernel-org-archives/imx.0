Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76D53358BE
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697227; cv=fail; b=rQ1MyU8ewFBqmqw5FQmXtbz3DjErZF9NK1LNLVKIvjOrHeMYN8lo9KgDiGIexAHPigaGhNKbCe39lxs/EQ8EOpfYcns0fbk5DtMUIx/UUgtov1KBNjpiqkOxSlJ++PVdarsjTnYzuBRrYBYJO7F4HY7PIq63ez5kg1uC7j1D1DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697227; c=relaxed/simple;
	bh=XTLllUwVYbR6uI2XybN92DVuHM5tKNXsPog4OnK4Ycc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IjpALrC03k1Vw9tthOgHXyOeptLHahanTFFlyzevBCJneXVxFzihtMMdZuuMRp9u5gIKNqzm0UYaFHBsh1XghZrvlfhL6HQGFlRs4dA016GzCkusEwh6JlWfZhrWNyfNVoSlu81I6pR6YDGwRAFL/3nUTiuh6oZYuRm4o1Eb5bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LEmOM1Av; arc=fail smtp.client-ip=52.101.72.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LEmOM1Av"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/QbXu6P6Tm8wDgEN5vmtvSBcsmmbUkZ8SErsiTCX4SlMx5rOL3A4AHPBO1p45D8kyTK9S3YJIXhSx4jM1Wn8cWoWVHSWxk8cOjXGHI8q4dvEKdl2j3LQRFpCwiM4iyHlHBPV4wi4sXAiwc0LEN/D+dPrrpaGMUqxsCL99/vZfSKN/UZgt0P8V12S71EjRFTsLiSeC2jYqavQvYDncaCjh6qTeK96fL+TdQV1Jn1wO+AK6aaANrurfSWJiakpKoAvTYWo8VJZ7EDs0L0vXg6kTD6doKN1k16XYohK0ZrXpwdpgFj1QDMh8bx7+/868l66/1qCo99St4/kHiLApUWpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWeVa272rkrBX9jREN4cp6LrP7Bhgd+4irtCTFfgGVE=;
 b=UpAYM2i5QEOH7vnd0hM3thubHkXPunEbDVyAWP+cCUPYUr/m/05KhSkKRhl876k0YRuTYbHtCiLwQqqlc2xX9jACaAzHnjVdEHv0FQAmpmw8ncFNqNrLyRKeqqH/cQ19qwjU++sMgy5FXA8/7fTD1UqgzNQqwUUQwFbZopdQVOEE3+akKdzxM0gPKErn+N+c8O41UpP4NoFQNKZaLUM4JrnP8ehKEGqYq/SEbRPhCXARxQ5eQHBQw9OYjWOHetc7J/L7XOkAChscrarGrvwsH/Eyp+eYtoxqdaAR/cALhIh/TEe5aukj4pGtWU955Z9NzN91a4ytN1scFuW3dkIMYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oWeVa272rkrBX9jREN4cp6LrP7Bhgd+4irtCTFfgGVE=;
 b=LEmOM1Aviwfx0PGuWkidImVG3V361qxyY4Qi5rRuN3SmZYqy4MxIKOg0KBHEtn+WwtDghZQAevWkom8JHIKV2MHqf8o13Iq0KSEPefm5ESLrydY8ZadOH2ab+mf6zdlso7mMqWVM0iEDQC3gxl5ArGqiU4bkbLbzObwMdDl47XYWG7o/Nt4kbp9caGJseo9cjL7YQ2F7viADJN2aejQGIWiL+3z43QgEgpFueGoEBxeTxwQWrhZZZb5hx/hbfSWJ3N44dt++eDq20tfCJJC8cKXMXddgrW5yt9Ycft23Sj7WOiT8jU6LeQIZqkv4/brrhAtbvtDBKYg0XtVLXBuD4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by FRWPR04MB11101.eurprd04.prod.outlook.com (2603:10a6:d10:171::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 07:53:42 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 07:53:42 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH 2/2] arm64: dts: imx943-evk: add Type-C node and enable USB node
Date: Thu,  5 Mar 2026 15:55:27 +0800
Message-Id: <20260305075527.1116943-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260305075527.1116943-1-xu.yang_2@nxp.com>
References: <20260305075527.1116943-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::17) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|FRWPR04MB11101:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f6d6b3-dc98-46ee-bf1d-08de7a8c51bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|7416014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	+zUOAZ6+iR3X/pUDxi37A6ooJylCRWveGPc20IidWqHpxkkxsic3iKqyywKwN7BWEYzW/OWRnPp2faK/iYxAckBTMQ0R5Nw2Yc4k7EsDHjgm/bIESG99FR1m1QTj53wr14023I7vQ98TMw44iTUSFVoYPT+dPFm9dZZuSpn7X0NOu0yX9FGq0lg7P7gZtIiNeWWnM9sqNUZsALeu4uQdcYS2uNJBTRuzx+wfVynlY5ONf9/1JptzlInL9pCI+wvBX8fspTGU6prRUKV33CpGbC+YjoA16Eo0TqmDjSNWEhrgP8lFjAA58qLCNsFq6b9OKhhhFzTm1jcj7Z/AP9QgCZJZlNPvlyZuDQOvjZ7XTCRyzmPh4RgHWBWEwlazmo9Nm90x6raQ4jH6dNsjfI/ss5nQeOETWXxjP4AjvgXJVhsZpP0/j24DJon2SLgTXfYG0qwvokoX7tSiFFnLhQ08QLIss3pA2w7ON9bTdqworO1TLQQnYqTaiUcsK4hsHe51ZQCCW0eWS4O3IqzK5z26e/m0R7NAUQVRarRCApuUaFgND0KTNuZx6kYuVmqYfi99BkbZR+Q4o6c/hi1zYmMvu2ZdS2eIlsCfSGIvgijgX73Zuk9sxEUhZcnkooTUqFzFWr0Buy1KIxu/zlXVRYldTMJuPEd2rP6heZYYUPCICGXBx4eIMatE0CK7iilnL3sVBNH8e7YbLYyeIpEjO6nAiO7a2GIJjxskF9OJ9ThYVZSQdcT9fQSNoBs6ij6jQQHKBNwpAQkbRq+MkZEZZf2d1ViRkG1H+XKiQ5brqcYcd9E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(7416014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aSTbOEOucTvrXR5kpj98pAVkeFVvm4vajsYfEDMcxbtG6AShpQketNMmFvUC?=
 =?us-ascii?Q?nYacKMRklhAeoX25RF5Bb8OQMpZDuCUxg052z/lPLa1EzRp8aSSZthEGQOqU?=
 =?us-ascii?Q?eSa6SJJXuPe7MotzgLHHFf1IBvNDLe9Ii/wlrXdpikFR2vT/Q9cq+IPc0U9c?=
 =?us-ascii?Q?9gX/PDm+gaItsm3fHj7ssYPm9R6xsj76bJvpeZ458x36Uoobgco3qaNKHWgE?=
 =?us-ascii?Q?POheqrMqvaR/hyveVzMQqr0tPe5vaN8AT4EoWOLcOEw6oFz33c3Z3dcUkfjD?=
 =?us-ascii?Q?KH5H8vt7TO5KLxlXpdsRAkCwGB3ZiOu6QImC2L8CSq28PQGf94D+MjcYcKh6?=
 =?us-ascii?Q?NvLHOcxrI0BnbR/v+RY2c60WiP048lYUKaq9w0Dn/3c8ubM5Y2d/QwCMCnp5?=
 =?us-ascii?Q?QQ003qpKHyI9Sj4Jpzbvs51rZ8fyPAmIhh6zrZ8myFiTo1Lo70gMnGMm4Z/5?=
 =?us-ascii?Q?dJNevhSHrKnadyiGY7Vd/l27pYrqMolHGPnVuMmOlo2BW/PgGgCt/gu1XxFM?=
 =?us-ascii?Q?Za4tXvYPWgv033GcBTalqLgAAQ0WJnRO7ltZ7/sXj0ZwyC4CnHkn/3jd5T8C?=
 =?us-ascii?Q?Qv2Xg+rsyCtJ4pqvzxZDO8XAZZ8czGMjcOUvuomfUcTPKH7Qo2+s0Bj/14iE?=
 =?us-ascii?Q?8wHmqVfa4UotKk10M8qkOHn2MCLzZYVUOo3FWNaQ+AQJiTkgVsrIOhBmM5xg?=
 =?us-ascii?Q?rZiq1elP3qJ/r+CLwT+mk/d50vapPTbfNhBwE692fIHbBgCIq/ME0eY7pHSd?=
 =?us-ascii?Q?s1TfEmx53cCCcCws2KrpkMmXyf0SRsNJh5EH5sK57rV5+lhTgCJ+MrNaaXjP?=
 =?us-ascii?Q?m0AMuITPpKc9UAC2ZEW1Ukg+hYwaTtf1IH5ZOXUa4jFC+R9G3j1PJuymj0Fx?=
 =?us-ascii?Q?kzmPa9tgRjvlM4m0y5AL55jER7zm53i/GjaN1obDffsz23TIgyu6Ipfl0RZl?=
 =?us-ascii?Q?ZWHcPlioRZE9lgsOu2cZQe4dU6R4LQQWEGoEAbiKCAsyxtLUihVBPwiY9iJS?=
 =?us-ascii?Q?O+lcksnKa62nMCDj73mmSBdzB8IHye4cmWQeN5d4Vwff/yp70ZeDeCzx28CQ?=
 =?us-ascii?Q?cEDxXC77GtLjgM+J3Ti3PZMov2yoErMrQ1ABAbM47YpcSuCZ5IKTjVj3UYfT?=
 =?us-ascii?Q?MBjt5M61Q3+By+MRmBEhoiyJPiGtWHWlT+lUqDNudQ4qFN6w/yrCCjnstzNP?=
 =?us-ascii?Q?yGYWgQ2UcW0pQr6Tl2wcgupjPWQWBnVU5qNJHYgiOYt8S62rDqndRlJM7tIo?=
 =?us-ascii?Q?G8n7kVou9rAOUxNQ4pHjWcaCQ9fECMqlE7YuniCavdAu6+RUS9s8D7K5qWBt?=
 =?us-ascii?Q?E09avOf7zxOAy8nN6+sBcVJGSqswxnYO+VavQb6RrexPZIyNGM7StNzL7UaZ?=
 =?us-ascii?Q?qmc/poPLFi6k9x8XLCGhlwTIpnOsbMzzH82hDiuQxKAmIYK3v1DF2Db0/czN?=
 =?us-ascii?Q?NjUbP40agh+VLC01TU8tZEBmOMaPsYPjNnO9YG9yawIuGKkMEU2V1mBr0Q8r?=
 =?us-ascii?Q?IJJptzhmaeJq7DVnPwCTHujFIl22dWfD41VkcmuZxhEkqKYF9VKHvZVDOvG5?=
 =?us-ascii?Q?7/dLGBnWOfILOa2XZVopeugyopHDPtwts17jsfr161pboaqyVJClZdM7M3pk?=
 =?us-ascii?Q?CefWyGWtbr81rIiOpvHA8Z6damDOoAeI+fB7/EoVzA/ZknBSAiRvBGKTASxZ?=
 =?us-ascii?Q?91JOWqaEtDx5xXuwYy56WE1BR8rOJtA0cpdt/4zXQ1oRr36lsJHf/rdXiLzm?=
 =?us-ascii?Q?zId0Qw3Akg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f6d6b3-dc98-46ee-bf1d-08de7a8c51bc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 07:53:42.3191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQP5YGQAKUYTWBegJx3RGTLOSbdG6EYc8f8jGYzO///Vbcnnhy1NPJ0G6IireqCew80TwlKJREWcgunAsXpWew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11101

This board has 2 Type-C port, one has USB2 capability and another one
has USB3 capability. This will add Type-C node and enable USB nodes.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 92 ++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8ceabe3d923..fd67cc8e919b 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "imx943.dtsi"
+#include <dt-bindings/usb/pd.h>
 
 / {
 	compatible = "fsl,imx943-evk", "fsl,imx94";
@@ -230,6 +231,48 @@ pca9670_i2c3: gpio@23 {
 		gpio-controller;
 	};
 
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupt-parent = <&gpio3>;
+		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+
+		typec_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec_con_hs: endpoint {
+						remote-endpoint = <&usb3_data_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec_con_ss: endpoint {
+						remote-endpoint = <&usb3_data_ss>;
+					};
+				};
+			};
+		};
+	};
+
 	pca9548_i2c3: i2c-mux@77 {
 		compatible = "nxp,pca9548";
 		reg = <0x77>;
@@ -680,6 +723,12 @@ IMX94_PAD_GPIO_IO47__SAI3_TX_DATA0	0x31e
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO44__GPIO3_IO12		0x30e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			IMX94_PAD_UART1_TXD__LPUART1_TX		0x31e
@@ -821,6 +870,49 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
 	};
 };
 
+&usb2 {
+	dr_mode = "otg";
+	disable-over-current;
+	adp-disable;
+	hnp-disable;
+	srp-disable;
+	samsung,picophy-dc-vol-level-adjust = <10>;
+	status = "okay";
+};
+
+&usb3 {
+	dr_mode = "otg";
+	adp-disable;
+	hnp-disable;
+	srp-disable;
+	usb-role-switch;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+
+	port {
+		usb3_data_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
+&usb3_phy {
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <100>;
+	orientation-switch;
+	status = "okay";
+
+	port {
+		usb3_data_ss: endpoint {
+			remote-endpoint = <&typec_con_ss>;
+		};
+	};
+};
+
 &usdhc1 {
 	pinctrl-0 = <&pinctrl_usdhc1>;
 	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
-- 
2.34.1

