Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5A942EEBE
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508977; cv=fail; b=k34X0p5VuNlNhMe7TeRwFM3J7PwSAzlIGRiHMQ7VoEjtP56y0i33hpOqgdWV8OxCpBD36EqBwZqTnHDZx5rIrv+o4Hcetj7epOxJVHXt86fGc4GJzmhNCNz3wwsNbs86JnvPHs5JwqUXc9SNoGogPkudyAVMZRfiHBCGtHKSBOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508977; c=relaxed/simple;
	bh=4ZINaQRUV4FHjY68qyJQKMP0arzPw1ZL4EQojtYvhzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H/5RzB6fbjfV+7amgRiWg5M5WZKHSH8uSu3KDeb5d9S4mLF2FLuU63Y6xVsrTYaJa+F2FClhaeUd+1yxu3AMa2t0Hb9v7f2wsPGWcrTpthXXOGasWUl0U6dw/F2v86ZcgZ5F8UTJW1q5gUSENE1uVkoRTKQN1rc+pgFnWUdtKgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=r7xJkt/3; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="r7xJkt/3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HosPHj/hGa/Yo/w0c9Wfx1i1YmJFVjGYMqThUipOr8YGNujaoVJlT1xHkYXQYhLm6FxUOEgXxaxXdIoiUdIKopY7EFNQ4rrhbfvRMMprhrVIc7oHNqzhaX5xwe9jvSQzdWasKH7/2kPiLD9agZrH7AiTI6BXAyMGZB80tWyIUnShkQsl8CRSL14PzzeSbziNVZsQCEjjZZ/PopOkEeXldltuUAuanvUigMMkqgvNBLATZz5x6ilyoal6dc3IL000oMf2SnZgdto/o4SmZG421HYfeY85FnuZ1vQz0PkF581mc7nmzOg0ciErnrlDSVeUXSMg5ffmMX8v/7UjVzaYCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95UkFCIKZHD0qyNwCh0AGNHm2eE1q88YYOkgFwaaugQ=;
 b=rSFXHL2ryj7nOJmkbQnEX3mWdB06wMwwOyzvvBNAb1bUybPiCW4AscogGZ/ptjr09jiijGWtMTXzct9MR0JOhTGV3aCNFML3tfFKcx3NQ6OQIWQIyKOwVBlDt29FWAfvD2KnPCUxUnP7iuXWKSO0zPqx5OdxxWCBimhAPIhJO5GbzRm+846S1n1gIfS/dNw/RCKPRPOzdEeWt5GriCojcLUrqBFrQ1aKvoSebY5QjkZOA9zTYDq9CTTQbwrQDO3GlRsbEd/leOre1wOWnwFmhpyDJmqLtB+On61vq6+kYXUd9gK9S6TIBFRMpu/lPTjnCNRBkyUlOF0Nzdh0jGysDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95UkFCIKZHD0qyNwCh0AGNHm2eE1q88YYOkgFwaaugQ=;
 b=r7xJkt/3bleKBzm40zl5PWbkK6h290xji5rHkovix0ra3711KAoIVi2zFhMgqyWVgtSsSD4qsFCvWec2Vuze7r1ObrfIrhEx8J6b5abP1fiPbsUJ7YzJdmVQu64Hp1CeyRXipfyv+/yJADb9U0Jo/Vb8oSvXl4kjFXzzFwqHX/kId5aC7a7TFITi+JV71L/sNd/2PkSwEm3K/dev24VNnP0bQLYq5iG39Dc3LrcSA6aKgUu/yGdvC5Ys3ox/pGvQgST1dbdBQrzLXfov8zs315PMVuxdtGoiD/lReHcNy/mrjgDxvcehVvuu5uacT+neelDFC7EBK0PcrMhhrqaGug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 14:42:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 14:42:49 +0000
Date: Fri, 31 Jul 2026 09:42:39 -0500
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
Message-ID: <amy0X12qllKAXhXg@SMW015318>
References: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
 <20260731-imx8mp-usb-phy-improvement-v8-3-2ec8d6b3854d@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731-imx8mp-usb-phy-improvement-v8-3-2ec8d6b3854d@nxp.com>
