Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCAB412BF5
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201668; cv=fail; b=A3s42IJrDXuSq7RFInR8N99zYqjM+pY1iJTJsMYkGkxPXJ1n3IP+rEj7RzXRb85tjnYkFy2YvIUpkn4Uq2GNgovRgNwLI9kux2HlxjjxwQ+bP+ofHREhczjC75QAn6OWRXT3xE6EYxFeUmPkDnqM57lv6rZzg8s/BnDtZFMtEig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201668; c=relaxed/simple;
	bh=EpLA/Ny8Qnz5tgfD5e5/IeD4YzXqll3gRl4CWcYRkdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kKMCZU7lmP90vYMNyCZsfqYOUvCund6F4hKwJUVk+KW/nOBdb7sCMvbV2cdWZIBo7OJvf34DZkxkS9Q+gQIQ2cjVjMB9WJ+g9EQv/Cv3wQnMxsk/REhfEl2euzoUUyKoYp67rxNhTx6IgMAItYkwcagIdUObI+U+/FaMQ6oYqvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aD4vap3u; arc=fail smtp.client-ip=40.107.130.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aD4vap3u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtnVAGCMyEPAf8dSdTZ3m9SIHAtCKK1J20JDcK1poYCDYlLbj6GonYPK1NAQy66RAbpk38K1ejHcY/jxCDJjeZfE4nw/29K4o6Ty40VnkSMgHIusFgh5Gbjt9M0nO7w3L51Cpb1VGCeiLskfKdTI9sV3j9QEu3JBo2/1Wf10iqytO7bzKBI0j0J8QK37/v10Qiivth9T99aQUYCeUqTxulunUtRwbW8OI2myb+RKB2H3jid6Q40bou9LmSwcXFBttnNA0XJS0UvhY15KrlAarpvdqrOpkgjX8NsOHHmpJPTjhfj6E8D8XYW83gL3WXXd2kEIDTyB4Y4CuAhy2qFaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxJwoKSLGMvqhFD29ObAKWXCdqdVk3mvFVopVvt1ThM=;
 b=FDhvkInR8aMSttmrdRPlOSuO2HRZba3x3talX7k+kgmbAxu0pGjlgGOujNP5NA9xANqut8LLsCYy85Bzd9hsXANK/7OaKGo2f2PYlh9UhfWC8sM1QgTshH/APaQlOwHk856lsZoqMvH7dM8JtxQlIEBb+IgXvU8a+f4RXKDIFZRnUr6B8pQh+UoBRqCW9MTz4dWBLTm1Ex0v7HkLf+TSbRWgeugqYFoIshGJiOM251ZkpWoKl+TcZikmEwi0VSQ0vEhnLRSoo/iD7FGi8ELqoQwuAxHDCyjcYdDaLJ319yA4F/6sBh8zA+hQbIv7S7MYyqgRKt4KAR4+zYaiKXsgyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxJwoKSLGMvqhFD29ObAKWXCdqdVk3mvFVopVvt1ThM=;
 b=aD4vap3uCLAyDbNkDPiFdkdncLaAgBCIHUvWPPagfK6zLVtbocI9XMzShuaUWQ+4QUX0R7Qea0QZN4v8akarBYrUE38Q8XqecVOp0+780rgeMKRuMw6jOtrCtvn4v9wlB76fKyQHz24v+DYlJ0WXxN1FbXWGbz9iZkbPkPaWSGKQnFi/lGjuWCq5PCK57UhukAdBvP9UqjGV6vtzofgJRlOX/rCDCxJfoosGFApKd6svERW9evGqPoZEEKc0qxN+8HhYghXv32iAm/m3H6mrjt2oVRjJXJX92yq1fB9uMcqV1nC6DjrZt7P9m/UOAPX7TYISAapnADaBFYdKeAFMyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by VI2PR04MB10979.eurprd04.prod.outlook.com (2603:10a6:800:277::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 11:34:23 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 11:34:22 +0000
Date: Thu, 16 Jul 2026 19:32:59 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>, linux-phy@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v6 3/6] phy: fsl-imx8mq-usb: add runtime PM support
Message-ID: <omitpksxmr657vlmjs3ybzhiq6zj4znrsp2tereofqees27z36@m3lhmrbufqay>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
 <20260715-imx8mp-usb-phy-improvement-v6-3-00d95e270e4c@nxp.com>
 <alenBaMOTSPo7DJV@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alenBaMOTSPo7DJV@SMW015318>
