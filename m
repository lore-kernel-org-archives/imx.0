Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3874124142
	for <imx@lists.linux.dev>; Thu, 25 May 2023 20:02:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLGul8ILvBSvDGHijRxG2Sw0v/1hnHGCy830fblo5ExLbQOopnJ5XEvJ1eVrz9975aVpOpYy958IPZB+M+lApCUstgh9a5tI6FWQwMjcV8D3EtuN1QXc6tHoF3kzWa13uk7i/x+KY379YdV46EtU49rntz8kCvQxYDxm8D1MKe0fY6YTTOPIea+nwYE5l0AJLyaYCLMnIERMKWDI/UtAxwxRaPddYSW9TTP7q4W3Zk/w5KJDmYgJP+uwJlfJwWkEcmoVta/Y/oQRHqyJctckze6cTIE1fBpPsfdATrs9EmaJVZ9TYvfmcbUre6aaV/8od7epoPkwzOFkQtDtUnPGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouCBlwm7fIzHEcTW7UBupyDePR7cnWUmtikSOmu98+k=;
 b=l3P2Ak/2XWNZdICCTYITokqHs1C2RYE1qqtjmDE6fjUdlrJKEUvmjfIKMNwCJkEoSoRe7pKt0AXdzDn2BAM3cXAAKLvYTwJcNY+x4BJpzaHDzhrrrjkuWIC5fo9gUWEzRL3JOCcvfdfXaBU1wPxWBToqcm0rXTTVXbl80QG3rhLyw89zn4Dsx3EZwbcqOanjJTJqghXa97hShy4mDH5fiowFIb13mDGcqybjOY9m1lZnf6j8kUNv++xahAhSNxoDeOPaeOoaQwZOiLVcKrYVla7gtvT1oAe90u3B2wnrlLFCqz37OXvlLedcXI1ibn3+lvCIKqoSjcH/WSABsyjhiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ouCBlwm7fIzHEcTW7UBupyDePR7cnWUmtikSOmu98+k=;
 b=XP1HMcN3i8BROHYTyrKYh5pPCQVGs0dAldUhr+/sWt5+YzFIH+IDOJJellAfikRRE8Epk4V1USdIyDQZmwIzIJWLoHI9Xgl5BxJctsUQSVgDzlotuYnwvA97sxn3JB0gZeHY4JyHbGCzAGcv3rWdkylpAS4LKiyvtEmdrdkOeeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 20:02:14 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:02:14 +0000
From: Frank Li <Frank.Li@nxp.com>
To: peng.fan@nxp.com,
	joy.zou@nxp.com,
	shenwei.wang@nxp.com,
	imx@lists.linux.dev
