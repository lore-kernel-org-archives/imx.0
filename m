Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB45481658
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 20:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785962294; cv=fail; b=cX/IPEXioJDQ1ylqHo5WGMPzHal/VqtJvO63uEFSDSNfdRjdeTj4nHCre1pRtJAdxZySAAC2Z02b2sHDi6cfrmNlNII/YZuo85t/OPeGFi9I1yMeBMrgMkIFZ44wXxDATZrxhzMwUZta23c2QE2ol1k1eeclDcHgYznMPvYiEBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785962294; c=relaxed/simple;
	bh=6H6FqNpEB4YrQ2bxfy0mEe1fnniWQIyvrcOKyjy+rQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NZ8UNXkCzCHbz3oElH4gBKGMeeHj8V1LQCZv+UMP0IgMzgxSio+mBhJt2L1fxDV1QNc9Dl3pC51Dz+RnYt92avueTz4ngr46qL/RdcQKPGtbawXPu+v0F0QEu4bKJbQYgDYRpcQyd4Fav985nIjayACkmRTzcSIJ89m4lctye9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YbxY3R5G; arc=fail smtp.client-ip=40.107.162.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YbxY3R5G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E++/QZg5iZnYL8/zi5NBPu3MkNSPHV0ZBPX7zBU1QVaG9pvTlnIenAo8hIPScmQjjuV33CbGEZdO+4K0wgTjlaNbMA3+f+WzVTjysuTfc0OBOwM+qni0iebkbhLuzdYJ6C9Og00Gx5KTlR21SGsTEDly9EXK4fwiUvmtLL+MysjUmOj1xqZLnugmyh9SiKaaOs5exMu5VqydqI3DxBsNLPGpLR4yaEClNRyLIAdswh7TUDBZWxUkqdWcXyMIys7PMbOWsM/vFVFRN6JyVJJQlsnZsx8TTWcTyXOpkbM1smAi8ubjaVs9xqWSNhAGkuLHhzcYoXTZXlUaBtQjfz7RSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tdUl8djDDtfsxgflzJvap4G68qdEiLb40yL3qcJz24=;
 b=yoZyxCI2SVd5tRUFe6UPK5rd3cF+ywOYtzLXyZXTo8U6XP/pm7i67HP4Dz3I7lRh8AJWF7zCkLl5QRCklbak5b+JbcV1wmC/3igrzGkmy3H813qUajc09tyMOe+TDmRUkCuK/V4GYtzktVdeY/ClFCQoT9fSLbiMqKRFUBLprkIpOgZNkQQ4Fd9OeVFHCB09QOK9z9L/0dO0IwsChM4Z67DV6wXy1U0fxkqhfibnrzxXSAZY/LA0RChkrU87LZDJQ241VPaD2jliTX+NXpC7xOzZVfU2T7Hsm7TvmBk4AUsJOJAiADcwWOBoAzZpdmYy7c7oCmsnu8a0J47EBDHqVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tdUl8djDDtfsxgflzJvap4G68qdEiLb40yL3qcJz24=;
 b=YbxY3R5G8RyMMPL4kSy3xoA3gz76PihuzCxKes3C9u7GAFpn1NyrefTYprggiU9LYvxf7hrR/p1PS9bGn/PT5onte6dLHhwKQSEQNA03aXWJdQjWAuwofci4/A1+/xzNXpbIDUbft7PO5IPxh7uYVVtD4v3xLtJzgvIZ60abcqZqqmnJIEvJMKsGn1ufg8Jw0xQBvzWKElAPjcUQSiPWIGRYpk7Be5OjaVe3IRwfloZz7yiEss9SRHlmdEpK4GNTWcohaIlLmFufMLa/gV+LqdVJV/l8Ue7zwko7Bw1/+gTTKal7/m+GqSZXwjpEckdZU2eRvzBzlXBN27adgOaKBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9272.eurprd04.prod.outlook.com (2603:10a6:102:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 20:38:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 20:38:09 +0000
Date: Wed, 5 Aug 2026 15:37:58 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: tglx@kernel.org, radu@rendec.net, Frank.Li@nxp.com, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH v3 2/2] irqchip/imx-irqsteer: Validate IRQ count before
 creating domain
Message-ID: <anOfJgCDtezzSrJH@SMW015318>
References: <20260805192743.244441-1-festevam@gmail.com>
 <20260805192743.244441-2-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805192743.244441-2-festevam@gmail.com>
