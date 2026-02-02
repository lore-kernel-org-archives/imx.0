Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4D21DDC33
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 03:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770002465; cv=fail; b=aeKPDhgkMP8SxG4YHRT4egkqKMPXrcWR2Jf8LM4eh11KqarUNN6RtARdIUa0IiRBncz2cNrR8z+QD68YvslfwpeQZv2BN/TFHSyNUOXjYS9Drs71bvnpjJnTFc2PUcjjzjBL8mhQFVxXRJaXF33uTXcKK7vciyYLrZ5htB4tyQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770002465; c=relaxed/simple;
	bh=S8Zcw88+wwykdmDcB7GyDtuCHe6s10+BoDeXWlg9jSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dk3pwM+zsb2dx3SrAMR8hCfU8B+YemTIlLOkLmpKYEduzbuu5y3XTMxUrK7eTuJ2mVAOFuVVz5tUz4odlaGmjIhhVWgtYbqJwIe0fmP94AX/OCJcpY4GQ7VJuUX0awOs1Gc/CQttaggUXLY4p17dzXTRWFDxaEgb4985UGiyDLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=m3uiHwbY; arc=fail smtp.client-ip=52.101.69.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="m3uiHwbY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeP/USW9HujR3bzi0SIXWvyOoOheJCq57xDyJSsTJAv/8NGRFLsWNiIxCPIPe+rjNRbZQ/sd+ti2gndtFZQ8MMvrPcLQO3k7TLWorIansWqs9Cux1PyQJObOkhV4Np8f4eKiH1Z6NLF+tbJA9ee0ubGc80cMR+6AFHh93aK61cNWBheplivFq9vrdKtDU7cFxYWrR7OoKOxLgpuF3gl96uvyGQcDE+fU7orPEl24yZUVX2xKDYoRnqYDYUPj9gUoIm4ZNTBRRTk9MUQvYaF3z98GIUkMVpeuSUky0fIi5UZz5RGuLPgkUpEiRZfoLorij3Z/m9cPsRG7H8Y6s+DLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jeXZpEnSP/6SsMxF/8l6sfWftxXCj8e+mB6He/m/QE=;
 b=SYQtw+Dpl+xJslRkVzCsi3Tlgxsx01mD80VDu0IdERlgW2gH36HKky4fB3LtBZU/1lPnASaVZbJcy8yfjvpg00ndrStY7mNH3t5sFTeBZ3vHUicdOj8FckEqcxjauwFUilH6PpN9KEnQsoeqk2MJdvyERM+f9zrDzJ0zmJr6n3+QVscX1INI7MhYxRCcNTXClsnSG9NiUopNEGzgwElNRnFknGdFARZnqogMJ7z4OY6PGN0TPaSsylUMUgkFmpyniB3MrvQWETBjGRVaeXKG3fx5ITX6CwPN3z7qI2r/2ROVBezB0J88dcDgVyB5+LYG9WCl7RGslRWnr/K/0SaFmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jeXZpEnSP/6SsMxF/8l6sfWftxXCj8e+mB6He/m/QE=;
 b=m3uiHwbYz+cMVhVL4KBR2vWH9hZXZd2+bxv2gpslgQX+2xeaXYBZ/RNM5WnYTwkaBdHvNbN9hLxKYNGaGGTrDoqkN5mHySsjzykcj1uoa/WNmVhWZd1YcmoiNK0/XRcM9P7g4szSn3qEQKjwMC9d8g/BxhSsfvIzlHi//oNSfSXum/vqgMaCyVLUTSc3KSgD/Ih4buJzDpDjL8wrOsSF/+hkn7nOdNzrhhZCA7B8vMdlFwwW4HeGBpUpmjbTFY5dlnf2kFGFJfgUBKOfm3gbLSnqvh31GwQcwLgxvVRLJeBzOE0HMT2caDoIHWa/zFGjBXl12Oa96XC7+DrRpHGgKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Mon, 2 Feb
 2026 03:20:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Mon, 2 Feb 2026
 03:20:55 +0000
