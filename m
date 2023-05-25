Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBA624142
	for <imx@lists.linux.dev>; Thu, 25 May 2023 20:02:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqGuC1aUwLlW2/t/VucHeceb/3026cystsuJAOhlIrETr73zI+yF2Y5q0a18lZfVvHHHO6ZX+fJ4eEZD7PkS6QNnMY3tH2vt3/riNFouyr1NR2gpjVCzEEwalWzPv/Bhj9/jq02/PPt2nOqDN66PmK+d29a1WkhCy2JYjAamxRxcBEJTBmtEOqpaolHYl9c4A2deIU+maD+B/UJelDOepVyJsDA41pwkUSYgn3+epuRxU97r9hC2twW6m+QbZqHoRGtmE5Z7naJiop1os/YpcIHCIb6Wi0Fw2MA4L7lX3yFW6zegXC4CqtXsxEt0q+CLR5LwAgspzg5GNPka3EffoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msrt5RHHs6IHX/f7JbgffOTIryNu0J13mXMJS9oOE4A=;
 b=A247oxaUZBjj6rp9dZ3quawV9mbFc6eYkjxcmqQhSPJUCgWeEzckXtiXTX2vLr0nFezZ1oSbeOoIZ32BZQYLcGv7k+4Nt+bbntVvDd9XqGS34IqfrC8If66CoUrMh062PbuKNVrsz7xKVj750jBfx1M3GaU+PbNxRRvUcxuLIwatCbqvTQsnBv+PKmW1x4wDLhyhaMYf3Ty9WH39g+XISb/x0s5RHf0QvmxQCv5uhpxgEzF4+t2LwVk2f69DiYsFiIeKHDeBHB3wrLopZxNWRS7NhtaUizf51m4v+sEWKHLQxsfux+W3pADuWM1zplEap9ezhJBQjqcWqvxxV/9qAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msrt5RHHs6IHX/f7JbgffOTIryNu0J13mXMJS9oOE4A=;
 b=SlO+YE0gbxsXmBSlfx/7s+4XKnjqMtB/GuTse4K5NN0WdzW36GiDTKOlpyi9otGqQjv3rO04Ac1ySWeDrMhuE+S+521AORNJjQceYOtDs9sBG9dTmiWYmc2XEOx6ue2TCR5g+EuZyuRzp9UFWjjjrabm0QwKJV3hJokq2zELuv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 20:02:16 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:02:16 +0000
From: Frank Li <Frank.Li@nxp.com>
To: peng.fan@nxp.com,
	joy.zou@nxp.com,
	shenwei.wang@nxp.com,
	imx@lists.linux.dev
