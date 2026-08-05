Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7013E6386
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 07:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916487; cv=fail; b=MaGQ0SsXSO03yEWb/nGyVZ0Ow1Pr3ZIoW72W4yJhWGj9FFG+g/MGhgKDCAUYdyvsZoR3zBBjkg2Gxb3oYEiO58mlmeQXYkxKlnoNrotW5iN9JLEsQpYDlBmLftJ4q6rI7Q/SReGuPs1DVsNEjetrblcyrCug/nNaMDe4vYUKpPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916487; c=relaxed/simple;
	bh=oZQvScyA1zqJV4CC6foAQh/CAQe4pGeAga38F8pulH4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=G/vhe2T3F73tLqO60ap9raKMq9qoApuPATyTepCoMx6EqffHhyR6yMT2zpmAarOhQsaoRrJWmZ3vVr205IaDJlC2qjKLB36R9HTrKSar7i7cDW9COHxRH1RA8GMC1wC/tlTAGwdR5XfYsFj4zK8HxIX6Wkh6+PFdTpaoi54S6Zs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ed5nR+Gf; arc=fail smtp.client-ip=52.101.65.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ed5nR+Gf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+u8IjW3YRPRvq9BUVq82/Q0li/Bi1jUa9pE0oMl11sAqKu/DFKlV8iPzOl5d27LMyJ6EPgHeXp6Vw4Fip5NxiDikpPxsUygDvsur8LbM8LFhNll/4wYSckmuIYkgjAGc4ap/GpPqLSOfhjypD6X51o1xf0+OV1fpietakEFDnbV718t/rCeJgwdegRH3tAcs2wRucUeXg4ztjEDnaCA/Lz6n6GR98MdaoEUT3yAa06DhjTkD0aRkjy5Zog7XSQxuqeF23tlblqIKRrceTOUDGay2sFCO+5zB8N8ifWLDmbkb+AZQLfcUiwd+c4iZAR+7IPdnohWaj5TOCFsB/sCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=qzt692tA6XlGveJdJl/PJbGrNe/JQO+O4fmXfW72vpNHdWo4FIBLyNmJ6v9/yTvQNq/sSSWMc3MOqm8KOiareBKl/u8UoMo887zIU5PxPAlZpVCo4op0+EULwaO513S313uvwM1CfksYXsQ5qtytKd/tzRU434ULFsz1IaT1QM1LoZstwKUO+0tIOaNuaVCb9MD5GpsFxn0zqHeMdZoU1SVyqmvOS0fZF04d2rEkGJM6xH0suFPP9lSxTOK+LpN+5iZCPWjZpuLFnOMLyCbJbq/UMp1n8gMqa8leCNQc4zZCroUGDOjGWdhhPznC3jWK4G8X1LFr3zaFMXH2jqG0Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=ed5nR+GfZO3ebAjZTXSHfG5avpkix+DSUbRTgKMlGV1nngzQ8jr1sMYMiOgDP+igo4tZj87HpKbc+dpXVmDEkczn0fvQG9xlFg6H9EcTgHxe4+Jei5JcMopQr6f2FIrh+Jny/1o1q/+6sC1gWIHVeVIFNcnvE1vk/fp9X+noIHMJtDkc3R4VCOhphqWswZKe8sdVBVanZ5mSRuih8tP2cLc6mlLFHn+wida7k10FMeOzY8DKsVdbT+8FFI/nQsAWo1nlaShQbuvrTSKOGp4iO0XOSqB9kVuZQOf5sriNxEjLw40ScH1X0WBgOOzCObSliPG2v+0bP64vZYojl6j4fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by VI0PR04MB10687.eurprd04.prod.outlook.com (2603:10a6:800:25e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 07:54:39 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545%6]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 07:54:39 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 05 Aug 2026 14:14:53 +0530
