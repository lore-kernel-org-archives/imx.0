Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010030.outbound.protection.outlook.com [52.101.69.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A5D3542E5
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 02:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772593145; cv=fail; b=c4UHog9/BSvjWch5z68sRlGI8DZjpFIesduBthkai2myYpmJF28+A584tqEwXVJN5vBDdZc+X8tFdpg5xvoY9JEO+DsqRKIMURMVct6MRy5N0PFusa1qeF27GMLsxVnmg3upseFfzyzp90b68t7GI5xutarjwMdGBQiVj+dCoSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772593145; c=relaxed/simple;
	bh=/g1Cj81SiZAhmj0y76zlr3OkHd3yV5gEFT6Rc3QcHZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D/j8XeWO0RtbfSn/q74Mr6MnmEF1utXP7fcrCMhp56mRh7MslewXc5aHdXFDLNwnYSNbdW6p7fuTfxt2wyPUNP2elSwzGAsu0X/DqB3/HTczAp3EWmgknrqjsuPYmU4zDgZUhexS4kSQQwYdU6TzhSF218G51kBA8dohBdRj96c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aLJO8ukA; arc=fail smtp.client-ip=52.101.69.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aLJO8ukA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQmoVgioRYInkFMc+90fqJOB5sSeLfGuseGCIMRVMi4aRmDspvjrgMOqw6TRXsq/pBE3DgjoGGBJ4eOlkXpxLe/c+xpP7BwgXntbDGi5PdLOKnTQAsb5sUUyNOi1OM+V3y7qKgWslRpkDPER6e1TSZ7qPbhBswXzfucY8PjeyY7eHVqA7UMO0z5Cttyw9O7u1Lcf1FNOgpjMAuG0oAEVSIXLGD+oD2VGRdLL/Mj+D5mEwjICDZRSJNJY0tWJFHxNhzS9iyXrZBiDqf/rplgicTq+9vUZeTTjBD0bxmFPNAzImxKwdw7Bt2oDBGddE1Aae7fvL/MOuTWl3c5H92ctdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RheqG8VKoXurtUZph32KCkaOsl2zT9kaxrRYmaNlN/E=;
 b=ENClIo62oIPDH60ZRnH7ysDBuBXlpYHQtaJPP0H8uPOq7Ug8nUlMeViQ0hPlvHyS/m6V9Xnxm6YG7QX8014Js4TXeydftCeH/TSoxHOqR8pRqh7PxKQR3uaRvA2q1Sh9gA1gmr/Id1WVIM3dhXpewWmbdRalXusFQPykicUTtn8HMN4GPH5VFVZjpzVzof8IWoAXoVFnea0QHb0V02krSv73KAJgGmE4XJM3qNabymCRt60l5ZKB6tB5w6K7iUkUabW7RWEBgCZFfwcWsSZ32rv9CckkZYFy2fm83gknVklZVvRHEG43DCrqk2K1jaqkKEgqUJ4IpllE5p6LD/aeJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RheqG8VKoXurtUZph32KCkaOsl2zT9kaxrRYmaNlN/E=;
 b=aLJO8ukAAasQjb+kn7GFHdAvXV/f5ClyXoQbG+bWtK+kgfKZgY/D44pLIiJ4zC/g+v+KZlxYyT0qxuWoNc4BLYN+Ir+qc2WEFblZQCeFcmBIavaO2bBIZy4nTE5vaGMMdK31I4l2Aq22cTZc2TNNBSNNMcEqIc3PpjJ11K2WcD1L2tO0x1dVoptPFz1e9rRgrs0fOZWVugaG29wMolWckyjcUzQvyOzCbRrIO8YMujmPo8YmNw7gp0Q2NrV9th4B38pTurJJ6wW/gpPCEw6q83FdwH0yCZqdknZ/VRR55mwM9kaoDxwWG7NqXd3CpPhbSkDJUIDkxdz9LcPVEUddTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by AS5PR04MB9769.eurprd04.prod.outlook.com (2603:10a6:20b:679::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Wed, 4 Mar
 2026 02:58:58 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 02:58:58 +0000
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
Subject: [PATCH v3 4/4] clocksource/drivers/imx-tpm: Support building imx-tpm driver as module
Date: Wed,  4 Mar 2026 11:57:20 +0900
Message-Id: <20260304025720.2583655-5-zhipeng.wang_1@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|AS5PR04MB9769:EE_
X-MS-Office365-Filtering-Correlation-Id: 841c8aa4-fbc0-4f88-8e94-08de7999fb3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	1zLgeo8QdDAoXJlfDJaY8qPugXJInnnxbdaNeG2l3iVtT1XT0yyocRE0RvQ2sn4gkTRB3tCp8/eAAv/3DCdRB/Eg9Q8S7xyxuAAHnplDfzD2zTEsm2x3Rvi7dbJvKRnIVifXHECSG+0Pyf+uzo0b3SXrg6BodDsNU2+RLeynO55Zwi6AL3I8c0RqDKtku1mQY2wpyAlFSu32ryYToQTs2kcPkpoQSSw5MtKkZ6rMTXb8qU3swa/ZK5qD61uH1yktFxlSmytuJLn408glW9sZUWZQchj/0rjYoRhShPegi5mTgBYZb4VhEy4UthRYpIkt4fRaiunRkNKuetTqUldW4l/UQGchVsZz/JHwietkclX+KFIZfzG86M8qZ8IIt+szdWFVMUjbssy9Cm195VEFILFEshqcD9bZdGlbyupwhOuiF+a4OJw/cpvAXV/NWEGiNBwHyLW/6kzMbGvAbLezq3rq3WxXXqTmJYUGNg2v5hPDcWZY6zFHii6k5/3SNq4O/d7+0TYFb+eREdDUFBwNZ/hPiWNMK4nO0DRfSLzKHM8pcg5QRMILRZe5/Ljmxj1Kp0wqC0sNAbAcZeqO9vYC/Y9iJP6qyxeAgHkIqxUt6x0g6pMOpJCbInhMfcst3tEDTA97h57eAZKOxAamRoOVSyh9hv98csPTXJZBbLfGOpTPnawGCL8x1ekELet4j6qCWMTdeaJSVx1PbFwQGzVF+oNFqrHomsiXQ5cQ5CM3Ft9/M7ukWEnIiLeC+14aTU73iqXF03WSldvtLmgW6D9vtdjgdeTPLtkM0e0yLMn2Ub8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eh6ecLQsdj1knQSEAfX6VCjhAiv1QrwUKhhuPPUWTtxctijsHdr1EfuBaSEE?=
 =?us-ascii?Q?ndMrJM1QnvOADaM5JUoVempFxUyoncD9zWXLS0bWAPyrTAnq3otx3gW/e7eO?=
 =?us-ascii?Q?UqZzSpdYvqFZE/tlu0fZIS92X0z+nFDCV40e5kpa2xfAdIhPHHZ6xl7ZC+Z8?=
 =?us-ascii?Q?fKI0/6v3AxrY8Da1irHs06IhjQ4iv0s1FtuAr2z+rZ+nvonDo7fXjSOBekeR?=
 =?us-ascii?Q?C5RHJYFEFfE5WYQpz6io8fk0Da5I6mg48juQkUkPOuw8n03zRtnUfUL9heoS?=
 =?us-ascii?Q?xzYOtv6+S+sFPKEFrAxwDQwjs0O0IF70EZvZzbA+JzW5M+H44P+YaX+kgcVo?=
 =?us-ascii?Q?2YnJe4rPdaSWFOaEaLCxROhSdoXgGAYda9RxQPDF1K8FPDl7aPLd4uCggtqH?=
 =?us-ascii?Q?c1DD2ZCQPTeFYD5MutCfQb8oQ/ksl7mGnEzCSYygddX0MPjbC0XcDWQ+kqeJ?=
 =?us-ascii?Q?TMlJiPOINRG5JKK6EFFudfdjq1Tq/+yAEmT2NSRm/TZHjk81EWHtNkSAopxV?=
 =?us-ascii?Q?/3gcsYdPbJZ+wP54eakdRvH6HjsCm/Dj6xJVDHnbvWtYCwu1FEwk28c9mdfX?=
 =?us-ascii?Q?s70imjQvx+njPRiZmXDcK5N/thf4HRRT1VWoTMca35w61X6Fg3m338o6KBK/?=
 =?us-ascii?Q?AikLZhAEuybAIzCdSEtvQJVFIoQAa6VOuuD9qSW58MbdYsg71DHkQzismUQu?=
 =?us-ascii?Q?WNKAFNYCW+gZ/cpiXMTGzPKl00eZ53UbGXXcQaDd3/TnMa8XpS+eB0hASsuV?=
 =?us-ascii?Q?iaN7MfS3z0NDnkREAt3E1NSDqY7Js8czpcDdTqoWTbwIpRW/gIiV4hddhWa6?=
 =?us-ascii?Q?mNlOB9pHZ0r99vohvzSJMTRxfEszmRB/h0G/tB47J09SLbRORzWWF+91Fl71?=
 =?us-ascii?Q?MjcZawzVC64WAxXaC1rUa6f1WGhxRY2SB2MWjYGeLawmmSYDh6iEh4no5CJ0?=
 =?us-ascii?Q?iQVhcbZqfL8LVBtqLhvEFz1MWqofoZLBWg44FfQ+fj62cTXeah1YstZViQPs?=
 =?us-ascii?Q?920i8TROxOTpbRcLovqCUTrS2HlPfWcXebnEYGXXv8p2/JvH5CNlTWtSMdOr?=
 =?us-ascii?Q?czAYjrL9GtFVe4Il8owSbPOl3sbHUcpcuEBVksKKz5nMXb2XgY0/4pCcbMcE?=
 =?us-ascii?Q?9rXWr4jNWSBLE+EZrrg0gUcleNgWBFOLC3c4gYnScR0LO3szHHLYsUZ+BGgO?=
 =?us-ascii?Q?u5HiLiaX9fT8kTEqTs6eKbOXviIm9W+3VwUFB9AkqpbcajTWnVOvD/VoP/GC?=
 =?us-ascii?Q?HtPs7c/PcQpYVmlqSmOHMpQ3SGrkqvUSL8ZqS11eaKzWkmsJP4C8U254Y/ON?=
 =?us-ascii?Q?Tu+MK2DBNrPVPVpVXS6orTC6Nv1fIflCoomT2A8HDfjDEsH0Ntk/k//I9Qdm?=
 =?us-ascii?Q?ZNCGD9DquJwqQ0qufrOb9KR2rUmTj59KVADq8ATnihQ6QSzf48SMZdPqx1ZD?=
 =?us-ascii?Q?1BUIrLGCTq1BxaeKLDWoZXJ/iwMrItOUZYy/B/tfKmDEDSEpkslQCnAtxAa2?=
 =?us-ascii?Q?FjDA6bf8sEeMvqCQpz7LedaTuWfQ+RFL5spFmk0nE2zGqx+Btb/rfTkKVK52?=
 =?us-ascii?Q?nKGSHeSrUy9NdCwFeVOL9ZgI73GhApw5q6Kq6gTy1/vjShGG6AdIySM0n4U2?=
 =?us-ascii?Q?W9EWuNIQKMi7fCf0cg98ExWzUWIlUb+xNp0lSDMA6qUYflzbV6uouCtEvgYk?=
 =?us-ascii?Q?CYRhu9ChlaE/POYJuk1C1bzccpUA060mQDOzfpysK7JozUi5hgRXSsnZJ2CY?=
 =?us-ascii?Q?6ZfFIdmaGA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841c8aa4-fbc0-4f88-8e94-08de7999fb3b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:58:58.6846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUTZxviL0FW9aTSyc1AnWf0za84QWMuL0u8E1kt79vxlUJ4Ue8HlfLRMvci7eU11QxcM/cqVbseqEOx3eAF6ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9769

From: Jindong Yue <jindong.yue@nxp.com>

Change defconfig as tristate type and add platform driver
to support building it as a module.

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/clocksource/Kconfig         |  2 +-
 drivers/clocksource/timer-imx-tpm.c | 36 ++++++++++++++++++++++++++---
 2 files changed, 34 insertions(+), 4 deletions(-)

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
index 92c025b70eb6..419d094459b2 100644
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
@@ -152,7 +154,7 @@ static struct timer_of to_tpm = {
 	},
 };
 
-static int __init tpm_clocksource_init(void)
+static int tpm_clocksource_init(void)
 {
 #if defined(CONFIG_ARM)
 	tpm_delay_timer.read_current_timer = &tpm_read_current_timer;
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

