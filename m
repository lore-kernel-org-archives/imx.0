Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010062.outbound.protection.outlook.com [52.101.84.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046E43E9287
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 15:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672513; cv=fail; b=oQtuYAVKwNi9MzQmTblwg3ZrV9+8EvKYWW06UxN7HE72OXSWx8/+iA72OgQeXLC/NG5TCT7UZ0lFx4Z1RctidDD9kZXSFEmHRJtlcq3Z1o5ekEwAuas0Od1Ma3j7JzJqeeZlqQLJBUQ3AR3sux6Kt+HS+yaxaXldspUqnw99W6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672513; c=relaxed/simple;
	bh=CJVhDahwQAHm/F6aCt3ys8fcNH5I170DhEIQyd+l6z0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PZuFNPeqWUxDSs6mNNYm6s960Ouztth8eUWdBV0IlOR8Fa6LshgOLXbFuPVs/ux6LneuCiEU6LCtK3LTMHSaaXmrZ6XDx/+4SIfAvSbJrswPoLAuKTSYL92j62amc6xYXfYr1nmtf+hRB4/cduWcA0MB74a9svIfqQ6biERXtcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c45br10D; arc=fail smtp.client-ip=52.101.84.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c45br10D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mc2zRITqADgiUsLMf9En6unSpFB4GuddMR5k5H2WtP+ZNFk2HuQFqgQv3R8m22Ce7heLkpp44rgbR/2Vy/udeK3E421GWcsV+WreRpb+Vy66pp+zlgqnm20EnOd3iwLnQep40JAC4IjjgGd6dtBPg1pFeJXQwuUBfr9MAb1EJxEtiq/G/3XCt4JZXlYAvY32oOYOGp9lQ4rqIg8F2X0bWZeULNDXW2RVQxiEX4m7mPhEnE2984n6psiAYHgPUnAl/CICxt5/hWf5NPdZp6IMFvlCXiQwKe3+IC/3DpiYCyGoMjigHmkRxIWJ+RAIRV4jXc8HiY4TINKkBFFITLM7Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovtrKBg/znLcPWE90lK990vhShmc290e+h/oHvUkJzw=;
 b=VaiKtyOf9pnf9oPFVpRiLKbW2FIIyeQVXZg6K+OJwD9lSA9QLwADaKeHgHF+LTMKEz3JJqOOCUyNhPqBlSFubD5mCJ19SbaZsLhHmYqVidCBGOC/B1SaOwnu4j1B8dfZFIxpFkWZR7LNmCf3HKTzlOrnxTsr0PDYYRMirzczzEGIXy0Ihw01uRIZUd23WX9Iuq3bmNaNMoXwEb8eAIks0vhIm3dJ1JZva9tF0JYwrOchJHe2Yj5qpXFBxQYIId0743BS9jTK/AJBrWT6IxUcL31hD+1vhvY3RWIfjzri7HEbxn4k7q9fbsvn6JsRaLqL/hzkFQbaXZmBrFclwK7H2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovtrKBg/znLcPWE90lK990vhShmc290e+h/oHvUkJzw=;
 b=c45br10Dy+Q82eP8KVDJ5X+pT5FP67ScUdrYQ2G/AGgsXRlSqwQlkJ7sqyVJwhLK01IGkT+pK0FgzQfX4iaxUiuH9mteJDMRNWdsDGso4rIds95gAmJq8Dmh5CGUtF6ynOxVGH2AyQeUIONxsRks+xHl2kFwOHy5SqO/r0Wdjyh+j4jwYVeWecDpgH642RWbYrD3+MyfiJNTScamJnsc1Q+FpTN1oWF0H/590Yk51WMGZn27rFdFI2EueUcZn+UrHnr/64F2YrZqEFUbaAYAC5PWql6fEbSPRthHRaEr8UjHZgFlEzDkeiK5zureHD6gVzp5wYY5qxUai1zK9Sxckw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10420.eurprd04.prod.outlook.com (2603:10a6:800:21a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 15:15:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 15:15:05 +0000
Date: Fri, 5 Jun 2026 11:14:59 -0400
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
Subject: Re: [PATCH v4 3/5] phy: fsl-imx8mq-usb: add runtime PM support
Message-ID: <aiLn81lg32BPDZVp@lizhi-Precision-Tower-5810>
References: <20260605-imx8mp-usb-phy-improvement-v4-0-b2ddf2f3862c@nxp.com>
 <20260605-imx8mp-usb-phy-improvement-v4-3-b2ddf2f3862c@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-imx8mp-usb-phy-improvement-v4-3-b2ddf2f3862c@nxp.com>
X-ClientProxiedBy: SN7PR04CA0096.namprd04.prod.outlook.com
 (2603:10b6:806:122::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10420:EE_
X-MS-Office365-Filtering-Correlation-Id: e1381fe6-7b53-4eab-ba56-08dec3153953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|52116014|38350700014|22082099003|18002099003|3023799007|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	2vsrhhe1PAJ1MBQ4VouQ3itEBiY+ieCXHpJbKTCF2PI22+/qwk/dzKddTQrzhJUiscllfQ1jCey4hPeoSZI+f+42NgiEi0kV8SwkjnXO98yZ5qFdQ/udzYXN4MRoPZrH8ADUVkzR7tq63lpEcNg1gH0ghadVxn8fxB+u9VsmeCRew+1cd3N8LVM0Fjrau2w6ykNDhsuw+LkRtwurbLS7ClrZCr8GA95rTomumKNe1Xwp4La/MZZwHT9qbLupEHqdebD7a5kHI5DQlthGO2n+QPM/AvlvNLmQ0VBzIMAiz8iMPvth5UyopMbjem9BLrMh3bN7DbMfQ5AzUERJO8wDCiKIqOflJmlVQHtQXYNRfAvezQYIubIJxcK0CYhzhTQf1khPhGWF/MdRNjKbCK4a+8tpk32gX9vZuN8Y32L5bcjSR4XlCuFjF/7pyvMlJZBCOuMiNTjB+kVNm0a1VXGXyputn3MGrWdND66C+JnfXVNz75hr5X/BA5/Z7AKl11vMgZ2fS4LNymjXiwmT3wPePY9UK2gfKObvVE0b4rGSN+p3HvcSGsZYMTgQp9FEmYHPQcMrc8RX5DF4W8fE2KC8m7nzzp/kh7AKys35FsTRULIuLlD87rMDmKnpr+xln4hI22p0Ow5QM8LNdzfs4tzIW1DlMLRI8qqe5wtrj6F3IBcKDQpD5NuVoypO5Ur4nvgLqzO+auhYx5PVCJrjEZigqV6iMmeMjUb1Ozy09QbgQWQ8sgCHLwTOHt3Y9wlfbqbK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(52116014)(38350700014)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Im0orIgUoKGYjHnv3AKF8q+7xlC8CT9Az3tOlShYiPxniOypq8NbeEX+kKaA?=
 =?us-ascii?Q?REyxtNvEt/GuZWnIDODyM4REzNY5YfT+2wA9d6N/CDfNrISHPD4CWhwMQSSM?=
 =?us-ascii?Q?VhZK6rio287GOjwLygSfDAuFoO9zVcnioVFX6EKPtoPnhCPEdZPATW4lwFV5?=
 =?us-ascii?Q?i1Z4dZEHWf3UAVtlaYddgSajhnObK6Vkpsd9i8lqLySDEN4frwe/0KReIymk?=
 =?us-ascii?Q?gSwY8jZom73/9ZTjV6AKuoCR48kbNJeGWx+TX2tWdWx2cpBndErHC3zw/dlI?=
 =?us-ascii?Q?Ep4XL7EkLhoxZcl3OFwZ3u3/Kln5aQaFiZ+XhHR8MOhim1mYOPUUpaxWtU6e?=
 =?us-ascii?Q?LiOaVZEksJE/0YoyP6Y9/L3j7P9viglBSITBhKJSvx/6p2QXF4a0UfmFO8x2?=
 =?us-ascii?Q?nd0LrFAzJSD71768muMEfEQnzw2JI800ZKuYhe2RE7ewN56IgD9fw9qNQAYL?=
 =?us-ascii?Q?Pumf9Xosf8XzJfmV7B0vtWKu6XxG3npp0iAYbE9tS5oe5NXcJI7+oSnAEW7A?=
 =?us-ascii?Q?vdvbl1PB0j6tKa+i012/AQ1wmyKWatKl4H+wJVY1iUqPjYymM1+dTSqst3b5?=
 =?us-ascii?Q?wnEKpQVR/lJi8buu4MyFc/OxvbmmCgE2RdIB5zp5jk+DJbYh2rs+0WJpHUMC?=
 =?us-ascii?Q?ShMRR1cDQDijpiFPhqTiiDGvO5IWTXT3a8xbWg4k7oShTKy/livonOHFeNCr?=
 =?us-ascii?Q?4EbZtoZFEnJ4DWLxOemR/36/9UqtSirp4glPJWK6iXf3s5OxYDBIBaNFzM2c?=
 =?us-ascii?Q?ETwuAucb0IZuEZ3LWdxbpez09g606qMMqLPL5Ex87fapvtzfmnLaWU+8/HQa?=
 =?us-ascii?Q?wK0FAuhofHfZQ8YVdI+0Bqr0e9Z6mNXnrdcOrdgyqDIbx4FVDQW++w8IjTq6?=
 =?us-ascii?Q?YCYaYt9O/TuQcrc0PW5uC3npHTUu+8J9vqUW1x/2dgIyoUfKzkI+Bv64Idun?=
 =?us-ascii?Q?plPTYHtOoESxnhNS2htDGBNBvGOGfi0fHO+2crhWx5QIG2MzuuTOd8mm0xC/?=
 =?us-ascii?Q?kqML5NPk5sA9vMwwR901We4fddc2Q09szECegZZRs0MFGviioOjynRC5R8Yq?=
 =?us-ascii?Q?JyNKzKGO6KlXuxzxhRV1IyASobwVxktmbvEC4QxvGQ6l8yGPVcpBxNTzESU1?=
 =?us-ascii?Q?GZQ1gjiZ2NRNWfY35JGbYKtjOF1kvPObxSZriVfDnUHRzp8b6yQj5CObLqYS?=
 =?us-ascii?Q?UlMEJ1nwc0/eUXZrp73VQyAsxgv6GSMmPY/33LlVHBaTdLFyB7j/MgFtfJMN?=
 =?us-ascii?Q?QUSZVqR9ska8wy/ZzHGrPwPC++ngO9j5LGp9TyV+pZkGNmG4hESh4LVvrR+D?=
 =?us-ascii?Q?9TOn+48iK1NW/bD/grj9zRzJj1ekPqOe9qzM2YKTxTDBzT+iUQSIV8XIdw5A?=
 =?us-ascii?Q?LdbTOxJg7JmkSCskkRlb5u3s1ZwdnidU++iJbsf5svHEDEldTaw1yecKkTjQ?=
 =?us-ascii?Q?RvJfZzlkYXMi3eWZkIn9ejJxLSagl0qw06jXUtnGQDvAvdzBnFT9Ono/YXzM?=
 =?us-ascii?Q?LkNE04iOdoPOZHvAyhiGeoAizNe80eTESvsHWclov+/1q9MUtHt2yVLd1eRm?=
 =?us-ascii?Q?WspLa+pepEJb/c5/H+XWqc59OSg4XO7ZusME3nLQH1QYwTsMy8Cq6/YKJMrW?=
 =?us-ascii?Q?BNZGC4xxjXn6PwCt023HRzH2pgDJ3mf57zxQ64BJjs/27piYtJBHcKcLASf0?=
 =?us-ascii?Q?4mt7n8jenGhmSaV3p3xT1MTWMpRjSlGWNzPMKUl/QtApspYd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1381fe6-7b53-4eab-ba56-08dec3153953
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:15:05.7788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9I3Z3yhGVdBy9bt2UyhqB5ujHMNeiELqvhDDzXcd17N9edpIFV/0TPOyTpzuoVIUUbrcXE8bdkFaT7uUgon7+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10420

On Fri, Jun 05, 2026 at 07:13:04PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> Add runtime PM to ensure the PHY is properly powered and clocked during
> register access, preventing potential system hangs.
>
> It guards register access in the following scenarios:
> - PHY operations: init() and power_on/off() callbacks are guarded by
>   phy core
> - Type-C orientation switching when PHY/Controller are suspended which
>   needs explicitly care
> - Future PHY control port register regmap debugfs access
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v4:
>  - replace guard() with PM_RUNTIME_ACQUIRE()
> Changes in v3:
>  - new patch
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 62 +++++++++++++++++++++---------
>  1 file changed, 43 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 591ddf346061..27aa696f5dd4 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/usb/typec_mux.h>
>
> @@ -136,17 +137,15 @@ static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
>  {
>  	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
>  	struct tca_blk *tca = imx_phy->tca;
> -	int ret;
>
>  	if (tca->orientation == orientation)
>  		return 0;
>
> -	ret = clk_prepare_enable(imx_phy->clk);
> -	if (ret)
> -		return ret;
> +	PM_RUNTIME_ACQUIRE(&imx_phy->phy->dev, pm);
> +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> +		return -ENXIO;
>
>  	tca_blk_orientation_set(tca, orientation);
> -	clk_disable_unprepare(imx_phy->clk);
>
>  	return 0;
>  }
> @@ -620,16 +619,6 @@ static int imx8mq_phy_power_on(struct phy *phy)
>  	if (ret)
>  		return ret;
>
> -	ret = clk_prepare_enable(imx_phy->clk);
> -	if (ret)
> -		return ret;
> -
> -	ret = clk_prepare_enable(imx_phy->alt_clk);
> -	if (ret) {
> -		clk_disable_unprepare(imx_phy->clk);
> -		return ret;
> -	}
> -
>  	/* Disable rx term override */
>  	value = readl(imx_phy->base + PHY_CTRL6);
>  	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> @@ -648,8 +637,6 @@ static int imx8mq_phy_power_off(struct phy *phy)
>  	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
>  	writel(value, imx_phy->base + PHY_CTRL6);
>
> -	clk_disable_unprepare(imx_phy->alt_clk);
> -	clk_disable_unprepare(imx_phy->clk);
>  	regulator_disable(imx_phy->vbus);
>
>  	return 0;
> @@ -686,6 +673,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct imx8mq_usb_phy *imx_phy;
>  	const struct phy_ops *phy_ops;
> +	int ret;
>
>  	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
>  	if (!imx_phy)
> @@ -693,13 +681,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>
>  	platform_set_drvdata(pdev, imx_phy);
>
> -	imx_phy->clk = devm_clk_get(dev, "phy");
> +	imx_phy->clk = devm_clk_get_enabled(dev, "phy");
>  	if (IS_ERR(imx_phy->clk)) {
>  		dev_err(dev, "failed to get imx8mq usb phy clock\n");
>  		return PTR_ERR(imx_phy->clk);
>  	}
>
> -	imx_phy->alt_clk = devm_clk_get_optional(dev, "alt");
> +	imx_phy->alt_clk = devm_clk_get_optional_enabled(dev, "alt");

when driver remove, devm will disable clock, which may cause refcound
wrong if device already suspend by runtime pm

>  	if (IS_ERR(imx_phy->alt_clk))
>  		return dev_err_probe(dev, PTR_ERR(imx_phy->alt_clk),
>  				    "Failed to get alt clk\n");
> @@ -708,6 +696,10 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
>
> +	ret = devm_pm_runtime_set_active_enabled(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +

You have not set auto suspend, so runtime_suspend will never entry.

Frank
>  	phy_ops = of_device_get_match_data(dev);
>  	if (!phy_ops)
>  		return -EINVAL;
> @@ -735,11 +727,43 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
>
> +static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
> +{
> +	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(imx_phy->alt_clk);
> +	clk_disable_unprepare(imx_phy->clk);
> +
> +	return 0;
> +}
> +
> +static int imx8mq_usb_phy_runtime_resume(struct device *dev)
> +{
> +	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(imx_phy->clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(imx_phy->alt_clk);
> +	if (ret) {
> +		clk_disable_unprepare(imx_phy->clk);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx8mq_usb_phy_pm_ops, imx8mq_usb_phy_runtime_suspend,
> +				 imx8mq_usb_phy_runtime_resume, NULL);
> +
>  static struct platform_driver imx8mq_usb_phy_driver = {
>  	.probe	= imx8mq_usb_phy_probe,
>  	.driver = {
>  		.name	= "imx8mq-usb-phy",
>  		.of_match_table	= imx8mq_usb_phy_of_match,
> +		.pm = pm_ptr(&imx8mq_usb_phy_pm_ops),
>  		.suppress_bind_attrs = true,
>  	}
>  };
>
> --
> 2.34.1
>
