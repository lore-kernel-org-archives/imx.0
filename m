Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013017.outbound.protection.outlook.com [52.101.72.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7FD19F11B
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 08:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772787064; cv=fail; b=F5AwvMdOPJXLvILz2uG4tsB/KrhUfMnp965/rjn/TutMTxoKkjwKp6uymzZgjV5bXTaRl8i3wOqUGcPlnfEM6XwbgOcht1ChZNZaP/ckg/NE1rf5Ukptlmv8owR+r0mZ0SlDqoSEU44/LIRboKeKKhLowipGC0tdEKrKuz76nvY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772787064; c=relaxed/simple;
	bh=pp5EMhI+dquLsKN0R1Fpup2hpzWfSsFmd8FzUyIAhs8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SixZ2Rl4+UkI2emXGY27k3o6bwjpp4NaR4aPoQTyFihjSgL+AFy9Q35yX31PnbG+M3SF0PdL5W99+2Z44j841b1BsWLgcpswWlESR9DlaKsBEULhpn2R//tTQTvsjcEM46T1kP682JZZt+Blp600ynsKzxsrj+PCt8I7ahRpMPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mvHet6hk; arc=fail smtp.client-ip=52.101.72.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mvHet6hk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQrMCwGwfgg/daFMTwxBTNvrsH+qL7Rfu2qJotiTUj1X/YTtNdvyviAK9q56fjeah4df7IzVrGBTMS0j7i3yFsKpUbGxKw3gMK31pOm9Bkq9K9Gn00ix1fsyJjNYw0iguXUn6m6/yMRySNUUkjCpUpSNLnTXTDfIIHU9/ZnTOYhrkQL290dtXUOzskblbTYhe9Xk76icuSSQ8FgavzajLhVn4ppJ4fpiL/NEr5GrfmV4xQ6w9rTyu8E71Hnx7xOO9AfMYAkMMM5yRNJvrsi7/iljfSK0FsRVDN6x0ROuolLNM2wg7MWPn8YVV9I7VWEsA6zYDzPXDFzgUe0rorA18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynAS0eWEy3UKmc6VFbP2xJivzKk3iDrWzs5NNMed9wU=;
 b=MWmxUeTgxJTxVOKMlyeOovbjj82O01RoBrjIiRuCE89FdzFfd82SZTaFOg20YzCCza0GglmbABkNdJz0Qe/kBfwLPsqY39va1SDQFqirl9VHm4O0OYndJAahZCpuhp2+SL3BIc/cRLFm4PG9x8wzMaLWeQmJEVYQPj0eEuWA6e+QCbLGibSz9LIYaByo+unloFTZ54VzgP4xPpcvoJlLgPThdCqNBchr3nWs3Yu3mcx1Xh8/IP5QakdC5JgQtebhOtQrBpz/mgZNPkaof4mb9nikLEm9sT3VoBjIqbQgvk4URonqGoX3RtsvgWjmRwgYutUOLSVRCfmb77eBlXntsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynAS0eWEy3UKmc6VFbP2xJivzKk3iDrWzs5NNMed9wU=;
 b=mvHet6hk/YQwiS+kj4WpnnuTgzgl7RMlSLSHF77g3HJVIvjDGyrsfznFdzuze5Y4d29K44ZiopbrwuhNQHVXaSk8wvv5WdAvdztCPYIGKYApqBEKPHa2COW71PyLxEPe8ISriSGhhRc8Q0sQw6nDdaIy/smcw4WrcMJ/tzldFfCdPP/dirPwXCwFNgvlb4UNl5PUqigTON07wSXZIt2oqV80XXAPesNKmfJVYTuy1JcqTJT2KJ44opleZYNzcaNThPGjIWxDZnjRkZ5AI6YhEfBcwSIE43FC9VHMV2JYzNydASPjf9SaOfNTQqf8QkXo+RVw+WCC/r2aJovDpIKheg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by DB9PR04MB8122.eurprd04.prod.outlook.com (2603:10a6:10:25d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 08:50:59 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 08:50:59 +0000
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
Subject: [PATCH v5 2/4] clocksource/drivers/timer-of: Remove __init markings
Date: Fri,  6 Mar 2026 17:50:19 +0900
Message-Id: <20260306085021.1231032-3-zhipeng.wang_1@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 02a36f44-85a7-4fbb-b567-08de7b5d7d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|52116014|366016|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	tjAGtNcn/WT9V45qJcFAIXK2w/Csg1rTESkCJeGyeJeL6SAxXOPbRuFUoWlEJOxr763qzzQzRyT5rh/6GUHw1jLqmmX2HhK0w6zbfdooZsEoN82s+7L67zOGKnsnyfIZJlpRaTbUKGpNWVE/i/PWxkaJhpOHCIPy6uMRN0R8DCN2JdWv1we2IfEpbxtpKmTYBTLqGkER9UGz9yBIxBVNxEkBMV5uX+Bg9QpS7qdWk5wfOFA4+C03XOAcJsqKFAJOY2rqEaPZWWI7yUlx2RC92JX8CYIkNoOCaiUVazcCpiPfzNe6VbelAZ0HeFQU3TTeGdPe29ZFc3b18lLy+55enYJruo95UakVYfz6QJDd4pp9tylyUUZs+y7eRrvtAWGuaX8zHzC3z0wGlRBVnNYuPWoqfZrP1lWbpaiXLTziL/4ZhPN6zwayK+W6b8aG2KrCF7DeRSLMYrpvjDhpALUzL64tOXq9/8mn8h6SEmKehlwD2CEunVGROV9nn+1qk50pS/nOvzvzs2QD33F+Ei+d1ZwMVi5uCAUDCE/XJ3vQIrjiAGEkaAqvr27LpZTR+u+gXar/Ep3B/wB+P+ZwUzQClS+9PdUU+Q4W+YyjqdO4mcQXB4MKHZPFk4NOqzbF4MkcgpZn1eJnniEQXDbXGIwPn4x4ftmZi7sM7B/pkWZJa8+Z42ROn4XcB3KikiU4n0hn8TMU372QrY8r6KFSilHEi5YnUL08WoWw1jZRjH/AEewM3/ov7a50A7lC2JS6o/IhDPxV+ffPahLZyWIXOb/w/ZZiWCi67IVi/buoFYO1zig=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(52116014)(366016)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dTrBQo9bBCwd09Yns8KDHzYtxZuRfmgiA+6HwnQLI0Gc3SAk2HdNP94v4rAi?=
 =?us-ascii?Q?Ooh10S+Z/wULEAiDroek9qgcweTywQTdSLSMryCyOKmw/4Vv+e3Vdea7JIAD?=
 =?us-ascii?Q?tYduBIbaVF6e+Cmthtl5qcwoX3xgGEPui1TSsM/lQSywfaNYkjEugiv/B7rA?=
 =?us-ascii?Q?dY6RRjvAlDyeHKVwoT23VSuB7MU4UbnHkHUO3128au7lIiK1/ord/I64tOxX?=
 =?us-ascii?Q?Ib7LsdGRro9yOFE2hlZgwCiYdxj87p1yWx1yXdcHIDjWQOX5CHLZetzNOeC3?=
 =?us-ascii?Q?c4g19I+oxYhKoIju17NgFHIew5vjSRe42ik106GRaiM9ND8b1045VhqkqqLc?=
 =?us-ascii?Q?WdaXhXjL8Sg1rdBNDB70x4Kwl8vgLP4D4HqktDEVwORqrhy/ykxjNg+m43eu?=
 =?us-ascii?Q?gbv/Qd4Vxt7UI0b5zujJrB8vgjbmvOtn/vMUOoX5AUcxE03sJivzEarNu16w?=
 =?us-ascii?Q?en7IZa/FCKwL0O1IiTL+0uBagjGxxqbjEjrLeS74BDKZ1ippXwniCE8x3vfC?=
 =?us-ascii?Q?KV3rDN9nIDX0eMXMiEOjwbSY2LlcOoBHGuQL7TevjIo8s6NQ97VK6bUX1ib9?=
 =?us-ascii?Q?U26aOBv0xkZ8ghjB7dHv9qRCKHRCIUmrK56uDynARW1rp2aJE13eBTUIxPco?=
 =?us-ascii?Q?XAp00vQTdGv3HVXk+HC/KYJrvCIEqL/5ya+BaQHZO0bty6ryeEw/5QnIIL0F?=
 =?us-ascii?Q?ThnsTl64WX8+fYepHflqeHPepaAdU4m3QYzvdgVgOmFnvaa0YHPg1PX1rJjK?=
 =?us-ascii?Q?rNDtGTfqaQ2oEgXgXA84KJoiIvBaL2N2maP6ZVWkWouEGw3YIvJnXgU8juXl?=
 =?us-ascii?Q?Z/Q17IZA7ty5E8aSi256GtwJwF1+QwNLLfH6/z3BVls5SDJMD77Da2JMzsNm?=
 =?us-ascii?Q?X5fCyATdsCLhJzR42AOqc/Bg+BOUXRAULovg2lOPJn9vaqDGMUgf55mX9z5Y?=
 =?us-ascii?Q?w/2P0fxIf+dqbPbaUBWPA0yatoTZEbXawKmEccytOMBm+uHf0VZJVPbIRE15?=
 =?us-ascii?Q?jhkCO8emKFBGdurQDR7KaHQZWsrsL/OP6C/5+zuJ+FJZJ14oUAhMqH3/IfLP?=
 =?us-ascii?Q?6b9KaY+2S9lKF+WTYWpYvX1Q+AZpChOi3MJSlNigj28V+DOwCkJ89X7gdID2?=
 =?us-ascii?Q?JvHkWFRmaVPE8phWa9Y0fsyrqseBvZeVxhPNdtitIECb0/lvxKuEyRfz1nW8?=
 =?us-ascii?Q?8OZIfypSfuc/ceyzVxAk0DFXD6vRPGF/Ql0hzaRwHnsmOpZ3OEVY6TwPlsk9?=
 =?us-ascii?Q?b60B8KlkOBlZiDtw5ceou//uGV7xFJv8QKYrOIWGPWugByUDeQv01NEGsn6F?=
 =?us-ascii?Q?EHHmSh6WiziP6a+rOipjUzty+jdQdNa1sfIly3JdXl1jxtXmO1G7ul73wBBl?=
 =?us-ascii?Q?TTPLxQJN+b4HMedbT2pKfS22km/bs+391Gnbi6bUEQmCvFhbwQNrHi2XiYY9?=
 =?us-ascii?Q?P/WwZgq4JeEINA5WxWQDRrak+I6yQhAB9x9/5INvtxl+bVrqa1sq9Mh31anH?=
 =?us-ascii?Q?+4bjbH9BV9CnWu6CUiQ/TBuAg1c26QBfJiqX9Zo6dlDBYOnzXGn8Ge+TbU5o?=
 =?us-ascii?Q?86DdZPiqHTJqO3KMxopZn4huVzdaNPZty4yrasEKTN6aJz0R87xWMmBXe4b8?=
 =?us-ascii?Q?qvLDzpKQtBslkcH1XiI4BgFHwns99LC4+jNgCBVRbuOoT3oZmew8NSIaXO0y?=
 =?us-ascii?Q?RsYBbvjGoymAdbjZtEVfNlnvra+fv9XyB6fNzLJYYC9Gqq0r8B7SSdgfS7NE?=
 =?us-ascii?Q?TQZIejJzpw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a36f44-85a7-4fbb-b567-08de7b5d7d48
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:50:59.8989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbcF+8Fm1qzKt8xpwUHbTPCkr4UnIgpQLnQk3IWuhXlmnJp429MvRCpTBhAmvTIIrey7MeNW68/A/EXhkAc1Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8122

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

