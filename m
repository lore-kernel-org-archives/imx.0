Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC154189C3
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 14:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556531; cv=fail; b=CnIfqcxnCy0EXnvo2GkWRshXDkhkcTuCXN2/i7NWf7dEz24SHhudos/52Jqb+Ff2QoKs+KjEYxlxgbdrXwhxsE/Z/1f/pOAztGoSzZZyHojB1ztNJWSl6AU4DwaCP79eU0UigsNfOB6MH4rlMl+imCyN8FLyLjwOK7c7//0agMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556531; c=relaxed/simple;
	bh=pVF6HI5DU7bez5ywGne4ZKRgPokhDRjPg7kmhBu8DPA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=q/rVAM1vDeYbx4vcBbQ/b4++Ez8EsFMT0vGB7z+/4UxaM6Vj3flVUMqmhiK67MPsoE9Qzu+YOXTfDPHYnuRhZWJ9MUHBCqQ5Vw0o+U8G4lUVwuooe5A1DDFBMz/sGfSQOlqm9tHsZpn+cQg/ofO5j8SnRHr+ZYlbRmFTQaNXpTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sPn5Si0y; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sPn5Si0y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOKjybGfsEPiupeTYe+KUJ18iYQDtsW6556QOPK8WVyU85uO2rV/oAHyR/Jf8PpMM8C9QyYTyISp1D5JHqvuSiCCcIMUEPAdp5sos2ZY2VZHKRsuKJrRKNrX4fH5iN3/9g/XvLhJIZxjnZFT3ICT/Pkuvo59yh7qyB3KRrv5dDBUdmFyCLd9I+XsHHcuZgXVS46Uc9Eo4Fs+hIfGPfXQW7lC5cNOZMThswze6WJRCnBWmcnTsQY/jwulpRKy6iMIUZ13kmtCYjU2WosDsnVb6Zh3jYj/zndQRXuf2EIyah+XsxF+sU2ufsrKuUMXgOSxmGKMhk75MFi+tl+rJ/rFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qdr1FcK/uVsM7RG6gsr47lBHCOIxrdvDXXGAObSEXDA=;
 b=WDiReblHF3QP4ihZcUxUMM2nRVIxc++kzDXXG6NnR8LLDYnDpTWS1PbK8uicTtyfSqHlB4bLUL2AKdAoVGuEOM0ChFXBzhi3A5HFEWy+qlJ8Ne20UT6upTpef3ZFBzKEPnctvZwl60aBNQhwHE+nlGgp5lYzvXtBbx6QhOfxXHoKp3t+7oJcv3/khRXe7X5wxerVpuscsYUp9P3wyXx4aMfEJtzujSKQeSsYzqTx+kqlYmUsPBDp1R09fMiZObFK5WU0WpYqimzZGptFV9B0XxGLCka36BBsS1zjUN+yj8sNR9MBBX+/mi/6LyDnJELdKSDWcyjgS+y3sHcSpkHGUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qdr1FcK/uVsM7RG6gsr47lBHCOIxrdvDXXGAObSEXDA=;
 b=sPn5Si0y9TnNSpNPqyRUYLzN/fzHnnUAAOkupbLAZGRmDtdJSQngjfq3zUfhqo8gFNpBDXFoclh+peU+y0uKvj5ipEPnOd8T95+y/iziZDKRClsmHxPjHJxgEkiXWGuMtJgcn2AreZ+4KdioKtiYQ7v5WI5y1Rhgj1hwrGKwFqSSJdqR6ttGxMuuYx/R8kbt5bYJg2ptqjhaZLKmw65K68yb7Rd2eA3FoWIka0JWMv8HnLsAOvyJrGo/pUNe6Il4u6Zj+4TrfCR4stCueej9VJ6iHbN5Byr9iISctJWgk1gXN3hY2wIvvHzVldD0Zhh2cwL+lGTEEoCSZwCnLo6Mzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS4PR04MB9412.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 14:08:46 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 14:08:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jul 2026 22:12:09 +0800
