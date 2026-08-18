Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2D9399340
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022206; cv=fail; b=hlQ5SJT9vjYhxp0xTP/iFPrG8x54vpFyg5yJWy9n3Nhro7RJA+Ds6PllC3+yi5s7los/ceBMCUQQRiHMKZ1PHUh5HhZZ2RDk1H+CLisrbNybvGgMSiiDU8OjF2ol6nf9lyAfyDcGaX9ZtRJrQ3Iak/WoK6SlbYmQkj4Ndxsej4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022206; c=relaxed/simple;
	bh=sEQXvtLWW/udKHnj3II4eXmUOOalOzEKR5tZSMM04H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dd5rdphctdDDriCd84tCWkHEjU/UG69+2XlUjbUMXJ5PrDlWbJ4AtzYBOST3CmYToS+VcwX/vjwkSQwCFgSeQHobL6WFMIHrXXQnfWxbUnrRdvOb8Wjge+/DM4k1MmjMjBtg7/BQmTVeYYEH/QAJhP7pIuRu9jBoK2qQBoWNy1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tmnklv8K; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tmnklv8K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5ZpVSuf+cIRvOXZf+w5WtldAquAPevD+duhWvYQB9vm4feGJfPqdIJ8W7de/mOz3QwgELClYXman6hlo3LpE/tGt2Lsu/wk9Ro0TMBHmRsOpfyyfNk9S78Rl4q+AIj/wlIhTpmFqo/3IcxKO0zvaNu31FWxVHoV21+WAgk2p1cVuzL6LWQ0e/KMjfhNlRDCn1HNdU+5Ij6Rrpfp/7ztEmIAJ4d++Z0BOqzO7r6VcqqAIh0MZlMiMrkz45vNMKlo1ZstWbWK7DF+Jxcxcn178TkXpgnjA9hSFp1LmRPgPdRSizZqm9LpYLz33+sdTnvh3K5NZXdV90oGJ2oHau0fMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72p9sQSPqviKlw7fiM1BT+txwBGS2PNYfCtsoxVc9r0=;
 b=nRVXS9EvU2aYrHw77gEXMH1sN5nAV3e5ln2O22LBSxRVhWdyuEn+ohvW0OrT2tR2kEPiC++Cay7Pfcz6vpIWQgqF03C64lSOwITHKYz8M7xaRXMuo4BH1ZAP7a6Icqw9XfCdMFf88RCNgpvxZqox5CY9eyvup9l1oBok+BY07803aLNZvP3N+EppizJiQeTfncNGpPilKj6eKx1vOL7ONzZ5u5HQk6fC3EcGhfVO74hfpRbDo+g1k486O95O1teds9oMjcpQsnTNct2icDskfyKAcFJmll9/rJBOP3iyil7poFhqB09AhHI9xt/acDIVIUMTX1bTKJdUZRY05wrBiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72p9sQSPqviKlw7fiM1BT+txwBGS2PNYfCtsoxVc9r0=;
 b=tmnklv8KMxU0zJeaSu5Me3/7vTMFQYnzeAlQmi3dcNDRPZ3lvy1Ub7iHMxrRYJaXVMaY3ZmqkvM05Eqem8IzBTRWgsq8ck2SgD9vPSSJ1J1IaUvonXei6xVbRswJ2CkK8E8DoP0TBHUHZ+GMBPNAQmwORdrdyC+EvWib5uEGIDeRmNxuZwt10gvjqM9RAzCVKxMCCZ4YGfp8KmKQZz2YrfACLcnaZDgHGEI2XflKRxxSDKM2PIuJd5K3YyCAQ1zS/VhxxMKE5rteLwFnSQG8XQ7Z+LqeGW46t1xarJcajP5Ojjo0dfxNObsn1firXKNu+JzgtB3r1K6OCdYp72udBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:03:02 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:03:01 +0000
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
Subject: [PATCH v2 07/17] arm64: dts: imx93-14x14-evk: Add MQS1 pinmux, clocks and mark conflicting devices
Date: Tue, 18 Aug 2026 12:02:01 +0900
Message-ID: <20260818030211.3141710-8-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0169.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::9) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: fae95d5f-5d9e-4703-4ff3-08defcd5372b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	hCbTCM7Ro3Vd2eeSkCQivaNtt+B6BAi5AGvGwpen52H4YWckIl/Fi0lw2ZIvUhhaeIKlJ6Sz4COea6toc5vakjRD52ducQw1xg96+1NrbSA8NYnFXpai0bxl4J3D4mZ4tCh/oKXZ/vsAHDblbLCN7yKS2xb+LIsB71FedgW/KqvB3ykWDYrG9Jlc/uAcByjL+bg0Xa66s4ZNdKPkEXHJIuIDBM8uzCQjRFFQYfPDxxLi+imx7Zb2vXHf+Y/yCuegBxpsZF2l2AlqKT6N6V6YiFylNeOolwoAIulEXLvkcOLEq0N8HQbJsIn5ae2a/jTzIWb6eFvlGI6O5mf5pYtpaNmP6m744z1eS/3L9ev6sHNuSSmgprcF8m8zTlZSK+OyrmWX2ciNWTK5Uw/r/eAJ/sxLytEgyPrNyoPzyTAZdUxo0argI5UxupY9iBT9PVFfbd89eOOvz+vtme8LGlSqJhJJBLn+i297KFUoP6OO6AfbgFPaGgSSjpZIBUW2pRYoDS8zfmu1liuQvwdZXg0Qo1RQxiwPeyHTM0z5PzC3Q2Lmjm812ClxAaDLNhdMYLTlxeLFqKfkvXszsJ6X1wTyma/eIu2OQjGwB6wIV0MlPsh8Dxffoq+Cz2cyYwBjw2U47TMkkwK2YgKmOkmXYSnn7wRjDsZgeGxRO6/tXFfp7Os=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oH6hGW8gILxh2btFoZXHfbkyNNzy9/ytZeE+xFwSzUkeRiUJYGaYWOKmrlwz?=
 =?us-ascii?Q?dTZlwbyPEX9uNrMbLaZDonK7g79fw1WeQq3z/4cW3hHH6cdQd3E3/sdhQJYw?=
 =?us-ascii?Q?4MUZ8AMpTkBYof4u5uDQpQrViOnZ3e+lCrPAZrIWxIMRAzckCsHzPnTzgJgi?=
 =?us-ascii?Q?q7tjnUoi6d7DLilHsa9Vz809t7vW7CCgYJmwJsnRu4pN7V8QTnbax4sE1AYC?=
 =?us-ascii?Q?BZWaoGfEr9gekdZlMgWFnD7tcpoz6JHbJEpkOWuQJmzOthKUxWNwaUp+e/wk?=
 =?us-ascii?Q?+Q1WiKYrwirblbSkvzGE87MjtcxNw1GjuYzOlHlVcVRSKKGoFYltR+Q27tta?=
 =?us-ascii?Q?Ib8lkzQS6x/ett7xYN3619dA6k9dA2P4oD2WGpkS29eUfCN9oOPN8PW++Q1v?=
 =?us-ascii?Q?gMGETA1wxJ9y9yQhdCrDlAL+OlmYvji4j0BIk4aRkW4mBXpIQzdqgqTTEVIl?=
 =?us-ascii?Q?YUuIsUb6ghAuVNUXaAghthCHKJ7twiMc/rRLVtTCJfL+mgdjXfxhB1SELZ0A?=
 =?us-ascii?Q?b7Mu9nSvzaJyXEL2muVVjsF5UbGuWyeB3dMSU4prxorfEuz/44I2Y9alJmxi?=
 =?us-ascii?Q?7Nj3BAdog56Jznc/MRY09fJf1W67qRMFCluINp6vjQFMRooMCZpj0jutahHp?=
 =?us-ascii?Q?+KyTIEZUdNEBZQbSK4+ZM4lJ3+gYlrNFJPMgQaiSkJ2M3gEkibVepBi3MofM?=
 =?us-ascii?Q?Yi9pimFZh/EN9au+G1PZ0a7HZqK2ZP58V0oTNgMYt1K4c+dimzBA5G3Nk+n7?=
 =?us-ascii?Q?2tTIXVJnWNWqSqT30NQT4kCvje3TItdozhEkkeeebyus/GnYPfA20SA3aZGq?=
 =?us-ascii?Q?Lfbi5CtIZX3QTlLD/dCp4PYAEbU+3JQ3lW/yUxRrRjBKl89lRKx6+0ybUxNQ?=
 =?us-ascii?Q?qvCtL+CQt+vvAZyLl9FNHIvpmm0my14cSv3oUx25vTnU0poSXdVii7f6w0XR?=
 =?us-ascii?Q?WPLB8WUY4hFYElo+u4OcWDxwLdRq5FU4rXj0GP51AQ+dZ9RnKWl4li1FLsV7?=
 =?us-ascii?Q?s612jHCxSLX/m+GzLT5bBmLe45pmi5Vlo6zNTvZc7hcZVGXkwTqDjD/CFLL1?=
 =?us-ascii?Q?hK67sceBj7miZzy9t6VdGMNC8WbL475ej+ssroH31Cs7DJm3YeVpL41slOaG?=
 =?us-ascii?Q?7guTfDRjK8S2BEyqNvCPT+PsTtSXYcnFTgURVkV8cp4dO7lG2m6/ZDcNDStH?=
 =?us-ascii?Q?pf6jsIO3EP/qpuv8n3ud477aTIRxeCKv3am6NtRNgQ+tGc++yZ/LDGjSDPB6?=
 =?us-ascii?Q?BA034JkHKoW3UrJs/Dshk0ZeiR9xjlEAdHRM5FyAJL+V8kLlHEksOnoRDKH7?=
 =?us-ascii?Q?FpwZuCta/Y84+p2qAf/ANqdhYWE6ycTUbTRyCiZBbJKYTdmVBO9PS+H4UWDh?=
 =?us-ascii?Q?hLRPGGSLRz2+h8BH3Q8Zt3cwkU/8tBZhDy8Me/eczpE8LC0L8Aidot/F3w+O?=
 =?us-ascii?Q?qtRLIhNtYP2A14G3BWqoymmMiQAk2W74p6aQgn/jyZtiBKSMAca3F7fPiZVp?=
 =?us-ascii?Q?x5pMONY9ehtBZ0I3ucB7JiVbcdhKPMdL8tJ73kfBe35FOFCA0aLQ7gLIKvjU?=
 =?us-ascii?Q?xJAGZ+hZ2TmsK9T+fVEhLhxWgk2kVqhj6QGFTQa5QKdV/XPBcokFNOzBXK7/?=
 =?us-ascii?Q?uJuhlD1VqOQGy3mxknC1Pp6K9nHeDDMjtI58VJjjuAhGJRPDnhH0G7NXzgnB?=
 =?us-ascii?Q?EdMtOgmKDtTlJR/lYuTRsgFFcpsmlSFolecjsyZp0tBRpqwgiA/xCcqJIU+q?=
 =?us-ascii?Q?nzWiKB4gGpOEOSveTp29QYLRRGjMua70i5VPAEDejUwR7bLeqNX8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae95d5f-5d9e-4703-4ff3-08defcd5372b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:03:01.8607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dHc6pNnTEJEVpS71egSVsnBxDz9OWvG+zK2tqjYM2y8+TiHkMCj2+6at1YHPSZ0N+7tBTx8cgxgTHr3AeEDQNcL/erEGwE35JQ7cKJeKOTp+xuV/2+WAQ3iSQy3Vx7rY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 shares pins with FlexCAN1 and its sound card conflicts with the BT
