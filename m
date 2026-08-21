Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0821D3B19A6
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307176; cv=fail; b=CaE1ce6nJml42z54ktC+ZwMqdmaOwZDvh5VxQkywoPRKBOmLHBEnYJFZzMPMbiiA9vyybfe+NOXmqOTp/2KFJi3H29hKzIjYGDRIkj+Wf65+gLFtDyaSFwrd1e7QEX5dsqylDLRFldra+gy2nMfSk9C66FyFZY2ILAyf/uOVcjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307176; c=relaxed/simple;
	bh=ADjKYgy5J27uwfkuuaMpGTzg9ApCFpUhwxamprQOEmw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dzpemSpGtna4TxwekY4orDHxW3+j2/g9W1Wdj+km4AJRKjzdLnuoHzSfcnYLXONI95b4JgulfC5Eya6UgxnJIAZBLe6Z+JzVSLFW7MJeLQOOrC/PFgDjWWe1crCezjuOAVYyPtgXbIgUdVp56OU0M+2OWh/zNuz9QJQqfHfrp8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WkWMPW/G; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WkWMPW/G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lCrLLc25TVo+caYIV+LS1aKW84Azs8uMEx1E6vppl5E87QmF3kbTB8qlulBhP9CE6fvBbwxFvItm6RGaZQ1pGV01T3xCX2ayaKJ2C8oUEmCbpWwPZN3Pdu2pD6u+vgu2DET2vprobhB6gguv4xDGU/4W+GYhTns15E6eYfmt/pLlEgLIvx/NhZKPEhvR/4csfCDmHo4f8RbPL+TZaE/KwSzNTDWY6wik3/PwWsLlXMUZoWvNCThoE/BWO/T/X1xK7jQivz7aS5M8KHLu6vAkkOW959b0/f3JAx4AMCQUwoWxm1PSItcGwwgZUYqb44o+Xc49/ZuF6fJv4uwyfhrwrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l164w68GAUq91EMOfejutZateg3uL2Rzvgm7EN/N82U=;
 b=HdJPjHSmOc8SzOd60QVRL/F4kL3uWh9BkGNJTjcMp1y4bKbXaU3Ndvotqnd5U7LBVoVEqPrdCccqf8ctdqHylOg8ZpdtY01GcnbI+QvW/zDAONGZWeQdFT6s6AVPtdeXvh2Tpu2Epst7kW+AT+lsxxit+GacdPQCZ8Gxg0IeG2j7C4T2hfwnswZFbz5bw6hjKvFqN0xxWfDk1I6zGHySmbGfX5IbAvAqZfIbm2dqQT3/YCp63GwYbupDnx7aVVgob1P1m7r27ns3pprUy0Et0Qdsb4DdnZxyY3WWFo7aNw71XmY66xGT2L1gNDbHT2I8eJxInlA1qmSZ3lDVu4s4eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l164w68GAUq91EMOfejutZateg3uL2Rzvgm7EN/N82U=;
 b=WkWMPW/G+pHKbLz5QXcFeVsJSXX/KHrkFMMKvxrHJsvzQyIv26XbWXkrCpwrZEjGGmMCHQKSx0N4HiFjER69JZLgMLAFHqVEJTtEzgKzc5SBDToJa25QjBGosJ2rerWMN1f/PiVUVpViQbg5woUvlw150FB/nxB2gh5Yi/pC/cFwpSWA/mZ/shGhE9zVF8doJvV26x7TFsg8WSx1abnmF47ZupS28e8ra+Oz8pOzLYUNKg4e53z9RZN5jjhzNgVvRNPS01ILzdqMHTzinTHhZEvNNbZCBpW5nsWf5pAI3O1xaW6ayqdWvqe+CP5QP+pQBd1lYUSZo1EKOVpowa0BVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 10:12:34 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:12:34 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 9/9] irqchip/imx-irqsteer: Use devm_irq_domain_create_linear()
