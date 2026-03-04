Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012019.outbound.protection.outlook.com [52.101.66.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADB3389117
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 08:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772612028; cv=fail; b=XYEvW/ufV3dM8w3P1lkY+ixLNMKwiQw2ogKVVkKoENBzRjwIkebvWOW+ysGdNz3UrN0jQ7TJVCykifE3OhExBIHnMwCCHpG5/OIxwBPDEloi1qNNmEmZGxs+7SeU/G37ZuxBZ99rRFhHTCURlwF9j+zwZkGH+zFTBcvi8BONn3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772612028; c=relaxed/simple;
	bh=Bkts/d42eAfpYWoDoGZQ6t5Flbw66M1uMk23HDuHKZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cM6vJr2bGkj7ICogEq2a6wtNoLGi8SEV4br3S+DpmzG3wZ6KIKWZzL27PwuWhPj5LVqXERDziCwXRDuEfQiTgdR4Y4tMhPyVID9geC3vIav3Fh4lRnSRLg3uhfyvIr9fS06UK4RCWLnFVCQ1wWFrFEopDiy9tvpjuew3aG9cgkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Krosxtzg; arc=fail smtp.client-ip=52.101.66.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Krosxtzg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XD1U75YIQJERTgcKM8SDkrGOF1Kh/d6X+Xjhnc5A9Py8C2HiacPve9etsvHjzdd3YLosbSsHBaWia4wluKfDqIkzSO1bM4shYQKKKFLqULzvg0jt765NLPpXNa6cdSojSPYZLa9/UIS/p4Y94OXj4D+RNJaX8bZlI/PN92lY/b6tgHLgenQlqB3hdPTbO4Q9ntvsOHr90WQptaKYoubXN9xMDwcGD61YyjsTRDP4gfVyStRI/R7h+J6FVZYHePCdDOvrBKcqSvODal7v4uz0Kr5BC9UTSFGGw3fs7GBrPLefYgjfU7/KKc+dJ80ULinwMyBOF1w9sAyCerWlS5NLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBlOfnmWBK4QHq82YF5U1aVXSuD5P0SQ9nMAVaPgVnE=;
 b=H3MoTLOL/g7PfFun7ba722cS6eFXjHKOz+6ADbTxTcGGpoRL/WXSjJrjnMiCSpWzDncqZGYQZ/RO6OKCKZDITcHTaBDCnD/YFSWtTg47ZAnXbYWkxLdPOoNi6dJXCebLCDkltTioDebdlmIHMU9e3zal5mTiUxqlOCCUVRaJs2j4NGMeDgMh/lihc/Nr8DXHgY4qWboCIHu4RPP8wLMOsZgZWUR9aQAWDlVx1ms2BWKw4eI9lE0UW4qEHPAbJZthUryAfe2x9N4IvaOT5689FnugXw6Ltkj4/npxG5JCBbOL6DU4MR4AzivBcH1/ehfe0dtql4EmaFnGGsZ8gemikw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBlOfnmWBK4QHq82YF5U1aVXSuD5P0SQ9nMAVaPgVnE=;
 b=KrosxtzgM/rFe7G2RZOhFi5dK72/boKJuZOe9Db3v1m8gGtgiugQoC4PBXc953Fmgv5uDNlKovh/sYNt1TiV+kcl6wdgHb7nat6B9uUVMEQWSTNjkcB4XZSzJszYo9VTcy/9vgCmHCaCp1bXkopybuoypMkc4etuU/xRtrm/qWNqK8ms86ClHvlT9lvVYrKk+TfObXLg6l42WZ+Agdx8oB44gAYt9YK9Yqf9M0kBsKmeNj/eJMkbFLxM6tfZaa8j+8xkxrFZAk/GjMYqzCiDCsHmj5R4Q0Qu3ZGZ5lGdNq90VW+8j7nyYDOf4YMyBKmfWflWe84R2yZA9079ZKjpHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by DB8PR04MB6796.eurprd04.prod.outlook.com (2603:10a6:10:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 08:13:43 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 08:13:43 +0000
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
Subject: [PATCH v4 3/4] clocksource/drivers/timer-mediatek: Convert timer-mediatek to a loadable module
Date: Wed,  4 Mar 2026 17:12:06 +0900
Message-Id: <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|DB8PR04MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: ceaade6d-d905-41b2-e51b-08de79c5f36f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	W0vs+XXpOh+yETKcX/TvJMspGhc1V2wvt+RFxZg2kyw0cluIeSCIWQUaAlBZ0tm1RDeSoMWmesHNpy47DWcyqkcrheQfvsrKR3vCvFPpGVGAZjwpSS5/JK5VOeBMwiu1gLd8peh/BXzS1eDOM9K45dbQWwjFvkCC+OG4T9IbRClsQT+iHovhTpiek7ixEmkiagr3wFBtyezZJtkJ1rj2sPak4GuLVdw9fjRRB+dcwHL5OY238GRdcH17ma1dcLc+ihkKoly9HBvRljC9h7+nH53yyy1U0vdmWwXyGcx+AOeWVAZGeY7WhlQolyPRJZRQCDe3I9TSWe69ZRMkSypLfUlQOC6vQIsVJ0DecGrM+65+XrMQ/HBH1Tzsx46WzG9ky3OJQkYQzKvNNbaQW8TRtURDBTX4ZTvzzoqWI7PY+Re81cxAHChmuQ6WhBXAI5lNv1dVjcnXU/L/SqP1wYthH8FYAQefBrkQwBv1Z7yfxOEZHJxlJK2nEPHhCS5fl8tuhbFFviuQhDJxf7oY0spBphSjYh3xQPKt4wbJyFBM0bpWj2E1hl3hMRt/sQXv6SbJuZWlkixnu1xIWtOAjcGwarabSt38UDIbQnA20J9924Jnfs7Xb1knxzjb+T+jqGEvyberwX+bCkhulq43wd2QQj/mc1YuFDdhVkhlucIMPm3Al+XLQGtiu75PLK7iPCFk6Wp7JFha0ehaDWFKMGAsxUsgi/Qh3Zw0Uz64tVK3Y+/e/QnDFQ7GnTv2qDbPnLRxNzOPyZpRh/QeBtRJWuZYE2untnzcAmSNd72+0Mi0Ia8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5KolrpnAalabeqswGQkWUn4Nl/88Tg9ff/A3hvrCIfHmf3WBy7kaw8+DtXs8?=
 =?us-ascii?Q?FcXq4tHTLOxtJsylnsVVeTZ9/5rXzkZkqQGroLt5ZL4/Vo8Ow3a7m4uj3+Bw?=
 =?us-ascii?Q?QTT+y8oqWeuKjqGWYR2Wq5a7gQer9aXEXYJ3EyAFmKIP42iMcfmsmcTMJcu1?=
 =?us-ascii?Q?wXxoBUEVZl9H0viMSUZ0NOieP7Q14kbZpf9KsnJkif2O3WLXEROHtpmhKku2?=
 =?us-ascii?Q?x8CLawD/SwsOOLOzQGuhLnX1NOiuX8SB1909J6GguG+BRhc/UBtHGp1by/dd?=
 =?us-ascii?Q?2QOf0nldvbU9gca0y7OSEZ60Q0h7Jmm9FSq+euaJOjBJZIOqrP6YaZ3l0zCG?=
 =?us-ascii?Q?+Jv6yjehQY6REe4nQh4Pxszq+0/fDvlvQ3GlTZx381DhKAgjjvr/2qVAsyff?=
 =?us-ascii?Q?DZUplTtjkuQPtq6W+yIHAAmxCq93mk6z9Gopk5wWZUzg/56eExF5M3uWHI4c?=
 =?us-ascii?Q?bvOwBhesCQ3WJ3NeGvbM7Qqafy7s8qp6u0IdxTMOMg2bmX1qJBVsdbLA46as?=
 =?us-ascii?Q?jjVO8RSqcsTPbURrA+5iAPjwkjUZpANr2p/QWCFp8Y6Q34Iy9SEeL3OjZ+UC?=
 =?us-ascii?Q?GQvQzxnsIzR5M4qnOjQ1KF6BlhSlxszlV2MGjsVxNPRfOtv/2c7eeAj7M5S9?=
 =?us-ascii?Q?G+LQ3Bob+ap5uXGIwVO6ZIgiwwf5kurOKy6nAQUPw+D3Z16/Q9rSot0PVjhG?=
 =?us-ascii?Q?Y+2nTNehGy1vzGylnRzBvjnZE4YvWCmKWOAnygcXp0fmTArHK/img+jhDEwQ?=
 =?us-ascii?Q?cSXjSdiRIrYE+KIUaEa9Wzx7B8zinxbyl75ydoiRRNIr13DNb5ocpq9TO5f9?=
 =?us-ascii?Q?VxJC7t6quUoST+ZxeCNdlDQmFrRFDMoPsA3g0pVDW5a8w/fN4DMWZzhPuoqr?=
 =?us-ascii?Q?ovTwKmt28DD4Xx3IzE9cxSYh3GAf5or+ysRgA9QICa8FXtCzHUm/ysiinlA9?=
 =?us-ascii?Q?vhA5lSJGESampf8aMM3fYelnHiqm2f/8kFnsG6WSHEU6Bqz+b9nyCIR2CC7W?=
 =?us-ascii?Q?Nz8D5NJq5halsI+6y3puf/wVqxaGmNknlfzNFL/YZ43oeyTNrhYBKftmLzOY?=
 =?us-ascii?Q?8Iyxbz18uCA+5jelEN03CWsoqm4Vo9yKMOwgYnnFT82fdT01MuQNz4NFYZHy?=
 =?us-ascii?Q?fFCgq3Fha4chYU6b9H9WV3+KrEwudYgp8evwcvMngC7HtcT4XUBf0/yelKV+?=
 =?us-ascii?Q?BB6b05HGeKJiBsQOS4xt34fOtNA5r4a36+4P4sErEtRoyv1tQmfGkMtd8Zkh?=
 =?us-ascii?Q?papXesfB+6F9k2sM+dznpqTGccCHp646QH2TECNtXQkueqox2XMXuBISXkTm?=
 =?us-ascii?Q?R2sEWvdPzDMFzMOjH0KEgSR42F+VpBG/YtAMFPjKxwuhW14GLPCbmnthvs8Z?=
 =?us-ascii?Q?1chCBxYD72DsmYfYGqpr7JSDejvkBopFPp/mGbCAjGC1R7nWErudqYkel/WJ?=
 =?us-ascii?Q?yCcPNTJ5TbsisYdydXHmfhwizn5H1wHkHsacb7RrWS5aYuVI1VSDAvsA60Xy?=
 =?us-ascii?Q?rjf/XScMzXn/2pk2TaF1zIsCWFQXtqpeJEXH+46Vpil7DKq7t1EjT6/ebqc1?=
 =?us-ascii?Q?+o6WbkzOYrz+pnkFs2cETO5JoLg6+m1Oq4NsNvQ63T6t0Kyq6lVvstcLc18i?=
 =?us-ascii?Q?PGzU8en4TlOMLj6FQTapEHBt9viQUbNC+mqZyVYl9UuBKaaHZf3tCTYHESCU?=
 =?us-ascii?Q?Or2ZqiHwuraFwW6VOiVRAFrsszLUr7VlRhdG/ADTrxQY9skGCO06u74zWZK7?=
 =?us-ascii?Q?atCvxnn9Pg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceaade6d-d905-41b2-e51b-08de79c5f36f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:13:43.4905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZJwzA9Dfc/kOzHQ4u7Ud7HwWKeI5+14IbHnUdeEF6WfglTB06/83oUsTDY+WlYHkTSqUEyxdDWp380mjX7l6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6796

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Convert the timer-mediatek driver into a loadable module so that it
can register an always-on timer as the tick_broadcast_device on
MediaTek SoCs. This helps support GKI(Generic Kernel Image) modular
configurations.

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

