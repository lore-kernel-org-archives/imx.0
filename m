Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013040.outbound.protection.outlook.com [40.107.159.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4728230648A
	for <imx@lists.linux.dev>; Tue,  4 Aug 2026 10:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785840225; cv=fail; b=L6PNmz4ybI8mXhySkbRtz4RttCyD1UzQVr7ZmcpUhOK9Z2rjkY/X2zVZZnyKasIlzjTFu0CKphAUY9aPKfKz601x63sbiElTzNFCOwFE17HHpgU4Suw85mbbS08hP4yY/PO5JeQ2X4uH3NxG7qXapVOfUkvQ672PjSgbFR93SDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785840225; c=relaxed/simple;
	bh=QTWxwZHX6C5DLJkM5jq++JT0OH5hSxH/QA4EAkxQvU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RiGykQZDvLuaANNwN8IeIvAUWm8NzP8NULPagZ39IFJk19wwzF/VigDkKUvGF+aLsBRap4rmIpDfT5UL6JPhEy13xCagnTWM+CepirFlUGfQO8T09jvyifjRg1UEvaj6bBxvX0ZSl8oiUaqFw8ktl1AU6uAeB/kA4mnHKGWuaPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wUMCSGvU; arc=fail smtp.client-ip=40.107.159.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wUMCSGvU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sM6S4EZDN/lvCu4h/cbpqnLUgwqojjwy6tmPIWpD63reRgw9b2fb59A9N29TqhOLKz6AMWdOGgB+mq1TGB9Mizg/uzMDbzMQtfgYCKTKM70/P+T25zCrTiDIUCDBFBJmkxhLrfbw1CTtHxGEGTgzRFZK1s/U6Xb+npY1NKT80FQ76YLKynIFrvmOkBKP6klZexuiP+G+Iuduc8Pzv35VcKPdNqlvdR80rquHRO3QytLR/HFtZKRhckkCOU4yGJVl3dfV35HmDSUD8CxnzCrWkTetGD6oMYIuwEEhzW0YFwIJFlYoqP64SA9Ty/eePZrtENVsaBWioULfZACA38UsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4w1zDPWxcMOhyXieVEDsvX5IMOb1evFdRuv5gcYsHBc=;
 b=D1slh8w8DHBmpAtu3R7tEyZT/pQpVUNev3MEE8vO4vKUyTTCFXdqejRH6gI4/PAU9adQ2p1VdXV1frmlzkBfnsOOIJdLUwqUL5+HvNjMWwxLJVkylSKJU6d9wiXKdODoh/uV2gXFBm9q/4RPKrUdclz3olB5Ufq66ZSZskLTHJJqOiekor0c1zurSFAit50FMw54lqcoXe1udoFnaUOqcwVHRkOMETxAa/40FUXXZHNq9nf4DucawYvp1sN9iOXuF+3eptkeHSDZEW5TUiqmy2fDKI+IhwksnHINwAPp86p8nRjhoWdUYBFY9cdfmIT4g4RPqW0vavlDHoy43jd9Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4w1zDPWxcMOhyXieVEDsvX5IMOb1evFdRuv5gcYsHBc=;
 b=wUMCSGvULUIHWE8zBMYVZetYQlVBlwIyonwwN6fM0Eoy7qu02SCt6BtH9EQw88FiAbxoabyzkpGC9xSFtcTh1k+Egs50tzSco+MWUcpBMFXbmU9RUGY20cyPWQ67NdZ1E4ogb9asaMeU8awn5JpGBwmWbHWhkBQu3Fl3lm9RrcKosPOe1rxW6CzWBpd0XMdQOhOndvI2zs+fhxkZqmr7Lhzm5CHUu+1md0bkcVhIhppr2mZCS9soLIVx9rJr0JTFbhYoWsLE2g4RDSld+/0Owvf50L8NGWoLvXMfXqRNXhd05wIbmB9YDkst1QkOedfDWRP2xiuKD8SeaLIfzwZw9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by DU4PR04MB10401.eurprd04.prod.outlook.com (2603:10a6:10:55e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 10:43:33 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 10:43:32 +0000
Date: Tue, 4 Aug 2026 18:41:56 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>, linux-phy@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v8 3/6] phy: fsl-imx8mq-usb: add runtime PM support
Message-ID: <e5dt652g4mtlasaspvdxd7wea3pybbjzzphjqmqn2zu7lsnm6d@ivz2tkkub2m3>
References: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
 <20260731-imx8mp-usb-phy-improvement-v8-3-2ec8d6b3854d@nxp.com>
 <amy0X12qllKAXhXg@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amy0X12qllKAXhXg@SMW015318>
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|DU4PR04MB10401:EE_
X-MS-Office365-Filtering-Correlation-Id: d86f1430-cbef-4c8a-e449-08def2153a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|19092799006|11063799006|6133799003|4143699003|5023799004|56012099006|3023799007|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QCcuG1RW5Z9lCZL2iu74L/RbdtofRWNRx8p5ykmAtxBi+KjdIAX3VoxHor5YWt1utzWB1G1CUBsDRXggjPyB298oIQoXrMnVKmSsd1h19A2i9gIU4ZZBsX8NhHFExGQTWI6RSYUub+5CFPDLAohuMLAlf3qgETOm7uJWNS28KbHRRgXtzLEAOgM25iwBiq4t99ZP5AK93ItMeiSPBiHV2QEazrujkethuaCUDtvIHZhh4gYgsG7yrJpAkFnfh+2D/YI36UCtUh2VOvMnZtTZOnJplkt7JTE+n0e3ZooGgTV2lV+PJLGC4r4aq1lnigNbfVdHKc/iF82lY7/HmW7kJ3DTFdB7Bh8Sf1L1rHdNBNOYdjmxpdE6oZUchot+Wq+56HqDtFhj1Ilif4Y4NiBXplOOy+MT1xheDHrilVlLys1LvCFEuy83jX+DpWctSnbPiKh4xJkCcz3AKHq9yOZTHwCxmHoJHchkv9KMATe31GSpFEdInfTTJk4jXqW2Gt2k6N0bp2fMMkt9ckghi8aDF2LEncLWORFrVzVeRSgSjMtMcaumMLeE++lNCKLkn/VqNRxBs6oedtvcBFsP9+jH9stH53cZB27RXw/3B07yZiSn+hGvk8qPITQ17+XHoTxoFgTdBOMepdPQbikid0L1pv6vl4hUfgfit645BBcer7s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(19092799006)(11063799006)(6133799003)(4143699003)(5023799004)(56012099006)(3023799007)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?82AQPu4zHZKoPNJw4DzcT71KMq03JN1mV607v5UgsbM2QHCmxzb5mcvv/hSF?=
 =?us-ascii?Q?mVxCaWfe0pvu14yopjRBc2vACUNGF//mF/RHX/dQgb5gz10BQfmfdMYUind1?=
 =?us-ascii?Q?s6S2dJ0NetQPsoNREQdEOlVnHfNmiv7rftKzqFGn81yXrbTNLxDV4JTiCzNy?=
 =?us-ascii?Q?3giTu2qFcc+bTKpEr7BYxx1txxtv6YSpc0DbE11aM5VX75PJhDvXFb+QlXg4?=
 =?us-ascii?Q?jJgMqAV2Dhe6Fl+67R6d/8NdcIB07cTyIrDEQc+IQAN9jF9SHaoYo89EAPev?=
 =?us-ascii?Q?KVjY883nZk/DcQr/VCmMaT4btar6Y0V8DHC2Hn4HSR81IubM75E2S3q3BA5q?=
 =?us-ascii?Q?akJtDIpokcbTMPMbPx5jowWncCckJENmjnadlI2FrZnkWmimfSwT14zAK+2D?=
 =?us-ascii?Q?CaPAgNdLMG7ExKM4hlO0GZxvvrG/O3fjBfaJR49rjVj0+Bi4dkLPvtRtr2ET?=
 =?us-ascii?Q?CTeq89FZ/3vh4S6SQ58YYQCvYGQ5BREgaj1ubmCgwk3SZXN9aMrqm5YjWCeT?=
 =?us-ascii?Q?3jI31BttyPv5M+aFJSjiVU2sY9FPouXd2OKyyiSci3eG8zf5CwjUCB3AAlSF?=
 =?us-ascii?Q?BTvd5O+ZMWKrARVHeChK8GgTX1wkFQgvVL5sJtDpNZWckbd9GP3eZPxz5a6b?=
 =?us-ascii?Q?jZk1OgFqrZ/2eNl2nDQ+P1bEN7Ld10NaDk3CYnWY6ZUzEo6jTIcDBR+NnXDR?=
 =?us-ascii?Q?kEIOblgIdUDPLFundf263JghI+a6v5n1YZAli6U5VM50T50iPKtP7IahZg/v?=
 =?us-ascii?Q?uE+EpHD0Q9NMs3nh7gPKBQ9ohkrEEytqEQ9V5W+d7HBh16i4OAB1xxMnUOKg?=
 =?us-ascii?Q?Kpyd7BOFlORIH0M51pNAReapuCN8Os/2xodDJ7CqsVxXRMxcK/yNnTsUKTlQ?=
 =?us-ascii?Q?BWHzwrjFrvSky2g8I6AXdZchqxUjxDOlu+ytvWyK/57+acwqK5qpJ0VDHngK?=
 =?us-ascii?Q?KQ23MmzDfkdXTOnVKRG8x6F7K3N5HHTVfNzjlILoc9ZAxsvEKzQrL3KtIMPw?=
 =?us-ascii?Q?IxBT+a3mqLXYrukK3BoGyOlNLs6pyzY4gCB9aRrv3babEtGeEqYXMliIsfDQ?=
 =?us-ascii?Q?63s6U1tt07O3papYtdF04F+DmpcRIZpUm3UyQcjVg4S+LB5+vBnm5J+tQFwG?=
 =?us-ascii?Q?eRa7g0liDzUBJger0m1x8vMSRn8sDajO/jM+sHW3KhMYHXdsk9maGQfjBkrI?=
 =?us-ascii?Q?aMwUpJQ4TAPAi7/zJZsq+/mzxXq9zCCRvTBl5ae9AZWhw4jWsf40h4FWWQ1D?=
 =?us-ascii?Q?j5KQfjhj84I9rdOHscTFvcUoz0B5KeGJm2ocPTyl6vDAQVWr9uqmONhcEoqx?=
 =?us-ascii?Q?qzbdvKXbmaXwaML9cHuTjx4r82iXIZpIw9ILSQlumfAkiJ4+i8dOzl682Rpd?=
 =?us-ascii?Q?2lOosUgBjKjhniXIbokuh04c3GRNIvvS4n2kNrbChJcFiWKqybeAJvk3obV6?=
 =?us-ascii?Q?Bzj1iRva7+7mcFKB7a37hjH+KKhgRiKsUqaR17UfchmljVP6YEtg9aNEbF7E?=
 =?us-ascii?Q?KBMFdFNs2/SP6F/mEw+x/XBgzZCwZjdG7+9jnz7kU8nGRdHBklFbbhuWoQQE?=
 =?us-ascii?Q?/N9Ydkh/HaYpnbDYXnt7odKyyLedmK1IhNwBbuWUBNd1dFJ5mPNds8Y2EMKu?=
 =?us-ascii?Q?cfKE0z/ZDs+Izt1JlbG3ufLEP3kgYSdcz+3C+Q5NGdHSL/dxZVtTy7K7gY0n?=
 =?us-ascii?Q?vNljxME5JdEJfIYj4Qi0b6U5r5XdEnlCqeU67V1vduPqbItUhs0otW+F5E6o?=
 =?us-ascii?Q?yXoPL1icuknfmwzyJJO/r/OQeztntCyW9fO2BN2iCJC54FmKe+Ys?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d86f1430-cbef-4c8a-e449-08def2153a99
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 10:43:32.7977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vr8Dg8pykGDfLPvfeVpNmNbV0T1ZAJ/Z2DGc+lFB+vQQcPSmE9XNLuDoGV9wqQph/HMERIsxfoYIbVR1Igco8yBMvXw21vPfSH+DQ0Bgnh6/VdcSB1Six8tB0mGKvMCC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10401

On Fri, Jul 31, 2026 at 09:42:39AM -0500, Frank Li wrote:
> On Fri, Jul 31, 2026 at 04:11:21PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > Add runtime PM support to ensure the PHY clocks are properly gated
> > when the PHY is not in use, reducing power consumption.
> >
> > Clock management is moved from power_on()/power_off() callbacks into
> > the runtime_resume()/runtime_suspend() callbacks respectively. The PHY
> > subsystem core already holds a runtime PM reference around init() and
> > power_on/off() calls, so no explicit clock handling is needed there.
> >
> > Use devm_clk_get_enabled() and devm_clk_get_optional_enabled() in
> > probe() to keep clocks enabled initially. This ensures the PHY remains
> > functional when CONFIG_PM is disabled, where runtime suspend/resume
> > callbacks are never invoked.
> >
> > In tca_blk_typec_switch_set(), replace the manual clk_prepare_enable()
> > / clk_disable_unprepare() pair with PM_RUNTIME_ACQUIRE_IF_ENABLED() to
> > guard register access against a concurrently suspended PHY.
> >
> > Move devm_regulator_get() before pm_runtime_enable() to avoid having
> > to clean up runtime PM state on regulator acquisition failure.
> >
> > In remove(), call pm_runtime_get_sync() before pm_runtime_disable() to
> > ensure the PHY is resumed and clocks are enabled before the devres
> > teardown disables them.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> > ---
> > Changes in v8:
> >  - fix if condition in imx8mq_usb_phy_remove()
> > Changes in v7:
> >  - replase PM_RUNTIME_ACQUIRE()  with PM_RUNTIME_ACQUIRE_IF_ENABLED()
> >  - use non-devm PM runtime callback because it's hard to avoid double clock
> >    disable issue when probe fails or remove the driver
> >  - improve commit message
> > Changes in v6:
> >  - use devm_pm_runtime_enable() to disable runtime PM when probe fails
> >  - simply pm_runtime_get_sync/disable/put_noidle() to pm_runtime_resume()
> > Changes in v5:
> >  - use non-devm PM runtime callback to correctly enable/disable clocks
> >    when unbind the device
> > Changes in v4:
> >  - replace guard() with PM_RUNTIME_ACQUIRE()
> > Changes in v3:
> >  - new patch
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 103 +++++++++++++++++++++--------
> >  1 file changed, 74 insertions(+), 29 deletions(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index 3a5788c609e1..42de2cff4d5f 100644
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
> > @@ -136,17 +137,15 @@ static int tca_blk_typec_switch_set(struct typec_switch_dev *sw,
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
> > +	PM_RUNTIME_ACQUIRE_IF_ENABLED(&imx_phy->phy->dev, pm);
> > +	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
> > +		return -ENXIO;
> >
> >  	tca_blk_orientation_set(tca, orientation);
> > -	clk_disable_unprepare(imx_phy->clk);
> >
> >  	return 0;
> >  }
> > @@ -620,16 +619,6 @@ static int imx8mq_phy_power_on(struct phy *phy)
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
> > @@ -648,8 +637,6 @@ static int imx8mq_phy_power_off(struct phy *phy)
> >  	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> >  	writel(value, imx_phy->base + PHY_CTRL6);
> >
> > -	clk_disable_unprepare(imx_phy->alt_clk);
> > -	clk_disable_unprepare(imx_phy->clk);
> >  	regulator_disable(imx_phy->vbus);
> >
> >  	return 0;
> > @@ -686,6 +673,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  	struct device *dev = &pdev->dev;
> >  	struct imx8mq_usb_phy *imx_phy;
> >  	const struct phy_ops *phy_ops;
> > +	int ret;
> >
> >  	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
> >  	if (!imx_phy)
> > @@ -693,13 +681,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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
> > @@ -708,44 +696,101 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  	if (IS_ERR(imx_phy->base))
> >  		return PTR_ERR(imx_phy->base);
> >
> > +	imx_phy->vbus = devm_regulator_get(dev, "vbus");
> > +	if (IS_ERR(imx_phy->vbus))
> > +		return dev_err_probe(dev, PTR_ERR(imx_phy->vbus), "failed to get vbus\n");
> > +
> >  	phy_ops = of_device_get_match_data(dev);
> >  	if (!phy_ops)
> >  		return -EINVAL;
> >
> > -	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
> > -	if (IS_ERR(imx_phy->phy))
> > -		return PTR_ERR(imx_phy->phy);
> > +	pm_runtime_set_active(dev);
> > +	pm_runtime_enable(dev);
> 
> does devm_pm_runtime_set_active_enabled() work?

Compared to devm_pm_runtime_enable(), devm_pm_runtime_set_active_enabled() just do
pm_runtime_set_active() before devm_pm_runtime_enable() and pm_runtime_set_suspended()
after pm_runtime_disable(). 

It doesn't change the reality that the device may be runtime suspended before undo
devm_clk_get_enabled(), that is clk_disable_unprepare().

In V4, V3, I used devm_pm_runtime_set_active_enabled(), but it didn't work:
https://patchwork.kernel.org/project/imx/patch/20260605-imx8mp-usb-phy-improvement-v4-3-b2ddf2f3862c@nxp.com/
https://patchwork.kernel.org/project/imx/patch/20260603-imx8mp-usb-phy-improvement-v3-3-7afb8f89abc6@nxp.com/

Thanks,
Xu Yang

