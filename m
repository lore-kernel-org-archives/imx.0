Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61C631C567
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 05:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772430287; cv=fail; b=AvU6V3N1M/WMjVjYIu10VqCtP//4oKQFqolHrfKF03BiTiAt0dNqpQDxKrDR1B3ez8t3CtKLRETaZn5aSveHi7voKpwQCM5DZdcZbYYTPCuEdPz9j/qRdXqaoE9Kf98VZGzf7DmqA+6qvqH1usONia08zThSehkSkCKPuBlGnEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772430287; c=relaxed/simple;
	bh=2tvjMHUy9jO4/0kBoTM0AJCcXGhVaDTsldfxoSKoQkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vALQL6LQrHsPSSp9TKL1daYd7qY5VbO1JpOGglZmUbxtxKpMdx+KeNUiDjeq96catzL2w93p3fIDYgqMSJV6Qz5WVRjIQPKwD7G4b62Zj+sa4gr7pYaaWZ40nITfj10d0CCQpBrgGmB4sCW6ihnJf0NPdsasOyp/Pup9cg28QEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Rztje4CQ; arc=fail smtp.client-ip=52.101.72.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Rztje4CQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2LfivULJ6OY/bK0GG2YSUp/ecG/g5UFKYb5Rx1vnKg6lMPV8BuD63crllXwTrdINv9N+14S1Zq9NZ5E8amkbLKIeg9tMCVIc9Fl3SDgOSISEjev6ObUv4/8bYDUc40I0yd5LF0Qb5v023HHiW11Ql5tW5s6M04o3WjQNEOmmRCsQD40blh/6nvAP9/Pu+JfzzDRrlGDKFSG6H/ZpmVE5rsI5d9A25rNatzev1lopsRuUgNmWDEF/0+fxZTxy1mmaA3WT6sb6vDiQBtCZdTi2g+JuS9+7N3AzAWDYQBDKO1Ll/CJqPEMaNfEq0cbWQDX2UbARN2exd4XYOyLffVx9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVpjHLIbd/g9Gux06CkJ9PKzVNb89ZLvLCTBOU1009I=;
 b=g6+iyRo27TF26hh1vaUdlw0ABaM/8KA7qehHmT7nljMUpaAay0C0WyTSQO5eFNjvMD4tiHt+Nwh9C1f3hMNiZvLsxlPlYOm0SfkMFmaXngknyaXUnJmVdy0YkY+eiRFrxLFueZbfzBG/iEu6V6VV7UMgWzpccO40jBPAjFkLgggV7WwU8ur9MG2KUtDbNspn4xIQ25CC6cASTdJ7lRNd+1zZKzhuJVWp2kyccyjxfeopnZCTjNfpqp6diHMyFGGnIUHfzY/Ei370C7j5IYpRxoGxQo6GEnfWiYV7Y/EYS1Duwa4x/xc1xCY1IDlNm7lfaYKUnUqGhwGhC/bOaxWeQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVpjHLIbd/g9Gux06CkJ9PKzVNb89ZLvLCTBOU1009I=;
 b=Rztje4CQcsCC3qvWMQqxqck1LVP7rC76WoQ+/6cBFCyD/nuJIHS5GHRQmo8zVJB292/XKjXzJ5HZr5XxUNhHH4w9VHbHKp7MKToe2BHG0dOxG9nD9gj76XX1WCyLQDHOTDR/7K8ium6x48xkxpi5u3SekBg7P6Zz8ANu6aabmH5sCCqDwqv43hLsxLgeqmtYXqg4lVXQPwgi+Vt50NioH4iVtQH3BZDOOMq0Vcx9F/klT2T7tF5q/KW5FHq3UX5y40+xqWeZS0NUBw/cXns7/H43bdKT8t9y1sgCMx2NxDpbTTLf/NCcZ4XyH7RbLErMQMLuBfM1tSO+MJ31eiJjgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS8PR04MB8197.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 05:44:42 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 05:44:42 +0000
