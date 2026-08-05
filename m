Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5E83E6DE7
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 20:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785962221; cv=fail; b=Zt4to8mmxG6OXqDHmeSAJGgW88ii609e7FiYrH6fdO1B0R4qBfRYzeqLUU6lp1IoISuJ0qaZPhJxZZFMu5GNDZWmfqwcyh6mqWnck8H/phnXH/3fwp7IeSwuXqTfimDzc6PoORsRrjFgbirhso+7R1T+D4eCJ2JPg5uFVJJugWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785962221; c=relaxed/simple;
	bh=ZAHH6W6z8vgKMOjrIeyfLbYc2xBM/ukxzbiplWpzlsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WQ1DquIHsdiAz9rZeR4vK6/m7ysBuA8DLDN8YGGlVP2olN/4DBkI2iIrqgvPVEKMs3wfmkNp4fjTuJsmKvhQUW+Q+hAg6/g5y1sLFvdaAxevZ7urhIuoUk1oa3nHX9Mi+F1O7xOmLRF+fsY+RjZ09Xz/IKBWnX5hOBqPkPHoGLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NqefxtZj; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NqefxtZj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+8calkkcoGad1faBrSuM9vDwwOjLy4YF/km4owWUAWZuvxKcP8BvVD4mG2KRpU9Vb8haVi6xai+nApnwijSMc6dwKCIirFC5k4x7SJLr5+cMwUU/574wSwE+mAP791Lp4Q13OycvPp3Mywx2n98uZHKT61NOokSepBr8xSDQSCLWbiZhsbLPyHVQ2vv26qIig0QNNaS3cJJ6fyJOxl0ngTUydnsLS1QQc9iwQQ3AdGG0HGmK0MRrJmVbBrLTraolaB8uB+ip36Xy2IRIK6hsQqN+8RenOQK3W4QH6+EQ7dUR93GY3Pod0uVrYmT/5CIspdGz76mfgMV7mManVds7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HYH8eh6/JKyhtvZUzdiH2XmI2XNtddgR9ffDpejU2k=;
 b=m4V7PoJ/IrLbfmCA1SeloX84yysDOeVIjn7BQLaR2q3ZJOJUp20DwzXnw+kt1wbkE9pXQDJ2zpD4jREz9VYEBULQ5Uqy1UhyUiXf4s7xRM7Z1HZ5DHlvsqm8XjvV3hxjqc71sKPVON19WzvwErX5jVJ65A6Z90fZ1C2JmTYGsceqJTJFsjWXFZpFvzoptzCD8RfVhH5kXDMewM9D68bBgNyxeijmXc4tT4nZFVg1eGZLeS81eZLJA8+I8PeWXmolGXCv0QNSLJH4C47ATPXVF7lFi42gPGw8E+X06YfF7klwzZ6jjFngsn2F0Zy882fXx2aOZ717/X5S4Xmwy3bsag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HYH8eh6/JKyhtvZUzdiH2XmI2XNtddgR9ffDpejU2k=;
 b=NqefxtZjhQh4HssPqfOGAYaau5Kb/nOuTqWdAgc2e9Al8InhGi9WxqffyiDQ2WcuvrYUYyKQ/pO+OjR1RlV0iBsUohPEZSbW9GSmSrF/vwx65NFmts1i7PkbrH2f3KiQgi2EbVyEfS2OKsjCNAXtTP6YsrpvB8uUf+8PXr8HSrL8hxVkVZW7FnGnX6w6iYqZjZV99mgQeA2izw8TmVRhqCCQWAtd0YX2HTwFEJd6wn/qrpsj3FTU3oqDcQsvczu8glOj/1MbL1Drys47gCLHd8+rzp0Dapo+QglSEGAsV0DUn6QhZ84L0pyct7aL20ZxTuwcwrMT62vVLDsc9yWZkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9272.eurprd04.prod.outlook.com (2603:10a6:102:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 20:36:54 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 20:36:54 +0000
Date: Wed, 5 Aug 2026 15:36:46 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: tglx@kernel.org, radu@rendec.net, Frank.Li@nxp.com, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH v3 1/2] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_enable()
Message-ID: <anOe3mLdSMVvfPXm@SMW015318>
References: <20260805192743.244441-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805192743.244441-1-festevam@gmail.com>
X-ClientProxiedBy: PH8P220CA0036.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9272:EE_
X-MS-Office365-Filtering-Correlation-Id: 5defd63f-c628-455c-bffd-08def331493a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	26lgShlHmlqqmiNe2rc264Z4pl4oLKQR0TdWHJkdrrH87gbAKFjIljmT7WmWOxNLDtuqS1opHj6QwIeXwjJVUeb/AfbchgxzEbpWUwiWIlqyrsGUQ7fJXMdtlF/FQt53wWePD2G/Cvfn0DF+U7iCgyU5ZZXr0VteVxDvYcXCHEKsE4iRKN1/yThMchmnjqhi2aavrQ1SsxZ0d6cOS6e+AjNVnp9ysg20B798RsGihPc7bzvAtFQ8qKM12UKvd2spYt/o06CDUJ5EP75GjUaUG2kaDRTzf1/LUbnF9CNLCJcxQWvo1bxYxaaFTVaK+jQNsWij00vngTPjoDqcT8k10PyeJpdGmD9cWCheoBXhqB787ZDfhjhi/l7bXbz6bp2eQXCZgvER8X7vtEHzypeGqzVcc90jQU1aDjgs33PQ1E6lN6Jbq6IpoJiJmO0FZWVEgo9/Q20Cyityxv0IJj+hi+IA6iKFS5eIFpoXGGBmQL3KqWyBO6V9FdkjlkBArOdBjjZ+zeIJ+0Sxj0b47TBX5cKkFp2RQ4NOD6fOywXQcvmpLqnHZAUeanUX8JvTM8xlUDFNDjtlXYOGYZdRf4Mb5XMoafB0JGKM06r6uiDbZwKvkd5T4xgKieGAP4zqxpaIeY3EkNrJYCpZqCKxNH1SUc9ULCt8oT1qs5gRV2a/Pxw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kGZgHQfWtvP4NZ1r0AGim4dSIKBePK2Ou5fxUMExflO6dmdtB33pHrbsvibQ?=
 =?us-ascii?Q?ggsI8UwyEbosSii52qSzIef/E+KoTHPSZZQPrIU0HytozV5UkAJ/I5AbqwWl?=
 =?us-ascii?Q?BU2YCKxU7c6QxWz3zULazeNbdFoUA2g2POXh1Plq7qQ7wl7zLz1tsn86vDcf?=
 =?us-ascii?Q?edsjfbMJp5xn/MdWYpV+gH2Ud3jrCEGy/6YcIITQzjyV171pWNeNWVTwjmfd?=
 =?us-ascii?Q?iwwuPiNpnsToq6FSWyIKhcK0wc5+gFcfe2bkRdNr7gWG1PXxU2c0yBPXc+nl?=
 =?us-ascii?Q?YGGEIrPqOConevLRhjaHAreCjlyaZFEVfsuTpHPPvdKPM/8mgWqmUymyloxX?=
 =?us-ascii?Q?v2tt7tNqeAjnBYv+5miMgtQWhm433ZPunTT4GykwMNcUXf4cl2LmWcIPjijn?=
 =?us-ascii?Q?6405EVPz6193LZTQRCYuYUdNs0bqswXrO8B101w2Z+nqQqzzVtTNMlJVSoyn?=
 =?us-ascii?Q?rYIEOwoNVy+Rzx570Y4QdmkUQB05lzNeb7XiqkzfbcO31MgBk/NEY1fh1bPN?=
 =?us-ascii?Q?biv4uEJxQypqOgQlA11JP20p1dcDXLb5nad9rP7PhdI10Cs8NYsiTFwYrivE?=
 =?us-ascii?Q?unVkMZegY+wf6dWDPK+z2aSuYvb1+Q8IjUd+pB/OxCDN7s5y9qIkxC5Bv9nl?=
 =?us-ascii?Q?Q0YXKhg6pIvDsmucvBwu0RQ8PTJl6UCOrOryMmE/GiFxS+mv9GHvYH+3yW/h?=
 =?us-ascii?Q?7PdzANP4lqOjXBTisleMZYhvwmrB56+C26JfM3kzo0Fj+rtj1F10DKfX9L3H?=
 =?us-ascii?Q?BvTGJCj/Q+r+QkXYmCJCjLJVDw1t3Evmng8OHl6TKDNguAAFXw3T3hqX37mJ?=
 =?us-ascii?Q?KH22b2eCWbJfqQ0jiRwd41orwf5OQF13weVL5ifAezYlKDFyDBAqo66a0VdK?=
 =?us-ascii?Q?W0A5WpXsogeRbWsFKdG3XQrHfbfLpQxrxNG9abiJyL0XFt8JMsODYsWGrhww?=
 =?us-ascii?Q?rfYefdumBCxFUVV6H/o3698geitcOqKAVaaQ3feFGQL/D0jvBx9wxBSnIKk5?=
 =?us-ascii?Q?8axUlqFZ2cN2GQV5mVIQeC34Km5M5F3r6fZIzK4D/VSXPWo369DeInodFvKO?=
 =?us-ascii?Q?ZAIsjQPj5C3FRliJoYMJ4Z1PILiuyVIVPEwltrezXdYrAo6x8f/6qtnYP482?=
 =?us-ascii?Q?vqUb0bc7j43ZKaTzomC3P6S93b3GqlqtLbK2CZdMlTwbYk3ZZZuepzMvEads?=
 =?us-ascii?Q?LaNP3WxhloNb2CpSVvPXcRpmx+PHyObG8UuGV91TWXIaavp/xJxTSvewXkLg?=
 =?us-ascii?Q?ZVU1iQREd7jW02JfcekuYl5A6m3rd3j2MR2XW2DPfqQyl0wI2hLowQKtl+v8?=
 =?us-ascii?Q?jq5t+iMP6C0QsBSTxaQU18g0C+9mshkPFBZFzHujT7LLmlLoaryO7e1TP8gc?=
 =?us-ascii?Q?lVAleU1JaBqq35s634gl4YNyDUulBE03ArTmi5YduzXTO5ay1oNOnTSsfxTV?=
 =?us-ascii?Q?D3m9HPDAcSzzeC+crntlF4viufWW+sr91IhABlQBNEN0Ttmvjoi7dMicw9eG?=
 =?us-ascii?Q?+OasRro791ew6z1lx8HPldrF/ZEBs6WRihxpX1xLhU4ushdoMirKY+ZndlyZ?=
 =?us-ascii?Q?p6wOO9PWzpXQUr9bYxhx/o7Odqz/kR5nnT+LICwEk3ZLzMJSKbzfYvuqbZJR?=
 =?us-ascii?Q?benzO2EfyXQ/x/dnhqVGNA5xQxPTEmmgYRHZbL8wdALVMO7r4T5BUlwSWEtL?=
 =?us-ascii?Q?2ASfL+aHybAyedfhi7uo6GrDfHAKjzotKVlYYFIJqUc6r+N47OzQjZpfg3GY?=
 =?us-ascii?Q?AjtfJZmEwqHILLMPpttqlEoBgA2mxQmuW6Yb43GD6sftter5oawg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5defd63f-c628-455c-bffd-08def331493a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 20:36:54.3407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asiGg2FJzbaLQ2Mw2i/1hCgacp8tA211UH90hl3fQArBcNROPh0N/k/EhmFgZoRX1PSb6f6T+HBnrL1WqWdYbFvHemRYjBdDBkFbejoyF6cralGvjFliy3LY+B0C5gl5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9272

