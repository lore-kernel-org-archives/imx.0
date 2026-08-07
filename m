Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3803C3434
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786087500; cv=fail; b=eDSPXKrL7x52X0sVDfdmx2wnKDTZZxYqNMkUyDss/LHXIigtYKYIP93lf75rE+A2gD82Jcz9G75o44ggeqUnAm43HxsdorsJseTJyZoc0wxO5ieOVKXzKTKahmuiCNyf3zFCEbV3Tk1Q5fGRQZlOReALQwY0wCRVroaTPg9bqUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786087500; c=relaxed/simple;
	bh=5ZXNYbkgM9tJOJTkRE1GvBXclXQMIYQQxITjmYwWFms=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ej11WK331E16dONeYy8D9N7e6vlqGQANvJxlAA54SWhmopORANO2tHidRTP2vf22lzw7mEWwZqCUyyXr8XAEExFRPBp2BAv4IxSU7+08BNoCViGcSYjkXClXxofJZGly7SsbsJgYhwiabVL5jqEX0oR4HK9EyFPe+blSCcJz3y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vvz0rZlE; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vvz0rZlE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ov886/CHk9k0/QTKt7to4pnKwvmFMHN/cgMb55wD1ePHnj0auxGvxSp1r+6+/HFV+fb9KQo4rhXfBHuQ6Ifte29Hdzi9qRwMKqj62zclbuk+Zdv+ajLabwz/bp0Jq2tU0Ovmkyl/Ubq3XSwAtETxftotsdoBFyYEWkhV9uHV/kmDk7YUbE5RYGQGOO4NA8xZki6I0hgiYnA3/hRV6r9CH0bBtsFbYCFTZTuoAC+RxRlfGv01h1oQhdyT6CO+xqbb5JgMNqiMOSAvExlj7M479cbXRyTKbSMaskzPu7cCt0nQtcgWwxCC4s6j2vaDFa/0bgSyQqftG0rKf+DLbtJOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0SRXHMAqE+PYATKunHCXjPTtvCifr4YjxrbQ1ZX6fQ=;
 b=c1w46LP4+18TwiL3yx6nEZJNzgaPSCGLYE5zKTSISsXz9pbnoqNOfN8F++4BoSBj+uRMHktW8/dhU8akc1LfputD9NJOPngJ+1hNS9lC1y9qqKw1AQA6M0bWdQh3sRbtC9Eq4fz3kZhphcawex3DaFLCMzBgBAF3ngjPAVuR3zMNwtivi+pgY9IWX1wLQlcDT+OmM8G3PDMLXCAuR28Hu69+wfcp/KdLh6yiW3Bb2lrEUZVUmgI9VQP7r4dZyVgXIaU31HRMq7g24QLDwi/CpzjNXfsoqgNrznPNc2lJUHkM3RK1AVk5JmtlMHEergPdM+zbRHiReQTVgmi7VbBHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0SRXHMAqE+PYATKunHCXjPTtvCifr4YjxrbQ1ZX6fQ=;
 b=vvz0rZlEH4EU0EsR9+QFYvKWma0QpG7hj2P0hGxNtk+hPb7Ozw6l5mRxP3PD1fJ3GQbAQDSqnDl/iqA8ZyhwfCKFNOTqS4pVXdh2mYUDBtfxn95fpX3eKsnZRgQuUFeriet7DYkR6lf2VmNF40Iz7abXo/vKkedQheqcx8sN7H3V0+aZAKerJnB2gML8n3NiDmEjnRXiKZbysDOfKTpd9a6ohPCWRphgzPIOBGeFAYcWWuSfs35Uwtfm1e3Kfobzw2XQdpk+8ShkNAV9hbPhVXKND2+rQRpoJHTryEmLhFtQ59N06gRP9XG/OdkKydZdvVAYVeEeq5Yeynfb0US4bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9)
 by DB9PR04MB9233.eurprd04.prod.outlook.com (2603:10a6:10:361::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Fri, 7 Aug
 2026 07:24:49 +0000
Received: from DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5]) by DB8PR04MB6858.eurprd04.prod.outlook.com
 ([fe80::bc6f:5fd7:462:d0b5%4]) with mapi id 15.21.0292.021; Fri, 7 Aug 2026
 07:24:49 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] irqchip/imx-irqsteer: Allow building as module
