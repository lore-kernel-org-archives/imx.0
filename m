Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010027.outbound.protection.outlook.com [52.101.69.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7553630A9
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 11:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918069; cv=fail; b=Dg4CEtSgkQlJFIN2qQvRMvYX/DfUFktIS2TBl50sHb2ABzTwZCPOQo0NyLr11k4auci9tCHFdjVA3szmQpG0AmFFivqQkNJ+1fd72nQQ2pNstFtY5CupSgUZFknmwRvDSiAL0NeDG+b0Hbini8yd26iPNZz4FWL451r5+5/M6RA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918069; c=relaxed/simple;
	bh=IrCxKIDa6IFs6NpJyH6qIcBB/fpWzG5IOhFTVSyVowU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hKlfhNHEn7BjTUsuFsxbH54NlmNw2iJVCRYtPznjit2gRQnVVsmyKmQv8pHLyOKGIiyrv8+F+pmbsMXzCtElIKkK+VzO0IXg6oIanOi80o3gKIt9VM3qZDD9yc7wUYohQikn4joW9wjQMsaoafZ0OGQ3e5168ggcWwJWEaz0lMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=J8hg3tpH; arc=fail smtp.client-ip=52.101.69.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="J8hg3tpH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARJTJVlzU9lpLVHVSD2/in1AX/kE7++SJhLR7KdYVGCC4HLVPNXliq1WtD7a3D3NIHgTiiSIGzpWEg81EgAwovvTCvtbzBfPAXA4rLMZqW0UQKlLTZdvEucB1xYgpr+rFLVHuPtGb5RLxstqMM7I/u511tTfmhEvvA+CrYVfp7hjX5/bbYBXVZQa9UE3yYJEqWAWt9dmGiQD65R7Kzn1hKMPMgoJ/A3d9bxB41mwkaL6qpV2C9erxB57T8XXSL4bOcnGZyCPbug90LyzDBK/cFgebGppxk25N//hlD2HQnXxzGJ57gPEkjuAesc/62TOy6jwi19W0vMGlL6jwlSnDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTIUrrPho857rRi2g6tpS031PYuf4Z7veQTIO0tjK7I=;
 b=PtASvLe0L7XW070gfjSlxPmPHdkJZPRT1zHr4M4EvbN9ib/p3msSoTmQM7fzuyF3CPqXtIJUgeBbBqrIwwEiynN+l7YAAcaINuMhZzY7MBmFk4gETj/RAN0ZbZy3rMaIaSUWUGJV68qwEu2ByG6RPjyVdTzoe6EjOnlV8hY/pd8s88hGX6jauDrQ634xXenTQiwqfp14qx5IJFG0wtfyrkWxkBMwkZ4DVTNaUTIf6LPgZDbbcYkaxVtZj3rdGAgLC0tKCMlNB48iRR0OZhKrjBJqx8/15n6Mj5KWX4qRVTZclVSBf4JYZbuL8SfSvOVg391yp2rAOUk68u8AjEfCcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTIUrrPho857rRi2g6tpS031PYuf4Z7veQTIO0tjK7I=;
 b=J8hg3tpHdu+wrl2fqFiBBafd6gAGsEnJpOXzYy8i7tkWRZB4MgYKmgz6zrZjLW/paEp1mXsmbu/H/2IS6dJr7pN4K9m5wn++qhnkBIV1c+0hscfRTKBxTw2HGlcHlVH3OpNs9CIpld/PtQO3gNqDKQwh/Myq0Yu/woZ8PoYougTuHTLNOIHH5VyL3P7/Wjp6a2lE/NsX4A/ECsoPU9XW4OfHE9Zqjc9BgzemoeY/th3/acolmPT/EJIiCo4Ot0vaNnNRxfqXFLzjdj7ArhKdxw2Z0opVpn9w2U4r3mh+7MC5lNsgkf+SIQdj4Y+TjqSyr3ihQ4qCl6fgkTWGPQwQaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AM9PR04MB8858.eurprd04.prod.outlook.com (2603:10a6:20b:409::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 8 Jun
 2026 11:27:44 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 11:27:44 +0000
Date: Mon, 8 Jun 2026 19:26:40 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v4 4/5] phy: fsl-imx8mq-usb: add control register regmap
Message-ID: <k6gw6fmfxkf7fr4nuoamjohusbcbwbjrylvpmuqvbs6utntmvy@bdrgafyonotf>
References: <20260605-imx8mp-usb-phy-improvement-v4-0-b2ddf2f3862c@nxp.com>
 <20260605-imx8mp-usb-phy-improvement-v4-4-b2ddf2f3862c@nxp.com>
 <aiLrMs7AMECq7U66@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiLrMs7AMECq7U66@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: AS4P190CA0069.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::15) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AM9PR04MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1fa58e-618a-42bb-46b6-08dec550f5b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|19092799006|11063799006|56012099006|18002099003|22082099003|4143699003|27256017;
