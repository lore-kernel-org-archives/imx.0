Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010026.outbound.protection.outlook.com [52.101.69.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701981DA5F
	for <imx@lists.linux.dev>; Thu, 30 Jan 2025 21:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738274003; cv=fail; b=RrAfk8JBHB8ZJCxYOZwow1UKBsQZL82Sn1MtsNicPyA6q4cW7VSyRG8GR7SbLj1RB+jWBPJSMF32BrrufZVZhGfSXMY3Qb4WOFLZRQHNbKGBqxvFQPLmGPZAA0u+mNYVrfn/TY3F7OEVjYHeB07td6bEq4GqBEazJg+zIRPUBU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738274003; c=relaxed/simple;
	bh=A0ayWq+pI9DIF/OHq+9/TyY0DE6W0dynoczoFhbuoB8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=POGfadOvBw7hlHrHZm5y3Cs9M8iCDPxajStF5WDvRF9ubW5wAHGz8rlI/RttT0xAz/DctQlv5o8o5cLt++OPU5cqPaeuqNcT1RKdZ7BsTExI0t33QQBp0/siGYmsVl42FxbmrgKfywRRjOPs4ZwEh67aykP2a8Cze+0l3Q4/K/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A0IoFxgC; arc=fail smtp.client-ip=52.101.69.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A0IoFxgC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SumE8HoXY1oAAw1Z7bRVXD+6EilkTxXJlba7xkWrIZ1IeIYR5dwy6yHTjZDGa5ZPL/1fPF4qbFOn/hfEQlkcRWvseKROaI/JGJlvQxSw5Fvn71MR2tk3TcTUZrENjfvUZLLX533btEcdUHKWyYIyv/l90fsyPrN4k+YeokhI/U9zUs9L0BaWIC2OojVxEytq2efQhwuTFbpe2i87wmrhfoiUszhzi32Jk0wYeaBFK49zUg3+mvh5kOUFFZ1cSEJy9vqG7XffiniLSnwgUOOFWBJ9zw6R3nrnV4rfh/O/PJGHl4aurozfWLifeoxJ9Iyf7Axpop2tDGA6FWPU12deFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNRgtfs42VDb3ZuXPgWizDNd+FI8+KxZjdRlsaIcB/E=;
 b=R8G+jPqJLk/O6hWlvS6gyOXfIRRygIubGMm24NvZbAhMIdkPsuwEGqpZ0c3JUdzKVKUPW4zbPVGg0MvRsoggTCnvXXghwJt2Tv8WRH5MuJHlCNfmC07hbXQ/S73jwmyNIxQ48PD1uHfDAbvxHoW+Q6RRYYKqDg5RCOaUg6+MHYiNTYKsDjzZCaLe+a3uEj1vsnRQaRG9zVOFc2wFbM7rm0H/4FlzKYXUB974VVIWmnLa5kqAHm/xMv0NcZZvuKt9fBrNvxLYLshNGm0xOEJCpGtCPA/GAaPfjuJie1zshfQkegOnKlOJKO8xtGpSbvOtRo+BsnOZE18B/e/bmgZlaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNRgtfs42VDb3ZuXPgWizDNd+FI8+KxZjdRlsaIcB/E=;
 b=A0IoFxgCJAewLcqPTk93P8WE7RTYln0J7yNOPxGYl1GCD6oVM1dgorcbYLSlWtYl2G1NGBvEB1LMTNKSd+IWIbVgg6G+RkUwn3v+4/RtYGyi7UznmwNHzOusLY1YhKv/ZmWSWZgp/HnYaIL9H5ypVppBywa2RU7MlD/ZXrtKj9zvmf3tGG2s+sldIwoQZi+UB/GbuKF0obOv6EIZP4EE+Ie26WuqARwrQ9Xuw+KzLQV/bZdMwmTBv17JoNXWjSXNtZ+r6/r5a4i1Ljfg9F2u4iabXoVBtEQC5sRHj7Dk+JtAdGUkzcCuiS82w3OL1DGdtldrlY0x/sfoJlBUIuQe3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB7629.eurprd04.prod.outlook.com (2603:10a6:102:f2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 21:53:18 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%4]) with mapi id 15.20.8398.020; Thu, 30 Jan 2025
 21:53:17 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: imx@lists.linux.dev,
	linux-imx@nxp.com,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: [PATCH] reset: gpio: Add self-deasserting reset callback
