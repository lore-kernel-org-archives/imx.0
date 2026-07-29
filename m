Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9367D48A8D1
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 13:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330312; cv=fail; b=i8sjBIw46ZTZINfAaA9YuzDl5k4/50d9othowx0350cyUT7GUZBd5puLGy5YoY9kRRtrO+A2Uk9Plj26MBA7XWMzq5/RRIUwBigzZfl6w5n5aKHdPCVJp62+J4tRVj97TLNUZgfxlvZtymLdy0qECm3SjEc1VyghDd7NClqLMWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330312; c=relaxed/simple;
	bh=Y+dNBELvk9AIlZnQMFmZ2txHSJX+r4Dl8cScZ3y41TU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=U6eaxOIvIMn7LD94bc2BZC2H2UazGNNx5y2a6v9v8CiK1IGxjIGQuWUFb/POp5JTOuq6/adkC1bfcxitLgJKpY0QGmOw//2QoAjnGD6jgzlqhccTA7P3Oxe244MpQTkLdugXN/JI6EbW4fpc2b5QPaREq4w6TsBgJgAcaExno1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FD8zzVjQ; arc=fail smtp.client-ip=52.101.69.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FD8zzVjQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsml2MDbPX5AM37f30SI1HPm556lQT4SWEkLsXd87kAvzhGodYaQzaI80bt5RL1fFKHbS8RncE9bojx7A2uGJdE+RCap/y3PYgcyzV41IDPDMXaAE4jUDFFpt3FkPe0OXR8z/jvp1el1Azm5w03BdhpqZBaGNgeHZevFpdHNo4mQ5nw+WATe14x5R2Z9s71GvirFstOPZpaKWfnc2GfzTKNShmD94zAIui0OAAXWE6/0h5j8+ArZqlMtj40DQRIgqgfYVLAGsLAeXCvJMD+RGts3rPzWzK0z/De/tws1twQxGudC7k9rjaSsikcXsQCzm97cqPJsRneJojN8gt5yaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URl4FQxFhHr7LiX8AxWBFTTIgiY02+8jlOvW6HvEFAU=;
 b=wQQZSP2PFN9U+eYf8puR2AlcnhQe3t7gdu8WGQRc3+GL1tT9cGex2G2WS4r/MWojcjTtQPWZkMiH1c/Ywp0y8iME3c5UmZmRg704Hn64pdDld6WbwIFvYVUxBmykRuu+p2WhslIA3YaM8k4dXlDZIlsbPQpWAFE39ndrL3hC8TveskFhMGjVS/KC1+wc26uSdgpBr/XiU+dqSdGfA9UV+4QZmQWcTXub9Ai0Z5W7IMUkOIU4VW6yItUmPbqf/Wmua2HxS3A77MqMNhmBdCR0aIbLiSbtcZ5h1JISyTFor23buJ4gVWGIo2sYRLSS5iLLpjgl2hCBkPe7QDR8J921Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URl4FQxFhHr7LiX8AxWBFTTIgiY02+8jlOvW6HvEFAU=;
 b=FD8zzVjQS7N+jon1MPvXMDI8dF350TRamgif3YWQlpPc0KmU7Jknzngkd+vkSjRYkxUNuImkT5pymQzzTIdNdOZygSNU1nK9K2feguKQQSe/SLL3SLaVxMK0oPLcDKmSwFXrD/ocWNuK4je4JycVYaj2jE1JZSYVCIlfmDJCmgdi6qiN3AKYFKRBTyZk1xGBvMZFjIvBghgAfsUQs+SIDPq95PONAKqm7xuNsCi0kIeb2jhsF08e+l87q+l1kppVW3B8++JvkBeX3crt1F3m3MRX3JB6P3vZTcTbLFmNCvzylRKXI4TMGKdvgLAbeZuMwy9IrIyAnIo9b9Tu6F7B9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB10718.eurprd04.prod.outlook.com (2603:10a6:10:58f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 13:05:08 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 13:05:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 21:08:05 +0800
Subject: [PATCH v2 09/12] arm64: dts: imx93-9x9-qsb: fix reserved memory
 node names for remoteproc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v2-9-debbe0816202@nxp.com>
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
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB10718:EE_
X-MS-Office365-Filtering-Correlation-Id: 615aee19-cae3-4ed1-0fd2-08deed7203f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|7416014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	RDy+YpT1H+jcQ1MuHzlBcRBx77RpbeXR3ZgUIYWpYIL9pEvLh51fM1OU+KhHAdNvQ9JLPcYqiOfniiqfm8Ne5sajPGJOHJeKSUoxfqxzQK6iikAdRbeAxcuP5W3NiT9NYYHnQp935aV5wb7K3pDdcZYTbmBWs+yUiMvqwPoOYXSLCm+JCAXrRjwIKFg+uxD7mzaA9X2e3+Zmyq67NSRriwjJyd8w3OFPjaev3HckYemarZZetNqkyzEyvjiM11Y7iki7EID5Fyyi91RnkKMF06QnXSisb1EPs5l63gQOSxexAYR0GFR+u1HcpwiSO6T+6lc01gWn4vUbOYwtYx8Rh+M0b1NnBrS7fpUAmZl+JNA10c2BSBKfY99MB4Yy6ymwAUHDKB4CszUun983vlWUWdtZ7T7QKidvjeBuuacEK764SErxbHejy4rY3QrcWnDB8q/c9iF/VonkSKvwII37yom9a8OpGVI87e4ZpGbI+xCyQkU058FkwuPrC+uIZIXIz1SoY78D7EFXRz0KfstddTMFcqlAP3FNbkz4ePOCRsrhp9wCq+Q7G7foRv1zspJqwLFyDUq/sDc+B0WCOhYNuFNdOaOfcquDHJMPvPhL2DkHM+PhH0BcdCzRvCgxD29JJPQDxLRr/YO2i0R/nOQ4AueZteypTYLljlqu0B/Hnh8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(7416014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZG9CMW9ndHBDUVQvNk9HRGhrRkUvS0x3b1JvZUZmN2oyL25HRTRRUE9Lb3h5?=
 =?utf-8?B?RWxIYTgzdkJJMFhvNm94WU0xRjJsampuNkIwQUdBd2dvUDFPcWM5OThzMzVn?=
 =?utf-8?B?NzFVRnhoL0xsVllmV2l6WWE5czJIa1djcHJ6aCtSdUtITG5DK1JSNm9kOC9Q?=
 =?utf-8?B?SEx6Smtidkt6aDg1SjUyV0NiRkF6YmdjVGRzYVdpUzNuTGlOeWpkUHVTSnMy?=
 =?utf-8?B?UHZyS1hZSTk3THNwL3VLZ05PTXkvZGpNcXRsdkluZTVZeitKYytnZkdGOFNk?=
 =?utf-8?B?NzEyVzFVZW0xWC96ZlIvUjNLK01hd1l0OUFsRjE5Rnc3cVQ0enJxS2ZzRnZV?=
 =?utf-8?B?UlFYR0RUaERWQXJGditaT3pNQjE5WG9zVmhYVDg4MHFRQ2lGT29lWjVvU3lp?=
 =?utf-8?B?UnZGNm5oS2pPZFFJNGdtZzlvVWhxM2NoSzgrWDNaRXQ1SUNOZFp2OTFVRkpa?=
 =?utf-8?B?MVNBNTYxbXVtYmZmMjM5N1dQbkttSzMwSXdNZEhJWnFMYU9LT1VXdHNOdEdM?=
 =?utf-8?B?MTU2ZjAzTk9Db2xZWTcraUhkUlI0ZWVFVm43Ymsyd1JyN2lFUUV0NzhPSVBL?=
 =?utf-8?B?UytvcCtrVFFkY29QZUw2MWNKcnJDd1N1aHVtUmZnZkp0VkE0Tm53KzhISkpD?=
 =?utf-8?B?dkRSR1k0ZFRKSkJCd3A0YWllanhaZ3R4b2wrMGVaL1N0K0Z6blRPZ3JLbHp6?=
 =?utf-8?B?alZEVlpNWVU4T09ZVnZIS0l6M093clNKSXhtcmJIeHlxZFUrcFRkRTBFM3dC?=
 =?utf-8?B?cHNpRmxpa0dEaUtRN3FvVi9uSFJkK3VnNUF1M3RqQnVVMU9OUXFtOTQ3T1lS?=
 =?utf-8?B?V1dKSGhlcTllM24zb1JzeDJQWmY1bmNkcE5wNG00MHl6UmdmVjR1TUl3MTE4?=
 =?utf-8?B?S2NtVXJQNUhPeXU4SkJIT3M0c1JlaStUMFBxL1BuY2haVkd0eTNNdk5Ha2Vs?=
 =?utf-8?B?RlJYV3JCelkwRHBTYy9VYUd4M2JrOHNxSW12TWJjTE13TU93MVQ3c251dk1R?=
 =?utf-8?B?cHNYTmZscnJMN0RKUVNveHoyNjM1bW96dDl4TFQwTjZuMTBIcUkrZDdZMUZR?=
 =?utf-8?B?YU5RQ2NJR2txZ1JRN1FuNjNzMDdZRnNJcjlDS3lrL241ZmF6TjhWVEVMbm55?=
 =?utf-8?B?S3NVSlpMazBWaVRUMVNRZm1yRzZ3S3JCczdxQ3VaNERkUi9CSjN6cGtrUWEz?=
 =?utf-8?B?bFhJRlptTXNhYWpPbHQzN1daMFNvU2gyZElHVEtaYUh4TUVvdmpKdE5GOVBy?=
 =?utf-8?B?YnNNRlRBeHRyY3lUekVRc05SQ1JGejVMN2R0VFRWYXFnWC95S0g4Y0F3YkFk?=
 =?utf-8?B?K3ZzYjZiK3RpeGVSNFlHTVNabzB1TjJTczNvZ0RKbmVQeGdrZnVHaUdBVFMw?=
 =?utf-8?B?Y3ZpbC9PVzNhUGw3S0FNb09heU85QWU5WUpPVG5VWHE1ZG1HNk1CVERlcGRY?=
 =?utf-8?B?ZDRiTEowdmc2K0d0UnZvY29ZaUx6ZTZnQ1E5anJ0cjRneUQ3eG8wM1pBeWZT?=
 =?utf-8?B?SHgyQmkzcDVkN201RUlCTFdxaHVYdkhkRlFrQmd6UUl3VWFJckY1ZXZieURS?=
 =?utf-8?B?MTc4YXU5eGt3cEdWT3VrcUxuRVR3V2pDMndNR0JIajZqc1BBVG9EMGNVc2dO?=
 =?utf-8?B?bzBpOVlDYS9zZmxHQi9tbktxQk10cnloZHkyeElTNjNEQTZXYWw2dXBLTW1W?=
 =?utf-8?B?cm9YSkRCMXlyN2hkZW5qUGkxQk9BbVRqVUlBWTBHSlhtM2w1cEdOQ1ZvSVNE?=
 =?utf-8?B?STBKVS9oalh1L01TOUFFSUt3czRZa1VSbkhOMG0rd0lSa2RPT1FQYTc2VnIx?=
 =?utf-8?B?ME9wMGRUY1dtWGFDcU5PcDhrT3FDN05iWUdQOXdqY0VjQkdVWEl3MDIwYjMx?=
 =?utf-8?B?SGxUQ3JhRmtvazAzZmZoTlZCakZhNTZEcFpoNUpqZll1SHVPdWxmUE9JTll3?=
 =?utf-8?B?NGlvWlEwcTVTR09PRThwUDNILzVOZThKYnlPeWc3M042YVY0eE1qWFNhR1p5?=
 =?utf-8?B?Y3drSlAwM1V0NGxkNk4va1JmcmRYajZ0WWl2ZVUzcGtaSGM2Tm9WU1Z0b1Vu?=
 =?utf-8?B?Q2Fma3JVWFBkcVhGeGprZWFuNFRsbi9tZ1BJSWRoYkg3TVlmaUxWSnd1azhI?=
 =?utf-8?B?RDU1MHlXOTQ2TldYS3d2cUdkZ3J5QlVkd0tCbWZZdElYNWRXbTJJd0xRL2Fz?=
 =?utf-8?B?UE9rY3ZnRjBER0xGU3ZySXVXVDdLVnp0M0VmZGZTQTVlTE9Sb1J0Ui9DbDBN?=
 =?utf-8?B?czlmUXd6bjNXR3lGOGJPc2dEdjlLcjdualkzSStvdGtvZTdFdis4MlBoUUxR?=
 =?utf-8?B?NGI5TVdWbDlwMUJOYWlTSDdEeDIrQVRHSUFpUE5pTnR1UXp2anVJWithM2Nm?=
 =?utf-8?Q?n+tXdNi67YSm/S7fX+fHz44ooY9P4DMhP45I0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 615aee19-cae3-4ed1-0fd2-08deed7203f2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:05:08.4043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIO7v4DIr82cVDf5bEHD7KiPY/Nh2+SYXNaguvNutj7M4IczKm4avV6/zGz/20gIdqeLYsEcy1tCYbPAd7T4ItoCPQJrEQWFN/37sKeiqKl/ZXcbGCTCKSyNxAf+6cHS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10718

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver checks for the name "vdev0buffer" to skip mapping
the vdev buffer region, as it is handled by rproc_add_virtio_dev.
With the node named "vdevbuffer", the check fails and the region gets
unnecessarily mapped. Rename it to "vdev0buffer" to match what the
driver expects.

Fixes: 0565d20cd8c2 ("arm64: dts: freescale: Support i.MX93 9x9 Quick Start Board")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 01c11c517986a..f07e93653e4e6 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -76,7 +76,7 @@ rsc_table: rsc-table@2021e000 {
 			no-map;
 		};
 
-		vdevbuffer: vdevbuffer@a4020000 {
+		vdev0buffer: vdev0buffer@a4020000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xa4020000 0 0x100000>;
 			no-map;
@@ -212,7 +212,7 @@ &cm33 {
 	mboxes = <&mu1 0 1>,
 		 <&mu1 1 1>,
 		 <&mu1 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+	memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
 	status = "okay";
 };

-- 
2.34.1

