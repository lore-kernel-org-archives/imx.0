Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD4637C927
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 14:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149509; cv=fail; b=pIRhxh4NTEjL+X70lPVzmCmk94Mwag/i5UiF+nDrF14gr6ZAoPFRpvbw/bnOcbmUkVkL1OrazRettVD47cDR95ViYwcHMoDi5x8CNvvIau+BjxgS6lJePJoBqIRF1RWMsrUsvVibVfaVlsqAJURhzS8kTW41rk/bz5Zx7fqjvr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149509; c=relaxed/simple;
	bh=5uoJyh3QjOLYD9cSOot7ue7tvHZW4T3mj6vfVe/KAXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TMQN9qyywj+LCqOEYytDgvtFv9y3qJh2a2LgTKx9Ghx+7IOrcgX+GtIidfNaqmtGb2svDzWCUUqu00NAZ7vCsYO6L3MrCWoUJBP+eYo67k6MSqYtfDhCQqLe/ah//xS9uPV/pX6POzz77ISIWKCR9K6NdqVYGeqad4hO5PIpEOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jgmrZzQg; arc=fail smtp.client-ip=52.101.70.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jgmrZzQg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtdeXc0RnRha7UfJopMxarzAdB8ZHNyPhip5W8oU3+A+exjBmjYTdpRhG5b8YiVFeTIqFv7NEllRp3XjEscHqId+WutEusScjl37Urv1+KW4Jz/4vnwIhV5ip9TC992ah6NpR9SxMjaObxTGRfZ0jiA/4fLggZvK+d6+MuPAH9xDZkrDt9WkD+l/MeQ/I1RX0jGJt7d2DFwhZLdM2d7ZDlz0aIDdIX6Sqc3H8glUAUjaum05aLkbBc3ArFFL+6OFuufb0EyQVzS+7EkLTficjewSGbU8/qXxlgSs6nzP5nQGkNiFRbjEt0yKg82tO8ck58mbkL09MskBZBR4TBZNHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79tktRAyAKVkH48aUBOfZLzDJznBZM93B3FIEhqRYPo=;
 b=F67sUGnPqlNpZRia7KYJYoHK9pnwB34yeBzovEfSRKasIVP+hY/Q5EK/Box19g6sYl+I2h8fhkzwq5TqsC+LXo4dNwD1nTg6Mt2DS7pkIL4woDLL+p5F+yDyX6gLwGQNVYxfchyqjhQX4CU/bMGV6d0y0B9ULguaQw1Uu4u4ttkTCt+G5Saj8hMQBKQo+RDW/gO641+/pP4ncyOMy4jHUmJiZE8Bi64Y+yvQMF1eq+ycAiAAhwRrJZ08bMouhN3OcYiSi03+tgYnPwRd6Ut89bVKjjCW/Tf5aSEsYZpv1XXOWF2PQdgKjzPY4za0hA8wwZY96JuMjtr1p7gyLGb6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79tktRAyAKVkH48aUBOfZLzDJznBZM93B3FIEhqRYPo=;
 b=jgmrZzQgWVdCTcfha0Pa4VXCeWm7c+0wqRVdIUHaxdFyCi/lQRQ6hja5FPQx+NxwMA23+yjVZMF58LDUBg+8vUntz6FVH4j9UpcOM/3DI7zFikUR2YyNztpO8DMtbVTRSNXVhPP2+iKbrq1tqhrCzDjUYNPMnD16oCc4yRQ+Q6g/XtUJLrl2toZyhrCROJumAZgjQBfI9/9I7uojiL8Zi1gfsGdyPe0Cmo+sVgzz029y1bW7c/2bwVm7j3CspJz6QXV0dVxOIZJscBLGgbVUrm9Imeyiq/pqlGrL30EXGez+tTz8owwbU1hXbSLB9BMSmANmRjVQILe+r9PQD7nMIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7501.eurprd04.prod.outlook.com (2603:10a6:102:ee::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 14:25:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 14:25:02 +0000
Date: Wed, 19 Aug 2026 09:24:53 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>, xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/5] irqchip/imx-irqsteer: Use devm to manage the IRQ
 domain