Date: Mon, 2 Feb 2026 11:22:33 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: imx95: Reserve eDMA channels 0-1 for
 V2X
Message-ID: <aYAYeQaGK2RUFQs6@shlinux89>
References: <20260130-b4-imx95-v2x-v3-0-95af05bece95@nxp.com>
 <20260130-b4-imx95-v2x-v3-1-95af05bece95@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-b4-imx95-v2x-v3-1-95af05bece95@nxp.com>
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: 08794188-01a0-4c98-d773-08de620a1392
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|52116014|366016|376014|1800799024|38350700014|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iBzwLmk83YLeSXKs0+ocIWj5FlEfo0etsoCLd6Uy7Pz1rDIQzlpdIWHTV6oq?=
 =?us-ascii?Q?pZksVfRa1ldg79MQgRw/Y3r9SqYlfLnKuHjVSnokjRLAsGxJAu6YP90h+w38?=
 =?us-ascii?Q?Tcm2Pn5hTzQTtJyARBGNEAvnw9RVDfr9FyQDSL+8SKxgpRdyzkLKIaFrvg8k?=
 =?us-ascii?Q?wqJqE5A/qWbkuMeHAuKsBS92HA1oFGDrDdvYP7yRFsHnLYCjqm+fJcY9kTQ3?=
 =?us-ascii?Q?/iwVLWxjlEBF4uN2rl1RfFrjsOKdtIMEsYtKWVEA9tp6vWR9a5ZcxpxrOgrA?=
 =?us-ascii?Q?0gUeiEQEnJ24fa100OA+WdIZ/R3+LwXoi9ieyi9CWcibO28M1rfCubHsTiId?=
 =?us-ascii?Q?wZAlF7dnKylHDOKnmmlMAhAehW3iGkHfWxXDRqHSAlexCmpPDO9arXGtYrNI?=
 =?us-ascii?Q?vZzVKGJDrTF12h674Ypw7M866MmB0dUqJPmWnmG8X3FnQrrMrJC1c6Mp4hc1?=
 =?us-ascii?Q?TzjeFeY0ubtK7vb2AW6VUDFf7VLnlw16W3HDGl4mnwsVr5RE5OBGJ2gyNWTW?=
 =?us-ascii?Q?ki6ziVskYyKZyLEKrAEv2KXItR1xz4+O9krnUdCULrVSJqy2wD33tlLwA+vC?=
 =?us-ascii?Q?bYCAOve4hh2meZKIw0x5jcr9nbouZPBUDAV3X3B6r4NdZMHedFCKLVeK9+HL?=
 =?us-ascii?Q?bPJbTjpQ4+LQrW5MCqILU51jaForCCZiwk87tXCSTedqy28VpjNX8kD/cgFx?=
 =?us-ascii?Q?GYRXQebUaneX/d3y7zMOl59N6mlcFEgBI6xMsyD3072ckUTToMaxOlSVILge?=
 =?us-ascii?Q?zBmzqcX8495/x8OW6YRSS2y/asOzHWaYfKW3ZghCfx+9f2F44/k59APRNcEH?=
 =?us-ascii?Q?MoSm2M50IgQ4kZL+cB3Sz31vjlCRKHY1irEbvt8avQmZtf536B3C2tN4bkVc?=
 =?us-ascii?Q?pQghtNA0+1o5CvAgQT/3XS41PElb7+Nx3eQND+ePG8uXV3MP83JFm+Uir0AZ?=
 =?us-ascii?Q?BtqCc4BB8qCQnRUDsX4kQxACld1PxLyw6AaQFa+gCa6vKLSrGXAbupGstcRs?=
 =?us-ascii?Q?tc3kYDsRgKmFkX4azfWgdCFh6Y3xak7zyskJEQf1FRU4n1apHb1km/pem64i?=
 =?us-ascii?Q?H+NGWUkO6ECsL3zg584eOcjoOrc1IAeG4DaxUnwnK0pc6HleCamGSzBONAni?=
 =?us-ascii?Q?gbjaiKeU0B0vN9Zy5s6UsT5YStH1+mBrGY4tFDrvt6UZV5owD2S4XTYkhbxE?=
 =?us-ascii?Q?GBCLxahRfoVfA/EnMnMqUGFRxVdc5q5qiIM+LrxtiqDpLHIUT2S1bE24eB4o?=
 =?us-ascii?Q?AeTntM7DjqL+Hldn1kEj4/hUN8N+G2ZtxXnypDwVMdAJH1UfZhCIFg7o6Gzb?=
 =?us-ascii?Q?GtOApQZiypQTuIOt4k0qgc6itQGeLUprq3Kghn2UVB+//lKaEgTByowKXR+w?=
 =?us-ascii?Q?QWVu18yK4J6c7j0WbaPWs++jtGPtyF8wcj8kAczA8yTnLbIVLU+UWyqg4LBH?=
 =?us-ascii?Q?6RuFiHSA/QpOGPUIKKOAFGvTs0IDkJwpR78VVPLzrQqJzW/eeHe48yM0Q1fE?=
 =?us-ascii?Q?8s0g6JeLYUNeS+0jo6k9y5JPM0MThI9VzuUKTh7dlPMZhHrRoFX3WO5QfwOq?=
 =?us-ascii?Q?QO56qw/be9tC5k2GXxSs4F0I9C+PUdhbi1eH5kqz6yb5lfxRf2p+j9K8DEKP?=
 =?us-ascii?Q?AFU8kO0o1mpvLgTQAbZqKEc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8tTW07OtAlN4g2JhKpLwcmjOpfXQf7UGol6ocKIgR+6KCvuyBzrEjK5aIZlX?=
 =?us-ascii?Q?FmbfsAGWEF2QiTKVvTnQD1qFSXy7m7Hu61D1xwzvzaltTMovzJNpPvuheoY8?=
 =?us-ascii?Q?AO7Jmk/ylelEoZ5XndHZ8qDNsFU1kYgKgX7N/TQDTSxcTIA/dfKZXfVlwTW8?=
 =?us-ascii?Q?KQdsq6Kj3WVgph1K9WjLawezpwSpuWZ6SPcwnW+5cXxRxhY/YTClVTkcE/kG?=
 =?us-ascii?Q?TltaUzR9M89HDxnjUz0JEHNQcxC4eDn1Uix9miQSqYHcVS9UcKBiAAVlZ7mq?=
 =?us-ascii?Q?f91a7yE4OcsUZ0xzcpH/zdeM+goc7iz5LpyNdGBPUplVvz1M6MpA3x+7ERW0?=
 =?us-ascii?Q?eaYF0X5g8DyfUn9aqSi8lkoJ/1WnIfF6VB620zD4C9V2VQ55yHAhiASV9+Ir?=
 =?us-ascii?Q?sDaOShHOfUfBGw2tqeHCfjpx8/5tZgsvErbJxzHh2waFb6/abclLyTpBK/Uj?=
 =?us-ascii?Q?pNEZc4gCotUQ7fJyxHWA3Y++4Otes8SLcJjXv4EFs8AQPgPMZ9OyWEdYwkAc?=
 =?us-ascii?Q?60PI+TsdhccG01Qf6tFhKNdLZ+NoP1j8CDbDGK7f/w6OCPoKE/B1K6AWeiHv?=
 =?us-ascii?Q?q4vKszXw3LRm2/D1IrKnu7ADfGTxshFiy5xlTRwWYxzSmsLeGtSy/u5a9/eh?=
 =?us-ascii?Q?eEMd7zBooEiSjvwMEz2/6e9yqypEcxxSEGFtkwvGZvC0aBaM3KD71clXxSil?=
 =?us-ascii?Q?gjZ5eASDosIszPz94KETwPVZRPPcpCXOZgzvAKHEu+5nukj4VaQI5O5PkOhX?=
 =?us-ascii?Q?l7GuaHad3/4UPjqGMtYlKsE4FaZ2OZNLGQsdNZYUhJxyI8W0TR3Bmvm21pYf?=
 =?us-ascii?Q?fUVCpSkaPAIvuMFRsW7EfWdcpOh2Ehfd4ZDtEKki8AqBETOsXMW/oSISs5Xj?=
 =?us-ascii?Q?3pR4pj0jmzKSWc8Y0mOl+lj5HoNL5XZrgA8p6L3xJuuSxI36he+TfiCaSDhQ?=
 =?us-ascii?Q?KZU+pk6D4TRVb5dvmkaRISPIYMDn9M8pZMGj0Dysr6WjZVfraYe+J8jgG9vj?=
 =?us-ascii?Q?qmHANXqOHJdO3gAQdyLGCq3aQE9gV6TW30ZPRv4OmUOyLvgS1Enx9nzIStY/?=
 =?us-ascii?Q?XAWDE32Z4cfjVdELPE3bb9bHlYWMr+8zMUFai/mL0dsEVqnAzdOEVATRpRQM?=
 =?us-ascii?Q?rfY+oI2//5wRSPVOSl9C4YSAjUMjJirkdTmc3sJPIzL+wmHShTHEwLbVqjd7?=
 =?us-ascii?Q?8XS4toefuaHYejUoW5js3OHr5ZzUndGIxiUmW+I3c0UizeAxaSCFau56H6kF?=
 =?us-ascii?Q?IXbRwfJlxRFpLMOA+SUPVd26FZrrhzi1wQlOkTC5FtGGQbENRno98XvpnwgX?=
 =?us-ascii?Q?7NSc4g1TNSCzJlSCA61S5P/wEgLMAFghZDXoGWffoQTrJECmCbSzIoBQCbYQ?=
 =?us-ascii?Q?iTUgq0+aqUIkX4ehDBqJ81IYeziNoo0pvLbZ4vi/munX+padIlvWr8HAvLWy?=
 =?us-ascii?Q?JwwfcmE4HFb/pxUh02R+DrhebxTgNXKNxpZGrwxxiCEKgqnpNYGAvTd9CtG8?=
 =?us-ascii?Q?zxpHOVpz4HJp+wFuKxquwl38Dh9DHxXMMUM6TGIP5FjqTitKEKurgcaAnr/e?=
 =?us-ascii?Q?ccfis6CnIKjRlSWCJjtCG+jaPP5s75DTbO1Lg+/E8s0moAzj+czkHEYPMWmt?=
 =?us-ascii?Q?olHmTxi+p5y0mYlUiTWDtZ5YCbBA5aOvyv2OB77Wh/scgba46Y3YqHWRpwut?=
 =?us-ascii?Q?ZLYtseVRrMFNm2PwI/WiIeXC8G+hmhEG9MCh8YgSo7dbCRUGtcgfIuy9o2Jb?=
 =?us-ascii?Q?C6A8/i2v/A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08794188-01a0-4c98-d773-08de620a1392
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 03:20:55.3488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLbZ0fW5ZFX3y7Ez05PwuUmTAaumbnIpzrwcgYBxC3pyzzCHEViL0dRpSNfnRFuzKiOi65kBi2IgnSvDYaunFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

Hi Joy,

Sorry to jump in at V3.

On Fri, Jan 30, 2026 at 05:36:27PM +0800, Joy Zou wrote:
>Reserve eDMA channels 0 and 1 on the AXI eDMA controller for exclusive
>use by V2X (Vehicle-to-Everything) fast hash operations.
>
>Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>Tested-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>Signed-off-by: Joy Zou <joy.zou@nxp.com>
>---
> arch/arm64/boot/dts/freescale/imx95.dtsi | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>index 55e2da094c889fc7c1096d0e36f31ae118d2a982..9ac82da2ff440e08ae8378d7ff830a568d50a354 100644
>--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>@@ -631,6 +631,8 @@ edma2: dma-controller@42000000 {
> 				reg = <0x42000000 0x210000>;
> 				#dma-cells = <3>;
> 				dma-channels = <64>;
>+				/* channels 0 and 1 reserved for V2X fast hash */
>+				dma-channel-mask = <0x3>;

This is wrong. Per dt-binding,
dma-channel-mask means Bitmask of available DMA channels in ascending order,
The usage in this patch does not match the dt-binding.

Regards
Peng
