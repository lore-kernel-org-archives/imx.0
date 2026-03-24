Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8915B33B970
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 05:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774330966; cv=fail; b=sIkMyJ0t8+8R9mXaDsmvzqcR+xoJO8c3DK5kPbi8WNdBqC+TycweYGUsBfL4ky7qDxIDl5cCeT9DBbjvkamZ7nA1NQjwJdUKGzWxMJoEV65gnbdbg7iCto2S9cDPsVsYByTtmYBKfFihoqf27+NkD/MGzGQudxhBF8eAOdLRbos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774330966; c=relaxed/simple;
	bh=7cS0+DljIiSoubfcHgsvgRYiE6DMM05WmremUv8Nolo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bvVq6mIFeRk3mO1IhO0/51AthPiLT1Lm1HoKYeEedS5cdJ+yvnQN11DLYv+3U/vuBGCKP/8L6rFaInR8UDpZDjgojnGHvcvisnNPOLECK5N8UN6vqef7mkjiI6CTkysH0XRd87Kdj6GhkE7f26PTxTSBHQ5OSToUU3QAI6wJGW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TV79Lud5; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TV79Lud5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6VoQfq36eU4MHxK4JSRYV1s7Q9MbBP97NrgQ0y9dEa1BTzN3xsHxMqM6vWV3opYO2VV8EKJMFktTGllHRyhw1N67N2g6ivFaqM8OMSMrX0kAJ3oGKPuP1+NBKCkDl7CjsVQqTwV9VVAJWhCMIZ9ZO2tc59I9/r91sBluK2VJ/XL/X4zzM2ocHoFPQjbhp82M3/25Z6xzyumrI0CzaRenElC1G2NiFYgSPs1EqisW8eilxGWeVdkOihsyxJ/LHamQKqBAtcFb3sjSSNyGoNe2SPQQ3YPvplT+rFTI1FZC5GCf+VvTBkiiEezbAGrd3mRGEBwYROufqbfM9lCPJsuOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdWJDpbzrEf2UHH0ASlU9u2Bx1OwgBXXHMZpEFlx4zg=;
 b=EcKR4lfW4b/a7KKuu/BrCPN048dFBECMs/FjyRiQkXBG1ew3b/EA89nKicIRnDKdkLMMbPk1vLs5PJhZFi1InkyIGYneEU6JMR/Yh9AcGOLavwEZXV48F47Gtp81youEfNLoW8u7STkb0eSf15JTgPTQJ8XFiKoz85XNWEDmgm3aniwOat5tXUPgNjoBQz/Ov1FK9c+ygmY38we2aLNBqI5RecbPJ6odzzXpEdZ0CPD1JP18AVBJx8rkyKigYFmX3nXuA7SXcX15W0P1fmd3Ul8HSArvlmmOL2F597loVyrgquN4DgBFy3mxtUReL0DI/KZb4ajuo0yp/ALg7/AZIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdWJDpbzrEf2UHH0ASlU9u2Bx1OwgBXXHMZpEFlx4zg=;
 b=TV79Lud5AtFKrbjD51ox+des5Y54+/kOIh1hS+Wy8EUCBbmRljQnCyxefvrjr6KH8X/spV9eTkADyTGVKpFiOCyDWbkvBPQqjWd7A7hfwDzHW2ErVCz06/sEMsr6JyBBGhVLMhIunsUr3QRfGC92MnZ1Mvu/tRXUFRKp20Q1ecnsZQJonv4pVpPBQpk0BZeJnKQ+v+EfNWDgIYsR2u7BFNb8a3O6rvlKwAHcq9lptbBVxQHu6ZvOfKoohO7QDCjKI4/DJTXm23W5FUXT6Mts5x5r/O5ZYz/28zW8CIeFy+5Qn8Rc7mlb6lpPZkAOHd3pTJ3Nc4Hk/JrkjwRhFXRJQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 05:42:44 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 05:42:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 24 Mar 2026 13:44:07 +0800
