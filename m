Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D123A9DA2
	for <imx@lists.linux.dev>; Thu,  4 Jun 2026 02:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780540551; cv=fail; b=gqwYUwv53tEaLM3u3lwN7dbS6CPygxS76ot9mQf0jM88lzkbKMs77WWCY79VtyYGb0xMXH/l+jdnL4npM/+rKXmmajJfhe7WrHpL9P4Zt+ph7K4Z3MfucZarC07Wlc443hbVbU+1T+lhqWEPlMGBlaVy1twaCdxSZIQM+OHAuQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780540551; c=relaxed/simple;
	bh=7cNCNI7Y9JK+l01I5x88fOIheO+BeqGjf/bS7xAnJUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l4WUjA0xlt/8ULTNyxZ1FaibRcYrxOSsNsfOzUWe7O2m4UbI/wuM2T2cslC30i0JrnGFTUblgQ5vB8A5r/1dsA6hSS/Xwulw8LujFKiUyiUEP7ob+CLRDpnDX88JBXM7pyioddlovD+junpWXl2UHirUOYmYh9CKXSUDbY2/zSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MbWW4whf; arc=fail smtp.client-ip=52.101.65.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MbWW4whf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHrH0WRiqEQ/CnZWSbCDrVqpMVfFaNJ4fhgjJnWNiBD7NaH7EY0qiKmxEbP3qhkXEru5n5Y6My9Nez7wnEEV1GkQgmB7aWoXaMpyTrvTz3hJV/38PZeZ0qTrejXYTdmEfUCnpP8pjSW92T4ZP5a4Ts2DluR3wMIxlUjlOQYJ5LMoMP57djRq8g4tK9m0L0RmxnxLtXnf1D/m5teSlWLU6nnrzzUteZTr2BTrhzfVLi07D1E+CeYimEUIghswd+65lSDmhvNT3JUkWDZJ6wQ+w5Sed2KIUESZatHFfVYH+aw5v9kRArRPjN9GXniSZXh90Ctv7+2Xa/CEb8q4Of1H6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fU0WOf7TMZvUc7k2CwrRJM6UP9kbQqrj65vFzssvQ08=;
 b=ntEk/Vai6TBmFjtfkzFFbsYsRwcDJQrBdKVWfOEoiyZ30KMvEzNc2ZfbkZO2eQdp9fNn4HPk8hidR3CNERsz6/4Fm9yBdn1wjBm2rLZOhed7Eu9PSsOMsQlLixt4G+OMEYck4UKfxrCzQZGOvYCsQOBAt1kwDQwQsnOPOtF/W5TXTWbSOvHfGB13cdmNNJ1Edz0rQMRMdy5rnctX8+Hg/Vvn1UfmAzPjon+C54xOMsUXoUzM1+NFStJkx4Hx+F4vVyAX+JLbYOrcek740EYVwquMgZpYaRw75a53P9y6qoNYcrJVVkw530UFTeHKF4huZDwqdrGFHYka+a0cMssX/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fU0WOf7TMZvUc7k2CwrRJM6UP9kbQqrj65vFzssvQ08=;
 b=MbWW4whfLw3AjgKn+lDF2nGMAk3G+usz842MalrsRz+4+q278n+1wGp9Mh93GtOmBnkNPsnfl0H+0dmT4HhomjR0Bpq2y8MXA2ykBETUjugnb/CzEaZ0vNP1GOQiq62Tge6Eg8dWyLp+eX+YljFP1uTmhAcWNBwg4QTQXWmoYSs2QwHlwUR9oHpS7K6E8tpYO9cAHhd5U8e4ZlfJ8X/sKViRFZ7F4OYywBtxHJhU1jyyEnh6ubRjc2Rg+OkT3DNQZaE96x3ZN7vpHwR5xfxWMVZ8akT1f8OiE0Thn5PNT6yE3eLfNlez6XKjZsYiOU3AgeCGAxpy9BoAf9K/wM7AVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB8797.eurprd04.prod.outlook.com (2603:10a6:102:20c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 4 Jun
 2026 02:35:39 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 02:35:39 +0000
Date: Thu, 4 Jun 2026 10:34:38 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Bough Chen <haibo.chen@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>, linux-phy@lists.infradead.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Subject: Re: [PATCH v3 4/5] phy: fsl-imx8mq-usb: add control register regmap
Message-ID: <jcsry7quuw6ghiojy36llky7vrlopxjzugpayel3uuyhpm5hxi@ouwthba5wtyu>
References: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
 <20260603-imx8mp-usb-phy-improvement-v3-4-7afb8f89abc6@nxp.com>
 <20260603072107.xhrzxrgbrb7q6fhe@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603072107.xhrzxrgbrb7q6fhe@nxp.com>
X-ClientProxiedBy: FR4P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::11) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB8797:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c94e99-f46e-423f-3673-08dec1e1f75e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|3023799007|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zhRV/9y0b0iwJ1ANgtOJSY1XbJCOfOCo6K0r6/bPmfCQbEWZ/f639K33pjpYE/L0NWgxM3DDraP2YgnBFFN/batA5nyvghcUoYMW1GBYgESTwOVeLiDwl0vTosj12CngfQXwDfbAY0eTB7EHnQrDKbr0NHgApHyjCAShASmugWwjUdnGyoWXabaMaVDg7/H9B+MWOCQuy6z7MMz11xCgaT3LA81qsyNBePR/Wrt/1E+kQgEdY1Pruaulc/GFW42K4jqZIwAbrYYbknQBdJ13B/EdGGXqaKtl5gXu+GHsKU2En/YOJXvfKrB5OPtdKwV3vwiRv4/n2m87himnXn5cOkGMAbJLldLIPBtJPQ7D9kMPNuDmDOfnfOwWOAvsk8flRV0lrrqf67ZGRvsmre8MgNogBv3kdUxoeJfDITCGcIx11c1IZ5faPswD1JNb6XKAusVOUztk9iUsXJb5oin9i/4SPUXEjGzQaIDRF9FTcI/NMzqVQLktfwJULWV//PKLBL1xesda1bjpsXbsVvok3yDxJSZsA/zeb2aZa3RYxlP2BuW5PxsNPY1T36Oxs+hDG65Yj61bx41Vw/nb3vEZfhKHXwS1yi6q0aOgvUGjpIXjSnGmF/YQSMBhge+DJuKiUAylD/mosJV0Lw3PyLzR84Cb/aHv3xZkRho2RddkYqlP/nxtLkOzWa+CAKCbOh0l
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(3023799007)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W1KtdG5VWSzDxrwtr8PhTEAs5UKIgdCcqpyXdvjnJ/4sPsHtb+G1b3/oNO6h?=
 =?us-ascii?Q?62mtIqw29UPcMzRHnkiNJ05i31qSgR/2Crz7IApFHksEUAGacP2HO/1JnKKU?=
 =?us-ascii?Q?IKevwDeiPxqSY0yiLZXukDXh7IUa52jFdxIoU3fnMqgL08tvWR+mOoF0eWvk?=
 =?us-ascii?Q?AqHs0nJE51E/uKwHeybIZDpry3A/fRV9e41Uq9bpBsUm1WVpjVuS8187ThtX?=
 =?us-ascii?Q?nF+ZlvFuXKkre47xFg/IAlmuz0voCNeQvMnKLcbTGnbE4Ee4BRkguXLT8McG?=
 =?us-ascii?Q?SEEpVlgJqY3mnLIDWuc/bSXgvn2FV+hshS7BSXyIBGB5mR5jLs0J3aSUh9uZ?=
 =?us-ascii?Q?vU4zDPjzCDhi20H9jSCKDxXrMi4oJrzEKXZz04OA0+xzTzocaNtpSCwI8cbY?=
 =?us-ascii?Q?w5DE9W811b+NZLXLJ7zSIIOGukLUM+gwwFU6tbflQYlIWqUR+h4kPIdqtb6Y?=
 =?us-ascii?Q?3zGA7IucQE09sssOAQgiKlyySxcFHFujCNkYrpJpNN9571G099zgvlcpdwly?=
 =?us-ascii?Q?7u9KXQop9jHruwCZShTQa7A5yjZcUx85bf9DVpJ1WNJuOQh5dIFzT6xAYTDy?=
 =?us-ascii?Q?If9oBycyf7/j+rV3fhL0ZgSBfsB2pALP9jAbFiBNqLCAmRaSLazF6z1XHQKa?=
 =?us-ascii?Q?hrn4SCqeNv0EnIxInNrtAUEDS8KxG6mzkwe2dvCEaVkQriIMcBUFN/nsPNAt?=
 =?us-ascii?Q?zdU6pUNb1ulLJXG085k+Cppvf/6xQfg743GmntAZ0t7nC55FD0I765LvbkiR?=
 =?us-ascii?Q?FcdzPSwoKNOy/1rWPW8j2pGM3Fblc0j2LLmEz26aoCPJ7bG2AVCDg8KekMdP?=
 =?us-ascii?Q?cx3FIw+QDIIEatOzOGCInOeKFbEfsfzlNR269bDN5ndZ3shnbKPnUgv5rt21?=
 =?us-ascii?Q?6plPVpz5vsjOwQpRzPBE4KZLR1IZxEAx3HQFQXIhrE11Q4OKnMqS6zbcsQzl?=
 =?us-ascii?Q?jFJUj+KF+s8G3H1Vl6Cf7H4bQUVSflzaXZyb5VvXJEryHmvlR46se+Z8NuDv?=
 =?us-ascii?Q?A126VKWuaIc1Zugmx2V0/GlnEPcItvDBaV5AUDuv3SyT5VzOsGsFACGfYthp?=
 =?us-ascii?Q?jffwbdS7ld67q5T2WqkVLY4ZyhyWQFWdIQ4QnlGDZGrUHmUKQowYYHl6SWiv?=
 =?us-ascii?Q?uVrdR4G4HfbkORGeFPD15Dngp3uzLP3F3oSYgj5lGn7wYqq04PvXLB0s2VTl?=
 =?us-ascii?Q?MSNEVUvT6M5CjDPJle0CgIlu8fn8EZTrOFwt8bflAX3nBEVhXHRHdVZJUIUU?=
 =?us-ascii?Q?bmmZZs8fWLPGa8KKqDCDddZZshyVVb5riTsZ8uDwj/nxop/h18rzTFoWrH9g?=
 =?us-ascii?Q?uJ2rF8e+zI+k/5r/AX8FYvqKXOuVdm6e6sq5QvEpgmWvT53Idqaz7/KCU1Wl?=
 =?us-ascii?Q?fcroBF8Vu6XqCexpTHq80Lq33rpqFcpGuKUCYNUxrg15B9peupNXmmCZpqUf?=
 =?us-ascii?Q?WdVWmN1DVpUQDq16oBJncKrxdQoF0J9W8h716GybQFwK5clk+5YEbN5twA6V?=
 =?us-ascii?Q?LGGdCO6sPmyB9YucNOscMMAZ10D0R/5dBqiHag+F5F+adZu6egbnWfmIHhmK?=
 =?us-ascii?Q?MTrZ+Lu8OxArSElgUu6AygPcm9KK1VoMi4OK4nGuJKG+y/yRU/CuBiXtSbwq?=
 =?us-ascii?Q?fecs5uDpcH+j729zgWdhVI/EN37c+AyvDrnAXkzbjK3uHAuh09j9HF1lSRnf?=
 =?us-ascii?Q?oyBYnbDsqe9KKp37qHZTwQBw2Z5cSiDT1HbCcc+qtaG+RBEoTA81oZu8RZjd?=
 =?us-ascii?Q?+vwSn2pqQqN6KyZx5ZLOPoCqbn8GAOBsAB53eRat+KnzLFYoKn1L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c94e99-f46e-423f-3673-08dec1e1f75e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:35:39.6103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLIbktcMUd6iG8dDgIhpADDrRL/swOhKDxsscbgmSSt90TRyIdpxuX+U9555vnVE+Ah8zC8vCedQVCcmhyUkuRCsp7n7SldDlh2Ryo1Z3Ba4MtkPwR/VZCXuHqXTOIta
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8797

