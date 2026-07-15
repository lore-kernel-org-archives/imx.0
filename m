Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011005.outbound.protection.outlook.com [40.107.130.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7797C47A0DB
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 12:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118606; cv=fail; b=m18tN7gTYCCjA/Y1pzmxvZMs97h2vwZuALy1/jUdgU2N/nR4+6PW499EvyXmKnZ/UmvG7fBNye8mlWxKB3X1T6xuc6/cIqNaPAPZr2Szo7HTyEcgs/0JKHpirPzSLUza2VwB3YjU9+6+v5PZ3vBjW+Pg6HY9SBVwfn7IoRzhIWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118606; c=relaxed/simple;
	bh=/ATyNFGv6c/pP823UrxP2ohZ1x2rfxTrmqX2Ne43G0Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RQuhO0KXcGrznQsFUr/+vAXEe/KfKkpByk1zzuV5U3E8yugWEyghqDfqoZwskRmWg9b/59l863cgxy+5C64NOj+5G9sRrQnkoq/yIw12ZTUbHrzJ3njPoYQ1Lm6hguXlmDBmtbDAyUVNjDmsNJHjpbMVnj7ZPsRtw2By8AV10VA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=H02MwD+1; arc=fail smtp.client-ip=40.107.130.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="H02MwD+1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWMWqwtf7yj8mryT9GiFgNylNwmVClTcAzaCCJP39k3ngvGdxXW/bofE6JtgsoheyxP1WLfeO6Bn8cuDuwYVH6EajLIr3IcBCroqddbairgpECmolq0Dm42OhC6xfkZ4axImnH6+tXXPuWNeP6jCcGjhAglpYzsD7jroqVNdwBF35BZ8vZyfKVhJLhjCoSCkKOogouMhdTPktc5jrnf9ECHj7J7l24n7Qmh4+G2n+b/i5ENBWZjXotWbTdc5ZUn780cHx9k27iIXjsgf1vVcLlGZxSrXK7HZuCoRMuNJbxuSA+2r6dVgqpxCiBlSRHdE1J8qG9ZjOrh1U1FraFFTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGZgWJjOkkbwMxNPAJODp0PFsZ1KrPDjS84dKWyjwY8=;
 b=dNP3EhaNajGHG6FHNC901nLkD9+qTbTvoFljnS5pUcP4I8jxIA+jy0HRXiqOWdnhye5+D5vNm9ARmFLZYv9kItVHrGLrBE6pvW6U8y1VCYaW4PL16R1Un7ohxP98isjdtvUOCLn+flfry54dUk4kIU1z5VmHRt46Vp/r9PrLIGGRbb+cNFbV+JrJ136ExMEOnBbPU4Oh4FpDYpkiNw1CpUrrNJtW7zYxRif1l4xtNIQEUdzrYJcfu98hwS7uztkAx8IfSv8QGdNHuDaA9Io33/cJr3h8fPu6UVOSdsh6e89t6AUPduBI1+BKwinvBixWgYzZLdzdK0kIRR03iK+zeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGZgWJjOkkbwMxNPAJODp0PFsZ1KrPDjS84dKWyjwY8=;
 b=H02MwD+1qiUwCajc4HdegYxzXyBjRuKP4uUOte+SuY7ehUxy3fQY1nkmca6U//cTLdlJ3qKdq5ZC4dWFoHwmZLEHxfj+Xaf1lIb4kAzee/KZJLBg59V0zX1w1bbVpQBrDEi76SmD0j7wGjjoJGm1v6ER0TdbL3lngqhLdAS9DcNT94VfwfIRAfgXXsi+l5a8HbR8N/eIrneKzhAwzbZBrvgbWq4tiF3i2cFU/9HVCf0fHegi01sejMqM2kl3etLDP6hbydu/6RXJroZZF6n+2YWo3zr2oV+2Lnh2WjrKvc1842Aa0GAS6lQ2NGN+2BdoQEwChj8p85WWoB6W1oDY8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS1PR04MB9684.eurprd04.prod.outlook.com (2603:10a6:20b:474::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 12:29:57 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 12:29:57 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 20:33:02 +0800
Subject: [PATCH 1/9] arm64: dts: imx8ulp: Add DMA channel properties and
 use eDMA flag macros
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8ulp-dts-v1-1-19651358b599@nxp.com>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
In-Reply-To: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI1PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS1PR04MB9684:EE_
X-MS-Office365-Filtering-Correlation-Id: a67b18d5-327c-4725-f2aa-08dee26cc805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|19092799006|366016|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ReH7iXq+z8CZO0LLo8RUz+n41OX3KizSg8ZT3rr8pvYM4TWTl2Tb9NwZfsP+tflPoeO7kcsNefTI1i3kNgT1QDIqxTZWSKiVap2/w+N4dbFe2GWeXmWGKSXaHp5yLbcwhAeR3oJO40SXN+eM2GPcFqWWtkt/Yp6XOkwPW2Plj0j0v/4N8I+uy/AxEgfpSM3gqftN8nrlkS8W8H3VVJwiyEf9QhF8WosI1b1jLA6DyugsXSPEIiDq2n+35xf4c1ubcl+1El3fT8d3BFJRwKjpdOPgfZJ07tek38bZSwM1Zo1wX0eUxEKqLnI2upb8B01EstF/JumAJXP/22+soZ4Sx6J3ZfrI3s42ZeVPyV5aj0vz8DiEMWcZLsUoaQUN5zJ6SQf7W4eKHoIv4PtkdXzSah9T1qYM6W2mJJxnUaq9Q9mGLKrTQh5gx5G4542bocdDt95DlIkkimpxoaoyQ/Ks1mjx9/15+pDfi2jBuJrTfqJ/ZQyphPolQ5v+cyn/DjT30c0/QnTstZ/V/0V8EoJ233OltzepsnzR80FvT4niR5IiCMomLkSRTgENTl1RxdDipNfsqNgnOL7eDzbjSZM4JgI/xwg4fs9PpioBQCodVJyObRnNFC7g+W3dTDVUasn1W+TtCk3C7cOaJ/bkJ5cRuVt0+RKR/A3Y3bL8ZdZWVtQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(19092799006)(366016)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1pNdWJZK3NJSlRzWE9EZVpLSGMwSGhGOS9odlhiUzAxbDZIMkZSb1JnOFJx?=
 =?utf-8?B?TUorWW5hVVNNY2EzZGJTeTBlUTE2MGl4U3plUGFJSjFjVnI0bDl3b1liZjBZ?=
 =?utf-8?B?VmhhdytHT3dlWWcrY3lYSCszSEdlbHBGYTR1ZFRpd2JlazUrTkhtU1JuT0lH?=
 =?utf-8?B?aG4xVi9mUDRuejUrTGlvVzlYam4xZGZFY0RscE5XbzloWmo0ZnBseWdkK1lU?=
 =?utf-8?B?STN4YjFVMlJwWEVTUm9aOHVWQ2loaWJCQ1pZbk1ITGtJanRxc0lGQk5ZUUFX?=
 =?utf-8?B?M3gxQmp6ZnhsckQvMjRqWUFKOWFkaFlXdmtJSkR4eHAvNUwybVhWWUNEQXhV?=
 =?utf-8?B?RXZaT0NPK0cvZXJrNURneXpNVS8vWWUwTmFqblQyT29FcURyWlJBQUYrTncz?=
 =?utf-8?B?Wml6L0VCdXc5dzlkOHBnaWQvS1I5M1dNZ1NIR3prUytGbTJWNkRhNEN4ZDQ4?=
 =?utf-8?B?NW03OEV1L2tqb3FCczFsajVMUldCZ3Z0YjUrcTFkaFoxdHVuNTFJS3k0YUM3?=
 =?utf-8?B?SGJ3MGpKcWVnYkQzMGExWXBJM0Y2K1Brd0ZCaW1lOGJBNW1uSEU5OHpLMXlt?=
 =?utf-8?B?UFV0OGx6SDJFSHpnU21TUXM5SkUyZExnN25kM21RWUxQY2tNQllXTGVvWmJK?=
 =?utf-8?B?cjVlelV1akcrcWgvVlY4MGhWY1E3OVJDWUErMXJWUWE1OFgxZW1PelgxaGJP?=
 =?utf-8?B?Sk5kcnA3UWczaGlaaGFHN3RVQm9EMU1xYXQvdmpML2pTVE1EUFUrZmhLbW1M?=
 =?utf-8?B?c3lUbHBlclBzbk9jK2djU0JEVWRzN0w3RWwySlNSRkJqaFlsQ3QrQW4yZUoy?=
 =?utf-8?B?Z0pVVTBiTGNieWtGQ2FHQS9nS0lMN05TNkQrSzVTMkt3TnJibFdRVG43TlRK?=
 =?utf-8?B?dW04bFp0cUE3SzFEdFlvZHF1R2xnUDR4Z0ZmM2RNMnBSUERIQU1YeFkrNndY?=
 =?utf-8?B?SDlrTFlhdTFmT3lQQVhONGR1dFQ2R3l0TytJK0xoWnA2NnlXWk91YllxZGFO?=
 =?utf-8?B?Q2VyNGkxZHMrU3JHaE50MnBKU1BUcERZY0FmNTF1TmxDOEs3Rm1ZU0ZRckE4?=
 =?utf-8?B?Y1NNM0hMNDU1NVllTXRyUkcyKytVWGVuZ3BORy9qdkNwaTZjQUU1TnRkdVk5?=
 =?utf-8?B?Wkh0aWU3WnpmOUZiK3hJWFg3aEt1QkdwakY4SnJ1Nyt6ZHJ4SUIrT29RTHYv?=
 =?utf-8?B?bWxCczFZYUpPS241c05oeS8yWWRUdkpXSjBFN2wyb0Zaa3JNRUJHV0FvL1Jt?=
 =?utf-8?B?MHFOaFdPalBDUlRYRHd6T0l2UytkZnloeHJ3T0hrTUU2U0ZIbFNYK3lyNTFs?=
 =?utf-8?B?V1RPeXEzRlRmVTZGVWhXeDRQNVBBWHVzeWd1UGRPOFpzNjlkcGtIVWRFRW9I?=
 =?utf-8?B?ZmNaZkQwUjJmN3M0dWg3WTIwOE5PZzFEbFBxRDRRTXB6RU1ndVk1SGRYZ0RI?=
 =?utf-8?B?RzhoZ216enEyM0pDRm1ERjBaUDVERnVKRHBOU0FJVnhQUFBEcHJhaGNjNzBp?=
 =?utf-8?B?VW5LUEVoL1BUOFdGamt3WDJ6MWdkbGdySUd0WWRHSVY5SENGdnZONVVGc3pV?=
 =?utf-8?B?SSs5ZnZ4SXFNODNrZDJJNUFKbVVTbExBemV5VytrV0Rud3BVU3NiYjZLZ1J1?=
 =?utf-8?B?dnZLRFVWV29aS28zME0zMTRVQVJ5ZVpVYjNQUUVUOHMvR0hHNmpUL3YwRVhm?=
 =?utf-8?B?b2huUDVUaTdneFBwMnhYNE43TVlZaVoyTXpQVGZ2ODhGeDg1akd6WmM2dzlD?=
 =?utf-8?B?a0lqckpabWd3aEVzQUc2SXAvRU1zTTRvZVQxeVBLMXNmT3NNT1VKakl1UnBR?=
 =?utf-8?B?eTAxQ3N2Vm5tMWpHZEd2TkVrZzZ3MHdQKzh5dllWWlZocTdQZklKcmxKOEVF?=
 =?utf-8?B?RzhvcGtIT2hCQ3BhYlBCc0svQWRnVnBMc2xNaWV0QTdacDJQM2hjQ1RaM2do?=
 =?utf-8?B?L1FuNGExSGppTmZKck1WeklsT09zZktFNE94SEcrNmE2S20zVjBYUUsvZy9z?=
 =?utf-8?B?K1J1d2NFYUliMWp3L1JpUW9uTVduK1JlQ1p1NUZmNkFIaGxjRG5HQnpMZmts?=
 =?utf-8?B?Wk1aT08xUUs4SDFOclNvMXZZdTFxWmJ6TjBvV09MeUVXNDdVNXlkMkVvRlRI?=
 =?utf-8?B?WWEvcHVZOGl3dEFTekxtNEtRRUM1dS8reTEwVy96OWZMbHIrcVJYdVZkb21r?=
 =?utf-8?B?U3MzSmk1cGNhSmVqcFFpMnFGT3lHMzQ1NlU5cE5FcG9ad05VNTEvUFhhbjZV?=
 =?utf-8?B?TnB6MWdwZnZzTnpNdFRpZmdBb2ROSnVQakpITUFLUGRzOS9JZEM2T2VaZFZ2?=
 =?utf-8?B?V01CK0FMVmZNOGpUZy9SR2VGTk9CaFVNWmRzNGFvODFsN2FqWmN0aGRaNlQr?=
 =?utf-8?Q?szIkF6OC+qLHwlak3LvI6mkAfbcyUxiLRQ8ZQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67b18d5-327c-4725-f2aa-08dee26cc805
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:29:57.4323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7aYPe8pjMZdPtQ3tbsXJmQITes0xRF9km7fYJi9ZLb0HKqZch53RzCrz2QvctzdsIlOEFW5hCt/5HUwQNBTqZZ5b3nnD9bHv7Q5bTNo2g9vDFbECS8ASrT2YriM+ie7s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9684

From: Peng Fan <peng.fan@nxp.com>

Add DMA channel (dmas/dma-names) properties to peripheral nodes that
were missing them:
- LPI2C: lpi2c4, lpi2c5, lpi2c6, lpi2c7
- LPUART: lpuart4, lpuart5, lpuart6, lpuart7
- LPSPI: lpspi4, lpspi5

Also replace hardcoded numeric DMA direction flags with the proper
FSL_EDMA_RX and FSL_EDMA_MULTI_FIFO macros for SAI (sai4, sai5, sai6,
sai7) and SPDIF nodes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 32 +++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf388..5438958176985 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
+#include <dt-bindings/dma/fsl-edma.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/imx8ulp-power.h>
@@ -370,6 +371,8 @@ lpi2c4: i2c@29370000 {
 				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPI2C4>;
 				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
 				assigned-clock-rates = <48000000>;
+				dmas = <&edma1 46 0 0>, <&edma1 45 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -383,6 +386,8 @@ lpi2c5: i2c@29380000 {
 				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPI2C5>;
 				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
 				assigned-clock-rates = <48000000>;
+				dmas = <&edma1 48 0 0>, <&edma1 47 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -392,6 +397,8 @@ lpuart4: serial@29390000 {
 				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pcc3 IMX8ULP_CLK_LPUART4>;
 				clock-names = "ipg";
+				dmas = <&edma1 55 0 FSL_EDMA_RX>, <&edma1 56 0 0> ;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -401,6 +408,8 @@ lpuart5: serial@293a0000 {
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pcc3 IMX8ULP_CLK_LPUART5>;
 				clock-names = "ipg";
+				dmas = <&edma1 57 0 FSL_EDMA_RX>, <&edma1 58 0 0> ;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -416,6 +425,8 @@ lpspi4: spi@293b0000 {
 				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPSPI4>;
 				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
 				assigned-clock-rates = <48000000>;
+				dmas = <&edma1 64 0 0>, <&edma1 63 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -431,6 +442,8 @@ lpspi5: spi@293c0000 {
 				assigned-clocks = <&pcc3 IMX8ULP_CLK_LPSPI5>;
 				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
 				assigned-clock-rates = <48000000>;
+				dmas = <&edma1 66 0 0>, <&edma1 65 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 		};
@@ -474,6 +487,8 @@ lpi2c6: i2c@29840000 {
 				assigned-clocks = <&pcc4 IMX8ULP_CLK_LPI2C6>;
 				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
 				assigned-clock-rates = <48000000>;
+				dmas = <&edma1 50 0 0>, <&edma1 49 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -487,6 +502,8 @@ lpi2c7: i2c@29850000 {
 				assigned-clocks = <&pcc4 IMX8ULP_CLK_LPI2C7>;
 				assigned-clock-parents = <&cgc1 IMX8ULP_CLK_FROSC_DIV2>;
 				assigned-clock-rates = <48000000>;
+				dmas = <&edma1 52 0 0>, <&edma1 51 0 FSL_EDMA_RX>;
+				dma-names = "tx", "rx";
 				status = "disabled";
 			};
 
@@ -496,6 +513,8 @@ lpuart6: serial@29860000 {
 				interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pcc4 IMX8ULP_CLK_LPUART6>;
 				clock-names = "ipg";
+				dmas = <&edma1 59 0 FSL_EDMA_RX>, <&edma1 60 0 0>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -505,6 +524,8 @@ lpuart7: serial@29870000 {
 				interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pcc4 IMX8ULP_CLK_LPUART7>;
 				clock-names = "ipg";
+				dmas = <&edma1 61 0 FSL_EDMA_RX>, <&edma1 62 0 0>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -516,7 +537,7 @@ sai4: sai@29880000 {
 					 <&cgc1 IMX8ULP_CLK_SAI4_SEL>, <&cgc1 IMX8ULP_CLK_DUMMY>,
 					 <&cgc1 IMX8ULP_CLK_DUMMY>;
 				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
-				dmas = <&edma1 67 0 1>, <&edma1 68 0 0>;
+				dmas = <&edma1 67 0 FSL_EDMA_RX>, <&edma1 68 0 0>;
 				dma-names = "rx", "tx";
 				#sound-dai-cells = <0>;
 				fsl,dataline = <0 0x03 0x03>;
@@ -531,7 +552,7 @@ sai5: sai@29890000 {
 					 <&cgc1 IMX8ULP_CLK_SAI5_SEL>, <&cgc1 IMX8ULP_CLK_DUMMY>,
 					 <&cgc1 IMX8ULP_CLK_DUMMY>;
 				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
-				dmas = <&edma1 69 0 1>, <&edma1 70 0 0>;
+				dmas = <&edma1 69 0 FSL_EDMA_RX>, <&edma1 70 0 0>;
 				dma-names = "rx", "tx";
 				#sound-dai-cells = <0>;
 				fsl,dataline = <0 0x0f 0x0f>;
@@ -814,7 +835,7 @@ sai6: sai@2da90000 {
 					 <&cgc2 IMX8ULP_CLK_SAI6_SEL>, <&cgc1 IMX8ULP_CLK_DUMMY>,
 					 <&cgc1 IMX8ULP_CLK_DUMMY>;
 				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
-				dmas = <&edma2 71 0 1>, <&edma2 72 0 0>;
+				dmas = <&edma2 71 0 FSL_EDMA_RX>, <&edma2 72 0 0>;
 				dma-names = "rx", "tx";
 				#sound-dai-cells = <0>;
 				fsl,dataline = <0 0x0f 0x0f>;
@@ -829,7 +850,7 @@ sai7: sai@2daa0000 {
 					 <&cgc2 IMX8ULP_CLK_SAI7_SEL>, <&cgc1 IMX8ULP_CLK_DUMMY>,
 					 <&cgc1 IMX8ULP_CLK_DUMMY>;
 				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
-				dmas = <&edma2 73 0 1>, <&edma2 74 0 0>;
+				dmas = <&edma2 73 0 FSL_EDMA_RX>, <&edma2 74 0 0>;
 				dma-names = "rx", "tx";
 				#sound-dai-cells = <0>;
 				fsl,dataline = <0 0x0f 0x0f>;
@@ -855,7 +876,8 @@ spdif: spdif@2dab0000 {
 					      "rxtx3", "rxtx4",
 					      "rxtx5", "rxtx6",
 					      "rxtx7", "spba";
-				dmas = <&edma2 75 0 5>, <&edma2 76 0 4>;
+				dmas = <&edma2 75 0 (FSL_EDMA_RX | FSL_EDMA_MULTI_FIFO)>,
+				       <&edma2 76 0 FSL_EDMA_MULTI_FIFO>;
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};

-- 
2.34.1

