Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62F8331EA5
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 10:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815593; cv=fail; b=OON1JU4qbH5/N/VJjJoXIOfioVdz0V+bIiv80MnLULwlkzX/tpYUrgY61wQq3OanugmVY/VSSG5y5ViKat1voC+TxZIAJ2kljzfrliiH+j+wuA6EYMou7Dy+skqwnAeh69mSjN5ayAauiG5m6N+mwc5DIzSNWBgK7I0da7Pqr98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815593; c=relaxed/simple;
	bh=saWCAcje28a8JhwQkhz8x7qEbhOtRLgt8OLlVZliXzQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HpiMjzWCa+fRkFF6SabnzPWrYe/SJ21mTMw8mEAYaEvZ69c+be51IbXYFIjTIyigcX5BwClQALvcsHb5Syhtsk2yeQG0QizKVreoSLafXKW0a14ISWt8Wo6MAK1tfWGrlAI0b/PJNbxGsH2SstRKBS/wNCeEZOQU1yStpXhrzfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cXFZStm3; arc=fail smtp.client-ip=52.101.69.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cXFZStm3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfsqIqJDFeOpNfzDXyFFK0AhqY0HEdgDB1N/G9DHwvJ6Nu+X6pt8VFLC6/ulFTg9Lv6Ro9jJrGILmZX5KRkO4L5xs6n8JDf7O2/M0aF6B8UtuVPVpDoX9/RVnzR0Ix+hjzhhYr67B4aSfTuy7vbmekgHcomldCjek32L8q4Ml2VWd5UCh3HN/uqPZGiy4emDNQWYQVIQSi8FDkK2651aWeSnG1QHNyJ3RQ143n99UWJmqcvEZz2UnAGBoxjkVHJz2O+BfKCYUNi3cjcC0oziwB9wNfJqV/WwyuAp/jYk+Tb4yhCvPhL3Of8afyXoC+uxp0qQAFcLfoauIVyblLSSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ReYbRrA8z/Xpnctl/lCCA+o4WOvu3TYkF7maSltsGAc=;
 b=UW3D0mNOlW1xt8Zpuf+LhrxcYUQzFQaK3yEygS8xcIBq3X57VdJTfb1wLUl3jnENf8X9QawZqNGxMQwV6ynoa21et8BL5z9yPNLVzcC1O4pr4qXrLunpTqYyMGYcTAHXwMGhdUV6Z3l6yLSi1LMjKzxW5dXhw5YkzqWPgGordFpOO0cSM0HR4YiASROePCztgKptlcVOL58Sq+hN8E1WH6aP6A8G7LANkMw8MemKnNm55C1/YK7IP4hLSVmR7s+kmKPRwK4F02+qeHCw/xOOU5xjFvghijuXjP5ereqQuXb6uiowyRE4A8j47XTTVfoG1MasZ/nSkoQVxCPaKt8HCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ReYbRrA8z/Xpnctl/lCCA+o4WOvu3TYkF7maSltsGAc=;
 b=cXFZStm3I3RwePhZ+9CpTsjXmILOIqVp9LgFSUHXGeXqGUOLZ8y/wvzGghPdMmthk+QBcmj7e/0+5QPSJTe2nEw+ETlGItunkN5K37gWeEeAHsB3Iep2qd+va3CKzJePIim9PI+9TCUCZbRgc9eq96jNkPO8umqAoxpbjxkIE/BeFKs34E+1c4Q46l99ZsLBFWvINyFgt2qZiDgqBlRoFNdKAndDoTnThAWlRWO9qreyw1WeOzZWu9MaV0UT5vRxB2iANW+8aHM5Eoj++L4kivmry+Ss4SJa3K3+09vZI+Zgie4dWaJWtcigtYuw5EcI5Qrx8/tC9EKYq85DNnM1zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 30 Jun
 2026 10:33:08 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:33:07 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
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
Subject: [PATCH v3 1/4] arm64: dts: imx8mp-evk: add typec node
Date: Tue, 30 Jun 2026 18:36:26 +0800
Message-Id: <20260630103629.76604-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0226.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::11) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: 25372edd-1ee3-4f7b-fa5e-08ded692f982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Jsw7qwdWeZGiWChMxZyhecMIRtoxaxKvJ3EE2B5CFPdnPxIM51VQh6MfUiqqFzOc7oht+s8IKJYlt78da4Zks4TzJJ9LxhI83RJNNjL8QPUimZZMfRxVezjwcwlJD+YYR/e6ZpSyNyJNdIvvUU8cp0YtySYYtAcjQ1Vf+efC1LDP099qNdJhtpRRg+ScYUdVz35bTMB6yae3MPtAARVJpcVSmkqY9sSL27UpjKH+ReG8ok6NiEiLQY1ffCujm1qMDVjB/VgrfoXEJ0deyNXXK2r0otSFkjAMOVvWkkCjVR1GEpA2mf7KLTpbXN2xrCIrL/Kz/ExyvvVUs46FbzvjT191AZ8xFySpOdh7c3oVo+Uk23IIKpW6ZkjBidjiJcKRo714Jvg4jTGSVsl3OIbEQURMXX1eJheFk1AFeHjwCQeuFGQMpAae/4mOCti4VOtoS4QqJGKgHWr+o2IB4veCxkIyIK/Sgj+iDT2SE6UORETeMu2k1cUUnawQBpbZMeLBdibBO5pmyNQFsvF+WPUVv866QmSpDTPq0s+pi9bczlRPgMQ4yzCSCw5FaFN6D2CIDy0i1rVzOhRt6SpRUDwO9k1H88qtfdcEpWflmp2/3ZrVtHnbQC1dHq1ApnVS9LXv/xugGrsrgattKxWDY0dqembP0KBq9QYWDM+cnJSBr/E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6IZs3AhE4kuC4Kb7WTsYRHoucs3NNeiDYyKua25MXziy7FQeIFYP4veSX094?=
 =?us-ascii?Q?bBFFiLKY9rPzhuzPbkO8uIjbFkDbvhB2DtL/grfhAkbaEwlAzbTjl73wxYjn?=
 =?us-ascii?Q?mpsRSLfnhB2iVMC2ky5oyKt18opQ+SnrZsW7vhh2ovqMrJc+XPjulWVNC9zl?=
 =?us-ascii?Q?3oTenb6UJBkKzrx59JNJMHjXx0i++fsz4NMWbeJdPJJt9+Ebv5+DO9/+95Sq?=
 =?us-ascii?Q?QvnFAoTsQq2t3ShgceHXFVu8KmUijh+azaFF5WG6+8eofbqctKhFFBAo72cm?=
 =?us-ascii?Q?7dVCfewcsTifYledssZVIzIDxUONeD1HibvNWRMnqLj3FxQEEfFOzHHNF9+J?=
 =?us-ascii?Q?HQuSu9X65vS3y7p7Y93lAzc21iNHPAYwyIBG5nJcUKihjcKM+8XzZ/XimCa4?=
 =?us-ascii?Q?QTeO7LDH6CQYeYZRH8FCHAwM3tHzYRwAiHxXO0smgarlS+mrLWu5x4os/3yb?=
 =?us-ascii?Q?S+r+hgGTC4TJTkBAY8w1PPy9jcnTUT5t7Lb5xvipl75vyF27kuHvy8aAGtDN?=
 =?us-ascii?Q?rdI+WEF7Hz1oDk19CHrjO+PhlekGYiYBGcRwsY7YbGh0PjUKmK7z0sgmM88/?=
 =?us-ascii?Q?TUw5WMlEb0sBX2LvxiiqjIYrZUq/wryF1g0WJG8lUc4zIRqqUlY7D+5VvNEH?=
 =?us-ascii?Q?eI4dZwbVbO+cVqVUtHKjigzJOFPkahXvE1bB7eqn2jucWyLEVPiM02514ew6?=
 =?us-ascii?Q?c6GVg4emaGO72GRihy7fK0hbhNukNh/Zk0Ie2SWIKbs1SGNHgZq9DGRgyNtU?=
 =?us-ascii?Q?L6eYNxyJ1HNY3DHIxG/M38S2XCiMUl0iItcTcp8irCka93KeuRnPFfbeUdKU?=
 =?us-ascii?Q?q/M/HYll6+BpQVYjrK3rnytOmZq3GDnpIjnIbfk3juWt56E5hd+1P/IPNBPz?=
 =?us-ascii?Q?5i+uRaEW9qswaI6lyBT/FhviYwHcOuCN0puD7cNfuN/kt/Hx1Ehajbsye10z?=
 =?us-ascii?Q?tYxR0L0pJMEGFahDnHdRXrZ1nUva6N6wEMIur0wT16++v909Kf7eg55BPcZa?=
 =?us-ascii?Q?5DBtrlFMM8T3ukVLCBzdVgWZeVaG2QjLDf/CBZj+KfBcpt/FsTNdhuCziZc4?=
 =?us-ascii?Q?/301TjxEbqCQG37EJXSgkYhmNRWN7mRoMXxEYejRz9mMuCKbb/Fu9QFLCTF1?=
 =?us-ascii?Q?ycyyGy2ITxSRfwj+VWfzsPmN+e5iHBdVe5fHnKndHuSmO6zwi5VLVb1LgGa3?=
 =?us-ascii?Q?gyW7d8yYdJPCsDnORobshb64v80iiIgqz/pOY90OWZBk3MqoCqOckZe5NNvx?=
 =?us-ascii?Q?KfvHP7508vfs0wsYsZ29aKoKfBZyxO1x5xDk/ZkWSbkOjEFcnLg8KFi1XGZN?=
 =?us-ascii?Q?U5IR1e1t8ri2IHkxS5cFxjvjq2JggEndLvrVL2qVrTW59BZm8ANc8YbCSivq?=
 =?us-ascii?Q?ZvN43T9dp10WMfQgVgeR8jPxHGFJKeHrI6NRnq/QJNhiIfB06TDSds7hqqWu?=
 =?us-ascii?Q?QESAObXZ0HiXOd2hms94styuW+BGXGtCjjTTuur7jfyZl7Zkry9P4frrKTgF?=
 =?us-ascii?Q?SDqKaA8bnxNy5FIHQGxoqNhGggNE1xEtGZZ4ijqJq7fVTHthKw+4Fxitojum?=
 =?us-ascii?Q?Dc/B7oitUPr1FgUfhZXjteWawXqKBZXn8zFF5dZzurqzjigYoz/tTSeIr054?=
 =?us-ascii?Q?DoJBzyjX4eS6L37wnSDAXfnPlVbFLsMKpXAxMwakV+edxpY7nk228r8mLrch?=
 =?us-ascii?Q?rliHZIhu1OczddRVot5cIRg6MLtq89LHcbm7x214tx1ccN6WBZepir60ViTx?=
 =?us-ascii?Q?hwp/uN8IPv5PTZviXj+VZJKmk10ws/DDcYTEleKOj+07Uc/cNjn5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25372edd-1ee3-4f7b-fa5e-08ded692f982
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:33:07.7241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7kPghzpnP1rCMafxmKEuOqME6JPi3qd0f87vVdm7rr+IReorbv08IaiF18cj8o3HlquiRtECOR9oynsX47LcbVaSVjleO33IedNbpKoIKZ0cLbWGoMR3VAlWY9Ipa3q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9089

