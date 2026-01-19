Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BFE33EAEB
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816583; cv=fail; b=u8jgFnWFEs8oer5YJy0L5HipGgIPBf5q95hYZWuxfthLWupDXXnl/qvBMGhuEBIHNsMeeZ6NzKSOll9MrHf+r0Fd5Xjq7GRUPe5OKNvvMHo8yqGVEYAZ2spz28okwxJBFzD/0iAtZzg/7+EgPIsnxjMmhp/64b32XpXnqgSJyA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816583; c=relaxed/simple;
	bh=4wCmkPI+79qU6MiUK0E47B/s7D3AUnXb1qv7EvXa3Y4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kVpsiI/mEpwug0ntSK0D7KGd2u5VW2sL11xHpvmmZHQKkansUK1RTK2F4JfaxaeAAm5YyMUF/gz8BZpPNeh4+FrrHNyuJl5szjTdAfJhtaKLAEd8+nIyhT5dN8L5SD/hZfBFtSnNnSeE0JIv+dCUckNa1Zarf4ZwBaBXlIOZFTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=URuua+Ok; arc=fail smtp.client-ip=52.101.69.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="URuua+Ok"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDvzj6gqqy+jIaQWNJ9X6xOzm2jaZnbUvzcAqjprHg5tpsto4oH8NOZM9fr5FkqLE5So8xOiSV4Rv54yyORj9d5hHmvsENHGAicqLQSVg6C4inLwxFMnzMIHZi6WdSgRYkge2SHTGyTqqzYAa1yW0RvZWxiQpYsC6qlx42rfj35s/mYjt7LEVH7+7m/W4Pw2MHlkKgyKJgSQGaYm2Wp7RKt1JSM770ymyu0cBpXX150VpivDAMdiFV2GzCoPoDzRTeYtuX/iWfdCpK13wNpzY8mf09cE4S6vZKRdtByJ29RYf73gdgfBV3Kg0CbNImK5cMRF8sbSbWTZWviM+Z/WSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2O+P8u+y+hld455WuSwVBh4puHP4gZcReSfR3clV7A=;
 b=pKN8bppN+5oVydDPLEXV7xEpcuSKfX0h/p6PAs32PHZyrvgU6h9UuRu5q9IEYZuyg+cDnu3LrA0O3egF6uSlpSmxv2DDgUPxyBtosDIe9FuaEnk/tAbdScS9i4sZG787xPcYZ04YjEDfQUgRChvvhTD8gryfO0Hp9y0/EeUuEMiYk+1hQDOZmTBMAX0HzcXIOZXtrt6SXPsdctVYfWgSsRvI7g2C2d9IzwbzHY2YLLA3Hc6WBYxeJRH4s+ycyJHIRuSm4iA2fRfKZeQKAMjYeTKOF50WzrOxuIKrf4lS/6RurWypebGSJo3WPlHt9Z0DFgxfNGhQiwT1QSArduHzJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2O+P8u+y+hld455WuSwVBh4puHP4gZcReSfR3clV7A=;
 b=URuua+OkZUPUNDqR4GUhIz7rJiV3TWq5C39gVGk4JvAReurEW5jv1cSDbaoZPmlSYWJ8m+1lawtef6wE01Nj9n38B1GyBuQQ9RQpwjakQspIGqIELJBUJei71eCvo/KxKqVp9yq65747C5nlPkDpmo59osYtfE+VFm6M2Xi/oMY1l2SfWgm+lSmdj36Bdk6YyVQM/htu9Ua3LOyTpSLxx2k7+tke/cEBXrYrdR7T5p3l+nE8iRMUg9WqZoGF1xXNx4rIintAjCw2m23ThFvb+QwWiUYBNV3Mb0zfG6dWiHMI+4xOzwGTF1UDHzch+XHV3OHis4Y8XTLcWCD4Y45tFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by GVXPR04MB10899.eurprd04.prod.outlook.com (2603:10a6:150:225::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 09:56:16 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 09:56:16 +0000
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
Subject: [PATCH v2 3/4] clocksource/drivers/timer-mediatek: Make timer-mediatek become loadable module
Date: Mon, 19 Jan 2026 18:55:10 +0900
Message-Id: <20260119095511.3030739-4-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com>
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0241.apcprd06.prod.outlook.com
 (2603:1096:4:ac::25) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|GVXPR04MB10899:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ad5bc2-3c6b-4fd4-dfac-08de5740fc71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rovE1YSwxJ/buEusXY8wfgqNPW0k/k8BulbNFKP1QxvMekce5e471lrn4AWS?=
 =?us-ascii?Q?/UKxw2Ocol6GfJV/XSd+XmQVuKM5PefdfDFXCqYyoOX9iJPaUKKaAwQkaDUl?=
 =?us-ascii?Q?TfO2VkKLSwV2ZfKkukJ73kHinE2DOrDp+nkR1xvmlRb4sXsSiZcmsmUlxjzg?=
 =?us-ascii?Q?Wwt8m8CKno4FvKhe137w6oXAyhtQDj2dl6BbIaW6ZWfaQe8WvxUUlmyRbOy6?=
 =?us-ascii?Q?3OSUMOMGyQjKHUWSJs5ogHPxCzIXoWOYxrb4hBdB4PzcrYurbZwZKlmaXG1z?=
 =?us-ascii?Q?6fgirqgJXnUJ5OXxkeT39aA2PJMcYCSiekksjzo7cMFywxz9PQft2VHKIrih?=
 =?us-ascii?Q?ujQppF0WnPaJYeLqYS68wrhm2Q47oQKtP2Nab1+OGo/FFfKReNyXsQzH2AFT?=
 =?us-ascii?Q?nExNrtU1LSho9ZBV29hr+KNNT4cpejaOAcIcTNfRcgOcTUMxqQKPFvryld7R?=
 =?us-ascii?Q?EV+zG1YTZnD3rUFv6jhKvh1obG5ifdDM1C1Ko/JzmfJ6cWNCWJYJqNEimRfs?=
 =?us-ascii?Q?Ysm7Ce7B56L74Q278/MgFG778zKieEvUAowtFK7KXprHoCzQXtrStK9T23Xn?=
 =?us-ascii?Q?YfNmNLrajxnZLIzZ0oJ3aNKDzaYpNVhj4fAnjbP4fQs3PNrVXDfS7hu+e40Y?=
 =?us-ascii?Q?98EboTOxtfc3FiLWQJ/MSQqXTmkmOwj9ZWvHjb1hXPef5dC+JJdw5rAHVB2h?=
 =?us-ascii?Q?Cn2cHf17wacc1B02gZ7lkdeMvlZpNKzkDuXdyoIjmGbEQjoyVr9IqdT1Nvgv?=
 =?us-ascii?Q?G0AFfv9NcWJZNFMJgIjT9OxUuQEjYx2390umNH5aylBrOe5vczXFaeocYwm0?=
 =?us-ascii?Q?OwmKaALAd4ikHRTE9DXcMllariDF9AaNQgeWQnInvYHH3UEMcJQOhpzx2sD+?=
 =?us-ascii?Q?W7Y5Ctgv3fT/kY3ip5nnt3muO1GfP9lr+zMZpJboDMAss0Q5gsumq5snnd19?=
 =?us-ascii?Q?i9zvgLt0zvqXFLu2E/RVd+GpkYnDwFFktl/TOLoHatk+Y2eEIdO21/G5eR4w?=
 =?us-ascii?Q?Yr5vjVR6CKNhyxjvInkbSKBe767tGWwWLELP1+Hl4y3iixCI1KR6xmHSS4if?=
 =?us-ascii?Q?bCKASg2/akOvFZ3gp7IwiuEr8174c3x7nayGWw9Ayk4NAQbR6Tby0m3Vsh/n?=
 =?us-ascii?Q?6om261n1oqdUXruoCu700VGPjALnB1IrJFyhaWYa97nXzucyCXxn12MLx9YZ?=
 =?us-ascii?Q?ASpf5f8qVg/gywhu2/+Eku1DHoMJ2F+zVlOgP6nny6/ORknb4rCd7k+kJ+oq?=
 =?us-ascii?Q?Ot/4rz1sG+RfUjmp3HQGyk13B4SDyo9lbb/13EaTLDDbMZHG9I82udDb9yqG?=
 =?us-ascii?Q?EfkQzQ4cJckHXLuY+s4KvZpixDS78+e/OGXoiUv8hiK/pO3nGnNsvNx6qDBy?=
 =?us-ascii?Q?4qNpJED4mc9Aoy1fYKSDEs7D8oOUZy7xZ5nIxluFc3K8nN7n7QNZTX3w7LNN?=
 =?us-ascii?Q?aNFCg2p3yqFKas6f9YZ/ZshC5VYN/Olx6gVR9RsAW66XEUl4C/HSbusEB4ed?=
 =?us-ascii?Q?ohyQAyU3ATnmfU+dm4h7zQO7rQs1LK465JCNfQdm6/uo1ZtDXGHSGxKTlAPB?=
 =?us-ascii?Q?F1Fj5wKAVeqGEutZjytiOb0PGLVOg7c+ho9vGAyTIArJMyg2JBBGxzv30AFC?=
 =?us-ascii?Q?sCev7/H93d0cX57S2oBG0AU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IBLyrqZmcVn/EM0jMTV6nkNLn9XFZRtuUyIbjjEgM2VWchAK8cSx5FB+rnO4?=
 =?us-ascii?Q?IxHv+hR2ULra7cDMG/dDrYc7MzQwBsN0cwTL55xJSxjE3XYuZfmSGHtz8lNG?=
 =?us-ascii?Q?LkHNCZi7dBf/ekOC6/9Yub33R3T2kdv8INHOWsu1kOoqZQJxJyJIpkpuoZ0K?=
 =?us-ascii?Q?5H+gUm5jnuLMAf8IRGOQ/kNOeKUi19dt0V3yz9kyqokvc8k2o8sCNus4c1jO?=
 =?us-ascii?Q?RjkxYovN14mRiQ0WW9oKGw1jfM4V3WKxiYdg0ht3oLHhnRQFBWyIXqQWxIKM?=
 =?us-ascii?Q?+Z0Q/bKeCySJghm6d3WH9+7onJG1cX6svvz6h63KM+yY53BXIVrxD3YtXqSk?=
 =?us-ascii?Q?vgNxHWqWY3feS2WZzkb/PuWnBhIJ96t08YGbR4XoRh6PardU3S4veLZBejp0?=
 =?us-ascii?Q?1liuhoyx+NuvCCTqH77MYof1ZyymOjyXBEHUrNAdc555fDh0On0OXXsDWK7e?=
 =?us-ascii?Q?fUSqmjDzzvAuqbghOHZo9Ui6pF7EaQIUh4xiwZM2HwCJKvBebiFn8U97ypl2?=
 =?us-ascii?Q?CB9W/xGohk4qX6QusHrnYdNU6+7vOfVZm0n79CIM12WZQl8Ht6Jr9Byvd+ta?=
 =?us-ascii?Q?NIqK+qXmws7lnMLCMWkOr6OMuvEShVLb/dVWfU4xCaGSfqmYVkgwvvgC0HpE?=
 =?us-ascii?Q?r/vLab8lZ59d/b0VaTFIkrD+iMn/MJGX5k3xsJaGizRCsQIt0ddHi45CEgIt?=
 =?us-ascii?Q?LtRksTRlQG8p5segPxaC6iEVwIm5tsWYXkG4RmRQWaMIFH7WwvKmrR7ani6a?=
 =?us-ascii?Q?Vr22M7OqPAS6VfpuuaGSi/pmMPUyQ+mKihuB5qwpAKu/BKevg1yVV+qpUCEG?=
 =?us-ascii?Q?a3s2o6vP13FR/6mN7Z1AYI+I7IhkCQZvnggt/Hu2/VXMPkBldQOHB7je8Gvg?=
 =?us-ascii?Q?xuVTBaEOd1QWtLFOZq0KVyG32yksQQpsvmRF9yaexIrHNW3cDTnPEkFVqTm3?=
 =?us-ascii?Q?KUA66fU95uUVFVfPik0tWJURWbhn9NsIbACCokkrz2T+dzJC4VMKswcuyyxG?=
 =?us-ascii?Q?4ULrA4nEenfgLZ7aqpao9Llp2T0kxXi0p8TJX/XFLwyqTff6yYDxnDquLRQA?=
 =?us-ascii?Q?qtP2/a5pecCv+u2gBOMhDa6dD9H+lh8SuIMw9O9XxFjG1EFC6IxQvZ+BJS+o?=
 =?us-ascii?Q?gR8Y8GQ9HQj9nC3O2l8xT1fIR0f7Fpsgh5khOPBxQKjZglgTwouLrFwqpcUj?=
 =?us-ascii?Q?3kyyjIVw6IUu5X56uqaZxUzRtqofISLaOqfXUG27XudAOgz7gv1gygoZrlVQ?=
 =?us-ascii?Q?1rwM31omjKbEP21Of3IIL+rv4zEoIt/3sCOq2yYCrS9wUwPd7UkcL0SS8kZU?=
 =?us-ascii?Q?vgyiHF8okc8a/DwUHYCjX4CrjIqGhZn1CXxyIgsIxjCkvjlxsYsxH/OgoH2s?=
 =?us-ascii?Q?l32bn/RrI5K+NJ19KmE5hOyW8kJ/3SvJZMPvNik4/6ySw1e+mmVSl1AMfSoF?=
 =?us-ascii?Q?A/+EOhFRPiRKId3JQU3YnX26RJ5Kj0qNHs2frqo6aFqovGWiw0ADMMXDgYRM?=
 =?us-ascii?Q?1M2fzFdmCYUwPHeH5Y0tbtTvSmf3zP5cQjTugsF/8ckYw+iEnOc4p4xVDF6X?=
 =?us-ascii?Q?i//ysDci0M/5VU3+nww1Db4L2vdsq/pVc6NwK/j4XCnkUxMan29F2svLIFXH?=
 =?us-ascii?Q?RotRxbQ3b1bMFQvQ17uXs1+/1PRuRXOl7tPUgXoSuFOPDcYWnUgEVLG5TCxV?=
 =?us-ascii?Q?z4QFCZ/ATCoJLLYOJrk+70wKWjGi+VplKh8PBmDIv8IWP/Zw27W7/jfrHhCb?=
 =?us-ascii?Q?HHLtp8VJww=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ad5bc2-3c6b-4fd4-dfac-08de5740fc71
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:56:15.9730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RadzX6NYkL7bw2dzi5qpRBjdRi0D2ILs5teryshPG/jmbANHQA1r7Dd/PsTza5I/vXDNREjBsY6xKxPR/IX1zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10899

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

Make the timer-mediatek driver which can register
an always-on timer as tick_broadcast_device on
MediaTek SoCs become loadable module in GKI.

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
index aa59e5b13351..7d0d55c91c3f 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -487,7 +487,7 @@ config SYS_SUPPORTS_SH_CMT
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

