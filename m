Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013065.outbound.protection.outlook.com [40.107.159.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97C132F748
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 12:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205675; cv=fail; b=VTfvoh86u1KpsusVUM9sf7N0OdXOdnlWKyb96aGhyP7g/v/9TtgzS4bgWGpn3LPFA3Sb3RQSFEt8ZYlu7f+Zs8+rZsALCJPgedx38UWt3nICd7Vq3ssxfm/wXptTLYhlrZYk4UZhhRfaSXd7gvJ0+bPyUo2aLy4dtJtKWy86LMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205675; c=relaxed/simple;
	bh=eu/DW/dMYypqt/hc1TWfxZv3Vweju++RJL/YuZgfkJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UiuOPysWGDF8VTo8+2ONk4zTY9xiRBfOMr8K85iBSMEICM3z3Segp7q/Zuz7xclo+bQZ+c2WmAouXRo0Ayn8Qez9brcSX7YP0AQgFhDgDOQ6Faj2qRaH7MJ5Hu/Gxjs+TEdJt/RdFqPao6Vy4ixZ68RscWEuzSmpm+cxtRtjb58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ihs2atTa; arc=fail smtp.client-ip=40.107.159.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ihs2atTa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AueHn5FmKcF2CqXa96RWzJ7b5pGTQnom20pCXWZBxK4vjBfIKSqa9u95MGAKoWuogEFVGWVxws1BEGlatsjizR5kYTO4oS26x1se5QTo82NKilrHec2mPVGk9CGRkTyxA1OL53YGE5eHQZZ1aSATEvHIEO4qvcoNU2Y3o30LaMktDmXla7Be0tFnDma89y3SYhRhJvyRrOSF/taJ87wv5F73qlYZhtV75HmTmX+wHi20LTqYvhq5cRgP2XKZz3QaV6VBIGvOe7rOcFoKKDCyYUYlvZbNMBF7zJ7nfzVp1e4k/1s0gNnm/dd9IFe5scWcxObcq0PXoCzCfU44cwswmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Mk9nHBF6Z9TtDEi1xPdJ5l57Ah17ET6dQN4vhkdut4=;
 b=LrtRCJcKZXhWR5nmvHXIaajRZjfYTSYX2f9H1BtXmhTOEaYzmZV5AtqMeAvft1Rv1XQ4eBfQ53EmQt7h2PtxkVAUyW2l3679LbqD5qs0YmQMn33V7GybV2IGfK8YIdA+ZVeFtT/IY9oLFpGI7uJpGyHZHvwi8JZDoit0Lh0G+1oWVapRrgDXJ8g89roTGWVbGjAUStycBHX7Ftb8VL7K6BvbZ/nzAIQ/eSnhNVIolgcHboQvRBDUaGGHmS0mfzN8GJoAdOOUGx0lr43NPEPkqIQ/Hhwotvs4PQoz4pNfCJQR9TCL3/a5QAGWQ5gBGepPq/lCXef/5juhS4oX3WDOuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Mk9nHBF6Z9TtDEi1xPdJ5l57Ah17ET6dQN4vhkdut4=;
 b=ihs2atTaHIRrKmupvcFVpoV6xVcpg9Sy5bRVZJGlLgeIgkLOqkb461hWM73UWooE2m7eOoSCoSO5BGxMpHI4Eln66GgMaH8pXnioOoKjE0b+UgiluGowxs+WOF0Z7MPukbu1jWUeRZr4+VsZm681yOTsyT/zLn411FGz8rTBvPwKLSBj3fjIAz8g64HC2VfxtNqEzQW8ZtIoH1XQx7wDH8KXTIEpV0vHoww5m/wZ5sTH35JI1uw9/QLBdKvN+GJ9OjsygzsS8JlPmhrDdiyx8z3Br1hj27TKlFmOTHL7TNUOw37FeBafJkupophYOPKy2WEg8547F/3Qs38PmziqXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB11345.eurprd04.prod.outlook.com (2603:10a6:20b:6c3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Thu, 16 Jul
 2026 12:41:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 12:41:09 +0000
Date: Thu, 16 Jul 2026 07:41:00 -0500
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
Subject: Re: [PATCH v6 3/6] phy: fsl-imx8mq-usb: add runtime PM support
Message-ID: <aljRXBXtv_TjJECe@SMW015318>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
 <20260715-imx8mp-usb-phy-improvement-v6-3-00d95e270e4c@nxp.com>
 <alenBaMOTSPo7DJV@SMW015318>
 <omitpksxmr657vlmjs3ybzhiq6zj4znrsp2tereofqees27z36@m3lhmrbufqay>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <omitpksxmr657vlmjs3ybzhiq6zj4znrsp2tereofqees27z36@m3lhmrbufqay>
X-ClientProxiedBy: SA1P222CA0099.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB11345:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6bfd30-5e64-4591-d0df-08dee3378284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|1800799024|366016|56012099006|11063799006|4143699003|18002099003|22082099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	TD9cETcVRVlzMr4Uv5zi7ishU3OnWkF8wuJlzGzao2LCTLbvb7AbgdSkRJdEk0LeeuhTQAzBWiJ0umtyhWsjtwBM1vZ6WFrpV23Zcu7j0wWD72Ja/nGDBPmQL1IaPwZdnAsj1f/WrcQP+tN82P/KDzOSQjXtpR4bIcVkHTa0g43NQGoPvMGcWgCK6Motc6PrA1OTuaQHaUu0bDafd9Im1p7lLum85Q/Sk8BhYnqdqNqrQX3YuLkIaxUr7+gtpKm5xHW5HQH+2lXvnzNBfLbCQpkm/983OItOzP1Pa553uRv24B8I2o6ckIzVlAgkQcNCnBu4dR+u0p4nkSughEcxSjU4sGNkhgNIqXvu8iXhqTnOAYP5HKRwMUa26dsoX+Goa3FsHwK/bpDDezo+WfhXTrsu02wu5nTWBkgDZWn3wlvBlsq0Lb2MHH4yfGN2/Vye4jCTYOgOGqbbKGfXca+bcQC/y2CAauZO5LgYfgIhIm7J38dNBaAQRDftanK0CXarGNgJ9z5dvjG19fTkQx8Xf701RGeaDWUbvkkLFoTvR/KE2tFExuxUw064AqCjX7OfZvH6IvugqcdI8M3pXMUTJQ18IRtgQ3bkdxvQfn6O1cFDMHkKY0Tdy4zYlhAJs5w3UhJei1peNeGJQcnZO8ZYTZQpkEGQRcrBke6pHNLq27Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AQCyeNJcNZvJUkRbnDj76xTGAT7zID5y/Lprs0vKgIJ0ayevmJ4zol4ZhLh4?=
 =?us-ascii?Q?KjOv1az4Qayc1n1Gpj0DJo8zizKaYHJphBgdE10/zOkQEM2V2zGFMbc757hG?=
 =?us-ascii?Q?zaIoQWkVRA8WxYT6AO/SP5936GgUtHmla7iGYjmA7P8W64q9Vi1228Y4VjSY?=
 =?us-ascii?Q?gk9WRhXq+oEdVmvt3kn3CIL9QfLNTcbif2/M0t7dgpcPPnJ6gBcPa0HhBStN?=
 =?us-ascii?Q?B3NvOyZf1XIDRPMjst+f0U0LFIQgYhs3jWQzaVLoPd5q1de+IPuZIcRPZWkG?=
 =?us-ascii?Q?noG0TZAoGmeDiQ7VCse0Sji3uVofi6iqnCcCUet47hn+405sm5QF2WylcduW?=
 =?us-ascii?Q?+rgYtvLRalYOFpqhm9jY5LIkJe070JY/EODLYcmUVVp8QfFcLKtPeGGhuiug?=
 =?us-ascii?Q?QF+1psJYRzcbvOGTrXTwJT7/y73+3aSOYAMKViERSB3eruUbaQ4GE83222+h?=
 =?us-ascii?Q?1EK5qKIe4afbQp68AoSrNOUzFf7mYMeXxAvY6k96VQ10Wrk2HOmFXBE71npq?=
 =?us-ascii?Q?dp6jpcYuNvXgxWMmMdc3llnvtY37yq9Cgb2GaDPA/tgs8TVKMiWNSntffdME?=
 =?us-ascii?Q?DPAEIMU4fmNi5WaDKCCXME+Su6PuPHoORU41nfY+TyeQxWg+rbWOTUW/glks?=
 =?us-ascii?Q?Fp613sKHSqubJvhyPLBtABfFGvSVI2kc52xQWZqBYUIOntsBIpMBjjIvCFcb?=
 =?us-ascii?Q?qH0+iDuwJeHElWfkqmIDPOIagwmJy1jXI0a7RdWxbRPHig8Bi48IqI2M9axZ?=
 =?us-ascii?Q?X2FRr90Cnn0erQxO9kBjDVFVqamOkB/eoGlWslAqlbrEYYueW/QhqjOUFuKa?=
 =?us-ascii?Q?OQs4ICAkZWQD7P4VxAfQ+1aesswVKvTD1lQ/8mpKWMYK7LCv45XWep2lI2km?=
 =?us-ascii?Q?gQmsHIQkaaVZuz5KQF/vqLXGPrZ4ZzUHq14QejL7a4+2RqcN+q1MoWGxAiH1?=
 =?us-ascii?Q?lz4mbAV5nondug+otvSSuN89soE+D+xn8of169Xvw/is/rcsU9sWbPatNff1?=
 =?us-ascii?Q?JI9PDaYHyU4amnQt/w6/19KCu+mEuZdgFIvflvBgzJcCV4lUxq/JtTCMBZHq?=
 =?us-ascii?Q?YUqJhACZnfr44ewG7oKJZcRWaOhr6Q30ulgamsPDDsViPIfQoKA+Az63YZyI?=
 =?us-ascii?Q?ugPyW8i2il3YCWIvm6i0GRVq56Yq35/dywOFGMok1NE9W8afOnbZ4WCNXs/u?=
 =?us-ascii?Q?NenXl9vH2preeAndT2xivHn2gV0/qIrM2o+5eGtQWOKbekgqZHMxMLZPiffV?=
 =?us-ascii?Q?1hvak7JxhJcEFx7Y4loHFXXbtxBacKDEsOwtgYWWf56JQcZQfywUTQmgV4JH?=
 =?us-ascii?Q?VV6S5TfOZJt1t5cxMRGsJuGxe61dsTrtbgas8JoIMEB5FkJjO5fb9a59aA5a?=
 =?us-ascii?Q?IJO3SeVEttso0jewElhMdvZYHrHxL4BnKgLEaAADSa97RmZ+ZhIZeAL5Lskz?=
 =?us-ascii?Q?IkuNPCkeVREL1CPMnfvrxNYsV/vZnhoCxFAC02D911MZQkrBNjDHH6U4lArl?=
 =?us-ascii?Q?qzT09s5b8OE6e8fD8MMqBkoDOakF7ORhyka4AEb0ChejmGOCEJYFIa4zLDW1?=
 =?us-ascii?Q?YbuPgT6z+Th/L9vi6c5SDuDA3/aG58ZGQJhKAX2fAGnyYwBLQhjSMz/IvSky?=
 =?us-ascii?Q?olPXJD1JTajKiYaP/elZ79x07LEhcDyKLcNKKnIkvwzM3KtINGxt6OeTsYOK?=
 =?us-ascii?Q?D2dth3fj6nsxpvchjhKqMm+/HEto79jdkRNGBcHMjsVwoJEgEBYVBeJQWY7o?=
 =?us-ascii?Q?wH37koNyvOMpHmDINu2Wjcv0LhpvhF4L1Nu6Jt5ZDSBrTu6Cto84?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6bfd30-5e64-4591-d0df-08dee3378284
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 12:41:09.1073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14rH0BLuIhiCOF4ydI6zckUXk8nMXIcqYVE7x2I6cg+ri64AQhjFX2mqLmD/CUhJgH7+hwjLXlNbqrOaymVT89MFbYinvrVhHoE+ULEUKbc9ZPMmUsp+yhc5gE6th80X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11345

On Thu, Jul 16, 2026 at 07:32:59PM +0800, Xu Yang wrote:
> On Wed, Jul 15, 2026 at 10:28:05AM -0500, Frank Li wrote:
> > On Wed, Jul 15, 2026 at 07:33:58PM +0800, Xu Yang wrote:
> > > From: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > Add runtime PM to ensure the PHY is properly powered and clocked during
> > > register access, preventing potential system hangs.
> > >
> > > It guards register access in the following scenarios:
> > > - PHY operations: init() and power_on/off() callbacks are guarded by
> > >   phy core
> > > - Type-C orientation switching when PHY/Controller are suspended which
> > >   needs explicitly care
> > > - Future PHY control port register regmap debugfs access
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > ---
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
> > >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 67 +++++++++++++++++++++---------
> > >  1 file changed, 48 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > > index 3a5788c609e1..bc804d2b5aee 100644
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
> > > +	PM_RUNTIME_ACQUIRE(&imx_phy->phy->dev, pm);
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
> > > @@ -708,6 +696,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(imx_phy->base))
> > >  		return PTR_ERR(imx_phy->base);
> > >
> > > +	pm_runtime_set_active(dev);
> > > +	ret = devm_pm_runtime_enable(dev);
> > > +	if (ret)
> > > +		return dev_err_probe(dev, ret, "failed to enable runtime PM\n");
> > > +
> >
> > no place to call pm runtime suspend, so whole driver's life cycle runtime
> > pm is on, is it expected?
>
> First, at the end of __driver_probe_device(), it will call pm_request_idle()
> for the device. So runtime_suspend() will run.
> Second, this platform device is the parent of created phy device, the runtime status
> of phy device is managed by phy core, so this platform device will be managed by phy
> core indirectly.
>
> Just found it's not suitable to call devm_pm_runtime_enable() here. Because
>
> pm_runtime_disable_action()
>   pm_runtime_dont_use_autosuspend()
>     update_autosuspend()
>       rpm_idle()
>
> then after remove(), runtime suspend func will still be called. Clocks may be
> disabled twice. I will use non-devm version pm_runtime_enable() in next version.

This should be common problem. Your case should be typical one.
try devm_pm_runtime_set_active_enabled().

Frank

>
> Thanks,
> Xu Yang
