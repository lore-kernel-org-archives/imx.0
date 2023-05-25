Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E19124142
	for <imx@lists.linux.dev>; Thu, 25 May 2023 20:02:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BV5yJT9rrJYXns5gg9Q4Yk5P0k/lnM8Ngo2x3dI77SjkVtmoH4AFk5ipwzVj4hwUvs6gLgUSViF8YP2+BExMy50k6yge2/6VQNJ88YANkaP3xDiDUdwKLhsZyIp6p4LNBiGgzftNriTcJTzRXdDdmf7cmBQr/m3wxOFlJIRGjM91pl+u5JW8j7VqjhYz1vOjPly5HLWK1O7XrHS3IM61aAynS0YIfuKn2NFDoLFR2lqv7UuHZLPOMYiE3BvgtboKVNghOHZG3YnwmvM55dQIkOiFwZm9BowKxjEv1FsZv9QNiESjq3GAwB5H6prVsEmRXCII3d/j7fea4yTgF3bPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISKgrdPrxzKwoDu3CGTHqw8SLWtu6pWcUHBCYREGJL4=;
 b=ctd+guaIuHtcyne5cxik05nkj304rd+O7O/7KUYBLeZ4nWSyXeyAvdgD4k8PC8FK8soMb3tEDDOPt+AbD/TmEfgzpJgoQr+3aITmb3pXyFRZ9gSuH5pGQuyqnAeDOJhYbet1cLgeyyX+A9dCDrK0c+N1JeJ/095g1eNgTYsepksbIa+ynZ5w/6iCI/lrotdCFMrCvmPhTBVkr283fcmLVrUG/Ix64ujTGQRLUfo6pdMk3/vwjAsa4iEnVqVDP4ZLctBJhf4sbOZV/3sXk4MdRUCfiKv0kKpi3a5NNsDUyphcRF0JqOJXVdfnbqLIECQMNr/lpSo01tSHvLQbZfW2Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISKgrdPrxzKwoDu3CGTHqw8SLWtu6pWcUHBCYREGJL4=;
 b=q0he+A/Xzd1FWUJSBnCwh/pJFpT0gMHppEyqek1YfWIhvGt+l3vnTQKrYx+RCGcFnzl557HwJUEHaHMrJDRkjmmViLq7O/ufpo7m3JrbnS6SZT0J7y38DebRLJsPnqJw+PNhIObyLRuIBVFKdp5Kkctd/x4K3UUcq7An0DtGtCw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 20:02:23 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:02:23 +0000
From: Frank Li <Frank.Li@nxp.com>
To: peng.fan@nxp.com,
	joy.zou@nxp.com,
	shenwei.wang@nxp.com,
	imx@lists.linux.dev
