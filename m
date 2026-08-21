Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013003.outbound.protection.outlook.com [40.107.162.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1272539CD0C
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 07:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787297580; cv=fail; b=KGoqDI3OUooQexjXm2hRx0kaW7vfO38vOQTtp6rDOWe9nW8DnSxykdOrOA8heRNbkn2RRYB71r40LMa8QRZoxn9mwKYRhEIVR6vfmMPsWYAVF/twBIlBaoLblu/XEACHHGpgT4/AZ+75jeVFY8QkrBhoSyVVisuBwScRq/n9Cf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787297580; c=relaxed/simple;
	bh=SvjmVxHpX/hgBe0iVy00oZ1C75QjIjSINEhU8j+fUs8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AlgS1ZGYaTd0t3AhzAeQbo1R9w+h0XVcsonwX66/oCpI4Fo5GPPI5ZA1tZ3gqyxvSJmkM39HE4IsSrhSrXE+ziUgyt1230L2UDddxNHS8Xy/ytdayZ47mdADcEoGgfs6zDVBB1TbvYSMVnY5udKthXiLWov6OMhUWBrSTCZP8UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pUsz+Z31; arc=fail smtp.client-ip=40.107.162.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pUsz+Z31"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ab62Fwaktgeh3mOJJ241eWgUlHwwjdO8Jh50mxTv1l+LxIU5w/WVz/IXAFWrD/sdF2dTiOG5c5YdO0nPAZXFA1DRwANUwmELBiaKv0W+8r6RsVmpx261CE/NXOQ9j9fulhBh9Q8UOTzeGOwFtl9udLZI3v0IyZrNs+IV5Mh3QnuXMwSec5d0nJOBc4ZV+y0UYRt4UVWZQ4hc2zOvTNJT4RjmRHz1zenN7rBns35IJpaIQmIs79rNuqFEehqPVK5rfvDrFUQ//5yQCngzhUxYMCF43nCVQHZ4ulKVHP66efwh3ByTD2hXhSM/TJgPTJ5M16yV3iSd3Tv4OGik30h/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=ilPiB4hB1vOdqzXEHmaSikmC+RDV111HzUW2JJzfmdlOFYEIZ3eyEq16Iny8lYP+qAtXSnHxDANSXEq1akp+wCceW+4+OE5rxKxS8jZ88wXekovMBNdBozRdrAASPlh9mYkYPa0aO79t/Nc9Qto9nIE43y3n5v2xs3sunhbwa5Hx5uun7yUY5DbtadSOaH4MQF6myU/YXU2D6/PubD+z6ZOhSKA/wYRtyjo30UZ6v7jc3sWRE5c/Fb8DljqSFME+ASkxL/cJRtiPXhfyYdi1ybn1zBL7/a38TCU1589pBa3sBWptrX2yHqI2+SdxOP7IRJCYWPLTTWPJNiMVzJ71Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=pUsz+Z31MVTeh/YMEGJpALrXRgjxHlI+Rlt1PiFuQMw75fcL0qXW9kLUNYfN+rD6x3UJ0CLbGemFGP/uN9ef00iJ2ywlp05U7A3z4drS2BbFt8EWf6B9tAWAhd3RRfNZpp64RJKlXPcA9x9UaTLPjv9CWKYghsIlXehLkW1C/LXVjYKVp0VCJ0taMYGb70s7f6mTi7BM4Wv4PhylGk2Wv5uisgMVJBBUf3rw09S924r+vEUIG33lI1oBJIPKDKC4+R62A7BDwtyHdeIB93+NpPRnR4Ky4Cnl3T5dEJIIOknuYVpsXxrIyud5B5gQd3tC0bUvzTdWh4zlTdbT4R17mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PA4PR04MB9392.eurprd04.prod.outlook.com (2603:10a6:102:2ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 07:32:28 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 07:32:28 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 21 Aug 2026 18:32:23 +0530
Subject: [PATCH v39 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-imx-se-if-v39-6-41e4257c2afc@nxp.com>
References: <20260821-imx-se-if-v39-0-41e4257c2afc@nxp.com>
In-Reply-To: <20260821-imx-se-if-v39-0-41e4257c2afc@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787317340; l=1532;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=Fey7Yf+dWHev0BhTzN9X8KrA/PpJDRs7p80ZHkKltXs=;
 b=Vfv94OFxb/kBQoiZNZmg2Vb3I+zQDL8VbtWIy9OvcL3Py4IeL375NU4SDv+6RDjMlZi3B65Es
 uRpnaUjhX5+BAr/e4RbosfnaVxDII69+wnghVAyA/E4Nta1PlVlZI4V
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: JH0PR01CA0103.apcprd01.prod.exchangelabs.com
 (2603:1096:990:58::7) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PA4PR04MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 72b23ba4-f4cf-4996-1934-08deff565a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|23010399003|376014|19092799006|921020|56012099006|3023799007|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NeMAtMLHVrPdEbKLUCk7by4bUaglMb+QFgpTAeScZkREPl8bwOcT/l+ZSwKt+JgqoakfBCdNZOVOOkiRxa0H+hBlGmNRFmQPZqW09hXEtAAP4Rpj1tsKKB40k7wk0/1wJtIeNlBjUi9cuQfxWESer0uoIUlbOA654wLkqQn9Z/x9nCjnOPvbe5x4vX+pFDd8UoOTfajMpJ5bwuoGjhssWb5Hnfz5I2V7QA1r8NhdQNqjhFsSmeFIl+YLPIZvdpiu17IrVkOmO1ZXGOi+ZVQS2L6skyJL8hRfAFf4GmX7UDkEYoqAoz00FRPMqYlK+gYjQhfchAmDacV0ym5buKWvwLo/YLTmd7I2xT1+ZO5hkhIQO3LakNr5lvPnjP4r37UWVOQHJl3gemXx6f3ah3+vpQDhBFMGunlLoQk/57/rRE6O2km4X66Kue6EQF7X5cSwPYEuGusOeHL7ejkzMe9eHjxqRattAYtr1QoDuyaGeV2HYTuA/dPMWCA5g98xambhSr7vPnESSUl6AiM0POM0THysRVXhgHa8fWszVRzPc7oM0H5cKPmylzo/LMZvhsFuxf1krpPEmmOz12l5e6tFr9EWltFp2fXBpgvJ/W+Gso9yvQRHlzJ/jxHrmdiYokLMYTus3cATeZwOA2wy+yGYDvy5FrzOqeZZRaSjODf1R+ATufs00zFSxrpTIGAe5wZa6GSj4r/EGbjzmMrrPuUyXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(23010399003)(376014)(19092799006)(921020)(56012099006)(3023799007)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1gwOVJzdHdoZUtGU00yREMxR0FHdjcxNEZTd3Mzc1BrOWpQcHpNQTYwZGxn?=
 =?utf-8?B?N092bi9velIvWmVsNCsrb1dwZ0VCSnBxVW1NUXZGVmR6S2dUQjl4WEs4SkEx?=
 =?utf-8?B?eVBpWE9LNmpUeXdPajBEN1ZCaU8vaUtwbTdRVytBVCt5aFdzRXU3bngwQ1o3?=
 =?utf-8?B?NzVrME51SzArU2MvQ3d5SE44WTErenZKRE1UWkJWSDdWdk5BVFZKRzVmSDJX?=
 =?utf-8?B?eFgrdlBkR2duR2d5clNOVlZDTzc2RFF4d1FkazJCU0xKN3lsR3ZZcHhsUy9w?=
 =?utf-8?B?T2c5L25oQ2ltelFkZ2psQWczc0hMTDEzL3kzcGc4cWY2U21VQ3NoOTdQK2F4?=
 =?utf-8?B?dmdyb0pjazBFTjFDQ2RDMjV5dUViVUluWjFKZHB6d3E0R3dZZEwyL0RtYXor?=
 =?utf-8?B?S29zNFZpMkppTE5JWFVIY2tQbE1QczZPR0FuSzBKWXJqSXZVa1dhendJVEtn?=
 =?utf-8?B?QW82VUNvU05YZVQ5eS9tekhlTzhSVmdlRlo5SmhmYXFjRnRJdnZvN3V5eXFl?=
 =?utf-8?B?UzlLQUpQVXltbUdPVG9hMzdUOU9QN3U4UXl3T04rcUdmblJFU3VoMVkycElX?=
 =?utf-8?B?KzhEWTJtWW5OYldtMjZrQi9xVXhQdlYrUGtUb3Z6dmRHQWc3Vit6dFV6aGRS?=
 =?utf-8?B?UHBJWXJzTFJQZTJwRnV1VEJaY2JGR2krWFlWNDdrZGgrSXlTTVB5SXJLYUUw?=
 =?utf-8?B?MFZ5d21CMmRleDBDTEtZcXN3WmtScXA2RUpzckg1OW9Ja3I4T2g5Qk5IUEJI?=
 =?utf-8?B?alZ4aitIaFFDa05aeTM3aFphRFNGQ0J1dlZNem4rNHZKQ1R5ODhVZzZhMGdz?=
 =?utf-8?B?YlZ5M2NzdVRJVGtUT2tVUHpDSWcwZ09JV2FPa29tUkg0L3pvV1RoUjdGamxt?=
 =?utf-8?B?SUhEY0JOWmp0U1YySTF4M1dacnJGay8ra0pXdWhod0MzM25NQSttZEtsV3hm?=
 =?utf-8?B?MHRSekYwZFdJdjZ1NU1ZQjVCOWEzcXpwVU1HU3dOZndqakExM3llWDdIOEtv?=
 =?utf-8?B?bm00Uk1QQmRpZW83NDduZFNVeit4RXhwZ1U1aVRBVVZtSUFXdFI5M0RVdncy?=
 =?utf-8?B?MEFXYW1SbHg3WjgrRStQT3BtbHFRWkZNejZVTVdoNElzbUpZRW4xTHBHVmpP?=
 =?utf-8?B?WkJiRWlmTTdmclFaWThiaExiajVWR1hvcW5OL01XaDdqelBDbmFXYmFuMmp3?=
 =?utf-8?B?TDhFRlJjKzdjM3NBdFAwbkdWbkdQWWwrUW92aTdEMTRXOFVOaU1EWG05REV2?=
 =?utf-8?B?K0VIWFBtNkRWZWx4STJqS0Y1SEhub0toT0lUeXdWeVdXNVZqWnRybGoxS29w?=
 =?utf-8?B?Qy81cGdwMWdLYlVTbEpLN3pHWjJraVR3bnlSVjkxbUlMMmk5QzRUUVk5ajFv?=
 =?utf-8?B?OTZwc2ZWc0t2YXNDa1gyQXVnNHQxd2xyNnJnK0hoVmxHYnpoMjlvWGwwS3pL?=
 =?utf-8?B?OGFXWUNsa3loU3VwK0pwK3ZHZ2JwelI1MHFYK0tSSzNKWGVETmhVckp5M2Zi?=
 =?utf-8?B?RU5hNW1kTkQ3Y3psTXNwYTkxUlZmbWpseWNxK1hFbEZVbDZMdm1CYXR5VzE0?=
 =?utf-8?B?d1BjL3BBbzgwN0paaWY5WThMUytvZjVqYWVhREUyZWN2NEcvUVVrb3hOT2tt?=
 =?utf-8?B?Qzk3YTJROVdyREZaOHdieWJSOGFIdnh5UCtlRUxPaG95Vi9YSXBWVGp4RGtR?=
 =?utf-8?B?d29lRkk3MkRxY215Rk1aL2xCQ2I2OUVtSUUveGVIQXpBRitsUGpJUklBY2dt?=
 =?utf-8?B?MUY1Sm5NbXkrV1dtU2NDUytCcmtRclA4WkgxM3o2djNURkc2OVZHcDNJeSt5?=
 =?utf-8?B?OWZsS0czN1EzVTNIaVNEeGZlOSs0NWhYelp6N3puMmNobjJsbExUS0dwV3JO?=
 =?utf-8?B?OGNVQlllcCtuT0x4SFhDZHhYQTF1T2N0SnFJY2Fmb1owWFQwejFaYUFSWXZL?=
 =?utf-8?B?YVhLTW02MU5iUUt4TFJlbFpUNi96c0kyWGR1SHdKdEVXOWlaNW5Vd1Y5Wlda?=
 =?utf-8?B?d1g3SzloNEsySDBhbjFLRXpxdDlxT2gvaENwTU41dUtJN0thWk1XOEY0cGF0?=
 =?utf-8?B?cU9oSEpteEJqVEc1M3o2MkJ6a0JBSjNIZ3pjeFhTQmFvRDB6RXJrd1ozZmVE?=
 =?utf-8?B?T3B5ZE0xbW5wclF3RVJXUjRFV1F2UnhKRUZBZUxVNDBuN1hzdWpmOHEzeEZi?=
 =?utf-8?B?SjlJYm1EWkhSSFpxN05nY2orTmgzcC94eTJwd1R1eGpVOHRzMEZ3N2FFdE1X?=
 =?utf-8?B?dTB4UWdnTGhGR096R0tHcG5pUU05eGo2QUE4QkxOQmlQZG1mSitPdFN2RW5W?=
 =?utf-8?B?SVUzeEE1QXo3S3RMaHc1QkdYMDgrdkUxR2xudVRTRGNjUW8zT3kvUlBXeXpr?=
 =?utf-8?Q?xCzeqGrnc4Kvli+ayvA7W5K+f11IvuNTGs9RV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b23ba4-f4cf-4996-1934-08deff565a55
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 07:32:28.3952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Eh2sCYM6kxf0NXmzZXRyYMr3oQXcjLvQKPj2kT4VThwoDaZl7loXUBdmhL1ZZ0DGovDsFrvsd/Y+QG4dGp3TdykIWyIKCbaUApV4XX7ZWN/RCEp+a/Fhb0aKBNnuQ0D
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9392

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

