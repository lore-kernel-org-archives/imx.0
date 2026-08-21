Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A7246AA89
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 10:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307119; cv=fail; b=nWO6FsDEypWREaaPCATHJQ2gWVp6koRUMbiKWZqALwIP0lC9cqUQWBASds1JWEbSRVz26dwCohsOsl64tWJ804XHvU9CeCz/CuzO6M88jHc6S27tEImo+EMyfhXIL1iPlj3ry7hlKNR8anIbciWsWpXfNMatBJ7ncDChQjrGNg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307119; c=relaxed/simple;
	bh=dcyfRRQ8/DUMzF5UmSQiadgjluPIEE4P2BWycw3IaeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tukk6/QfPhS0hd+ZkxYFm/GOHh6oNcUW/7BjOOS0+wwpET/ZuzVo/uf7pYyzxta2EnQur6QH9RcGfzc+8Fu6QakBYJF2Qu3142ofOjmhY1yI9r3Twxdd+IqOXUOUrkbvTD+HIBZ34HYkhfSqZxvVKjJxhQOKebGtNzwn9StX98Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MDMmbiYM; arc=fail smtp.client-ip=52.101.72.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MDMmbiYM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcPsyqObW0WjnBmdAXt3GLZqw17gTsXyRdRyPAk2F/0YrU42tiIStkX0zDfl60FaK7ypQZAhPY0jhCD0XABf//WXbjv7XCVBTWnjQJxfSDLPkutpW3PHtgDHSVN0RHY8x+L4HNasAlsNOO0GthN3mOzC9YUc3KdPnD9TpEt7sr+llwJy5w/65Uh++INV09bVog81q3nrZb0YUEJMZKFRAgkNEN4c6tyVtXdvOUqVyYOSG9If5W+slXAUr0Xf9+AoPxVgdnaqh40BGwWvMwZ3CTMzqKeEb5e0giRg9ZJylQ2wePJumi9HY5RwlZe+VTgADFcQJ/yTQr5KEhDDRQtUng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wP+S2/VmOIG7of3K6Kt5HH37/xZne32cAWBUYWwbW6E=;
 b=zBzZ651NE/6M1mcZ15vPwOsLGDQ28ZUU9piya+jtSM8V71IJrKUIP0/uOCfvWFuEzsVe/C+GgVCEtskSTQDmoBeqo/tGVbCS/EHmH0KUKhJ+YWP91NdKlBzv2OpdvhQK5mRe/3v+ShxLmQnysuxBniPpNLyEzEcbNj7QR+otcK3dZWOcBL+6KP486JBjdLRoQrJW6ai2+nv4VT68EZ0X8zB3N6gmaI9y80seFGFQMp8zQEohgXuem8PVLPZJl6zcNu7z1mW5OQ9JyM/n725IkBBiEE19a/r5xbEN8hSr0T81XTxXb+2ZCrojKoQMc0bc0P9PY8/k8O7pubnNbfdKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wP+S2/VmOIG7of3K6Kt5HH37/xZne32cAWBUYWwbW6E=;
 b=MDMmbiYMsQhCFaSQSfRoupzJP19SKx4koLNnQK7b4dIMLm+hvzI3Wh6B3ivfhh+vGQixHhkysq81NTEBj6ZYkiRmC1A7w7J6up2wy0QTLYNepDfGUYBh5BsRIfTP1vMkT94xaVXzPD+pYsurB+E2HnA2nuTDnqa0f6AH74hgg7oSe5dycc/HgPcatslRL8QmWEi6V+wtZkMe+uPlqXI7ASq2mdSMoBYErtEvzP1GQrhxZDEaDyKsznI7Bkd4bRlWdCat1yRFM66fMtcAUnNeeFKfskNde7TEFYX58V7bnvxS/kXRoisOpzruvH70o85VtyUMm0Pi0ozMQv0y2a8EXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by AM8PR04MB7971.eurprd04.prod.outlook.com (2603:10a6:20b:234::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 10:11:45 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 10:11:45 +0000
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
Subject: [PATCH v5 6/9] irqchip/imx-irqsteer: Let devres own the clock and runtime PM
Date: Fri, 21 Aug 2026 19:10:36 +0900
Message-Id: <20260821101039.4037925-7-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::18) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|AM8PR04MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: d4edfdd6-d540-445b-4ec5-08deff6c9a8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	jirTgnEYjXYP5eiy9t9OsFQ5e/l/FzB1yHLJmy1pn7c43tw165qHMGtdjACL6xJD4nEqxiPSfna5wnhlIA+aemcLTEJeBgOug9xYXbyx4ew96hCXxdFbm6NbQqxsQueNit5yuo5NOlham24pc+xq86UOs2NFwup37yU7lj1bkidfETVocgoTibjAEbYKiZLiPjPFLoS+zfABIhEL4oGgFAHNzqRbXsYcmtms7E6+HdWvSLFIikr7M0WYcWvMqxd4LMsfawCQmwa+RZupSlESMU2WFzv0aXpdaGH+fj7UZWyBPBFRKex/bpCaKRa9GihjzJfJ39b020rm6Njxe3ASggVBU15rOZCY6KzLg+4jAfPz5lWA6W7ErZ35VppXeMtkS3bfDBBSLqkGsUbxFI7Fk4mTjKOxe+4rpmjM55RGJRVuZJuBmvqS/QwH7zkS0agWwidsUuQ3jedhf+TiEPD068DHYTC57P2etmCpcrH76uqNjN4XFFlgKHH1YdBh4eSITBzGiC2OG3eCqcyiVulXD+CKoIIGQk1UkZcCgDJY8qv95S7Igw0ii894xL8jdGXogG6tEiFEkVVkldsJ7ggmi/vA32TI9X07WqNE1QpGPpRxPyhejVvKNeiPPpW6w74No5zvjG2HElDSNQbBxUwL6U6sY22fv3cIbBzvgYerCqI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?17CFUC3XypC5wd+nNZLAtQJYnXreXB0ObJEF9+Ejrcj+ZhO8aweDKsBjRZk2?=
 =?us-ascii?Q?IRMr+YEPWGKuYw0PDmKECTGi2BmcdQNCnuPXu53gS23hL3W4eJ8/1QfEaDIx?=
 =?us-ascii?Q?UzaJFk57WPsFq6ykXQlGkhMSpwY2mQbrhdNat35/e7lALLuFRBsnHi+0eDq0?=
 =?us-ascii?Q?VnQonACb+df8mje+jBsyHP4IOo1ZO2tB51TG3Blg21WTSPuRHRh3gNV2ZBpw?=
 =?us-ascii?Q?OQEYOyy7Ubo7HAmfOBb1R9hxwiODgIGJKzjhUOK7sEoJHGCFrhEUVrd//P05?=
 =?us-ascii?Q?doxjMW7Y4/J93rCfcf8qbinnpnUkmX8+PJDBijzAIAbzTfw6R7nNLz5PPuhL?=
 =?us-ascii?Q?zrae3MHYLBJ0wDIK3X2ovF88orqTlfpcyqlyabuVH09bmJueF39n1oOx1pLC?=
 =?us-ascii?Q?+A0o03v5j32/d5N8te80hfDLacT7EF05g1njuLXm3yJ9bIlwdYgUVwryINkf?=
 =?us-ascii?Q?/OTE/arR1RiCZNGM2ZmYKKAMRPxrAJCBH+hhUbwZyUTX8cJMFynfqb1Pes2j?=
 =?us-ascii?Q?kvtAwXa/KyYQ+TdNLFu86kw9MQ8jlFevhSVmU7budUGiCUZvA1TLM32zjY2y?=
 =?us-ascii?Q?od/LU+HzcsoHUjljewQxqC+C9WBJ53ZCMdZSk81lhi4/fiW4ZEah5ua/hOEu?=
 =?us-ascii?Q?Vnr/VPR7b3zTF6Nkoc6e8E/vsyovYjsNjkUFVZvSnmloyYqmq7cZkbN4xDf+?=
 =?us-ascii?Q?btXy/s+r05xrpSHq7zm+iHZT1HjsJzbGDGxRqbwSxBzncPI4AwRu5RsRzT66?=
 =?us-ascii?Q?eTUdgZ/wv5d6U6MSrKoxsAfYFG7i//Loi/YFaxJY+8cZQ+W+e1kYjNv4ij+B?=
 =?us-ascii?Q?M9ueUQ7B+e9IWp0nmJYQblFb3wDnwz23gFpXjhlAh40j2/fWAiel+qjivqJ0?=
 =?us-ascii?Q?MidPrUKW+ckQXc7YWdv8tq572kTDVS12dANnIr1wh9uZhVLiSMoD02hWKgqf?=
 =?us-ascii?Q?Tmdf0rOt4jOgFwYgbLGGqKGV2qRSJgaKDHuFu+ghNvhb1zXhj8Bo4PGBH26P?=
 =?us-ascii?Q?UY7mNvpNims22aMDAqn9aYAZP2RiDuUDtiOen5cuPG4+kzcaLP5qfdafIGha?=
 =?us-ascii?Q?pOsRMuXx/sZw2PtZPQiVsNOcwSUZGSD3cLfVOPS51EArAJVJOzVbJk2prue8?=
 =?us-ascii?Q?zqgL0J1xFcTJAKUEHpr6aextYzOdzvgDDIbyiuZR2AyMfhECpLFukZZT35cs?=
 =?us-ascii?Q?XH/28NdIP1tutjioNFkvAOrTGJkExWm66aYlFlrWlfUfDPBjBke1Nw3y1XQU?=
 =?us-ascii?Q?S5xkEvl8uNvumji3kuzO8eb8yownVvzvmlXQhscK31afxXBSMdYeQW/Xh/5h?=
 =?us-ascii?Q?3aNeOvV/OrjyA5/lLteXcF8V3Ji6aQ6RvDL8+UVhb8IyyvE8423i22BK3Gpz?=
 =?us-ascii?Q?Vf/5CIU546Cb1gG7CqV+BHXK6swLzdeTM+klGUx91v4bkjg8e9mhzt9NyWAD?=
 =?us-ascii?Q?5fCWXhh9cYq8IaiyPfp8ELmsYrCmqL68odLOirZjyeHAZ1Q9KV3Vf3/2gYW0?=
 =?us-ascii?Q?Xekkhl1JFMoZAmkuPH/96PPkSw0SroVuFmoFZBZ51RdHKvMB4iPyMWftZZQ8?=
 =?us-ascii?Q?08tu4bB8VPshd4sPGaJU2Ywjbzebd4XufLg69CwfnWGuL65AjtKI3cfgObSd?=
 =?us-ascii?Q?KwfOxA1td/6AHyj2OI/7DgFtGY67LDf2Bb66RyDU2waYuTV8dDWRJTb0njpC?=
 =?us-ascii?Q?gIYPNHk0/BQQKTTSEzQfvJATdvk6/AGyDBuAWtxJDE4MkSlL/vQlUQnLH3Cu?=
 =?us-ascii?Q?Aa7VsAOqYgJlcQIeYOszm2CaCinPrYA1l+MVmoqiZekaxity/p2o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4edfdd6-d540-445b-4ec5-08deff6c9a8e
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:11:45.0633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7C04S2DpAqkM3kdrgnBN1ixD9GB4JejT7I/4w/JVzh9R9pJ+jn3wwv+EzkzHfZ1EmLUlAt5UJ1W9IVVODE8gbbJmHXnxDcePuIjbvXZVWa+vRSi5/FmP1dbdHOH0jvL8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7971

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

