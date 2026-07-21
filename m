Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011010.outbound.protection.outlook.com [52.101.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BA54C0429
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 10:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630042; cv=fail; b=mww4m/OS/KltPtVcL9puzoIHyd6zrv8Q3dywqITUGHhKHiCefAmlWeGilEWG27wyB8jCE5X8YbxIBWMjv3F3eSjDvqdBRGJsezT5TllNUGd0pDmvZDRVpAaIAsGoInhagj5yp3DqrYYps0dsi1E20BtYFlrwWFJG8zJClBq3C7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630042; c=relaxed/simple;
	bh=eisH3ZzrDh+hLBa9c2zZk17ChWgErwwFwnskuaDb/2s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pNVEfkZk2eUnJHPyPGJK58dyhQCv74JoovSjzs/QdBfYS5HtZJHwpaWw++b1D+mPamL0T1xLY7+pYXsZGSDbfIGg/krVxb5U8zDQBwx7TsPksNKGcNW/ahvRNJLTgkRhH0Kav9xZc1RrutpInvaqrMKtMQmLA3L4N6zW1cSqJcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=o7feyemP; arc=fail smtp.client-ip=52.101.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="o7feyemP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3O05R5RwkhQcmYTAi0Vt6SuhO4GvD80vfKm6hDqbWhzBRzia4eBCbFjLyp+E24YsU1E4UGqbObvUwR++ykH/y8c2Ggo9PGzGKuia0hTi5XD4qwh0q15Gh7DASidCdt965xIF0ydshsT0uVDM2ENiJr00hVdxPPJiHlf22RT/X1S5Tc8+DtkE5vyN0X4rBVoPimN44R9Dw+cmmYVe3soxxT4n1+3V9iZElR7GYUJJaS3Ta4fSTRB2N0WZExsl5ZS8FV3s5hruXWsrMNxwDn+jsn3Ejt4NIqwRZpa5NphQeSh5odGYwKHEaSo5PTChrnfgKPda4bH899w+RfZKJdOsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKjiIt9hYDPiE/hdIlDvt855PXBC9SRffRl/W4QGM1E=;
 b=UQTNR9IGbjssOFGauVGcuiwZzBEUWL5R3fQm4ngWxgjyPrrpDl/3gb9b6/nng04PiBYbfMBz8oWBXZXCtmyZ+mrTfISX9/VttaS+FaZpEUk44q1nnYBoVKeixPH5rUnWK0g1tQgNF4QOI6yKt+oPelRpUWoQNqGkQSwIxv7GI0VG4Ig8BefzhgwdeBlo29JlF3K7VZ5SVE57V+QgO7I/5rFPFLkD28MoEtkWe2YmLekw8AGoFqPPZxJ590Bp/6MZHG9c1u2weehV2XBvHZO2CBNZ0QdUXjx4TX4MLoC9TidHeBjt1FUsUFqsu02MV2GTmG2+CZBP45eSV1ufq1EQUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKjiIt9hYDPiE/hdIlDvt855PXBC9SRffRl/W4QGM1E=;
 b=o7feyemPG1Nqxgw/coBN92Cx2W9n/JTluwiBqtrhOSUNpgAUbwVrkc3bwUJo0jO7q8j6Aob733LOKeIPlcFSZ6uYJ5m8EOCcTe+bt5bHWTOug17z7vPoueBAjMVF0f8v0DsGUNv0BhDhQeuFtnBKoeMekiMyM6o8WUPmlLYMt1RQ7pgtTuShyxb8kdzRSltZVZ2T+HM2WzjVuSxj6e/xh70pUsm++w0vI7iebDh5rx2R5NwhaKtCOFEKemRu7s0q5f+yUvBeYiQMvf2C2kHL1QXqqOwUhbnZxd6V/5IFU+msVBNGXTJy7YSxlCszHKl3iRaBN9K1EhNGIqHWMk79Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB10042.eurprd04.prod.outlook.com (2603:10a6:20b:67e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 10:33:54 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:33:54 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 21 Jul 2026 16:53:37 +0530
Subject: [PATCH v29 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-imx-se-if-v29-6-04a362f4fcca@nxp.com>
References: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
In-Reply-To: <20260721-imx-se-if-v29-0-04a362f4fcca@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784633013; l=1315;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=/Cm38yt4M/hkBFoKCi0zK1fscSGHpPw358A2kZ01vrY=;
 b=SQqYA/h+cQ46vwaFSws/ZkY3OKD+MyVvEhZbiBq/8Zw3cLJQSrGPOLtrSPbe82jyeercrjBMs
 wWFbRe8PByeC1ajUfIZgDnwb3BrIrB0cA/1rpXHJu77m6EPjnOqj9QQ
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SY5P282CA0070.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::16) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: df106d52-bd29-4336-9b43-08dee7138fff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|376014|1800799024|366016|3023799007|10067099003|11063799006|56012099006|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2PUD4T8/ZnO6QWnqnZPlTXYQYCVx7aOQNRmJhihRukDCymszaZm9tl2bWqSKOfTpo9qZ2yCYiqRnw6R2fQmjeRcQrZWf+A4wJxw9uxPH24FHMx6ibfWX/a0yec1Qx04agbQJDgCjPTLnGATQBeKUSs3h03f4Tlcji8CRgGdsvjmitgAVY5xUgkDv7e6LYSDUigCbzXq7Bjv4TnuonBIfdKUQ76YS63Kub8ZPRajebsLKSzVpSmCu+GY5tU/h6zsoq1V0QJnft1EPX+wvdc0KwhXsGCQgviY9b4zH/u/XpBjv7NnLcPQ8A4LwczinmRUavWgwLsPPYnSDK+nf8Osj5LZ1bU5KRS13Af0g+a9liSedhVI3kTR9IzQ4C+4IVtLWv+HCxg0gGu0yviwb/zob0n/bt1jJB4fiUpWV5i16NWhduyWT+9xOTbh0FDRz/5/4USz2Ieol3g+yWriRwJmbNBhUJTnC5NoJ8p7ZLRRxl3Q3cvEODr5mPHwtLrnTFTATrCXHw6WbMrW3iuS+ID1J1FlBRPLx+wOvVdwNVv81v5Q7Z1u584zLBJrHMqymF/Xp7j9P0g2U8Ddw4AoMwbKI5rFIaPVYGv1Wlbzv8soDjt1vn3fGDSVRQG8NZcAE7Y7fckn+F8iFse8W1OWhhWR6o2j1aetIVGWeZ5P1wWGahPSQZTZQItRrZGr62m29cvtvzrOQhHdAlN1pXfyU54SjTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(376014)(1800799024)(366016)(3023799007)(10067099003)(11063799006)(56012099006)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm1IM3JycTcvdGVFWlpDNGw3bnlLbkRIRnFpbHY3aFhsY3FaWDR3cndiRHNF?=
 =?utf-8?B?SWNDYldtSmNRSnRzaVJPR2tGNVRKL0tCVDRaSTZXL0NETXc1L2tQeGZEeDkx?=
 =?utf-8?B?WkZvelg4bGx6bEpsSGdFalFyQXY0b2txbVpmcW5TL21YSThhRS84cnoxZE5a?=
 =?utf-8?B?MkozZjMrU3pBTmQ2L3hJWDJMRnp2azZ4YmZjWXl3eDQwMndzcmFVeUJQYTNV?=
 =?utf-8?B?a2Q1SUJJV1U3ZnpuTXRWVW1aV2VGd3NkN3BsQWhoditnM1I5OHErS3poSXFW?=
 =?utf-8?B?TXRIbElJQ0ZSd0tvZlBaandUU1pSYjNNdVl4eDJib0NnWnpWR2FOdjJobFhp?=
 =?utf-8?B?RjNBNmZHaVdkSnkvNWRHZ1JzeFJJRGdreWRtNUVmM01OQ1VDS25uS0tlZzRF?=
 =?utf-8?B?Sml4KzhuaC9CM3NFdDRkODJiZkVhSGlCOVZoVkJvYUx0VWJXemtUeTY3ci9o?=
 =?utf-8?B?aTFDTVErZHJkdzl3aXYxeXdjbmFCbzlUMEljeEdWQzlsY3RwaTdRWTZnMXRJ?=
 =?utf-8?B?SlJlT1UwWndFOUFkZ3FmU2tXY3hLSCs4UU1VK2hvTHFOQ0Y5MkFMdHo1a3h4?=
 =?utf-8?B?bVJUTjZOOUpYR3dtbjY3MjBhRXo1blpyQWgybEhkbUVJNytFcjVtTS9oNjJq?=
 =?utf-8?B?VDhLbWg0RENGUjkxVllrV3J4OU0ya0E0Y1oySTlYTXJRM2lQcW1Sa2lDT1Z0?=
 =?utf-8?B?SVpIdTI0b2NvV1AxYm1xTXQ1VSt5Z1dxYmtXSVV1TU9qdXV5azZIVXU3NGFS?=
 =?utf-8?B?Ujl0c0FXNDRHWTI5RkdMZTM5WlBQZ1ZFd3RmYXlabjYyc1BXMStuOTQvenRt?=
 =?utf-8?B?SmZOU2t3dEZ3WXdGcU0wbXFHWkxmN2g5YkdMaGJoWWJVT3hCU014bEFyTGw2?=
 =?utf-8?B?L0F5MjU0SnhSZDdseUJQcmphY2lqU2VMa2tQYjU3SHA2THY1TCt1YUtQRUpZ?=
 =?utf-8?B?dGpmOFJZRTlzd1pJT3FGeGNXRjRwdkJUb2pIVE5TQi90aVdicjJZOTdLVHIx?=
 =?utf-8?B?aTU0Rkp6VDBQTUlJMWEyUFIwZDBHWGpjMW16VWI2cFJRNGRqRU9vbEZ3RlBr?=
 =?utf-8?B?T0gzYmxldnQ4dS9PWDg2ZzVtS0RtaW5WM0l0dUpLdmFrWjBwUzFEaGJCTW41?=
 =?utf-8?B?MFFocVFDaWpvUEl6SUg1N0FYZmhaMnY1Mk9qT0lEWDZNaksrek9BR21ubzNB?=
 =?utf-8?B?dVh1bFdxd2xVQlZMMGZLc0ozZzJOenVsVlBWYmFhb2UxRW9CL0Z6NUdJckJa?=
 =?utf-8?B?bkpISjhLcEdFaXp3ZHlKaXZReXE5Q0VjRHN4NU9wcXRacDBYS2FxSmNDMTVY?=
 =?utf-8?B?dmJ2YU5rV3AzWW5lWjA3RzdkeWhHM2FCeE9QMGx6V1NqZVE5SjdFTVV5Y2li?=
 =?utf-8?B?WnRHKzFyK2RRWkI1M1pIQmdxQ2xnaFdnRTJjQ1R6bndvbUVOS2JJYk5jSVk5?=
 =?utf-8?B?NUE1Nkw3Y2FwVjdiWHhYKzVVdjJtM3dvOWVpNU15eENMUXNkVmNSbms3UVM2?=
 =?utf-8?B?Tmp4RHlIQTU3Y1owMi8ybXZnWEo3dFJZQUtDR1VPek1NTU0waGtsRlVZcFZP?=
 =?utf-8?B?aDF5WDNvMStHRE8rdkpWNlJVS0MvWUl5T3h4S09BQURFTnpNaWFITy9ZMm5X?=
 =?utf-8?B?ajVHM3RaWEg1b2R5NThpTmwwT0JCeTErWWMwMTJzcDhjSGFiOExic0MrNTBI?=
 =?utf-8?B?OSsxWW5jbG5FZ3BuRXBJYXRHa3BCUU4wYWd6VmhvejRZOUgrd0VOTFZCRFV1?=
 =?utf-8?B?UGdlMzJseTZ0K2JDdUxLYlpjclRYaHA1YkF3dUtrSmJyNVJZZElEbFV2eFFZ?=
 =?utf-8?B?dDZpUmZWNUZGMkUveHJjUUxnVDJTelVjUEdMRklmMzljbFNhRjVVcitocU5F?=
 =?utf-8?B?MFIwbHcrajdDSEJndUpZd3VWc2c3aFBVTnYrbVFUZ0RxejY4U1lSam4xd2s0?=
 =?utf-8?B?cTZlN2s2OE1KWmFWMFVENWJvMnJCUVowZnFsSzAwWmtTN21wcUhDZ2RVSGNv?=
 =?utf-8?B?RUhTZUFFRlpHeFdESEJ5ekZ3RitOS0QxaUR0cGdXc3RjRVBPT3dGKzhUUnVa?=
 =?utf-8?B?UnkzcVF5M2Z1WHJrendJNmFteko3elVDWldTdHByNDNhU2FuN2J5QTlhbS92?=
 =?utf-8?B?eDVtUUlGV0FobzJ4Q3VCdkNhbkFLNDhXZklBQUhpNWg2YTlvWGttMWlQMG5T?=
 =?utf-8?B?aFdIRlB4WHpoWjh4WmtQZjVwTm9QS3RPaytFNWhCNTc0MlZidXBDdEdFdDlB?=
 =?utf-8?B?ckRBeW5tSkg2OWJWODNRS25VYzZXWEJ2REk5NmdYdjBTNDhvdDYvYS9FVjNp?=
 =?utf-8?B?UGg0aWMrTHBMdS80ZGNodkErVDJXQVZxQllTMkhUWlJOdmg4TisrMERwWjQ5?=
 =?utf-8?Q?qZVGz7Ov0iMzyMf8VqbJmuWcRSlt+yzVgxoAB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df106d52-bd29-4336-9b43-08dee7138fff
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:33:54.0581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFhXE72C7KxozNYo2FGn8fC1q1bcvESrAzr7dRfB5x6mqxqQ1CVL/ysT9lfomJC4XerIw0NmoKQpntrRzpve6ePfV40lhvcxfTDV+UERoCm7RGjA/+jJBc/vzs2B9WX1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10042

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

