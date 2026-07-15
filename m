Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9FD2441B8
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135989; cv=fail; b=kyYgGHpTp5qCgyGQQ5rGRDz0c2PDbsmNlyswwtaVeOITX33w2Wlx2DHKtK4HiluSq25ioehREzbeSdvppg5jCG+EvZve80WinXv/plbBb8Trz+J5dbbmVMfWHcD0TJl1iTNcNNL7/T2YwNUo9I5UhJUvDAOe+FwPgUJtpknw30s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135989; c=relaxed/simple;
	bh=eisH3ZzrDh+hLBa9c2zZk17ChWgErwwFwnskuaDb/2s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GVu3pt0LP4Bf7mhQ4C97ilBpL0326cyvn7VOJ3UPwr7wydlh9T/DZ3mEaHw1Zff3luqrgbQTV/CsZALHS5DwcsbmwRg2iUx6cCDm/h0FUKohaJNVnK0xdaGBIkG/utFNodkDhP62it9CLY7zlTWlj2Nb30GYURIG9INC5Wn2bto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VFHHxqf5; arc=fail smtp.client-ip=52.101.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VFHHxqf5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPceukSocesXKWP+tyw5p3Em+zcmRsNbxBxVJKFGLKK9g8NKCsd/59kx/yUJvXvmcCOEHIz/jG86FVVpmm2KYjPJe7oSaJhltPCRZM2OObgfRjrVSGC5TqCpuLrFvDmJHynOtYHkngNiiUGUNb9OTLdYoQ4kQzJoUNzZZZD1Ji/DBip/Hg7vBsvaBQwyVsztVT2HtPDes4Hq5qLnGldV7s2cREhU+eBDtFR7lyhzzrGzReT5GF9KB7CWtcm/KA9u4fpcYUlN0ZvKF30LBAmw8qTtQXiDYebuQZZ6EJ0nM2IiYKMHi3j5lCVq01LhtvjzNhGuVark5YhdSGeaQGF+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKjiIt9hYDPiE/hdIlDvt855PXBC9SRffRl/W4QGM1E=;
 b=df21Ch+KQNVNfCCeU5XwkzI/LsTVdP566ddCWCfROIykdLrf9IBmPpFsYIHV8XAfRXXFuhIJQlQhmvidn1cPe+JctR/rS9tNehZ7lTWCLCIRDX+xsZgSysRoEi2yrodL4/K4txh8IByg0NOfjQa8vzq6TWgR+5eKMHk6Lo2UU8vRn8YmueZe3mWbGHuEbDb116Gv1hG+tiOKuvvq0r54LnfpJZfx0F/iIEHY3IHW+LpxaPGUfujTrY7TcjfVTxkaFYeLOZ8ucSUU7NmjfmRCLjPwWl3AilX8aC8/NH2T11NueZLU9ZQ06rA1uZccEFipvTDHR3FwwxIo9LP0VI8jMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKjiIt9hYDPiE/hdIlDvt855PXBC9SRffRl/W4QGM1E=;
 b=VFHHxqf5SbLVEVxA1yQstaDGVF7H/i+KIG4TzSpnOhECHOeUAKybqV0nu0JCcL3uy3v+RaWxS5ghy3VGkLBeDJu0//eDceN82rlgX6otiXk3n3HC6NrijwgkPnaZD+kx+H46h/SATvcXSU+7ZRTdlpNN8y6i1FiPP4PU5XxloW7HjIgrFWemI6oHC/9EzRZ0EPVwKbaFvG8QJO3mekYuyPWE9JMziVp22MN6n6weyRdN3NT5VrMlTuBg68o96mLtdGbLdMpgjf1laSUh07axFmPpUI0FY96MeFmPMhFnlV25QKfYKMx/wiwLYgAuITGTiNkm89vanG4oVxZV92ZZyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by VI0PR04MB10509.eurprd04.prod.outlook.com (2603:10a6:800:214::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 17:19:40 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 17:19:40 +0000
