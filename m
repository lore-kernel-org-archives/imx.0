Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C952D3E5A33
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 20:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541365; cv=fail; b=Fiay/ECtjs05W9HlZKV5M41g6NL9Attqa4KdOGM4RnmvMSB/PKNgVdMUYfnyzgo4szeY7vV9RyUD7LdZNHZjY9RZRyagdebmKkzaumTomn2XJTOCWUVPeRoeV52R58Qnh4G/oHm9tn2q3hg9DdLFE2HQgmN87BoKwaZ5a2xpDW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541365; c=relaxed/simple;
	bh=/h43WzJ74ivfN++l7pL/xfTuitKpOcMJt1dyE3MQ450=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=V4ua2kYZHFLR24i837aRcrEn6RpVnxHuzE2JwwPUA6CkTNlZ3xxwEnhQwVGyozM9YP+yX46UggSa7ZtlSX8XVrneuOpUb/ZSHFG9PVT1JG4ib0mKitDkZ0ub9KZDHN9/+66CYz6glISI/LcoFkakYsHjzxEG0QsqXScYCBpnDqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oTj/hSvc; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oTj/hSvc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btKETa+kpaNWHHQ90Kg8mb4sT3ComTHPFYbsUkFnpr/lgB3cHGzP/4OQVhEv0eRvR2c4neIgiZ1D2O86SsCzlx0D5exKIlOVt7rBu1R9Ugll61VfzNV070h4DdEPQMjAUyvoMduROx1ZtKjB8CmqsuZ/84Fu3w1R1EaLF5TdOn1QO2TeLSV9cpLmUCbw04ASBjFjRjCPGNlL935rE1wMAON7eOQoFtfO/YaoY788kdMcihgPpLjjV6aPsNBeHtn7jaqpA8ZR1nYwV/0KSOQso2jWPVZg4QtXX7eMZDRqb44TNdcb54mpcteFByz8ovrq6jId6TlrUAooShtBDq/6+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8skQ9b7gsOoA7WBZkfV1msmdICuOxKVVr+Zo4fNktBQ=;
 b=cwYRCbtsa8GxDWogLNXStVlqWhOo/DGu7BAHS4kFXWMVDA+5FP+we5MgFmVzaNwgk9HawcQfWHECo50S+VgDrEP/cKQW13SeMITGECv/EbViFfZGVhB+Ysb8ZbXg6Sfsgwa452FIVjKIcu27Zb5DKExBWDmjS/Hkxx1EFv/qgzKdeD89WXGvwBtUAFugng//lLA7kAF4XWWiTTjRPGRwwqVM9IBJNUzagQrrTpKWxO46nn0ThK1QXBFfjupOuaU1BadQIqhYSTpFNnmkjTSwcCOPeu+z8smceuVpSTAvbD6KRfWaMuSEE0TNJE5V6AkGOMSqRqB3L8KLURSKtaCDsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8skQ9b7gsOoA7WBZkfV1msmdICuOxKVVr+Zo4fNktBQ=;
 b=oTj/hSvcydin+Fgu/2yJ+3RxA3BiW1JDkPRTPa21tKAClga2nH8OfbKtB36Z86M1X4r9/AwKXVhvGmJpR2QRlnCtf4wGSTgNm/+Be5x6FWn7q2ecWM2FTnUoYSFz41AueN2XOTNnG4aiKfRnd3bF1OGwaVz5TJzuHJ9t4jwx0NNTCVTpl2xxd+m1w60ZvAaK0ilcL90C3AqY5qQav/MGDBt+1BA+WGAGjsIIoZEoEdpYB+PLcLjE1PrK5IITvam08w+rAPvbahAgD36uW1RDY0xgDC1B9o8zYdEVG1sG226Dj9RcQs8rYjXYGdXJHo7XiwlI7o3uPrJd++XyQ42REw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7571.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 20:09:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:09:19 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 16:08:33 -0400
