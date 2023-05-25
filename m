Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9B824142
	for <imx@lists.linux.dev>; Thu, 25 May 2023 20:02:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMbnVMmW6uQzh0FPjHYwgzBW6SpN6fHufCflT/2zM5tvuN0MJGSt39cAdhW0vLkmIY4TzXE4mKnuWyATUzQV8E07yZIjiFZgSO3CYwUODlxo2bwzx/Eh4BgTKdkkmF623FiejD44qZXP0d3QWUYnRoQ3ikSpcWaCM8tZcvfkbAS0GbO0EXJaZiwjznbkiCTqZITbW4UbkBmpoCzapRa85y6u8KoPcVu8XXXwpSZ8zvOSa8dbWw7hkVvQHGYpTD11p98yjGNBUmMzBBxJ88Opt1QPmXYnupecfXCcTojyh/+W9HGhr/o8YN2GBVBXTihieBjdSs6EnoAInmncxSQqHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5IwFxfjsLIuwWG9lLuAPQ9Ft0G9NDt16kTGP8ogl6Y=;
 b=eM0kdS13fXqbrC4Xn+561VaNbfqaPWWP+r2AV28JBnZGXYRckAlyE3/wVcB7vMYhIvSKO2fe9l4rNVkThLwwF7rVjpk1+f9qudpVFg2qliM5gNROqAenLxPBbjl0V4phDxgrMoMte5reWAU7gf39Nuz/b3lXVVP7t2RMB6wU9PunBCJBlF2PdxKGG85WehrWghOtKYHDB8KaPP0moKC53nB8XoMOs1xVk1VzqDjE9K2Zt8bnoqZfrEq9RVPHN6e3Z2dapsXDLaOo1nlbaGIe0dAWiMuP2dO8Er5yVGOWOaXGrwlXMrB12yuhnSUNnbc8iJ6W+T9F3Ol720BgBdSHLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5IwFxfjsLIuwWG9lLuAPQ9Ft0G9NDt16kTGP8ogl6Y=;
 b=BN6qzg+Ilu0oj96EErJNZg1IlnanB6vT1wPndZSjdgqoy+IrTEh0j5gKnj7SP4ay3oZHShGXmynyot+duk/tc7+uHrXgC/BIvwuW7FGOQyB+RP4sNhs/J84rFm2GmhiyOWq3U1GtQmkzMTqsxtZ3lWWtOosnQOGn6+xVG737MRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 20:02:12 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:02:12 +0000
From: Frank Li <Frank.Li@nxp.com>
To: peng.fan@nxp.com,
	joy.zou@nxp.com,
	shenwei.wang@nxp.com,
	imx@lists.linux.dev