Message-ID: <aoW8tbTmjMKs1IEO@SMW015318>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-3-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819090543.585131-3-Zhipeng.wang_1@oss.nxp.com>
X-ClientProxiedBy: PH7P221CA0064.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 3716a6ed-3ed9-46c8-6c19-08defdfda7ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|376014|1800799024|10067099003|56012099006|3023799007|4143699003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	pIRHemSqHyI1+sNoSwH89H2J2zlhL1RdGgUKbgJXY4oXGoplvguj/UNhjvh/OCNdO53Bv3TGiKMb3MbZVQyjsa5Sj657Jxu71Xf69on0TItqtQn1+vbnrJpYL41qyPVCd8MML6qpKtHnR6U6INPgmLG6MgWy9TJUUEjUUUvJ0TzHOENc4BTEsGP/7S1/Nt+PkQXNxYGBrq6FBfvpe9cDeSrZKRUhoWYgixqqs6wZosSvDzusChLcRIW2Bn+uAp/FFki9xMqLYlfYI2Y50Sqs4VzYaNeAOO5LyaTTej3r3PPHEKrMLM87yVrdCrWclJitJWJDcyT/vEgoA1C3qId9sdxaoZ4WFH6cyiHAaC2xGAhs8GL6MmgV+YtLioiXKcMmLOOpxhX1kTaj9W+jSO4CN3RW0qQM1kXHmRt86IVLJ0UVopolbV/0kyrycwPMgiVENT0nNvdSGOOMISYsvjkTJ18n0rEPfxnS6383A2598DbiViphkYByS30uwCAB33zmBtxYbN9jASm0LPK5Dl9Sz4JO8Zwcc5GkzWuv6ibt9tb9w1ssvU7AX4pGe5IVW0M/m5VH0F/NghgANLeslqanDMBy2fLXyzhUcO/9qBMgb/g262OC3hDzeucBYxRgfsvZ/Tjv95dnDGFobjEWcnhk54uZC04MQvNaxG8JRggwUN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(376014)(1800799024)(10067099003)(56012099006)(3023799007)(4143699003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C+wTZZOMXRD748X9qIMGYq7TzkdZPkqvhHXZ6M+BA2OURbR4plId/iRjlXi+?=
 =?us-ascii?Q?8BUeVTJaO9PFyNnwcphVg+ft4C7owutyNPvmodZkzNLb28zMZH7nbF6q3kHG?=
 =?us-ascii?Q?NzdAatu39eZt/jy+SwXlke5LGUinuv+1w4rEO6OaNgCsrXXf4IHaiA/WeuEF?=
 =?us-ascii?Q?7OvKbyb8ggr8qlwBAfMqBss5JQ/AlF2ghMSOxgBEC5TLXExlPkcepNETpQyP?=
 =?us-ascii?Q?Sc+aCXwi5fdTMQ93mAQuyiVf7+xEz6tXkJeWvECn11MsaqiO4Jz2typwY07E?=
 =?us-ascii?Q?Ng2vpmQmWaRJqDIpdvNHZW1hUnb0aRR/fmSbezVaGwVJh62io2DSr4cpDpuF?=
 =?us-ascii?Q?324ToM0oL/YkBGswUTD2K2k2mzoUuhUgV5jwCSL0DLNR4pz2qITqjwaBDi1B?=
 =?us-ascii?Q?bCTfKsKOIOz5LDoDxKZ45GBJt9rSFPYZfocg77jcFD/EP7wmMGilTf7M/0aL?=
 =?us-ascii?Q?TJwHJNCNGWUalfUfQ0f1rLxR2pCbOuoUR6/tGl2moQEA6lJJhaObAK3MFs5g?=
 =?us-ascii?Q?qG2Q02Eeo7jG2DyUZgvdul4x5DLXtNUKk+rX9HATee0WkgagT+k4JR2ZdVQ/?=
 =?us-ascii?Q?t0+OJjEd/6RZ4tB8lFpX7ZuBBqgB3LkNTNrbMsWUrJZ1zsPPjS+lGsPkk7el?=
 =?us-ascii?Q?AX63gZIYhDobwEahr8XPCO3SxRSlAgxTwhzCzr5L17PNbZNvNhIWOGVBj262?=
 =?us-ascii?Q?SSDYSl2znfNn/cfhhSTmXVZgRZ2ttIrJf5OS9Qtxep9JOdPUDMTRU5mTbMzm?=
 =?us-ascii?Q?ZcwCEa0UN9+dzs17DoxNunSGf57qyF4xrk6+3Aq82r/vYtD/nlwC7lhall1I?=
 =?us-ascii?Q?3USSfmpQXITsxERD5V3BSKiGYd9fdZNH7RYG58N0PAwCHOd+nP0s2LABDWU6?=
 =?us-ascii?Q?G3oujqHVy/eZN+T3l1jCJLpoTnAdBW/7qBh80BSKKQ7ggQLEgcC0rwenOgTZ?=
 =?us-ascii?Q?6TUTJvxwZ+Y9HVYvT20Ho09x4gULWlCPfyP/eN+SDodXCuNK2bJZObs9xLZo?=
 =?us-ascii?Q?BoXZciyjvvYDiVXwRu5cHQbzkEbaKBlDsevggSYTLvgVhKH70H4ds2X5eXiU?=
 =?us-ascii?Q?0VQGT5PLX7yMJpM6UMDDCKgGH0yBAJ/nSRgsPXBjsFnMtx5aSEKtvRi5iKss?=
 =?us-ascii?Q?1Oip2MgRT3mLJPbmhzq+C3fobLY5JPKOhBEjR29kxpP7LmAFE9L+5/kefajI?=
 =?us-ascii?Q?z9NbTlXSnpu5o+J2mX8KEbsky+54rVANPtbQoV9+h5Aywr+pMd0KaSz9/H1A?=
 =?us-ascii?Q?rKMQiPxk8VJ+3cuAxSggnVVZOpfhNk/E6P3AiDvX7hUkXQ0qlYYJyS3h4WHO?=
 =?us-ascii?Q?9UaZiCEvFKr95qN9VwvAA3rxDETnnKXJV1xOKkYGkLvFOFeH/SyBzcCGwKe8?=
 =?us-ascii?Q?UxkiAPlmbGMq50jMGbFf48/qpjMkmF22dDTItXPW3ufncoumEJDs2o+vtWQI?=
 =?us-ascii?Q?WTLtUuRmPQhySo4R+E1Ir0W+muuI6l/pokUWy5Zr3ySttWrvJr+zCUdRxf24?=
 =?us-ascii?Q?Es4QHfcRo3RRTtoO1+NdNcs8+Tk9C+UBUn1joPnPpzp5diGcKW75H7d8P0B2?=
 =?us-ascii?Q?wP4LIOGKHUFCeTU/Vqzpr8ec/nnViYLplZkrSM6t4K5y/QJMegdfiilsCYpZ?=
 =?us-ascii?Q?bR5Xgr71M9Ve2JHixmhAq+aC5qAjNvkO66bsGmao9qLIs1fybss5y7kTrepv?=
 =?us-ascii?Q?yZ9ub66Gv57iCg4uDUmgbu8sHxnCvnrZDEYnm2wA4Q8s+uJotAMHrE9V0Px9?=
 =?us-ascii?Q?jTKllcMOPun3O+EXcTiUu6ohElwLwqPily/6xuuPbHnim891chM9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3716a6ed-3ed9-46c8-6c19-08defdfda7ea
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 14:25:02.2066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSJmb2K4D5JVR65o23uujT5d+Fph4otCVaUGiGiQBs+RVAE6UvnznZzDXqEUZ+AgRMcCZlhIUbeQAi+G7xSmeGpl0it+UMEUBQBktY3C2kv4DpoxaHUq2HuEQ8v2JBZn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7501

On Wed, Aug 19, 2026 at 06:05:40PM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> probe() creates the IRQ domain with irq_domain_create_linear() and only
> tears it down on the remove() path. On the probe() error path after the
> domain has been created (the fsl,num-irqs sanity check), the single
> error label just calls clk_disable_unprepare() and returns, leaking the
> freshly created domain. The domain-creation failure path happens to
> share the same label correctly only because the domain is NULL there.
>
> Create the domain with the new devm_irq_domain_create_linear() so the
> domain is removed automatically on unbind and on any probe() failure
> after it has been created. This fixes the leak on the sanity-check error
> path and lets remove() drop its explicit irq_domain_remove().
>
> Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")

Nit: First patch also need fixes tags to backport.

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---
>  drivers/irqchip/irq-imx-irqsteer.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index 87b07f517be3..359b8ebc1bae 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -236,8 +236,9 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	if (irqsteer_has_chanctrl(data->devtype_data))
>  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
>
> -	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
> -						&imx_irqsteer_domain_ops, data);
> +	data->domain = devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&pdev->dev),
> +						     data->reg_num * 32,
> +						     &imx_irqsteer_domain_ops, data);
>  	if (!data->domain) {
>  		dev_err(&pdev->dev, "failed to create IRQ domain\n");
>  		ret = -ENOMEM;
> @@ -284,8 +285,6 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
>  						 NULL, NULL);
>  	}
>
> -	irq_domain_remove(irqsteer_data->domain);
> -
>  	clk_disable_unprepare(irqsteer_data->ipg_clk);
>  }
>
> --
> 2.34.1
>
>
