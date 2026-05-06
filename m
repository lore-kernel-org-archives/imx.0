Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013063.outbound.protection.outlook.com [52.101.72.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D72307494
	for <imx@lists.linux.dev>; Wed,  6 May 2026 05:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778046691; cv=fail; b=Ky23fcwdevLsmrxHhmEy85JfcOFI8aaBPbRVNPAEQ/qa/xQLphuMs4Cd3+T1iyj9kk/h6LRKPWAgZkHKVUAUmMObI5QLEo++adVpA2WEQZcWxaidh5rfh/qCs3xQEBF2kXtNb9DSbEdQPbdagKIGqjU102UUo4zWatP+dHK+6IE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778046691; c=relaxed/simple;
	bh=oYSW5g6BJYkBRNMADKWaCxP7KGC8tddHCMrSmtOAHF4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sDWZAgH5PGFRd/Y49qtbOkkgX31byfBSgTHpbHQBG+7qluvF4A0Uz2dXlK+GpG+c+cjkqjr2GfdEDgFjOQiR59hYpbqaS4oR/MURdRYmDIWX5fGfjvPFYpf8Fqg4txNXK6te3ZZuEeJYyBRQgpLCtl3OAIi2e2fSQvj/7WpLWds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=a1fsYE9C; arc=fail smtp.client-ip=52.101.72.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="a1fsYE9C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azOFfVNt1oKExhqXSP4ntDpUCdFGBQrm+2Z0Q8Agvy7+WTnRS+Fd7ZQfIPD/78chM1h7Ps+jcMjIkKuF+QAfGILjant+G8ylxfrxCju7+fbBE2rHgttpbZ7pvzCR4iSYLq8UfI5fqpENupT1Lsvbjt18XtpTCQcI+ze8QMcapuhzR+QAl35HWQuEanxgjrF02rhGuemhNzzhD3O2agKDT6QU25FhOWAUIbq+HtOiTbG/xNG/DDdQ0wRhFAzTyfJE/xz2dMFlJHWrvtfdE3kLF3rXASuWLxAvQ3cjaqIKLgCjSITUK5EInvl+DumXDGILqazl79wpKDLwSP+PKxYmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GA1qf1CCTdfe1ZdILgeKfgHreVn4j03YSCrJ15VLWYU=;
 b=h56uTPgQMuplTk1jFI50Th+tclJY/JUMwEoT/LwrstVuiOy9/Bw6T7eoE54dOMkEYgeXVKMlD97LtWYsCyTIyXtrxGZkHDVvUoeb2jI0PHM6kq4hj1UArWiQXDgIjnPTixnXUqQz7+hSeXKOL50/O2gy9XQmHO2wNimNhvjctWstDVqwvUwwnl2WlL8fQ0JkAyfpdNiLoMi3Qb2hQ6Ui0sf1Z2SXtLy1yFLId+qIOM4SwkqKT/KpZoyevwwL7S1PKDiDY3s1qVR1gpFCzZuy5y7DxBC0LezEHRcos6ZjQbU36UCD8q9OyamSOYCdAaO+PGp7PR1gZYQgqXDgwmbdjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GA1qf1CCTdfe1ZdILgeKfgHreVn4j03YSCrJ15VLWYU=;
 b=a1fsYE9CcnGgnPI0+tefTxKVJCca/Yyu2qEfHpCob14/FIBwg8OtI/qS3VmF+i7JqEg3p2tut6JEUSNFfDdBYu+i5ogBr1iJYj6zDu2XJwfrlxEoDYSx4RAFVhW6Kn9EdZqbKa92/NeMonoHzsp/yJAU8rGN6LPM74G+wEVRmMZWXN0t4EkY70clyiTliam8famqrIJziSijLemX33goOetrgyXrdgUhQkltjUGpD0eZSndyYMuqlyXxi6gtkNsjZ2hNRqV7xAJ6mK26UC7igB3B5KlxMORKuw5KDj562SSB7B/KKXvaHfHMXkeJz5kGL2DQyUa6iJepU8qDV3bxJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14) by DBBPR04MB7834.eurprd04.prod.outlook.com
 (2603:10a6:10:1ee::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 6 May
 2026 05:51:26 +0000
Received: from GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe]) by GV2PR04MB12019.eurprd04.prod.outlook.com
 ([fe80::ed75:bac1:2554:5cbe%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 05:51:26 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v9 3/3] arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1] support