X-Microsoft-Antispam-Message-Info:
	k1Y6dyclr+vKc2nkVrGm22Ux7mfNr7zElJxQmJJ4qpTs6KPmUiKIAKiW7xGeeBd8+1AeQmJG8GAHQPQOpjtJM7TMTXAFAe99W/DyO7/e5K1YDjWg0by+duDq9J7kVKrOvkC60kLIdmR5FYa3ZsPdAMXBqSbmy26bhABIM9Dyg8tovPluxnjw5lO4xvnz9KSmv7/vsaPiGE6zgIk8VIlrewevJiY2815znhrhQImcdcYzgBUgh1fd5bjai/d5Z59/ClB/nH+a+sn2hdZAWQlVW1EK6pC87E5eIf2CLVa950CbVbIp5FgBoCR//g9asa4F3r1O04H/GtyZEKCgZp3wWR67Li0OiwXt+KyBokvSHngNvllRffut2EUB+OOrxfWA8uhBkqf61JEpxQlxVookkuXRqogrRRZHPcIBE5m6BCLEEbNPP/OA/BxMwSHh6K9GvPTm+0rrYG66nPptTS4+/+E5UDS8eYSw9iHoDARhZq9Jij7DFzjCgSyVFeH+FwVQCn4vJ4s6TpV8OQa7Ig0lPw6xP4S7s47a65bX+mQnQYXATqHlQd1MX3B4Zy6rkYeDhSEWI0gGdK3FiNhiNSFrwE+1s0gRpBx5N6nyipxf+MLw5KyEqrX84gei60CrzfKKC3+Lk0Z4uvcMlBYHnF4cN0l4zo4nN89ZecMf6sHEGh9T0H9l9ywvhBMRZg05dg35Kc7YWoAO76ZQdLg624JhxQ78F0thR3La+jREb7IKGXPRnu0Uyv22nRnvTUu4c4cF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(19092799006)(11063799006)(56012099006)(18002099003)(22082099003)(4143699003)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cofg1schmKIMpX9uG4XID7EewWZ5Vvbx5Bt3INt12OxsktAI2oemdkCxis5P?=
 =?us-ascii?Q?tJDJ+/Xg8vgQU88b0nwPTdTfJioawqc+4eECiLDNhKuZbaParTVb2m/9OmUv?=
 =?us-ascii?Q?sssM80NxylB6A1jR/bycgade021Lzxeg2QtC97vBeI9zQkHqc7I8eaB3MQPu?=
 =?us-ascii?Q?L8QkEZi6702uTj8fjtKUjhjsu3DOSjy8g425cIEXGHog+PCJQlunm5AE4Cdn?=
 =?us-ascii?Q?7ghC0u+Gjj0+EwKtGw+dHpbuPsDeZ2a32FcJn1GUxwI4B+6NQV6FEQyMC9y/?=
 =?us-ascii?Q?K/6QbRaEF6wiwC9auagGAmpjrRKopXjV9TNdLpfMDdOl3RH/kQhXJaGgTQWS?=
 =?us-ascii?Q?T5gzavEYL6kfCFqkr8on6ZH5YTLCP0SZmEe42sk17VGKrDzSFXlO1i+Ba3ld?=
 =?us-ascii?Q?X0yz2DZ6of5W0ihuYF5xzF79+dwF4NfN8Oo7nuDlc+G7rbfLkbTAOy/2QBSc?=
 =?us-ascii?Q?oJNjxbyaMIaQwblvhvN3Fpboi/IhizHuE/99f+3SWqKENo+Tgtl4/DvtYNJ7?=
 =?us-ascii?Q?uxlIynAuVuBNYymNrxzlUHMijBrXKo7dm9kqWJGmTkPFZS7oS6gUGqxeQA9/?=
 =?us-ascii?Q?S6b5BVlGGUYkMzZtIKOSRXI0uz8gOHwnciVxjPNEbFkpwVPFEFXB5wuB4u+i?=
 =?us-ascii?Q?q+3Pe/6G3O5/8K5kuT3gmaHYBeG50HtIgeqAACtb8RGWXxw9U5lZ9LpZ9PsG?=
 =?us-ascii?Q?CPWmGACD5Gi6uLdMyyRCJHw0O9enYX5vV69nqjptjw6eAURMs59qOECUECJR?=
 =?us-ascii?Q?D+jIr2HuV0yTg7/lAxU/i/jwWRDtk8N9WiLPJbZ757RDGRQldTQapBPl9IpN?=
 =?us-ascii?Q?LHN3NyOSH3lp1pUX5jF6ER51J1tGQX+lHAdvEPv1vRQfQlvTkum9UNj/v68m?=
 =?us-ascii?Q?oj6jQLTdkAm4qW/0vZGQWm5kE8lKU81tkyhnKDnGRSMRJdFuvlFeVd6t3wkw?=
 =?us-ascii?Q?J900NJd8CmnEbH++4hNalP4txS4Ocfzrt62RbDpDsJdJdMJSLULUO3CnK2dC?=
 =?us-ascii?Q?Oo58L+dZAY9lX1NbOx4bmGbOgoIbzBsWOi6wmDI4lcs1XxWhyxRfsIlqy2ko?=
 =?us-ascii?Q?UlxMXI0QJq/OjVbV0kRWg4pRvUiDP+NPg8imU1b3SY29LU9PDVipIoNwbT5q?=
 =?us-ascii?Q?GGCrx2iW/KUGe2sKV7vHWY1YAHHuirCSzXp0eLdKJB4eEa1nZXRVwB3AsUGZ?=
 =?us-ascii?Q?dvQQmXZ0+WkWFiCL6Mx3//F5TJsaEQVV/bRtV/ZXBd8KlxAdOACMHqfhxhB4?=
 =?us-ascii?Q?INa4iSIo73WNwHnPivYxyfFqTxpPdFJrUpSDiAZytrci/1hu6g1jUMeTAjcX?=
 =?us-ascii?Q?if/CzCCSJADptnnBEMngmCkJrOxHMotVRj6xWhnTcXwFYOHWabHZ3I7fgybg?=
 =?us-ascii?Q?H0UGYTDRgdwE/b6Wk1zyQIdk54LlyQdY0WkgvPeHQ1sbiZqOL2G7bRpFlEWN?=
 =?us-ascii?Q?7aLbbk6u5fdYvdj8ZT1oxZerbETRITA/UkEYWmPko7BO0MLL4idY+V2Dg2T0?=
 =?us-ascii?Q?4Z1oJEQWYQUz7F+CtHd+waLSXpq+0nI75CC17qBLCEuZpKx+qs+88O32O71o?=
 =?us-ascii?Q?tON+ROyEePYdo+vBT/CHWTw4N6Y2Z01VTAoxqY+zrlGW1KeYEhWF3cHDOQIk?=
 =?us-ascii?Q?lYXYMuaTdi1/XqaCF/AInuWSd1t1/rPjdB+D25VXE6SUxUTrItHRwtSyPbyk?=
 =?us-ascii?Q?Z0LGLjTT1MOcCnXdJo8q2APVdkVd7EFQ/Znyn4+QW7AnssAz7QwB2jDxmyBj?=
 =?us-ascii?Q?p1J+72HGlcz9R9/Lz+fbirNeH3+RQ/XjTUGo60HWWaLVlzeDGATe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1fa58e-618a-42bb-46b6-08dec550f5b9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 11:27:44.5180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwVHi0OUkWnMB6E0GjbeMCAuSZvZTwieJ3EnWILv6JRFZz9SRlj1deREuYasnQvfV8jj6R4RhJJe0aqBLBfhlDG1AtLHWUDtCH2e+WCDqqob1gg9hSXOsKbkyeqEr5Wl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8858

