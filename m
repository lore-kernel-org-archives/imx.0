Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8796F24142
	for <imx@lists.linux.dev>; Thu, 25 May 2023 20:02:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmaBH+ZRNCYxVq+son+xnM8yGp2tPUOh7hKvaZABPvrVWZhfJynpLCMwb7lf/22OtlfYxu/TayOXNskeApzACqYigIsCm7XzKGvcicQ3vRLuxgwVr+yUFNQGznFUTWI1zhioE26A4/RDN30MihVcaF3qu24llpy0bWWl1fJ436pE4d6yxlbLgvm9OiYKdqka5axj+TZnNLBYsj1Lstg326EytAHLKctt4mRf7xk+W502ZwRpd92xmED3JEjOJ7ds6PW9DG7FKO15SRJhoc+hEU9W7GqdGT76IRV+LB/iFo9fP6TQy97Td7jUFaTIbEfk+5w6soIlTQG7ZPdsRCS0VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3P8AoOS+eHwcaqc5bUfUnf+Uxj1PFHD3YCKbldbyag=;
 b=YBw5qrOwvdSkh+oy2LfN1skyzTv3Af6F32i8nYwbu101HUXxxbh8r/00wFBAFjo8UwlEJ6VMpnGw1gc/SSZrgtV0qsX4eR7OYg4bU3kb+/TptmpFDE0xu5kmKW8FAT2Y1rQ87SHhCQrPtjnG6CZudHt0t6WKAnas8jHCmp1D3nIErsnxc4ylUpt3ba0IAuLVdV5Cm+qumuShfeBE2qt0p7AirgcCbs3o5NnkO3VNsasQ6+q2QkKVAvyi/XJ1GQcqLpMzhJWLiKBiDJI353a8NSIIzyO4DYfhYJcNEb6jFUSlCGnFkAgZMNYoLvgOflVNlUhfx/HHQjiSxkKXbADDZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3P8AoOS+eHwcaqc5bUfUnf+Uxj1PFHD3YCKbldbyag=;
 b=O3mpM/LOMURh55lGoXAhzFIIpA4wGyNkoa1uaW3X/18KKXpm/0Wz89HyPvhJRoxT1ygneVyEK2afGMr/8AJAMxH/l+QB6yuQgfAQJIOvWu/C/v+D6NgJyQr3HEjSYPjfsuMh391ZPj9r+pR3VpQJiCJz7rwG226BKPGp7bsyUUw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7934.eurprd04.prod.outlook.com (2603:10a6:102:ca::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 20:02:19 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::25d3:de2:ef1:3884%4]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 20:02:19 +0000
From: Frank Li <Frank.Li@nxp.com>
To: peng.fan@nxp.com,
	joy.zou@nxp.com,
	shenwei.wang@nxp.com,
	imx@lists.linux.dev
