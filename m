Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5453AD53F
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022150; cv=fail; b=arm4wDK5m/Cj5cquIvSfHEdYkP8Xo7QXi2RMBcgF4KsOFuYVIYLaT5oZ5T9Wo/KuIi0PEtc+5BXbCkn0eRmWGPHBiPAwX3n4pu7RaOgcEjmEK8OHHzz08pYTIkMtHav6kalcWDMWcsrZxCL8avutxrjU8g+mqvn++HWFBalwJ58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022150; c=relaxed/simple;
	bh=d520ByD3Xh0M/d4rUNXBmFI/CHjulum4cqHM1qIQxPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=twPzkZtpmTboMBKXBKhPsrNC9e/ZVEqSzO4j3odQiu7jMHXvvNbEGebS/C+hTIDEFjUBKDPwnZGvRC0Sczo/SH2YOJ6GswZ/h7InBIqg1BUjr1hNXnv3WvkEsUtyGPzWwx2Ft3H/YQK0JFjn4jcm2J8FIYlwvDedfcHh36XL6mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gqwboqUj; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gqwboqUj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGkXKk1aVImhIogdMW+/Yd0yJNC5WOFP9nkCnQcz2S7qBP8tVV0ACo2bDImDs5XEEwIfKirmldqK3gBNJ6oCHyfX371pxf6/lN1iWeskOI/uapol8xwKUKskS3U5jRrGIWz+RWw8Iu2RCcB/e6HcSi66uNvV1e1dzDwu1cvNEO+cAdnFSfdThUulfCMSbvBs+OePhZoLNSgd3Nq+fBrKv1UNa9VzKuWvgHHbw8QftooWhKKeYxgK5oLALKxVdQpZETNeV3MLUFwKR+EAczqHF7WccLJ035FTqr7ynWgLRZwN2gT5HNYIYRW5VjwPh3Zi220lm1sstlZmvRg4BlXfQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtwS3Bz1RPsLgJwOLtHA+Vnz3bbAlPszH69dAtybazI=;
 b=fumgnwdGe5c+G3NcKH1FWJCWjbPsDNdmeRfoCC6dLWzfDbR5mzaonTea6iF7nScyOKHVc1p9PLwWUhkxIadTq2QjtKzrRiZhPlc4Zv5/1gfNfJiukoDh3aXWR7kltbOm72vHfY6n0vFuWONLu+aYD1UCPG7IsXTuIYvybcv2SO4o0RCGHk8LyRv5/T7JrIWZL55LloC+NoKfgYevEMgqgW9aQQ/aCO8FW50k2X3OorT9nB5WPgNUXHpHHFUtHKHO0G7JkAlPfyh/uA/1TxwHO45z1WQsL3MVfWPU4YLtB2MWWm6Nl/9/FcVryX8EH908/4azhHJYQn8vyvLCbe30TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtwS3Bz1RPsLgJwOLtHA+Vnz3bbAlPszH69dAtybazI=;
 b=gqwboqUjNgJWSAzTNR44+TwmmSpgF3W178BSLMdFOieE74mi4wU1AHhglEu4ngmZgJt4j32lQa7MKyPopY4Xf4wftygIZ7+jrUgYW3+4YgiosVITF2ukbCztVlALoFmFRU5+r88iwUMdvDlwKpXed491msEytXSlllEWxMma7wUmj8DKbZBeFwklVwvPTPLv6KBt5znoHY+zhnU+jr1+/qcvtFQU6rHE9qxX7jZADgU2RqTB0wzz8aDBsqy/tbYCFM/ffgf26OJVkWxgopE7B9HkJWABGveEIWC76+Kf9ZmpT3AYo4wCSPsmyMUtbBwVChXmQ6YifiN6AYqHHgr7iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:02:25 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:02:24 +0000
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
Subject: [PATCH v2 01/17] arm64: dts: imx91_93_common: Add clock and sound-dai-cells properties for MQS
Date: Tue, 18 Aug 2026 12:01:55 +0900
Message-ID: <20260818030211.3141710-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0118.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::16) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: 15f23221-38b5-4294-874b-08defcd52120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	E2uoh7U3PacbxaTV/1SShKBNo0QSahX5N6klAVFdly6yf7+JCtlNJvOfW3CM4KjxyVBLXCLuTbnHpt0nv5hTulW04ftOuuGIiCFypS9ydMckcKmR06jYMzr4RvFcS1IHD1b0yyveNXjgb6lwOr6vErb2o6B1PdKSsmQAvtFhPs2Fz76b7Wy4RG6GUXnNdt3JQUmPkaOxsMVo691mnQkWYJXyHgaaf3sFoR1eQP6yG+7v+UXc1MuC02CwVbhyPEkZzGwKi+OGUgizckM5ysuSBTOg9amkG+OQg9dD8JaW2wO/S8z8cmN9YtslzfjLSKSHaI77Ka4X6PAIy28MMZWex8Vcc/hESLIPNc9H/BuZdrssCEXqV6E6Dsvgrq6yMcfCNP27KXjDco9s3zHqhdA9OSXXPLcN4bgywkZIFPHOVzmHwlmMg4wtjc+iPLrfRrFfH9GjrOMrsIxgnQ7dCnFdtsSREKDBSR+/RTJ1JtLRWgs54VroNIEVUqFtqjvDusMKbpQC8+U81ptQJaHsxz4S0Jv25MBkyaXwpL0H4dU0P/j4wQ9shs1moUdf0+lnjC6GhhO7mJDhsZ+8PO0NTgpmbNxyM9NRS6fFHPAB9WNNeLkX3PCySn2EJqsgpgFWro4HxGrZeMqNbtXQkHGYBU7j7+8LRLePvVhgJAqE9MXvlYI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1vt0fAypB3fxgYsoJvHM/vwyXVbbifMcin4OBU6VL8UI3A/krYwdoVcYRv4t?=
 =?us-ascii?Q?RvY8kQSdA6khJSD5IqQQiCNa4TK6DTtZ6KueW0ZiuHEhy2+5rNWC5a/aQkul?=
 =?us-ascii?Q?XnB14ORNcQ65SMiF7zB5wKJ6EjznGFmZf427QgVWHyo5O3eW+mAZroRMRHgs?=
 =?us-ascii?Q?WEfgLzz+QO+RzgOHTobKDrQ7tRvG7dzDhWQjSdCAHxgua6+GP8zW3aO7Vkzk?=
 =?us-ascii?Q?OgEeAcJ5scQOrj6mkymqw7rFEaFvpwTPCJ73/d1CmdS7GD9OO2li8d1I0iFq?=
 =?us-ascii?Q?K479Afi2Y6xh++oVXmR7L0wlhlJo5TLyogE4ARKbLMkFDa1ZaJ0A4CMG8M9j?=
 =?us-ascii?Q?OSBTwUGBU1cM2Vhk7pffBcik/FrWcJuX7StOeVkyYgdPVimX61Y06CZbmiE4?=
 =?us-ascii?Q?Jz1h+4YpsScPORtnQ44qCzkcTf0F45jr3P9fIgzZXwVp9ZUvjFc22fWpHH92?=
 =?us-ascii?Q?nqTHu2PrQuriIZmjuR4GOx9njAU8ksFoA2R+AtLHQpw4lZE6Gg4QNhc066S5?=
 =?us-ascii?Q?49x9DyEcyKXXlxIaGRfeHc8kQzdc0aa+JiURn5zGd7PC7cRTKJeweykH5gKu?=
 =?us-ascii?Q?sdGO4W2hXzagRU2vDwcpBbLkqyAEFWdYsa+d7TJb7V++ag7Y71u6v8ti4fwq?=
 =?us-ascii?Q?FPDPKb04pUwr1J1qAMXx61FN1AllyBU2heRrg7GcanRVOwF5KIK/HDH/n/z7?=
 =?us-ascii?Q?C74By8XVX1HXaGHLqXcZEIJMsFLwTH0zExEASfRwaStuXL29rSf4fNX/OAJK?=
 =?us-ascii?Q?rED2Mqf+jWXMEeoVItPknIwt8bE8IeVaAElZjkWZzlTfTv4tqEJT8mpNNYuM?=
 =?us-ascii?Q?X1iqDSbWJUwN6mwx2XZ5vWymwOXqq858L6fm82h0P252ZkwhuraZQRq9hrzS?=
 =?us-ascii?Q?e2N9PbtYTraVzWK4DNI2JA4opzBZcJO1Odwd1vN1Ed3/xrGc94sL7kHoaiZz?=
 =?us-ascii?Q?oghPeZFwWC7TK6Z2US6cnmqi2r5f3LHjjGTpCkUH4tUzJIhS1ASfc3xHqVlt?=
 =?us-ascii?Q?6jSH7E/83Y6mDGO8VOVQMm9ovjvfyWzN8wSIKp0EFXdtno6BI583lA0Pfrs9?=
 =?us-ascii?Q?GbR151CoRdl1V6HjH5NNaXLtfhxyJAO/9/IpwOvoUmS6R4DKZBH1YwfJgY+U?=
 =?us-ascii?Q?xXCEX3ksrRYN1P3ueaFKPtCvpowD1WdEWbdmnfeFtgD2Kppu3PNEwur1i1m9?=
 =?us-ascii?Q?ggwYoBFhtxZbXW7FfNBLaBohol5Q1vHY2HcV21cebxZ/sqIeTuRG5uO30FpJ?=
 =?us-ascii?Q?FQsUxW5B1avTY1VooBfcKcSteqQV7a/fUxCugR4s2SIMpDNCx0TqK43rAzkV?=
 =?us-ascii?Q?/bW/k3+UweQ4k3miE18qENT9dpmoekl54F1luAEPbXhDJNyqpOaoAnrfd8KK?=
 =?us-ascii?Q?CKZanT3ZCIWDYqVHJvqeMkdYL0ITKwQjdzHP1+HXcj3iTA3xkw3T+jNApbGd?=
 =?us-ascii?Q?gSzNBT30GcSe8vbSrRaSjA6NUu0c6sSyEaPhvOO7ZwTkrQptnZafdc7oMACx?=
 =?us-ascii?Q?yBhAGELEdhHkgiN0YeDYTUhfOib7coupLzO0AwwSTGq1yKFJ9hKNtltwLrSk?=
 =?us-ascii?Q?9tuJBVJc7FukBRNalVqpIRus2K+WFGqysXdVLp3diRnn2iwiDrxwvjHJONMD?=
 =?us-ascii?Q?uQE/wk74CvjLFeOWFeGCC5JaZ0UvngUK5SvkYybUiLbPkmtJg2McBlQn5QnJ?=
 =?us-ascii?Q?v6QF4Da799252ZISbZj+8tJ2Skexmnvz71ILXA7/8H/pEJXfKBohmtjtfh1n?=
 =?us-ascii?Q?bNeAiVUa/s6Z1bTwd1EvxTocuHrpCTRcDwaZlWvimNrWSDGUMVFm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f23221-38b5-4294-874b-08defcd52120
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:02:24.8942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PasdE/A6qo5bSDyXtEcsi/BNQs0xMYsOKUdET+u4pd3OWAb6jRWCoBQ3+VLoAx+SFz52o7DgiqmvJwe2iOzqyuFaJoXaw2Qu90eo5OSX5Lj1Sj2YtnM6gDCXX01QKKkj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144