On Wed, Jun 03, 2026 at 03:21:07PM +0800, Bough Chen wrote:
> On Wed, Jun 03, 2026 at 01:37:17PM +0800, Xu Yang wrote:
> > From: Xu Yang <xu.yang_2@nxp.com>
> > 
> > The CR port is a simple 16-bit data/address parallel port that is
> > provided for on-chip access to the control registers inside the
> > USB 3.0 femtoPHY. Add control register regmap and export these
> > registers by debugfs to help PHY's diagnostic.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v3:
> >  - drop Frank's tag because it includes other changes
> >  - new patch
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++++++++++++++++++++-
> >  1 file changed, 26 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index b0092c34416e..cda88ea1f12d 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -1,5 +1,5 @@
> >  // SPDX-License-Identifier: GPL-2.0+
> > -/* Copyright (c) 2017 NXP. */
> > +/* Copyright 2017-2026 NXP. */
> 
> Should be : Copyright 2017, 2026 NXP.

The Copyright hasn't been updated in a long time. So I want to extend the
period here.

> 
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
> > @@ -665,6 +669,14 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
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
> 
> Your commit message says: The CR port is a simple 16-bit data/address parallel port
> But here you use 32 bit mmio, which is a bit confuse to reader. 
> Maybe you can add the following comment before the regmap config:
> 
> /*
>  * CR Port MMIO Register Map
>  * 
>  * The CR (Control Register) port uses a 16-bit data/address protocol,
>  * but is accessed through 32-bit MMIO registers:
>  * 
>  * Offset 0x0: CR Control Register
>  *   [31:16] - Control/Status flags
>  *   [15:0]  - 16-bit CR Address
>  * 
>  * Offset 0x4: CR Data Register
>  *   [31:16] - Reserved/Status
>  *   [15:0]  - 16-bit CR Data
>  */
> 
> Or change your commit log like this:
> 
> The CR port is a 16-bit data/address parallel port protocol that is
> accessed through 32-bit MMIO registers for on-chip access to the
> control registers inside the USB 3.0 femtoPHY. Add control register
> regmap and export these registers by debugfs to help PHY's diagnostic.

OK. Thanks for the suggestion.

Thanks,
Xu Yang