Subject: [PATCH v2 1/9] arm64: dts: imx8ulp: Add DMA channel properties and
 use eDMA flag macros
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-imx8ulp-dts-v2-1-d05c67676f53@nxp.com>
References: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
In-Reply-To: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS4PR04MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 278dac7d-da62-4185-dafd-08dee6686a19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|19092799006|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	RJ+WNdAN+E8yL0H85dYWjtZVDaGjOFXq8HHfl3LW9hfKN01bORKWbhyJdrwUOJGJLPVn4/scIGRr+fcL7Xeu/X+XPKhcPR+CTNz6UPmw91Y/Dtflzzd7AKyKATCC7/xp9lYyTRhH+P3NsXN4jg6N49Q+b33jYzDj116NMcp+JQA0nPb08881zHWIFXBvwpqbKKnYhhzr9KjX2ad5fI2iS7iyNKq3pMXUNEhKMgIKJ/4gcZR6cHZgxewFftvmIBFyhevB8UbPhL9Xmtmall6N1LFRovX3F6f/l/EqPtDc+S4IKvm1k83vHTVZvouCaoQLKAqOzq4ZJTJK06/EUA8g39Rc6GrFPJoRtpRrXZ//EOrYFhax8uRbHRm7S2jTpDuuajg9gJcwKSfVE7K9CLOQpvIKn8MCEu6QQWhN6oqwIFYdYCCj7JjQYl8KxwgaxbNmgLKjD36f+iK/+9PXOizp9/YhYSnslbCBe0Vg1Su9SZlt/GTBZvYVLDN09kgFDcXhGXWSdxpM/D/vL48KnpefX0XQs7CRm0Da5yhyLNyrX3SY3U9l0145tIJtPZDhDczkeGYqGe+mXH5H3yN7p/7ak5NxMMgUmqMwORqirEEYXGLBecBbYNdezEQG+QCCjvP5ZfG/yBC9dEROeJOKOPcC5ERWB7T4ysiTnLm8643Z5V4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a280SnUwTGFVMy81bUkxeVhyM0tzQ1AxV25sYlhHWUlhTG91b1Z2MmhMUXhh?=
 =?utf-8?B?TkdTeUlhc0VIdVhYV2pYSWdWQ0FVdkd4L3k1TERrTXZyNWlNYjd4UkdDUXMr?=
 =?utf-8?B?Z2JMcnNPSTNZTVBhOENhN2RDSW0xN0NvU0poclg2a2oydTN2Kzdtd09NZStH?=
 =?utf-8?B?b1FHT3Z3WDVPbnRxSU9xWkVmSHVoMWw1R0dXeGdjZlNBZHByUENaWWk4bGhn?=
 =?utf-8?B?VFBFM0NHK1ZtdkRGK0tHQ3Z6MGdhMHhib05DOHZwQ2U4bEp6RmF1NStrM2JG?=
 =?utf-8?B?RnJkZUEvaENPRVJQREIrbzU3NFhiRU1TOVk5bm5FK1lCdUJuMDNvZjdKSG1Y?=
 =?utf-8?B?aXlRRUZoS3c1VUZna0tPR1o3cFJRM0VST2M2eHpYNkR3ZUZ6SDRiczY4c0F6?=
 =?utf-8?B?bkVTb01CZWh3a0NWYWR4TzhiSFlldm5pSHlvRDUvTncxOGhhWWFJVlNTL0Nh?=
 =?utf-8?B?WEc0SEwrd3Q3WE55T1BWaXh1YTJMWU56R0ZyT3hQYTlVS0xoN0xIWkxkeGda?=
 =?utf-8?B?S296YUVZT1hKWXd1TzFhS2xvNUFPRnVQOXNnTktQeFZVMHpkSEtEWnBYdW9C?=
 =?utf-8?B?cllLZUw0cUs5MFovV242VkFkcVVVY3FmOTV6QU1wVXBpdnpqTzVEVFN1ZUt6?=
 =?utf-8?B?a1hjRVpvMjg0Rk9hUzFodks5YjlGR2hvck14Z2x2c3ZCTWpoRFB3R2s0V2NL?=
 =?utf-8?B?MWJndjA3UFppd3cyazFuOWVka3VrTGIwOGxaZGFkQURtYjJzaU1qdVB3TE1P?=
 =?utf-8?B?aTcya091VkdFem1iQ3hBZ2FsOVhQUUw3UExrWjdmWkhvelhPeUphTjI1aFlU?=
 =?utf-8?B?cnorMGFqSEJLZmJDbGJCM2UySndDNGt1M2p1WGFFVVRiNkwxMGwzQzhNcXFG?=
 =?utf-8?B?dVVTckl4RjVTZjh4M3NEbjVnNC9jaFZJUHMwV0kwak1seVVORHgwT3lTbFhR?=
 =?utf-8?B?TkFxSVVvdE1WZ2VCVWxEMlB5emE2NVRSTGN2UFQweXlGREF1WUNBM05jTGhX?=
 =?utf-8?B?amNtRTR5aFBKSmd5dUpOR1FxV3piOStTVW1abCsxOHExRkd5enI5b0xYSGJC?=
 =?utf-8?B?YlFWTThZZUlwdzh1Uys4MlM3U292VzlsTjgvZUlYTVBId2MyQ1dJZDNjSWI5?=
 =?utf-8?B?bTBXWFZDWDdEQjJodmhtWXpvVWZKeEZ5bHdpN2g3cUxlN1JLeStLWUR5c2F1?=
 =?utf-8?B?L3BJOXc2eDBBTnJCYXhYM0haR2Y1bVRMVC9TdFIzdEh4RmxlSXNJMUNwNklu?=
 =?utf-8?B?RzBFa3IrMkcrejhmbVNPTDN1R0pzaTdWbHFPeCtTZmpiNTNkV096SHgxb1FT?=
 =?utf-8?B?NTlXazY2RHM0RWNMcmdrOGszOXZZYWlabWpoeWJneG96NlVRVVpkSEtSRmRF?=
 =?utf-8?B?UFVRUmpLaUJZak03V2M1QmN2dmlEcVpDaThLa2NOYkozZVFpaUhQZ2NXOXJL?=
 =?utf-8?B?MmEwalMxaWtiYkhMNmRlS2EyYW1zdUdNeVVndEQxRk1FNmJWQ2xEVnZZRkJZ?=
 =?utf-8?B?d3hWTU5rRTh5YkhZdEZqWld2RVFJdjhsK2FOMUhrNldYUmo4Y05SMzRra1Bk?=
 =?utf-8?B?WDllUXg5L2c1UjFzM3VNR25RR25hTHhqSUNJNXZiTGUrM2kxd3JuZ0xVNDky?=
 =?utf-8?B?a3NuZEJrRDJoeW1FQ3hhSVdtbG0yTzBNVmlvSFVHUmdtU3NPd1hvZ3NBMHcz?=
 =?utf-8?B?RDNXRlp6QzlIMktlT2RuaC9OS3R4UmRhSHQyN3hXV3JTWkw2TmpHbUxMTXJJ?=
 =?utf-8?B?aWdoaU5PMTduYWw3ZEJGODJJU0w5OTRKMTRlRDJxcm5MYWJqVWpYVlZBaDBt?=
 =?utf-8?B?clNtcloySm16NGpCYVdKaStVVkZCSWdzbXAxM0FxYWFrQnNHQWtETGZ4d1pJ?=
 =?utf-8?B?TXNwL3VzSU1uL0VGKzRWWGpLVzdhNmthdzZpMWNPNkwzRjQ5eTNlQnJjSE9N?=
 =?utf-8?B?WC9LaFE4NTh0OUhLbmlpVHZCSk5CckdQS2RibWgzWmNVRjdmSW9UT1FDOFly?=
 =?utf-8?B?Z09qVmI1WmpjZ0NyM2Rib2c1ZHdiMjMvSnI4cXVWTkZ1eEFBbEZvLzQ2TTlj?=
 =?utf-8?B?WStPN1lYOFBxWEN0Q0ZlOVRHYWlUdFhMTVRHR000eTQxbkZVZ25mMXlXY2Vv?=
 =?utf-8?B?NFJnR0ZxSTdsOFQrNEo2cmwzOXoxWkZPdTRZYXU4RzNtWTN3enhrNnFJRE1M?=
 =?utf-8?B?VjR2L1lsb1pMWFFCeDF2aTZWZGUrSEhua2FwVEZHVzNiY1g0TUdqSGhaUis0?=
 =?utf-8?B?dG5RaVYvdFIyQWZuK2ZaSms3L2hCRUJURVhiZ0luK1owd3ZKLzdWOUh4bVVj?=
 =?utf-8?B?TVpCcFBsT0FWbUlkc0N3YmNrZjk5MkFPbHNQNWsxWEZ0VFlTSlNIbHEzUzNs?=
 =?utf-8?Q?182FTAvNHYUfy5uH2RxhUAGQQEIobScEx43b2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 278dac7d-da62-4185-dafd-08dee6686a19
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 14:08:46.6991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tRu5hql6Zls5t4hoPodk3stfbdYcWXe6tNFQMegKjAQtFSDj+/m99zESFihPeS9mXxtnzufn6dfrnKxAnia9RjWvaYk/dGkKy5qRmU5dq8wvdjitAJr0I0msl1lRkz2N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9412

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
index c6d1bb9edf388..1ab4ab270dc2d 100644
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
+				dmas = <&edma1 55 0 FSL_EDMA_RX>, <&edma1 56 0 0>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -401,6 +408,8 @@ lpuart5: serial@293a0000 {
 				interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&pcc3 IMX8ULP_CLK_LPUART5>;
 				clock-names = "ipg";
+				dmas = <&edma1 57 0 FSL_EDMA_RX>, <&edma1 58 0 0>;
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

