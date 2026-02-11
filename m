Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E152ECEBC
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770823898; cv=fail; b=fWT2uX2Qxj1MjUvC/sVo46h5tByL/0muG6l9pGwKwP0RhB65dc4DgRbAfR8+Og8YFedEl/norBshxsMrax8IZsP5SlSuMX2/Jn9Hbd6YvYeUh6P0hVzeV77QOr8y64sPdPi46iR+T40kC/0AzarlZ5NwErZE68pfz0F5wDFDecA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770823898; c=relaxed/simple;
	bh=S80HD6gM2lcfyRCIiK2cZ8pgPlXrGuxXQ9KB2shmkY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Et10mIiAIq4dGx5xCBzKyCLUMMq0oQyJAvWR+S/PuF4yqgfsO9IhRzMrpY1fs1907LBJQ5WZ7znr6hwvsrsI2Q786xPbU/5LCPvn5T4bST5aEp/AhhjcFmETTQCioAEfzHFkwPMgUsXTvOWBOtbBz80DfFJHWVzPr7u6HTfFrTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JONnBkaT; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JONnBkaT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRZo/X/d1V6BGj/d1OLi8x0mt4Uzqp9JEUgB5g451tEB8Gza742HCMl+maYpFCETgC7AuUi/1L12FI6Q4ZIm7ODP/riuTzZVqBkRxtpOOzwBL1r9g8qqG4NuNGS8/H3hrq2LjZoxYbYSp6yLzNnGJV8IC5med5rnf3TWa6qMbGSy3wqgJT3lKHdv5HCptPJy/8eV0Gm5VFg6+Em9FB0EhnG/WNkC2XyScMcMTR0brDtb2xs/ihgOI5/X8Vpc63ane9gcvXpUOtwQen3GTxBk3rVoiMD1XOrIYsSQOy8DOakbRuAP2lqUXCYevWzCHxzew3g+6tPqeB4fFfPmQDyedA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qaD72ecDuLWru1LO1sroQormtB54F4W0DDaAyJ2n61s=;
 b=TYsZ/nFIh+hFHEuNH1/6BuqxIvwp5PCYgGg1cU04eFdQb+T7Synscbm64umb7ZzCVg2/EYGmS7K+d/I0uBu1Dr45XYIkQetQh1W6K+3RPBKmi2R+SilQeE0n+IQ3N0l5qCUc+iugahnefEJ4o9GbTU6JKm1geRfwxDazV5dZVercS7Q5PR+WU/4vaHqM/ohSR00SmroG4UWnaH3MooPGdo/yUsNTpxAcNfXbjU5M4CglJSIS97BNSFYVA4keEOZkcZyM1pobJmnpLPYGKx1oEkwK0zfnM1MIdaTsLI/09bpY4jS7GM9V2n4DHdof9lFWGCsvtmHI1ffpTL+LCP/cOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaD72ecDuLWru1LO1sroQormtB54F4W0DDaAyJ2n61s=;
 b=JONnBkaTTMkilny8OkZ1bo682m0skIsnybGAbZQVs+pLjzIKQ86bXEGuaDzeFi6395G4Nmk6FVL2tMzIrdzzFSAKWLNYwiB9FtFGxwOz1eG0ibInAGNN16/72XNq36gZaaVGo4phNcfBoOAIOZvek5quRyFjG7CUt5fi/Cg96i32+/zDznuvwo/0X1bHZf3F9tPY0hNIoHv6CkQJegXTzw3hFo42X3moTmOBnpeTDjTvLIJceXjOvG/MvwGYYnyR4w37x7cEmlKgStzqnLlAVZNQCUDe1S5a7xcSZrlhYbnPa8f3qYpKWOKxNxqkK6VcZo/3EAZflJ/VYL0nWI2Brw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB9860.eurprd04.prod.outlook.com (2603:10a6:800:1d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Wed, 11 Feb
 2026 15:31:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 15:31:33 +0000
Date: Wed, 11 Feb 2026 10:31:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-phy@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND 1/1] phy: freescale: imx8qm-hsio: provide regmap names
Message-ID: <aYygzojdO0QACdqX@lizhi-Precision-Tower-5810>
References: <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH0PR07CA0033.namprd07.prod.outlook.com
 (2603:10b6:510:e::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB9860:EE_
X-MS-Office365-Filtering-Correlation-Id: ee0c5c9a-9c9d-4d4b-d682-08de6982a2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XVm6R8AIuJIOBHvNUrv6IaCNpqafvPhqJGFiCzpnsXtr1W//jbrFuCNnYC8i?=
 =?us-ascii?Q?r4YAjuPGeRZgVoeUI5Otdna5mNK5tzwm/m+h5gWSgcolLACwkROp3ZAIvZ1E?=
 =?us-ascii?Q?gtNncz7LUPp3VeF3Zb3eA8pIEP6VJ5GVk6by/WTxFek6fEiwzA9CHh8MrLIf?=
 =?us-ascii?Q?j3dIDv65PKOcmZh5PrO5tdi+iX60QplDnyUMk4gBqbd2yKnkcTpTkugPCDBT?=
 =?us-ascii?Q?8wft4V+M106yuDs8Vnztl7BdtNheaMcLlf6UN6JoDFiCbjluXR6yWRdLN2O0?=
 =?us-ascii?Q?DQHcUuQ3ThkNHr/w0zNZf9UQ7uvHL2++2tNvKlKeUhshNErM9ogU86ywnyP6?=
 =?us-ascii?Q?TnNOs2JbrcYjVf4sMcvcrzIxqkBTGApjhik9oESPguG9cFh6dA0dOrIgc4sF?=
 =?us-ascii?Q?eOwN5EbO4uD7kws6lqeClrCtu91hVvUhb4L5KTVC0RK9r5jhxokjvQm2FdmK?=
 =?us-ascii?Q?Mj6UAEdiBV8j+5D17A2yrx4Qmyq+OmbY5VW7+eeFR00TS1kvab0yT3quC8Ql?=
 =?us-ascii?Q?lttkRs5XhFFTs2TNKtOwqi9dcEXPeOlueXn/fnI86GCnbu6gQKWU80c7DUGO?=
 =?us-ascii?Q?u5zBnYjLzb0zww8iiZDwg7QlV2jhlRyZ2SXSSWbsEL2UvU5WiGtWvjozgKgm?=
 =?us-ascii?Q?Pa7Clef6mEeVs7KZCpz6dVZGVeIWczXunf80pzxrA+wEjvi2t/n6PEv3LSUp?=
 =?us-ascii?Q?7btYpzrLKkilfTKnQvySDrIcvUETxIp1aW3wYGY+5W8aljnFmJRVB6gOBwew?=
 =?us-ascii?Q?nU3NpnCu9sNmuXwZwo+1SfPK4chlmaAjlyRSU0VMKP48rZJHWOVIHde7guVZ?=
 =?us-ascii?Q?AMeLU3eZ6QZIHIdk5+6lBfUt8koHvgJqKt35456tqEclZ1rsH5n8XyqXrqUk?=
 =?us-ascii?Q?/ggZdHhj1jxYXveukm9mn73t85OdKqZ1VWYkfvzhz/imgYHcbyB0VIK2ZWDK?=
 =?us-ascii?Q?qatk6dvhV9ys6XBw2ne7Da8hCgLvkeX8R46bTyO/kKTUf8gAVrL21ePDj2nE?=
 =?us-ascii?Q?Pr5cRJNApFWAy5h9YyRsc0GBu/LE24CLMWOzWI0nNbLn8u5xVE9PtFWVoj2B?=
 =?us-ascii?Q?hourq/gIxrNiIc7CPFCEumIMCVGuQh3PnDuUEkHvVUHrT0m2cvZFIyFid5gP?=
 =?us-ascii?Q?XtVOhBvJqzomg0XhbkoKUSS7iaM9UFJz1TTNTu8R8VIyn3Aw4RU8WyC+OsAQ?=
 =?us-ascii?Q?6UpdOEX65hqiWsDNx6Jw8q96pOMdMHabtfDXJtlQd8IbJykaq4BwoNW4mA/e?=
 =?us-ascii?Q?W63bUKdQH7GvlC6O888XpKGlO3Jcj2HQbwaUkonIU79X/mrvM86fBUgZFHcn?=
 =?us-ascii?Q?GuQ0jDkKkrs91BrytVQtzDW4dy3Vf+1NNRMyVXcWvQtXnX2/z0xpfb6UzY3P?=
 =?us-ascii?Q?hROLroLvO6D8CaxROs4lJyQeiwd37+EC9Zuj4axuMQTKSD/Fm0aVEU/K9UGj?=
 =?us-ascii?Q?gbKj1tNFu4TkH/7FixzzQrn4bXZyH+YCimahIYJtJhftZTTV6J4QkogilnqZ?=
 =?us-ascii?Q?4la1y3L2dzSpT06aj6JX0uIh1JNPmysOxY5nqSCSdxAZxAwO8LeN+cKmQwoq?=
 =?us-ascii?Q?qPHCILZ/n5tjNizQoCU+CnB59gdYCEnvbWxtUHAVG2qIeFG0ZiGGfxvp6wGC?=
 =?us-ascii?Q?pTQ1KQBLK1g+BfzsylUv+QE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x5XG1+y/R34Gfu0h3iUlsh8ejfXQ7hzu8jPF7pUikb77spK1yI9+DXX73CdL?=
 =?us-ascii?Q?3G1NgHeJfsr1eylRaZWD2Zlf6JKEq3rr5dOuOvu4U4iqy2I/iWHlG10yNZ+T?=
 =?us-ascii?Q?uwXO/S/LdXNC6sH32MrEjgrNtUuBxftBqYZerNCgvoUFthbm+9PEmx/XsFVf?=
 =?us-ascii?Q?GCtQw8yxdfJp3JHjNKs5yLz3w0tLjf/VeAVYpD4+txd4ZKomDNUhZPdLldgs?=
 =?us-ascii?Q?nrDfX7sqBObz6pphnMODQCRhDq+MNfcj0lrEfI+6BcCnXhJJQkN6INA6gnBS?=
 =?us-ascii?Q?QyifjvGfrFQSCCS8xEJVkCU5UtnWJQwBSpDC8KX/MT/n7a2qurJDKL6BAFPG?=
 =?us-ascii?Q?3s/9DJhThlrHLO6cs4CaaIUTGatyAB4eVAJm0qXk4GMUv1bxdzZDQFP6/4a8?=
 =?us-ascii?Q?ATniZYAmuUkCpgBZDg9jg9eOlGVYnESYT0r//x/+djsgSceQK7Kws4NmbKRH?=
 =?us-ascii?Q?8xdk8L0ES6eNN1ut8ctS9PISxiOhwLdhHMdwnqOTpE9OvTV7EgD1dZtx9TNr?=
 =?us-ascii?Q?vzQpww1l9Yma6DQxHIwlveuPsQ+PmGSeqdjZuVjAO2prSrac96TGLPzACypn?=
 =?us-ascii?Q?LHmVJfjhtdUg3KGq2rJQKo6B8IAoIxSrSqBgM8Nd/0XwgSZBFsTlHrTi/IcM?=
 =?us-ascii?Q?kip2Thwp9kJaisqXsYJjnCC4ZMRwoFESRjjcqCXlVhMMYHqVAjBaUc0bjsCE?=
 =?us-ascii?Q?vHKIYiQ5wiPshss0NeDEhk3y50uKF6WWFzSztbLbXs4w8NBOCM4c+B/1zzZT?=
 =?us-ascii?Q?TXhDWIjAeneAWV9cGTlwRwUasuIxymapugVKAj2RE/1qbqCb6INfTi+CwPHF?=
 =?us-ascii?Q?3xNW9gxOCzqG0wEBtopBj0OynU7myx3b2bzTMLj35rVEGPiy1+223IStZHid?=
 =?us-ascii?Q?Y8fc+P7/1Q+lxv7to/WwdeozOGZGQOoJoir+z2KfWFm8sOE4PbcRjwpnCKkg?=
 =?us-ascii?Q?DXFDBANi4/dEfOXku5uVEFYWBqyvE+9K4fs3cu40sKg1P2P4rHR98u/eA2a2?=
 =?us-ascii?Q?pxWtV8XY+Y19JcW+pk/3m2lBBTnLhA/GxeLxwiyveglF5Ts99zM5opHhJ2f4?=
 =?us-ascii?Q?AuUqtFjJTGkDA8MH+aVk+zORpVXo2NbZYiDbTPUbY9HgGLXcVi6Sry7bupJT?=
 =?us-ascii?Q?ZYT9Pn2fZyGS9zoTWP4SyphPLUHpYSzOaT1r61wMj20+Ii3ckv7mfCC5fnqI?=
 =?us-ascii?Q?ibj1egbDNYx5OfpihYOQBeJNh3dyYvS5ZIeXMRwZvxf0KBSKDcmigvujGScT?=
 =?us-ascii?Q?LIGjNkJ0rQTP+3llXJh0u6mT7zGOUKsCLClatvgWmmlyZmt8rsaAmP1KtOmA?=
 =?us-ascii?Q?93SxwUGfnaoI5fyZ1l/9H62F3U/QuyBljfcp4ydTZRrKRkZLA8tVmBfqjDXt?=
 =?us-ascii?Q?8+1d+bJiOnJnEelN7WINjjh+dK5gLZ1Wun6K2M6Q0urslN/FMNzZQn/TlJTC?=
 =?us-ascii?Q?rWb/mHloioKROXvFEZCtNEjWPRbSDxFq6DUI743n3fGJSiJ5VLOKqVQ36FPf?=
 =?us-ascii?Q?dCNrFQYeV+V2+NcOT40NHP1IobykpGoba/hw6zLo2MJnXp7mePYalV1v4cgG?=
 =?us-ascii?Q?7Mq6avmqgVA0YDKkXlWKPZA2Ptf1MwgMpybtUoTipaOwe8y7zdWsgLzV22uL?=
 =?us-ascii?Q?JNZBHMh1j8mcUuAQc6V7vXqRNmHA94E0ZeSO6UPK3JPjhCvBhSJeRMnTZTEl?=
 =?us-ascii?Q?20QQEOCv3clxraLk1Jlou8bBEPfXe/vkPsHkHxDy5P5oeu5HBG3MLLhkWGS3?=
 =?us-ascii?Q?h68naGWx1g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee0c5c9a-9c9d-4d4b-d682-08de6982a2bc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 15:31:33.1423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88Pl1vtPx2pTQslDIlgsSuYnMd7BtArz7y7Ps8LIutJ0svHDWNSqtcMWIVQLb8HscYLEbwvrVG7P/3jr2snV4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9860

On Wed, Feb 11, 2026 at 03:49:48PM +0100, Alexander Stein wrote:
> This driver uses multiple regmaps, which will causes name conflicts
> in debugfs like:
>   debugfs: '5f1a0000.phy' already exists in 'regmap'
> Fix this by using a dedicated regmap config for each resource, each
> having a dedicated regmap name.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Same as the one sent in December but with an updated CC list.
>
>  drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 23 +++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> index 279b8ac7822df..4ab45c9f53dff 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
> @@ -107,7 +107,22 @@ static const char * const lan2_pcieb_clks[] = {"apb_pclk2", "pclk2", "ctl1_crr",
>  static const char * const lan2_sata_clks[] = {"pclk2", "epcs_tx", "epcs_rx",
>  					      "phy1_crr", "misc_crr"};
>
> -static const struct regmap_config regmap_config = {
> +static const struct regmap_config regmap_phy_config = {
> +	.name = "phy",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static const struct regmap_config regmap_ctrl_config = {
> +	.name = "ctrl",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static const struct regmap_config regmap_misc_config = {
> +	.name = "misc",
>  	.reg_bits = 32,
>  	.val_bits = 32,
>  	.reg_stride = 4,
> @@ -562,19 +577,19 @@ static int imx_hsio_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->base);
>
>  	off = devm_platform_ioremap_resource_byname(pdev, "phy");
> -	priv->phy = devm_regmap_init_mmio(dev, off, &regmap_config);
> +	priv->phy = devm_regmap_init_mmio(dev, off, &regmap_phy_config);
>  	if (IS_ERR(priv->phy))
>  		return dev_err_probe(dev, PTR_ERR(priv->phy),
>  				     "unable to find phy csr registers\n");
>
>  	off = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> -	priv->ctrl = devm_regmap_init_mmio(dev, off, &regmap_config);
> +	priv->ctrl = devm_regmap_init_mmio(dev, off, &regmap_ctrl_config);
>  	if (IS_ERR(priv->ctrl))
>  		return dev_err_probe(dev, PTR_ERR(priv->ctrl),
>  				     "unable to find ctrl csr registers\n");
>
>  	off = devm_platform_ioremap_resource_byname(pdev, "misc");
> -	priv->misc = devm_regmap_init_mmio(dev, off, &regmap_config);
> +	priv->misc = devm_regmap_init_mmio(dev, off, &regmap_misc_config);
>  	if (IS_ERR(priv->misc))
>  		return dev_err_probe(dev, PTR_ERR(priv->misc),
>  				     "unable to find misc csr registers\n");
> --
> 2.43.0
>
