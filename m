Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3933C3BFC
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786087489; cv=fail; b=pL7Hgw6Fa03uoSrBRHtcnzN8UctFq8q9DUR6WKf5qDcXpRhqKosPi9dxwxqnvzsAsdYz/InLjexAn/PktZnbRyKX2eUStUAARl8sUFfH67dRbDRWDw4DxE62QUCtNZsAFVsfGhGFR55rHKOl+n15s2puqcaAciiGHiacbhdUkUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786087489; c=relaxed/simple;
	bh=qkt3nSYgTkfmmgmHR9TMfUUkc/+USF0tlHufyAe5cZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MRO/3HlWzJ5+QsXqmXt6vxBgJ1KRyziE50gj/V+n4DJ5aKBRzGfDSKTlhEECTgNkuC2wL0d098uSRAoSiWHzFB4pdBH6BXiMHBmoN810Y3WF+oyF6EWheEf972FI2b/DXx6vbdqEwne84IaUJcR65m+q3W5gVHiOHr+tw6RAEQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ntfm2i5s; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ntfm2i5s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxkakN5rjCbiCdjlsGbG2fOGkbCTOQ1kMH5JE09IBPG1zuVC32yvN17YO6HCbsl2P9hpAhxQY0ixmTxvYq6SdNSNwjLEPONGmXf7X7UUCcx4lg1f3PeJG46kahY9YHDc/DINHZ22tLHjLwChC0xqeGUUJ+Q9Xr4OS/kntEY+DyjPnsRmfS1Fq0+1tUUQvXNhG4Gm6dZ8dNFRovWj2Ey5CT45ZgZ7YH+MXqc2R0K8b/K/wruCsU0cxwttyoFnsIbL172d7aypA1Pntw7k9TyIOAFetbJcX9gnAsUAJd8+y9v1swplqtm5w8iJJs/fqqb6uelNTQ1zgmzDeJttEFXdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lN1491HHeC44AURk6rIG5zkjMFGwgS5ngwbBifv0LKM=;
 b=bYuGIlz1usks97XbCdcVNFJxlklOsPYDb9SSO/urKKjUq8hX4NvqQjGH+op6Dvr9z0LknZN1CTo4vo2+KQbeR53+p30bdh7K0jkMsZ64mi7HtIkxvniwVIt1p56s0QhHULGqIV+GvI3EHPyBw9HQmm3SrUfEYeYe0Cg9RSHHC+RNVbQR8z6gKzMOZxsOv8wElPwOdMy1jc74wBTC4ZkjZcT7GzNzc8bzomBfh5sTuJz8PgK+LM3CSZeuOMg90rNIcn4Fr4+YduWIh1EFI9qOyTGNF0+rW2po8kvKOjZpO36REv6QnWJvsJSz0eTfHRVEfErbgGhS47qdGHkxJv1BRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lN1491HHeC44AURk6rIG5zkjMFGwgS5ngwbBifv0LKM=;
 b=Ntfm2i5sx5Qj+SZA3RR/pSke9UQxFNT0xI6ZHa/RntJUyp4yxuZRaeBjNMpjyC76OhnLv5u/dh60muB/DuiiInXHeydGaaQWloo4bc6sjuvLSNmRFyNXuG/w/D3vTPjLsKMsHpzGmAwi0dmuKudy5umZ44vX2xjztR3LEBnL4slZOexA3IA9HL4xuQ7py5LXYe2pbSuGBBkBsZwVk9Uxj/z9j96tJIKAioNZ6AM8znvOJGc29wnRpXuby6tO1huF3+TO9fzAXRSB2Vp/r7F7raUxdHeTtUseRDwEjaMLvfWAdNPvXtQj8IGCmbs+YzrEhcpgnteg7647GoOlADDlxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by DB9PR04MB9233.eurprd04.prod.outlook.com (2603:10a6:10:361::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 07:24:42 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%4]) with mapi id 15.21.0292.021; Fri, 7 Aug 2026
 07:24:42 +0000
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
Subject: [PATCH v3 3/4] irqchip/imx-irqsteer: Mask all interrupts in probe() and remove()
Date: Fri,  7 Aug 2026 16:23:45 +0900
Message-Id: <20260807072346.1222389-4-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::11) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|DB9PR04MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b8dccf-16a3-4adc-ec5d-08def454f331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	52zUwAFry28zdDZxHL+PxrpgqyvZ9441qLf230fasfw4OwYNFOz5xtR263M0dDF7l+8BWfgh4H19sB+30uWgWO0ur9LRSyZ5d9/5WjbEXucGgj0uJWMFE6iUUkWodb+I+yfjG28rIks0emW9uX0iiyDtJnk1GLqcoIHOhxkA7cPXoHVQif9KQtQiQCUPHJm6YgLtvLTKYW5DDJWfXzjQYmM99qe+kYA3anUM7dU3+toOVPjWUw/CTT1353Dt3jnEVWHGjmLlLciyd4b1GA64uaIAmQ2SfMJR9HYUeQg2ct2gdSUc2qpgUlWk6DyAZ/ZeaL7cxdS633uP4l2OrDOc7bcuI3iiJoedqhSYP+Epuskizey7l6RDNy/eZZsn5N78qg5jO+P/MuofrIS1Xsaz8uRaNPmlGBfXGpzi6v5HTO/CFrnNB3aICqjERF3Gk7/23jn9nBSfBFrR9bQjlkFcKWC4rsgAUVm9YoTI/Bdi3bpKjEintXplaxctC/S2BCqi5eJLR/M6uAk24JAP6oEZ8ZGHN1x3/ADGydVurQ6uES84J54WcWwYCQlXQ4IpG2Bjp3wTOXuT+QrJsYahmRI8E3HbnIcG6x2rNQ74+k/SbdL8eYMYtaebFslxjprJcs2lfSO6ohbMYkns++Rri6Kaap/gXnUcRdRizYSiDTeC3Kg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hmIZls8WD/ct7qsMfz7b+GsUdErbEGrwgDnbtsQGFGZfCpEs8krllAufsVbi?=
 =?us-ascii?Q?5RGomXi5u2tdMf2z3wZwn1QrYHnlGfGrn2tpt5Ls/FMlZmwQUU96ztASxoGX?=
 =?us-ascii?Q?Q8BMwezpBR0k10sC51RZAWal9WZCafxYRCDaq6RCJiY4bNNVxEA76SS3T/IV?=
 =?us-ascii?Q?7hM+DQc8XG+EC0j533HJv0SLn7uqgCB4AgHS7WGPcWmIUpBe23RiZEb7ppoz?=
 =?us-ascii?Q?AcbwkxenTJgePgB/fL0vuI/4HTYzLsoWu4L64k/f72jWs5PcPFxTk9ZrRMXq?=
 =?us-ascii?Q?09lT+DCOcpOm3npRzY7okbv0BCWLfzuSMxNviGk4SlrW9FrFDE3LH8vzj+ku?=
 =?us-ascii?Q?APmTldJItZz2l06RI+J8mrtEEAjBRFgsG76NiOW2rK525m6MmBtcmOBTis5R?=
 =?us-ascii?Q?sASBWcH4xtfZl/B3FFaCsHoT7VZ4TApWY1LrTKKbGV2AVEIewXbkaAedD1iI?=
 =?us-ascii?Q?P5n60FM6VMT5fTxIKSZ7JTUXSW1vqrkNj7JFH49W58MQBaTVgBRk4j4Ycs4u?=
 =?us-ascii?Q?7DW8rq3W1nRJmMfp8SedPj1oyD9vFjPm/o1KQqyCkH44qacKpA2a3pKL5A9H?=
 =?us-ascii?Q?T2+Wp2m/vhqzK5mZsON9Bf7AI9fkj1AIoHMs7wy5/fdSaoSPvllxrNhaEyQb?=
 =?us-ascii?Q?mK6tNmUBB/+hxZawx8K5b5mSxjJKY9nIZ7VcWpnZhG9S0DDVWRAC+Af7Y06P?=
 =?us-ascii?Q?f4P9frcb11KMAVNeYXQJguVO/BY/BZom3xmyv0UshvorBAzB9ikA2i8k30CK?=
 =?us-ascii?Q?+3Q2fBTk7++8JeRrx0Tl3XSzfOzmNipo9wCsYFJCqQ6khAcItUMf+VdIrdQ1?=
 =?us-ascii?Q?Y6jiFobloSnf275VotnR+pmT/FLRX97PhV2OjvE/docHz6zPUbzMO0wQKIH8?=
 =?us-ascii?Q?sOTRoKFza32P3voXaxNdBId+wWHr9zae8kuVj9Vwp2JlvhKPhPgjHmYij7jQ?=
 =?us-ascii?Q?812A/FJx8z/xpQTd9GQj0nRQysMPCr2+P95yBFQFSaKZnjcVrirnQzK7aUbV?=
 =?us-ascii?Q?KoT7Sp1v+oABjaCVOLH5hV8siOGXBRq4D477ecIROrP9CEoayUZQFCjCCI6S?=
 =?us-ascii?Q?HIDQ6EJAOPNMd5Lw19bzPDpznt9JQYYchy5VmJY+h7cyiZS/KPQTolWoARPT?=
 =?us-ascii?Q?JUH9DSVeJf4XU5YtiMMWsBt42vSTMRNQGHUmFYbcT/ZTrjU26DCRQO+4b0uO?=
 =?us-ascii?Q?TtKd1GiACU7pbr0trl5z7dRNgwCmIAPESrOSmiNycXgh0WgwHOD3S1PKEwi8?=
 =?us-ascii?Q?aNowyz73N+9qV5AKZcEB/4Ys3eYrNa59875+Pim2puqYzYYnjKXAx8cIfbR2?=
 =?us-ascii?Q?hd25E9AunBjfCz1u8/LzNHzIUxVlcWDvajk9/v7s4uOw6F5HMjjT3zJKAEX8?=
 =?us-ascii?Q?vgv6VV/0NVH5oAfdRopELfNmxJHoW38P35KG0SMKtd6jk2JGKpWiFxKV5Ebu?=
 =?us-ascii?Q?EicT0/35lljh6zMutdGsQaSiDNecBhbmAa/8rq0NNkgplyhgTOPYm/Yfn/+4?=
 =?us-ascii?Q?CTrmcyEbtsVK7a+cvGVdWS//6vGv+vfXknVlm7RuXsMY9b+U2UVMtDYAaYL9?=
 =?us-ascii?Q?fakHvKbRr9kzdRaB1nuuXjx5fGwELhnulvwIkSsU2W7dh6z5AP0YP+fMCRLl?=
 =?us-ascii?Q?timA6Vejtc/vmmtMyRwwycuZafkF1Z1arLpqTNSldbP/pnFckmFUOfG1i564?=
 =?us-ascii?Q?JiJ9dWWvLxax1mqps49ELB0CAbFE0eM2xP5vKYbKHEnz0Uc1hWM3c13/fGkF?=
 =?us-ascii?Q?YcAVyqCx5BnaQhgOtF1nC2Gu3u3jr4+4Lm0Up0jaueQOTe3OtXrB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b8dccf-16a3-4adc-ec5d-08def454f331
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:24:42.8861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHVZnCQ2d3znPmg0NknjFWv7MRDeSKI/I51AEvHK0b5UsNRvTZq+o3xlWpU1wZAFAuqW/gp9sPDbcQCYkvLIGzA1iW/emifMNoMfbSGQ9MTS0x9KR5me+ceFjt75gEBG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9233

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

