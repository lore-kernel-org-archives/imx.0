Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C0635202A
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022156; cv=fail; b=e+NTJ910kIev9Qz35+Ca7s4EwLVaCbKJ/b8LfWh0ovzooAkadmjQuusPpNiFVN+HBaBTm70PobGl9/23EiGwuS2PNBsJoYmln/dGfjrvlkMzjoAcVGmqTx9gIBFguG9stUKilkUPtLHE5jpe2GLz/8prRj6SMuKzEU6ne1Y6DPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022156; c=relaxed/simple;
	bh=lO6+8JP/5itsQwgcnohkZClbise7bAlm6teP+wj1Tag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uxgNstLJsVFPx6z17B4WZw08EUUz9mm5mqXW6yxkwpZtwebK2jOEhz0CnfrbFQql3uF5H8WrqpY7dvcFal76EaYEGF9LYBK8BLpGXNwO5o8WV8qdGZ1GpNINewDhmg4E68ippl1PvmWzyLqgo0K6k8Ulxd2KOIu+AqPjVwoDPhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=J2aDD1Fu; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="J2aDD1Fu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXPEolQwg4TAWIP034nOsAaFPEg8N+huNlteKfW3yWPhOZicSnCArgeII1YMFydEFORw+E9gafQ8ylur63+Rr1sKGvY6jL4W3ufK1an+NkdR2teobyXFpksMX5mKevRSL7zvH+oUaScwTv3jKrhKpptDNgOWlNEaRKvJ1ELLBaT3aGtLK2aGu1wg7mkES5Wd4fedq9AwsTIkULsxMioUoXd2fs9BMQyFx+7DS+LafXKD7tWkQ8rBIVJASHR69C7XVRrUw3N08/aJbH8feOiOTfgEM0uXzx/SzvcHLfrcORcXK7yPlG6fPQIRbK+Xt2RXJHee8/H3lLqULj3Ce+q+/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+q5vVy3/mHMMRg8yJeHxHFAos4TmuZ4TO7+Jg4SLdw=;
 b=h5VVha3vEps7OGrbpuk8wGezwUMXON2IVlT6ffEq1ynNdK483do81DFrzMRHoCMfcPQJKZ8bVdftjxRO9ubGFrNIdDDlJ/16h8m7eU226FPmkYzz6dQTLGhNTtIIuF+ZFusbw4Wpcap96ymRNWkep86ReJ5Y5u5oG7pTzWjZn47oVzlVMOp5FVunBYipYpj4KemUP/tMBYhAGm5iDwOZsVsV+po0MbZw7RGabhqERGDejE2TrP7kJppcc7dvEGXzLbPESfrDQIm03B76fUya46nVorkwdd1Oe7UUz/vQt2lmHso+tSlkGJZbRwqkDgDa1KFTMOUSgoHohCYUEV2tBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+q5vVy3/mHMMRg8yJeHxHFAos4TmuZ4TO7+Jg4SLdw=;
 b=J2aDD1FuhAxFZiyjoSkQ/uwvsHuXvDPx3VkFt/a/ltQc3LQpI83DEzeArBV48+/LYGE14WqtmqN6bzMFtAWS3gy4VZEobqSPYcl79MJlHe7TiNNyAnv76YssbAeh75zYqKKHCLi3y1q2EOKh4SW7zLJ94gtm2/6nRoUIFZfkEK+QLMIRr4TIrsEsKl9T4JTLsXLDmjYpD87w4NpLL9c800BN2binbNkA2LRx+0saVKmfF7Exja9WaFCaL9fEw6MZlRDIh2hbam31FhEATR7aUFztU5V6UL0b7c1AbUcfHPgPzmar1zSq151Get3OmNBlZL34lwpvJThnIsfxOcHIGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:02:31 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:02:31 +0000
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
Subject: [PATCH v2 02/17] arm64: dts: imx91-11x11-evk: Add board muxes to select between PDM and MQS1
Date: Tue, 18 Aug 2026 12:01:56 +0900
Message-ID: <20260818030211.3141710-3-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0056.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: f198db2b-94e6-485d-2671-08defcd5250b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	huIoMm/1wwEtv/Rh1AVlBFKLvDsQGcLJutfQFc33Lto9RaXPuMT0YMMSe3gmOCTcW5kiN3ZaHWeNqL/twuckAuYRyzCp4rE+ngEberKr4UUdsxvUUrlRI4barYzrON9Rzuaox+M943JxeYPhIIq0kRcOC/h9YTY+pfnsZoLR2IalgekxY0NJJqbrH9mdeAmL/jSef3g93MzooiOPSBUHwGJ73gpeXXgQFGp33j8hYKi10jOjnIx0QOQeRhJaU8k3NqBKQU3sdGhrdArAMWxX6tp2Jb8hqxiGx5/GoVYl3mjSLHBytzwNqi1Wbw5KqEu82s9BFok+mibP6UvWf9FwMURZrDZLQ90ohv4VNC488n60MHaG9uah63He1KCuIF4CRh8rfHpSIWu/cPyzVFX4w87meluc10ZH20kvHrzUvVBD5cmW78zsODvLP+nfahfKNJ2yhcEnI3+AoET8BL2e81kKmaRv4Ye+LW8+c6VjJhfzqhv+5b5Xr8EKUmeVonb3HH7u1uGiAnk9YEsyvFkf10Jf5y9c+GP40N3kkM4sqTbdM7B4oXFhOdrscuy2JKPiu14X5S0DMsc5BD0ZARP95f3zC8hTBdopYesHXfFA4/UP3+w01Vi57/ixgaUdB15t8HwOZbEjFEOl6WgOVXFpYdf4NOiT47XZ5EDiYugJz2c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3mI1TBdCscUkBLjkTI0NfYac2qdQw91eHjOQxzsNnYpoLJ3++348y4h5qqYW?=
 =?us-ascii?Q?qE+n7Xs93Eu/fSR3MEfscMow2r/Lep1CRUKo9mkMXGjsqNvqwmuhOY0KKHy9?=
 =?us-ascii?Q?cvxb4QobQZVne1oyvG6rTdmrrJrprIJ3VJ0fQQCgG+htqA66CUerHp9dCYVi?=
 =?us-ascii?Q?QNPKKcGtEPg5K+X/gBpjtvthrPPAhdlZ4swAgvnCAF2SiezMhxXIRQtfoANX?=
 =?us-ascii?Q?FJMr8rC4FI//MLDkn4M+hKDJviIV9CxwMfbEY8Jt84icpNcuVwR+HgiYiVZt?=
 =?us-ascii?Q?UEd2SCpKzVr6DXS7wbrJInICUu+z63wKIstZ9WiQeRHmpct7OEtO29z2lxzC?=
 =?us-ascii?Q?HDwEgn9zKf+IkpT0TXqbwA3meXTAAg7iDaUZE0IbRsSiwqrENYQ3iOtgQRCK?=
 =?us-ascii?Q?NSXYkDZEIKh0B0KS5tKJM9929oYDEyp3CaZft7JKM1MbjikjFURdsVFKa8Xv?=
 =?us-ascii?Q?kO1r7SkIp3SKqcHCA1bHyFHNt3YNggTy3nUqG1VtngiLqdW2+x8Bs+eJbCpV?=
 =?us-ascii?Q?MyJHQ5NEcYdGwzQm7v+UeKjg2KFMfQiKY6A7qz1KzCUZgn5jrXrm6Fawyp4o?=
 =?us-ascii?Q?QTh3OLStaKq4p0w/7q0ohUbtTFnk4VzBwXrCia9dRm4Rsf9rnE9KHOD9jqyj?=
 =?us-ascii?Q?ZmbUd8mEk+n+mTGKostwsjieEuK74D66yv3ZHaJ5eQCpozZfudDRlzgyzBdu?=
 =?us-ascii?Q?cTPLfdT+WECiKiKylrgqhitY7OcheI+kMuGMTPK8B8GhWe5mm4zczx9r/ZkM?=
 =?us-ascii?Q?6RYy/ha2EysB0zO7KMehXkMYI31ijxJ3iOqzT71BYrfQBjvrHNxZnKGX/bAY?=
 =?us-ascii?Q?UBjX9wAHkt5eViROHXmuytL1KGw6Pm6zlrdacpxI1DRDj4P21LmtlaUHEW9Z?=
 =?us-ascii?Q?7kE4bMXupmmkNF6rNCgz7u5ELtBv8gGne1kkqceuxuyIc8v9ODIB6UeUGKhB?=
 =?us-ascii?Q?Ngl2MKoncGNci9zw1wwtEjF6AIXlz47vcOBSSpHi+0xf/Jw1hfWFCRXMf5ZF?=
 =?us-ascii?Q?HLz0d3+NBN14pbe2Xl+i+nV5Ar6W8k7yD6hQYSuU1J9PJzxD28dAUhcJVXsl?=
 =?us-ascii?Q?383jMhqLxGw9zJ+Zh1EXDy5jvbgMaKwy8yRgxH8EIPNNkp3WbJpysLOAS5L7?=
 =?us-ascii?Q?gxwjkc00Hhs2FHXO2Fx5FPMM+L08W8n2Xu+M4qMC68Rtm94WwhCrIb8hk/dk?=
 =?us-ascii?Q?LHc8qSTka/vdxnbGY0skWbny4bTa5n/7t5dS17o3BtM90Oe4LrtITTHwarKf?=
 =?us-ascii?Q?E4rLazmIitKxXFI3WoBqOD8LxNFE2OwLUFDArerD8anpc4tzBSw9EPs2ttRa?=
 =?us-ascii?Q?+xA7gZlt+/lAvhDV/72jSp4hCJbCFhx/IEPw60eAN7g24AwjqcxMnBhUSJDv?=
 =?us-ascii?Q?Y/2hhRl8SWwR/A9NaUdC/HoMLHOfD9JZwtjetkkKb2XKsXbLqzkDr6m7f+Tl?=
 =?us-ascii?Q?nk9S6c7IwRkcv6FIKLBKNen1tY6PhJwGbXq4xoDyMBsVVKA1vBAlQl0Y7xh8?=
 =?us-ascii?Q?V1xtqQfXpc0ceWeQTWn2j5y4yzjxvPgpQhe45cw0EDNUaZ4MDYhmuFc6A1Wn?=
 =?us-ascii?Q?/3U8C+T728XItr746Gua85m4af1SmIcNIXu3bJMbEVa5paPMtCxbXnc8gt1+?=
 =?us-ascii?Q?Qv6l17sFq+zF8YUvGrIW6awA80BvZdebjBCX81HcjjNVr2b8RhQ+q9mF04bP?=
 =?us-ascii?Q?g1OGfyZJbXHkSdZKIeVL6VpctS4KMv3FRGPlCCktuihERm64KPaWaH4NhQUR?=
 =?us-ascii?Q?38SoqjMpJg94XCo3rqb3ciA/ZAlMxbpea+vxexhAN4j3Advw1HJb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f198db2b-94e6-485d-2671-08defcd5250b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:02:31.5327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUiSuWsCz+lYS+jo9odqphGQeR7thg7i7G7ZwjE0j7hbKu1hCwGNJhyOWQSLXQpsYGigjRLX9vAYthuAFUPMzq9V9JOM85Lj5rTK0UGWVNfmfiiW0i1QaJrkk3j2jyRl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144

From: Chancel Liu <chancel.liu@nxp.com>

PDM has pin conflict with MQS1. Add GPIO-controlled board muxes to
route shared signals between PDM and MQS1.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 5716febb5a50..4d1ada6a3942 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -41,6 +41,25 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	pdm_mqs1_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&adp5585 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		mqs1_fun: mqs1-grp {
+			mux-states = <&pdm_mqs1_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&pdm_mqs1_mux 0>;
+		};
+	};
+
 	reg_vref_1v8: regulator-adc-vref {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <1800000>;
@@ -484,7 +503,7 @@ bluetooth {
 
 &micfil {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	pinctrl-1 = <&pinctrl_pdm_sleep>;
 	assigned-clocks = <&clk IMX93_CLK_PDM>;
 	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
-- 
2.50.1

