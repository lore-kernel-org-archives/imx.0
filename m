Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0791144CAC9
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 09:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785318650; cv=fail; b=E/+XwNkYCfDoqxIZVDPkXvkJ5HZ4a2+uswDPmI2XhehvYEVPo0Hp1hD0HV1eOngNgGv3V3CC2Se9Cp/Tqlb/ByUHhEVtF5inDlNMBwwRjJhUwD/AFFExCouH+yibvQHyTXc9Spxob3fZR2+m3eNzhRTMdvwXCcuHPp+nv/C/uPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785318650; c=relaxed/simple;
	bh=k3tVYja4n56wZfNeNEWqSJWwCEyCF973W9fJXHTvQI0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VDMRlO1cz5VK4DvVO9jodQl0c0fRZqv05hGr0/u2uE7P95fxD9AANhoQ0pQssDpiVzxAFk0oJwlbw+gMi0NuN3dgEevSmnsk9JxhC1ByfTd0HN1ZGggbO8T21nnQqBVdRetpXOpzXqEA5ZSnsqopRsXl82cpAwL2fHtkZg3TNNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hvhTQRAY; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hvhTQRAY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MzFZZbOijQ3QbykUEh3eIC8RPu8INfNHj81WD6D3h667MpXLj4IIKxteVR3TBIde2gEOCfFekF6lA9pKLT9//pAtLnzRbjOQnKBUUZU4daPUA5IzPjJcl5OFtPyanw+Xy08le35nfyra5s35X9zmqzRfPxlpmw+lxUCQDszCeIhpNcD3yiAOuqLmEtygNu3GQ6iJ04RVNJnJRnFmdWbIy25JSlbsTA3ErEDA1BGwWyMRlGG3AiicMyEu5WpHql4S+F0lyS9RKLLF9kG+VamRmd5jFlR+OlLit+nXVmT9MRUCMs7Mj+uJYw5JIZENgRKcR/FG5xteL4JE2az1cl0xeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTuEprvwrjk7mBn3yzDyr9Ex54iO4keA813TAWto3bc=;
 b=sbUKyA/S833gUSqL36mvleh1jgS44ukp142eYV6IWL2hLLsmVZDV0ePOr0MpaEOVdUolnBwasm/oSXWIpVisabe+B/jnmGEZWoOjfJCzIOfx0t/d+3V39WRkwydY4dlPjWo7rsyeyboAPqnRWLBh3Wl3LDWJ//MTjPvpE8iqRvsRYbuD+aQA5rQG+yhggE+ratVZJu3Ov2ccBuLoR7/MvL8bB+4RAv+pjRnlC1ICFEKsV/sO3kRiR2yZ1ZAbLaNw2Da5ercKuawNdoelcneEyBMCXTIGAckXPAdazMqz7r1ueoYIZFDqJH8chd875DwRbUQ9bB15IWXae7ekOc//UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTuEprvwrjk7mBn3yzDyr9Ex54iO4keA813TAWto3bc=;
 b=hvhTQRAYQc9x1rmCWbhrsnRDfxnYBazQunM5+g0Tw+mIz1PeHsPMrXSJ0QqthuPTNqqJaz1KRH4ckexz649OZq/iK/tBlmeO6ghQj9ZD2bzijIJ2a3gLodvAR0AoETM8XjO8wnPVjSeNdmVkpe/zaZxm4pC1Dx11NIrHOV/vGVlSeTMP6TTnjnaDOK9IqAkiIs2K7zV9GBciEWaWckAhMsLozim8MFEvrCXEaY3nPbqsSS9sJgknPfdCVGvpquhTiBvx8bkXt+QANiCT8JjnAjXTijloK6m/V0ewM1U1Jp/BU18NF5f8W36tQV2Ljhh0Rb25o7LzKioDz/7sbFqHhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM8PR04MB7889.eurprd04.prod.outlook.com (2603:10a6:20b:24c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 09:50:46 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 09:50:46 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 29 Jul 2026 16:10:53 +0530
Subject: [PATCH v31 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-imx-se-if-v31-6-e59af7adb784@nxp.com>
References: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
In-Reply-To: <20260729-imx-se-if-v31-0-e59af7adb784@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785321650; l=1927;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=DSprtaFK9KsBwngLc2U94WQMZZff55qYg4dIQt6mh+k=;
 b=SWMXPVlOmmOtqeXlbarm95V6vMJWnCF4IjZd4fO2zPK4eFe5UbWnEocwT6pUXpuvOGytppNKZ
 MppY2f2MokWA4RDM+E1I4DO4AWzrV0OmfAFoUBajUjFQJxSYHkTw6ym
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2P153CA0034.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::21)
 To AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM8PR04MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: b32e0126-c8cc-4119-a648-08deed56dcb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|23010399003|921020|22082099003|18002099003|3023799007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	4cYzvGcUCGV5pdb4rohkjDaYhcXbNQcXFDGteWRgqm62YzaKy4cvRW8VtdidCEX7y5WY4CV/hNlgFlAA5al7bxQTq+d+cuieyW9cSjk03jxIUCdO4lNBRJjf32Dli/NYwy50XSYx35oiZqDUE/tDLrm2KzywBXHATBn8B2xF/ALXSkYEmTIDnaPu1KwtLYdoHbWpohkzlwASi9tBp22gcTLz632VitItzVsJBMZh+n2kMPf65h/xq9WwUBbWSQwajIKHjueDx1znL9qD0dp/whrNj/nCIr4AfrpLoF19i3tmiVbBhKQ8/PKlN2SZmdvMfoFf7H5qHWvVlOzCdvkEte7anLZN2lBwAAnDTuF6shNXcTwNVPZthyUML7SJ5DHmGhyHg4fwQbaZWwbfEI7gPhE00tFac0THMVynayrmWWJb2gZ0WKgGYtoABVsx/tQIQMJRtdA7NzTxb/PQp4KwOy/JvkTWdPo914isWH6oLObNqfLXP+hAmjTn4IEHBf8lHA4MtjpklwG/12v2f9T6+oVDTjs5+4SzX80/w//K6oPKiswRzDaDQcbLd0admE+Hz9m0sCBLO/zPYd1koMMIz4pT2qQQA8mfc1K14kt3s8QnLeGlbN+U5w13uvWNgu93CKbLcu2CNhxigALOgffPWA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(23010399003)(921020)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmdGWTFuUGFPdnBvWnpXL1g5eGV2dGkrOFlaTzJqdjVNZHF2cUhTQTNHdmJU?=
 =?utf-8?B?YUo1bm5sYi96cStDREY5T1l2aDhFV0w4eENVRVkxd01BWlh0Y2JMd0dqSGQ1?=
 =?utf-8?B?TWtxT0lkRDlZVFkyMVcyWHQ5aXNJd0x5VTVReWxPTktXNkVCYVI4SS92ZXh4?=
 =?utf-8?B?VTZEa3ZXV0VLZGRtd3R4RlA5cTdTQTVvVHVBTmdaWUk2YmZKZXJEUEFJQ2tI?=
 =?utf-8?B?UnlNajdvaEpSM0ZmQXBXVzBZTkhxcm1XKzRjMTRNUFdCM1B2NFNZbVJrRm9T?=
 =?utf-8?B?Rncxem5NanVORFprTXV1L3RZVjB6SHl4bTlvdnJwczcvQzRpOFZSQWFKeWR5?=
 =?utf-8?B?V3dZQW80NHY1RmZTUWNWTHp3cUxySmNTZEYra09RUFVGNVFwN2RQQ0xiZHRH?=
 =?utf-8?B?N2w2ZnByNWtqZExkZlN3bGU0UDhzKzh4T3RmZmhHbmRldGsyQkhSL2FWZEEr?=
 =?utf-8?B?RlVjZmFrc0FDNlJnaHljbFArZGw3WnJveE5yKzNmMUhrci96aEZ1MkVFNmM2?=
 =?utf-8?B?dEtic2g0eUkvYjB4TUh2dnAxRC9SK0JzeHFQUk02ekE0a3ZtbENFU01VUDU3?=
 =?utf-8?B?RGgyYkpoNE1EeEo3MlhFeUtsaS9idmpkbGFKV1hVTjVKT2ZxNk9IanhLbWpQ?=
 =?utf-8?B?aDVVQWtlVW41cUdKUXVhRmxON2FVbVNFNjkwc0RmbXE4UXppVHRVMDJ4ektR?=
 =?utf-8?B?eVY4ZU43UEY4TWxrNzc0ZGN2VEJCeVRKbDJvYjloSDFnT253UUFYYndubnNq?=
 =?utf-8?B?MFVRRTVqZW5KM0kvYkFIZ2JkZTN4dzVEOXNrczZsN20vOFRoN2pPYStHSU9n?=
 =?utf-8?B?T2Zza0YwTTJpclZrY2s2TmJLeTBYZTB4dTljbUNXdVpwWnA1ME9mS0VKVlZX?=
 =?utf-8?B?UUErYy9hVGdlK2t0T0JQemJpdlYydGdBcmJlOWZ5TGVpWmlUT2ZzbjJSK3hh?=
 =?utf-8?B?aDNRUCtvL2grOC9OdUFaK01TWWxITkh4eExPMVFRS0cwNHFib2FCSVBUbVJj?=
 =?utf-8?B?Q0JleHF3YXZaTEd5Rmx6WmJua1RwM1BxSWRmUHdyVFBieHc1ZVM2YWg4Mi9p?=
 =?utf-8?B?OTdaYVR3UWlwOTdXL0JYMjZiUmo1ZW1GN1YycVVuaGFxRWE1eFJkVkxLemNY?=
 =?utf-8?B?WmNvRk4rTGdSUGNqaG9uMy8rODU0bGpRKzN2Mi91bEM1UVdkVVNqemc5UFVT?=
 =?utf-8?B?UXhwRFhiSWVKUnR2OFp6TUN1dHZ4Yld3aVdTYXZlQjhwU1ZPdnYyWkxoWmVo?=
 =?utf-8?B?aXo5Z2o1dUkzWEpKVDAvNDZWVmpndmIrOVNtZVFNalpld1pha1RWZWlPQTZJ?=
 =?utf-8?B?YTBqNnkvYjlyT05Oa3k2MThsVkdENHFnaDE3ZWpiWHpWY2krU0EvTlZ5aWVK?=
 =?utf-8?B?dEQ0OHpCaThwd2kvOXd5UkdORE1WYlJsZjkyTEpnaWdpQ1o3eG9ZVHVqTlg2?=
 =?utf-8?B?bm40dkptOVV2MFNTcy9hVUVVNFVZNVNDd1ZhM0djcjlvNUVvcXhRZmhocXZ2?=
 =?utf-8?B?VnVlRGU1Nm5INUtuRmIydVhJOUpzd21jeWwzZkpXK253Mk8zYjVlWWRXMmhw?=
 =?utf-8?B?TldaR01VNDNsTHQ1Qzk3aGU5YVcvdnNZaWZoSFZnT0lUZmhFb0VQaFBMeGlG?=
 =?utf-8?B?UElRSWJ3dGFxTmdyMStVNkdGYXZNT0RYNVJwQmU3Smk3V3lWb0J1cmhlVUYr?=
 =?utf-8?B?K0NMSDZxdGpacGx2VUU0QTZsWjdnVmpueE4rKzVxSlU0Y20vQUNwS1FJMk9i?=
 =?utf-8?B?RENtYnJzRk1MZlVKbzBYUXdBQmtMeUwzWjYydFhYUXlIa0dqMDYwdHJ2REV1?=
 =?utf-8?B?Y2MyWkVnRzAzZ0Z4c0xrOGFmNjF3akRyUnFDc01DTmthQnBORURwc1BBVWtG?=
 =?utf-8?B?K2lrRXMwRndyY29RelVhRWI1WGhLb2xEQVJRYzV0R3l4eFVsMkkyZWxVU05o?=
 =?utf-8?B?OUZyaHBmS04wdURHdjZ5dVFjQXY1R3pzQjB0aFh2ZWhFeVVtNklPMi9ndkJE?=
 =?utf-8?B?WnVqaVJsWEVVelZiUHl4dTAwQkxWVU8vMnFIL2pjYmtZUEViVVh1N2M2NTJU?=
 =?utf-8?B?N296aG9LS3FYbFhpa0UyT3BBSndSZUtGY1BZbm15dE9TdWdxVlRwWURZSFlq?=
 =?utf-8?B?Z3hmNENrVXJRQWpnbzlOUFQzOHUyNEZCSzNWaTRPR1hOdFpVTjVUVWV3K1Nq?=
 =?utf-8?B?R1M4bVZLWXUyUjBCK0ZHcjFSM1pYaUthSFZuUTluRlM1M3FXeWF3cUQrRERj?=
 =?utf-8?B?bmM5WHE1dzdHWGdGZGJhOXV1MVdDcGhnTUcvSFd0SHBkZEM4NlFYQmZvTm5B?=
 =?utf-8?B?Q29IRGxIM0p4N0NKWEtSNENnOGIreHhqcHZxOEcyanEwWHJReWtmU3VWNUll?=
 =?utf-8?Q?kbzsuwvIP+sTW0HDoawYmfxEDOjHzLIT358df?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b32e0126-c8cc-4119-a648-08deed56dcb1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 09:50:46.0042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvzeigGCzdvt4qP3EYReJnehXrUy7FxyVI+/n1nrOu7rwEq0wcFucchxvo1GEvOpoAyOaySdX3d6kS/dzJqMQVCbv3jDXVAy+kxkkITn4fdDOEM0DS81oL3JQkOu+xRj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7889

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes from v30 to v31:
- Keep the node disabled in the SoC dtsi so it does not impose a
  reserved-memory requirement on every board. Boards enable the enclave and
  provide its memory-region by including imx8ulp-firmware.dtsi.

Reported-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Closes: https://sashiko.dev/#/patchset/20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com?part=6
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf38..38233dd74ee3 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -153,7 +153,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -185,6 +185,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

