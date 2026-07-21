Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE32448165D
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 10:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784630007; cv=fail; b=c3eFQh4QKnHrfdjkmoOb5qEnPyI8tHi20wWeuid736dFXLbRpkLaIouzMj+T1MOUTRI6WgDQ0Edq97c2PXtcLrfHPFLZuHamC2GbgqQMxUbRLEXLS0gjCaNP9mVEpPG7uYvIs3dkdk630M4lPepueMBAEWmwAPLoLQcba909fIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784630007; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UymdZIcEZruLdoQhQalG6joYrbqUMFj/fYsEfIzFFoa9MYV/qxrP264WIJRpGACR0F45MC79I7MWe+qAWAY4merjMUop4VEOENBdWQNDJeoBvEj8xOBPnwfyBaPo/Ba6O9jDp+J8W3/Jy50BwNsLQ82RNsEk7ZoS0lEE5UYqL08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sChPdV4h; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sChPdV4h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfqj5AT8+xvBdRTYotTblfmLGdfCruNA7FLHO+UgJSQKv5opHyNJ4MaPmx89xMRcB/JW7pYKJs+6+7EtK5Mk59p1DCSNgfZ3oczGVAK/bHSq/KP0iaTrFNqfiraEwEFUgHupFMrq6C106VsW5H+d67CIH2hbRJY10kfpwHUl+noWe+rgvLBatziNLF2uEzBq6NTu//R5FRl0V1Z5WlRgv+Ywuji1XR/yTJTMrJNdSkXmwjvZnJP/5JzxjuKJNrwHihwZ78k1eYaTn4uysz04laYD+v7DzD4ekgkvIMvR9DuMUyf07oINBgwUTco+t00lSvim3Enz1CWfJ5LcBmcyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=T1785JQQZC7YgYxscGLLSCqMNN0tljcishdHZhD0dfHhT2okMjOdJcdZ/H6fBNcbAVvrichj2ALAq78bF0+ZnIPpqRwUen/T/DSLbgmQgD2dHnnxgQFO9JvyjTs+uvz4U+33RdvrnpaHvCOYy/wT2bjwShSPH5TTGb6kEaxgMTeyq0MqmIC3PwVn9ZGGkbge95RCWYL4XAG3riNk8DRnycuymnHtlzNDN8LCLQCe7EHG5XCimiclJonnbL73IH3yZGUb2/Bnyj4qEnCtrpsQXdVB0BGFDsoRSE++buX9k8VRy91SYrpzaIGzHgmDQkj9xoPCIGGKigKWa4CbwLkadg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=sChPdV4hfYj2G/Ter89Oh78qEwKCKhaXhrJI0/wvgQ+606drT6SGWPSIQ5q7mtOfGXkrA4jBpA6Z/BUN4rG6hT8Qpj0VBdmJUIHrto+9AHfG434eiCMFxA8hBnpWjnJD4k4xq4FvvzVRj2424mHqk50tue/gmnfHwrosBjwVvRcsB9sGNLzXKrofKE5EqmXm6GThx5vzZ3wI8HoJAqF5mzi81c3xoBYYPVn7ypljavGDk+FGRaayJjiZJntisgdfwxNfUSs61q1pBIHkvVuUUQtukoLcuZJYgz/U/RhBr9ncKltD1iufBMvFLmPklw5dXNRmhjQ6pqiVX7u7Qx/1Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AS5PR04MB10042.eurprd04.prod.outlook.com (2603:10a6:20b:67e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 10:33:15 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:33:15 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 21 Jul 2026 16:53:32 +0530
Subject: [PATCH v29 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-imx-se-if-v29-1-04a362f4fcca@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784633013; l=7403;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=p+9zKJZCAWaWDprHH5v6SfyZRjm4Dj6FQWnIfq/F7np3StH/P8XOwwiwgNHZoW9630MYjmvWr
 HBRFQu8adcCBd/n66BZlIHR9JnCs2CW3Qtoxo5p+iD179k0r8MquRVA
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0167.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::14) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AS5PR04MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: a70f0ac2-e723-42bf-4d17-08dee7137907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|376014|1800799024|366016|3023799007|6133799003|10067099003|11063799006|56012099006|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CoC3Jv7mMXCAEs0b7x32KPFcbDuWGEtUxCuwZRB8WWA1vsNe4rP4aUb1FlY52rOOUkhkK3ZHfjMmq9vfKt/AbVIfItLQAF6UA0U/ReMrK9I8ebmjE3Ce3iLpQ1VFsNP/cujT+t9OJxY4s7yKgGzLAccjL0E87OIt84qX/FaSBIJ3Fhfuk2TWoMqZ5Rnv8NerA79n3VxbMBTM82opcqydccUvBsckJKv+sjakhgbpRL6Xqb494ln76qCEnKvMawcZ5TQEMTeXQD2Xyz52IuEPpSfRETyurVLZUzvk58g+OefMVOS6ukKqsseTYr1YB7onRq3ppseXCXkamaabm4zGiu8aFpdi+tFRrToIv4ggfi3+G/Ww4567tpF3DIHhDVxKO2Bhfiz04XyRydBB7pTvH4yq+vVg6MQ3KjZCWH00TVgieO0+EoPHzEnxyYejhavl0acB04cih8cAVwptEOUDvCEs+FsqBDhF29qRogyvD2iVl1gk2e/FdJsdyY+DRMyKhp+GBVj2sUIU3tmYtaKpyYKSADqFRnbfFlmW9vSwJVcYiqX2EowyRcMaB0SDQI7NGED0+cOWdjcROyLqYwLvzOX/u4g/pMyhFKm4YDYx7mJSnbLO3HmVqnLTXVA10h5w4givuNAo1vcV+L5BdOrJ3WsSXLY7ZAFLfyW8pJqVTg5GhovMvkKe4wKN4CIZUipgV7J5ETKkdYwSwFBAlpJahA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(376014)(1800799024)(366016)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnNUMjVvc21DYlQvZzRsSTZLZy81MEtwSHBCbDZiVlR3b0Zhdm5MVlNMaHlp?=
 =?utf-8?B?TWFMUXU1UXJSdU1SN3pOYjlDeFJJWTczT1FmejNLZjVaTDIwRFFoYmJsdS95?=
 =?utf-8?B?d1dsOHBjaXRSa0JHZytSWmNwbHdOb2FncEVwYkZtOVFnS0lrbWdma3ZGVTk1?=
 =?utf-8?B?NmN1RXcyMjBNNXp1cEtWakVyYzY1ZEZjM0R4OTlpNGwyaWZuS2xVazVWYlZu?=
 =?utf-8?B?UkhrQzcyTndUMktnR2FnK242QmgvMVBOTElsZWF3bFFqdUpRTjVsNUE1Rnlt?=
 =?utf-8?B?TytNN0p1SU1VaVVPb2JuVnFMTUFuS3F2b3NVUTBkWWJnQWdvWHg4V1I1N3Mr?=
 =?utf-8?B?ZGNqbERPWURGRmlSS054MHc0MmtwaWVVYXk3cG9yZUNmWk1BMnFKM3dJRm4x?=
 =?utf-8?B?QmdzS0drblJWYnU1cjVLREtNZHo4djdLVU82STZiVmxyWFhGWTFiTWJGSXFE?=
 =?utf-8?B?OVFwMmo0bEltaHVnN2hJZVFpcTl2NHFYSFhwTDVEM2krYTdsRE9uYlljTEJP?=
 =?utf-8?B?MUY4eDg5ZFRsTjRUNkpnYnc5OW9KUEJ1NmNKYUFUTWxvZlRRcVliaENpL3c2?=
 =?utf-8?B?NHJENDlwWSs2UjZuMjFyYjRMYTNTZTZ3SGxJQ3VBRlRJMTQvZ3VsUEFIdmJ1?=
 =?utf-8?B?dXpSVlJ3ekZzRlVuQ3RZWU95SC9KYzBWY0dCT0JITUdyaHpURUU5cmdGQWVj?=
 =?utf-8?B?SjdMMVluUWdoUjJydjY4OVVwVHpxQlYzOFhVa0ZST1ppK1VwZXI0YWJmQmpn?=
 =?utf-8?B?N1gzZk9NeFphTDFoUGVGV1NBcnAwbTlSanljNUtacnEvZ21LWG5mZ2E4SElx?=
 =?utf-8?B?ek1jYTIwZEx6MC8zQjdTSFVjTEovb2c5dTlKMFhtUVd4NzdITEExSE5rVGpm?=
 =?utf-8?B?RjlGMmg3cUJWR3RxQy9raFBIMFNSM2h0NGkySjNCYlpkT0drd0pEaGF6SEJG?=
 =?utf-8?B?eEVIWXI5OWtuTVNXVWFUWUFRZHExT3FsTGgrVmppVHR0WUlqS3dLN1pldWxq?=
 =?utf-8?B?WU44SDRtTUhrZXFUT1ZuRFRVcW42bHRGZ0ljcFBzMnl4SmpWR1NRVHRxRVRY?=
 =?utf-8?B?aUh5dzhtbEUyK0ZWNEp5SSs0ZzBTOVUyb016SWN6azFBMnJ4VWwvOVovQVNC?=
 =?utf-8?B?REIycnNmTk15aitQaFFObEJQeG1LUExURUlqdEZERnU1d2RHYjdTOFVmME5q?=
 =?utf-8?B?ZmoyckFnTFc4dFU1aWFNeGthUFJkZ2w2QnNlbkpKQldCNWk2THlqdlRISjNZ?=
 =?utf-8?B?Z1hraHBoenk2bHl5WjR0OUNEQ3F6ZDNvaFdNN2lKTWxUQnB6aDJIWVVja3NM?=
 =?utf-8?B?L25ubUtPSXBvT0hPNHNlbm9sVzUrODFEOE13VXNEbnZhdDFveDZPZEpqSW9C?=
 =?utf-8?B?Y3MrYm9MSmZkaVdka3IxWHZ3WlNpTk9EdExYeGkzNzhsN0N5WWFPUS9HdElE?=
 =?utf-8?B?eVV0b3RXRnA0REMyNHhsdm5ScnFWc0J3VzN1b0JmYnd3NUlaK2VwU2txZ3JR?=
 =?utf-8?B?VVZOMGlRNENLUEhta1YrRlk4Um5rOWhlOXZuQnBuWlpPUnoydldtL2MvZE1W?=
 =?utf-8?B?bnYwalV0dllOcTJLNDRESG8vdXRRS3RYTTJycUVDd2ZDbklsZXFuYWE5am15?=
 =?utf-8?B?MUdqeFJVdUV3ODYzL0hDRi9zb01HYTdLTWtLMGlKMm1wWk9mWSt5Z2x3WlQ0?=
 =?utf-8?B?Z256TWF6QVZNdUtva2tKNXVkbUQ2c3FTTHo5dE4wVHh6NW96clN4M0ZiWXdp?=
 =?utf-8?B?M3NmVmhNbjVXa0hGSFlXVCswb0I4TTZadFpsVDNqNy84eGpicCtjYzNRYWNC?=
 =?utf-8?B?WG1yQjVlcTZGMUVoVmUreGNxT3J5WGYyTzI4bHB6Y3h5R0QxVE55VkNHL0dM?=
 =?utf-8?B?Y2JtOCtEL2hUY3RDUDcweFFBdkFKZUEzZUlvdmhyT29TMUJJeHlScC96MmRj?=
 =?utf-8?B?T1RvNEhKOEZKdmpqOWJBMlltWitBd2t6UHR1amd1N1BOcG9xdTFxUVRveGNI?=
 =?utf-8?B?MzlydGRFbi9sNnZQWlZ5ZEFPcHB6b0pWcFYrVWNROHBVK21VdStXQzREUDZ3?=
 =?utf-8?B?a2tkSnhjWTM5WnZRcEVaekdDNjArVldNM28zVmFLS3pNRFpXNWxxK1pualFo?=
 =?utf-8?B?WUlZaDdmRlY3OHdLdWo4UXR6TXRoOEJKMnBOdnRuRVVZVC85eHRYc05FTDAx?=
 =?utf-8?B?VHh0UGZNQzEzTXpJdWlxL1FDVmIwVUpEdXFISXlyZEliSG9pRCtsTi8zY01u?=
 =?utf-8?B?UUNoY1ZQeEJCK2p1WVpLOGtoVk0xQWQ0dEhEK29Na2JQMElUUjdUTjBhYUY2?=
 =?utf-8?B?ZWsrYmFDVlIrdEQzdyt1ekRUdzd6bFVURTVIODV0UkhnWWx6bk9ha2s3Yzh6?=
 =?utf-8?Q?9AaHGN+gL9IhE+ctITAS14Fu+9EzxFfARadM1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a70f0ac2-e723-42bf-4d17-08dee7137907
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:33:15.5829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIc41eC6b4A5RMPVByR8g2Ny88hE7WmbwgzBER9wqTZiaUbShw3v6WKFbAQvAVmA4X7D1+SMJycptIlB/rRsnblYVWyj4Ou3ocb0eM1XfzzGmYZXbX2p+Bs24vR/gTJZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10042

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