From: Xu Yang <xu.yang_2@nxp.com>

The first USB port features a Type-C connector with dual data role
and dual power role capabilities. Add the Type-C device node and
enable the corresponding USB controller and phy node.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - remove the patch which switches the node to flattened model
Changes in v2:
 - remove usb3_phy1 tuning property added by mistake
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 69 ++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index a7f3acdc36d1..c8f2ba5426ea 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/phy/phy-imx8-pcie.h>
+#include <dt-bindings/usb/pd.h>
 #include "imx8mp.dtsi"
 
 / {
@@ -636,6 +637,35 @@ adv7535_out: endpoint {
 
 		};
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+		orientation-gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
+
+		usb_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt = <15000000>;
+			self-powered;
+
+			port {
+				typec_con_hs: endpoint {
+					remote-endpoint = <&usb3_data_hs>;
+				};
+			};
+		};
+	};
 };
 
 &i2c3 {
@@ -851,6 +881,38 @@ &uart2 {
 	status = "okay";
 };
 
+&usb3_phy0 {
+	fsl,phy-tx-vref-tune-percent = <122>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-comp-dis-tune-percent = <115>;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <33>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
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
 &usb3_phy1 {
 	status = "okay";
 };
@@ -1179,6 +1241,13 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19	0x1c4
+			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20	0x16
+		>;
+	};
+
 	pinctrl_usb1_vbus: usb1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x10
-- 
2.34.1