X-ClientProxiedBy: PH1PEPF0001330F.namprd07.prod.outlook.com
 (2603:10b6:518:1::a) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB11741:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ffa54cd-db72-4372-c46f-08deef11fdfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|6133799003|10067099003|56012099006|5023799004|11063799006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	WFlKCIbjQz3nybSr22gIPR/EP9o1WNFJqF1stxdZq5rm/eGm45Jz1jEwHOcsgmCJG0E62QgEBHGge6y0XwEUqvpEi1XdTO7bWwhRCtb9OCMard6zq+yKsJlJAiS2zOgdCTKLmIJXmWUPxuCiHwR9B3DB1FTLXB8vasfOtKN58gWkjyBeovkr4t28Wp+F7rkHjGUG/SykrGgH69Ud0Iw7lbPHMn4F68UfFYFNj10iZFf08xdQNDDMkgz03WKCVb2yqL1J/k9d2DvBlhOY1VE86pk/vCYCmr0UlcrRwl9hdT5R9JUJnwB8IYG3U6GkPnO/nyCdeMy/I3YOIAeY4oS24I+zdpXhkm0oMHriMA61Qz7UgetJ5AsxgvJg99OsIKO77L+6biB5koeMsizUpt99MjTcEpUtTAQlh8lGmaead+5Y2pePrcbgS3ORC3CmvdQbTrVvUHwLgsGr2de2b94TQr5GPtPyPpgYoo+4MscXFK00vM4Pt5l7NfETeSJktHSXeZ8dM8x92eOchEicSUe0m/1ZOQDqwE3WaDGCHjIvxun8P2ElskePzm/Jsl/dLZLX+zAQ0IiYfHDfPngFYwARp/Y0nVFXApSuoKUHYanuzVQ3kck1+lgpy39FCl8nb6pbE9g9VHHG1MgsDagQ7R7fgr465NC3+3zG1mMXCyflVuQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jzqu7OLX/NlHE67v7fZ6GkTP+6ctP2CBGGkqD7Hk4q/SBL6uYr0M0f/J/u+i?=
 =?us-ascii?Q?QvEJAkw3ycuKOl+As5Z0US2rvr+mXQ5yITK0fEbfHBpkUmiO2kGOVjHiFuKV?=
 =?us-ascii?Q?5x7C7KELTJbekdP23QHA67abzv5+dWS7y4LiFH2tsjhqLVh2of9ejL0vITpB?=
 =?us-ascii?Q?7A+9hGTFeMDfIh/hS8pCia0LrUH8M6cd1ey/MYCsGrDnYpgWBTsPZGAfAMur?=
 =?us-ascii?Q?33t0iZFVgUZ2TebOLyuo53JyWbCAELdtKeInl7w1qWSZoJGrUA/5mR9cW2RU?=
 =?us-ascii?Q?4wR7A1BsjTklZaBIJWinxQmcY4cNLIKXNVWAJPPmHk4R1eC6fYUZ3bu+1F+E?=
 =?us-ascii?Q?9SR0MCOrb7Mbo9YHfwEgAwwWl4pHbPvjTqwgzrCd1hrb7wjlItoQCFVeZpEe?=
 =?us-ascii?Q?kYr5tGLLVYqZhqEdnqrPnm2abfF3QsIz4AKka/755GCUpzVHJgfO9UNVmr2a?=
 =?us-ascii?Q?HGkf+l/J6MOs2dUGA47NFJha7vKetH+Egpufhh32k9xP0ohOh37BiQYM3CDP?=
 =?us-ascii?Q?Bik41SqDIhVc/xom5FMe9E80q8RAWTRNUrxYIAV3B9C8ST28BF5/yOYnPAdf?=
 =?us-ascii?Q?4CjHKVE15MJP4/kqjZpDCry/CXoHoJNIEkaR7Ae01oT45yyiyjHQhOeovHYT?=
 =?us-ascii?Q?w4shT+68lBwRXOk3yhw1tjukfCXGLtwyY3wrMtEs9zHi5qb6XojvyfEsmLMC?=
 =?us-ascii?Q?xM5Mg/nwBB5+bFqx+MreDzbdhf/TMNVnNlqWLxLr592gkUe6bnWBej412ojy?=
 =?us-ascii?Q?K7Gf57xN01JfIsoBLFd4Zpn1oNyDiZki+4flgz0O9w6Fo5SgOdlr1GEqqfjy?=
 =?us-ascii?Q?I3RrUpBrujqaeNGiCe8a4ZJbeVEMfjL7AUHRG/jMNWZoFfkZErqWXYaXpfGO?=
 =?us-ascii?Q?O7fsYR13w4whooOeztPnPkJjtUJF1QHck7AFT84HMW6tutV60xL/+rJuoO1N?=
 =?us-ascii?Q?+F6DiQAHdzxZkHlKlHeQgojPsvDDlHngrOGFHW4aFpUo2WPkWKT22q22NDJA?=
 =?us-ascii?Q?f7rZ052SSP9Ujqvhlc8AGY7oju4kwYtx7K3HYkQWCo1au2rXjQ9aK2DosmT4?=
 =?us-ascii?Q?lPGKauL5HF+6XQKfqcjQCRn9W+eN2ha5vJ0WtRYL9S80v4Z2aBvNnBuydycr?=
 =?us-ascii?Q?wG0rF/5JgKBhbhW8tqDKcccLGEPkTD2ngJ5vIrhGBC+0ZfgAfhy5q4uHnbdx?=
 =?us-ascii?Q?UidPl84c/CVi+braqb10P69TzAVNnelqA0SL1ivmY47ohEXhpSgGN6kNWyi4?=
 =?us-ascii?Q?egC081z8hnU73fCAi9DgVMcVJceakEiOeUx/yrYow3CiX44hpwiY9TPk/IEz?=
 =?us-ascii?Q?YYE9Q4YXkreQr4hXA6mLabDLhpHucVLuitZZ07WMi8MiMK9bKHnNyG4NO1CI?=
 =?us-ascii?Q?qmSrwQ3EhRP+Md4ypwt8D38ex8jCYm7aomOIiOOxSG3dH/a55kbcUUPeRysz?=
 =?us-ascii?Q?S1CW7zdGGhqfDGCATRPP5ops5lULDSITrryT9ZoUPf0iEAzRvw1LyH/DE6+1?=
 =?us-ascii?Q?q/ve7pwo3fqHhooVq5tlACXOqYE1a5QJ+Cj6IOE6hIdvcGwRvSb+Prv+kgwE?=
 =?us-ascii?Q?BHzxted+oD2mbw8bRup1OHfV4ls5UCKeNVExx3yQbGJ8S16I38HDJYdpOZ6H?=
 =?us-ascii?Q?jUBgac3i46KXCS73+jnQnClejRxbT9EDRv9iWY7zvNmhNJbXmmtyUWvC/z64?=
 =?us-ascii?Q?nqIYnGiXkrq6XQQ1+igS4/vHKPG4xQW4QoIhjr8PJUE+U75AdWVsyfRPS1t4?=
 =?us-ascii?Q?hjcdDZHX0imgm+rYTRZNAz84+DPkDao19EBCcYHuIeEY4oe/Y/+P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffa54cd-db72-4372-c46f-08deef11fdfb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 14:42:49.0866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEevUt3k+/TzBAz35hrgTTIY2jYVlKnaIs//1IaOgV8k+4y75b7a2p6pde9TZ4HPsJCewGINpZG0nVxiGHfVCip+CAmQWR+8KLELacdL1HA7anj8Vtq08s2nwslJCMG8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11741

