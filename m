Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013003.outbound.protection.outlook.com [40.107.162.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678D035C694
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 13:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787145373; cv=fail; b=HeEi9SzneDHLY4OtcnIYLFJAmpILiYFGYAA05QJpIRU4DMf6/PqsvpIuguwjivA2EWc4AXPsyDp/++WYtaeyi3nONq85L+4DjBC+SwQ511gbY+f1KgAqzBoDi6Jf9S/s7nqxtIMqplJkHc0NFhfh2OwVfLgiKa5d/dArSvGp7j4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787145373; c=relaxed/simple;
	bh=SvjmVxHpX/hgBe0iVy00oZ1C75QjIjSINEhU8j+fUs8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qucqL15MN/EAf/EYYbfUMPFcXk9wtIND1rYLxZwj9HvGlV6oR1d6sub9AsjvL1InWkQ/SnIhaJQvSjENlHVloM0YyZdYeoqv92+84IGAKAM7uYXQB17EFTr/8DyGqEX9KkNq1VOW9JXpEI8mVfKT2thQ8h+Ubhmw6vRQcaTlB2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TGtg0j32; arc=fail smtp.client-ip=40.107.162.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TGtg0j32"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJi396Xh9wZWDyZ3EaBluJZSFcbzZcGLE3WCABYvmS+FwI9+HLRF9FMpE/IE3tBUMr874eXuPdkjcrzRSPp4qoxMvCD9qrTWjBBT6DMCnGyaK6yblhBUu/w1mKFkjYsZQM6P9alEx3aR3YbqcvHDUfEkLU+KQkIJQ8W/URUDS+OFGr1WSxLkBcHuj813vcm+cfv2xig3dwOTFrI07PJGHJvlAMrLo/cXyZOta1qO6Nzoaillu45tQYWsjRHWmxeCWa8qB0aKVujJi5aVEiEb10eR+yIdCS0dbVZO+qoPELIS94AJWx/p3NBD5KKxh2kQe5qb+ZROX9Pcjs+drmBiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=mzvyPUutzmnYl+1CO2bCa2HqSH1GUNn0Ylt36jpRdLOqLcm3/3ixq4O33Y+ESttjWJHjVbN+t1Ec+t2MRsFE+vXCbm/1lt+Qb/7FJw2qItBZ/2TcfHjxIBLw26KFEs5i+voK5AGxhw5PZVt3103Zfem1aDeG6fNFpDzHsI7aCeqJeDgrDOijyVRFZeLw8yWeRFuyzjMe+C31cC22kgTSA5i9JHGlP3u2Iai1jo1UMU91IjiVwxhXMkZRJVZsgSABeRwkqylswcyoImxdxzt4gctkqSH4tN879eZZct756uqXSpspxDJW8voCBDT1DcgEge98amRbiLwfL9eoNmTnJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=TGtg0j3205gE9XrvfBj+PcanuWiwknV+6pa14Ihm9l+uHELiIur8EEyNUVeB/9nHQZjL20APD1PSdRGyrZhNn4kd0u+tpnIoPybEH3uyUikxX95A7nRm/TLhvaYn9+tk5flzf8Nt0Xi6My8aISTNFg9wS/FMtGjb/t/5NWIjs1QF0Phlzz/2yWfS8R6FympGaZ+ByZ8hK+8eGGH/GreXF51RQpIy0Yxupsjadh1XHTTXQpJb2FGaFeRTJX0WOCE9zaxhp5XgUOlcVlheQyNL8i1mMsHpgENTI122PWhVHkXLUouT9t5ZeHFf3MFIWkkwQWjXs72xz2kZOrDBuoaOzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GV2PR04MB12086.eurprd04.prod.outlook.com (2603:10a6:150:301::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 13:16:01 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 13:16:01 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 20 Aug 2026 00:16:01 +0530
Subject: [PATCH v38 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-imx-se-if-v38-6-5df4a4cff736@nxp.com>
References: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
In-Reply-To: <20260820-imx-se-if-v38-0-5df4a4cff736@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787165160; l=1532;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=Fey7Yf+dWHev0BhTzN9X8KrA/PpJDRs7p80ZHkKltXs=;
 b=UXSLEiJqWla68IM1ohXzEuaIkSPJiMTnC6Y0Ej/h6wvi21qLMUQoGdx+66bEJ7L1IZ0lO2ymk
 zbSI1pXAo3YBhDy6IGaKC/mGYOqGdi1cVXJvh0qLY9L5Wy+L87kKcKt
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI3PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:295::14) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GV2PR04MB12086:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b7e2a6-2bf5-4a3a-9b7f-08defdf403c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|19092799006|921020|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CfURwdnYvnZQei5dESV1yHRbYmNHPGpc3d3GXFXJlfNyKV5Mny/3EOwSV8+xZNtG/WDr76ZeZlP+KKEFYUlovZ/Rdhj07k6cVVvzjxqBXF8lpaEJOCIJiFyc7Ilq7mV2gC9uivcxjiaCfBX+FaUAVLl3FFLUpR5erzPIfFbTgngTsI/mRaSMr4OzkJWjC3GPzSM30sk4Gj18taR1okpCaPSY4CppIzhg1Ak7dF2ZSJb9dDh/TlmebapNQQfA4sOLaAVQ9VCX/me2gsY4Jez+qMETxoysJyAOV19EONVH/96ipUdCLCYMdD0JQNVIizVVFqMEpL1sjH7+G3mNcTxgrV6vprK63DmxRCEytr/tma1UOOSIn9YEZv3MjYnooQygHENp7bxedkYlBfpSP6vCMXcchTHm+QyQjbNOMkmcUkTI3Q3mzmJAOjuLU+CARqQs7N+bCvyBQDbS/2FMDEMHjlU3xpcRHcw30KbnoqGW9ErzpANmqKDngLicoCe4kdNBESL/Mwc7hjZexiWQ9IpCnSEHAXFtGIrBlayq8AgwuZABAewNC6a25esb5ugPOcnURpQUxRw8nnePF8Mz/8KoZNg1Jo/mO4V272jJaN+p3GOIRRLzVcjyhxBJhoRjRRTrP/MP0cdLWgWeI+0UDTlrlJu0WQYcP7p9GxOc0kk/or6KMyz1vKMmEPLkt81KBpO2hEuqwCwjn7VdEpoQVGbfFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(19092799006)(921020)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFJTK0grZ0VVUWZkUXEzQi9zZXVwTThSZVNGQURhRWYrcExmalUySFVyRzRW?=
 =?utf-8?B?YjBPZ2VCY1V5UzFkZWluRU5MWHA1QzFkZTlXU3VQNDkrVEJ2NDFmV1d2NmtB?=
 =?utf-8?B?U09GbUFVYjZWOXV1dVFzV2R4b1RXRHF5TTYzVmZHNHVTTm90UVR3dHJWaEI2?=
 =?utf-8?B?T1YwMnpBakgrdzlKa0tKZ1hGZ2ZkVzlZWmpTVGhFOFF4MC9nNUd0YnpGNXBC?=
 =?utf-8?B?NWNGUXhNS29lVGNHbDVudzJUSTROazUzZTBlOGt5UGJMSzlQRTEwNTU3Qkor?=
 =?utf-8?B?M0c1YWdWWW00Z3MyVHpOaE5qM25keGt0aDFkMW5MOUF4TlFTUjZYTE1rajRy?=
 =?utf-8?B?THczYStkYnN6UUErVUQ3VTRnbVR5MVdPbnhjSitNaFljWEErR1Uvam9yWWRX?=
 =?utf-8?B?WU9KTXRSYWZ1VXgxNjhSRHZWQ0JwZm5UbjN0a200cXVFOTNPVFlZenMzRFlu?=
 =?utf-8?B?OTZ4UGV0VmtiMzdrOXBhT0NYZGlMZy9VdThVamxEengxb3dqUkR2T0d5Qita?=
 =?utf-8?B?VDBCcDNBcmRnNXBudGdEcW5QRGNIRjJibEowVW5qenpWcjdZVjcxTzBVYXp0?=
 =?utf-8?B?VU1JMjB5ZXQ4dlNsdEFnUUZtckhhQWJDSExEMzl2bUVwZXhwa1VsbEFiN2Rs?=
 =?utf-8?B?OVZ6TUlMMjY2WG96WjRKVDZrMDNSUXpEZ2lzT3V3aDh2eTVrSitleHp4TUtk?=
 =?utf-8?B?aHNIZ2pyNU4rZXZlY09OOFlETVV5WS96Z0NieHAzMGFTRG9DdmdEMFV0ck1B?=
 =?utf-8?B?WUlBR2dLeGZ4WmVvY01MUUVpaFM2eUZpajhFenhPbGxCUGkxaVgwd0ozZHJE?=
 =?utf-8?B?VG9jMWtEbGl0MVkzc2R0eVhNMWFMS09YR0F3UkZ3aXFiS2pEZ1FOcExlUzBS?=
 =?utf-8?B?U3QzWDdMeDhHWVhwQkVVMkQzVjZNS0VvenpwSEozMCtQb2RsQXhjUlRxM2hw?=
 =?utf-8?B?WmljRUtxSldud1I1My91U0l0REI5RXVRNjRBQVp2YkNpaFE3Yjh2a0dDN1Vr?=
 =?utf-8?B?SnJPc2FZRmxoQ3VRY2dqc1lOSmNSMUJtbG1YK29iUU51K2hNd3Z1cjhkbmlo?=
 =?utf-8?B?T0RrdUU2QUZaRjE3N2tPbXk1bmY0S0taa2xFbFpWcmdKZXpPelU2NlZjSTlr?=
 =?utf-8?B?a3dJTGJ0VjFWWmhEcjRCdDJkVzJWT1I2Sy9tQVQrejl3UHFkeEJlTm9xMm1h?=
 =?utf-8?B?OVpRdG9DTXdBMG9EbzdsRGV0d2ZIUncxc2Z3SlVZQzJqai96eUM4dXFOSEtH?=
 =?utf-8?B?aUhwUDk3bHV0Y3FESjE3N3RpTDM2TnI3YUU2bzF3Z3hoN3pYclBiZ2wrZ2I5?=
 =?utf-8?B?THoyaVEzb2x2RloyQWtrTjQ1ZXZrUnhJOVBWZ2p6VTlsR1pZWlorVWpVOFBM?=
 =?utf-8?B?aTFtbm1HZnVLWWtCQmhRUVl3NFQ3c1p1SXlkN2hUVDFVSXBhTGsvSmY4R0l1?=
 =?utf-8?B?djgwMWhtTGc0MkZkR05FaHdTWVZpS1dZd29RdVRwYXpMT1JnR0FLdHRUNm82?=
 =?utf-8?B?NFRQQkFQSytmVFlIaDdIcU1KSWQ2THFLbEoxVW40SVpSamFscjZENkVsVFBt?=
 =?utf-8?B?S0pDbHFJWHJiaGgwSVpZNUQrSXVzOWwrTUV2UDJIdUkzUG5RMFM0dkM0SDhO?=
 =?utf-8?B?QmNlaGZ0eDZBUlQyNEVkZGsyTnN3dHhaVThTN0Jzdi9vN2lXVXVLZjgzbWJX?=
 =?utf-8?B?c1ZVajVWajhCd3NndTU0OFRiMVF3cS9YRXVUWGJBMG81WUx2MWZuRXpVVTd5?=
 =?utf-8?B?dkhWUmtsUFhyc25yVFhpVHdmUXZpVktrSHZ1bkV1cy9odmNvMXhpMC9yMkx4?=
 =?utf-8?B?NWNJOVNhdkxEeGFuN3RlOE1VS05CY3RldjlRRTVsOWt1MlBtYytxY011OHNR?=
 =?utf-8?B?QTdtK0oyQy9tSWVQM1dDVFd5NUtCaFp4VzJOVCtlelJENzZFUHFHTzdsK1F4?=
 =?utf-8?B?OWNTZVkzTkUyclhJVmM5dXFrOGJ2dFd2OVFkV2tBUVhlYkJFcGxFTDZlV1J3?=
 =?utf-8?B?UEJXN0pTU0kyUmJWS2lCZnl6ZUlWOUhXY2hhaWR2bFFpbjMrRlJRa1ZPQkcw?=
 =?utf-8?B?b0RYd3JRZEFUVTYwejFVNzM3ZC9BclRPVW1ueTJRdUlhdnllUHp3VGZINXlB?=
 =?utf-8?B?bnprdDluS2JHd3RvUWNFZUtyM3VZaHFqclAyNzNxbFdnVjFKOGN5MVZxVlYz?=
 =?utf-8?B?RlNOR3BRNmZzaS96MDllUDZjbmJrcE5wZzJCYXRkaDZhU2NUTnZYeGJDL2Z2?=
 =?utf-8?B?SEM4eEM5QUh6NlNSZ2VQMGNBZVdFakFPRGhMMWRBTS92SVJ3UjdTb0lVZFY1?=
 =?utf-8?B?cVcrbGR3ZlgwaTVhUVpHWjZudWd0OEZrZDA2ZmJZUSt2blYwV29saENORG9K?=
 =?utf-8?Q?OoDdQe+RciWDZOii52RK6lg1LOoz1dKKEJlUV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b7e2a6-2bf5-4a3a-9b7f-08defdf403c0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 13:16:01.0927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqOX4TdEm1oVD4GJncRgUujF8kIjxHAp52PKCc6QT5ZEXRfbfP/tViAQjDqkVlv+lr7nOgeXyjcJUD+PQtXTRqJnE5KFe34I/m1CXYGzG2s1QBi/9dSXVBLhxfL+fbNk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12086

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

