Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C366224142
	for <imx@lists.linux.dev>; Thu, 25 May 2023 20:02:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcuMtNakXZGwGut9lzohPPIydLGM5OAauhY079Gy7xPLUMzkr+m1IR2RVgFtQTF7YJfQ/cqHmYEODp7w8vsMCqmg8y4H6QNpF6cbti4whowjwa3efUebkQGZIBa7Aks2AEm3T1GhuHHNQT5/rr8rE4GQb+vqmyKPxns2wT2/UVrge2ETeZM5KhW/vTcCtwbJ6PWeQRRY4GSG5izcCKGlDSvatrfMlbYzeSDHqZOe3q16aGSaIYFNjknhJ/J6z2hzXIJaZgJo0xPjzofQ6n9styDkmNRhND3sIRQbutOk31c5dm7vQJ8/kPQKrP/fnpUoM+aO8mkBmqZ8+fIEy8gQSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNjfU1dbjGe6WQ8dMx8AJBvEVMIU7B1H7pGqCNARUFM=;
 b=Pdq8nXEBUbzgrLY6j2DV+n3lvZXJDQwOjHEfpS1uJO2XSp+o0jOFhXcMGsFwWi9LaC6eMJeuexiKJExqMhV43V0YE2jktN7UYOAcox8hPHpyAYm/pnwQUGGNlPjNvI/kNcrGNzcXDlpN9aZUHI0GL5Js/4t2OHlIS0d5P5boUNjtxRttIn8PgwPtMA/ugXJmPF1G4yxUCjeh73VGx2xRpJ1HGtYyJGv94rSeMbb9Li7CPkDdFUxmSSMNkryBZSAYyu9elmETAGZfyXY/gapb9d5Qc3n6rP5M1FicHgqEIwDD6beKwLav+pzt4OD4LK7H36pvTMsaqnoGnuZ60ByjFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNjfU1dbjGe6WQ8dMx8AJBvEVMIU7B1H7pGqCNARUFM=;
 b=L/322uLSegpTeGkWfU2oek3FKwUbpvRT2gx//S6pVTSg7l4qdQsgGhE+lV+29yVnxpINfKE5KzJDQXZw4F2ui+joj0+gpVktD0BQYKThTskwvf1zszm6FB4P0XUSUZBYsGhYKO60dCVHc6qWX5YZL3vTtWuyjlzGsGXYuZsBdMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 20:02:25 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:02:25 +0000
From: Frank Li <Frank.Li@nxp.com>
To: peng.fan@nxp.com,
	joy.zou@nxp.com,
	shenwei.wang@nxp.com,
	imx@lists.linux.dev
