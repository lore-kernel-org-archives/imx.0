Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010049.outbound.protection.outlook.com [52.101.84.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79F02ECD34
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772787078; cv=fail; b=kDeeDj2G/8Pg+qAQPaeEFrZLGerLMBfQ/anc/rPmp+EE8dFJax3NDqSEuHN47WmCR0XlnZrwtI25dJPZ43M5AMceZWNyPL5N2cRnHSLUtdW9EQY9NUu1bxSTmE4zywlQxxn04/2F4YGuXCwuhefAHJ3duoBN6dMOPL2X7awAN+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772787078; c=relaxed/simple;
	bh=cZpnAuGOeDvTawsCTxDTidpTbXoeuX8piOQtEIbeRxU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FE6oqhLw1PDr2rB6k0gDmuGtupR5tIFSqL+hfWkPU7qnuJ4jqY/rHgE/NIJgZQrvqtAOGRZfdF3i1zJp6Hpg/ktW3yXaJW76JF5PWvTnHvfpPmqHFumVfGpMy+5WvY26rVjNMb9FoT35DJtyBHBd7XvmgZ17HCboixWt4Trwsf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cFlgQSUH; arc=fail smtp.client-ip=52.101.84.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cFlgQSUH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZDvN9Ii8fwvVXdycWQnbDpQiwxhXKJeFNe78bcceIGvMhpD94sB5wZWjeVQK6vlrMJjAOxSKiiLIIjsFya3HdhQgXkvXJzmh5wnpSmbwNEjnXndWOKlXXsOWHgcm7sqmRPl69bouvi3iPqPtMVtqPA7AjXFf3H7Mhb+e5DL+ncb1SeSCl0BTTbf5NSbHUni327w6SsJJ7UWbyhV9vIk98D8HGseN2CLrBTBGy6Lq3uVrVJWd2Ap5LO4KfWczy0GbXyhLlNxTD6K7ClN828CLlcwFyccwvx/YxW+EVlLa0m2LDk7NZcnSC00dQ7u5nlCmKz36JXZcE/2uN2KqXJmGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYcOFjQuZduWtNNbR5S9+8Q/AcT3kTPe/1jB6KlX3e0=;
 b=RXMuE6so6vMXgsOs0MrFnZSH55ViMREGt2ue/OyVCkAb90eZPR7tGO8KPC7BAONejsJHlkwbLozUzIwj+7BmjksrBrDoVFm/GcYIUmpHYaqT0nR0pqJK4OwwSKBoIDh7juaVHizW7t2QEKdAyBkkZh7YLi5wWAPLbsGMIdbr55xTCOIexlPNbpNt1gOjFZPViC/VdH6AbrIh120Yd1RPXvWvV1ypcfqAIPqr+lz6pfrAM9MHALiXDAElyqYugOhGt6o3SgUyo2XYbAMOMgY4RCB4/LZ9UIce9TTcTq3cmIUZfPfKsWPjag6aIN0Ccngqqy/CN8p58P5pqsSDhIHR0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYcOFjQuZduWtNNbR5S9+8Q/AcT3kTPe/1jB6KlX3e0=;
 b=cFlgQSUHXJ19BsgaVsFofRCuQhWsIy6jOo8PX/5YzWTBHdK5uqnVOwRqRpeD63trAMU6/LVtNu0CRWHqd83KYxNN2ZF47HS9CqZGwBPzJrjRmP/wwU+z68eruRD0izuRnqVnCXI5vc+DXCfbmDq4h0JRRY6ynbzz1AShmmEXw2NsItlGkFioC8W3tpIG+L/WOEG9DncxtVDbf2mmgnMFUUVLstxFqu1O4eLL6y7neOMqQ1BpZ4Dt+HcopUg5zTzLUjXJ99iajDtvygGImHZNPzcEIRqLF5AeSqIo7GLbWyPW0WEYdvzjllatmlexRjxGE8Goyf2+z3HGwyK7NK+mvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by DB9PR04MB8122.eurprd04.prod.outlook.com (2603:10a6:10:25d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 08:51:14 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:51:14 +0000
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
Subject: [PATCH v5 4/4] clocksource/drivers/imx-tpm: Support building imx-tpm driver as module
Date: Fri,  6 Mar 2026 17:50:21 +0900
Message-Id: <20260306085021.1231032-5-zhipeng.wang_1@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 24f1dc47-0307-4a87-8434-08de7b5d85b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	krziZQ1xWgZKf3cqfjK5YzoWQS8ZDse51RWGLG15Meht/Ov3Ufpt9XXaA5TCvdfRFZ4UCyfcGNBNf/aWHuAHeVLbWegGd5s+/ug9mjkiorjlvq3xsvS/2/923Doo4sYjNvqHR+b4miLI5ooojgkZCm928FyGI31UurLKQbRnCA3ErFCVWslWdcXDQm1NaLYU5gsLaN7XjlENFpKerSPIvhIZ5ycB7Uv97S/zmbznyMJgmHfm3htXrxE0bMzcOlPtmt5TCyLJ5MTABEM4tPjQ/jrLhp0Xk3oGbbRHpg5qFsh2aXVTBIHQ7ETOW+KQ4gWahpIOwYYAEeh28ZC1eEP/RHTSCZKwqy1DriTacGaz89v7/xh+VQUcC0LTkVFLiFPHqeInecocGkACl6tp1SwBJouLYfNuBZIP0LRQYvwTnn3ZtBwKz+NtVikaWLeDLwEQHr/UBeBQ8CGxRUi8E+HCuw2kkMKzpuevP7RkmNzLDdsI2TKmFDw0ejAnIaz+N4/gb0Z/FXRpcX7GglSbKd3uA/vdFUGWswAULtjOsLF7ynfFawBN0oepwX5DBKjMi7fJqbcShnB7mmsfBiWTvdN4/3QJ9pT2x0fHwy2qLFgtyVd4qaGrdoBw8MxkJD4u1H24SBCd1sBlFakiprWp+InZz0xo4XwpUGEGMsCvoJNXor8EZPRJAolli1xGOoZAq6qKtoYaZstqfX9Ulm4v+Jtp12MvURm+zGEhkH9heyO/K6Ms9ikjfvAjdzrvDD5RoA8fqlZuruWKHVaW8gWUiyYBnguQJGsmyLqqbO5BM9PL2TE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lA1aXshtVI76QvT+JNelQkFa7Q3gw/mwpUknf+6DVVox1V0zPm9g8tjtOXZt?=
 =?us-ascii?Q?VXJx7KpNw+kdoeEQ9Td6XyL6v+mCOBN5L73DplIaY99az+LTvwC8lgcJV3lg?=
 =?us-ascii?Q?EfHCNpIuSPxr1nXFu2UMfJBCoQq+SL6uKjoNB18bn1/yf1Q1ZnMy7Ma6ics/?=
 =?us-ascii?Q?9yRrZa8SE8H+aOhn1eETKs3Z/A7EQICNYB3G4qxT/aur0o39PQAGcjkoRIN6?=
 =?us-ascii?Q?WETsLsal/mS17K4KyDmFoShXyKrbxzoq3x5x4VAIrAXSBb0HO7NLn6bieqJT?=
 =?us-ascii?Q?CxeghXVe7VZfwYaqATPg7pb96C60/+ALuA722N1wruSu+vUvh8P3G6Fuf2I8?=
 =?us-ascii?Q?78DjMXO7a8JLV8CPLgE49BVdLZ3B7FdAkF7x04e2CejH1PxnjC0HblxX+SJx?=
 =?us-ascii?Q?0J6Jj9g2okNDdsdyRvsr1H2cUfSg9A0qOT7OHMnFqAVOTb+1kJbPCLzcaZtV?=
 =?us-ascii?Q?WfLey6aWLX4YuLz1FVnDJiG5ZcmULa2cOMtTSa9epRSg8g7B/uQ6+JxGg3QI?=
 =?us-ascii?Q?MbmclkV7nyjgVfc1LxAQwZLLf6W62hGwMeIrSgY4mTR5ObsYLQRVuqT0vvTr?=
 =?us-ascii?Q?r6r3JdsgOD7JCp6tdGR3wOvPO5nFwu5K/6To3u4V3IHorFssNXB/abwZfamc?=
 =?us-ascii?Q?mClCY7V3AMDzx/nl+VNvatzXymv5Scp2kn9ehvyHM9fFxcbWv4uQqz5KCxWY?=
 =?us-ascii?Q?rQn4fbJRevjrnuu3ANmr5PdCROLipzfNZlIIlp7JLuR9XzGKD/ceeZ26hJqi?=
 =?us-ascii?Q?AolWu0Alg4OohTQ+ip12crm9QVTHHV6f4KRn5MM95VgRwp7V5w8lT+HZ1kr6?=
 =?us-ascii?Q?8wVp8SiwYXR0lV7ln6l4eMvD1duBCcuv6B+HhalKwjB5bEn/t7UvUMaKCjRZ?=
 =?us-ascii?Q?LBMyG6zWH1Tf38yZR21kd8ZcYRYDNVnkiY2LVe7+Ac5PYe5N6vU+j72e19MQ?=
 =?us-ascii?Q?0yBT+SYagXQemI56gYIEbXOrg/NtG542EWDtDqJb90PDHfl3ztedrhuvLYHv?=
 =?us-ascii?Q?wFyr8nTKLYZcJECwiZM8G+Q1A2xyyzhaUluwes+bWkHGMjdoajshhxC3ejk0?=
 =?us-ascii?Q?yTZiymDtTo6An8H7ELYEHSLogsVYR1YyP33czWA1M2XAgizgw1E5rLETgwYG?=
 =?us-ascii?Q?8HrF7ZiLs5F/TNWr5gJTCvY/n76kh6haQnEJXP8g1sItuzOiDkNgrJdJ41wx?=
 =?us-ascii?Q?GwP3iIafkbyRkZKvL4YFX9SiVFbJKgrxYbzKFkxRtzhONDORcOpAq66/+0Ys?=
 =?us-ascii?Q?Vi+l4G977/Lx5U4/wZ6B1WxfG2hirHaNb8PN5DlSUm/2D5epCWF87/6OvGqN?=
 =?us-ascii?Q?B/DJZLFrj2PKwdfok07JDR2nauP6bHiuzHlB7bRqd/C/ZCzCam82H4H92ada?=
 =?us-ascii?Q?usCqwdIWSlNp0Jot4R3x5If1R0wgA0JMdVY8P9E/vzjTSaPhT0L1bac5Apn0?=
 =?us-ascii?Q?E3WtOe1I9tO9EZ6W9CkQvD19Hoh4hl/G7XEQu2SDocqAh8ucU2g3AfGBfzPi?=
 =?us-ascii?Q?+6xzgOdIOJsB3KyWwY9l8N4zfnKDBJoaLHE8gHU7gt4BML4MVQtpzoZNBDS2?=
 =?us-ascii?Q?11DPGTClPgdkKDtxw6nvQ9QmlAW63f1eWVbdBg0UXXIHaYkmsV/cUIyCkZHQ?=
 =?us-ascii?Q?FADMry6V7h2YYXJ7yWH87v1kAwDfjFV6DyRP7WH0o9ULBsPexwQA8iE8b5tt?=
 =?us-ascii?Q?Eml8lMa/m0xcReHZrP/wCqoO5LUBg2Dasfjjy66jANaIOl61jPuC/+MiudjR?=
 =?us-ascii?Q?5THUeFtqIQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f1dc47-0307-4a87-8434-08de7b5d85b4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:51:14.1034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uhy4bMNGYdAglwk2cJVJ/HaYDwCs6Tq/smgMdsiJtymQhCA7xgGW2Ybq2i34IxwPg+sSloKmLdJVocTiHCFAzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8122

From: Jindong Yue <jindong.yue@nxp.com>

Change defconfig as tristate type and add platform driver
to support building it as a module.

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/clocksource/Kconfig         |  2 +-
 drivers/clocksource/timer-imx-tpm.c | 40 +++++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 2112efb85029..1ba3e9bca3db 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -613,7 +613,7 @@ config CLKSRC_IMX_GPT
 	select CLKSRC_MMIO
 
 config CLKSRC_IMX_TPM
-	bool "Clocksource using i.MX TPM" if COMPILE_TEST
+	tristate "Clocksource using i.MX TPM"
 	depends on (ARM || ARM64) && HAVE_CLK
 	select CLKSRC_MMIO
 	select TIMER_OF
diff --git a/drivers/clocksource/timer-imx-tpm.c b/drivers/clocksource/timer-imx-tpm.c
index 92c025b70eb6..1d593b6f0c37 100644
--- a/drivers/clocksource/timer-imx-tpm.c
+++ b/drivers/clocksource/timer-imx-tpm.c
@@ -8,6 +8,8 @@
 #include <linux/clocksource.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 
 #include "timer-of.h"
@@ -66,7 +68,7 @@ static inline unsigned long tpm_read_counter(void)
 	return readl(timer_base + TPM_CNT);
 }
 
-#if defined(CONFIG_ARM)
+#if defined(CONFIG_ARM) && !defined(MODULE)
 static struct delay_timer tpm_delay_timer;
 
 static unsigned long tpm_read_current_timer(void)
@@ -152,9 +154,9 @@ static struct timer_of to_tpm = {
 	},
 };
 