In preparation for making the driver unbindable/reloadable, let the
driver core own the clock and runtime PM lifetime so that the probe()
error path and remove() do not have to hand-balance them:

 - acquire the clock with devm_clk_get_enabled() instead of a bare
   devm_clk_get() followed by a manual clk_prepare_enable(), so it is
   prepared/enabled for the device lifetime and released on unbind;
 - keep only clk_enable()/clk_disable() in the runtime PM callbacks,
   since prepare/unprepare is now handled once by devres;
 - enable runtime PM with devm_pm_runtime_set_active_enabled(), which
   marks the device active (matching the enabled clock) and disables
   runtime PM on unbind.

The device may be runtime-suspended at unbind time (autosuspend), in
which case the runtime suspend callback has already dropped the clock
enable count. The devres clk_disable_unprepare() that runs after
remove() would then underflow the enable count. Resume the device in
remove() so the clock is enabled when devres tears it down, keeping the
count balanced.

With the clock and runtime PM owned by devres, remove() and the probe()
error path only have to dispose of the parent IRQ mappings.

Suggested-by: Fabio Estevam <festevam@nabladev.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 37 +++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index b63bf957ab88..c2f58787f9a8 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -194,7 +194,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 		return PTR_ERR(data->regs);
 	}
 
-	data->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
+	data->ipg_clk = devm_clk_get_enabled(&pdev->dev, "ipg");
 	if (IS_ERR(data->ipg_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
 				     "failed to get ipg clk\n");
@@ -229,12 +229,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 			return -ENOMEM;
 	}
 