Date: Fri, 21 Aug 2026 19:10:39 +0900
Message-Id: <20260821101039.4037925-10-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR03CA0013.apcprd03.prod.outlook.com
 (2603:1096:4:297::19) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a739397-4add-464d-937d-08deff6cb833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	iX64EuI+hfcatcCwIhlANB67jlMPFY6M3mA+WmMWGs76xbymgxhSX3xXbQEZ+tjm47pFFVYwirhw2jwOz2WyzKavijZMkPhf5mgCgVZ037IuVV2FQfAxoDGMfThJjt+Szb7a5NEfhMbdx2Cz3HJi81OaPX+6b2GZdkhU14L6wX9uGddyPnCMdlyZ3UKTz89396DQDma7lRS5kuucVU5Ck/F3U+kpG7MDKFjJ6D9eJ5HwTW/hAsRrUFbWYyhnVv8VHM1URh7vOBwqIVMvgJkroi2bzr4SB32KJ4PSYFYUMvtcwLy7SBvojBIQL5x4BeJbzaK615f5AHqCNgwyimgp/OGtWp39S1EvyErm6SJJ+nj+YDEsCF0jMJKwQ796cuQT5shkxa6xByKR0cCVhZT+CCoJ5tW9yCuQZ1H13UxlW7Ov4QYOJmM20WsvR97x+RECaas5JMKUJuvR8S9pRuhnP8C2EQwn694mvQCJCjJrzfDJ1RvwseKz3hWo8I10u2wqZMMwddoQFBy4qN4+cCm61dD7E8xZzJVeegL6oHxcA0EysHFwaCRVkB6MJUYesMkQKUYeFhY01gr7X7h2lv2jGYliLxCJpb22JQrkBRfY5F/UQ//CsMtbFgtAw/cJUOH0GbR7sh9HKoqVuh/rMVraJTeDRCG8Afcr396He/Xtxlc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vAxY8D0UV+KEWL+XOqvGgdZS+0m9JO2VnciG21IgXrJdeTHJQ21qIuqJ+6k9?=
 =?us-ascii?Q?zM14SrNU5ICaaDU8xrrz/5g6YgZLvWio12jhxNSw6L1MAg7aFCoVCj2xPHvK?=
 =?us-ascii?Q?RogycCyFes/MObPs62Gzpr5C5TgIrwD2Y/fC0uIcaRUOzYm06Xx/vhqYrYwt?=
 =?us-ascii?Q?a2tz722C8Alu3oIaloBl2ozMiGTe5StnGlLBpyLdBvX1Cm9oweKFhJgnYJJ9?=
 =?us-ascii?Q?zXbnL4i75RiPoxg8wI9wXa1+TVRRpD+yBs8DgSCYP20aGKMre5ly6t2oTEAL?=
 =?us-ascii?Q?4WeqjO5Qr4WmaTY7YY81Z7in3AI16hBV/w2FNLkK5P2x8srBKoACHmN7+Gp0?=
 =?us-ascii?Q?4jyMF05wRdoHpNnxMhudKiJKCQuOOptx9X9T9FOZMsd356kmhvT1hfwTgMOl?=
 =?us-ascii?Q?WGpayXulhY9RPcBg0g2HPiIdZ19c4g5QLiuqNjEKv90WNsPYc2cNrLlAhtru?=
 =?us-ascii?Q?2r5jB1uV9wVMlrZOIcQhP2yzrP5Daenv8Ry+0DvCdzeh/N3nlZBnletpbkR5?=
 =?us-ascii?Q?0ZQGnQoyNRKST6qbxWDiHPDxPT6hv4D7/8HpmQqy290IrwnIXlteitEQSMa8?=
 =?us-ascii?Q?0F+v8myPsI282NoTxZJLYnBFR8rK6XP/pV4qAkUcZBwUFuSHqHR+u9iT6ekE?=
 =?us-ascii?Q?PVYHX7SrIf6GTwVhoN7e/EjpbEx3S5I7A++nGTZpkuVgdydM3PkRXgM5hifp?=
 =?us-ascii?Q?I6+TnU/iUWdSQmoSch+EWmWLaKmg2VCsyIOumd78GA46fVTKGS3ot9OIjLpR?=
 =?us-ascii?Q?Jn+BwP0ROr2shI5KRY0cG5TBeP0ll7qjDhrnRVIe/rZggKgzDWT5WZq/RQw6?=
 =?us-ascii?Q?BfvJCYjMVcIBKr1T+V4pCLVqQkdndyZ1hAldH/+O2XW4u0CwSTgr5+vIUBRB?=
 =?us-ascii?Q?xQUVpxg3j2YgEPIVd+Ele75TfFVDR7ObLr8yGeGdzBtM0fjcosGrV8mlQ1P/?=
 =?us-ascii?Q?I57b5NkUG7Xb1w8QlUik9UulG/eT/dCAroMxFOzMMhPWWuY7NFWCaVXDEndq?=
 =?us-ascii?Q?G5WeMp2UIOQlsr9KPm/9SbqztbUDikPjqly0N9DhZOC2XaNt9J6Yu/O9xsnl?=
 =?us-ascii?Q?x2tNXpfapfwos39XWofqouTxs3E0RbLeNsCpCJV0KH1f0W5nfRxI0kWryDgC?=
 =?us-ascii?Q?zaGW3AHwhWe/kA3msLsdAGgQv5p1KOapRwP8lwsoOSL5jtQmjHteHwieEOCS?=
 =?us-ascii?Q?1a4XnDaPQAls/9WyxVMzIbqHG7O7gc8rFP+Q6fgDqrRwD5iLdP9+7tIP+MEA?=
 =?us-ascii?Q?dSC0lH1FrjzFEgmzQ32Pml9V6ofZv5P9oJBPRyWS66hcz+D440cqCqRruHXh?=
 =?us-ascii?Q?opQ4Kl7ciD7HIGi7+duQOUV9b1S1Iyk9bNEO+4vwIunDasVOtiODUSaf/D17?=
 =?us-ascii?Q?4AqlGZeSeiI7PCi1sPEEDew4lkVPDumOKkNc4I0Z5HZC8F44xEm5iN9ECdc1?=
 =?us-ascii?Q?o2edcjWTkFTABNZLrDgWMU3PC2gsCjjZgLYRY2Go5OaT9VO/VRH6VmgxrRbN?=
 =?us-ascii?Q?lN8L3O8hC/o4OtALNEl7Fc325krPZkfRee9JaU3679hgCa8E8Wnw/vyydmPD?=
 =?us-ascii?Q?FMnst2QflziffPltirvSd/A4jRctZsKsUJrVj2358d65p1Qt1lB5UxGWzGb4?=
 =?us-ascii?Q?7sa4rzMoaKtVZgfOr6OQ/JHqvDqp7PLPWCGyC4Eg9/9jeMyPqx6rMweTROI/?=
 =?us-ascii?Q?gxK/GayeFNssaehw+CZIDMANBCGQjibdLRwB53B2ev7C290Yb/G5JE/naYER?=
 =?us-ascii?Q?1rkmdO15k6yyVIyD5Ufv3vNDBuImotAYSLgUlYqxNchK44zfuJLtnspzNS82?=
