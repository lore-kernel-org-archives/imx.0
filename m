Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013063.outbound.protection.outlook.com [40.107.162.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE0147887B
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118648; cv=fail; b=oC3y8Jo58ja34dP/ANmSpTT9X+q+l7xfY3B3zVE3JWEl7+JLOq7V4tsW8D0ZvGw9dfhiUSNyu9ecV8oC9m0GJ7LYgx9yJ+6pngXPIOt3x2p1F5B9wWVPYwo3acHMB2kNPTfcas6fHu8cav9guusmR/zGt9rYGCsGKSGeMh5OH40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118648; c=relaxed/simple;
	bh=otG8oteZoO5nsuMM0YSzauJt/PyLsxFOUTmIESAc1t8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SSnZMEAaANYiNsPIzCa7MtdgF+Zb5C6zM7QxlPOy7FdafuR2OvYpzsQRICThYkJT8DmgE1VMPEySM/8K+7wWe84aaJM2UpUy+1Fj8qUznnYh0cEriF+TRGNCcGlqz43P2E0L/hK2TM19uf/kE9rj6q/FI/gjxBtlYyhcCVGZPQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ebYzLh+a; arc=fail smtp.client-ip=40.107.162.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ebYzLh+a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXUhr+lpw/u0oilRhx011vJpztdu8fPyXXSosV1QXqioJGiFX+Pj1fRAtG4FCRgK6ejmdgO8kSX7mIG6ogNOzMuMOSKknd7f57zSRWZOg2r0pVvDkIXd/xLJiWv6nbXfpDeRXZ23f+vGjVuWSbwT+ag6iDcWGyUmeEC8rw52Dc3tkrG2Ky0JvDaaWCsE9iQ7pcK+67W5tYZOxLy65TzbFIRkK0B2+AT4i9kS9241rj6ZkDwbZJfeynWgkB8pg0yfdI1sCib5fh2Y9ozPTIR+WWiDFusgVpsUeyAHsIt7m23BrnzmvLictZf3S73UMnrQ+SiO+MeV+WVT5GA+nWoQUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5YzhyrUcudFiHsttxrR4skqR0APEgQNzPTocQAdW8Y=;
 b=ZpKFVG640QPVqQ+eiNTWTHE/lvDKvYCWaIY3RgPpROvnsHjg4isdvhuwB8mUW62/JgOIsX/QcSq1PbijsF0LzbKA66xATETHsdPjq8no6YY3y000ZXXKTFI9Y+qP/RUz9mtJMeqdrsLsgGmWBTWwbxRrn1hTMGmzFzxg3UUtTUob3AVfbPm8WyoTOOeMKh5xrr3t0hh5AC2VDpSJ/whp4TRuuV34DxufjN1XZaTEIX1xkPnG+pVUuy2b5uBT6WUbbGexPri8ZUgNcMMiXmF4w5k43KvSRakgnvl5+axioh/1/vvk2770Md26GXOeQiWzu9DkPLb2e908mIWMcwdyXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5YzhyrUcudFiHsttxrR4skqR0APEgQNzPTocQAdW8Y=;
 b=ebYzLh+azW3z/zOEGM36AUPluL/NhdHWYvNG4Tdvc/Rtxn8OeFzsJdAqN40ix/mEFHYvM6i51xyT3POIffVpjI0Tc2P2Ngdo/SXDaSShfv9uQMbJWXBZUCNsW8KHxhigZi4IbOA9DPGcJO7z0fO9LpqlYnd2cvFuQv2WmFFLQNA8yi8i9zKCq2zR/CjGLkzWgbeqEtTfMsFNxSOuJfLaC5xn2Wo45yqtMmQuY+tdQPSU0kz8XTdpUoaUHPnvFur8/0vCO7FkEksgOSHhxGtJyiFDhTE4NMo8rHsQ8wNLxJGJAmyiET8ui3HzX7WMAzagkPQWH/8flCc9D0jCqGjYww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI0PR04MB12133.eurprd04.prod.outlook.com (2603:10a6:800:313::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 12:30:44 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 12:30:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 15 Jul 2026 20:33:10 +0800
Subject: [PATCH 9/9] arm64: dts: imx8ulp-9x9-evk: Rename model string to
 reflect die size
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-imx8ulp-dts-v1-9-19651358b599@nxp.com>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
In-Reply-To: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:4:186::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI0PR04MB12133:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d95974-446a-4842-c6c8-08dee26ce418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|1800799024|366016|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	wsFkYxd9WgMsfY9dYrGlWudRr6Yy5uljHc7/NchTPU1LIDUs+eRMLR+QFGofY5LyGE8KPoxVxxxoVgkwAfs5lplGB4GH8OFEE5Ri3DQhmwJpVgn1hOs57CdDar8olyOsCa1124+98otu4tFjNdW+nPRYwRJY3SSdlOq9LKgAgis0e9ouiLvNdHaH0MT75psk7DOcWfIlYO7LyP+d9TGQX6WXd+7DR0ylSV5Yv8+k0Tsu4X4nI9CqW5nbz1k25QKlk2SbiWq7qlwXUTnnJqyKg7C5/mbC/mGRDR3vCqGz7qKZSDr5vpMxlaTP9XmfBiqh0aghYF5ErjvjeFjX/5LUokMLLXpoYNnq6MQwzA7rk0yv9PdaisRstwit2KCEAUldOKjtDnkakq4xP82jxKQsO3CYVHek87Pu3v6kzt+mFkq+ZYvAvZMlAQw9NZzaStqyb8iXKury9SvD3btctUwg4yW1+s8pN+DCyq7bxruwFSIhmFfDvTFriSA3oLjx2ZKGmbFn+Z/FQfcXImEqPUXDlms9AQ7MEONU/Jt3xfyd5b/58rDADhUn02EHyoLHyBoqoBvocDSgrssm8k/C1pCKEduJSyBNg4/upJVRji7uqqG3PTR/PosOaQmfp6kNBLCxixMIEhMpTL1nsGAtjdNkKrZDKkx31M0B5FaRq0flrhU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(1800799024)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXF5Nk1ickhFQm8rOUJpdFVaaXMwbHl1alJVMkRVVWN0NFFEeDJVaTVyVE9n?=
 =?utf-8?B?OCt1Q2plWC93UnNJOGtVYXpQUUoyZWtQeTA3NDduOGVrT1ZVVWxVM0NObHZR?=
 =?utf-8?B?SG9GTjBiZE5hNlV0QWNOdkNrdUZsaEIxZGZ6Mm5yV0FrL0ZtSm8yZ3ltL3Fy?=
 =?utf-8?B?VVQ2REZ2b2Z0MUN6VUxBWS94ZmxWZFJPVEd5a2VuZVZkOU1JOVJaeTVwS2Ro?=
 =?utf-8?B?NDdOaEhrSVM5b25ZZ2xRbjBQakppeXlac3EvbjVQS1FzUENqakhUTHRrdkdo?=
 =?utf-8?B?WlJmeWI2Q210WjdCdHVUYk5DMndIcUtpN252QW9qR0srQXJoQ1h0akxLZW0v?=
 =?utf-8?B?OWsxUjk0SXZ5cW81YVptVGRVUmJYaExGTDRQcG1xRys0L1p0WHMzUDhQMXlU?=
 =?utf-8?B?M0pCVC9wYTczUW1xcjlQaDVVcTFQTEVlVzRmYWV0eGhqRG03eGRHZ0V4YUJS?=
 =?utf-8?B?L3BxV2duSFU5T2xQalB1cUNjbWZWUWhWSDNOMEUrMXZrNGFqT2tsM3g2R2s4?=
 =?utf-8?B?SE1xNHBDc2RUemtHNUg1bHNUbGtmeGtUd1JEQUIyTWJBT25lbi80N1dIbDZH?=
 =?utf-8?B?UGRsZktGdnc1Q0Z0Yzc5K0tWUmpvWGxhamZPSWRxYkE1bmR3bm9VQksvSXBT?=
 =?utf-8?B?a1IyR25MY2pSTHZhbTc0bVFuZUVmNFBLTGpQa2Rib0RSbFJ5emE4NWJzdWZD?=
 =?utf-8?B?V2ZYeVNpT09RODFqZTV1ZjQxYXY2bXYzQ0szc1ZaUDFnclRPMTNaekRvdGww?=
 =?utf-8?B?TTZGNFlCOGFOOUt0OGtvMlZNbGlpL01LU1k1YWR5b1dxcld0bkp2M3NOeTAy?=
 =?utf-8?B?NnNlMmI5a2hkaFcwQ2hUMVBmdWZGY285d29ocFFVbENna09oTElXQWh2L2Vo?=
 =?utf-8?B?V3crT25VcVRjaGhhMjNEejFvMTBBd255dlVwTEN0VnlTSkxmSGt6aHFLd2FP?=
 =?utf-8?B?WEFvZit2MkVnSzhDemlkQnd2b3plWGRFRW9oMlpxQ3Q1dG1ONmpYYVRaUlR4?=
 =?utf-8?B?Z1JRYXBKc2wxYWdmZTN6ajhYcWRxZTI4YXhJOHFRS3NGbDlPYlJuVmR3cUpK?=
 =?utf-8?B?SUIwa3E2UUJma0ZaMlBWbERmU2VkbE9hellrY0hoQzArbjY3SElDQkJKZlRa?=
 =?utf-8?B?ZUlnWS9rTGY2V3A0YmhWR2hZbE9CaFIrWktERGFRYjREdmphdjhpRVJmSVk0?=
 =?utf-8?B?NzAxc0x4c1ByWE95ajBNUnN0UjlOc2taV3huNVdTVjFzTEIwUmN4TDhQaHAr?=
 =?utf-8?B?ZUVxRm9xUlc1VHQvSmRBcEdtZzluaklqUklUZ2UyUFhJelp2WXNwdWgwZWt2?=
 =?utf-8?B?QWpCakZBK28zS1lxdERFNGVOakk2TWtrelhYbkRTTkd4bldsYitRZnBWNUFP?=
 =?utf-8?B?cG1KUy9ZVWgzcHZ2QUlaZjN2YWk3V21VVkZEWHZsYWZUcmdKYkF3WkJFWC9C?=
 =?utf-8?B?Mklma3pid2pyaklldlE5M1Q5SWtiK0h0K3lCMlExckhwYis5UDErYkVubmta?=
 =?utf-8?B?M3NNbkI2ZnduN3VqQVBxTXZucDAvSzFvSXBXczN3Y0ZJSjhMYXR3VzhVSjVt?=
 =?utf-8?B?YTZFbzhYMExWd29oRnZyVmtvWXQ3UWpqY2RWQUtQU25ZdnZPUmQrM1JVY2pB?=
 =?utf-8?B?NGNUQ3lzTENmZWx5M09VeFFHM0ovMnFsM1VUWmxZcTdrc1BNa0h5THc1NEx4?=
 =?utf-8?B?QlVPWGNobFdmWFlscXZSSDhkdW1NN2NUVGgwdEYrNURuUG9iRTVqTE9JbjNx?=
 =?utf-8?B?dkJ2dVhCZjZnUTFVWU1pSnpha0oxMDdkcWxCelhBWW5BaFZDSnV3ZDBXTWhl?=
 =?utf-8?B?Um4vaWRPdmRkNGZHeHhlMTBLWFhKdXhXMzB1UmRnUHRvNG5ZLzB2bFZNdzZR?=
 =?utf-8?B?MDFSakhjZGNlTDFpQ2dyOTVObldCdnh4Qnc2VDljNm5IdElHT2pMQlo1bDM1?=
 =?utf-8?B?cHExdEs1YTh4VUZwRUNNV0Ztdnk1aVk4eSt2L3ZPWHRoTzlmUGV5anM5RjdN?=
 =?utf-8?B?SjZBKytWanoxNlBzZ2h3L291VmZlY1JCK0xIL2ZjZXNCTUM0c1VLd2hCWXdX?=
 =?utf-8?B?WThiWXIvSHBua2NTQVArdFpsS3E1RmhwSTdMdXp6LzY1c2huZkFSMDZiWHpj?=
 =?utf-8?B?eUpZSjBIVis5VjUyMlordm9HVnVNUDRPMTZwSWVZNnV5QW5mWTFoNmdYbFVz?=
 =?utf-8?B?N1VFanU0OVdTQlpXaGFwbWtCNHV6MnhzV254ZXl4dzZleTVNMmZrbTZDTDdt?=
 =?utf-8?B?aklEY2NoMTJqUncyd0dXN0Q5WWVkeno4MGd5UTg3NWtteEMrZVJrNXdCNmkv?=
 =?utf-8?B?R2NzWEFvVHhPd0pJRW95blgxZUtkcW9GSWJ5LzV3dFVnY1RPWTJUUTByOGZP?=
 =?utf-8?Q?MzeaSQjPqmbX5QUQprqvjWKvQGDWSLRSg18xb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d95974-446a-4842-c6c8-08dee26ce418
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 12:30:44.5464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6wkotZaPoAYWePoGXxibBYXeXzE88t6EFTd9wkyiXzTJa3c/p8HFRl/onR+4XV+v0y04JVC2rTAneo1jIgbzAWyu7ORf0sletImUB+wuxn2ovsd59ZuOCzKgdOPwQW5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12133

From: Peng Fan <peng.fan@nxp.com>

Rename the board model from "NXP i.MX8ULP EVK9" to "NXP i.MX8ULP 9x9
EVK" to follow the i.MX naming convention where the die size (9x9 mm)
is used instead of an opaque board revision suffix.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
index 71c66c58edc4d..e6bc6e6555f57 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
@@ -8,7 +8,7 @@
 #include "imx8ulp-evk.dts"
 
 / {
-	model = "NXP i.MX8ULP EVK9";
+	model = "NXP i.MX8ULP 9x9 EVK";
 	compatible = "fsl,imx8ulp-9x9-evk", "fsl,imx8ulp";
 
 	gpio-keys {

-- 
2.34.1

