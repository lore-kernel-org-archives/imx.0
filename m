Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013021.outbound.protection.outlook.com [40.107.162.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263F44229A2
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 09:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130385; cv=fail; b=KM44UW1PXLKyiarkUz+tyX+OUJpf2tcc2EeSiJrDQaimYaB8RfDN3oL/Ysvdd9mPNuZFtUkLGA4i0qlteBWO1IHdck3PzTs3XsPUer5i4OTCrz+Wv9TJ3r7U/ShYVrMNhaOzPeDBYEHCagHSKPzoxEVoKmj+Gt4T2G/lNw0Sfrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130385; c=relaxed/simple;
	bh=t5GHvW1qHYwVx8FzbVieIRwNg9V9T4DlfCBpsL6pNbY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HM33gHnVzkTMkZ7aG8RqXZGDeXvdT5VYTINhtFgWTNh96VKMSGCBDn8QdKw36+6N+kzoknY5ytUZv8+kltnBkLPPmO+8j/uxhkzIybSPtMzeMox938AR3dXfMrK4S7Qb2Ru6cK0MeSrBzR7ey94eD1m0VVw+iiDkYqRUdp0nQK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bhb8YFGp; arc=fail smtp.client-ip=40.107.162.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bhb8YFGp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1MarTZTqJxoDp/A0mpq14BEHcrgvsB4wZ7dnor0hv7fEw7NyzbZADZyPB9xemdfyuDDcUiTLqCe6lb4MZMET4CcWvgKOh8DqBuEBYpbqDbzbLTcDCnyDZkuGJfE4WnJ03LK2sqr6qpGuOq/Y0UciC98Ybrv22fJtNaFmlh715iSnLsy4nG0AEU/MJ4Z1f3k9EdT5g4DfP23cT6PfkKpk/Jh1dLt6DeOB0a+cQnxA+2VNVLtNZ+gfbz5BSoKBOlC/b4k1GC80IChsFMZRY+O5Vj1TYaz1HD8N6hcb4/L3E8f0JC2tPd4CJNLnIUtVmbt1DPk+ZW+g/O+zsvq0uyQlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkG4RTLydpfb+niJA2MCsCk5RkamA7epFRX1PtStDTM=;
 b=nsIRmySjy/cA7IjAdMPKVFoUKLpdPsXoxtAa9971YDZdpEHebW8Uek0bQ6QNlyU7TgOHeknR/RxZ0r1KP+1PBmAsbVzFKaxv5y07eDc5i4YfIj4FznNsY22spjp5UIPGRrJHiq495smGUnATD5OHhUXwROrozo+ESPWWsARLMW01ggOvrpBiANM/GDbLVBsvKgTJnhelNJXFC17nSHhdBKGqdciipg2C1LBIaxFGEUhOQiuNO5sih0Z8kqbO0steVaSWFQ89fv1AWfO+wahSrLH/5fPEAj+hVoHGlHbIu8+8l1Q8HCXvzLCUQj2tSrE8VA3iYrkC30tsgY3AYi0feg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkG4RTLydpfb+niJA2MCsCk5RkamA7epFRX1PtStDTM=;
 b=bhb8YFGpztnLgQtrDCFSFQowB/yCI+fX7O53XuUq2s4Pcm69IkNAzpX7HSduvzVMMG9Gi0My19WQcmizQVgSrqFSmWHXdz5DU4Kb7B1yLoTn0d/cxDyOEF4pk+EcQ4pIDVasyJaGSYHq+1LphPoCc463Y+Q80CpmhGYOLcG7uPmxebaIHRP5GQcBty9GZk6RC9hcXuN8xA1EY3/3npARuDdjfELVMV128PAb47Q2q5DYxXjwNh90b9/ECd0IiD37jragB/srjLBsmYoUV15dB1xUaiT0uX6bDlxtnTbnJTJNaNxtm9CYVaXGjEr8ed1WgtwJxdXTcwJ6hVsaOiI9Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by DB8PR04MB7146.eurprd04.prod.outlook.com (2603:10a6:10:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 09:06:21 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 09:06:21 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/5] irqchip/imx-irqsteer: Mask all interrupts in probe()
Date: Wed, 19 Aug 2026 18:05:42 +0900
Message-Id: <20260819090543.585131-5-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::13) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|DB8PR04MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dbda0aa-94bd-4a7f-7616-08defdd12319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|19092799006|376014|10067099003|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	E7DVAzX7Ea6dZ5dMJxM3sHzlZ7wp8msSKU2iIJmZ3Vb8nyDlKoTkeuVLXY/PznXJT7rwlBCWiw8kFJcJgoC8S6V+0KlVLURRoYfdipAfdTSbztZjBz9Pf1tc/zOy4UJi+X+OBeqNkQTu6UfebAkAo4iKHub+m576otVjNDz2Ct8HPoTiZQGU37g5mhBZDIX04eKfj0zaOJ7W7+nkdte2X5TIvrra9vtYNpBcajL6p4fmf6G18fRdgRoNgIWQxpQFSbk841jqji/1Sl4LmnV43RaIiHeFujy1+Qw1gwWfGHzhFFCjdxBrF7exB3G5xSOv/mUUs2hbiqyhwMVOP4PeEHJMMu0cmRvZTJCR/x6xbFdfAe76D2Xle/icb4T6j9B4C/6zc4Zgl4r81cWQZQD8Edu1aXO/1ezgBJhujWSTPmwSsVDjZ/bSCg+0/AyAtoHhxioIQvIairpKRQT7mvHCMKu0WKp+/ah4XZjCTmI6gLYNP91KjUMAx30rX3TdW3/FcTIgZ6MBRegluI40d3Vzlllzv2J9tRl5Coz8ystDp8STH6Q4oc4vxJu8DBaCNoQRXHvSRGFblmBNtSpK5tp0KmgeI0bUKWV92M95CxrwTXM8HSH4encEVueMDhXl4nf2G9BrCzci9lh2cPp8+8HitPHhtf23hiqriUP1DCndr7M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(19092799006)(376014)(10067099003)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cfHj6fG2pCgVRoTjl9m8IxKKyr5uPPozyxTZDCqX/MclYBTS64cig8W0xGJR?=
 =?us-ascii?Q?vDIhSScXEG7UVpwjBO/h5JN3TDtPKAL+eM/O/0qMwjeVQ+pDnoQDEOEye27S?=
 =?us-ascii?Q?oURI7ZaWU7gYvWMkMl6xm8ll6iCYf3XbvBHPWPd//JIG1N10bY72uTf8TYK7?=
 =?us-ascii?Q?O1V40fb+GFZ19xNalCRHp/8ddTEA3EvzQ2l9A38SeUJ++CEmw/CXpZwWDTvm?=
 =?us-ascii?Q?R+ShhwLU5ckbEY8casKrYqZdxNiuzd0hPuU4BfvQbRZat/BPr8oy0JctBgml?=
 =?us-ascii?Q?gfI3VDKwOpm+oFLt52kMyTEIMBhtfh+umKDKIrXaNoYB9OdDIvWTsrYHjc3w?=
 =?us-ascii?Q?hfaXjyblH2rzd6r/xBCeVnDYooQAWDgUOt3LMlaw1+qbpqhfXxdcw5kglTPD?=
 =?us-ascii?Q?9+xvTCqKC4nIHCeUkjTvL/tif+Y4oUyhLgJ1hKzPMTQCxfr5LTcKKD4oJ6mf?=
 =?us-ascii?Q?jryrBlkQ2Mi8udORwGHq9t8PmuVXxSR3eY06QXbFd/pQLGuOVU2WFm8hRea/?=
 =?us-ascii?Q?Caq+tDa2THSYgt+5FLUWY898plQTPXUn25llgf/t/QD/yrp0DPTYSVxZlWpu?=
 =?us-ascii?Q?P1bZLqKiaeA4mi47A1/cNzruiN4koqoaIRCX8FXXiJ9AcTnWdBgzkC9RhdxS?=
 =?us-ascii?Q?EZijO3bopXACMxlOCmMCm8gRG0DkmMalnvusqxQa8Hmlh/U/tXmupIcJ7eIo?=
 =?us-ascii?Q?eGRs2OCdOPbDAfklxfkhyMv8Jic4B8nvme3TSzfdaYKv3uRtuXl2wnxyV7G0?=
 =?us-ascii?Q?rioQEV7D92aQwHEVe6YoXwwvrpsgRSAvrxzcj8ZvzKrkzGmM7QVXbdAsAv3t?=
 =?us-ascii?Q?qu+ll4yEaT6eldzIO3FqTAEgADNBMl0kJYk1r+zBoX2WxVKsirtwqerMl1Tv?=
 =?us-ascii?Q?9Z97OCZ8jV3ghHd3tixbxhzjIH62m+zCkIbCh1ZbgNQ+fo2NpkcnoXCDFnf9?=
 =?us-ascii?Q?+9axTchcRdAxOxvT3crhbNLUH7mam1seZoWRUQkoC+QZJ7g6z2VYR+jqzClm?=
 =?us-ascii?Q?4i6CrlnSbOrHyMcxhI6/Syvykdlv2aCxbACzEdf8f7753bJ+2i9KsJSPmPUf?=
 =?us-ascii?Q?9x93Yg3y8yobaHQoZmgcBPA9f3yyaa5PJB50zU6EEYhh1wbo0chQl18pNStI?=
 =?us-ascii?Q?XKtH7jJNhexzMWmjsYv7dyMAj4UmYNsbmiMnGByestmSApchgOrZVFKG1mgL?=
 =?us-ascii?Q?HVQiV8iAtR1wGspa0MEjbLvkyoefkt5odrBjPu+gM3JNANq7UZ/qremC5Ugv?=
 =?us-ascii?Q?/44RX6d5woFL4w5KtKOtv8ip0JVJLO6ybcwxum2M/tASxhPeQtkxf+fzuCvD?=
 =?us-ascii?Q?pd/4aD6kynWr5Gbq4VyKvtZuU1hT8XxZqNCUnYawlnc2BaskhviOwaap8E6d?=
 =?us-ascii?Q?yBKME9v5X/QEs2c9Sphwq/+2LZhx2d4JXFcweCnbHcC8ir2MsRg/keknawHU?=
 =?us-ascii?Q?yeT+reBsildoY5z0/fMcZyM4zaW7g4XCietrJvfif92+AufK4it07XoGk8/u?=
 =?us-ascii?Q?wqIx/6rugRvzp8+FrnyTzS0PcPYI5ChKEW/Hg8CBR3/cyZUAd9G/JBE52wGW?=
 =?us-ascii?Q?M+R7gyWiVJ1W+epLd6PqUcjSQ2kMVmyF4hVNNGTv+5nT6VRvEK3eJ31jZTlo?=
 =?us-ascii?Q?4ExxRHaV+fwgVanKG0xtVqwQpBlFkB8Z460M5H1UJZ2n/8ngy8C1VqvQx1FD?=
 =?us-ascii?Q?MGGs6r18K3pVgWGPDqwdV623dBwPYVGBDrH3PzzwrUKZst2AgInGWwAQY70+?=
 =?us-ascii?Q?gbctI1ZtPLFn+cNORhy3qJcwoL12rPaMBDStIJrEtNkB4/wCKRbP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dbda0aa-94bd-4a7f-7616-08defdd12319
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 09:06:21.3266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GgAANtDetF0xQtf3KbSZYHGEix7NsHUtknWdjtfs1JYsROre6ggNogf/sqsPabRuiBQJ8D+gMrMgbk4l74yfbE74cZkWwGtMgfDt28HfxuEyGv+w6Xt/Ry3/KjxHbesd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7146

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