Date: Fri,  7 Aug 2026 16:23:46 +0900
Message-Id: <20260807072346.1222389-5-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
References: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::7) To DB8PR04MB6858.eurprd04.prod.outlook.com
 (2603:10a6:10:113::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6858:EE_|DB9PR04MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: dc20942d-ddeb-4585-93be-08def454f72c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|23010399003|11063799006|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UbuXwEDMb+hJdSg4is6lqI5WMWvp/9pkFAnf3vPYUntfcH1pPm2UiUZA8Yw4srB6UamidpeQd1YH9o67Bmq45n0wYXXSefoornXJukkhk3L4fPrmPLeByl+yALIc/OqssL/ZJ95Kkzp/43qnNgv4INWKd2+zIoEAFS9uAR/oiP6okGj5/kB7y6P/LCArEO0uhH0/a7r91llhTkmfB0FtvuOreKv7nuoLEMlA6vKLomc2lsblA3TkY+/IMYX7aJRwJMiREGNqKbMFDjju8fTPpW5gW2Z+Bm6JhQcD655aWFVYORN/0OnhZNKYDghD+P8/5YWhrDhCTR1SX0kfL8lHbWSq0ZWmNTZGFnIuUoFzvZNc6Wnk02f+kR4Vg5RIrktCz/i0OqHi4VSBRF5RGBzyNohVtEYWkCu5qnUdN8nxTY5oug+w4yMi+9p98KBPTqWckvS71sswJAIo7NiH5PLh+yU6Rkc4eMx6czCOw8N6rAEYjBtzMnir62becO8VqTDCxP2IrilzDm5K7230rnQKa5Ufs5XpB7U/FO1psGHHcQwSo4oOXNP7xM4FSNKXQahPHUtI52xWnbzl1QI42c1FpV2y9SQZOJkjqx9qfZtgaX00DEAhxmZOZBd5/fARxFEG7fxIT+ngYqCMGJYDPRRlYXhq8JtPvFcIXQCeS/tdAEc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3lgUxmpaj8JRjUw/e90bv7Ir5RaE8Rdv2RINQJrptgixeIeVQznCTH/z43eU?=
 =?us-ascii?Q?x8whK3j+XbctIzdxfpN1WcPktROIRlSpXKqEn35yaVp0W8DgsaNoRa8zILyA?=
 =?us-ascii?Q?5YVKHGbVIul8wAlLZ0Kq3ogLtbYzK8e3NsXnUmUmwZgXs43Z+Gta2IQ3e68d?=
 =?us-ascii?Q?e8h/jPQjk08PbAsmFJ0tDHAF8Rme6KC/x2OkhFCxugryGlZMk12WxWSKv9A0?=
 =?us-ascii?Q?E3yU4ios5hdbl9Cimwu3TA7PFxESL/ZrFY+g+vDV9DEFTcDuLtzrbW6STPrB?=
 =?us-ascii?Q?z7JXTEZJUDIQv5xy/Zo8eb5i8W1PjDlY55oyn1IfDTnLGE8iQ5FrzkXpu286?=
 =?us-ascii?Q?Oiziy7fshfuGYizMTaztUPUKRK5n1p/CQ3kJ0M30PlgloV2GbnfxRXWlMudh?=
 =?us-ascii?Q?ZUimGGdbIJHIr5YWTu0+RBYeBZur0RVsS6EcrC1pz+Vt/+6g7a+2+bXrJiYd?=
 =?us-ascii?Q?59H8sWR6VU7Snkz4Sg2AqbhHXaJL+Ya8gQlBr5ksg1MBKBvi/mjHw69hvotU?=
 =?us-ascii?Q?rbLFKfxKLCTH2PR34a3SaHtupJDPiA6nnJNtG7aC+d4pGv0m3wHIo2Y9ukH6?=
 =?us-ascii?Q?NSld6uYKT/NgL+M7wdpEtrk98UWuSJvaSflra3ZqTodHhi14qD9wdixnJDAx?=
 =?us-ascii?Q?RJl1M89mBX4t1RH/JEGzthBJSaOYpaZthu4Sc0O5vKIgRhJWqFKKK5OPkZnT?=
 =?us-ascii?Q?gyL3cTVNelqPb/huMgoFKdh6vfipp1TnoFgHOneiwgZKL/HcFwJCO/kRtXxQ?=
 =?us-ascii?Q?ilRdpX3n1OCd3x5MXU8bNIUqwXrSX5vWfW+hOlXmEFndgidtxg//FUxBRsUn?=
 =?us-ascii?Q?UKKjzeakLze2z3rWxB47j0887m9vNrk22lpqj2PmKUfMVyS2e5Fht/iwJKUr?=
 =?us-ascii?Q?IC27Z/qWSlT+43j0suq8Ob2Xls5+86fe5d0h6z7HLACxYfbSVoRyKY17Qclu?=
 =?us-ascii?Q?loLkfWNRyjKn3wdvCxjfn7Ne7rhVV3FTSNLuVzkUKs124Erm67a6fgKVaEBF?=
 =?us-ascii?Q?VDZMbNSwHqlMbrRNHIV8HC6Gc5ygzV1HKWVb6db+GJgmQLLPiJtt3lP15ikn?=
 =?us-ascii?Q?Sg/zmw/Y1MyU1lwqRtIuuWOU2HFFGIv2WCxjP+3CaWpQklrMBWeqo6A9rrri?=
 =?us-ascii?Q?RMrfvl8zjS/c2/OfwCD9XCoWQre1NELJiRELJ+kl14q1sodzJu9qEaLKeDRf?=
 =?us-ascii?Q?u/QMhdtmSzmbavH3TOWOdBgsfkmISBnhFIORXqM49Zo0zrGGTR5bs128hOws?=
 =?us-ascii?Q?rbUS93e43Gjktukhe43tejjhmxqn8FRDMkkXraqQ151MavQT/ftmG2CGaNIg?=
 =?us-ascii?Q?5RkM6kjs2W/bNGdFm3Ihg5eK0JrBZwEKGX5QIO30ewuym1Xlcdc4SiQJR2Kt?=
 =?us-ascii?Q?zknO9wqkrwxbp/Ah/pwNhTi4cQOxG5GeIRMTZHPwF20G8i9VewF0Y0GJLyLI?=
 =?us-ascii?Q?I1wdI8tdxOwmCIZJqNb3FaJIzENjfxVgZTvSfzb+0y4fcebULK6l0fjGcnxV?=
 =?us-ascii?Q?nt/be8hxym4FRSewlyrSDjjzgneRylZdzrc49cEu2qnfAR/14dfrpM2nMtNy?=
 =?us-ascii?Q?8wuZ2IO0gK/pmxes0cwxtU/ReVPA7+WTgK9LgJhRnuWeq9qeqRBeKHmlFb/i?=
 =?us-ascii?Q?/7fji+6qBQehmunqr6ZCZR8lFL/fnbGj6YwKV1VxHKbNdY9DiU/GCtp5qm8C?=
 =?us-ascii?Q?foqZNNzyEykPboh75JvHKu6hm5Z8BwAhBhmsIQJ1CdEAV88KuksCZ+arQe30?=
 =?us-ascii?Q?YQv84On2BgW4hQcanoMg6sKzbTXkXWHnkZo34yJiXuFdMJmWut4I?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc20942d-ddeb-4585-93be-08def454f72c
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:24:49.5585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHzf0hzaDJcERlEY4A5UBH33uuTZilmTVutCmj3QKyCrrR+16DZAmCDBVnKV8h0V67bEDJLjlsboRagAoBnAPoRnqapHJybByy85aRgCmM/+RsI1NfGca/FkD3vJsQlS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9233

From: Jindong Yue <jindong.yue@nxp.com>

Make the driver buildable as a module by turning the Kconfig symbol into
a tristate and using module_platform_driver() instead of
builtin_platform_driver().

Now that the driver can be unloaded and reloaded, let the driver core
own the clock and runtime PM lifetime so that remove() does not have to
hand-balance them:

 - acquire the clock with devm_clk_get_enabled() instead of a bare
   devm_clk_get() followed by a manual clk_prepare_enable(), so it is
   prepared/enabled for the device lifetime and released on unbind;
 - keep only clk_enable()/clk_disable() in the runtime PM callbacks,
   since prepare/unprepare is now handled once by devres;
 - enable runtime PM with devm_pm_runtime_set_active_enabled(), which
   marks the device active (matching the enabled clock) and disables
   runtime PM on unbind.

With the clock and runtime PM owned by devres, the probe() error path
and remove() only need to tear down the IRQ mappings and the domain.

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
Changes in v3:
 - Let devres own the clock and runtime PM: acquire the clock with
   devm_clk_get_enabled() and enable runtime PM with
   devm_pm_runtime_set_active_enabled(), dropping the manual
   pm_runtime_get_sync()/pm_runtime_disable()/clk_disable_unprepare()
   balancing that v2 open-coded in remove() (Frank Li).
 - The IRQ mapping disposal and the CHANMASK masking that v2 folded into
   this patch are now separate patches (2/4 and 3/4).

 drivers/irqchip/Kconfig            |  2 +-
 drivers/irqchip/irq-imx-irqsteer.c | 39 ++++++++++++++++--------------
 2 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 42f2278a702d..07db3b678f94 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -560,7 +560,7 @@ config CSKY_APB_INTC
 	  the controller's register.
 
 config IMX_IRQSTEER
-	bool "i.MX IRQSTEER support"
+	tristate "i.MX IRQSTEER support"
 	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
 	default y if ARCH_MXC || ARCH_S32
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 0c9c99f1141a..e62862617b8d 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -10,6 +10,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
@@ -193,7 +194,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 		return PTR_ERR(data->regs);
 	}
 
