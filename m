Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010029.outbound.protection.outlook.com [52.101.69.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403622DCF4C
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538065; cv=fail; b=l198jEeGLEhs/RSB93L+n9xK2+D+/NEiJhWe1tUcM6SW9m5mQiTlCFbA5FrtOjHsRbo3SzK7EV9m5E2ci0LxCRFKsuro+lANuRyT8uL8YKY8Fve01Atg9+SG9OLDQCbLqHG+JXBpwlW6qPmJd6o84zkMDJxdMIIOE+f8hYtDT+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538065; c=relaxed/simple;
	bh=sdKglb3N2upiV2gNd7XPl9b1TsblbSmH5Cfs7HKj6fE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hfI+bR2q0N3hsXiiRb/qcjYLQamwxx0xYcsOB4nH5+Ly7CCcIj+z3L0AGke9ICWGWEdQNGDweBOxwpUpUhLFiOOTen8lx6sqrTKnaNvVOrG3RdRJXLDR8KfVf2pf1nzC9rA74QUZpZJr+U0SiDkZcoZ2FaxZLAddgyN8tl20IHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pRU2CKHy; arc=fail smtp.client-ip=52.101.69.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pRU2CKHy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lx/7S0hFDNqheGSYZo2/BVzWaCv5fj8XMyGMaCv4XX6ucnlQMttXPT0Qr9QIy7Yf2nXrkWEFendjfmX00GX8iw5BKsD+NlgcMrryzvstbwSuT0jZdlPf3YWxqdndFvguwz/rDx/mtyYstj1QMs6Xb6P6GQ8SW0E1MBq0bOsf/p03z+G0rkHz1SmBNUbFoK1u+WnzGmzYOR3PESsM6z/B/WvTNcu5g/EH5Z0vrI/N8drAdFw3DrtQtacFRgT/CwlBai2JLcJPs3hNg40P19e1AhmNDbZpt465L6PqtlHCuZcgpG1JtXnWKZz2oBF/6OY+zi9ed7eB459S4OIumzlfEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsgWzV1Prb15sosHdyTTyYpinGoXeytwLEOUqqIMFlk=;
 b=cW3gc90/qTaqCChrGphB2ZpJsoygXSAjzF1iZFlFGhlb66ViY18N4XQbMpqQBDz8cZPNGtcX68OZKt3abaCCb3Rg4rmT7L3FqTwhG+a4LbR71X5xu57fduySjGLAh8yXleB63eceh5OvXVQBKDEgONDDeBm5yqh8hUucc5MUC5r/Nwyh9phjefmJ6FBRsfH+4XI4CzBwM6B9HF787qLrQauCk6WqX8UEZqqtG868Yo3ld1Bny85GLFdOwDVdhoO4vt5kE9kqadPqhRq9Ux3bOcrLe5LLI/oOJS4/MjXKUToQISw/5RtSB0m9hcl9+Cy6zrvqftlyhSQU8J7V6IBKIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsgWzV1Prb15sosHdyTTyYpinGoXeytwLEOUqqIMFlk=;
 b=pRU2CKHy9z+TGJGlhxgJr6hxdEucQ1r5gARCps35vwKg47hKOG0tg4F1mdoL7nWEVAoquIlclTPrQccBeBgE7pokwAb+0kKHEnvbLGpue1ER7K4kO9vSWTQI8x0FnM4nIiAuFJmw41B1NyP5YIOUYhP0YWNIlXg5GY0YBhsTN5+LmCXBOv7gSd7qQ0BAOnXK/T3Fh4MpUIZWNMskAa8QCZ6tYH83Dj1eRlLZmFYpZ39EEP8Fk29bNzqPjLMpVTVgrO/RVYABYjPW7G9/H0HzfXyW/x5N0bzNq/aDhEXDKhLRNvE0E/9/cCu4+Irykeg00ByrT3i8pGW0ogMPo55+6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VE1PR04MB7360.eurprd04.prod.outlook.com
 (2603:10a6:800:1a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:21:01 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:21:01 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/17] arm64: dts: imx93-11x11-evk: Add MQS1 pinmux, clocks and mark conflicting devices
Date: Mon, 24 Aug 2026 11:20:08 +0900
Message-ID: <20260824022020.2812810-6-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0084.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VE1PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 39da1ded-746b-4b5d-f1b6-08df01865764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|23010399003|10067099003|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zr72VcvD5kMexeUPJdKlNckH1Oubn5k+6LuqOWCUFVc2hnfaoKe/RWOEAlp/FvnOx/6u3vKgyw1Y33cB1TpPVKlfxNdFC/YWaO16zbxAQVRbUuaKvu317cjReEUm5WaCmGAIEbdR1p5ySn8PF5wW+9YiouUfCGFxtWebT7r5iONJbk7xt6IMGaACei8CDX9jrc7+VoEvfn25M3jSevDe/hDhOfOW7SRl4vn8+xaW5claz21ZyKM/B1up1MCQ3C8XeLhiruhXO9m+oiSLaSZ43DmSZYiVb5RZUdoGv1/kQa1ZidBZJH7Yakavr/eMhxB2uRSOxqBvPDTd/TfEBNPF+nUDhfH23tyoFF4B5hy5f5g9rlJ1JaYBTiK5LMtEw1eHEYSPe0wfL05S2hTRv2lkHhAPrvCeewim+MtdC9X7dMFg/vs2rGA3AHFLxKUG9uG0KM6s7sgCTi145CZHZk+QPdDo1Hl2AKqXTVEY8vysocaYh3Bqv9qfBLGle4V+kYKQ3d2ips13CsrTMT8mhU8+Kce/F83C1c9ldL2vsKRu8s+6ebtbIJnlW41wrS31CABxjTa/ejYgZdpPAAfez8LVdMot4OO9v1YkYGTXTVIOxLklcYhUMjjuPIgCXZ60uIsk+R0JiN1YeQxTJVGUxfwnpS3i42aHYjuak4TIqnwQADM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?utxgAMEDP8kFankZfpXpR+tJLh/EhiR5HUFbeK6CyxbB3RSUBCheiAzACxv8?=
 =?us-ascii?Q?C55bnb7LWEsamG8LqudkOUQV1jgXnKaObm6agO+h5ivDgUGwhElXFJv255o3?=
 =?us-ascii?Q?XCasHGjf2fttiaXBYTgxksTft7yHAvpDDBvd2HrC75fj0HbTV+zQtgvl6HRH?=
 =?us-ascii?Q?H0AEbrGjqemhHLVq3WBmldRvC+sCnBy6j9W64TDtBFZAdPtJ4+7KrPW4WEyC?=
 =?us-ascii?Q?Z4TfmApW/nGqRLgkgpQZHlH6borHryYT8HEar6VPHbhISO7TQgIe6T4up91M?=
 =?us-ascii?Q?RHeqsro9wc1ntutW6sDKbkUJJEf4InGgkGwPiVsK3dD8eoyMP5yG72zC2ITt?=
 =?us-ascii?Q?c/MIoW3uN19qrUwvp6SUON9w8mmDzUn6un4NrZghQ3IxWn0lehMwBW32E1+D?=
 =?us-ascii?Q?T6ByABRNq2KEe/BMSTPCcIyQ2hiUGyq8qfEdnIhO8AleIj0CSvRi/Qx/mvpq?=
 =?us-ascii?Q?2mEqqWUl6X6LtjshPEnN0e/S6A63sUC7x44PpzAHLB5r5+M2ZsshmAS5Cbro?=
 =?us-ascii?Q?GgZ3dRaoTCJB67HRBjJyxegRU4PvQ2p+lUjHViOxNzsQC9FqdVRYAIOxibIZ?=
 =?us-ascii?Q?zQb9eRXh9CMuB3e/Rpta/qWPHDloZZOV9tTK84sXAJ+Z3ICI/6ACvGs07meG?=
 =?us-ascii?Q?3dFNfODuAxn8tn9Oha9O+4RAwvLc0adSVYDJ057ibTWd6uGm1zDi9/rizrDh?=
 =?us-ascii?Q?h9RneIGz6fjgxy74yD5QKZQhXZkEr+17Oye6IrxRwaDUcn9o48yol/JfbRRe?=
 =?us-ascii?Q?KyAnaNp3lQnLHJwkeVEtTgggu1jAuXRrM0xcuvE5TkKssIxfHuqPmY3jOTHo?=
 =?us-ascii?Q?d284ex3D8kMjLOL+9DOHbE1x11hkkU+z947zfvwnWhgQV9ZvAInu5F2XHAE0?=
 =?us-ascii?Q?35mjbPnWnhFBsdPs4yJrtGS1CSpfjlQrzmHAzFzek7TyK2ppAIN7xr+1DzPp?=
 =?us-ascii?Q?V9EDi7rN0Dr6FxTZC2m1ZTdIF9mngduwPjlUZVRY4BBDa36dXaVvepYYLZzG?=
 =?us-ascii?Q?zoGKTTJfinHwbTFlWvIRr143Iu5mJ/sxUvsPwh9uOmPdiwQG2hcZQb01Ctdz?=
 =?us-ascii?Q?Nk2l+Rx8DHonqd94RXziJ3/mjYU7nZ7kyfoZYy6wFpe0bObOD5Vl16OW7gbC?=
 =?us-ascii?Q?d49ymdzoPtY83d7jpDp4ajCFdh4gTrNicuB8RAw8n7+m+ZKG1/HsuptkY4Rr?=
 =?us-ascii?Q?JY9hHSQSEQXbiC3j98QYXdVZWDwwoIujB34BqK2pqcVW4A9Bjoy5WQrGqd+4?=
 =?us-ascii?Q?r8xN7EhV3muSNJo2alyXP7uU92QPhG0qm21oe+iIev/bN7k5HAlsTs8dRe/R?=
 =?us-ascii?Q?2+BAza0UW0VwR1zuAxpRcJRVF8zTmQf0NfvcE7ZcaXSadRFQ3dcmMc/rd7c8?=
 =?us-ascii?Q?NVkLZwIsbTGMdoxYv6M9MfbywNxhhQ/dO4osMdevZ8+0kH6W4e+uEgs/8Yph?=
 =?us-ascii?Q?5JHAoXrAWjKQbaAKX8O94vviNyERVlqxlvcsuYQlxW6hccSLWuLK5iJu/RBE?=
 =?us-ascii?Q?PeTrp2+VlarQCIf9rBA85k5UZigDF8YR2POoepgyf+EsRFrHZLlfV+gBZrp4?=
 =?us-ascii?Q?M/+LR15bWEUfXQfe2IZmv0DwoNpMYXQvIytvXTjhQcpue3fHeVCkefNunc0C?=
 =?us-ascii?Q?ukVaofkrqFa+RChDhNZRhWyeFPEmzd5/am8XmQImG+BNfiFnqfjpg+ZLihws?=
 =?us-ascii?Q?BYpL72ow98B0bg9YvZL4U++/O0VLBmnDav0tnxmrPQ0GpbtXZFGr5eFGtKWJ?=
 =?us-ascii?Q?1J0AVb/Gym4FCtb4PkpSFcAWaJe4NUewuxqD9QlbzJUAOw122CiH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39da1ded-746b-4b5d-f1b6-08df01865764
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:21:01.4626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDma1K9BJJG6CyGrDi1so2bALclDhbv7WJ7GtCEdEdE3oEXgCDClwC6lf+eeM1kualV4MUrNkOHxpv2TlIAZvmr+15KrOPc16lHuOrqdai5uT5jefy7aW0OEbGgTP+ih
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with PDM and its sound card conflicts with the BT SCO
card. Add the MQS1 pinctrl group and label the conflicting device and
card so the shared imx9-mqs overlay can disable them. The overlay and
its Makefile rule are added in a later patch.

Update SAI1 clock assignments to provide the MQS MCLK source. Also
describe the MQS output amplifier using the simple-audio-amplifier.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 4418fc6a0901..d3312093f996 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -16,6 +16,12 @@ aliases {
 		mmc2 = &usdhc3;
 	};
 
+	amp_mqs1: audio-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "MQS AMP";
+		VCC-supply = <&reg_3p3v>;
+	};
+
 	pdm_mqs1_mux: mux-controller-0 {
 		compatible = "gpio-mux";
 		#mux-control-cells = <0>;
@@ -35,6 +41,13 @@ pdm_fun: pdm-grp {
 		};
 	};
 
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "+V3.3_SW";
+	};
+
 	reg_m2_pwr: regulator-m2-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "M.2-power";
