Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777919;
	b=NP6za6FyruRV0kgA9/hZ5lZqaoWtwAKG14uVd2DLJkfUUtvf5s9Bxth0tTDE014L4A6g
	 DbRg57FJgIL5iOVaPJQvf8TF5wt88BJ6y98EX4KB5iQQP0LinQwq1Hq2MXWPp3hL/RyPR
	 Bzmd64mKtvoq9u+ulsFgn5l+Ws2VSqewoMwRx3eHOmAdQBeSkwxWkCLUOAwvOgy263Hsb
	 OTOsZnaE7TN+hGE9JzkFQM7J2/xbwjrQo75RMqvzIeMJok6ZBHWVxLiipRtoPwyrsh/BG
	 j8gSzLx8LB+kqMTW0fpT7lHsKOxOePZYLUOAXBT3IpX0cuzqIzvf79908bfyGoAX77Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777919;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=GikOo9jUunjcwRVbckybVjopCYN0E9I4dJq3KijhUgI=;
	b=rXPAAz9c/MRf0JJphBX4z6Atg/UFtdLCu0Ph+l8f5YU1jxZr6DuNlqjFun/8Bp+YhzS0
	 VxZStEMDfjpIy8N/BUIXiPm4aLoVRxOThgbxFZu+L2WYIvOm5QGD+75CN5qkvmGRzjkEf
	 73F5K5Q8s7zy8AX+8r+3VbeWhtv/LRuo2SnvKSV5KNEgHofR2+xuL3bIQ9LswVtoc3BF7
	 EJ5yZUeWfMFHisyFE8I9enRsN004XJtK+JfdSEvE+ZK5ICA5OQRa8KwiGatvcus0Kpgcm
	 wm77ug0z12AdjCq9qiVHleqcwc2YZnj1npQ5RBdl0qiIhdgO0LfF1fsb1jt1Bmrzo2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jBps++wn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.15
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CBD606A326
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 07:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87CBD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jBps++wn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZnZtqONG3mLSntl95YuZApRAZzFpXHgi4ncUcV/jn/kHRRXtvF6l66FjA4FE5OZwoslpKRyofzv7o5FRVVD3yY0UN/10puPIgOgrnEk3S/NefdfvFD8XqfzJT2Ier5a5a10pZT6bOXLCzJ+O8jg+ErnV+3t0TnMvOwlpD+xZhSWElvogBCne4MQkNB/GicYohpvj5fnBSs9Ht5BzJfBgv4xLzS1GY7rxVYI+jcZW6/g0p450PbmO116sg/DVMjZpjcgtT3swTfnQMTbfgCdDCM4B0/40gg3CGnu3NpdcRuBQeiiLJJL74wxxTuem9vLp/yYwuREHuCGK09bD23zOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GikOo9jUunjcwRVbckybVjopCYN0E9I4dJq3KijhUgI=;
 b=I4Dy7WqyPnef8A8wKE+wUkdmPG3ytCHXMRpV9eg5gNHgbPxpNQ4TzfOeltqzZqbReByL9v4k/ZiSZOoptTyMd4SfSsTbxFb437C0j3VS0YNJBUWyIcbtplPUeseghtaw0oo45g0oQPUsnHsp6kOGNz/fViDkD1U+KXyqy84jKSVKCxZgGiVzAYZ0zXVvmZnSWU9V8B6e7PvKY5fd5B7jFwxXhY29P/fQxaf+9tjYoxH5VOps6aKb9XbjhNdlpyaAOzbZBTqL6CBb88PQJMR2VokO9ZZt5f1jURCzbhh+M1kDOPmMkIre7ApTOeLaH9TofVnnZn2M1NFztkgUZLQwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GikOo9jUunjcwRVbckybVjopCYN0E9I4dJq3KijhUgI=;
 b=jBps++wn2sVUxv3oxn6Ac1HHc6EA487lTEQcBn7tGjv0TrOz2P6dqVhuHwOqlAp+TxisjJmBUwXrH5vZn1YyLcHDZT5+QwiwGZHYazvcQjVoLiTufoyPMYEWrsql1EVW8wpRqK7XS1jkLk36jB+DPY18YvX7qm9PdPcAzs5A1+vzJM8bkhv1OeCM3e6RQxeRqXZHtQbaYh+Xd3yd+OXSNIY76/kpvhS1Zw0q5i9LqnNtilVvNs4iLVpbxvEgckudcIMGSnhT8wiEp4RAj6JYiHPTh8SNms7jxV2QY1X+NtOcrrjFMJpBRJ3mwibcDweXqN4USFjD149Q43A41xyBXQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 by PAXPR04MB8733.eurprd04.prod.outlook.com (2603:10a6:102:21d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:38:35 +0000
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65]) by AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 07:38:33 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Fabio Estevam <festevam@nabladev.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 04/10] irqchip/imx-irqsteer: Convert to devm_pm_runtime_set_active_enabled()
Date: Wed,  4 Nov 2026 16:37:52 +0900
Message-Id: <20261104073759.386777-5-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:195::9) To AM0PR04MB6849.eurprd04.prod.outlook.com
 (2603:10a6:208:181::7)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6849:EE_|PAXPR04MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: f0715268-f4ef-4ab6-d9a9-08df3a46a0e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|23010399003|1800799024|6133799003|10067099003|18002099003|22082099003|261102123227099003|11063799006|261026121527099003|261028144727099003|261026140227099003|261022105027099003|261021121427099003|56012099006|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	j12LD3znRnC6+o3QtzIxa1IcFYrQUhBfQ7cdlEldQ07AkatXRRjLX4YyeB2kRKNjktarCgggl/c0L1oQ11j5o2rvnladaNVRLZ+MPTXNC3GMBLB0QJegbZOQqvaNKp/my1jzvVtz278k8LfsTq2tcVKDnhTQm7VqvdxN466jRC8WPL/IIqILCRIdj8COacUhDM8Oyn45BRVUSmaKuPxO7vB1eTTqmpge1ekxNFGzgk2ZNUwS5hASnb3emwpDCnsfeukFWnZYtWZKHcAeor4NtlfAQhGl16xeeih+SFjxcb+rst2sMJcihFFCe/UhRzJ/gzrCmLJmc/FjiS8m7hWVLGS3OypbN82bWX63SluR5G7DVBqvxyKoS9j/BakbMFp60/SxM0Cdfk8P6i5XSE1BD000G5nvLr76k/5jYGZ0kPj7V3rCRs5PLsllA8KzC9tzFkrTDbZuShP+bQK0le2Zbs8oL+eiRC/sq47GUx+AW5XlfA5+RRTFdu0jAaedbDrZJ1u0bOjFW/nospObWJkoxx+Cdz6pLuL/uETDhCEPleK0B1x5LXWjIdKO7djf/kENFFDsGMH/n/bWdVHFfWYbsuSYaf8lMjMfsVlO3H8QvJUgmLkkz5mvlJ4wrRqGmvSkkNg0wqfAPs0wALMzOio6Mqu93dovgCTPJBxUABvAmaE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6849.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(261102123227099003)(11063799006)(261026121527099003)(261028144727099003)(261026140227099003)(261022105027099003)(261021121427099003)(56012099006)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kEPH5SfYIrF7kOv7IiUiCoMESmhaYhiECYIVeaLmwDAs13Ziftf17DWsmfM5?=
 =?us-ascii?Q?o2QckDOc7Fg688OGL8TkWS1SYPFuvc77pqQir9SlX0XK0WgLujLE+9SsyCxV?=
 =?us-ascii?Q?yqlKwlnA//hjOF4qJbgVafd+hoM5uJw8cqRwlY3MmdoWtO5MpQcIE4J9XsdG?=
 =?us-ascii?Q?uQnPth/DuMudO/SeRqEknttmsKPm3Casim9q0JEhO/MIWVVwir0fraOQLrjD?=
 =?us-ascii?Q?nnNzOLFrlqKdNoEJSXFUCd/4XkTX7QlXiIK2dM3EcPd8PjE6bnduPtVfWDOl?=
 =?us-ascii?Q?zhbgC9h8cMkJJP6JWqLTf4Eyj6Q1k+qv1y0bA3IOikVltb+mosdCbHmujncd?=
 =?us-ascii?Q?KBMpBhKigA54HYLgXjiimrgb6V0DLUhpGkp6zqBBXuucmkmqVVb5J/T8swDA?=
 =?us-ascii?Q?CWH5kOhMuvaOX7X4GVsnzItPEGhRHfhQyOAo4sXtXv968JlPRRGZT7Sjmpp2?=
 =?us-ascii?Q?CxD5rpYCD7f2xR524g566DF/rKA/NZXmy5MmuNUsPqHSOKdOUzkNzOc1BY8w?=
 =?us-ascii?Q?ZhXyo8LNYEg1Ip5VVjNDBfkMXvpVErQrymTwdU7eK41rDsQ7aimmgxabMqkO?=
 =?us-ascii?Q?7/JFkw1opgjUn0DWhLGW25Ci328YVd0qjDhPOD5mDjreZPgNyDw61abQ6+Hl?=
 =?us-ascii?Q?yJR1rsi+NAbEGwGch3XMoisf6RXAwK8JpL7Nbd/rpVrn2ZhOIni4TiBot1va?=
 =?us-ascii?Q?MGuZFxYxIMA8yITHfdjy+kvFiZKWcH+AHZPQ+1iSF+kRpTOKbIPIL5M6QUxP?=
 =?us-ascii?Q?FyQRgtOoYkDUlJrFAjlJinK6R9yGpX3ccLL6Uz8eCcJPO8TcfCnt8YgsLm0n?=
 =?us-ascii?Q?0x0+3GqDNoQI6AN26FE0Bt+M0W2KLbsrp6e4VJKBY7SpTCIXCgCPJmmZ4Pi2?=
 =?us-ascii?Q?72OmihrKV8k70U0nl6s3CBUaHFjXu98Uzve30Um0Tk8tZ7ijs5w6IIhzR2Pk?=
 =?us-ascii?Q?iK4smD891MapgVY1sjHHwkzO8a2katDu+QQ4mm/lcdoU9WJ0NCbkqNa9q7tW?=
 =?us-ascii?Q?chIOvAn2OwpOTga8ClCfp1v5yNRYc33TDhQfPSwH2OZ+FJM4N+5XHqzM6v6q?=
 =?us-ascii?Q?QVYLWesH47mIjfpG23vs3oiAWX/lcNeWfUn/GvA5cO08/eQTuvBbLCcqOfBb?=
 =?us-ascii?Q?oUBrBuRpfZjX1pSx6kFzslF015yDfPjscigWz6PTMyeQ9N7fvqNdwvAqLu4A?=
 =?us-ascii?Q?3xdSWmeEQKL2yYa693DIJBwxuK4Mc0KyyCkVd6VLvSUDCZrgHJlOnQgZ5nQE?=
 =?us-ascii?Q?lg0xDjBLuQWaZm2gN4UeFqTFfb7hGpBvRyZ4pkdKuYw8ixA1+galpkf4cUQA?=
 =?us-ascii?Q?IIruoadzGZ0TNqItZA1wzo6RmLu4AwKiLMuhZdV6y6JD9iZ6wMQ2cHMq475X?=
 =?us-ascii?Q?DC0PB50BQKKgmi0M8PUz1MKPW7sc+2c9Rq37OLlbppKyQE8jrWJSGtu9yW/p?=
 =?us-ascii?Q?1tfNlLUx3C26rpXQ7q7I6FWZWlRiym9CrK2IihtOQGX9sPCGyQ1NsSIIEaX3?=
 =?us-ascii?Q?efvR0csWxyfn0NCRijeFmi0OZwxgC0Msu4EbKxxR/adGgpn5hpsojcR8b93e?=
 =?us-ascii?Q?eLkLpvOy+g33fwG5D4W1wK28PYsaAHXK/meEzvdBfin2mCWjZzUdiGw2+U8j?=
 =?us-ascii?Q?00QrGUuemyB/zRs4RZQc25iUXmfQzdpFHQna6iMy8Ledre+o6IZeEcmK5PaK?=
 =?us-ascii?Q?wuCIsDlObvzVUDlHicOMFq11y+9bKfeYUHlM9DV8jOc/GkRNYcuoD12eBT6/?=
 =?us-ascii?Q?IQvbUSpwJZ90ZaXJ/A/1KBQctAmvBHNsi9Wg6mTnpIab2l/qVOWotp7EmEFD?=