On Fri, Jul 31, 2026 at 04:11:21PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> Add runtime PM support to ensure the PHY clocks are properly gated
> when the PHY is not in use, reducing power consumption.
>
> Clock management is moved from power_on()/power_off() callbacks into
> the runtime_resume()/runtime_suspend() callbacks respectively. The PHY
> subsystem core already holds a runtime PM reference around init() and
> power_on/off() calls, so no explicit clock handling is needed there.
>
> Use devm_clk_get_enabled() and devm_clk_get_optional_enabled() in
> probe() to keep clocks enabled initially. This ensures the PHY remains
> functional when CONFIG_PM is disabled, where runtime suspend/resume
> callbacks are never invoked.
>
> In tca_blk_typec_switch_set(), replace the manual clk_prepare_enable()
> / clk_disable_unprepare() pair with PM_RUNTIME_ACQUIRE_IF_ENABLED() to
> guard register access against a concurrently suspended PHY.
>
> Move devm_regulator_get() before pm_runtime_enable() to avoid having
> to clean up runtime PM state on regulator acquisition failure.
>
> In remove(), call pm_runtime_get_sync() before pm_runtime_disable() to
> ensure the PHY is resumed and clocks are enabled before the devres
> teardown disables them.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v8:
>  - fix if condition in imx8mq_usb_phy_remove()
> Changes in v7:
>  - replase PM_RUNTIME_ACQUIRE()  with PM_RUNTIME_ACQUIRE_IF_ENABLED()
>  - use non-devm PM runtime callback because it's hard to avoid double clock
>    disable issue when probe fails or remove the driver
>  - improve commit message
> Changes in v6:
>  - use devm_pm_runtime_enable() to disable runtime PM when probe fails
>  - simply pm_runtime_get_sync/disable/put_noidle() to pm_runtime_resume()
> Changes in v5:
>  - use non-devm PM runtime callback to correctly enable/disable clocks
>    when unbind the device
> Changes in v4:
>  - replace guard() with PM_RUNTIME_ACQUIRE()
> Changes in v3:
>  - new patch
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 103 +++++++++++++++++++++--------
>  1 file changed, 74 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index 3a5788c609e1..42de2cff4d5f 100644
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
> +	PM_RUNTIME_ACQUIRE_IF_ENABLED(&imx_phy->phy->dev, pm);
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
> @@ -686,6 +673,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct imx8mq_usb_phy *imx_phy;
>  	const struct phy_ops *phy_ops;
> +	int ret;
>
>  	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
>  	if (!imx_phy)
> @@ -693,13 +681,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
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
> @@ -708,44 +696,101 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
>
> +	imx_phy->vbus = devm_regulator_get(dev, "vbus");
> +	if (IS_ERR(imx_phy->vbus))
> +		return dev_err_probe(dev, PTR_ERR(imx_phy->vbus), "failed to get vbus\n");
> +
>  	phy_ops = of_device_get_match_data(dev);
>  	if (!phy_ops)
>  		return -EINVAL;
>
> -	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
> -	if (IS_ERR(imx_phy->phy))
> -		return PTR_ERR(imx_phy->phy);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);

