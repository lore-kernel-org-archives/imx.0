Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E7835DA6A
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 19:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782846394; cv=fail; b=JAhJ+aosNfPTA+bba+7Qr8uYXqIZOD78uYNP8+36YiB7ajV4dDtE9aY5K0dDdYZcEyekfiD0XdTSgZXALDnzznE7NnDSRJdg+2Q85MJP3FlA7z6ai+jBr4a49TjeglQjfETRK4Plw1hXoXWr88rABrcOpOsV6Q8bMcvVkJsj+Dc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782846394; c=relaxed/simple;
	bh=FdUdwIIgndmWVGTKF45hYuWfH84wBwtDjtGnGm4wayo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AFHSMNquwBXJ30T6aE4o++dop+MdnYi7kW08Ikh4oHT42+RQCvs82AzJjDvAeknDDTceeiu3mMqjdk/hillW3CakdeWx7nb/M5l2/QfD+cgrVhZ0UHtEG+EtjsI0KkYXJJ+WOjNeN6rwiWEv8/oOYSJcuy/jygX/JQFdlnaZZs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RAAOmRa2; arc=fail smtp.client-ip=40.107.162.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RAAOmRa2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSWoqBThFrHjzjq8wLoxKxmPOh4Ze6XDQUm4brroEaa8HCQeo5AFid+tQ/3S4bMwW8Vw/EL+7NBkluISZXeO3sObDsotEH0/qnOtBfk+QNlxfFex3xZYxoD1SVjlGJOWtCOY0PVmSlNnpZkuCdGjxwUuKns6HkbJe+cAnq3XlUotBGn3UYTFV4raI0PCDyJqcmmhjbm966/PQ5ONEkVcoofvSE36qsLruZs/e0R67krMo6enp7/aaqFgGTmu9QdaNclM6DGlFFpP2DZvQbaNgYlVOyWG2ns3gWmiG4pKm/Ht1dn/2rrY6FLHbf2+niuHieiQqii8P6igkfDgS2HOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKQXQauBcinkN9LtmNTgb3xnqLHtUh8kbL1ZJW+M8/M=;
 b=OGDvPruouPBiDpKc+MW97dvRWNSEyDQlQIbOPyUUeaS4VP1gprXsrWVhQweb9m8aW/An4u9m7wm2tDPAdxDePiE/yh9F3rMrYQwrLvQMlCrxcfLXhJVx4SfNRBrNtx+Hz1T4S2zXfm0PIeDjJvl6TMyfPgh+30T1jFbcEevkUj+ue/chvVlLFwy7HKtMpq8lOW3vhPqsOcMcMNzZvmbj2iJJivv8uP5E2cKQHoHIbsbRMkxw6r4aLHhW+lIrnh4XLecAPPbcLu6Tlyng3u6/cbS8MGLQE3sKcaE9fxqF+Ypqm87Gm1gvpBvCTu8YAIJ8yjk5hPmmlOOV1IOCdbMbHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKQXQauBcinkN9LtmNTgb3xnqLHtUh8kbL1ZJW+M8/M=;
 b=RAAOmRa24fho4O/iqOEMcgNujYDqRUsuvbqjTv6fF8o+fJztbrMHQzVP5vX/6Vhq5Fcy3dGtxAjVlKdvcsgi6keBnL/Cto17i3jRxk1gs+IS5ZLFkgz5o7IehWps1gG0lyZ88ebk9XfxK54j/vJXjtiTmlJFbmCsM9nshsCBfCqrjeF+FFG0xz/6Ey/JKHAG4ijiQFmRm69+4+u0UbzKf0UCqkgmiJoR22dB1iAtwBtEknqSY+gUmMtHumUhoW2I6CumwxGuz0aoyXwaytT/kIHZzo2wuBzcoxzI+5DH6BlN1iyRZQqF+Xjst0vrTGfDL39ypXcNbYqbc6UEY8vyyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8876.eurprd04.prod.outlook.com (2603:10a6:20b:40b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 19:06:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 30 Jun 2026
 19:06:29 +0000
Date: Tue, 30 Jun 2026 14:06:21 -0500
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
Subject: Re: [PATCH v5 3/5] phy: fsl-imx8mq-usb: add runtime PM support
Message-ID: <akQTrWWbnDSr1Nd1@SMW015318>
References: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
 <20260630-imx8mp-usb-phy-improvement-v5-3-25d616403844@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630-imx8mp-usb-phy-improvement-v5-3-25d616403844@nxp.com>
X-ClientProxiedBy: SA1PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: d66fb4ce-b332-4dc2-f46a-08ded6dab0e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|366016|1800799024|11063799006|4143699003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	DeKa+QuJwwD1+SLBwWENFoaCkC6ZvINyYvEt7dCDYkOXVFeX0iol+uLwewfdiAS+nexaI/VncNEkyv0YlVdxD1uxR90QQt/1RXumYIMnXMh4LbF8KFhaal29cRQ0EcxNjN+HTqbmE9svlHSnNmVde1l/FyUOhQ3NrI3ax/w3jkNoalToUpktXVdGk1a4A5uUR8Xbo9GHNVBM4I0Q8udWw+LvqI95XhBNYh+PTUFAzzVp+B5+qcyApnvbJ4MPdhxdEKxO2sONSdgQatVmA5FLn7XWllRVlEEOcPMCOVGljow/26DkZS+Q4tYlmLHpZbdl3PnvWHN7UYmJILzt0rJHZ7BvlFQrSS/on2ikVHTkmzo3krSeK2s4pTH5iRyHtMQ9T2T7R5jpKMkviWZqmqGMvzh96OX1v+6GAakMVvQqg6F/ONXEMqBdsMQ+FhpjDsOKLDU/rYZb0SCy2+I7WCjoeaSz17mr1w8YhhJuBouA120TrFceTjmAdTiK4pkqw4PO1j45CFbaiIiMOFg8IGfM8I85PAHZkUzATQz7NBTE8OtZSZFjQm1M2icqdyjjjC23HZOKu145FR90LxGrFO3egUOfk64PduMmolIRNMLPJYuDFw8ZImcUrq3dhmAOIph6whI8Vsz4AuORrmhlmmzgrEYANTu5jg98OMC9VgMIPfk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K08d0h3lOrx5qL6bGvmu4VL8Upcr4Jbgp8buUP9QaDtjx4BDUzncrv4qM0lE?=
 =?us-ascii?Q?yvByvvAR0E4C8P/9CJCZoIoVqICccXD7MRD5UFgtr/lliNXMwtPNsabYiFLe?=
 =?us-ascii?Q?GG+lNklG3Yr9prFEyRtz3mm30ME2Vyz75ZwMIHXYWG8gVjvP37y9yA3mavF1?=
 =?us-ascii?Q?Xqk98sH0k24dpOT5c5LZbEwPohRhVmVcJz5uNObjDBGuWTuIoye5D/9578L2?=
 =?us-ascii?Q?vbWFe0AfPcJFGNJDeWmUIwExAL6cgjQoqR6izzWodjUPsO89ZBZ51Q+EHD56?=
 =?us-ascii?Q?daFVoWFYazqNsVPBqmhCy1VH6jjmg9NKNB4ZzrjWiOPhtbaFktuKCIG3AOMW?=
 =?us-ascii?Q?tym73MLHP2X/B3+x7sFt2r7GfvvRKCI71EwuJLSdzj6oIxOE/2F1pMMfCUf8?=
 =?us-ascii?Q?jZz8DyZkKi8sSRzI+hH7xgTyr1mxKCC6HKdcahMJhG4QYQ6AKYl2ypbRaWVW?=
 =?us-ascii?Q?hWbyL7UNMyMV/ZtnrN0lNifdpgb0uRo9bHcViPAHoUvKIs+Gal9R6XXLoJAQ?=
 =?us-ascii?Q?jPol1YrMEUveAVpyjS5xCF7fTkikHXyio21WVgQjvLJCr+3Lnjj4UVUzSlRu?=
 =?us-ascii?Q?7IQevxl6RbYwvek3H35N6RR81/9tITxJDy9HPwXEadOuW0Z8NSvKHzYyrXcG?=
 =?us-ascii?Q?5G0U42OamwI4BLI4RAOd+zrsCC+XL9yXVr7Dc0lnaUXQZjLT9txUReziLEC/?=
 =?us-ascii?Q?r9KSZdyMxeALkJVvjRMmqy4lpytHeGFRVdSdB9OPSapcIb6ubXlYR+nSSC7c?=
 =?us-ascii?Q?jcqdh2kIu6OP/yl0c3QqY88NQp6OBiG9ZYOi2w8iyCBmE0B0RxB90/10yXq+?=
 =?us-ascii?Q?TcvcUdQUD6605o7+QFPmInBEBw7+lAdgtCwNAQ7r4BHVh2px9eL0iEgqy4RB?=
 =?us-ascii?Q?m19++Z0ULbtoNqJyLZoX4DiCmh8CIdr4tY46nv19jyN8SS4OSb7lgcxUA1Kk?=
 =?us-ascii?Q?5hJIZALNk6hOuxGR7NJLSFkCR7CFBq0XKKQHA5Uxv4pBWbKdxnQcQfWoY1Aa?=
 =?us-ascii?Q?/4018CyODtOmIeBNyO9XobYDERqQGljV4G9a3vsiqBMwp2bEGgJ3t2gniojY?=
 =?us-ascii?Q?PxhWpJHEXBMT9UxKndjtC2/twggVb3+NW+jRfVy5LoK5EfdAqnjSk1wHOXut?=
 =?us-ascii?Q?LD4/+5qRDCJFC+BnYki7Eux7tiseAr4gbmOuHxEn3pIXkfmVFGLwno7RQt4H?=
 =?us-ascii?Q?eU0sKKjRkrcSm4j34HU3KR/zEA9XMzC6HFgyju07F7u1Fwip+jTELvTi7rN/?=
 =?us-ascii?Q?KRrIOBDx/BEP7Wemx4hTV5dwEfWqNMOXfaKe+brez/0Vg1iKevoD2KOPDO6D?=
 =?us-ascii?Q?nh+jHXMft2IwLujVY8BeSFrZTFDMAFimmWlBN9QW0layjf5wASYu1ReB3axV?=
 =?us-ascii?Q?i1Cum+pA21ZHAGyUv2yG0guv5aaQHNdcs99Jfg4jYNlZJ7Vf6oG1BynsRMbQ?=
 =?us-ascii?Q?ib6i+2sWYLall2ApfwQtXH/J/AN81PGIzEh0LfCZH1HEYoErhbScaUvGmqA3?=
 =?us-ascii?Q?AKISav36UybMFinBylsGUg9JDaaOhIiULpw+D/i73zVf/9tJtQWS8z70K72Q?=
 =?us-ascii?Q?H87X2F4nMrdwbqXi8FKNNK9IgvdPZfbQVuzJZb132Se9t0CuU/M9Su1X1JRS?=
 =?us-ascii?Q?I7WEfT3t4xj3lTmHeFg2u+KYvnwMaJxau1M8gI3dz1v8rAQj0ceNwmmhiQ0K?=
 =?us-ascii?Q?KUddKqf0xl4rHoDAVDDUZI0DALjnSILLQlzcPcbyigeOSAfAvoVEvP84NAxs?=
 =?us-ascii?Q?syVlDvgtUfSxK9J1o+hZdubsPOg0tboE5l5CDV8HuIMwlAnrYFwr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d66fb4ce-b332-4dc2-f46a-08ded6dab0e4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 19:06:29.5654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMg2LRINe2tgla84uxLPda9BT4+RnJTetN83ZCjmBmXk5J/6x/hpG/wV987YFNgLviEzeidSel+G1oiETSDwhtGkXrQZGDCVgA0+TxmQOK4/ytI/YLTXQdJMY5Mp8aWl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8876

On Tue, Jun 30, 2026 at 06:11:30PM +0800, Xu Yang wrote:
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
> Changes in v5:
>  - use non-devm PM runtime callback to correctly enable/disable clocks
>    when unbind the device
> Changes in v4:
>  - replace guard() with PM_RUNTIME_ACQUIRE()
> Changes in v3:
>  - new patch
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 64 +++++++++++++++++++++---------
>  1 file changed, 45 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 3a5788c609e1..9d1dd0e7352e 100644
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
> @@ -693,13 +680,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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
> @@ -708,6 +695,9 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
>
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +

devm_pm_runtime_enable();

runtime pm will be always on active status, why suspend it?

>  	phy_ops = of_device_get_match_data(dev);
>  	if (!phy_ops)
>  		return -EINVAL;
> @@ -737,15 +727,51 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>
>  static void imx8mq_usb_phy_remove(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
> +
> +	pm_runtime_get_sync(dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
> +}
> +
> +static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
> +{
> +	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(imx_phy->alt_clk);
> +	clk_disable_unprepare(imx_phy->clk);

can you switch to use bulk clk api.

Frank
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
>
> +	ret = clk_prepare_enable(imx_phy->alt_clk);
> +	if (ret) {
> +		clk_disable_unprepare(imx_phy->clk);
> +		return ret;
> +	}
> +
> +	return 0;
>  }
>
> +static DEFINE_RUNTIME_DEV_PM_OPS(imx8mq_usb_phy_pm_ops, imx8mq_usb_phy_runtime_suspend,
> +				 imx8mq_usb_phy_runtime_resume, NULL);
> +
>  static struct platform_driver imx8mq_usb_phy_driver = {
>  	.probe	= imx8mq_usb_phy_probe,
>  	.remove = imx8mq_usb_phy_remove,
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
>