Subject: [RFC PATCH 05/12] dmaengine: fsl-edma: move common IRQ handler to common.c
Date: Thu, 25 May 2023 16:01:41 -0400
Message-Id: <20230525200148.1015154-6-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 88abaad3-114b-45e3-99ef-08db5d5af013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VpoMRuraUsqhrafHKp0FlFGYIQoxcSS4qRXy/KzlidOuedmnBnDduCEdC76eYZ4GLsaObIK75P5zP/DarpnFakGJ5I5hzHa1SbnD4siLasortOfDr84Z1UXpQksDnoKL61oAM7Da8wLtvl+f+Q5JgwSZsNM5Ht+PP7Y+p03IgJ9+zUfJk2EhUWUm0eyrvRVqtHJ3cRQmS0Ht3JAckHynd8jP8sF/4QoCkXpEf3E4hkeg6tVjBhgHGGhufX0gQfF5GicwXvZ9ta6WBcqQk8hQJTZ2JBmvfDmnspW5FqRScb3Dyw8bjVTu0d3nxoPUf5I5MfWHBidpMkFfXsm/gQzgFCo7KQOxp6T8OdJq+/MkJbIEiXfnOQj+dlNK9LhSJR5WuyzM3BPIw/rvRFsDPbUludWOBe3xrv9oM33kbhj8dO7emhdkQFShS7v6UKjuNArxeNPZjy7flEzaYqsnvLC7wGd0+gOCFG7l5OEYobCi3VXpaukLhA2Ig2G52NzK772Nn7bBFbb36SyVE5URsEcu+p8V+2Z2PpCug+/VzisHhk+tLD9jwRuAYEGbHdoQEmb47WH/irykw9SPStSmJpnc37GGlJDmI5rm/bmkgP0K4qE9beg2cOQQVEz3Vybn7KV4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(36756003)(86362001)(52116002)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38350700002)(38100700002)(1076003)(6506007)(26005)(6512007)(186003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6UD8gfNjIwoE+YekV4GMev4u9bSXiLiDC4dZnyUIkXlLKeByiA+6pf7IetKm?=
 =?us-ascii?Q?W53684ebAQ45bWN1WE1YhADxiypeN5f31SAYaPf4v/Cm7xEA1WNhqVsFbl6A?=
 =?us-ascii?Q?pSS9reAAonUtxKgRcmX5lnZ72KS1FAATa6lW6YMQzDQ3q5EXr4nc4THZQmvz?=
 =?us-ascii?Q?6HvE5IE334o8S4TOJqlj+VmiYpKrhkWXdwe9Fg2DcwB97PB7VnSlGNLXViTj?=
 =?us-ascii?Q?b8Wna7knKLB3zp3CtLHEHUa74KWr87iZ/cdp0c3IDH2axzYoeydQuS6ulxMt?=
 =?us-ascii?Q?LZ8bpazkG8/yYKsXbTEapPLiq6MHxyci9QjLG0oQaU663uKDZ6bJ0f2HMILB?=
 =?us-ascii?Q?hjI6LJsbexlpqQBPxUUy7LAglRCYjy0uCt+TxTsy84o1jh7a8mP62MqPuToz?=
 =?us-ascii?Q?Eu3BFwiZo9xHrMcvCgidsD4lgdQoLGwauhDF5nqIzqCaQeGr16I1LbT8nxJJ?=
 =?us-ascii?Q?EGUb1pYrXcmyFSuiTC8+/sFIc6wbrFhMFxyVtTWU7aakEi54gUl7kTqlUSmu?=
 =?us-ascii?Q?d1R6q01Rvy4bi1xBh28OcSksvbHiIcryEYhnWVKWFsaEsiC44E5xjqqGIpmC?=
 =?us-ascii?Q?IVoU/greDod7qKFDwJQ04NL9BFpD0uSyDyFl4NjHBVPsrn1q/45wc88xBGNS?=
 =?us-ascii?Q?5bl+MTxuE3V8GI6vJ6sth7XiLTQNBKc8WASrEXw++eq9Pf86TjWeX0WZ66Ac?=
 =?us-ascii?Q?GtAcfC5DPsqgiWigzls6av9EP8A/F37iTH2uHx7Y1GaRu9QtyICN7rzL1KuS?=
 =?us-ascii?Q?jsrh9llysKEYJfoAmdSPNazVyIGi5vTYQrHmoOKjKl8ZyU587R1KmLk6ss8m?=
 =?us-ascii?Q?6PGedZn0ZTf19lS77Q61kPwh6bBiIODbfD/v9tBsuzCjsBCOh9tNwiBtb0t0?=
 =?us-ascii?Q?P4Jl3kXPnRPGH2j/JTGvldqCgNrR6mvF0lZK1VfbqXN6LjW/ARbe00xv6DKQ?=
 =?us-ascii?Q?lFHEnfh5N0BybJzBbum4+Rqqi57n4SJmAkUr6GKB4bNXUywmmRednGz3eQ+i?=
 =?us-ascii?Q?H7lM2WlOmc6sysoYUprhSOdnfplcSCvQ+HUCTw17FZ9o/QEEP5aohuF5tBkv?=
 =?us-ascii?Q?L2erB2gUKn9q00mR2JSF308EEP1UJXAWJor+0mHVzUAtiENPYdQfpAOj/bBf?=
 =?us-ascii?Q?+P4C39cQTBkNuI/I1An8G7ymAVV5drHV6XzgCIfCtPLv4OlW1TmzHLusGPcv?=
 =?us-ascii?Q?hIeU++fxTKVj5DbDXNjnVA4/QhgOAU36bCRkdwi91v3RmY6/vFwbBfZETuAl?=
 =?us-ascii?Q?OkqHM+hMxjyHW0kHQGwCqbwUF02NxbQDV/W9bmV8FV55D5KBQ3d667WuemW3?=
 =?us-ascii?Q?SCL2nMuMONYKHozkxwYyu8bh8yKgDiyMdR45ARHglwxqwvHWjNCwRclhqunK?=
 =?us-ascii?Q?3XhWMWf1Z9FD9rM/Xq2arxOkQdtx5+hY4TVuwmDahztw61qMUGAg6Bxx3DGq?=
 =?us-ascii?Q?oADsxG02sbLfaia+lYzhWs1vPe3vaJULxBhbiSks6r+t7mtCNGKjDkiELOe9?=
 =?us-ascii?Q?82zKtRPwu0yS+nXJcimDrxCxEYZQAz3SgaldtoPfmaCU6lG7aN64KCBimFKU?=
 =?us-ascii?Q?RbjVDqzIT5nwUx1tNsgAsORfzOITFvPHpQUal6m8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88abaad3-114b-45e3-99ef-08db5d5af013
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 20:02:16.1988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkL5p5Gg8RI6NcUENQ9Pc2UQM7x5JmAun7RmHJfDA+YTptX1SDiEs0th/Np0P4VaykEQLxxt+CBnXzCFXO2DdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

Move the common part of IRQ handler from fsl-edma-main.c and
mcf-edma-main.c to fsl-edma-common.c. This eliminates redundant code, as
the both files contains mostly identical code.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/fsl-edma-common.c | 26 ++++++++++++++++++++++++++
 drivers/dma/fsl-edma-common.h |  7 +++++++
 drivers/dma/fsl-edma-main.c   | 30 ++----------------------------
 drivers/dma/mcf-edma-main.c   | 30 ++----------------------------
 4 files changed, 37 insertions(+), 56 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index e5c7497c1ff3..839471c42758 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -42,6 +42,32 @@
 
 #define EDMA_TCD		0x1000
 
+void fsl_edma_tx_chan_handler(struct fsl_edma_chan *fsl_chan)
+{
+	spin_lock(&fsl_chan->vchan.lock);
+
+	if (!fsl_chan->edesc) {
+		/* terminate_all called before */
+		spin_unlock(&fsl_chan->vchan.lock);
+		return;
+	}
+
+	if (!fsl_chan->edesc->iscyclic) {
+		list_del(&fsl_chan->edesc->vdesc.node);
+		vchan_cookie_complete(&fsl_chan->edesc->vdesc);
+		fsl_chan->edesc = NULL;
+		fsl_chan->status = DMA_COMPLETE;
+		fsl_chan->idle = true;
+	} else {
+		vchan_cyclic_callback(&fsl_chan->edesc->vdesc);
+	}
+
+	if (!fsl_chan->edesc)
+		fsl_edma_xfer_desc(fsl_chan);
+
+	spin_unlock(&fsl_chan->vchan.lock);
+}
+
 static void fsl_edma_enable_request(struct fsl_edma_chan *fsl_chan)
 {
 	struct edma_regs *regs = &fsl_chan->edma->regs;
diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index 2f13e687a721..71e19e20f1cb 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -223,6 +223,13 @@ static inline struct fsl_edma_desc *to_fsl_edma_desc(struct virt_dma_desc *vd)
 	return container_of(vd, struct fsl_edma_desc, vdesc);
 }
 
+static inline void fsl_edma_err_chan_handler(struct fsl_edma_chan *fsl_chan)
+{
+	fsl_chan->status = DMA_ERROR;
+	fsl_chan->idle = true;
+}
+
+void fsl_edma_tx_chan_handler(struct fsl_edma_chan *fsl_chan);
 void fsl_edma_disable_request(struct fsl_edma_chan *fsl_chan);
 void fsl_edma_chan_mux(struct fsl_edma_chan *fsl_chan,
 			unsigned int slot, bool enable);
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 31531b8bde78..9c0b6fb4cb8f 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -33,7 +33,6 @@ static irqreturn_t fsl_edma_tx_handler(int irq, void *dev_id)
 	struct fsl_edma_engine *fsl_edma = dev_id;
 	unsigned int intr, ch;
 	struct edma_regs *regs = &fsl_edma->regs;
-	struct fsl_edma_chan *fsl_chan;
 
 	intr = edma_readl(fsl_edma, regs->intl);
 	if (!intr)
@@ -42,31 +41,7 @@ static irqreturn_t fsl_edma_tx_handler(int irq, void *dev_id)
 	for (ch = 0; ch < fsl_edma->n_chans; ch++) {
 		if (intr & (0x1 << ch)) {
 			edma_writeb(fsl_edma, EDMA_CINT_CINT(ch), regs->cint);
-
-			fsl_chan = &fsl_edma->chans[ch];
-
-			spin_lock(&fsl_chan->vchan.lock);
-
-			if (!fsl_chan->edesc) {
-				/* terminate_all called before */
-				spin_unlock(&fsl_chan->vchan.lock);
-				continue;
-			}
-
-			if (!fsl_chan->edesc->iscyclic) {
-				list_del(&fsl_chan->edesc->vdesc.node);
-				vchan_cookie_complete(&fsl_chan->edesc->vdesc);
-				fsl_chan->edesc = NULL;
-				fsl_chan->status = DMA_COMPLETE;
-				fsl_chan->idle = true;
-			} else {
-				vchan_cyclic_callback(&fsl_chan->edesc->vdesc);
-			}
-
-			if (!fsl_chan->edesc)
-				fsl_edma_xfer_desc(fsl_chan);
-
-			spin_unlock(&fsl_chan->vchan.lock);
+			fsl_edma_tx_chan_handler(&fsl_edma->chans[ch]);
 		}
 	}
 	return IRQ_HANDLED;
@@ -86,8 +61,7 @@ static irqreturn_t fsl_edma_err_handler(int irq, void *dev_id)
 		if (err & (0x1 << ch)) {
 			fsl_edma_disable_request(&fsl_edma->chans[ch]);
 			edma_writeb(fsl_edma, EDMA_CERR_CERR(ch), regs->cerr);
-			fsl_edma->chans[ch].status = DMA_ERROR;
-			fsl_edma->chans[ch].idle = true;
+			fsl_edma_err_chan_handler(&fsl_edma->chans[ch]);
 		}
 	}
 	return IRQ_HANDLED;