Subject: [PATCH 4/4] ARM: dts: imx6ull-engicam-microgea: remove
 nand-ecc-strength and nand-ecc-step-size
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-arm_dts_mini-v1-4-11b88825fd1c@nxp.com>
References: <20260708-arm_dts_mini-v1-0-11b88825fd1c@nxp.com>
In-Reply-To: <20260708-arm_dts_mini-v1-0-11b88825fd1c@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783541314; l=994;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=wmIwLyZ4RFr/AMA785JmKbtWrWx9SiGtIq1iAIMqEbg=;
 b=tWc4sKiS5V+Kag+gyWnPHSnHrZm3N3hRjZ7H8BnqMCqXByIeu+QobrqKZUD1Ru66iuqIcusZa
 HTVRvpYtcJMAFOdWtvs3iQh4y1fWxeERdLvtueOztDjJmjxe7HZH5Zj
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH3PEPF000040A7.namprd05.prod.outlook.com
 (2603:10b6:518:1::49) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: b32a5e1b-e5ef-4114-64cd-08dedd2ccb04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|23010399003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	+LEMh+ViKMSgQHxUmusoxvpVRe7d6yqDtG1K2kjRQwqRu46KpNcSgSQnnmFbraIICFNyJu5qGWaGArKQML6Vs6hPbWpyTBrRAhZYGyosU+w3P9W0QP7SsWu9VJvH52ME0j/NBtxLB7gIpxiUOok83bvMZ0E0UqZOtWT4QfW8PX91sdQFKXSJ8RS/diDAMH82za1Y9l/nAOYPS0B9ZGi1uLrj1wq5o4gV6+L+wkBMVNlrhcKrfqHkSku9dRuGKnSkfEBcJzbz9yyImowycv+vYPf/ULxQVt+n4W8y5KdlCbgu/rY2xng2IyqiPWEZohsmxR6gsOh2SjZNWw9lL8kl3GRv3ZEoAg2xBj7NqHACBqq88rItA2dueG4jkdPWym2tkEFWIRYzLeFhqH0CZTm9BPTFEMnZRUBPO/DRWcElnl4eKRTa5ZfcTwrBxvhqkid6+IGVApIrklLqUz9WOUaYrpEfu/nE52QuzURrwu56pxDJzP1HBCY2e6FFCOegDjEK0JvIDvT79nGgvSTZEkQ9qxxVAk/KZx3HHGH/gzP7WLmGepZM4Q6s7jCabbPYLjZHB1Zd65Jl5w9ya0KrXYEgnzvkB0DksBehyi4s5+b/AixTItDZTbWvfMRTgZFATcdWzT/pwBEDmA9hr4Ascz6N4HpD1HDnAwMoU7g9PvrzRqY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWZoOXRJMC9tTGZXaXVla3VtQnFKckRxd2pnUVdkWWNFai9sZW1JMzRNSU92?=
 =?utf-8?B?WXhqaGYydWY4bnpuL0plcTY3NjhtenlOclhWaTF2N1o5bGRUamFJdUhKRm1H?=
 =?utf-8?B?N0R4bDZpajI4ck14N0ZPT2JNQUpMeldGYTZhYXFhMWxvbFZLc3pCcGhGYXVM?=
 =?utf-8?B?Yzd0eE5na3dGaEh2TkVJTHdEYS90YmRXaHVIUXRJd1Q3dmQ1QXJnZWpTcEN4?=
 =?utf-8?B?bG8yNkVKaHB6ckZ1enVha29yR25HdlhQSkNtK0lXeUcyUDI3REhVK0dVZVB6?=
 =?utf-8?B?UGZraURDcG4yY3M2RTBYUEJQQU1ESGp4OHpEOHhLT3FsSzlxdVk1bVJ5TE9w?=
 =?utf-8?B?a1l2RW5DaWtleVcvZ00zYWxBa3pQZk1MTmI0VEYwb0QzSjRMR0M2N3hyZ0Vz?=
 =?utf-8?B?dnFFSVZ6YUp5OU1WcHRGRjNtUCtOdVZCbjgzMGJHQkJjY1NzUFZ5eE5JRW94?=
 =?utf-8?B?U0o5QkdDanVoZyt1SlB4c0NnaVZhWC9OU3QrWkdwVnI4YnlpSTNjNFd5ZXJN?=
 =?utf-8?B?WWJYdElmcWZsZ3loQUwxREtaU3M0TkZVU0Q2R01LQ2R3aTJ2MEt1emFnNlVF?=
 =?utf-8?B?dGZ3d0tGUjFqV1JnWG9sQjhCTHBLaTVHMWJseXN1L2c3ZWk0ZVdVWkpRRjZ6?=
 =?utf-8?B?RHBYbFlXQncrWGMwWTg0eWV3dVpycmVsMEpIYUhQVTFFenF4SUYxWG5JVmd5?=
 =?utf-8?B?ZVlBNmhTL0h4bTNMcFBLMDRqM1p6bnp4U3h2OWNmQ3NWeHRINzdvT0tWOWdV?=
 =?utf-8?B?dGdrMmh2dG5jamRsaWVaVmFtd2FMTmZtMnBPQ0g3YVVocU10eGVNR25iNVpZ?=
 =?utf-8?B?QVdYdWlJWExveW84VnE1Q1BmcWpJbERnSS9yZkpxQUpDZUNmZElPVWw4Z2RR?=
 =?utf-8?B?L2ZydkxsWi92bHlHK3JNMnBhVDhtRDRqZkdCbVc0ZkxWM04rSVJOWlpseEho?=
 =?utf-8?B?VzJYY3dlclZtVW4xbXFTMXFUVlZkdzV4SDF1T2xQVm9Nc201N0gzbGJjdGpQ?=
 =?utf-8?B?OTJJZE1DVGRHQUFUeVVKUEhCR1Npalo5UFE0SThaREJTSUYycHZSNjFYbHdx?=
 =?utf-8?B?ajR2amFCY0kyZWVJY3BnREFYTzBCTjZRam51SS9qS3dJNlZ5L3dYcnpibGhr?=
 =?utf-8?B?QXNBU0VKL3dMeS90MlJJTEFPaVp6WTQ0OFlNL3hWdFJKMnVsRjVYaE50WVVy?=
 =?utf-8?B?K0hqbjlicVprMHlBZ0h1S3RyTHdISlJTUlRscHN1VE9SWCtCMHB0U0pjd1dw?=
 =?utf-8?B?R1dTem1ZMWFRNmptV0tiWUdRRXVaTVlWamRQUzRBcEhhQXZZcXB2b3M1UEs5?=
 =?utf-8?B?ZVZhMWM1cFNKUjNmZzlTaC80bzhqenI1RjZzQVlrVElQK080bklZb3h3aDJP?=
 =?utf-8?B?UG0xbWpNYWg0bVJKeURQSEFtNjQzRzB6RTBEMVpRVHRWM3FYaktuamFLR2l0?=
 =?utf-8?B?SXhHeXd6RTlxbW5RSWJwc3d0UnRHc3B6UHkxd3lycytselJBRi9PNlNkOFA2?=
 =?utf-8?B?YUJ4SGttdnRIS212OHdHUHc2WG85bnUxZ1hjdjRSNUc3elVRUXA1SXlmQUFR?=
 =?utf-8?B?SHU3OWdXL05DNG1Pd0sxR1VxdmZtMlRoOGdHdXpUYTc3bVdTK1poR1BkdmFi?=
 =?utf-8?B?Njg0YVpacU9TSHgrdDI1RTdMT1JiMHg3amhGMnNNL3I5MEdQYkZiaWpUQWxt?=
 =?utf-8?B?RnhtWkQzbXZJbUF1N2xkRllXNnl0b2xmekVaSU1qSkc5NjZxU2kwazI4TnB5?=
 =?utf-8?B?NlMzL1RjbE1zbm9LWVRudDhMSUVUbWxseEpGMHYrSFBuWk10enNDdllsaVlJ?=
 =?utf-8?B?N1gxTzh2WUFMeVB6ZlZKRHdiaFkzSXEwU0dhQVYzWXdrUTg5dW1hN2toYldq?=
 =?utf-8?B?ZnhPdTRBTmUyU1hsYmhVeHpRQjlDbFc4ZVpiMmN2VytMMzdwWTJ2YVE3NmVS?=
 =?utf-8?B?L2VGQjJnbG5zMjlEakUwR0lXTENueFRZMzV6bUh0cDFFVXBlbTd5MnZXcjZj?=
 =?utf-8?B?K2FjejIrYnA0NHNLaVpIZU8rUExTZVFYcm0xcjZ2a3dtR2ZndU91Vm42bytt?=
 =?utf-8?B?eVhXSWV1bG5QRVVvOGVvWEhnUGhiUWZFU3BNRXBCVXFiNDJ5ME9iWVZqdVBM?=
 =?utf-8?B?cVpvTVBnVjFYc052dlJIR09FM2dRR2prSjhCc1lpOVB3dm53b0RBdUw5UStv?=
 =?utf-8?B?SkVyYUZ4d3pLYU80aEg3SE91ZjBkSWFGTEZIQ3B6WEZHZDBpQ2pCaU42Z213?=
 =?utf-8?B?S1gyd251cnkzYU5jc0I4NFhFZTlrQm1GQUpkZG5ndVJ6Slhyck9kRzhxalNm?=
 =?utf-8?B?OTVuY0p0YTgvZzRTTklVY0taZGpCUHh1cVRnN0RtcHJQWXJza1ltTG5GS2x4?=
 =?utf-8?Q?IlzzapU2jv0mmnyDb0Dw8EmpYzD4wvLmnqcu7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b32a5e1b-e5ef-4114-64cd-08dedd2ccb04
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:09:19.1098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofEqmduFCOtVY33Yl+jflFqGYE+1tXYDoISuPrXdIOiR8l7jZEr5HMET5I3g5cFzRu/9vuBM29GbY1QFujsogh1zDdz1inSQPyayKW6FEb+6q1RAawpLevJ6TtRrRIT6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7571

From: Frank Li <Frank.Li@nxp.com>

The nand-ecc-strength and nand-ecc-step-size is bigger than 0. It doesn't
make sense to set to 0.

Remove it to fix below DTB_CHECKS warnings:
  arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand-ecc-strength: 0 is less than the minimum of 1

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
index 43518bf076024..2c36c248f6bdc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
@@ -44,8 +44,6 @@ &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
 	nand-ecc-mode = "hw";
-	nand-ecc-strength = <0>;
-	nand-ecc-step-size = <0>;
 	nand-on-flash-bbt;
 	status = "okay";
 };

-- 
2.43.0

