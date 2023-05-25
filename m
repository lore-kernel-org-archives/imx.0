Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2DC24142
	for <imx@lists.linux.dev>; Thu, 25 May 2023 20:02:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BP9pNzl6r/Rvwue8XEIn9S1yK7ST4LJJm1/Vwp4fhhWe/VOnqxqnBIN+Qp+M4z1bGC2jJ2Tb1o7AdA21BgpzumRgUZfXRek615sKNSO2YWCz7yjiDdF9LUoB7g+8SSd1iKY7pPmZkvp8s35am7o5BfzdFVGB631E270EFCgIB8max/LZ4cGjvwML3ixII0dFL7ri8mgbUVnPBS96Gf65p75pO/41yRo7wOaUAXq4uc5p0KXxg/BwU5cYAh0g5djt0rGTxKWX/zMyxAI9/yDwuTvW5Z+X4aKge/dZVNilVzqcXzyCST8Ez7ZG+qfOQKGufkZOJxUwFBZewFij1THSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOuNKw+yGPPLP4V7NnJ/FXD55i84pACgcY7tObwFyzQ=;
 b=mYTpswrspYrEQzoZuXS3CIiyBd/eAOVmaCTgA4x0U3KfEs8W6J/p8RC2eBY8g/Q1F/pKRUqt5mUG+ohbuiHva/LXWonEsgkMVKvvvc5vSZ/njr6EBAf6bZQXabm27W97MUOdHTB1R0R2YEZk2mSd8W/z3tRzDwwegBzBPzM78c0X+jgr3nG3OOdVXc9tJH/sSctacnjK7/WPfwLJ6VuljDcQ5Zeybhkx94++rwCjZSUaHAKbXupnb7ZOKV27UObjIzg8SnZUW+u+MujXRkjFbZE6vVh8LJuhCAaxSvPzvhZO/HdK0SIw1v5NIBG/Rmu+5J+djDMmCjXMvQRZfhDcVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOuNKw+yGPPLP4V7NnJ/FXD55i84pACgcY7tObwFyzQ=;
 b=mrKrSSZS+OUsZ+wtCfzigcGVlAn/6bFlp5k/weKv+8sPGluWMeJih2JhtRJxIe+xH25QraXt8Fsyfl2VVJpwqtBmynvqLnhomGF61hfAi2dRUxFGPfv5DSsmP7Djn7phBZRHr+3uVtSra3UAjkv0jrmoP+1gFuc5WmvD5+wScm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 20:02:09 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:02:09 +0000
From: Frank Li <Frank.Li@nxp.com>
To: peng.fan@nxp.com,
	joy.zou@nxp.com,
	shenwei.wang@nxp.com,
	imx@lists.linux.dev