-	ret = clk_prepare_enable(data->ipg_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
-		return ret;
-	}
-
 	/* steer all IRQs into configured channel */
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
@@ -275,12 +269,21 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
+	if (ret)
+		goto err_irq;
 
 	return 0;
+
+err_irq:
+	for (i = 0; i < data->irq_count; i++) {
+		if (!data->irq[i])
+			break;
+
+		irq_set_chained_handler_and_data(data->irq[i], NULL, NULL);
+		irq_dispose_mapping(data->irq[i]);
+	}
 out:
-	clk_disable_unprepare(data->ipg_clk);
 	return ret;
 }
 
@@ -289,6 +292,14 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 	struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
 	int i;
 
+	/*
+	 * The device may be runtime-suspended here, in which case the
+	 * runtime suspend callback has already dropped the clock enable
+	 * count. Resume it so the devres clk_disable_unprepare(), which
+	 * runs after remove(), finds the clock enabled and stays balanced.
+	 */
+	pm_runtime_resume_and_get(&pdev->dev);
+
 	for (i = 0; i < irqsteer_data->irq_count; i++) {
 		if (!irqsteer_data->irq[i])
 			break;
@@ -297,8 +308,6 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 						 NULL, NULL);
 		irq_dispose_mapping(irqsteer_data->irq[i]);
 	}
-
-	clk_disable_unprepare(irqsteer_data->ipg_clk);
 }
 
 #ifdef CONFIG_PM
@@ -328,7 +337,7 @@ static int imx_irqsteer_suspend(struct device *dev)
 	struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
 
 	imx_irqsteer_save_regs(irqsteer_data);
-	clk_disable_unprepare(irqsteer_data->ipg_clk);
+	clk_disable(irqsteer_data->ipg_clk);
 
 	return 0;
 }
@@ -338,7 +347,7 @@ static int imx_irqsteer_resume(struct device *dev)
 	struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(irqsteer_data->ipg_clk);
+	ret = clk_enable(irqsteer_data->ipg_clk);
 	if (ret) {
 		dev_err(dev, "failed to enable ipg clk: %d\n", ret);
 		return ret;
-- 
2.34.1