Subject: [RFC PATCH 10/12] dmaengine: fsl-edma: move tcd into struct fsl_dma_chan
Date: Thu, 25 May 2023 16:01:46 -0400
Message-Id: <20230525200148.1015154-11-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3fa01add-7df2-4d08-b671-08db5d5af57c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fIADXZa9exz1sB3eo0ENkj/HYl7tROzprMaeOX3FK+k3Uv6SYL5N2ojSTl08dE+ViV4s8gUwU4LsHf2uOUJvc5ejs9BWhYloryywx2kr+quXwhc7dmg00Y4307M5y4FjJuKiCPB6mXGynSWoSuAgtutOG9L3WSoFgU0OHvsvG64r+wF18qmcLTONb0De0PONGadHhtOvu4l+05LJbRdkXnSrP10uQXgLyrdK3we2sZsvad9UAvFgBIaf88uKr05kU3D6M0PM5F+evdbzJ8iWqw1WfEEXU9q0PvGHXRZXFrYdtgWr5+SXlbkSO/qY9vSbpDTJXzTGndxBnso3mPhdMmXZ+NCuTjFBqJTpIiG+QZDEIZVhBIVgnz1p8bRG7aXqFDyJYJOyfIfTUVOu5/QkB/w9tT6OYbnJma2Ha8p6xMS78VgUQcopvamBYbE28uTnJp4OPsdAplDNk4uEcXP4PQP0ecDgRrADtNhjTT/zSnafX1K6JGpFVrpq3BxxIGJN0YQcAxtc10x8yvT2xK/rqpCMSHa2EdhAE8HBopiqKggOFxyJsQA8TwXQhSSfwiGx90dLleWfQyVtqCXEl+oOsbJZfbd6J9yNa/Buxp0Ng0E2a/QwC/UkQ4IuUDBJsI+v
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(36756003)(86362001)(52116002)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38350700002)(38100700002)(1076003)(6506007)(26005)(6512007)(186003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?litqZl1rxsdRJXXVlZ+E0xDvbA5aUToKAeDVgNbMU7P/oKXfHDgWQPwL2rgP?=
 =?us-ascii?Q?mDNGdsjJbDKp+IcUjZIzvucgFQf4bqc7AI1IbziB+vEJ+YCec4ZwOTLpsG+E?=
 =?us-ascii?Q?FWaIYYgVsDM4ppzJenMIjtyALPEX1H0aKIwKX81OclzXzxFZ0SCAi6gjeEiR?=
 =?us-ascii?Q?3/jDI2zvJ1fbt1mEAVYZlu/R/bxkYd/yJPhA8ifiqu9Qc6E5cBxmhQCVwulm?=
 =?us-ascii?Q?t4jigrhQ7FWreAtj718v19xM1Uck76YPPZNefPlSsshFf8YV3gJ3eXMdSZxB?=
 =?us-ascii?Q?/iTuDV6LGje7qIFdl6f0KoY7P45fjKdOMBqMT8m4X7Zn+AiT+JdRWZB+cWOr?=
 =?us-ascii?Q?K1VQi6VgdRVuzdQOo6rGjhCx8hXR/emy3JMgHHLfRIUit+QnJ+u/vVYpGiyE?=
 =?us-ascii?Q?iq6I63PUS/9QJc1BCjyj+yZH5Hnb//vZdTvwTbw7pXno4jD6GCQDMybqjqlQ?=
 =?us-ascii?Q?oqxGxEmGGzol8fCePtjOznHtFJGKYs/B7IGEuJHmNFl+DSJN5QQDz8/ozZAY?=
 =?us-ascii?Q?AKKcsGugtt/Pz6qANHVWKxKBNcjD7oOhk3D5kesClSakG7mGM0BG0s5j8OPM?=
 =?us-ascii?Q?L6ZnYeWC98Nz3n7Mk412oue9rPWusDlrtJwEeloZz3eDMd0Y4W7nijr70hxa?=
 =?us-ascii?Q?oy2V1QjTnRo0QhMYJ4+Zhc9YCEKOxDL0JOC4mAs/yxvg41cjKKEC1rGIZu60?=
 =?us-ascii?Q?VAuQ3nnmAoQX1y5OGEkWP4qICWnjWXr7CYAauMWiopsol6BgPNVjSF2+epXU?=
 =?us-ascii?Q?XSw6XRBl9r0G6uA7psiN2ZHK/QD9yu0/F+8Z5JTBtBWyTq91ZdmCI6pLws/3?=
 =?us-ascii?Q?jGpfqBYCtVCtJLLxxNpvt2r/CdbKzkje743yrTduvUUBLaTpy8AK/eW/SGg2?=
 =?us-ascii?Q?Yy8CZzdJ5dY2CM3vqCdcu2WY5BO0NqW2ItPXb0KYGXJ6Z89MvegHFOfdqvlp?=
 =?us-ascii?Q?5kACoGBaQ+86M8lqdi5nkuwQFyw91KAJ1VsMWKEKMD7jS+Pn2RJ3b7LHztPe?=
 =?us-ascii?Q?PUtDgMggQk9ODwZm1u0g6s9UP/dNWld+sG4pOZVWKDNlhqr4OGLj8ckYvMrH?=
 =?us-ascii?Q?LSIKU5AUUDurEui0y8kt+3oqfdo4hjQlQAMzgEudBaWnIWQIDVJPrI81sOJq?=
 =?us-ascii?Q?JpJe2LKgYtwSOhSebstFY5ibuOA8F7K+gVmHyR/m9Ksn29lnKBhV6Oe4kOP7?=
 =?us-ascii?Q?gcrbFMNQtaBcB3wKzcgxOGBuot7/VDYM2sKY9QkqKmvM8feEenNNVVBP4dXz?=
 =?us-ascii?Q?Hltg7NDCAxnOUf/fPnhjUjyw+deyBCOvcWUHJhZ6wSQ0Mgxv2niYDTO1eYAS?=
 =?us-ascii?Q?COGgYVUXmHRhPFchQ+ohkFZ6hCU0AgVpOqOoi1IBIZC/KoFA6PbLL2tT1zUp?=
 =?us-ascii?Q?0VVn+QPoCjhdyhX+aAnS4qt0FrjSYO7TRlhEf7oROm942qIxN3VHTqAC3gEY?=
 =?us-ascii?Q?a4mPWfw59gxxOgJXl7nuIZz+WZr+c1Af5OoryplY1PgyCIniHNkVNNWcn4kC?=
 =?us-ascii?Q?ALOOuK6GPDCD1C1HBK8FXN7eIAd65nKWAcTdKPMJeIbq+Lfseyx7X2r/OCNN?=
 =?us-ascii?Q?/g0hVYscMG12ic3nd77pQLVu+vmdTs29VhoucHPh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa01add-7df2-4d08-b671-08db5d5af57c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 20:02:25.2947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XywxL5TK/TmEkyIJlo2yTYw5okZ5j4iFYXP1pBaq8ZgLGV0w+x7sjY8S3W7/2t8pazV1/oUiI7D/0BO2HfVwTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

Relocates the tcd into the fsl_dma_chan structure. This adjustment reduces
the need to reference back to fsl_edma_engine, paving the way for EDMA V3
support.

Unified the edma_writel and edma_writew functions for accessing TCD
(Transfer Control Descriptor) registers. A new macro is added that can
automatically detect whether a 32-bit or 16-bit access should be used
based on the structure field definition. This provide better support
64-bit TCD with future v5 version.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/fsl-edma-common.c | 38 +++++++++++++----------------------
 drivers/dma/fsl-edma-common.h | 22 +++++++++++++++++++-
 drivers/dma/fsl-edma-main.c   |  6 ++++--
 drivers/dma/mcf-edma-main.c   |  4 +++-
 4 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 659bef4a3b23..186b5c41d07f 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -40,8 +40,6 @@
 #define EDMA64_ERRH		0x28
 #define EDMA64_ERRL		0x2c
 
-#define EDMA_TCD		0x1000
-
 void fsl_edma_tx_chan_handler(struct fsl_edma_chan *fsl_chan)
 {
 	spin_lock(&fsl_chan->vchan.lock);
@@ -285,8 +283,6 @@ static size_t fsl_edma_desc_residue(struct fsl_edma_chan *fsl_chan,
 		struct virt_dma_desc *vdesc, bool in_progress)
 {
 	struct fsl_edma_desc *edesc = fsl_chan->edesc;
-	struct edma_regs *regs = &fsl_chan->edma->regs;
-	u32 ch = fsl_chan->vchan.chan.chan_id;
 	enum dma_transfer_direction dir = edesc->dirn;
 	dma_addr_t cur_addr, dma_addr;
 	size_t len, size;
@@ -301,9 +297,9 @@ static size_t fsl_edma_desc_residue(struct fsl_edma_chan *fsl_chan,
 		return len;
 
 	if (dir == DMA_MEM_TO_DEV)
-		cur_addr = edma_readl(fsl_chan->edma, &regs->tcd[ch].saddr);
+		cur_addr = edma_read_tcdreg(fsl_chan, saddr);
 	else
-		cur_addr = edma_readl(fsl_chan->edma, &regs->tcd[ch].daddr);
+		cur_addr = edma_read_tcdreg(fsl_chan, daddr);
 
 	/* figure out the finished and calculate the residue */
 	for (i = 0; i < fsl_chan->edesc->n_tcds; i++) {
@@ -358,9 +354,6 @@ enum dma_status fsl_edma_tx_status(struct dma_chan *chan,
 static void fsl_edma_set_tcd_regs(struct fsl_edma_chan *fsl_chan,
 				  struct fsl_edma_hw_tcd *tcd)
 {
-	struct fsl_edma_engine *edma = fsl_chan->edma;
-	struct edma_regs *regs = &fsl_chan->edma->regs;
-	u32 ch = fsl_chan->vchan.chan.chan_id;
 	u16 csr = 0;
 
 	/*
@@ -369,23 +362,22 @@ static void fsl_edma_set_tcd_regs(struct fsl_edma_chan *fsl_chan,
 	 * big- or little-endian obeying the eDMA engine model endian,
 	 * and this is performed from specific edma_write functions
 	 */
-	edma_writew(edma, 0,  &regs->tcd[ch].csr);
+	edma_write_tcdreg(fsl_chan, 0, csr);
 
-	edma_writel(edma, (s32)tcd->saddr, &regs->tcd[ch].saddr);
-	edma_writel(edma, (s32)tcd->daddr, &regs->tcd[ch].daddr);
+	edma_write_tcdreg(fsl_chan, (s32)tcd->saddr, saddr);
+	edma_write_tcdreg(fsl_chan, (s32)tcd->daddr, daddr);
 
-	edma_writew(edma, (s16)tcd->attr, &regs->tcd[ch].attr);
-	edma_writew(edma, tcd->soff, &regs->tcd[ch].soff);
+	edma_write_tcdreg(fsl_chan, (s16)tcd->attr, attr);
+	edma_write_tcdreg(fsl_chan, tcd->soff, soff);
 
-	edma_writel(edma, (s32)tcd->nbytes, &regs->tcd[ch].nbytes);
-	edma_writel(edma, (s32)tcd->slast, &regs->tcd[ch].slast);
+	edma_write_tcdreg(fsl_chan, (s32)tcd->nbytes, nbytes);
+	edma_write_tcdreg(fsl_chan, (s32)tcd->slast, slast);
 
-	edma_writew(edma, (s16)tcd->citer, &regs->tcd[ch].citer);
-	edma_writew(edma, (s16)tcd->biter, &regs->tcd[ch].biter);
-	edma_writew(edma, (s16)tcd->doff, &regs->tcd[ch].doff);
+	edma_write_tcdreg(fsl_chan, (s16)tcd->citer, citer);
+	edma_write_tcdreg(fsl_chan, (s16)tcd->biter, biter);
+	edma_write_tcdreg(fsl_chan, (s16)tcd->doff, doff);
 
-	edma_writel(edma, (s32)tcd->dlast_sga,
-			&regs->tcd[ch].dlast_sga);
+	edma_write_tcdreg(fsl_chan, (s32)tcd->dlast_sga, dlast_sga);
 
 	if (fsl_chan->is_sw) {
 		csr = le16_to_cpu(tcd->csr);
@@ -393,7 +385,7 @@ static void fsl_edma_set_tcd_regs(struct fsl_edma_chan *fsl_chan,
 		tcd->csr = cpu_to_le16(csr);
 	}
 
-	edma_writew(edma, (s16)tcd->csr, &regs->tcd[ch].csr);
+	edma_write_tcdreg(fsl_chan, (s16)tcd->csr, csr);
 }
 
 static inline
@@ -745,7 +737,5 @@ void fsl_edma_setup_regs(struct fsl_edma_engine *edma)
 		edma->regs.errh = edma->membase + EDMA64_ERRH;
 		edma->regs.inth = edma->membase + EDMA64_INTH;
 	}
-
-	edma->regs.tcd = edma->membase + EDMA_TCD;
 }
 
diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index 39b5f903ba87..0a95fd5d74f5 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -48,6 +48,8 @@
 
 #define DMAMUX_NR	2
 
+#define EDMA_TCD                0x1000
+
 #define FSL_EDMA_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
 				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
 				 BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) | \
@@ -93,7 +95,6 @@ struct edma_regs {
 	void __iomem *intl;
 	void __iomem *errh;
 	void __iomem *errl;
-	struct fsl_edma_hw_tcd __iomem *tcd;
 };
 
 struct fsl_edma_sw_tcd {
@@ -117,6 +118,7 @@ struct fsl_edma_chan {
 	u32				dma_dev_size;
 	enum dma_data_direction		dma_dir;
 	char				chan_name[32];
+	struct fsl_edma_hw_tcd __iomem *tcd;
 };
 
 struct fsl_edma_desc {
@@ -160,6 +162,16 @@ struct fsl_edma_engine {
 	struct fsl_edma_chan	chans[];
 };
 
+#define edma_read_tcdreg(chan, __name)				\
+(sizeof(chan->tcd->__name) == sizeof(u32) ?			\
+	edma_readl(chan->edma, &chan->tcd->__name) :		\
+	edma_readw(chan->edma, &chan->tcd->__name))
+
+#define edma_write_tcdreg(chan, val, __name)			\
+(sizeof(chan->tcd->__name) == sizeof(u32) ?			\
+	edma_writel(chan->edma, val, &chan->tcd->__name) :	\
+	edma_writew(chan->edma, val, &chan->tcd->__name))
+
 /*
  * R/W functions for big- or little-endian registers:
  * The eDMA controller's endian is independent of the CPU core's endian.
@@ -174,6 +186,14 @@ static inline u32 edma_readl(struct fsl_edma_engine *edma, void __iomem *addr)
 		return ioread32(addr);
 }
 
+static inline u16 edma_readw(struct fsl_edma_engine *edma, void __iomem *addr)
+{
+	if (edma->big_endian)
+		return ioread16be(addr);
+	else
+		return ioread16(addr);
+}
+
 static inline void edma_writeb(struct fsl_edma_engine *edma,
 			       u8 val, void __iomem *addr)
 {
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 722ebecdc894..8d1d0100f6e6 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -312,9 +312,11 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		fsl_chan->idle = true;
 		fsl_chan->dma_dir = DMA_NONE;
 		fsl_chan->vchan.desc_free = fsl_edma_free_desc;
+		fsl_chan->tcd = fsl_edma->membase + EDMA_TCD
+				+ i * sizeof(struct fsl_edma_hw_tcd);
 		vchan_init(&fsl_chan->vchan, &fsl_edma->dma_dev);
 
-		edma_writew(fsl_edma, 0x0, &regs->tcd[i].csr);
+		edma_write_tcdreg(fsl_chan, 0, csr);
 		fsl_edma_chan_mux(fsl_chan, 0, false);
 	}
 
@@ -421,7 +423,7 @@ static int fsl_edma_resume_early(struct device *dev)
 	for (i = 0; i < fsl_edma->n_chans; i++) {
 		fsl_chan = &fsl_edma->chans[i];
 		fsl_chan->pm_state = RUNNING;
-		edma_writew(fsl_edma, 0x0, &regs->tcd[i].csr);
+		edma_write_tcdreg(fsl_chan, 0, csr);
 		if (fsl_chan->slave_id != 0)
 			fsl_edma_chan_mux(fsl_chan, fsl_chan->slave_id, true);
 	}
diff --git a/drivers/dma/mcf-edma-main.c b/drivers/dma/mcf-edma-main.c
index af1b0e8a3021..d79a04a03fda 100644
--- a/drivers/dma/mcf-edma-main.c
+++ b/drivers/dma/mcf-edma-main.c
@@ -200,7 +200,9 @@ static int mcf_edma_probe(struct platform_device *pdev)
 		mcf_chan->dma_dir = DMA_NONE;
 		mcf_chan->vchan.desc_free = fsl_edma_free_desc;
 		vchan_init(&mcf_chan->vchan, &mcf_edma->dma_dev);
-		iowrite32(0x0, &regs->tcd[i].csr);
+		mcf_chan->tcd = mcf_edma->membase + EDMA_TCD
+				+ i * sizeof(struct fsl_edma_hw_tcd);
+		iowrite32(0x0, &mcf_chan->tcd->csr);
 	}
 
 	iowrite32(~0, regs->inth);
-- 
2.34.1

