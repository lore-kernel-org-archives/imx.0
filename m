Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEFD24142
	for <imx@lists.linux.dev>; Thu, 25 May 2023 20:02:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlCXiKERhdcggrbprbVO13j/AEiRl2l92DF6mJkTSn3SrT0WbNkxf+G/urEJXnYIpgDj7voK55EhA5WmLLMIq2wpfYNdwufPjVfm/VblK25A/iSuY5YLjq1mRmE5TBWeKHgQKv/Fr2MkS7b716qpODFXf+diAcHjsXW6LUWNeoNXp+S6D/V0D8RNf8pg3LQnxl9rN5mmT+3JwlqYNgvGfDRrMK+epK0n/VTkEN+w3I1RPKnRdCQayzDfqC3xV3hFCNNsa1zeMjeKPeJCRxURdK6MNfP492srQMlxQSZazAq50A7M5Vi67fRvGj/oMxI/VRVE4kduPhafCqGHYW1POg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYC6iFkeYIBf1sHD4vzUmRzUWEV8BcYvdT86nMRXy30=;
 b=dPJy3QAaj8RjsCwKf7Qje2kl4B37mylZ35VyQzO3Q3qI2cRh/g/i/7QHq/nK8wGzjmhzGUy3G3Acwqabvclpv0dXDct8xuyjPjpDMnPIK086/bF1OoR6d7bM8lQCcDIuJRHA9aod6JhHnnAccQk+8Tc8UoJpSGhQKzjk6b64brwAv3zLhGCjoPyDd3ulU4vV+FkNwdIC4sZx7LvmLoRCY5gBLC8RdfSlj/VsVzcwFf3JgjEh+lv4F5PJ+pd82p+hTAAg0T8fa1w4zfwfBxBswm1OWH/0Rhu68WGjZ3YfOKRHh44gA/WM7kpT0Z1EEvbd8SSX6OOmp5vTN2KwW8uQdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYC6iFkeYIBf1sHD4vzUmRzUWEV8BcYvdT86nMRXy30=;
 b=NPcyZ9Xc37Gva5/ESitZO2EIX9tzBOGWEoLVTFye2/3BJM9kMiJOxr6dh/m3zUy3aLNN5Nk59hO6sv5Drqg/+4p258KeXihbvpF7winv6Uhq1f0hqFFJSqeQA2dwgAsLqDPaSgNu9pOPYjc4tLrZ2z9mh6FbCHVwY5TyCdQ6ilo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 20:02:18 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:02:18 +0000
From: Frank Li <Frank.Li@nxp.com>
To: peng.fan@nxp.com,
	joy.zou@nxp.com,
	shenwei.wang@nxp.com,
	imx@lists.linux.dev
