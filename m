Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22F3B8BC7
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 10:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307093; cv=fail; b=EhEzSmkqqa4+JqJ8mAZhDqYs1R8RcEEtAb/FSVBFIlkNC2d9bCAdKURt4uN/F+f2zG0GQBlHpB0fM7btOyvrmeW/dRr4PWZmX0YxLm/8afRmjZdYaoZeB6mfgJkcxgw5L1wKdaoBU2h684Lw5kJcl1J1PrYzc14yfdK/iyjSDJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307093; c=relaxed/simple;
	bh=6eaeZgypDrKCbY/ztK3t89eeuvZ4Fhc1V2mO9VE7/NY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a07tEWIVX13JsZwzo3CB0zxeTrjus62XYTE9Ebt6gnlhaKBkTvc08T39TSxtJBU9rB28Hqr4iXx7MjoE9RYBT5hQaF4BvUBKQZfbDdcQgU0NV5r5Ue4pZ+YXpb3HcqCNI+CWdOXabZ3kK0kKYbq7cFwSS5grsq9ikUNWzr/xg7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pRLi0LUX; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pRLi0LUX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFAC5Kd+Jtz1r+gTgB2HKxhSe+wDzVHhHre/UgA31g8pLjlmTFaXiqjIqhM4foEYMxjldMiCR85bUwl5atQv56P0yrQK+WtzCuaEl7I383qdtj5lHw9FqEn6hdzbOdWX7IB3tBYcGxv4KjxbhIUfX+oHgDn3F+BPsjk6+SR6Uxnczf4H24R4hvsx9TBIdjR5wzdK+HDvta0j91UQCnOzxVNotpD61dA0V4hq0q5dlKQVuukIv09AMLYR8ioqn+O/F2aBgFVeC9IDcNnXbJHiZvLLOYUX1Y0TmXZjMhfWaYs8k92FngwdRVucikLxoQkprqKRp1SjBrV9ZxLbSfLJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJUN6o3vfqrejvO+8jpeRFmyv6jTK1auxRwHkzqCiiU=;
 b=m5O1buH7HAk9ORBvB1HhwMR7uV7biLFph/ZcuL88MGwasJ1fDpws8fIyMIwaj5VmpB7EeQz/6GcubZduDhmMX7otGp0L49odd0jE5Ssuvr5lg8950txoB6QfERLDpJjpV/o7lvunHaQnmM1SA2EYfnNiXNqoJ5Q9jKmnBMv9kDrZl3KMsebX+kRaw7Hs2qzeZIQc8sLJ/W52tKOoDlxWqUAGgvUw1pz+OIYCN81qHx0cM8R6wAC15rMHJSFE8M+pxbpYCC32w/8kuf8TawxtbKPfT2Y9p6mRoECR/yts+5Zh2n0ShNSZakqhla4HW1XPhZM4pdjZcenLjOZCM3Xp5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJUN6o3vfqrejvO+8jpeRFmyv6jTK1auxRwHkzqCiiU=;
 b=pRLi0LUXVZZHSgV3NdpXDkucaAvQmXjFu+pN8hYE9OUeWBME4lX1FhFMeFm9MTC4q6QnOsbi5jOSUDGF5fjS/1LfLqRBg5/AYp4g1oWvRNOMoquzSMvadR7ea08rouEjbpV8gEQposLF2pxJFIIJnOHqUao7IwMznOXXjTVBa+0P0D3BSiV09DTbvuQllBdc9E5PCqnlQriL8oAMQVx/1SumtX8iDXM3RF958yRe3WutYg+plNuxO+mhpVxOpaSveYgplOh+WQQ9UmimPaIo7L/mMFHx+ne0MWcXt59YFfB9QjdJ7SuxB55bEpKqxG+CU5+Mk4h/WT65JnxozuVokQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 10:11:24 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:11:24 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/9] irqchip/imx-irqsteer: Validate IRQ count before creating domain