Date: Mon, 2 Mar 2026 13:37:02 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, Frank.Li@nxp.com
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: add control register regmap
Message-ID: <h4jphyodzz3j73w43jqtd6skakx2txd75sjr2wzu3uifhzv2si@uxwv5id4i666>
References: <20260126060318.815275-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126060318.815275-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS8PR04MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c4642f-c986-4359-3c60-08de781ecd0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	HPPmgz1gj1lA/tBxYbYXWNC5ZEU6Lr8igBR78wGRiAWEgX0Ztx/zfWv5qE+J2mo4lb0nk4yFclvWVe9Rh2l+6D7zLYtEDD41rKsNHd50R7Gd3sE5rBsNiuPlIhe+gZt/26TNcN7KTSFe5DflpqImeI95S4CuQCT0bLAMA/PSNz2hrJH+KaIQvO3p19ve/MiKaY1Q3vDcCRDoriYe/mW+MMhWndbzxO2LHHijC3WMp95VPRF5GSibBtVncnf+Vco+dZNLm9yZ+3w+Jp6rVzRsYKluFYv8yNezLCPHiN9f3yxQ9my2fshvdku8WiOSGX61Fr3ZCv0ziNFMdfLwXYIcVqNTPaWdbwNbEctje+zttk02ZCGgMLC/lQJtv2NZhWgYApauPcKMJS5Vkhu7lKJWXhB473zyuDQIiQFSIMwi6oAiL4/rI97pIf833uqd0/60ZfF9C0l1xzjZX26fr33Mj3raRZTAOPkMZf8raWdgXewfseHnBkbBLvztM0c8638mVmwZhPBhfqp3CLBjaBMl5OGJul8RFuyigtsjVHUuhm+EF883SSS+p23/YyCA15vCcykhiNrTSUMkzVRzHQnI5XgCHqMYKWoHCvi41ApBsvmgWRwgMymJhmL5dd3BpFRp4vfXuyNasYFNkxSlQ0AAi2WiS6O4GpPZmpZ7P7xA8SK4wKDvJf5GMCWkvsAUtvrnozAfcHiOJW4YTAyce+IfJkGvQ5Aw3KL61CivWTA30xK7A6dMF7Aht7DC7bkYLW5cS2FQwMrph6drjUMQMiuJym7TeuILXnAq4Uj+dTJkt/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CDwC3AqDnIX3J7YoVi6jJkb89VjYOt6GFxawF2ibboDYphoxRowTKFpZZa2c?=
 =?us-ascii?Q?hSBLlGBQpR+WxFEWQ0xauC6KDX4y7nEByvw/kO9EluT7Z7VKxpH7JDwgxBPr?=
 =?us-ascii?Q?WpVvKWotfoJF4ZHjIypIkdByWrfacGWlEnVpFwqwXIH+civQzniWgWtZaYtU?=
 =?us-ascii?Q?26yzweFjT+lpJs6TIEgj1VdrQD4od9IPS7vM+mCyZCoRVb0llS1UnDoSus+o?=
 =?us-ascii?Q?CyKEPfmltB/M1rFlRbg63UDZ3oWq7py15UondCHpj1da99Hq4fIxTr+mDYG5?=
 =?us-ascii?Q?1y8ZcOVMJSEUT1sr6wNmHEWEcRueArJxn5SB2DLEMKTSX5bEsUt3py8FSANT?=
 =?us-ascii?Q?lEtrvABgz0dZ9KrA9/4pPsPQXWif0tCpPKmYriYqB3hMOFz1I5PT7oQRjDnl?=
 =?us-ascii?Q?0fuM8nzQH0NxkHyPdKNPDIBm1eY129vR0fBHYlxcRS9j5k+28o2gMX5Mfa3p?=
 =?us-ascii?Q?ejWr3FbI7+buCtVzlrGV9tpiRmm6o3hNTDRxMPSxaozJTS7hFFo/0VgnHKRY?=
 =?us-ascii?Q?K3aiZ+MZX/7C3GPZ6Pjcf/wt0s72ZkEGwkBqV9YhxJ0dSmS7SODPveP/TdRa?=
 =?us-ascii?Q?xU/vV0/eF5zfcrX8JkyGVmfpZ/fZaxn2IXRe5yYAxWo4CjMngQEGKZ1aey0U?=
 =?us-ascii?Q?6M9/Iqq1ox99LN/JFWuqbmLfUg1I0ofUutR4+ihnjCCGKBLpBv3YsD/xPMZ0?=
 =?us-ascii?Q?1VAKFIi1YkF5xbvdYbCEZHxNHOlKr31HD6RENqqQzGTWcPc03/kUKp3U6xus?=
 =?us-ascii?Q?fHBItQXIzQBgxwPI4elIbZplRGygdwwbXPgNF+YEcZtuPqM6I0dqXgcoQ4aE?=
 =?us-ascii?Q?+XpFjSEUY9vOTiW/TWIQZgHTfIt5ecV9EmIQcwU/lMLPjyYAazZceswYYOqh?=
 =?us-ascii?Q?hZf+mN8n6SBIkz/Ks5OzUYwY4St6LsxdaK170CHTKpqXFVKiGjpxoLpvHwjP?=
 =?us-ascii?Q?jczcdMFk1TRvHPHpAV9oOw7iNDNsIeTiRcY0qiiV+BeiMbND7j8KcMlLV6Rd?=
 =?us-ascii?Q?Ddt/PoaHrKqK3gjfUEhJHpvAByOhXdqQDq6qu9OmHLQaEsmE/i137toEvSSp?=
 =?us-ascii?Q?LQCeTmjvS+QLlKYKuMdokfHk+ca4fM+zwJVKrrxsnP0RgUUXRvP0EDkxeYPl?=
 =?us-ascii?Q?FyIvQR4iMvaTNXte49MnWsHFGdDpCKYTLFJM2RszmSVbvl6ovGqyiN6oozEW?=
 =?us-ascii?Q?BfaLKW90NFPNQaaBLHKSKIYtQgFvhTKmDFzMvQ+bhON3mnkGDDyCv7uuucpa?=
 =?us-ascii?Q?cDCwGcf+U+qhuJMKrZ+ZfpF1NVs1BZ/KLpdq5NMqSLwI/eJbGW6efAMm0kra?=
 =?us-ascii?Q?L4Fz1aAZCiysAwq3HYgbxiXm8AguP4M9FSUrIF7ervGaJ3hGtbKWRuwIiXeX?=
 =?us-ascii?Q?p1JpblwE4BQ59STDdHTCIVaOSXbGdvZLO9lLm49+btAiaUr3/pQukB8vdrV2?=
 =?us-ascii?Q?/b80J8p5ID/3tuJkORQVtZY85gCCQXS/E7DnTCM88uikFfsI1IZ6Km64OH8f?=
 =?us-ascii?Q?FAecV8gyqveFzIEJ9vyJHXWGAa3kIHWJ4P/D2yQpOR5G7SfBaOrZoGgkeNO9?=
 =?us-ascii?Q?eZn4794Kp8JQUyqCDeBjnIi504SUNaDwektH2SBkkdYkcoF8i3XsIFBr+VsQ?=
 =?us-ascii?Q?ZEN5uhyBlR5NV781KB/aUioWOWzX4km/41p7IzeTHjxRPMaqunx6jGQPyaT2?=
 =?us-ascii?Q?x+FqPkBA16IFf3aV5S5Jcm2rNKoVjb0r/D8EHc+da2wvlel1nFi8v6bw8UZE?=
 =?us-ascii?Q?1bgea/MHHw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c4642f-c986-4359-3c60-08de781ecd0b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 05:44:41.9298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RpOqo6598jAlTzTNJZc7DtT/CTn6k3BkTZsvCEAbj1r+xLfStPRFoikVNglHRcd7UqoQrJotoo3Dl+t51lMyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8197

