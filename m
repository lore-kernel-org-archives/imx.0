Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7A472544
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307102; cv=fail; b=UhzsSbPOmnfPpHueW/d/ZKcgsNX9hCqpoF1q4QhsYpzkp5VrHdvMp5HtmsopQM17aSljF7zORUhWxxZ5xg5bw0IM2k0RNF8MS5v3dT0Wl26DZHJhWutuucUIJSvO4i9IuJS3NXp3pUW6SU5jJxxE3KMzojlHfFNH0V/4ToYZcFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307102; c=relaxed/simple;
	bh=oKugzg/f69xVUONlxkILbdOqoQAexcJ/VtqVu9GOj9g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fdhGyuo7dnU4IZUlL4O6VOLcKh0XJ2gzjkgV0DPYKijibIt+2Tk3E/scd+n1wP1/C4HiKtNMGsZnDfGHH4s5JL25M50BnIUdGNNBWkZEkdVDGUlJulVnIdSf10YbRHDo60gfyPHZ2QxrCCiO+lhRdH+9LsqkqT1BmSqmTRKFLYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZkX8j9jD; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZkX8j9jD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1WCaA8ibliJKxwi+4KRKE1ktSMLwIIcbJ9NFM/wKWi887nN3W34xbJcrByHJNkAUQcw90L6T4nko3ZqN/mcRGrRdb2xKTC5Q0jvHBRLfE6VCnYc5uyzcpYtK9kgIEtkcXrIPrXVNcWo9H1Py0UGhETpg2D82HcHb1G7pUfaYRz7nN8QM0jgKriV89ZImwGVTMJZjS4pmy1QX3R3/q/q+LcckidlhO9lJ6ZDCTTgG4H9uv1b/sh6pia8e3u87tXUbzQAOxXA5NXsF9Lr2VY6Lzo2RXBdobfJ4g0PIGVGD/dlNkMIujKjeIbHauIZNsqaa4s41EcRJiUc9NMhsUH7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlbrILGFKmzkJ7S65WZT9RI0zGwHEpUkLOJeZhBKCmM=;
 b=seL306B9qUzK77t89KWW1kEH1UuzwwaiZCO3sHy5cAK9uoN09bOOX8AhNgekP2v07MQKzQh6aGR5FRCkkIrS2GLSFNpo3k5KJ3w4urFzTEJcmnB930eRtiddVY7OgQ7AYft/a9u2Iwcwpj11ofC4HFAAyXtRSJc/L1ij/6BwcgUGOeKAMLCjf2c0v4DqER/rwBkpwkzuMae9F0Nf1drzlIn7VFPU3QkDDMKNA+PYO8aZWEVXCnQRx38tV/bvTlc9d3PnO+6lomiSts/OHpRQEH3CWykgkjk8dtPZbGQcS9z9lyWLbCHCx9teZ8RvaCMr7JDXd4J2FZvCKnxOSYYxAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlbrILGFKmzkJ7S65WZT9RI0zGwHEpUkLOJeZhBKCmM=;
 b=ZkX8j9jDt/wz5noHs4wtqhjXlJd99hIWUi2fMNqBkdxVu5z1Xh4VyV3PDPS+MqL2eQ5CK6DTkQKjEXWu6L6a/tiqg0oqqQ20Z6mdD87K9Z7aroHoFeQIdQ6LijFptEZ8W8zWFQ0U35EBFu/5kCWDycmwNUjpdSjWAxecHQnLPqCJ9wrmZpb/iUNqEQOGeao3Fcnv3vavUDW0Ymf9x/ZyREfFJg7udgafA0ZwSEdR102DdWi0bB/tNvWSw3Mk4HnPTEBwGtl6r18R8Vk691JCPG5eafLsMuwNhx8yE0euOz7C8YoZay4S+pqaT8DqfzQHtAiSSbRgfq+vEom9OEYNvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 10:11:31 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:11:31 +0000
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
Subject: [PATCH v5 4/9] irqchip/imx-irqsteer: Dispose of parent IRQ mappings in remove()
Date: Fri, 21 Aug 2026 19:10:34 +0900
Message-Id: <20260821101039.4037925-5-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f0615b-7f65-499f-2536-08deff6c929f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	857VaIJEkkFCGKkRovuJhaTNdma2VXNzGB/Q9v9l1J00wRdvpL0924ANY/ZmFxN3hZ0LhBbwZ0r4h9ZyHdmZi+mBvPr4Z57zC24sNFniXdIFKNI17bre86seJsBnSgMXRfiDEJ1GB+IlEZhZXp/M4wamu8KXSWp3fwqBQpx3GajrrFth+PbNYBENgeO2Ek4/zrGioQCntYZEDystIVtLJbXQGPkJM+6L72FB2Ank/MbixSU9CX+4s5YVjcblZy75ZsGd9AoD8q8BbR83PIRfMlkSXidc/zuu6wDkrq4hu2vlyKB4eekhmUWt67H7xgA8c1f9x7JgTejLDpGWGEsAk1FCxf8GcsAdnF5U2zmcELAXnSVWo9+JjR8WGe99pICGe2CUj3zczgMHr9Cwxx93Ecu7ayQ+0M6OQd6JGNP+t+dm4vxSYEav8XDAnU4JWq9g/fKjwgvQ/WbZF86cpxkkoswF2qvDPW+eOYv8cyo9556Lk+PRi+zIAsAmJE0kJJIU2Z/U9w5nTZXkoSkeSRj5q02/fNem4GmsR8DoN9NtjsJXYTh63An4S+6wWbqCPLT+Zj+J0rfT5vPH4itmA/3K7v/P2vpOKIvzDcSiigVhKoPpGoJJuzKuLeUZV800LklRMc2ZSYEaKP6pGAe79i2FgOWgwMffUKIKQGMzBfFft3M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lQhyn9nls91pOFFPEbz+XNn3p/beq65mY5fBRjubtvcKeW+y2p1ACQoBBysd?=
 =?us-ascii?Q?icp8DLoKTnEWhjWfNB/sFO7VY9TBlH8XRZsTzcG29be7i08RXBlmKLUvc84W?=
 =?us-ascii?Q?wI+ONbRyzOrlrd2N+rZwcQCkHOLuFh8f0cMzLsT4MKI3Mcdzr4LP8HspUqrP?=
 =?us-ascii?Q?7Fu7Bdw9VPfoeJlVYmy3nivoYxc+1R5LoixS9MVljj1XVKVwYBDy3Tc8qCjs?=
 =?us-ascii?Q?XR5sziwtqQDmf5NV/+uYhjAUtjuf7V34IIcO06ooHmfl1wIYVQDnReKGVEul?=
 =?us-ascii?Q?Y3v5kSdFauPjzuBM0gSRtk7pbgUbezeXeMfxJGm5gWEVoZ5PTWmvwd/FaIig?=
 =?us-ascii?Q?LmcF0ZUHkxKnUOYmhx2dMBXq15HtrcCLKtDR0sW5Rn1tG6f2PGHDnaBN52fi?=
 =?us-ascii?Q?Lu0pbcilGfpN52lxabu16gIZ/MznRSUjtkS/qWGKQ9lT06CctdOFbfvGV9xc?=
 =?us-ascii?Q?fnmhCjMtqVQFEj0Aictxbl91b7wUpsCOfi6PFKX1UFIuhurPIqI65o685avS?=
 =?us-ascii?Q?YXUCW/CO/+lyyruGXcvUS7eUhCQFyzXKcsX7/x09eCLz1Yl8Az99jSgDnMFP?=
 =?us-ascii?Q?6jYGnIvo8pAYT0+VuCkhsAPMLtK21fy0ey6uv+xGQxWz/Vq25Nz8AKaqMceZ?=
 =?us-ascii?Q?/FBE2aICcZBti8EQ3jUMnDWKHia29z0Wl6Ar2EaOZ0axus9AGOKWM0dcNZf2?=
 =?us-ascii?Q?XkTZgfFBoKZPi4WGnCIB9H33Hz7rK/uVH24pKuRW5v3raHWW5qDAv2ms1QkX?=
 =?us-ascii?Q?SeYmC5qX7GXKbdmnRUlQeLkBW8mj8V8JUd6tr2QkyvaMMvBP2SpviJiZibaX?=
 =?us-ascii?Q?5WQFQLZvC13Ssij8glE3GS7jk975viGEU0b/SX9t+mtfbQ9PCFYkQ+oSE2vg?=
 =?us-ascii?Q?/H+ISFy6E9Dihw39ep3hMiwBHD+/orpSKjElHCHm26FJ9xUjpypCzfo91V3/?=
 =?us-ascii?Q?NoTR1586u/PJQO/WmyXVMDRj4lBbW+8Mc3N1oFaxVsEwFoLhqH9USol/A+te?=
 =?us-ascii?Q?8ume4lxrWXlodRMH5lViC57DV9DDv15Idzm43nxXXAytltouyWxx3zqOpR1d?=
 =?us-ascii?Q?s3h7H8GuZmianrUVohKbQsjqVlbHAnP0cyMy8qRmMIR0SZihSGc5O4ApedOx?=
 =?us-ascii?Q?p78PkNPbii9KFiXuI1laAcoVrDQ8aXfoaRdU7hdHxq0FPInitz5AKQH++nLe?=
 =?us-ascii?Q?zO+RLmJe3vg7t5DC3g17cBmE8oXY8/OlgwlJw8937I6thhvfvmRw6+iskVPS?=
 =?us-ascii?Q?4QuuChuKdePwyv2EgczGjOsuVkcHzHsPqz8aCVLXD1p2pSMAMrndkVaAIsQo?=
 =?us-ascii?Q?+cbIATJq7DSHdW5WkzAcEBYWXcA2btKib96/J3E8Ph/xJ4BrhV9pkxDiELIM?=
 =?us-ascii?Q?QmIvEw1nhdTyT4uJtbaicanDmKj290iXJSmwAMQI7YCiZ7nFhLNE8Md6CzI6?=
 =?us-ascii?Q?MupWysg7BAWoYs6Tgiq2yK7EPmW/oFT4upwdOUA6HgY9bMD6t+kUDk9Me3B9?=
 =?us-ascii?Q?5R6m8jdPrpSj3IiGYFv0LPozEj5Thn62c+tRFOhrDd3WBE73MMw/xiVFcNTv?=
 =?us-ascii?Q?nH+BturlDFTOCMfTWB0kqzspmj7zS0eGveBzjYXDTEgscCeuUj0heqfQMxSf?=
 =?us-ascii?Q?5YXuj+ZQp3+qiw/n2TxEh+cn2vL8QiK5X38t+jNhHjYshQ8EtIaF2bDMM8KV?=
 =?us-ascii?Q?KYQkPqtxPmeS5gzRJflV7Kgyn9thFKglKJZew9xYU5MG3Yf2wm0GcRav1izC?=
 =?us-ascii?Q?tNEC9YD+dCZ3eQGixzOEMlyzfRVXdXcSRjA6xhZBlLKqw7ku1nrN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f0615b-7f65-499f-2536-08deff6c929f
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:11:31.5666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: csZbTVePsfJAE1B0FTxXVBWYVu8PeB0y5gZGWzQyUxjXL/QwnbPKV19oe8A+vtPMlW0jyn6DIC7A9rsSdhqImz8BcQsRBnjTYRexR0Fmmw5L3vO9IdyS3CGUOtbCv67Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

probe() maps the parent output interrupts with irq_of_parse_and_map(),
but remove() only unchains the handlers and never disposes of those
mappings, leaking them on unbind. The child mappings handed out by the
domain are freed by their consumers and, together with the domain, are
now torn down by devres, so remove() only has to dispose of the parent
mappings it created itself.

Dispose of the parent mappings alongside the chained-handler teardown.

Fixes: 0136afa08967 ("irqchip: Add driver for imx-irqsteer controller")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 571324de8bd1..071ab1ac1fe9 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -287,6 +287,7 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 
 		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
 						 NULL, NULL);
+		irq_dispose_mapping(irqsteer_data->irq[i]);
 	}
 
 	clk_disable_unprepare(irqsteer_data->ipg_clk);
-- 
2.34.1