X-ClientProxiedBy: SN7PR04CA0152.namprd04.prod.outlook.com
 (2603:10b6:806:125::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9272:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e6a6066-6114-424d-73a6-08def331762f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	guG+PeR9r+EFSIoKvJ4dxsjxmrYFwKqSn33yR+Knue61sIkQiTjCdg6/kPqJksp7PKd7OghZ+/XRTVdkwJ3PZHx/dnpWJPmtadml8zF7n5yxFcwYtiADp58fJo65yCWymFz1FzfdoqIjj8gTEBOIbMLq7LtnAKEq9Z+ndz+tnSWI4HKxSdMFMqDvrpIjd9dJ/tN5k4xcxEIo1sfG/dgL8qLEO4Ei24bACqOFXjI+D5J3KcxDT9mrCuLhdWjBP5xiAVJMpKgP6nJjlzAUx6jwrl8LLRWIj/S8vxbYaUQQL3jZTf7+kicbLu+bmkTjSq78ZMUpFQVSam5UCnjzI5iNKqz+5v5hBnAQ2ntogu36LbwcvHVh8WvHAINOHyi1D73zJCyUcAvk56eh2Lw0F+3F6D8Iu/sxmEQnPMlXIbl9xzukS2RYBW8qOR5PBQHCTYbCDAyAfrk8jhOoaQmJ4mzxMqw+8/SMXbYLy8m7oerVZsd6tM55jvQ2fRutVGaV2MFDF5anYrRLD99tTYpzRg3PnLRtbxClfL+ttkLs7O2yfhVpA1m5xz1NBmnqMxLqK4FxERHGce8H32k3D1/uT/OvT/j6qz9OmwxXly0AdCOapmx5WNMxZWU8bNRVXJqPe3TnFAjorYOw3gcp97jsFSXfI2V4Jw1fnNpkH/6LMvR8AlM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7KpwYjAc4ZeLgLfCxkMc+mHnu278tpsDM9Q9sxA45jzWxs5VDv10GNFFaoXb?=
 =?us-ascii?Q?4OyeDujlZuB2R9UCLLXh4Cu1Wtjwc9CBlBcRrkL/N6dgxf74BKJyetEZMvCK?=
 =?us-ascii?Q?vFxce0/wrpyYE3fVkuGydz0wd+xwWAZ4cNPBRQSJk9/ECgN3inRnaVV3zHfR?=
 =?us-ascii?Q?Qej7K/1uDUbEP7zHV8wgNVWx5T9zObzsJ6Vtxeixgci3lvm8D88jAlSHdPlu?=
 =?us-ascii?Q?kqj6vq5T6eFiNBbHMRuCrbwQNGwPokMczSfNuRr6h39k3DPPWDbPFeswqzFh?=
 =?us-ascii?Q?1qkQRy+gx5XywXsLt5h6Y5sddJsON/u2GOlbJJOJW3+AW+4uSFUfhvtlX+ob?=
 =?us-ascii?Q?z3ovsZv2bYs4cqhQlTtov1hgG+/ZX40g87BX+eOhIiBKpVChJrjL+yFlYIC2?=
 =?us-ascii?Q?ikA70rQuTwrMxmlF0QzxKmvNwGCD1hO84tcHSzJQhVEeTRsqKiT1Vx0hzUDI?=
 =?us-ascii?Q?vi0fSC1xsp4NKDkzYGlu64DHsMatMmWLHxO2IIvn1jztjoe7jX/46YV5R4r0?=
 =?us-ascii?Q?UCdX/5MIRIw8piXp8bHk2a2J4gu7L0nbUtJBCE4CIf00A9avp2c15JS9nWUc?=
 =?us-ascii?Q?rOfNqIKy/dCH/eMhiyexDV4DPxhbDo4sz47MjOYoMQcGQp3hJrjIHtyUVj/z?=
 =?us-ascii?Q?dX6QpZWnBhowPof8WkbGuIsMnzv49O8Ic+2ioKXDyZUFYBfdiC0QLS7vyhbh?=
 =?us-ascii?Q?hfhHX7bDdqqwuUtB/rPO/0h0Ix93ugaN82GPtJewGov/Hh/j/dB/MQ7ybszC?=
 =?us-ascii?Q?BL+uld/pj3HD4eQMwLJZDEx9Id/IwKXHkr0YwJj+bpLj6FOuFQ+tXzPLtP40?=
 =?us-ascii?Q?7ka0wh82c9wN3VaFV5S7YwY1OxEbEL8+lLqsbFHaDLbWVJC/J10Gjd7QteWR?=
 =?us-ascii?Q?nrtt33Hago+e6p9Q3mOWpclYee7ZYERvIi3zeHK7L+k8GPKupUrv0w/EGC2Z?=
 =?us-ascii?Q?fKlaahvhDYsSbMRzaYMi7Cpz5ijavhWHm32Re4VhyFuDXGOvkOV7MbaH15Af?=
 =?us-ascii?Q?XlmhAnprbmBYvrOACPYVDTu2QK/HW8Ok0Y/AucDJ1VrMj8ud1RZ5p4woRtzM?=
 =?us-ascii?Q?o+6zzc5fXNm+Z8acCfHPDk4I9cddEtkg2O70etd6YtcM4X3c69gOIQRup3FY?=
 =?us-ascii?Q?63KJXn/j+gooNcLczZMP9x82NscXSQ2Ph2bRuJuDsU4gH5SLya6jXgiWIXnT?=
 =?us-ascii?Q?1j/YwgyXXCXPWtrAjYMcTXL/6q1Q9KKkiwmjdElmKlx1Oyki+C7htQ46tUSj?=
 =?us-ascii?Q?UOhSQqD1t8ZlWihs8wZ4DDSyQ2o9axdlKgQuhTcjqrreNuy4WJLuPm/oXdeG?=
 =?us-ascii?Q?a01k2meW0uhhULxcy/vgMqyeeA7dgmr8AgOiAEiXsYkrZVp+1+b1mB4wCl0d?=
 =?us-ascii?Q?BSXmNeHeOCrTptvCy57lU24MTQgsXfJlho0VGZRhYHyWXrofPor+gYC2ICih?=
 =?us-ascii?Q?N0yzMZ2h3FvctuwpCF7bAWid/ohDH8TTM0UBMTad7qt9SO8BZZSDap60xCra?=
 =?us-ascii?Q?LtH04M5bwM8MRe8IJlmQR/N4l6Ws0ilMND3cRauCvyaETgqsEBruxg8d7eF1?=
 =?us-ascii?Q?rnhzU5MYmkWVY57mUXXPiuN3dU9vKWmVnEot5sneh2Iwj9TLzynOmMK4tysR?=
 =?us-ascii?Q?JtJqc/O8ybXnc9IuOizvkpr+/0krwTSbuWVlmQKs1M/EPiMaMmTRmZ4mGo38?=
 =?us-ascii?Q?1gTUhg7H0pU2niDazMjLz3B7pksqNHuZF1wlq8swwaJK5PID7cC6aBzhq4eq?=
 =?us-ascii?Q?oZqjlHa/AGyIehDlSA4GLZw9E10sJ2d8U6oMPrXxBJWLlG04oDEl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6a6066-6114-424d-73a6-08def331762f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 20:38:09.7444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eoc6gUGQYOi5WokdFUOSOKmteomqPAIoZfkbDpRBvZJY2YcQreHqSMpJq+uwL3XafOF6gFBIz63v1choS2JLNqHywJyPffaxOXx2jL/xigQultax2rHpMmaZ+XCYPWSk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9272

On Wed, Aug 05, 2026 at 04:27:43PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
>
> The IRQ count is validated after creating the IRQ domain. If it is
> invalid, probe returns without removing the domain, leaving its host
> data pointing at devm-managed memory that is freed on probe failure.
>
> Validate the count before allocating resources to avoid the leak and
> dangling pointer.
>
> Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes since v2:
> - Newly introduced.
>
>  drivers/irqchip/irq-imx-irqsteer.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> index 653e25115083..55aec60dee40 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -217,6 +217,8 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	 */
>  	data->irq_count = DIV_ROUND_UP(irqs_num, 64);
>  	data->reg_num = irqs_num / 32;
> +	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT)
> +		return -EINVAL;
>
>  	if (IS_ENABLED(CONFIG_PM)) {
>  		data->saved_reg = devm_kzalloc(&pdev->dev,
> @@ -250,11 +252,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
>  	}
>  	irq_domain_set_pm_device(data->domain, &pdev->dev);
>
> -	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
> -		ret = -EINVAL;
> -		goto out;
> -	}
> -
>  	for (i = 0; i < data->irq_count; i++) {
>  		data->irq[i] = irq_of_parse_and_map(np, i);
>  		if (!data->irq[i])
> --
> 2.43.0
>
>
