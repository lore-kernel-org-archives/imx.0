Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013059.outbound.protection.outlook.com [40.107.159.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3A33876CC
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 08:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611963; cv=fail; b=SAJdvTsEnDafjNzE6D7HXQKOPelB4NA+fcWh37QBk1gw/1pIm+Kkw3CgeMoafNOViKfs5XUj3jiKKLIteFb1+8C3yOElg8CcrkapuvhwhKZx1qOtZyCNQocOBP4pik0N12sk0Qh6ZsMKGNnqUfcFpu8zCNIbozODlkD7bh0IDOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611963; c=relaxed/simple;
	bh=j0Hx5dgfGvJ/qpoigWoQVOwOhkGf6TXc8K97Ub+48Cc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uipywm3xQ02T9VK2aYG830/cst9O9s6BGRW83NQJaadqU6YS2hw6AE4TiBKjuB/ntf/JAL+plybz/TiAVetWEROqH3/nsKZqe6xUqWFinnSHQtqng0HpAej5bEWs5dHHxlkkw29KVWh+ct3et4SZchZfAamgzs24zmHQmJP7m5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IUjzn5T8; arc=fail smtp.client-ip=40.107.159.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IUjzn5T8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOR2XOnbES0D84zphCgIDpOfXcvPakG1kvyT4y2NCXpPt/4ozgEE/r2xgV85RdxhtzkTYZmeAYqR+BaioH8jXSmk8Cs+LeVDdLa9NyltiX4R1qqZupFiWdHw1LtPPf0os8LBVMzMT0P/MmvWXkTadCHk2i51d0U9JE9mFTzRt7bpHJWPabantaZN/V1DXLjCPUt63RNYHOncrk/ZvGNQ2zLBN657o6ePunLZrtrAvc1D2KlT+CH91yyRNldxOVZYvMCUpAgD8caWelt48StffTMAjqXg2PXblV8nqdqnYimNwkYCi93eekz3CsVRpShj7RgU9cq5nNlE0BmwxDZPpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23anFRbA3wX7nx7vMDPlpUxuZvY2BLJ7nqAYOoNc8fg=;
 b=PMJu2R+r5I42boI5WR52gsTMNFKpHPMsaxlF2Me2t7nPRErhX+hc6q39elTMMt6hqnGuZEZmAFjEpGt0v05DcihVrAZhOWP3NdEU+U7jITdQc1hM79iThjpAGlfY+iEd5RydxgIjNtdfI6QZHhbMVyxeqfLOPIq+16hCoPNHMTQwBUi2c7TAGrsGVyPlOMou5Vk/QKMjp5ARiBl9MrPxtXGQtM4pC5L5fRtHPPPTshmY9QNC4TkC6ictAwcBZpYSCEWKiBBiMatumFCkpgBny7IQHhWTYRn6fIIdHIL0pGOFGtomVgK3cvfA9tk5mLgxaW9exrxFYJ8wXetWnz5fhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23anFRbA3wX7nx7vMDPlpUxuZvY2BLJ7nqAYOoNc8fg=;
 b=IUjzn5T8hjmxAo9lhXnWMFRSkGnUpzKcbXiS6yw1Z6xon73Y1PlyRkXrCW4CNKaBfDW/9UC3KetJLBe7QzaUGnqY+jFY+Ic7lEoWTzbKuuQhV+0YwDC7Swr3I9O269hqcqKL8+KLqGa6mhyD9Et5wn/V/e6pPD3FfuJOtHd5YGuR+taa/uKe6z9FVxLfOti/l/S0pWISXsaRFGzkv9vPdD47t6GuKHRDcSBYhAnXAuN07WdqU9X5OZLzuO3Z5AhisT9IVM87K6t2JTV1kGV+LSHNlxKLN+2kuH2U77YffwycessDhbfx73YB0R1519JLguByx3LUlBH+Fm4q0KJlzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by AS8PR04MB8689.eurprd04.prod.outlook.com (2603:10a6:20b:428::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 08:12:39 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 08:12:39 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: [PATCH v4 1/4] clocksource/drivers/mmio: Export clocksource_mmio_init()
Date: Wed,  4 Mar 2026 17:12:04 +0900
Message-Id: <20260304081207.4030882-2-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|AS8PR04MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 987dd933-83da-45b7-2212-08de79c5cd2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	bbVGP1+7Rclp4v7OB7UaNWhm/+oyI+vWHXV5Mmd8XU+uhj2/Sfw8GGWjU82dU+lCeub+Ve0d2HvHm9zGZzz0bt4XxEVgH8362tquc4yFuh/Wtq1GPwiGVyP+DkNZt19dIIdisZDRlPsn4k3uMKc5N/WyRsL3QVe7YO43YfJZznxd85Nfg1x22YCQIeJXFTmGKH6zcQNgJFbo0oC5GpRWQWzuPA8hyav9RLYo6M9eKp1w75zGrnkm4NgKAoCi+t6Ewz+wos1IdyzN8aNbjbrAOqD1hxEm+6I6opUxco5VQ/E3K7IAr13Ma3dmZ8wQh8jDS6kopxSU3ILa50C9F6pEDTdTRkl4P7mxvPAgtmNvfLPLzvMYGMXDDdaGH3/lMKON8/rB6oUrS7QNn5RJ6yLqsTPm8l26T/+vI7DvYD3eTJLklGYkNnjlQROYNHn0EUsAeZb0Zw+38UM2DdyA3TfFgyH56+0VeX3n3SKbkNsNjegpmviVCn7kMHE5XpcDZCfbN6c4onjptAbYcwPsQ1bn3Ig36r8S0g7jBohYXsxqRVGeheH2uLDfRuprtYccALy/jUhlcxqct3aKekwRiES699YMHf/OOXZXTX5l04qeUfcNXu2Fet/pS2cK4AfZhw2VufbdylxJLoHzXnf7Gy59k7At3FAviBVC/YBJprmtYceI75L1bZpLvQMH+2JmN9I1jFUR1RHkyhN4mRnUkiveZWQMPdtbgRbcoFnTPEWlNQxKpLLdrwfO1+ThlO1t/T+X6wm/KhsZxNKMT0WXkRm3UX4tPCTG13xtisdz7urgdvo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BYYBxD+LBBbNshXVf6NdYcmiGkpm1Cde5UDHZDA2HzGC0VewOme+NxP4SiXw?=
 =?us-ascii?Q?NZa8ekMLNcXQEai/OQwecEQrszBcqoEif4LHKoyLXSO7T5FoS0OaWQHjGK/0?=
 =?us-ascii?Q?Qh4Tk8P5tPimSxjAXHecTr6SW6CQZw1+7a6/yC+dQ1yQ8H+DtxHojXI26+z6?=
 =?us-ascii?Q?BEt/RxVVF6VXo8qc4AIFcpKLYofBQpNNtf8JF1krNqF6egrD1ayKc37VdqBV?=
 =?us-ascii?Q?VWLMQYG6JDlfDlsWNpxdRg8MaOFOOnjj554czlApRL4gIzjUKt9fS9SKsesc?=
 =?us-ascii?Q?9zHCwZQh78t0hZSWe3EF+1B4JRABojUWuzae5/b4gNdfxVTGOom44uZIDJeH?=
 =?us-ascii?Q?xOtWne5qZSAJrEEg7MWR936+kyv7c/QTy+HpmOuICyRbDp0gAzg+E6ebTvNq?=
 =?us-ascii?Q?F2t3b9npp5IktGa+4Vnf6wiW7bcBiy3sxeRFQhQ8HWtBQiFDiKTPkNK6ik9t?=
 =?us-ascii?Q?dF/NUJUFmlWXRvtGftQckPiHDN5vg2ZPaCspoFMs9pWwbWjxi9rnD7FclEep?=
 =?us-ascii?Q?bKN1ddrXcjaMfTi0v7Y9AzY9cBvodarxIoH77gg6rXbFke2rEJKpMAphlSJM?=
 =?us-ascii?Q?/3mJLP9tjrG5wL4JgP1teNNMnX5R7zfvEy4VSh45HimRPGJseKG8GpApqTHH?=
 =?us-ascii?Q?/GXegJolIpHcNCTBOi9Hd1hwviH89E0n1MsP1wXO+lpov/cv++j6rZACtDHk?=
 =?us-ascii?Q?E20Ih9GMMb5Mp7kSqrj9Qtdruzyu8+Z7dx9Xa8TG4Hw+EeEZXkMTpfAamFZz?=
 =?us-ascii?Q?ifPfeJseJzKyOF4H6GqAByAkcx/40SPEZkJt8M01xFc6of1GsblXPpl76pce?=
 =?us-ascii?Q?VMFGx70Xc6jIwFmiotVpAcXa7sR1yRRI2DrVGHUElqbKOQDC2JYCvTLtZ30b?=
 =?us-ascii?Q?ooSc3yFnZQbtvwpqcNn9aWhWT0SWc2JnNRhukZG5UBXlCat14NHd5+NII3a/?=
 =?us-ascii?Q?k2syl+sZg0jCVVxXBDco1d5RmjAA5zyqSwelnDY83RRyMrj7K06xaFK/JCAS?=
 =?us-ascii?Q?+ebi95U5SzsZNfN+n2nLmEYWYOUMRbTiUUmgT8c9QQpwYJiacALdsze1sl0G?=
 =?us-ascii?Q?2L/TRE0LUafe305QmAfQjLCK6AHbtNMkTw3ieIF/idmGSqGzcAvP4X/KItX8?=
 =?us-ascii?Q?Dwujs0QVo/CPz6yiFRaypEvWTPohhLX5U716KijZQZfm1MInTZLrKfIWxoBq?=
 =?us-ascii?Q?F+wGgWSM62pR1xG3vXNxBOuSxssC0yRwGoVFgG9D+mhykLr5uR998s7Xb29t?=
 =?us-ascii?Q?NTBmfAxrgXvXEv5q4Ze5KgkVt8IThBl7XGWcAQdCBdXXPxPgXtbMc6QQxqZk?=
 =?us-ascii?Q?iSzLDfJ8VijkrS0S6d6VXLVVB5Ti3ZdDnnESKwn7Tz3IiVDrXXYV/Cm0az16?=
 =?us-ascii?Q?4WeJYJa0ehG5bb/D3bh2UGNIlm1sILrs1JX/pSjnfDNTwmad1Ud0XbJLjRKH?=
 =?us-ascii?Q?zF6Dx/sOA4FxuSSNqVRntC7vY+hQBPtNRRHlonP/TCWRNs6//JgDlnhNI6un?=
 =?us-ascii?Q?0bGxyA5uJBtsqpz0CYj2b+E0bbRj/JsBCuUL7XliJkSf2/m720xoc7x1H54M?=
 =?us-ascii?Q?KA3cjYYA1RIqFXvcRLaqwxgPwXA6nCtD210wA5MYT1Et4dwqdHjjV3Mxyn5o?=
 =?us-ascii?Q?PTpZoBIocoQYM4AszBKcPjS631khrSiU3cITb7yGs9W+MkMe46iAwOvJ/Tb7?=
 =?us-ascii?Q?0yGpkfN6noWMtq8wQBUrz4AtdR+JynFvUQ6zhkhUeL/+i2i7BjA0soc9MURh?=
 =?us-ascii?Q?bU+EG0ytIw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 987dd933-83da-45b7-2212-08de79c5cd2b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:12:39.3211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHJOCZ1zAhsQWJnQNGTXwCo32h+9h5jIzz8FCJUAPlJvbWIZmnNKc2pZwSc+H9kmozLPvgjhB/ppapLgXOlGuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8689

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Export clocksource_mmio_init() and clocksource_mmio_readl_up()
to support building clocksource driver as module,
such as timer-mediatek.c.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Signed-off-by: Walter Chang <walter.chang@mediatek.com>
Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/clocksource/mmio.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/mmio.c b/drivers/clocksource/mmio.c
index cd5fbf49ac29..238bf29db6f7 100644
--- a/drivers/clocksource/mmio.c
+++ b/drivers/clocksource/mmio.c
@@ -21,6 +21,7 @@ u64 clocksource_mmio_readl_up(struct clocksource *c)
 {
 	return (u64)readl_relaxed(to_mmio_clksrc(c)->reg);
 }
+EXPORT_SYMBOL_GPL(clocksource_mmio_readl_up);
 
 u64 clocksource_mmio_readl_down(struct clocksource *c)
 {
@@ -46,9 +47,9 @@ u64 clocksource_mmio_readw_down(struct clocksource *c)
  * @bits:	Number of valid bits
  * @read:	One of clocksource_mmio_read*() above
  */
-int __init clocksource_mmio_init(void __iomem *base, const char *name,
-	unsigned long hz, int rating, unsigned bits,
-	u64 (*read)(struct clocksource *))
+int clocksource_mmio_init(void __iomem *base, const char *name,
+			  unsigned long hz, int rating, unsigned int bits,
+			  u64 (*read)(struct clocksource *))
 {
 	struct clocksource_mmio *cs;
 
@@ -68,3 +69,4 @@ int __init clocksource_mmio_init(void __iomem *base, const char *name,
 
 	return clocksource_register_hz(&cs->clksrc, hz);
 }
+EXPORT_SYMBOL_GPL(clocksource_mmio_init);
-- 
2.34.1

