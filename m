Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6557830EF9B
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 15:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673432; cv=fail; b=mEWPdpZTCksAX9YXRr/9xLFoyVOid29+VbqMMDlpRJZ6kPCaawkQaf1htkF3VFDieO1++w28RgHg4ZXdKwBCml08bkhrW8mXUPTx5WZD8YpouOxi4Ell1oJIQKEDutX0UU4yIZiSQP6NXMvQggPEbUBBQuT2Hg+bcRLR5fyWVKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673432; c=relaxed/simple;
	bh=RCuhaeS9i1JjQ/9B/U/A5vIvpV04+0fQCLVLdllR/08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K4q6swI8+zeZuZxpFvXTIHw3PZPbFjlispJuc2258uvlqh5UY8NXPtP9VuaNG1vAvv6Xkh/wT2X6mrpKWEVlR6JeUWO7e+xMKnYNOytVu5/H77X/EB8nvSc/nzqmn1FkgtPG42L4+mdYqMAEkdfEnZGe8QzkvPcvHkr33BYvN1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bnaDaLJ8; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bnaDaLJ8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpYMGvoKMOqtyDeFkUFCC+jycEdR78mWG0QYvFvvg+KjD6MbsS7TCMUMucZGDTapUQ7DWFow7qWltSegWcFOc5AePwIc+UCGJ540OQYx+TswS5KDo/ty4qsCyUMH+VNc1U8j1DOtFOaSEeow12976/kty/Ds51YbZormOBJMoAQR4tkHh0RxYqgziXRUz+0125CFIX+2//rfD8AbO57meBx4vKiX1AOJDEHVe4Yk9rXuXVY3jHasHVmbM6YMTv4mJ42od8Ij/sAUlzrIOkNiOmFNA9kc2q8HV92htgp0nJfKYbhqvbLcqlwDPc7DSpqyXY5Qd7sOGFg378TTk0lJDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHg3PatGQalBk8VfTS4bZ7VeC7O7v3Ka0tPg3+fGSFk=;
 b=VmxiH5Oaj8b6HcdzfTS29BdXbAgGXO4orRG7McmOlfsP5jy8B+4qawLCvcCmBm5rNbP86BKc8RtQiM1FJFSvlLRQXhCHJO1xNUjffSBER5lihN1NlQWFNNL+bmXBJOBxWh3OZgOAF4P0InzkXMAeLfWOa/6JSxrDmIrou4h3OYrdFVeNM2SkzOOGTq3cjXh9D9BqQUC1d3WcZ9Rbrpo8XsBdxtjg9O1MyxDk7ywDLBqVyJMcbRR4DoOmJFVTasLdm5k/EfaLz6SXW6ZX52zk8Y/mm03Ue2vqy7b9h4yRaP59iFHKwaVxunwMH68utKukO+A/kI7hd+fOSR/rh7F9Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHg3PatGQalBk8VfTS4bZ7VeC7O7v3Ka0tPg3+fGSFk=;
 b=bnaDaLJ8yt9LBkIiGrrnH8nKgJM+fUo8Ys2S4gWlf5GUhkoLeh8BxpAzIRPq7g+8C7KuWH9wZyNgI4oDTCvE6Pcw5KpIdhy5gYNYY/521DKLYa/Bm8G2ZGhvLAFr9gbhE66SiGf/tDVYiGLEHeITSj9yB3Nv266282CUvuJgFwqgAeuJP9KO0PqX0JFDKyeICY9R75VS2kCeiytfhqR8ofaKCGp5Mm/CtlZogg/0qYljWUkTGGQqouuedVkTkRu9II3pywXy0QHpBAczk21XWF7CYA/is6dIfJP8CKsliPCs3qnOs9iqEhLMQN350KBtIX2T244JvAL46YUA5TT1VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VE1PR04MB7454.eurprd04.prod.outlook.com (2603:10a6:800:1a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 15:30:23 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 15:30:23 +0000
Date: Fri, 5 Jun 2026 11:30:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v4 5/5] phy: fsl-imx8mq-usb: keep PHY power domain
 runtime always-on for i.MX8MP
Message-ID: <aiLrhzEdQE6zAauv@lizhi-Precision-Tower-5810>
References: <20260605-imx8mp-usb-phy-improvement-v4-0-b2ddf2f3862c@nxp.com>
 <20260605-imx8mp-usb-phy-improvement-v4-5-b2ddf2f3862c@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-imx8mp-usb-phy-improvement-v4-5-b2ddf2f3862c@nxp.com>