Subject: [RFC PATCH 03/12] dmaengine: fsl-edma: transition from bool fields to bitmask flags in drvdata
Date: Thu, 25 May 2023 16:01:39 -0400
Message-Id: <20230525200148.1015154-4-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 510cbbb4-ddca-4f3c-a7a7-08db5d5aee10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	55v5aQWAJlEuJXSUt1ME0YzNwdb95A7mYeFLs0vKIlvnCpZyLQrcDrBtblNERt2XtiJkcMtJpHLfA2kILbJBpoIYLlVLTWTxIn5XOY95+2aiIHD/d2yuUEEHvbIyH0fBaA1fRqsrZrRdBdJgYst+fI6u221efARx3+SiNU24cOikhk60sF5SygHSqdr9B3mPHepUvKFdjL0ofcxgscPw4Uo7uHFr5J1DDzKuzjZ3BJhUtVeKW2hofsS/aDgCP2scp5piSi3UrdwtMpRCAUs0vFh956elThLnZ6uYTbbmv53evIp/CcRLBHDoklhsNGaBn5T9VKMa9f1tUVDVEYO3fm5gxDmuxQQHuyUQ58dnWbCDVoGJdvWevlr2obkCO8/U4i/ughRNrQLqScfjCcJgZpiDmqHqZajjhYtSNmF7UI+OJiCgZ//RKQpsfIxpt+HrWvdRXTfecPUcnzEPk25jzupoIICHxO68hLviQ/pUkZVS73ccHzOEwjNZuhzhPCZ+gmaIRolYRGvMk7p3/t4+8GPDDSTWdhBZuRhcIW9edylRJ8MgFfJGcXpKpPGlGZ1L8KoOd6A4oPSKaEt9AVWFuMK4sTOsvmudllY4TjRDd41bWKjQEDZsgbv38EPirJSY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(36756003)(86362001)(52116002)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38350700002)(38100700002)(1076003)(6506007)(26005)(6512007)(186003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CTDL7HEhdPBeoDcYj9EXC9vsQakmmavmuN5Lth/XlY5y/wJ3SnWjphEmsfUd?=
 =?us-ascii?Q?fSYP957ZXjd/wbFjJcsFxnicmkvlXRIttbgN++6ilU+1TPjEOOt1vdz4L6QC?=
 =?us-ascii?Q?qjZgv2aPB5PEMgI97mzy+a7avX7OdGZ7dLrK/w0P0OP4b36749FOoL9+VjX+?=
 =?us-ascii?Q?E0ZYqgIkoAjKsPj62cp2nevdCBOoTlLykJu746pEiRP2oXpyiZd7CobaPRyr?=
 =?us-ascii?Q?QeZYNRBBZ4UTh2m+JnTDR2p1dMhHd+tivIWrx20m8cs65SpqapDozmEMalft?=
 =?us-ascii?Q?1QL0gQOSBwJZT9Ae3iBouJy735gfiEU90t7FU/YWRxq1VusBM0jR5RGwaF49?=
 =?us-ascii?Q?mvt4KKFQrzzJoCIOvMzgEND/2hVYcqRS2m34kJxc9Vc+9unePE93505PDpWz?=
 =?us-ascii?Q?icdk+oNmtA3jU0g0SioMzxAlYFzlbiCru00QMHOYHdwBZaiuYzZK7qUdn+ap?=
 =?us-ascii?Q?nw/B+6ORqzezjJ1Iw9P8lVYOOB6AazC+6/neJ3S6/vxWTbFZvk307mc99uXa?=
 =?us-ascii?Q?tsrNMVWEnKUIC3dV9t0b939r8xnDmkxaaDhM14lQadjSa+73VUZ3gwGmpieF?=
 =?us-ascii?Q?2imIYajpNZj7gJ/Zh6+UOT5SPaaMt0IMx0YTJKGlf+pigRPFAjWhoe4v4LAR?=
 =?us-ascii?Q?cQR756X16U7ZqVl1Km5bIDSCBgxk/NlQG2juBOYTsBsx627S5vw5O3aZSpAB?=
 =?us-ascii?Q?Ui2ibavxZbaCCejd3XIGGndWWjrjnB37Cdd0pAFIDD1KwlJtt2lI1dXwHdD+?=
 =?us-ascii?Q?bb4Ol2NZJJ/Jbb1azBOzwm/5XDYy24EBSKUi1kAKc4cF7qeK1QiFxxRrc7yb?=
 =?us-ascii?Q?1e62z2XQnTOFnQggTp7caFF/nGUwXvND58DBfYlvIO83cl8Fkr5QTzvlM2UQ?=
 =?us-ascii?Q?5Gb3yehUupgRwRNNyrTcXH8b0U187sIrjGayHLxsg3oQv4f+HCLPK5+Wik+v?=
 =?us-ascii?Q?Kl41Ou4Uo9cSULuGwrRpxNVdtAGweFDXVeHYjtiL96YKyR0MWpZFpJBg5f1K?=
 =?us-ascii?Q?CxG2Wf37jojnZwiyk5BKXhfTO9ZmQx3Hw1xbqav+2JNWixRtmaheX0BHyiAI?=
 =?us-ascii?Q?OMgQJ7Vmg97xIIhkO26VyIDbudqyXqqAM7GGUIsCbx2Yw7XOgz3i78UQm+OZ?=
 =?us-ascii?Q?rf67LDR5ktmOIzkRxhz+6ai9KfES7iRqWu3+YRaWuYfgHvLb0jufzA797sxo?=
 =?us-ascii?Q?R3/kn0zBU5hqipLyIeoG+ycn7nfWvjha28/HheifxVr/PXTWn4dqUd8IHNn9?=
 =?us-ascii?Q?W9F8wdzsZChu1NZhAG+MrtNUyuokDXzBXhyE17zFm2qPWlAHmiu6cyp4GpQJ?=
 =?us-ascii?Q?GRGgZnNkvVs9NpvXojiRyWMx7uZ69Q8OMqyTG/nQm32aYJrgKLdfUyr9VS+r?=
 =?us-ascii?Q?VqFuB0fDmue/GXd3UUKmtRl3WzxqCggRHVbJSAyvhjmrCZM08d0NepaRX2ZU?=
 =?us-ascii?Q?ptIJEwQU21boxWjDZac7cbsBORMjAtfln3NANSyxnY2bripZmBpYKdHv7Wy3?=
 =?us-ascii?Q?p4QeIEUcy6KgDIodjkactRzbJqWw9fNFKLgQjHbxFUFz0QwJSwouAr5Bjv4h?=
 =?us-ascii?Q?lcNO7h09uNrtiJbbm5kXpOnrhHnnMWVzU78sLZgJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 510cbbb4-ddca-4f3c-a7a7-08db5d5aee10
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 20:02:12.7567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRa/mfPrr9b4x5mrD255GpCf7Db4FYntPZdfvk7w58qQIWPWmpNiaaAISfh8FROZbseF4gNoFtL9dk9FO3Dhyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