Subject: [RFC PATCH 09/12] dmaengine: fsl-edma: refactor chan_name setup and safety
Date: Thu, 25 May 2023 16:01:45 -0400
Message-Id: <20230525200148.1015154-10-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d0b30737-e79d-4573-1657-08db5d5af474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dMvLzssyNucaCwC50Vpc/kz7W81tAdWUgN8Zn9fo25FZ3gUOU3DThzI1K4ushQ743bzNvN+u23iieTSgBsCeRRL53b9WOGqE2P7Q5b8GAUWypA67mgKC0R7lCLfFTnJv+XY5Un2ZADZBeTw7a0P1JK3M7Pam+99mE5XVJZEnRsdh89ZxGPrY1GY46qXIitHS3ObPfbilZpdAim4QjGkI9JDred1BdyrHTc2Zy+c3pVjFJXP8lP1882j6madaJFpV1HXuZ5N5QR4LxRWvJ6as02aHdD0h0DeCOATk4LsQpl27r3SXvzE329RX9OiDMKNsqzBA+iRMl/2V2BhCxW0mzMUUIjvRfCWbffU2j6LM0LIQAXWAz6MQNOg/kQRvXq0B3CPm7tY4gOgqD9n3qhXDrQA68RQRG/dvRiiyhVDH3Ia/iY050DE9XJSOBi0bQl8TRyVryTTvRjYI65/FmVilDsNjIH/rAkUC0N4tZtV85NaWQ/TkmfYOMT3/lTD7AjPcpxk3dZckNps7Bh4xgzuSpaiXwYDf3H49scgJh7/5hsTLlsOLYnVl5S/Y2VD8UsPu7eLfr5ZybvzUpmDDg6vrKs6QU3N0S6SLGimcSCZQWu93SNvUwH8TQCdispFcrd07
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(36756003)(86362001)(52116002)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38350700002)(38100700002)(1076003)(6506007)(26005)(6512007)(186003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7w2ie5vBhP8g6ivfB6X+8vJMwR4gBaDnTmIpgWbT951KNyRSKJzBU8oCZqvQ?=
 =?us-ascii?Q?CwGI/QrNzrW9kg3rz+3sjxBr2xaIEAx9o3AS+p1ArImcPbskPEg54L8xbnhY?=
 =?us-ascii?Q?qAfNYuIxgnJhyg9rSXla4zfWO3k7X1Hcwy9MXeXUwIBmnAkyYZAZnMfXqIVE?=
 =?us-ascii?Q?8hxF8JXuSdvdCtA1T8zOeuq5lEgpg+zkEtNT7feChHZQKd6Sex/3CYmW9aAZ?=
 =?us-ascii?Q?1rJaWdmvUZBwAWCH0GkjucOZL70FI2kEIQNJvcUs2iPIlZkwZ7JhTLo4CSZC?=
 =?us-ascii?Q?FddAAJFgAvB7tkiKrEzuB6cb3ooV+bdJIm8c8No13C3kB4ezP0Z4wSYozVnK?=
 =?us-ascii?Q?k5lWtOOQGqbBJr2dnbm6BIchZ5vSKlHmTbvzmB3dhm2kOfvjRjOP9YT1GjdZ?=
 =?us-ascii?Q?xF3z//gri7Ct1XuoFlZuaPc0erzsNmQU1EbKenLE4cqkI77nmiurrsEh5Cs8?=
 =?us-ascii?Q?slh0hFMYxOCn8i1lqxQCJIz6RbpSGh0nIPjzfE5aPnJJPWwEZRH4liKOTG2P?=
 =?us-ascii?Q?UZAZrhlUvN6CLDeghQRL92utNeLlCWHStbfAH2p9kXXBrwRLiVtcEezje2gY?=
 =?us-ascii?Q?GbX5icN9zXuc+29Z9DEJqkzqEiHrMcahW8zI1FhQQcStfsKs78h/lToptof4?=
 =?us-ascii?Q?FFzn0T9mGaRH/5usPcXrig2DX2UzBwDAPKfW6LSR+engeRdL654qO9fNxmYW?=
 =?us-ascii?Q?nIXyhFQlpOanrDWaIf8/1bemHbEI3IYaZsHte8gkCNGr7QOLFfycCwb9CmJA?=
 =?us-ascii?Q?UoXJgvJ1ngvwfz1Sa5jWVdaR26DsHlZRL8xAaAgik4K3TbCutPZbXyrtzSk2?=
 =?us-ascii?Q?3rF+kHacWwuWVN3XighP6TL7jym1FUDd+HuJ/T9BMOd9J9pd6CBWCsw7qeJi?=
 =?us-ascii?Q?60x6RgjRFBlIMaGKZMvXuJSbkX8F5BHBglV4OyA6npllVxSj1xwx62j9a3Wb?=
 =?us-ascii?Q?xh67B5wX/avXMeajdekQ/xElgCsM7i7/DqqC147usjlp7z2Y4ZKuQ3QR+3m3?=
 =?us-ascii?Q?a9ZSMQ+j5lo3fVhlbqRv/38vClDhyclgCSN+j0mVen0MeGBmLyy+SI6D0JHt?=
 =?us-ascii?Q?Im2Vy4WQmSFutwXS607pwmvydZDaykVBSdAXbFmEBJ1l9Z36HjqE0ili9pGj?=
 =?us-ascii?Q?lgNGuOhzw7JxH2VX6ACqLGRsCDjnzSwegxgFI5lkrdGE9HWZzeEGitj9fpGi?=
 =?us-ascii?Q?5Q72m+5+7YDoEzLwnoB+FSJB5hsEqXUp14MjvT/jQUsoek+XXfi0HzLlT8Jk?=
 =?us-ascii?Q?LSxCbuzJ2hWKxWkLP21JSaw5+KQ0d0U1dLSgb+AEzB8V29Yq6VlW4wrZHIdH?=
 =?us-ascii?Q?WIRq+8ukdnawYkbzhqhcBuAtw9fAZQRKegX7DSAR49RnRCdvfd+d0J+r9W1o?=
 =?us-ascii?Q?GyfXcmO4JTT13keJ1XCzgHm+iN6R21NWhyfzU3Jnocb1H8irILhsuKDhEVnZ?=
 =?us-ascii?Q?Oqhpsx9N6rHUwrpda/1/b3Me8x7/tLcKJxBWdMBCHRGbBzLQ0bGOu0Hg65Nz?=
 =?us-ascii?Q?KPZZ7Z8UlCZzZbL+u1ikag0CVi7ghaFVkzEQsQ7ddSbfI7VQeFy+pO2M5iKe?=
 =?us-ascii?Q?QxNUyURzrZ0WZzmA9HBUNsLVFtF1ZQu6PygcL5FN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b30737-e79d-4573-1657-08db5d5af474
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 20:02:23.4999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zuxhXFHnNLBSI52/dbTwZL+j0Knhw3LPJ6c1m9iZ5OLr9+Fi8uYjk1/XOir9Zy4NzEua/3OXs76LsQaty9ghg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

Relocated the setup of chan_name from setup_irq() to fsl_chan init. This
change anticipates its future use in various locations.

For increased safety, sprintf has been replaced with snprintf. In addition,
The size of the fsl_chan->name[] array was expanded from 16 to 32.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/fsl-edma-common.h | 2 +-
 drivers/dma/fsl-edma-main.c   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index 3991956dbc11..39b5f903ba87 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -116,7 +116,7 @@ struct fsl_edma_chan {
 	dma_addr_t			dma_dev_addr;
 	u32				dma_dev_size;
 	enum dma_data_direction		dma_dir;
-	char				chan_name[16];
+	char				chan_name[32];
 };
 
 struct fsl_edma_desc {
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index cd734779f2eb..722ebecdc894 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -175,8 +175,6 @@ fsl_edma2_irq_init(struct platform_device *pdev,
 		if (irq < 0)
 			return -ENXIO;
 
-		sprintf(fsl_edma->chans[i].chan_name, "eDMA2-CH%02d", i);
-
 		/* The last IRQ is for eDMA err */
 		if (i == count - 1)
 			ret = devm_request_irq(&pdev->dev, irq,
@@ -305,6 +303,9 @@ static int fsl_edma_probe(struct platform_device *pdev)
 	for (i = 0; i < fsl_edma->n_chans; i++) {
 		struct fsl_edma_chan *fsl_chan = &fsl_edma->chans[i];
 
+		snprintf(fsl_chan->chan_name, sizeof(fsl_chan->chan_name), "%s-CH%02d",
+							   dev_name(&pdev->dev), i);
+
 		fsl_chan->edma = fsl_edma;
 		fsl_chan->pm_state = RUNNING;
 		fsl_chan->slave_id = 0;
-- 
2.34.1

