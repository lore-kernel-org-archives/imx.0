Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010057.outbound.protection.outlook.com [52.101.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB24481241
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784129378; cv=fail; b=MZeWmI3wzvBoVuTqQ4wRyw2ARYxZQzocWEj7VFcKLYEQJMazpYx6VQxoyu02OdYpz2ExyBjYMcNHduGxZK/KbNACkbvkBi6LUltOuienxsZhgxAd+/ru8ClJIvqrG+rp//PIvy7WSwkWhf/rKAStFnEfGp53PPznmcNjIWwv/nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784129378; c=relaxed/simple;
	bh=rzwZD390/u97pi3GLj/zipiYkpyHIjbh/UH93wfiafE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QSh3iUHQkZQTDOoTjCrw3tgowc4VaiMg73zuQfAEpzxd3haqpetxyQeOt/ziprlujAarIvH3DkMJDVwTToGp4RN2ccVcAA4mA4WWJFy8TaVcV2kltjvNRIk9oO+5cQTdqAwQq3QTzU6bndaNx3j4f3SE7tBn+yyP3S+bEo7G07s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mvlHPJwe; arc=fail smtp.client-ip=52.101.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mvlHPJwe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DvC9w5YmcZ4tE4bCroI85fMpMzs3FJh1hKhYhrTgg2M1cO041Ndt1DAzx9I6vtpyM3w8wnt68J9pk4n1ndgWYsBF3UHHZ0Fnozpm+QeWINLEOiH5lgrZr/UeVvG/jHg/2jZK29v0QC1z5fxnGj4QpCgy7NzmathD+0oqw3aKYGQWkeVRPi1o+FjvBFeHkcx83eVrhTss3xEK8xAWwzKKLZR9wKf+q+/LmMuha5LmVuUkl/T/0zwYdQQedmxjDcVp+B7NHEoMFGWEUKioV583fCaWr7xwq7FxWpFTVaY9itNTmg8EFC+HkH9CGeBBpfItVd7X0G0QjyG7YNTat0jV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ApVr3dvip1ne6RKXjVZzYDPWYGxGIBco82d+VAGChJA=;
 b=ovOcE3di+MwCoP4i8JDtYrwa+SauJjSkjn2/QvCVbINEdGHBhBB4a5TSeAIlHuDnydQjToAty9mdGz7mPH6aXZgir3q5V7R/hQAehYrZbWgqJeEFHZP4prqNNbWVIPuR9tuCsRas1SP0Zl+TXqF/BubDSi/X2c/4mcSmJheXiKvr575x9eVmEPq6jcRFk4u/3vXY6ZzlAOKFreGfaLaANnua9l+qgzRmZLh9mJyZcMCiAEdfVsPhGvDQFuY3vFbOS/bSm7xKUMPft7meJO1gZf4QWr1ZWGOuL6V6Vm4NsMzx9d2dQJZ8iFuNycexOdxu0nsiI4qx6xweU7PLa4zkMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ApVr3dvip1ne6RKXjVZzYDPWYGxGIBco82d+VAGChJA=;
 b=mvlHPJwelmV4kkbz6NO6ZX+XR+2S2JoXXGqtNwmCK5JnzE46UIJIuopxal4uyi4wx/Ml0cU2btF+SjFn7xckz/By/Jx2lwUl+Ar2DBy0OC2dFMQDxRV97PM37B0RZTTKg47s2Ka9ZmAzA6Pqqdak2eUM7xVTrwy5CekQuUR+12+t/dnJs5GnliJmsrpLb8yVG/a+M9t7PUO2xCQK6YeqetWkd+6QY9yngoOTdC+EdmHYSoxFNxyfr0j8goEUgqKb4k3dAqQetYnPZO/NqZ66JshHzC1vsrN5+gygi2Xv0ZA0RrtxvrH7dUDdBSgPvzLif5XCxLbsAEWYb2nO4ffoPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB11488.eurprd04.prod.outlook.com (2603:10a6:150:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 15:29:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 15:29:31 +0000
Date: Wed, 15 Jul 2026 10:29:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v6 5/6] phy: fsl-imx8mq-usb: introduce per-variant driver
 data structure
Message-ID: <alenTyMiIqxEycPK@SMW015318>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
 <20260715-imx8mp-usb-phy-improvement-v6-5-00d95e270e4c@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-imx8mp-usb-phy-improvement-v6-5-00d95e270e4c@nxp.com>
X-ClientProxiedBy: SA9PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:806:20::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB11488:EE_
X-MS-Office365-Filtering-Correlation-Id: ed98077c-835d-47e0-9e90-08dee285ddd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|23010399003|376014|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	G/nJ2xjHM27pSLwuo/wwLEMf/WiM0LaUvBmJ9Ra3qhoVwXBr8S9NjJh5AH0wpmk/dScEurOxNKV+x5Mk7K97CbvjCWRRkI8gT3cLgiYy2fvrhqkYeoGy/RFnWRokqNgOYHDYtnHFvkE3CKzm9xMEhlTD3uDl6b5PpPRxt9wQAaDAJss9S+rgxBedhWIm7uJtABdF7kAuM1eI8dzJiceasHKIvfLfCiEubhG0nSP9Fsp223nU49l0+7CnVgIxdfdxWQuvY6mkRpiAOjx25faySfltMWmcEYE6D44ngEpoJHYC9Cus0CLDzD9ZEDtAp7EYg28BD0v+av3MM1TUgyQbXXoUhrw2yK1JzkdxgG1UmhaxZGhU50b5vsTkPTIb5aWgvxVEjGc8qn+qPfJhdJUAtYOggGpSRrPYHzqQQE6BVZHOdoGLXamqN/aUrOlVXRHZoIWklC66k96O3HxNIKgRMvy0stIUbGuXYiJ6h2L4WDSz4MOrKwKBuRULYR7vXfxejh0qish+GN578a0BT9R1BMVe4opV9qt+5ZHxgFGPHO8kemPMPKROj/CiopBeTlDTTWv1grhTLe0EmdiclE1l3Jtl/3IiXqI0V+SOY625dCatmAVzk1bC/u2OqcWF1dMAdOawVhnwmJS2W6fBvGipQlRd2j32WYsxeOmLdAc8TBE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bChNi4GEE+Uqpbhbvmp7I63TxrJTuKQV3qfIziVwe9DLzYJaVwZcvxW/PlfZ?=
 =?us-ascii?Q?Fmii9kRl7BJNW6dzJNAbxiMePVUNb4eYLMNIAEkEXQ4IRfrl4YGa66Tn49RC?=
 =?us-ascii?Q?6b8uuukYOGqks6Je1X/xK52K9/wZ4dQ1XFy6fb+OjB/rfbfp3/83t6NX8qx6?=
 =?us-ascii?Q?Fiahf1dq6De37/p38ZGz9BBdytNX25wcXIsvwJP5tsByC1f7G5oRDghHIubR?=
 =?us-ascii?Q?ndOYVTlYW9fml4KxUNoT3V/i3ccVWd0/g4Q/tC8rfYcRLaGtwsG+OoyzMj0D?=
 =?us-ascii?Q?WmemZKeoti6kqmHfxfZjQy9ZLyCbgdDwLAEWytgkSpzrPrx3Zhb/3bo1+l4Y?=
 =?us-ascii?Q?aOyVpmfyQPpesLnc2ckPHX0mM84Tb15CxcGu9VsUBeIHJX9BE4O9ni2Wl3Ib?=
 =?us-ascii?Q?hpZC/6t2J1AiZulvBury5EHAqgCsw6m4tcw9FgS1/SCAPpRaXG7/H/62l0ER?=
 =?us-ascii?Q?cwmBxGv3DRem9aT6Y5J7GLim8qxOB9Wd8gIx06cNKjAicbpHu15BED2XOaNC?=
 =?us-ascii?Q?CRj34bTTmPlxNQMeyiFQbWr7q+3otGuiN5QGCMSLpCiYYh2ERaLFNkQjlBRk?=
 =?us-ascii?Q?XSo5Fi/pARK6i3BpCQQJJfyyr+EMXHPcTvKWmtdRgETbcqqhosIKwfWguGUp?=
 =?us-ascii?Q?63ubDLh3y4TQenbgLNroyrk4oNalZHia4415tcut+t9+Uke9hUd7N/OH7S+S?=
 =?us-ascii?Q?z1NfCfXtz4TJBhwT8sOm7rrdAlPRSLKB5sp9lRWe17O9+trR4CY9YbmIRHLE?=
 =?us-ascii?Q?CuMbXbKa3932PolZjCR/F1bJiHwqDCamZq/mcv+z/ZDMKlljvX0OtxOGO3+K?=
 =?us-ascii?Q?VcFOal3YGDEsUnkJGWJmh8rWJykptVTQN5rw99GjxYvn/rBv76iMamyLzV4j?=
 =?us-ascii?Q?k9Xb7yzKI1Ea4vgFUzVHII1LORcU/huqPTLMOa7+quoZ5c9JwAuIsk8UYm6U?=
 =?us-ascii?Q?0azo/QOjPa1qw84zNR9Uq9dR5iaMb4LqQi+Nzl0XWcbv1zSiR9w+l6dV7Zq4?=
 =?us-ascii?Q?sOpFqGc5RV+eCtu0ahJOfOC9f92TTOIcnIkFWPKxD05LwP30P2J69TKq75qa?=
 =?us-ascii?Q?IFDgLa8sY6go03UBsmVbSgZxs/ZrROHKLIcfxUkzKxX4BKHunPQK9sv4iY1C?=
 =?us-ascii?Q?AkdLptflezWWrT3ybgX+T7yF0Jb7I/anaQoFOyOwk7EfyegaK2ojrj+kOOFw?=
 =?us-ascii?Q?WjMK8QlIajIigoSFvLsCa8y0vn/Xzy3OJql+GMLw9RparMFS80OV5SYYbpfI?=
 =?us-ascii?Q?cE50bXWhKsWCNRXXUGgC/aE8Q6sljOhQc/85BNdIrOKHScY0ujPXy6ZTWrYI?=
 =?us-ascii?Q?woGYB14gBeXeaeF3irHZPeTUWf6ABm/qi+8eEB/Jr10wxCH+Tq/e6P0/g477?=
 =?us-ascii?Q?jYjh6jPrvA7i36Dt9UDAC98s1tkUXnPMYsIzjCQeoWeg7K4wNKwIFLkEcReX?=
 =?us-ascii?Q?QCdirZ/FYMgWCMpqS4SkA0mC3YjKyZYWoFWjTm1HUgLUdlrpLPZIWavXnl0q?=
 =?us-ascii?Q?ftFCkR8TKunJ9iiU1BR8heWDG2tgsNE+5rBNTnlNpDYN+XT2iL591qkaE+UM?=
 =?us-ascii?Q?O4UnvvEXpgmXq3ejqPavAu5gulWLdexqiDnkcH5iqGEfC3zQFMtxcuOJyGmn?=
 =?us-ascii?Q?nIVePCW3bLDvvPp+at2xMWG9XBY3PXPebXJ5z/6lTOTDjJGn8Dl/r4xRoyUb?=
 =?us-ascii?Q?8O6cbx/tBitZup4WkPTWoc/8M+8OKj307KkfnkkPkCJkXNBCsmP/f9+gnYCV?=
 =?us-ascii?Q?HJrozs80SFq3Af1MK9Qia5EFsEJtV6YHejXqbaT6NY+hrO/7YBc9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed98077c-835d-47e0-9e90-08dee285ddd1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:29:31.5864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xOqsJKNgBoNfn5HQrq9vYEwCAWPoF84ccJ/gr5nDvZNwbGTgtqfIJpUF+144zRU0ZOeUE3UFWFlnRPe4rWcPRMmmvcy7Yc5N2u30hic1DUFiN7xAWsN49foNwN/Lr0l/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11488

On Wed, Jul 15, 2026 at 07:34:00PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> Replace direct use of phy_ops pointer in of_device_id .data with a
> dedicated imx8mq_usb_phy_drvdata structure. This allows per-variant
> driver data to be extended in the future without changing the match
> table.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> ---
> Changes in v6:
>  - new patch
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 79b3958ead2f..f0bdfa75d586 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -132,6 +132,9 @@ struct imx8mq_usb_phy {
>  	u32 comp_dis_tune;
>  };
>
> +struct imx8mq_usb_phy_drvdata {
> +	const struct phy_ops *ops;
> +};
>
>  static void tca_blk_orientation_set(struct tca_blk *tca,
>  				enum typec_orientation orientation);
> @@ -660,13 +663,25 @@ static const struct phy_ops imx8mp_usb_phy_ops = {
>  	.owner		= THIS_MODULE,
>  };
>
> +static const struct imx8mq_usb_phy_drvdata imx8mq_usb_phy_data = {
> +	.ops = &imx8mq_usb_phy_ops,
> +};
> +
> +static const struct imx8mq_usb_phy_drvdata imx8mp_usb_phy_data = {
> +	.ops = &imx8mp_usb_phy_ops,
> +};
> +
> +static const struct imx8mq_usb_phy_drvdata imx95_usb_phy_data = {
> +	.ops = &imx8mp_usb_phy_ops,
> +};
> +
>  static const struct of_device_id imx8mq_usb_phy_of_match[] = {
>  	{.compatible = "fsl,imx8mq-usb-phy",
> -	 .data = &imx8mq_usb_phy_ops,},
> +	 .data = &imx8mq_usb_phy_data,},
>  	{.compatible = "fsl,imx8mp-usb-phy",
> -	 .data = &imx8mp_usb_phy_ops,},
> +	 .data = &imx8mp_usb_phy_data,},
>  	{.compatible = "fsl,imx95-usb-phy",
> -	 .data = &imx8mp_usb_phy_ops,},
> +	 .data = &imx95_usb_phy_data,},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> @@ -684,7 +699,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	struct phy_provider *phy_provider;
>  	struct device *dev = &pdev->dev;
>  	struct imx8mq_usb_phy *imx_phy;
> -	const struct phy_ops *phy_ops;
> +	const struct imx8mq_usb_phy_drvdata *phy_data;
>  	int ret;
>
>  	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
> @@ -720,11 +735,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to enable runtime PM\n");
>
> -	phy_ops = of_device_get_match_data(dev);
> -	if (!phy_ops)
> +	phy_data = of_device_get_match_data(dev);
> +	if (!phy_data)
>  		return -EINVAL;
>
> -	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
> +	imx_phy->phy = devm_phy_create(dev, NULL, phy_data->ops);
>  	if (IS_ERR(imx_phy->phy))
>  		return PTR_ERR(imx_phy->phy);
>
>
> --
> 2.34.1
>
>