Subject: [RFC PATCH 04/12] dmaengine: fsl-edma: remove v3 from enum edma_version
Date: Thu, 25 May 2023 16:01:40 -0400
Message-Id: <20230525200148.1015154-5-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8ffc0c62-7501-4f3c-be78-08db5d5aef0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g/RteIov5wG0CI6O57c5NbhPeCc1tTkHj/HXwEQDlcFY2kWm580XvnsrzTrEkOkzC97tBr97vzH34+lGw9AmNq41QrCFq/yP/Ov4mDXSrXv9HTCx6pQCQ07HYuwWmVQ9g/qsDiRT+/2YAmKM4G1IRggt2E/FsA5g/SR1JKl5IAxvptHCAgfs6xvnrYd7YE2sEJ/fYB1pYC6rkudKQLLk1gdMyxDwQvUAzN3wfLm1Kn9lfTaQsKG60K7uXG/DeqYaKvWnkH/sK19CDpJbuMLKkIY2r2ZrALrbyjhhvcdfvxLCJK6S6dNja7Sx0QMCt59YAeHRpuMifa9zAKFosZUqG2bg2VKz+tON0qrpZQkjl9iz6Y8fCLL9vgoRrkB384b2fNjByuX1LY8APW3wnA/B/sBBmBN2Wjau2f9JAKVjEiqDMuydWLJP+rDxlgNmGGrlXWaSByZepWhzE0uIR2Oy01cLpJH30ys4n5dbtnJhqC8IGadGrIf8DnwA8NPaBVtSGSveQE/byzum49TVUfST5k8VI4MY6zow9LUvhfMP/5H07y3cv8DJNyF6kMqtCuJFTBZTewsTjEca867YWdwqHN8D4VUmIOi+jHIO4fkLPhFCfMIGque+AwBdWMyA6Thj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(36756003)(86362001)(52116002)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38350700002)(38100700002)(1076003)(6506007)(26005)(6512007)(186003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3L5n2orA/K0G6P0sMbaIFHZl/OkbJshqQYn0OPiTyZFb9CMFRq8RTab8YFQp?=
 =?us-ascii?Q?h4Q/nMZPVg72jdvKOjHOcKgd+iBU5sKbfXITjjW25xkAJNLCm5jLr6OVwkIz?=
 =?us-ascii?Q?RCKNaz5WO/Y1CvadFypRp39cbGniDszNxJCG1RYqBvv5XXULXD1sPrsk76Y4?=
 =?us-ascii?Q?x5fBqLktPnRJaKSoOGxibIwperqEdVpNP69bN0SUjJED3JpAlrM7FWzJyzDo?=
 =?us-ascii?Q?1VrXvRjoy3qO2RN0oEs4l6Wx1o7vr4Cb/zFe61KOL/erTrCzuq6QE2es+FfS?=
 =?us-ascii?Q?jWy+Dk79MSsAjqc9MFN9tAJbG6p08F2xGMNZNo55GutY0ZAm9V8wJtRFBDu6?=
 =?us-ascii?Q?wheUxkkJGZFUKewtzobwqzcAeTR6A5P0fqb8X7sBYP7qnBLuyuznbvhlaQ40?=
 =?us-ascii?Q?YX50gINkePbdvas6t79236becQkDZxIM9lnGPz6f2jeijVkafVYYOR4GQkZT?=
 =?us-ascii?Q?Ec4iWhL24emx3wcI31j5bLdw+yfmV+pRnk3RIQ/wHmzMevyuwUlSTN7ixvP0?=
 =?us-ascii?Q?oxT6x9dUTG3Q0Yf5oghuUig4Uxsj11fGbvG44XeeqDBoGyLOjjU63sAO0kJx?=
 =?us-ascii?Q?OHM5RvWhs/L6nq2PqGodMWanXGZrgu8ykwDov2irSTCXYzMJmdEMliOrV0Lg?=
 =?us-ascii?Q?FyHKTNYamnwuFtNlefbRKYkEkGpoVrTwqT4QCK51JZSYLqlST8dmWGAJTfHa?=
 =?us-ascii?Q?EIIE7DkmzNJRncXPWsTPOOrIswKKuOTJtoHkdivebB9+6EtE9ekKBd9dhnku?=
 =?us-ascii?Q?js460Q96oX65hqjKIV2UCLOnaCv+ncHAp6spWLcsGt1owhUA2vjdtPEXdeyR?=
 =?us-ascii?Q?HWbT7VwqG1VrhLNl7gMosTIfY9qBUb42bDFQptAZkPiQlQUtZfIr+7rhAoQb?=
 =?us-ascii?Q?6HI8wASkXZBfHo2CzdkI1T1O8fu27Xhr4PDNpoSEmdQwYZgpUKhEdgYueXyM?=
 =?us-ascii?Q?2ByaDN1dvdwdARgO0ujhtI5lWuyB0Ip9XkeSWmTMkM1EbbmhGJ55ah/UoNE9?=
 =?us-ascii?Q?LX3Twy3I9Sn5x52+56byahGAb2//S8Hh+O7A8Frlj/+ac3LUQe7O2nPGLeeQ?=
 =?us-ascii?Q?3qy2vjOX+/74QFlxxhl7hbyMGPepXIJ2gUGTQGz85wzLoYilUq8oUgYGH8Rn?=
 =?us-ascii?Q?NUehitK9/86JjI02L4TeL34xx+hCsGyWSjWqoH8RXuNWxKj2pdnYfg7/UD/5?=
 =?us-ascii?Q?XgFMLkQqFoAlvh1C1zrem/hBn3ZElyD0+3rx2N7z3b65lz8yn1sKmpDSthN5?=
 =?us-ascii?Q?fqMv6Kovr4zDyNjJPudgTCTs2mpN5f1e2jxvN3F8MXkZXoDqxEezd6vtfDbg?=
 =?us-ascii?Q?OcCWfnimcFucpqOtYmORyrTFh3Oh1URwNA5YsDn1AJ2syz3e2y0iHCmd7Lzb?=
 =?us-ascii?Q?E2lXEjYRpOc/Gu3sN+ED1H+r2ipWrLz/2q8SjsWmIKQksW3eB4bWBSymkfbS?=
 =?us-ascii?Q?XfxZE/rhJCQ/gRaIWpHnmRm6DyDvWMKokfdRsuGxcUmh4YTL98hUtv2de16/?=
 =?us-ascii?Q?MVg4nnkkA8RAoKzKOw2lDOKx4/F+Gzea+kgcdTOeJ6f0sdeMMb91xHqlXNj1?=
 =?us-ascii?Q?u4ADJOQGFHSkYy3E8um9qJmh0ll3keRuaWZutUiH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffc0c62-7501-4f3c-be78-08db5d5aef0f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 20:02:14.4351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrgmH29pcVYnF5iXgnwOH/DcteSEQpED4SSX8BXc0Kda3TFs8qCkpzeYB/moiq5D27fNqdp99/9zdYQTeBW5gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

The new IP of edma refers to version 3 in the hardware documentation.
However, the presence of "v3" in the code is merely a software indication
to differentiate between certain chips. To prevent confusion in the
future, this commit removes "v3" from the enum edma_version.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/fsl-edma-common.c | 2 +-
 drivers/dma/fsl-edma-common.h | 2 +-
 drivers/dma/fsl-edma-main.c   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 10dcc1435d37..e5c7497c1ff3 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -120,7 +120,7 @@ void fsl_edma_chan_mux(struct fsl_edma_chan *fsl_chan,
 	muxaddr = fsl_chan->edma->muxbase[ch / chans_per_mux];
 	slot = EDMAMUX_CHCFG_SOURCE(slot);
 
-	if (fsl_chan->edma->drvdata->version == v3)
+	if (fsl_chan->edma->drvdata->flags & FSL_EDMA_DRV_CONFIG32)
 		mux_configure32(fsl_chan, muxaddr, ch_off, slot, enable);
 	else
 		mux_configure8(fsl_chan, muxaddr, ch_off, slot, enable);
diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index db137a8c558d..2f13e687a721 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -141,11 +141,11 @@ struct fsl_edma_desc {
 enum edma_version {
 	v1, /* 32ch, Vybrid, mpc57x, etc */
 	v2, /* 64ch Coldfire */
-	v3, /* 32ch, i.mx7ulp */
 };
 
 #define FSL_EDMA_DRV_HAS_DMACLK		BIT(0)
 #define FSL_EDMA_DRV_MUX_SWAP		BIT(1)
+#define FSL_EDMA_DRV_CONFIG32		BIT(2)
 struct fsl_edma_drvdata {
 	enum edma_version	version;
 	u32			dmamuxs;
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index f5cf95d185f8..31531b8bde78 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -238,9 +238,9 @@ static struct fsl_edma_drvdata ls1028a_data = {
 };
 
 static struct fsl_edma_drvdata imx7ulp_data = {
-	.version = v3,
+	.version = v1,
 	.dmamuxs = 1,
-	.flags = FSL_EDMA_DRV_HAS_DMACLK,
+	.flags = FSL_EDMA_DRV_HAS_DMACLK | FSL_EDMA_DRV_CONFIG32,
 	.setup_irq = fsl_edma2_irq_init,
 };
 
-- 
2.34.1