From: Chancel Liu <chancel.liu@nxp.com>

The "mclk" clock provides the MQS oversampling clock, and #sound-dai-cells
describes the node as an ASoC DAI provider. Both are fixed SoC integration
properties rather than board specific, so add them here in the common dtsi
instead of duplicating them in each board dts.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts | 2 --
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts   | 2 --
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi   | 6 ++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts   | 2 --
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
index 62dc1dedfb0e..c6019d76b998 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm-s.dts
@@ -672,8 +672,6 @@ &media_blk_ctrl {
 };
 
 &mqs1 {
-	clocks = <&clk IMX93_CLK_MQS1_GATE>;
-	clock-names = "mclk";
 	pinctrl-0 = <&pinctrl_mqs1>;
 	pinctrl-names = "default";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
index c25561574d3f..6144fa6f3706 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
@@ -468,8 +468,6 @@ bluetooth {
 };
 
 &mqs1 {
-	clocks = <&clk IMX93_CLK_MQS1_GATE>;
-	clock-names = "mclk";
 	pinctrl-0 = <&pinctrl_mqs1>;
 	pinctrl-names = "default";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a1a7e6a0571b..a68ffd04ee08 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -100,13 +100,19 @@ gic: interrupt-controller@48000000 {
 
 	mqs1: mqs1 {
 		compatible = "fsl,imx93-mqs";
+		clocks = <&clk IMX93_CLK_MQS1_GATE>;
+		clock-names = "mclk";
 		gpr = <&aonmix_ns_gpr>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
 	mqs2: mqs2 {
 		compatible = "fsl,imx93-mqs";
+		clocks = <&clk IMX93_CLK_MQS2_GATE>;
+		clock-names = "mclk";
 		gpr = <&wakeupmix_gpr>;
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index bd14ba28690c..038e5ed23e5f 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -400,8 +400,6 @@ bluetooth {
 &mqs1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_mqs1>;
-	clocks = <&clk IMX93_CLK_MQS1_GATE>;
-	clock-names = "mclk";
 	status = "okay";
 };
 
-- 
2.50.1