@@ -71,7 +84,7 @@ bt_sco_codec: bt-sco-codec {
 		#sound-dai-cells = <1>;
 	};
 
-	sound-bt-sco {
+	mqs1_conflict_card: sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
 		simple-audio-card,format = "dsp_a";
@@ -105,7 +118,7 @@ cpu {
 	};
 };
 
-&micfil {
+mqs1_conflict_dev: &micfil {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	pinctrl-1 = <&pinctrl_pdm_sleep>;
@@ -115,6 +128,11 @@ &micfil {
 	status = "okay";
 };
 
+&mqs1 {
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_fun>;
+	pinctrl-names = "default";
+};
+
 &pcal6524 {
 	m2-pcm-level-shifter-hog {
 		gpio-hog;
@@ -127,6 +145,10 @@ &sai1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_sai1>;
 	pinctrl-1 = <&pinctrl_sai1_sleep>;
+	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
 	assigned-clocks = <&clk IMX93_CLK_SAI1>;
 	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
 	assigned-clock-rates = <12288000>;
@@ -150,6 +172,13 @@ &usdhc3 {
 };
 
 &iomuxc {
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__MQS1_LEFT			0x31e
+			MX93_PAD_PDM_BIT_STREAM0__MQS1_RIGHT		0x31e
+		>;
+	};
+
 	pinctrl_pdm: pdmgrp {
 		fsl,pins = <
 			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
-- 
2.50.1