does devm_pm_runtime_set_active_enabled() work?

Frank
>
> -	imx_phy->vbus = devm_regulator_get(dev, "vbus");
> -	if (IS_ERR(imx_phy->vbus))
> -		return dev_err_probe(dev, PTR_ERR(imx_phy->vbus), "failed to get vbus\n");
> +	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
> +	if (IS_ERR(imx_phy->phy)) {
> +		ret = dev_err_probe(dev, PTR_ERR(imx_phy->phy),
> +				    "failed to create PHY\n");
> +		goto disable_rpm;
> +	}
>
>  	phy_set_drvdata(imx_phy->phy, imx_phy);
>
>  	imx_phy->tca = imx95_usb_phy_get_tca(pdev, imx_phy);
> -	if (IS_ERR(imx_phy->tca))
> -		return dev_err_probe(dev, PTR_ERR(imx_phy->tca),
> -					"failed to get tca\n");
> +	if (IS_ERR(imx_phy->tca)) {
> +		ret = dev_err_probe(dev, PTR_ERR(imx_phy->tca),
> +				    "failed to get tca\n");
> +		goto disable_rpm;
> +	}
>
>  	imx8m_get_phy_tuning_data(imx_phy);
>  	device_set_wakeup_capable(dev, true);
>
>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(phy_provider)) {
> +		ret = dev_err_probe(dev, PTR_ERR(phy_provider),
> +				    "failed to register phy provider\n");
> +		goto disable_rpm;
> +	}
>
> -	return PTR_ERR_OR_ZERO(phy_provider);
> +	return 0;
> +
> +disable_rpm:
> +	pm_runtime_disable(dev);
> +	return ret;
>  }
>
>  static void imx8mq_usb_phy_remove(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(dev);
> +	if (ret < 0)
> +		dev_warn(dev, "failed to resume on remove: %d\n", ret);
> +
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
