Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013053.outbound.protection.outlook.com [52.101.72.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687183DB632
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 03:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780456242; cv=fail; b=ldX0m9JwDmc804rywB0A29LdHpMF63bc06aKOmjxiq+64n1aDfy1OHHDk54P6A3l9TdEE/u9o1hqWvc7+WEf+SJwDEtEj+cM+0FAPZ4id6Ed613A+NHrw6tI4RTdrHVnDwp7YhEx/Vd8eBBH6VSJ9Ep4vT94IUu7we6JtTs3NHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780456242; c=relaxed/simple;
	bh=StRcFOevNsWhITTEfaL0x3nWDXOwKbHLdZlmauwMvw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GB030omoWRj0XFfynzfGByWb7V7rXCF+LpyIkeoQcgkFHqsP2bH7qbEo8m9OI0I9hBHob7j1kM6z0rF7L1Ts3YmLWaLe5Ol+tlhAiGGUl+baJYcpzJDbsuL8sHKYokUmpbosAbxtNILOCDg0GhwjRq6YfESiWzxYkV2w7ioKBqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Cl2zPVWu; arc=fail smtp.client-ip=52.101.72.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Cl2zPVWu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N54B87TB9VOWAJEJexk/Quc4ARvehqEzwx+tKpT6uuM4EzCIZTvqFRaJL8jiBuEkNVaWLjimejgG2elPeb+LPe0HNr49ui4y5sIKEDTIcpkOvBfzTjABB6ye5ox4/vr4lmiw1AZRTfdM0HEwmIRkL5ojYX+3Rsg7dEqQdITmTJ7FEAC7ZAa9DBK3BEldBk/VVk6LecK+Xn2rfha9tfMHVuUVkCJzMZ9LDT7HoImGksnRlFzr+DDU4kHHfFDxzokhcvEcs5FdlCE6xgslWwclVxYk0e7na2PsQFBmmss7mFRbIBpxteFPyN6BdIyh8e5/spmqaH/4Rk0uxVLdf3rl9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZkYz8LyMIusHk+O4Zf9UTk1laWw0ZwxRQ3mT6w2qu4=;
 b=meQtxpvRHeyFN2ABfayxmpzNcBsll8w6yiLfktb8YsSdVkAxwMDT15xOn4IJ9osq27jYqBWBO/PyPy6CiuhPFG8L7MsbQXjRvcSw6EfzpgVjfk3Fl8onvMcq/IlwfqfXvIdgWGONfsubk0MpbRzR+1g8GNknh3YxJqdPUWF/v8MW6FkS/WTNQnuMfqwrOHTxSpQSXeXS5pDbeueB34oMz8k2aCe+/ldVd45yOen1GXb6K3rjdhpw8l3ODlEgGSdMgIXLojBV5RSrNg5A8C+7YgzZ4Dv4OL7nBPxl2mnBX0UWsk97tgfRVAPfVn6rgrQe55zpRsGYNWt2TBuE4yqiZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZkYz8LyMIusHk+O4Zf9UTk1laWw0ZwxRQ3mT6w2qu4=;
 b=Cl2zPVWuk1bf8qIHeA4tRyvfUNcZKXIt8wHzKFJoEXEvK8X9fFq2BOb6eYCDfKeyCqjw0O0SGHB4S/93Xjl+JGZVSmle9GjURIJa3YAfCXSjN6liP0hyOAn1frBenbnWfHesQxp5kwnKVntxyQN1piWq3TQkb/Czp4T3yaAyHbjpViJ0wAPULywGzyU+z87SmDoeb1RF5E2YOuLe0JUxO3cz/CB0pkOgWSpFnzpEh5Al/WxhEj6ca1FCJhGj+T1ksYojGbG3l+IcF8+ch3kA84imQ5kftuyKJsf9wjIAg8uEZNtpburjxx+0TjiW9HBKdCkQTBIQXILeXk9gqOzR1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by GV1PR04MB10480.eurprd04.prod.outlook.com (2603:10a6:150:1c8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 03:10:35 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 03:10:35 +0000
Date: Wed, 3 Jun 2026 11:09:32 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>, Jun Li <jun.li@nxp.com>, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: fix typec switch leak on probe
 error path
Message-ID: <ryzrcml3jo2lj657inrm6dlh2d3so7redxvjhhq3pbe435vq7n@khuctebwompe>
References: <20260602-imx8mq-typec-v1-1-3debe9bc77d9@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602-imx8mq-typec-v1-1-3debe9bc77d9@gmail.com>
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|GV1PR04MB10480:EE_
X-MS-Office365-Filtering-Correlation-Id: 057aebcc-42f3-4420-2876-08dec11dae1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|18002099003|22082099003|56012099006|11063799006|27256017;
X-Microsoft-Antispam-Message-Info:
	u1IZCZBRgCPryAic0NC8WbHIZAU2r9mqmG+g88DSmA0UIwPYlrLXpFADaLSTmcMNt/9uiPdxTzNilvlvB1zxT5y4ARB2VzzQr6JcXfxXQAAEBNrDLVM0ndfQdAFMhhGNMo9bzqNHZzI5Or7LE1hPPFbu57VhcT8uXuzsMBdQjdRiVRmwopl2yfPmllZjG4f2jSpnBccw49a9zrkdK0tiR21aKzy8biMOCLKuPUuJl3JXrft4mJVfwg3ZLh3bKAHmdKO4a23aRlUnq2ygcSc0+gfFsJCk8y2kmOQRGxHnqsuYWkehZi/aKzqCTRcgjh3mw7ITPxQ8DEZYCv83ztIJ4SPhGX9XTOfBSfaE4Sj/uhY65DWZi5XIuNFDLUDz7XXOQjJ/y37hPv0uhCWPvviMfSNp7o0/2yZu/Arb2eiQyy4pWNx+FUCIxzjpBnE0QyQmA+xEYbhUK5UWh7e1yq4XPf8zbD3pthzztpmysgrhUgCWVhJgGvxhnCKDXBaZkn4/kLoVK6ica0BcpmcZfD1RyphXw8mC2uiO1gpoAaZlAvITyUMzfsy6Vv2cmY3iVMEItsBDJySvJs8gUyBtQ2LyXFUNIuFEULAnPnhu8nBq+zRubr/G4LVA2N9F2dE7az84VqEfMbfacgwFUzn4weW/3IyKJIr7THHIWKMLB6EsGQaveTHOf19H4wgaLeQbmvWmGRF/WBiLIPPS9UUG3VLVlC7Hjii+AZqoWTK8+Lyn7D/Pb7kZz1TFa613EynO7vVp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(18002099003)(22082099003)(56012099006)(11063799006)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?07rZQMSqVZI86/V7tHrfdrDZlYrIDcbZAkeASKA9cmC/8iQFnVtEzpKUCY30?=
 =?us-ascii?Q?Y9vQoSQIERAtwLALeV0KZHuHP6zanmYNyKFnGmnbs+GhbahiD0j6G6qtI3Dt?=
 =?us-ascii?Q?LbWq1b4KiCzhllXC/YYCihqk5RL6FyKiXkYNfkIAyau1HEpuojT9UJVJ/F80?=
 =?us-ascii?Q?0iP8hDdJ6JCCGiAXWu7dRF3ZKNtiUk7OTKpaYuEO9trz4vqiUE6nLvnDzbYq?=
 =?us-ascii?Q?gaZt91dwp9pZWTJgECQBel6LAn7MpTPkWIyAZBfsEguc61TvqutHgD5P/zwD?=
 =?us-ascii?Q?RuQI6qrl7iVNaxWgUSjg3t2dE+7/vjlT5b/8HaLvdKeuniVr8jb9sUueLZqo?=
 =?us-ascii?Q?itklC70kN9aEXuH+cHVrqcazjcOa+B0i3gxAfhgJzrwDr6haHdnV70dHvWWI?=
 =?us-ascii?Q?hlKRlvDc+Tphh+oUz/Cu3IAjWyBu4NDm8rgQ3kWFq670Iw43nrhiL9CN4b9q?=
 =?us-ascii?Q?Q39OUHmlJqS4HSbk9ZzrVEaAgj+XUwvWewoRw3SFGBFtsNAk3tL8eY1EaaE2?=
 =?us-ascii?Q?fzo3HxzvdsS6uWGzPycDb4miKjU3XFWSWscXu0phyrUZFFf8hYgYh10efycq?=
 =?us-ascii?Q?1+SbXreK7tvK4jd/+qQKlWMyIX/Ck0fPyjRt1Id8H1qokPPC7jm7+5Eo4XL8?=
 =?us-ascii?Q?wUJufbRrk8lR/+MOLxSLHvc8u9R2ZVZXJtZvp5l8eFeKaFwjBLcYCEk+bfCI?=
 =?us-ascii?Q?mQlamXQADLcV+ZZPWSNdAV4o56095pjbyu4ibTSllqwWAXu1t7GDa8C1mtKi?=
 =?us-ascii?Q?skv1woJb5fJH6vISFmvgjrTR8SuUEKKp6FyMOEhaymwiL7XbF+617QXbXWZQ?=
 =?us-ascii?Q?WBekYmWpooYFFe0caJs6GA5MSoQoDvMlo6V0+bzJO2EziHbxuxLqtwQ/OcIL?=
 =?us-ascii?Q?+ZqvmIRDjitos+QGP8i1QOoesovBSmcFz8pO8OYET3J9DI4XnlvyBJtqkjnI?=
 =?us-ascii?Q?1NSCNujZpMMnKVLYhVA/5XnJY2xdxzj64G89phXxBXV3VrTHAeA7SuA5KbW4?=
 =?us-ascii?Q?Xk9Hj2fsVwS/ftYOBn43Ihk69qdTUapZ3VLcNKU86P2cILLIgdVp7zuSJhrI?=
 =?us-ascii?Q?JXSPLbC1U3jWrcg3cNDyrQluUiAnwU35OwG+rDN+hOwrYIX4CPtQqlUi/ykK?=
 =?us-ascii?Q?Qd40tzIb3kEDcXB8mNNkoq1mnmFDZHXbfsVXpgAUxhRbp6wMGpyn/eY1LtPk?=
 =?us-ascii?Q?EYtRj0BqjaU3+z0NcR2ErWpLxk4jHoASg20GZmgr6cHb4FknCatKJkyDtj+n?=
 =?us-ascii?Q?96Dhvimv6Zc8//BWRV13L+AJDVdFs5GMnno1bW7lL4d0r1iUJFNmx/1WuaYz?=
 =?us-ascii?Q?6+9gThQiBXJV46+03qGrt5xOLsGxp9ZuYKDWjGBjJLT9lF8NbP1RRNfPYNu/?=
 =?us-ascii?Q?rVRUI6GuKBOQfhSRIPF5Sv4fSQaobvJ/KflAZ9cA3VJsDtPiGrC3w7ivTU+4?=
 =?us-ascii?Q?PTtyelxAxv89RJ8m1CEAdJqkmyjIMwTDdkAfpFoYSJOom4lCmFV2JIayqssV?=
 =?us-ascii?Q?iLFPfchTbqdCkwt82FjgpM1yYoJ2n2gTHgzyBbrGFO1IkxPI4mc+OkaLYMvu?=
 =?us-ascii?Q?c6Hp8sqGLs/Rrvps9IjgetH58gzSlDULv2zfyd4qQBsVxsYP1P8aa34w/2Yb?=
 =?us-ascii?Q?3Ic1iT3HNaEuOdSw500mh+WQNnnOPPpH7thqQVXheBL+fAGZv1l8cx5I4QOl?=
 =?us-ascii?Q?gC6ApPKIfd8YcX/CZ8YpvCS43u/xnOqDxZeoGmv1AWpUX6mQWxDau13DBM7c?=
 =?us-ascii?Q?21kqLVIgul8lLm60f1UI5RttZJ8apIdeXYIzHs2xJJ9m0Btq6fPU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057aebcc-42f3-4420-2876-08dec11dae1d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 03:10:35.4806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MWRkPLfI1QEa9RibpcgkTtRr2cpcCCuRr/7boNmAx48MGS8LqSe1llfpm8HhAQFdJQs65gj2i6weuVhe1j4sCuOYBjcLcq0+X8/O+y7VugN9xJwV22Zgfxj2YuxO3DV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10480

On Tue, Jun 02, 2026 at 10:12:41PM +0800, Felix Gu wrote:
> If probe fails after imx95_usb_phy_get_tca() succeeds, the typec
> switch leaks because the only cleanup path was in .remove, which
> never runs on probe failure.
> 
> Use devm_add_action_or_reset() so the switch is cleaned up on both
> probe failure and driver removal.  The .remove callback and
> imx95_usb_phy_put_tca() are no longer needed.
> 
> Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++-------------------
>  1 file changed, 8 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index b05d80e849a1..8af5a4f85698 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -173,8 +173,10 @@ static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device
>  	return sw;
>  }
>  
> -static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> +static void tca_blk_put_typec_switch(void *data)
>  {
> +	struct typec_switch_dev *sw = data;
> +
>  	typec_switch_unregister(sw);
>  }

Nit: You can simply call typec_switch_unregister(data)

Reviewed-by: Xu Yang <xu.yang_2@nxp.com>

>  
> @@ -248,6 +250,7 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
>  	struct device *dev = &pdev->dev;
>  	struct resource *res;
>  	struct tca_blk *tca;
> +	int ret;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>  	if (!res)
> @@ -266,17 +269,11 @@ static struct tca_blk *imx95_usb_phy_get_tca(struct platform_device *pdev,
>  	tca->orientation = TYPEC_ORIENTATION_NORMAL;
>  	tca->sw = tca_blk_get_typec_switch(pdev, imx_phy);
>  
> -	return tca;
> -}
> -
> -static void imx95_usb_phy_put_tca(struct imx8mq_usb_phy *imx_phy)
> -{
> -	struct tca_blk *tca = imx_phy->tca;
> -
> -	if (!tca)
> -		return;
> +	ret = devm_add_action_or_reset(&pdev->dev, tca_blk_put_typec_switch, tca->sw);
> +	if (ret)
> +		return ERR_PTR(ret);
>  
> -	tca_blk_put_typec_switch(tca->sw);
> +	return tca;
>  }
>  
>  static u32 phy_tx_vref_tune_from_property(u32 percent)
> @@ -739,16 +736,8 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>  
> -static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> -{
> -	struct imx8mq_usb_phy *imx_phy = platform_get_drvdata(pdev);
> -
> -	imx95_usb_phy_put_tca(imx_phy);
> -}
> -
>  static struct platform_driver imx8mq_usb_phy_driver = {
>  	.probe	= imx8mq_usb_phy_probe,
> -	.remove = imx8mq_usb_phy_remove,
>  	.driver = {
>  		.name	= "imx8mq-usb-phy",
>  		.of_match_table	= imx8mq_usb_phy_of_match,
> 
> ---
> base-commit: 08484c504b55a98bd100527fbe10a3caf55ff3ff
> change-id: 20260602-imx8mq-typec-20a6f1d1900f
> 
> Best regards,
> --  
> Felix Gu <ustc.gu@gmail.com>
> 
