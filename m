Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F96839AD49
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787297572; cv=fail; b=llR39VKZR+UTajrWFIEmGsjoDNnEmkv+L5Bwh7Hheu5wjpbGOvEGqECkxb9gOh5oeaQh6u3YbM9cbxxiY4WvKSOSPmwQsBsNMpU5shFcV6YMTANEIZ04uYcCc0Rl7tKa7W/j2SdQoemAlU2hv1J76qVrVJz6GkzrBcvpmaUTEws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787297572; c=relaxed/simple;
	bh=oZQvScyA1zqJV4CC6foAQh/CAQe4pGeAga38F8pulH4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OzdIasxfD6GCvjJ5tKlYfhLzNCdYy6tZX642ES7t0VUa3XtSqKeMuYimIsyALubjdiQpiI5RAE8liAcqYUokZpF/Ge4yJEfF1VUBWG2ry2GNJ7+LOjsNhFmLA4QDfpDdOTs0yq5GT6QrMK9ehmLMoI4E0H2pDXHnJD+BlkdjBG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nKTofNHN; arc=fail smtp.client-ip=52.101.66.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nKTofNHN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxbG0+bDaXp7FaiCCXi6WAWV7+eYccf+AXht/oRK2KjluDU9nrO+K7JyphXyww5ci/CTNfAtPn/l/yPAkD3CeYRpfEVTtGki+1Qhmjd4WHfM3U1g3TvdlouMen8ZmaN8HZnvTRyEOnr6fa8HWOTTPxJKpkjrK7+mfg0JlD+m2A73EeLyi/oeTGoOfDnasImMhK8rPWndrIawEAHZFsMXpdMsRY6LJDFII0peyJ8Lg32foipEXyAZmzWYcXsOkfN1aSs+VkEdSz+QF//tTNuQhuB9eIf2yIfOCzSfUOHhSPt0HIn2Vb/mTcIYhqqhnYSO3B6SLnzVY+zKgz8FmKcXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=JKY90SkjiWk5xzHpQY5IdbBet8mIpUj/upST32lDO8rseKB7cxYT69fCSyCtJ6tB21tLSK8C/RDlG2D2DRIyFiSGKsAvwmUXpRMmrPDENZo9V8ESEQzTj+C6fRMOfPq4LB/rniN3jj+jYRdYaKkHIeleoL6PtO00UZDe3Ohw2OmLz9V9mOrgqIPv652FOzjLlvVroC5Y3DfizCfYc1w+vSFh0im8J9bMNGleTEqcWxE/kLp1HXqWrCbfEds8PgkPld7Xgmn+Y1NGrNvS/rmySh8FCtJZGeg5AVoUgL61O2dc91fjlJLJ4vuKTjKErZG12bWGb4AdoLaT4FNjQ/FiXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/T28Dv7KzFFE9nxv/81pMJDpMBM2QOQ+wFzcBBIp92M=;
 b=nKTofNHNJIntGCb5fD+WZrrFF7l/X+LOLyUGaT0ylg/Gdm3Y6ZBxToTqcRUZim1FriS8ULEmL79l9BJyLxXNNABiNNqGck0/S4BnMlEJwMWM0wg7pBMS2INoWanCM3pv8AbbkDC7g4TWyDiySSsDyC1UrUeubkF9TmGMrqxIS8quYrksbtwlIUF1O59/vKmzQogo3YlsiP8FWocGEv7kXVPj/B4DFRNxjuDWnENisCrwHRcIaF2QlesnakHJumKoukhWJfX3TO9Yj7Kc4R9iq+AiDSrndCVuOQYZLa2J9O4lCeK8UV75+QovDkSZkM8d2Aj6T/+WAxxpoQUSMmS9IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AM9PR04MB9016.eurprd04.prod.outlook.com (2603:10a6:20b:40a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 07:32:35 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 07:32:35 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 21 Aug 2026 18:32:24 +0530
Subject: [PATCH v39 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-imx-se-if-v39-7-41e4257c2afc@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787317340; l=2461;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=8LTJ7dQk+ZmHVQUVQ7z2QFEU98qQ6ZendsUWTwEehrU=;
 b=dWU9leOKOBU2ymMuJyL2q4j2ekoSiY6iN4ScCT2FgjkfHASPpogYXeWPdwZCQ7POGeo2Aqv4a
 rKzxzgqOypqAuTnoL8NTFNS4b1MZQnlrsNvvnpEpCbn+mkcEsgwgAJs
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: JH0PR01CA0056.apcprd01.prod.exchangelabs.com
 (2603:1096:990:5d::15) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AM9PR04MB9016:EE_
X-MS-Office365-Filtering-Correlation-Id: f949694e-f8d1-4a46-2b59-08deff565e3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|19092799006|23010399003|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	7buZ195S3wnMfGBm9li2v/IpdVHP91wGBJsU25b+HUHsftnLdHU8FlAjpUyOK9v+bmyQsjXnRhGcT1wgbgxVYJB/c3R8wr80ikVVzZsM8OnulINfKVXkQUvS110+yUCE1UjqsHrPmz7pGEToKS9wzQuCey0HBgJm6bv5xWagcxGdRC4D/WwvsbnB1VV864m0hZY3LateIqPpbf5MAnnKP5cEp/F2L0rJRy7u3QVUmp5ZXT+U4sMXLnw91MXQyiHaoBJngli3xTTTNlo7GhbGzLor65lBqRNGP/1e0bbh8drQaIj+qfcfyuQLE1iRcC7QWXsFmqxfgu/ytw7LwhvvBj5A/m37QWcJ7Bc3Dysrh4fh3ZMYpBD12TqqFH11Do4amUwMr6s86fnzq3LYs1SJU4rHzbstGBHCC26PPLw/Bfldc1pY6Mi5+5F4ZH2sX73pd19fRXhRxeemJBM5ebMe6Kh4YZW2CD7pivnOAGJlyZC5OIkPO3jqMcW+rOppOvJAyF4aLIJd5kVkSZqYcPqVZnEnhtFL4CBQfi/qsVAF+Ommp47teXHMN7uR3NrmPFVpIxBQBC+Hkva2LZAIyuGwaO+8B3ve6lezXD8Sy2L041bhheUKK7ptFVa3iM9WQ6BZYXVp9yjf1t2O2LxN1g626mq7uyAuMWD+5qdk3HqX6rK6/8M3bLlI7l5Pp4VwfgOqbKPNRwN5N5szcvkXw9Fn6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(19092799006)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm0zWGJMSVBGQnM4Tno0blVTMmRVQWNmOG1BSDdncU9hK2lZRDFDYW92OXl3?=
 =?utf-8?B?bS8wdGVGU0RmOWE3a0hSRElnNGJkMys2bXZ5L1ZKOHhZOWM0ZURFR0ZIY0s5?=
 =?utf-8?B?SVFxOVI0M3M5QkRXaTdWMTNXbTFyT2hEOXNzWmwrRktCQ096bkdwN1o5Nkh5?=
 =?utf-8?B?Tnc0SHFlaTRHZDBHbytpQm12bVJTSG1tUUFuSkZqTEpud2lMdk9WcnMyVXN2?=
 =?utf-8?B?a3NXa0wvaC93d2d3TEE2MHJzY0Q3Q3NybEdRMDdOaG9WUEhlRXlwTzhTT21I?=
 =?utf-8?B?MWVBOTBvL21yVkJqWVg0eUxZOThENTdFNnhtQVlXZ0czWWErb2ZRSkdaaVp6?=
 =?utf-8?B?aERFbVIzc1gxSWVja3pVakF6aEVqeTBLV29ldHNhelcrNys5ajl3MmxqVW1R?=
 =?utf-8?B?T05SRlJES1hTTFc2MW1jTkk3MGlxdW9SMDRhaTVPdnRrRWdvWTBSOUlrU2lK?=
 =?utf-8?B?TFdhbUpsMlJBQVZwVHVQUXczWEFHTFdjS3QrcS9IS29wYXJkampWUC9xam1T?=
 =?utf-8?B?OXdYSkl0OStRR3pObjBwOEpjcVdzTTVBdG9UQ21aVkFGeDVDK2ozU1JmS3BP?=
 =?utf-8?B?U296N0ZOSDdBekxvOEJoU2ZrclFMbXZta05KMGkrbllZQW02T21rWWg2dmNT?=
 =?utf-8?B?UUtDOWhKSzc3SWtFT0lCWXFYVTVJMGRiTTl1UXRaODJHZWFEZDkwRXhlNWxB?=
 =?utf-8?B?enBUeW1jcnJMUk5aYnRudGVYTGIzTjlLZ0g0Sk5SRDNVZmpvN3B1c0tRclR2?=
 =?utf-8?B?bjlHN1k3QXc5Q1d6Nkg3UTZYYTdsem5sRmw3Q1JGWVRrd0J1NUtzZ0t2Z0Zt?=
 =?utf-8?B?VDFrNHVJd3R3TmxwbXBDZGtaTW8wN25PbUNRMDNBWEpSNDRzUTRKK0xSdHFI?=
 =?utf-8?B?WEpIb2lvTFlqYVByNTV0VWxYd0J2emtwWXhEU3g2QUJGK2IvSlJPS2dLUVJS?=
 =?utf-8?B?ZWJJa3I3ZE9DNklEbXVMc1lXK0ZGekt1YURoY3FTc3FZajR6anN6REVkRXZM?=
 =?utf-8?B?cEdHVW9SRWpHZ2JZbjVYQ3lLdWMzTzVBcnpCVjg0RXdIYlplWjcxZ0hDUHVH?=
 =?utf-8?B?bXRoa1B0RHNidmdXdzZZVU53WjI2SmRGV3ArcEk2eEpxczVhaks4NFhBZUFG?=
 =?utf-8?B?Q01UTTlKNmNXWVhDelJWN29wOHFIRkk5amx6TWQvVnB3aWwzdHpGQWo1M0Fo?=
 =?utf-8?B?M3M4OC9LT0dDK0dpTEJweGZxeW9IRVJkNWoxM3pDV2tNWW9FNFRqV0xaejgw?=
 =?utf-8?B?OWEvZXJjL1NCekJjWm9lRjBMR0VmOWNKYjFISmdCWkhKVmFtTDJJVWpOTXMy?=
 =?utf-8?B?VEtWNjFTUFZDRUs1eDQxajdhV2lGeVNaZm5uaGpKdkdiOHpoU0gwZ2pFaXZL?=
 =?utf-8?B?UE1ISWRUZ2VBTCtUbXJUekp1L1hqQ1d2a250aDYyMU1VdlJCSjZNQ1ZPakNV?=
 =?utf-8?B?R091enJzRjd2TERiOXU2WjFzajRRbjBNdlNBcy9oYzlNdE5lY3NSampVdWNk?=
 =?utf-8?B?Nm96VWJySExEdGJVcUMxTlZCTGttTHlwT1FidDdMVVRsWmFMNDlvczRtNTFu?=
 =?utf-8?B?Tlp2aUJSVmI5am9rRHJRK1VSVkNnR2dZZ1ZSVWlNZG5ubG5xdi9XNnNrWm1t?=
 =?utf-8?B?Nm1zMlF6b2VrcEoyZHZXWEFRZ1JuSEsra3RVbmc2UEp1V1NQNjV5NXBxemh2?=
 =?utf-8?B?MmZaZUdoSFlJZTVrdWIyd25TZ28vemtSU0R3ZkVuM2lISkhxU2c1VVZwenQz?=
 =?utf-8?B?TDhNOVliS0FOQnBPdlgvMHFVbEZpN1p6a2NiQ3JsakZtbmxGMzZKdEJyZDhT?=
 =?utf-8?B?ZEc2cTJXbmpjL3NsVStIajhMaTNTTU1rbDh5VjJ4b09FMjBpNnE1eHVKZDMy?=
 =?utf-8?B?UXp6NVVsRjArcTBOeW5oaWFMK0Jud0dtV3hHUzdIR1RlSWZLQXlQb1lFQytD?=
 =?utf-8?B?OHBMY05WZnlRc1BzanBuMXBCSlJFTllQNXplWFRmZyt2NDFxSUZETTlFTmgw?=
 =?utf-8?B?L1U2TFNKeUpQQldYMGtQTW50T3EzNGxMM0Qxd2kxTEtHeG1CSmlpczRDbXZG?=
 =?utf-8?B?MmxRQ1pBb3hpNHJaZXF3aThmdjk1V3ZBU1hOWFhSdmFYanB4OVFzQy8waWJW?=
 =?utf-8?B?Q0FoSU5LeGdiT21maVNoYXExSnhTajhMdjVnOFptdlI2ajFxcUtlTGpXdkN4?=
 =?utf-8?B?WWlvUmtCZy9OdkpIdjNicG82ZEY0RDJBYjhnTXprekI1cU5PUGZaN2xOZ0FY?=
 =?utf-8?B?Wlp3Um13UFJoWWdNd2gxWnRJUkZBT1NxUjhxa0h5ejRqQVc1ZkZwOTlzQW1H?=
 =?utf-8?B?V21naUFRME9XdkZQRzU2OEx1WjM4UVNyVUFRUDBWUWlqV0ZST1V1U20zYmM3?=
 =?utf-8?Q?WINNz68UFJLL8tYZKWLDUwZgxwGul1a+tAiBV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f949694e-f8d1-4a46-2b59-08deff565e3b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 07:32:35.0072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygNXn2SJFL61tEGgv9xmVx5F/T4JvIKpDokEP/BxyuM+T/v3XixW/KxuHxN7ivnCRpRRJXIpPBvE4HusTPwO5wHYUDuc9Y40LAznRIVEBEk6dZk4x/XGz/fOy6wJVqiI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB9016

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