Date: Wed,  6 May 2026 13:53:16 +0800
Message-Id: <20260506055316.2798693-4-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260506055316.2798693-1-hongxing.zhu@nxp.com>
References: <20260506055316.2798693-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0085.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::19) To GV2PR04MB12019.eurprd04.prod.outlook.com
 (2603:10a6:150:30c::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12019:EE_|DBBPR04MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 69c17aa6-3a29-4cbc-8a1d-08deab33832d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|19092799006|7416014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Np31VUOQG3unf2UqyAn3UfhqTMRJvsaK4rQHth/DlH6jSaXiWTK/QjtCz2G3VFkMFkJBW+RiIXpwlbGGmy/H5FQxEkBiUrgOumCYrP0R9I1yodLXLkfwARKPf6LC874w//RRHl2dlepJkA6OLReOremw5F/fzkcCKgAKPR9wVg8sQRGv5EMi8n45FCINPaBTY08RZbIfBklX/KHD1jmQVWtrW0fjci7CnU0swi9MnPyH3sG7o8JDGlAjO4xmk+lUgimbW+ZcnYJ7JQ08Mj6ZngP9lymXPFVJgFRiDWVhCzU642rEKRK+nWUkCJNPG7NTyAqiH1Mqf8CMRKfS6CHHj8DP7deVweDTxhLB2yqkZgaebh14h5aEztFSjG1rGvgt85GGyubCTpG6pTZZKs/FX1lx9l4f7cs4JTXhxhizs3vZ9e63bYU7nmXQW8XP2VDdS5e9Jo7hwCv8lBmaEhwZRrkO8LfIgf812tH6+8nMcKuLXy3pYAZWyXxL+7Jxk2uxSNtUahfJAhreJ4tpVu1RtLx0TlXioG43DOp3U8QpgRIKL3FR1k/lgk8kzxngWnfV3VYK3e+4i2IT2tfNiisWeLR6IxNfKbmyf5Mjq5RbM7GwFhA9xg0vDTNsk46vfqWavpgmzYqiopuiHU9yJnkyfbsjtkLnbmKKuIhrto26glJpw6YALELOPouFQY9Zh8FvQUgAhZZmoChNuZHHHBccsefScUL/19TaiIUtzo4H+0oRTW4sgpqqGgNeV6RQQnlP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12019.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(19092799006)(7416014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fzDGuxVnnmLbSQUiJUyOhjuaQXmFWchr/+5muRNhOh8iADWosGzbEDGiSw8L?=
 =?us-ascii?Q?+jQKBUnrohgrjKfA10DVOFspwqX6pZ7EwWTOLuXtFC7eNd7R8pVXzG+npQHi?=
 =?us-ascii?Q?EXgRYeek5xwYBInCey8k/grL/ym1CPAL/4hshavStGVOSJ6fWDSC53o+Us+L?=
 =?us-ascii?Q?WmmzwgLr3Jb5Oj6UtQ8oscyhNq1A3a+IHbHLjQIIMRvbJi9MNcpHda42p91v?=
 =?us-ascii?Q?VXbldm/0eeEWV9M5zNJ1q2Fub6jEjDa3kPt7sz8cI+jqZPq8+gD0AagDQMfQ?=
 =?us-ascii?Q?No3tDKioV9kzv5iL1tTFbqgbdH9RDCJiq+xQOmnFbwVkpumpBzcf8NL7nm8H?=
 =?us-ascii?Q?zRYddJ/6zSvKke9GDIE3exAFQkB5bdljrBDOb0Bc8xFby9CyvWfweE7mGT2M?=
 =?us-ascii?Q?mI1D+6LYvxLEaQNXdE7bb45wP/MLumc+la7WHTtGIB2BgkOxOVQHjdPhJrxM?=
 =?us-ascii?Q?He43uj3uL2sz4KFSHotOh9fschYDIArYiRiBFJE+BgCZ8o7hSkKBarayf3F5?=
 =?us-ascii?Q?V8SHv9Sp//XzpJRXJYQGdFiTFbTC2LUq2apsjf/FGxJ9QkgDwOt2BNKRlfNY?=
 =?us-ascii?Q?R+P3Pb8gEKkEGagNe6wgC0ejh+tEpLm5kbqQxX9wxCX6L228R0N/5tqKssbj?=
 =?us-ascii?Q?FWBuuEpDibVSFEdqbaXY9rJJa83nnZM0J94SpoePzMgQ9qJKIGyxwWRCA09/?=
 =?us-ascii?Q?kdPfJNrG+9wjbZZQ38b5G1ygTZcxAdJeGSafzvwm50uKuP9qwMYT7JvCUgFf?=
 =?us-ascii?Q?qBy/Vk7psmDCXTGN8Vm0N+Vf3mMTMTiAPp5tLHq+6Ax5PcBNuqh0qlCgbAzQ?=
 =?us-ascii?Q?upz46D/D6s5I+hGo2+L2nyiw0zTqd16R0/ZBMwcGnyxrU7P/T3HP0qkZw8cq?=
 =?us-ascii?Q?yGwjIR2HhzJ/Dp0oOkrnuX9xaX2/Qd+a9nSumcsTzSNI/dpYJnRkPDfFehoc?=
 =?us-ascii?Q?QAskzs6zBp7fhos7ceYZ+m/kNqZIXNj+v9PuioUyrkGYc2fSzZjxpQPtOfuq?=
 =?us-ascii?Q?y+96yu4WQ45Gu86uYeXOpydtTH++Mqon/PjMlAwC/7xm4moK3iARYy0zKjTS?=
 =?us-ascii?Q?XMWqevX0cFDTd6mcY7Nh3WVV7XSnW2RjkIjbdOSABTrDNXuVWULmayuRvify?=
 =?us-ascii?Q?yUlXR1bLrrz2SvPwruDhCrHKfpZGHjt/g8Kd8HFEn+7h92LSA4r6Z6Vvrfk2?=
 =?us-ascii?Q?GjPeCaZpUPRaz+dQD7Zh93MEMTxsrox08125B4tee1LHP+RHl/YK/KXVA/qw?=
 =?us-ascii?Q?/BV6sLs/h0DVJufJybL3xhxfYz8lcWwAT8mtfUpyRWYF9v1WROJuPBaRdg0n?=
 =?us-ascii?Q?xrdCGmQMjjhcmPuJ6NlETLFVoj5dJfu2LleGJWNW8bG6f+fHs5egZuqycxN+?=
 =?us-ascii?Q?AxQ/upIC2kB3v/ODs0rmfoR7ZKyikT+bCNlcRLdZHnLFS87U7hxSRG9dW0ur?=
 =?us-ascii?Q?L5vwRXXbTjBVO1l6EPaf2xRE+sUZjzCA4jt2Exksnhn9lCs2SlqHo05Fm++O?=
 =?us-ascii?Q?ddlToKf8A5VoyFQ+o3d27QDHFgBOVBT3oZmHKo6lpnsY+xH/NJ0KjK0yZvgM?=
 =?us-ascii?Q?gtDrtKbyu+4FiYRj6r0dz8R+TMPgB+3TmOYTqehCaPHJ7y1VTdVw56Ue1lnv?=
 =?us-ascii?Q?F9gH0XvdniIL4UTEHsl0olUPCtn7+De3SSYCkueTl1Ph71x8s4DXgocvsu6w?=
 =?us-ascii?Q?Wez3ZGFfpDq1FgAAvBs1muZEbet8uwOicKKBYQPpx3u+y7BYYAu88BgYvEsf?=
 =?us-ascii?Q?TKr6hwTmHg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c17aa6-3a29-4cbc-8a1d-08deab33832d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12019.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 05:51:26.6605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kPbpBqXfVa84EV2e0N8QbKyhoonk+b6/RVuKxEKnT2vbDMICJrR+vNL397Sf3bTYF5P6O9UgJM8PB9hQ8BikA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7834

Add pcie[0,1] and pcie-ep[0,1] support.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile       |  4 +
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 83 ++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 711e36cc2c990..c41fd70e667d3 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -520,6 +520,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 
+imx943-evk-pcie0-ep-dtbs += imx943-evk.dtb imx-pcie0-ep.dtbo
+imx943-evk-pcie1-ep-dtbs += imx943-evk.dtb imx-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx943-evk-pcie0-ep.dtb imx943-evk-pcie1-ep.dtb
+
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 52f7ef7dbf272..fe4fc512d95d4 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -58,6 +58,20 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	pcie_ref_clk: clock-pcie-ref {
+		compatible = "gpio-gate-clock";
+		clocks = <&xtal25m>;
+		#clock-cells = <0>;
+		enable-gpios = <&pca9670_i2c3 7 GPIO_ACTIVE_LOW>;
+	};
+
+	xtal25m: clock-xtal25m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <25000000>;
+		clock-output-names = "xtal_25MHz";
+	};
+
 	dmic: dmic {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -79,6 +93,15 @@ reg_m2_pwr: regulator-m2-pwr {
 		startup-delay-us = <5000>;
 	};
 
+	reg_slot_pwr: regulator-slot-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIe slot-power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6416_i2c3_u46 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_m2_wlan: regulator-wlan {
 		compatible = "regulator-fixed";
 		regulator-name = "WLAN_EN";
@@ -725,6 +748,18 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
 		>;
 	};
 
+	pinctrl_pcie0: pcie0grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO20__PCIE1_CLKREQ_B	0x4000031e
+		>;
+	};
+
+	pinctrl_pcie1: pcie1grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO23__PCIE2_CLKREQ_B	0x4000031e
+		>;
+	};
+
 	pinctrl_pdm: pdmgrp {
 		fsl,pins = <
 			IMX94_PAD_PDM_CLK__PDM_CLK			0x31e
@@ -988,6 +1023,54 @@ pf5302_crit: trip1 {
 	};
 };
 
+&pcie0 {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	clocks = <&scmi_clk IMX94_CLK_HSIO>,
+		 <&scmi_clk IMX94_CLK_HSIOPLL>,
+		 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+		 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
+		 <&hsio_blk_ctl 0>,
+		 <&pcie_ref_clk>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
+		      "ref", "extref";
+	reset-gpio = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
+	vpcie3v3aux-supply = <&reg_m2_wlan>;
+	supports-clkreq;
+	status = "okay";
+};
+
+&pcie0_ep {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_m2_wlan>;
+	status = "disabled";
+};
+
+&pcie1 {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+	clocks = <&scmi_clk IMX94_CLK_HSIO>,
+		 <&scmi_clk IMX94_CLK_HSIOPLL>,
+		 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
+		 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
+		 <&hsio_blk_ctl 0>,
+		 <&pcie_ref_clk>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
+		      "ref", "extref";
+	reset-gpio = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
+	vpcie3v3aux-supply = <&reg_slot_pwr>;
+	supports-clkreq;
+	status = "okay";
+};
+
+&pcie1_ep {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_slot_pwr>;
+	status = "disabled";
+};
+
 &usb2 {
 	dr_mode = "otg";
 	disable-over-current;
-- 
2.37.1

