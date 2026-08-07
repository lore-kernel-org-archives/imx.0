Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C28C3C1963
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 07:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786087599; cv=fail; b=U3zYCDWTQjotxZLNunXzy0IAbJc13+cq2lKOuhP5te77bKGBiT+kz/Bb0HImjKY3V1w8e2HvgqG7ySt+avOUqGhwg6g2+ycGMw3d9pXbJC/RKt+cDv6ma2vgyQbYoc2jpjLJjkIlRunhGdEW1rHWFdFcFLSgxJeaPfgwu9JtVy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786087599; c=relaxed/simple;
	bh=eC3o6jF4fO+JnyULlRbDE9o1Gdyw3c29NCltKGSmWB4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MWqxpsoSHR2GrE//5vm85jzGTHrk1EV+CQcifd2w45ztZSBbYuismXdmxd7KEbWYw3KVCYGQp6+ZtxmxhwiraZRFY5PxTLOgaD9/aj2ITIe+ck7T8COmUYnFBluSwTkXQ1SerC7Ja75J3v0gNtphaaJNJKgb6yEAk/RAdNipOpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Engbn8jF; arc=fail smtp.client-ip=52.101.66.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Engbn8jF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGyeX6n/8kLPQeFwhG54ksY2WXJMUjqBqJK3p81gFIWKp7dYwpnfFLquLhikgcYs3PWePJynxeezHzC6z2W9iVMlZiuR11uNXacFeDlFeUn8jIShS3mG8lfA/G7Vm8mNfrsSa081g0Egi5ZTEQlF9CbnWd4Yt3RG6RXnKvt7EQvAV5KDK8J39sW1dYsTfZEqIT+d8DTvk/G3KXYFcar3U/zZ90OXPpk93WxE7lQe8mTRyZhdXfQfoGRqh6KmSeerqglLdftBmdX5ZWgwGtQheBD9xGipHd2XxGdPx0koArgvjz6UI7NCHVgADH6zJG1L6CqfPcYUE/K6Ei6R2qHE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ms3GxSyskLvymzKfF0XWZz1nHPQ5Um/CRmXaFp4BDE=;
 b=TWYiWDa7MlDzE3aposYlR3P80q52o4uHEsFrcwSiKQUqVsumOqHFKMv/kY+OWkYCLWVthul4D9QidP4iy7+skOmIJUmckN1sknnUl1vqeD7yWw1YjYWN8QaZ8sK90yTpFknYR4ECccqntMFKH2OIEtK+zW0f3PS/vyEkPv4RVPaoO4Ca4Y/F3znmuv2KHd6DQ8agynPp9KlpsGgBFFp/IkBjkEwPsoLqrIWLwf9Po+P0nD0liJXM+h7X9wLv01T95CPfBdhDQWb6HqqsWiJobRnn8kvXlAVvBM9P1tXN7p9wYghGWinXNvN9JO0FJtwH1HEq6OTXwuaCyN07BsD/cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ms3GxSyskLvymzKfF0XWZz1nHPQ5Um/CRmXaFp4BDE=;
 b=Engbn8jFadbxjO9TylGwqt/6gyrueFBvduYAkO6ny7hdsRrHtONyfyESICjRRr3gZur6OryqYOkPLFYV559EM07nWCa9Zb4unFkAg6DBd+ifywHdFHfrAtpK3nU/C+kkyzufVST10/BGJtSDj1AUN80ZZqJecDmlVpVLhBUdAhiuXvRTKKAlmKjuuN7fMxn152q6XdmbFxfIB6ANyvFpxTqi8R05qSbPGRHKrrRjFvdgSZu/F56BrgTLUDd1THVZGLVcx8u1xbm4YjIy+ZvWnnypKBg/Xn+1uNvlYzir2ill5eqqxqz3eIDcUz+ium+QFBI2NkDghxY1aWXMWKz2Tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by DB9PR04MB9233.eurprd04.prod.outlook.com (2603:10a6:10:361::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 07:26:33 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%4]) with mapi id 15.21.0292.021; Fri, 7 Aug 2026
 07:26:33 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] irqchip/imx-irqsteer: Call chained_irq_exit() on the handler error path
