Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012060.outbound.protection.outlook.com [52.101.66.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CD63FE367
	for <imx@lists.linux.dev>; Wed, 13 May 2026 14:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682598; cv=fail; b=OOQBXBedQDhE3u6aA/m0O6R7ujCSE045T8ZcnpXFqYILTpiC3vTzWNlCdpwPgRsmMjdTUcwcMDm+ZOuXtxOXHeI7UgfA+9m04GzlzBvGrqT5uy1nWXDkpGtdaeyLCDTJXnesE2clDn8WD2Ik5zPG6YaUaClAYwTLoWelFXwAjRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682598; c=relaxed/simple;
	bh=Qmrrx5OJ6Zcd1pOEMrF4ND4ndxubQH5fHSaWFJrMQBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VIb1aFvT3AFydyOx0W1enxIBF6saTgnArHKcWJA2WMZ+N49eToIzKiEaJ8HMM3WMnhW9Vo3RuhfHntB9slNoGpYc1x8jf04AIYW2JCBaCH2lv1K/8py2PZBGvWo62nIx5QdqyriRdsY9CjlKZgW77hwi1KqAoVw+53Cn9pNFSUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BZNN/L2H; arc=fail smtp.client-ip=52.101.66.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BZNN/L2H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbGxSDy6Ent/UL4j7dFAjyvqCFmbYEwmJPURtutT6maT/vcVLf4sMedqZLazLMFX5JEpC13pEEPRFsrdeCq0xQTvbBMXWVhSb5CMFxyBYQdyzwp9aiL/qnV4ADcVrHd1ISCn9sUH28/8dUczzb6ybccfGG+HM+J0UNnsoNIkdK0Hs4FcbqjpgknSFj9SKSUrOD1BR8Y7k3/9V9KnP4qNeSZImW4TU7qAFPyC1gAMbGhl+OCxXWyqLco7+3+v1nRyzMpbRd/Mf4D04mUknu0i9CGhYwCGmugY+AZS6Lc2EmlKJT746K6aQ7r/jexILSegyIs8S3ZhvT+Uzt9iBIYa8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BX5wnLHzj/bh1jkClxlGja8vikxY/qGYs3UqU0rxafU=;
 b=rVg3d3yQsQaHVmBwjTXhn4ELA5gr08aFp044wv71O6vjEWJrytnURddN8DybF4+jtRZj/m4HG2KjMjzsIadBUikotG+IQQ5Qrqw4Fm4xWo3JOvTTSVIEAwQwgOK+PR3Tdk4k8d60qAUQ5wWmp1ciuMxg1jXWZsx07AhdBSwgc8ivb2UXygVPqdof7/z/V8kXAdw+9dXLKmOx9olVf10UJRtYNdtR15eu7SrRN/sl8/m7oWUvIptufI4elpdVjd2y20YyN0RgYBtWWaYOa0is+lWqc+Qf2bJzmVBNUZDE9wc3UwY6y/iAZbY+sZtUEBGnpK5tEC6JwNcFm7oWrE1U1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BX5wnLHzj/bh1jkClxlGja8vikxY/qGYs3UqU0rxafU=;
 b=BZNN/L2H21kb5tyZzP0emzjiokoNa5TIPkzOS3tRyjn+jfVre3FmV1aBZYCgZN5R7RwyKJABXR9sWNP1yKg2PzmwH8/O9VAPSeo4fI7Zg2QwLWuR71QWJ/NbnjVVy/tuzOUfgPQVXzKVDDuCy0f3kgYLvMgjAAr6TC0+5AO3zyVSJTf05tD2B7tFup7RyKEwF4IVdKHwOfyf30suxoImYyBo52FmRbNGH1fXo4xFzqSyDQspxV9eNfREqFDxiDGr51j8cdLNOMcD5cmuvN4AZ7lPqVJJ3SZ3pl0SU9GebF7O5J5ZEXrAV8qxWH/G1sCQ/hcZXRCP52uMemqFZBFS6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by VI1PR04MB6815.eurprd04.prod.outlook.com (2603:10a6:803:130::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 14:29:52 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 14:29:50 +0000
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
Subject: [PATCH 1/1] arm64: dts: s32g: add SAR ADC support for s32g2 and s32g3
Date: Wed, 13 May 2026 16:29:48 +0200
Message-Id: <20260513142948.640057-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513142948.640057-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260513142948.640057-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P309CA0009.EURP309.PROD.OUTLOOK.COM
 (2603:10a6:20b:28f::24) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|VI1PR04MB6815:EE_
X-MS-Office365-Filtering-Correlation-Id: af124d6d-5ca4-464d-d986-08deb0fc1774
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
 0cCs+uj+dAx0yUikJpEjwU1MTrrUiSRI4bLhAVe7Gsh0LfGDDnN2gWwfhMwoN53TE0KzVyRRfVvw2/41Ddy+CLURFI9S8U6e7lumZh4CuSRPYn47VvZzmLMGvsn+zsTpBzuUvKQpv0ZryIKaFBqkCAHzOGi+GbZ6EBAMJAwfOrUgnpUXn5725O+mvM86Kvrt9ShSxa0DHp95HXXiZ7dFZ6Uz3iybc1L5Nd32+rmEolJq48uWByXBV6++Lx8X56RoOcACtvYVBPi8GhzHlctqKif/nQ91X+8Lygkd16FlO6Qv5zH+v2DFNKwO4QrDL69oehb+KY3/fa4TSMO06/3pRVyofuykBhakszyr7V2ElbQVm917Ptd9ASoLLFci/wBufhXg+WiZM9TA+NYjqg1PBiwj4bsYnW+tSUlxNh6fqhHkVBv2DLAoBNrPGEhWmrYP8kSokAwyX5MDtkk6uGD46O1oWQeasmEsivhP0u9dxMW6NbzkB4qKJRqA3OsuYLCIf29Dg4U3rVX3JuHuW80MKTnDRI7sPksAKmmei9tXx6+ongRtaaWxAAI7Itl4opyZjxvyd2XNTQXnYe9o5eIyF5aVGw+LrZPO/1thuxtfzz4TEvuLImEHfofP8C/c9U6QcEJPJYxr0mY17LGvqo3kXVLK5nEgSx4XkbKz6DYjTDOEbVm39LF6p+UUbHuS8sh8
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NG52elZOWDBZU2NQUzJkMVJWOHdoMFNkdVdzZEFwU0g3THRYR0tQODNSdWQ1?=
 =?utf-8?B?ZFpReWhLM2d5ZktWa1UxQUlYVytKSHhaNGdldUtLWXF4c2VtWGRGcVp2UmM4?=
 =?utf-8?B?SVIvMnNwOGpEcVBPQ1pmUzVDaGhFbXNkS3AwWkZzRkZVTXQ2N25kWHdLSlJD?=
 =?utf-8?B?bzdTTTNNUDBEVW9HTzRiRCt0dWt2TTZnczQ2aHl6TnlZQjQrWjQ4QzBNc3BP?=
 =?utf-8?B?VlZnNGhRN2RSWVJGM1ZDUldZU3NTUHQ1OUROQ1JDdUEyYncrckl2R0JNUVNk?=
 =?utf-8?B?b0JaTnNGSDMybUFZUEJzbDJ4ZEpBWi9YWGNjbWtpTEhQL1I3ZGJ1NGdZc3pi?=
 =?utf-8?B?dG5KRVBOK25ZMi9lRThnYkQ4Smx1TjM5R29Iek1DcnpjZmNvc0NTNGxDRGVL?=
 =?utf-8?B?YXB4eldRKzZ2UHJPZmpOTGErL2J6ZDZOcktGbEFwTEJMdWUwVzVmaWZlOFJF?=
 =?utf-8?B?SHNJZFQxeUpOMjR6ZkgwbXFxSFprMy9qQzN6dzQwbnBVOG9hQzVraDhzb0Vn?=
 =?utf-8?B?cERXYkgyR1JkWFU0ZjFWR3JseW9KcXBxYTYrN1pmTXhYS0REZU1kbVBaaVl3?=
 =?utf-8?B?cFlCUnBoN1RrazUvUGpyVm9hSDlUQXcxSVRiNlBkZTNoZEk2cGoyRlo4NEMv?=
 =?utf-8?B?RXpzUG44TnZpYWd1RFRncDJDVEV3anFqWVRwRExRTkptTWxENzRqOVZ6OVVW?=
 =?utf-8?B?SSs4S1RlVVpSY2tGU0lpdEtiRlNsT0VTNWFWNmhmSGtQNTRCdThSTkYwZG9V?=
 =?utf-8?B?WGRodUcwcUtkUjNkNVZwcVc5MUhWWDZ4Mjh5QVNBQjg3VEhHbFBReTh2TzRp?=
 =?utf-8?B?SWE2clhMdlNOZmxNbXhKU3NhTDZ2RXVtY3dydlhJeDh4WFV6UmxEZXUvMDFq?=
 =?utf-8?B?eTBDRnYzNE85OUVvQUhjZ0tLektaS3ZTUUs2VWpXWEhYSmlKRmdZQVVybXJE?=
 =?utf-8?B?dG1EcTZrcEpNMzVvMEduNzNYdEJPTngvMnU0Y2V3NGc0bm9BYnQ5K1BVRTVG?=
 =?utf-8?B?NDlhMmJsb2JCT21oYW5HeGtRaVlqYUt5SFhheDFLdTFyaDFRQlB3RkRQZVVw?=
 =?utf-8?B?RjU0cEVYN0hiY1dvMzJFcVNhVW5ORFdkNGxXNEtrdTk1T0VneTZxUDhMZWpn?=
 =?utf-8?B?Z1NWbWU2M0ExckYya0pYTCt0WFMvUWRydjk1bUtRRDFMQ3VtQXhFTkZKQWhr?=
 =?utf-8?B?a2NOb0tvSUZkbFZYZ0FuajZ2WjloZjUzNVJLYTBxWDh4UXNrZWtGc1llWi9P?=
 =?utf-8?B?VVNDZzk2ZWlUbk15WStINml3RUNWa0pjRTNMN2t1d0YyYnZVMWZIOFhxRFUv?=
 =?utf-8?B?YlhxdW1ZOGhHYU1mbmxQdHYxdzNjVnB6d0phRGNSdEZNV3I3eFZPajZGclZ1?=
 =?utf-8?B?Nzh5VHQ3R2lGTmttdDUrSWRUb1dPdCtYM2MvNW9taUo0MHA2aEJnZExhSURN?=
 =?utf-8?B?V0ZZbXdZR2VmWFhYdGR6QXQ2UFZyVEtIVzBpQXZyVU94aU1jemtoYnRrQ3RS?=
 =?utf-8?B?eVdIMHcvSmlsM2N5L2kzOTNMK0FFdHRYaXdIbS9vVm0zdGwvZGxlYzEram5R?=
 =?utf-8?B?bWE1Zi82SnFRSXFkT0o4RjF3Rk9EaUltUmhCOVBabFNUWjFpYzIzV3RSV0k5?=
 =?utf-8?B?OWx2WXdjcmZsVGRrNnJNdGZiY09zc0pCZStqMCthR29qclgwUXFIVzZHdmxo?=
 =?utf-8?B?YkpTUEQ3K09vUXBVa1hHWmxYSm8vcm5hbDZJamMrSENuN2JFdmJmNm95VFp1?=
 =?utf-8?B?bHBGU2NqUE9QOXAwZ2pvV1pNL29ab3pNWDFIcVhGQmUxWHpIK3VFR0t4U0hS?=
 =?utf-8?B?WlV1S09Vc0lMRlhSZXdWY0J5V3dveitocElsa1gwZndkdjZKQmlMclgvQ1BT?=
 =?utf-8?B?QWtWWHlObjlyVWpiYXVkQ2RtM3VDVnczcGFVY2owRG5mb0wvUnRpblg0TGVp?=
 =?utf-8?B?andGbDJiaklDQzcxdVBCa3loWHduV2YrR3c2ZXZESllFVjJ6dkFjemZxOEw5?=
 =?utf-8?B?RmVGQnBMNlB1Vml0cnJUOVc4TzRjeWpsUzR0WUluSmtIOGhxQ3V2WG8vSWNF?=
 =?utf-8?B?ODVPR0Z0VU0ybEZHQ3U3dnRxNndwcU1ydHFjdEV2MjJqYTNBTitPVVYwdSt6?=
 =?utf-8?B?UlRlZ2FDMm44dTcyRVlFNFd6WThaWEMydnhSa25FdCtkRDNhRDZ1RHlJZ3lw?=
 =?utf-8?B?UEN0a3lZNWN1OW5JYXovYU9rV2w4SGdRUllaa0xXQTJxRFNubjhlSko0SFVu?=
 =?utf-8?B?RTFHL1pHTTZuVnVTa3RHbGRoaGtBU2NhOXhENmNBZEZacnRvODF1TmpMMlc3?=
 =?utf-8?B?L1RvNE9iZkdERGFGUUxtUk0xRVU3eUFFbVZsYVZzcnNxQUJNenVrSlZMUHUy?=
 =?utf-8?Q?mjnHbGrKjlxj34VsjSWVhjmNWUoBMmtQOjzjS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af124d6d-5ca4-464d-d986-08deb0fc1774
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 14:29:50.5989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mr5S+3KGKqDyUcDOyWXKWhZg+/VgRVYhVmin0VLQ5x4/0eEqCnsVF4yWpMLOz3t+VgjMxH/4nLmG8cLPeTx581h2A8SOT6sRls7uE9sxqmtnCb+feb9p6an33eLMmzRq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6815

Add ADC0 and ADC1 for S32G2 and S32G3 SoCs.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 24 +++++++++++++++++++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 24 +++++++++++++++++++++++-
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..e69bd6222511 100644
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
@@ -554,6 +554,28 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		adc0: adc@401f8000 {
+			compatible = "nxp,s32g2-sar-adc";
+			reg = <0x401f8000 0x1000>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x41>;
+			dmas = <&edma0 0 32>;
+			dma-names = "rx";
+			vref = <1800>;
+			status = "disabled";
+		};
+
+		adc1: adc@402e8000 {
+			compatible = "nxp,s32g2-sar-adc";
+			reg = <0x402e8000 0x1000>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x41>;
+			dmas = <&edma1 1 32>;
+			dma-names = "rx";
+			vref = <1800>;
+			status = "disabled";
+		};
+
 		swt4: watchdog@40200000 {
 			compatible = "nxp,s32g2-swt";
 			reg = <0x40200000 0x1000>;
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..1d48d8c47767 100644
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
@@ -617,6 +617,28 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		adc0: adc@401f8000 {
+			compatible = "nxp,s32g3-sar-adc", "nxp,s32g2-sar-adc";
+			reg = <0x401f8000 0x1000>;
+			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x41>;
+			dmas = <&edma0 0 32>;
+			dma-names = "rx";
+			vref = <1800>;
+			status = "disabled";
+		};
+
+		adc1: adc@402e8000 {
+			compatible = "nxp,s32g3-sar-adc", "nxp,s32g2-sar-adc";
+			reg = <0x402e8000 0x1000>;
+			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x41>;
+			dmas = <&edma1 1 32>;
+			dma-names = "rx";
+			vref = <1800>;
+			status = "disabled";
+		};
+
 		swt4: watchdog@40200000 {
 			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
 			reg = <0x40200000 0x1000>;
-- 
2.34.1