Subject: [RFC PATCH 01/12] dmaengine: fsl-edma: clean up EXPORT_SYMBOL_GPL in fsl-edma-common.c
Date: Thu, 25 May 2023 16:01:37 -0400
Message-Id: <20230525200148.1015154-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525200148.1015154-1-Frank.Li@nxp.com>
References: <20230525200148.1015154-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::21) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PA4PR04MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6c3c46-6837-4dc8-7dd8-08db5d5aebd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8LNEYfNxlYkJHfJyxsQ9AOGX/2PAXKCm1ohAV7dqeZyXdDjNLE0HlrarvKqGXAwn2//11fRE54COeXVU3d/PHVYrslG5pNqfz9ieDVsFavbs7BuudWTbqBVvZHCbwMuY7/8chQ/OfaAV+SXCJUbp4xyJTmYvrIqUUkqXqZCZGrhsy0D+14lD94xBqwq73lxbO6CNy/znsCvqmItE4Epsb2QRyMPeIYYpllufTn/h6xwvChO/aSIB/rleEsM/OmnxVga0QbkFeXzrGD7yHpuIX98zTrwJVtE8m4c4FqREXO8ExgzdPuGAH2Ofl+rG5+JSBDNCfe+k/N7TisIeQSFfU/2zy4meAnFVvaJD3sn7OG84xzfaGuKRlXWLPd+wqjYRuqjGqRyLanYpv+9PdHY1A4vLFsj0PiicO1MqBSRTlk9hBmrTn3mGUpJqmDuh9p6N33wQOuOnrC+JDOJDd2HZMUP9QUN0SYJqOLa1ba7dzvu+GGmjwRltqXNQ2OFGOc+tnVrWElQTLR/7EcIpL0vfKp1q0kCWI6PjK4Nc+723jwB0raNMlprqF6MjtCWIV/2917KDwhWT2vESFjgHSrhnY1WVGToBd7Lrc4e/KOTA/mpGakIXR4swjxkB3KjkOoyq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(36756003)(86362001)(52116002)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38350700002)(38100700002)(1076003)(6506007)(26005)(6512007)(186003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qtn11tsB1QYspps/MIRM/Li2gkOPVf0opav3mS8rM1d+iTo0O3PuGr0XULsm?=
 =?us-ascii?Q?IY0nap7aMDhOAFrzN0EOGEiQez9Eor5zF+/B/hlZPHS+HKTfVavlg6tfgzue?=
 =?us-ascii?Q?gatOqLCg/09M/Y7U3fcdHSAtb5JaHHdDamkDI6ZjtkPP9Jn9vHRawGyxhvwp?=
 =?us-ascii?Q?mGfe29uNcekM/k6v10QxxQ3GzscDrkI1kXiLSF+2YBILsWNEGmJq7Nd9BIzf?=
 =?us-ascii?Q?qy0R78h6uXf2+gGGIbWINBK0llZpYWV31Y0UhCIIjS7xh2tAFQmfl+5V56Ca?=
 =?us-ascii?Q?AwYDdcKHvYEa7vCsg//GvgaI6F09RV48c8Wz9Y9fCLglmqPpHvai/7U8x5Ne?=
 =?us-ascii?Q?IpolkdZJesrUCWzBimCab2rZu86mOWVo3sB94praKl/ckJ/qCtsq0wcU7wcE?=
 =?us-ascii?Q?tgtf2lYD7BzMU9rJUDcKh+fFEdeUJKK8MYwpHS2W4Q6anG8xDVVcCnY/OK9v?=
 =?us-ascii?Q?XlfxsX9VuFYaE1j0iAQLb0Hb/PiIwABU847Nrx86hdklslaRUspa25TABlwT?=
 =?us-ascii?Q?HDkJdl/3hKrngYQatxJKI+DOZ6880q4MCEWRwgU6sKNjV8MAsh/8hh/pkKJM?=
 =?us-ascii?Q?YQYBAf4u/h1IOjGZDYo6rfEmx7XSXJ0CmgQAHh4uKF5CqFaSY+GfWssGazbi?=
 =?us-ascii?Q?SQl6o4n7KGbAkw0Dn4vW0/IcWX2gYLXuUt0Q51m6G5AdiLK7Xx81GQgwLGk4?=
 =?us-ascii?Q?+DWXQap994jrqRAe4oIeCYSzCh0TqQX0uowofxXEwRYZJUTUUl43eM4c+uIU?=
 =?us-ascii?Q?fmXeQiOium+rtFEL7uykyaO269axbqWGlTj6A1HSYPXMUF9z7fn31FqV3HGP?=
 =?us-ascii?Q?ks1IFlRxA6tIH723XSgnWKTanlViDRsUx3o2B3ZvO5ozDvt4kg0/LB2Cicza?=
 =?us-ascii?Q?DD1GBGLX34yl3XGOfP6Fk+ukThP3JHavKMxHgNTy1+7HKxyN2r8YZSc7tMpY?=
 =?us-ascii?Q?a796e0cPjBqnetOaDo4V/65M0LHOBBzXWobId5Gm0rGTrAAhsfmPrquqmHNd?=
 =?us-ascii?Q?sZTY2FqU/rwoUEJ2jckuapi1fy+mOUG3/LLr7CvrUKSP+2DuzvjRq9AdL6E7?=
 =?us-ascii?Q?uKLPxVWS7F5Bkq7aUQyd7/cvs+AQGofHCLgvCT89NRO3t7pT0KkRxTppTjy1?=
 =?us-ascii?Q?EjrrRH9WvQ0Ohnyq58oU/RigiwETYAMgMbyAu9HhGgJAV8pWr9woFQENWw0V?=
 =?us-ascii?Q?8FLVY0gC1LVgqGT5dMUEhaCWWBiTREZvLzosCCMveeLpNxWRUtLFF7ptmPuL?=
 =?us-ascii?Q?6/WWIKF5e3KdVXxuoYCsHolDY6imKYR9TX7xsuDA3OD5l4MLui8aYI72mEks?=
 =?us-ascii?Q?M5kJLd29LNxxB0s0iwHKVsJtwDaq1nhtI4gmdaQYJ1dXM+HJeU/ZzSWBBMsh?=
 =?us-ascii?Q?JtRkIyOkU6W9G2KgXBB4CCygCZiYYmajm0TdsZDW/0LRXzrQW5fWNDcaO6Sf?=
 =?us-ascii?Q?2Aj6i7pruXPDQAfBdky/kXGdd/X3qcLIxcjqGX5wMjHaAQH0M/oWkvWrPLCw?=
 =?us-ascii?Q?vGQDzR8x1AOm5BxBlsobqIZ3m36C/SUG2jOxb7hY4GAxH0iyxEjCdm6RUrPN?=
 =?us-ascii?Q?27YZMarp2EuTsG8L9msxbVkZCcDNcEiagvBQGIam?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6c3c46-6837-4dc8-7dd8-08db5d5aebd4
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 20:02:09.1369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqhUl+Ifu7t6u/Ed38qZvK2Ri43tBb30dao6kT+Ay7m13MtxAmLH9nT4pST918jNKdt6/xsZVkeOQr2kZsBqdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