Subject: [RFC PATCH 06/12] dmaengine: fsl-edma: simply ATTR_DSIZE and ATTR_SSIZE by using ffs()
Date: Thu, 25 May 2023 16:01:42 -0400
Message-Id: <20230525200148.1015154-7-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 28ac4f40-e356-438f-1136-08db5d5af134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R1Rn1DKlV+OWdtLjER60QrmdJoe0qhGeJkk9+TGuJeJSjGYpCjposCTeEbWQs9Ier5By61qaBzg5s6CLTi6rmHF5Seuiwa29DhX+x0cFTLKssGtSfYemVNA1Q0Y3T/gavG8WmpkGyAD0cDvpLKpne2Ht3yjfr+OvcelWKYejSkeR0GF0h5g6fyBzO22V5/o1hQbyApGMNo11QqUKOcbi+Y2OjjSKW5aGTTqtbwbriaF2r8En8+XakOYGwagRDZI19dxN8QRXLb6hcLk3oAyBZy8yBr1zdt+8P66ANAp7NxnZ+sxN3eVGjasZBiOMBoRSJ87X/1s+np7e9djbMjVxOxLu/VZtG2SPj9K7Eh04JJxQIAnHYEum9Z5yaQ4clYhvuDPcTKiOp8AlIR5EUxGG7z06wCvue+9OTdv7+rA9fpXvEEuHoeBnjX2xR4MwBoeUq2dpTrEvRTUAXHYc+toNypOXL9LsVjxoAk3IVRqRBSCnbKeX2SNwAq1aVI6vc1XE2qO22oBNtcQzgv+07zMvEEIw+baTnbmAlaXgK4FZGep+o4sEmRGIiK1NC2VO+HyKhymftZT61VeRhxSyiZb6B3A0/JgJqHLbfCwAGgxRoQVFSEOg4etbU/DxCSaQLmQy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(36756003)(86362001)(52116002)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38350700002)(38100700002)(1076003)(6506007)(26005)(6512007)(186003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DmqaWKzVNc9AfsHcny+Ffpvi6apCqjkDdvZMPVx+xqq/BcJE4o9oTfhX++Gh?=
 =?us-ascii?Q?zeZh7Vek/naTqKuuG1AWpQ6zvvKnPr1oqxXZuV1YBiMVeFTTlthQfNX/Hl7S?=
 =?us-ascii?Q?j3Pps7jAMvJU4+6O/1C0oE3r3mO04GlneBbB58E2gbSCGgjAIcvLTVSqVfLp?=
 =?us-ascii?Q?x0HRjjkzzpj3bJ+1i0OGIHaWo0liFILcn8DOwZefVOQhHC8LrubvmhrFc7nm?=
 =?us-ascii?Q?4RaqegJJPcOFaSjZYjZtSiySNSG3Rh0Ni4V6SseZcyJHx6wASV9VBt2FgFb8?=
 =?us-ascii?Q?OjPs1OJNBPaV4UM3vvIpv9HomuKOGsHjnY3b4e1kA2m1jXX4R3P4WtrvmWal?=
 =?us-ascii?Q?gAFpkwE6w+zns42GlrTg6/kphv4dNyJ8iHmJmPdfw8+2KU7q2Eo7ZnD7R108?=
 =?us-ascii?Q?8f5dxutPJDuoJd7vo11e7ofKi6YLokIJPqy3cuezq6D/9rQ7ZRYSD4JS5Nsr?=
 =?us-ascii?Q?aYzKs+1G5F8vv4nWvMto9jlqR140jz7dCpa2T4+q4hwQQeb8Nw+JpxhVPicd?=
 =?us-ascii?Q?KqcVxBv7yKKW6woT0NJsgSVdIu9pT10AidBzHdImrPPBqBBVmH3c6U5nYsls?=
 =?us-ascii?Q?0ITXrWegibAe1Y5QKHouSJpyo3Q/ZaADjDNW2PA1O23FVvV1ppVvaE9XTPyP?=
 =?us-ascii?Q?HLgTnDDBGp0lYm1G4DB9t+iFQwwKCp0hbHyAzMbGbeCndg2PoagaQxNAklw0?=
 =?us-ascii?Q?pz+YOwq/9aop+qS6L0aoiArvCTTdgMS3ZWGc7iqhUszNi8u9g6Vi7f37ZTb4?=
 =?us-ascii?Q?60y8XcR0gGtzd3/OPe5xME+Op1VQccCuIba9HZf5jNrtGMBFfTjPGLjwkt2C?=
 =?us-ascii?Q?wCW7nHcpAYQ5oCQV3UYf11fQarr3h4Dr/PLM1lN5+cLzLHlb1BsaOva0hIvq?=
 =?us-ascii?Q?8+YrzJmr99xH7Y0q2eG9x4BQ3zYsnlR40W/Mo340hpStPgk1YkLrifvSjQa8?=
 =?us-ascii?Q?W3vLPlYK9oDm9qpVfRVZBIk3+n7rlfVRjS0OpNT+kmQ2IsVq+rSceVxI28yb?=
 =?us-ascii?Q?QC+k8x54crB3nywmlg9ipVrvgGJWsIvEZ4j7V8VRC0owWwLMM/XbdkNYz4ZN?=
 =?us-ascii?Q?SL0SufXZkvKar7GD+SfiHlDRSqdXzhUKCnEgIqntu3/fGiCSU037SmuU14ri?=
 =?us-ascii?Q?FZ59amUxBeowVSYLfJ5GmNOmhGTAw8oORA07YR/J/wEeebcCLxDSMYtBfXlI?=
 =?us-ascii?Q?t6kpc3nudqHaA8Oh2OdrTknzL/qCqMIB6hvy56k3VXU75gQqUeLqLo/VyFEa?=
 =?us-ascii?Q?OMic1v4fus9XGo+6msTZz47ICJZ7ifbZ6Etc3SyqvM40xWbY86opkIGBgP1X?=
 =?us-ascii?Q?Xj9I9CfSt9Lwx66vBuQEoxYCMvPRqlvAlLSsJnmfCOh8/t7rEQfTIMDr5F7Z?=
 =?us-ascii?Q?veswBlP6tihiVm/fvtdil988sxSyY3zdyabDBaGRDkKYMBF6ZcLeuJMAVG7k?=
 =?us-ascii?Q?M59XduyzizD42yAsX+gtv0rAC7srFqqaqoRig6Qi8iN+P0YeWHjLA6uwwr7p?=
 =?us-ascii?Q?X4eh/bnZBedKhgqnvn+Foez+t7E7s7qVOZfsKLIjTI4A+MKjDVOUAiH1Px1d?=
 =?us-ascii?Q?kc/DNY8AFI3FPvVS+GCXbvywzoQ2sOIA1JvyTgM1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ac4f40-e356-438f-1136-08db5d5af134
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 20:02:18.0209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBCAcXio9zMh24ISFwvIJPWjK5f/cE/noBLPIt7ZnNI4OMK49Qf/WJFiB3ZxTOrMtQ/YhcQFJTKi37HMm4UgZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

Removes all ATTR_DSIZE_*BIT(BYTE) and ATTR_SSIZE_*BIT(BYTE) definitions
in edma. Uses ffs() instead, as it gives identical results. This simplifies
the code and avoids adding more similar definitions in future V3 version.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/fsl-edma-common.c | 21 ++++++++-------------
 drivers/dma/fsl-edma-common.h | 10 ----------
 2 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 839471c42758..659bef4a3b23 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -154,18 +154,13 @@ void fsl_edma_chan_mux(struct fsl_edma_chan *fsl_chan,
 
 static unsigned int fsl_edma_get_tcd_attr(enum dma_slave_buswidth addr_width)
 {
-	switch (addr_width) {
-	case 1:
-		return EDMA_TCD_ATTR_SSIZE_8BIT | EDMA_TCD_ATTR_DSIZE_8BIT;
-	case 2:
-		return EDMA_TCD_ATTR_SSIZE_16BIT | EDMA_TCD_ATTR_DSIZE_16BIT;
-	case 4:
-		return EDMA_TCD_ATTR_SSIZE_32BIT | EDMA_TCD_ATTR_DSIZE_32BIT;
-	case 8:
-		return EDMA_TCD_ATTR_SSIZE_64BIT | EDMA_TCD_ATTR_DSIZE_64BIT;
-	default:
-		return EDMA_TCD_ATTR_SSIZE_32BIT | EDMA_TCD_ATTR_DSIZE_32BIT;
-	}
+	u32 val;
+
+	if (addr_width == DMA_SLAVE_BUSWIDTH_UNDEFINED)
+		addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+
+	val = ffs(addr_width) - 1;
+	return val | (val << 8);
 }
 
 void fsl_edma_free_desc(struct virt_dma_desc *vdesc)
@@ -623,7 +618,7 @@ struct dma_async_tx_descriptor *fsl_edma_prep_memcpy(struct dma_chan *chan,
 
 	/* To match with copy_align and max_seg_size so 1 tcd is enough */
 	fsl_edma_fill_tcd(fsl_desc->tcd[0].vtcd, dma_src, dma_dst,
-			EDMA_TCD_ATTR_SSIZE_32BYTE | EDMA_TCD_ATTR_DSIZE_32BYTE,
+			fsl_edma_get_tcd_attr(DMA_SLAVE_BUSWIDTH_32_BYTES),
 			32, len, 0, 1, 1, 32, 0, true, true, false);
 
 	return vchan_tx_prep(&fsl_chan->vchan, &fsl_desc->vdesc, flags);
diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index 71e19e20f1cb..3991956dbc11 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -29,16 +29,6 @@
 #define EDMA_TCD_ATTR_DMOD(x)		(((x) & GENMASK(4, 0)) << 3)
 #define EDMA_TCD_ATTR_SSIZE(x)		(((x) & GENMASK(2, 0)) << 8)
 #define EDMA_TCD_ATTR_SMOD(x)		(((x) & GENMASK(4, 0)) << 11)
-#define EDMA_TCD_ATTR_DSIZE_8BIT	0
-#define EDMA_TCD_ATTR_DSIZE_16BIT	BIT(0)
-#define EDMA_TCD_ATTR_DSIZE_32BIT	BIT(1)
-#define EDMA_TCD_ATTR_DSIZE_64BIT	(BIT(0) | BIT(1))
-#define EDMA_TCD_ATTR_DSIZE_32BYTE	(BIT(2) | BIT(0))
-#define EDMA_TCD_ATTR_SSIZE_8BIT	0
-#define EDMA_TCD_ATTR_SSIZE_16BIT	(EDMA_TCD_ATTR_DSIZE_16BIT << 8)
-#define EDMA_TCD_ATTR_SSIZE_32BIT	(EDMA_TCD_ATTR_DSIZE_32BIT << 8)
-#define EDMA_TCD_ATTR_SSIZE_64BIT	(EDMA_TCD_ATTR_DSIZE_64BIT << 8)
-#define EDMA_TCD_ATTR_SSIZE_32BYTE	(EDMA_TCD_ATTR_DSIZE_32BYTE << 8)
 
 #define EDMA_TCD_CITER_CITER(x)		((x) & GENMASK(14, 0))
 #define EDMA_TCD_BITER_BITER(x)		((x) & GENMASK(14, 0))
-- 
2.34.1

