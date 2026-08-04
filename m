Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AD13E1D15
	for <imx@lists.linux.dev>; Tue,  4 Aug 2026 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856118; cv=fail; b=sp606Mu68oHrQUFAf6hy0/2gxoO7w8z/taM5n4qYWNu/HSPT3L0SHCSDWaBIZR34Jr9mhtVM0PaTGznocuVVkGMYnChMnPGJwfZMjB8FsootPxiCOPr6MYUfuDa0vDATLX+eU4JToBOq3e8KGL9SeehuBilFC/ncjHQrNTKANFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856118; c=relaxed/simple;
	bh=CoUkbIT5pPJzQBM7AksDv6BZERgLaGwSzSLXHWBGzGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iIV0WPcu8iPPmkk5OOt1b/89Np3Za2V+gO9cC+ZmCq848Zet0aaEhAYbifwIyPZpa5TO+vnUOx1jRlfzU1PSvF0PscirFrHrVuPtQAD5e7kYYyvxF143wSVRqlzrVTFNRWQtaujswRopDpNyRhVOTDdCPhW6HtbhDyjGYc0gk98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TZFJFuPh; arc=fail smtp.client-ip=52.101.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TZFJFuPh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvyFecko1wKZW3hMkjsN44yOlu/M+/MDELW5u3Jq0i30HQgyw2VFw9AAg8S2m728pDNqCMKSfxjJBV9eV4PG9jazZKvQOPd+GmzLbEtfwjrkzA2UWgNk5czZM1AMwrn8kBQTXZ82dchPxyo0hDWkzBrmp9NjhA9/7dEt7EPLrWHOVSbpWoHAcfHy5oM48uI3oG46FZhkYcUnXkmvY4nL/vs/9hPH1yTGPjlz/qY/o+5Hd0TzeC0UJJHiMQCAaJ/MJYqf7hRzxIVKw4dtbuPHojOBemMq8Y2AUwil1txpvQnSFsFm37ZNS0FEWrPvxkI+dOGeY17g9OQaQM2tro45sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3ZOYfYP3THlOH2BnEFxUJSyqQKWL/pLyEhSoj9UYYE=;
 b=GaYH8nfTUr2CdnC6botLoottf5VH3snE2wdDz+uMm47r1UR1quM/Iu152GP7m9Ku+rvdCE/f0yJ/CjuAUzY32ulXfp3GtcoogjuWWQx7pmXgyVoZBpf76gs0PRBfPzBYqYO45bzBe+6Ulu4+GY+jPdjbApDOdPQBMov/UvxnGr/F9lCqQy3fT26bJdEaGiwMMTuZyIOsbMKEQZW6mXlXCIi5tGYKErBhjxo9zQmzaTwn9PbgCgyKvOwFPuFSCtX3fouFzeQjzBoRCBZNQa6UBJKG+YyBddtHkmZh5n/pNzpMvkLbgachcfeRviaPqZ+YwH/MwnungN7Jbw9rHYRDOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3ZOYfYP3THlOH2BnEFxUJSyqQKWL/pLyEhSoj9UYYE=;
 b=TZFJFuPhHQHTy7dPM5nmH/J3wxv6YMdkwjdsXVwfk7n5vjbpv8aksFO1y1hvZoyLqWGihDUhUW1yotMQkjeaUNLXgK41wjmV5IlzXvg/j/xhCjMMZx2UBd9/3ypZca3Iv5bIR0ATcfRJbSOnS8pCV/fiEhxoGiOoyIXC92wc55QPI9jCMviamrzjBUm3wGUXNO3oUUUtYCReIklgGVKLkC7kluSf2fVp/XFEP98beknZiU8wcMGumYaYbHAJSVXoc4X7pfEAMZBj5dwnaBUAh+zjvq8Sd4rruHygmRJRr+nQiLfxYfdeUBAJu+ZdgRZeGTywRdG7TY0HfFBnKQ3bww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7362.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 15:08:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 15:08:32 +0000