probe() sets up the chained handlers without first masking the input
interrupts, and remove() leaves the CHANMASK registers untouched. For a
built-in driver this happened to be harmless because CHANMASK resets to
all-masked, but once the driver can be unloaded and reloaded a child
interrupt left unmasked at unload time survives in hardware. On the next
probe() the parent interrupts are re-mapped and unmasked before the new
domain is ready, so a still-asserted line immediately storms the parent
with no handler to service it.

Mask all interrupts in probe() before wiring up the chained handlers, and
again in remove() so the hardware is left quiesced for the next probe().
Note CHANMASK uses inverted polarity (a set bit enables the interrupt), so
masking means writing zero. This mirrors the sibling NXP chained mux
irq-imx-intmux.c, which has masked all sources in both probe() and remove()
since commit 2fbb13961e74 ("irqchip: Add NXP INTMUX interrupt multiplexer
support").

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
Changes in v3:
 - New patch. Masks all CHANMASK interrupts in probe() and remove() to
   prevent the interrupt storm on module reload reported by Sashiko AI
   on v2.

 drivers/irqchip/irq-imx-irqsteer.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 4a2fe8ba97f5..0c9c99f1141a 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -236,6 +236,10 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
 
+	/* mask all interrupts before setting up the chained handlers */
+	for (i = 0; i < data->reg_num; i++)
+		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
+
 	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
 						&imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
@@ -279,6 +283,11 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 	struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
 	int hwirq, i;
 
+	/* mask all interrupts so a stale line cannot storm on the next probe */
+	for (i = 0; i < irqsteer_data->reg_num; i++)
+		writel_relaxed(0, irqsteer_data->regs +
+			       CHANMASK(i, irqsteer_data->reg_num));
+
 	for (i = 0; i < irqsteer_data->irq_count; i++) {
 		if (!irqsteer_data->irq[i])
 			break;
-- 
2.34.1

