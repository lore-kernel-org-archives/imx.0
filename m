Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDF32DA756
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330190; cv=fail; b=DK02147R+3Vx/KQDiDwUZeS07DLLxSYzRyUjZJ+Guyc7z42sTFufopPTG1TNPV9f79F9tc1OBWEKce5UIlwdpQ5FYryppEYE7P9ER77Kjpb97gvxBYyxXx5Wvd+zlnituE+V1Mi0I3wJLBONgU6NQCsb6MFrG09U8CLcDE+0VHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330190; c=relaxed/simple;
	bh=nhmZL/EaK4QRxQkruNN/+5/Ns4oyGhZsS/+R7aq8uas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PGdTh4QluHOCLiQ6l01w+/odQ+rv8trycjeivc3DqJVu4LctwaPmm2oRTr4wzioA8c7/qoXRryapJaZBzL+lCxBl+jnbxo/8uX11mJdy+OH6SxxmxYv00CzvLxoyFrk6k4HyQhLmxSR8MicswmnLT8H0FlEDgCdvV0sJELhXHas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LF4B/qI6; arc=fail smtp.client-ip=52.101.69.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LF4B/qI6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgBKXBW31lQW0syXmyMbO1tPOBpZOKw+NFSTqpZDja3wx1Rf1JJhkGHV4FzSOFDinqvnbYHUoBM0xt8fzjo12Z9TIHWWFqnqwiWtWcR9BKVSByPOx8ujVXRnJ9LslIhr7ymQGsbPwVvyIVp1Mx2djhmY0T+xiWS7Qfjw5a1ttw/WfJH3MFms4QClYyYH4MsSOib4+ygaJb2Bg0a5Ulh/mcovCS44+lz9oxRDivXtim0GlEsFDsN0VoBIjpQ+YTR9nYiiMSbYYVcXFWD7XZlqgPBct7Y36JXCTzVbGL8reRR6MGbkmSMnW033j7rVbJ6c/hsgI4Z08XM/E9A4Yp9NRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFYa/zZTABH/e+yi0oS5O0HaQW4dnfPuUs+rEusqO+g=;
 b=nxWlO+uQ6z4X7a6IPC6cIBZylC/zkh/8YRcMdVqbr58OGHEMrwMfFPsWXrRNj6OkiQfaw6XJNpeESLrBeaqr1HGUC8x5ZKIRjRCfB4ReFYOMuInFCQojlq6pGbNYuASuD9lMtNLi/BLbxK7dsu8jZDAeJbMhF74JHGs1CI3Z9YaoFg+A+QbkbHmx5Mf0vqfp/d2c2hBMSjglNLTxeSZeDIpWD9SPyAJGrcDyo5TgONwz300XZ1fAg/vOa8mLkngTJJ3siRNgVOZgsh6Iq2+MD7pvfh0Sff/mzDfvj/nHa4pN6xu4vPKfRsRlzq9gb51wNxt1Vby31LRjNc81SVVzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFYa/zZTABH/e+yi0oS5O0HaQW4dnfPuUs+rEusqO+g=;
 b=LF4B/qI67pXioyF/1JWhE0RjAr04M+YZ0LzYdAMnvmT1J/kP8NsyiKtreMKsmLZwPwcaJ5h1heO1KrVyN/WnQWhbl59f3K1csXfOBSQdCFNRMC5qiMYl3aUso82vSPb9P8c6j6HPBj+h6nWedbMCxMHuey50JWR3sn0p5gmk3RHhDjTXqlRNjHak6qvixa69iOMZSRDrVzrucjoWwZL8NWdVpHyHCLYROlDZVA25G9YjiXPUgQvWoavCW6K8IR+iqKMjZXCYLrIZlJHDlw6zFcCLPciU6kaUaDjltMmUE37Uxyrx70g+W68gmphS5yJPOeN002fQOFTH527EkUyDDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB7041.eurprd04.prod.outlook.com (2603:10a6:208:19a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 16:09:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 16:09:46 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] ARM: dts: DTB_CHECK warning cleanup