Exported functions in fsl-edma-common.c are only used within
fsl-edma.c and mcf-edma.c. Global export is unnecessary.

This commit removes all EXPORT_SYMBOL_GPL in fsl-edma-common.c,
and renames fsl-edma.c and mcf-edma.c to maintain the same
final module names as before, thereby simplifying the codebase.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/Makefile                        |  6 ++++--
 drivers/dma/fsl-edma-common.c               | 18 ------------------
 drivers/dma/{fsl-edma.c => fsl-edma-main.c} |  0
 drivers/dma/{mcf-edma.c => mcf-edma-main.c} |  0
 4 files changed, 4 insertions(+), 20 deletions(-)
 rename drivers/dma/{fsl-edma.c => fsl-edma-main.c} (100%)
 rename drivers/dma/{mcf-edma.c => mcf-edma-main.c} (100%)

diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index a4fd1ce29510..7f3d62c9dee2 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -32,8 +32,10 @@ obj-$(CONFIG_DW_DMAC_CORE) += dw/
 obj-$(CONFIG_DW_EDMA) += dw-edma/
 obj-$(CONFIG_EP93XX_DMA) += ep93xx_dma.o
 obj-$(CONFIG_FSL_DMA) += fsldma.o
-obj-$(CONFIG_FSL_EDMA) += fsl-edma.o fsl-edma-common.o
-obj-$(CONFIG_MCF_EDMA) += mcf-edma.o fsl-edma-common.o
+fsl-edma-objs := fsl-edma-main.o fsl-edma-common.o
+obj-$(CONFIG_FSL_EDMA) += fsl-edma.o
+mcf-edma-objs := mcf-edma-main.o fsl-edma-common.o
+obj-$(CONFIG_MCF_EDMA) += mcf-edma.o
 obj-$(CONFIG_FSL_QDMA) += fsl-qdma.o
 obj-$(CONFIG_FSL_RAID) += fsl_raid.o
 obj-$(CONFIG_HISI_DMA) += hisi_dma.o
diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index a06a1575a2a5..ce8d7c9eaf77 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -75,7 +75,6 @@ void fsl_edma_disable_request(struct fsl_edma_chan *fsl_chan)
 		iowrite8(EDMA_CEEI_CEEI(ch), regs->ceei);
 	}
 }
-EXPORT_SYMBOL_GPL(fsl_edma_disable_request);
 
 static void mux_configure8(struct fsl_edma_chan *fsl_chan, void __iomem *addr,
 			   u32 off, u32 slot, bool enable)
@@ -126,7 +125,6 @@ void fsl_edma_chan_mux(struct fsl_edma_chan *fsl_chan,
 	else
 		mux_configure8(fsl_chan, muxaddr, ch_off, slot, enable);
 }
-EXPORT_SYMBOL_GPL(fsl_edma_chan_mux);
 
 static unsigned int fsl_edma_get_tcd_attr(enum dma_slave_buswidth addr_width)
 {
@@ -155,7 +153,6 @@ void fsl_edma_free_desc(struct virt_dma_desc *vdesc)
 			      fsl_desc->tcd[i].ptcd);
 	kfree(fsl_desc);
 }