-	data->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
+	data->ipg_clk = devm_clk_get_enabled(&pdev->dev, "ipg");
 	if (IS_ERR(data->ipg_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
 				     "failed to get ipg clk\n");
@@ -226,12 +227,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
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
@@ -244,8 +239,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 						&imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
-		ret = -ENOMEM;
-		goto err_clk;
+		return -ENOMEM;
 	}
 	irq_domain_set_pm_device(data->domain, &pdev->dev);
 
@@ -266,15 +260,22 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
+	if (ret)
+		goto err_irq;
 
 	return 0;
 
+err_irq:
+	for (i = 0; i < data->irq_count; i++) {
+		if (!data->irq[i])
+			break;
+
+		irq_set_chained_handler_and_data(data->irq[i], NULL, NULL);
+		irq_dispose_mapping(data->irq[i]);
+	}
 err_domain:
 	irq_domain_remove(data->domain);
-err_clk:
-	clk_disable_unprepare(data->ipg_clk);
 	return ret;
 }
 
@@ -302,8 +303,6 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 						     hwirq));
 
 	irq_domain_remove(irqsteer_data->domain);
-
-	clk_disable_unprepare(irqsteer_data->ipg_clk);
 }
 
 #ifdef CONFIG_PM
@@ -333,7 +332,7 @@ static int imx_irqsteer_suspend(struct device *dev)
 	struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
 
 	imx_irqsteer_save_regs(irqsteer_data);
-	clk_disable_unprepare(irqsteer_data->ipg_clk);
+	clk_disable(irqsteer_data->ipg_clk);
 
 	return 0;
 }
@@ -343,7 +342,7 @@ static int imx_irqsteer_resume(struct device *dev)
 	struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(irqsteer_data->ipg_clk);
+	ret = clk_enable(irqsteer_data->ipg_clk);
 	if (ret) {
 		dev_err(dev, "failed to enable ipg clk: %d\n", ret);
 		return ret;
@@ -366,6 +365,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[] = {
 	{ .compatible = "nxp,s32n79-irqsteer",	.data = &s32n79_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
 
 static struct platform_driver imx_irqsteer_driver = {
 	.driver = {
@@ -376,4 +376,7 @@ static struct platform_driver imx_irqsteer_driver = {
 	.probe		= imx_irqsteer_probe,
 	.remove		= imx_irqsteer_remove,
 };
-builtin_platform_driver(imx_irqsteer_driver);
+module_platform_driver(imx_irqsteer_driver);
+
+MODULE_DESCRIPTION("i.MX IRQSTEER interrupt multiplexer/remapper driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