On Fri, Jun 05, 2026 at 11:28:50AM -0400, Frank Li wrote:
> On Fri, Jun 05, 2026 at 07:13:05PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> >
> > The CR port is a simple 16-bit data/address parallel port that is
> > accessed through 32-bit MMIO registers for on-chip access to the
> > control registers inside the USB 3.0 femtoPHY. Add control register
> > regmap and export these registers by debugfs to help PHY's diagnostic.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> >
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> > ---
> > Changes in v4:
> >  - improve commit message as Haibo's suggestion
> > Changes in v3:
> >  - drop Frank's tag because it includes other changes
> >  - new patch
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++++++++++++++++++++-
> >  1 file changed, 26 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index 27aa696f5dd4..e24f46d7924b 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -1,5 +1,5 @@
> >  // SPDX-License-Identifier: GPL-2.0+
> > -/* Copyright (c) 2017 NXP. */
> > +/* Copyright 2017-2026 NXP. */
> >
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> > @@ -11,6 +11,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/regmap.h>
> >  #include <linux/usb/typec_mux.h>
> >
> >  #define PHY_CTRL0			0x0
> > @@ -56,6 +57,8 @@
> >  #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
> >  #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
> >
> > +#define PHY_CRCTL			0x30
> > +
> >  #define PHY_TUNE_DEFAULT		0xffffffff
> >
> >  #define TCA_CLK_RST			0x00
> > @@ -119,6 +122,7 @@ struct imx8mq_usb_phy {
> >  	void __iomem *base;
> >  	struct regulator *vbus;
> >  	struct tca_blk *tca;
> > +	struct regmap *cr_regmap;
> >  	u32 pcs_tx_swing_full;
> >  	u32 pcs_tx_deemph_3p5db;
> >  	u32 tx_vref_tune;
> > @@ -667,6 +671,14 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> >
> > +static const struct regmap_config imx_cr_regmap_config = {
> > +	.name = "cr",
> > +	.reg_bits = 32,
> > +	.val_bits = 32,
> > +	.reg_stride = 4,
> > +	.max_register = 0x7,
> > +};
> > +
> >  static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  {
> >  	struct phy_provider *phy_provider;
> > @@ -696,6 +708,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  	if (IS_ERR(imx_phy->base))
> >  		return PTR_ERR(imx_phy->base);
> >
> > +	imx_phy->cr_regmap = devm_regmap_init_mmio(dev, imx_phy->base + PHY_CRCTL,
> > +						   &imx_cr_regmap_config);
> > +	if (IS_ERR(imx_phy->cr_regmap)) {
> > +		dev_warn(dev, "Fail to init debug register regmap\n");
> > +		imx_phy->cr_regmap = NULL;
> > +	}
> > +
> >  	ret = devm_pm_runtime_set_active_enabled(dev);
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> > @@ -731,6 +750,9 @@ static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
> >  {
> >  	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
> >
> > +	if (imx_phy->cr_regmap)
> > +		regcache_cache_only(imx_phy->cr_regmap, true);
> > +
> 
> I think this common problem, is possible to change
> regmap_read_debugfs(), let it call runtime_pm_get(), there are already
> have runtime_pm in regmap field.
 
Yes, it should be a common issue when access debugfs on a suspended device.
Not sure why regmap common driver doesn't add it. We can do it in future if
more such cases appear.

> 
> So you debug fs always to get update value, instead cached value?

The default cache type is REGCACHE_NONE in imx_cr_regmap_config. So no
cache at all. The main purpose is to block register access here. Once
cache_only is disabled, it will read HW register value.

Thanks,
Xu Yang
