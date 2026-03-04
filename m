Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013020.outbound.protection.outlook.com [52.101.83.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5E430DD16
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 02:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772593128; cv=fail; b=FqSG0SoqfXTXy2oUnRkvWStXDv3st4bAODtfjAmNFGgNfDP09tXppSvD1JN8nI3Y5BulPwrg7PfYMxDo//Is0YaOvQFKpVuABh6VYnAR2GcPTctRSHiS23GXU5QQuauK7KuClLI0XzKtTOgPvQym07mVrSUiYKlivN/8JJUgI1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772593128; c=relaxed/simple;
	bh=pp5EMhI+dquLsKN0R1Fpup2hpzWfSsFmd8FzUyIAhs8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C/cMJWEDI/V3Lav1rTNFP4YJpGRfoBmz546A82bdIQK6OkgczOaeTuzAQrJ6k22TCFSUha5f/NWImUrGV5NOQsMmvx6NN23q2GrDKR0Dkn+A5jk/IftRgMqoBEQFU4+KxFoq/c0KzJZ/SsAURHAgnK7fAL3+ouyy7hL/li/F3/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XxHCn/fV; arc=fail smtp.client-ip=52.101.83.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XxHCn/fV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oESB1+/UBd/RF7nDEWmqTORVJ+VXGj1OR/Z94k73cE4Eywme7OwSVJYFH9S46naEp3qncy1Oc1ttH712XjkgoeGEYXnfEe23v7H8dpZ4JOGecRbsn2MMbktXrOPwYS2sm5JeKLsLy35OMHUJc4w/r1XXtr3W9ek9JxYSYAN6+8I/3/H76PKrYz3j4BZ2W4bs67Px/eLxQCtKOmx88bB57ibOf0FUa6YZOxfZzoDha28PJIiUkNh0P9kGemDaWM/53FdQWWq9Py0OsV7VP+C6ggwidf5HuL71GFnZAEUKOBJpoQAFgHbNXSRcbCFEHuoTBwKT7A8NVfQ4Ywko4N44bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynAS0eWEy3UKmc6VFbP2xJivzKk3iDrWzs5NNMed9wU=;
 b=nCVAGQA61yAx2uV3Q2CzGKOG47c/ZnScSIxHVN/Ka8i/+mLIUIw+Zp8YsYeYJzm+OCnwf6yCk/Vjz1ZudFxYwUHZvXRnLUAJ99Fk1eGqjUC6e63djPkP0n6OIYnfTpM4thwUM2NXYhE0a/5xZfPsASBlfxOGuukc76Bm9cdRvEFik1+cxgUu8jWlEVxNtv1Lt2ezcXCpOiyUUUzxD8z5PafIPW6Ot/lmGmj1m/LmlcBPaBHxO25+gD2aG9Miggaeedmz5uIarav2ReDXzNuecWJadEydlZKNv51fVaaLnghEYa4ClEdkUeMBJQJRG6e+6zVFLTuGtXMv/0g94yHtmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynAS0eWEy3UKmc6VFbP2xJivzKk3iDrWzs5NNMed9wU=;
 b=XxHCn/fV+ce3dEakNKHShP0XF3kSI1B9pvk9y5ZJx9nwjOBGoNNbhpuxCFpWyzaOFz79e/xu8jPnDdsjYr+a7BRV/+7Sxt3+hvW4Pmw9/4N8CYr9AiGOcQsw/w5zLn1Bw3RguxfBnrd4FkuwKlMNwBkQoVsnDDSR78rgeMURvOkkLfOENdjq7QeRi5fdh6nOn+YcpcEp6OIpAzs7cOns8g4Ze0msgYO6CAHm4b0xbpS83E1cJx+KTGV/AP7Z/0H1Psw6IjVzx7oxgfxIXCp/+CC4XSJRWS8ATb0C2sibcsqKXhV+5aiwo4AYNX+Cy+Xa9x8xnqMlLX2Byhp0+98dIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by GV2PR04MB11936.eurprd04.prod.outlook.com (2603:10a6:150:2f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 02:58:43 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 02:58:43 +0000
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
Subject: [PATCH v3 2/4] clocksource/drivers/timer-of: Remove __init markings
Date: Wed,  4 Mar 2026 11:57:18 +0900
Message-Id: <20260304025720.2583655-3-zhipeng.wang_1@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 859636f4-4553-4228-cc0d-08de7999f23f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	p3AoQOVUBqcAE+LrpHUVZ28bNtI73uJlWqXe0RK9YHZgNH2sIOfwnUuh2zRtmYlVgaOWgiSwPMLsWvz8xiLvEp5qy2lREEVFt7OgmE0cUxUQtlj5zvILI6BHjlDVhHYCPtPpz8HngVNMN3rH8ot70BuLiNcl1eRo8PG843vzaBCweEh827NCMjSEg/FCFEM0vQUO+SmOYhfUl8mO+9IjfP6IMud8RY9y+0NZu6xGByJ2wPL4xLEUSGbksFdElBA4/9iML8wZPvx992RJu03uED7RwYwwNLde6Cr/gu59NiQspbFcZWA1xu92dPLwp+dLOpzW0pazQ/XCLqRLq9UTlsrJi2PIeqLM682NxiVMG8SkOCf5TWd2cqPMXQ/TgZ1fJLizBDy00JsrGaCY+KKy8wuM4EnTkIi70r2t6gmaBTsxZyXssJMq0Uy/HWMiCLXDtVaDZ0Nuh+gja89VBdsifzttG9zTOUH/wb+HqqUGHUzK1qhAZXy0Hdpt4558p+JP7qPGTj+2VUq1oRPxSBZ/pTdkYXSV7QofcBU2FfAQthxs7f14R717DGVuDsx2suHC4cCYj9GnzsuBco5IbwNTE0ZCtI0c+IPUkJKNCcNDixJ1mlUBaarKUJZEj2287vcPNN3K2w9eVLbfM7ZA6DeHUsQ/KJ6N2UbcTQjspneJiK4zG0YZm0/1xK5kEFf2cFQaC/YStxVj9pIkHpQMwaJ2Q//YXl2E4JgBbvP4BmllpVh74+RFnsHnRpjtc8+AMUBa3Wfw5DL9oqxlrUYxcson0NMym1jussBbMeBJpSYVrUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h+tkiyrMDnmgIrgrELCjEbulPwPv4Zt3vRoeIi5nEh4FUHDp25p2VMfA6VZs?=
 =?us-ascii?Q?jw/ssFpLxvFRp0X4RCuJzMoFv6iu+QVvfMk/Ec1Hnha/z8ImpByZyX1Euo1G?=
 =?us-ascii?Q?OwxUXdOpinjCX+0vctYPZ/dbpEepsy2mDCuSI5gpEdV6UdokNTIOi6huStU3?=
 =?us-ascii?Q?xC9SayOY9pWovr+TQo41nblLMR7tg9QTIIjS0lIZUXqnDpqqPXLQeQqiZMNQ?=
 =?us-ascii?Q?HA3Ntfe/JkiteU+y9mvxBhvV9S+B2iZeTZ4tqR9BKVH2bX8oCguun91bdS/e?=
 =?us-ascii?Q?NHpmJSzalvFLYE0zMj/pHouvzYd5GD+lirn1nqqnvVjKDt30Dy7wmrZWgjbh?=
 =?us-ascii?Q?Kkm5JjRAePqJSD7Kvx8sCk1eUxC+9uWdblSPGUpSoX/dsPLiyQZtgASETa4c?=
 =?us-ascii?Q?6IHGBfysuCaGgfxj/9UzyM/OJ75HL3YSLDUb7m/QumrJyY1H3p+90arJoI7U?=
 =?us-ascii?Q?af18vKxFnEuxGytbABMxQWiau3Nb4BNroGwIIFQ7N/+TRoZfkPwVVHJKEMu2?=
 =?us-ascii?Q?dcS2Yc6vVOz19JrEyrfRMGk3QL6P5D9lROYve2xOrimcuLbNB6ovOgbkZznM?=
 =?us-ascii?Q?GPeVEdK66GifoJC4hsvHZgddovBm/PD5MK+5pee1TLmX+OUOBqiI0gs2sB7/?=
 =?us-ascii?Q?yMdmSFXWQQoXyBaI7CKhW+tSfNJHoFNG1Det+fZkbtMu4XDf5dKCItClk9TW?=
 =?us-ascii?Q?zm5zwnsjhEgAexYdzL+TIX1JJMBxBNxg4AyvXeNJ9Qb/9zzRaoF5U438+kSi?=
 =?us-ascii?Q?LK73eVOZo9vKQtPwaRSMLyeueX6SPON0mkDb3s6v+8DlfIM23XILbOxf4JR/?=
 =?us-ascii?Q?FCgsHNPyS6cmEAz4cBTJvIlEDiTURU6Kj4UkNfKweqDM8lxUoliH7+YzRhLZ?=
 =?us-ascii?Q?qA6Iyu8xv7VyTVJlnVAWVEqtqJOt1xbXiQ5yJgo1foetA92279Mxavpgd0Ep?=
 =?us-ascii?Q?odck524xNQplBZ1/WmeEQdMRcRjSPxQc18Z+O1C4TZhs5Z+hgEPFyKC2alji?=
 =?us-ascii?Q?FLUj2drlYxHhZFkTHpLz2sUcsiJnpK4rbmCaqJXDqvARmc4xuyD5001Mo9+p?=
 =?us-ascii?Q?6Q6LK0S7QwR341UVzv/h03PRMMfrw1rkRdrWTHown56dz1DjH27pUT3V0gmB?=
 =?us-ascii?Q?8CMa0ljHe3IBaozHhzHaIYTjCUdgkPKgfqH6lmYZU6Mf7kqcghIlxxaoGaSB?=
 =?us-ascii?Q?3JXdTNyqBGiUTwiqsgklnur7y2m3kpKPq2dp68FiCdonLNpu2hS9uouNvMr3?=
 =?us-ascii?Q?NQ6jP3KqqyKGvz7HCFZ40frdSoT5pPwo82cTT5gVp6dogiiVbBiYJoq5gbiG?=
 =?us-ascii?Q?mRoc2czrn/t9cnFaxIhX6aFUqLupzIahx6IzjQ/L4/Hpd+JAN+sJnQeHJGKl?=
 =?us-ascii?Q?VTCAKZxxmjAMasaJqExVJqhvPzxRYpMHIcHq6fKxmwQmm+38uc+CJ+ufNvUB?=
 =?us-ascii?Q?fQYzXY/ZnIQDu4+KNS1CkuBj9mepV3d5PCjT6UgCnhs3lYKzD1xTgViBLNso?=
 =?us-ascii?Q?rHwi9OrdO6lxYyamPTtHYn9dwRKf7oGU5hrzAyoqXwvtNyERDCcz8bwf+ug/?=
 =?us-ascii?Q?4fJqryPbFqPisr8KTLH536GOqOcB2KkkcK8rVejnOjJ7pv8GKYh3ZH6J305B?=
 =?us-ascii?Q?GvL5fBhjhxY5Krg6Jbk+SIKJnjlSPvikDe6HjVX4rtoVHI5L05EBilVRTPdl?=
 =?us-ascii?Q?olpJh/8TkqYrd9oYxLy+SrohMcN0A3SUqQB/MnS3u+06z/0ftSxXDc5tZ3D0?=
 =?us-ascii?Q?ehc1NIcXZw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 859636f4-4553-4228-cc0d-08de7999f23f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:58:43.5933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMmuA1ZQpZ8AlL06nF5k16uraU7cbWsvB+qmX2gnGeiZJDTzrIXQejBQLZFlJql32ClrfFt2t9N/UCuUN+CeaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11936

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Remove __init markings to allow timer drivers
can be compiled as modules.

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
Signed-off-by: Walter Chang <walter.chang@mediatek.com>
Acked-by: John Stultz <jstultz@google.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/clocksource/timer-of.c | 23 ++++++++++++-----------
 drivers/clocksource/timer-of.h |  6 +++---
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/clocksource/timer-of.c b/drivers/clocksource/timer-of.c
index 420202bf76e4..b7c186dc83da 100644
--- a/drivers/clocksource/timer-of.c
+++ b/drivers/clocksource/timer-of.c
@@ -19,7 +19,7 @@
  *
  * Free the irq resource
  */
-static __init void timer_of_irq_exit(struct of_timer_irq *of_irq)
+static void timer_of_irq_exit(struct of_timer_irq *of_irq)
 {
 	struct timer_of *to = container_of(of_irq, struct timer_of, of_irq);
 
@@ -41,8 +41,8 @@ static __init void timer_of_irq_exit(struct of_timer_irq *of_irq)
  *
  * Returns 0 on success, < 0 otherwise
  */
-static __init int timer_of_irq_init(struct device_node *np,
-				    struct of_timer_irq *of_irq)
+static int timer_of_irq_init(struct device_node *np,
+			     struct of_timer_irq *of_irq)
 {
 	int ret;
 	struct timer_of *to = container_of(of_irq, struct timer_of, of_irq);
@@ -82,7 +82,7 @@ static __init int timer_of_irq_init(struct device_node *np,
  *
  * Disables and releases the refcount on the clk
  */
-static __init void timer_of_clk_exit(struct of_timer_clk *of_clk)
+static void timer_of_clk_exit(struct of_timer_clk *of_clk)
 {
 	of_clk->rate = 0;
 	clk_disable_unprepare(of_clk->clk);
@@ -98,8 +98,8 @@ static __init void timer_of_clk_exit(struct of_timer_clk *of_clk)
  *
  * Returns 0 on success, < 0 otherwise
  */
-static __init int timer_of_clk_init(struct device_node *np,
-				    struct of_timer_clk *of_clk)
+static int timer_of_clk_init(struct device_node *np,
+			     struct of_timer_clk *of_clk)
 {
 	int ret;
 
@@ -137,13 +137,13 @@ static __init int timer_of_clk_init(struct device_node *np,
 	goto out;
 }
 
-static __init void timer_of_base_exit(struct of_timer_base *of_base)
+static void timer_of_base_exit(struct of_timer_base *of_base)
 {
 	iounmap(of_base->base);
 }
 
-static __init int timer_of_base_init(struct device_node *np,
-				     struct of_timer_base *of_base)
+static int timer_of_base_init(struct device_node *np,
+			      struct of_timer_base *of_base)
 {
 	of_base->base = of_base->name ?
 		of_io_request_and_map(np, of_base->index, of_base->name) :
@@ -156,7 +156,7 @@ static __init int timer_of_base_init(struct device_node *np,
 	return 0;
 }
 
-int __init timer_of_init(struct device_node *np, struct timer_of *to)
+int timer_of_init(struct device_node *np, struct timer_of *to)
 {
 	int ret = -EINVAL;
 	int flags = 0;
@@ -200,6 +200,7 @@ int __init timer_of_init(struct device_node *np, struct timer_of *to)
 		timer_of_base_exit(&to->of_base);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(timer_of_init);
 
 /**
  * timer_of_cleanup - release timer_of resources
@@ -208,7 +209,7 @@ int __init timer_of_init(struct device_node *np, struct timer_of *to)
  * Release the resources that has been used in timer_of_init().
  * This function should be called in init error cases
  */
-void __init timer_of_cleanup(struct timer_of *to)
+void timer_of_cleanup(struct timer_of *to)
 {
 	if (to->flags & TIMER_OF_IRQ)
 		timer_of_irq_exit(&to->of_irq);
diff --git a/drivers/clocksource/timer-of.h b/drivers/clocksource/timer-of.h
index 01a2c6b7db06..367d7023c623 100644
--- a/drivers/clocksource/timer-of.h
+++ b/drivers/clocksource/timer-of.h
@@ -65,9 +65,9 @@ static inline unsigned long timer_of_period(struct timer_of *to)
 	return to->of_clk.period;
 }
 
-extern int __init timer_of_init(struct device_node *np,
-				struct timer_of *to);
+extern int timer_of_init(struct device_node *np,
+			 struct timer_of *to);
 
-extern void __init timer_of_cleanup(struct timer_of *to);
+extern void timer_of_cleanup(struct timer_of *to);
 
 #endif
-- 
2.34.1

