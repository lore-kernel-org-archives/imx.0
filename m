Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010030.outbound.protection.outlook.com [52.101.84.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C198D3839A9
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 05:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465258; cv=fail; b=buDsmbrhguI6EGbNva2dtLrcdf4awPyCY/N249RtlbNf4dqLL9Ihs7j6mnJSwppcLJmP8OvAS8oD6lFT3DINh3jftc7q7CGhQiy2pPKaW0KjbzgK4ssk+1K/2lWvcHnOS3MWwpB8yU1WpIo5fQAIbJnH0frJU8ex6sle+7YM+gM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465258; c=relaxed/simple;
	bh=PM54i+j8BeMVDzqMbZ9z5LQwVU8WYLbiGEtgYOCKozo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PLsaWNJ0TsQxqyodLAMlqLh5dbusdgS/qreXVyIbNc893DPsIofZ62F0rPxRJN2PI2LG4g6bGlsdYD1eU1uFV511htPX568aRLWmuoEibFFMSRkA9tPUpEfgMTwjHImDBd58TbNRnRINHMMX0rQqsVIojH8E240+0nSC7uaOohU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=JwL2R5kC; arc=fail smtp.client-ip=52.101.84.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JwL2R5kC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEFvgAO8QFFho4rF0vKl5bGJ/ft0GRmfqv78oOBKwdrqaK33c2ANYlEOCewadnH/6vbHk90Go8eLuZeBddvRxsuE7r4RNhu74IfCCUl+ZIl3ciDXinzxo/gdzvb4B5RwDdduT7/MXeqbQZTMI019CnHjTW+Z0DP4D+u7HI0VFOx1HQ9o2j51pjdQm6xI4vV/+0gjedEEQlgZW5pMujSfHI1zyLnVG3NMbgaA/kzOpTd81Dovz4DsD4SQL+scO4gVArzmIqXzLuo/Ngve6qsEqcqz2QD/UtrpgLfdxBuP1baTxHOo+sepnvng8HDNX9PeRvzrnzz9vaWpH9BC7q1/EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sWDiookUDaIyxNSUo+ZW15UQ7ZbLs7tmOHhj7ymsRg=;
 b=qBqcNXVM8epP0hBbh+Xv7n3zFmeC0Zv4OhI8JQR9srYml3OYGfQh61+vG5uaYJ0xpb1OMFirap0zBTzvA8xcQxk819JsGJaOj9EGjBek8+0yoP1ch8zV/yWvIm0A3V8qtNohajR0bLHu35AG0evNZG4T7GsyILeVrTUczzY17Lds7UqImwwENdaKyjPdj0ml0W5jSou2S8SeIj8ndjrxeESI/5a7/s+x5W5njjeOwDGe6cu91EQrtONzlqeyrkGYsdiYlRpfJgeqGUoAuq7aHYEfjhEe4IRLEEWBj/D/uMk3OyECGE8tmNq+nOGnNBVdeoNk2hZ6GTT9Kka/I5CacA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sWDiookUDaIyxNSUo+ZW15UQ7ZbLs7tmOHhj7ymsRg=;
 b=JwL2R5kCbGcHRJ8aNKpk+JUKarI0SW2CkIyaK4s+Ov3+hvFCaesefmRVYEpBYEeChYn+J5KO5kh+br5wmlHhsa8v1CgdebbZGih4E2QLqy8JeaZjkE3UgJbSuQ8b1myULP4vPg+d4kHaiijx0CJwsDV1E5dFcLk02eCb9btV1rFQ/L3WqX6enDbyMYT9KOZABTCVjpjdrUrCpSRdcpp93ct+EWwNplgd9Y1g7y197MBgDtWvvEMOlilQV7Rdawf5SuLiBQ0Xg43lbu7jG9ngBnqt46PsVAOJTBQ4w1ca0faEzK9bVOgvtacl6AjpqZfk5h9j0EDwtso5HKYZutuVVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AM7PR04MB6871.eurprd04.prod.outlook.com (2603:10a6:20b:109::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:40:53 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 05:40:53 +0000
Date: Wed, 3 Jun 2026 13:39:50 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>, linux-phy@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: fix vbus regulator leak on error
 paths
Message-ID: <p5c77fejmivzt7pn5toc3bu46fkc6lv46gu3nmskbzhktu3cvt@qafk6e75rtkc>
References: <20260602-imx9mq-v1-1-e58b912923d2@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-imx9mq-v1-1-e58b912923d2@gmail.com>
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AM7PR04MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5f8b6b-9aa4-4369-b824-08dec132ace0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|3023799007|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Ad5t2jogP036P59no47/2d+XGeCEdP1b4nCUeBor+7xbc98hO829RThLkP93z4J+Nj5YyL6xbenRJhlNMIkM9geA0aYnIUjDZdvK2Hzf2OkGE0Eoj/c3jGNhac83rJ/hgEJn75oOsGnFPOU//CK043jv7m7K5jx847S7x9t2cItx2SmITGTkCvtw3ai0i9wPleXR+6P0fklshcGixB3Ps3J1jKgDwNHtPL8OVm7fdYVijP3iysPcfs1jcBkIW/sfd4IJDKE+UxK9JtlHBRwKABRYDkyxOAkTP2ab3o10dsvOJiWASZkGSK6so7/oIjeuxL2abUDRZnyYlVwYZKz445CNswXrYVNgEcttvl3bNZ6kiqqcmbdwPa8ddlPMMvjWYCO8c8sanHuLSZ0QWMBrGYxQsk4ACBIrtyIHB/57j6gnplC91PiVaWRGPQ5VZDFzvqdmxHd6Zj2mSJ+wdW7nnTAPYGLLN99ZZa82QZ8VyFQE+2aEiON4CTFLLI9i+8ywwFfB7zsOUMT8NMBh4fPnSfaW0HIv2RRTT3WTfPqqBTMjwamWh8Y2DZRjCu4X9iX17FScRV6Sm86SPB60Jv3weerej4mZxZVc/uNk5i78IH9p07y55EHriuwNYLXdKRkwQLA2Wu8FlqqPLKiOUjelUP2frwIpaFuFmDRVlsnhHepawvydIP+j8/5hiXCJX3emzpvTDZm7kOzwD13+7T5CRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KZdn7K6tEWQcp3Cgo1dvSj2cnP7xjWcWGLhw1GYinf6J0mqzzb3lo/CBAOmt?=
 =?us-ascii?Q?O2v8AvvJC7YsCwS/nk5U38JbA4A68Nmf8JXbMPaDitXv7JcJZcBqiJ2O1tJU?=
 =?us-ascii?Q?Jux1MQB6OtQSxIQ1fPlbE2pEob8UxH//F5tLK04A+4mrcxSDHQRrioqjyfNA?=
 =?us-ascii?Q?U84UKWo++iLN59JeJ4djuBTQtX21Srsg3I9yZAzoFrOTIPg5TbL2jSQVS86u?=
 =?us-ascii?Q?7H7aBpKb0VDv5qjsTqx4bGweLGCTrqHfU9CqcgLklGH/dOj/HzEd7t6AGHSQ?=
 =?us-ascii?Q?5bDXZQjgDbNZlq4B6Kd+FInq6hvtUNlXRhJmgyc97Nc2nZkFx0RVbSaWxY5T?=
 =?us-ascii?Q?+OTCvXLdjrfAoxTZ5/0/xz/EnYEz7Z5ShJRmX1fUkp0Rt5s4Dc2E/xklstMS?=
 =?us-ascii?Q?CiluB9b4RCfhX+JLul+zfoYuEHDz3xXzOW9TDoALT7s4LbiKsij9WJ7GQ2B0?=
 =?us-ascii?Q?OWkfrn7mlSXeo7Wotd/A/FBtCs8rj4heaXibeuMy0uvtTdq20ztf5HJFwQRG?=
 =?us-ascii?Q?kcVVz+JdEoMlxJaXNnvHjbNULdWdBQHeh7OomoqgOmlo3xjRtW/qcc8FycgW?=
 =?us-ascii?Q?xQK7TXSGPBKVGhUyk/gAwVgqEFu+xoDz1o3ufyZYpcVF5BmB+qBEMc28TO82?=
 =?us-ascii?Q?6M6d+wrGN4IQ2gYg/ByPsT75/C0y9a1ZYDqdJPzvwSyjCxeT/iMfGih8B/V4?=
 =?us-ascii?Q?/vzzZjQnuGwGtD/9zyzMgIyEsLcWf0mZDqGjcjVwkS6C8IHIyzULMpa9Kdgh?=
 =?us-ascii?Q?59iE5XBCt+s1oT7cg/0xLDkjmbb2TAWyOMIjxf1Z06yWBkzLfBtzocjhePms?=
 =?us-ascii?Q?qC95XHMs35AxL8oVDR+3xoawvjcG86Y0/QT+wrHrde9+314Alcmc8wt8OMjE?=
 =?us-ascii?Q?65aLpW7PJM7L17Gzsuc/3YE1xCy+wfeJWw/tGEDdK04vPcjoSx8ser/hThl7?=
 =?us-ascii?Q?v9XdlhZ9OBPvcssuf6bII+0P6BqPNZ7FgRJk2OC/eXPSEitdSFXuDYNPi5yT?=
 =?us-ascii?Q?JuZ3FAy8swaTaRnlgN0pfNNzpLGKVcB+oYqwNhymjjFt4HiAMGhTJVpuGiqX?=
 =?us-ascii?Q?u7xrtyz/KlX9tsOKaVBsYHmpSvyOvhUZOthhQHx//OdVNa/jYUFhqdZIKoEZ?=
 =?us-ascii?Q?TG3+Z1tZigr6UGeqGaQFScjorkh15YHgGjgxhDnzI95kY3uyAEc9p8Z/wqZh?=
 =?us-ascii?Q?2Vfjgt+ozvgqrktEVDK2mFb4nFOrlmw+ja2I63EHZ/qWm/tRkbxtoAvNcTud?=
 =?us-ascii?Q?KOYeJSiKq7+8PN9PaBZcBHQN7SG4NRD5dz0JRV0D8B4F60otxstM7x68kbC3?=
 =?us-ascii?Q?DGbaAPe0QLPeFqnb6T0mrcWp+L9TJ44Wur6OGpwRdHuIwGaHqBHumykN4LoD?=
 =?us-ascii?Q?rSKQMtxLBW2lsv0imqXi6aV3C1Th69kbwDIx+vMR+4WqSkil7PE6ovBZZYQX?=
 =?us-ascii?Q?CzRaRNxm/RVM5i6EkSEQXwL44TrIHDwAiywSiJ93tF+xFSZDszMawcw99jXv?=
 =?us-ascii?Q?jwpAKPbJZs7iD8xBfsUu38ymgGZH0OXXhQoR7MQ5DUx7gf+/Y+N4v5yvsi6a?=
 =?us-ascii?Q?3E+JFYAey6STHv+Rom9e/yDm+2Hlu/zHvM8k2YW2dyiJhvBCR5Ah12OXZpfz?=
 =?us-ascii?Q?zh5jFrsRsGKw3w0DDPfnbzQBH/TeMTV2jQLWGBDbZbh3n14gDn2fOcIsNabo?=
 =?us-ascii?Q?vT1bj9a0PfRBVC/duqGvd6Zgb94kLlwLAHHomyce2z68KAI7FcQwBs5ySVD4?=
 =?us-ascii?Q?0/m8ymviHsb8XWCtcE2iiK7CQuVDila+VUoBuXbk+0xbCiJz2M0V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5f8b6b-9aa4-4369-b824-08dec132ace0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:40:52.9495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/zo5IAiJgo+c1HqyG0q58qzUuS8oXpmZaanbtXVRXtvSy71YJSsPmvi2ERZ7X6p2ih4wvYJtNYp2/SogLHVtBPiZVNjDrsXeQ0EMv7CCqRBng8KwCQo/pTBXsYukA3u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6871

Hi Felix,

On Tue, Jun 02, 2026 at 09:14:33PM +0800, Felix Gu wrote:
> In imx8mq_phy_power_on(), if clk_prepare_enable() fails after
> regulator_enable() has succeeded, the vbus regulator is left
> enabled. The same issue exists for the alt_clk error path.
> 
> Fix both by converting to the standard goto-based cleanup
> pattern, ensuring the regulator is disabled when any
> subsequent step fails.

I am fixing the bugs which are reported by sashiko-bot based on my previous
patch these days. And I already build a patchset to add runtime PM support
which will move all clock callbakcs to runtime operations. Therefore, this
patch is not needed anymore once runtime PM is ready.

Please refer to:
https://lore.kernel.org/linux-phy/20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com/T/#t

Thanks,
Xu Yang

> 
> Fixes: 3b64ea4768e7 ("phy: fsl-imx8mq-usb: support alternate reference clock")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index b05d80e849a1..e45e4f16057e 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -627,13 +627,11 @@ static int imx8mq_phy_power_on(struct phy *phy)
>  
>  	ret = clk_prepare_enable(imx_phy->clk);
>  	if (ret)
> -		return ret;
> +		goto disable_vbus;
>  
>  	ret = clk_prepare_enable(imx_phy->alt_clk);
> -	if (ret) {
> -		clk_disable_unprepare(imx_phy->clk);
> -		return ret;
> -	}
> +	if (ret)
> +		goto disable_clk;
>  
>  	/* Disable rx term override */
>  	value = readl(imx_phy->base + PHY_CTRL6);
> @@ -641,6 +639,13 @@ static int imx8mq_phy_power_on(struct phy *phy)
>  	writel(value, imx_phy->base + PHY_CTRL6);
>  
>  	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(imx_phy->clk);
> +disable_vbus:
> +	regulator_disable(imx_phy->vbus);
> +
> +	return ret;
>  }
>  
>  static int imx8mq_phy_power_off(struct phy *phy)
> 
> ---
> base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
> change-id: 20260602-imx9mq-30169239b590
> 
> Best regards,
> --  
> Felix Gu <ustc.gu@gmail.com>
> 