Date: Fri,  7 Aug 2026 16:26:26 +0900
Message-Id: <20260807072626.1231517-1-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR03CA0008.apcprd03.prod.outlook.com
 (2603:1096:4:297::14) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|DB9PR04MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d2dbcff-8420-4bfd-7a75-08def4553521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|11063799006|56012099006|10067099003|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	e4dWCRAyhKsw9BHvzZilx5pgyiPdE/B9Wq81sgB86dBNxUjymcoHlM0izF4OD2GsjkTPFdg0cV43ty6J0mSiW1XSgMK9DeOxuGmTuz3VNqX1HuUtkxuudwDB9k1ToGYcZNxnp3zUs/ghjwHM8GGUn4+fksbfxBpdbW7ZsO/YsJq3iRSDpcZQTygX3jwlRXhOwBOH7KCLgmQdM9+Hmf9aXzwz9CP0VRU2n2RQw6NqZmnxHzO52bmY3ROzj0WBWwWQYduaYwDoNPwwmuYwPuf536XxAmjnBvQAtjS6ri9b+eIPaCHbXHZBX2GZp7w3sS1QnsgcfAyichfnuQSoPzmjkd1JcOtlpaw93N+698SOLkTnaR6qeoCeo6j1wImnFBa1ZilEYoT6YA+Toet+ihDpLD1q0vljDlh8Dq2os52TZo2Zt88SrXNSrwYM6uee29a58c4XESIqyQbYdbUkW4j2KVrzMS+i+wwfrx+/wi3Nf/dzSsyI57yc+poEIqa6vvFxx9Coj9Jy/wqTKTM18z6QNGqIUg/RUISiABPfVoV7bxGupj/YGfMXHpjKIBOrMkBB+A9Vrdl+wBcFHInXkwweZ4f09HIH7dtHLFG4JiwCKtZ3v0TaV+nX1U12wmfqR0yuuOl+V69XzLGtnUyUL4hoPSXW5U7hPUoOwtdpMwuIRFI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ryJo2+XgfQXNjrGiIBAv5d2efK2GLrlFEPnfktVN7Cj4I09VNKM1iAUioLb?=
 =?us-ascii?Q?+dVpRlBI8DXnamDlsYPuZDf/7sWYRs6V5KVeLj3tQtemhWLyilGIk5B2Xkyi?=
 =?us-ascii?Q?mnbw2lQL/kIzuEcCGUMnONxWW5w4wha/THrPZ9e4/bl+uJaPEyT5tDnv9EBD?=
 =?us-ascii?Q?dItuYin7P0/pJhqzlM/15NkiDmULfLQ8Ijo3KBdZDaEGAsDXX1LpA5amyJLy?=
 =?us-ascii?Q?PdukKTbiUYBrW6LxrjuXroc8opmqYxA9T9maQybcKu2YoMvY4eBNsd9tbxgD?=
 =?us-ascii?Q?H4lPBj2+58S6i6O0FhSWZfHFouA4A/1JY8iyWAf1/VmfKhGFGPlOWcwy+BhZ?=
 =?us-ascii?Q?RNhJlFEZf4Oy8uC+vb/JiKNHlRW8y1+hhOc7gpuu0DtPgsdC4bltbUmzxuN7?=
 =?us-ascii?Q?VjcyCKMBaY3jj164N3TiNxJ+YpuUf19Obl+1J+aq9nTpgfGMOgS+9/96WmE8?=
 =?us-ascii?Q?gH1z5OYul5QYLy5xOZeCrNjStFO+m8j/B9g33rGMcX8yT8gTvARaAmpWEsib?=
 =?us-ascii?Q?Dpdf/+5VPgi3O/DOeu+RqoK/49XsRdKoj2p1tzh4v04jtdh+lhyJeOedxaKn?=
 =?us-ascii?Q?dPDmZ4QU7E/HxLDYNW0boIX3dmPut02J+d4fjmEfU6TLxUo3WGQd/A4ocDYq?=
 =?us-ascii?Q?ywnnauNNaGtL9lAm2wf6PWyo9ImBLXK/U6SOL67sfWzQC2q5ARmQOrsOwe/2?=
 =?us-ascii?Q?wktXMNnROxe4cdIUqW5g4TcExBCyCh7hX8E4CUU2RDw4h2UNaMXNgGTlVK7f?=
 =?us-ascii?Q?Xjvmq8DJYMkGBJrudjJx3gXB5rGDIpd7N+n6S7ESffsPyld/p0RF9ABAy5/X?=
 =?us-ascii?Q?sMvb3zTfOw9yPQatbzEQZcQRZgHbwRbDqUaOEa239Sm8Yr4QI1HopA3pKhZ3?=
 =?us-ascii?Q?Q5tXMIMUayWw68ym+IvFPmIYQKm55ODs0viASE/vx7224ZnNWMCrwzwihKQ/?=
 =?us-ascii?Q?oa1ppxqRUZXPQvNnA4cb9uZxN+KHPsMFRpOLLbUUyKZPCVG/155d9zIzbtG8?=
 =?us-ascii?Q?4J1Pub81Q8Tk82zf2wYp3zvismNaAYoxkaKEniEuakRaWUJR++BgJgX8wYKi?=
 =?us-ascii?Q?3cMz+gZH0u5p7rAbAAkUD2ZKSsMV5j7j4ZJ5VVJemG91DiHI6BVBjZZkgDk4?=
 =?us-ascii?Q?Cu7v4KWLF2ScXoZ+bfLxZyoqtBiAIbrDOC+TDxDodlG5ood0kvr4ongdcToO?=
 =?us-ascii?Q?IXStnOv43pGsjkznf9/g9FX55KuattPukHn3qoppz60H36avDnUQJ8CIotKl?=
 =?us-ascii?Q?+GWimHzQAM4TyBThCVjigL1k7XDuGNdt8QHYB37oYyYV4upBRqiQTf2+AH/e?=
 =?us-ascii?Q?tX3MiqlH32yc/5oRxExUu4QjODIGKjsLIN01JdRlgToJowKxPa02v1RDIeFi?=
 =?us-ascii?Q?LZ0OUyVXXYUlENWX5W/AiFmfRYEYM7LKS6RKXHP6NzcinJcJycOCRutJvff6?=
 =?us-ascii?Q?aHATK3KhiD9AkRlWGPkiEKXkrQYn/Yu4tyIyD90fxUW5XlNb0IFcsfsHVkDu?=
 =?us-ascii?Q?qWFj5zNPXIVgSsCjYzea7c0VB2DCFCad9fmPD8qnGQcgsBMdS9OWLLDXbvhx?=
 =?us-ascii?Q?JSfCAe0Z0YlHBNISidz24G2sQzWLhfEhG5XVo4+VlM/kcWiYcMfUSKxODZxs?=
 =?us-ascii?Q?WYK85hjvNoE3jbN8ORu8EAJMzDlVfCw6wWt3Kw9D6hdixgCse/ABbI2wIIzM?=
 =?us-ascii?Q?QckACrVp/xqPZc21pcaYfoAc3VNdUq2iR0gKe2Ryw+crNW2Lfqblf3/G9Qkm?=
 =?us-ascii?Q?yBVnWR2nWeosnvBoeaMn+hiXBNuAR+LKq/C0U3Y0+c6KOuYjDw0n?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2dbcff-8420-4bfd-7a75-08def4553521
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:26:33.4907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrCiPpzoP+ZstLyo7qP9BF1ghuPtnipaKY1R0dmT0V/fwFw6HjInjzzkdvdnW47wBHQLoRUVaLkjyYJJS5/jswg/gyxNOsssb/BQ9eG/rgHCo7JjZTAA/6MtWIRR3WJO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9233

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