probe() sets up the chained handlers without first masking the input
interrupts. For a built-in driver this happened to be harmless because
CHANMASK resets to all-masked, but once the driver can be unloaded and
reloaded a child interrupt left unmasked at unload time survives in
hardware. On the next probe() the parent interrupts are re-mapped and
unmasked before the new domain is ready, so a still-asserted line
immediately storms the parent with no handler to service it.

Mask all interrupts in probe() before wiring up the chained handlers.
CHANMASK uses inverted polarity (a set bit enables the interrupt), so
masking means writing zero. This mirrors the sibling NXP chained mux
irq-imx-intmux.c, which masks all sources at probe() time.

Masking is only done in probe(), not in remove(): the next probe()
quiesces the hardware before it re-maps and unmasks the parent
interrupts, which is the only window in which a stale line could storm.
Masking in remove() would also mean touching CHANMASK while the device
may already be runtime-suspended with the clock gated.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 320082d3a632..a9909ecb6fef 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -236,6 +236,14 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
 
+	/*
+	 * Mask all interrupts before wiring up the chained handlers. CHANMASK
+	 * has inverted polarity (a set bit enables the interrupt), so writing
+	 * zero masks the source.
+	 */
+	for (i = 0; i < data->reg_num; i++)
+		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
+
 	data->domain = devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&pdev->dev),
 						     data->reg_num * 32,
 						     &imx_irqsteer_domain_ops, data);
-- 
2.34.1

