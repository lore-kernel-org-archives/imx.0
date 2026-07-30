Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013013.outbound.protection.outlook.com [52.101.72.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18867378D7B
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 02:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785377827; cv=fail; b=Il2tdWuphvuJ0yKi5BPJA+YOGJKQhNGqCgARn++SiIY+0rZoW0gzPKU6RpRBb6v/ROi83RDoI7cTPvFY1ir8ZwbxE5qLbZxIf8hJ+tqGEDSgoUoKYGsMxDQNKvH3V5A5jsf3k22Z0ET4b79juSdrtgHSwKhFFUx6xAZ3ZUXltuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785377827; c=relaxed/simple;
	bh=cs6G/r3GqxY9qrYWchnYMZywUFavVGu1phVAkqXxZw0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=u7Bv4sv1s57fy3IrPjQewRA7ajCT6PDhdy6ra257Dk6RR11c5tvoQTlkdHhjBHuDrl0gzEXajF1Z1Pq1t//7VMfIVgADFGp84GwrG4ZslqkUmVpoPS/ESLIf3MeEkGX+6Eemk2Mf2rqTsmItdGJ52L1bXyan9b4OBUOi/z/p35A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IBcjCthE; arc=fail smtp.client-ip=52.101.72.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IBcjCthE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLSv2/Ms+z72Pzr3qgujcrkgMZdh2DcjiGqxo4X4W/Xqt2mOeYCSdmCvPasHfRj1fLz5fV2RGymPcdsL8yal5gzkBow+4X2jcZMiFf5bLQnrGP0p5/x9/7iY0aYqYAXzsQgDw1o1I1kHnIb/D8Fvkjrtgh/CmhEkbY166Xaf1jG5aeR9BSpdgT69F2Dr3Zd80wVHnTrbJe1kFDZ4yfYzpJNxB7ripuHXRKMRYTmOGwvXrjfku01m3sfe+qQxb2NX+R3ShJw8ezSo0GZOvSRwoPl+3RIFYftQq2xNWKX2lBLhQSYHm1mAQZGzQvi5xKLx7GRFsVP2/qk+MdGMun9Pxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eqqF4XldwoAF8eYm64tBrjQANv8tIVhjIWqcRvU4qU=;
 b=IrzPMmJ509n1oPJudK6lIYMhiPggmH/RyJgeY8vJk2D+SFbUgIDCV+Szxu1g/cQkH6gX83VbLlWPnFpG1MOSQ2l3GItydcz5HQ/zHVyT9k0y8lHMUsJ4Lf5ccGeb7l8H2LyHjhfOH3lD+CS5ItInCNeQaK7OooXM/qIvBaSLxOYfIfjNIxids4vw2On9wy67wqlK6B1plegs0OGNUJ3K6I6Eb1pGwBk73BxK1AO/dkp4LwlweLezYbPgSOCNNqbMfCbohCymHjmJWqQrKVJa6CiVcdItbCx0zDGE9sm5zEt0X5g7CoLUiggU/aABDd5J2WhbORwSbKqoxjLUTVr57Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eqqF4XldwoAF8eYm64tBrjQANv8tIVhjIWqcRvU4qU=;
 b=IBcjCthE1r6LfOmfrvfQwyvC3Ox6SmnOUKvo6hmM9uphy2T454Sy5LXBxolqcCgB9niQ+EunoGB8dxPO3XUAVM5c1ADK4Ez1RG7UTfyaG+1IjJcNKwS1drypXuSn1IbgCWWCpvYOZOtLfJe+mxCe001yyziOMzSKesFyw2Nuke8J3y5ZlFZhm7cayeird3e8Axzlvqc0bQGMYmsYSqu/1YUHqhIVEwiUfQ9TdvIQ6dMUirZupjxK+oBQnv2IZQwMveiErundSmVJ9paW+nPhOIZk72hHj8+6s0xxTY6czEB2dznWV7t6We8vNl1H3XIjZjanQkAEQdo5A2ywgpoCwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by VI0PR04MB10174.eurprd04.prod.outlook.com (2603:10a6:800:243::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 02:16:33 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 02:16:33 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 30 Jul 2026 08:36:35 +0530
Subject: [PATCH v32 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-imx-se-if-v32-7-95f56dff4ba9@nxp.com>
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
 linux-arm-kernel@lists.infradead.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785380794; l=3083;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=j8hxwCQlGC3Mg6eSazbiCEMoZMf35PVhPK4kl3SDKqY=;
 b=x5XwqcIirHfzIh4YEqBW5pKxouu8uEa4IbjwXSZewFFVhzNcS0E9TpesxgnBc/lwA9wDk5x9+
 d+Vu1h1fg0QDc1xh69Dy0WYKjmiH5eLucb+O3Iydfg6TCjQHpn1Y+G3
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::11) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|VI0PR04MB10174:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d7465c-c47f-4214-238c-08deede09376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|23010399003|376014|7416014|10067099003|56012099006|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	tQH1Fe+CzHZ2/NJRuxYVFhpG4Hwh+SPzOS7xLZz8G9WK3XCpKrIeDKcVZ1Oqo0E0ysNUZqxGu4HimB3GnYLo1OOzvqNP/ld8GWioGyPlhtII3p4Puko9EH3zYo0+QtdQ8fBGUz3NGQ9/3Lj93fqpy4Em8bvhR5EI9dBS2Xieem3NMTDvHL2Ml1YG89VKOEiuq22g5ffp8xU5BtLomHfOUQ/FNmlKqB5+x9pFtoVkblRud1FXZd3n1Q6z7p6c5CzEPOS5OkwV4NSwpc2MURGcSDz82daD3WJGMwD9l7VR6mcc/vwmodFLJ9MfO8Wr0Id4GExwcRSf68oNaHjUIFVZpM1VYyc3rgw3VfvwGxi7GbypSHttZiEMzvBOlJXGC/VYf8kw4kBDQ6gUcUBXa4EVSO+OMOS9GIKbN6ORf+gKJAJYp31zoNotKF0fXquRHPP1pmabNrssx9I9TFkz+FRwVfrjy1ZHOxmSPNxdYFrsY1x+0pEPwziveMlrDFB+5YZcp7U+cs6G93yxHXBpGZkW9uX9A0/yF/IGAcYmvFWs4gWR132++D0ZuH0HpjMweXMYWnhwRMouJXDPoVvPgOSLgpCU8FFh4aGKahH5T4zQXUteb95tV8lC1LyeXT4Zl6E40siNn4XGIgpT9zfS0nLu8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(23010399003)(376014)(7416014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVRxaGVPM3grS1U3MEN2b21JaXN0SDl0cmNFVXhsU0lyWEREWnVZN095SzBx?=
 =?utf-8?B?L0lOc3NNcjhEdFpqVFJWWmg3M1FWTk9YR0g1Mmdzam5HY2NlTmtwRDkrdU10?=
 =?utf-8?B?L1NsbHdpZW1tSXk4c2Z4TlM2aFJzOC9TbC9rak14K3NmWlNxelpNREdMVTFY?=
 =?utf-8?B?MjNIRTRZa3NuWDdZWG0wZGdzMHdPZUVxSU92MC9EZWc2Rithd2lrRU1GejVB?=
 =?utf-8?B?K2tWdnM5RWxmRmF3YnErVXpkRzBHSm9pNTgycVRJbkdDS1N0aVQrQzJoV09r?=
 =?utf-8?B?b3dzSi8yWHpCM3Bvcm5KMDNxVDIzTThCTnhNZ2R6NGJpYVB6QTdJMWdEa09v?=
 =?utf-8?B?WlQ3YTB4Y2pKaWpYTkEyYzYrRFA2dzlrZzdIb2lPZ0FLMVhJSURiMnlYUWY3?=
 =?utf-8?B?em4vVDBRNzhWdy9CS0ErcEJDZkVxaUZ2UmVLaE4zdmVuRUJNRVI0TVpRL0RP?=
 =?utf-8?B?c2pSMXc3ZGtpK0llN1VTN3AyV2FqVTl2U3owSTZLdTl1T29vNnl2WXN5ZGlw?=
 =?utf-8?B?ckdiYkM2ZTR4ZzNKcjk5QnNPWGtBNklKaUNvRldBRDhHZEpGeXlhOUg3MHk0?=
 =?utf-8?B?aDN2NnhheERCU1oyNEgrM2dvb2NqL2NJUy82TmJMWUprd3NCbENEczZrRWs5?=
 =?utf-8?B?MThlVmc5dGwxeHdQc01kSWQyNjBGbFloL3hnYTM1VjcxdUppMHprRm1HWTQz?=
 =?utf-8?B?Q2xQS1ZiaXNMR1FyVlJiaDZyc0tDMmlVWVRydTN4bEJKM3pRSU9yN0ZaOFdH?=
 =?utf-8?B?NEtYUW42WUdqMU9KRGVpZWhUbmVGREowUXVmdmUrbVM2a0ZYc0RZMkZPQXpH?=
 =?utf-8?B?ZnFnRDR0NlZJckdpWkEvYnJPTkRWUTBNTWZwcXF0bW9VTlVNWXVXUlh3SGZX?=
 =?utf-8?B?Y3pvVnhFeVJxaHgwdEp3cXlDclBCK21sakp1SUZnOEZmNHpPUHYwNk55czMw?=
 =?utf-8?B?WU15MkZQRVkzZGlSUjVIRGdPWjRMSHVzQkJ0ZjV3UzkreElsakR4N2pXdjNK?=
 =?utf-8?B?S2F3U1BhWEZ1dm53MFN2aG9EL0JycVcvU1J3eXJGLzByTmlVaHN4cGxWblBT?=
 =?utf-8?B?RTdRQWhaZk13L2xxdkxSOVVjT3VUbEQ4TmtuMmN0RnVrVW1xb1kwVWV0L3h3?=
 =?utf-8?B?eFd1SEo1eE55TGY2VmhscG9XamNXTTBKeXN6UFIwdk5YbTltUmJld0ErbllY?=
 =?utf-8?B?YjZ2SktpcHo4L1B2ci9FV09XZEFjSVBXU1JPN3EwenB1d2hkU3ZoaERRNk5n?=
 =?utf-8?B?dEdWbU5mUWdpVmF2R3BpODJKZmlkWUtNdm9aNjV1YUhmVzBJVFV3WEo5c1Zo?=
 =?utf-8?B?SG85bU1jZ0dtdTkrR2JnaDFBVHRJTHE1T2cyTkpxb3IwaC94NVZhZlJnampi?=
 =?utf-8?B?OU91a0JWRXU4QlB1QjN6a29wdVYzK3hmdnZIaGJPdEVvSk1JMmFXVkJaelJh?=
 =?utf-8?B?TGk5b3V6ZHZhTXllbzF6VndDa1ZSL0UvVGhWdngxR2xGV3JOenRoM3BDOHMw?=
 =?utf-8?B?NlY4a1NuUzUyWCtjZEFld0hmVW0zK05jQkd6K0U1L1E4Ulc2cnVUQUhVR3BV?=
 =?utf-8?B?dWlLMGgxN0tBWmZZSWFXZGZaQ3FOR3hPR28zcDEwa3hNNmRSWXE4L2I5T1pm?=
 =?utf-8?B?a1NHOVRyRThtNjJ2UXlnSDVOallUVHN0TE1rdGFETzZlVlpmaC91c2wxS0VL?=
 =?utf-8?B?M2ZJdUlueU9MNnA4SDFSL0ZJWDRwbit0V09GZGk3Q0hac2F4RXRTZkZtUTVw?=
 =?utf-8?B?bzh5Vjk3OU91cDFXZTdpQnhzQjdWVmJqWlptY3NGc2M5NTl2TytoeGNYdjBy?=
 =?utf-8?B?NFFvVG8vc2d2eWxmNnJYSXp3dlFHTFhyUUlsa0NoVzJPVVZlaEszbTZOcmhy?=
 =?utf-8?B?TEdyKzBxWURmQStMZjNoeDZiSHAzQTVTckVpeFdVd1RDT0dVUlJ4d25vWFhY?=
 =?utf-8?B?TGFDODJ4Z0ZaUnRxMlRPV3VwM3BzZi9zTkFBOG9zTnArM0w0N2F2YktvNU1G?=
 =?utf-8?B?SW5xUU41UXdkM3JzUkoxQmZIQTFjSUw2aFhOd1ZzN2U4akw0SzJRQlBlcG14?=
 =?utf-8?B?OHpPYTFtRHhBVWlLVi9QdEpEUzhyQm14VHZIM0l0Slp0QXJtSjZ3Rmx0eHds?=
 =?utf-8?B?T0NYN0ZWTmcwNUpGazVoQnVSQ0MvSy8vdXgvVUQ0ZDVrb2NmRXZwRzZZNy9v?=
 =?utf-8?B?NGc3S29sMTdsZXczeHZUTmdXRWlscFBDeVNjY0M5VHRSSm1KT2xuUjB5UHN0?=
 =?utf-8?B?QlFXLzMybUtXTkV5VWszQnNIZFI3b0s4M0FWSXk1UnQ1WHd4NWoyVWFUc2NW?=
 =?utf-8?B?cTN1ZlVzaTZMczJuVWMrL1dDb3ZaQllFMmYvNDhyRlp0Qm9Ic2VlTndSM0dq?=
 =?utf-8?Q?OVHgcYM9h3HwC/lLUh+8p2aSjiQgAqkKrMu/A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d7465c-c47f-4214-238c-08deede09376
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 02:16:33.7017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFN9exCSIaG4uiUgFl9QfVf5Od3fNmlDVsJ9QZfdcBwF+U03RyQ4FNBPjjBsdDv5enIFXF9K+TS9sZ6qf44lj+4eBXM4yx3To+clb6M+jJDB8v5+YEBcdkSTC5pll0QY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10174

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
Changes from v30 to v31:
- Kernel is free to choose the exact placement of the 1 MiB block, as long
  as it lands inside the ELE-accessible window. This avoids hardcoding a
  fixed address.

- Adds a new shared imx8ulp-firmware.dtsi that also enables the hsm0
  node and wires up its memory-region, so every i.MX8ULP board can bring up
  the enclave with a single include instead of duplicating the reserved
  memory node. Include it from imx8ulp-evk.

Reported-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Closes: https://sashiko.dev/#/patchset/20260724-imx-se-if-v30-0-ce8ba256692c@nxp.com?part=7
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

