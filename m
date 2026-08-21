Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3CA31F9B1
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307079; cv=fail; b=gSAyKpuqXX4BxAVqZbbsr9EMWDTZhKjEbv+wMStdMruZIHq4qMkHltS4Amj2hAAxia9SzaJ4DUjPWqRFn0eBLX8qSOQ6QL28PfUWvdKEaezUjLxJw7dlH3ugYIsUJ0P0wSS34MXPEm1gbj9YO+K45M0fJAKeABW25ubcCjYggs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307079; c=relaxed/simple;
	bh=ByEuXOht6TODgykP2bIWP7KtVNEqX6X+Fughzcmpy2Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UzEtXhNtyTTOAF9NMwdMe6gz7ulX4Xy1kZzKspoTYb6vqxtAB5k/qKA+Yy5ARqI69PyRn7Fe+F2qHFN5PCcRrVLjr6XIXFBWfBEZJzqkSKfxygHX2yX5xOCWaAMvd3f0G+yDVaKlqACyA2JTandprZ2lK91M5j5uhbG1ahuGHa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X5POe8I/; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X5POe8I/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JL5IOAacxgnu1tTZJIK5Lp2LCGJiNSxbGorrYqEaqCJU+LiKQxRQ0ZMr+oi4AmvivLOPywRMGH3IlZxcKH+UzwSyQ2NO7VUuyEyPqOTyWIo/wGhAdX8F3GpHTZRRzOJz+tR/8pWoNa1kFZfderxKHOIZpP2CrYVJBfUpZaE/+w9Wu19vBkmdYnQs21obyfps/OqMBu1htacTDsPR0gJq5cNzOhRdHvIZ9LrxnLWAx22BuUgjKL8hTISDl1TirqdTTegb+W/9HQuaGfmLsT29utpVmxXP3WblSVFr4uf6ZD1fCbGuyp0hieat2mCCYV17VKu3IKv3OCujIGLTdNSm9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtBMB0rO+S+7U0z0pV3pLu8qilI5PlObtIkiYnumhko=;
 b=bRs/3Rjpj9Ych5UJEr3+Y9eHQH1Z2LJHwpEiKrT8bheRuLgqIEZfTNBEeg1ORQ7q+jVnzJfbnNQehZ2qW1FabKkyU005XRKPbsOdLOW/YCkjqRXa+FiaT/FPpOHZpJ25SjphMtqdY7H7yadVIaBI1tebt1xUktiMAleT2a1De6ZAcUn5vsfAVYyn2TzmdJ8szEogEpv7vyMeItfN3BE1QZWhAb/KNi2Yi2kryu0hd6x3No5IO9gWQ9I4K5qhSZBbmhjeJFM7o8tOzbwJP+esQxSdF34BV/1v2hlmI8K2HOco0g8S+1gUcONogGyqQuQiI9aLD2lPwiJ4gkPiFEsJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mtBMB0rO+S+7U0z0pV3pLu8qilI5PlObtIkiYnumhko=;
 b=X5POe8I/IdJnZg8PY0t63W4W5cB0T1Dccn6i/CzaP6ULqS3TiWp7PymRxLxfrFj7ZYW/ilXO2uVHHC6pdgw5VH76rbJuxqanIqlDc6n30TXvo/Qpm1scKXT386QzOz6ZQBG8VB+BCj2VOxHZpsBUNTn4m48FWdBV5V0n5HoutvLJ6QFFwQ1TDd1+UB/EgUISs6oKY91RO5N/SENhk8QfS/qgIjszncHJzm9JyQlGTLLQEMSy6vUv/2o19W5EDnxUBDXnTF8G4NVtj8jnQcRMvAXV+0WoyYODjE1ajgpxWCzPcr4jKBesJJ0g4YRVvBB2xQKnWvLhwZmv+PO4az0Riw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 10:11:09 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:11:09 +0000
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
Subject: [PATCH v5 1/9] irqchip/imx-irqsteer: Call chained_irq_exit() on the handler error path
Date: Fri, 21 Aug 2026 19:10:31 +0900
Message-Id: <20260821101039.4037925-2-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 917c9bf4-1de9-41ee-7475-08deff6c83af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|18002099003|22082099003|56012099006|3023799007|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	/0E/Y8UncYdPpE3xulBbGRYYEcvHTQG5jkttjeYE/rebq1dkCmxfXJKFAyTV+dzCrF3vmlPfgz7XlE2LAEQOoyfaQkMoAlyGcaKZRrA32fEfMJzYbsF5MJx4ynNB1Z0/osw2DHyeo+1reUAyjzMz6Vrqv6Fu+YKGDKsBfJYqmEaHm/d3zije0NYKlbZGMUNxYJ3lW2nPTnpPr7dpskCJYhoO9rtngJXP2pEqVMNEzjbVIyRwxgVw57xQN3m6QK/56isbejpaHHVu4Z4VSgou/aLv6hKLL1pLTQhOvla2eXJ9zjODm2uHSyNUGraEDZ5evFYV26AO2eA8DmQ9oJ2Bix8axdC0AUZ+AyERBgUfeNvyZjXQGazbFG3+jF+je2R9JQ24/E30Io4Gg2qSHutgwgSld/AhAFVROn9pg1eI3GzqMCPoEXiezmORJoRtNhYdoMdHJoVcVdx/ymS6teuoL2IUxh1rw5OZdg53BrjeVLq6v1H+VYKojdJOY78MW3u7BcqsQaLbUbgIFu9gp1cNeBVvEgMu9fmi0PDgpF8ESH5hn5TNB0WgKRPSCMefxjyq+KWf2jkMjFaFQZSWX2GIEtntzHyQGWSxKRyH+Rfq0cK045tq2qcOc1EbjPsy6TNbxCBp5/CTeOvW15Gc5holDsoqhmZbBCJdeKUlQM+NjZE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(6133799003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9HEeDKiRgvpaKQH/j00WYprYfbeASVtPDxQFHYwAVOwk5NvYCQkKIT2G9vNH?=
 =?us-ascii?Q?nJbq29iD/9jQilgMaZO73PIhrRW1ZlxDFqrBMK5pNeF7Qefl37CJM3C/d1tl?=
 =?us-ascii?Q?T+/UtsENiWDpyVbpF8W8UoWHnRLd5+760Z4e1XEG+j8Ntprg+BRExQWWBs1X?=
 =?us-ascii?Q?MC+P0UwAp+ZMDtPdIvn2pHy0OnZK3FB28Hq0b9eywB1kYRe4k+SzmFCx/dCu?=
 =?us-ascii?Q?W2kLlt4TDbjeQk0znwvGksFTCncHQwft6HVctZQTSkIOT4kDnZ2EiIi+FJx4?=
 =?us-ascii?Q?kklfUxMhLJ9R5jtTu+enDwP2jPUm0+XKKPIQccBd8MOkIC4OIes97qfdMU4U?=
 =?us-ascii?Q?IVipHC3itOd668/FeylittqYZaBIlifaQMgoGmtRxPZhGyQyhZxa6NpdYhLT?=
 =?us-ascii?Q?mw04vqYWHkXquHvrDnaJ2Ltjxi+ZWwqrEH3fZJCU+DOL4T5z11kWo1EDKAze?=
 =?us-ascii?Q?P0G42cxtt0dw9B5lxmhC+U+KkSRs6Q8CqYzT22k1xB3PS5+VJI3hARqjBH38?=
 =?us-ascii?Q?3XcV3Pz+H2XmDXHvt1cu3T4TNg25TlEHJLG0nreHHfBBEZD/w+1RRlpoU4LT?=
 =?us-ascii?Q?gsLeXlKF/W8oN3sjn/29TktTXTaUvTb/a+okCwD9I+x4w7wtCe0TG4zKc+1K?=
 =?us-ascii?Q?cEGsWXc0g2D65Ao3uxSZW//oDDeDnxCWEPfiXiyFWyfKk3RjFXe2GoLEdnpl?=
 =?us-ascii?Q?9R2tq2YkgQ+eiRiuZvPpAt4NKMUXkp66Ohcpmp740Vsx1QG37ULn9ltlKG7D?=
 =?us-ascii?Q?oZabKJrW8dRF2JmJZGMfveo7/Cv82jl1EOqdTI8YNrqeyziP3/giIznsqvBN?=
 =?us-ascii?Q?suKR8hjGHll6nNogASqBWUKeAQm6Q7dsBFjWaFwkqlj7r9vVV9mHf9cbjqFZ?=
 =?us-ascii?Q?eIz9TQokvusD1HbPAPZ8EJIEz5oRzUXPcxvXZMdhMkagTvWqzEbdqhq7vU7+?=
 =?us-ascii?Q?cA6Bc3TpfPVUM3uXzv7MaVlPuFfomp7UeXBZ3qI8GOugLOisI9nUbek0vONo?=
 =?us-ascii?Q?5bGxqpaHfXPRSkOGtN4MUB9EN1uQuY0HLTCrELENgIBGdii7XOxZY4ohsy71?=
 =?us-ascii?Q?sXXPtp3mC8Caio4saFDL8KRdbsbwPr9PsFiBMjnZRWD5JZJNAeTK+WpnUOBT?=
 =?us-ascii?Q?ubJEA3g7ZvkE7f+tTX36ypF0SlHO8ISE+imO5B/qKi6pYH4Q4bsJ8YtOJhnD?=
 =?us-ascii?Q?2fZi/ZE90NufiS63l6p3HKUFjAiTk+U7vsSewzCzMhUEAqK3iG/JLDiph7W+?=
 =?us-ascii?Q?T7VAxtRS705AEgj/X+yL77zl9qxuEPvphS/8w6yIvFhlvtjW9wUyWEaOfFHE?=
 =?us-ascii?Q?5WqYe6DpDTz7dyWDX5+a7fFsf0boftFLDNqiPK/3dXep11M2fMZRh70LU0ll?=
 =?us-ascii?Q?R7KhjBob6xS5IwxGxdeEDqRSw9i33m61XkptKxyH5CS0kqyhSRDf6i1w+b59?=
 =?us-ascii?Q?ja33rCC7xcH7+K7fLPs/JILL6AqJAtgzBp9pPUVCo9pM4UKCkkLGv8FQ0B6C?=
 =?us-ascii?Q?HmlyDXn7BRor9MCnSl9XKjsNrCNMwo7OrQXWL2JsfzwYyfsLTrZUjDevFY1F?=
 =?us-ascii?Q?5ckrSGGcVB+bBEBF4PGa94WVSh8mgv3a77fT3tjvcWrGWwLbo9lGsAv9F69p?=
 =?us-ascii?Q?D2loOe2WYqSFIOZUFxdex3Enf9l1pxwkpLnSGatooloc6CIIrp4yQwSOxqtK?=
 =?us-ascii?Q?zzPDLp7y7fKpGXUigXz+Fluz6CrEODHV+e2wPgnYZhEQnpJWFA+GYNmqcG9I?=
 =?us-ascii?Q?PmqIvQU9jzLgGOAZjFXJoB4ccQhMdCortLebXnBY5zrdYumGBJBg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 917c9bf4-1de9-41ee-7475-08deff6c83af
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:11:09.8263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0nDoNzij1+o4p2I+fGgwiRTQo+5TfXpmy70tzrfz470OrnPBkc+sQPHT1La1A0QEkH8NsvTSoRmggSuA019AHAhjcqmgaK+ngYBavMf+MfH1OpYMBOVe8tFY42stS79I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

A chained handler must pair every chained_irq_enter() with a
chained_irq_exit() before returning, so that the parent interrupt's flow
control is completed (EOI for fasteoi parents, unmask for level-triggered
parents). Skipping it leaves the parent interrupt unacknowledged, blocking
further interrupts multiplexed through that line.

When imx_irqsteer_get_hwirq_base() fails, the handler returned early
without calling chained_irq_exit(). Route the error path through the
existing chained_irq_exit() so the parent interrupt is always completed
before returning.

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 87b07f517be3..1b8d0c8eedb9 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -154,7 +154,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 	if (hwirq < 0) {
 		pr_warn("%s: unable to get hwirq base for irq %d\n",
 			__func__, irq);
-		return;
+		goto out;
 	}
 
 	for (i = 0; i < 2; i++, hwirq += 32) {
@@ -172,6 +172,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 			generic_handle_domain_irq(data->domain, pos + hwirq);
 	}
 
+out:
 	chained_irq_exit(irq_desc_get_chip(desc), desc);
 }
 

base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
-- 
2.34.1