Subject: [RFC PATCH 07/12] dmaengine: fsl-edma: refactor using devm_clk_get_enabled
Date: Thu, 25 May 2023 16:01:43 -0400
Message-Id: <20230525200148.1015154-8-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 07230c63-8ccd-45ed-8a4f-08db5d5af235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KX82Vhw5I4FkQnjNbT+0n99oAuwO5G/oJBb+d7dhE9xGlkwP/FEHJ+pAaUuY4HocYCmcfFoskWN0A4wrGRsO7193RnNceZmEe0bGArIFcPbfy8GmdDgY0X79dKYXVsaLN7T+USDlOOPFi/9caw2RmHYDCp8wwdCSevW4F3cRBykk9L05mlusbqb7QLH65nHsnEowgZXwMMcIjsy4Ks67rlveJL7Ck4cZmWJ7AfwpMyupqLVAO5Ggg7vX0pOEdtNa1/UcMjUh/1SqoXwqslSAEtlIm+845OFJAcGuAXLLFG1YJi83pYxZrp3D5qfPlNzOR8HUlxjak8Kjh3fxoOP7718NU3VjqwGUUo2YqWj3CoHkSxxLaLZsZLzmaLemByPLPmvMOChGOu+TyB/J0CaEOh9JM7dja3puIq+yfG9jKWKR0r2hO2MejOrAnC4QcABGh3QyZjfBev6VYPKi39TyuplZYMl9mbohiQ3woPaVYUqqXXWwGYnireaPsaUdZpby4wvbqCLxRW0QqD92QPOzUgkGTfiwlaYd4Py0JDug8O+3oDDEQmTR0MGjt8I8InPXYfUKBAhILJnNRbXeWW1v4hG+W9fmnUBmVN7X1xEUMNBi6XIK156gTuo65EFr4Weq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199021)(36756003)(86362001)(52116002)(316002)(66556008)(66946007)(66476007)(478600001)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(2906002)(38350700002)(38100700002)(1076003)(6506007)(26005)(6512007)(186003)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N33wtYmNif3EC/Sk65jX6QAC7bnZ2U5+XugVNY2JIAjF8DPbVKVco+SHTN6R?=
 =?us-ascii?Q?2gpr1b/CHIJxBS8r475TdzlvK5dOJ6W9K/e751BWn6LCstcCbFTS9e1gx6MG?=
 =?us-ascii?Q?fcX5/UruVrJWw4+Fmx5BXo7BVl5ZUN2QA7xNk6Nwz3GEMfrmUemc5JKMArje?=
 =?us-ascii?Q?6UptvXotk02Zw8uo8mcYnuTgQDc4Tl7GXIVpOOoLnFEVwpl7QeDVT/ufhy9f?=
 =?us-ascii?Q?0HfTAc1A5DmSToRnuZvmx6+ScclHJF1DZCJDp8Bf1NE7Gq6g8j0flR8Ek8/l?=
 =?us-ascii?Q?TOMQAOCQB3BXocectc/Zb74DbssstsJwbnb3z9LGWZtQh6BYLtyqQt9se8BT?=
 =?us-ascii?Q?XonOEgiua6a12i/XW7nUAqr9FxLdIUAAOq7BU2NsPFLF/fQvTlS7uiChqV/s?=
 =?us-ascii?Q?vFSg/qjCVmwkRXlB42nTxqW3VW7je6q8LHu59s64WyEyFmG98n4NanO8LanM?=
 =?us-ascii?Q?AlDrjxkyknwS8Asmg53+PLidTF6CKnynantvlcWsXn+XiYwX0cLQDeYobKwt?=
 =?us-ascii?Q?3HW2SClQ/a0yjo8tAuTeUujirkZNBQI4VpU3tgTxyfSv0bDB840y0DiZvPOc?=
 =?us-ascii?Q?lRyj3cFnKoUHW8snH2lzYEw+wO4DF5ywex9elNqK+LEQM8h7nCgST+/Tohy3?=
 =?us-ascii?Q?gKnNxfQ07BSTGPkKxz1MMB8XNtuigiIKmclMb51355rvhK8pgKgFTlFj13Tx?=
 =?us-ascii?Q?tyP+pYux7BtC+IEswbN5f5+7uxIILLsV12W5aaUKJ4czSy2WywpNHcyZ7CMi?=
 =?us-ascii?Q?Fa2r2Xgfp7hQzwtpeHj0IRCdqxlePpTcVkH5RCfbj5YxKMzkQlMO7D0h6LnD?=
 =?us-ascii?Q?cEd74c6r0XKWB/ojEUERQW37MlPOkYI79N4+MYgiQP38gMDfAcEdCSB36O0+?=
 =?us-ascii?Q?toRx6DyzU9HLfp6fWRPVGFGjKktnbRaOQKzXJwlSoBHK57Xg/y6Qp5Kpy6Ug?=
 =?us-ascii?Q?LFCVvcuMrRvOP0Q2r63Hzpe+W8lvdmFg07i5Dy99sVnnHH48sP+2X7eozGoq?=
 =?us-ascii?Q?26BxdlA3JBuXhwul93Nho2iQVUzHob3bYtO72knPyzS83uaQ7TWx7F9FC2vd?=
 =?us-ascii?Q?vNRLQvaofNcWZtZXNuLImOT3F2TjyOMo7+3bLcwB97MprymwJ6fRAUDCrKaQ?=
 =?us-ascii?Q?4baGGgnQohqNxF79QZA48jSxMGS8FoQgeQbxvqQ1RfwJohAHHaz9kFF9VSGT?=
 =?us-ascii?Q?Z7qalBecy1P9Xx63NLnmJZDMhxdq6J357K4G+tY/i7N5LO29LRtZfZhBrLbW?=
 =?us-ascii?Q?DJHbpQ2Kzw3skLDS6IdsuF8RK4mkXITot6jot/wwFvI/YIVJZTHzdYjiTRGu?=
 =?us-ascii?Q?5ruA0jmWt9f8M09KgFGh+lDwIB63PF5NndnTtuiGhkMfnvrh1ezQ2b66Ad6r?=
 =?us-ascii?Q?dBIGkmLGHhERgFDsI10p0DKC+/BsdoqoHqdB/EapJd1RL/gh7+xieAT58H6X?=
 =?us-ascii?Q?Fnl2Pq8RhAfGVAl60Zi6tYFyFTuvYXXmYrt1Pu0/zLO8+INSiDufuxxABSzZ?=
 =?us-ascii?Q?xWGkbe65yBRTi2FG0AoL79qxxFNJ35kgFp+0hZo+2WnCLBQotJk0yZH9pkOC?=
 =?us-ascii?Q?8vDKi3AqQ/Ib+r0qBr8IMsaQ/h7mbGrk1qcE297O?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07230c63-8ccd-45ed-8a4f-08db5d5af235
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 20:02:19.6932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSl/FUeHsKENpJH7XTFkDXlH7t8ZFUqXyMCJvH2dB0p7iIqRDh2nljbw5xx9PJE3aaxXmsqo11jNX0v+wh0Lsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7934