Date: Tue, 4 Aug 2026 10:08:24 -0500
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
Subject: Re: [PATCH v8 3/6] phy: fsl-imx8mq-usb: add runtime PM support
Message-ID: <anIAaM8W46furyoC@SMW015318>
References: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
 <20260731-imx8mp-usb-phy-improvement-v8-3-2ec8d6b3854d@nxp.com>
 <amy0X12qllKAXhXg@SMW015318>
 <e5dt652g4mtlasaspvdxd7wea3pybbjzzphjqmqn2zu7lsnm6d@ivz2tkkub2m3>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5dt652g4mtlasaspvdxd7wea3pybbjzzphjqmqn2zu7lsnm6d@ivz2tkkub2m3>
X-ClientProxiedBy: SA1P222CA0085.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cfd82eb-9da3-40b5-ff8d-08def23a3fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|56012099006|4143699003|11063799006|5023799004|3023799007|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cjO9kEPLGB4Ks4Go7cp/Mhl2YCUsFVPXXBbh8XLGlywAU2h8pxPEwPlnFoF6Y8DU2XYi20o0YKjd3fyNQeOH0vNgSs2W+05Z8RJIT0QuEf/q1M7q8+gtLjwO4gfDPLbzgN3oaTmVVzQLVWIZ81GFG3z+HMz5T8WTWG1UjFzIZzdOEaEFz2JBmIEIEVU7OoZVXziSNpSIH7yLBMMzCLYcy8JNXO79xrS5N6tauHm5MjQWdCKPDJyoqsF5By1tW9JJGEDz+wjhHm9jXu0caiC/LdZecZL0VVpKZ+jCdG6nwqr7QzXIuqEmWQTvKHAs7b1l2O2J4y1q/4Ulwf1yvBetogt2Llkgu+VQpqBqtlruS9Oqgw1nIGI094uAGn3Ejy4U+IQcAw6ZUi/3pLnCumtReGDQOSkGg6SL0JqublPv+u4BNqv9cE+kfZQEhfWnEeHQQz5o7Ra7DnWgbo+tBRsuXzCRjKLS//zc6Iy6l5Tn7uHlbt1t2/g/r/uhuLLVcyKvDyWZ+7LxTvwXriPwkRozq8IkwKNsbgaVhQ+Dw0QKv/KhG0YRNzXmLrNlKPF+xJg9O2hbkCq1udkGLFYkcwJQ9p5iZxo+fYWZrz2jM8xmFVzZxfUsSAavSGe0PvTLYqmL8Y9xzH1QGdJGfKqC5mpyfN1HwFHrwugdRoq3I25ltGY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(5023799004)(3023799007)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wo3aOtmeSjvfeDTwQHxLYPVg/xHYT35tokGN0me3YFn/34WlPRBe8TWIk9DW?=
 =?us-ascii?Q?6hh3r3M1rktbn+U7yIYmCNxLeWUhtn8BkwGAJjR9Umr8zLp2MGS2mKadpMMv?=
 =?us-ascii?Q?Et497p/tDVy0PMGgcxYcFn8GEXVubADK77W6ZUK7KfswvDJanvEMYmFHmVoW?=
 =?us-ascii?Q?1T+QuXgWfoQbsufULBdKAauOeDt47uMW7EQYWeeax707pTNCvJULDArPioA2?=
 =?us-ascii?Q?vOEapnwd+kuL12Q93khm210R9RCAXDl43zHv++WMRGAoNMYxZwSzRwPlCCVP?=
 =?us-ascii?Q?uJs6maTvDUwxnNW35UgTqYq1FOkqwDO/qofM8gCwKiPyUQFpvCV1bbLGVZ1z?=
 =?us-ascii?Q?tDhwSxihJV14df0qlnN/xGLuFcvbQLwDAmqv2DEoEZsOOUT3hU9NCDWxK/Fg?=
 =?us-ascii?Q?9oTk4l2UNnJqSVrUVV0qne5tgBGVGsySBzY7wr3SvX1K07gaaBXrSvRSDNlH?=
 =?us-ascii?Q?0NQDAo4r4+IO6jezY4IET9WV5T/TLBsab+05igQwIFCzpvokauA0Gfni/jZT?=
 =?us-ascii?Q?uGeyMnfPKqozR0i4ieX7LqcgbEjWgPbGiWPOI43rdAG7Ow7TGKwqfpW4iail?=
 =?us-ascii?Q?p65DxIXvuXSdjb/uMXkNJ2Hz81XK+HYefkSGO58tNEasGTp5S+cHMl+Z7EZJ?=
 =?us-ascii?Q?MaWTge2/pH/xTqaBSF9H66WIiU45OeqNg7aH1QyIYEKNLbAc4CgIJPOZ3wnU?=
 =?us-ascii?Q?d3Azbig0CR+Vux6Sv1HlkGgRB8+Qelry2Qw98Ewzs8q5JxrDKwsy6VPRi0ec?=
 =?us-ascii?Q?Zkl56amkQtQOgOZUsl7xB25Ul7Smw0EffDy4gbZY72/b7dY/bDZi4lYpIjqq?=
 =?us-ascii?Q?i/UDt+CkmfmoOQfD2LfB2+cDJfIyPUCy9LV74EXve0illc5eaWD+GP/DUX5J?=
 =?us-ascii?Q?pIIlr+dQ9fc8rn9l9ifG6Hq/sGV8zgy9kuZD5Etiz3YYNSEoYZG5aUYE4yzy?=
 =?us-ascii?Q?vrkCMRDpU/clED2Cmp6Bb5EQpNs4+PfMDEx1pkqCrRrNorKQQGdL4WWjEUOa?=
 =?us-ascii?Q?k7wMegeq7yooqZNRbiPYEyh9iYsb8c70g4rAonzJh9MBKpyWq24vIN1ejvcI?=
 =?us-ascii?Q?0QFe+Ug9PRyEJZVqhQ2+52qOPP+bw/Zhjev9F+VChnDseCOwVPREaAhNtIfx?=
 =?us-ascii?Q?kSbU9d+XzE3ehIqsAhvMuIUsHkqqnLvMgPUqcpSUh/t1ZdMxJipw9ffk7UPx?=
 =?us-ascii?Q?pCHktFE++4Um+WlKtlFVhpuwo0CHw5omk79vrcyMT/icir6Fbo9gJY/WHYMy?=
 =?us-ascii?Q?V1afOW+8zzyy9xQGi1RyEkzdl5Ogerv++LVTU06eNgw8dYmj3KW953l9xGQT?=
 =?us-ascii?Q?BcBaydVxSwUJPvi+pB7rJy5Z0XoPvvPwIm1yrULzdeWuWHsJBB+P3YtouGJD?=
 =?us-ascii?Q?KLpKRBqqIhGP+B/N96q1DzLZoMOPAuq3eYME8jtOYYX9BFIlHXEphwgzpBvz?=
 =?us-ascii?Q?wSs7rXJjEn2ilnehOHfG+Kn1B2bnh7y9O9jwDfY+Kt7ZGwDOue3Qrs0OuFWo?=
 =?us-ascii?Q?db2EIn3DWNOyCRtNBUqEtkvzloW6nHQpOaVxf0fdX/zt9l+St2q4rEC4ZQMp?=
 =?us-ascii?Q?8OO7t5syZs7SnvtDysSBvM7SKvO7n6L/ng3yNkGlhKLwzGGRAJS0f9RsgFph?=
 =?us-ascii?Q?vdhcS3wqGUFlLSSKJdL9540lr1ZhE4xJzzgaXTvW4uTou31KJgkmOujr/D33?=
 =?us-ascii?Q?qrDfwrn6E8FP8YNxa/rxzCi4ukzBGL0cRSepDZvW72KE1kdiaLsfYKnqHibv?=
 =?us-ascii?Q?xMxslqWcwforIetjfRiHtl+7jqCDZXE0K3Nz/UriNnCB4iDNxd8d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfd82eb-9da3-40b5-ff8d-08def23a3fc2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 15:08:32.8210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p750eRLFojiZenTPflbAxerTUxNSp7TH1bT+3AOrhG1U+LenYyShmuN++gNPyu3ht0tw1jswRiiqjGmFSGg7N3ot9i9C1bs62V1HT6F2g7jEoP+mW704INnAb5ma7Et6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7362

