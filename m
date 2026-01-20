Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DB743CED7
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768926551; cv=fail; b=dS0+plAKx1CTECC6l4Q++V+cD3ggRZ25cTvkWRoqXnDSr2txYqZ13hYcsamsJlq3OjTYTom7G7+hpibIUOo1hnhSIPUTWL/PnjoGz1vZjsKOYJm56Fibf+iX0Db0WLwUPPvkNqGdXx9R9SClx3H2i4iWNJqxKfz0LiZGY2XvTww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768926551; c=relaxed/simple;
	bh=3vDX+cUFt4FP0Wb44p0qfLowwFBBSey2fOCsJzuCR94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qVGYKZE7cRUxK2t+hJqCOlnmLGa8MbP+tT7D6CnjTrFg8X+xK1+oZAoGOHDXKSQRjaFJCRAYL1s0vj/WC3uhtbIRT4dplXnAYPSExKWzfnqnzlSV2d0LUA+LFPqUCBMS4yJm5ryujYozMrPOo+d2+b/B/IwLveavLqCdeEADxB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kY8u4/qc; arc=fail smtp.client-ip=40.107.159.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kY8u4/qc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o3PUZ4UU/ssYCH80IUaLqNyuITw69j+lTr+lrrbuRyaaqKhmnQP+83UhNUbcweGI8k5jGMTZx3R2bUKJFt6FO4G4x8rFaVsEiXByhRFu1kGsaKar4sp3c0JHSFrz7dYTe0XzdZHhnYPj4weoPsK6Wx+xBWgBrJcHfdruF1S+6FmP0Hd5OnagtMT3Vv+mrzx724sRPrwvjgKqgij71sBU0jMu9VsAY667WnSnXYBjRM3/p7H3cJiep5OF8ljbMkcuA68ggOMlydO7qeasFw6O/aB02GPeZg10LmRbvYaQzn0wAJwnRRekFcjYxxINqYTVxoevaSoSkowwJ8H423IkZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0SS8GPc9Gld1n/1MQEph6KHI7+Fvesu07AbOUg3jcQ=;
 b=ZpZPU5fF6g/RWccrg6uKI+OfraicE79yFnvGQn6v+n6/avSE9/VGRh60ufutRdvDRRKYEyJ6zYoxbu24g1WrzF1KffKM9lUbt2Vsz9rbYISMzSuwenxR3Asi+P6tkPRZtb/GaM7eSgr8lv8cjb6TOZOmdd43qrSpuAi/j7my+VVsQAjQffZiPRDMC57x+qyvjnKB56w1OtNeBFdcBo9nckpwWxAgPMLnS9C/xBqOM6qZ/LgkWygU4bzRJZyxzayyetkSJmDTIFKrDf8GC1r+E4Luqj+fbgOZoaENeU4IrPYj2X+xJAIyJOop1ZT+0R0rW5CwPaKZrFcxxAzs/SI9KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0SS8GPc9Gld1n/1MQEph6KHI7+Fvesu07AbOUg3jcQ=;
 b=kY8u4/qc6DgGJTlbLRYph9p0zeSdl/mfHLMsf68BhMpxzJGkzpuPHcFUsy6RZZXxUfrXD1GKRpKE/hY+lz/ZbG55A0MUz5YWteYwXzPuWgV5HrKhp7IhnLZJ5K3w5IqbDFUly6ixYH+nXOJY2K8kx9XOxAswugtA7p4Puq1x/EFrAWeSjR3Hj4ZKgTqNGSFn727F4CVtgoXQu9qHMOK9cSbmDVYDqXGeCqECSeNXyaLOk5SnQGuaGmnZsFegAFl5n4Eetr/2jdOgMRuUc8YplV4rG8R1Mszj3x+HMLj7xhW6slgTfHVXlWgLpiIi7d6gEKyhHeKb6cepBC5mj1iP/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB8902.eurprd04.prod.outlook.com (2603:10a6:10:2e1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 20 Jan
 2026 16:29:03 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:29:03 +0000
Date: Tue, 20 Jan 2026 11:28:56 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: disable bind/unbind platform driver
 feature
Message-ID: <aW+tSO3V+MEnXeu8@lizhi-Precision-Tower-5810>
References: <20260120111712.3159782-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120111712.3159782-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c991b44-d170-42d4-b909-08de5841065c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fbsgNuEtw2zUUjnBkXeTlz72cfq0nYUXCVlQuC8lHEsH6NH1MqAGJ9Fd40py?=
 =?us-ascii?Q?c0JAK1alJeBu8dvDVwP7IiMjQ/CqE9jOUmPgy4fitjJuu7Aw8NizW4QEKm3Z?=
 =?us-ascii?Q?jm9NH2W647PVMgHzZ1PXoSI3/3Yd7s/3x11wdXPSFnxBvHqgInGXueNhGvUD?=
 =?us-ascii?Q?c1XMYoMp6kA5exKHlFaSPTeViFBa22yai/+XvCUGhCUDUw4Osz1kWX8DMsB3?=
 =?us-ascii?Q?Dova/hqUxaBEvjP1pskS5JCjCoWaNK/jmuKFywEeiffJBm7WAKwWg4qfOKyi?=
 =?us-ascii?Q?k7EqEqJm1XlPChQFIs/k/0sXz2u41GbyepDK9VdmhSJkj55VV/WjcZWlo6yA?=
 =?us-ascii?Q?+NFSC+15/bSCHEbovNt41FiVxnqFkg5KUGBLh/2s0VrKfqoBVcyPnyrcfBpO?=
 =?us-ascii?Q?elNQs0qNQ3FLZsZ96howfubRnszuWljEGosvpEGJeh7r5/TMJdBXf3cUfe6k?=
 =?us-ascii?Q?wByQstFt76484tb0zVH/1RgBnhQidmNbEizCFHZOB17L5MvVh7PhmWcx5chL?=
 =?us-ascii?Q?ZtoLcFHK6Y7Nxohh8pjyirUZB3yrL6uQj7YV3oBXdK5jCglyXryz676miHdl?=
 =?us-ascii?Q?fLncmhtVwVxXV2fOSKwNwYXdxeKlDPYMD8PJQyBw5//WzJErCOtIELiHUkgB?=
 =?us-ascii?Q?DePcZX41d/QXRwIuHZYSgLg3RPPeu4x3abowE+KGwl+Wyx8vQodsD2NB0+p9?=
 =?us-ascii?Q?ROY1+pIMoCDFm5ke0Np7s8vgdjO+VHpTgUBx+P2uCaVfpLOIfxXOdt8KSJgP?=
 =?us-ascii?Q?lqQrbq99pDJ1n/k97XAUXwJK/VJ6QB46b3lwUBm3kuPTzM+WZY8sQQnyJ9YH?=
 =?us-ascii?Q?rFUFUShRkCmtjsyTOJy3LM8v/4Tvql2zpctGcHStfpu2h/Q41QNRiVj2F8xL?=
 =?us-ascii?Q?NcoYXBl/E833izkUslZfl+lKLR8JFbaLhAtWbL1jdXSzY4xDUN3e3+wDvbOu?=
 =?us-ascii?Q?zIxbN0gvYUmpNO1f2Zim5jtpadXLgg4swj6StreEdOtDVlGztXS5ql9J9Elq?=
 =?us-ascii?Q?0WxywRvx/xD46+ZQuQyPLSKLFdrhOCpxCrpDemHGQ0LZrhWZa5UWcf12oGQL?=
 =?us-ascii?Q?m0nq/qfCqK6Y+eFCbJXlgOLJYw8gqJ3pM1pOclOHbWys8omB1RMQ0tB+tR2n?=
 =?us-ascii?Q?qqyrN184Kj5hz+ixyG3SoNfQYAYZG6/d9UaTctq/wTYn1E6mYH7RxoJQDMHk?=
 =?us-ascii?Q?iUgVBiFZ7G6VthUGjZz2pj8p0+sXFwOL6Vnq0VirFVZ5msCoqJDR3HD+GVzx?=
 =?us-ascii?Q?X1ra9HI+T/4kQ388YGD7sacGKCEfTcj5ray7djOHy4T63tVrh1bE/p35sgrA?=
 =?us-ascii?Q?94ULA8oQU5skKsnFrQ6On7g/LVB9xr/gcmcgL96HGHc6isTyL6JZGUSIMp3E?=
 =?us-ascii?Q?PgRRMfpW0fDJNP4d+nAmflaKsorSdglCauUvFNegxFwh1fid8e5z7UPBQYcj?=
 =?us-ascii?Q?hrV+jTJTCPgWyTMWwM2JqXxMCXcUQYfuu58yZGh7Ggxsn7ZP69MyveXRe3UJ?=
 =?us-ascii?Q?Rl7uWRCLcciJEOW0vm8/3YHRbl+bXttTc4n0MtBYhe4jI3+WS82pjGyWvuwi?=
 =?us-ascii?Q?AWtj+WaQcHAZz1x/Dv9Qu941SvOEuMHnLLm3ToHCe1r+62ht4ct5lgzDGKvC?=
 =?us-ascii?Q?CLewx+7H69BV6CEHae32zXM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mw1KA3vslJCt3NM3i8szX+B0YTRPGby7vVbukTdMNhRAk77oKsE4WFO57kLc?=
 =?us-ascii?Q?+wG+VfspwhHtLe3GyU5Zr0ElYXdOgeX5oQGmNbBsnQUjtmxlppKgvmrWSnjs?=
 =?us-ascii?Q?o1BryiTjpJWqGFgwEUSaGvarbgdcmEY8bGmL4zYqIYj7Bkc+G5WSZKopMqcW?=
 =?us-ascii?Q?evpD/hV83V17tr/1LK+EaIzZhBezdxPHMjt6Ns63nNH2W+MBTEIVpGaXvfyN?=
 =?us-ascii?Q?0zs5vE0gi04ANCBFMiOJ50Atah2djgkXrZuDfkZQ2S/HmhqMYDP3wan9Qv70?=
 =?us-ascii?Q?TEjDYWJvAQxFi0pe/2IpZDhHPg7e7HUv8u5+L/zjJ2ZoM1J9D1WshKXoJ0cg?=
 =?us-ascii?Q?odLy5/D2ed3ALzkHqDpGSpD9WMtH7QqBrqmzZJ7cUcVXHyl07XhDD9E8yoYi?=
 =?us-ascii?Q?lfBUuEWBSz8ygOKsUNoAYJicdxKumaSa4QVpERA/I2NObRbsshNvHfynBgeA?=
 =?us-ascii?Q?xnGHRlsyLK/oW1kAPWG98MiQNt6biZNW9n+hceeJFqcq5c2/MDRTRhd3giYS?=
 =?us-ascii?Q?Bhq6fKL202c6UW6PNWUrNicQ0es3yW5qAUvSdqZ6UXFt3SMxaUL11aEfjPOx?=
 =?us-ascii?Q?QNn+xAjG1Hfz67wNfCrtwc4BniSiVe/LXwZy27NhqMmN+fk0dfisw9F1SS7i?=
 =?us-ascii?Q?B6KhAps1S1vfwtKjhmMr/MGyvuc0UfabGSuvDQG2R0Xtt2luvqbzOY1sNHzN?=
 =?us-ascii?Q?KwZHzAWyeSu/UkRnEtwy0Ps6cCGDW5tRGW7pvxCqj/hqV73/OtK71RCIZXXL?=
 =?us-ascii?Q?e9RlTYXYulWgOVcfLKxAR12ibvzZCE/VQ2DayRonl3bsbU59i/tRmwz50Hmf?=
 =?us-ascii?Q?oE4970zoeormjdLnOg0V6h1aMzSfkEgbuGW3yvO/p4GE58mM3mPwlz4EQT3M?=
 =?us-ascii?Q?K+Ijk8LhW1H5SnjLQeDnv8USLsdoNJN3+MlWQgQPTzd5EauM3rMcjq5Pd/oG?=
 =?us-ascii?Q?8BxHV9Jh0ukp6TyOIfAx2uDbiQTr2to50PJ3iQiQ1Sf1TQYZDG1obae0wwF+?=
 =?us-ascii?Q?09iiCxxAetEG4a9XjJO7LCKnac3ZW++WMtR1OtKfntiNvMvSDscFuyRAmwLn?=
 =?us-ascii?Q?MZwuWhh4zYZhDg0DcLZtf1qd9NmLaKB9JYbVIKyMOxhCjb2l7Gh92BAyIcsK?=
 =?us-ascii?Q?yp6n4rh9La2ZIik7rpeeaXwabe3A7dTCUnyafuTuooRjQOHmPXqADpZxflY9?=
 =?us-ascii?Q?FcTGYY6U52zmnJS4Y9klXJfJVXJbeh0oFcOcfHPwuknQaHQA3h9jo4j4YUvi?=
 =?us-ascii?Q?f2GC8CSEuJhEhKXQiyRYN6Ub+PYimOAo69QuplSnJkd7pSi7dyVdmTylw4uo?=
 =?us-ascii?Q?0T5Mb+0Namm1SsTzLhm5ICMJHA1IuTfE9onKIJk5jc6vhY8KwxZjhZgrMh4m?=
 =?us-ascii?Q?btoBV6Pusj/L9HvE/f8tQXlwHMCsJmEKGMF3ONJjdYdpPVV5KZ8NZBal95hA?=
 =?us-ascii?Q?HN2w632Ka1S7GhyH3wCjCtFNM2odYC0xfBKl7sRtOx9MjLDwCACfB41uHOLU?=
 =?us-ascii?Q?oJjwMYYu28ZRUFRgcinSibNN1BGidY91/H4YCY2m8TLiaCV+CCT3v5STIbCy?=
 =?us-ascii?Q?o8m+MX4B3G2J+SEXzLVX76x7ShuFWrmcrYuwNjf6R4b45DsLOQ0oxtHxjvZw?=
 =?us-ascii?Q?klUmLRriWz6lvyR5mfjmDalT4r41/nLfuwIaTCaPATklftU4oM+bL58ErnPv?=
 =?us-ascii?Q?Lscoj+rkHR0AGN+FxsYwykoch4Kd2NbPk8vjR5rC7ZFvP5J7miQAtmU+LDnI?=
 =?us-ascii?Q?VG82Q4YSPA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c991b44-d170-42d4-b909-08de5841065c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:29:03.6941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNgl0Trvy2BEEZnbxWtugFMi0Y4Y3p/md9bLBQZGu8SHyqqz5qIdsrRHzis9Po95qUGT7nO1tpvX21RYXg6P3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8902

On Tue, Jan 20, 2026 at 07:17:12PM +0800, Xu Yang wrote:
> Disabling PHYs in runtime usually causes the client with external abort
> exception or similar issue due to lack of API to notify clients about PHY
> removal. This patch removes the possibility to unbind i.MX PHY drivers in
> runtime.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 028c4c9dea40..abfa6ac3ae3f 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -837,6 +837,7 @@ static struct platform_driver imx8mq_usb_phy_driver = {
>  	.driver = {
>  		.name	= "imx8mq-usb-phy",
>  		.of_match_table	= imx8mq_usb_phy_of_match,
> +		.suppress_bind_attrs = true,
>  	}
>  };
>  module_platform_driver(imx8mq_usb_phy_driver);
> --
> 2.34.1
>