Use devm_clk_get_enabled in probe code to reduce error checks,
thereby enhancing readability

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/fsl-edma-main.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index 9c0b6fb4cb8f..6126717fc87e 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -268,17 +268,11 @@ static int fsl_edma_probe(struct platform_device *pdev)
 	regs = &fsl_edma->regs;
 
 	if (drvdata->flags & FSL_EDMA_DRV_HAS_DMACLK) {
-		fsl_edma->dmaclk = devm_clk_get(&pdev->dev, "dma");
+		fsl_edma->dmaclk = devm_clk_get_enabled(&pdev->dev, "dma");
 		if (IS_ERR(fsl_edma->dmaclk)) {
 			dev_err(&pdev->dev, "Missing DMA block clock.\n");
 			return PTR_ERR(fsl_edma->dmaclk);
 		}
-
-		ret = clk_prepare_enable(fsl_edma->dmaclk);
-		if (ret) {
-			dev_err(&pdev->dev, "DMA clk block failed.\n");
-			return ret;
-		}
 	}
 
 	for (i = 0; i < fsl_edma->drvdata->dmamuxs; i++) {
@@ -293,19 +287,12 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		}
 
 		sprintf(clkname, "dmamux%d", i);
-		fsl_edma->muxclk[i] = devm_clk_get(&pdev->dev, clkname);
+		fsl_edma->muxclk[i] = devm_clk_get_enabled(&pdev->dev, clkname);
 		if (IS_ERR(fsl_edma->muxclk[i])) {
 			dev_err(&pdev->dev, "Missing DMAMUX block clock.\n");
 			/* on error: disable all previously enabled clks */
-			fsl_disable_clocks(fsl_edma, i);
 			return PTR_ERR(fsl_edma->muxclk[i]);
 		}
-
-		ret = clk_prepare_enable(fsl_edma->muxclk[i]);
-		if (ret)
-			/* on error: disable all previously enabled clks */
-			fsl_disable_clocks(fsl_edma, i);
-
 	}
 
 	fsl_edma->big_endian = of_property_read_bool(np, "big-endian");
@@ -366,7 +353,6 @@ static int fsl_edma_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev,
 			"Can't register Freescale eDMA engine. (%d)\n", ret);
-		fsl_disable_clocks(fsl_edma, fsl_edma->drvdata->dmamuxs);
 		return ret;
 	}
 
@@ -375,7 +361,6 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev,
 			"Can't register Freescale eDMA of_dma. (%d)\n", ret);
 		dma_async_device_unregister(&fsl_edma->dma_dev);
-		fsl_disable_clocks(fsl_edma, fsl_edma->drvdata->dmamuxs);
 		return ret;
 	}
 
-- 
2.34.1