On Wed, Aug 05, 2026 at 04:27:42PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
>
> imx_irqsteer_probe() enables runtime PM, but imx_irqsteer_remove() does
> not disable it. Consequently, runtime PM remains enabled after unbinding
> the device, and rebinding it triggers:
>
> Unbalanced pm_runtime_enable!
>
> Use devm_pm_runtime_enable() to automatically disable runtime PM when
> the device is removed. Set up runtime PM before creating the IRQ domain
> and registering chained handlers so that a failure cannot leave either
> resource pointing at freed driver data.
>
> Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v1:
> - Move devm_pm_runtime_enable() prior to irq_domain_create_linear(). (Frank)

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
>  drivers/irqchip/irq-imx-irqsteer.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index 87b07f517be3..653e25115083 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -236,6 +236,11 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	if (irqsteer_has_chanctrl(data->devtype_data))
>  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
>
> +	pm_runtime_set_active(&pdev->dev);
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		goto out;
> +
>  	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
>  						&imx_irqsteer_domain_ops, data);
>  	if (!data->domain) {
> @@ -262,9 +267,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>
>  	platform_set_drvdata(pdev, data);
>
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> -
>  	return 0;
>  out:
>  	clk_disable_unprepare(data->ipg_clk);
> --
> 2.43.0
>
>
