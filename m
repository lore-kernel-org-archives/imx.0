Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011013.outbound.protection.outlook.com [52.101.70.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9D432E15B
	for <imx@lists.linux.dev>; Fri,  6 Feb 2026 16:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395413; cv=fail; b=Y0xry0rNoAUNIlXncFmoDCtkEKzCvI1FRMBPKn903oByNzgh6qyn3xRPoppWAqGyB3pO9yrT93ziGoQPb1FDF6ah75aWnyPo9S+sjsQqaihQDlomJ2s8Wcka08orEUmn8N0OoPPxCSM6UvUmaQLy779FTD3zmcojDzNOPic4S2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395413; c=relaxed/simple;
	bh=UnK4McqcNbOujiElCGhRElwkopEssbBgR1N+YztICuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uke+TaN8XrzN5T+cO67O1ayQRC1CTOxAyFa09AiuUq/HVTsACEIHbVJSUFqDDjrV+YfW8jb6PQ0Mrl8YbJHb7dJK+k2NGYRjGewBrDQDBid0wdFwoWedHzd4dTZVe5j3qhPOp5Fs2HcEDqWO0Y/xYAbeUONpLJ/LgD5DkXDdxYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GcJPaRwQ; arc=fail smtp.client-ip=52.101.70.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GcJPaRwQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gevZGuHJE2SSvcI5uYfIA+Jk1JHMQ3VJXCw2bqHFUpb5qmpDciLGd3Nwo11HhuCbpbo89Ws1GsmuUmORvUQm1FGjQfueKPhqN/WvR6GlNs5PX4oJpC790lElyqg0ARx1vIg/erKOdd7YHhkE7nHlnYw8i7P2jdtb811nLjW4rbM9xmLjC5PpNgCPuAzQXxFcNxUghLyabJ4iMv5GaEqqhAorMIIj6r/N6eI5TReWlh8Mo93dGyzxvy7xNTABjVOzS9PsPVyAESdU+LXUlXYYlMP3yV7nX+4fbXZ5RTgEDSxPS6fZfFsf/NzJ0tHbZL6O7JbQIIOHx5/SzvrtAoO9fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPmHQ8hFXCaT1AzPom0i5Qt+bIi9ZV8R8PdFKWgixeY=;
 b=J3Iy6Scg6inSaBoJmyyJRb2j0Bfhb6XuFKXRY7XAyOPBxB2WXeqaRpRZ/DIJGfUNM9Egfc0J1RWI9ENatsGbOyl5mahSr+3YMYrIf516ZqFmpMp3oU7WbOS7BSnpET34iIzpbyXg72LYF1kFZqbvu67X8QC6bHBmo9EqSvdp2p0MIIhevdcl2Tk9gtpKkvoKAgfGcwWQYxkK8X4g/gTuY4uLB0H5iAdHG5o9irPzZA6kpcX+p52lsErNvXbYPUQVJx4B5RnfAjN91uSCpIRd8Hi+Cp7wnYC2H3AgaVvs+oERoE+biHCxannvWm1XwGMCCc6hZP0Bl+Ird0UCdS5++g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPmHQ8hFXCaT1AzPom0i5Qt+bIi9ZV8R8PdFKWgixeY=;
 b=GcJPaRwQngwkrnnFIx1ToBm6sGRZIHQtMrNb5f+T1cfudpbkA/hPFA4jaMIdF6GgPC8C8p9TICcCGFfI6Wc0cVfp039CpRz5i8r7XZ4/c28QpAQzhIpUKn4GHLjxg9XFWZXz2U4RdAhyb1HOdXlOuvLX3AXdc3UFlE3uxYA8Y/LNVPTIGrIrmJnKBgJTL6jLYFNw4wt80L5cEc7RsX2E9/1CuybcVajQn/l1THsDDgXlJuFjNH5L0D7Uh1JoLrw73SC9LXkPO82QkxaJX+4k5WbS9edBhKXVsX+iW5DjZM51ikpipwqFPnFI5rFrjsFcl4kxdS10sYLJiCwUU5vmkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8843.eurprd04.prod.outlook.com (2603:10a6:20b:40a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 16:30:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 16:30:10 +0000
Date: Fri, 6 Feb 2026 11:30:03 -0500
From: Frank Li <Frank.li@nxp.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: p.zabel@pengutronix.de, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] reset: imx7: Check return value of
 regmap_attach_dev() in imx7_reset_probe()
Message-ID: <aYYXC-aS2UgFxfLl@lizhi-Precision-Tower-5810>
References: <20260206050109.119348-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206050109.119348-1-nichen@iscas.ac.cn>
X-ClientProxiedBy: SN7P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8843:EE_
X-MS-Office365-Filtering-Correlation-Id: 8afbac9d-a96b-4e6b-99f7-08de659cff0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mS5N1DHaW4SSzjmfuj9d/iesynVU6iN7PdhuejbGVskf3CQczkAmhArI4bCd?=
 =?us-ascii?Q?uBRcv8bU9aGA3Ez5I81HK4QzMl38WOmDvTUBrRoWIV4VqlcBvsPeraEgtF4H?=
 =?us-ascii?Q?zSVTRAqbO+D/ab9u5lmwWBdPGCTYRe82dWHpzjiDmpoQ69wQY7q1ys4UOUkn?=
 =?us-ascii?Q?UxEFz64bYbIyn2IdeQFUeEBDsXPyjpSjvgYrF2cPUqbDxXdJYY0ZH/ldt/yN?=
 =?us-ascii?Q?5WxTlP1stuZQNCn8TiQuPLCYTaC0svuuByhQwb1kwkW3hVFOg+O9Idojjkm0?=
 =?us-ascii?Q?l0IO6E52HpdlDWcbl9KdSXVYMNEHunfvJfc+y/nX3oN8NQvQDgDtXY8HsOyo?=
 =?us-ascii?Q?lVEnQFCvIsRM2Hqb2FqKNwOJ0Mb2fRrNjFUkVsYB9nv4UW42tPBgQCgeFlQ0?=
 =?us-ascii?Q?FJ2aazV4ltpoi9GFRT9jBLt2B4G0uwN/d0z6b5KlOl6DYoLX9npUBj3XkO2T?=
 =?us-ascii?Q?3IkDFF1ivEK2RRoA4wxhhQd7LVgJxXSTdaZLq3LmKy2H89OOEL6l4N6qTC71?=
 =?us-ascii?Q?5m8an7PlUdy/bCGptI7YE2Csuk10Bb7rJTUGbsp5vOSOXlRIHW0AgrHNUC9j?=
 =?us-ascii?Q?p83BQsdyffAMQqcg69iqGlsOcJY3XBRMnz3nDAZvJA1RWaTFJKOCQW2EuT1F?=
 =?us-ascii?Q?MVGbPCrEn09FqRTxaT+hfIfsPvrfigBomgpVQFg+1+q0z6+Qaydn+YDhB5wZ?=
 =?us-ascii?Q?W03lh+8oZOwPsdVDMPvcP4Hmb3nYRY4WrACmiVzBK/ms/I78HaBCpbLfegCd?=
 =?us-ascii?Q?Ugzc+1unsuep4Ql5fgpjRVz1G+A0zGx16ZJIzs0TGZqbK2L70TBm0+mweV01?=
 =?us-ascii?Q?nj/AxjEuXkIWsdweMmyxEFi8pkppF71hnO5dzao6nqfSVA4upRngNqpJhINN?=
 =?us-ascii?Q?hG/pGEYk/Xr9nI7J9Ki+VoGq0IofziABlGKGs5+IIoxv6YeHhGkok/DKjFXZ?=
 =?us-ascii?Q?cpxltrZOgAwR8aiA1G7wkraLmNVOT2nSsPH2b+mKpyH0wMAAG2dNN3vNAIq2?=
 =?us-ascii?Q?OY7b3g7SYSKeGS5Ril+zJpeOPzHgRjuiYT5E3mLIbGeJwMPCaM5oKLbHcvY0?=
 =?us-ascii?Q?fHwvptuxKw26J0WDl4YjwLuIdNHXTFdKn/0TXv+rcECVv+hds75P/KjVX0q1?=
 =?us-ascii?Q?N/2ZvX6Zxt1FWJsNPMGR4LEf35Ra5TOvmdL1FIpCroDGuWygkwgj9f4pRTDT?=
 =?us-ascii?Q?MMGcSHtMPRJID7Fzxxm4Ke1ftvcvmvZLe/Oevx8R6594cSPDZ1Sg/HUPtvu9?=
 =?us-ascii?Q?9fz3knF/zexqRSGBThq6d3qOXd8VvnHY0co8XuLk7xxa3A4SmENb1T4Dj+8C?=
 =?us-ascii?Q?2oIRAY8jyS8OyNk30d5qzaHkoBtjaESgt3L89bSKyZH3HN6z47nCVhql6kJY?=
 =?us-ascii?Q?L1IS2Llk1u3rkgjEiIG+GOaaBbzETUqS9MwN5GCWdByx5tYsrbFeuCy6ASFD?=
 =?us-ascii?Q?PC2OQzyMxUGYPwQ7AUgwYyVrvyoGCiPecW+c77XX8l2ntUn6lekjqT6D4yCQ?=
 =?us-ascii?Q?Jnzqsj5SfbgbXj7MzEVMp9Pjhm/TpGqhbQPjN2KO6RiWbaaVucVMQqNMfaaE?=
 =?us-ascii?Q?MiWOjwEEnyMaV6rR2qL+mnoKspmN3b1nqshZJlZkpTKUyP8tK/EmzZ8S8wpV?=
 =?us-ascii?Q?7r1IEk21oFm2nhPidIbCmW4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GE7GynvlpjaT4VPQwsgALQiJyBpxvw0jVokjIEl/uamRiKvwBqndJYKvQUbW?=
 =?us-ascii?Q?Bv3QVWWK8+7bYs3xE9Or5oYPrubAJXoQL5TdyjDX0+3b48er4KX5blr75S0w?=
 =?us-ascii?Q?8klF/2kvQOLcJHf8gBAc0suC0yd9cnZZPzDmR+cmkCabW5WJ/m9JgqeoNuIe?=
 =?us-ascii?Q?TC49A/Gb8hA0am8EMf1AlrAa/rhmNn3ue0ZVDKPBZjd1/JY2cdoaTSEJdTa9?=
 =?us-ascii?Q?ELawL9sY8Vn/rbVnZCtASKlMR6OAGFYXM+MNT1faN2ZkWeavilgLNUrNy8ie?=
 =?us-ascii?Q?SHJyGHIF26c137ELSTrOPZuWxRIg2OTaBABE1kki/Vz+UGHACqYx0UlTxIbz?=
 =?us-ascii?Q?6zc55+Lsi7CD5W5dyb5mUuc/ufaI7OMu7IW5pwud0eoCKzNRxRb5hQ/GrNaB?=
 =?us-ascii?Q?/821CTGHTkGpkLwr4GMzfSW5fe6BGEq3KuNN3o5W/R/OK3koe9qdFesEcI+z?=
 =?us-ascii?Q?NCNTycYSPxOoRFEodl/4z+UgnE4gsdbpo3aqooyCQwfvqBh9KS7E5iAA8T7b?=
 =?us-ascii?Q?d8Yy8EIeJ4r6bwdWeAHYrbOTyzTQ38qKJmbtFEOagsIu1E3NJsHQ/07Pl4Tc?=
 =?us-ascii?Q?hOie46Hv4RYYT7HfF4bu/cMAzTrSLACKVH3V3ItByH0ZuNF3rdaBphHL8KgO?=
 =?us-ascii?Q?H6Ojk4emHpqRagnC+1736w1M9+6aFhFsKe7eAi7LxsT4d7Frf35s1zrk13+V?=
 =?us-ascii?Q?stEklFaHIDDXH+AxnjEn9C5TnC0Wq8p8mpoUwxED60pVcJOXBk/dwMqsN+DW?=
 =?us-ascii?Q?AaYPVq8a3kvMrjo80HFBeMR914ecxM6ctVc5POXRZllZtYHYSCJ1+7VZpb4n?=
 =?us-ascii?Q?kvwL05o/3P0COerhJ4SE9rnCP2EkMZLbjjUP2ZDNgM7DKmvpD3IpVUZPMMUf?=
 =?us-ascii?Q?58G3xB8YqHDOrlBYPR1+uk7iYLwPeYb9WAHhEoTFaKrHmrw2Y2zfdWF4Sm1L?=
 =?us-ascii?Q?JXGS3aJ9I7cxNL3oUscX2ZSV4lWjZzf29FD3E4teBb8YzISAGJit/+NNbPqh?=
 =?us-ascii?Q?q3cX1C8cCZJQtIdVHrHA24VzusNOstKo21YGvazzHuSWRus6U0/TXhHns5eJ?=
 =?us-ascii?Q?DQvIKfKs9XIqkqn8NeGNZLN24kr0rSdJ1aCdY7EJtCXsuH8nbB7bqhIkyo/s?=
 =?us-ascii?Q?2pJ7s6USU8rWALMoNQnl4D+fg00OQsFlFqX3im2s1kPCOzXOJc5xvFP+5lMz?=
 =?us-ascii?Q?NKisLn80iJE3E5VVo7lt7WlaSFNgxN7h2wRrRzYdZz/9OySD1TEe059tWszq?=
 =?us-ascii?Q?KOehcId5naAIprdkuJ7BEW65iyGjtvBPe8D6MMf64D8p6Y9/v8nUIZ/tmoo2?=
 =?us-ascii?Q?HtRHvY1qu+p5x4FPrGOKqRqAuOh4rECZTmXujvDLVCsxBlhbcyLqQQDpRz8J?=
 =?us-ascii?Q?WBZgnPM7lVanjOcViYnwYKTUp4gwLaq9Kyh51h6vImvNjCKgw5B7VAUutFrN?=
 =?us-ascii?Q?41WJbFfadGjvQ1rhPwE4RdYRfqYKHX350K8LQqXFrr7TiJwvPaj18CJAyEjy?=
 =?us-ascii?Q?iaPu4oKWUuVwaeKhMfu+gZqNtGLFAuLdL61p4gf9BqEivL7A1mW9LLCmlPND?=
 =?us-ascii?Q?e+CC15txk1Qam0dzc0KF5L4BeRpXqm3ehxh2qaaFUTajRKXP1DBs9HRr/72n?=
 =?us-ascii?Q?/OY7+Z07YXdnNEsNlW0IukjgG6RVQESKVd99b3UNpCc9493ZmLMn2Roo44hs?=
 =?us-ascii?Q?XWkHr7HeG0dKh5CfPgyFOt1rv80+vdy+qyrcXZ2vORfRW1kv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afbac9d-a96b-4e6b-99f7-08de659cff0a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:30:10.2692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8t/h8ocwN+ieYj6jRNe9QWvX4lt6b/cSodP2lWNHowavPSB7tI+baB4V2I5zwBUt75ER+m+nnkl5Di8z7e4Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8843

On Fri, Feb 06, 2026 at 01:01:09PM +0800, Chen Ni wrote:
> Add error checking for regmap_attach_dev() call in imx7_reset_probe()
> function to ensure proper error propagation.
>
> Return the value of regmap_attach_dev() if it fails to prevent
> proceeding with an incomplete regmap setup.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Changes in v2:
> - Simplify error handling
> ---
>  drivers/reset/reset-imx7.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/reset/reset-imx7.c b/drivers/reset/reset-imx7.c
> index dd01fe11c5cb..a1cca926085b 100644
> --- a/drivers/reset/reset-imx7.c
> +++ b/drivers/reset/reset-imx7.c
> @@ -364,6 +364,7 @@ static int imx7_reset_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct regmap_config config = { .name = "src" };
>  	const struct imx7_src_variant *variant = of_device_get_match_data(dev);
> +	int ret;
>
>  	imx7src = devm_kzalloc(dev, sizeof(*imx7src), GFP_KERNEL);
>  	if (!imx7src)
> @@ -375,7 +376,9 @@ static int imx7_reset_probe(struct platform_device *pdev)
>  		dev_err(dev, "Unable to get imx7-src regmap");
>  		return PTR_ERR(imx7src->regmap);
>  	}
> -	regmap_attach_dev(dev, imx7src->regmap, &config);
> +	ret = regmap_attach_dev(dev, imx7src->regmap, &config);
> +	if (ret)
> +		return ret;
>
>  	imx7src->rcdev.owner     = THIS_MODULE;
>  	imx7src->rcdev.nr_resets = variant->signals_num;
> --
> 2.25.1
>
