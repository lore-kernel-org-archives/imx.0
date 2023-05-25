Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD5524142
	for <imx@lists.linux.dev>; Thu, 25 May 2023 20:02:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7JZWKNd8EEYobNhz0fAbXPs+9oYPGPOkzoQaFgeFdSQqOFvi5xQG63pmdQQPXysH+sDYX1zL02Zc2bOasiIjcpl8mxGTuCozstbki8aKil3JowY/2sdE39BbICF9zUSrZVXoNWpHmL1NOFL0336h9XlsyJGIBkVwKzPyX8v2ZZ/E7nKrd2hLyPtI5mWF1DGDEihUxW6cCwjQB6WBKlKRNuUqfzaqqNSPim3b4K/1aFVnkN44e8kJCH0a5wHsTUr5jYKLYeaqTPMtujVhPUXUQS9sc6oOn2b3apXlWw9qB2K20mMNx7MlZC5lgW5dHffwpWIwGelQYGCJ8Qh436fcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toliOa1Ni5BE7L0tZ2qu+bbIW1QVGvNuK84B+H1Qylc=;
 b=nmLXEde+CsqlthsE0VwvhwtVM9OoJEHk5HTArDq1MxEhyEaN5vMlZ5Alm1RkYx+Ti9x8/+H14fg8D9P0IlTWdrWYJw2IN3I9onWL+brbNugiSUfksinLIeVlpmiyTIQ+QYG6Mv44tryhDZQOuntUlp27HM2dUH8U3FFMcZkXxD2XTfKbIibYadsK+kG6uRdAHXihLHR21DZuLHClBUPGMi45xz1tCo8xoUTixpJ4R4mPAQtYfsI9KCu9UKkMAc6XdRtzmfYQ7eEFfpxWCR8J68WRfPo1y2lw8Lawu5t0r+tzC8KogghYVyeWwlxAsEzR1AZwOl58nIqxmx1kwAfYxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toliOa1Ni5BE7L0tZ2qu+bbIW1QVGvNuK84B+H1Qylc=;
 b=rVGnflfP5PPKTh/5SXLeh8CDbLqW7VLXqlY7nE1dBL93tadWqAkE3Ylia3/0ixIA+UcE8M02vOuj1jU3HpKEN97PYxzSXsYLPLrFz4WTiH0jUhBdM1AlMv5pgjBycRmB6nr2a7eQOFTrt63ZHvRT8Eo8tn7hTgBT3qk3ZPq3nRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 20:02:11 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:02:11 +0000
From: Frank Li <Frank.Li@nxp.com>
To: peng.fan@nxp.com,
	joy.zou@nxp.com,
	shenwei.wang@nxp.com,
	imx@lists.linux.dev
