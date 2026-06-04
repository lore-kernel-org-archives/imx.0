Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013013.outbound.protection.outlook.com [40.107.162.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CEC1EF09B
	for <imx@lists.linux.dev>; Thu,  4 Jun 2026 02:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780540386; cv=fail; b=o9LsjcnTYnwpZ5mTLYMgD7LIrQvsmk6lZKgaCArXsvg6rdlJbJu4oCjtwpDjUBzP3kmGeP4CsDNNDR118FKP/TECi/olG2zBsz1gcN39eobX5dKPfxfRoR8VGp4Kwbm2UYYrsYqR/7aSkNwfTmtR2UVk6eJJX7fjAFX4at1rpXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780540386; c=relaxed/simple;
	bh=eiFfn2UKi+b3pgE6RExNMl6tBgBFIf94S8EJ2YkEee4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CYU8FUMgrgWNGPDJ7DsoHfpFbhDQ/AX1eByHW1GbpP4YwwUDyP+APH3ZtZ2cSrrphqu/AhzSccYPK3oebJ+vfOjE45BS3sTN45E9FXDdB0zMDwpV7bALV9x5UiecDwYgt3DIMStdvadv/A6f/lgMYyZ/PvQ0zSY19mJXAuL7JXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UIpB2C2b; arc=fail smtp.client-ip=40.107.162.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UIpB2C2b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPBhvZDjysdIL+4A7toBXORvljDWcRYasa/ryzNOgSTNhBz4KGiG5QktL656Aem9ImjRJN8Jtug+SEtUUoXRlCHdk+jkdffdFSok/M0H4lIFeVz8DDlvGCvEnwlrTnqG02t5glCC0hTTZNACwQ9bRQhf+HFw+Lj+dhwEVGHNd9X35HqtU62dwgtWxGxvBkNzjhbSToWW94rR5rzMy7DV1KyStiWe9BbXrBY/lKj0hYFQpQ1cOzmgLROSUi5397dUGF/JFau5bPJ3MPZQLAnaEG2CssQB3QWLBWCkdBeQU3BQZauvXAcRB6kWDuQ4wBs1zosXk6YBCRZAtZowI7JoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n3HJiAToIzviqfs1+BOqcXRLWWJfot2TWFUCJ8QTJJA=;
 b=h0Ku/EQUDpKPuMws642FDaJHxTSZpSSckcQf8xABt50WVWuc7ujvBqmh1Vn+hUEbonNcNT9tPhGlnisJvA1CRQ5+364FbKjw2888IAXq0j1BkzroF+iFyOYv3ATr8xe9zMzNkdc/7yqfkKc3CBzwf1cG93SLTe5d0RtfHO3kBCNwz5zBKYLqIni+tal38tynw0stSSpAu8WaFR8etKIcZ9zrLqjkyOeXR9++WwJPmxwjCzEguerdDL/We//twhX7OgGOSy9vinopGttKbZjf+U09O+oMsJr6gUjN6NEez++ihVRB2fgBiwOcOzKFDrN+9ijl+NTRABMKRmz8dJme5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n3HJiAToIzviqfs1+BOqcXRLWWJfot2TWFUCJ8QTJJA=;
 b=UIpB2C2bsCHPPr/NxpJTc/eY5ndE5ga2mXDu7m6WE7tkgaQslNCnkBlwRVzQaa8YdB+06Qfns+jgsAnG/Ay7Yhm9Z2LrgAHPHoKT9a2r1IgQ32MWqUZbcT4iMCNRGfrDZzoQRCXUDYOaZkobUW17p2qDS1Hn3E6ij7qjMdtbgrsWdpmd7d0ftwblQskF/eVfwAiJ/Etc4g9nu/DXKfBV7X0cVR+KZlAHz6TXqoWcQParN2OKvGM+gUSwEyqln+kYeQ6KIKbV6LTbrtlXHBSbaOfAgrcU6ma8xmhFgN0dz4BxMiqPF4WxoWj+hqEvUkEGoCWHpb9KKeM1cRJZmfRVbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by GVXPR04MB9801.eurprd04.prod.outlook.com (2603:10a6:150:115::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 02:32:59 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 02:32:59 +0000
Date: Thu, 4 Jun 2026 10:31:57 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v3 3/5] phy: fsl-imx8mq-usb: add runtime PM support
Message-ID: <k7bowae64hgs7zek4dppvu73rd6j5oehfz2mcwz3jogdwi34vi@ir3jf6iynlez>
References: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
 <20260603-imx8mp-usb-phy-improvement-v3-3-7afb8f89abc6@nxp.com>
 <aiB0Ivrz-Y-Ilv_W@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiB0Ivrz-Y-Ilv_W@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: FR4P281CA0379.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::11) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|GVXPR04MB9801:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cad63b5-f4c5-4f4b-5e4a-08dec1e197c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|19092799006|3023799007|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	TXdU5giofffx8KzLfv22NLioI2DWDSzCam7impvogpVxIoq+oiqSf4QQ/JGivLkXriFv2S6NkGIE+0TBJF3IC4K4v4p49qaAJ/tHgTjPG+Aps3SMEvoV1XuzJfdU1OTTnXUspDW49pa/8wJN/gkBjnMOy81nKxTTqqeSar+aEw0b9UdXMnB4k5FYlMCKZsmnK8FiC9ymb69+pCSLshA0lTxYpHvd+HB6E2K1gz2quwOCqksc1OWM4zmZGkWX78QJPNvEF55c4fgQOTAtT4IHk/MejH4vIZe5lfYLYivYhS9N55ayqW2gbRkNYevr97IBBLXQASZIiVSADAkNd3ovCYwuIPMSzMGTUbyHDGbnt1PVpu2G2V71D0GGqvmIMYLvNn2TP0wu5ev2xwuDoIrSzsAbgntGTbdxSbm5MEuoW8M7rmf3wIHdjmfaT0b44NS/8YlehqA5UZitVsS+2m2I98fQ/tXwoSqdk/vIycEde7SZDpvhxiX+mgxgGVAjlCUZBQbNWp8AoL3qOOvovAGNaGj9xnSNu+9xircDTc+86GIO48xRbwTixoxsNJtt1bocPx6Z42py2zH5WVbPwBPPR6StytWqaTgKlwxfqKvKWTTOOKpecNyZDbk8cpbHaatbuXyQOyLX+8mq5j6v4pCYjrpTe/U0I8eLX/E/0f8602uSysV0Lfvut/M+gNr9ds0E
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(19092799006)(3023799007)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jnAc+xDlwwY/4nGJCbNIjfWrHLU5LfYOXfwHiwHigmY3jUgeS12poiGKX+bQ?=
 =?us-ascii?Q?ebFPOfoHXGHl7Nk6VsA9Tqz2TlepCcsP1nS7wa1Slvscojal5gwbf7ArahGk?=
 =?us-ascii?Q?lhi10PUkkhVsIrOd8VlSHlUoFK228fAK5Knyn+4n/A203Rl2UEp0oN8Ti9EB?=
 =?us-ascii?Q?Ca7ziQO+bHhbBHvAFFl4o7JfUWTimDvNCRJ0U48fnfNcqa93IpPZ9iDML3ML?=
 =?us-ascii?Q?efAlLY2nbFGMADxvMKI8YWZfy7s2n35bXKMv9t0oAgFe0cyVEkLhTusCVsyr?=
 =?us-ascii?Q?5t9DT0LkMqdXu5PQyz//Cx++8kipPnbJA1iepdIAv68vO7JwzisgTDqAKRrF?=
 =?us-ascii?Q?bFED/AVzxb6yW/KmEjXrAhkj96J0B6K8vUSDmRuFfaJqMGEm8hjWIj4BGBpd?=
 =?us-ascii?Q?6ExU9d/2qHXp6zVWz0ZHapeO75LS4nKc1hw1LWnRVnAEgQgAflN8loIdBQXZ?=
 =?us-ascii?Q?4Yf1Z8SN10l6C35sVJt9jUoSdb7MLyz1NJ+GNVQQqcPEZGvxZDGh+sz86R1U?=
 =?us-ascii?Q?Re3Z+f0UkhSwpR6xVNM25YeN5OBc+Fkd7elrYhv0Uqnfq10LTse7tVLUH+of?=
 =?us-ascii?Q?61Y4UJjVAX04CdntgUQZEsYOzlvdY2jnTPmWPypC37vLO9nvit6KXPC+wl4C?=
 =?us-ascii?Q?15ahuviwNKIo233/IFXGWFCT8LGq9trybutamgkpSXotwPd9kiqPg46ZcONb?=
 =?us-ascii?Q?sNfG2ZWoA8RhG6Xs2gZzj+EwX+K9AI7jn3CSFUKAKevD8LxNHpyEZnOlNgO5?=
 =?us-ascii?Q?2RxrPrI9AeUk7wLJtPHOpmvNGY7/4Tmj2izuBQEMVCoK08S/PJD7gt94RTtI?=
 =?us-ascii?Q?68tFQeQkGXlH+i9LcrdJ2psUb3JHmaC4AjYbgCT3/GreHILNdkpe4tFomt8J?=
 =?us-ascii?Q?/YxvejAnuSiOmLlrRG8kMseGczjVJyo8PkBRAzixipzLwa50xb2tygjcdVGE?=
 =?us-ascii?Q?/+lcKs3zyuhUK/9wH8fX9Q00F8mYrMhU8+HUx2d1pFSR4fltqMHqBDgd6bK5?=
 =?us-ascii?Q?ROB0YtOY3BpRx0cUEaacI2cYyFkNz6VAzSTA8kd01uPpFUCRon/JrpLw3Afa?=
 =?us-ascii?Q?qUjldtG/1RCkWMBO+gGQ8XXFAZizdQ/RZ7fijz1eF9crH+oiHKfoiFUoWXi0?=
 =?us-ascii?Q?kj4AmmM5C1cowX7qcLVaWEq5ko6LDqEjGKySnp38gpPJ2fjqOMkzSSKy5zuP?=
 =?us-ascii?Q?6Aqa43/s/C1Wcj20Xfi+fx2MfSo3+02XGwYrFxLqdZVb1A4NmuhLeMS8NblM?=
 =?us-ascii?Q?R2pI3osK6kLD4np7iF0+FG5i/QvYGUMB7W2PmMDSu/QI716Ji1LFkpcTbGFz?=
 =?us-ascii?Q?uY+63FoAVnWIO2JUI7d6HUT33XVb19l5D4yLiMMCzUu0Df94iIb6IyjACKPV?=
 =?us-ascii?Q?5v///BoG1dSvBNAfR5YNsDJj/EPk51NS0pMCywLPkA4+YfPW/4lFmswb7+fW?=
 =?us-ascii?Q?mKoCvq8htBsErE0Sdr93eXjreL/sth7B0kGX9y49bdbUXcJeIhfzGEtpJzB3?=
 =?us-ascii?Q?oqdM3lj7Ck2U0JIpNyra4VjVLtx1ctaxBf/nTbO4PhJyo+p1IN5dqBH6hm4G?=
 =?us-ascii?Q?CES/uYtiCQRObdWWP7DdrBCDqSmVALqayW74FQoONJV0KjBXV7w3408Ym7S7?=
 =?us-ascii?Q?BzuDyH5Pi3jGopygtHDrg6Psux6npTl3Bx0dmyFmDuRYlhCVHCYCk5R45JC0?=
 =?us-ascii?Q?ORFVJ/2wDwd/M5K3U8D8RYj1bpoiDfF1JZmxUMkTjE4YAXBAdDDlLo2DrHHo?=
 =?us-ascii?Q?qPeKSHtCS64Ss711g/xjkdsVwPonEvKGhnt0Xt5ONYxAgtFpgYIL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cad63b5-f4c5-4f4b-5e4a-08dec1e197c7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:32:59.2747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8a0V0YyqI/c1YLaJPWlJZbaX0lHMrCgAgB+maUNNfUbhK2adRWtnZ+RXg+seAkTt5RIX5/M0TfJlo2hD6V9Imm++a8by/d5HLXKKYdrTayVJO2si/JjkBeJZDi7xajtv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9801

