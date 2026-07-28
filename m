Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EF1305057
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785252468; cv=fail; b=jKuadnoU3vN7oqBuxBX0zuYrnArqcufVUWI+DfqzNVjliwIYPlW4lH0u6qVMEFNNgswrdhd2jU65XYDJsW+WeGGnbXGvSTdVlOKlBOzfYha6vcA+ZSZlA9WE7ICppAE8BdR6EIKNrLIpqghpsyqLJIP7aTWW7hhDhzyUKKObPok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785252468; c=relaxed/simple;
	bh=aweQX5eOEA7bSa41IyF4hcgyfa84aSZP4ELDry0qMA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bKp72PJ2Tar31osO/+z7Ke+IgP+NnidibIiI9qlw3vQ/EaSlfNBIpkESh/SZjlMED0bxxQ4GF8vii7bMo0XvOT2CbY57HE9N0yrMfXgS6ZRRRPEWcWsw/AUlrcy5hlu7n8fdJxLNOgBZZr4aAwYRpq5WcXx5eANSkv7/yNEZqXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AW4ZGLCT; arc=fail smtp.client-ip=52.101.65.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AW4ZGLCT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRXLlIoZVcJlzfCq3DkmedHJNsG7wlxr75BnBAXt3IcPRgdAvTyPnhE4o3VppKEYnNol20daclv/1F9S1UNZi+l3Am6i9rkNriiqYvZgW6TFN2cbVUyTkziklmK00Z3+4oYkrFFThQAHcnHW++5Z7ZrwoAm7oGj6Z/+RJqbx4u6GLiVvsJB/UfDTu37yLUK0tKriRPX+aBsMwvL88zgJp5Rjwm6J5xrZadxd8t5RhSa3GFn2uI2XD57rAy+mmIemAP+QXGdG3PIfyzx4TR10vknspq9LZUq2W8vZS9MZajjGk0m5mGR+hquo/4G1YtipdK6XTTqe+H4HjpB855BKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcFCXglmhEg4hKzkFa9RNM2thtTsCGhSB/aHDJhlYV8=;
 b=cEJPCFDlkPQJ2LHFrt9QKqr0IRFs8IM3i/5ij4PwG31XEV8rSA4ChihaN8MExfiBMLOHpXQC88tMpIIudgX2S6p80pR+jXElO2+4pZ5smvYw7tCeTPhaA1KG5EsIZMR9tgGK5ojmNjtwET23bc1CYOlKy5e5NvTPR4pzlAjhYzTq6I4vGqghQDtyrvHTYuwn2oKADX5gGAhoFOopcsDHq22hAnEEx0ESroAS/e7QI00awLkhAXyAbFqVll7/K3br6Z/LlZXon0j8kIXOa/L2O2kYxS1SS2dIY8hQBcDLGzpiYl/SRT8DVLYfVeFIBTA5MCDbTHnTLEce1wv/99SvmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcFCXglmhEg4hKzkFa9RNM2thtTsCGhSB/aHDJhlYV8=;
 b=AW4ZGLCT8OQtJKObgFoRGKmhjTIhb53sku2VUGRPQjlaZsiovIXARPkl4nF1+9WFA76niSJ86CJVW4Amq05opxp388JW1kOSA85P9eJYQ0O9frKKVKd8QEnAyxXuQti3dgAVEqkradacwuInqbKC/UPn/vwVYsk555L0sWfH1ma351OCLTYXeRFsnHDulrWu+Z1E9FrvF/UxDG/0Df4PKmGiX1+djZckcyRSv1R7OAR0MN2EH+k+x2BQBDY1r4Ka/XZJk9IFf0WW+M/18MzFNmShhjiOj3H/sqovS7okSsgr1XMN8JseN/mEJHceUW/DJd4mWmbwPExd3wJfJZ+Qtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11589.eurprd04.prod.outlook.com (2603:10a6:150:2b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 15:27:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 15:27:42 +0000
Date: Tue, 28 Jul 2026 10:27:33 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>, xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] irqchip/imx-irqsteer: Allow building as module
Message-ID: <amjKZWmcbDfSMB5v@SMW015318>
References: <20260728092219.525449-1-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728092219.525449-1-Zhipeng.wang_1@oss.nxp.com>
X-ClientProxiedBy: PH1PEPF00013309.namprd07.prod.outlook.com
 (2603:10b6:518:1::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11589:EE_
X-MS-Office365-Filtering-Correlation-Id: aa923873-bee4-48ed-cc49-08deecbcc420
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|19092799006|366016|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	9m3oym4+8+UCncFBCo3Qm9VhycAVknqBFt/Bxcsc1WgIm0HYBpEVTkmWQBEp3W7z5KJnpdCPJkzJ+X8Y5sV1d0520/xrg2JqS7JlSlpymhScICRFu0xyRsRGjbGYfpueASVStNO0vks/MuzTINyZtqZtKrrneaQcHN/feeothGwocJGHHjaWxKhd7PzDDmL4w+o3s7pW1gKubVvjwU+HNz39RgP8H7UCqqAerF39A2QkhHESwk1cDSCR1aqqiLjDUEHEMh8zoxMYi/lnKrupjOa71irU9maY6Qw9ITV+IqNpLymfEfZOSNzq7Z5ojXoCYp5tM8nAF6XD1YZcb5eVaOcOseIskOfwj9dZ6Te6ZERM8rrhakFhvFSTMNmQgLDzZarZtSO/a0qktCHb5Y81j2zCwndekDUanwXPMfQDepj1Wt1MP7lNEnl8fNVF6Z5nBBsOFhpsqlioHe6HsHp6YYUlPB1gA0EisV9u4DKkSDH7sXI3ylwWdW+xOEEoizU9Hu1IP7gW+H5IDkGZb9DhVsnppBHQ+aMycjR+zpVVqwCfyZdCIh8aBMFulE1d1n1EgArY2ElXzf5ZPj+l2+SE5eHXzcrCAfOgdk1VKHkES7wHUQtlj0zSd/y4806FwQa087mDWYB3OE7ffkYpgBVinbWnyNvbDpim1TkZrbY8Nn0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(19092799006)(366016)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nB3Uu4bg7TpkCbEVKsS5I8QNisQIE/qsdHojlxEGKCqDZ36jbjewdBRCNvKu?=
 =?us-ascii?Q?gls+PHIQP5uuNhn9chDZE8iSgS1t9+OV3vxOQe/TkmcfiaXvd1iYeMLc/KWq?=
 =?us-ascii?Q?jlT39GAXHifYeK022iLceTe+M8zEiLMeqdgEdAHFFTD4GDkARn+fGuMBKj6Z?=
 =?us-ascii?Q?1YwHp11HIqNvAgUQDvMW5dLuFIl+qZFXKJqew20j4/2TT0Rov9n9MR/o4WIz?=
 =?us-ascii?Q?QORbAZ5GWuj7BfNA1WYPlfChUoEeXntsQjQooCWfFdejQUNa9WRiwOR87aTA?=
 =?us-ascii?Q?HuAfTdCdr6EEPsfSHC+t7wqVqChVtO2aPRcZYvEuU0NXU9LAVzp2E7ZQBerN?=
 =?us-ascii?Q?fl4NoSUdCeFjKCkXdHo3zNIgzF309u9/eLvIEOIsdVglFIxqG9eRSru3GYkL?=
 =?us-ascii?Q?BEvxqWcd6dfcqDZ2a2nG8Ft4NyL+OvEqSNbJ1d1JWMMdrdieDPB0TzvXUU+X?=
 =?us-ascii?Q?gH3u2pwsheSfHtNmzlSmB4dL1Lz/670kmnJ+8Z9ZkXIt0uFuyI+9dHr8T9Ld?=
 =?us-ascii?Q?t8fBkRAv9zVj94Bi68/RqZ243E034nfjxVvxHqKDTFVneMs6Hiuux6X7sGTn?=
 =?us-ascii?Q?ia1Zfc1nmiOpe/mRCyGi1haAV1cJf/KJuF4Anpy9gDAvU7YcSKKKkPT0DAs3?=
 =?us-ascii?Q?zoCubbsvVpVrFzzC466Zx0Oed2MlifqAUDRQtDNpONb4AdrGdJzRzbQT2DkT?=
 =?us-ascii?Q?pNk8TQUPo4NYMn6qIyqBUi5jUrq5C457Dng4z2Hju60kpiqscs1r8lU1C8oX?=
 =?us-ascii?Q?Hk0FMXg0QQfXIfs7qJ9DBO84TP+StPfKfgCwNENEztFu84KKLpqV9Cd7o9lp?=
 =?us-ascii?Q?2W19tDpkVEuS2/8r6H5tM75YIGsXCjcT8xkzCZZQSQSIQhbSYmGnR9TCrztC?=
 =?us-ascii?Q?SGde3nmvhs+Y/zhc7+j6radS74NPmkYcikktoM4YGc6NdcHzla0cZbQ7jnyO?=
 =?us-ascii?Q?8saZqM3RqIHEwcf9QbDRzSCcnHVgW8kIQ2dDoRK1Zyagcxp3OU1jg1ydyggi?=
 =?us-ascii?Q?noSXZA/wgeR9S9gjZvDaCgUvGAFFZFEirvZdhARVsbKbJ2UglkU7WUd/gzMF?=
 =?us-ascii?Q?eZTzvZSiSJE+9H7wYmchoUuhkogPR3sKAwzETb3Tf9KFlLURxD3Ojlur9Cws?=
 =?us-ascii?Q?y/izk/VKmoFij3w02MqHnjE0aK4plZNVzpB2LJSZ6nLxXU+mXowkpIr3mI1e?=
 =?us-ascii?Q?TnygtTg0HkXu67YUv8SkPHvMYbOMuqqMjmBzql+CNaJreW6VVIseEE83fdEL?=
 =?us-ascii?Q?obcTMdftg0Qjj8bXCeu+L1EPbk83Fl0BuzdlOhBoydk2TtdDx4RI4IO1b7dU?=
 =?us-ascii?Q?3nIgzZ42ME1Y6oeDXmU3bceIiUqalf5v7ws9BUQGkNfQPa5lAvC9QooACPgA?=
 =?us-ascii?Q?fZ2kTDsZNWC8N1jBRpf2tJrkAsymAL06+uEPKEs6ec6PtIL+xneVu1P7fTpP?=
 =?us-ascii?Q?0zgSb+ya2pTqQ2sqXixIpxLFYjp8sUU6vHARikhFxxtFemRajovVcKvspzKQ?=
 =?us-ascii?Q?PW6y9gC5AbI6vxQhcAi3fsJasz7ozg10uRdpUesanX7WeMzror87mFTLAwSg?=
 =?us-ascii?Q?mOd6RHdakrh+1qBsTHBxyXeMhFFg10l1E84jOqFLP0EKRZBACSVE0wxieOfg?=
 =?us-ascii?Q?dJAnRUwbLYP1kGD0xlY8d/iaC+XTnU8SKceobenCOT+MxaJaGtikDTB4DXyO?=
 =?us-ascii?Q?nT6gH0IKKNajP+1sBDHpN4jOIQGCRSy4FRnXscS7sUQQ8R3wP6aw7acEyElk?=
 =?us-ascii?Q?i0gL++4QBYJOIQZPUbdIygeJWhB+u4/COD4Lr8ce1OnONkkK84BX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa923873-bee4-48ed-cc49-08deecbcc420
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 15:27:42.5435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roDv0kRQTjaPkyssHlvJW/OnM8jv1Xg4ASSINbWlSbZ9JpyB2MxEHktI2CcRv/DQWfjS9S2Ti/1oS6s5x5rHGrUfi3gr1HGafqqKF3+YiLZfKtLiI5/keeNag8c0k+Le
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11589

On Tue, Jul 28, 2026 at 06:22:19PM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Jindong Yue <jindong.yue@nxp.com>
>
> Make the driver buildable as a module by turning the Kconfig symbol into
> a tristate and using module_platform_driver() instead of
> builtin_platform_driver().
>
> The existing remove() was incomplete for the module case, where the
> driver can now be unloaded and reloaded. Fix it up:
>
>  - dispose the parent IRQ mappings from irq_of_parse_and_map(), which
>    were leaked on unload;
>  - dispose the child mappings before irq_domain_remove(), otherwise the
>    irq_descs keep pointing at imx_irqsteer_irq_chip in the freed module,
>    which blows up on the next /proc/interrupts read;
>  - resume the device before clk_disable_unprepare(), since it may be
>    runtime suspended with the clock already off, and skip the disable if
>    the resume fails;
>  - disable runtime PM to balance the pm_runtime_enable() from probe().
>
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
> Changes in v2 (addressing Sashiko AI review of v1):
>  - remove(): dispose child and parent IRQ mappings before
>    irq_domain_remove(), fixing a use-after-free of imx_irqsteer_irq_chip
>    (in freed module memory) on the next /proc/interrupts read after
>    unload;
>  - remove(): disable runtime PM to balance the pm_runtime_enable() from
>    probe(), so reload no longer warns about unbalanced runtime PM; resume
>    the device first and skip clk_disable_unprepare() if the resume fails,
>    keeping the ipg clock balanced.
>
> v1: https://lore.kernel.org/r/20260724090136.3595894-1-Zhipeng.wang_1@oss.nxp.com
>  drivers/irqchip/Kconfig            |  2 +-
>  drivers/irqchip/irq-imx-irqsteer.c | 26 +++++++++++++++++++++++---
>  2 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 42f2278a702d..07db3b678f94 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -560,7 +560,7 @@ config CSKY_APB_INTC
>  	  the controller's register.
>
>  config IMX_IRQSTEER
> -	bool "i.MX IRQSTEER support"
> +	tristate "i.MX IRQSTEER support"
>  	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
>  	default y if ARCH_MXC || ARCH_S32
>  	select IRQ_DOMAIN
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index 87b07f517be3..da3889036182 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -10,6 +10,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
> @@ -274,7 +275,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  static void imx_irqsteer_remove(struct platform_device *pdev)
>  {
>  	struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
> -	int i;
> +	int hwirq, i, ret;
>
>  	for (i = 0; i < irqsteer_data->irq_count; i++) {
>  		if (!irqsteer_data->irq[i])
> @@ -282,11 +283,26 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
>
>  		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
>  						 NULL, NULL);
> +		irq_dispose_mapping(irqsteer_data->irq[i]);
>  	}
>
> +	for (hwirq = 0; hwirq < irqsteer_data->reg_num * 32; hwirq++)
> +		irq_dispose_mapping(irq_find_mapping(irqsteer_data->domain,
> +						     hwirq));
> +
>  	irq_domain_remove(irqsteer_data->domain);
>
> -	clk_disable_unprepare(irqsteer_data->ipg_clk);
> +	/*
> +	 * Device may be runtime suspended, with the ipg clock already gated.
> +	 * Resume it so the clock is balanced by the disable below; if resume
> +	 * fails the clock stays gated, so skip the disable in that case.
> +	 */
> +	ret = pm_runtime_get_sync(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
> +
> +	if (ret >= 0)
> +		clk_disable_unprepare(irqsteer_data->ipg_clk);

Is it okay by use devm_pm_rutime_set_acitve_enable() at probe, so you
needn't manage clock.

Frank

>  }
>
>  #ifdef CONFIG_PM
> @@ -349,6 +365,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[] = {
>  	{ .compatible = "nxp,s32n79-irqsteer",	.data = &s32n79_data },
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
>
>  static struct platform_driver imx_irqsteer_driver = {
>  	.driver = {
> @@ -359,4 +376,7 @@ static struct platform_driver imx_irqsteer_driver = {
>  	.probe		= imx_irqsteer_probe,
>  	.remove		= imx_irqsteer_remove,
>  };
> -builtin_platform_driver(imx_irqsteer_driver);
> +module_platform_driver(imx_irqsteer_driver);
> +
> +MODULE_DESCRIPTION("i.MX IRQSTEER interrupt multiplexer/remapper driver");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>
>