X-MS-Exchange-AntiSpam-MessageData-1: VA7CkPHt1LKWKg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0715268-f4ef-4ab6-d9a9-08df3a46a0e2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6849.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:38:33.3893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNhortDFGBbft72IfPNaOmiGWzbiY76bTv+2z12FVXhD3ASBiGu8vmGD2riQJPKFlUSoSJ517EAFKIrdVmYnt5Xzy6EkworRrcf7P2LYSqOaSztiFy55ZupgYY4/I1c/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8733

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

imx_irqsteer_probe() enables runtime PM with pm_runtime_enable(), but
imx_irqsteer_remove() never disables it. Runtime PM therefore stays
enabled after the device is unbound, and rebinding it triggers:

  Unbalanced pm_runtime_enable!

Use devm_pm_runtime_set_active_enabled() so the driver core marks the
device active (matching the enabled clock) and disables runtime PM again
on unbind, keeping the enable balanced across unbind/rebind.

This becomes reachable once the driver can be unbound and reloaded, but
the imbalance already exists today on unbind, so fix it separately with
a Fixes tag for stable.

Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
Suggested-by: Fabio Estevam <festevam@nabladev.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index d05de3d26fb2..a0546f11936d 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -239,6 +239,12 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
 
+	platform_set_drvdata(pdev, data);
+
+	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
+	if (ret)
+		goto out;
+
 	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
 						&imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
@@ -258,11 +264,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 						 data);
 	}
 
-	platform_set_drvdata(pdev, data);
-
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-
 	return 0;
 out:
 	clk_disable_unprepare(data->ipg_clk);
@@ -285,7 +286,8 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 
 	irq_domain_remove(irqsteer_data->domain);
 
-	clk_disable_unprepare(irqsteer_data->ipg_clk);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		clk_disable_unprepare(irqsteer_data->ipg_clk);
 }
 
 #ifdef CONFIG_PM
-- 
2.34.1

