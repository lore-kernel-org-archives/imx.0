Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013069.outbound.protection.outlook.com [52.101.72.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6013B6BEB
	for <imx@lists.linux.dev>; Thu, 14 May 2026 08:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778747217; cv=fail; b=S817oEiI3502ZhBQl+gt1hRDLhwlmPArqbOFjCzA54JCuO56/2dFsnBXXrex1OXazTPcqRx8ZRuR50zRQdmk/XiEfX/APgHKfccW4vw3sJycK1+NgGXrmAmxH9bnt5O9toMNioTQ4qz2qMuZSNxARd0mnrBn3ZjAVwlqtxfupsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778747217; c=relaxed/simple;
	bh=zZpj6vem+jb0wnu7GvQTFqAbkfQr8M43FO1xX/9I4i8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DJbtP33bXM39g9SpVS3UzltlWpQyDWxDP+lIlqTnN/c4jDPJBmYowyuNc7eguAL8krTX/6vgr6d2mC3R4A3RHUokjhBaqvwANoF/l8jLpm7qofzSMys0cvi24SpTj9oekVnsVyWVGadGH149NRjgKVacMlA1WQEil/4nuxoi0a0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WOeTp2Y5; arc=fail smtp.client-ip=52.101.72.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WOeTp2Y5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ckno8GxTLv/ngc8WRWwgP9Q6gYKnOljpFt2LlnFb1qEIPZpy9N4gWqxO23gSIA1No1mqwlCZ+BYp/xhFZvHi/DA72B0ENJFUdTjH3tYghuyWX6TBqYXGLgsfNvqSDq+TT2jOV4LIb688aIa8bOyVkNUGGuHaS28fpCgaP1WmC7hXyNS0dwxFvrT6vaWkL41uspesoMGHa+1XbE+wJPXnolLdRpQ31RtEGG0S8iLnrTOD8N7xONS8PkD231sP1QUWtzysPE3964WKqn9IZXiCvrf5MQJxDa6CvbdLqm49I4eGk1kJC0hkCE8Au4RF27qIh6+aeyMIxD+XLWrVM19jlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BYEaD/Jxlqzkuz1PpTcK5Kr2yxGtyvnpGQIDSCdBCg=;
 b=IT6kNYORogB/7SKUxGd9exocEcIuP1AWAVGKqBxneozVpTUJmPgxu7M3rFR2LfMuKbE6fXDn1Vf8B5/n0DHgcyNyx07jIgDVTgRlr5WO3aVvRqMtiWlQ279DEItyxrS7M7/esY7XED6jESZNFNf2cveilP1MKIckE3qR4EPHk/RnSSjKTR+0YV6WmMAIt5+o8zuPk5/wI0KQ/Ao6FLshgKVQjqMNZla8+/dkECXOgYsBU/gRlREzieeJ9HCIUOQxp8nKqPqEDMZJ8SlbBNRTqqWP+mMJy+jVi86jOkTlkmuueznhfnzSJn6v7qZvJhimCnXnEGUAVjl0BJ0xKLYWGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BYEaD/Jxlqzkuz1PpTcK5Kr2yxGtyvnpGQIDSCdBCg=;
 b=WOeTp2Y5YHnlwmJqQxitfvaPS/qk3i2USbpvlXAWg+dErHq2hbWEy5YKh6taAfnm6c8IeqjbvukqYihM+WlIfCpYFLEbhF7ug6EB3aVumGwR4o5VekFRUuJhsIjMjimL+6OUO58obuSinfIiZk2E68WeA3DNNU6oz/rpYRLymfvnl65wJbVZSG22DFWQ8j2GQxXIm88DJrVaLmB7I5t4lnOINh8gstMAbd8TrQja+4oo8jgoUPqQBr1w0l5wnrDT04s0F/T2s16cEfgAw6vpjfbFiwNANGgNKQ9a1t8Ps7JaQ/QJr6p/4efLpUZRdLYOCSKl17i+e0brORyhXqH6/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com (2603:10a6:102:1bf::23)
 by AS8PR04MB7719.eurprd04.prod.outlook.com (2603:10a6:20b:29a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 08:26:42 +0000
Received: from PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1]) by PAXPR04MB8190.eurprd04.prod.outlook.com
 ([fe80::4608:7dcb:899b:e4a1%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 08:26:42 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH v2 1/1] arm64: dts: s32g: add SAR ADC support for s32g2 and s32g3
Date: Thu, 14 May 2026 10:26:39 +0200
Message-Id: <20260514082639.1181240-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514082639.1181240-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260514082639.1181240-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::12) To PAXPR04MB8190.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8190:EE_|AS8PR04MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 267298b0-3593-4b16-e486-08deb192870b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|376014|1800799024|56012099003|18002099003|11063799003|22082099003;
X-Microsoft-Antispam-Message-Info:
 6CNmQ/1Ovsa7rS3RUDT5f22mhz4OAF/2dmkOk7TGQnqP0ZKin3ujJe9VdGYBDdE/RDAm+fv/+mPw3dhnmrxEGD3zBssVeFYELxaSGAhLGucrnibdL3WxS0CWNdTfb/ubyHGGGiqcQmnMQGWh+QTPjxA/wGstzjVU/6j9wA2zcZ8yQNsI6Xr+erlmYj3SEsuOVcQmtBQkmIZckEdMRnQDaNVSHx0f1cBzAENoijJCnR8TapEQ5W3u5QBHRUGIzNqgiIOSE/ZWIf72PwncfE3AW2oYAlnwkIHq/L3YDH7aCynjVVJN9zvVD/X96/7zTi2kUzNxG3S34o3fWV9ipUBnaUR2zw8lEuIPsYrUcYHCto4anTj/r3EeTzJ/NaNxVkNvHD1nOBHRvGaWXaUpeypwxq1Q3rS5vupBr9/2UqZ1i4FM0GOxlOp0YKyReKZEwz77WUBYTrL0gg2ky0+FOuK/6gAvFhCrOOOwhZOxjrljU5pDu/82GyIkUW10EtAS1roHY4XT1hazTxpJoyJEaInPEZQiRRDG9HQHIVZ7ABbfeFp/R3gXKvJDgmnORcs5Drmv1jeCM6jbCbU3lrzyeae8H57rLFvVhkUaFDl27pz67+YTtARX51mODvS8zfwcAQvKF8Y2KjLxLvk/ls6uYaO6HFYIrTtnD/5uxPfhK6usRUAGGJnoM2tFU+YODBH8ez/5
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8190.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(56012099003)(18002099003)(11063799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dDhvZHMwOENOTE9BVTlhZUpVY1hvTzE1aitQeUh5NnRiUDRNaCtaQ21BTlhs?=
 =?utf-8?B?Y1hhMkIxVm52YVJMM1pRM1VQYU96TmROV0tMVFFQNkZZblQ4QjdwWVpKUWhH?=
 =?utf-8?B?RXNObVJnQTZrQ0RPbFExNndvWVBIRDY2NHVpVjRnbFFZRGhkMEkwTmpPTzgz?=
 =?utf-8?B?VEJVTjdLcGNqdVJaMWdGOW9jN0F3MEE3Ty9aMjNscVFwZ1RxV0ZCcTlWcENw?=
 =?utf-8?B?V3gzeHR0OTBCUTBRU2JDWnRiK3hta2JWOHRGU2c3N2NmRWEyemJsRWpVUmd2?=
 =?utf-8?B?UWpRekVFNElHbUUyMWZsNnM1elZDUEJLbE5ISXpNYStpd01hY2JwbWs1NnhI?=
 =?utf-8?B?Q1F5akNENTg5TjhhSks2RlI0Q3N6dEYzLzZJN3o5MW0yQU5GbTFIMEtsUlp4?=
 =?utf-8?B?b3JCYWYzbXluNHBoL2VXM1VML0trNGdPTHNlalhhb3ZBQlltZFJQRWpRTVl2?=
 =?utf-8?B?Nm9Ta1U2aHVWczhsRXU2VW1ZSk41dE9SeVlwMW5FRjZ1Yk1LTFk4ZmZ0blRB?=
 =?utf-8?B?dEswOUo3NktETFc4TGJEc2oyUjVraElUbW5pSTZkUFVYbEQ0Y1Z5WnZNTVF4?=
 =?utf-8?B?NW9BOXB5RmtxSGU5Tmllb0lQaFhSTWxXRHB0M2xWeHhnWjVuVG0reU56TTA1?=
 =?utf-8?B?Q0h4a1hISExHbDJyd29jZ1piYXJzR1pmZDJKaUt3d0c5MkpBYllMaWxHbUUz?=
 =?utf-8?B?SjFyeEZJL2EzTlFaTG1mSE1xd2t6TE94c2xzeXNOR3NxaDJ3MG8rYTFNOE5V?=
 =?utf-8?B?dUd0b2lJMDAzTmN0UERCVllTcnlsa2xEMmRLME4vYlFON01vcEl3eUR2YU00?=
 =?utf-8?B?YVF1c0NndFM1OXp5RXhJTGp3Y0dQUTRGRWsxblAyNXFneGIvZ01lTER3RHhD?=
 =?utf-8?B?dURjdDJvTlNLYWphck1SYS9qVlU3aVpTVzY0SjR6QUVtaXZlMUgwZzZvQXVw?=
 =?utf-8?B?STZ5VFNjdUdWbXdKdUNtRUFaWG1wTHNBWFRMdllhcFRvbzJRbVQxYnpxWWQ0?=
 =?utf-8?B?RTZCeVM3UEV4WFRzYkJhNkFSTDViQW5uQzBLWXMwNE5uVkcvRThVdTBTOE8r?=
 =?utf-8?B?cVhTM1FISnExUlhjZy9vOVNuRzRVc2tMRWhpcHRqVm1TUTdodjg0VXRweFFh?=
 =?utf-8?B?Q2l4TTRGeVVrTXZVTC9DTUdtMkpLaFcyb2tmblZua3FhK0p6QlFqemd5c3hR?=
 =?utf-8?B?RjFYOVRud0RWTy9NUG91ZkZtUEV6cDNJQ1hrQjhveW9NdzkrUzQ1MlVaNnVD?=
 =?utf-8?B?UHZlQnZRMVFlQWZEZ2taYVFCMm00dGNxUmZrYlJFU1B6U21xdWEwc2dhUi9o?=
 =?utf-8?B?MlBzV0drSDJOd2Zra2hpbEhqa2FRNW1KRkYybndOeEpPeGNEckFJVVBXU0dB?=
 =?utf-8?B?SjFxN2lQR1RPS2pFOUZ5K2NDc0dVN240c3lWMmVGUEdERTcvN2h2SVc0dkF6?=
 =?utf-8?B?QjVRajMvS2JaY2NqR1lZUEluT3FHSDBoVVpnSHMyaUZkSDR1ZkNManpzZWZO?=
 =?utf-8?B?S2wrZm1mOUNFd0QvOGdaQnhDcTRrTUN4S001NnlJSmxPTzRlOHhzSHBCUVVj?=
 =?utf-8?B?cWZ5MjFlTEhYL0FiUUxKd0hLZW9uenlvd0tTZmRYenpPVE1ucW9UZlltTXVP?=
 =?utf-8?B?MHpXOHhZUUNrbUhUdFRXSUlSMXc1YmZKTjNkek9HM1BzelgxbUZ2L2JJbjJU?=
 =?utf-8?B?TDMyaCtTQlVmWlhleE4wUFA2VHV6S1I3VTB0ZVdQTjFZQnUxUFQ4M3Z0M2ov?=
 =?utf-8?B?TlA2Mk9ZY3ZvcHJSTmZDc2YvNVhUQ2pWOGJ2Nm1DMGprUHBmNXhxcGxXbnRT?=
 =?utf-8?B?Um94Z25PbHhvU2hoL3I2R09NdFpKWkdJYVpzd3RTb0pTUkNaWDFUT0xHU2Fh?=
 =?utf-8?B?b0VtMVorWGE2dE9mS25nTVNmSEo1SkZEeEgrMHBCbjZNZWRiUlF3M1hXclB3?=
 =?utf-8?B?My9CVzB2UDltelBuZlBROS9oeFMzL2lKUWJGNUl6dE1ZOE01WDVNNjRhZ2Zz?=
 =?utf-8?B?amRBSTFtSFR3dWtsWUlpYkNlcFk5VHFrc0NvOHhvOGh2YnowL05WdXBjeUt4?=
 =?utf-8?B?YndPVjUxSFhOTzZuYjU2S2RrR0ZaSmVFWlUvMlJvdzN1eXAvWGpOSnowNUVU?=
 =?utf-8?B?S1l2T1dCbCtKUGxsOVMwNGFackt2a2VYT3RUa0YxdkhtVi9BRVhPQVEycEtv?=
 =?utf-8?B?S0ZmM2QySlBycUluSVh0NVR3MEd6TzJZMWR2T3QzVkNLRUkvSmp6anVjdXgv?=
 =?utf-8?B?ZUhpcHFzdDRvNUdROVllSno3TFZJRERVd2RPMStPQTJ0bXloTmZUQk5YZ204?=
 =?utf-8?B?aHpDV0ZKTlEzUlRwaU43dWl5bmg2anVVaEJSaklJN0xzSmgxQnFsSEVMUGUz?=
 =?utf-8?Q?f2V33E71zKUR3ds/4PlSudRb7VmHxz1a9aaF0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267298b0-3593-4b16-e486-08deb192870b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8190.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 08:26:42.7439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b8YaFwc1CceRaHYFAV03fyql6WXbj6qMRg6Q75aqgavthlZsUQwLKfTUEeknlVolabJkPlQrPHc7w5aynKfA2GTuGpHFam+rnrG/LXNmh2l9snsYkUV59iz8YOc2YmgK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7719

Add ADC0 and ADC1 for S32G2 and S32G3 SoCs.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 22 +++++++++++++++++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 22 +++++++++++++++++++++-
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..6f1952fbbcfe 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -3,7 +3,7 @@
  * NXP S32G2 SoC family
  *
  * Copyright (c) 2021 SUSE LLC
- * Copyright 2017-2021, 2024-2025 NXP
+ * Copyright 2017-2021, 2024-2026 NXP
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -554,6 +554,16 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		adc0: adc@401f8000 {
+			compatible = "nxp,s32g2-sar-adc";
+			reg = <0x401f8000 0x1000>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x41>;
+			dmas = <&edma0 0 32>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
 		swt4: watchdog@40200000 {
 			compatible = "nxp,s32g2-swt";
 			reg = <0x40200000 0x1000>;
@@ -717,6 +727,16 @@ i2c4: i2c@402dc000 {
 			status = "disabled";
 		};
 
+		adc1: adc@402e8000 {
+			compatible = "nxp,s32g2-sar-adc";
+			reg = <0x402e8000 0x1000>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x41>;
+			dmas = <&edma1 1 32>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g2-usdhc";
 			reg = <0x402f0000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..5cfb37c1216a 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
 /*
- * Copyright 2021-2025 NXP
+ * Copyright 2021-2026 NXP
  *
  * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
  *          Ciprian Costea <ciprianmarian.costea@nxp.com>
@@ -617,6 +617,16 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		adc0: adc@401f8000 {
+			compatible = "nxp,s32g3-sar-adc", "nxp,s32g2-sar-adc";
+			reg = <0x401f8000 0x1000>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x41>;
+			dmas = <&edma0 0 32>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
 		swt4: watchdog@40200000 {
 			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
 			reg = <0x40200000 0x1000>;
@@ -792,6 +802,16 @@ i2c4: i2c@402dc000 {
 			status = "disabled";
 		};
 
+		adc1: adc@402e8000 {
+			compatible = "nxp,s32g3-sar-adc", "nxp,s32g2-sar-adc";
+			reg = <0x402e8000 0x1000>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x41>;
+			dmas = <&edma1 1 32>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
 		usdhc0: mmc@402f0000 {
 			compatible = "nxp,s32g3-usdhc",
 				     "nxp,s32g2-usdhc";
-- 
2.34.1