-static int __init tpm_clocksource_init(void)
+static int tpm_clocksource_init(void)
 {
-#if defined(CONFIG_ARM)
+#if defined(CONFIG_ARM) && !defined(MODULE)
 	tpm_delay_timer.read_current_timer = &tpm_read_current_timer;
 	tpm_delay_timer.freq = timer_of_rate(&to_tpm) >> 3;
 	register_current_timer_delay(&tpm_delay_timer);
@@ -171,7 +173,7 @@ static int __init tpm_clocksource_init(void)
 				     clocksource_mmio_readl_up);
 }
 
-static void __init tpm_clockevent_init(void)
+static void tpm_clockevent_init(void)
 {
 	clockevents_config_and_register(&to_tpm.clkevt,
 					timer_of_rate(&to_tpm) >> 3,
@@ -180,7 +182,7 @@ static void __init tpm_clockevent_init(void)
 					1));
 }
 
-static int __init tpm_timer_init(struct device_node *np)
+static int tpm_timer_init(struct device_node *np)
 {
 	struct clk *ipg;
 	int ret;
@@ -241,4 +243,32 @@ static int __init tpm_timer_init(struct device_node *np)
 
 	return tpm_clocksource_init();
 }
+#ifdef MODULE
+static int tpm_timer_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+
+	return tpm_timer_init(np);
+}
+
+static const struct of_device_id tpm_timer_match_table[] = {
+	{ .compatible = "fsl,imx7ulp-tpm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tpm_timer_match_table);
+
+static struct platform_driver tpm_timer_driver = {
+	.probe		= tpm_timer_probe,
+	.driver		= {
+		.name	= "tpm-timer",
+		.of_match_table = tpm_timer_match_table,
+	},
+};
+module_platform_driver(tpm_timer_driver);
+
+#else
 TIMER_OF_DECLARE(imx7ulp, "fsl,imx7ulp-tpm", tpm_timer_init);
+#endif
+
+MODULE_DESCRIPTION("i.MX TPM Timer Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