Date: Mon,  1 Jun 2026 12:09:38 -0400
Message-ID: <178033015787.4094084.5029212634672611116.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR18CA0022.namprd18.prod.outlook.com
 (2603:10b6:806:f3::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB7041:EE_
X-MS-Office365-Filtering-Correlation-Id: f62302f0-cc5f-47cb-fa55-08debff832c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	KFa8X0rOh72IG8wOopWmGL+zW5uGHDVPruYUV8YqhqJlx0d9mOpgiDxxIouuDf8RA5N5gjVfGPWmO3xPZSa/AHVtU+PTRC1oGWlY8vZeDvlQ3LgX9KcAx8Hd85XBIuruMuun0xLpE0kBrOS9JEJsdTbKlmH1+mLY6YvrHDpBiJKZmXHKhowRXq+vRj4QgvZUFZR6d13UNzmmBfcPnk4M7gmCwKT4t1skB6UrEY9lfjWWhpseQj+J97Nu8chm54eT5h8Mra0S0QuCwYaSHyCZMa5zWRslAR1wiI9AFRDRp+kmimuRJZR8WESBIbw4zVjUmwDrcTilcv9yeH2Lx5fjk7iLmB6I+8HZq+sMHh21BPRyONFXiFbB627+FaG32d6VjoyTLnqYKBU8VHibC86av1Zh9tt7xYxiFjCVbscf7KbmUBTLHjSPLaHzF0PzmJqY5iSeORV+RFl7n4ta03NquoWt+wkcpCoM0ND8NfSnaQaWqUKLOyVzyOXgYRZ5x5607rMW6dHvf5NPifIBCOHhqIbmGb7g0cOhyCu4IXwKa8ZDRv73HnFQFC+3oEYS6AJ3e1lWM1SR7eoGEG/9X1BLwte8oRexDM8/kepxR9urOEx85Q3IZx5K40IBzeVK4+b8ERUAET/stsg1Izh0yeW1Ksij1mxEIs7w4bM+RGxDyfjl+73q8PrKGAzubOG6K5e0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzQwUHkrZk1MZDNUL0xNdHo2bldUVEJTcVoxMVRpNE95RVliRTMySGtqNFEv?=
 =?utf-8?B?dnJHNE84YUMzdkY3Wkw3eEV3QSttQnVWcjVCR3FRaVJSUWZxcm8rYzQ3Z2Vv?=
 =?utf-8?B?dnBYdnR0cFJGYWtyK3N6Um9aOUk2M3FGazdHdytvTm8rQnlQMmlFZWoyenZT?=
 =?utf-8?B?N0llTVFlRzJaZGtZcnpaSjBFRTYrL0xhRW9HVG0wNG5ib1YyWmk4b1JhWW9M?=
 =?utf-8?B?RW4xMEJMcmhkdnNwL3phYmJIR2VoNy9yTlRzczNVTUZhdGY4UHUwVTU4RlJ0?=
 =?utf-8?B?N09nbUwzeit2L3lPemRFNkFOZGpZaUtpcHRjL2cwVmZvM1luS3MwTkE1cldM?=
 =?utf-8?B?K0h2bjhiREFmYWlUTUVRcjQrOTY5czNPZXlIWk9QU0dRS0NYVW5MNXJPUS9N?=
 =?utf-8?B?aWx5MStkcWtPTXFmUUxZVmxTN0NLV1pDejgrcW00VkdJNjk5QXBqeGZIZkNj?=
 =?utf-8?B?Wm5CaVNRYU1sb2lTdFBVQXNIOUFVN0VSMDE1ejJDaW9TYlVFYUZwaWhwSzVm?=
 =?utf-8?B?NjZFM2NIRG4yWmZteTl5MEJFUDlWS0M5NmpGZmJYYTNNaEN3M0gvVVZrY0tK?=
 =?utf-8?B?Q0plN2w5YVJ6WmZvanp5NkQ5OFFBTW1CdSt0a2FLNEhQbDQ1T29yZGhCZm9o?=
 =?utf-8?B?VVkrSXUwdVFISVdlRFJXWmhRSmRrb0F3b0lpSGxBeStwUVBpbnMrNVk4enE1?=
 =?utf-8?B?UUo2WFhiWjhNVmpBbVdwVWw1STFTVnpNMlJuY1VyaU9rb0dsVUFqL1ZaaGw2?=
 =?utf-8?B?bWxVK20xS1g5clV6VVo3ZHpmQ1BMRTZMa1FvRit0T2RYcWREOVZPQitqS2d4?=
 =?utf-8?B?dlhQZ3VOWldBY0RHNXdqWnNhdTkzY1pJeGR0em1jWUNhZkV6Q2JUdXFJamZU?=
 =?utf-8?B?eVhwQlN0aWJaYW1BaHpVU2NubExob3JIQWgyQTVoV3FBTXl3YlV2dHBaU2Y4?=
 =?utf-8?B?bDRvREgwRWV5SVRHQysycGpqaHlPNjA5aXpzbXhzU2wzREpuK2VCZ0NQcmov?=
 =?utf-8?B?TmhkQzNwTE15V3JoQTYvL0l4NG0yZGMrdklibWRBbzhaeFVPR1BUbW80elhw?=
 =?utf-8?B?dEVxQjJUSHNwdTNNUkdqdkYzdTIyUTNSWS9WSDkzOElESG5zVEhRSEs5RVBR?=
 =?utf-8?B?OStpSmtxcFJkSkNUM0NHTDBldGxmaVNWYkU2MHN1WDhQbzQxYSsxOUJreG5T?=
 =?utf-8?B?aDQ4QVA1UHJNTERINTFDQkN0N0xRNndRTVoreW53UXR6ejRmcHlTaEdEZk9u?=
 =?utf-8?B?S3krSDQ5S2FXU1A5WGRqTC9XWmpuRzRveDVQZU9lVVUrODRqcW9KNmV0UjJZ?=
 =?utf-8?B?VDFkUDFCSVNrVlhUeXFXeFc5TXU4ZkZCcGx0aGhKdnh3OXFUVy91QVQrYkxO?=
 =?utf-8?B?VTJLOHZXZDBranZVVXA2dFg0c1RZditIWEhUbHRwME9MQ0hYbjEzV0lTREJG?=
 =?utf-8?B?MzFvKzNZUmlMMGhtaitjWjhRcU9oMkRzUVZXTFJDOGpoeVhqOWhPRlo2a3Mv?=
 =?utf-8?B?TFozZFVJUFBRRSsxNkN6cWFmOTEwZGZwVTlqZjhFbDV4eThlMHVvazNDdHMr?=
 =?utf-8?B?Q29xRmNjWlVyMGNwWkhFdmRJZGZuOG5peVVUZkNENm9wMmJBWUNHdkVzNzV4?=
 =?utf-8?B?M0duTWtkMjY1Q0hhYlRscUZhb3FVaXh0eXBHNG4wUVd3SmlNaGhyZUpXbFY2?=
 =?utf-8?B?MEI5bTlRV2Z1dDREQi9vZ0pEZWdMNnN2OTVXZ3kyRnpiZVZQMU1nYVk2QVYv?=
 =?utf-8?B?RnE4b2JCUkY3eGZFQ2pmUlFkL3A1OWJJQ01KOERob2hnd0VyeGtwajF0ckdO?=
 =?utf-8?B?WjRxVnAzVHZWbVdIVytBYkQ4VHpQL2lqMEladzl4eng3UUVEYnF2eThJaHRu?=
 =?utf-8?B?SlI0WWQ2aEg0NGphSUJ0ZUJ6SjQ1dXcrOFdYSHlIcE05SVdDY2g4M2pjZDBv?=
 =?utf-8?B?c3dQaWs0bnkycm04bFhDVXJ4OWF0WGVQUjQwOGRDcHA1Z2xPLytHaUczQjJv?=
 =?utf-8?B?YTBKeCtTYjZ0OGtDM3VNc1hLbEE5cTVjSWtJcFlSRDlYT2tKMHFMWXYzV3RI?=
 =?utf-8?B?WEVJdzBtaXloeXh1d0NiVXlrOUxFZEdSK21wRHVyVjJ6YkE5ZnNPN2I4K2Zy?=
 =?utf-8?B?TnZUR0t0NXFRbHd6dWkwdlJmRUo3WTdCZnNDNVFwWmZIVE1iY0RXQkFobUNq?=
 =?utf-8?B?MEJHK0Fwb3lSV3lsN0lDQ0ttTlpyMnhyU0RCbHdxWWhhd1lBQzNUbmllTG1M?=
 =?utf-8?B?eHRCT1lJVWwrdjhZdi9HRmNtZnZkSDZsclIwcGQ5b1JoVEpGTGg1dUkvT253?=
 =?utf-8?B?NEU0OEp3eHNVSkdJM0dtdjJHdjV5N2R2NG94TzRXRkNvNVcrcUNkTmJxRlph?=
 =?utf-8?Q?xet2RteCS6O8AyUg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62302f0-cc5f-47cb-fa55-08debff832c4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 16:09:45.9644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuXlgNRrUhL+yF14jRa40bOuQOpDksdaxltrRjjH6+eWDBg9jGeVJ8AtJxnlFhp4bXVb/aQietZs63rhfDKoqwo8oAkKylNRvDV9j1Ea8SlY+LWbrIU7Kw57UGApUY96
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7041

From: Frank Li <Frank.Li@nxp.com>


On Mon, 11 May 2026 17:04:55 -0400, Frank Li wrote:
> 


Applied, thanks!

[2/4] ARM: dts: imx: add ti,deskew = <0> for ti,tfp410
      commit: a767ab8ae66e574c6427ab88f55e9e43471edb4e
[3/4] ARM: dts: imx53-qsb: add dvdd and avdd supply for panel sii,43wvf1g
      commit: d6af25d182b2ece6223dbba0084b269526d3a5ae
[4/4] ARM: dts: imx53-ppd: add '#phy-cells' for usb-nop-xceiv
      commit: 740e76b89b1cd75f519a949b77954ff9cf71c82f

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
