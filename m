Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011048.outbound.protection.outlook.com [40.107.130.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C376405C45
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 15:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780671921; cv=fail; b=bG3yR739YzwGzJKuW0Xtc+07GYvWbqmuaO7DpEreEUooy80J2V6F0ZWLtjnvmRKyS4z21+uNu0BgDqwJ3I6V2UhS65Q4ctenqykGJTQwt7R7fEcfoukfj5J/fEpMA/9/qWBTtzvAG2NPooCym8AsGUQ2f9vslKCDPTpM61jwAto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780671921; c=relaxed/simple;
	bh=19iCV4JkqCGFVssobatJmFsymfju5XmT4IRnd5bvcG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Krkzk8vzG3RMbMUspJImjodzmOeXXwcBdrSRw4fKAD/xBMV8VAGa1LLjlGKvrs6Zls1L28kCwTli8ZkyoOCEIosI+OsXHZeV+U+98Z+jNW8i2f+VCuP5acl3foHinR6oa1IsO0aXE+dlCRleSiUJYgzBOKfd6Z0qZu4XVSxJcAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FKeoyrpQ; arc=fail smtp.client-ip=40.107.130.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FKeoyrpQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SfwAQ1EBqpC2PnAeKBXyxnoHJPMh9k+7VyiuU0+eqjbp8ps9gGH3tjbAmAKJyGmvHVtGVHMup/dsRAz17Zm2qyHsifkicnAc73ByXRp2Dve+L6sioXgSWLh/mGoXe+mS/gjEKJaIgthL0vBOG7bZmv8sfjtqKYdIiHiw5q7wP9Y8eeal7RaGbMLYc9KDRvr2u61Jgrlm4tOvUdmcsW3qMeksXVya0FxN0OqSMviROCe5g0N+4+6u2u3b1cD45Cb3goCEx130wptJJOG5epZQAd5d+IfX05c+FdUzbsFxD3m18jWC0OijUHPLcUNeF9LBd0aCdwi4TrY78kezbEhfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6Jdk6CW/KZUwKTDFuE8sHFpXNZKsEa91DBlO5ovNHc=;
 b=lC+ER88lklV2kTCIl2qRePZUx+P+2Q3UryiteFbvOVqFZJxWXz/3EEyw1V4ssWJhY5GWTpF0NFVjnltwp7yhw7WOitZd1pKWY9GL9tpuPvvVsCdPw/tT+nsLSx3SQvBMZFvHl9SD9HqVaEfE+j5PkpRDr9JEM5DdPMsecsS8l0iV9yMtuB8Pma5zsTgQMtQ3EFwCamrn35x+NSANOzAKxl/nKIddVZq74Lkxit+5zNvTv3XcBPd7Ov1UsvNVNE7Lm/cIVrJQbOU3NbQYpENkCQyAxxoDyFezkP5m877KpSaX3nh1tqsoSdibUehbXouHzSpVjI7j3L6BHsb3HewCgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z6Jdk6CW/KZUwKTDFuE8sHFpXNZKsEa91DBlO5ovNHc=;
 b=FKeoyrpQNKNSyrxfSZsqQ7EYTntY5jMlHUFxiwr7RfHElM0obutvZfkDK7msi/7sRSQXisQCnNATP1e2DTKwTvJD9TU0+OiVBJSGOORYC+00y6t6xB4vtmu9G2iEivrDOh0mK3HLpe7AgqlT7wGFmKoE2FG3mPVqDJe6cCDGXCShn6zoKKzuUxPBbBVvdVshoG5QzBUNmD771t4pvujTCjbnXYAkbEn0JmxwHV+WGUaMlkLWbRXZ9Nsaddg1m/+gp8eS1thsbhlhjWaljkeRNu/TKQdzZz1Y/oGLHq9a0/hYGsrygNEXIae8aGOi72o8BBFZDJtSoZQS+RmLQnRF8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10604.eurprd04.prod.outlook.com (2603:10a6:102:48e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 15:05:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 15:05:14 +0000
Date: Fri, 5 Jun 2026 11:04:34 -0400
From: Frank Li <Frank.li@nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Liu Ying <victor.liu@nxp.com>,
	linux-phy@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: freescale: phy-fsl-imx8qm-lvds-phy: Fix missing
 pm_runtime_disable() on probe error path
Message-ID: <aiLlguagrKeFhRkV@lizhi-Precision-Tower-5810>
References: <20260605-lvds-v2-1-3ce7539d1104@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-lvds-v2-1-3ce7539d1104@gmail.com>
X-ClientProxiedBy: PH8P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10604:EE_
X-MS-Office365-Filtering-Correlation-Id: 899a793b-3799-45c9-c2f1-08dec313d87f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	DqdEjsDavQW826oy+5k0wcO8hwCIgIEPNhr/hVKvIOWh1UXRRA2f1NL3NS2/mnco72IUJja1AaReimqBAkay1zrB7qrnYjwuglPQJvdkflLY35JygwkU9CS2GNZZvEtu2E3ZvHmncqH0dE+S79OLavzjUNfjJGJ7uQlh9OTUIJtzEL+2qEe9l78bQkxIH6TpNrPslkcd2T2YJkAkjL4XGeDw8KJCJ4zbWisBxpmjvIqB1fyu6vCBlv+i3snJ+1A/QSwsuPnP9fDB4KPi0oOiJoc6QH5iWZslCtogyDZ1mrTLrqlVFudFvri1D4kMXTaHR8dO++3fpYJz8NRr5Ulyze/a0mPuU7vu57VnASYI4ubx8S8iHDxdPODki7ugK+55HjfyEcVkS+DlLq4y2FhIKr7wXndldfvAA0hR8foNrGTWMgfUHvIvJezFOtjfzhTUpM5gLTj4sznEOeu3EUIh3KMFYlZl9eIS7Fk06axRRZZLYJUN7fV5dmHrQWyu2XyhZ8XkSwR3Y/VwGSyi/lx8bsUJbVvv3bMs4GS8CBaRtKwfHZpDhss4I+6gC4S9VzJ92wHMtayLapMOjrMa+pFSv04YAtcwZAmaLHZqYjiODr4XdY3YXcLzT+ZSaM6kswGxWR+nHeQG86DTaIsIRxlg8/W2wXhFBu+iy/gwkdDQLuIrpjYi5M0xWYtfvreGiSLkaF9f0N1RvDAwygDoo+r8CA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6+lF3RyMECziajSjwVa4iURcR7E8rA/OReVB7H0bgs8nfd7rWXKNFk3JG9+K?=
 =?us-ascii?Q?2ZC5IcWYZZnSK0PU1QmbZg6ZmxO6x9lK2Mpicu4RwLwPc3Tg4ioHMMVp5Ywx?=
 =?us-ascii?Q?1hUUWxBLSNma4NLfuSBSsEX2yrSY3Fg2Xr98owLSiFg13Mq6hEjUuvwwR7u+?=
 =?us-ascii?Q?h3y9y+83HoSK96xBmfPIufrxn+4LdyWkUfjfZgTDxR7RopCBj1pm/Z9qTWhT?=
 =?us-ascii?Q?T/X9266MuBTDZYaZEPZUI3mKIsjebMy2x9dsZgSW1N7Y0HaJNAAdOnaGjs1d?=
 =?us-ascii?Q?vnPcHo+3dsY/L0cilN8HeE6mqqoyCVB4vFaWSQmeZRb28uaPOOvcq/BMiApM?=
 =?us-ascii?Q?fAGwNIQi8yKGMzMkV+qxNlLwDjha+FwO9COBTow23mEEQlsyGktSp1yIy3Ro?=
 =?us-ascii?Q?VKJpL0s/03CLLReajqYQ6Ho6I4xblEsra4JcNixz0smwOtPKwch1sywEa72i?=
 =?us-ascii?Q?JT3SgjRCD76m6QBZWezSmCobSRHs+o2X3YBVeDyEs8UVDmisJ8Rxbm99hpgz?=
 =?us-ascii?Q?tG7GqttNfvIOzNJUECF47deLgjNDBbdtqfAcHmuyTocoqHcyqRZ5NzuKAmjx?=
 =?us-ascii?Q?EVZpPf8HQ3nhjkzerMYSOzjHIv2A/1vRyPHdh+Jnmu+JpXB2Q88oKxhC10G3?=
 =?us-ascii?Q?NA4iU+nO7OMbOgeUtWC2mLuCSvngOs1QBlhmEBqE7J851bPUVTAmJ3f8iy7W?=
 =?us-ascii?Q?W/s1AOGFnPfTjOWUjYuELNAjar0soJXt/LJ1/0TIwjMD2vboko9FrjcXnqfE?=
 =?us-ascii?Q?0MSP4UMDbO7AEsJnHjC1SJoJKKfFmj1mXk99x7WI/CPrZkMQZN0+y60nfmql?=
 =?us-ascii?Q?nHX/lhs4FPQvVHHL9ce2WIPNC3joJBP/xuxgoJHQ+eKXTHr5S4b5imGw+3Jz?=
 =?us-ascii?Q?J6OMQybpTy+dImrxtF4OD/jPtIamr/h3IdoTAmip/bxV2T63GWRed18e0MPb?=
 =?us-ascii?Q?yDPg59uYOjpj0kOLCVSar5QkAnW6bY9WlGCO7wRn3UakhPlOvYrXFur4cCHj?=
 =?us-ascii?Q?P5ELsgpZVbbTS53yYqw4LD6Agw9s56WA0qJuOQzcNfR2VjBUSj0cUdB8eOHp?=
 =?us-ascii?Q?ilE7N5tRDBt2jSUEujWc/H9w7EgefYwtQteq52k2XHuGNzHq86oQbhYjb4Em?=
 =?us-ascii?Q?QeDOesquXgATXq0oc+EKwk0LV5n45UbCFIJMwBEu5zg5F1QwYOsFI7xtv0Mv?=
 =?us-ascii?Q?ogmEpXpz+AJYwnLcNIMO06VXef8udXIGu7I+y1umhB+hbFMU+oGriL6zuNlO?=
 =?us-ascii?Q?IBUM3UT13+OLS+G+BGjSBW7su94VDks49WOsJ6tgP7FMgJGPcUohptKZjVAd?=
 =?us-ascii?Q?P7R9ZGgvzSk6vPNRmT+C68KceU3ITuvv7Dqx9fWd9StCYFXz5CAcSha8AgfE?=
 =?us-ascii?Q?abDc0dbF2gTYrHuy2rLjhNO4DwKeZ6t0y+VyWuN/LBHppZf/DZ+UpoqhGWvL?=
 =?us-ascii?Q?wgpzKzm2msdyy7C+LF4zzHttScdv7kR/Omkz6LFlIjahuslxWdVd7uj/T+sF?=
 =?us-ascii?Q?2UxFqTNeUsz0NEEPgreOQW2wEKzt3d0DXNUuBuyLsoQ+9L3rN8uV3x5S8Gz4?=
 =?us-ascii?Q?henQlZS9zUHtbjORX7jV12LGXX3ejoxNb867OffJ3pz/c34/csIMPeexRfzI?=
 =?us-ascii?Q?RQ74rL3UjD+iXWwWyFwGd6KwhLsLg2/LbYnbNvu8LHiW1nQ7/RCNInr07+dm?=
 =?us-ascii?Q?MbCcd7tqwXXNTFy1jHeDtfp2YLr4mIDXwEPTGnX9QnF7Nyfw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 899a793b-3799-45c9-c2f1-08dec313d87f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 15:05:13.9445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X02zbrFgXCn0mcTBoCYnKYiMwPE+4y3/+Aqr2hKSWmhoNaH9Dun/K3zd0YnkM47syyQdd1okeYVWC0l1KzomUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10604

On Fri, Jun 05, 2026 at 07:57:20PM +0800, Felix Gu wrote:
> If mixel_lvds_phy_reset() fails in probe after pm_runtime_enable(),
> the function returns directly without calling pm_runtime_disable(),
> leaving runtime PM permanently enabled for the device.
>
> Fix this by using devm_pm_runtime_enable() so that cleanup is
> automatic on any probe failure or driver unbind. This also allows
> removing the manual err label and the .remove callback.
>
> Fixes: 06ff622d61d2 ("phy: freescale: Add i.MX8qm Mixel LVDS PHY support")
> Acked-by: Liu Ying <victor.liu@nxp.com>
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - Change the patch's subject prefix requested by Liu Ying.
> - Add Liu Ying's Acked-by.
> - Link to v1: https://patch.msgid.link/20260604-lvds-v1-1-b8e1ff1bdee7@gmail.com
>
> To: Vinod Koul <vkoul@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Frank Li <Frank.Li@nxp.com>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Liu Ying <victor.liu@nxp.com>
> Cc: linux-phy@lists.infradead.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c | 24 +++++++-----------------
>  1 file changed, 7 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
> index ece357443521..c662f91e598c 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
> @@ -345,7 +345,9 @@ static int mixel_lvds_phy_probe(struct platform_device *pdev)
>
>  	dev_set_drvdata(dev, priv);
>
> -	pm_runtime_enable(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
>
>  	ret = mixel_lvds_phy_reset(dev);
>  	if (ret) {
> @@ -355,17 +357,15 @@ static int mixel_lvds_phy_probe(struct platform_device *pdev)
>
>  	for (i = 0; i < PHY_NUM; i++) {
>  		lvds_phy = devm_kzalloc(dev, sizeof(*lvds_phy), GFP_KERNEL);
> -		if (!lvds_phy) {
> -			ret = -ENOMEM;
> -			goto err;
> -		}
> +		if (!lvds_phy)
> +			return -ENOMEM;
>
>  		phy = devm_phy_create(dev, NULL, &mixel_lvds_phy_ops);
>  		if (IS_ERR(phy)) {
>  			ret = PTR_ERR(phy);
>  			dev_err(dev, "failed to create PHY for channel%d: %d\n",
>  				i, ret);
> -			goto err;
> +			return ret;
>  		}
>
>  		lvds_phy->phy = phy;
> @@ -379,19 +379,10 @@ static int mixel_lvds_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(phy_provider)) {
>  		ret = PTR_ERR(phy_provider);
>  		dev_err(dev, "failed to register PHY provider: %d\n", ret);
> -		goto err;
> +		return ret;
>  	}
>
>  	return 0;
> -err:
> -	pm_runtime_disable(dev);
> -
> -	return ret;
> -}
> -
> -static void mixel_lvds_phy_remove(struct platform_device *pdev)
> -{
> -	pm_runtime_disable(&pdev->dev);
>  }
>
>  static int __maybe_unused mixel_lvds_phy_runtime_suspend(struct device *dev)
> @@ -432,7 +423,6 @@ MODULE_DEVICE_TABLE(of, mixel_lvds_phy_of_match);
>
>  static struct platform_driver mixel_lvds_phy_driver = {
>  	.probe = mixel_lvds_phy_probe,
> -	.remove = mixel_lvds_phy_remove,
>  	.driver = {
>  		.pm = &mixel_lvds_phy_pm_ops,
>  		.name = "mixel-lvds-phy",
>
> ---
> base-commit: a225caacc36546a09586e3ece36c0313146e7da9
> change-id: 20260604-lvds-d67cb619df17
>
> Best regards,
> --
> Felix Gu <ustc.gu@gmail.com>
>
