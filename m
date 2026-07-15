Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011011.outbound.protection.outlook.com [52.101.70.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA1343932C
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 10:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784112527; cv=fail; b=QOfulE5qnk16h4s0mNQ6pTomRL3+Ho+PIya9i27yT5N8qj8a7dP4PjdDZsyDWoU660ampnEF1NMT0Oz96N/Y2VCyA7SQ1D76QwuduyePzLrqG6AKzH01SAdOtA+bQxzIW8XcwEoGxUm2X1b5QWirZiqlSIRiE7nTZ6ezI1M0Hr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784112527; c=relaxed/simple;
	bh=Ba7vK4r5Oji46xl2Cdsat5vGxyOhEWHrLUtctgmKmQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=feFbEBtJw1CEZW7lamtjkYhY2xrMIe0dU9YdvEa0sKyCQdQIXdLj03VsJYc6yG7wgW8awspOsTKcx6xxHmsBEjbwVAJwUDlbjJlYP8+vcpbPM19hWAgwhbhI3TP7xSueCgZYuEz1XOyDoxOeKCe1/1YNulsL82gBq06OieDSPV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lnu7a3rw; arc=fail smtp.client-ip=52.101.70.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lnu7a3rw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5cXE6hmj6E5IY+lQj+M7iKbBJ0r9KktTL0s9gYg/MO9y+0rxk+WhTJZpoAOD2A5YkxVq+Pmc7rVOVbLOlQoEsW+Ayz2++QflJSujZfr9J20MStGq6duSxyO/F7XCHHxPzKuFYZ1YElvas1raWcw8D0YyvGAdZnzOey3fwFY41snesahFe/r6WSOl10/pfq5uGtoa+FQjqPOZAO6E7Y7SIK0OV3h3KR8jxYsRYa1orBoyTG2K58KBkymHI8svgGfMzjm+dFFTfcFY1gaEkXNh9+0ugUofdZuCndDzj8xXkDnRAjfXyzH9w/QQUg+MSxmfIJcE1pBDL5+6CF1QBFTmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bsbcmEk0ykYalAwjYy6hHPK6BGsbqNVuZPGax2hgyQE=;
 b=fABeGKo1IXxk1lEKOfs9oKyIbkuViW6/jdNhslawqAVq7Ag51nkPGjgSH23Gv6OPvqhktptsY5Yh37RgJUdsK8ScQ+Vv1ubRRxhQMTgpIUIWrkYm1GoPnMzY13+WCsUvml85oYXmIvClrPeoQ3q7G1IWyPsSt5tB0ZEdKjdrSSOoEYVIrVcWC64mIIiCh+dAkyUzRoWMn0StofXDQZ02dNxznjRsx8yGm4u9nIflOXu4e16qcLqOdwHLgZYj+56A+j8FxCtUQ8a4RRVPqxy3KpCLiOc9NXtAMjtfleb2PX/XaTxS40/TymQuaLos3WSND/vFs9dnEvDysypdr7YlMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsbcmEk0ykYalAwjYy6hHPK6BGsbqNVuZPGax2hgyQE=;
 b=lnu7a3rwpmbIi3JZRcP2fvmIZteFuDxPt/HTK5HnqlLzM60Ko75htJsA/lTTZzNrHo8Mlvz3eZSjOHmR/YuyYmSAs5EBLE6W2L/1PLwHoKFdKUneF2fsKgWurMRDvAua3XR7pxSq2GSgNu3AFdybAFM7ZxIi6UPqfl1sR4jCnYclN7b4o6+2y97l2VtqvNnQGzY95KGYePX0w4h/FXbX8gSXFEcBkfKqJaeSAsoXAPJAzi4Yu6SlgXSRYi979E5ve3gpNjUAcG9FY1POC0ENZWBPzpq36DUHhr4KkQxbcdv50UthPkyowZennksvR3/vmi3bUWHfWtbFvV/Wjs5OVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by VI0PR04MB10950.eurprd04.prod.outlook.com (2603:10a6:800:25a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Wed, 15 Jul
 2026 10:48:36 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0202.014; Wed, 15 Jul 2026
 10:48:36 +0000
Date: Wed, 15 Jul 2026 18:47:13 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>, linux-phy@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v5 3/5] phy: fsl-imx8mq-usb: add runtime PM support
Message-ID: <53qnpunh3yj4zinchexpjvj3sy3hsqy7lj3qq557dietoivf6q@b4gdtrlsoagm>
References: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
 <20260630-imx8mp-usb-phy-improvement-v5-3-25d616403844@nxp.com>
 <akQTrWWbnDSr1Nd1@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akQTrWWbnDSr1Nd1@SMW015318>
X-ClientProxiedBy: FR4P281CA0278.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::15) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|VI0PR04MB10950:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e49f609-c697-4f41-89ae-08dee25e9f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|6133799003|56012099006|11063799006|4143699003|22082099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ZmrWE3hZ85qejUno2CoE4Mh+b5KHBmN3cDweYyne+vcIaA5VZFUysLuBKFb+JnAQwLK+6Iog10Rr4b5bMTzvgSwpzekKoHucIbn6EIMl+Nu3O+OQFraMepv5bGKzA2YaQvAtiX9g2BDQJP4YF5/6it/xyHcHgqOa3WBYtfCjvpz9cyuz8pIFQfJ/Jc0CGLByWpr3H7sPNwn2KjcNZNDBmCDoVHi8Q1YZDnEDlI9Ltdk/YjjPXGr9mvVvxcuLrCMWCHTb+0VlvZyu3HoaQhqyQU8mERMU9yiVEGiwl5KD9BtAvmdd2aBK46IZOzbvsixlOevBXt2I8YK1EwsZPl/u6Vknih3r0t3u4SBPL51q/1p2v07IxfjGR1+fhWiHPQHGg5udsYKIRh0eAj6Tpc8UysDpkQvma9q33KuRQVVPjng1E6TAQdA7vNbU6bK2sDLsx4NAgfiS69spULuIxs2d25JCDb5IkL3PO/3msTlgYIU3Vil7a90Ck3hPh8QvfZRtvhTSb0xSGhz2adcNnQ4HGWQVLeHCb0ZgWFCwK2pjSRibjSufbE7N07iuMAQdV7o5gI1pq1pQGC7CODL+xVGMuwFQ1zJw2U+lMzYvfto6Dlbg1W4KOwhVectLkDl79bnHfqF3vnuESV4tJLTb+SGxSyRijGIIGJdFFGk22wEqNWA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W6p1DcAdD6Dcc2vim48nnv2KqbGF8s14wr4/UyVt449u2NxLok/qnwtOaDgy?=
 =?us-ascii?Q?NK1bjK/j8ekDijKMNpCDZDZ7U60xE/625kz9O+9yWxkXX+2NaP/XphMGtXRP?=
 =?us-ascii?Q?H4MArxu76JBkricqmsKD9vFYr5nzeTQ5eRjEHsC6st+d7orn1EB3P56nt37S?=
 =?us-ascii?Q?4gIh6GA/6vBG1+2DT3xd8RhMvmZpmuva7s+8Owvi+HqcZMKkp0S6s9li8bvN?=
 =?us-ascii?Q?UhqNIQM6YDM/EuomOW9q8dR6+YR4TWnWdKu6eNw3C7IrbFPwZjU5dYcNCQmn?=
 =?us-ascii?Q?f+juGAXURqLPoAzkrokF0YK3DPVJhRHERBoNpimPhtEOYhoJZs7x8XlFu0RQ?=
 =?us-ascii?Q?BP2KPpVHYWq2snssq5TrSKiCCQgNkK/CryyKc4FwZbIDrcgvQDRoSr4u2FbA?=
 =?us-ascii?Q?fKDiErQfmAyULdzJhu7YKPEUXpxKkN6UJ8EjBZqATeZq7z6rzBwmPiJXbCW7?=
 =?us-ascii?Q?GsEpzW4VM6qTOSzoBSMDQ7a3l9IQZfSBtSThvqxt8ps6mJR9K6+EtR456BLB?=
 =?us-ascii?Q?5dlHbmZH1AYodK5ywgahSpFUESLL8ZV5dHBWIlKCTr3h6X12lmGuG7ClTqWV?=
 =?us-ascii?Q?ewr1i0OZNmRp/4u0+O3RhzCdO4GiOIuaQG84Acx9H7MpOYSQoJEewJK4+TYu?=
 =?us-ascii?Q?H9w6Qar/8kwUkHtAmUHhiesGsoYjaaq+5rQXuTAliY9ge+cflnU1eKhB3nAo?=
 =?us-ascii?Q?Y2aPHVw6SKNzWDqWDnpLRrXkDYGxniPQ2GKY90gsuwgg4HWX4ZjJy8Qisyym?=
 =?us-ascii?Q?he4zA3lOeWYggSbtQGW6LXjYOGpH5aDo09bymgLBquBX5pE+nx7YBthpX85N?=
 =?us-ascii?Q?VLYj6vZ5bifMEoOY5lYZGy1A41ktcQ7cyiSzyXSdcC2xf0WcUaLiDDGnmQE/?=
 =?us-ascii?Q?S7g+Pdcb67z5P4FF1gc6At+NjclJ+ENL0ZrpqELshBysYnM7pyupdmgpooKE?=
 =?us-ascii?Q?VWVvgKB1CHVMZlvlX6udEFfAI0oE7aeYQt9KYw1yS6sBPvPQDU44Ucfhc8kJ?=
 =?us-ascii?Q?6Mp2RnVlBVrf84ao0WgHx9Rx0DPQu72QYF+6ntiTcbjZp00LDxxehopdUeZK?=
 =?us-ascii?Q?oz+fRRmSuwn8IReJlJFd0PdyWdQl9sF3bwecVc9c+ytyhlPocmmmCTWbokxq?=
 =?us-ascii?Q?2kgza/REzLVFQLuIGw1xEWnj7WdtkcZAjSZnn3x4rN+tkNLeDf+pixhU9GyU?=
 =?us-ascii?Q?iY2O9/COMjzClV38EGP0rRiMAViCWnCFF2U0BfIsDmKctyKMzmV3e+0RlFwj?=
 =?us-ascii?Q?JtFGjA3I2GlrZhj3PODvNzESwTnmmp1d8RXolp41WbZpsN9SEf8FObTZ5Int?=
 =?us-ascii?Q?FIJ2poYmQKiKeCd7ThEbrHYo9zvA2TBq6wtHUGZlMDWRjQIRQapeE1B3XDrn?=
 =?us-ascii?Q?TkR2vVI447/YGSbg5ev2nl6AO7BbdQuA7y+FmdGkRs3b/MlWW4ve4SjfcvQT?=
 =?us-ascii?Q?iPrCyYPUoswMV8vVLLXPL0PcRYsiLUceFvh5uNcTxcscnM4Y6aozq3U8Lgcq?=
 =?us-ascii?Q?+Xb/ZDf6yuQnH6X240lRNb2KH8rQiovFb4iWM6yQXSDQEghBm8b80Mvn9X91?=
 =?us-ascii?Q?CgSJpT6rIhJsYo2kaYN9erPYvIQS/+NS01pLzZTZpalDF6455jbg9FwKbPyJ?=
 =?us-ascii?Q?ndq1WywWcuwIZqruDmKRd3NfskFgUFq8O0WT5MhJmNJoHl4EKWVfo/VfVmEi?=
 =?us-ascii?Q?aES514RQVIb67YU2RVjvm99CfWRJC8FwQgtniJGL36ZgrTFXK28DpvxwIkmA?=
 =?us-ascii?Q?IfaItcddozdV6WmryWRupwN9EUK3fC95qWGVEy7y1NTyN6WPdmbs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e49f609-c697-4f41-89ae-08dee25e9f8b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 10:48:36.7071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKLLsIjZ14+MDGogwb5zNmnsOFcdPhXGoptZGNZ1HfOpvetkhvjXVECz5bEY3+31AR7FenO1rzlVvJD565OX61WgSNhlYpwtH9vAJyoH+IDzc+ujC4YhB7cBgVS7WmBQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10950

