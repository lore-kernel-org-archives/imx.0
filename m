Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78C83859EA
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 10:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050784; cv=fail; b=K6IDw8QaOWzbAKoYFNPXtd56Xbm3o/YOTRK+UO4OsjPtWSrUowGx7Zb+vpviKFYUjnvLN91UahYGS8fAAterTV5hw2aDQgQ16i/E2GVFYLiYf+pR2RbmTO2SsnaR2sJdCpYIXk8IbmXj/iFYm/cHEsLt3kK/JhPQCmPsUFhZRC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050784; c=relaxed/simple;
	bh=q+FlOld3eBlFl07YhvSZ3j5DyTIsLiKXRSrpiJum5Jo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MDtVi5A6QoDkApNMd8xUlKxbqVy0sJiF7TiOwJQTG4P9jKMI53tT/nkdq+JYX8w7HqqN+UiqAPayNTesaCc6kskw3qsT2whiEZbGxBZpk3CqGLrjdUAH5hoPz1C3a+iFFy/d62Pz6I74JgFsgxrXmhrgZpEcThUHPS4H/VnfmzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C5rqHkvc; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C5rqHkvc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHEjv25FYJiCWQAt7d/v/OIkHfkL6HvxRsa8q61t5ZirBqkjjEmGYCjL8HhMhaTbpwnYJiOk+kFpMR6yXNd3vXWsO1Znr70qUuFneuaG2xSbMVi10flHpWcw/N+vGY4aY2fjPSQv15lBiVE8u7wm4Dv2B+nksKJV6ew7O+1pvognEMxcqrjYiOHybKhaa974ednCA1QPY4QbF0+O7qiHBhZS+osSD+CspMDfxIaelArzv7OdXhm8vEpz80Ou2eriD8nxFPVv9esegs0r/bDvLTYCkMNG935+eSutpmIutSqEPNWUv9K/P23VtGV6TUJUdXRVGjBCKt4mzBljSQLDlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhlV8Jy5WwMvpOvVuSuduORunfmN0WWEI0zdvau+gNA=;
 b=gZAKjnh4bhOqtRfMfouRLZNGLtwDXhV/PhfiIWAhr9ltjhQbF6RWwUa2tOhtQ2l8eUKdPyYTePkQ2JsnuKkAl9XTXBrOTolatbfeRXfAj5zyWISVnrjKcNoIpDEkKBqB2bumSDJvpPfoUwCx/fojWnKIwuT5D31xELpR93KxHRPPvCXns2vD4ILqk/DPhVIEyAkB/LuxZJL3p++hABrWRxEYULMJVnQVGHZCBu5HjMxOMvuXEg3BTMgUhUD+BRL6fhd7Be2iIIQZHQ9acP5yTac0KBvzewsWI3B5FBGUuEBj8O3S+LpHHWm0g7e59X5ex/5lLN4YDt+Yawetvt+Q5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhlV8Jy5WwMvpOvVuSuduORunfmN0WWEI0zdvau+gNA=;
 b=C5rqHkvcRD+l9GYeTFIu5+CIeDvOlqGOck+bi2WqHR4omF0VSGoakWPMcUZuD7MpfPWDp8F1N0vCMJlmGtHB96XWWPF3LnMOiNGTKDaFH9vrVFhOVz8HwdBeinYlKLY77+pAFfQ9tOYbFf2iaJUx/ZTqviElRrHlhk+YkTCxGW6kcDSaruteXIpmW3XLHPNw8IIAj4q3zm32BzWWK+arhIwzsZHiHX64pq6WavCfblfYFUq4COd9nRayIngw5t/93+tkAScoSTbGt2eFhepVcR+tqu2NRE8f2DQSZ1K79WNy4dem7ortNrfl2TwHXSpdSYFz/5FHYWpS9zhg8iz3Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10970.eurprd04.prod.outlook.com (2603:10a6:150:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 10:06:19 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 10:06:19 +0000
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
Subject: [PATCH v3 2/2] arm64: dts: imx943-evk: add Type-C and USB related nodes
Date: Mon,  9 Mar 2026 18:08:07 +0800
Message-Id: <20260309100807.2844925-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309100807.2844925-1-xu.yang_2@nxp.com>
References: <20260309100807.2844925-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0188.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10970:EE_
X-MS-Office365-Filtering-Correlation-Id: 94700d7f-3d03-4015-2bbf-08de7dc3824d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	Wh1V6B8ZiYSjn/Pbn+9ozDJAsCbrahE6Fnb/aEpJyzZmI/+JhakcrsQZ+sTcgNao512P7g5hTMjUIlluNIs9T6rkwA8NgZQp3XJSWu9iq1E9Wi+EOV4LPiE1JVa3bk3YAvf4vracgbuR1N4T8AlErNsBm18bpqy+anT2ilpnUokCd5ITTayEJqIjzB3wLcjoxpqzpKovQR6q2I1VKDJqF4jlTUgs4G6lKJ2M3iRd/8zIoopdEdsKdS6m4m64nmwks0IipCZnljoEKSRG2FbEl/3u7ogYPu9Vns3+kMk8BpNIUwzOOWCu25/7yxHXe1cRNLUTFUATUXU5zFu8my5mRXjit2CHObi4LaRCvUO5JL/YkVhnFIWNV95QAxh2BvBZA1dWeI8qRVC5nAbrK5AG22bYd1FI2jZScRdHKF1nTlAKzH6NMANgc0Yq5/n2yWLc5aUOJJbXGz1dFu49h6E8L87It5k1mVvny68QlqIgK53pXAspye6lM2e+Wcpe3SyfkB2tSnHw8kSXJmqP1K94kCIFhpX9UX42PPK6AouwAI2zoLgHWlQ36MsxfzeUX6RdHYwidgkkGwg1Fxs2S4oIwxvCsGh2sfefCI+CYvjG5zAAsuEoi57Kj1ggMU0M+lBC0OwyvzyGtLYbRa0me89pGZhIOlxN43b76a3wxkn4TR0Aitcq0Zakj2pnEVju9ic1G4byWH39UsKogRWar2KtCjKUxRG4O+ax6Zjc1MdMd5NC8nT9BVK96TpCYZewzSk7vcUhQlQ9zN92o3WKXrqi+bElbI/yMz9mw8bHgAsfEpo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YjcJ3jTO+TiZG4MMl5oxHpiB93RNW2n32NHeKZ+d/Hpnx2QMUszCr9Vx1ar8?=
 =?us-ascii?Q?lK0l5VhORfyJAQFSDd+LND8EDlb0WqRl1KjJp6uIEFR08eYR/u6zAdvE7oqU?=
 =?us-ascii?Q?poEvDnnDgLRjyH0HdgnGaHJQ9/8XqLTMORXwTviiwfPqEY/NGikDXIKqhdKs?=
 =?us-ascii?Q?sI3gGs6mgvQsF3Ku3TzWP4dchCZzSzLqvg8xDGZWoIo2wqg3a9mMF3u4vI7Q?=
 =?us-ascii?Q?pmnpsW5kBoztOwKXf4kGOMF5Vcch3AgopBzU9f2uJnORztXxGSux+YxQFbu/?=
 =?us-ascii?Q?lnBTr/108SDVV/fVnHZKEm+BPGLLOYUxA9uPLRM+Mq+p+ZhWZCPVXiCgJwdy?=
 =?us-ascii?Q?7PoeRbyuPqej2ViNLpnz9XvHfqq4AabN5YzKb9cISueKDNkPz4Qc3rZg8pMd?=
 =?us-ascii?Q?oA9o9bR+XnxBywWN08BKJ5+9uy3k7ElZR4U1mZg2dqVBmIm3gwMrT0BQCpHs?=
 =?us-ascii?Q?PeiMMXnqmxvE+WxNRO+TNGechKfgkCzRvB57tCtIVWo8zGxMnmDXmHd8CBvb?=
 =?us-ascii?Q?IpiXNlOrw7qlsE4Z2gGvUPBETiH2kG3GKQCrSSWxuy0ztq0G8ww9Hywt9ogP?=
 =?us-ascii?Q?6t7MQm/aRa3xU1D9iLOrf3ny1IjzFqe41vwClBXY6YhIEe0W/kR4C4DVCYd/?=
 =?us-ascii?Q?DlJftGzhrfi3jdOwXdtTEWWVBKQoUIRJJeG202deuIWnclpf0O6Do610wom8?=
 =?us-ascii?Q?HdY4MSYnXugoZgBRl3rAa+ZJADBLhPS6N+A4divroT+tIA4J9IDOSqzhmpox?=
 =?us-ascii?Q?ryzJZiI4awTbNOfjPkwgSmdyUPKyBYAmpErtEK8nxmR7F1PlGZwAcf4E6un1?=
 =?us-ascii?Q?46zT5B0amr4VFk9/VtJIwOQgmMRst4Ylo2MoRjLB4RBUFiIWpbXHjhs/xNz7?=
 =?us-ascii?Q?2x941eCm/xfZXGoc9sloVHDnw03xDoRu8wJNKa4kUZ6de18RqPmg6cGL1Y1H?=
 =?us-ascii?Q?gPLmOx9CpKZwT751qaRi37OU5Nt19mCao4Qrs6wnKHvUyTnZ3qhTCqe83OIw?=
 =?us-ascii?Q?QabYRyLCW7Sd34h9CgCESd84Olxrh0ymQgDSGJXOZriPVxD4dFl7aM9yf+y/?=
 =?us-ascii?Q?7gUK2ekGCMhiPAxkxO7SEEU0k8t8fXRqBpw/Be+gwGM1m+CW0Yd425RtY3yR?=
 =?us-ascii?Q?eW/zgSMUnSk2EVzA3d2Q9A+I953XwZh0t6MXJ4B2HU1W0KoAe5w909X56iWL?=
 =?us-ascii?Q?fviACqME/Og4+mZHjFD3jbLBDZdkiWF2dOmVrytF5hIuXwf/VbtWjjoFJ9N0?=
 =?us-ascii?Q?P6UpBCqaQ6I7uHJ4+735it3FmrIaMRWSCC6R81s3nRXODqFpoGF8ffPmIrOW?=
 =?us-ascii?Q?a1tcTYVGI9bgSm2wxtH0FImrnWvrcE46rJy0KLp0dH/a2+wMpP1psQEKQfqk?=
 =?us-ascii?Q?AUluFKviDKK3o/W+pNPQi23AGSFhdDFnteZ+FJ0X/Cj8SaEMc2PK6Tj4/YKK?=
 =?us-ascii?Q?9uGWt+bfEGy16knNEXyqNN1S89c0d7UdtCWFRBgIcXO+j36PpaIM6tHoVzvi?=
 =?us-ascii?Q?3pYZ1eQGv3ytNNsUF+WoX1bUemRGlpJ9taVHi6VA2w3hMU0TFG/M7FZUyE1R?=
 =?us-ascii?Q?/vfqtbOoKjdCUZ58IBs7goAR/mii3y2s1aKsUde1eBmzTbvYJR+hhYgPW3bd?=
 =?us-ascii?Q?M29ii5VmXMRYPzkWVTA3q/gXNEBvoEd/xP+IGl4sd8MvyQEP0vHDpXEM7C2B?=
 =?us-ascii?Q?k5iXFaKlb6WIRkB5eEdrHQ9PcU23DJCX4OiPiWfxefOpYQkGh7xt/stpp0iZ?=
 =?us-ascii?Q?MiUTKbNh+w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94700d7f-3d03-4015-2bbf-08de7dc3824d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 10:06:19.5233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYjplqSvorsSzWu1mtBXljQn7yTLLvRGLXNHXsPgePN93WiJwA8Gpv9ueP0Gn6ST/io/CJQMJHYowf/IIm9Qwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10970

Add Type-C and USB related nodes. There are two Type-C ports, one is USB2
only and another is USB3.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - improve commit message
 - add missing ptn5150 node
Changes in v3:
 - no changes
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 100 +++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8ceabe3d923..0e2da43f9d62 100644
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
@@ -286,6 +329,14 @@ wm8962: codec@1a {
 				SPKVDD1-supply = <&reg_audio_pwr>;
 				SPKVDD2-supply = <&reg_audio_pwr>;
 			};
+
+			ptn5150: tcpc@3d {
+				compatible = "nxp,ptn5150";
+				reg = <0x3d>;
+				interrupt-parent = <&pcal6408_i2c3_u172>;
+				interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+				status = "disabled";
+			};
 		};
 
 		i2c@5 {
@@ -680,6 +731,12 @@ IMX94_PAD_GPIO_IO47__SAI3_TX_DATA0	0x31e
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
@@ -821,6 +878,49 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
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

