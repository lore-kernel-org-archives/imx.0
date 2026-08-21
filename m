Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE193DB63F
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 10:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307109; cv=fail; b=TZTDlXta7cwa/4EuPkvlocD0SNDtSuuppxZz8DikbCPWaZzEu4Xb7VA2smFSBe2cO7otrbmAPu46a37L9VSDPcCD8z1VnZerDLaUYAZijLfYcP0EaY2aeSWr9QF32NpyyZOOkyKDm2sELgvpZaVSrPc6w7SaRKquRDKKOz86DHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307109; c=relaxed/simple;
	bh=I1xu28/7Qmx/b6Vc91X5K3AFvG1nOn4sT1CdyaPPUMA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pdlIPa+lOx9mmw8f39zPyuI7W2Q3Gdf+kzMc95lMKRPcOcGr2WD6ZGLT6YNc+sJFKU2aHQyrsbLVJQw/m+gVM7c4BdSWyHfVgQ+hVc18Aed6Q4xYGmJtAq4OxRc2BrfNiidrMk8oTfbjdOGll/9Sck1bD6gVjjewqJgb/qowEQI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AwgUBxtx; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AwgUBxtx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkqncZxrLrdfcvDRf6XHx+f2NHtWpa+ONXaCQNzW7myrPmV3xHQnEPWCqfty/qk7HQaVbTKKhj9gJ3ukv5e+Fw8rZIJ+y7DKK9crKCT8E9jrnw81GnFY1j/mr8PA37dWr8p6h/sE4A7/IDszzNRgaRaAV2EpuRFuhimGSctut+dx4jW85mOllczjhsdhKWU0ixhhf2E1soEwqr1l0nnMYBNgM+ttyZV0xdId8CMC8xVWENa1Zqck4XNtPO94UCFkOrYYZHrwJgG4Y7z6QaCYuPyhP/NZKpc5xZVg9yjDJprK4LrphlwA8aQzwgBTwKiSWM7+5kJyK6jS59xh6A8k9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z26DbfoJ825FAn/v1pUIOuWV6BMKykPiYpgtqhwnkJo=;
 b=UMSY9W1cvntUAZV2IIwItrDD9PPPbtIbYxE+SgzqNh/ETaCKAxy8mxUaZ76dGwBjlnSbfYOsGnygj8auD64VMTXBw8EgnqRl+RzZ8bmyMqog/EOMDURBut0AXsVORVtcKQjczArqYTPXDLRtXRrDsngpal97M2dM00ck6mGJp2298cNDcfLRTW4H5HvDzxDjX2gq8ks0DGB7D62H3WBEnN7BF/ypU7Nn2v+g1cBh6XGC1MG0WXaO16E9XYqurE7+sLL3/2oxUSs/7W8rNuq1cP0wTK3t4QI6PCWS/Qo2Dc9wiU91FJEjyJ8aKVxil9FrF16KGqlJkHrEMTAMFFvtQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z26DbfoJ825FAn/v1pUIOuWV6BMKykPiYpgtqhwnkJo=;
 b=AwgUBxtxWHo8N/zGnJKHLx3J+B4qdeEbI55f094xbDgcOpT0eB8KRGBdO3yd4pUUVZ3nccjMAA+DPhHf3iHRhaQycZ+ZKhURU0OvIjUadYixRK8gz+xoGDil6nDUCNzbgAvCT4taAqBLn1Xj4qAhcIZ9wyZNtp7bN12jYce1a4tXp74vzJbKAokMXazAFGDFxzRdaJR+Z7uC3FFTkOh9Me1Nvd1Cj3MvLxBJGsSW0chPBEcBosEnFqcmZlgx76FcudBAyfEPluizO5czzfjWZlzd4zg2syMME64079zhn0hfR1KnoDqip4VWMwuhFPu8Dg9AlEJyUijCjpAv4nA3Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 10:11:38 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:11:38 +0000
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
Subject: [PATCH v5 5/9] irqchip/imx-irqsteer: Mask all interrupts in probe()
Date: Fri, 21 Aug 2026 19:10:35 +0900
Message-Id: <20260821101039.4037925-6-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::20) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cd1bbef-0323-4595-8a8b-08deff6c96eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	c0qyTQ/M/Za31bpnbmelDzFilgjlD5qN1TRn3avgpxewBj65PKVlshL0ZtIyX8JQNDy8TCnCRmBxp5se4Rvx8+XHGMoiRpCJKEP2NhmysFw0xCp5fIZDNIiXsXbuJ7tfNUfKyRFnP3VRUTvrIJ+gVSKAaboU7psuQoWNf8ITfY24W73uEzocxV6muGEPbQz1qcqdPX4AbzxXM4gxv1XPbK1pC3POD4v5r3au+LNMlJTEnb6yoPlJkTRw3DzjfShA0+vU43GsS5NG6T747byv1nezizB6+huB4GbJK65rFYWxI//X+AH2tqQVmfzDIEIdpR4ER48IeINdAjzuJmgqv3M6Lr3tWtMrfXAGmmSp/y+yVBldpGGTa70tgQXXvu/5mRIPoWvn4UIOnFlFBLhiRQNCm+nTGw6QIjCQ9Xj9P1KM37XHghZAisN285YJPt9lIW9a+Av1oId5ckv4AAs5/OwF0Upm9y1gMzudRIwwCQZT5yb0/UyKOOfMnYu0+aYRKud981/QMDphwTGVLY0d6uHTwJlhCUJnSufzbyEOpGMMS5haQnUP7CoJAdzOr7EhvVR2NWVweBB6vXijU/8ZKf3lmO09XcysddqNvSEtZt+zxTCMAcanDufuQp2RaHbs9IoH0xGJp5ewNmaHDlU7byWhGxCnBJk12MSRquaTmaY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bmlsrsLCyP1AOqKsUAe+my5qznE4GRBoF0k7UN7NEIbqks0ue3iEH6oclAPU?=
 =?us-ascii?Q?yxRUw8t+tvKbhraZDrWOe7GvEV4+kPjdCJ8z0C1zKHs4+PCFbeUKv0kiA9YK?=
 =?us-ascii?Q?CNHcsKY0dI92y3LDvFTkbSthaTOVdFodtLGA/LtU4NQs158PLI+qetf4Odb6?=
 =?us-ascii?Q?fdnmP62/T/Z94+ksyUqab3wI46+T6FrYoQU9kmp+j7DQMfywwv5f41g6V3Oz?=
 =?us-ascii?Q?B8H+HMRqH8Dhby7p4Gj4OfN0W3WN4MbDVdPe4upLi7zgARRZ+y9Tkukmxivn?=
 =?us-ascii?Q?JY751ipMilDInFS3wH6HPx0m7OwkPYzxYFio2AHxkMuOseSR1WX2SJk6ECVO?=
 =?us-ascii?Q?Lg1IL2LNPJAzhbaRUDhqg3kYPJYYtexT3v+hVc9vkCl5UwIdTuZ5F/5u4CF3?=
 =?us-ascii?Q?kRDf51JVCsPW7Kqj50JrvigCIQICGA/uTNZPdzyCIB/fYmLeksxzyOGi19Mt?=
 =?us-ascii?Q?s67ndlfIqLpaZHEYW6/MZxC4oJA383E2YPnzRKUcOLnFAPlNTo0UchoEOdlL?=
 =?us-ascii?Q?Z9JcyGO/wfr7bd+wgCsKcM1+RWgRpL0j95dsRyPU4Ar/YZ3iO98rY6eUExPR?=
 =?us-ascii?Q?2UbYvhMmVQVWUXs0bHqakYTqaf++kOO1WLTzyzJOtxJjoM2tHYyV3YCpmJdJ?=
 =?us-ascii?Q?444fnDZzTEvvYrw8E5zRrxVhVGyCmqlFFmZn5+CtBGjhjeaS1ApTTIXHQnyl?=
 =?us-ascii?Q?hMe/DLzPxAy+jf4rDahPedt3n7m2+icK8JWvqSngyj09uNhloCVnTmfy+Gnq?=
 =?us-ascii?Q?wvau0sKWg7eOCY5sKTKfx4qxnDcyUeMoc2BxD8IYqvJVDqYxum6/cZcj5k5M?=
 =?us-ascii?Q?b99kKy91ApO4wPagakQvmAwSnYu6jJR3O1eSMkRLPaq/uNpO6UQP7GdtKRRo?=
 =?us-ascii?Q?UGk3CC0/5yK+AZKoZdD7wPHZ1SKR+AQirXervJBWeF1MYtMW5gbnA2wNB7mW?=
 =?us-ascii?Q?D/vKlFaYl26ElvdWEtdeKB7BVIQTKnvyhcvA7KSxc3ojKXG/r5jE1ncRdrTk?=
 =?us-ascii?Q?gdE1a/QYwENzJeOB9ySUCZ3/GmickwXo/InnSxmFnQfqid182dirvR8+tyWV?=
 =?us-ascii?Q?WINwDyZJTLdj7ke85VGrb8/BcGfnDuKLXvDuXyIswH0UigdvqpxsCXByTkDP?=
 =?us-ascii?Q?3hHv5Y3sY0r1UPGgRyLNcoZ1Ep2IAwtEts2nMKKRQ1+UCaWW/NIZooKAarIj?=
 =?us-ascii?Q?/8F9yLSr7xhL+0+5/NwT7+9B/tQMkZDHgk4OFABiqv8E1Y/+5V48BEWRPvb4?=
 =?us-ascii?Q?50bhwocN92zrUm64rU7slH1TVtUuj+wtASTDT5TmLPShbomG4A9r1FGdVSI4?=
 =?us-ascii?Q?U1Dna0/zTsdqCwqR/Ahh36HWXrvtMfcbhjb1wIJV000F5yWvUFbp02SibjKO?=
 =?us-ascii?Q?Lpiew/vqbw0dHuR02HJa5wxrba2z3MetisCAIeqYZTdjuvz4cfjiU0eWXDSI?=
 =?us-ascii?Q?oVkg1Vy2LaOdD+7rNZvPQSAhZLVMxZgucNLhD5b4YpCs/k2yA68KWxJMOxrr?=
 =?us-ascii?Q?NQcEDGKOyaQXBDbK6eaMYKi031jQEKpykC437eiZItgnu6ObT9Blq8WtkxGC?=
 =?us-ascii?Q?5tlsj4kDKHdOOD4fx2duepfrHMcxiR1PDNqaM/xBPKmqZvJxHsnAEagPlaF6?=
 =?us-ascii?Q?CisBsy3LrvuJBINUmGUzWs80qqxTffYx9Lna8gt96/FlpaSqsnGP0twhQG3n?=
 =?us-ascii?Q?llSsuuv1lcYSYdHWEvy/PFrKB6Kr28S9iSrmffGpDb8SEIXGRy8G2ak0C4vr?=
 =?us-ascii?Q?Se+KtA0ZvbReXyL//hkFX35GmjNjSsIAmk0H+kU3lzJ0Q/jBtotJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd1bbef-0323-4595-8a8b-08deff6c96eb
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:11:38.7770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5A8WNOFNDfRVj30Wn8wrNmDuSuUPq1an9k9hZ9TeuoQxPkXYGflmAQA4gOERmdNpc8y4qI+vZv3heZV7XQGt8u5CdPAi1rE3YFKPzbfL2zrmMSuUBA/wgFSMmYPWqa3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

