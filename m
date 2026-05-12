Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010042.outbound.protection.outlook.com [52.101.69.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D231A23A4
	for <imx@lists.linux.dev>; Tue, 12 May 2026 02:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778553982; cv=fail; b=QFXQFjNjjiAaKeRxbu5tejRLIRmwaxFcwpQEcVbb0FMpm4Rhhpz69eF9eLBkQ/K1scbvClsuD2mPtYaQxj2MN93ugWkuMdGouIzmdP47pCBlQtM2vJnmKBEoiUcXHk+FIHiVokZI7cQLw0iLqjOmyVOiKLpSfHtsOK039RyBILs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778553982; c=relaxed/simple;
	bh=jzL9rCNIwtB7NA6K9idF0jCRvQbctbcwBlwFPBos4+Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=KLKLjAK1ZL7/Ydr862VyE3FSb9ufBYh3bYt7mXtdvON9LAT02t6J1BHHZeCvNNkkaEhajffLWePv9fvDnzVyf6eAkq1PfLeNjzrJphXnvGZtzdcsXyELGCMghLvCGzFGcsMSj0EaWVTmDb1oowYqGP3BKbrSXwzamtXsoFI430A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Bft/Q285; arc=fail smtp.client-ip=52.101.69.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Bft/Q285"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TaCDwif3VUeaisuOUxnZzLKIYY/agE9pdUzxGkEaLCbauNGwqJB9Io8+JsSpReOmpV6h/WSxqBgfPOIaVPEvXTZXjq7xG0B/gauZBVosZOlJlGCwsiq2N2Nrsn7i+ZFZ1s5GOzzP0piVs6D5Yy11FVibbu5wU3P+2B7FMKcKEhHK9SDyByh0DGTrD/gn6X5QTedjOyEJdvQjMrdGRQ4frbb/LFnFn0SG4uS+/9SdVnJxoHEy2Bm6H2HMKhxtm7PFOPq/n2uknFkFdt8akyPi8Pls6AZ7+6Rqu+01/gQdOYIXHfOq5Z+RK4tECEhcrd8zMRcg+oj7XVZxAPifROpjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIK7cXc0EMtmj+eBa3rhM46lkjfF/24i8aEWdJOpE8E=;
 b=KMCKKfPMTOlhbBNUcXgAtFFOF4waRNuF8sLVQzY2pX7H3eEjhmtCtasukJ8gn+MHxbl3Vk7ae2dbKzgTMR1JS6Q/0chNwIZfQy5h7sb6A047WY2+zMmIIpB3nAoFBozKWbKH88JASj2yaAgemaa8M9ecwwIDb0JK2cC/DZBqt2zZPUwsKyWFHS60tWOUEbXofaMl9nIlLVlodtYoBWNocmUvT5w/tOaSNjc0+KHvRCjxCQLYmzqRVhX21dGyzT8sQ/pk7Xsagp+Ld/RgTHxhFfrf2KC6V0IH1mDItW3ng7EOtbbtjxpMlBs6/XNe5GzecHwyDXRlRj8bx4+GCdmdXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIK7cXc0EMtmj+eBa3rhM46lkjfF/24i8aEWdJOpE8E=;
 b=Bft/Q2856LFAADDjzkpnCsyfnFsnRfhbSnPGgaN8bMuIBbI1duNiSJpy2GMO7r4DHwMUftrHhRp39a0v8tpkuu1jl6P5UDqANh76zd75FHjxFS62fJra52MPqs1/6SfiCQlp0tSioecDilOZlyjHZ/l/h8FMVhXep0mgCsR9oZlIE03rK9QGP77DsLiOjiyhDiytOc7e5oX9zSvEspK5neyiXsQORd1SqV+xGgfD9x8urRKzDJ3rEa2/7l11a7hLcqfP9VQUfISs5k2jF8GHvlD2IgN05eUW+h0lQWUFdCPYNGnDdPVC/FEbhV/Od71z6R1kGEB2ANsu6tpWIbTWIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9644.eurprd04.prod.outlook.com (2603:10a6:102:242::11)
 by VI0PR04MB10928.eurprd04.prod.outlook.com (2603:10a6:800:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Tue, 12 May
 2026 02:46:13 +0000
Received: from PAXPR04MB9644.eurprd04.prod.outlook.com
 ([fe80::cf3:c5b0:7a0c:d11b]) by PAXPR04MB9644.eurprd04.prod.outlook.com
 ([fe80::cf3:c5b0:7a0c:d11b%5]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 02:46:13 +0000
From: alice.guo@oss.nxp.com
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm: dts: imx: Add watchdog support for early boot stages
Date: Tue, 12 May 2026 10:48:50 +0800
Message-Id: <20260512024850.904551-1-alice.guo@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To PAXPR04MB9644.eurprd04.prod.outlook.com
 (2603:10a6:102:242::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9644:EE_|VI0PR04MB10928:EE_
X-MS-Office365-Filtering-Correlation-Id: 08066f29-efd0-4ba6-62d9-08deafd0a168
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|1800799024|366016|38350700014|11063799003|3023799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Uj6IWFHIfBV0VTCIWCNEUcy8JB+luIHBCmxJ1W107tBKBqgPqrhzmgIWEUiuHJn4J8yCPCldvcAtE9Rgz79V/+P6/Rkg7lOuQXa3kbjDPS+jxj75f+Sal5grlLZ4NSsyHu+wOzGxXQjfMBH7n9cC2lTOVmBlww7NALcPBASYgijwco4pkPLyDcxsaE2CGbOZzIUT8PcoOHBKN9XZo+tVHoDI8DKm0rQ2UyOkovR/ZVt3AXpQb8D+fOrmT/xWJiruntefp5OOWvMIrQ/aI2DYZzkdje/AoGOILWdNun8pVJ57Zyi1kZhmbEUzdj+ND/TGVzbu3IUeIuiyO6vHEx7DN0xGT+TsVCTOZ9M+Ll/08wDOCiX1UjvGN5x42Nj75kni48xKrToX2oHmFFwLcL9SGxNgOI30ufLRVlcacEY2APNXkiZiYlTiGfzOEX/6gUXK77e5svmUoGiAs/NPfy/+zg6xp4zAMfs6FHu62Mbb8Bjx/pUWLmPiJv2OqGk8jtkEmjgV1rqMBzhzBfpI5i3h9+Uv05vbVL2/HRxg+CVX8S8p1P3HFxj/nVOZKFhR6NAObqP++rM5h7/b8gXHF3A+2f/JnYd3ykukMG0f5KFIzhIBZuHeIFe3XtlpR9vPn9WzIDjJxfTHIzp482l+0ynmpR72Hxs0ECdQJGDYhqsAp0OeGEmG/CEaAzigCW9X+qIHCRH4fTsHb9zlu3GC6VraUrhF4vgHDCUFHzYqtzWQsQn5r6S+93GtNhqG56eMwAc3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(11063799003)(3023799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z0xLz0k7lzI4nMqJ44Uc/0x1M51mN//5t+ZAcgfGUfKwH3s3d9tdisOlgB3b?=
 =?us-ascii?Q?OzIYuPFShK/3z1A8Zzrmd6qCLo8xBUAtKipl4UfnMsGo5xEKIng1sOlGakuu?=
 =?us-ascii?Q?7FszoeB+K73bL8ozRGZdA2l+wVSIKF6ILk8tpruXT4YMlEn5PkHQGS2Db4cw?=
 =?us-ascii?Q?eQm1PEdqgqm8ZRKPdd98/d+AprqjnohNGXAk72Rae0FcQABzN3NEli05xR44?=
 =?us-ascii?Q?ek1zb/2HzY2fA9e690595C0psKYOo1axgGzqezF6PxbG+anXz9f3RUchSHeg?=
 =?us-ascii?Q?UNnWXaWpYWPWHxc2EVIKJDWr65/r/ywRTj6sCx9NN51AwLBDoQQcslMy+lwv?=
 =?us-ascii?Q?eHZkzc+0bQeuowptEHkwQL2FHFztMUx8Gh5ym7DU03DCoriTRVAYMgl/VVJU?=
 =?us-ascii?Q?d+6TbMG8cpNE/t4Xx9/1YkJNJtQuypPitjsoOb/4kyr+2PMzJoy3ZHgZQ+T+?=
 =?us-ascii?Q?ci/64S4341W052Yw8Zzhf9rc78kKjKAfIKlIJvKuS4ZChDjdBszbm0K2Dn+L?=
 =?us-ascii?Q?nQK9LKLoZ9B68IDPjtoZppSj0dRw6RSgTEBVfDRBa3nBl4x3sRb7cjDr+5Mk?=
 =?us-ascii?Q?QUNUGefu1eIn5wkDYxvkDwopBtxz+R1DwIImubgcNhxA9H8i7/AJXRvhVXaN?=
 =?us-ascii?Q?UqTrQrjiteAS9PClztHzrA9MAoixNvYuSCCBtJzvWFbmGj6M99yfMSGx4RXH?=
 =?us-ascii?Q?6NeVzd8HWD3wIa5Ita0twQe5RsFbyNp4ejaKgfN2hxlYGZM1eYTUuwUWsS7/?=
 =?us-ascii?Q?JXSe6tKOaB+aofZ25Z0NO52J4lTRMMCEJKoG9pDZe1WYinP2Hh0VMCF2N0fr?=
 =?us-ascii?Q?Rr78dM1M8XCZ5wED0jEmJLqxxMfIew6hZaYrkUbM8tFd/a0x9RCBLCvx4KrB?=
 =?us-ascii?Q?TN+i+RN8xl/FnJLsczfJl0QB+CpF3e568QGk+E3Z5UX5Ri7/Q10ci+ZSH7rA?=
 =?us-ascii?Q?LuRcwu1ikPo/3H9Eu/T1z74dys6RAVisxbBX4Yay4u9G6mxSgLwsxW+eSHFN?=
 =?us-ascii?Q?gkwe+kAdbXockDk9Q6c9ptW8DzO7mJTGfXjIs2opdlmiylw+gtYFoDz1ObWb?=
 =?us-ascii?Q?qLpKLIVJjnflSuAXu+jcRptzIdwoMV0Qp8xV/NNhr5lRdz/G3PfhWMA9uo9h?=
 =?us-ascii?Q?xJKBvaZAhvfp0nFo83te2MQTKAmwdaRr1M+1bOEOpIANkwa7xRLD+s6LXS4+?=
 =?us-ascii?Q?5+aiCaCHJsrLCYJPk3Uyy0AaR5qrZe6sWHzunVZGwf6wd2VV/6m9f/XiB5bc?=
 =?us-ascii?Q?PoIyPCOkFkChB494Brd240kzQ6XwwEQrfugjXG7H4pCkon/SnCTx9ucTaLSO?=
 =?us-ascii?Q?UEGVDnnGyZtg6XqxgScv288kV+XfKdKf6R41SGynxSiqT6pojyLdwLwgCEae?=
 =?us-ascii?Q?l06D7aSnWuAl1UfRebMHRoj+9rknH6NKyP65OX98v/HFc8sEgebMMTxw8VCG?=
 =?us-ascii?Q?K6lkuG/f9feIljSnOVR09zYOB8SXF17kYT3Fy72jS3oHNLdZ+IVDU8GCjmnY?=
 =?us-ascii?Q?fm2Jgno3xdPjk2Ggex2p1moogiLUncrnplGzzIn4LJeJv0jzdZnCbSYzdLyi?=
 =?us-ascii?Q?XdYgjI+8mR3RvY3re8zHOnkN3o0HoXj1Ra0wQMP+/Nc4PwRloxFPNtfHtmzw?=
 =?us-ascii?Q?s8wYoM5yjQqU6YAUqNaFfr3VS6PjdjDcBgFCbIlAAbux+Zwn61C7TwuDzfNB?=
 =?us-ascii?Q?4KsaDtdgS1KRmrUWFG+wZ9lo+qDedbknPwRjbMiMGvjsURvTkmEU7/baCM5X?=
 =?us-ascii?Q?2C44tF2hTA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08066f29-efd0-4ba6-62d9-08deafd0a168
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9644.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 02:46:13.2456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1IlWcoySEWPlLUBkdqwY8VVpdBIIiMw6Ue3Xr3Exy3pcOo5ZwR/fb5VWlEvb/BlZsUVighswKNvFZOmqDIE6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10928

From: Alice Guo <alice.guo@nxp.com>

Add bootph-all property to watchdog nodes to enable them in U-Boot's
early boot phases. This allows U-Boot to utilize these watchdogs for
system monitoring and reset functionality during boot.

The bootph-all property ensures these watchdog devices are available
across all U-Boot boot phases (TPL, SPL, and U-Boot proper).

Signed-off-by: Alice Guo <alice.guo@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi             | 11 +++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |  1 +
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |  3 +++
 arch/arm64/boot/dts/freescale/imx94.dtsi           | 12 ++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           | 11 +++++++++++
 arch/arm64/boot/dts/freescale/imx952.dtsi          | 11 +++++++++++
 6 files changed, 49 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 1355feda1aa7..c29a767df925 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -325,6 +325,17 @@ smc1: clock-controller@40410000 {
 			clock-names = "divcore", "hsrun_divcore";
 		};
 
+		wdog2: watchdog@40430000 {
+			compatible = "fsl,imx7ulp-wdt";
+			reg = <0x40430000 0x10000>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&pcc2 IMX7ULP_CLK_WDG2>;
+			assigned-clocks = <&pcc2 IMX7ULP_CLK_WDG2>;
+			assigned-clock-parents = <&scg1 IMX7ULP_CLK_FIRC_BUS_CLK>;
+			timeout-sec = <40>;
+			status = "disabled";
+		};
+
 		pcc3: clock-controller@40b30000 {
 			compatible = "fsl,imx7ulp-pcc3";
 			reg = <0x40b30000 0x10000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 1de3ad60c6aa..df06f03624d6 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -302,6 +302,7 @@ wdog3: watchdog@292a0000 {
 				assigned-clocks = <&pcc3 IMX8ULP_CLK_WDOG3>;
 				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_SOSC_DIV2>;
 				timeout-sec = <40>;
+				bootph-all;
 			};
 
 			cgc1: clock-controller@292c0000 {
diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index 46a5d2df074d..a1a7e6a0571b 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -525,6 +525,7 @@ wdog3: watchdog@42490000 {
 				clocks = <&clk IMX93_CLK_WDOG3_GATE>;
 				timeout-sec = <40>;
 				status = "disabled";
+				bootph-all;
 			};
 
 			wdog4: watchdog@424a0000 {
@@ -534,6 +535,7 @@ wdog4: watchdog@424a0000 {
 				clocks = <&clk IMX93_CLK_WDOG4_GATE>;
 				timeout-sec = <40>;
 				status = "disabled";
+				bootph-all;
 			};
 
 			wdog5: watchdog@424b0000 {
@@ -543,6 +545,7 @@ wdog5: watchdog@424b0000 {
 				clocks = <&clk IMX93_CLK_WDOG5_GATE>;
 				timeout-sec = <40>;
 				status = "disabled";
+				bootph-all;
 			};
 
 			tpm3: pwm@424e0000 {
diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index c460ece6070f..9420519b5be1 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -1283,6 +1283,18 @@ wdog3: watchdog@49220000 {
 				timeout-sec = <40>;
 				fsl,ext-reset-output;
 				status = "disabled";
+				bootph-all;
+			};
+
+			wdog4: watchdog@49230000 {
+				compatible = "fsl,imx94-wdt", "fsl,imx93-wdt";
+				reg = <0x49230000 0x10000>;
+				interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX94_CLK_BUSWAKEUP>;
+				timeout-sec = <40>;
+				fsl,ext-reset-output;
+				status = "disabled";
+				bootph-all;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 71394871d8dd..7caacdc819c4 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -795,6 +795,17 @@ wdog3: watchdog@42490000 {
 				clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
 				timeout-sec = <40>;
 				status = "disabled";
+				bootph-all;
+			};
+
+			wdog4: watchdog@424a0000 {
+				compatible = "fsl,imx93-wdt";
+				reg = <0x424a0000 0x10000>;
+				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>;
+				timeout-sec = <40>;
+				status = "disabled";
+				bootph-all;
 			};
 
 			tpm3: pwm@424e0000 {
diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index b30707837f35..59f829004000 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -349,6 +349,17 @@ wdog3: watchdog@420b0000 {
 				clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
 				timeout-sec = <40>;
 				status = "disabled";
+				bootph-all;
+			};
+
+			wdog4: watchdog@420c0000 {
+				compatible = "fsl,imx93-wdt";
+				reg = <0x420c0000 0x10000>;
+				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>;
+				timeout-sec = <40>;
+				status = "disabled";
+				bootph-all;
 			};
 
 			tpm3: pwm@42100000 {
-- 
2.34.1