On Wed, Jun 03, 2026 at 02:36:18PM -0400, Frank Li wrote:
> On Wed, Jun 03, 2026 at 01:37:16PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > Add runtime PM to ensure the PHY is properly powered and clocked during
> > register access, preventing potential system hangs.
> >
> > It guards register access in the following scenarios:
> > - PHY operations: init() and power_on/off() callbacks are guarded by
> >   phy core
> > - Type-C orientation switching when PHY/Controller are suspended which
> >   needs explicitly care
> > - Future PHY control port register regmap debugfs access
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v3:
> >  - new patch
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 60 ++++++++++++++++++++----------
> >  1 file changed, 41 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index 591ddf346061..b0092c34416e 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/of.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/usb/typec_mux.h>
> >
> > @@ -136,17 +137,13 @@ static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
> >  {
> >  	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
> >  	struct tca_blk *tca = imx_phy->tca;
> > -	int ret;
> >
> >  	if (tca->orientation == orientation)
> >  		return 0;
> >
> > -	ret = clk_prepare_enable(imx_phy->clk);
> > -	if (ret)
> > -		return ret;
> > +	guard(pm_runtime_active)(&imx_phy->phy->dev);
> 
> use PM_RUNTIME_ACQUIRE macro

OK

> 
> >
> >  	tca_blk_orientation_set(tca, orientation);
> > -	clk_disable_unprepare(imx_phy->clk);
> >
> >  	return 0;
> >  }
> > @@ -620,16 +617,6 @@ static int imx8mq_phy_power_on(struct phy *phy)
> >  	if (ret)
> >  		return ret;
> >
> > -	ret = clk_prepare_enable(imx_phy->clk);
> > -	if (ret)
> > -		return ret;
> > -
> > -	ret = clk_prepare_enable(imx_phy->alt_clk);
> > -	if (ret) {
> > -		clk_disable_unprepare(imx_phy->clk);
> > -		return ret;
> > -	}
> > -
> >  	/* Disable rx term override */
> >  	value = readl(imx_phy->base + PHY_CTRL6);
> >  	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> > @@ -648,8 +635,6 @@ static int imx8mq_phy_power_off(struct phy *phy)
> >  	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> >  	writel(value, imx_phy->base + PHY_CTRL6);
> >
> > -	clk_disable_unprepare(imx_phy->alt_clk);
> > -	clk_disable_unprepare(imx_phy->clk);
> >  	regulator_disable(imx_phy->vbus);
> >
> >  	return 0;
> > @@ -686,6 +671,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  	struct device *dev = &pdev->dev;
> >  	struct imx8mq_usb_phy *imx_phy;
> >  	const struct phy_ops *phy_ops;
> > +	int ret;
> >
> >  	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
> >  	if (!imx_phy)
> > @@ -693,13 +679,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >
> >  	platform_set_drvdata(pdev, imx_phy);
> >
> > -	imx_phy->clk = devm_clk_get(dev, "phy");
> > +	imx_phy->clk = devm_clk_get_enabled(dev, "phy");
> >  	if (IS_ERR(imx_phy->clk)) {
> >  		dev_err(dev, "failed to get imx8mq usb phy clock\n");
> >  		return PTR_ERR(imx_phy->clk);
> >  	}
> >
> > -	imx_phy->alt_clk = devm_clk_get_optional(dev, "alt");
> > +	imx_phy->alt_clk = devm_clk_get_optional_enabled(dev, "alt");
> >  	if (IS_ERR(imx_phy->alt_clk))
> >  		return dev_err_probe(dev, PTR_ERR(imx_phy->alt_clk),
> >  				    "Failed to get alt clk\n");
> > @@ -708,6 +694,10 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  	if (IS_ERR(imx_phy->base))
> >  		return PTR_ERR(imx_phy->base);
> >
> > +	ret = devm_pm_runtime_set_active_enabled(dev);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> > +
> 
> you enable runtime pm here, when runtimes suspend

devm_pm_runtime_set_active_enabled() will firstly change status as runtime active,
then enable runtime PM. So it's already not in suspend state.

Thanks,
Xu Yang
