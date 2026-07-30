Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013026.outbound.protection.outlook.com [40.107.159.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D680A36A356
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 02:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377770; cv=fail; b=bBNmEIud7iJrxhQQF4vtugJZVjd+y4qUA/HQK+5ZBtVxluTVorDh0nvsHuxsJrhn3zBeMlj0Yaiun0KNXzo0zNUgg1aaldCueYWbEXVXdeDX3aqmfp0RaQl4JmoCMRa/P4TodIqG6JRVGL9KJOfd22Ho0y4lX752mj6yrIxBO+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377770; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=G7D9sBDqTl2YlXYo9fKdqO1Cjm4nu6Yw/ZTVHzTyp7sU+h3aDf2UuKcCeTN2AiWqVCcte6hbNS7/+F/XNALvOKdg2x05rIVYs1+Zn+zueUVVe64RiONU2zIitPHK2hqLg5rpot+6rbI57qmJkhAg/2mytw9bZ5UsCZKG6/MCX7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FOImaW12; arc=fail smtp.client-ip=40.107.159.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FOImaW12"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7b4sgDtcp6XlsPYj5CXfRo3zQ2UJvkReGcG/R0i9I5SCOvTc+rpmVlY4G7mbBh1TIvc9s8RX1Y8ritjlS0R8Imiv+fkoLXjf/5N5jZpe6pcJTl3HwpI5ZTTxXvHLasFDxLNw2v3/aIh34S0Sx0M1SpQRV7Zb0ll6WptihoHEotUisG44piYtPaZlN0VJtEfX7yAkjBRZoyIgJzIw8WoLnkTpV224tqzTZz9Z7jvyLkDqB/les1l6XJauMWZFl8RgcFCfH3rsUbWH5bMLLYB5u951zxE9cb0QMyhkDhsDzExrMBi2frfHOIIls3UyI3v79wZDxKgq8PW5aGLYLDDvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=b7BrDzbPe+8a0MUeslbl1oa4T0TMrGW6bYIjoAICON6akBKL74mRBfne+rWxC0yaPkoLIiYBuesP38iAGDeMqQromypSWduv/U81bqh1PGtDTJvH910xPeA+UWrCBVf3nUeGQ98xNFGQH04kgwn1TyI2VhFqHVko45vXtzYAevhozhfLH2A5gO9QqdiPbNA1efwv0ErbituiuZlVpqSU6KBFLDc41nNEhRFQwBhsZRfpMffOVsw2tEbXfsZAtlovCEy7q4ppWzN8o1h5wEKIQPcpXZSEHTMv1ZTUkXfmFuYnKI0oNYJ2lniks+shkmGnOw79eZHzv0amBK8cmLyqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=FOImaW12uTnad1DSgFsGJMTLLv5WyhvD0csTtxNuydHrZfdzM5xmlnMF1DHu145LnaXUVUJCb4qzZqTcrkvgVQutmkEYmoa31CQaXM5rayaU6lpv1g8hJ9YLNQ97ZKzeFVSpvx+50vlsri/V3cADJb03WVvVLpBirHWjePjeXNR3arDxZgtQFJha6uu81OdPz+7LNqwYcd6PqEyRV/7RIrD/VlaCCe4KFeBlnH0jhc/9TxvQ1XP1BPvlLZfYaqLm8+VNHkAjkR7EthlE0RqxELVgOxzKBZm3CTFYNMKnKEdR66WXGIU7HJe+Hhyff/rM4YbC9Q3GNJFvGSe0urZIrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GVXPR04MB12313.eurprd04.prod.outlook.com (2603:10a6:150:318::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 02:16:05 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 02:16:05 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 30 Jul 2026 08:36:29 +0530
Subject: [PATCH v32 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-imx-se-if-v32-1-95f56dff4ba9@nxp.com>
References: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
In-Reply-To: <20260730-imx-se-if-v32-0-95f56dff4ba9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785380794; l=7403;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=9N+Eq891jZLXqUXnvpp+XYCEcGkgZxTMfkhcSU8bvBDMpntGaLwryecX8T2aE5yb16plQivtM
 TeGqXNE+XhzBpWZiaY+whFa9od9N2guzsqp83eWGude6uJtgPkdNpUT
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0046.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::12) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GVXPR04MB12313:EE_
X-MS-Office365-Filtering-Correlation-Id: 430dadbe-62bd-41f6-3c1c-08deede08299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|19092799006|366016|1800799024|921020|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	aAHentyTNGBp/0Icxyu9aUkiD/vObuy8Vax3M0rTthiOqdabT9UqQXBChBwnDSqT09EQ++q1Dbtxs78q6HWEMaEqwSdWYisIfs5rDauJkZJBAkqGEUl/lzC3cmuIzYZ/UR125HBXVxri4OyeELYJIR1JijcRTyyBGOFAsrhNVqeVqLbAXA/XCsBChDuzGJ/SY7CMQoVyWkUstt0CZJbAGqfWluH49hXhrj++jApa5lWzYGiakJgyArJslLisNVpK3EegTLxj0bmhpCEyu/mqAsGr2dlldejaNV62FvX33INl9h9qGQzbWbIwh4nybhnukX5dvt3t/HDir8jrMOtYq9rIvV2zJmlqWh/McizTb2vFHGZ3ec3HCeuBX6rooX6ltcbeBK71S9iL6I9ps4FH4bBGmK8U8nNLrrZFrs03a7J1/JnQfYS7SLNf7bjFXuuKxil6boPLV5+h3dqX02vs5T+4SOOyMz2wM253c91ahNqc/rgsFDUlAMMeiLclpYoZr13oGDV5HLwZpTe1YvWmiqyUR4jZNTvc+cYkhkgi/uQZWLCd2BVaiOWbcMwEjKTjXSCZVeWMvrM9pJ+MF6yBQ+SQWPH1iSqVJUdRzGdbVqyz0J6UR2pM9yYZdP0U1rDHGmJS9rMz2dEf3///aYh1o/lIJQmtxs/+b4BjnCShovlCC71jzgyJ7sgPOtAzf03aRQwp0idiodtlZ967aJ2nqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(366016)(1800799024)(921020)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHVBdUtxVFhwV0tXNkJaSEwxd29MaExEbEFsakZYeVBPQkdGbERQZUhiYU1t?=
 =?utf-8?B?WkRKaGZjdzhXUzBaRENiOHY0WjBITjRBL3hQbXRKalpaUGFqcFpuKzVhNy9D?=
 =?utf-8?B?a0wxaEhvbDhQZ0VuR0ZtQTdHbUpPL0tQb0hQWnQzb3pMT2FQMGJ0UW5YeEFu?=
 =?utf-8?B?cTExMmwyMVpIaC94dDBjZSs1QzVBUGJDZzI5TXUzbjI3UEhRU2ZuaUFQVVE2?=
 =?utf-8?B?SnNET0FEeEw4Z1lwUVMwNHk4YkNOeVJaR2oya0R6WlpNOHhWcjRDckZFajIv?=
 =?utf-8?B?TzV3N1cxWVBVenV0UlFGTUp1S3FoQXdIV0dOd1FCaldCT1hNUzkyaVlpSlRk?=
 =?utf-8?B?bnRsR1ZvcHF6cFBEZmlDVVJMc0ttdmdaTmxkc3loZWMzaFdMcFBITGthTVhC?=
 =?utf-8?B?QVVCeUhxMEJmTUVKQjdsekdPQSt1bzVCKzBFSFpDQnBnWDJFakYyMWNyaGhL?=
 =?utf-8?B?Vm5VZmNraTRVYk9iZTJtRVo1YXhKM0Q2eVMxMWY5bEJxWnFtRG1lS0JQTE1w?=
 =?utf-8?B?SFZiUkZJQUVMaE1qdjBsTHdUdFJLVmZXZlpVdW14RlVpRkErTExMZ1VLKzBu?=
 =?utf-8?B?bmFGZThQK1VqSkhBYzd5WU1ocEExWjF5WG9pWXJPWlM3Z2lDajQ4NXB4Qmc4?=
 =?utf-8?B?S1JYTnJOM0t5VGRnS1E1NS9jWHZ3YnJ0WE9ZaUF5THN2MkZJRjNmcE5Fd3ZZ?=
 =?utf-8?B?ZlBxaVVOQ2tvaGVFSXhUSG82aVFXWmRNN3pmQTh2V2RxZStJL0VMQWJCbUdR?=
 =?utf-8?B?Sm0wOXZPd3ZFYnVRd3p2RnBhWnNycXlsRm5NazhwTzVPRmg0Z2kwUXVEMHFi?=
 =?utf-8?B?SWhyVUU5MHdmZGZIZStPS0tCRCtCaE1DOEZlTVhaMlRDWHU0WXZhMk9YUmZk?=
 =?utf-8?B?RHNYME1LT2F1VFRmSTdrK0xxeUxvUFlTSEtIdk5ibU9Ua2k0WHRpemJkclZk?=
 =?utf-8?B?RTIwdFU0clBabm9UQTcxRXRqQTNFcEZ2UThYem10bXRabnRQTnh5RktyeGhK?=
 =?utf-8?B?a2xxbnVDRW5DRUplU2VlSEd3Z3BWKzlpQUt2endmeTgvVjZoWXptRWZmbTZy?=
 =?utf-8?B?SVhOVWNFcmpxY1ZGRm5BQ29JQ0dKa1FmMnVvZjlGK2prZ1Z6Mjh4YkE3Rm50?=
 =?utf-8?B?R1JPRUFMTlFMamVodHNYOGxEQ2xDN0p5ejI1RVgxY1JZdk5PUysrZitETWtZ?=
 =?utf-8?B?d2RKaTUvcTdrL0ZLSzVBanJsOURPV1VXbXJpWWxmTW8xYWRiekt6YVpSbHY5?=
 =?utf-8?B?bkZUTURSMFM5eG8rek1tY0dYR0xIdnBSTnVMazlNaHJJRWxyY01KL2t3Y3JG?=
 =?utf-8?B?TisycnRTdmFWa05DYndoSGR1cXRtY3BraWxqcG1ZN08rTzB3dG5FMW52R0hz?=
 =?utf-8?B?MnhQeW9zNC9jL1g3VDlpcXM0SC9zTEtndkljcTZrV1pIMHdSQmdoUGZEWHVR?=
 =?utf-8?B?Rjk3WTVuTXhMOW15UEwvSCtTR0F5Zms5Q0lENmNEbWVwaW51ZjZSamFLUEZ4?=
 =?utf-8?B?MkI0UUZTOEZLOTBKV1RUUWh6RWM4YXp4YUc4L2FnUTZvYWtzVXR4aTJ2RlBh?=
 =?utf-8?B?cjU5am1EWUF0MXRyUVJFN1BSNVR3WDdaanFuZndaWmMyUWVHRlM0WXI4bzQ5?=
 =?utf-8?B?cU1PSGs0ejJBekM1L25WeDBiamhrWklTRm5FdTAxS2hYTTl4SU9GcitaVkRY?=
 =?utf-8?B?Q21jNVdCL2cyUCs1U0VwcktqY3VpYVc3QkZpSGZ5V2dUM0pWNG5Td3pnNmxn?=
 =?utf-8?B?ZHlDT2RzbFQzY2F6UGtzNGV0VDRDbWE5cjhiMUlSWFhCVE14ZU1RMDhVZTJ0?=
 =?utf-8?B?clJOUDFhWEFtMWFFRkJaL2Y4VGswdjk1VUUrRE8vdXhLSjg2QWEyUDMvdDFt?=
 =?utf-8?B?V1o0bHhtTC8vR3pGUit0Y3RReUpJcCtTQk5aSjZRU2o1bWhIU2xKZGJwRENJ?=
 =?utf-8?B?dGlRMFBub0l3SHpHRlpXelNWQ2M4dEM5b3Q3c3JqNlRWVk10YnlHVWJXRFB2?=
 =?utf-8?B?YVE0Tkkydk9xOFd3TUFtU1FxR1htUzhvUzBaL0hHRy9Ia0pTZms0UE1BYldp?=
 =?utf-8?B?dzBIQmJ4OFhBM3d3VXFvRi9meUxmdVl1R3dxelc0RDdJWUs3UXlwVUFCV3o3?=
 =?utf-8?B?WWRqQ2o0cFh6dTRDSlgyM1d1VU94Z0VFV3JaZmJaaWNoYjhZekN0dUVON0Zo?=
 =?utf-8?B?U2wwVm5pOHZGOWEwNmNqQTRmbURtbzNMYjdMMVhXY3FGV0lYSjRYbW94S0dD?=
 =?utf-8?B?OFdqK2tuNTRrZGNOTFM1VFM5M3ZCVktKTlgrZjAxbmxKNno5OWUySFRTVU4z?=
 =?utf-8?B?N2ExSkhFYlN6NmwrWGNkc3BiYkRYSlF6Z2lycXNhQU1TL3Y3aCsveDFrem9T?=
 =?utf-8?Q?hxVRNC40HD5NPEkastVmBz0jTRZsCMC4D+YNv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 430dadbe-62bd-41f6-3c1c-08deede08299
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 02:16:05.4214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGZ8+3r5XIB2P5v8xjJQIrI1LiOvSigddKPLyy9i6lrGO3Zui6vr8oGS26nsq5HKyeF0iriB0j3TplaTy9Td0RwARQvW5u1XM5jYX9KHalGHYXIWnTBsV+7Zyv3rZc5w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12313

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..6c6fa9a0ba1d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in the form of
+a command/response mechanism. Each client could expose a specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose a specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+MU(s) is/are not shared between SE(s). But for an SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE, all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprises two layers:
+
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+
+  - Serializing the messages to be sent over an MU.
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management over a Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