Date: Thu, 30 Jan 2025 15:53:06 -0600
Message-Id: <20250130215306.60589-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0037.namprd17.prod.outlook.com
 (2603:10b6:a03:167::14) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PA4PR04MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: dd3d7f75-0d93-4fcf-0d04-08dd4178812e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UscKYs3aC7heVrMMV3kcjJsirnqx1cEZ5hBeY4JvfEGjgavg3Xdoa+aD92+P?=
 =?us-ascii?Q?nfYEFYr2ebhdYcqWSYy8BQtvOv2m3JVxFBGqGN/ZwAUgzXQlJ+QopgEtANLB?=
 =?us-ascii?Q?NGLbaeASLOTDVZ+9ArQg0IQrQSqPftStjSR0/24K4uP6jn+TWToI6RkzxHbS?=
 =?us-ascii?Q?rVbM5+gY7ZZJdFAFqhsLWHSIceodfAGv4FzuRCrCvAZ6bn63CkfhYj/toINb?=
 =?us-ascii?Q?9m1fg2yoa1AgRLd9/vur3GhoIN4Q1N1ZtvjQdVQYf7JBJwWedi8a2tlahbw2?=
 =?us-ascii?Q?u2SlfTGwFT4gP1W2eb+QzwuXcTsXYlf/p3xil7xzSmGZz+QAcgcCgulHSDRi?=
 =?us-ascii?Q?fFM/sBcQtNjH2P+n1g5XX7xxuhdueKjRrue7O9IxQX+/FYLor5N96n311vfJ?=
 =?us-ascii?Q?2KgJUFuHFkEQIIZBkqpNX0MSwuPFnNHouQetwwiOPKI2awyTkRyXUmfL4g2+?=
 =?us-ascii?Q?jgSNTOBWAKo6ukX/PymqqYvX5zuqjVzYAZ8EVFE2pb+L3pdli+HjTjSFAGk5?=
 =?us-ascii?Q?4x2EOuL65dGELyGNATdvdT1PWxgI4iyG0QlnQDeCmOMeD5jSy2Rd9XUVEg9u?=
 =?us-ascii?Q?V6wZDQTrksFhO84ipid+RVaV0MZmcwifEcnpk41tYB8fBuCZEntBAPidONDA?=
 =?us-ascii?Q?2CzQQK3CpkDOCUO+Ez4acZCqGbYppXrzx0xV9+Kc5YBWYhD13XMiJKJ10dif?=
 =?us-ascii?Q?2k1PZH3uEAPZqj5U4SWDwCYKHFcvhY2ZRjQsOgxGQDtO0AmxsEOvo6VRTRmW?=
 =?us-ascii?Q?blyZsVlcJ96yzDN95Ure76W/CrjDYVbagkqRK7KvwrBhr939ooANXG8qe00X?=
 =?us-ascii?Q?XbjQJ2s+sIvulovOn3Ey0XJp+wX+iOkzgLUPJifU7TiI9OCC53yCKAcDB4vy?=
 =?us-ascii?Q?GG31l1XJZFrcl5hFfuFVgj8fhtjoFAcgy2Eq1XEo9ikVVOs51G0Tm+bE0ln7?=
 =?us-ascii?Q?nHsfzRSM6Xgfb8WrhSN/ubGqFBRI5XhHzdogeO+9paiuYIQ8nNX4D2OkWmyb?=
 =?us-ascii?Q?PfvolmAJ2hZIfJXlk9EcOH+3Xn0V762i6D5CHMRe8qEG+i6u7NmxIL5js0PI?=
 =?us-ascii?Q?24FilY4Ak2RxbvuZz4lpn3YAuPuqN4PtZAX7TYZKfqNw9tEiQf0AWSaY71qj?=
 =?us-ascii?Q?3VAqJ8Tm1cZ5XOV/2U3JnYa0lc5bYWyhBGCdTfXIqYEs1tNehyTHpnv5PG5f?=
 =?us-ascii?Q?mGJ2BDoCXWQTh7Ez7QQAz24eI67pMfVYesawlrrdMPl9pmuLC3x7iU9Cp0yq?=
 =?us-ascii?Q?c/R+LTYpM7GLhOmyUlBNS/ZQmVoIil/HvJtly68OwnFG4vgNkyBoPYwccffJ?=
 =?us-ascii?Q?L2eUdIqH6a5N+NwPItIxuQAI9FfhBfNzR+jCs1LJLQuQW57mYNLuasq4PZlx?=
 =?us-ascii?Q?Cns2TuylNCVHQP6qMZ7sz67zR7UiDrySspzqZJvMJws1nmjfMVN0AA0i7+6s?=
 =?us-ascii?Q?aJDeV+bX5365xfccCHLAP8niPEmammF9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F7zfI1TL1OtkTLrvOeOJBcIm/vu/b0eZfPmzgeNkYrHUpUzPM/kj5N2vrvBg?=
 =?us-ascii?Q?rv0RfjU84y0FivfLwiqE9G8fiHVVCtFtO+aFmEpMccsgEf603mrshPLjGCWI?=
 =?us-ascii?Q?I6qqsjHBZFE14kGbEVuSg88iy+EUDIT4C+XTHvuoPl8AwdutYsRderGeoRc/?=
 =?us-ascii?Q?v8BAOGEePcN/N2OuaCdpySp4quNjhfsB8bjWPRWgb2gyocJKWqcmwB9Q09G5?=
 =?us-ascii?Q?P9DPnHPa/Z2UHwoVEtzRZyyGa242vdYA4iwwiWQeo8jyh6ZuHHgvjplOB95U?=
 =?us-ascii?Q?sMFdDKm7HJKslubGbsg3Qax4RiJMGXuKN/SDhO6b375we+z9QsoKf7B4hrwX?=
 =?us-ascii?Q?/di3F2mH/tF4MH4d9JeBaPY7pGg/U7R42VWNA8HaHPzgcTFcP7WUjU7S84St?=
 =?us-ascii?Q?DbukV9L1pRueeIASZoljAfQM/3hW0y430vwopRnddFU4NvHpX1QqX4J6SfST?=
 =?us-ascii?Q?ApDBmXb8Vp3Xjn9i999IAvWdQeUBLPk4MgCtwh7n9Q5706Lz6puHsOS3/RC9?=
 =?us-ascii?Q?07IqAgig4H5+i39WuFWHCFxhLCozdmRarjRp2K6K6/o1jQ2dv5RDLx+y/AYY?=
 =?us-ascii?Q?dX14RaOU57EGX8nNlBMsbjIX6Azdx6ogj3qmvpOazxB923ldqZbqxcURYtTv?=
 =?us-ascii?Q?7xkpK3YJih6+mQFp452G5KYq0plsx6TeTbklAT0UYfz9LZHxQqFYfzatOZ6G?=
 =?us-ascii?Q?Q4WgTA+Hygc96212mYobs9efrIuS2Ux7hF1rh8TUaUGEdT+sJsQ+nZcW3lQu?=
 =?us-ascii?Q?1bzKfzI5RxxKZ4TUlflJDATJscrwOPgaRkzbPujnFaKu19t5gja7A7DL5HIa?=
 =?us-ascii?Q?fGbDRR9CkYTcroSorOpNGLR+O6Rk+ZHix7p1ChSP9L1TxRNKlTktiywKLkdW?=
 =?us-ascii?Q?ffkKseasEKr4otnrSxWbn7qe/xDOk5mcazoQRi8b0kQj5hR3BH3udkJDy+P3?=
 =?us-ascii?Q?3Bew9v98/yq7rrynjorm6ZpDNyJ0g+4Y5wF3nBLRshy422AR3eGxfBp4eY++?=
 =?us-ascii?Q?0/lIXIm5JBYvT0q+lHZxV+S/+1ZHpqAbVk3bof6KlH3C+0EeaNiGHFmvO38f?=
 =?us-ascii?Q?nI5714ylDN7hSsaPQYhn9pNTbcQpvn7SiTHR2sPQ03iLaliBfD7+2PfN+JY6?=
 =?us-ascii?Q?9rnSLfFHQxp2JWAXP78oY9Fm3hoCivJpcF781SjyxWtyGrB8jNyN2QQQnjnu?=
 =?us-ascii?Q?88CB1sKBopCf1XNYThI/et5MH+1zwquiLSJiUgEmrujRRYRQ0QjDHH2cRz5M?=
 =?us-ascii?Q?I1v80+BzSN4ZlFjnGG2vPIdqbcJGldyLd3DFh4bEfkhJguPBHVgO0pBYaOdp?=
 =?us-ascii?Q?bPqlEj5s2oxP6osfL3QNP+L1k3WIKbLNPf6dS8JSy26Db608OMaMHz/La8y4?=
 =?us-ascii?Q?KOU6omwAluYd9Hu2HYwlI7yJYvXE7L6rC0g3CIpfio1MpCK0Su12Qc14nOLG?=
 =?us-ascii?Q?qQZXcYxWPbjTcQRUaUTgH+lSz39Y65GEwHESo1Ct38mky5qjcBQvRx0V8KjQ?=
 =?us-ascii?Q?VewCr+oWkJNmIbgRHS703ayRkxNweMKHMnLqNEz16xIXzjhj0k6z6SMyK+6T?=
 =?us-ascii?Q?CGD8quR4OQGoRAYGO0k+MUtXrtpbFGme0S5GTOqV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd3d7f75-0d93-4fcf-0d04-08dd4178812e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 21:53:17.8394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ysG/SAPQSKbIgiS4CDDMYbY3SIomUazI8xM0YXKRjFKFm1TNcGOjwfixwyqxpSTXyCkUNlHaisrA4fX/dnLiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7629

