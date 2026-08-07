Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013021.outbound.protection.outlook.com [40.107.159.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C953AE19D
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786087476; cv=fail; b=sHPp5iqQsQEg2CKScboOyaTozzdsbfnvxAyyKX8du5R+3GL+84kzT2BIwH98u6kxL7SdjrcxhxoKE8R4+2Ffod3temE9bc03jvEeAyYmOdt0cFZpffbHYHGXoX4rrKlstbD9va5fI3wlRj2OUlKZHBwd40oXRK0YQit4soj5lBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786087476; c=relaxed/simple;
	bh=6Ih9I4ohdYbWZHBWLD/wT1JxnLPTpmeN72qMDmHgw0g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=guLmiAyTOyDiFruBbPtRPGXKbtjkJoKIak9Emmvcax1qbsmgyGr6xwbYm7p5IOCHXpOv3dbCEa+nca4Dh5ahUCZSVmxzXtffUCG1n8I3DWEQdGepab2EN7eETRolJ290L9HSnPD9HI60LDPFz0dxocRxu/gxnzArg5LV2a5Htfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CqVG7rCZ; arc=fail smtp.client-ip=40.107.159.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CqVG7rCZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDRGpNZf5XDbX7Nz3/Eeyc27ShcDsbV+cj+TqzKS7URUBnnlA3RaXz9y93X1zyHCOvCoklVNuwW0jC40XOmim4XWgzORapBEQ7dS6T++jizaTbSNpJqjFEVtQq7H45fOUKG+P8n+mZFpOLzn7Zgeo17dH4IqVeoBanDrXEyVVeE4qlaVf9n4VlsHMVEHXCY75tX4m5tG368f4trJH0lj8DUArI2su/T+TTyr7/cC20npLiwdFIlmgVw57K1yMjwgLIYzLtarPZc1S0WZgmvdzoMZPn/pmDH8jqR9Inq9Xahetw+eeb5WxqDXndjpyt0ekg5uaNqptihX8UODh0JT0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xh0VWp5wozXPxuEbuHUmtXOUYFqebVxNiY65/eIeE+o=;
 b=dnML84TCHusecb5sxgNiF967R0/k7n+eJ3nlxyrMiybmXzGWHDaLC/oowea3LujqaCL9+lGFTB7a+MZzO1xgNupvkDUQujsKOC/l89KmFQ578EGS1nwdoUGW9vNP/IvE1K/dkcv0KoJR0rYRajSb1IVvo04Z2xog+XhRCtvDClzS79PrLJl4qT1Wir+PyI8vCWFYtUWdp2GF6EB0H64ofWYYkL5Tu4U1qVvuGMdZ9bPYjVG2gmIkUDqdiUA84wk8LLFY9goEhIHd+/w0h5Q5tqpOYyLjhFwPZBxe4q/MnSQit5kPey2sL1phzTQsFilN+0TEcVs4GwBEeLAcX+HSOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xh0VWp5wozXPxuEbuHUmtXOUYFqebVxNiY65/eIeE+o=;
 b=CqVG7rCZHFQfJPVK43SawZM8d2g+9YRkgLA2/9+tn4PiLPVbl4wZHgtuVt9G0Pt2/ygO331ej9/FLc4Q7OWOryOBiSowvAoBmO3UvtmQHfrhxXe35dY8XXM5s0eL389l4rvSOSyGHCGKmsGIktTzdoKQjOFEhMD04b2faofhMUG8QcyBTh+fbuJXAZL3vYBDayGV8MsdAi3JQTMtpfcG9mBw4M4Kr9r+X5nNNHmbny8a29PZgXYRN9HPGBD1AQmlr4Z4aKsqboiZPu2UgpS8Q0l6FHgrmBlvQq7PYiIq6K4ESgu5UY2yRpjPB/x7Y1l01cwLr++ErVoiR7BJ8uqOkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by DU7PR04MB11188.eurprd04.prod.outlook.com (2603:10a6:10:5b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 07:24:27 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%4]) with mapi id 15.21.0292.021; Fri, 7 Aug 2026
 07:24:27 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/4] irqchip/imx-irqsteer: Fix error handling path in probe()