X-ClientProxiedBy: FR4P281CA0302.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::8) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|VI2PR04MB10979:EE_
X-MS-Office365-Filtering-Correlation-Id: 773c5768-3876-4a43-4e6e-08dee32e2ed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|19092799006|22082099003|18002099003|3023799007|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	s8ojrW1yYH+wtFH3G1RJ2BipEvcTeYh0QygMeN46mNtKwwpFObZSMbDmd6NEkLLETxC/Eq6JHFr5GFxFggmmDJPz5SI1WdRKa4unvgnVnbBNm2SVUP3CBGxKy+a7Y/Bu0zFqBLBanxVbOY8azzXFshJCK3wh961iIB9u3+Xcg8wf0SBxme6oQ2152lzeg22oUPt496hEXz+pTa9S6q+AdCSpfjYKaODoU/XbLcSc37UxRY7IZhVeDBSaGRwlSuGPl4EcuPjAl/SSOU1UwxkwRbLvZWEhCrstzWkXckPd9wanIxVGEpvkeaQVb2yN6CA9p1t8puepCkuVd0ZL6JVPHiVs0wuUSkF5pGm8zFmjqzJcNu4bfUqpFBMzsBG0hhWM+ovzM4E/4soIb8KYifgTZvpMXCWJxG1KW0um7utHao9+kdyloWmfw/Eskg/KG4KRpf2juh2VlPj78+IK0CJ0H6aA/oyouTFPwF0Cdy/NJhWQzcKe3UHd3gDPA6o20xhzJwXlQg6xbMY7CQjtNZOSv9W1auNj8jtooL376pkpDXM4ktZshSkY1mvNR8NDZKmjKSJTdN6d6UBO8rCyy5csp7AT/BUuR9frXOMerZJGp7b2nrwZjUZ72rnZGS90AMcxH/IkIGuuI0vaHzXgzghvxOFqgz3mOpOI1q/O5HHQuLw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(19092799006)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MwUiQZ9BgmaaM4HUIQBcjwXBc9EptPeh+32lki+CgI0hB3szRNGwmOGAK+2A?=
 =?us-ascii?Q?1GIloW15H+JXBtiXhoxcT2cag6EadthwoeTyrKQ3eFQhiEnx7ZxhejqMlwuA?=
 =?us-ascii?Q?aSys5PvD1Xd+hI1iyFdQJAAO80wW3QgyEefqO7KVJa79G80EQA8Q0/b9rIf6?=
 =?us-ascii?Q?+ApPG4oBsLU1R3I8lCQWjgSZMi9ww+DL58KdiQFqNvSLS2d8UDXc0F9xrvxn?=
 =?us-ascii?Q?r19OTVZ43KFVWuX+6Nkk3hWohV1FoYL+xWngHB0KfONlpfBSHrxHqjR+ABup?=
 =?us-ascii?Q?J51f3cBVbCDRD7AlEU6W8wVLlT4xC0sxeoW1Fda6lmBXTITZZbyD+05mU+K9?=
 =?us-ascii?Q?QLaqZ6cmvj7Z4DmPBF3DPLTuHhZcTJ98w2CG05miOvJbeghi6LLWOGTJMfqq?=
 =?us-ascii?Q?4UFU0GowezoYGPGD5DIX+Imgrb3hLi8eaDwR2QfSUtiU7lqY2E/atuUjqUku?=
 =?us-ascii?Q?EliJkpr7iOKzc6JMf4MINEi9kmeESOND4+dFMrbqC6WnUKT7TLkZZAraphRx?=
 =?us-ascii?Q?sOTQiVuQ0MoUmOF69CIFKIvEC3w/shX/EOI+aezAjUTqJFG7pv5swtxW78t/?=
 =?us-ascii?Q?hcMhlxK+Cs7TVhcNjxeqCqjg1wCIL5mmrzro7/TgXuqiYo0P1Pjl9Adtz8p4?=
 =?us-ascii?Q?4jNdrjr/Q9rDbxLPRrmrIOCxk1d+cTNmWRV0JgC1ZHctETfGhE8zlVdztxPk?=
 =?us-ascii?Q?ec6ssG79d7xpSYOCZSY8qvoECiLA2G+jgcOT6971MPRvdxGvLd8JPGG8iXHs?=
 =?us-ascii?Q?J26m9nh2YiZZRVaWuJoGjHIbrHDKE5jU7cXQP2g+3RF6+JD1+pWsk/YMHdBs?=
 =?us-ascii?Q?NNpS74gt8r84JCfp0laccfIYajNeJtge0a7vhOBZs+1BMTlhpJTySU9nMepT?=
 =?us-ascii?Q?QsgkF8TuYMMJpvZCDSv6Q8xCO+hlo+i59oPX4oYaUa5oldzwh0CdBsgy8etj?=
 =?us-ascii?Q?/SFsv0b7jOkMSb23ZFQQC5raejGfeUAc8zdsNAXSdWBF50QwU3l/NP2fIi2p?=
 =?us-ascii?Q?FzEnRoSibSMbQ/SWGtGl4squv8P09+QZkbItbcweaWWfqmjJDU5hR2UuHLUc?=
 =?us-ascii?Q?Lr/DSoxvMN3V4gSFYTaaTZSK9C4WLSi5CR2MuVS1vJEa6BNvh9+GyN9Iqnkt?=
 =?us-ascii?Q?oAg+ONzvxyvHn0lBWXFw7J2Da3sgyWCwwVTQHphReYjUGz050HCZWVhpz1hu?=
 =?us-ascii?Q?sN1LQ4Kjif+oO0zanopvTuUQz4wx+i9j+kuUcBgdH0WtZu1dBTUmn3JceQFQ?=
 =?us-ascii?Q?Rc/CbZ1o0qCxUVrKWuK58Jo7Ztf0Llf1HadpJAW0fJ03CwllEbFSrMa5iEyg?=
 =?us-ascii?Q?2Aaynlk567MlOSzlwC+ZRT3BPv0QyPv1/Q37sfCOgNSG8olMDCngBFNKsq/D?=
 =?us-ascii?Q?MiM5gsdImK6rF5CAIdMXf2xypfAl4jMH/ErVDAtk5hjNgBZDfepa1vp/CPpI?=
 =?us-ascii?Q?N5NxEq6Oyc2pmaZCp+w8n6100mm0IiXTxUfxIgZNZaLA01sxX1uQ2akMwhB5?=
 =?us-ascii?Q?kHMTyofDOlks4JBC3XFGQqmvXZczeqlxExxzLBCRdzE/jmOspz9+7dVFhYrb?=
 =?us-ascii?Q?tp9KTWbQa0OrRdy5R9wIcIOxB8KxEvkG1CbvpIZZl9n8YV81L2V3JZgDVe5R?=
 =?us-ascii?Q?yVdQQ0P4QZYFX3E5DElTjKAtp59qIWbt8tF7vsNRClpZiI40AmCkHLC3G2ru?=
 =?us-ascii?Q?hJH4MvNHyprFYbj5Sxr9RGqU7eGdNEuLfzhvBd95F26qxKgihpliv3ULdBYO?=
 =?us-ascii?Q?lz2Wj+VwOGKyinXmGdmyT2VxH/3fv0lQ0JLE2jVwLrjJ+bX1BQ1R?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773c5768-3876-4a43-4e6e-08dee32e2ed9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 11:34:22.8435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XILQFTAOskcyR8OZcRRjJ19vY6IKUq5Qu+xYuz5KN8H8qwV6BgK6ZgAP78eKrRS1C7FyRJoXHpz9JVWzDrUKxUOwegCdSOdHOAS41+7LybS3tWMtFdFMYqP2xGqKlgHt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10979