From: pankaj.gupta@oss.nxp.com
Date: Wed, 15 Jul 2026 23:39:12 +0530
Subject: [PATCH v27 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx-se-if-v27-6-bb7c45952f06@nxp.com>
References: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
In-Reply-To: <20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784138954; l=1315;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=/Cm38yt4M/hkBFoKCi0zK1fscSGHpPw358A2kZ01vrY=;
 b=+LahtXHoCvv02rvpr6yVQZByWya7JkcR/Oo0YCj9Q1v59+2uGaqhY8hGFOpGac1G+aWMX7lgZ
 emSaDYI1rdzD28Ez7KELG+sek2TrUMxFJsvNUzxt1rJgtfQrOMznJ1W
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0136.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::8) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|VI0PR04MB10509:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b13668a-4e84-48be-8910-08dee29540c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|23010399003|10067099003|921020|3023799007|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9fKveOZcfPCDrPV5j8t/zAxe27drEnqi+W52Ym11N1rkoxr0oEUh4wZIoS1ufoe8zQkcM7L3X16cKHvmNEcxX/ajcA6xDBZ+QAsv7zPPVjRjdLDleZi+9Ie8EKKsbSme5Pv7vsZSARrjPZofLZUXRWgfa887msYHCbOf/BdhtvD/giIIfcL1yo30kyaSyVy3/Lr3eYg6+hBxDG70y5LlaJcHBWtznyYdmpYTnYFnsvqEldvuJVyK9MAqPTK5wfi2aVaeso1aWnkWGNAqsrLrOFRjfdWhN3kS2hfygfiuw9eVp9pf5UTI8QmUMmYCwEZhKGF+DYMV95K687k6AW7Xyy8P1wcUFo4d7LsHaboIgscEoIoDI5QZXbxKFHEFzCYn+4cg3oi1jchDNzdh6OQTRiFo7hr+oKk+1tFQxq2cCTsmjqnvFwdY1g5eBWlXXfyAK/QzaRx8QPbDMEnPTtHb4GqHlJDrXIKi2owQngw8mWY1axJnhSFugng0H02GZlwdt7oIUa3ccR1Z4iVUGoLVvp2Bxl5UnfkDGOCKeIwRHFb7EgO9as54GSpb5YfwKhLEOVeFhhPMjVKeu7Ow/lyYcFSLFhzXKFp8pgqQDuJwaWFzRXZow2QZiLbLbtltMfp1oT9yDAh6yd3z49P8bFnFFc1kwvsVl+iYEOVJojcGauT4dOaAambr1MkuD0I497SoSFaJEvcKcnLYLlOYTZwBTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(921020)(3023799007)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SVNZYThWRmxlNUE4NVFyd1JCekRweWJIL3VUa1QxdFZzOTJmWnJtL2R1T0t6?=
 =?utf-8?B?RStHUU1na1NWZW5rOGFraVBmdDh4aHhBMitvdE4xYlNLZHErVldGdDEwdm9T?=
 =?utf-8?B?U1hBeHI1dUlSL1p1N3ZXUCtETFBpVnU4aERXT1QzR1M3aXZlN29KZGpVbFFE?=
 =?utf-8?B?angrdkRabUIwdlFySlRwbFYvOTFsWFFNOCtxR3g5ckdpblNXM2xXYUtaSDhZ?=
 =?utf-8?B?ZEo2a0tkSlJ1cHJ0emFFSlBRbnRQMXN2dERtckFLTG45VEt5NVVQTzBsRUY3?=
 =?utf-8?B?S1M4c09BdG9jOUVMSjBUSzVHeUNrTTlVWFJSWXZIdllZUGpmSzlReTBTck5j?=
 =?utf-8?B?bVJINUplanU3ckY3UmRIajZxSEM0bjhzRVdIUkRzSkRpM09NcXJhejNnK2pR?=
 =?utf-8?B?UThoM1RIMUMyU08vNkNyT1V3cy81c0FWL3A4bTF6SDBkUVNPVjY0TU42cms1?=
 =?utf-8?B?UldNYjBtN0R0ZVVjdXcrcmhZc2pTY0tidkVmcUphSlB1TS9XTEpNOGRHRVBP?=
 =?utf-8?B?UnRIcnF2ZWRKbGVGNUZKOXRxWEVlMk9xYW1Qclo3QnJpeDZvcTZDVHlTeWJW?=
 =?utf-8?B?Z0FmOHhVNEp5OG5FUG1YS2hRMHl5SXlyengrQ0ZheHk5a2d2VEh0TVN4Nzdu?=
 =?utf-8?B?ZFRuNWpCbnNyVVFhSVJORzYxMzVvVmREVkNkSm82NUlWaFZSU3pUOUt0Vk1W?=
 =?utf-8?B?eTB5T21uNnBtVkltd2t1Q3AzNnVMUlhBVzEralFLNjNtNHB1b3NYanNiMWRM?=
 =?utf-8?B?dURNcmdHYjhUY0hIeFBVSzlzRzFYSGx6WUNhQmJmTE1tOHlBYlVWSVdnWjVn?=
 =?utf-8?B?bnJIZ0JiMU1xNEVoUjVQb3FaK0V4Mjcxc0VPdjg0S0hTVXJaYTJKV1d4SVht?=
 =?utf-8?B?Z3B2bm5QRGlTaTFlTGhlaXQ0ODlaaWE0NDI2Wjk2L2lUc1JSSUhqUGR2R2VL?=
 =?utf-8?B?QytmL1FhQTNpS08wcnpFNkVXb1dSSmJBL01JRFhPNWZtWnZaYk9vMC9wQXlO?=
 =?utf-8?B?ZlBBb2RFeCt1ekFYb0QxVGc5OFhOWmtlOWZybGhHZFBHSTY2aTV4Mmd4cVNJ?=
 =?utf-8?B?Y29FWGNwaW5uYmR2RmRYWWZYaGVNbW1iUHQ0Q3JMR2FNaVB6SlhhZm9HcXpi?=
 =?utf-8?B?RWp3NW1UWWlsU2lSek81ZHVFRHB4Ym0yNjk2VDcvUWlNT2FlWHlrZXROUEJU?=
 =?utf-8?B?TGs0c0duS09xQ1FGZ0dKYVVBSEZXVjk1SEFLSW1KR3BoVmN6NnZVb052amZI?=
 =?utf-8?B?UkNlS3JsSHVzQVNlcHZFZVBDVFhvT0Vvc1RKRWl4VGJ5NGFCTlQ1ZUlhL3hU?=
 =?utf-8?B?dlgvVUU4VE1LZG9rSW5DL2lLaDFZZVVuMzFGejVuNHc1ZmNJSDZMRVJTRlVa?=
 =?utf-8?B?VSthZDM4emhYcC9KYlpyR2NvbkxLMGxRdi9MVWx1TlNkNGRESysxMnVic2dO?=
 =?utf-8?B?bHpTRjk2blFmb1N2RUh0THBPTmQvQXovY2h1UGJvMXlXcmo1VUtoaDlxZnYv?=
 =?utf-8?B?MnFOR0I5UWkwRllMNmhnWDdUdzQvNUEzYktYbE9zcDduVGc4c2JEaXVRWW8y?=
 =?utf-8?B?MnlkWG9uWmpHRWtOZW11TzhuZktxbzZKeHpPclUyd2JBeDM5VjZZdDhqbStk?=
 =?utf-8?B?NXZseDlab3lpQUpUaEY1MlZxUEZNQ3pySjV0VDJyUU5qMHhxb3RkUTdqZmQz?=
 =?utf-8?B?R1o3eEE4NjhjS0RVeU56WUdZbEk4eE9ZOXBoQU5CSTZrUm52WnpDUm00Ym5N?=
 =?utf-8?B?ditXYlQ3T1NmdWVMSGJlTnhkQ2NRa0hNSzdsbHp3YUVkMHpsMVVXVG5JcCtk?=
 =?utf-8?B?ZzIvRHEyTlZVZ2V3VFp6L3JQbXFzV2NnU0xsVml2V3E4Y0gyQ21CR1NCbFox?=
 =?utf-8?B?b0ZYRVJIbFJGR2ZuTVMrWWpRRk9neGpnZlk3bC9ET1hLUXdjMisyMFdPTXUw?=
 =?utf-8?B?WldJcXMxSU4yZHNsWktsUzUvSWYyazBEZmJOUVNhZGp1bHFrZUhITmpGVHdD?=
 =?utf-8?B?UVVvenBObU5NelpIRDlrZytxL1JYMjJOR1pNMXZKQXg4UHgraVBDSG5ZaG9J?=
 =?utf-8?B?VGNGWHBHcVVibzdjR1hwOWZHTFpENTN2eWk2VEl2RVlKRzNxYkttZm5HekxV?=
 =?utf-8?B?UGtUL3NRNHlWUkVGempBRTAzSzdNZmJMRjNRYWNYSXVrcmpjVXFtSExBRVFO?=
 =?utf-8?B?V25US2NqNGpKVmhsY1grZ1pEekpXemN3U0JqTEhHd0sxa2FOOXd5a25DZ3R6?=
 =?utf-8?B?RURxYWwzL1c1S3U4c2tVV2hHcUIya3V1d1o3bEZkRkVDKzJrSXlHNHg2M2NF?=
 =?utf-8?B?Q0RKek9OeHFWSXJhTzU4aVhTbTFFRFRBMWNrUzljbzJGTERLbFBSbW9UZWh1?=
 =?utf-8?Q?78NHQ23KGlxmAQ6AOg+bQjYk1/LkA/iM4h4Hq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b13668a-4e84-48be-8910-08dee29540c7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 17:19:39.9792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gReb3s0V69mF8Qbyop9Y5Xzgg8yYJmS9AE64O4gi3Cn2SlcyztOdZANfqx94aJrf132RMSceXRCvXZDEE3k2F9snITV7Dcej5rBK1qBojK0bSM6QmJzMtdMs0pSuMV3J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10509

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
for imx8ulp-evk.

Add label sram0 for sram@2201f000 and add secure-enclave node

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf38..182f1444b643 100644
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
 
@@ -185,6 +185,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

