Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011043.outbound.protection.outlook.com [52.101.65.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7283542C0
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 17:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769708500; cv=fail; b=oAdPrjBccU3XytCR8BM4UI87zTVO+d3j4WExhPa8+BYs02/X1dQHd+34ezubxmbrfNg+BTnXDc4xuhaiA7BYW/Jm+SxnERoByEyHU9lzurF4tPU3iwtAdiWV59vtmUVtq+PN4aQnQTBFwVB7hWTjY+eXxdEnU5jHS1FucfMDwLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769708500; c=relaxed/simple;
	bh=qc5JDEEwz8EX5D/y1+NV76D0U7w9ynprEM1fj3iXJEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XpJrIO5myFxbdlgaaFyp0yFrvPhNWTAdmfVeR7flhIijCsYsZCHogc8korHMotVlds9YynQXVFf2vopsUXjpsZUXINMudaKF213M8+Sz3veNYDVjksruA7SCd5Yds4+3upcwiCWh4BnDuqX6x6P5FnmtxsMw12IwBOU9J94deqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LPaQqVuC; arc=fail smtp.client-ip=52.101.65.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LPaQqVuC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cl8k0h3d7WAXnqkkY6clq8cE9UlrWwNIHwyg7Wwp3rpXJRVanOqnxH1wWSKZXEzLI8CNbnFesmXWoThbfur31Dx4HQ/ILdgAaYh3U+NBexgk0t80+NmXWb2byW9DLj0DdaN59ZSkALrciJhpqGC1zxCCUKEk9HwKP7y2p7ylmc3VF43XO2tlI7k/NLQH+wTnkFWMXXvU1VyJDc6pEcQ7+lc9ACD76eyXpqM0bs74q0GyGv5KH0HtlKDAtCRYiUvgDLzZ6zj4tQwI7of9b/9ZigF40OFV1mdu10IKNfjQpkrH8xCRXdsXwPSvOk+2lQsEefwITAZB+uj4reCYyCAdLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRWTn9WjaJpGDaPTV3k16HVcqk+QVcQ5+MB8Ni7azvc=;
 b=oou6Q9Y4IXypTe1/YLdc50yEWLiLtdR8IFs2/+Nf3NFrcKbtA83gD40GZivx1qYplQNUyu88Qyw4uRKikQbfDgFFZ13GO1eBX5MZMsm/mDftjdsV9WkzGLoJbJE9knS+PC7GcugmboatW5qQABthQrD5Z6EfjciqydnFQP7PR/0N/WJRj+imDg35tckEYjqkuCDieB2SdLicgBn1OjhRzJXwCT61yHEm8Ha+6f+roBSrfJnClwXjPQJ1rKEBiLYYgw1aCo0DcAIFGGXRMNiA02kXc5bekXD5O/aeCpVKTx36cJjJI8y4Hor2HyDPuddnnr0r+z/0dJtqwz0pJPOYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRWTn9WjaJpGDaPTV3k16HVcqk+QVcQ5+MB8Ni7azvc=;
 b=LPaQqVuCxVE4RUrq5cMIGXryU/yDQW7Xx81Vld95TaZA3M0Foup0iWv/NUeZlXeAWe2OlUdHFa0f19TdAeM8pMsCU6I0f5FrEa9hHCIDl4QBRh56FNruQDzBRsAM94aC9uETa5ijlNm/AfCMLbWxxhybkAgfS3VhpyUoMNwtMwrguD0Ep9DFCfCiHSLAEF/BncnYgJLR3t1fokW8AXNYb1FLIdV8jXkjwO0cz2G0JGfcesdgvFn4Pxy9/0G9noH5dS8vuDJ28/+wdFy18qvuILPYkifBtIiPh6oRjoeAsByWjJ3KlXcMQ2EaGYWF68VAgCt5YS6vA/MPk9TyXaUNcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8134.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 17:41:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Thu, 29 Jan 2026
 17:41:36 +0000
Date: Thu, 29 Jan 2026 12:41:27 -0500
From: Frank Li <Frank.li@nxp.com>
To: ziniu.wang_1@nxp.com
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: imx93-9x9-qsb: change usdhc tuning
 step for eMMC and SD
Message-ID: <aXubxxvWzQpbOjkd@lizhi-Precision-Tower-5810>
References: <20260129080439.2910727-1-ziniu.wang_1@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129080439.2910727-1-ziniu.wang_1@nxp.com>
X-ClientProxiedBy: BYAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: fb42697a-3866-4dc1-e488-08de5f5da662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ULHJ/wAnm4YYTg07kGEgs/dVL0SZPoLEP++/fwX1VCX5CsJ38GUYaU3qvnlR?=
 =?us-ascii?Q?MnF0qD1mWf6HAyrvLH8My/zQzvk9YdEjUVp5Se5GH961IAhx7PMN3tev7MoQ?=
 =?us-ascii?Q?5k1Y89Lbv15yYtbcgLfqlCXxD692jXY9Zpeoa2axJkG7+Lkxb2YotcbLzVAv?=
 =?us-ascii?Q?+U+HOtvytljo+5l6YjhYRFhppM9SUlm4AJIlX22IG4vtKHNuZxawFhzO6I8/?=
 =?us-ascii?Q?ijdPSrOPsvRO0HhkL/0UdCdcD9vj0wsgwJI3w39susijUTRvZutD2LZ+Bw4C?=
 =?us-ascii?Q?bvDmgq84oc4CuLi10fD2Qhb5DrIJii0hVORdAcrqHQaYwQ91Z818eAFq2q0w?=
 =?us-ascii?Q?AoKL8yVsZxBNBhGZvRyX2Ceyohx4n+vOrkWOLPBN7oQaf4xemknHMrySsIRB?=
 =?us-ascii?Q?dxxk67Q8du4QjjQH17Xmtn+5fMV8pRi0QIjQSYqSwyfOC9ntyVtl6sD3eFVl?=
 =?us-ascii?Q?FVf30wQDgIrRA33HMebtfsZ8TLHbvCzheuhgNk/k20N17RMVZQchJ6IEuKnD?=
 =?us-ascii?Q?WviQA2pvRGhO0Bf+JudM0YFqD/IG035w55Nc1DsjamwC0a8RxIkZ9vTXCOiX?=
 =?us-ascii?Q?26Ar+7gslRRXDi6QaOQvd1FBLEV9kNkjQw8Az2xuqaMA0pR193rE0G6tg/ki?=
 =?us-ascii?Q?pirL7cAwsgeG1fxfIgJcWCM7d3eJBtKPUr7ed169jVqG4fBYh4XIlMiEGs6b?=
 =?us-ascii?Q?LrL+crOSe37ud4qavWYm/LI9K/e3BT1v0laonu+aFCOeMyOvmLl+aDExrOPl?=
 =?us-ascii?Q?P5izatq9y6yu0A4lsPjjWQW7wH2Vqc6Lftedn8bxUvtT/WxnUZNZY4gK15Od?=
 =?us-ascii?Q?rKaEkzMXiaXuiBPFZoSAoQKPOD5DkyWY6EGQADxZV1Lsw/SHd0J2sAKsiiUe?=
 =?us-ascii?Q?kXlj03bhjnAv/eMAQyCp3p8uGT4DeTbE3Z6NY+xvfhoa7un8WJ6zeWeIikHE?=
 =?us-ascii?Q?sp6oiELcUmvOcZIrA9Ttt/ruNQXzOYnOysDe959NT6GVXL4pFUDqCqAQXzoI?=
 =?us-ascii?Q?JSOp6Eimsok9CEmXti/vO3v6gFD5jIQAV6842cjeah5rDHf4QnYouwKmgoah?=
 =?us-ascii?Q?gUebK6sKgsVpUDUR9d01LkwIOqtrmFc6BcYU7wPOFqe6HDjgR4Oj8noQAOHA?=
 =?us-ascii?Q?UTi0mRTwcSjWzunaD4bnXUiElFm0d6eQhgH8WMwQUR6S4NT6PaT3W93YuaAb?=
 =?us-ascii?Q?2OVwzvp68S4sE6BRx/x4DGfJPBJfMZqUsyHtvpl/b2N78yw0O5m+CMw80md6?=
 =?us-ascii?Q?uxnbO0Xnb7Fk3F3EWnlTaMPr7ncOtNCSRYUepRco5r9c1E+7eRG6sGTZcDCO?=
 =?us-ascii?Q?8JDYmiXvPoner62mJ+wPZ8wivMWaDWVmhFZ+MFo3LZN4o/Ll+7Us/1vD5ome?=
 =?us-ascii?Q?+zTPuaw7ujPM0SjZcbTh12CsdxkF9m7iXKfnJuziGKIfrnbxsCHFTlPOZcW+?=
 =?us-ascii?Q?JBDqpEy6OyXbjO+qHOob6+3XNlkjOmElC706k/HDbGUxLYKYqABPW2dZ5Wf0?=
 =?us-ascii?Q?sTjaKsDoR+FcgTJ+IcNlT1Zl9xVh0aU7Vn85Yg5BarLQb7UeUDyMZiYuh7/W?=
 =?us-ascii?Q?gWQn+r7JEbpY/0wA4D9LJLSSDlgBnNgF8gW5AiBKNlj185HbiCVJgMoJ4Lnf?=
 =?us-ascii?Q?lElFlskvIolZxsOO2xcfgCE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9dF5XnH5anDyBsvhnaJj8R601zZaUSuNlrjsdHPDEE5ZHfjRIAtIUGB9Q9kO?=
 =?us-ascii?Q?of0t3JCHuTS9549rQMSzQlUn5LmOzA+jpSGAfmCJ5sAEzfG8Prbau97uUp2b?=
 =?us-ascii?Q?Nxr4VW0i/eCgMeFEys95f0wrO/CAHVkbYm/h9YP8lZOi5FbtkKiNwmYCJ4XL?=
 =?us-ascii?Q?q9QPiCw8/RDDL+HUVML2olHpWhKJ+PadiuNbFi13V5DqRHxZZEbRELKNl+Mp?=
 =?us-ascii?Q?QKQtyH2UirDG66NAlCyPpw9c1CJds+9BKwSbFoTgrFl+b+l6xBEsZ6IHcdCR?=
 =?us-ascii?Q?g4EnkS2/av8zXGiIiTZk0qOQQueKxh5S6FrDgiVeMBZmwT0mUaQNloZTFLZn?=
 =?us-ascii?Q?uwdPKeLHIaoaz1YHOdLV2a1gkwXksbYcvleeYRnRFxpbpHLAMv6ghkd6qwpZ?=
 =?us-ascii?Q?CPWJpuHbOANpumWo2eOi4QH6ErubPgHmrVGW0pF7Tdzi/3GMJ/a44Y7IOIJ6?=
 =?us-ascii?Q?Td3JYM2XP6oNAlcKGOwjoCIJ46QaUlygbrI+fiM4c1dQfnzgKPglnzoJ91y/?=
 =?us-ascii?Q?XBQG5vGWihP2NL34wQgGJ75PSF+KqNTijHNfSFRc/XhHRnFsUgb5MpviWuEO?=
 =?us-ascii?Q?zMP/HXu0Z/735l76SBGgnLadW5a+taYL+rcL96sR1ULwzzd3TyiUpRSiTZ+K?=
 =?us-ascii?Q?fL0kCTH75fb8BDmr+GwIcctUYD/Iztk7lZHj/mqU+k1ZV6Ththk6iXhlkFt9?=
 =?us-ascii?Q?GJQOp+fU0jArqwhb4xmVvhjqY4OhjrsAVHG02EO3l41e7x1L4EqZ/MN76ff/?=
 =?us-ascii?Q?tF0BbR4wOZjWqLlI4zbpKhFDmdMrV2vMTsjc59/Oa6E03ddH9DU3ZTFXaLTb?=
 =?us-ascii?Q?XKGbRaCorN7SmScsKY+HHh0U3gvlBvSXMlzEbTNKJKpsNwu1m7Rg5/ImKNd1?=
 =?us-ascii?Q?OpFOy2BYUE750nIbziZFrfQg5lz6UEm6rJBBjkdF/8MwuQ37EZCpaNSwqBZH?=
 =?us-ascii?Q?1Jz6cyqEoqivFccwH0Ydm9Y3WF75YQIKmguvFpDOYeOOraMTd9hNcbm7fh9z?=
 =?us-ascii?Q?aePssZ/iKVsh72JH77f0r4ytOu+2CSKLSbr7kOv+1IJF9QV+TbM5FxUPEfS2?=
 =?us-ascii?Q?ANGHCWEyBDVhn9jFkVMdJqEDnKR9YTdAAv/VGRtvNZH7Oz7vvbX+cPcVa8V1?=
 =?us-ascii?Q?NpxznPtCIQvb4LarXXb2eXaNZ5SxyTblqcYNa7GtgUTTiiHugl47ObzxR9+U?=
 =?us-ascii?Q?l2Ds+muIL58Ysr5GRMUcMgvgKRBLhVpR4JYEEcXB91uQ4Gcx6gffjFoQ+TUl?=
 =?us-ascii?Q?iHE2jVgQhh9LVcqmTvk6TnCNJ8LOkbYpNNHX8rBJbCXQhGzQXuAx/TNIwngM?=
 =?us-ascii?Q?5Y2LY3TrZSPp6fU2No2gr2kpOJ+5Cx0G53gcX3BdZ1F/AQdUb16HiLc+Jhho?=
 =?us-ascii?Q?5UsYgUcKgWsMIm2mh1VwM55Dfeggc2o5t2HAig4p5+QybXvWDzqhgqA4XmNf?=
 =?us-ascii?Q?whAu712A/zTI2kN8Fv9TTMIXvGpmqsPmXqTjUF7YnNm+0HuDYKYXMTpnqLbk?=
 =?us-ascii?Q?4TOf5MNdSjRnRndhUYBAPAP3kDTfcAuUgsW5Ul4B4VO3YIOBbXRTYgw3Kd2i?=
 =?us-ascii?Q?eMzKFgwliWU5xEiKR9LEDrvTpEP6MbJJwnBf6osa2FgFc3JELOjp2pUrUEaX?=
 =?us-ascii?Q?d964guhT7mhrA3ccnftDOXuNUAUkpJ5s18rCZBE2Hd0+him0r1r17dk+/USd?=
 =?us-ascii?Q?AH+3DqN0t+fMsrPxDCy2uOYDtiwKjetMbvPcU1/p+xuvjJVUzZw/eM0ZjFkc?=
 =?us-ascii?Q?q7/ZcAk/Og=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb42697a-3866-4dc1-e488-08de5f5da662
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 17:41:36.4736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i042Tq3Dsnpleo04FUeX9N3R01ubz/VbYCnANa50UwuneHLh3DRGdaGJIRUzkX0tXMjtYF77VlZy8e31aPLb2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8134

On Thu, Jan 29, 2026 at 04:04:37PM +0800, ziniu.wang_1@nxp.com wrote:
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> During system resume, the following errors occurred:
>
>   [  430.638625] mmc1: error -84 writing Cache Enable bit
>   [  430.643618] mmc1: error -84 doing runtime resume
>
> For eMMC and SD, there are two tuning pass windows and the gap between
> those two windows may only have one cell. If tuning step > 1, the gap may
> just be skipped and host assumes those two windows as a continuous
> windows. This will cause a wrong delay cell near the gap to be selected.
>
> Set the tuning step to 1 to avoid selecting the wrong delay cell.
>
> For SDIO, the gap is sufficiently large, so the default tuning step does
> not cause this issue.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> index 0852067eab2c..197c8f8b7f66 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> @@ -507,6 +507,7 @@ &usdhc1 {
>  	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
>  	bus-width = <8>;
>  	non-removable;
> +	fsl,tuning-step = <1>;
>  	status = "okay";
>  };
>
> @@ -519,6 +520,7 @@ &usdhc2 {
>  	vmmc-supply = <&reg_usdhc2_vmmc>;
>  	bus-width = <4>;
>  	no-mmc;
> +	fsl,tuning-step = <1>;
>  	status = "okay";
>  };
>
> --
> 2.34.1
>