During the driver probe phase, many drivers leverage convenience
wrapper APIs such as device_reset and device_reset_optional provided
by the reset core driver. However, both of these APIs depend on the
presence of a .reset callback within the reset controller's operations
structure.

Introducing the self-deasserting reset callback enhances flexibility for
users and enables a more simple reset process during device initialization.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/reset/reset-gpio.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/reset/reset-gpio.c b/drivers/reset/reset-gpio.c
index 2290b25b6703..614f9e261a13 100644
--- a/drivers/reset/reset-gpio.c
+++ b/drivers/reset/reset-gpio.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -37,6 +38,17 @@ static int reset_gpio_deassert(struct reset_controller_dev *rc,
 	return 0;
 }
 
+static int reset_gpio_reset(struct reset_controller_dev *rc, unsigned long id)
+{
+	struct reset_gpio_priv *priv = rc_to_reset_gpio(rc);
+
+	gpiod_set_value_cansleep(priv->reset, 1);
+	usleep_range(10, 20);
+	gpiod_set_value_cansleep(priv->reset, 0);
+
+	return 0;
+}
+
 static int reset_gpio_status(struct reset_controller_dev *rc, unsigned long id)
 {
 	struct reset_gpio_priv *priv = rc_to_reset_gpio(rc);
@@ -47,6 +59,7 @@ static int reset_gpio_status(struct reset_controller_dev *rc, unsigned long id)
 static const struct reset_control_ops reset_gpio_ops = {
 	.assert = reset_gpio_assert,
 	.deassert = reset_gpio_deassert,
+	.reset = reset_gpio_reset,
 	.status = reset_gpio_status,
 };
 
-- 
2.43.0