Subject: [RFC PATCH 02/12] dmaengine: fsl-edma: clean up fsl_edma_irq_exit()
Date: Thu, 25 May 2023 16:01:38 -0400
Message-Id: <20230525200148.1015154-3-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9ec4773f-704d-4b91-3062-08db5d5aecf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aEaXjzNG+UcZkNVpIuA2aBhwEsBIn8+r5ysMUN58Fy0ql5lxbhES/WnVk2fHXrRxnIl4LVIBN1Td/2CQcgVct61tezdv3M5IWYUPS6KAkqdnmKt/fZLd7ohjIDJmHyqPZC/2co0ukrzQYQQi5v29wgW3SrhvZbxupUwIMBQJvB0yQZkuQOacf56kPK2ryjJu9Cxf0MTAAs7ufnxIww4ijX66/pDoSdf7wmcas8jrxkkEC3b4+ptR2eb+VplaD44Do+DwUyAoVBa+uvWR+AOQTzThp3nfPDEpY7HLJVG8PdaFYDyhd1yUll9mYSMdp9q80FuYUVy+uy4fEJ0z1GSWZpdomDGOMpUhkjXmN1+RGlmbzrRUaYegASUJUP/RsWoJFMrplhkevW5PzObAPqkS9D1CMr5NKfEd5Xp88xqu5Wv3StQYmHve5XFWFOjbITe1JhWSI+IQDakLqlSImF/E1In1Ma50sw8W3Z+HFwWcpmz0MV7dcIwQ1iPAUe0giUPFNpc32rPhpJu7tc8+zSfVZ6dJKIwZHNR1s9WcEgV/pktpsI9IENSuEkPCtgfagyz4rZ1OYaaK91fGoF3Tb2QQE9jPeOAYuP4Fi61zdew3Rry/OteGGBF5LaTnjtCn+iBf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(36756003)(86362001)(52116002)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38350700002)(38100700002)(1076003)(6506007)(26005)(6512007)(186003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NhoSek6yAdUUVnH77o+m86oWn9jmAUaxacmod1z+HIGCvn3kPY1Q1JjwqlQb?=
 =?us-ascii?Q?sErcqqK1TuRMa8PzTcLMhzJ88O/KvBRQF22UAUtV018FsUHsAWeQO17dI7RC?=
 =?us-ascii?Q?PJlhzFDX5JFPOFZyhGaqgbMwaT8ceXP/aOu729sffqby080+L21mG1tNa6gu?=
 =?us-ascii?Q?jfVwH8PAPWxo9etTeR5XMwUAkuwOBuvyDbvfEI4koN7ilNmW35l2JP21cWPr?=
 =?us-ascii?Q?P5VaAqlOzji1mYd8RRFEYvT7rE5D1phaRJwm7xvcWFIskzxqPdiYSAbfDNSr?=
 =?us-ascii?Q?l6nD/lR9tSeJImEQz3dBhO/IwLtU80B6AmWAhAUwPjAB4eOCIPS50I7id1Q/?=
 =?us-ascii?Q?V6EWWAtKs+OTByh0NB3pHjMhaELr2hPzqixd1/egI3Ny3nPDhQFY0kaDy96e?=
 =?us-ascii?Q?e/dR2NQnITWMfOXFQ38UC5TZ5pSssxjlp4hv5/8SYegleFFTeUII1SuF+Lpq?=
 =?us-ascii?Q?DdTz6XPxhmC04mjjZYyQZKnVMi5uaic4lGABFtnwIOtPcDjs2JQiiuRmLPJF?=
 =?us-ascii?Q?OYrfnILqrfxrBnzgfeM5XI2kwdtrkT6EP+1byKl6QjVGsOCbruLQMTDOID96?=
 =?us-ascii?Q?a4UqjrmtB8lqnuCQbDEj6Z8fiA0UQmWoIhVGnX6XEKtHtmjBL/RcBbZwW4dP?=
 =?us-ascii?Q?RDs0ul1ASfjrPr7eE4u2xDTFF0qYPnpJxIZRDgZXMHdNVe3F2ZJTuV8zHGQz?=
 =?us-ascii?Q?qwGNDCMzc4Rt8AZotCTsyGS3MtmhaYJ1Jr04D3ZNXZu3WUkwiwKtUvnMGxYU?=
 =?us-ascii?Q?sRKftqH3yNnGdimlwTlBXRTdEyRUN+8mceBvb6keuuaB6LoS7QDqHsrK7+1e?=
 =?us-ascii?Q?UnuQRDNYIndkrVYnD/EHT2yy33dvTz5MwyWTvXBzG9qLFkNODA/tBy8saN6v?=
 =?us-ascii?Q?c1qyxVnBRTjHz0T1lmk3DwYbNp/Ozv6oyUBuEtzPSSIZ3LmQoKRGyHAOCUAB?=
 =?us-ascii?Q?HCRFLjNB21ImylMmv8wUYhAgsVz+ZKQkowslcO1d8QDxus5SqtUE5bZzOFCR?=
 =?us-ascii?Q?YIIxZpcUFutR0pU2yF+p0APEhA7H51TgZAkbhyyBlO5GB5jfHfwobkSTJ/ai?=
 =?us-ascii?Q?+afPQ06RGgA12NfI2Co0tagxxLTqEmmnbzTV6yBNBaAuQPKKfYRABRe5vJeV?=
 =?us-ascii?Q?U4SZoVlspd4wAGn7pM4wculvF9XE/d+glvOleorCM4EnSoBWyKstmyShjYtL?=
 =?us-ascii?Q?IVTX4qSWoxYVuq8vLqB2J1jsYSgBh4EcICYZTtLGzkh2HnwDk2y7pV3c037+?=
 =?us-ascii?Q?RITbrrohqr93q7/jt2Rm+TeuQP1A4jZzHWqKPZiZm+7xOJKa4jgTxnz0x5hH?=
 =?us-ascii?Q?v03qmulDqCPDeBwByWOUnGeNPb7AlV95iUB1wy6DRVYJU/ERx6tBBp7kHpdh?=
 =?us-ascii?Q?6OzSHWiP6f5MHtKU5PVgLsyvvjmWEb3xDs2JaIeJ9ilZ23NPrMGDxzBQF5+N?=
 =?us-ascii?Q?ikVsk8ffcYUPZGlAOB3apA73ofH4XT/g3gRaxLvHlPVGjY7sK2VPWxQG2k4H?=
 =?us-ascii?Q?S2Z8kPSxGo+FuvsKCh4Tb2YgeioNoH+nX+U95RbvG+F7F7HS6mSrnzKyqRXW?=
 =?us-ascii?Q?hWIEOEKNz9zzT0HyZ8PIl0ZM622IsBrh2r4IGEYa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec4773f-704d-4b91-3062-08db5d5aecf0
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 20:02:11.0008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbGLExdxfiouu4P+GoZUorPWL/lARrETnHwwlkMjvr7Djlqf07xhQKuTRjosRZU7cdGh4PTvDHjH5tbmU4Knkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

In the probe function, devm_request_irq is now being used to automatically
manage IRQ. It eliminates the need for manual IRQ freeing during removal.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/fsl-edma-main.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index e40769666e39..16305bb9a2ef 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -216,17 +216,6 @@ fsl_edma2_irq_init(struct platform_device *pdev,
 	return 0;
 }
 
-static void fsl_edma_irq_exit(
-		struct platform_device *pdev, struct fsl_edma_engine *fsl_edma)
-{
-	if (fsl_edma->txirq == fsl_edma->errirq) {
-		devm_free_irq(&pdev->dev, fsl_edma->txirq, fsl_edma);
-	} else {
-		devm_free_irq(&pdev->dev, fsl_edma->txirq, fsl_edma);
-		devm_free_irq(&pdev->dev, fsl_edma->errirq, fsl_edma);
-	}
-}
-
 static void fsl_disable_clocks(struct fsl_edma_engine *fsl_edma, int nr_clocks)
 {
 	int i;
@@ -427,7 +416,6 @@ static int fsl_edma_remove(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct fsl_edma_engine *fsl_edma = platform_get_drvdata(pdev);
 
-	fsl_edma_irq_exit(pdev, fsl_edma);
 	fsl_edma_cleanup_vchan(&fsl_edma->dma_dev);
 	of_dma_controller_free(np);
 	dma_async_device_unregister(&fsl_edma->dma_dev);
-- 
2.34.1