probe() sets up the chained handlers without first masking the input
interrupts. For a built-in driver this happened to be harmless because
CHANMASK resets to all-masked, but once the driver can be unloaded and
reloaded a child interrupt left unmasked at unload time survives in
hardware. On the next probe() the parent interrupts are re-mapped and
unmasked before the new domain is ready, so a still-asserted line
immediately storms the parent with no handler to service it.

Mask all interrupts in probe() before wiring up the chained handlers.
CHANMASK uses inverted polarity (a set bit enables the interrupt), so
masking means writing zero. This mirrors the sibling NXP chained mux
irq-imx-intmux.c, which masks all sources at probe() time.

Masking is only done in probe(), not in remove(): the next probe()
quiesces the hardware before it re-maps and unmasks the parent
interrupts, which is the only window in which a stale line could storm.
Masking in remove() would also mean touching CHANMASK while the device
may already be runtime-suspended with the clock gated.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 071ab1ac1fe9..b63bf957ab88 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -239,6 +239,14 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
 
+	/*
+	 * Mask all interrupts before wiring up the chained handlers. CHANMASK
+	 * has inverted polarity (a set bit enables the interrupt), so writing
+	 * zero masks the source.
+	 */
+	for (i = 0; i < data->reg_num; i++)
+		writel_relaxed(0, data->regs + CHANMASK(i, data->reg_num));
+
 	struct irq_domain_info info = {
 		.fwnode		= dev_fwnode(&pdev->dev),
 		.size		= data->reg_num * 32,
-- 
2.34.1

