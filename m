Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013001.outbound.protection.outlook.com [52.101.83.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351C3367B82
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 05:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465567; cv=fail; b=sxxb8+2W/M1z/rWQGrVi+VWWzSN0YkstsIaqIPm9X1xUCem8kwamHSxNnmHlODI60xK+0WT4J1cZQJmrjZLNvlnYCdfoU8IzJyvrD0jFOJHy6qVQ6AOicOu6PopBFU6PnF1K5kQ0LMmrLZz407yO3Jh3LcUyhuY+Gs2uXh40DFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465567; c=relaxed/simple;
	bh=xFGXWx6CprO0BEr68wCoaYL06yCxnee5hR7NwmSb1KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GoPAWabgeQTiQYOLBqxULvW7JwLmtdjrC2huQ/J6CvVqLOB0ad4U7BvRH2B9yLVK5WJ8kMZO8JpKbxmJGh+wAaJCKhnlqsoHxsXjfjE0wjflAmmfTtnR7AFY1gR5rSZZReB8nfd6oq6Of0pjSx6Gn+6xF6GC78S0V61fSu3isNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YZ24kYt2; arc=fail smtp.client-ip=52.101.83.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YZ24kYt2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yO/SHkYofRVFN0G39xUNgdL8927M0E+kfzXHy5yeuh855PLRM6pV0yd2gQrYOSBInzjbKIHk2gsVk05IoC0eWCdtJ1SUl+0fzf56VVVrnrf74QjZrSjM/WYqDkAEdnZU3BuvHUke6zLVyH42oaPlx7UU0LiJAJMQNkXBXg8ov1FjEQReSmH1x2Qbii9T9kShYogHxe9RGOqtPDUBhQQMR/fyQUlvs32KV8tMyjwHXlj60RiKCnFP4wtNYaE8CpnTQste8YhE7BFxTf0vHJ7mKI/O3oh4n+SRK2+ZWqQmzFRGrK3vIIbcWgG3FEhbxpTwabkreqkigDRzXJt14O40nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RwLQweE4pxkT96+g7nuBEjoQ9A50333iRyALWgYafw=;
 b=ql/cb/i4H1J7LqBUbZL8wIx9H1+F3sAUR9dnAXvTAqV9BCHn6H2h/XuoEpypm+IXjx88s4Je2B0e/jdORjr3POo9iJb1oOvt7mBrqvoZOvfY3WRe8A9CnEZyIzRZSzrRMaAc2eL0A+gPKSe986gTYYA2kTmZrPfSj/PoH0DQcHq+eI+JaQK2PQv9sm6OBUFk1iQx1HbQjLMyQpel8vqeYwE6h5AR71uoN/gpnYMieC9/GpVtprMyIbUFVKW5mEwaLCuT5vP/LqqIyrM29gO87u1mBTdOwywD6N2LM065Fnues5nlLoMBdHkaaKVnyOYx7zY+ISe7gj1sfEu2SLznHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RwLQweE4pxkT96+g7nuBEjoQ9A50333iRyALWgYafw=;
 b=YZ24kYt29AF6Dep9YloSoOztzdgrkWRXrP8Co/BTAZemhdHAqRGnAN6Dl6YQcFsqYjk1LLttkuCiwRETuLauYnLZpgmpD6WiTOf+B3PLDhQdNcFLY0Pcv4g41aB0BUDzYNJ4oFc71eruzcipE72dT7l5k9018pGMyacgjwgffFIVpfkSi/fzhkmLsxfPe0oLFm91Kf6xMMxTVdI9XVJ4GswijYoLJ6LLjm/iCXmEitaAOHPykgx4J1G0rfNpTR1ls3Fz7SDbp9n6JIwZRQbaFzrPwB7BxiZ4n3m7vhoNaMmBLFZVnKjCckoECD+meUysd0ka49gkan2XSDxF2wGMag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB7495.eurprd04.prod.outlook.com (2603:10a6:20b:295::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:46:03 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 05:46:03 +0000
Date: Wed, 3 Jun 2026 13:45:00 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Xu Yang <xu.yang_2@nxp.com>, Jun Li <jun.li@nxp.com>, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: fix typec switch leak on probe
 error path
Message-ID: <7qxgf6rknx2ysv5oavwn5ige2isd4iqk43qrtxp7wzby56oaus@ygn2eocxxxzf>
References: <20260602-imx8mq-typec-v1-1-3debe9bc77d9@gmail.com>
 <ryzrcml3jo2lj657inrm6dlh2d3so7redxvjhhq3pbe435vq7n@khuctebwompe>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ryzrcml3jo2lj657inrm6dlh2d3so7redxvjhhq3pbe435vq7n@khuctebwompe>
X-ClientProxiedBy: MA5P287CA0033.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::16) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: edb23de7-2cfb-450f-30c0-08dec13365d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SjQx4oZs4qk1STYJ1jKrPbk6p72fMTYhzYt6raaYP2JJczb9tgb/qfQjf1W0Kw7hmrObZAIQwcjOMqSJnPNlLvSVSn/B0hGXlJ8s8o1N5scpZnKILZ02ZPZ6xDtvguRcCPsmlUtmKiKNw4xwfnrB/xhGrTz/k59JOg9rTH3IeLo7PImIrTOJt5fpzQ6CnZIoc5uT+XmchvCqY/JVr3mOJe7PgH3Sg/ZJL1NbpuePtmNrKS+1RlgXCFmuhNausWQ+zJViBIrqAGOAUijdpQPZVIrB2fb6bIhkS3rOlONnClf2selE7oUFOAa4P9p0eMWnovZs6UOFS36smUnvAov11JIdRHBOkQRzlYubPVQBJG02Rmh1Vm2ZkJFlRzIy2POk0lsVfnpJnE+AVPdRiGoU7AEi+2hkrJNgUELw1ZO2NdOYi+HWvVclPn4lbCu2TcZwzewwJUZWgUF8ZicFIKKg9sf9sq6qe0iY2G1H0586zNhFnoMoADEAxHYtOXurk+1dEr9dcEcKwESqVLhud+m+QVWo7tqFh3wvhTZtZKm6DT58xtKEro9MRY5MNB03YA9f76eXEYDpYmVEhBs2X/TbiFL+S/uAyeBbKUgMfAlvhg4+GiLPydkodnEx0wSUBvxaq/179fTLmuIW2IHUWNMw3yi7keBe1ufoUjuaAQLnna/f8odcA/vzAZSscEzIhmGXYDRGIIBeHf32uraJikV8TQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jaAeJ+zMsCswFUhXphhbTquEi3VGaZsbmD5ddACf2pd6dihTkJUrPshK7Sa/?=
 =?us-ascii?Q?l/AonO7PRGjrZ41YR5QmKzuiL+gKtNH0b8bM4Z+0xcjYkUn9ovhPLihhAZHx?=
 =?us-ascii?Q?BrGV9iNJDazVWhcbHtUwiaa2HnSw2KhtEE6l0h+EPsgsZ9GCGWuuOTQUhxOz?=
 =?us-ascii?Q?5DYCmclXqoXHZELaOZSkqewZwMyj8QKsG0Zw1rLeZ29PXRZnp6MExxt2iZth?=
 =?us-ascii?Q?x0Er8obdwfwc6n1a0qaYjLNAaZPnsmuICWRuLJSk/tu9QlOw/yibA7cSnip5?=
 =?us-ascii?Q?pG0FRJdMCBbdsYArjeYfeZT9UytApk2sGM09fHTHmWNqRzfQgaQzXLxjhU3p?=
 =?us-ascii?Q?tPYuXCgbsQWoG2ckoIpW97rxQRjxDhsKF20eNCiVuBjGLtMJtp8T/BElpMPp?=
 =?us-ascii?Q?RjBP22oPHw1BPOE1TzTSz1hcF7QVKmL55cEaF1Q7URCylJnIGorQXPjFwgI8?=
 =?us-ascii?Q?lliqD1bijL5rKi6vVTSUqfWsXYbkrflNcTtX7DScUJIFMbgVpkK0j13Rc+jW?=
 =?us-ascii?Q?B0fPnvFZRRQkITmcbsMJVT8eaKbzUUJOR+ZCdu1REnZBkHnEtUptIqv3Ubae?=
 =?us-ascii?Q?kBm/vrDzL/kIlfJnQWYMQI6XBWYnvKBxRGPilimfj6mpIJvHk46KArVHbe3E?=
 =?us-ascii?Q?faFFrQIj6iDKuIXkY7r4vHIVgJ7gpTGjqV4PoLwy6Ihb2lho/kOWB1tvNpYx?=
 =?us-ascii?Q?cxAlNSljSSlz+bhasTIfGB8GYt3z/X8kUAhUx6Y+jA9XDocOc6auS0OaFCln?=
 =?us-ascii?Q?xj/gVeC2rCMCgM6TM5Sqqc8fS10w0Z3Evt+Z6M05V4vTertOnAVDQ6Pet1Mm?=
 =?us-ascii?Q?z2GOyS4I9WZblaOmmsXmTLNNEQzyPt3LhM4RqJI0itUacRlNgfkFzn8N+jR0?=
 =?us-ascii?Q?Hqr/UqnKkVXtPp2S4kZo8TT7CU3vNHm3sB5noKFh77gh1JfRXhOBzBwbo8wT?=
 =?us-ascii?Q?h49M8wTD37he/uTJVKnoZ/yWDx+Yx8uFJJJwWQcYobP+ivbd4cotlYkbT1VT?=
 =?us-ascii?Q?4IWwkFMx9CFOwzhLvZsiIMK2oZwF4Eo6Qq9KEgND9KcBMGTSEN/bpxSX5OTI?=
 =?us-ascii?Q?t5dkY9Xh4maAJKm99fQh6Irggq15mUkjPIb4jSej56YNFprIwybY8IiPdYsM?=
 =?us-ascii?Q?X/THcttUw0/kfl6DlppaLTOALSA7JErN2b+8LvoaG1ZOFEiTkeixUUsF36pI?=
 =?us-ascii?Q?v6wFi51FIBjkffuQtmcyVlzu78YECL/3QUNCnevdwpngOEaN1AXFpqGN1GuE?=
 =?us-ascii?Q?uZ/VybQEnCxWZ/PY9x6xDg6yFWDUpC1JlUE7JnrJaJ2tCFo47G/NgkAseTH7?=
 =?us-ascii?Q?7JcNGI5LJlU7xV5y2+al4xPVx1KKawIa6OBS4M4wiFtMo45YJwsqLmNOf+E7?=
 =?us-ascii?Q?qTHvBcxYJXYCXiI5K/J2u1C4DMp/X1q9RZDiab1lDaoz2ypaDva98uKpHKJE?=
 =?us-ascii?Q?GG3EuxBodTmx8uooYWcVCd2LQ7/SuzjJ2e/o4DSZRWF0qyxEzxLw4c39dZhl?=
 =?us-ascii?Q?8sWsFcU+0yBm6G31kE12BgoHTIVF46hZiVjCFp7e+2JFX5hfls+ltpL2i6pg?=
 =?us-ascii?Q?dI2/WlVSZ4NRcUVelba0wSktMES5I8VdJnDJF9Y3Pi/3mcOI81B6QFy81FbX?=
 =?us-ascii?Q?jZ6O5OYTjZlFJ1ESe9cJ9jowmJwcwmPnZPIt7NjVhuEavNJtsBYFnEzOs+WP?=
 =?us-ascii?Q?dqg499wY0efWzmSilg0uB+6bIDMvqYg2h6iBk9KKNfbPJURKQZI3XHoe5zCd?=
 =?us-ascii?Q?PSbzlJH1wnc95q7S7swRVlNPGR+y9wXJ9hebQFneKcy/WQU+yAp8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb23de7-2cfb-450f-30c0-08dec13365d5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:46:03.0421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGWCF87qmMMwz4/zo+HyU4HbZAo27SuHNwIpgAkmc2ijsDKaNICytyBERdNuubIg3OAhlekIjr9bQ6dPIPuxQY40axPE0AH5vckJGZA6PtO1ZTxR6MjUhtkHucKp50H1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7495

On Wed, Jun 03, 2026 at 11:09:32AM +0800, Xu Yang wrote:
> On Tue, Jun 02, 2026 at 10:12:41PM +0800, Felix Gu wrote:
> > If probe fails after imx95_usb_phy_get_tca() succeeds, the typec
> > switch leaks because the only cleanup path was in .remove, which
> > never runs on probe failure.
> > 
> > Use devm_add_action_or_reset() so the switch is cleaned up on both
> > probe failure and driver removal.  The .remove callback and
> > imx95_usb_phy_put_tca() are no longer needed.
> > 
> > Fixes: b58f0f86fd61 ("phy: fsl-imx8mq-usb: add tca function driver for imx95")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++-------------------
> >  1 file changed, 8 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index b05d80e849a1..8af5a4f85698 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -173,8 +173,10 @@ static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device
> >  	return sw;
> >  }
> >  
> > -static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> > +static void tca_blk_put_typec_switch(void *data)
> >  {
> > +	struct typec_switch_dev *sw = data;
> > +
> >  	typec_switch_unregister(sw);
> >  }
> 
> Nit: You can simply call typec_switch_unregister(data)
> 
> Reviewed-by: Xu Yang <xu.yang_2@nxp.com>

I have a similar patch in my patchset. I have added your patch to my patchset
because it has been reviewed and my other patches depend on this one. Otherwise,
rebase is needed for others.

https://lore.kernel.org/linux-phy/20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com/T/#t

Thanks,
Xu Yang