Subject: [PATCH v3 1/7] arm64: dts: imx94: Update pin headers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-imx943-dts-v1-v3-1-b33bf1f1c254@nxp.com>
References: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
In-Reply-To: <20260324-imx943-dts-v1-v3-0-b33bf1f1c254@nxp.com>
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
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d81b27c-d764-4e85-a806-08de89681ec6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|19092799006|1800799024|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	1J8lqHNSdWRSL+6DDwSq1lhSDz/TfxBOv6TKKNpZJ/0VF7yPYE8RYMXrFzY/p6VBHvAJR0Y4fR9tDoDOgR7yeO/OS8oDc4y71tciNWZ7JTnBDbLE6TLjDFLgdzfyaAvO5LGGt0nGCZEnDsexBwCh4yCfe2QPl0lBGtw0Nkek12x3HuSFHsWFPyGBa9EvJqK09vO2swRdySUTq6FMBqXS7hbrG3gK/grctUvvkIZUASzoWOqEM5vRfd4Qe8GMW6tDRRtAXRYnYdR58NqG5ihAxfAxacF8rTSON/R0e5W6s23yZmd2VfCJG1GUM9Ea+fcuzHR4KkjicrjGNteNke7znjdB4VvWv81qQt/Q8LFzh6LSk12E1h8OLrY7GXry6kz050lAIsoqIO34G/2xcR61VgSbhOrFM0XKXTpDaov6V/igieobm8AuXK7nvw87PaDtAGc2aXdD0lB9eU7yrWhyrFFpfonYq0jae03kzKUyONfBI5rajTUrUZWcQh+2h8JxxQvRyB0OPtdcligkx+NDF9S7oIcXu0IllFnWcWjh1h9nR3roq5Eg3wqryDaR7ls5JzQejkLD8w7k/+wkAfR1RKUePM+eeZqODp3B8oFnFkOe2Hgy0Sp620Y9wNGTPCIjo6eiNVhQ8PBdONVi8MXTEtNMdZg5BcoQS7dR+4vN6J4Ybv+2LFcxKsYpgL6NTSdJ87Tk8WT/m2ZchZa0Qh729FB8P54JMw4cZsb8V+iu7wLybjfXW8raCL6wNJKx9t5ZSCenD3ie+Z0+D2wVO2rofkrgQ3elxulvuq2bK4i7SFA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(19092799006)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnFmeXppcjhTSWZlZW40Wmk3am9EOGlLSk5zN2RwUjFBK3c4L1lIMDJEblhX?=
 =?utf-8?B?Q2dWSjVITE1DazR0clhqSFNrWTFvWHIybXJwMHNjWFdQSTZrbUVDUW4xaHNl?=
 =?utf-8?B?TXVEUVpjQlQ1eEhUMHg1RjZxWUtySnlzRnptUDI5dTFEU0dCQ1JYY01WYnda?=
 =?utf-8?B?QjBIVUtWbnVpSjNVWmliQk51cHc5RW00blJtZGIvcTNucGdJMWNyeGQzNkdU?=
 =?utf-8?B?a0MzSFovSFRkS3VhejRWOCsxMUF1NkJJakRmenRoUGpMOUJBRldjckt6NHJC?=
 =?utf-8?B?Y25sZUlLSi9KZ2VvQ3huSnNQbXVnQVk0TWErU0FQOTRtaitXd3ZvZ3NWeERz?=
 =?utf-8?B?eHVBS3M2VGZIeGd1Q08xTDl3SnVVSmtDK2dGSm43TkRWK3BOWThTeURhRWQv?=
 =?utf-8?B?SlFUL3BOcHlseEo5WkdlWXF3R1U0K0VkTE5WK2RxVnR5aE5hOXkrdDNJQ3Jp?=
 =?utf-8?B?Y3pwVU5GdVRUelBuNWFWSDVETVc5d0ZCZnlna3BOek5hUFY4QnIwa212TFlO?=
 =?utf-8?B?andtUWxkS1ZkdVFSeTBjemJmQ1dXT0FGNFRQZFBDTXg1R0FkUk9Wai9JYU9j?=
 =?utf-8?B?Y1pvTW9LSDR0bS9MYnF4RlF2aTcwY0VBZkdsYTV0WWlQRTRwRWZWOFNQVERv?=
 =?utf-8?B?OFhqVkNCNkd5blRaTlZVV1ZxeDM2Y1o2V05CUXZLSGl2S0IzQ3RkbGFMRThZ?=
 =?utf-8?B?cmx6NW42WFVPazR5S3BDRU1FblNTcVYyNHFLUHljN2p2aGxkVGZvbEdBdGx0?=
 =?utf-8?B?SFUrNlpBVmFncU5sUzMwb0JHMTRGdWMrWlpzc1V3Y2FJUzkvcUYyUlpjNWtS?=
 =?utf-8?B?VnNveFhHUnV3R1BWR0xLL3J2a3FiZHFWRTJQQUNVQ3VpMktQV2R4L1B4U3BV?=
 =?utf-8?B?MG5WaFhNeWlvSDdRRG4xY1A2VFcrUHNtTDMrdlFkbnlmc2RucXBFNzhJcUty?=
 =?utf-8?B?a1hkbFFRTW1jU2ZGZmtaY3NPV281c3h1ZmdGM29DdTZLQ1QrY0I0a2NsYXlC?=
 =?utf-8?B?ZHpNYW9YWStWK1F4aWd6cDBlTTBiWXFZcUc5cldXRlpsTmM1UEdsRitKMS9L?=
 =?utf-8?B?WWlON3VyTXRieFNhUGNZYlRkVUo4SHJHVFh5TEVlcjNlTGdZdmtGVnpmSS9Y?=
 =?utf-8?B?d2pRKzVlNFhkeWE5SUN6ajRTZTdveTFjL015cEtVUlJITFBnSmJ4dDZiaExT?=
 =?utf-8?B?ZEZRM2p6RDBwU1AvOWplSk5VK2F3emxiRzhNTHVuTXJobmQ2blhpUHNjakl2?=
 =?utf-8?B?TjhjeHh0a3lhTXFEaCtqbUt1UHppQUxWZEthMktUQ3l0aXR2allLZjRWazdy?=
 =?utf-8?B?NWszOXlTZS85dEhHclhqNzJ2VkZqeFpRQVBoNUlPRTZ2TTBuOWRKZmxwSFBC?=
 =?utf-8?B?dGJ5QWpGZStzcDBld0JtY0xpOEVESVNtWjJZR3NaUlc5d0doc3grTHJJL3BZ?=
 =?utf-8?B?OFIyTUZ5bEpFT0dLV2VKU3A2SmQvSUU4bHplNkRFZTBzMmJtWFR6T0NLT29U?=
 =?utf-8?B?NTdnaE1QZDd2ZG1OL1ZGRzNkODlqbjB3Y3ZraVRhYW9IYlpMUm11b1NaSW5u?=
 =?utf-8?B?MFNxVW53ZHpSQTYwcXFDU0l2T0podFNjUHJwaEl4aEJWdnJDanZZZFBqSzRL?=
 =?utf-8?B?NUJKYzVUVzFhMGR6bUwrTEorOHpTbG1LMTdPYjFTRnZnU1JvWjI3S01lbUIy?=
 =?utf-8?B?Wkc2QUVqRWEyMGFnV0dhUG1oa3diYVkwZUpiUGJyUEdCQXNRc3B3Q0dzZHYv?=
 =?utf-8?B?bFZ6QkZUeXRwdlZqc285R2J2bVJoZ2lvYW5IYjVha3NNNTlneWxBNnBIY21k?=
 =?utf-8?B?bFJSWkF6Yks1bUFIZ1VGeS9ieVNCaWVwNXBPdklnUmcvZ21mSE54ejdpODFD?=
 =?utf-8?B?dmZUSGszSkFSbHpyR0JmdUwwcTdPaUE4Sy8zamMxeHl4cUZwUjBnUERuVThL?=
 =?utf-8?B?VzEvaWI0UFdQYjBRdDBoTEVSUVdUQ2dhNi93cVBFZE83WTduaGZGamhPanVs?=
 =?utf-8?B?TW1VaG15TnRlb1FPcWJUT1crMWhMZVAzU3ZLOEdHeDV5QlF2dHptdGQxZ25w?=
 =?utf-8?B?RnVvTzlBd1hvQjI3dmhLTTBsYVJsMWJ3THdrcG43QW5qVGJESnZiWnVrOTc3?=
 =?utf-8?B?WTREZGpYZnBpeDE5cFJocHJJajRlQkdRR0hReEU4ay92YVgvZTFqMUROZUpV?=
 =?utf-8?B?TWY3bWhRTnZoOWxHWE5xQXNjWVVDZHlxVEpBQW5Oc2haZ2ludjlpYXBpQ0lv?=
 =?utf-8?B?VjFvQUhQTkxnSm1HMHo4dUhuNmRNK2FyWGZ1WG9qMk40QkdLQm5nL2JBa2U1?=
 =?utf-8?B?N1B2U2szZzlqQkFqSFBYaUg1UjFpd2plU3RVTGFHNHp4TGlaeDUzdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d81b27c-d764-4e85-a806-08de89681ec6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:42:22.0421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: up+JTAy9T4C1o71PGpAmFhbVv0hIRJxRkg1/3MqBwHHLpTel0XexV1Og1/bSPbWYSdYRnAfTL7G6g2LLlhv2rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967

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
index 00255db89185260811c4b6b50ac3980f18e69141..d5056e9171409ed922ea12c559f5cffa94cb9075 100644
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
+#define IMX94_PAD_ETH4_MDIO_GPIO2__XSPI2_IPP_IND_INTFA_B    0x017c 0x0480 0x0000 0x0105 0x00
 
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