Date: Fri, 21 Aug 2026 19:10:33 +0900
Message-Id: <20260821101039.4037925-4-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c1dd893-e98e-4f8d-932b-08deff6c8e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	xu5hWHwRXmRl8juPYlbCC+vzBawZe9Wj7en4rHSxcX2tYXPeTzIm2RWAET2rZVfR4UaaK4n6w+YctzYrkMyBQ3ZiOyYIZSCL2BJH+Q4JrbzoRhPVxaeb6xJpAIIJ6ArUiXm2rwWonbNyE02QfA4dcI0/BUORqHDEl4rkNsXey9oWgOSRb5X9u9RJY++0xxu2THVNKJYN7LgVP7ocz3XojG9y6A9yqTILTF7AA2G0kz4NzSqab44bWcT7sxfkumpr2t/2YxdjkONxDB9mdCFk1zOXmBoxx/ZV72deyh1HUc1k3ZLIOI5Hy2Q6YkUTzZ3ZAFCT8ZEC/maSPLgxsQ6Y9ExyS41I7zr1uUgXLxWBpsI/1LVGbGZfQkgMbdCreZLOKWm4/fKMB0Tqxyx5iIiLb5prv8/8Wuq/Qx0CU4AL5nfU7sD9teeYQSN18xYGlDUzLamlxLMHTcd8N60j0/nfmAGzB0RG7jt+FgILoVkS3wUoE1jJKJJHD3XkESSape97bh2NUhPyVD7WSJBSDe6E0yp1JTUlmI3v4v5asDhF3mdUfBGfQfbrWjSbfXM6Hs9hHXj+LYxcuWTX4TG0NL7HDcUs0Y8kp7UhL9AfYZxsaRdO+U12YaD6XgW2abI4pgcbyD6DRQyjuxmnKBM73OEwS9qrGpBrH++b7upR8e5Cx4I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tq9xd/sXY4XW2ildUx7vaR86eyvszz6d+yX8urPYJVgGaGqjH8Xk5uPqheVY?=
 =?us-ascii?Q?Ea19HfKpGGIZWYT0gmbEJ8o3y0EuTOjd2npWDAnVCw7Tr1X7HZ+Q6t6pmRrT?=
 =?us-ascii?Q?AXB8EcvZjUXVUBOmqWwS8omvDLbLyIjb1Awbomf+VgJJ3ajmIemy+8zYfaKN?=
 =?us-ascii?Q?A3T03CF5C+IO+wzK5Il8nyI1+0A+5Utr0sl6fxO2jqbtnGfj8YJ/ky/L/gFe?=
 =?us-ascii?Q?ZUsAawkiIpm4Z7hkAKnej1PNyD8zDW7KBYpEpTCGNGPpv5WSUevYEh2uLemD?=
 =?us-ascii?Q?v59D40K/Dh4eF4K5NiAi4C11cLsvkqu/zisX/zWUMMUi7LQQMvlEtMefH0hs?=
 =?us-ascii?Q?vRp7iZeKyGmiRL1TUO/3/vlR6dOb3dfdGMSs08a99hn97OCx6eK4XzOxwcQB?=
 =?us-ascii?Q?49kOZvSpGSFqZo1DnA+7zFElsM6jmA232cM/+1mrzjQaPNFKIiqWtdGQoFvp?=
 =?us-ascii?Q?mj9nPkW14qZd0z6ODuQVZOVeRTWzyj0bj0kZmWYYV8KUOKhb8pP9hPTl95lh?=
 =?us-ascii?Q?QSES1hwEuGuKYWDs4ZECVLPsBLYsmD8g9NjKc1bLLQOrbJQ6+gfIaLcRuxoA?=
 =?us-ascii?Q?glQl7PW6xdQaMPYljnSuH53RoIeSwdqq78nUwgMLLHU81Z53sTgi9mSx1+cc?=
 =?us-ascii?Q?E2+/uquXF5QmJV7qmIKtsF4+jejArSNhWxN12PvX+uyJw4e9OYbs1sb0ielx?=
 =?us-ascii?Q?RrpmKHISzQWQQZZkkGtSH8qQ4ftO6qbYiAMtJle/4w0RddgTkQok3ATMbpPF?=
 =?us-ascii?Q?rUVZM8vIZwQdbNaPbSP95X6IS6I0W3hgmTO9ZEuLyiWRY8U9ESwBRqEtV1+z?=
 =?us-ascii?Q?ofa03pKwFaCIHSGy21UuMem0a4wC2l68jjjCnuhOZL2g702nUmewrcz2vm2R?=
 =?us-ascii?Q?rMdLQQeVPLEJo5NKDZBNvLYnjLhpp9VbV+dbmhVxP+G7BJ6Nm9W186HUgZK9?=
 =?us-ascii?Q?iZ7zmFTxQUtdg/ASQMSIBh1CcO+735jl/FZzjVkib1aHtMNkK07wxAPpgbd/?=
 =?us-ascii?Q?43w99mTQBO9rCic561TQdqNQq5IXYvUf3oWhHHbMMn4ROhmFNGzBT8TiLEnc?=
 =?us-ascii?Q?gJQVlVRhkvMR1jbLWOk89GC4augmmK7m0oIriCM9roSIs3UK3ciDm3pJL/ui?=
 =?us-ascii?Q?SdhmbPxS9HYjjvYSWn0sF7TsF54mvwZ3Fc0HoQVNg0HkvHFZzWLxoWhoLJNp?=
 =?us-ascii?Q?Bsjk5hxJSNfR0HXOqXjSI57mVyxdd54+A6/D4Ehz3XLu1QrDCxGNMX1CEY2h?=
 =?us-ascii?Q?4U90i9fJAw/sJa2ZEU9jebxenXn0JlfAr/9VHipjwCPJtA0YpD47VGlOip/l?=
 =?us-ascii?Q?oI74sYKycogyUl53JNw4LP5Z4gahODkREBXf3gDgxRrEzhb6X/4eaPv/Sqn8?=
 =?us-ascii?Q?FQpya7l1dmr3g3KsHkjEW+26IkVwtBq8PP/eYL+XoWz8asb5rKwGsXrPGVZK?=
 =?us-ascii?Q?rgeLY6VAUZ9jaECjp6M32R1Qkjkai1OuypY8EIuadN+f/9vcH4dPjhOrnuNq?=
 =?us-ascii?Q?m8PkWvgUHRl8Bn/Ce4xf0LGIwsucdMLjPqzmKD/g06axZMAJsNqHtJAR55Iq?=
 =?us-ascii?Q?4y/7uiVZDicoP1IFvP+7IUGU8QLftfEey7fl/mvoxJQGX1M0FRpLutpK5fxG?=
 =?us-ascii?Q?l3jZFKPo057NU/vDCkXvE4P3AS+yyaEWOlsIVy/TG+myZ3woruOnIJqAKwgM?=
 =?us-ascii?Q?kKih98uiz6+m5YcI9ADDGzlgwdbQYk1Qda4SF1/Bq6zhGDLjaHZLab1RO/8z?=
 =?us-ascii?Q?hww3WGPcY4n/O/Es4H1Rs2OgEGIBhovatRJ9zbovSvUKpJ4HBAv/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c1dd893-e98e-4f8d-932b-08deff6c8e52
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:11:24.3980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHMsnbdtOinQcINuSbUUwZ2CE+uF9wQn+f9Arr4iPiwg3Agnx168cXhe/rYQEGuZo+V4TWYpXdikedyxVjE1DFWdZV6YXa1CQT/CITv0OxX9zpyfkHQyDBTwM6/uFuud
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

From: Fabio Estevam <festevam@nabladev.com>

The IRQ count is validated after creating the IRQ domain. If it is
invalid, probe returns without removing the domain, leaving its host
data pointing at devm-managed memory that is freed on probe failure.

Validate the count before allocating resources to avoid the leak and
dangling pointer.

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index c1df84551efa..571324de8bd1 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -218,6 +218,8 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	 */
 	data->irq_count = DIV_ROUND_UP(irqs_num, 64);
 	data->reg_num = irqs_num / 32;
+	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT)
+		return -EINVAL;
 
 	if (IS_ENABLED(CONFIG_PM)) {
 		data->saved_reg = devm_kzalloc(&pdev->dev,
@@ -253,11 +255,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	}
 	irq_domain_set_pm_device(data->domain, &pdev->dev);
 
-	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
-		ret = -EINVAL;
-		goto out;
-	}
-
 	for (i = 0; i < data->irq_count; i++) {
 		data->irq[i] = irq_of_parse_and_map(np, i);
 		if (!data->irq[i])
-- 
2.34.1

