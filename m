Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011068.outbound.protection.outlook.com [40.107.130.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F4F333439
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510031; cv=fail; b=t55mMx1ZVObxHbs6Dr1kVLDuzBYsBQLIR/BV/U12gSD1CsjRCj9r42ChpQ0L4cE8ay68PTw9kleG3qY1te8syRZI1qLRDJ4Giq05I1LWgUFigjfup7bcti+uiMGi/TSL8oUZ+UnBVTvvCmD491LNl5GkklLuiTUhtMCTwoy16A0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510031; c=relaxed/simple;
	bh=ckh5nmJJ73WjJFExJ6XV8FBKC+gbCfgV7D8oKGLHq/o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fkwlQv0fh7RYcuUQ8JJjrrHLbpQ9rUlsUlp5M6AXD7hx5rESsXsNRINN+lhkbKKG8CRjLfrmWck/pLdw30zdA/sMs9ymtQxrOMvlCRiHZvC0Y7ocg8Tl+yBNLbUi9ZbX8ZsVf37t/NMZjckLl4PyBI/RvbGnenjGTBHqM0LqW/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=c31lI60B; arc=fail smtp.client-ip=40.107.130.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="c31lI60B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfOguxKwUc1MaU5Rn3GjllvkxrpQHp99jF0sIkSO7DRFqqBygtuYfANHdcb1uQniqwvRky6xy2VynWWZXfMVo2+aMEY87LZ5TEoNfpqj07n7QvBLu9wff8qM4V0TSArcbr54hNb9YDphtyKIw5UVuxiIcuA3WCEBwlyGeDqvHLxByMM8IyaF5wzpYgfWxaPEkTI/IADQ5sK1yur3JZLY7iazvwreTkUXp1isCVgbOEnmBv3SSKl4gzACOHGOOsmuu7uLVQD/69YcoBLB4KuuPnQRRpYep8Znf10jXxfCBzxq3VTqhNysSkQXhBHhazkBBctfslmJGqGMO4n5qngN2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhIRPpoQlUcPg++NA8m0AJYsRE3vefGbI5q+KcC90Wc=;
 b=AAOnAx2FR+ItrVSrqEqQIuLNT9GQIDQM163K2Z+UqWSy+kNaUQGygwh5CfrqlqydU4ekjDsP1h/9bxSRFydZtLPTHFlERYwVKJuv9l5fIIlNVD3S9GlH5Ozhz/fnh1HK1wmPnDCuzDxqTr0Rh8tZcYM/B+Ofwm+65txT4IQhhzLELKHqSq4bxfPa8J9JTlUPkgz+1V79ryXkr/imd+SPnbu9NwGO3/tqeAnS04wBC+PENpzYQ5/868WCylvA0LzxPyv/Ip1d3LeWrb0NZfc1S+hCVHv9Ds6gJlmJRDxberfbFqxYYKFR3X6ZNpUmG/4zw3yYF6dCX+RRNk2nww308A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhIRPpoQlUcPg++NA8m0AJYsRE3vefGbI5q+KcC90Wc=;
 b=c31lI60BYFFS/hlwswCxQ+Jw/uWvlfbQTCKvHhCw1TNUk2dc56arCT/EzjUO5UdvDqGZlH6AXdj53J8iy9nM8o/Ov9u7bIgE5mM/xVXm59QqaS2wF6AVfofUSf9sS+xefdtnw17Kb2i6uRjbW5P+8Jc/JLNWToRt1gM11vIFVnX80b6R603S424r0lMPejVbWknbMR/CKPLY2VJOw6GSPIgxPvnvFc4PNpdEz6DZsRvHo0JPRsyZzt42vbJ5fNDjVnpuYpIu1pd8AZ9b8qIEau/AWiIUJlPUT6cguKDFLblUemtcfV21jC+u+JPIjmrqxXqR76WAx6V9m6QI0piGOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:27:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Thu, 26 Mar 2026
 07:26:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 26 Mar 2026 15:28:07 +0800
Subject: [PATCH v2 03/12] arm64: dts: imx8mp-navqp: Correct PAD settings
 for PMIC_nINT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-imx8mp-dts-fix-v2-v2-3-62c4ce727448@nxp.com>
References: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
In-Reply-To: <20260326-imx8mp-dts-fix-v2-v2-0-62c4ce727448@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Gilles Talis <gilles.talis@gmail.com>, Viorel Suman <viorel.suman@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>, 
 Matteo Lisi <matteo.lisi@engicam.com>, Ray Chang <ray.chang@technexion.com>, 
 Richard Hu <richard.hu@technexion.com>, Heiko Schocher <hs@denx.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Josua Mayer <josua@solid-run.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 =?utf-8?q?B=C3=B6rge_Str=C3=BCmpfel?= <boerge.struempfel@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI1PR04MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: b7352dec-6b7d-4e0b-2452-08de8b0907ab
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 EAoI/TlRev6fU93UD8qc4K7KI9Iu99ViWIl9f3KVicIIlfvtedmb87DszwpPpcB9Jz30Y6OHDbulgHpBf6U3gWl3g+izqg6JzGbbG+ZB3GXmVyG7gGhyzIT2nl3AcIgoLJUsJyWeXIq6uE93ePf4bkaLYZQkPsdFJBKdu269PrHcZezsxXPtyRm8Z3kCL09N1M0DGJIrifv2z/F3cuS4Y4Wj/vPlu8g7CtxBO1XgxpZIdYKKz9wIgoQ2u2u0gZC/H4ADr85apEcC3n/n+3cp94h9l8jyNZAQ8ahRAG/NMMhM+fprOvn8eJowigtfoPvZmUvIWMalGTCa32nZvhiRpwdspr3cddZlYgnwqdFJ5v4Kis840YTfeUHqTbwxWA+3nlUPQ7NpzSyTESO9/te7leYUxYhmnRXVuemGuEmaqNBeLGnw0S1b9Db+8sY5UOwswhjxMjy2+zmJBkoStRpewbVsFfF1DPJy2k4YUu4R+3rFcrQop/+Qe7hprYqiHPNfTN9iFaYdSF641xLMe9MpzGmzbxho4/gJmg2maXU51bBmxRQl9lglzkjp16NZuvzY1Q7CarG7XXlrz2Xf3s4gVRRQyRRrS2GyU0saIld1ejzdN1ZpODayZVGf5nPGM5lmftmVXB+anc1ppRrf0urVdGgVLn+S3pVSOgBtUTN+0XBWK+J7FptBrLEEBXC2T5gIIPgKzewCSs/tvCbZOzqPuZjfvQA4SXzFR/BfxJgeqhiUlBsIsvNRtafYh3VyBMwaSEUVA4mUCCiJ5J/OVeRWS1yq69teLGdMCvWFtYwW6uzKFGFRUrEgidzKyIRp7P8n
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dHdZQ2lMK2RrNGhiUUxodjJZcG5yTTNrZHYzaHk0WUFiUTNsZEsrMG1Sd0Ra?=
 =?utf-8?B?U01TajZyV2kvaDVYSzFXUm9nRHRKUkFOT1JjcnpHT2RwYWJKUmI1eERmMll5?=
 =?utf-8?B?dE42Zyt4aGJPMmo3RXdBaDJLUVFOMTN4KzMzekxhZGNCN1B6K3NrTUxNd2hN?=
 =?utf-8?B?OGk1SnQ5TFEyTkx5QTdxSGVaeENHME90UG9tNzVqZFA1VWliZ24rNWprS0Z5?=
 =?utf-8?B?STZwTVEwSnE0WXV1d2pvaXdMelNNYW1TTkNDdE1HeWZ6bjcyMWR5b2xPeEZl?=
 =?utf-8?B?WW9NTlNBYWtyT1NkSWVhdlNWUGlQeTg3amU2UDdzd0lhY1FQNTlMazVkZkx0?=
 =?utf-8?B?ZTE1YzE1RTFEeXk2ME1HK0VGcTl0RVVjRmwxVmJPOHEvQWZiOUMvUTNWWEZr?=
 =?utf-8?B?NEZ3eTVxa3F5NG11SGVoSGZOeXRjbEh0bnc1STBacFRHMkNYRVYyVG4zd2Qw?=
 =?utf-8?B?QldpeVh1dTBPcmp0dDJUdVpvRG1oRGdBRXVsenZyeXBPTXEwWXdWTzN4aDc4?=
 =?utf-8?B?VmdHTHE5SXdMcG1uN1F1Z20xVmorcmtSa3I5UEU5MElja1dlOVhLV3ZlUFlh?=
 =?utf-8?B?alJ2endON1FhQUtsckNTbGlIQVRVNG5NUzdWU0d5VE03Rmh6Z0haZ1V2dytU?=
 =?utf-8?B?L3k1UXFmTFVXYkZtbTNQalkrZVBSTkFpc3creTJvdTFOZE1nc01FRm9zVVJr?=
 =?utf-8?B?OWo2REROeHA0WDU0bGdyV001V3o0N1U2U2JhODZsK3ZZdUV1N2oyM3J2UG9q?=
 =?utf-8?B?MTFIb3VFdXdlN2VNMEhYdndNSllzL1N3QlB1UWNvS1BGNlEwaEJxWVVGRndF?=
 =?utf-8?B?Zll4TDY3RHJtenlUYzlkM3lGZ2hPQktnQU5ud3gzZU4vaU9tMmx3aUY2Qjl2?=
 =?utf-8?B?YTZML2lEY0QyMDlFaWtKQ2JEb1lqRzlacEJPdkg3RjAwNExydk0wZzh3UXZh?=
 =?utf-8?B?K2JYT1NQSDhwNVFGZDIzd1BsbGtpaGl6bTF0QmhYVjdobDYxd3pWNml0Nk4w?=
 =?utf-8?B?VSt0UVNETVhqa1BCNXUwTndMbkFzWEpMbzRjalg2VHh2SDJGRmV6MEpZSVFJ?=
 =?utf-8?B?dlBVK0ZHM3h2R1VsZGNGT002b2FEdUdFQUlrZmRyaDFjZ1hFMTh0emNLbWs4?=
 =?utf-8?B?VXhLcHkyWmdIN3pRWGFjckx4YXl2WkczKzJ5aWlUbjhISWNtWWNuMVU4OHhG?=
 =?utf-8?B?NWU3ODAxWnY3VmpUNWZUdXUrTmRXZlNmMUtCdkhPMWZTU0UrakVoSW0xS0ti?=
 =?utf-8?B?K0s5ZEdoUlpDUnpQanlrY0NnRFBlVHUrR094c1l3MGJndmp4L29YeGxnRnNQ?=
 =?utf-8?B?cU01K2NrbERNTnpMSzhnZjZReFNtNitKTStOWkVRak5jR1R0UWtRZHB4ZEM1?=
 =?utf-8?B?Tm9mNnlQeXU4UEVtakdxV253Qk1zRVF3MzZhUjBkR2pZRXVrMUlGblJyWVVS?=
 =?utf-8?B?UGJHYkE4Tkwrek93QWpuRTN3U2txSHJCekk2TGxWOExXOGdLYzUzc0VGZUlQ?=
 =?utf-8?B?R3drTlN2b2dzRW1JSGxORjA4THh4MnlpbklZUmVmSmNxYWp5SmxaK1lwMlRr?=
 =?utf-8?B?djhvUDhTa1lWcHdoOStyNnp2Z1BXcDhGUlc0Qm4vU1FxTjZoT1JGZFV1bzl6?=
 =?utf-8?B?dUVqN0llYlZlY3dFN1N0SUJ5bHBid1VveW0xd212UzdEcDNrc0NpZWJpdmpT?=
 =?utf-8?B?dXErYVI5UG9iSWRxM0R0c3NaS2VIZlFsSGJsN1hMTmsvbC9IaXB5elMzbi9m?=
 =?utf-8?B?M0I2YzFtOVBIODF4ZzVLbWtZSXk1NE84ODlLd3dBK1psWXZQZExUQlM3eDdm?=
 =?utf-8?B?K0ZGeElHeFJSY0pQWXdZNlA3RmV1SFpUcWFRc0ZRMHRseW1OU21vN1JMQ0ZW?=
 =?utf-8?B?eUhIZW96T3QvbitYNGljNHh0a2JOME5FdEpuZ2p2dDY3YUQ5MHVyelRGTVlr?=
 =?utf-8?B?Q2dKUmZBM0Q5S1V2WVNLTGdCcjNrQk1XTWVmMllCSGhDUmtLV0hxaDRiQTNi?=
 =?utf-8?B?bVN0S25tZlpnenVLNFFWckVOUlA2dTdRUVNucUxxRy9xYTBkVTVhMk9ybkFT?=
 =?utf-8?B?RGdDZ0d4NE1VbEM5VFc0REZITTJOQlNkU2tSaWhjQll2eG9UY2RNTy9EcW9y?=
 =?utf-8?B?QkNqaG14UWR6V1hwZUxiNktOb0FKNVRoL2t1YUJnRE8vbjVNbnBtUnZ2RkEv?=
 =?utf-8?B?a2V4ejVFSFdjWWg4Rkp0TDE0Si9qMTFHeFQ4WG40cVgyRHEyeHFud3RydXpY?=
 =?utf-8?B?Y2ZxSGtmVHF0bS9LR0ViZThqTmdWckVISzRGN2MxTmJpVkZMSkcyYlBqczdm?=
 =?utf-8?B?T2JlNWt2bW5PcFRYVVFQbjU2R3d3Q2cxSEpFWkNWSHN4VWdhQlhydz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7352dec-6b7d-4e0b-2452-08de8b0907ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:26:43.4710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zcW2FH+kgOI400IzVEgnGofrhhtYfPgW8rirtNLVpcNeN/KUM+5gYqSIvMqGZMs/+htVKn8EqVueIW4OJDspOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816

From: Peng Fan <peng.fan@nxp.com>

With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
there will be interrupt storm for i.MX8MP NAVQP. Per schematic, there
is no on board PULL-UP resistors for GPIO1_IO03, so need to set PAD
PUE and PU together to make pull up work properly.

Fixes: 682729a9d506d ("arm64: dts: freescale: Add device tree for Emcraft Systems NavQ+ Kit")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-navqp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts b/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
index 4a4f7c1adc23fe2615d8eb4904d795b46af4ca9f..9dedb9f11145ea842b4e718687dd153489ef4337 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
@@ -356,7 +356,7 @@ MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA					0x400001c3
 
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x41
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x1c0
 		>;
 	};
 

-- 
2.37.1