On Tue, Aug 04, 2026 at 06:41:56PM +0800, Xu Yang wrote:
> On Fri, Jul 31, 2026 at 09:42:39AM -0500, Frank Li wrote:
> > On Fri, Jul 31, 2026 at 04:11:21PM +0800, Xu Yang wrote:
> > > From: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > Add runtime PM support to ensure the PHY clocks are properly gated
> > > when the PHY is not in use, reducing power consumption.
> > >
> > > Clock management is moved from power_on()/power_off() callbacks into
> > > the runtime_resume()/runtime_suspend() callbacks respectively. The PHY
> > > subsystem core already holds a runtime PM reference around init() and
> > > power_on/off() calls, so no explicit clock handling is needed there.
> > >
> > > Use devm_clk_get_enabled() and devm_clk_get_optional_enabled() in
> > > probe() to keep clocks enabled initially. This ensures the PHY remains
> > > functional when CONFIG_PM is disabled, where runtime suspend/resume
> > > callbacks are never invoked.
> > >
> > > In tca_blk_typec_switch_set(), replace the manual clk_prepare_enable()
> > > / clk_disable_unprepare() pair with PM_RUNTIME_ACQUIRE_IF_ENABLED() to
> > > guard register access against a concurrently suspended PHY.
> > >
> > > Move devm_regulator_get() before pm_runtime_enable() to avoid having
> > > to clean up runtime PM state on regulator acquisition failure.
> > >
> > > In remove(), call pm_runtime_get_sync() before pm_runtime_disable() to
> > > ensure the PHY is resumed and clocks are enabled before the devres
> > > teardown disables them.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > ---
> > > Changes in v8:
> > >  - fix if condition in imx8mq_usb_phy_remove()
> > > Changes in v7:
> > >  - replase PM_RUNTIME_ACQUIRE()  with PM_RUNTIME_ACQUIRE_IF_ENABLED()
> > >  - use non-devm PM runtime callback because it's hard to avoid double clock
> > >    disable issue when probe fails or remove the driver
> > >  - improve commit message
> > > Changes in v6:
> > >  - use devm_pm_runtime_enable() to disable runtime PM when probe fails
> > >  - simply pm_runtime_get_sync/disable/put_noidle() to pm_runtime_resume()
> > > Changes in v5:
> > >  - use non-devm PM runtime callback to correctly enable/disable clocks
> > >    when unbind the device
> > > Changes in v4:
> > >  - replace guard() with PM_RUNTIME_ACQUIRE()
> > > Changes in v3:
> > >  - new patch
> > > ---
> > >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 103 +++++++++++++++++++++--------
> > >  1 file changed, 74 insertions(+), 29 deletions(-)
> > >
> > > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > > index 3a5788c609e1..42de2cff4d5f 100644
> > > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > > @@ -9,6 +9,7 @@
> > >  #include <linux/of.h>
> > >  #include <linux/phy/phy.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include <linux/regulator/consumer.h>
> > >  #include <linux/usb/typec_mux.h>
> > >
> > > @@ -136,17 +137,15 @@ static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
> > >  {
> > >  	struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
> > >  	struct tca_blk *tca = imx_phy->tca;
> > > -	int ret;
> > >
> > >  	if (tca->orientation == orientation)
> > >  		return 0;
> > >
> > > -	ret = clk_prepare_enable(imx_phy->clk);
> > > -	if (ret)
> > > -		return ret;
> > > +	PM_RUNTIME_ACQUIRE_IF_ENABLED(&imx_phy->phy->dev, pm);
> > > +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> > > +		return -ENXIO;
> > >
> > >  	tca_blk_orientation_set(tca, orientation);
> > > -	clk_disable_unprepare(imx_phy->clk);
> > >
> > >  	return 0;
> > >  }
> > > @@ -620,16 +619,6 @@ static int imx8mq_phy_power_on(struct phy *phy)
> > >  	if (ret)
> > >  		return ret;
> > >
> > > -	ret = clk_prepare_enable(imx_phy->clk);
> > > -	if (ret)
> > > -		return ret;
> > > -
> > > -	ret = clk_prepare_enable(imx_phy->alt_clk);
> > > -	if (ret) {
> > > -		clk_disable_unprepare(imx_phy->clk);
> > > -		return ret;
> > > -	}
> > > -
> > >  	/* Disable rx term override */
> > >  	value = readl(imx_phy->base + PHY_CTRL6);
> > >  	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> > > @@ -648,8 +637,6 @@ static int imx8mq_phy_power_off(struct phy *phy)
> > >  	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> > >  	writel(value, imx_phy->base + PHY_CTRL6);
> > >
> > > -	clk_disable_unprepare(imx_phy->alt_clk);
> > > -	clk_disable_unprepare(imx_phy->clk);
> > >  	regulator_disable(imx_phy->vbus);
> > >
> > >  	return 0;
> > > @@ -686,6 +673,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> > >  	struct device *dev = &pdev->dev;
> > >  	struct imx8mq_usb_phy *imx_phy;
> > >  	const struct phy_ops *phy_ops;
> > > +	int ret;
> > >
> > >  	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
> > >  	if (!imx_phy)
> > > @@ -693,13 +681,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> > >
> > >  	platform_set_drvdata(pdev, imx_phy);
> > >
> > > -	imx_phy->clk = devm_clk_get(dev, "phy");
> > > +	imx_phy->clk = devm_clk_get_enabled(dev, "phy");
> > >  	if (IS_ERR(imx_phy->clk)) {
> > >  		dev_err(dev, "failed to get imx8mq usb phy clock\n");
> > >  		return PTR_ERR(imx_phy->clk);
> > >  	}
> > >
> > > -	imx_phy->alt_clk = devm_clk_get_optional(dev, "alt");
> > > +	imx_phy->alt_clk = devm_clk_get_optional_enabled(dev, "alt");
> > >  	if (IS_ERR(imx_phy->alt_clk))
> > >  		return dev_err_probe(dev, PTR_ERR(imx_phy->alt_clk),
> > >  				    "Failed to get alt clk\n");
> > > @@ -708,44 +696,101 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(imx_phy->base))
> > >  		return PTR_ERR(imx_phy->base);
> > >
> > > +	imx_phy->vbus = devm_regulator_get(dev, "vbus");
> > > +	if (IS_ERR(imx_phy->vbus))
> > > +		return dev_err_probe(dev, PTR_ERR(imx_phy->vbus), "failed to get vbus\n");
> > > +
> > >  	phy_ops = of_device_get_match_data(dev);
> > >  	if (!phy_ops)
> > >  		return -EINVAL;
> > >
> > > -	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
> > > -	if (IS_ERR(imx_phy->phy))
> > > -		return PTR_ERR(imx_phy->phy);
> > > +	pm_runtime_set_active(dev);
> > > +	pm_runtime_enable(dev);
> >
> > does devm_pm_runtime_set_active_enabled() work?
>
> Compared to devm_pm_runtime_enable(), devm_pm_runtime_set_active_enabled() just do
> pm_runtime_set_active() before devm_pm_runtime_enable() and pm_runtime_set_suspended()
> after pm_runtime_disable().

Okay, Anyways, we need better method to handle this in future. Anyway

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> It doesn't change the reality that the device may be runtime suspended before undo
> devm_clk_get_enabled(), that is clk_disable_unprepare().
>
> In V4, V3, I used devm_pm_runtime_set_active_enabled(), but it didn't work:
> https://patchwork.kernel.org/project/imx/patch/20260605-imx8mp-usb-phy-improvement-v4-3-b2ddf2f3862c@nxp.com/
> https://patchwork.kernel.org/project/imx/patch/20260603-imx8mp-usb-phy-improvement-v3-3-7afb8f89abc6@nxp.com/
>
> Thanks,
> Xu Yang
>