On Wed, Jul 15, 2026 at 10:28:05AM -0500, Frank Li wrote:
> On Wed, Jul 15, 2026 at 07:33:58PM +0800, Xu Yang wrote:
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
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 67 +++++++++++++++++++++---------
> >  1 file changed, 48 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index 3a5788c609e1..bc804d2b5aee 100644
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
> > @@ -708,6 +696,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
> >  	if (IS_ERR(imx_phy->base))
> >  		return PTR_ERR(imx_phy->base);
> >
> > +	pm_runtime_set_active(dev);
> > +	ret = devm_pm_runtime_enable(dev);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to enable runtime PM\n");
> > +
> 
> no place to call pm runtime suspend, so whole driver's life cycle runtime
> pm is on, is it expected?

First, at the end of __driver_probe_device(), it will call pm_request_idle()
for the device. So runtime_suspend() will run.
Second, this platform device is the parent of created phy device, the runtime status
of phy device is managed by phy core, so this platform device will be managed by phy
core indirectly.

Just found it's not suitable to call devm_pm_runtime_enable() here. Because

pm_runtime_disable_action()
  pm_runtime_dont_use_autosuspend()
    update_autosuspend()
      rpm_idle()

then after remove(), runtime suspend func will still be called. Clocks may be
disabled twice. I will use non-devm version pm_runtime_enable() in next version.

Thanks,
Xu Yang