Subject: [PATCH v33 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-imx-se-if-v33-7-212e32ff0295@nxp.com>
References: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
In-Reply-To: <20260805-imx-se-if-v33-0-212e32ff0295@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785919487; l=2461;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=8LTJ7dQk+ZmHVQUVQ7z2QFEU98qQ6ZendsUWTwEehrU=;
 b=UgYkGKOO7aoL8lAyZCLd97j79C71hDWEZk8wO/WrlHjdrVdn2uSE4X2n1OomE273GQm2K7n/0
 AwRtK2EnJiIBlFoTS9yAiJC4EQA7UAvWhSHI05v11smKwcCendxMXVp
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA0PR01CA0068.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::14) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_|VI0PR04MB10687:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8fe2ef-ee45-4d2a-1948-08def2c6cd16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|19092799006|921020|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	vN9cqN0KVbaVpBaXgOhBSHejHlw7DECW9Pp8O6J9NTJ5TqZQ0Yuxr/t/GU7OZBUBR24HIiTFKSe4aEB2SyaACQWc2fj60ghQkfIlfIGN+4hURckGRYsPJq+kbgj7uTMum9Kf9xKhnnMYv7JaMxGuAvLMrc0RZ2IvL54oIbmJNFQ0MUQOU6Dohw3w81RWo7IxN6ExJZo2Fng29GmkEHP+TrUFIT4nlk3pNPso5DxrkJAkYInW5Y/aT3/RbzK+1znRUy1je5G9SxKuXxVYx117vlsut1pyjorYrOwP6if5+asFZxyj92qy/w0/2brR+/LJYpgcKaPZHGsD3b5wEaKrZoXHj31TOOGzYnu+h78EFtYAzxRJDXAJL/BSV4BMClks5gLUUHwYYcHtqy0dEL1eoBBOSRWmN79ekVbSgltnhzOBrRJqMKvFoUvXS5G7I7RrdKxG5GuLjHjYCKK5qVWzutUCGUAu/nfNYTU/jACW08g1sCAezIl6PGMYXrZotLNwb2Mz6VzlYXqfJdrj7qokC/s3lJjdn3TpaA7rMeNJMhMI/hBrxPJ9jihzGHeL6NhL6PHnF6SpjbHLCnHQFntenFK6Ou6nPPlFvzOMeEXIIS0tjzLk1EFZHpSUViXy1sSVHxQgqRg1d/pw0zcrQRCsjLQFa5wSvcotFpJDQiztH56dxrJGYGPf1sEguYk3Am7vOtE3dspaky2o7VGYmI9joA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(19092799006)(921020)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWI0WE1zNno1cU5lRmp3Y2ozVy9SalQ2SWtjRlZjNG42WWFCem5MK2pybjRB?=
 =?utf-8?B?YmVtdUlnWlI2STVMTWN6ZkRzajErcHJ1MnBZRWlFT2V1QVFnM21ZZ2pSK01Z?=
 =?utf-8?B?U3dmbjg4bXlnVzFjZ3dTbFdWL1k3KytncWpsWlBJRTlocGRBSkJEckI1YVp3?=
 =?utf-8?B?emVLenJ2eGJSZTdad2lxQjB3QS92RTNlS2N0dFdlZ25LTlRXc3NyNTRFY0Zu?=
 =?utf-8?B?OVFIRDRDZVBNaFBQVElLQlVtd1ZGVk9WZkdKbFNkVWQ4akFLd1N4MmlibWVF?=
 =?utf-8?B?V1pZWFpQRzVOanh2OXNaTlB4UC91dDc1a2lqYmViTzRsUzdidElVK3lwdW1V?=
 =?utf-8?B?WHRNamlzVjBFcHVESDBTUnd3Y3F3ZHpmU05DSWJMUWZFYXYvclhFN1RJNjly?=
 =?utf-8?B?M2s4VE94RTVBenRnWUZRTWw2aGRrTFZWcUFrV3RnUWpVcXk3RitVditxY1Ba?=
 =?utf-8?B?QTFTMit2RVBZNWFreXhHaW9zTU5maWZrR0VqU200by8xeDh4Z2wwd0lubFl0?=
 =?utf-8?B?UXBIOGdlMVl6cmRZNkRuMGNkZXpmaktJSVc3MVhnU3dWS20zL1ZGWExaUXIr?=
 =?utf-8?B?L2U2Q1dLUW5oQXJpTkFJQUR5UWFFZitHLzhQRHBUTlVHT2FPczdXbmNtakxv?=
 =?utf-8?B?dkRQWVFsdy8wOWhiUGlyQWZ3aERYckk5aVZSYkVuL0d1SDNRNG5NTGpnYnUz?=
 =?utf-8?B?aDVNQWt0YU9aT2JCUE5tNjRjaDhIZDd2Z0tHZEo4UDZBd2M2ZFQ4TlNaZ0tU?=
 =?utf-8?B?alFoUG1JZEMrRHFnM1hlN0RDd3hremNWSEFQTUZJR1JTaXFteXRRcjRITG1D?=
 =?utf-8?B?OWcrSTFNUk9hUkp3eG00VlZIMEEyNTd0RUJKakZwak1QejNFdmkwaTNWbFlW?=
 =?utf-8?B?ZFpQWUJaNGRFZ0svYWFvQXBubWxObk81ODhlODhFamZJZDdBQWUvc05QVEg3?=
 =?utf-8?B?TktoRFd2ZzU1YnJlNnFHaUk2dHZlV3A2cDRTUW5CWDZpV2E2K3JwaHJGY0o0?=
 =?utf-8?B?WThBY1p5cGRIVUpPM2J6Y3VhVWVJR2JIYlNrSzdNYUU5d0s3WmkwZUNzQ0xX?=
 =?utf-8?B?Zk5GVjhzdHIwaW1nazBwQWUwRW85N3U0dkFvL0RzN2ZwTW50enBKWTlSRVNz?=
 =?utf-8?B?bTBZL2RJcnBJQUJxclNMTmVITHdHbStldWVyNlNnR3JyVExVbmVRdktiTmpL?=
 =?utf-8?B?eThBakc4eVNRRXJ4RXpLWStGNU96OU8zcS85RWNJQkZhdmZIRkRwUnFoTDFm?=
 =?utf-8?B?RGZnQkJET0lYVFRDSmpjRWlHSENLMUxmMEMxYXJobUxBNXZsNGJqRTNoVGVs?=
 =?utf-8?B?VjJHUXIwVE94TXFUaWZzbFJ6SEljNisraFRkN0gwbFkvVE9jc0s2eS85Y2xV?=
 =?utf-8?B?V2ZONTIzSzgzMjZCQjNQRWp4cFluZHJIK2FPWWV6d2dNWU1zOUlzVW9mb3FD?=
 =?utf-8?B?VXJXOEtYT1ExdSszNnhaUTNlbHIrekFzUnRxWUJteG1vakNOQm9WaVNmSTcz?=
 =?utf-8?B?V0hERHVxMjVPSFFEQUQzVGZ2YTVncWlab2J4UGgxMXN2UGcrTFdMZlJ4K0Y2?=
 =?utf-8?B?MWtLQ25oSHFHR1JjanY0MmF3WnRiTkVFZ3VHKzhYbnIxS0JvM1dKWVFvdVJ0?=
 =?utf-8?B?dzRzemhiY3pxa0Zyai9pUXJyZFVueHI0TktSQWloMlRFK1hnWUNhS3BHT25I?=
 =?utf-8?B?RUtPNEJCWHFKdC9zL1Jma2xSeWVyRTU1VkdoNXNkd2tUeWVva3VtQ0xkOUNP?=
 =?utf-8?B?UFFJWHZ0MHV4c1EyRmpTS2JUa1Vzc1BhcjdjN3ROTUtycUxETTRzV2xkU3lV?=
 =?utf-8?B?Rno5cVprRERhakVuUnRxMElQb1RxT3I2VzM4TUNZbWJidlVmRDQrWjQwdEFm?=
 =?utf-8?B?WlFmdWY2bUc2cXN1OGM0RHJWblVtQWp3UkpoT0ZLalNONU8vSWZlTzJ5Ri9O?=
 =?utf-8?B?SmNDMUJWTUs5cVhPVk9GcCtQUzdnU3M1NnU5UVdUOHpaUUJhbW5FeVJrdDF4?=
 =?utf-8?B?WjFnVmZhN29PcGYwYllITWpsVXVCTUdjWTJLU2RUR2FpSEFrR2N6RVJjdytt?=
 =?utf-8?B?MVNxSi9OaFNOV0ZQbVFLbVhkNGNTUG9MZ2o0bVhsU0RnWFloK3VwSS9PKzRD?=
 =?utf-8?B?ZlZxcktoaituU0hJbmdGWW93MzBmcldja01ra1JkWGdHT0dqNTVjSXdOekNK?=
 =?utf-8?B?bURJNW9tS3VOMmd1eG1hK09EdFFHQWhhQlkycUFRWC9vRTQzdDc5b1hPN1BO?=
 =?utf-8?B?WWFQNXRuMFZka0h6c1p0R2VqUHNPT0lYdlc3V1VQVStDWjFYODNXRC93d0lx?=
 =?utf-8?B?c25weHJtMkMzY2ZRVUx1RGoxb1dWcCtGbnB6SldlTElYYjhMcm1Nb3JYU0hT?=
 =?utf-8?Q?xv7oKV0uFUpmjaJuC1TE7hvzBLTMbnZJXaFej?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8fe2ef-ee45-4d2a-1948-08def2c6cd16
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 07:54:39.2812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BYC5RdYMbjaUaa/yyg2Q3j2ZYAnev+Jmc+cyR8mkrOFuyKL5RsWsc2nQ8G9cjhJRKsk29Gcvtwfl8n3dOQri6a8DdhbHp70pYRE1+kD5n95vQfj7hu4Aj0e2ELyI9fh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10687

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Reserve 1MB of DDR for the EdgeLock Enclave. The enclave hardware can only
access DDR in the 0x80000000 - 0xafffffff window, so constrain the pool to
that range with alloc-ranges and let the kernel choose the placement rather
than hardcoding an address.

Provide this as a shared imx8ulp-firmware.dtsi that also enables the hsm0
node and wires up its memory-region, so every i.MX8ULP board can bring up
the enclave with a single include instead of duplicating the reserved
memory node. Include it from imx8ulp-evk.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  3 ++-
 .../arm64/boot/dts/freescale/imx8ulp-firmware.dtsi | 31 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa..885242fd07ce 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,11 +1,12 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
 
 #include "imx8ulp.dtsi"
+#include "imx8ulp-firmware.dtsi"
 
 / {
 	model = "NXP i.MX8ULP EVK";
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
new file mode 100644
index 000000000000..e4bc352f68af
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ *
+ * Default reserved memory and EdgeLock Enclave (ELE) enablement shared by
+ * i.MX8ULP boards. Include this from a board dts to bring up the secure
+ * enclave without having to duplicate the reserved-memory node. The ELE
+ * hardware can only access DDR in the 0x80000000 - 0xafffffff window, so the
+ * pool is constrained to that range with alloc-ranges and the kernel is left
+ * to place the 1 MiB region.
+ */
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_reserved: ele-reserved {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x30000000>;
+			size = <0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&hsm0 {
+	memory-region = <&ele_reserved>;
+	status = "okay";
+};

-- 
2.43.0