On Tue, Jun 30, 2026 at 02:06:21PM -0500, Frank Li wrote:
> On Tue, Jun 30, 2026 at 06:11:30PM +0800, Xu Yang wrote:
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
> > Changes in v5:
> >  - use non-devm PM runtime callback to correctly enable/disable clocks
> >    when unbind the device
> > Changes in v4:
> >  - replace guard() with PM_RUNTIME_ACQUIRE()
> > Changes in v3:
> >  - new patch
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 64 +++++++++++++++++++++---------
> >  1 file changed, 45 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index 3a5788c609e1..9d1dd0e7352e 100644
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
> > +	PM_RUNTIME_ACQUIRE(&imx_phy->phy->dev, pm);
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
> > @@ -693,13 +680,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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
> > @@ -708,6 +695,9 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  	if (IS_ERR(imx_phy->base))
> >  		return PTR_ERR(imx_phy->base);
> >
> > +	pm_runtime_set_active(dev);
> > +	pm_runtime_enable(dev);
> > +
> 
> devm_pm_runtime_enable();

OK.

> 
> runtime pm will be always on active status, why suspend it?

First, at the end of __driver_probe_device(), it will call pm_request_idle()
for the device. So runtime_suspend() will run.
Second, this platform device is the parent of created phy device, the runtime status
of phy device is managed by phy core, so this platform device will be managed by phy
core indirectly.

> 
> >  	phy_ops = of_device_get_match_data(dev);
> >  	if (!phy_ops)
> >  		return -EINVAL;
> > @@ -737,15 +727,51 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >
> >  static void imx8mq_usb_phy_remove(struct platform_device *pdev)
> >  {
> > +	struct device *dev = &pdev->dev;
> > +
> > +	pm_runtime_get_sync(dev);
> > +	pm_runtime_disable(dev);
> > +	pm_runtime_put_noidle(dev);
> > +}
> > +
> > +static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
> > +{
> > +	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
> > +
> > +	clk_disable_unprepare(imx_phy->alt_clk);
> > +	clk_disable_unprepare(imx_phy->clk);
> 
> can you switch to use bulk clk api.

imx_phy->clk is required but imx_phy->alt_clk is optional. So it seems not
convenient to use clk_bulk_get()/clk_bulk_get_optional() APIs. Maybe we can
switch to use bulk clk API when more clocks are required in the future.

Thanks,
Xu Yang