Replace individual bool fields with bitmask flags within drvdata. This
will facilitate future extensions, making it easier to add more flags to
accommodate new versions of the edma IP.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/fsl-edma-common.c | 2 +-
 drivers/dma/fsl-edma-common.h | 5 +++--
 drivers/dma/fsl-edma-main.c   | 6 +++---
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index ce8d7c9eaf77..10dcc1435d37 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -114,7 +114,7 @@ void fsl_edma_chan_mux(struct fsl_edma_chan *fsl_chan,
 	chans_per_mux = fsl_chan->edma->n_chans / dmamux_nr;
 	ch_off = fsl_chan->vchan.chan.chan_id % chans_per_mux;
 
-	if (fsl_chan->edma->drvdata->mux_swap)
+	if (fsl_chan->edma->drvdata->flags & FSL_EDMA_DRV_MUX_SWAP)
 		ch_off += endian_diff[ch_off % 4];
 
 	muxaddr = fsl_chan->edma->muxbase[ch / chans_per_mux];
diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index 004ec4a6bc86..db137a8c558d 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -144,11 +144,12 @@ enum edma_version {
 	v3, /* 32ch, i.mx7ulp */
 };
 
+#define FSL_EDMA_DRV_HAS_DMACLK		BIT(0)
+#define FSL_EDMA_DRV_MUX_SWAP		BIT(1)
 struct fsl_edma_drvdata {
 	enum edma_version	version;
 	u32			dmamuxs;
-	bool			has_dmaclk;
-	bool			mux_swap;
+	u32			flags;
 	int			(*setup_irq)(struct platform_device *pdev,
 					     struct fsl_edma_engine *fsl_edma);
 };
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 16305bb9a2ef..f5cf95d185f8 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -233,14 +233,14 @@ static struct fsl_edma_drvdata vf610_data = {
 static struct fsl_edma_drvdata ls1028a_data = {
 	.version = v1,
 	.dmamuxs = DMAMUX_NR,
-	.mux_swap = true,
+	.flags = FSL_EDMA_DRV_MUX_SWAP,
 	.setup_irq = fsl_edma_irq_init,
 };
 
 static struct fsl_edma_drvdata imx7ulp_data = {
 	.version = v3,
 	.dmamuxs = 1,
-	.has_dmaclk = true,
+	.flags = FSL_EDMA_DRV_HAS_DMACLK,
 	.setup_irq = fsl_edma2_irq_init,
 };
 
@@ -293,7 +293,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
 	fsl_edma_setup_regs(fsl_edma);
 	regs = &fsl_edma->regs;
 
-	if (drvdata->has_dmaclk) {
+	if (drvdata->flags & FSL_EDMA_DRV_HAS_DMACLK) {
 		fsl_edma->dmaclk = devm_clk_get(&pdev->dev, "dma");
 		if (IS_ERR(fsl_edma->dmaclk)) {
 			dev_err(&pdev->dev, "Missing DMA block clock.\n");
-- 
2.34.1

