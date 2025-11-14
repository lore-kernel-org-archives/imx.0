Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013043.outbound.protection.outlook.com [52.101.83.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751C72356C9
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 16:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763139412; cv=fail; b=B52vG8c7Zij6gDa7rcok9P1dMBqUY0Gi5gsDAXM0gUoEP0m+xjz//vKTa2vGmUnbfwlky1VXN3YaD7PfuNbN5ZAg1IXXjtJXqHQ+vqZNSPzfT2JRyQ7Tfq/XVSmLpUcSmR0dOsk71q16/JCacToz70ye9jGMdtrOZ1QX/9DHDN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763139412; c=relaxed/simple;
	bh=XTQxXHUCGv241CctMkog9yTawnouxbuM1Uj/GPDyllM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=F1QACytErabDywUvaj57Ac9R6c1z6BaJwwsxHhiMeY4hmByExet2zAI/ILO2InNamaDI1jitj1HMeTLJ7rIEn0cLZpZqWcSYkjriEp+bobbxBOexx1e+QtsSOdD5sFImG9iG2iQlxck/FMgrWTTC0RAv+XsmvlAfBLgRzJjnwic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bIFClWLS; arc=fail smtp.client-ip=52.101.83.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bIFClWLS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRiThRsATw0WP4GGwX1Vzc/B6TO27ChxdOHSJV3CyU/WDRx0x8/vCR3+Jujb58VcxYzq22dpkpWDJewk6EFL6OT8Ckn9BBQ/1bT4csSQgXI3Yol3rieJ8nt4U2ahl16JnHy3hWPJHeBuSh5rbjat7/ozuZhw7hHfvsW/kRZvCH0FQScrPP9y7a5y6l8R+yKUxrtqOf7l+pklIrhsnOAHfA/Zir/y+WtaL/s6jeE0Flx8ZDzquglut0UGnRj7XfP6H9keP8XlDUkU3w6Z9sFX8zuoSUH8wA94kwWpaK8mYdTXzB8CKMVlRtN3PuhriCTmbQbv3PCoTV1LeaSiYk7V1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IFFl+PcYax86RL4UXsm0WHPJC17ukP44anrElAp3kg=;
 b=l2lipc00in1OXi9gJMrWocIRStjaxKk3GXfS4sYCaFurJ8IV1pZpPMBZh5V/fjf13poQyXBYiyNY6hSEhficOHRtI8a+A66KVvv1eLKumVDwgTPYIZkW5ICJnmXjknUy4zya+L6assDiUAG9f2fsY97MaGRrdTXHuwK8vCVUPBxQLt3O/4BbjNOhmlZiMKBhxy07/iwtjYmcVAszZUHYqSPWGNQS91tvF4lp53fD3/9IUFZqfsmbE9j0dX1Wsb34R1h5WD3B/cqEkxJyVrHoC0mpbehW4qiSkP9G7lPzGqcJITqRnqJw7xhwQzM/mCe+5tn2ipVyouZgBAmRtG4whQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IFFl+PcYax86RL4UXsm0WHPJC17ukP44anrElAp3kg=;
 b=bIFClWLSzIsvw0LRGiIb672EAun6mehESqqKU5bFMQ+SQACRzvL0WmnjkCnhEfIGS2OrPS0D2jJnqlIjtigKtnVLCl6b9nC3Ix6f8BNUrSxpAyatvNULQ0W9HasXeaty+NOwfILNpNButvLhkKA6jL0c5YOgowbiv359Yy1bOJZJrLIJ0U3Ml4UDMJfeETcKQr9TBd/hRyPJ8XvfixfFoepUewAG9ENU5VH7LuSqeYQs0xqxUynbWmFOGMMbYAKj/4+VZsshJVEG2w9TKt2pI/dbaG52p2GT9KYJq48qaUKGR6l2DvdsCeQul5wjqLneTofN13j4BIeYkkSIdpEBUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS5PR04MB9825.eurprd04.prod.outlook.com (2603:10a6:20b:672::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 16:56:47 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 16:56:46 +0000
Date: Fri, 14 Nov 2025 11:56:39 -0500
From: Frank Li <Frank.li@nxp.com>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/5] ARM: dts: lpc32xx: add bus surfix for simple-bus
Message-ID: <aRdfR89CNvk7QRm8@lizhi-Precision-Tower-5810>
References: <20251029202801.3963952-1-Frank.Li@nxp.com>
 <af66cc8a-051a-4512-9a02-468b17550775@mleia.com>
 <aRdWoQ/vPplF0aQA@lizhi-Precision-Tower-5810>
 <03494fa4-26e6-4691-8fa6-5bd99c2c25a1@mleia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03494fa4-26e6-4691-8fa6-5bd99c2c25a1@mleia.com>
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS5PR04MB9825:EE_
X-MS-Office365-Filtering-Correlation-Id: d1abb935-32f6-4aab-5f10-08de239ecb92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Mh37MtHq4OD4VBch1t0kKIDZLj2VvBfzH7fTqSX2gjHjJ+m3EpHsrcfs6pM8?=
 =?us-ascii?Q?Rrtuf+3Eoq6dM4ILfe/nHWXKyTdPUJbUyP0akG7myeMEaraW75xi6llNN549?=
 =?us-ascii?Q?8/9RS0/Yd/J9GfizzJ/Z/KJCWgnewi3DLnb4rscvbAweYsjuBhISI2I+hRUG?=
 =?us-ascii?Q?VyrkQdKPH+UN0+FblJghwmj3AB9Jq67jmxoccRlCE6VaPjJD5mTH4UHj65PQ?=
 =?us-ascii?Q?Fu0SC91oJL7hRrHAf53tWSkVpBYmCkNp3psXoFmMhOkBc3ZMVfb9TGgxBuwF?=
 =?us-ascii?Q?fp/BHKNGi4fB4OCdsN6CCF3t/rpQphHooSMyZcI9MlwfCI/XiP4MexBHEWxc?=
 =?us-ascii?Q?kNofiiLfCt7EIklLAFHq3Wi+easxJdSjoPDEROn8MBLv/QKOpixxUJuLZukX?=
 =?us-ascii?Q?8BYq385/v4RqeWzCa79GJxi0eQFxYlWsvwqiNRAjiY7RBo8S2bvAJ56jb7YQ?=
 =?us-ascii?Q?Nc0AxjtVCWYO7lDMqarwNRJB8SBlVztsSNKVDZf5dO++ZqAlY5U3b0abGe40?=
 =?us-ascii?Q?JZmO0+on3Oefl9vS7SKhKpLYxivL9CRw0ynZMUf+sFeZlKZoauq/SNNxhUxq?=
 =?us-ascii?Q?PUfT3KtlZDsWige4Tu7NCZxbGrVzhqSmLaTwTiqT90w10e+sJuev0VZ0FdUk?=
 =?us-ascii?Q?3TXSOwhqMdzjh7SiUp+PHk4EF4iy/z2DeDG3QprQ6SX5xk3YQpXmRhoyKCoa?=
 =?us-ascii?Q?R9ZhbVf4b2wFjn5L8PdCucZf5V4z1cO9EJE8+Z8vgUJV3QN023YMQ+fcX4gX?=
 =?us-ascii?Q?xrzPoXMii6KTcCQQgkMywxaWb78o/T4Oit3Fecc6eQ/hg8/tp7r2ceA9ic+J?=
 =?us-ascii?Q?6cNnuuafnXtvgivtj+7hjCZ2uGtWBsfFiHKd54aI5sIKPGUF047XeHcRvNLG?=
 =?us-ascii?Q?ZU9JRSSdyaqSggIi5h07P0SvY0Wq4TW9ETZugPCk9lDKOthpGjBeTOAlWG29?=
 =?us-ascii?Q?G04a4/+IZtZXdVy/tVgObfjIYPBhWswz9eDAOrw2CTD938kL5gDTqpGDOYvo?=
 =?us-ascii?Q?8ol/tmVTsA33Fkdz76flVNzHNiA6AsCXPN6+hNDMmE/ZjWUDGdlezLkv2xHG?=
 =?us-ascii?Q?+vOD2H4Nb8psYpLEOxUF/s5LXRmeF76+4V7e621WfM5HZrnsL9yHei0z8enB?=
 =?us-ascii?Q?926JF3KkXaQRbdj2helK1HQ/XkyzlxTNABdnSKu7zN7yFNyYa0XnMB8SP3R2?=
 =?us-ascii?Q?A3FjXk/8dQOR1T2d/A780jRIyQCVwPKbnI1m17AH9RPIBC8Ge/XsnbWN2425?=
 =?us-ascii?Q?c8vu+RMZKtdvcSQGYVTFWo9i+SDY+7IUvun23pfJJiNB1RXYI/mtXDcsla81?=
 =?us-ascii?Q?R73jXwTu7dgg450AtWMjT7Zvr2scw9QuFsg+/rP/wtR+3uaRgHBMO23Mmp5/?=
 =?us-ascii?Q?I1rp+7jRWlmLnNGuGt9OJdG1WJBqwh7dtFMEzA8IweB9pK7pmoy0aTIRRWmJ?=
 =?us-ascii?Q?8lCzbRSa7rwE1MKZPN7nnWOrkloSPHNT9JBF8Fj7ydBzweBir8TESQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1Mn18Q3YSY1gC3TXW306jcSstO5k5HlAVp7GSxnUosvx23BRVJlwsznT9NrZ?=
 =?us-ascii?Q?ReNRb9iy7rW3J8Xh/SE3/7LhNatxMME+1X0/QJbt0+2XahDZil001vouK3ml?=
 =?us-ascii?Q?7/HwazAK13Wfu2iS260Nug8xLa393H5VjszvghQ7Y015DdRhcGZgI2b4Tk++?=
 =?us-ascii?Q?sx0PVisW9i7NoRNIZq/ikmlr21UlteHreV+DUuqFHDhJwj4FaSSxVgf5Nmcy?=
 =?us-ascii?Q?vRlYExujCVdVXd7On4RRFF9K5rvS8dgjl2By6G38K9WRw0mfw4AbrI5kiMkj?=
 =?us-ascii?Q?zZlPuy0t9+9KL+kLUGlRdykTaoVQBch2JrjyJYrsI7icWMRGGARCr9VjT0Sa?=
 =?us-ascii?Q?2TC69wPvSHGL/2nUbcvaYiMkaPhB8UaODIhX7ihPSTMIREkxx3MHjk973MSj?=
 =?us-ascii?Q?hclCDWD5+rp3DwvMqk2VqVgczWsevv8Dct9ZBstOq5VaVqxH3E66bc9TKik5?=
 =?us-ascii?Q?gyM15Eshu55WKUbz5FdgJ8SqP1O8HcjglAycvm3fyGaCjJXMypG8DS/k3luh?=
 =?us-ascii?Q?ZmpoKdSSKdlmRKOLvntknBph3iqnkaYLIh9STLV8Lcp1jb8lNvFZx9I5ohsB?=
 =?us-ascii?Q?+t/gidgkhkd7keEnoLZlccC6UmqJd5mwcQStvuplHWCF4Xy4dniDmbrE6L9o?=
 =?us-ascii?Q?dA0phYCyUb7AKGanyCDYnnPTRQpnnwzOTuUnk2V0MsxA7g9srkbB7HnFMwZU?=
 =?us-ascii?Q?uDF/HzXVpc/S2AgRQ4275cOA4KQInXtX+ERfPutmkaRLkXMZ3FhHPOEZ7U0Z?=
 =?us-ascii?Q?wY2bv5tkLytgSM443+YPl2+Stvy781tzARS2MlbMA/ygsexlpnYCksB/v+0X?=
 =?us-ascii?Q?Pc3phefvgAdKYXzBMoXjTl7Ve7ldt65tY02SzCNTnZA3cp1OlAe75iE7MSOT?=
 =?us-ascii?Q?LQO++RP1+W6Z5MHLsOHqyaFZN2c3x4Lb4LcPCxVJVDXYT81qUVf6GrOaVlJN?=
 =?us-ascii?Q?MjoHz2Xug6hg+XnTMdZFEmDjxkKPfCPcwk1AvHxa2mH10V+IFgpc2XQgvill?=
 =?us-ascii?Q?DxH60gk0zHWilvxD0Ue91E6fv1ZzGUn71UgpJA627N+I6ndDFB88q6jCOYVL?=
 =?us-ascii?Q?0ERhqI3HCjrKhZHFTrjewULu4lsCe7Q6PYkQpOIYs6l8m+rTRn3SwotwaJXH?=
 =?us-ascii?Q?MALps9H0G8prNS2JYQFdH/YwvGnyXrLAumxsiziagj6pQ24D3lFyd/v6dQHS?=
 =?us-ascii?Q?5uqxAkU/aXUDpc21b4zwVElerZL+vkPgYyC/Vkw/gmyKk/rrjyy4PGTJw2tA?=
 =?us-ascii?Q?hgqXnNuJubcdkj7//0124fMjKziOBxPHdPnb3NGZ1zk4dqfjHTtnbQHUfy6K?=
 =?us-ascii?Q?rCGj7gylw5yNj9J0TUGmNTu7fbyJUYW1jKIi8gD8APSsEbcILzN8vnqPWHjy?=
 =?us-ascii?Q?ZCbMRB0bvmz0rVotImYTfxo4qwWyurHv83Gh1gCp7MPky2sEc2k+jY5+NPIz?=
 =?us-ascii?Q?cccU5iujJdpHmgoM7uuBZydS9QTxpLA3wGcy6UWeHszGHr1+wbRm4h9zdLdR?=
 =?us-ascii?Q?SozoaEDgQ3Ljr4evCxeUs/DlIqbG85ecYxSBpbXGT27RdJoGUOb6fmKP3ekS?=
 =?us-ascii?Q?x8mDk5kSnSzlJptCoCqeBYFkC9gNRJkV7NAd6tfR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1abb935-32f6-4aab-5f10-08de239ecb92
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:56:46.1868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GeJ3EANSqN7/syha+AeuzuhLehzHsF3dk4vYeIWAaLYRd+VFfKnk3XyBGpHUFBrAwPnTKT+l0+ljgg4DC5iW8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9825

On Fri, Nov 14, 2025 at 06:44:03PM +0200, Vladimir Zapolskiy wrote:
> On 11/14/25 18:19, Frank Li wrote:
> > On Fri, Nov 14, 2025 at 01:55:50AM +0200, Vladimir Zapolskiy wrote:
> > > Hi Frank.
> > >
> > > On 10/29/25 22:27, Frank Li wrote:
> > > > add bus surfix for simple-bus to fix below CHECK_DTBS warnings:
> > >
> > > typo in the subject and in the commit message above, s/surfix/suffix/
> > >
> > > > arm/boot/dts/nxp/lpc/lpc3250-ea3250.dtb: usb (simple-bus): $nodename:0: 'usb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
> > > >           from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >    arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 6 +++---
> > > >    1 file changed, 3 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> > > > index 2236901a00313..9790b0a1d6537 100644
> > > > --- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
> > > > @@ -86,7 +86,7 @@ dma: dma-controller@31000000 {
> > > >    			#dma-cells = <2>;
> > > >    		};
> > > > -		usb {
> > > > +		usb-bus {
> > >
> > > Device nodes under "usb" should be just elevated, the "simple-bus" here
> > > was used only to group some controllers together.
> > >
> > > >    			#address-cells = <1>;
> > > >    			#size-cells = <1>;
> > > >    			compatible = "simple-bus";
> > > > @@ -307,14 +307,14 @@ mpwm: pwm@400e8000 {
> > > >    			};
> > > >    		};
> > > > -		fab {
> > > > +		fab-bus {
> > >
> > > FAB shall find its place in the AXI/AHB/APB/... list, isn't it?
> >
> > what's FAB means? It is too short and hard to find exact information
> > from google?
>
> You may find UM10326 "LPC32x0 and LPC32x0/01 User manual" document online,
> LPC32xx is an old and simple SoC.
>
> FAB stands for Fast Access Bus, it's a bus behind AHB to FAB bridge, you
> may get an overview from "Fig 3. LPC32x0 block diagram, AHB matrix view",
> and "Table 4. Peripheral devices on the LPC32x0" lists all FAB peripherals.
>
> So, FAB is very similar to APB functionally, could it be just another
> name of APB?.. Likely we won't know for sure.
>
> I'd suggest to send a change, which adds "fab" to the list of permitted
> device tree node names with a "simple-bus" compatible. Or let me know,
> and I'll do it myself whenever I find a minute for it...

If only use by NXP, I think it is not easy to add it. There are too much
similar vendor specific bus name in other Soc.

It is local in https://github.com/devicetree-org/dt-schema.git
dt-schema/dtschema/schemas

    pattern: '^([a-z][a-z0-9\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'

Most likely Rob prefer use prefix.

Anyway, you can try if you want.

Frank
>
> > > >    			#address-cells = <1>;
> > > >    			#size-cells = <1>;
> > > >    			compatible = "simple-bus";
> > > >    			ranges = <0x20000000 0x20000000 0x30000000>;
> > > >    			/* System Control Block */
> > > > -			scb {
> > > > +			scb-bus {
> > > >    				compatible = "simple-bus";
> > > >    				ranges = <0x0 0x40004000 0x00001000>;
> > > >    				#address-cells = <1>;
> > >
> > > Here "simple-bus" is also unjustified...
>
> --
> Best wishes,
> Vladimir
>
