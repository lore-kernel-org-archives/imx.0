Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011061.outbound.protection.outlook.com [40.107.130.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F29736C9E2
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 08:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772611973; cv=fail; b=DwZp7LGersGMl91Y/sl9rVa7NvGRAR7+SZXNKT6hB0+ootvUisiNUssX+L0x8P/O8qSrbyMipoBAfO5CgcELgIv278DUCR9C5LIayCVBFdZwUOW3UDRxTEtBnZ6yXkeqAmDwvL8d8dSL4iSWyJMDfkl9smIupQFBJlwNONDWe70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772611973; c=relaxed/simple;
	bh=pp5EMhI+dquLsKN0R1Fpup2hpzWfSsFmd8FzUyIAhs8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VmxqeoMrfPR9o7ntZgF6Npq6/L0/qNxxRgOcOMtXnFqEJvD4xuwY7YXB+3XhP42b/YBvinjN1m5ReG4gwSlb9UmLkZadDyPouZ+6IaLjj0oX1V0FEGY52g3FGchBk53FfRzyA04guVRk+tNchkGFblm5LtEeIyS7O95VRuhfI3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TBa4zQJk; arc=fail smtp.client-ip=40.107.130.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TBa4zQJk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQE0Kw+0W3Zb6PGvJb1BoUXn0zoBWmscc7MJL5tYb+vLo6LV2U0SLwiGKvFPxkB5Bzj3L/gMXmbPso1eH1psu50yp3zDd50hK+JLIN2xTlvCHB++0GYvhR2FrOQokA3OK/k4nj8kaRQBv7FHIyjihmWTt58J7An8voq7+SwHgvtjMc8zslDnK8W1fXDbQ//5KgO3z53B6erEAm/HqzsXnTgtTgUbV9fjnhlz+5IbZxIllmKZMPiolpWSrJC5EjhGSQDau5mhXnGiIcOj+GRjrOtEdIY0MnXTCDaqGj7OI+kD/pnDAd0CveKL/YcxiSu3eE6+8xPjc+5k8a0bTzNLog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynAS0eWEy3UKmc6VFbP2xJivzKk3iDrWzs5NNMed9wU=;
 b=Jue54G7Hu1noJoKFfWagnNBeUjDNK2NeyBNUgMSyl1ZaOB8cl3q2mK+ghcHPJHHGH3CuslI/0POkrsXraJ9pfIiK5tHYNUjPpacYkn9A4be9FUEdjsTVsDL7iclX61bDMLbkW5GXfd41t9CuuGzNN4tIfhBMdtPk+Lsxc8ezT4mM5Sr+D8Y5Vlw0LQOE9HjiD6VNH7VJJIaVUcS0WSZ0Ec0mmMg8ORzHGH7gRBuO4QCI+EcuB2QGZ8K/47jCpLRJ+UPNoaZ677f0/y76Eubp2XDQGDSXxQp4IhC1zM75nWVRoJ2z34bLdr7TRs1xORf478SOBPAo5yNOwai9sD0Hvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynAS0eWEy3UKmc6VFbP2xJivzKk3iDrWzs5NNMed9wU=;
 b=TBa4zQJkojPoq0omxgHtG19ek8M7y3UPVPQJG19ZmTIjWUEMMAIq3O6EQCYkKqGXUlBFhRWQBQLsZizybS3Mq2MC7ZzsoXAbo5YdWDXrUQJtpxkTxU+OWnT68tOFOze/Y2fK9eY+Qgg/GhnAERWws1IRNUmUNw/m88RKT9DI9An7HR9FS/a6U8xROihPBLjbLsCypz4wYS4qgbCJ9nRSCXKoJevZaQwZ9NExzUiYlQMUN3Ba328v94I//wFIgYiQcUIwpnL/VcC1twXFYyI+Qedg3KcpOk1VSwqKLmujhfKYJdiKXaE4G2fHtq43/PJZuAmyYeJ74D3N0vFYWEhEUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by DB8PR04MB6796.eurprd04.prod.outlook.com (2603:10a6:10:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 08:12:49 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 08:12:48 +0000
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
Subject: [PATCH v4 2/4] clocksource/drivers/timer-of: Remove __init markings
Date: Wed,  4 Mar 2026 17:12:05 +0900
Message-Id: <20260304081207.4030882-3-zhipeng.wang_1@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 26327762-0a12-4bf4-971f-08de79c5d2db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	F0jZyPOYAEiOVqdLIG3gGjVINsBaQqWD00Gfqew9GFG5d1sEtvlReRNYp9vzM4XMMTFFYjOEuMv/ZQhXe6W48q69LZT8ZGMsH6mW8SOOq2wngmSmAWqLJxmf8WYX/35BeOmnDRcqM/FlcJGt8sEH/qgs88k/iXKsoq1Qj/QYgpNggVU9p48hBb4kaCAORts7mwM4V0yJ6JZaOfv9BMVJ1W/DG6+nyD9gZ/02Z6BfURyFObM5nWt0rrogys5YVnCKiSsmUPhhewlJ7U/5MxDzFiNojHMfEmutYd2W1EU/4ttxtJ6YCYQP2rMG5BWWXNTFVkFf2tqpSVzCz2DWTPAGmQinqqDu68kFthMQoU0yLwG31IeAcEqyCJS1fPKx3ap0VhRBbqOkD0RsyUAA+ngdbpANt8F9ZBOXSiK6ZC1KJf3uV8UBbmTRJQBsMU/kVB9KTLNoAKzpDXhf1J8NtXTaWbJdh403aNTcbAlPU6nTHRyHRiAfIWYQBFJhmclvojHmtBPWyQraoDPoitFsoA3m0t4u//Xa/+qgdmqoAuGzsY9Tdgebxq4Q0m+FDFkjsPAinUgTmB6jfvDmJlOa7y8wSqXh01XkJKI76Avio3H4BfSxygMDNT1CKulk/y4kra46L4Hq6drTVJLQcXsDlZ/l2AFk0HSIi3027Ud5QDIEroSjNzNxlpPtYsaFb/xHOOC4RXSTGakAYACSKR99FwskWgQJl8RzHmvOGl9fAUSwq3y5lfvoa6UWL99DEr6iMlqzAN1/0qPrdP7sAoXKtDBzWk2ht9ZVdqArDjzVpNHooZY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v2Jo7YzE1EMYCQmeeq52fhQzNjpgwk9IvgdGmskXhMbB/w59pgsotMbhNXOJ?=
 =?us-ascii?Q?HZ24uXZkZFeEHPcJukGvfLAxi/fRMzC4LHf+7DSPiJGK39CnY+EusshqngxU?=
 =?us-ascii?Q?YnOfowb8Y9kqdqFcD6DoHZn1EcD8tnkcZJVdVJPIfYv8445IxVrqR5hPUAdo?=
 =?us-ascii?Q?EtakDj7/yuyXPAZbkxAv11MQlcILy3HMqNKzznSdqYgNqlRoIKZtCKgt9RYv?=
 =?us-ascii?Q?Cuw3hG6aGCjOBgc/lhPyb1VTsY1twm22DYy56+6XxXUM+uAqavnuo+tD5Eyp?=
 =?us-ascii?Q?ylLIBCOIdPQQAh3xABlMBuLzUNoxePv+HmLn0DAW3+4corpb0KNV+WebJdoY?=
 =?us-ascii?Q?5syOrH1qP03FzQImulDWUv4triQn/8GkPtikN1j2uw3ta3/zShPmkKVy2yr0?=
 =?us-ascii?Q?wZ8NbpARf2mhc3mbJ7x1RAlvhqpaZJ7EpQ8/DsFLcFLZ7QnG6q2T/ExSYN9K?=
 =?us-ascii?Q?2qR/qRYlJ4iO9LRn/s6zvV1gNAYM/KRSW8Jk9jeZHamt0KXXfOnq1AS5xmHb?=
 =?us-ascii?Q?9rtEyLBn5YVUwnwvJ2uuuQDxip/nJxcIoHA22B/ycAciCxbyExCkZaAwqml0?=
 =?us-ascii?Q?Q1A8Uyh8CHgQxyACFTalt7IrlYBM1X+Mo86yiKmL7U1VoUd709rftu4/xl5H?=
 =?us-ascii?Q?nNkXnvX1LQoUJlfgXwqIy8FsZCHwi9zvik5g7+4Dm7Aa21bJ2FH8SM+PawSw?=
 =?us-ascii?Q?MQr43SqO/Z0ZAN6utPO0odinMI/wougpA9LE1lANSLixjdgBfY0x4fyD75d6?=
 =?us-ascii?Q?EpZ3fm/AJPiKE027ZXi1ye0c7dXpY3nyFYDQnzZuSlSI3VziK8i0kBV/SaqP?=
 =?us-ascii?Q?kFldzb7vwiiu3pns7/6x2ssvfJg6dM0qSMvZ4HxW6T0mgRwWryEFaxsRjpJb?=
 =?us-ascii?Q?wMMyI4g7aStq9x6F1ULZI9a8NQzvb+2wTp7HWdjNJE4uAqtxb+7XOaDAWRnq?=
 =?us-ascii?Q?vR8K8GUdQ0IOYiT+B11Y+KSpIKtzTERyIMigsTKrwB9WPRHn5dqNOou/nGHG?=
 =?us-ascii?Q?35W4BK9Toi+nMg5jevE5jMf+xdX+FBmA94YofwYxm83/Ks6IdRttXtE0F0Zc?=
 =?us-ascii?Q?D7q0sgaLODK5tIcKAOBRv9SLangccnSzklUFjfKJD+mqEN2to6GceS10lR/x?=
 =?us-ascii?Q?Y3TIfj+K0/Ot81cJB5VMxmBI5M2G9DHg107rDWiPrP7Q8XUabKa4OURd0mmZ?=
 =?us-ascii?Q?LkyoyFZEWUZcqngxNTXsp20Qn6RU//V6UhORfqcgF0GNKIlyJXgHKbGn/6tR?=
 =?us-ascii?Q?mfXnabbF9UVkQgc3uWA8VL36jWYy2iOiFpPjQ3w1pBnKUjqJjdoR5rWbFkvB?=
 =?us-ascii?Q?0zkN8lSLUxm2iMD7glDyeK8rbLVSW3mI5kHp5qGiqsR25BS7595m9ebourOJ?=
 =?us-ascii?Q?NRC94FKoYC18D1T21XVIF67P0emC4i/LPdhsSJpk6dn/MsFKTZvlwAeJRAtq?=
 =?us-ascii?Q?kLWVBye3PDF1LJvQS6KRr1Kv3+7GiHsk8fz+5ibTeeQpEOWz1INl/PpwEZZU?=
 =?us-ascii?Q?d0vm/bDZsVkA/1b6xbUipuN8MgxuJIo4BpwRjvF+Z/vwVfJUQv7AdGIykhrL?=
 =?us-ascii?Q?CiUDFOhMlW2CifX3jHxZqI1Q9dgEEeQbY9CY8THiUTte23midlK0KVrdzQIl?=
 =?us-ascii?Q?r3gSVs54YmWlF1UtPCa6NWgfu+1gbcn0HGcl6cvkhbwsZqIUgIvj2HAvtbOp?=
 =?us-ascii?Q?0z13SclsP2wRJwBAfC6kE9B34FJrPKXoj+cy8KF96Tw5dDr0Q8rKI58QCjx3?=
 =?us-ascii?Q?pXAOUp4i0w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26327762-0a12-4bf4-971f-08de79c5d2db
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:12:48.8649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0vhsK5fxF4GRbhcnMVTL2bEUCUO6ToFFuAWsgWzxvqSobuKYLu0KPqQpCB/c8H9b3VYAgc6/vJ5TATI+bWxkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6796

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

