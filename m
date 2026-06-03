Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022FD38C2C0
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 18:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780511791; cv=fail; b=ovA2oP0y6K+b2iQRuNchNbCzfFEgE+yw0TkmmOdRnQ3En+BU58XsKlZhyigYGINzrxoH40iUGsMj0tBD7/vHuKLZNsuXbOiKzFpr7u+JppaVkZb59NmOXtOYywztY79p6lnrJK/nBfjPI1Kou0GAV0w7LLD/YGoBEb1Mpka+OEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780511791; c=relaxed/simple;
	bh=UrHHHW2rnrgRS7ZhnX4N94taaUOPoY4TfBGEeSJR+bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HexvnWUAPWqh3nayhJUBSHqRRA9563qcVoPmgLk1qstWDd2iorVDjIsx/D8S5uTWkzbpJLMuKcPTZK3U/OCSJ1t9tZcT1jvI1lhUx79mab/oL0H5IYritpJUssyQ8ltHFWQjF3R7/LS4oWutYWVQlBBOUl7LnzR8zbQvCP9mbxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZecSkztw; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZecSkztw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAzl2iGlDAwLcEhJMng6qjllGXGCbPJowupSp61JWbMvoa4gUNGB/cbmeNmNUJDvs9BlpDyBailxsPnNS1kVesQcDkbcg5e6rFhfw7AyONQGzSQQgxeoCnJGZL13/Xalrcd3U1srRJEKRI+KH15lQdnsDLehr7W1s8psyu5u6kG/vaso5LHSRCt+CXlURF6dXkfoDjeKitNBLxtreNZwZrY8lkXOPmszPQq9vEBM8uqZqUd6B9WAQeOfxa6er8SsOJRtksTd1WMsciFaI6YHkwh/RceF8lwaQvIEXEi52gPL9yY4/9TUCQfKTNjK1744A/AWohyXF0JghdpezZo7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irviGItkfS/d9z+DecVjWqRYKst9B50j6Rb1MPiBiYc=;
 b=JRhDjSaOGpmc72I9x7+OhmU7ox5duWM852JQQLjorws9UMHL00STYvSG11st9czZzARI8uSlteGKqnTNsKq5d/+lcu6VdxoCE7slvxFhM7hgRJP6W5fLx5YKNXVs1Agz/vfj5bMRbkuOqHhsGZLS6eWiA9FcESfq08NsIS2H3Mr+wZZs+UYwh+v/RhLLtZ0vyo7zwZZu5GVYRwBLghHTFqtydzEJtRnDStV5oPznh39P6os0MyiYL0WPa7Sij2wJl5stRZ9cFtn0dP3rgBFJDRLtqi0ZeRHBP2aBPzlefpikPuBR0bDXfP0iEmtrn7vprNIpFMZ2JafyM/3jl6LpCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irviGItkfS/d9z+DecVjWqRYKst9B50j6Rb1MPiBiYc=;
 b=ZecSkztwjPq1QczQyFCs+oTXkB5eGLxFo8TkgxKpzik7aEoHpAEVxg0IxuEeXDC8d40SaOaZjHy6tqQj8XWKOb9fUp/GM3QXhGQTeKNroAcz7YfKbnuusYQj4isiMRKV5hTYA94HCZ1pJj+hJEaZP4au+2nZaHyNKoFXb1pvwc/ifC5We6u/uAROJgbzW+VsPv7vMkLFtio26caR9XMl2uNq2mrsvr/hkm71GPDplDuwPUCuj/VGV/6/tgYDkm/sxSF5qOMFE/jqY9g3U1LvneH/UBW2t0bX/0GC+EXELBG+qzMbS8rbdO87z2Msyvt0XZjKROP3ojScQHpAW0YQBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6926.eurprd04.prod.outlook.com (2603:10a6:803:133::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:36:25 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 18:36:25 +0000
Date: Wed, 3 Jun 2026 14:36:18 -0400
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
Subject: Re: [PATCH v3 3/5] phy: fsl-imx8mq-usb: add runtime PM support
Message-ID: <aiB0Ivrz-Y-Ilv_W@lizhi-Precision-Tower-5810>
References: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
 <20260603-imx8mp-usb-phy-improvement-v3-3-7afb8f89abc6@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx8mp-usb-phy-improvement-v3-3-7afb8f89abc6@nxp.com>
X-ClientProxiedBy: PH7PR02CA0016.namprd02.prod.outlook.com
 (2603:10b6:510:33d::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e42b197-0609-42ce-2ee5-08dec19f04aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|52116014|38350700014|3023799007|22082099003|4143699003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	DvcrF7Kw6juyM54R7FPohCaXsBSx1ETrPwkxEx4ifUAKMITSYq6yqsWcv8H3CgM05dR1oTx1tHuthzI4npiBO3sv/O3dxwITqD5BIAx+ecLUWgoQovFJStoUoVLzEIHZ49xfeQhL1xSnuUbVUg5LfINwHCCQzvsLXwWzEBiQulIaV5DhsfxKSZD9QYeINIoYitL05/0N3yIVuFkqfHQtMu8xnImpwt/n9WzU5oACHTMAFuzo21Yv9AvnHu80Yp+ZCod2s8qdnwAxXHg2xnuQ2Auok1kW6Moqo7wRgYfEW1ZsXvI1VZ8UWHIWtl1yiU1rYjg2niw5FcA1+CxX/7oqLgxxiXYafNe+01zKjK9Bfxpavjr6+Nyi6Y1oS0kBVCUrzskmjGxuXKWboPt3M0DmttI+lNY/okjvaVx3VAGPqPuUUAwiBZ7Toj++/mEg/yGtGFFdwiNp7A9s/mDWYnn2Q+uQhjsJGHnmS8QRPQpTsu03f67qpBi26L/Vkj0zAMw0EWkPs5lKfPH+x+YIzTw+jSpHOaW9lgEAQ/7twKAbNQchtaCZbamePbyoJRAl3yJEcj6QIb56g1ZAKDFckU1t7Y/u8sbPIg+DknWvhtKy4AkTiAG2s5XcaicWdNWAm2XlAolL2pQXg0/UQ3eWJjgs1msJ8g+TkrAAND/zOFoyaC+STZfVb6laO3I4SwuqTJ5LUnf1ODRnHjZj1JkNN3OmFmb7PzuY3eMOxuKkgmcRadEwfvnQX8ngjtBW2PclOdFN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(52116014)(38350700014)(3023799007)(22082099003)(4143699003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ne3SgI7GfH6i2r+Fv6IeJw6RGLZZRDVNOF5gOXcsI88J86TKaE43jxMWj+hk?=
 =?us-ascii?Q?EYXOW422n2YlD+1EOx+35MBLsoLuSRW/Z0dsTXhponJWEny3rY5LZLYuXUwj?=
 =?us-ascii?Q?qlqau08o0wpbJ4AOvjGaCUMYLw7MYYEjcmx6yliaUC4LQS2SM7Z2g9WAE3Of?=
 =?us-ascii?Q?Ew8pesC2iGnt+VLCa2xLPzK7Shn3dvOtsh6O0sKEKVqkfcFHk/rciKBdd0yZ?=
 =?us-ascii?Q?j7ibNRHNY3pgwd+UKvRDvVmIfNtsGJJU1iQmULS9mYms7KAOdIu6YU5Yl7OZ?=
 =?us-ascii?Q?CgzjBaD+Uy1K1n9+sSFCbFW+Yxd24MTCxu8ywVOIIceaWFgWzZ+uTsCRF+bL?=
 =?us-ascii?Q?WQWFTyL+QJTN1biw5/t2xHy94n/qB+PaHdc25Fn3jiYgp9Ng5KdijH5sJNWs?=
 =?us-ascii?Q?P04GPYihpiyelDpHi7kYpTaGfu6lfcjp2NlhIzvhAB9vI3UQ53SF+m5e+F0z?=
 =?us-ascii?Q?njRJX6J44/QDFz8pGiqqG4pSDLZ+BwMaE3cUgeNX24wKOvbQIID+07fAj4RU?=
 =?us-ascii?Q?UM+GBUdci0Ede9WcsG1vI4WlqP31ywDR2dPLT0cami/u74WEs52pl+quwarG?=
 =?us-ascii?Q?i/SSK+d+2XdwYqQUBojUJ5wRG354DZeNnyM3oy2mBssj2fOZw4mBHKM80T7k?=
 =?us-ascii?Q?MrXOyXHA/h9cAqyxeEPyQyzuJWS4uCa8YRM1D9IdSRN+UgSIOQdjbs7Xy8Xg?=
 =?us-ascii?Q?MxagDsbESrSaeW5szrGd9/z99mY8vnZdcmqCj6QCSUCkT13Dt/VFSwd8EiSN?=
 =?us-ascii?Q?EVA1mKbgiwq/EVN1wXbpWZBLKt0ArP8BCgyO/upjGpigt+AHWc1c6ia/XpGU?=
 =?us-ascii?Q?tRTgiXbxDDS3NnBTc9fne6Uc2QZhagDEQY3WhCR0UR+VAXlxVfqYsxVWDKrb?=
 =?us-ascii?Q?KrVZ/2I4aVYarP67flzRXyCoX+0gwYxa2Lz/gULYjSimx2L7EEx1nDZINEcL?=
 =?us-ascii?Q?sa0RVKd90ZyVxOEHlomwCbHJ8CeoEfQ+iPcwlodZYPaCWofVa6ZHR6X9AY0A?=
 =?us-ascii?Q?YATT1qCQXiJutt6SNCkicAwuI4h0fgifo3BBMU9CtY480MVg7ns+eLSkWkOu?=
 =?us-ascii?Q?xovRsZ4dKPKax5soTs7K+mch3PyJ7HnCxZ4Ot6Y0vZJm2BFvWq6XkevkEZGy?=
 =?us-ascii?Q?r3VcXp6tTgzrKmd30tDYbvgPwQNEa0T/yL+x1cWNIN/grRv6kMgjF3zOb02t?=
 =?us-ascii?Q?s2nBMyjLPrBhFfFRiXAs8MOIcnt7fhoN6tRZ/FfzSbdW1pjlPsa/eutkBH1A?=
 =?us-ascii?Q?2BmA+ydWI0FbPShMENZxMjJRuMeTSGjbJMCE6nxD0kyFlMoByvafiRh+tMqt?=
 =?us-ascii?Q?m9lAmC1mWGd1XHy2zf4bpkD95YSJLsBoyeWyAboWiUEM/IlrbbbYea1XsKvg?=
 =?us-ascii?Q?rCehXZEOHG3DCfr3ituM7jpNdxZpjHV19BRqf+zLTVyW2k1pm4OaMBLtTks6?=
 =?us-ascii?Q?pvk+SfughRzkc3owWQf+iBsKRxxufiShF1tGq+3h5cblKqn5Qw+UPJru4kya?=
 =?us-ascii?Q?4xalo049GkRnnV/0EYJaDuL1MEnrfTVtWXARI/IUPz0Ln15JjHeAxTfKQ5lj?=
 =?us-ascii?Q?c2K3c7oSsVnCuJykGoCxbDoymAP6wNMSiVlOloxn28oea1oXwbHBwX5Cys5A?=
 =?us-ascii?Q?OeeWewJVrDzXaUyMAQG171D2UjUEQHSA2wCHPiCYKXbl7JPcqHw0ygrFrAAm?=
 =?us-ascii?Q?eszhgkdicwQneigz26iortQbcmXX7D3n6JhbBOpIyNn768NM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e42b197-0609-42ce-2ee5-08dec19f04aa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:36:25.6733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOPmnATlWJBnerb1+YbhdwOAWIdA66HUmB4GmycYCWUo2BZ/9lHs5LXvMHI9+wr26785h75j0wOZqCU4BnhV9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6926

On Wed, Jun 03, 2026 at 01:37:16PM +0800, Xu Yang wrote:
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
> Changes in v3:
>  - new patch
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 60 ++++++++++++++++++++----------
>  1 file changed, 41 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 591ddf346061..b0092c34416e 100644
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
> @@ -136,17 +137,13 @@ static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
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
> +	guard(pm_runtime_active)(&imx_phy->phy->dev);

use PM_RUNTIME_ACQUIRE macro

>
>  	tca_blk_orientation_set(tca, orientation);
> -	clk_disable_unprepare(imx_phy->clk);
>
>  	return 0;
>  }
> @@ -620,16 +617,6 @@ static int imx8mq_phy_power_on(struct phy *phy)
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
> @@ -648,8 +635,6 @@ static int imx8mq_phy_power_off(struct phy *phy)
>  	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
>  	writel(value, imx_phy->base + PHY_CTRL6);
>
> -	clk_disable_unprepare(imx_phy->alt_clk);
> -	clk_disable_unprepare(imx_phy->clk);
>  	regulator_disable(imx_phy->vbus);
>
>  	return 0;
> @@ -686,6 +671,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct imx8mq_usb_phy *imx_phy;
>  	const struct phy_ops *phy_ops;
> +	int ret;
>
>  	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
>  	if (!imx_phy)
> @@ -693,13 +679,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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
>  	if (IS_ERR(imx_phy->alt_clk))
>  		return dev_err_probe(dev, PTR_ERR(imx_phy->alt_clk),
>  				    "Failed to get alt clk\n");
> @@ -708,6 +694,10 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
>
> +	ret = devm_pm_runtime_set_active_enabled(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +

you enable runtime pm here, when runtimes suspend

Frank

>  	phy_ops = of_device_get_match_data(dev);
>  	if (!phy_ops)
>  		return -EINVAL;
> @@ -735,11 +725,43 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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
