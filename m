Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43BA471438
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 13:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330298; cv=fail; b=d19M7ZWV+kTUvk//aRJHJR4xUsAMv9yxateVJ58k7lgau77SOWKIISF5McvV7ndCt9h62E/GIY+cZOkyBgo8TBUIsvpJJX83jteU80yn6g36OqYRnTf6oBs5uZ55DySZpNnY6AaUqDJzzsw13MUNsAREeIwhnnZLvVKWgRMMfcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330298; c=relaxed/simple;
	bh=fsr5+PHTupADxywgrAIXjP0q0z3qFPhZorKq4xpWRJk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aydZDBOtkYe+Ll8I2UhOFx+j40M3WsSskpWiB+XDIHn8TqBezAOeIyvTFIlfl/unzZbSVR7vh/HirVv2UOQJXfL40tsyU8msi5EKpJID+zCVhQKppSnnN1EnSemz7bg3jzq3HuGA8AaQlWl4YF2VPcusaTiKm8nDpuEgBP8oZOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Tre8O31d; arc=fail smtp.client-ip=52.101.70.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Tre8O31d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpY6ps7N8JgUolqrAI8yrpbFeXMeufAdUzCWvpQDEJcrqd9tV2OUmU/i2nBjQPLA/gANUg3rH4rorfUDcUmEJQFNG/l9U+lynx4omRzOUHP9gi67/VJ5+o8u9dtZ59WR7oiGljQ1vNLaFKXH+51rAGD/HGRtyGpYTBKd4dpH9e4TvJqAz86NAtsO7foJWnfczfYRualrc2e+eIzaCiPnXMUe1G8md/+sYGNfZe9rnJIBurnburI410eOWBBcZrD//aGNfGKkFKEzO8pjMi/hkI0yHS0vo3Tl2wu68KkaXViSY2CVXE+rxfDjs/sSWtkUKwfng1zt9/aWcEezamV/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO7REz8raRejHS95CrU6EPY4SlZM3726AR1t0/7A4Go=;
 b=tZ6ULosoYbU/wLzkpeuEEuJ2G0b2IylvmlPuGfeuatzi2vBN86tlzFgsx3rf8CMaHzynn8kRSTAjDC4MsGEw4He4dL8q+yQ29TrkNFS0F8SSEVB2+9R7R5Z5UNjBL+XO09Q2BumpbdvUiMJKu4P8ZgXwPVHkBOQnvOLA2iqXGxXU0ppIomRljUvRtAyw4+CmzPRBkOrJ5fe8vW1AOqL+PtjApM5LTt7Mvvg//P+Qc11/On6UMAeg/0jF+zc6TUURWhSnVkCKCdFysuTFBBTHTTlWaMhwF/KffwrCEY1JlhUAfWS2wkoEXkdfWWEWyt2JyQEnthy4lsdL4xfAhqj8sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO7REz8raRejHS95CrU6EPY4SlZM3726AR1t0/7A4Go=;
 b=Tre8O31dTd1+HLeW9AJcS73QhJQIh89r1nz3EjwPCgLY4CX9iPgBfQDozj1boMQJ2qwftg08WpCGl1o/vsN4WXjb5ZgEG8gKf1qLdWj6X/VY5PWJpJ4CsuhKzZad6mKeVcfzPw5i8b6euw4DtdAmuaGXaNIKRJC68QPNWxsxsEQN9RITHBHioz8BD49LPm+ZIn7E2+Ed0b/1bX/HXdYNQbdm7trjzxJt2DBAbp3wm5tS5XC871Km6cgiMKItn6r46QunV+QW3z9zhJNORis3pF/diDLos/SBwYdyUX8m/YqYKKdnx5GFywybk6LDcIMeb2sW/SDGSE0B6eSPrWETfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB12293.eurprd04.prod.outlook.com (2603:10a6:150:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 13:04:52 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 13:04:52 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 21:08:02 +0800
Subject: [PATCH v2 06/12] arm64: dts: imx8ulp-evk: fix reserved memory node
 names for remoteproc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v2-6-debbe0816202@nxp.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
In-Reply-To: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI3PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::6) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB12293:EE_
X-MS-Office365-Filtering-Correlation-Id: 081a5417-3911-4de8-7456-08deed71fa54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CGjrxS2bQ+J4HordbPheF+9Ye22w4NabCswWPapCZkrB/A5iM/kkwpNl5V+sDOo+6Z0R0GN4Hp+skGem8kkVmLocI4+i1ISZdVkJA/DQR8E6Adoga2Xq9UgkKNRMnVdntyAesfkpH7Avr8hBHlJVe+bFIaFv6jCQXL5atDvEy4pzStLV2S3ZMM/rgNnE5bryb5d9z+r6b8ol6CIRxtcIjOB+zPEUMlqy/Gdf/H24JyqKbodp9gzZtVH7JUemzxR9D2eTyYLC8uuZ8yXq8BinWi5DBWuGxFyrn3xxgtM47oZ57iTx4f8wliQziAL0GpVz2YXUlU/VotfsacJn2IMFBKKnXH2riFvLUkA8rZrUe4Qfil/55Cy7U0iWE6zHbuf24YHbh/n2M5PD3dndxLmmTXKiWwLVjif68SyY90pGBGnyVBDApRd8BEKT9Japta4uQOmfTa7joKJNBvlgwXyWDUol5tYvPzQ60PB3/OUluMgemjJQUgm3rYFlocayQbD5YrQD0poBqgheenVH466CFsL49PvRBeqsk9X72WTF/fSDEJcvTXjrVQoDKANiTuV998XA3AyZJoAMCHvNVIu1F2eWEJTo9sBPKY3m8q8njVBiIAOSt0AKuPrqZc0zOGntaIDvZsi7vwEwwWjAHcEb4VFdc9Qx/eVSpCYElhhC8fA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anNrWWI3eDFrMDl4T3JBaHdaRTJGVEh1K0ZjTUtKZEpLQUI4NSs5cmZ4c2w2?=
 =?utf-8?B?T3d1V3V2VHF4NElhb2I2WklVMTEwcllNZzJzV0NvMyt4bmZ6SmNweVRuckJG?=
 =?utf-8?B?ZWpvVlJxeXZSMHNENWZHeWtrYlJBN3BrdldYcFhsbXFHaXpUVlNuMzdMbWFq?=
 =?utf-8?B?Q1pMS1laTVVScGVXVFBJZjRhVHoxQmpHZFlYOHg3TGNlUjZHYUtreGFUdXpn?=
 =?utf-8?B?YzdsekhSWEFJdW54QlZMZGluU2Z1Z2ltVWUvS0hwZ2YwcGFUbm5DVWtSVlZN?=
 =?utf-8?B?YzBCSmUvQVhEejZEdU5mNkJLN3FlYk1QQ2g0TWFRVVl6U21sSmEraStJaWtm?=
 =?utf-8?B?MUh5SzYrek9nRFA0RW5FRzRZTHhmQUtPdXVhUjMzSjhVb1RQUnJpY1kyQUF3?=
 =?utf-8?B?WFB6VWo2ZUFTY2dOcHFzam4yY0JNYWVIVlJneE9Bd29MU3NhZ2RWWnc2N3Iy?=
 =?utf-8?B?UEU3SHRZckVRWit1cktyc0lQaWFPcm92ZFZETzE3UXdVbnpLaHhlNEk0akN5?=
 =?utf-8?B?bFFlRWhoODY4N280T2ZtczRvU1V5NkZtY0VVZFJSSDgyK2pEdUJDT3pONXdv?=
 =?utf-8?B?SHFMamhjVU5SMDArLy90UDA5bFVaTzdEY3R1TUVabnA4dkwrNTFWZ0ZyTjJK?=
 =?utf-8?B?VDhHbEtaTHFWbWd0ZGxuanBNbWljdzhGY1hmeVFiT055S2d2Y3EyVDc5K1Ay?=
 =?utf-8?B?VnA2QlNNOW5oTWdjcDEyV3h4L2ZxaUdabk1NemM2dFZmZzR5N0oyeC9uaWg5?=
 =?utf-8?B?ckdMbTVoNHNtQ0ExRXdyamJTZWlLOGhmcmMvSnFWYUtkcUVlL1psMEd5UVFj?=
 =?utf-8?B?cEZUbkZ4YUZaU3NsU2J3QzZyR0k4c2hqc0hPSldNS3pNL0V4SXZ6SThvRTh1?=
 =?utf-8?B?a0pzQjlWdWtCcEVGY2VWNWJuU3EyaXN2VThZVjJmQzR6M1pmU0NYUmtIRDl4?=
 =?utf-8?B?K2xsWnFvUVp3bm1ueXdrbm1kVWJjUFJIbk1xTkRPbmR5S0V3Q0RVRDlwRUZJ?=
 =?utf-8?B?djBQeW9jZ3FpcmcyYmNPUlFMbFJsVE1hUUJDNG0xb3kxdlNtMDcrNzVGZm1w?=
 =?utf-8?B?NTQ3U3F4T1Zvd2thcEhTWE5vSUR2dnJXRUtIeDVFWFJ0d0ZVdVpMNTl2S1gz?=
 =?utf-8?B?TDVVZ0lxNm9OOEQxbWorQisvbFNic1VJM1h5YUEwMkhZOTBBbEN6bDZPMzlT?=
 =?utf-8?B?Z0dIaTdsL0xYUUFlMUJwNmQyZHJ5VTF6ZndwODlZdW5TYnVkTnl2REhBQ01l?=
 =?utf-8?B?MzE2RkxrY3JCNkN3ZkRkMWtHQTFlVFg1TVJhZ2M0U1NFVGxid2VoSmdCdU1Q?=
 =?utf-8?B?SmNNNU1aUGN5QVcxYzBiT2dqdEVwZmpKNUpuSVJhTnlzalRDYkplK0RPaWRv?=
 =?utf-8?B?R1RDVll3eHVxZzNadHVhbHo1d1poeVJxN0xsT2QxVEx1RnJ1ZjZMZE5lWnhL?=
 =?utf-8?B?REV4RTJlMnJ2MlVQYjBPUUphZzk5dGgwdHlOcVA5aUpPR1RYL2hVaWNJdHdi?=
 =?utf-8?B?THVQTXVyV1gweFZtK2d2bmtqaVdneGF2aWNLSXFJMjBHT01uZnAzaklmOVJn?=
 =?utf-8?B?c0hacUFlK0pHVWREMy9ra1RhRUFXcEJNVk1uTG5zRkN2Q0drYXBlaGQzaGpV?=
 =?utf-8?B?d2Y2WjlldERDWDRzMnhqVStGWXpHTGp2ckVPcEY5VW1sMW8yOTV4Zk9TVlFP?=
 =?utf-8?B?ZTNkN2tONUZ1SXUvQi8yNWFjMmNCall0ODFTazErRVE3U25SbXRjNEhyNUhj?=
 =?utf-8?B?V3Rja1VlR3FOQXhWVDFPUUpwcHNmVEwvQXdEcW5VZUdYcEwyeE1PTU5ZTVNo?=
 =?utf-8?B?bnlFeFpYTW1EbXVtcnM5dkJXbGM0bHpNaTloejRaUjN1VHpaY05EYlNzV3cz?=
 =?utf-8?B?WkhwZWxlRTA1eUk5aEFhWHhGckxIcVJSdWQ2cFJaaGZ2Qjg2SUxmdWhlT0dk?=
 =?utf-8?B?YzlhUFJIckZ3cEVlWC9yd0Y1cXlxYXlJM3VVdEZLejlLUFQzb2d5cDN1b3U4?=
 =?utf-8?B?NVFKTUNtNFNBOEYvUU95TmpvRy9wTGxJU0lkeGhpK3FIQnhvdVhrNC9RZGI3?=
 =?utf-8?B?SGtsNVlYY1U2S25vUlVPWWlaay9DdjBSQ3hUMElQSlVZVmZia2tiYWkwT1lm?=
 =?utf-8?B?S09xWTl0TEkyN205R0N4ZjlDOGN3QjBnZ3p2R0cxMnhrdkpRSmZVSnZXNFdC?=
 =?utf-8?B?VlN3ME5ZdjR5U2d4Y0NndmFXVnk1QWN3b1ltcndxWWY5ME1BcmlhT3g4NDZ0?=
 =?utf-8?B?blBSRlJrajZWRDExM1R3S0ZubWx1Y2ZiOG5tOXdKbkNkNGd2YlVCZWJLUWZC?=
 =?utf-8?B?b1p5N2pjcnJHdURMM0t6emtwVE1QRWFTMWNLOHM3R2tjZnpncm81eXdOUzBZ?=
 =?utf-8?Q?cFA29dl8piHV5GH8I5s1LlAuGV7grsammwDdw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081a5417-3911-4de8-7456-08deed71fa54
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:04:52.2990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iasd/oEanxQSPenqh26znA8jGcgbvqHhuysp3z9QauFhYEqmJziKL8KKphhAsmj6b8u5aw3nLUwiKk507VEqIQ7t8NU3lM9Kvbc+t1GXqBzSnvbkApX3nzj/XSqcmGje
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12293

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver checks for the name "vdev0buffer" to skip mapping
the vdev buffer region, as it is handled by rproc_add_virtio_dev.
With the node named "vdevbuffer", the check fails and the region gets
unnecessarily mapped. Rename it to "vdev0buffer" to match what the
driver expects.

Fixes: 014fbffa25a7 ("arm64: dts: imx8ulp-evk: enable CM33 node")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa0..48a3e40053299 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -67,7 +67,7 @@ vdev1vring1: vdev1vring1@aff18000 {
 			no-map;
 		};
 
-		vdevbuffer: vdevbuffer@a8400000 {
+		vdev0buffer: vdev0buffer@a8400000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa8400000 0 0x100000>;
 			no-map;
@@ -126,7 +126,7 @@ &cm33 {
 	mboxes = <&mu 0 1>,
 		 <&mu 1 1>,
 		 <&mu 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+	memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
 	status = "okay";
 };

-- 
2.34.1

