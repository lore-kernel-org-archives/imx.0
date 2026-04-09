Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013067.outbound.protection.outlook.com [52.101.72.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B40B3C457D
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 11:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735929; cv=fail; b=nlZD/8nwNFMjTWxz7+KqvAZJJBtITE9goCAHBcsyRD0V0XHwh1ojsFWruWcXuW6uxQ40d4XKQpmRJhtP4vZDwHBqfQledwzazJCCfwK1pRb8xeXd77lAgNVU1VGzlXeaa4E5bKyeoJw6b+hQFg8snRr4ZP9Qbt8YHui/vUSg9lo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735929; c=relaxed/simple;
	bh=YZUOtiwesN6QUICs3JXsj8SB8rSg5ns0HUPMSm7K/10=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jP10S4VfIBAFFQkWjsMnz0n7CER8svxCITL13B8YUoem9cd5WY5Pw+uk+UzCeVRtLWh0Tq50Nigh7DqP6Vtb9i1ugUROTcHecFvN4v3iv3ExLuuxbQw5y6VyljLMQ5tKWU+rw+HYOzu7fKiVWA3yIwMLAQQ2ycfY3JuzkBcgHFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=o93ywI4D; arc=fail smtp.client-ip=52.101.72.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="o93ywI4D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJ9ZrbjibkGPTcPym0XgU2GAU2HWJVGivOpcgA7Y9YeBkgOTk+2SKCS61ejHjkFntILwU7zZnV5vMZWZFMm5nYfncF8ecxoj1VG4Bru3x2YNZyPl3iSN+pacpbe/+0peEqxWnZNNyXX5Ml1LapPy9Ct1jcjlfMLs29k6ocYqIDoDHOB+9/FbhiWedQk1CDYYNyF/erO3KRrDG4BCkjKhbtwD3xaKmDCFq6AFaLg1dxSTTaLYpSXJD8H/FReVNpCl/FdGWD3ZRTE7SK3r6Yd5OCnW8coEmEfUil3CCxUS/3Ngf9GAbq3dZRNXPOD39Em81eIQu7SbYvGSbxzsAUna1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roKkgZN/kmoawv0/luWRAqH1nxzZZT6j2D6zz47nL0Q=;
 b=CGzh994TFwIq8egPJaZgIft2zuKKv0IeGwOtbqqUt3LmacviTZ6CHkHeMm2EJWAry4DQxFsKyOr4qQuLa5adyUr5lVe0o21/HLgp80VNCCqYOEPkmMzmKRRu0SMrlwbkAymUqaghQUVe805pFx0LIZaXQe3tUtVUhEvhQGGYAHie+nJluhButMwLgsLNud+JL/o8poQZRBGLzXyX4gfV/lYL56k3sf3izjhp15W/fi7N1BY+19yAOC34NnLtV6KtKRChteRfWwy0CNsLFz9liu/LnJceKMS8LGrhSo/av7OP7BwZjQu0ZI01UxBr3kyGIdTqXpical3UpXG+SnOcrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roKkgZN/kmoawv0/luWRAqH1nxzZZT6j2D6zz47nL0Q=;
 b=o93ywI4Di8QFM3ClA2IaDz/htF/bSs++WBEQLnlzF8yR+9nRu8oeTKOR9JTF2QQR7vnSZUgcT1LTcz05Q055r8syjy0vWLcwf4vsIY/JeiFd17M1+5qBPieXLjVWBddbInrz6yym752wVn5OLRvlqQDpwN91JLxSCTWNu5EYcgOSFjtpjUzbiL0Ci3fEjGSLJB5QrHBePjI3gufVhCjq7IqrxT9zY54CfzOTEElfgGzClynRWzI5IPKJaUY0TTU0ZmayoD4QqCAxBKBPYin10AMF/9tRlFN5q+OnqosjZCCSawM39bLH2joLl4aEJexp6j0Nbw/HGRn95ta5Vd+9fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10686.eurprd04.prod.outlook.com (2603:10a6:800:25d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Thu, 9 Apr
 2026 11:58:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 9 Apr 2026
 11:58:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 09 Apr 2026 20:00:02 +0800
Subject: [PATCH 2/3] arm64: dts: imx95: Add SMMU PMU nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-imx95-s-dts-v1-2-858e83ae1a37@nxp.com>
References: <20260409-imx95-s-dts-v1-0-858e83ae1a37@nxp.com>
In-Reply-To: <20260409-imx95-s-dts-v1-0-858e83ae1a37@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0073.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10686:EE_
X-MS-Office365-Filtering-Correlation-Id: 06a81948-0b98-4680-cf9d-08de962f5468
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	O/2qzBPElqgc7Sr6yO9m79A3p4dEf7gKidiYbN7IU+vaffDGhynEjefs6k/LZCmPhYiYcTBiyzh3Ts8HbMg49T9i6b275ZymNQgwbJKKoN9y4oezVW2aS62z8A4vuePdU5W3v8ERWDuGP0hBWJAuotVrRQdT/ZvUUSPyD2EvYA5gTYSGoa70kPsyVSuy394rMlOwBpEUS624W2PmhztTcbmr8FG+kdlRW7HOebxB30i81NGVwwEjjMUMtaqK+j7BEDUGZ62/nGU1e9MJM/HQ6Uaufkrg0UVC4iUo7WBlPetZk0BjFezGNNRgCadev8SPGYSkDGMUApQ1+ZW/Z/ct162wnxLt4K2HbThO/9VcQSZQtm4vxpZJ+Vw1cgKIjqPO8JzgSouhGUPbrEYaqedwews/MzGAzAIBGbsX1183iGUDus7d8ol5+ua7WPBJjSKra9BTQ4CFRJFkj1jOWZDEuWhEmqrFoitsSdBP2FC401P0gQYZh/ejSCwjAqnkWtkPxEzwkfIKg6Ydhs5pCbjzgm5gu5HJXQESZQtOkwtrHEiKxMKbZnPOQAwjwFHv+dthVqjpitzs0xp2aelgPafr6KwEjPNheNXQ6xZRqksbGa127PQiofhb2y1LJZJe/s/jmUvg7QzCa62RMRjBGrlZsYNwbggBJj8zWUPxhLZzdE1zjS/gJJKqJ/qq027uA5st0bOr+QFq4HoOog/fRJJdq0Dq2fKomuNFWLDOwyOuCHZ9pLMt8nbxiwRHA9Oi9S3498jrOA+j0vSGuiFiFN4foOhX8svv04iebGmSvXkKkMQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGJGeXZSeVE4N1ZYakRIS0FWUXhlTElkeXp6VnZOZWkwcUxsWDQrejlNUnJE?=
 =?utf-8?B?MFYzQ1ZSV0JCanJzOFB4NHdZMGd0STRLa1BpMkZoZ0VkOXB0ZGF2ZWx2aTU4?=
 =?utf-8?B?Q2YvY1daYjBxaFF4QmlRYldIUVZGc1NpQmFLdDdzUWMwN0xNWXJ2U3cwNlc5?=
 =?utf-8?B?R2F2cStqR1YrZy9hT0xNNXdxdktOTndLZ2NPVlNLcjk4MmVmWEhrOWY4VmY1?=
 =?utf-8?B?R2dzWE00VmxnazNWTEM2aWUwTWhNb25oYmhxMmNMcFFKRFptQjR5OHY4Nndv?=
 =?utf-8?B?MUp5NS8vTFVxQTljT3Z0bytkaHhoVnZZa1RMOFFyMjFnMkp3aURNRlp4ZHh4?=
 =?utf-8?B?eC9Ma1dnRkNPSWh2NGlBbUN2UUErdGtYQWtvaFFYcmx5K0hTWHc0TWJydk9W?=
 =?utf-8?B?eW1IU1NTTCs5b0lMeXlTQ295WXZGTjdhOHExdlBwNjZqR2VSYXhHbGdLVmVO?=
 =?utf-8?B?YlFva1MvZ1JVQzd0eS9CcEVmMHk2UUVHdTJ5T0xJNS9xNkJ0d1J2Um9IZ0t5?=
 =?utf-8?B?alUvVkdVcTE3bEpmaWlubTJMUFVnUEFqbUlHUnhyYzJwdUZXVFRWakxRSyt0?=
 =?utf-8?B?UkJOeTFPZm9ESjJITG9tOUlPcGtab1Q2S1lwdU1WUHpXM0VQT2dlTFBkeEhj?=
 =?utf-8?B?UGxkUmVlZXJnS0FlelI5RjNoTGtsRHBMaUZRd2pYb0VPempmRDRwdGN2ZjVK?=
 =?utf-8?B?b0k4YjNuNG1SNTF5azdhbEZQWU9DZElzVEIvZkJybjBrL09pb0ZEbmhlMm9W?=
 =?utf-8?B?SUdUVHAwSzlXdE1icGIzemFNQnZNWTdMQWFXZGJ3VTZLMTRIUllCSDJFN3Fp?=
 =?utf-8?B?MUlqeHFPWWNxMmcyOGZxUEFsRnVjUEZmaklscDd5Y0x5eXpPeGZtbGtxQnpz?=
 =?utf-8?B?NVZQbTArSjZhcmc3cHQ0b1hNRlEzejJPM1pPZGZzc3d2dGRHL0k1ZVdjczdh?=
 =?utf-8?B?Sjg0TWpQZURheEwyMWM3R1RhYXRsL0ZvUTVZSWEvRDJPRzdxM0RKcURDTzZN?=
 =?utf-8?B?SGk4VU9WUW1mZWlYQjBjbTgxVnRIdEhKZXhEK2ViYnR2RWgzMTg1b3QvTUZC?=
 =?utf-8?B?Q0NwWHBQOWRJeWsrNU54OUJUZEY0TVdKSkQvVTMwckdWS3NkYThaZ2FJQ1Nw?=
 =?utf-8?B?TWVOT1FHdnE0TlU5c0pHMEVybmJ6REMrSVd1QldCaFc1eHJEanNVNUV1WHZV?=
 =?utf-8?B?U1BpdUxabWs0MklSTmRSS2plRVJyQ0U0MC9ZeWwvRkZUV2duSXdsYVI0bm1o?=
 =?utf-8?B?MWJhOC8zN3FhTE01S3hEVnppVHVpaTBnbkRNTENLclhLeHJpaHFZUVlmTzlI?=
 =?utf-8?B?REtzckJHekxtS0tTQmJwT3hqcGxENGN6WXZEUjNaQ29RZWl2SXpkd1FqUDJw?=
 =?utf-8?B?QTdhT3BxTVR4Zmp3UnhFSUlhMVFWcTNzYkw1a2FmZnVCc2c2dVNwQWdxaGdh?=
 =?utf-8?B?eHc0YlFPaEpFZ3RscUo1UjRpZ25IdmVubGtHL0MyUXBodUZUMERMdjYvdVZR?=
 =?utf-8?B?Z0wvb2Jud2VMM0M3dXFNdVQ0Qzk2TEZEblhVSVNCOE5LVzlyM2gwbjhVREsx?=
 =?utf-8?B?Rk45ako5R1d1QmZ4bzJqZkpWNEhqODcxR2VjanNiZEdGcmppaVFXNFlmSE5x?=
 =?utf-8?B?dVZaWTVMU2k1ZDRYcHNBbjk5MVV4U2ZFTnRSZkFsK0l3NzkzNTdTa3BwbUNL?=
 =?utf-8?B?OVFGam9WdTRud0NhcFJOS25DR2xkVzBCdk40NHIyMko5cmJFMERxUkUxNmhJ?=
 =?utf-8?B?MEdIWU51eFZSZWxtZ3VGQzh1bDV3em9Ba3crekhXdVQ2cnlKMGRNeVl4c2xP?=
 =?utf-8?B?Q2FIeDZrWDBLVkFtUUlJWVkzUU9CUGdSTVZqd0hTNTlWMnZBKzg1QU12cjJN?=
 =?utf-8?B?UUFxRG5TbDlTTVUrellYV3ErMmdQR25aZUkzZG5yZ0g4WTBud0RHa2pWcXUr?=
 =?utf-8?B?bmtwNHJaMXYvRkZycjArWndPU3BTVStXZUdWNTl3eVA5K21VZVJCaFBJQXpV?=
 =?utf-8?B?YmFTbnVEbHVVZWJKL2p2VzAySjU5andmbVlKRENZRFVrUGpDNndrWlh0QVZq?=
 =?utf-8?B?aDEzWG1JWUZLVU1yYWN0SXplMnJiUjZ1MCt5THlzTlFxTVhaM25XRkUzMnhW?=
 =?utf-8?B?V3RnRlR0Yk5DMEE1U205bTk4SkUvL3QvUVhxL3hHL3VTY2pXSVV2MTE2bGFs?=
 =?utf-8?B?TUVOLzVYNm1sT2g5Q1orUGpkaHhwdGx5QWtwSWgwMzc1SHhiM3I3b1FkMHl5?=
 =?utf-8?B?NVhvRUlnSnBRbExOMm9weDB6KzBGaTlhb3FjcjhrRFJGbmh6MnNqY1o2NnVv?=
 =?utf-8?B?N1BJenhLUTBQRjRLRGlqazV2a3BWZWN1SjJNQndrZjJsazNZMXROZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a81948-0b98-4680-cf9d-08de962f5468
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:58:35.8299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Un5besvcod/0Nf6RCWFea9IorkkMYrkNvL+BalMsaxYZo2GhZbyPLZe0Ti97dInA8Dt5xArkEtgvIpFCntDnAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10686

From: Peng Fan <peng.fan@nxp.com>

MMU-700 supports TCU PMU and TBU PMU. There are one TCU PMU and
11 TBU PMUs, add them all.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 84 ++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 28b19a47a59daaff308fecce6e7b9ffe14133f74..3e35c956a4d7af88310b3dfaef7e3d064f530e07 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1770,6 +1770,90 @@ smmu: iommu@490d0000 {
 				#iommu-cells = <1>;
 				status = "disabled";
 			};
+
+			pmu@490d2000 {
+				compatible = "arm,smmu-v3-pmcg";
+				reg = <0x490d2000 0x1000>,
+				      <0x490f2000 0x1000>;
+				interrupts = <GIC_SPI 333 IRQ_TYPE_EDGE_RISING>;
+			};
+
+			pmu@49112000 {
+				compatible = "arm,smmu-v3-pmcg";
+				reg = <0x49112000 0x1000>,
+				      <0x49122000 0x1000>;
+				interrupts = <GIC_SPI 323 IRQ_TYPE_EDGE_RISING>;
+			};
+
+			pmu@49132000 {
+				compatible = "arm,smmu-v3-pmcg";
+				reg = <0x49132000 0x1000>,
+				      <0x49142000 0x1000>;
+				interrupts = <GIC_SPI 323 IRQ_TYPE_EDGE_RISING>;
+			};
+
+			pmu@49152000 {
+				compatible = "arm,smmu-v3-pmcg";
+				reg = <0x49152000 0x1000>,
+				      <0x49162000 0x1000>;
+				interrupts = <GIC_SPI 323 IRQ_TYPE_EDGE_RISING>;
+			};
+
+			pmu@49172000 {
+				compatible = "arm,smmu-v3-pmcg";
+				reg = <0x49172000 0x1000>,
+				      <0x49182000 0x1000>;
+				interrupts = <GIC_SPI 323 IRQ_TYPE_EDGE_RISING>;
+			};
+
+			pmu@49192000 {
+				compatible = "arm,smmu-v3-pmcg";
+				reg = <0x49192000 0x1000>,
+				      <0x491a2000 0x1000>;
+				interrupts = <GIC_SPI 323 IRQ_TYPE_EDGE_RISING>;
+			};
+
+			pmu@491b2000 {
+				compatible = "arm,smmu-v3-pmcg";
+				reg = <0x491b2000 0x1000>,
+				      <0x491c2000 0x1000>;
+				interrupts = <GIC_SPI 323 IRQ_TYPE_EDGE_RISING>;
+			};
+
+			pmu@491d2000 {
+				compatible = "arm,smmu-v3-pmcg";
+				reg = <0x491d2000 0x1000>,
+				      <0x491e2000 0x1000>;
+				interrupts = <GIC_SPI 323 IRQ_TYPE_EDGE_RISING>;
+			};
+
+			pmu@491f2000 {
+				compatible = "arm,smmu-v3-pmcg";
+				reg = <0x491f2000 0x1000>,
+				      <0x49202000 0x1000>;
+				interrupts = <GIC_SPI 323 IRQ_TYPE_EDGE_RISING>;
+			};
+
+			pmu@49212000 {
+				compatible = "arm,smmu-v3-pmcg";
+				reg = <0x49212000 0x1000>,
+				      <0x49222000 0x1000>;
+				interrupts = <GIC_SPI 323 IRQ_TYPE_EDGE_RISING>;
+			};
+
+			pmu@49232000 {
+				compatible = "arm,smmu-v3-pmcg";
+				reg = <0x49232000 0x1000>,
+				      <0x49242000 0x1000>;
+				interrupts = <GIC_SPI 323 IRQ_TYPE_EDGE_RISING>;
+			};
+
+			pmu@49252000 {
+				compatible = "arm,smmu-v3-pmcg";
+				reg = <0x49252000 0x1000>,
+				      <0x49262000 0x1000>;
+				interrupts = <GIC_SPI 323 IRQ_TYPE_EDGE_RISING>;
+			};
 		};
 
 		usb3: usb@4c010010 {

-- 
2.37.1