SCO card. Add the MQS1 pinctrl group and label the conflicting device
and card so the shared imx9-mqs overlay can disable them. The overlay
and its Makefile rule are added in a later patch.

Update SAI1 clock assignments to provide the MQS MCLK source.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx93-14x14-evk.dts    | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index 6dcfbca65cbd..525504366f27 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -204,7 +204,7 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-max-microvolt = <1800000>;
 	};
 
-	sound-bt-sco {
+	mqs1_conflict_card: sound-bt-sco {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "bt-sco-audio";
 		simple-audio-card,format = "dsp_a";
@@ -282,7 +282,7 @@ ethphy2: ethernet-phy@2 {
 	};
 };
 
-&flexcan1 {
+mqs1_conflict_dev: &flexcan1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexcan1>, <&can1_fun>;
 	xceiver-supply = <&reg_can1_stby>;
@@ -442,6 +442,11 @@ bluetooth {
 	};
 };
 
+&mqs1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mqs1>, <&mqs1_fun>, <&mqs1_amp_en>;
+};
+
 &mu1 {
 	status = "okay";
 };
@@ -453,6 +458,10 @@ &mu2 {
 &sai1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai1>;
+	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
+		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
 	assigned-clocks = <&clk IMX93_CLK_SAI1>;
 	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
 	assigned-clock-rates = <12288000>;
@@ -570,6 +579,13 @@ MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			MX93_PAD_PDM_CLK__MQS1_LEFT			0x31e
+			MX93_PAD_PDM_BIT_STREAM0__MQS1_RIGHT		0x31e
+		>;
+	};
+
 	pinctrl_pcal6524: pcal6524grp {
 		fsl,pins = <
 			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
-- 
2.50.1

