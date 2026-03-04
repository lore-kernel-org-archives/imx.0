Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011043.outbound.protection.outlook.com [52.101.65.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D4E3542E5
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 02:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772593135; cv=fail; b=IWbMiHh8iDtbq+xKZxQcA9UGNOnMw5SabfUwJdX48Rb63Qee8zRzLHavQtStgCqoWB8RYJkYAJ/35KMdT57/NR/OcdZhESvzhnNUL4lWumbO+C+XGqLtu59j8S2zqbbT9KI6rlePOzn9Uc3MmQ01z7Rl71dOf+eXw9xmICuc4hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772593135; c=relaxed/simple;
	bh=3UFNIiR9hX3NChM9oxf2peBFN7wpgSZZxcDucrvaPGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OOz+V+5aKY/fLhF6YRntIIJqavon5HIfDoPs5o+lnaZ8yKKJ7Hc88YSyXA1JatpHaiITzCghcTSgu8J52qPij7/FjaQjp4ObRy/A0JDZwwhJcOgUwp0+thlzMgLjMeT79sWN/FLsPWWLO6PLb6My2Qolkq22cv9hCvGyHbhj0DM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N34rCtBC; arc=fail smtp.client-ip=52.101.65.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N34rCtBC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+4Y4gJSlq/G/Vy6oWJwVAVbdhTxNaYu/ZVFHuw66UyDEbjJxgvFDlZvY2/o2V1C5XSnJbzhHUL0iXx/fllHHe4NAmLVsHXfZuuaRB7KEnaPM9X+E+AywjFyMl6+ndlfA6IhiANC+jA8ED0NYG4Ss7sq4Xv+liy51afWDi/VS9fJR5l+nOi4ETpj41ICy9GNgkUU0am+bAZOC0AaiVnIR35sibavpXDnxleFWZXRdcN8ZrQK0FaAQtgqFocD1TgQ+B1jsxGTDV4OiQkQnZUYTdquL0zioG0siM+lLR7zOM4enV7t+6iDaYeplabc0u5Kyp+oBqs1yZVz+mHRzx+8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNZfTs8w379dlpNbAhRA+sADPJgpRD6h/Uge61yblr0=;
 b=BuEWBq4600NlGl1G1GWP/SK/+dK++2nPLo1essUcrrqx1x0xh+SdOqizYwZMQAGo8Erh234dR8kLZ+OXnhYE28VPe7BzzkMu/O83Jnclpyo/SqPfnb1nz8JbbFBxBI7xLi1jrkgk+3iNPDrZqFDRzeksPCKxxfaPloILn+LzaZI9ytBpPQwR6Mcl4HPkIkqSDpDh0cHFk/csMV+x5zSZTNexODfINLDHrspVnIWAaZKqCchtjReteK2jh2RkYEFmPTcYKPvSBK5J1NWQUsFRM7sTItWhDgX+VNo4E60oS9yvkdN26MIXZ2Pdh3/LL2kKJEPKZGzhPIsVS2gTR3VvsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNZfTs8w379dlpNbAhRA+sADPJgpRD6h/Uge61yblr0=;
 b=N34rCtBC4ktCfBWAsbu/dlSqqKbEJ+xT0snmKgKM1658ThELWnkbcqGXXAizUNEMLCEBzGjo6JglXYkjXkoXLwWxHvGtw/Ccp749IIKE8RdFAzvLpTNuyzV5d/N4YVH9lRBdRN6elMkmpT6l4Sk+gnBs6thkFA044p1pDRVCvNCcs0LZx/1IJ7EzLEzhU3nq5kVZ3CSIQNjYfd+RO6qfImlerSHj1EFBMP5xo0Q4xnCMrKSxZzn2EjUVsBNTCj9TLyvdIVU7zdiT++1OenpLk72GwQtLqnlTZertRT6nvVYJrFqWmpARSt0Mv4cLUx4MqP8MM3rHRnuyQjXN4fzWoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by GV2PR04MB11936.eurprd04.prod.outlook.com (2603:10a6:150:2f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 02:58:51 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 02:58:51 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: [PATCH v3 3/4] clocksource/drivers/timer-mediatek: Convert timer-mediatek to a loadable module
Date: Wed,  4 Mar 2026 11:57:19 +0900
Message-Id: <20260304025720.2583655-4-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
References: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|GV2PR04MB11936:EE_
X-MS-Office365-Filtering-Correlation-Id: 3640b9ef-a911-4b8b-2928-08de7999f6ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	anIyW+INVIiA9H6usdk+jzXsoFm88SBxUfth7XV0jgJvl3upzaiGh6+NkZy4EXz43AKLOHWGtp9BoGQNgCyiyFjsxsAd2zCyEOmuLSn0Prn7X+0GI0YWwrfpByKuh/JJcgAWA7UllbKnPCnFb7fhC3E8w8z+CFnrkpyxOia6FHUa91gB8bGuiHJ//lNpO+14CpVN/4Xu3OxE5g4QAQWcnHGeqhnf0uj/u/Q3wBu08icaMrPyw+VHOqkgFL6bKMsuhepjt0xqqsTW+Wmbay7uUxA70xfOhktItiV0xIDkiYp+hHBP/jTb9lDLpy8tCGtADP0yiji+DEsfUJfnUByhM4UQHKqJJ2BQHamT0koz1W2rfW53s5uUADuzrylmGTfZQMZ1gc9vhaAWyAbbz6wndthNiViSdYk8t4MbNkmFz5K4ZzJlqtPOC3J8koUZ5fILPeah76ga7yI8bux2yWTrxdyBYJaNXmpmWMn92Ghw0JYToBqXQ0OscOVcDZXiUkXZkgiHa8pPaRVotHua3RWcJLPB3jC8LrLO3eceUES/u70zmi3jaBfdEgb2nsRlVX+rIy3LAcc4S4Y9u6dfnLntU4Mm3emALKg5tS2r/TsIL5ZzeQXuO+m84dyk4ZkpvEv3DPYA5dyMXqkBE1Vu4Vb8Eitts+fcabuoKRyXKuOMzAQ+lOlqbjAxDlXmsOgYcGiAjFPhJf+1miMjz+85gZed/ethcd2Yj93UcVM4kO2nEdch+eYTyro3wxORZyOZDXAGc07G+kqNAXsyzB+HsJ2CD/HMvxYrFxP0WeJdDFHCfII=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iMFB24vWbrQMKhd9nMQs+RDeJtcuGXm2sZDVWpRJwN43QPVdeCssqiTWmx5h?=
 =?us-ascii?Q?6holB2ScTeMpvDXJfXQF4FkWrYEdeeDvTr3RN8VeogyiOQQfdN+CUa7RU9ym?=
 =?us-ascii?Q?LWHQzBsGf1EGS4X+R9T38pgyJVfTjlZAh4B49dNGJ5sy6hzcaBQrptUtxIpE?=
 =?us-ascii?Q?MBngiVgNywnz4mH/5h5h/VU31B/VqcJs2IuoKChLxG0NeiwwxGC5r+dZzhKB?=
 =?us-ascii?Q?qJTyYtr31HNBoDHTTSBGPz1z0E2sAV3F7PBNY/Biy7zKCu8sazdfoIM7TDBN?=
 =?us-ascii?Q?GNTunzCWSRPhX5ZdXqMKVVWK57prOlganSRBxGKnJfRLrwPagWwvuidvMjvg?=
 =?us-ascii?Q?yJyn8HxLr1iUEjdj2jD/sSYLBwFJKhy7deuBWhmGtA+xgNUx41zaaDFovExk?=
 =?us-ascii?Q?o5zNjVJI1wO4w5zu5P0YzH65+43+fHQKI9qauyU0jf+AHvXjDDddQb/z0aqc?=
 =?us-ascii?Q?AJ2r+ade/K1k1Ez2XX56nWsaLnQBkwSZzH2Xl/Akm0NfMhT+DNo4iEjUH/6p?=
 =?us-ascii?Q?PsSKzv7+GCA+lSqKhcP5oey10DY/GSLADskROkzKl7792YwnGZGkOvx0vkvI?=
 =?us-ascii?Q?O1lBOLPQPZH6Mqoz9U/4M/KHC4aFS83fzXUw8KqsoBKQzB4fApvCtxnR46or?=
 =?us-ascii?Q?5taLo2M1TyLjE1DtfDTC83XB7d9TGGDn5uf0O6eJkCgVfrPQziozLje0YrD8?=
 =?us-ascii?Q?xmrTI057vn6XEf0J0YOGWophVNUudpLdLE2SvGINZYSSQ7fUVN2GWbIsg+Zi?=
 =?us-ascii?Q?sNV+5o73JZWQAIXnNZStzEnwq6FmZBOfw2CgaYiwGWRvZmY4DyXnXAxxQHt0?=
 =?us-ascii?Q?UFMk3XO1TS/P75mrg9S6pXmGnCslqCnNqqWAq2Baadsca4rvlCQ1bGFoTG1J?=
 =?us-ascii?Q?MNk3IPjK/oInaoRdTlsNH7L2XjALvkggTgViGGemKUtTzgSZtpScSNyeHKIk?=
 =?us-ascii?Q?N5tSIxx+VsLcnAhvtlfZmkeQkYwSJ7ug/OuKE5CFZWpjItS8mn2e1UnIb5se?=
 =?us-ascii?Q?MYrBEmGZdfQpw+mrKMFBlaS8x6+qBC6/WNObMiX0sy8tyDvoyhBsMrou9o+i?=
 =?us-ascii?Q?jhDqtRyBU3R9dd1OatZS0yvSIRezaVf+zBbdIvJkFSdRxtz9i51upB732zRW?=
 =?us-ascii?Q?en6FEl0AKTrTz0k7I3XMfm/oHPqwWCSlDHlH9yaESxcONXXVyYDxCerLBU3C?=
 =?us-ascii?Q?hoD9FlGjbNYWYIPjOTacZcnnDnFgKyONeQXl0BzuK7Hdus5Ex9j0arZTWPw+?=
 =?us-ascii?Q?X+VvIfhZGk0DWDP415YTUF0hbP59bV3A94ao5lp3FxppdMrWjyDiWV8N7Xof?=
 =?us-ascii?Q?s7830maG5BQiEP+pNrRnzurEPckwFs3SeQNbYT63IDnb1EkHpYF3uXccZEZl?=
 =?us-ascii?Q?KdpvwtUIPzwvn4cYVIqLrqy848Dokbph53ILYspTAOvValp1cHQqcQTwy11K?=
 =?us-ascii?Q?/D3WswUpOI3KOzkx7o3/VzmlTvTQ21u4+OPuIiK4FxfDwH8sqc/37LYYZNev?=
 =?us-ascii?Q?pH/i7vCR/vP2+nB3bcknKGqacUaJKKKg20W3EPYC5z9joLemA9Zoy2i2o9rc?=
 =?us-ascii?Q?8gwJrgAxEMnMjk1Fma2ZSNH/8/w5vHg3zuzmIaQ+Qwl0CNx20UGCxkc8AEMF?=
 =?us-ascii?Q?OQiNV+u5nvJT2dBuGEZlKSDpmycCVRKECUzawAhNqm11IIjuMCGJq3VegQUy?=
 =?us-ascii?Q?0tMaLY4UfYqXfkHhC+A2DHc0yHVpA5M5fbriarbyybM7l+e4N1Ex+2w0sjFg?=
 =?us-ascii?Q?Nq+6uHDdHQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3640b9ef-a911-4b8b-2928-08de7999f6ca
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:58:51.2182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4J2NoamfZIQKMNaSv6lv59uW6pXTpaS/hr3olP4+l6XDHmnG7+CaPl01vNcDzjBpFMux0Ra3aXcjrtKz3mctg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11936

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Convert the timer-mediatek driver into a loadable module so that
it can register an always-on timer as the tick_broadcast_device on
MediaTek SoCs. This helps support GKI modular configurations.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Signed-off-by: Walter Chang <walter.chang@mediatek.com>
Tested-by: Walter Chang <walter.chang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/clocksource/Kconfig          |  2 +-
 drivers/clocksource/timer-mediatek.c | 33 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index fd9112706545..2112efb85029 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -488,7 +488,7 @@ config SYS_SUPPORTS_SH_CMT
 	bool
 
 config MTK_TIMER
-	bool "Mediatek timer driver" if COMPILE_TEST
+	tristate "MediaTek timer driver"
 	depends on HAS_IOMEM
 	select TIMER_OF
 	select CLKSRC_MMIO
diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 7bcb4a3f26fb..4ad4bac6f34b 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -13,6 +13,9 @@
 #include <linux/clocksource.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 #include <linux/slab.h>
 #include "timer-of.h"
@@ -337,5 +340,35 @@ static int __init mtk_gpt_init(struct device_node *node)
 
 	return 0;
 }
+
+#ifndef MODULE
 TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
 TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
+#else
+static int mtk_timer_probe(struct platform_device *pdev)
+{
+	int (*timer_init)(struct device_node *node);
+	struct device_node *np = pdev->dev.of_node;
+
+	timer_init = of_device_get_match_data(&pdev->dev);
+	return timer_init(np);
+}
+
+static const struct of_device_id mtk_timer_match_table[] = {
+	{ .compatible = "mediatek,mt6577-timer", .data = mtk_gpt_init },
+	{ .compatible = "mediatek,mt6765-timer", .data = mtk_syst_init },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver mtk_timer_driver = {
+	.probe = mtk_timer_probe,
+	.driver = {
+		.name = "mediatek-timer",
+		.of_match_table = mtk_timer_match_table,
+	},
+};
+module_platform_driver(mtk_timer_driver);
+
+MODULE_DESCRIPTION("MediaTek Timer driver");
+MODULE_LICENSE("GPL");
+#endif
-- 
2.34.1