-EXPORT_SYMBOL_GPL(fsl_edma_free_desc);
 
 int fsl_edma_terminate_all(struct dma_chan *chan)
 {
@@ -172,7 +169,6 @@ int fsl_edma_terminate_all(struct dma_chan *chan)
 	vchan_dma_desc_free_list(&fsl_chan->vchan, &head);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(fsl_edma_terminate_all);
 
 int fsl_edma_pause(struct dma_chan *chan)
 {
@@ -188,7 +184,6 @@ int fsl_edma_pause(struct dma_chan *chan)
 	spin_unlock_irqrestore(&fsl_chan->vchan.lock, flags);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(fsl_edma_pause);
 
 int fsl_edma_resume(struct dma_chan *chan)
 {
@@ -204,7 +199,6 @@ int fsl_edma_resume(struct dma_chan *chan)
 	spin_unlock_irqrestore(&fsl_chan->vchan.lock, flags);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(fsl_edma_resume);
 
 static void fsl_edma_unprep_slave_dma(struct fsl_edma_chan *fsl_chan)
 {
@@ -265,7 +259,6 @@ int fsl_edma_slave_config(struct dma_chan *chan,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(fsl_edma_slave_config);
 
 static size_t fsl_edma_desc_residue(struct fsl_edma_chan *fsl_chan,
 		struct virt_dma_desc *vdesc, bool in_progress)
@@ -340,7 +333,6 @@ enum dma_status fsl_edma_tx_status(struct dma_chan *chan,
 
 	return fsl_chan->status;
 }
-EXPORT_SYMBOL_GPL(fsl_edma_tx_status);
 
 static void fsl_edma_set_tcd_regs(struct fsl_edma_chan *fsl_chan,
 				  struct fsl_edma_hw_tcd *tcd)
@@ -520,7 +512,6 @@ struct dma_async_tx_descriptor *fsl_edma_prep_dma_cyclic(
 
 	return vchan_tx_prep(&fsl_chan->vchan, &fsl_desc->vdesc, flags);
 }
-EXPORT_SYMBOL_GPL(fsl_edma_prep_dma_cyclic);
 
 struct dma_async_tx_descriptor *fsl_edma_prep_slave_sg(
 		struct dma_chan *chan, struct scatterlist *sgl,
@@ -589,7 +580,6 @@ struct dma_async_tx_descriptor *fsl_edma_prep_slave_sg(
 
 	return vchan_tx_prep(&fsl_chan->vchan, &fsl_desc->vdesc, flags);
 }
-EXPORT_SYMBOL_GPL(fsl_edma_prep_slave_sg);
 
 struct dma_async_tx_descriptor *fsl_edma_prep_memcpy(struct dma_chan *chan,
 						     dma_addr_t dma_dst, dma_addr_t dma_src,
@@ -612,7 +602,6 @@ struct dma_async_tx_descriptor *fsl_edma_prep_memcpy(struct dma_chan *chan,
 
 	return vchan_tx_prep(&fsl_chan->vchan, &fsl_desc->vdesc, flags);
 }
-EXPORT_SYMBOL_GPL(fsl_edma_prep_memcpy);
 
 void fsl_edma_xfer_desc(struct fsl_edma_chan *fsl_chan)
 {
@@ -629,7 +618,6 @@ void fsl_edma_xfer_desc(struct fsl_edma_chan *fsl_chan)
 	fsl_chan->status = DMA_IN_PROGRESS;
 	fsl_chan->idle = false;
 }
-EXPORT_SYMBOL_GPL(fsl_edma_xfer_desc);
 
 void fsl_edma_issue_pending(struct dma_chan *chan)
 {
@@ -649,7 +637,6 @@ void fsl_edma_issue_pending(struct dma_chan *chan)
 
 	spin_unlock_irqrestore(&fsl_chan->vchan.lock, flags);
 }
-EXPORT_SYMBOL_GPL(fsl_edma_issue_pending);
 
 int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
 {
@@ -660,7 +647,6 @@ int fsl_edma_alloc_chan_resources(struct dma_chan *chan)
 				32, 0);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(fsl_edma_alloc_chan_resources);
 
 void fsl_edma_free_chan_resources(struct dma_chan *chan)
 {
@@ -683,7 +669,6 @@ void fsl_edma_free_chan_resources(struct dma_chan *chan)
 	fsl_chan->tcd_pool = NULL;
 	fsl_chan->is_sw = false;
 }
-EXPORT_SYMBOL_GPL(fsl_edma_free_chan_resources);
 
 void fsl_edma_cleanup_vchan(struct dma_device *dmadev)
 {
@@ -695,7 +680,6 @@ void fsl_edma_cleanup_vchan(struct dma_device *dmadev)
 		tasklet_kill(&chan->vchan.task);
 	}
 }
-EXPORT_SYMBOL_GPL(fsl_edma_cleanup_vchan);
 
 /*
  * On the 32 channels Vybrid/mpc577x edma version (here called "v1"),
@@ -743,6 +727,4 @@ void fsl_edma_setup_regs(struct fsl_edma_engine *edma)
 
 	edma->regs.tcd = edma->membase + EDMA_TCD;
 }
-EXPORT_SYMBOL_GPL(fsl_edma_setup_regs);
 
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/fsl-edma.c b/drivers/dma/fsl-edma-main.c
similarity index 100%
rename from drivers/dma/fsl-edma.c
rename to drivers/dma/fsl-edma-main.c
diff --git a/drivers/dma/mcf-edma.c b/drivers/dma/mcf-edma-main.c
similarity index 100%
rename from drivers/dma/mcf-edma.c
rename to drivers/dma/mcf-edma-main.c
-- 
2.34.1

