Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F6219F11B
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 08:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772787073; cv=fail; b=I/SuaePM9+2y6kOcF6kHau8a1XsMjzXIfryMalMPnB2ZDJU9ZIVutKZWqIewvUJ9f08CPZ+30AfNznL4J4RizBDzrwq6gNzI3z2PKD9nnyu+YhHiYi9qiOdQSFh1Fqh0HfQgQimBkUDSjy6fvua/Ke8UdOrfP0ETYngY2krNM1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772787073; c=relaxed/simple;
	bh=Bkts/d42eAfpYWoDoGZQ6t5Flbw66M1uMk23HDuHKZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cBi4Rvci3ADoYnW5yb2eB+dozt9tPQQVfP8L3B+cB1atbKR2kFrJkca8upqZzXqGwPK7A1FaqzZPLjJ+7LHNPF3o/aQDwQQTjN4GtJNaom51B5ZfhtHXLsBBBuA0nzKmwUILBEW+x6O4qsuyHSF1SEXg401XZtQfVwe2fiwXOGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HoB1h8uX; arc=fail smtp.client-ip=52.101.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HoB1h8uX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+jCEs6ciKKQ27yyw3kPx4a3jMlJxhFLH+Ua8//qL+Wz659oHDKSdTFAIJ5c2N4HzHIVd7Uzaz7zHWleWpuQT5MTvKZq1ZQRcQ3/T9ynXmMW2zzzgV0+CgP/96qJUVWRfpK0Gjb3idpErcyDKfN1GJEePiEdsFD+IXrghkQnlErRpw3x5T08go3aVKnB62JmF458b9myFugnfCoA8/+o9M2vQNA3ycSXtfgDyp2/rttSafQTy6RSJrdL3OVFv5M/ylVGFBHdP2+sbO/wBSfZppyaBE5+3k8hPuRc9PVvpRULO03IMrKP3q+hziiJTwHgpiA0j8vFiG/cTCid9wLT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBlOfnmWBK4QHq82YF5U1aVXSuD5P0SQ9nMAVaPgVnE=;
 b=UD6amkPZ6YIfWk4Ab3X2aORycf11/xhckkiTc8qydZ5m880ma2XYPPqnrBOpJXx+uJlbDYQxcwX798eXoB8QcLmJ/pguiQm4i4+oPMrojxjmbnPDD0OuVVLSfO+rkJCp8cHAWdZpqNxgbD01ixXiTay0XUuouGUz8SSBGORrZeWi1k69MhWCI1rD8XNwskSAthi/d+fW3hu1V1qiYn/I7TzPAn5wq+uoOWtcvrncXFlaIGHKEl4KcnJ1eHxRMp2ul1xPNidf+UVgFW3HFNqLsnctqED47WHKWFWGNO6+bUCbgNgly856Aleib3vsiwlymaySKggWHfOU/VLxOT4/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBlOfnmWBK4QHq82YF5U1aVXSuD5P0SQ9nMAVaPgVnE=;
 b=HoB1h8uXPBXCmjtwsmv80sxIPPg9xH0eyGrZki8dmNiElyAhrU/bXU2pHkYw2clKHlo5Fs22kjUfnsA1GsoXdiosUMusrjYEfcgQcubHWdnJ4eb1iR83k/JRcXyeYvYX2hbh6WPK1qhqZzb617kznRuEmGVueb8Q2KOgyvgZGkvfGgu1pq/lxFInmIbWlZ4zFffso0Uf2iTkHh2pfcd/RKI2Rmz0oEQPEKVmtD0511wof3xSi/a9syUu55Sz5Z3e9g9HlVV3EzFhrVchwlOc/LuwF3mhMbs1rUdMzTudUtDF8dvimMMM+BhFekdLwN5JCzDw3QchLuqMn5L7wzKVmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by DB9PR04MB8122.eurprd04.prod.outlook.com (2603:10a6:10:25d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 08:51:09 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:51:06 +0000
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
Subject: [PATCH v5 3/4] clocksource/drivers/timer-mediatek: Convert timer-mediatek to a loadable module
Date: Fri,  6 Mar 2026 17:50:20 +0900
Message-Id: <20260306085021.1231032-4-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306085021.1231032-1-zhipeng.wang_1@nxp.com>
References: <20260306085021.1231032-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|DB9PR04MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: eff31a14-a6cb-4de0-a9a8-08de7b5d8176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	X4kPxyRAUW8ZaXmNzbG51CN0l4LzG9PqO8+l8SeQpwTtuQjwSrx17IHan5zv5iUqxLp8aL+UhNe4ShnnoYVERJ9njTCcldvfWwysgVhvOuFXvft3H3GcNFiaR2dYqbWIrJ0uHd3pQwJukbcVx/ZTxm3KKQdw6wDT7gOFIj/BEMBfErX+cR4VQRWhVur7MZuGOt34b0k4cD7WAJLXbSDxlG5+CTSDWl5oeVKxVinVE2Omp99+DT1lJMZzn05HXbEJn+74+mher0ncKXEZnUimvAimbyN3shprHQhX55Ed+c57/TcqY3T8UL0bN9ea2yM1iSAiL241tsMFGBthiudYHQ1kyoUPfpku2IwxIa0oVGe0eh8dGQgT6CjslbxEnzYs9/m3JdMbtBk4KToGyej8B3/swpuXchZZwsDWqX1d3HkEUGPSZVGyQ8gT3J0vmhznvoFV+hbyFsZ/T/QI/SMMEo3+O27Yikmv8mM4QxBCRb+T5FJt5lY6q/5rn2GR1XE/7F4yyve6a8eF6/FACV0FsudRnqneCyOkFu8Pk6W6GGn3rjQJh5pjjXXZAOBDpA5Yi0eE7DN9zjDSmVaZYNiM1XmDEvWNSjCjibXnJOnDJEZCBzoYwoWfrPSIEYEkv0bwo66ADT086mXiKnF/QLL1vUkxHGnFeQbp+vQJKDNLkNsgb13u1c1LvstHd/SyKayewQ+01R49i4d1Tg4ti4XhBF18kgRGn4XF6DtC+Ckjq+3bk1Navmm4x9ZDebnnpeFL2sOd+Ej7digZTlFp7PfdwpP96gQ8uJ22FTmaZ85c3ow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5bGAkAjJAVCwo7ChOsptuZ8uFF8ji6u5MT/2z7pAQ1s6aCU3MimG0EKCHHGX?=
 =?us-ascii?Q?9YUBVjis8LYYQnAFZTJPOCo1XW9hQm38oB2282LHYPq3PvP6modzxlnOUREw?=
 =?us-ascii?Q?GJzOuz33xmH8KO/Vd2N6kXsxJMGvcJwSr7eIaGIsx+WNUdcysiofN2PpXw8Y?=
 =?us-ascii?Q?zIoS1Cq5kI2YO3FTWwOAx74vsoc/2Rr8pzFOAk4sbLgfDCx+E6C82k4grWMw?=
 =?us-ascii?Q?SEQwme/MYtf9jgjRdBzJBuvHeOWGP7s/pFkZr1lpnSFQ24mgaGuWAWpr6rKc?=
 =?us-ascii?Q?A++TfHIZZ4v5k6o/Pqi1b0SWc1o4HmtGzNTMLnfp7ZjZI0XYnUZQqhf9QZpY?=
 =?us-ascii?Q?zsd2Gk4zUUQQQrC0t5XwvKG+XZUI5N43GLeMvIgoDqSDLWTN6Hc5awU1iXtJ?=
 =?us-ascii?Q?O5mUBxBRlu6ch1SEMBjbfe5C9N+v4tlpZKIXIXwSRvQYCSFRXMs0xw3Vz0Le?=
 =?us-ascii?Q?5gBzxQJkiEn+453lUyEjV8wb6Ih3aUaI3BDR6XVREh+TUhBkxKciVpas0hCh?=
 =?us-ascii?Q?vUwhQp4Et9aHpV1pd4s5U3IogtjuxnjB59BDN8zQ2Lf/tlS8i8+iVAW7SUPZ?=
 =?us-ascii?Q?tApkFDHvbveb0uVQ9H5scfSVDyeIKCylUX+VfbKwXoRFaOXt7nid5dAuLMVu?=
 =?us-ascii?Q?J+7lMQTi+6NbCrPklCw+RD9oAtIO9gstTNqcIIm94DBC143R8eOkT8xSSU19?=
 =?us-ascii?Q?zYDv1kSH7+p/9Mckbnh9eQV5SE5cu5tuXIzOrNSzXoBeWq4hpn5vn2zTpkl8?=
 =?us-ascii?Q?4H8fPMQFGhtqayrup7AVdThLJt93JbGypTORzD3vbxCI9jw6IT2eBZ8XdlgI?=
 =?us-ascii?Q?xDTCjq5/RcrXfSBNXhOxzGy0sUPFVzOSHg6Mx5go/9Svv6v5byhu2DLLOePj?=
 =?us-ascii?Q?1ZQiFjp3EApD/kcmJAONwO++IKk13QBgLPrJyL535f2D9jMiARpD1tuVfEGb?=
 =?us-ascii?Q?vMdkpgW5LVDV6byYn4084k2zCZbK5moi+m3DeXx5TA6lr7IAQj5YMUd076os?=
 =?us-ascii?Q?OH3jsvoSPAoD8m0XHRjNNTOVQC8a5V0HfcEks7mwWcBl7ZHCj22/puRSZbxz?=
 =?us-ascii?Q?mOaT/dI7AAu9Rl9hH05jkG3Ekh/rALfWg0he0Lixs+jCv4WQ+M73lT3D8PW3?=
 =?us-ascii?Q?QwSKr4oxI7gDJFbnQPH5FvxXEzuuyGlEXzrp3+w0tu9MydLSiiMlXbRASeGO?=
 =?us-ascii?Q?7IpEE4ie/zAvZEn2CM3dQ5bJQySs+lYsKFuA0Ly+5q+rrVRU112roM9soB9f?=
 =?us-ascii?Q?5jMBXL8uPTl0laz1epIPb3OYxdp+htE/4nyPAKqxGu/oXoskp2XTwZfrpzHd?=
 =?us-ascii?Q?+Rt/6bsVrRwen/BSl7M7YALqvdrY855e4rW0EXLPgdWyLZAkcvh3dvitf9Gn?=
 =?us-ascii?Q?a3nYckndPENV/mL8rf9zE1AzNiQvCsMLYncFk2CMkR6ZQpIfowmRPYMu7Ipg?=
 =?us-ascii?Q?AlBmRt1rAUZGn6aHw2jw9amOQo5gi1AY8z3G+0kvP5t4HO1swxWe7grQXenc?=
 =?us-ascii?Q?CirHjYX21UNta2pbrmaKjQJE/I2gLq/Cv6RhQrUEa/h8HDp5RY/uFeAs8rQO?=
 =?us-ascii?Q?gdhBmMh1/Rd+7Jrf4MHSqs0wq3lmBBVvpoF6R8M8z8e2gYYSratYZKZb5/zF?=
 =?us-ascii?Q?WrkFDxeGReCOOcTa+7dzC1T6OsPlasquNV/mVz6xxl6zjWFgDYJmtyNX6qjR?=
 =?us-ascii?Q?s9u1fuybA5tCHhfrzPgbcjCPrK91JYPXSqfikErO+rk0E1KtWBjq6j9oDuIy?=
 =?us-ascii?Q?4VcZfYwIAg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eff31a14-a6cb-4de0-a9a8-08de7b5d8176
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:51:06.9245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3njjXWjnbPNU5VSXkSz4GmPQXHBUv3i6SnjgWye4geqz/CBjWtDqvNdpaVrUYosaIUeFE4BDtWSlKZb3N+sk6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8122

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

