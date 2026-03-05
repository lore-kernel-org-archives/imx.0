Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013038.outbound.protection.outlook.com [52.101.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18432DC35C
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 20:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772741159; cv=fail; b=ZKub//Dc8nXa+XmoKeAqEYCRJrMutBi5yp7HG+TYfD1QfvxPCydSeCZoGYuexuBjmnaSAgIqhHjEBhnwldPMR+d3BZYUtrcdGfmjw3ehq+nzFA1iUa0kgcukbe0YgMfk5bY/TuXCRST2rc2azUL/9nrNsGGSIWIgLVXbjJjQJTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772741159; c=relaxed/simple;
	bh=RevwOhWAob/XWzRD8Et1mu5AgsglxAqWkTgSuI37VvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NqU4wzOUzUFsx7OTO+9rWWK3qvEvsDMkPL61maPrBcZwaR19Me2pFbrcqxwvXm3ZqM14+UmSZJ0j5oZ5YaS+4kYB4UwLj5SMRS/zOOdaJxBsCqTw8EdakDysvDlSr8fo21W3f1XazQ7lKWEPh61mwFv5zRslSiAVyjU0o2W7gUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jZoIWJv8; arc=fail smtp.client-ip=52.101.72.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jZoIWJv8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6eSpkassrz+x/JdCrYLYhIQRfWDnEXSV7fRFa4V3EBObjHoYkq8qu3CTsO4Vlji1yfkmP0fAixcQ88dINcA5Z1q99oMZD/UfU8einkqffYrJWZ/WkOnhOn6G4iIPKF2+wZSwWny+CYdhfE/bhfEXpnBvYvf4jmkGv+1Ee48ubv8Rh3cDjzbmAzproHpPsi4PyqnQYjq5fHENDpi2+fS8NXp/RXBx3Dc96LgDE5CG5LWJzt5aA7rHC5w2+99zHunFVgybD6oZ738IGCfq2r5riTjwlgjdEwZvC960PnjQ9PQ7MC+3zHtBk52tpi4QHe1br04OH/tjFC8QpuVHNS8Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3ZTeFDxpi1I7MJRsg31j+H3gXi/EUnLFUjrvM8iH9o=;
 b=tsEcoJPnnPUuJ8WcmHhly6gIHs1wcGkPMB8RljX4WzqS2O9NnccqFG41BZkxEWuN7XffzY9/mmTkdRmU0yE4Z0HMDt4FvrnZmA/Bq1/M8eY0SYjcxQ1McFJ+PeB9w35Dtiwn2Xkw0AfXmnZc5Cc4jVcYQIuwiugO18/wV7fUpzIsItBOZxwQudU6qNeFe++dIU0lObhlJQ3Fm9CudayCX718EvVqeO/KsyA4HTCi+rILXgmznU8/VNZjW8pmOlIpNnQmuwlK91n8q7SNiOwYQ9Mu8FYhLh5qoT3vCYljXWvyzv7B0h96XMjnV2mbG2S+pQNcqSFSCR96ARHZCBunAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3ZTeFDxpi1I7MJRsg31j+H3gXi/EUnLFUjrvM8iH9o=;
 b=jZoIWJv8TkatAkB6k/zDz+TZzDGB48ZLcMHiAJPEBB8UbrgfJ+YKl6Ks8FGQJW0YXQCNmVvZds5Oyqpjq5TWsLmc+juBS60Zwo5c4DbfbPvkPli8TXPwVsNPG4gCRwPfoZCXUteQ3zlF6VshmyfpakYzuugD8vT+3KYFnnqKB91Iivjh1MYF3ayVCtJuevvovfJ+8FPwoDBYX/WiNsnztuzyptFUq02iG+QerCEbYBgQPWapQ5nMcgsZ/eiltPA2765CHEnLj2RDbnSnqEHm/LxWvdb0Fy2kDHvNgiovfjZVOeqbLELGG4fuCJ/z4drRUNKneHyRuc7xiv8lFfQu/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10649.eurprd04.prod.outlook.com (2603:10a6:102:48c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 20:05:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Thu, 5 Mar 2026
 20:05:53 +0000
Date: Thu, 5 Mar 2026 15:05:46 -0500
From: Frank Li <Frank.li@nxp.com>
To: max.krummenacher@gmx.de
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "ARM: dts: imx: move nand related property under
 nand@0"
Message-ID: <aaniGuauaieO3p36@lizhi-Precision-Tower-5810>
References: <20260219151157.2549198-1-max.oss.09@gmail.com>
 <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>
 <aZdDF6BObEu_C4KJ@toolbox>
 <aZdnhv2QC1szMCVl@lizhi-Precision-Tower-5810>
 <aZ80BWH6DRu8_W_S@toolbox>
 <aZ82pG3PO1HxD18B@lizhi-Precision-Tower-5810>
 <aaBA65_zLu8S6WMS@toolbox>
 <aaBi9lipWTG5l0hs@lizhi-Precision-Tower-5810>
 <bd0bd330d140f9d9d222c72c3797f79d08fcae1d.camel@active.ch>
 <aaWxiERQ4u6IhO7Q@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaWxiERQ4u6IhO7Q@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SA1P222CA0140.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10649:EE_
X-MS-Office365-Filtering-Correlation-Id: c4284944-82ce-4808-e2c6-08de7af29af8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 wGFGUyGFAwsCJp+/es7pVyiEzPpo1sBppa+nUpYgO4CHsFxQwDZRcnxjgIO1yLN1WbC6GOEwS8Tz9qKb4np3CiVA8wEetFtHt4g+/SXFVrx/NBfC1sTasyPL8U9rXRP/p4QApLdMht0cJ+COVW9+DzkRFqfHFZ7kiE23VZBi/23Jeq61a3D284ER+DQKpbBUZN9H54LkV6qYxJwRItk8FcKYg/QN4dFPmMkp4D/9M1BO1xDBZ/o65TW3LBNeeJgHFLCmZUOmMaHlsfo5zuxnDecGdp2Fmj2ccTzniKjA6s3gsPMCfWBvuSJF0T/khreOmHiVI5hDLDL+530dmVLlQBxh6BmLRb0/azwvKB/YCJW5Uo0mApB372AkmYeSDfUrzV6tpaJuMQSaevnbDnXIN8CVdc6J8ODtpc79fzZ7kqnQ+0vxvCz5/Gx/AGvwOblqOyNTuNGgPjK+lc9MV/gY5j6aHafzh/b/oH+qMTNv/1wB1bCEdAJVIjSWWQf2Sfu9zFiIqOrWIsBDXWoyOhAjY9ZJKv9osOe/Tr487jzz6BSvL6yP86nBjbLPZREgOhJx1RRHzAEx1XD4FX7EHCSnnPYO6SoWDJt9CPOy7MMJHBm4wgT5w5PaYz4dsvigsVLhnhM4elr4wqXP3819fUhPPGqTtsCsRn0HJWIFa28QM29GZpRT2J035llZkpBoT4uDcs73biqD2k9il1nBUII1hjyGyig5kLzL/1kBHBb58DjCGVYYlQ9TIM6k8M3K5b/kOVxCRO4beL0zVPAIzdwig6s8bk+UW5VnDqMFlNmKfIM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?mIILtQSoPwJYPHBiQsTJItrO8AsYAxuE1f4VyKVxS61n469z6LDqenSoHkwY?=
 =?us-ascii?Q?M4A4VkWBDvjgADixPW7tw+3FdVa7LSrILHYY/j0gNiDjg+GPn5Inhha2HcNV?=
 =?us-ascii?Q?xcXAGx0WrgL408B2yCI0s26Hjj1GWRQUKXJTJ4QMUQmdMvFDFGge6pb48Vwc?=
 =?us-ascii?Q?pY3L/LTXpB1xBx3EUHzAd/u7gOYvEKKWdDUXFVbGWh3d0AndilJcsIbk0Un5?=
 =?us-ascii?Q?SrxzgdyPSR2+44SC45S0Tip5qg3iKEvJK30Y8NAe++bT01P/zYZpYfslqw4G?=
 =?us-ascii?Q?6U3wT/mmacphZTyi6PKj3jV5xlkp2x3LHg4BqahZiYdNXqEAIAFrcv1sspQk?=
 =?us-ascii?Q?x+tdVM+yNHl5Gffm/kETyHbdqIJFBtue6u02Vsizc7Gt9xEYilXjOFTY5vzT?=
 =?us-ascii?Q?84U+kF43kpC8whxfkXKD+rRtn86GSghyBfZRj8O0oPo6OAwS/eceQ2Fla8hZ?=
 =?us-ascii?Q?ZkozbespO57+gLaN4CFUJN1VjCjs6Q1+TbbKTGOwuOAXrlNtV2Zi5A9yZ2Xi?=
 =?us-ascii?Q?EGgzDht5I+cWUq20aEHBEt8Wr9dtTwyL2ZPKPmWxeQTsW95k4LelUyyOKXxx?=
 =?us-ascii?Q?SV+tboLTrX95RvRD/5S3UezSm6P4iudFowIsuUnJ9nfHafzbw77ctPSZ6+UT?=
 =?us-ascii?Q?ZVf7keKUP0KhtBjW+UKsMoOcB8i0TQr+jXjYsMxmq5rUmino2JaPZIKCSZGe?=
 =?us-ascii?Q?RzjPVRESI3hiTozY/vssoL6KZS9mq7Jrsh89xiuDr9p7I7UQDE2YfKLwF8fO?=
 =?us-ascii?Q?64L4PPry+5kQwgCqFmZn8IFcjNmmA+NBMQRiscKGxzmki4Ygiu9OkgF0PVEm?=
 =?us-ascii?Q?sdDS0NQiaNjqWG44Nl8UjaqYQtCGWk99wje0ombX+80npQfwslqkLwIKJEkx?=
 =?us-ascii?Q?57pVDM5zRaM12500LokdE81epcM29LRN42FTA/9NyHIOY6dd3LEmA4/cUFj4?=
 =?us-ascii?Q?1uHPJy4sT+g5kFcGi6Is9iq6/fukK+lDrxzWrBB9ABhEH8ERLaczSULrCmF9?=
 =?us-ascii?Q?B7vtRhrrwY7Q4hXkbBnbWtNKzFghDyyXcK0pkg3s/8xzIFlip/ZPpwNmkSYI?=
 =?us-ascii?Q?Kyyn+8UNhBQvebcT1Lj3T/Gxea5hrp3hTDYjB6hF5UzWmQihXxN10MF/lNb8?=
 =?us-ascii?Q?24FCZCbvBB/Hs8OTeHParHFedq8v44ZhoXTxvN/DUR3kTO3cKVmYJNUqb18R?=
 =?us-ascii?Q?ix5GZDIN85Ipn5W43Q+Mfol94RcZAugl4/HomUdP1YvCy7ZUbSd33D6hOVLZ?=
 =?us-ascii?Q?6WTQo08oM/5fjnECw31Tm6kMwpQr6sXjLhmgQSSV9nNfWMc+m1MAmxj8j1fJ?=
 =?us-ascii?Q?LV4TkQb1Ct5RRxhF6O4A+s6/ZBQpQNvvTvc6wh+w2/JK8lKhKUZRTO5smEFB?=
 =?us-ascii?Q?IS7mSCiYijtEDZrzs6FpnLWRwVhSVYCWF+iUXy52ok74xRL8KawCSySeIEOO?=
 =?us-ascii?Q?lbEkEjkGBX/sPnEbE/XIh+ErRVaxU+HcDRLMp62H83JHhIdtyjthTw4ese40?=
 =?us-ascii?Q?ME6Qn7r+SiqdobRRd17rYYkI5Zo/1nY9GLzt4U/rpOdx7ufu7kIQZXkr232J?=
 =?us-ascii?Q?RwVsLmeJNG0d7o6nUGTVcLK6XWjK4ev8t5YDSpbXTQZFEZQdJLbeiSHlCCfe?=
 =?us-ascii?Q?lGO/40kOtmGk4MimIuVEgmlgWdP+t2mTumL+aXpU17lyBlbU0yj2qH8oSG3t?=
 =?us-ascii?Q?SAqnuqWK2czAWHlVf3QyodAXTFiyckv/XzgMd0Dh3+4r0pwE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4284944-82ce-4808-e2c6-08de7af29af8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:05:53.7215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 63si5rb7TRT/SbEEw8v+ApkpCjpq3GvtTuB9fU11O/mGdrywy4y03qgt7eAyE7NcOAaHHz72AxAoUjHNiLCM6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10649

On Mon, Mar 02, 2026 at 10:49:28AM -0500, Frank Li wrote:
> On Mon, Mar 02, 2026 at 11:53:00AM +0100, Max Krummenacher wrote:
> > for our NAND-based modules, and our CI no longer produces any useful
> > results as a consequence.
> >
> > I strongly believe that, as an immediate first step, the commit
> > that moved the DT NAND chip configuration into its subnode should
> > be reverted.
>
> As my previous said, can do partial revert? Just add back property under
> gpmi and keep nand@0 node.
>
> For example
>
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> @@ -260,14 +260,10 @@ fixed-link {
> &gpmi {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&pinctrl_gpmi_nand>;
> +	nand-on-flash-bbt;
>   	#address-cells = <1>;
>  	#size-cells = <0>;
>   	status = "okay";
>
> Remove "- nand@0" part.  You can use "git add -p" to do that.

Do you plan rework this patch as what I said?

Frank

>
> Frank
>
>
> >
> > Regards
> > Max
> >
> > >
> > > I plan give additional 1 year to do transistion. This type layout actually
> > > exist for long time.
> > >
> > > Frank
> > >
> > > >
> > > > Regards
> > > > Max
> > > >
> > > > >
> > > > > Frank
> > > > > >
> > > > > > Regards,
> > > > > > Max
> > > > > >
> > > > > > >
> > > > > > > diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > > > index 51f595fbc834e..fb126a7c4a61e 100644
> > > > > > > --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > > > +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > > > > > > @@ -2680,6 +2680,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
> > > > > > >  {
> > > > > > >         struct nand_chip *chip = &this->nand;
> > > > > > >         struct mtd_info  *mtd = nand_to_mtd(chip);
> > > > > > > +       struct device_node *np;
> > > > > > >         int ret;
> > > > > > >
> > > > > > >         /* init the MTD data structures */
> > > > > > > @@ -2688,7 +2689,10 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
> > > > > > >
> > > > > > >         /* init the nand_chip{}, we don't support a 16-bit NAND Flash bus. */
> > > > > > >         nand_set_controller_data(chip, this);
> > > > > > > -       nand_set_flash_node(chip, this->pdev->dev.of_node);
> > > > > > > +       np = of_get_next_child(this->pdev->dev.of_node, NULL);
> > > > > > > +       if (!np)
> > > > > > > +               np = this->pdev->dev.of_node;
> > > > > > > +       nand_set_flash_node(chip, np);
> > > > > > >         chip->legacy.block_markbad = gpmi_block_markbad;
> > > > > > >         chip->badblock_pattern  = &gpmi_bbt_descr;
> > > > > > >         chip->options           |= NAND_NO_SUBPAGE_WRITE;
> > > > > > >
> > > > > > > Frank
> > > > > > > >
> > > > > > > >
> > > > > > > > So I don't see a quick fix other than reverting and living with the
> > > > > > > > dtb_check warning.
> > > > > > > >
> > > > > > > > Regards,
> > > > > > > > Max
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Fixes: 8124b4a4a96b ("ARM: dts: imx: move nand related property under nand@0")
> > > > > > > > > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > > > > > > > > >
> > > > > > > > > > ---
> > > > > > > > > >
> > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi      |  6 +-----
> > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi         |  6 +-----
> > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi |  6 +-----
> > > > > > > > > >  .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 +-----
> > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi      |  6 +-----
> > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi           |  6 +-----
> > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts            |  6 +-----
> > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi          |  6 +-----
> > > > > > > > > >  .../boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 +-----
> > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi          |  6 +-----
> > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi       | 12 ++++--------
> > > > > > > > > >  .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 ++++--------
> > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi |  6 +-----
> > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts     |  6 +-----
> > > > > > > > > >  arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi          |  8 ++------
> > > > > > > > > >  15 files changed, 22 insertions(+), 82 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > > > > index f452764fae00..547fb141ec0c 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > > > > > > > > @@ -36,12 +36,8 @@ &clks {
> > > > > > > > > >  &gpmi {
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > >  	status = "okay";
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  &i2c3 {
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > > > > index 58ecdb87c6d4..9975b6ee433d 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > > > > > > > > @@ -172,12 +172,8 @@ eth_phy: ethernet-phy@0 {
> > > > > > > > > >  &gpmi {
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > >  	status = "okay";
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  &i2c1 {
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > > > > index 6f3becd33a5b..aa9a442852f4 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > > > > > > > > @@ -102,12 +102,8 @@ ethphy: ethernet-phy@0 {
> > > > > > > > > >  &gpmi {
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > >  	status = "okay";
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  &i2c1 {
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > > > > > index f2140dd8525f..85e278eb2016 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > > > > > > > > @@ -73,12 +73,8 @@ ethphy: ethernet-phy@3 {
> > > > > > > > > >  &gpmi {
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > >  	status = "disabled";
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  &i2c3 {
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > > > > index 131a3428ddb8..c93dbc595ef6 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > > > > > > > > @@ -260,14 +260,10 @@ fixed-link {
> > > > > > > > > >  &gpmi {
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > >  	#address-cells = <1>;
> > > > > > > > > >  	#size-cells = <0>;
> > > > > > > > > >  	status = "okay";
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  &i2c3 {
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > > > > index d29adfef5fdb..57297d6521cf 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > > > > > > > > @@ -252,13 +252,9 @@ etnphy: ethernet-phy@0 {
> > > > > > > > > >  &gpmi {
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > >  	fsl,no-blockmark-swap;
> > > > > > > > > >  	status = "okay";
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  &i2c1 {
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > > > > index 40d530c1dc29..2a6bb5ff808a 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > > > > > > > > @@ -133,12 +133,8 @@ ethphy1: ethernet-phy@1 {
> > > > > > > > > >  &gpmi {
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > >  	status = "okay";
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  &i2c1 {
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > > > > index 776f6f78ee46..e34c8cbe36ae 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > > > > > > > > @@ -101,12 +101,8 @@ ethphy0: ethernet-phy@0 {
> > > > > > > > > >  &gpmi {
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > >  	status = "disabled";
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  &i2c1 {
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > > > > > index 27e4d2aec137..a3ea1b208462 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > > > > > > > > @@ -63,12 +63,8 @@ ethphy1: ethernet-phy@1 {
> > > > > > > > > >  &gpmi {
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > >  	status = "disabled";
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  &i2c1 {
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > > > > index dc53f9286ffe..1992dfb53b45 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > > > > > > > > @@ -296,13 +296,9 @@ &fec2 {
> > > > > > > > > >  &gpmi {
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > >  	fsl,no-blockmark-swap;
> > > > > > > > > >  	status = "okay";
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  &i2c2 {
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > > > > index eaed2cbf0c82..ec3c1e7301f4 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > > > > > > > > @@ -160,15 +160,11 @@ &gpmi {
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > >  	fsl,use-minimum-ecc;
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > > +	nand-ecc-mode = "hw";
> > > > > > > > > > +	nand-ecc-strength = <8>;
> > > > > > > > > > +	nand-ecc-step-size = <512>;
> > > > > > > > > >  	status = "okay";
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -		nand-ecc-mode = "hw";
> > > > > > > > > > -		nand-ecc-strength = <8>;
> > > > > > > > > > -		nand-ecc-step-size = <512>;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  /* I2C3_SDA/SCL on SODIMM 194/196 (e.g. RTC on carrier board) */
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > > > > > index 3dfd43b32055..43518bf07602 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > > > > > > > > @@ -43,15 +43,11 @@ ethphy0: ethernet-phy@0 {
> > > > > > > > > >  &gpmi {
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > +	nand-ecc-mode = "hw";
> > > > > > > > > > +	nand-ecc-strength = <0>;
> > > > > > > > > > +	nand-ecc-step-size = <0>;
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > >  	status = "okay";
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-ecc-mode = "hw";
> > > > > > > > > > -		nand-ecc-strength = <0>;
> > > > > > > > > > -		nand-ecc-step-size = <0>;
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  &iomuxc {
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > > > > index fc298f57bfff..83b9de17cee2 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > > > > > > > > @@ -60,12 +60,8 @@ ethphy0: ethernet-phy@0 {
> > > > > > > > > >  &gpmi {
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > >  	status = "disabled";
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  &uart1 {
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > > > > index 8ec18eae98a4..2d9f495660c9 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > > > > > > > > @@ -25,12 +25,8 @@ usdhc2_pwrseq: usdhc2-pwrseq {
> > > > > > > > > >  &gpmi {
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > >  	status = "okay";
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  &snvs_poweroff {
> > > > > > > > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > > > > index a41dc4edfc0d..8666dcd7fe97 100644
> > > > > > > > > > --- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > > > > +++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > > > > > > > > @@ -375,14 +375,10 @@ &gpio7 {
> > > > > > > > > >  /* NAND on such SKUs */
> > > > > > > > > >  &gpmi {
> > > > > > > > > >  	fsl,use-minimum-ecc;
> > > > > > > > > > +	nand-ecc-mode = "hw";
> > > > > > > > > > +	nand-on-flash-bbt;
> > > > > > > > > >  	pinctrl-names = "default";
> > > > > > > > > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > > > > > > > > -
> > > > > > > > > > -	nand@0 {
> > > > > > > > > > -		reg = <0>;
> > > > > > > > > > -		nand-ecc-mode = "hw";
> > > > > > > > > > -		nand-on-flash-bbt;
> > > > > > > > > > -	};
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  /* On-module Power I2C */
> > > > > > > > > > --
> > > > > > > > > > 2.42.0
> > > > > > > > > >
