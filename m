Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70DE19D07E
	for <imx@lists.linux.dev>; Sat, 14 Mar 2026 12:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773492678; cv=fail; b=csfdQYRRzTkb5uSR70EFWmTyhwMJI7i0nFdgkN54w57SUbShlPPJhYGMirxZBo9sfaHDtu6G645ArtA/v4UonTDqRAok1uuay/g0RMpnmKar5C7cxrX0BgOWYKUhkSTP7Hx4OJeCWKlFfIEBi13/eQWOCcvvNZ1oYJwxQJSQ0sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773492678; c=relaxed/simple;
	bh=8PFnVA0eZO6Zvvrm6ZISjgQVlbIgensMhv+uVbo+v+o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FZcREcswnM9y568Q/eYkM9iYhdODKcOTWHLZchoXAipEBqE/T+beEYIKiWZQfw0FlQzR2oJ9iu+dj86uCcvC6POgr7WpjFPmW5MC4h8a/GkUDkW8ol636MkouxyxU5MqnQuqTGkcaWdw8I7icY+tr7gqKJh58tlwzoAR9Cm0t18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pttWsSTX; arc=fail smtp.client-ip=52.101.83.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pttWsSTX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhPNhLfxXKLixjKA5fy9+VQcwqmZn8X2dIySunBk/oTQDiQO26feKXGoDKjkypxN9DzISWR0FECjR5hkwZ9sWi8njLAAAxL4kR4RWKG1Ewwgv/h3xrwBp9msanYbPVdl985A5a+66mJWkKA38MmkW6Ly5voonx1gISqIProm16BWLyJSQyTEBQuYPR/VWPR4PHARgDm3OQPJhIUFIlmXpoG5FQYUgW4hkuei6yDbat9cJMLKd+Fy+HbdnrjHjWXZGEDujjcWsBRqdzaFgg/Cq0TdojDj5m7XGg+F8jOYoLR52/ZH/Nay1ZS14DWehXw7FcHIwhPHZ+Wx0OQHKkC5Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3s/0zEaIsi09bd/5xef3yxr8t03s/Yatyy4g60NmHo=;
 b=vcVLn6kVTAQEJLZt+4QyowcYlc0ssA6z4gsn9H+m1GEy/d5cf8z4i6AAJzn9syfIKoj7BPoo+mPUk39P8YVVYZcFox+HnXNOuoQ9qi7kfSqHiflF/zKGM10In3osBdzpkXF84DfZwbxGFQyS0gvq8q3hrKeAC2g50hXOYdNAVBz6M01sP1R4uzgmk7tk5KlL50seG7tPcjhj3518xoSY3KYLJyVhXE/6B0svOp8BAc/EpjEBFaTgfynrEdjnO8hQytByqj/1p157jL+kFMrlh3sELjMrCVizVaBR4iQm9wt2rf9BI/jO+Xcde3E6P4PUVE0BTMrjWktfVzfS2HbzHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3s/0zEaIsi09bd/5xef3yxr8t03s/Yatyy4g60NmHo=;
 b=pttWsSTXZweQkotOrw33DfI7Nc0uAalHeaGvW63YwDsDB2oqBbgy31KN9nEyFQYynT0s0ylnR7yz51HJFUHxbJ8IZ3apx1caOAzTXk68G5fiZV+TcnqZ0Fxc+0LLTapSorHLZAN0CyLaU7KSG+o1VgQvexqdq3Sdw6ZLhV5szctG4UUYxnbJKfJirfEMvypaL+7p1gYdnUGtvWZOJk2WAc898v2MKOPWr0PAfzATREHZRNlSCCjzqEql5qLaeKGRxYT60RvK+8zWN0Bog1P81/3tg7Ljou0FxE1S9iu8ZCNGfzGkgKJFvSaIhtHOiPpN+3Gdc5vGCEp1+cwTeilTkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7802.eurprd04.prod.outlook.com (2603:10a6:10:1f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:50:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Sat, 14 Mar 2026
 12:51:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 14 Mar 2026 20:52:38 +0800
Subject: [PATCH 1/7] arm64: dts: imx94: Update pin headers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-imx943-dts-v1-v1-1-3ba9b426863b@nxp.com>
References: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
In-Reply-To: <20260314-imx943-dts-v1-v1-0-3ba9b426863b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: cb293f5f-e5f8-4e79-8255-08de81c85d64
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|19092799006|366016|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	wSr4zFxYgdTRReoClexu+AVpVlLRY2dMPon40pHJRZTtZ/GliX6e8RFRa8ElxPYzrgiA5paxHsA2Y0L+RlEykd83KBGINtcHqCRQYiRIRG7XIK+ADfREPh5DbgrsANV/YlBTFp+lRf6p66eriWZaV8n93NFsceg+VlDyP4SPpQFAtLIjBETfziNgdRHmuWpzPTooF8JGnddXzZ5DEN13vie4MWjjc4n4jmzTFEv58PljvDgQr/vRv9H+9kTjd+aU2k/dVBrDBr3t5qMA/ZL83i6DBsRhIRMwprUPM68RBPVnYAv47gM43ICjeCynejQdbp8vdDUE/pElTXXBCLDP2JFOHmY6w62zIURgeQEZHjVYbRkP5mJlGoJxdzedd7fLHwuNUs8R4d2wSR9SGgvnA0k3yJof24A7ThOD4nKQVWuHyyMGc8y8Fk/+LVdUZKZOk5VpVvDY+InA/ZbPWazcAF5I1S0kbAO6p2WK//eaoiZYgNNUtNVZEqUq8Ut3xPDNC0Szi2WQmalSKDcalVuJYLAlj/uCF/VpBMRcut24fMyL8qOQWTcftPG7jULkz1/y6dlJPomrcvL++/mgYoqn5KDIIF33VAD2LYDY0dmfJT9mbOVp2Mx/HK4oikP5GlwxsLWjTClVkf52MaqDuxUcfzGce+g1R9zMOLoWHi4zOPlltFjAngggSeCpc1PmjDma6JHI1H0xGJ2djiHSJtAEjDiD/XgpfSFivcqI9RZOWvZgLv3VdZuxLGXN7LSLXn58AnBVYV8YellreGeTOKRTHA947snSlGXMI4MNLkeDonI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(19092799006)(366016)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXBaQ3loaTJtcmF4MW1Tc2U5eE9paXBCbSswOUxLUlkyZVh6TVFNb2VIZ2wx?=
 =?utf-8?B?Yy8zZ045bGNUVEovZDZNS2JSTGRqNUtrQjk0ZTdKbXlxQ01oNTlRWWcvbWhI?=
 =?utf-8?B?YkZzQ2tVdVJ0dkFBMzBzenk0dldkVWsxSGJMOTVVNWF0bG9nbWNWWWlwNkwr?=
 =?utf-8?B?TUNteGhHQjBwT29obU1WYWhMcUo5bUN3QkU2US9VWkRXU0NsdXJoVjUyWnJ6?=
 =?utf-8?B?eTEyN0c4ZncxSWt5RjZDRkJSWVhNNEp3YkFEekNoUWlVVnNrUkwweDhuUVFQ?=
 =?utf-8?B?KzdXYkNwV1g3WTEvcUR2MkUyYitDNXNxNmVkTlVFR2RkUGo3YStWVFRuODJE?=
 =?utf-8?B?SWdqOXdRSW83QUdQMGdxdGtvc1ZaY1EzWVVydVhJZVJDb2xzdytXcmtKTURH?=
 =?utf-8?B?WlFIZEFEb3gxK1A0a1dyR000a3NxTXFNeUMvZGRWK3VXblpMb2V2MzhCOE1P?=
 =?utf-8?B?K2lBNXA0MGQveHNYaTZmN0pIczF2YmhWRmJGL1h0VTdSbXZyTEFVaE45UUg0?=
 =?utf-8?B?aXE0UEh0LzNrM2Rpc1MwTEc5aHBZd1Y1VERHa2pPamlEMkFwNHI0WTVvU0JU?=
 =?utf-8?B?KzJSejZNOEltc3BOMmdYYVRJTVBEU0d0aytWUzdzNTJjdlIyeGM4OVpYS2NR?=
 =?utf-8?B?cVE1K2xWeSs5ZlFjeWJWZXdVbzMyd1NBNjJqUDBhSEozQkV0ZG5aZkk4U3dJ?=
 =?utf-8?B?clg3eWhlWS93bDcvbGorcndVYjdqWXAwcHE4V1JWQUtiYjZHMmM5Zkk0ZllD?=
 =?utf-8?B?Y1hiajd0MjBhU01OSWt2VmhJQklXT0FGTXNlZ0IrWjdwK1BHU1RMT2ZucUR3?=
 =?utf-8?B?Rk1SdUUxZHJFdm1KYkFWZ0lPaXppVGhzdm9paXRNc1Qzemo1TmRuRW1LOENC?=
 =?utf-8?B?OE9aNVVuM2xWTFBpMWMzOWU4SFlCUXBrMmg4a1cvd01vNEFsR2F5TCszUFRW?=
 =?utf-8?B?K1kvN1ZtVzM4d1dPaXI2bm9PYlRxaDhKWm1yaHVkMktMbENHM3hkZ28vUlZN?=
 =?utf-8?B?RzRCSVZjUzVqSTRoNk9MSWlDdTNTTkhhNVBUQmFEanJVZ2J4RWdyc3BURk54?=
 =?utf-8?B?RitxbjBIWURrdUpDc3V5VzBIeGczYmJWL3JQUjhpcnF1NWM0WldXbHpLejJY?=
 =?utf-8?B?UFVyeE41UjNMdTFycG9hRTNFWU12SkFwUi9MM0ZZR204VlVvSjlCQ2RvV2tm?=
 =?utf-8?B?U1dTZTF6Z0RubDdqcjN6dVloMDFwQTRlN21OSkx0OW9KT0xiS0lXL050Y1lX?=
 =?utf-8?B?RTVSMDd5ZndoMWx1cFYzOVZXSXcvUEVCbU42ZDZkbGtYYWJ0ZTB0R2dHOW8v?=
 =?utf-8?B?L2FIV2w2RnVlTlNpWmUwVkRlc2pIOCtmZ1pCUDVhblM4cEV5VVB3MEh1NTNl?=
 =?utf-8?B?bmttaUUzWGVub0JmeTl0S1RPL3BiV1RCeURxZ1NTSjNRSG1uVWErV2FKUnVp?=
 =?utf-8?B?ZGlQSDJBN2J2KzloNEYvYW42cnRFVG5zWHZqdTZ1UklWTmJ5bFRmc1dJUldC?=
 =?utf-8?B?dTU3OVNHcWxaL2Z2T3RWOEJPSTBUdDhYZEtVblZtT243MjdsazRhN0xQODg2?=
 =?utf-8?B?OHZOMDE3NlR2RmJDOEdxSFRhV1Yrd0MzM2RzVk9nUCs1RVRQL093SmR3Q0Ez?=
 =?utf-8?B?ZlhpVGorNGs5bXJEeFdmNTZyaTF1Z3oyenJiZlNuMzlPc0p2MFZSc3NyUFEy?=
 =?utf-8?B?d2I4UmZUWWhGMlFCUEZDbHY4QXJZQWJkWlBPTXJNR015eGpaRkx5Z0VtWURO?=
 =?utf-8?B?enhQd01vWDA0bi9YOEVPOTh1NjdxK1lXN2QvMy9tcDVWWUZ0b0NHL2VXT1R0?=
 =?utf-8?B?d1FLbGtjVFRlb1pBa0RmZ0pXbEhwTG9pMzQreFV6dFNJZUxsWE16ZmlqVWpK?=
 =?utf-8?B?cXpvL24zQzNKTzFjS3RFK1pvSVg0UFU2bTJpQVNJczBWTjJxekMxanI5UUFD?=
 =?utf-8?B?SFBvb0t6aTRhMGI2UFhGT0Y3ZWh6Q2VwcjVraTBvTVhCdHdxTjJlUTBSKzZy?=
 =?utf-8?B?akhMQkcxYWorc1ZzT3VieHlac1BzVFB1VnJhakliZ3ZBSDdTUjU0WDVCdXRK?=
 =?utf-8?B?b1htaFpuVGtsWk9SVHcvajBKTGxMTExQOXpaVFJIeEZSM1YxaXcwNkpMbjJv?=
 =?utf-8?B?WFNQdjdiM2RwdElOdXdrRjNDWUxGK2hOaElGb0pPZDEwSUVGN2tqUE55dGNJ?=
 =?utf-8?B?S3ZKZW9YY1Znck1oVXRvR3EzVzJWRFZxbi9iNmJZT2NHYXNZUWxnNDMrZXlN?=
 =?utf-8?B?N2NFWGVMd2VoMXpmcWh0V3k1R1lmS3FlaWJEWTRxZjNRWHVJanVKYXd6ZzIw?=
 =?utf-8?B?UVJ3a2ZiaXFnNVc4QWQxU3ZxSzBYTXJrbktlTjEwK0w2RThKSTUydz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb293f5f-e5f8-4e79-8255-08de81c85d64
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:51:09.4614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pUJtIJLc2FEaVbqvo53KVJtsdnCDR7a5WFAWNfF/A5tgveagL1ESnWjla4TaRk/IcvkP9DsfGLfqQO56Rs1Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7802

From: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>

Update the pin headers to include pins that has special mux options:
The MUX value field in the IOMUX table is extended to 16 bits where
the lower 8 bits represent the current IOMUX value and the upper
8 bits represent the new extended mux.

Signed-off-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94-pinfunc.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94-pinfunc.h b/arch/arm64/boot/dts/freescale/imx94-pinfunc.h
index 00255db89185260811c4b6b50ac3980f18e69141..2481053c3ba7b93085357df318d9655b9293be70 100644
--- a/arch/arm64/boot/dts/freescale/imx94-pinfunc.h
+++ b/arch/arm64/boot/dts/freescale/imx94-pinfunc.h
@@ -233,6 +233,7 @@
 #define IMX94_PAD_GPIO_IO17__GPT_MUX_INOUT3                 0x0054 0x0358 0x0704 0x05 0x01
 #define IMX94_PAD_GPIO_IO17__FLEXPWM4_PWMB0                 0x0054 0x0358 0x06e4 0x06 0x00
 #define IMX94_PAD_GPIO_IO17__XBAR1_XBAR_INOUT31             0x0054 0x0358 0x08b4 0x07 0x00
+#define IMX94_PAD_GPIO_IO17__XSPI1_IPP_IND_INTFA_B          0x0054 0x0358 0x0000 0x0100 0x00
 
 #define IMX94_PAD_GPIO_IO18__GPIO2_IO18                     0x0058 0x035c 0x0000 0x00 0x00
 #define IMX94_PAD_GPIO_IO18__LPI2C4_SDA                     0x0058 0x035c 0x0738 0x01 0x00
@@ -242,6 +243,7 @@
 #define IMX94_PAD_GPIO_IO18__GPT_MUX_INOUT6                 0x0058 0x035c 0x0710 0x05 0x01
 #define IMX94_PAD_GPIO_IO18__FLEXPWM4_PWMA1                 0x0058 0x035c 0x06d8 0x06 0x00
 #define IMX94_PAD_GPIO_IO18__XBAR1_XBAR_INOUT32             0x0058 0x035c 0x08b8 0x07 0x00
+#define IMX94_PAD_GPIO_IO18__USB1_OTG_OC                    0x0058 0x035c 0x0000 0x0100 0x00
 
 #define IMX94_PAD_GPIO_IO19__GPIO2_IO19                     0x005c 0x0360 0x0000 0x00 0x00
 #define IMX94_PAD_GPIO_IO19__LPI2C4_SCL                     0x005c 0x0360 0x0734 0x01 0x00
@@ -251,6 +253,7 @@
 #define IMX94_PAD_GPIO_IO19__GPT_MUX_INOUT9                 0x005c 0x0360 0x071c 0x05 0x01
 #define IMX94_PAD_GPIO_IO19__FLEXPWM4_PWMB1                 0x005c 0x0360 0x06e8 0x06 0x00
 #define IMX94_PAD_GPIO_IO19__XBAR1_XBAR_INOUT33             0x005c 0x0360 0x08bc 0x07 0x00
+#define IMX94_PAD_GPIO_IO19__USB2_OTG_OC                    0x005c 0x0360 0x0000 0x0100 0x00
 
 #define IMX94_PAD_GPIO_IO20__GPIO2_IO20                     0x0060 0x0364 0x0000 0x00 0x00
 #define IMX94_PAD_GPIO_IO20__PCIE1_CLKREQ_B                 0x0060 0x0364 0x0000 0x01 0x00
@@ -413,6 +416,7 @@
 #define IMX94_PAD_GPIO_IO37__FLEXPWM3_PWMB2                 0x00a4 0x03a8 0x06c0 0x05 0x00
 #define IMX94_PAD_GPIO_IO37__FLEXPWM2_PWMX1                 0x00a4 0x03a8 0x06a4 0x06 0x00
 #define IMX94_PAD_GPIO_IO37__XBAR1_XBAR_INOUT13             0x00a4 0x03a8 0x0890 0x07 0x00
+#define IMX94_PAD_GPIO_IO37__XSPI1_IPP_IND_INTFA_B          0x00a4 0x03a8 0x0000 0x0100 0x00
 
 #define IMX94_PAD_GPIO_IO38__GPIO3_IO6                      0x00a8 0x03ac 0x0000 0x00 0x00
 #define IMX94_PAD_GPIO_IO38__NETC_1588MUX_INOUT0            0x00a8 0x03ac 0x064c 0x01 0x00
@@ -574,6 +578,7 @@
 #define IMX94_PAD_GPIO_IO55__TPM4_CH3                       0x00ec 0x03f0 0x083c 0x05 0x01
 #define IMX94_PAD_GPIO_IO55__SINC3_EMBIT0                   0x00ec 0x03f0 0x0000 0x06 0x00
 #define IMX94_PAD_GPIO_IO55__XBAR1_XBAR_INOUT19             0x00ec 0x03f0 0x08a8 0x07 0x00
+#define IMX94_PAD_GPIO_IO55__XSPI1_IPP_IND_INTFA_B          0x00ec 0x03f0 0x0000 0x0100 0x00
 
 #define IMX94_PAD_GPIO_IO56__GPIO3_IO24                     0x00f0 0x03f4 0x0000 0x00 0x00
 #define IMX94_PAD_GPIO_IO56__NETC_1588MUX_INOUT6            0x00f0 0x03f4 0x0664 0x01 0x00
@@ -592,6 +597,8 @@
 #define IMX94_PAD_GPIO_IO57__TPM6_CH3                       0x00f4 0x03f8 0x084c 0x05 0x01
 #define IMX94_PAD_GPIO_IO57__SINC3_EMBIT1                   0x00f4 0x03f8 0x0000 0x06 0x00
 #define IMX94_PAD_GPIO_IO57__ENET_REF_CLK_ROOT              0x00f4 0x03f8 0x0000 0x07 0x00
+#define IMX94_PAD_GPIO_IO57__XBAR1_XBAR_INOUT21             0x00f4 0x03f8 0x0000 0x0100 0x00
+#define IMX94_PAD_GPIO_IO57__SAI3_RX_SYNC                   0x00f4 0x03f8 0x0000 0x0200 0x00
 
 #define IMX94_PAD_CCM_CLKO1__CLKO_1                         0x00f8 0x03fc 0x0000 0x00 0x00
 #define IMX94_PAD_CCM_CLKO1__NETC_1588MUX_INOUT8            0x00f8 0x03fc 0x066c 0x01 0x00
@@ -619,6 +626,7 @@
 #define IMX94_PAD_CCM_CLKO3__GPIO4_IO2                      0x0100 0x0404 0x0000 0x05 0x00
 #define IMX94_PAD_CCM_CLKO3__SINC3_EMCLK3                   0x0100 0x0404 0x0000 0x06 0x00
 #define IMX94_PAD_CCM_CLKO3__ENET_REF_CLK_ROOT              0x0100 0x0404 0x0000 0x07 0x00
+#define IMX94_PAD_CCM_CLKO3__XBAR1_XBAR_INOUT24             0x0100 0x0404 0x0000 0x0105 0x00
 
 #define IMX94_PAD_CCM_CLKO4__CLKO_4                         0x0104 0x0408 0x0000 0x00 0x00
 #define IMX94_PAD_CCM_CLKO4__NETC_1588MUX_INOUT11           0x0104 0x0408 0x0000 0x01 0x00
@@ -872,6 +880,7 @@
 #define IMX94_PAD_ETH4_MDIO_GPIO2__GPIO6_IO29               0x017c 0x0480 0x0000 0x05 0x00
 #define IMX94_PAD_ETH4_MDIO_GPIO2__FLEXPWM4_PWMX1           0x017c 0x0480 0x06f8 0x06 0x02
 #define IMX94_PAD_ETH4_MDIO_GPIO2__SINC_FILTER_GLUE4_BREAK  0x017c 0x0480 0x0000 0x07 0x00
+#define IMX94_PAD_ETH4_MDIO_GPIO2_XSPI2_IPP_IND_INTFA_B     0x017c 0x0480 0x0000 0x0105 0x00
 
 #define IMX94_PAD_ETH4_TX_CLK__NETC_PINMUX_ETH4_TX_CLK      0x0180 0x0484 0x0648 0x00 0x00
 #define IMX94_PAD_ETH4_TX_CLK__USDHC3_CLK                   0x0180 0x0484 0x0000 0x01 0x00
@@ -917,6 +926,7 @@
 #define IMX94_PAD_ETH4_TXD2__GPIO7_IO2                      0x0190 0x0494 0x0000 0x05 0x00
 #define IMX94_PAD_ETH4_TXD2__FLEXPWM4_PWMA2                 0x0190 0x0494 0x06dc 0x06 0x01
 #define IMX94_PAD_ETH4_TXD2__ETH4_RMII_REF50_CLK            0x0190 0x0494 0x0000 0x07 0x00
+#define IMX94_PAD_ETH4_TXD2__XBAR1_XBAR_INOUT34             0x0190 0x0494 0x0000 0x0105 0x00
 
 #define IMX94_PAD_ETH4_TXD3__NETC_PINMUX_ETH4_TXD3          0x0194 0x0498 0x0000 0x00 0x00
 #define IMX94_PAD_ETH4_TXD3__USDHC3_DATA3                   0x0194 0x0498 0x0868 0x01 0x01
@@ -965,6 +975,7 @@
 #define IMX94_PAD_ETH4_RX_CTL__GPIO7_IO8                    0x01a8 0x04ac 0x0000 0x05 0x00
 #define IMX94_PAD_ETH4_RX_CTL__DIG_ENCODER2_DATA_OUT        0x01a8 0x04ac 0x0000 0x06 0x00
 #define IMX94_PAD_ETH4_RX_CTL__XBAR1_XBAR_INOUT6            0x01a8 0x04ac 0x0874 0x07 0x01
+#define IMX94_PAD_ETH4_RX_CTL__XSPI2_IPP_IND_INTFA_B        0x01a8 0x04ac 0x0000  0x0105 0x00
 
 #define IMX94_PAD_ETH4_RX_CLK__NETC_PINMUX_ETH4_RX_CLK      0x01ac 0x04b0 0x0630 0x00 0x00
 #define IMX94_PAD_ETH4_RX_CLK__XSPI2_A_DQS                  0x01ac 0x04b0 0x0000 0x02 0x00
@@ -1344,6 +1355,7 @@
 #define IMX94_PAD_XSPI1_SS1_B__GPIO7_IO27                   0x028c 0x0590 0x0000 0x05 0x00
 #define IMX94_PAD_XSPI1_SS1_B__SINC1_MOD_CLK0               0x028c 0x0590 0x0000 0x06 0x00
 #define IMX94_PAD_XSPI1_SS1_B__SINC_FILTER_GLUE1_BREAK      0x028c 0x0590 0x0000 0x07 0x00
+#define IMX94_PAD_XSPI1_SS1_B__XSPI1_IPP_IND_INTFA_B        0x028c 0x0590 0x0000 0x0105 0x00
 
 #define IMX94_PAD_SD2_CD_B__USDHC2_CD_B                     0x0290 0x0594 0x0000 0x00 0x00
 #define IMX94_PAD_SD2_CD_B__NETC_PINMUX_ETH4_RX_CTL         0x0290 0x0594 0x0634 0x01 0x01

-- 
2.37.1