Date: Fri,  7 Aug 2026 16:23:43 +0900
Message-Id: <20260807072346.1222389-2-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|DU7PR04MB11188:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c2b2cbf-2207-4d84-c255-08def454e9cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|18002099003|22082099003|10067099003|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	yLqaO6Mt3uy2uRXVBmc+gFi57MRsIezkH08F+OUE7Qi+XHEKq9xJa0Ew0TSpQKuGG0JQxTiDUCX42eRIgQ39s2fhUs4AWp+fLhF9t6Geq3i3kIGu+GB67VSgvdnfEfScVht+XugniJSgycugmYXlpHes2pFXvPZ3W5aQixZbBoj5P1MlJ3qEiEJ2/YEuFwcLxMpwOKto5J5f1ZzKf6RIwB2oJ1qtSerMe3EhtsCMNF/ic9fh28Qi+liqT2BGuBXIf+JuJKJJvysrlAoxfwWrI4GP2dTCTLx7Gyoe7uHiB4HiWLWx9CfVqXG3lPYrWRtJgxVHFaayxgK/AL5McqigeZoa5FFE7iF5p46aV7eU6JtDuclcX7Vm8CmYHoXi5zoPXQ/UgyqNxHvDCzcSJNYqJyWK16WET/nLKiCfcbbfAWQQWKILTAOACalxfJeBlINEXxc5kpEKhnb8QlKFYPj3BVYeqKRxchTHAiTPoRSNfQjePNxruSEdafbVVW8Xq9nmh8/LHfp7ZQ/mcKj/7JH3DubpixBVcBfxTeuYTbpw7VKYoL6RqnamIrcJT/bt5l7kzmI9f86O1IY2MifHHjfy8oyPtzSRKxTFh9fn33hBwqVQVynFIh2k+4YP9P656vLc4BVzvJ26hVSnmw7QwztKOt6bnV62mS6+CEKb4NiuAUM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X5fb7Wf/9x1I4DEi5R/n2m5ZpCNa3Hf/nFgHsNsE6TLPIEJc18XNIY+8D4SV?=
 =?us-ascii?Q?NR0PtIrjgq6zdwBcC3Namol3JD8e9PDfqXjsGlrQ+bsti+0P4Ur4aqHyD1bl?=
 =?us-ascii?Q?P/yiehs5ikrQAFVEaNU1G58YKAg8PbLa/fb/Q9wzKIPHvAxGrtbSh4V6n435?=
 =?us-ascii?Q?QLJqW9Na6+npAY0zjP7OvnwQ98FTTjMKhuGbUateXfedayGsW7zCYKmlMzey?=
 =?us-ascii?Q?77toCvWguzEAoS2YDUUDMJHw3dfwWanhKIwl3yLDuqPDf7uEdxXSIWlhg5dn?=
 =?us-ascii?Q?UjO9wSqe6ipANWV1BZ1QuM0RZoIAHYnRZ2WioL8RqxTL0Dzyue04KTR3P4JG?=
 =?us-ascii?Q?irfZN/AIIakZXGh116OxVE4X1xYIUroE6qYkQsRm2sG52ieeUNv/6um1TiaO?=
 =?us-ascii?Q?KPa7vkNhPb7/ZpBOKGr+DN558T8LXNzMGl7H4KpmftxKhYQaIISk4PsuOeus?=
 =?us-ascii?Q?/En7I9rudmGbjOoCqTH8cN+UsmiQZlugyarwQ+lBJ396QyFxMt0DQYuQ3ArX?=
 =?us-ascii?Q?Lb57kdjRZm/u1Q/vWV4pxSfh/xoSk7WsyQSZ/CFaru1MJjzwtaqrSXaWLYmk?=
 =?us-ascii?Q?rTJlSTmaFlB24UXTS9f9hxZQ83Zw69qzpEhEr2qaw4+ISJcRJfB66MiNvvI8?=
 =?us-ascii?Q?qVNx4qjHNAEBCxvDBstaGNtz5hI1lmmWsQdak0Q/C0hrrd3ntM4BCgX1Q2PS?=
 =?us-ascii?Q?JcCBaRHFU67hLhW1jYc6iqoL+S3P9NNFyAgy79+rvn7hEMPQ61uoW3oH0grV?=
 =?us-ascii?Q?AhtbNZgcEawEwTwV8Aef/woe/BH9eRlxZ4uwOXscl0Ey43QmnOlIH16TanlD?=
 =?us-ascii?Q?mB+8KNIjFlgcCUDhvp3vmUeEZCN9ByNOG5ShLok/TAOLapfKDUPgb8qX9lNB?=
 =?us-ascii?Q?BmH2R1xYQVVTkA8yXyE+b9NU1xcWor2jTNjvkN0BBHo4G0U7smQ3Axt2AJmy?=
 =?us-ascii?Q?3io8zZ414TL2ZgElAqN+h3EzbF0ryDCD3m7GjSiZXIFZvsT6SKZFPEMhE6KT?=
 =?us-ascii?Q?OSEmOujKUkNOlbq0iAWIPzdeAUrhYLzvg2eUTrnw3S1BPAu4oQq1jQkiTE7Y?=
 =?us-ascii?Q?abEQuTFLqV/3ZjqWXeS/qheXvZk690uiLCCRP3iOL4dyhOHyT1/Oe50OTMwA?=
 =?us-ascii?Q?jLli8EagyzEmWG6Bj673pxVojWkBClvD2r4kRS3KHTr37oRGd2uBoBYDW5sS?=
 =?us-ascii?Q?ul/h6dI3YO60Lm/p/xgvvZ95KaW6r+NhIVmLW/PcLAiI1wU0vxyInZmQkjNk?=
 =?us-ascii?Q?bCy7mWddl2mEGgGS8gemJX4xfZEx7Fr0H+TXMzoatcXWXNVBKBTqHK1DSd4J?=
 =?us-ascii?Q?vmPtQa00VY2KR4wGkqGJqjMT6BFwWGiprmLDO//sZLzRnO6fqzLg6nIqHOZS?=
 =?us-ascii?Q?nEOdx+vlAhXRfgRZkCypqnIIL4sz1nRkyOjD1NS7pQa2fK38TD4oftfqjjGL?=
 =?us-ascii?Q?A7DaepB39HzpmRTwguEMS4Rch/sIGulcBMdoCPlsM1qWmqD+a2e1wOiUj7ZU?=
 =?us-ascii?Q?zOHvVYRGnTw6PQ0hSeWsI17StbPYnzXI7wz8R+OP9fTWqkCFm0xNyER7uyOw?=
 =?us-ascii?Q?ftx/2eABMEeOxGOekXCbS+KmlfrEw5m9m9FnP7JqAreX7NKPI59pzE2W9+vn?=
 =?us-ascii?Q?32hcUIoJ/eA8db6UGn9CXFPmEwyEi0ZbGSCMSnr/4/iMQNxtvEt2Ow1tJjp/?=
 =?us-ascii?Q?yTU6QCKl30NCaE9GrIWyak9dKp+WTaA77lfWku1mxb+ps48UboVsFwTPj8rn?=
 =?us-ascii?Q?C7QvWzQIx3x8llRzeclRxmLEZUQjphwXsMvjW3N6oJ7eGwxbhQrV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2b2cbf-2207-4d84-c255-08def454e9cb
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:24:27.2299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeVPUiBrk+iqphu5MhVE7ue1vQuiPKUtq9ApFVQQLrBYSlPlhthGtDpjS/X8UeXdgmL5cbNeoiku8XlFZvUfIblGvN41oCKDG/TV4o5/wlqWpJ6SCAusR6950kcXpQX6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11188

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

If the fsl,num-irqs sanity check rejects the value after the IRQ domain
has already been created, probe() jumps to a single label that only calls
clk_disable_unprepare(), leaving the freshly created IRQ domain leaked.
The domain-creation failure path shares the same label, which is correct
only because the domain is NULL there.

Split the error path so that a failure after the domain has been created
removes it before disabling the clock, and a failure before that goes
straight to the clock cleanup.

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
Changes in v3:
 - New patch, split out of the single v2 patch. Fixes the irq_domain
   leak on the probe() error path reported by Sashiko AI on v2.

 drivers/irqchip/irq-imx-irqsteer.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 87b07f517be3..a2f0629b22a3 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -241,13 +241,13 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
 		ret = -ENOMEM;
-		goto out;
+		goto err_clk;
 	}
 	irq_domain_set_pm_device(data->domain, &pdev->dev);
 
 	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
 		ret = -EINVAL;
-		goto out;
+		goto err_domain;
 	}
 
 	for (i = 0; i < data->irq_count; i++) {
@@ -266,7 +266,10 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	return 0;
-out:
+
+err_domain:
+	irq_domain_remove(data->domain);
+err_clk:
 	clk_disable_unprepare(data->ipg_clk);
 	return ret;
 }
-- 
2.34.1

