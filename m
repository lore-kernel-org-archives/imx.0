Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5D6359A68
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 17:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787592806; cv=fail; b=dG26lt/w5CtKTo6QLpJnoebBlgIE8Whv9exTV/ZwRQ3w+jtTJPe9MTFgSEK0yuqktt/0aLj/2KQT7QdkzOSLHAehqz6BsMMsmAQce0lK1pNTlKfvDt6R7p3+eAc8kn6F+y2fvzOsiwmLBls/BKLcckeiii4W2p36MbLgY/pYQ7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787592806; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ld0PjKCsKdi2xA9K83C8M25Itn1YfECfHUpQ7SrLxANEupRcWx1cAHK80z33oOLDLpkcvYKIJ+GPbAfg5xit6KcFvSektmi6Ujj6t8UrkjS+bPPm4OsaoR2N/mQr6Eanm1f+rGhs5l4feYJ+XpBAfsfr2jWA2Blc1euBqRmc7lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fx6/0ZFz; arc=fail smtp.client-ip=40.107.159.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fx6/0ZFz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+5TCK/GbvqPp/mI4S4pZP6XJ2qtyOyc6FMJRaDinFPuKVcs0R7RL2u3VvjGjIXV9bPQhczo8epzeYSa+KIkvBlbKHSJrV+zvWEZEpk/YBImoubWr7Tku/e5szP8dnupj9cnS/xICbtKuMJ95NG+oOraQqmKJkjRyhvbmSHhoKJvVPIoVYHe7pm5o+v1Y1zkxlwjrbAfgfCXKmSzZwjfm3kBAPPYIldIb5DsAVHnlhMw4luvdZenh/rPxOwXuSptf1yu+yTwAXcGSHJwnGA6IFSQfENRxGp0E+dJkI1LtMiImLJHY268mANhP9TLeJFy9rbnlytf83NW37Ra+kKZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=wc1kBMTQ07D6r4FYL2MzNfPHnGFJ4dKvWDTNKi+7kFim7TUDH7/XQay6IqcA2YVQ5xGu/Ik4FLuj9tBi89ahk9Abbxnm22pDJc2iBxlDQCoxfRcE2mALG2tk/1HFSdV+qgdh2gTTyYW9yEaVOG7VolFQyDHkiXg5NiQg5BukUdKcUbgBdCAeVNkqWh8tt4LkSwPJlCQzVrM3OmnDAxRkadXZEhSL1vU9Sdesj3XsNBlffpgcDyweRY9jO8T15z6EAJyBgNlW2CIqpaIkgihqks6CPAFVtbEr4tVyyQwj97XmB+tlaANBLi8L7+bjNF94WTa5BbORf1iWpzNQ01EeeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=fx6/0ZFztgCqD5nmukJ79UHRkJyZvZOLETKMIpNwOCl8MUbKoANAJfxei1Hj0PpuZRUevQ6kpl0bOAQ3eEeNwUzyNHRm3B2k2Crqj4S54uct1As4b/ILevIGIi7L+C/aFRvYLi6wg/xtg4XQ6GCzgSlMg01QTiAc3eu+07LIcOdtu+2B0TYEfRi3LYreDfzEovfEQNcwh6vMF8TRyRBN4CtbdOE4kiu5hLX5EqZCa76vwIRVo/mGqDVAdsvZ34Dd4H6M5yrODthrDyx7ar6Ij9bQ2YTozww9jgH5spSUfnGzdTQ/6AI8ueUCuU9Xp4khcnuv8iuVB7K9ZHC5cf8Ubg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AMBPR04MB084187.eurprd04.prod.outlook.com (2603:10a6:20b:7de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 17:33:21 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 17:33:21 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 25 Aug 2026 04:33:33 +0530
Subject: [PATCH v42 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-imx-se-if-v42-1-2e8efac0bb16@nxp.com>
References: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
In-Reply-To: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787612614; l=7403;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=jA3PPOUaBF9AoeYczshxSarrFHv+jhuZE3kI8lIDJ6iTDf6X6F0toP7w0Thj+js/tjDsXECf+
 c80IIIprphxAcQkqJAaV/a7oq7Xs4KEQ79frz81aTOKwxdZq/gskvvX
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI3PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::14) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AMBPR04MB084187:EE_
X-MS-Office365-Filtering-Correlation-Id: 20fed712-e437-458f-0772-08df0205ca9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|23010399003|366016|921020|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Hs3txpmJQNRXWbMmluDZWtheLTMGFfwTGPv/qqcv4Q3uubVKJHBTcgmGzV58C2gDPP3A36fiphB/Dm9VA5rxfnBIoJnGVJmNA/qkyzAL5i776/CvuNc3huBz7gjb9cALrHoMjJXgxvLVyqU4smqO1Yzb7zBG8jORzSQWevDGbFqHwyyODu6uimkJ8Jmc+t+uywinJcNWJc8xtuE2pQJ4bCDoQPU57Gb/c+r6e53NUmZFze5Vwm7HQTmG92v+h/eudLa0Vh5i304LO/xfmMy+CGF0Pt0Kh9AShXSyHepQuqYhh03hIuQsF2qbxmmiuHnqcGXEo+7Okj0qgvCinCDr94K+ZwyO/STemtevYZdAbc7rw3UgLEoNyi3EvShHJWqyJshU0nozpXUtuOkXPISrcdIbv/PF5UOTxrnkV8x4yWEKXfhxzDAjbpf4VvwHIoMrjKQ5KVItAtM39sYFscQbceo7plqEjWaPWVcMJKoSLCfP6RNeOrKqSkzTuPHle7C37I4lAWPjABcVeQdUhjxHopzCaNAjSxXq1HhJv5h7SBJdf7I3tPlvZWpuJxXhS5gxq2LTeNrbLs++om5V0ntG5dsf+KvSQO/ugyeScbhMaiAq1RU6dSTmYRUP4csIzoKPmxmTuIjoOgIdiA0EueU/n2JUloEZoGam1O9/Fx1Sn+eJZFcJdCRxcuQDnctQ6RNb450vMtE5QMEISyJYJMcoMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(23010399003)(366016)(921020)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2FJQVpQTVZ4cDExRjU3K05hNmwxQ0t2SjZtai9GL2dzN2FRTVNUMmZVaFVt?=
 =?utf-8?B?cWdILzc1a2pLUFMyNkJWekkvUTlkS3BTV3JhN3pxTzJONW5POE52MkdMMDFW?=
 =?utf-8?B?djR2L0JRQVFCMlIyOWE1QS9KeWdlV29WSkcreXNPNEN0Yk1sVXJsOVdKYVhT?=
 =?utf-8?B?YlVJUDZ3TnYvdWZsNE5xaU5UVi9NNlgxMHZFZWNvRVNzcXdwWEFBL3cwL2Z4?=
 =?utf-8?B?bHhKTHpOMklIUlVXWm5EUlhXZUk2ZEw0MDJmSFZmWExxb0lXVE9DWFgvOHlG?=
 =?utf-8?B?dGhsK053bHVMbXFnUWQ2RDBIRTFBOTdOQkNJZkhyeU1SNldxa2IrendGdDAy?=
 =?utf-8?B?Q1Z1eFJLOUNLNkhGeXQyUG96WHljK2xzeTdHd2EzTjZ0VDVmQ3NQOW5kcVFO?=
 =?utf-8?B?bmh3NDJqQ3BzS0RENU1LOVByZVFIdjg3eDVpeTRVN3VZbHRWNHZZMGF4NzZY?=
 =?utf-8?B?MC9WTkJkSmhUa2pNQzVFSGJkclY5bjBPNGZrT1B2OWdxVVdCSGE5Z0gvbmFB?=
 =?utf-8?B?V3p1ZzBEclY2WGVaUUNzTHhMM2N5M0hyODB5WUZLaTg2VXJ1Z1N4WmRTWUJR?=
 =?utf-8?B?K3VJU3E5V2c3K2FYWFhBbFdhOUpsN3NqTEhWYnplTDVOZis5WGZheE9BQnZH?=
 =?utf-8?B?NXZSQ2pROW5XeEVLZmZyOGx1dndXU0lzVStNV0tXaDBsYUl4Z01SaHlUblRk?=
 =?utf-8?B?NUpMWUxialgvdDFydHpvRlpQS3laS08zWFlwWDNoRXVFMnVWZGJzYTFtT0V4?=
 =?utf-8?B?OTJ3ZzVQSXpSTkt6OTErOEQ4UDRhRnVyNjBqc083ZU1rK0wwR0FtVDZVNXlp?=
 =?utf-8?B?M25GYWRmMm1XQ0JjZ0NMV3UxMkVHTE5sdEtSblo2WVR6Y2pQeGlSVjVveWVu?=
 =?utf-8?B?NUFNSisrYi91SWhlLzZJSjBYV2V1a1JHUjFKTUdia1RSYWtEUkYraXhRU0lX?=
 =?utf-8?B?cVBkVk5Ea09qZVc1VDhXbnh1YkRTWlk2aVRscEMxL3VWcUdHUklyaklQcjVV?=
 =?utf-8?B?Y0x6emRmOU15YVZRa00rK3MwTlVyZk5qMHpobGNjUGRrajBtZGV0UktxSXVo?=
 =?utf-8?B?RTZsMWhRN0pLVTA2TExTclJ4b2xrTGVHRFpyREkzVHpwTFFuOFM0V1RDenlJ?=
 =?utf-8?B?TTcrcUpWNGRiZXU5MEVMK215S0RKWjRISWtzQ1ZHSXBlQWNTcmUzMXgyaTFy?=
 =?utf-8?B?U0d5b2ZaNXllOU01bzUvT3ZFbXRhQ0srN0FmeXh0Y1lwVEtWUmN6SWN3M2Rz?=
 =?utf-8?B?cjZaWCtxaGpKWjBIOUp0ZXIrbGJ4VWxCVk9VQTMzU0tYY3Nvcy9EM01PTXN1?=
 =?utf-8?B?V05DTy96d0RuTDhPbU1RcjJMSEhSUy9CYzNyZzE2VDV4SGJMS1d2c0g0cGRV?=
 =?utf-8?B?MmJmT3dxYzNnRFlJTkdLWFEvbzdRTjR5b2k4eUxOZ2ZhQU5zSVNkZlNmU3g4?=
 =?utf-8?B?T095TnNqbTVWT1V2elZWb2M2eDJHbDdFbTdwWlRoZ2xHdkRwZHN5UHRrc1R5?=
 =?utf-8?B?TFFSWE9veU8vc1dIWjJ4c2xGS2RpN1FDSUt4NDVvV04rV0VxZ2ZsS1JuZFha?=
 =?utf-8?B?MkhsaTN1ZXdPMThnOVFocE9DZGVYZHg3LzNWT2JoUkRuZm4wd0l3bkhlTHNq?=
 =?utf-8?B?UG12eCtpSTZ4aEoxa0c2Z25MWkR4M1NMdGk4MEpZNXJzSHRWU3VhTS8veTho?=
 =?utf-8?B?VW5jMzhHdW16RjZXS3dGT0JlYVNSRTFYNWd5UUh0KzhtemlkYmkzLytQUFk5?=
 =?utf-8?B?ckxYazhuSncyRHFOQVVsaTJlU0NsWGhGVXY3OUM4SkpFcll2NnAwdzZTWnpl?=
 =?utf-8?B?dzY3dFJEdkdQUk56dUplWG4vSHQ5MFQxVXpYbTg5OHZManFjOVZDN1E4L29Y?=
 =?utf-8?B?Y1RxY1BvWTVNU0xXUTg4RklxRFgvSURySlpCczk0ZnREYzFsUkVGRnVmQ1l4?=
 =?utf-8?B?WlhpcldVbVVEWWlMR3djVnQwdzh2TlhzRnBQVnQ0ZnhBOHB6WjdxRDFlcGpB?=
 =?utf-8?B?eEFWVHpFbU9lYmhtd0tVNkxBRFJLU2dDZlF1VzBiQjEwODlXSUJ1cGhLYkN6?=
 =?utf-8?B?bCtpQXR0UThVSHV3cXprR2dUeWI3dGt0NjNtck9mUEdTSUVEQytBY3hGVGY4?=
 =?utf-8?B?eWJ1Mmp3L0FPN24yWWE0WFJFMVU2UEhCY0w5MnhJSXlHelRhU2QwcnBOYnVZ?=
 =?utf-8?B?a2JKZTlVLytGbDVDUkM3NmVCMURMNERPYm94a3pxSW1ESkd2bW4vSE5jMEZM?=
 =?utf-8?B?cmJXbTFMSTRLUzdZSmR0KzFSWTdRRkhiaFUyTzF4UXo3U1NhNU4yc3h4ay9C?=
 =?utf-8?B?K0l3bndGdVE0RnljYmJEZDQ4YkFFcVdlZmdSOWF3ZFdXbVRLM2Y0b0NpdThw?=
 =?utf-8?Q?YqNalY0KWmR6OHFcxLANZ0d8Jo3bTDNZabJo+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fed712-e437-458f-0772-08df0205ca9f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 17:33:20.9657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JGtk63PFw5HryQfUUgmMIpPjCO2W8/RnblCV2BjE/9BjANtEgpoXL9A1X+d2Lb68IpQYMrP3vvIXGmjJkPRSFRgaVe/yFtELaVQ2yB5podXGvglkok1ZVkwMOWEXEAM+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB084187

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