X-MS-Exchange-AntiSpam-MessageData-1: k1qewNuBHQmcJA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a739397-4add-464d-937d-08deff6cb833
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:12:34.7674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gDB2C+a+1llWNgLsMxB/OV8bAQKP6T+G8M4Ir5E/3noQY64xY1/dK4A2A2ajYQZm3jGGAoIi+YTjPAN+6LIv7l0E3KXvx33Yiae/bZVHvFvw7Hw1Z20fwQwHRVZ/I/j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

The driver open-codes an irq_domain_info and calls
devm_irq_domain_instantiate() only to get a linear revmap domain tied to
the device lifetime. Use the new devm_irq_domain_create_linear() helper
instead. No functional change.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index dad09e095ed1..ff20f6220784 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -242,18 +242,12 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	for (i = 0; i < data->reg_num; i++)
 		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
 
-	struct irq_domain_info info = {
-		.fwnode		= dev_fwnode(&pdev->dev),
-		.size		= data->reg_num * 32,
-		.hwirq_max	= data->reg_num * 32,
-		.ops		= &imx_irqsteer_domain_ops,
-		.host_data	= data,
-	};
-
-	data->domain = devm_irq_domain_instantiate(&pdev->dev, &info);
-	if (IS_ERR(data->domain)) {
+	data->domain = devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&pdev->dev),
+						     data->reg_num * 32,
+						     &imx_irqsteer_domain_ops, data);
+	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
-		ret = PTR_ERR(data->domain);
+		ret = -ENOMEM;
 		goto out;
 	}
 	irq_domain_set_pm_device(data->domain, &pdev->dev);
-- 
2.34.1

