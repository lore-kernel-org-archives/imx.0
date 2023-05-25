Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6B924142
	for <imx@lists.linux.dev>; Thu, 25 May 2023 20:02:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzk+HzgQz9oAmqg19GM6G4Zda4IrxRZcQSKH8t50mmHmE6T8mtJeXuOW2INtPgzSN9SoMB/NTnWFf5sOu9EIIHBuGqrUKhPwdlUe6H73eWUijtMg9r9Z17OGaXVVMeJwvalNIuoJCswDPYpB9Z5ZqiG3phIJfKsn2sy5ZQqO+bWZa8Ry5ACpU/WxA8PhpP1YePjOIYqSdvqhaM9wrYnIkPhoxBvx8l5+8+Zjn9Yke3vMHwuj0ckdPKjwhoEa9NbJDQ+eTCRTvAbN/i1qWunMx6sCY5nLn497MSxrVFYaTElCLp5ctbfaPQRvOHI+f/r9keylgB3cpJJ0peNEVccaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZX5uQiZbWlSQBsI7bxXuEwcbNQRhGGX00lAlSQPYFEQ=;
 b=UcVcah28QNYoizmYJM+fjBF8/z9lm20cCxipOp8lseaBCujKm01kD1DCRBUIJxEVshxkpcFfomu+jqohTcF1PhVHT0TieSsgxWbwAIa+i32huwWUSQf9noSx6KmqWmcf3tTS67LO+up31B4K6/wmAKtDxCoYK8cMNp988MVmG2/uIrGcXZLYHAThB0i06RAb7nf12PIOJDmRr9YHu8X868703SEWUiBd63hzuaSFVqvI4jMYkYGbBW4UL2Pp740/6zdboZpfdpZSNwsCvzPSJMVlu9i39P8dOt2D9vKZ2MIDGcpJGOki9oMSmwEVBd0bFmWTNMm7kNwiXCXTSRUhGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZX5uQiZbWlSQBsI7bxXuEwcbNQRhGGX00lAlSQPYFEQ=;
 b=Z0TrOvc/bcgSD4GGDETponRdPaEaiaE+lupgJMSb44h5L+vBaFRZQyIodnRiTtesDHdtfsoHUio8MjZSZcgxM2O1oaeJF2oMXvYyqcsY+TZd/CEdyKgln2QFGcAyLQf9jXDJr8qJ0ooR+EZ5YtJB+eB3ArmtymIT1yq2rUFEDRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 20:02:21 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:02:21 +0000
From: Frank Li <Frank.Li@nxp.com>
To: peng.fan@nxp.com,
	joy.zou@nxp.com,
	shenwei.wang@nxp.com,
	imx@lists.linux.dev
