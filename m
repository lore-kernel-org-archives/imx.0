Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C3B369201
	for <imx@lists.linux.dev>; Wed, 19 Nov 2025 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569144; cv=fail; b=SqnVaE3Nkyc0zMRafOQsqbJ47Xqz2hLpgDEOZ+4tOCJc0F+xFxZVsPk4QU5FJkBa6JElgecw66logghKClfmjyHR0Bm+lMefCVaDU/N0dO95vRliCm6xutST5UUjrBWjSmoXKa21qYsWinM2pnSmL/11aTFfP/giHyibTSLCv+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569144; c=relaxed/simple;
	bh=xAXbTBJFH/NWnLQsFLNc2sqr09+914LN7QhfadwFBjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NXVwwegW7HId8Pavcm4Cg+I+6D6bGtUbamUcMiqxvgoPRYONkzoVVtQrPsp1x4qAUfvi+bgoFYWZttwfEvlAGmGrxhR5M1R7DlZNJG54rpudumNrcKBkogKiyIm+HAHCpBVubDl2doUIzc2QTtfd48d+3owl56zKEb2c71dTih4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kEyZrXv4; arc=fail smtp.client-ip=52.101.72.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kEyZrXv4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ati4RtJ5b1d3fq3r/U4r3jzrKyIL+DwW4iNzZ2l56Qgc1gOCPFbakUSbptpsclhrnZ3zHXjlBHn1X6o4p4+MQNELrxB3ZO7TnqQvAGYlaMfHx84MMOyFqhq1JPXEDMWztDLolFGuw28bT+qFNf9NHW/nIko/RZw1Fxh42BLR/o8yvLapQn+gvaHO4iZxApRUirqURTCxLcooAO7uCIb26Ups5Xlr4FM1iQWTpEhTElC2+oNXJVSFJ7UZEfS5xxuAmEqXfwVGdjBJEk5e00k7ao1jIARVnmiGaETYCfeIH6GSYjtPUmYAEtjdigCzuCsqKOXACsgnAncJPgVJLWdElg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBIF+2jCSJ7zB7a4oP0CfhSYlvAFPnaVgBxM7h2X2Yg=;
 b=sZkhONj9l6GiQVZWm+8NoCr/7vrgF8lOTCs5gG0t/MhkN5EIQmPOb6ZG30Bs4cZw2gKV4iFWtBiYwU3POz0kupdvggr2wrOlAtw0W5bQ/ueJU1oqXta7UtaQuHFDZc9tezPRH+Tuqx/oEgCOFYwtT1QBUjmTATgmGLzQ38GqZ7bl4FRsqgLf2x6l0v3IeiLQB0DBNPk+TvwbUL9YMHIkB0GtZj5OLL4EyVg9N64AinGLTkXiwvYvhuwoJkGDtdbA1WTBAcMVYsgn7cpsu6u/pNEAlzvnsOejxEdE/WM2OdIzvtkt+VRRgSNWuRuoxCE6Ii7nCt0KzfBoCbGz7sXEYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBIF+2jCSJ7zB7a4oP0CfhSYlvAFPnaVgBxM7h2X2Yg=;
 b=kEyZrXv4ArOLghcR8wblSTv4sv/vEMnR4nKe8J8tPLgeXC4f+7aa4+EiwrgJLPwIr8b02nGXa1MY9zaDKRaNm6defv4ZmxhcnIvLPFzMxCj0Gxum6AqfDjqatJ1Gn1UjTGaz+VhjNA3j4jm5rRhxPophXza1tOVHX2zlixVc6GtYUZThjA8E8I7tnbLPcpW3tiAZCi7+B5waMRJ21yTRQqMlul81IHnIfeud4tz2pqK01yQid2Qu1b5bqkgCgLLu1zwvxAUlCHneAurtGCRedDaqG8KixWkhTbQIwzyk51teEG/Iax8oqCBkWgs8EOnXnjN20US3IYS+by5nnRw4pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA4PR04MB7694.eurprd04.prod.outlook.com (2603:10a6:102:e7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 16:18:57 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 16:18:57 +0000
Date: Wed, 19 Nov 2025 11:18:50 -0500
From: Frank Li <Frank.li@nxp.com>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8qm-mek: correct the light sensor
 interrupt type to low level
Message-ID: <aR3t6huxr3wQT547@lizhi-Precision-Tower-5810>
References: <20251119-dts-imx8qm-v2-0-2579434f95cb@nxp.com>
 <20251119-dts-imx8qm-v2-1-2579434f95cb@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-dts-imx8qm-v2-1-2579434f95cb@nxp.com>
X-ClientProxiedBy: PH3PEPF0000409E.namprd05.prod.outlook.com
 (2603:10b6:518:1::4e) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA4PR04MB7694:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6201d8-133e-4be2-b31d-08de27875739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Iv+nCXqzSj60jsavYti2t7Hr1Mh3Nozhucr949Nw91wnP4PdwifODF/LLiaP?=
 =?us-ascii?Q?fZ6Uxryc/VdFNGkJxLQnH0S5VC1Uf3wj5+1U9cZH68lol4ndjC4Xrp8qeoyB?=
 =?us-ascii?Q?FnUwrUM6uk3bIrpNAk8J7OSac9AbvVTftAI1+mgp0NAndD6tpmzDidL8S1kJ?=
 =?us-ascii?Q?LsnAA7xGmnjEQjpSCEKth3G0tgBdVBvzo2GsWsJyT7c13j7mqqXMUcZJPBn1?=
 =?us-ascii?Q?19oCeSmppUG6/Y49ltsRjpc5xmI22Zl1DJavbM0syaDi+qaJvEFqXVIEAbG1?=
 =?us-ascii?Q?M+Os8HkvCshRuus40hxPacxnls86qZrEtsVvQG6p3FUmyPthQhvUS/ONxxTz?=
 =?us-ascii?Q?Z4QHP0AijXix8j/3P+oS562mfiIlTS4Rb7C7V+ZYdHMVd8Wxefp7kAfq9g09?=
 =?us-ascii?Q?lgBcgJSEtdWYbSx8LKaoUCKNZI8LyJq1M187OKizOR24j0ymaVVYZzaVMbkk?=
 =?us-ascii?Q?P2biclBInhlH0NFxcvRTZ4o3ox50xGXqybL9cTUyWbvjeXWtT6QLv+Fe6KoQ?=
 =?us-ascii?Q?Fh0Ld+RA9E734KsrCwtu5g/bzUbZ9QIyEpJ4dt8Jk7uoEBmGYn0IkETHO3lx?=
 =?us-ascii?Q?sysaQ0qUJVK3nX2y6fx7mR2nqpoTG3hisDDfnXf2aIinzkNtoa4yzaiUOQzx?=
 =?us-ascii?Q?WGdEdTrlP9YG5GXlM+eGVx3ZlCqudTA3D40TceiqFMOv1IgPK7/Llhq8+Dnn?=
 =?us-ascii?Q?2f0fDb8BJ6euOgAlWEOuFuWXw4xIbgSCbH5aicEE2V/Bh72/L7g8fqXJC5Zb?=
 =?us-ascii?Q?0fgVfl8gEWT4gwyic2/c2no/+CTfb64dVzfEv8AwXkr+EF9vzkpcXSOeCaeN?=
 =?us-ascii?Q?nEGqvN3UxP+uWzIkaOhQ3Xci2JzTdUa+0hu6azaRKEZ+A908A7izgZCb4dZt?=
 =?us-ascii?Q?PuRpZfJGi+SxeqAjfzKd8KMjcBKcLpKVZIpQ3S82elGks6uXMNYa7RK7HXa2?=
 =?us-ascii?Q?SCGNaiilpqjEs7YHomZIk9+nSBvnI6TjA1cTQjqG3m/7CTEddHoUsUOMGaxz?=
 =?us-ascii?Q?b9wEKWktePa6xT+rTEjveCs8szg3h6FDOgCUnSCyQJ2TALamR9awo+76O+ww?=
 =?us-ascii?Q?Pf6RzYMpea+j07G1+CgodpFh00JXSTLLshrr4tHWqlZUqztxuSIABXQaTkfv?=
 =?us-ascii?Q?FA36swekADClgKtJRVb1EZh2978pPgqOHhmxp6Rk54Qy7YOCXB9T0Qo04WL2?=
 =?us-ascii?Q?xPWp61151S/+tk3EPNM2UlgKeRGyJk0rrdLHXUg2g0rnxHb/RqaEemUmZYH3?=
 =?us-ascii?Q?dHsow2sfUDVWNcKjQ5ExjVfgGLHyBFxH+LnQ8V7SH6frdzji8fCsabcx9NV/?=
 =?us-ascii?Q?E8r1RrpyFTGilGZqECWXAlYbftaJtWZEwDhrgLhYGlSfF+x71igsfHRTYj/m?=
 =?us-ascii?Q?0TR04iYYfst0dimDxhEhcGko9p7mj7gwdugkh3zskOlEhKTrF6nyOkjEHKgP?=
 =?us-ascii?Q?GMvsbC2v8IJWe/b+fg//tt2TISzM41qw1CEicGPRCO5qbgMAZuxL/u1IIJ52?=
 =?us-ascii?Q?VzDpWKWt1KmInrs9IjcERQeiib+SK/Oc1ckN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C6hIFUm2Ee5aiHDjHop8JgPkDUqfIfh6+96wELQCrEYCQlm1rK9Kz0M9bGzH?=
 =?us-ascii?Q?PflqqdL92SB8GeNGsmUYyx7xpwKITK15RMAYkgRUJJrPiizviO5O8C9EyGwi?=
 =?us-ascii?Q?XlDJ9d7yzYop+aAhvGNMvzHszNTIT5oFhxnWCmlrAk6JTP7lRVMHS94ZC17k?=
 =?us-ascii?Q?ECJMuCMzNMAFKNRb20Cd1RtJcgteI+eMPjlT0FefUySGhWqthx0ChAJkwsv+?=
 =?us-ascii?Q?/Yc16IHDIJs27GEjqSDwi0lp51Uk22AWPJnP+CYSEA9UeIfcz5T9rDOs2JpS?=
 =?us-ascii?Q?CdvEdG8pOdAExFrQSH5qfboJJJZ0fYAa+oB5N+8DEluaHRdD67L6qvflKRb5?=
 =?us-ascii?Q?ueJPKvb5ZPCZ8wpMrBy/tvYs3ez0na1UnncCIMTaPP/fJxMiOfz6ZFHa8Beo?=
 =?us-ascii?Q?WCh94rTPBeDsEubu9MhDMdYB8mkO8+/2KQ3aZXj67kHQ+pOcvmNnsV+I6fQU?=
 =?us-ascii?Q?snyQx6cbDo8SXzeKSo4n5jrw9SZbwu4OeIBP2pnlcal8ftG/OQg5Wk/nkyW/?=
 =?us-ascii?Q?VhOyMSZWk8e3TS9rS1SqU8fAF0RCZnk+VLVgjHZnjRd/xKZCXUa4yrznSbtP?=
 =?us-ascii?Q?O2HC69SYbAiq4NAdmAdtbE0YLAU8h5KgHAX4xBuOxzDR62APSAA6OJ8Ea7FW?=
 =?us-ascii?Q?jNJIbeQlUlt3nM9K/+KTe6fly8Rv0P0U5a+BZcHdMD8+l1Je6AwMmWjhVCQd?=
 =?us-ascii?Q?s9SRAfz6VovQ6BUKU+7sBeyHeY3TlGQcN55s1B8eXR4sxMUVRS4T+cf7Bmsu?=
 =?us-ascii?Q?CPI8l8YVSzNWTO6h+sySrDYQeNESsV56VnvJHfEj9RDYQCgB6vOQJZ5X7co1?=
 =?us-ascii?Q?x+aLtte7rHSV8wDl/UGKAbWqTMTAzjxw5oxx6CbwI757eKGNE3qDukefwr7B?=
 =?us-ascii?Q?vS5+3w3vb6ZM89NjieIluS/gu122Tlt37V21Uo4S0AC7Hdn/yAgbywyFBC71?=
 =?us-ascii?Q?aX9HY/jzv9QJrcFhWyxBlCT+qEIXJjv+mgBuyVWudGfFWxsfi+f8Qo2wQJJC?=
 =?us-ascii?Q?OxPFPZAzk01pARCRhSuPxMbyyRrzdfY5YLTCZ7qiKYa16pypNwz13E0LxWIK?=
 =?us-ascii?Q?4dpk1glEBLpyyZ7wIk7rbDD2aWLA9ZZTQajaVm4TpQdGkbJNt0TkNAb1qxPM?=
 =?us-ascii?Q?0yfuEVX1jIsQv4l8jv9vUSMStu3It1mOTLioJKS4pSuavvmsSnJP8Tt46Nqj?=
 =?us-ascii?Q?58du5dz3qB6VqIk6ROJwdcK9cVg+O5fe0vY4LE8H9jF+q7fHsj4dmTPJsZOG?=
 =?us-ascii?Q?l2p7FFL73AnEuK4mqarQLN2+mTVSeVal4qHeIsFO3AGGUeuM2MAEOFeknuT8?=
 =?us-ascii?Q?7+pJYdSgifwbTFa8sqi5TewgEWYFw09CXsRhPEt7Jf4+BY8vjhhuvQe20JfZ?=
 =?us-ascii?Q?1r08Erew+kbAPF4363fe1XMbXY9RT3rANiHTO1M/Hzlt8uvu27wMz+GZVu+e?=
 =?us-ascii?Q?jFJQtrffD0jGe3zjA/fiD51FmTH9rq2lsNwg9twBXeHLBFUY19WXLMcJMWhc?=
 =?us-ascii?Q?LOcQK6+Ff1b118X4Kof94UjCvbBVDaEko6LS9uSzDDxb7lnoDBeulRjfJ+1y?=
 =?us-ascii?Q?rRulqcUIUaAxUxYBwc4keAb1jS8/sXv52dsk80mf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6201d8-133e-4be2-b31d-08de27875739
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 16:18:57.1937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53hUC8AZmb10PfiyUzeT3JNNSOcpat5Z3ebKfm5yKpengKLFTIuU6wuVlI9bWTeTGib9xh0At6T369zK8mg6eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7694

On Wed, Nov 19, 2025 at 11:22:39AM +0800, Haibo Chen wrote:
> light sensor isl29023 share the interrupt with lsm303arg, but these
> two devices use different interrupt type. According to the datasheet
> of these two devides, both support low level trigger type, so correct
> the interrupt type here to avoid the following error log:
>
>   irq: type mismatch, failed to map hwirq-11 for gpio@5d0c0000!
>
> Fixes: 9918092cbb0e ("arm64: dts: imx8qm-mek: add i2c0 and children devices")
> Fixes: 1d8a9f043a77 ("arm64: dts: imx8: use defines for interrupts")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> index 779d9f78fb8196b04c41516963f16ece082360e3..667ba2fea8678215c611dc0ca19e8fbc397f9273 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -576,7 +576,7 @@ light-sensor@44 {
>  		compatible = "isil,isl29023";
>  		reg = <0x44>;
>  		interrupt-parent = <&lsio_gpio4>;
> -		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>  	};
>
>  	pressure-sensor@60 {
>
> --
> 2.34.1
>