A chained handler must pair every chained_irq_enter() with a
chained_irq_exit() before returning, so that the parent interrupt's flow
control is completed (EOI for fasteoi parents, unmask for level-triggered
parents). Skipping it leaves the parent interrupt unacknowledged, blocking
further interrupts multiplexed through that line.

When imx_irqsteer_get_hwirq_base() fails, the handler returned early
without calling chained_irq_exit(). Route the error path through the
existing chained_irq_exit() so the parent interrupt is always completed
before returning.

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index a2f0629b22a3..d305312e9575 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -154,7 +154,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 	if (hwirq < 0) {
 		pr_warn("%s: unable to get hwirq base for irq %d\n",
 			__func__, irq);
-		return;
+		goto out;
 	}
 
 	for (i = 0; i < 2; i++, hwirq += 32) {
@@ -172,6 +172,7 @@ static void imx_irqsteer_irq_handler(struct irq_desc *desc)
 			generic_handle_domain_irq(data->domain, pos + hwirq);
 	}
 
+out:
 	chained_irq_exit(irq_desc_get_chip(desc), desc);
 }
 

base-commit: c0a27675eaf08255017b3cabc28c99c0cd71f468
prerequisite-patch-id: fe0cf9000b3f26c5115a2dd46fd2b762127b95a2
-- 
2.34.1