X-ClientProxiedBy: PH8PR02CA0042.namprd02.prod.outlook.com
 (2603:10b6:510:2da::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VE1PR04MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: d21fcba2-380e-4452-b2e4-08dec3175c68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|52116014|4143699003|11063799006|56012099006|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	fMIybDNLBAcb5MOZWggnPgEOpwRwk5hQjSfyH6gNas8MpDjcsHRP8f1SuzvwSKFU0ydvBRyH9mcXK1o5ks+rPe/G2ffkpbw/BMgq1iMt/5fJqGbXVZDnkHqMDcnWkybw0SUvAMgoxUu8K9Hfz9VYEF5zU1kF1pkeElpDt6cDyIDP9wPai25ZrZp0PNli2PKIjd3mdz3LUj7jqWeN1T1GL/LiHRTw8vv0vTI0w1wXPJ2PeemEQTP75kV6p42DGtwrJ9jn07HHlqkVXyIZ1riov4hagygpxjlDpb7iSzvOA0Wk6nwqfAOur0u+qNKvxSyDKGCFHrrJKac1SO5Lk8E0UyHQJMnrwYyge1A6jvWUAx9T+edfePEZoiHD6W7Bhr84rUpWjk4x0IEyQjEALL5Z0PO45veXKof+WUFuWFQfkLiCueRS0pndUpXoN744LYHoaax9uETyKo3dHxLwQSvfiF68uCwd0Xu4UeOQmR8sL7MdacBhG9hCmxEUtEdTh4ub8srzZ7290F7tD+GnQagrL1tucU3DYU/pxFeqPB5CM7XYvUKh5vCFDyaw4I/LIFXAjv1SqfUXaUTCRdIywLVyW4ej9F224vPgfOcpviekqlYkiVTfK+B9Ot6OMGS6ouKBUU5N8QUWRIy6EUtHp1g7ttbJ2YTwpJmgqOk/X6BQY87cdxcxquNLIVFE69g9wbz25p/ap8wZYb9sB7ELK7n4laQH9h47DMMs3QcerYhkOj6qpxLb8Lvpk2gJaXPoxh0U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(52116014)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AyEkDuJXXsPS3Dhpy7SWYIrQUzBv9ofT4D5hsKauUPH3GROMET9HVXomdXQc?=
 =?us-ascii?Q?MECqroLRDIVK5dNYx7VwRiieTnk/O6+w2T+5VIOuirB36cgFrHvqGwwKuHlx?=
 =?us-ascii?Q?hZauqS2vPMxizHmvJ58WlEp8LS2Ptj7H7xR9nDmaMwkIDeK+2yzM/PQC3psj?=
 =?us-ascii?Q?192oOculBvbcuOt3zqhc2+BIP3cFwV2sVDfwO7mHSxukHDeE/g02j8eRowTJ?=
 =?us-ascii?Q?+crPfYQYOoPi9lvSYy5TarhBQRs5K6IE2mqaBCH1y2JV6BQCuwLk13F4V9pO?=
 =?us-ascii?Q?SJ8JMhjUKP/0ALMLQUw5O6pNo3U+O0phvLoy2dV3rV32TTDVvgF1UNRt/NsG?=
 =?us-ascii?Q?y3GB0wRy7bPen7oGFnx/DlyY2WUMOIJNj3tbufK1Aw/r5xEZJgEbSnH8NSDK?=
 =?us-ascii?Q?W+lEo4DNV+XSVa/VlkUkN+cD7L7/0dK9jdnWi0iNIq+ktAJlqEfNae0UFuuB?=
 =?us-ascii?Q?zOI6D9MLQaKsVZXRKmPF2HLBWDECvHw1x2v9pJ/HBc/0N3Snpt32lOD81kri?=
 =?us-ascii?Q?ZUet+aAaiCvKuQd9WXsAcLgy6UURBx3i/1Lu7L6/7qMxAZoW8tJsAUd6ajes?=
 =?us-ascii?Q?1evDz5qQBhZGLLcDGw6HED/uc6ivAWwcrQKpQZiadLPHc4FPJVERw7/bujuF?=
 =?us-ascii?Q?baZTinkeEJLDl4l+yMZpgNx6M01j3WUtEX4wcLxT78YFK5bdy1Mc6WJ8wU53?=
 =?us-ascii?Q?OGsdNmHX3gR0X1/0T3pIVkgSZbm3RyIOzOzYFyczSfjtq7qGyNj7oySIBDa4?=
 =?us-ascii?Q?Wzog3z5wm677wexk+Wb0n2Vy5ZeO9dsFbbUMCsKIoz4SkqWZ9r9AbaWpQpJo?=
 =?us-ascii?Q?iZsvu298psTcML3a1dxfrGzAZSflOi1U5QTXDTrWr4D/i0pP/6Pwxl61omm4?=
 =?us-ascii?Q?EQcfvvwoN2opfxbXXKtckYHB+WyPhOsmLKy4IRdH7iqfTadrTH3U59zPz4WU?=
 =?us-ascii?Q?Tn0f3RtRAVSsUdAM8e1jZsJa/tFOY5/MAdg/tGU2ctdsIKM1aXZDgsm6HClk?=
 =?us-ascii?Q?f+xssRhi/301Y16QVLcFwzJclgJM02YH4qSKv2+bf31Y6Q4suqIclXFAWRvn?=
 =?us-ascii?Q?8kYtzupSCPC2ES4OTqn9DTqWPlJ56iswf2jSe2M046jOFV+Bkyifq+ihlVYA?=
 =?us-ascii?Q?K6N7hht51k4ekgybttDxk84z8F58xnqC3+gVvC4YO64uh+hrgXlgUobfBcXy?=
 =?us-ascii?Q?4GAr1r3hJj1yJcIj9A9cWJDb3B0cef10AXUrZRsvLrpvZ+ZVPr7B5s0X14dm?=
 =?us-ascii?Q?3PZ87L+6f8OG4Rym39jSkP7Ga0UXAvDYsv31fA8CCAOE1juMatr5JbzwBbU0?=
 =?us-ascii?Q?YYghhH5Mgl6M/zBfbYC+ajkAPjPql8luZZXfL6oa9qe24yW5+Ki2786Gv34r?=
 =?us-ascii?Q?d6bNh3+FzMl20fFjUmvKMFKUcVSKnolw07btEqCeBFjXavqlGne0mZy7RnSQ?=
 =?us-ascii?Q?rLjKj8hFMgRFZB8iYPWJb0cXsAwFUH/oqydPJFo1qStX+ahzyrqs60y3+iuT?=
 =?us-ascii?Q?Q1OmjKe+v3n/bu03SKYnaysWT1WrGnSL1wY3Oq67QLtO9BiOFE8zWdfy9BEO?=
 =?us-ascii?Q?wdhuARvM2ehwbtrXR4KFs0qe+n3r728VVuPRTS3ldMPBm/3mT1s3cw1vwERQ?=
 =?us-ascii?Q?FfhEIx9IXGgJXhyLU9VpTRtjzFOS5RAN8tg+f4QqoSRzlQyiY3t33S7LU28F?=
 =?us-ascii?Q?ome75swqRXCeEMCYlWVOvbJwe9errYJMmKMoIKIa6MhyXNb+IWcDo4VJ96gJ?=
 =?us-ascii?Q?JyJUIH9ZjA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d21fcba2-380e-4452-b2e4-08dec3175c68
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:30:23.7173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jceXzjSPBm3YOKLgdfNbSdDJxDVcEdtED65D0KH4NJmfGF9GjgYdBVYtk3IoGWsqpleRfjtTzujD9M2BlIL9Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7454

On Fri, Jun 05, 2026 at 07:13:06PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> On i.MX8MP, the USB PHY has a dedicated power domain that was previously
> never powered off at runtime. With the introduction of runtime PM support,
> the power domain will be powered off if the device is runtime suspended,
> which breaks USB wakeup functionality.

Does it need depend on if device enable wakeup?

Frank

>
> To preserve wakeup functionality, mark the PHY power domain as runtime
> always-on for i.MX8MP platform. To limit the behavior to i.MX8MP, add a
> new imx95_usb_phy_ops for i.MX95 and introduce usb_phy_is_imx8mp() helper
> to identify i.MX8MP PHY instance.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v4:
>  - no changes
> Changes in v3:
>  - new patch
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index e24f46d7924b..c8b93ae2035f 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/regmap.h>
> @@ -660,13 +661,20 @@ static const struct phy_ops imx8mp_usb_phy_ops = {
>  	.owner		= THIS_MODULE,
>  };
>
> +static const struct phy_ops imx95_usb_phy_ops = {
> +	.init		= imx8mp_usb_phy_init,
> +	.power_on	= imx8mq_phy_power_on,
> +	.power_off	= imx8mq_phy_power_off,
> +	.owner		= THIS_MODULE,
> +};
> +
>  static const struct of_device_id imx8mq_usb_phy_of_match[] = {
>  	{.compatible = "fsl,imx8mq-usb-phy",
>  	 .data = &imx8mq_usb_phy_ops,},
>  	{.compatible = "fsl,imx8mp-usb-phy",
>  	 .data = &imx8mp_usb_phy_ops,},
>  	{.compatible = "fsl,imx95-usb-phy",
> -	 .data = &imx8mp_usb_phy_ops,},
> +	 .data = &imx95_usb_phy_ops,},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> @@ -679,6 +687,11 @@ static const struct regmap_config imx_cr_regmap_config = {
>  	.max_register = 0x7,
>  };
>
> +static bool usb_phy_is_imx8mp(const void *data)
> +{
> +	return data == &imx8mp_usb_phy_ops;
> +}
> +
>  static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  {
>  	struct phy_provider *phy_provider;
> @@ -723,6 +736,9 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (!phy_ops)
>  		return -EINVAL;
>
> +	if (usb_phy_is_imx8mp(phy_ops))
> +		dev_pm_genpd_rpm_always_on(dev, true);
> +
>  	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
>  	if (IS_ERR(imx_phy->phy))
>  		return PTR_ERR(imx_phy->phy);
>
> --
> 2.34.1
>