Subject: [RFC PATCH 08/12] dmaengine: fsl-edma: move clearing of register interrupt into setup_irq function
Date: Thu, 25 May 2023 16:01:44 -0400
Message-Id: <20230525200148.1015154-9-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d93db02b-1564-4c22-5151-08db5d5af345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EOGi4lJZldhoOmWNLAuRd78+anBdqipljH5QNdyrE6VipqecCnxAHcmblHrj4iidKV9DoqT9CemfyVomCDNUufcE4t2+Yr+u6JZCP4sn+CngEdbOG6lXvl6zR5kqpdMGGcD2SiBcZnu36xu1FTE3xz922iwUr3FPpy2b7UKSf4H7IeN8xpNiO+dyrPD0yQQlwIdU+MREg2BefEGeZKsmba8Mjgwy4JJQG3UTE4Iycg6tBf6NPykz3YvrAZFHeXopxgEQ2R2dojD8s95HYB46E7Pqu/KjI0sdNjV6fDbPnz+Sv0R5jUpv+H3aRWGpzvrYwiiQnmdeY261cPHfKUK+Bx8Vdx7y1JKv7RhNHhzXEU85nSfun+bU4XWt+G/vLujxaYVC7ysIdY1fPm8ICpfoj+KDGMbW4zcUlH2oPlZmhJxgtKeCXAD4pw0q4KI/CPxWtzlB9mLySy+Q6miu03F8utcQeZN9axmX8pWe01vdAXVypTwskepABLEOs1/my//Iqb2BRbYx9FpokEEyeE1cysemCuDP99z3B08n3oDDrrOt2OV+B34LXpIHd4/ek8U2RJUhXysOR9hk3xj6irgcEz9Ywhr3DpNsutSlqWTkWcBS9Cm/P2cPWjHJniZ855/1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(36756003)(86362001)(52116002)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38350700002)(38100700002)(1076003)(6506007)(26005)(6512007)(186003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kY3oKbs1wQBum0n/ZsxzImRPcqcTUjfxDHHAuUxsY5swv5mmQMAslBzzM6bv?=
 =?us-ascii?Q?0pceIdOZeB5qnlFXdW7f54aMu3ZF2ehaBUuawD5l6nR9FA4C+f1zu/Dc6kId?=
 =?us-ascii?Q?0gLODpNIOKsHQwbXxE/Q0LZQxRkkjDhga/GRfyzgAYtNLnmWSDkCd9WoRvUe?=
 =?us-ascii?Q?SOILSjGsU68butYd44CxjGeUidj/b9kRQMIBfg/sGNxxbblghyXY6hEjQQf+?=
 =?us-ascii?Q?I5KLwR52tnshoL4Kdwvm5HvsTQ2Ild6okJNID1O7gnkl4Tjd7w7fn9nm4cdg?=
 =?us-ascii?Q?t2ryB2A+I/Qb01JfJOLtlq/dwHnl95Fuseo9fDgSHBURF71FrCl3SrKhjbmc?=
 =?us-ascii?Q?0/3unqLWytlAmckW4vpy8avnop+07d/Gxt4dL/4O2jhccDJQYv5bmzanv51C?=
 =?us-ascii?Q?QouYw3w0en8VbMoK8w7aIH538cl3M67fUNTXRJk8OmPO01JNPae7nAJjSaId?=
 =?us-ascii?Q?I5KI9EuhbbSAARL8EcqmvD6gzn09z/BjyHyp5DEXTMnDtC+BRTDOmnSZPnw/?=
 =?us-ascii?Q?Cp6Ncj6jukxNpgGwzXkxUSQ7qZY6tPQehkxphl22b7xcNVF96u0sCyVIo5Cl?=
 =?us-ascii?Q?meN+I/5Z35jp4ODEWpVQrr1uAxt4mnI+RVrCMMhTA6pcF+Giv41DfFR76Cqq?=
 =?us-ascii?Q?MfON//So7raJh/p7I4zOypLLfrgVykgpILEwvEgVfi2bPLkTbLehQxyLTWuk?=
 =?us-ascii?Q?fUng5fbdfldKuvVmAi2QXlSVYjjHRWKJnRMeW7eVerYvBl3YCax6ETbDzrrp?=
 =?us-ascii?Q?HT2kdLmDPDwYJLmJn6Tq2WQDU57YhowBO1u+h0YnD1jmeMOn81Q/zgum2fs/?=
 =?us-ascii?Q?AJW9yXXUAWJKRwewSrFg+z8seMHjU2X+vRVKzSTF+PO50YSi1QgVbJLKYp97?=
 =?us-ascii?Q?PwbmZe/GcJ8HwRX9pv+X4hq8/dzCZtN+Rvb9Kgxof90J4USSr3D0tLNeIGG9?=
 =?us-ascii?Q?mLGR0fBAGiTyhCrko4PCVw7pTeDVJGpEYT/IMPAg/g8dl1EjHGJGi69Hxelg?=
 =?us-ascii?Q?icEiNbhvw7o2vTXCyeQv1isPyvjQ48/GzckiRNB0FhZcw3s6SAk1LETGr/Ct?=
 =?us-ascii?Q?xYOuXXrVDwprfhjBJub+4MbzxuORSAyMzVKXMr3j4ELbY0eCpS7rVEocEhU/?=
 =?us-ascii?Q?uPpeFMQ+IRarWMibDq3V0+LeAkE++qIjpL6hWoHjp06sTIkpS0IN9vGZx1Om?=
 =?us-ascii?Q?fy7/zdYsOwkOzvaJS1zhsvSxIQbBEPVD2JvxZk4oDjALJDc/vQBoXvq1SXBK?=
 =?us-ascii?Q?xrO5XcQxDdrQcDhZBHrODmxdskAJM8gSIkaxZoSWtUtuWSiOsIOnZMrSBsrZ?=
 =?us-ascii?Q?PXjOUq0IJk8Hl8CDwfP1io9WlkLsMDzPxepvDXd6OEOTAfB8d5joYP8ZDOwd?=
 =?us-ascii?Q?MCboNFy1YoOrDAVm/0j5MjNjRUhMCf4taDX91aqC9mQ43IDFHAHFc5ClPw2K?=
 =?us-ascii?Q?Jc5dDbBe6K58ADARR3QIwBmjSEH2cpd73Rw4/N76Gr6szSlyjSiIePtZf98b?=
 =?us-ascii?Q?fk2i3YWFmVlZFtiaF7ozpUbCGGVl1RjfQwZGqUISRIYRy+k8j/Ifni4ANG9e?=
 =?us-ascii?Q?8xvE/hSXtwTi1Fa4qW7hfJFAFrTYV6TaNyzVMCyU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d93db02b-1564-4c22-5151-08db5d5af345
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 20:02:21.6935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +U/cpxHa0XcSxItFu1/pwrQLQfyJFQE3BSHDEIzeAfuLdh4ukux6ORk3R7dQ7UDkjKW2mPTTCasZlPz/wO4cZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

This accommodates differences in the register layout of EDMA v3 by moving
the clearing of register interrupts into the platform-specific set_irq
function. This should ensure better compatibility with EDMA v3.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/fsl-edma-main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 6126717fc87e..cd734779f2eb 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -113,6 +113,8 @@ fsl_edma_irq_init(struct platform_device *pdev, struct fsl_edma_engine *fsl_edma
 {
 	int ret;
 
+	edma_writel(fsl_edma, ~0, fsl_edma->regs.intl);
+
 	fsl_edma->txirq = platform_get_irq_byname(pdev, "edma-tx");
 	if (fsl_edma->txirq < 0)
 		return fsl_edma->txirq;
@@ -154,6 +156,8 @@ fsl_edma2_irq_init(struct platform_device *pdev,
 	int i, ret, irq;
 	int count;
 
+	edma_writel(fsl_edma, ~0, fsl_edma->regs.intl);
+
 	count = platform_irq_count(pdev);
 	dev_dbg(&pdev->dev, "%s Found %d interrupts\r\n", __func__, count);
 	if (count <= 2) {
@@ -313,7 +317,6 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		fsl_edma_chan_mux(fsl_chan, 0, false);
 	}
 
-	edma_writel(fsl_edma, ~0, regs->intl);
 	ret = fsl_edma->drvdata->setup_irq(pdev, fsl_edma);
 	if (ret)
 		return ret;
-- 
2.34.1

