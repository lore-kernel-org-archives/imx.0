Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F92238C36
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538073; cv=fail; b=kQkwZD6pYleldANoX0t8zA7zm977gwSrhS07BdfhMuABWRiTjV6Itaj5ZwLNuRho5Zp1FmdvUvabJ0zhWRCHXY+O6jWZPk2uO0dpYSzyWo8BZrAxXDiiiBmzG2jYSuqlM/s/z7y7MwprBDeJXkN++J+dZDLlLuqIcL8lC3wEhgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538073; c=relaxed/simple;
	bh=dbVCZR/MskV1nivv0bn1UXnjSaoYlx4qBhgsFQHcfFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lb22JDiNlMWx7tvx3YAW7x2UZJzFtC2sb7Ldt3w4v8s0oQAxhPC6RAO8qJwqc1J9gBNYZgrmOkpRUJW50LnX0dM8olFrkeuwtINcD7sA3+aEf4xjz/eGfPzlQV3CvLE/6jFpGORXxUqwR2wy/fKXSkqhJrRWxa7+NTRuW8y7SIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=auK3qP3h; arc=fail smtp.client-ip=52.101.70.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="auK3qP3h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLqROzkUVrQQFnF9SLPCuzT/eZsS6H3k+Pa9e7lTF1DN6aza7FJev2y1MqVL3chInJbHBnFtDkrj0yL1nD9AXstI6iMuKA5yQl0z8+/UtsidDqwaczXqrHlJ77RWpi3rQpL8YOExIigUOWwPeCGxpNzLJ16hfPNclGN7oTy6YVd1kbw8rZ0S3ORylPnCD7YPnXrsGoGwi45wipFhShwhDuG2JqI5HDm/dNDsTGeA6Cr3KRGG0Ll4e9iuAeKvuXtUtTngmnfJZ7a6qEK+7H0FQ7H0//ZMj+us2sjG6uzPHpW/TcO/iNmbe1Hiws7N/vMf8lLRw4k/Yi9MhMUF7ZKkCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jc8fA/iz8MGb4/edeBec5+cSo3okq+A+8n6WCjjSJv8=;
 b=YrNLldCNUZI/8ru53EeKazBZd8Ff6NR8Hclg7bCpDR3U4B9NX91s/6Enc2XUS6ZB7jq+ihDvTeur4LJNZ6reNwo4/KTHOl/eCx/Qy/2I9xtlUNEi+K2WdLpiyTzNJagjQegPlbiQk+ISslQYR7D4xoByi1fPSEA5aCb8NmC6c2Dh51+u+SPSXkBg5uX4sljSjnvfSLmmnh26h3B9m71cv4KdaqN3Jk70fmEFV2mbnaER/hGB4Rsia2/n+PfNSze7SX/rGq0/JtOYFG60jsBJqGtN6S/A3mMeH97kUKOVpB2fBRyTmXoymP3GvFBrzAq9DSDlGTkFjedfnXSPvxlRbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jc8fA/iz8MGb4/edeBec5+cSo3okq+A+8n6WCjjSJv8=;
 b=auK3qP3hKVGaDoWvfqoznRWmfSh4Km2L+cgk9ssWaYGFAe4UFGEvus9RonPagZfdACsmVQujvmE2D0E1lrsoVkn8kMmPu/bC/KKFPUJiNT65eqct3PTPmUxUV0c9HJDxHbQzswRyzObulCmOwak64v1PdsXgQYfwcz/bMic/GXqIW8Gv4cpu3q+sZO1mJvv1CHmgICQ+02uK2kbs23evzOwC6C2l0dpx6q61ywOoT6AwtbmyaQNGuSiPXzNT8Lke7WKTFj6CcLM3HuXawGyLyAwS0L6jEX6C3JyLH8KeSwVv7i6a564xPK6ig5bLr1K3tQmpe1/6cjgOKdlK7Dq8Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VE1PR04MB7360.eurprd04.prod.outlook.com
 (2603:10a6:800:1a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:21:09 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:21:09 +0000
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
Subject: [PATCH v3 06/17] arm64: dts: imx93-14x14-evk: Add board muxes to select between FlexCAN1 and MQS1
Date: Mon, 24 Aug 2026 11:20:09 +0900
Message-ID: <20260824022020.2812810-7-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0080.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c6::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VE1PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8b3266-a222-4b71-6d11-08df01865be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	deWu7wCnhDCcjD+6xnz/Qix6pp0wG0OwAG4FDoGJr3QOsBAqQPEQ7T9jHGiSNv72KJKQrE4OCznHLsdnJXNszhkQb7qg4EVm4tzOqUpUM3TQZjQJh1nVYF8H6IY6naxxHff9ISmZbX5OhoAS8aPwVSRnq/u2l0zhg5el/p3XcirtBWsFRvg+pUikC5qbFtiF2bNLO3RLOpjY8Feiazdw1SP9YRMdRa3SC4y5UvW2ZxPjUvF7TDHF/ptBu13cz/WT2SbDJfn3APB4xIEU2ZqNsUEA0R5Z+a/2nE8nuVcpkeadi5qGzxw5d3Ik19/kB0CWX7EIfTK9AmjMBwlanIPxAQixWVXOwkTZEfdVZZU9avPrghLzE+8tWpTA+JMI7aENszEw71Q+QYkMhYunh/MuaXqQgIgYRqWi7WOjJ5tk+bhvnb7IL9NCtikann/0zt4yTjMCC1P9kRbpr6XxXloUHmqLw4iHXKdHPwVTqTMRySIpMyu2MV6yicoYz6YSv5bw7E27HHwSigaYs6VLcvyQ988pqoDTcs4xIaRDduXWwquY4okBWAVwf660XQeKbHHJckfhn6jfTmwYU4Nw/WhUHj9/YRkTJaLPyjVMIRt7bPaI/azuoePu681dqu2LjmtDdg8qUrf74s0KmWqwEmB+G8BaK7C3iqz4fKII8teYnvo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fmaMywYvXOCitrjl1PZcattm0wCDTub0LTgXJJIN11M9nW0etL4+r64iEyhA?=
 =?us-ascii?Q?xjbYf0I1BuTETsIN6KtxZ4h4QIsq7snGaaBwr3v3kZLApFgXz7xKLWebnfgG?=
 =?us-ascii?Q?VrBqJsXYww+QSSFJxcvz0g/0Np5S8WhL/bRdRVhfVf6EsoZRvQ696SxkQOiA?=
 =?us-ascii?Q?MKgfxPt21KdbJ8rbYVaN6OWwrwuDRPY1+FDR0gTP8yuAqgyvku4uTGnltC94?=
 =?us-ascii?Q?Q+sRDl4vhd21XOjJf10MY2tVWx67d4xEJIKMJXEJC0vkaF6SPH2k6/fdbeCp?=
 =?us-ascii?Q?tjzJv0UP64R83bFyseMUIIaUEJ0uzy67PWl/5LTSFqiqII6k35tzb3BV9+hP?=
 =?us-ascii?Q?h0cCIIgvUxN/38tGxpBfCTrIFIAzZrYtRdDEZFwyzUSQxvMMllP6nOt/bgBz?=
 =?us-ascii?Q?q8WcBdPlSH4llGtTxBfJUFX2HovBsCM2ylKXxScQjunUss74wOgEqLNDL5cC?=
 =?us-ascii?Q?3mVK7NCwAh4siI/wYsOff1glY1cGihIZPtEd5NAHt3IaywBIqGJADWWUSQWM?=
 =?us-ascii?Q?8KHCfytyor473xXZKwh/KCYYCHgQzCWrURBMZSgWH48jcxbw9eMmnmhOwttR?=
 =?us-ascii?Q?hyivCpFm58V3Dn4jgviudfSYUriP3vuvLozAMD3PA2GsHkvM3HAcA2mEWJTW?=
 =?us-ascii?Q?JO7+cDPnVQrLuBNa57t8g3/tjadTZHYkuRsWU9g7Qn9u6LU1qZW5VbHIkQ1/?=
 =?us-ascii?Q?YKB+BMeQf/sIJURctlKtXZ1k7hRoXVgA63rnTSKG4Vx2fJvlaPubT96IxZfv?=
 =?us-ascii?Q?n5IlIIATjxc9epyDrX0D74GF9R+yJYTA5M4qXhNO9vVAJHlpEsGZ8Io+rk8T?=
 =?us-ascii?Q?4j+4oTWcY4lfW7MDy1Il7clZRLbSAUkZWeMob7bfadsIMPT5VIhgItxtkTbC?=
 =?us-ascii?Q?Y/SQp1I8+QM0TXhJGKJucf2mUDQ0XJJTOul/Uh/WnRaGmZRDUHtr+eaFXGyM?=
 =?us-ascii?Q?RiSG9xh/S+qGLcLN3H9imJJR3e7hZIugf84VeKVBZ5cXSIKxFJHdt6F3ZdE/?=
 =?us-ascii?Q?vCRIg4H/RqhBa8UQd8PqxYY9INBPJSj+0UKe+KAwlBUiSSC4+WN17mOrMckC?=
 =?us-ascii?Q?ROi7OHIdvJTRpAKLMXiNag2nucs9kRmT3FjfCkSjjD8+0a3vQAmxg8LvW+nR?=
 =?us-ascii?Q?AQ5hLWc5XYyEjFkDUSOwWIaJjcMOhWYV5bsolHjJjJ1MD9TCyY/W9PeD3vZj?=
 =?us-ascii?Q?F9P+bnRe+8hg+KbkOLnFEunjMNwNUJEVouO32ujoTeqP2QhcjV7XYuyBaP1J?=
 =?us-ascii?Q?huA17AOXn5XIjD6cHp9iNdLKAEWcIn1R1W94ysQoOv88ljQmxu6ffvmDgJ2m?=
 =?us-ascii?Q?/AOMUJHh51zcNQbN80arCkBxEsKe3+a1oCKF9L5tcRTqtsbK9KpAQnYLCNF9?=
 =?us-ascii?Q?aCooLmrx165SNgqK10OBgcVGRrX4/wblaVxLr+TAavelvVvC3DXz0sZL4RCq?=
 =?us-ascii?Q?Ao1YbC/zNB/gmxmvJxooYiK2gBWMFDDjW41s7FFfTTY/c207Bjy4K5VdueiB?=
 =?us-ascii?Q?umYJQzah0/rPQBOTtViYK8NLDqMT5Ub0pUcCcJsqzzTRANb22SsXhAL9h13n?=
 =?us-ascii?Q?0IWRUEul1/NreATjhI9/pCtbpIDG4QBRV9xUhdH08Cp7hzb+vcKiA0WVr/iH?=
 =?us-ascii?Q?EX74TzOwI2S39CxCaWxix1hZ09Huy+Dvs8RfIFlvUdHr4amgQYPJZwjlrxs5?=
 =?us-ascii?Q?GvrjCCE5v/UqQHsMvRCjzQ4uvirHLBUURxjHzceB1XkCzl+oHBnXHJZO3F0N?=
 =?us-ascii?Q?LRKFcME9KbJRyVli31PgIFUjQ91CLmNfIwmsqldtjc3LaTqLMyFS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8b3266-a222-4b71-6d11-08df01865be4
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:21:09.0035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lciApLnDV/X8x4a+PZsJsfQCxPvyA2ZBOOvg5qp6IIfvQCXy7mwbUwa9v+cpqTqnhuifLSTps4PbURyOQhUTQQ2CInr1b4Hhdx06U4HPKKNtr/y4yp9thfFj6Hcc//u0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

From: Chancel Liu <chancel.liu@nxp.com>

FlexCAN1 has pin conflict with MQS1. Add GPIO-controlled board muxes to
route shared signals between FlexCAN1 and MQS1.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx93-14x14-evk.dts    | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
index ec78c03f4788..e35946bc3ddf 100644
--- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
@@ -37,6 +37,25 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	can1_mqs1_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524_2 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		can1_fun: can1-grp {
+			mux-states = <&can1_mqs1_mux 0>;
+		};
+
+		mqs1_fun: mqs1-grp {
+			mux-states = <&can1_mqs1_mux 1>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -254,7 +273,7 @@ ethphy2: ethernet-phy@2 {
 
 &flexcan1 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_flexcan1>;
+	pinctrl-0 = <&pinctrl_flexcan1>, <&can1_fun>;
 	xceiver-supply = <&reg_can1_stby>;
 	status = "okay";
 };
-- 
2.50.1