diff --git a/drivers/dma/mcf-edma-main.c b/drivers/dma/mcf-edma-main.c
index ebd8733f72ad..af1b0e8a3021 100644
--- a/drivers/dma/mcf-edma-main.c
+++ b/drivers/dma/mcf-edma-main.c
@@ -19,7 +19,6 @@ static irqreturn_t mcf_edma_tx_handler(int irq, void *dev_id)
 	struct fsl_edma_engine *mcf_edma = dev_id;
 	struct edma_regs *regs = &mcf_edma->regs;
 	unsigned int ch;
-	struct fsl_edma_chan *mcf_chan;
 	u64 intmap;
 
 	intmap = ioread32(regs->inth);
@@ -31,31 +30,7 @@ static irqreturn_t mcf_edma_tx_handler(int irq, void *dev_id)
 	for (ch = 0; ch < mcf_edma->n_chans; ch++) {
 		if (intmap & BIT(ch)) {
 			iowrite8(EDMA_MASK_CH(ch), regs->cint);
-
-			mcf_chan = &mcf_edma->chans[ch];
-
-			spin_lock(&mcf_chan->vchan.lock);
-
-			if (!mcf_chan->edesc) {
-				/* terminate_all called before */
-				spin_unlock(&mcf_chan->vchan.lock);
-				continue;
-			}
-
-			if (!mcf_chan->edesc->iscyclic) {
-				list_del(&mcf_chan->edesc->vdesc.node);
-				vchan_cookie_complete(&mcf_chan->edesc->vdesc);
-				mcf_chan->edesc = NULL;
-				mcf_chan->status = DMA_COMPLETE;
-				mcf_chan->idle = true;
-			} else {
-				vchan_cyclic_callback(&mcf_chan->edesc->vdesc);
-			}
-
-			if (!mcf_chan->edesc)
-				fsl_edma_xfer_desc(mcf_chan);
-
-			spin_unlock(&mcf_chan->vchan.lock);
+			fsl_edma_tx_chan_handler(&mcf_edma->chans[ch]);
 		}
 	}
 
@@ -76,8 +51,7 @@ static irqreturn_t mcf_edma_err_handler(int irq, void *dev_id)
 		if (err & BIT(ch)) {
 			fsl_edma_disable_request(&mcf_edma->chans[ch]);
 			iowrite8(EDMA_CERR_CERR(ch), regs->cerr);
-			mcf_edma->chans[ch].status = DMA_ERROR;
-			mcf_edma->chans[ch].idle = true;
+			fsl_edma_err_chan_handler(&mcf_edma->chans[ch]);
 		}
 	}
 
-- 
2.34.1