On Mon, Jan 26, 2026 at 02:03:18PM +0800, Xu Yang wrote:
> The CR port is a simple 16-bit data/address parallel port that is
> provided for on-chip access to the control registers inside the
> USB 3.0 femtoPHY. Add control register regmap and export these
> registers by debugfs to help PHY's diagnostic.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> index b05d80e849a1..958d114b0c83 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0+
> -/* Copyright (c) 2017 NXP. */
> +/* Copyright 2017-2026 NXP. */
>  
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/usb/typec_mux.h>
>  
> @@ -55,6 +56,8 @@
>  #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
>  #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
>  
> +#define PHY_CRCTL			0x30
> +
>  #define PHY_TUNE_DEFAULT		0xffffffff
>  
>  #define TCA_CLK_RST			0x00
> @@ -118,6 +121,7 @@ struct imx8mq_usb_phy {
>  	void __iomem *base;
>  	struct regulator *vbus;
>  	struct tca_blk *tca;
> +	struct regmap *cr_regmap;
>  	u32 pcs_tx_swing_full;
>  	u32 pcs_tx_deemph_3p5db;
>  	u32 tx_vref_tune;
> @@ -685,6 +689,14 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
>  
> +static const struct regmap_config imx_cr_regmap_config = {
> +	.name = "cr",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0x7,
> +};
> +
>  static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  {
>  	struct phy_provider *phy_provider;
> @@ -713,6 +725,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
>  
> +	imx_phy->cr_regmap = devm_regmap_init_mmio(dev, imx_phy->base + PHY_CRCTL,
> +						   &imx_cr_regmap_config);
> +	if (IS_ERR(imx_phy->cr_regmap))
> +		return PTR_ERR(imx_phy->cr_regmap);
> +
>  	phy_ops = of_device_get_match_data(dev);
>  	if (!phy_ops)
>  		return -EINVAL;

Ping.

