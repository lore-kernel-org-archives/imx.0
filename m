Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011058.outbound.protection.outlook.com [52.101.70.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3843128B4
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 17:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767633717; cv=fail; b=Ni4REp8aL0y0eO98d1QjtMsTNAZkY31GK+TaD+9LFBS9sxicg0YKHsyVvjAwoNhIUzcQUIj4BtL/go8bvXf3FmW8aIdSPfUYS27+HeTqIFd6uv1KvpN6XjWQwbUiP9mZIowvPArrp553tY+JWgcZ2Ns3cp3qg6kZH5A1Qt7rYao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767633717; c=relaxed/simple;
	bh=tlaSN1b2HEu+mov2zbQxs7nHjzwRLXMm/IenF0HyuLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t2y2kzFgnw/nk7sIYwZsoOhGL/TLJDs4hhZEohnVZwc4fI0cEejLdySOK/dlLmt9UIU5orNCKHaYDt17zOqXhdJyXO4BD1iI4P7G+BpCmr3N2NfGmYiakhev3sqWupo5kMifASSAoqxkyxf375Cnq06HxXK/9OosgGPuxYf+7q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Izd26wBg; arc=fail smtp.client-ip=52.101.70.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Izd26wBg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXrELvKRbpFNr2lmKxCSUMXaMTHO9UozLJs4kYJ8CVl5GJTHWJgCp6eKU0LEA3vy0hgC7fv9qG4xQFou2hv49JYS/T/qMCitUAIEzaVP7MHOkz31oKc0SxhNpmrhvmOIoOXJN8FLMW4swvgWwEdPUKlz/p6/7eCTBoTYJ8hEbQLRGueQX1CYPocmLc0YuqOF+5ztaTLqcHaniJ8OkZVx7I36h0Uh/ec0Qsx413Ui+bbls71G0TKQKWlA1J0xXf6c/sHfNiMW5Pu+lL25iXq/J+FnjxENOWj5O7lmNUV4W3subNXKEvx1BDe7x8ERRCxNdE8so6y2QyTfqcj62cctQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2FHi0dzgE+dqqPgYZfajdBDD3UVgJc3g1jEBVrDUxo=;
 b=in0f8EymyDG6ePMIZ/x02Ey4YeErqWUMBbVuqKcebnqAoAP483Of5ePmoULluz0bYw+++Te6WmiVtGsEVzIjP0zG77cNYXOrqn94SHUb7VlT5EHXJ2nZONRU7NvKJYfTti6v202PXl41bPFpQP208HEJwA/3fTbSPk3Pc8MLVVdV+P98dFTdExLjcNJmg42I4eaaNLs7qGKkd7iUDT3bKUzc4dGAaWpJ+KhphWxULPY1VA3aSNKTX03XBT1zwC+0qR5d1cZ16ICkEdQ2+V8raxrFaJZISjRKW5sP8tPa/d7s9h3dlBbH+1jbbKcL74hgFFeEE46DL2VRTJdM+vIALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2FHi0dzgE+dqqPgYZfajdBDD3UVgJc3g1jEBVrDUxo=;
 b=Izd26wBgV5zAG8GAcbXDY9mK4ADyHcj/ub/IC3Hmp669NVtfN3+KFhUG9HlRhk7nD4AU/vuu/htpfVYvFnwYBtTvR/9NgRI6EYHHIqRY2rHME82VFdNCoAVeWEk2ZKwB9qcptvkC1tdg3ggzV8ePu9SHwEZxpafNFJrOardLvMLXB6biiDVASHoVf0M0i0usBn2oIuCKJ3nM7w5d37bj6acrMZgOqEgWeMuNePx5Qhb2scpaq1YoXm34QmdnYJKJLrdEIApv3tl6hEwEqt5oNahoqPZ9wA7nqm58XUHBYPacki/40CbmFpT3UVmhMIayaBGZ2c69LxTq/+e84ehnjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU0PR04MB9252.eurprd04.prod.outlook.com (2603:10a6:10:353::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 17:21:52 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 17:21:52 +0000
Date: Mon, 5 Jan 2026 12:21:45 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp-skov: add pinctrl-name 'reset' to
 fix CHECK_DTB warning
Message-ID: <aVvzKQKjaZUVs5oi@lizhi-Precision-Tower-5810>
References: <20251229165127.4006134-1-Frank.Li@nxp.com>
 <20260105111448.slm2yqiwivx2t3vh@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105111448.slm2yqiwivx2t3vh@pengutronix.de>
X-ClientProxiedBy: PH8P220CA0052.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::6) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU0PR04MB9252:EE_
X-MS-Office365-Filtering-Correlation-Id: 387d5ca1-6ee8-467b-7b92-08de4c7eeabf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ANqCe6dEZRO1j10Qs9Tt0pthoGFwyJo3ovyW79JOt4UJu908/47hyEu+/e6D?=
 =?us-ascii?Q?kXUQ1hO2xk0qn4nIa5QpxjI9eAxyFtRhz05jcUOIclZc+1qAQezavlBm4iSA?=
 =?us-ascii?Q?T/4ZuprOFHEJpAlzhn7Q1oNvNNASAR9zxOxRcHZ8RiYi9rmreuaK1I0iOYmr?=
 =?us-ascii?Q?iizN6sAf4Oy28VkBJ9PIfPDbkgq9bl63EfyoDduA7ePBnaP+80CgnKSWw1AB?=
 =?us-ascii?Q?fvPVirUBulbc0Vw6+AQqSSc5S2zgcDWIMDuL2iV6tPvhItta+6hg2v3v0Up+?=
 =?us-ascii?Q?4w3lDT/QUYRqrhS/t5cZ4tnZPFSEEVYXGnCLT3TO/b7okr1BF1FHVmZcEP3J?=
 =?us-ascii?Q?tann6z+R/RYULgI+420Q9BxokzmQoWjXvTAWGrtpw8PjUuh2BCFHgyTKIgi8?=
 =?us-ascii?Q?RxcrUFScsY2lUUfckB4O34Z14XjNcf15zx4/W33jnEquII+Z8zvQKrgsuaZ9?=
 =?us-ascii?Q?dupZ6rIQmR6KTbjDi9O/1lXqRifRV3oBEbBSJBcti0nuog+UEc/4WbBQrRIS?=
 =?us-ascii?Q?SWNBE1prKlcyd3rIYxJrBXJ2ElRIm8ZGPgYl1Cup5dM9Legb9XoFictcuZAl?=
 =?us-ascii?Q?xF4twbXGK6o0DSVzbO7qiaUGPfbnJwypSBGUe8U+y4bpLk2k7wLI3BncAnrd?=
 =?us-ascii?Q?CkZY28bJm7ykZmX6qbuUC5jDd+ObA9lr/uuSxgCPW0Gi/zhL45R8unM+TgqU?=
 =?us-ascii?Q?HS8ipq+HswSi5vHkmyiGM4Ku5XK6tuvT4/xsQ/5fNmJBfIfhEjGCxMlBZSmd?=
 =?us-ascii?Q?zMFav8nHmEmU9w+64+OKJwaj56K5xvWXb3WdwyVWXo6BO6Q3vY5OKGO8FuWS?=
 =?us-ascii?Q?xVfIwXMghx10H5i34qkaUrCSRb5dpFwFmitSs7kbrPBQ0dorrHmjvJcHLEMz?=
 =?us-ascii?Q?E3QzoDgdQaB2NRGjFb7MlXPI64khck2h8/js9B2/PEbo9jXEA0fX0PioQ5dE?=
 =?us-ascii?Q?1yHuO0FBQ+YIUYTBULRESQD2v4WzfUyCU0+wiqCLez/HAB2TSN21Uzf+BNTY?=
 =?us-ascii?Q?leDVW8o01f5Se1PgeZUInuM/FFUARIXNTBxt0qMQ+9exYMOe9YU9gvihUDlB?=
 =?us-ascii?Q?eHt+EsdyZI3MYkOiZyLX6/xi8BGTQ+om30YeRrk0v3dhisDJCXNY7Vo909G5?=
 =?us-ascii?Q?IVNi7TrAGCvUOCcKcvDra0GfPjHmiAr72uwa+9cLLiDe4vioYSjmqDk5AZ2/?=
 =?us-ascii?Q?Z+1lvIjTWoa/aI4PKqGErwNBNSHCjRr/odJ2Auv/NaJlmnPmIulzroS4bVbe?=
 =?us-ascii?Q?LPXrEY6VUPu5XWjsx4xBo4u9oUkHTS1ZFrTuQ31eopKM880C+xCclLwyzEMT?=
 =?us-ascii?Q?d9dpoXFsUE26GM+7ncel2qt8syYSkiSibV4+SUS2EFt/zK+oYWoezlXFYKHB?=
 =?us-ascii?Q?ES4HIPJ6i3RI2PYadLgDw8W01CwtF8h91YmKOCPhED7RvPVbTSVKmAeSQPjO?=
 =?us-ascii?Q?XP66oWDpaLLoe9T8neaJMFvpfpK8k6EeA26saqez4azKL6E4eC/hNA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zc7J6yezD9LK6SMtlg5QygeY6G2PAPiRM+C8qUgXNNelC0yf+klxeJ2foL6W?=
 =?us-ascii?Q?E7W++utiRJgmgsV2ZgCP6/VS+E3HumZvVdCdS6OwKG3Ybaj9lSwwNLqFHDep?=
 =?us-ascii?Q?V/f8gXgsWD0fGBca+f20E/3bgWHoIzur8xqyne4crie417/r+tRrDzjMeNGA?=
 =?us-ascii?Q?7JlSgDqyi7oFMMS82bD7lOf/SceHrVXX4/Ct262k/5apkPfofMX/3RwT81DZ?=
 =?us-ascii?Q?fcYsIzDVwJf44QpqKCK28KS3/SbawZNGEYOyPulvPT2f4HwpEW5dao3bXTQ9?=
 =?us-ascii?Q?rDGbLEcF80clThLDfnig5D8nnwIl71uscUzi75qTJvwjlPF1/HNlP3WpgzF2?=
 =?us-ascii?Q?2IpfaWJ3eigccfEC6dXad5GkPh9ze/AGvkm0KYAkz8lmjlYC2qSGShcFSDiZ?=
 =?us-ascii?Q?OSQt7uzR+Yv0YbureFCQ3ti8xkcsK2ZARrQC5eEkvs/feddzIHKEgJ0fEQwc?=
 =?us-ascii?Q?fqpEZFxIVeQ3n1dNKqGGNp54bWOdc7JzpafaprvRvX1tR+HllyJ/xqcHCHNd?=
 =?us-ascii?Q?+VHDcfQCJDQRjgcsq2BO9NBPjh01wRYjWc+4Mao9larIW96jcYaTbDsBMkev?=
 =?us-ascii?Q?kskcgJh8tLSUkgtouSaXI3V3QLV7XsdomgCxjNprZKyFH5Z5L80Z2gkcuzKW?=
 =?us-ascii?Q?T+o1+gBo7UkuS6PVghU28BeRe2Y1R2Gi/FqxIZpWhudCR3WeI6njLnclfTxW?=
 =?us-ascii?Q?YQNILeitdsEFvnVSJ2FPtQBDBqGhY6v2l+xaHRdp5Tg6yAwbIs5jcM5PG/Xv?=
 =?us-ascii?Q?BI2xq2IcyWVcmH1Fh7Th/H7i/1FAonyPhiw987Q9d5Ys40XyN6r3sjnJJX9U?=
 =?us-ascii?Q?ERaNv75z6Qkqy30v45EtQPcLXYJrHuwS7/05Jev0vVN+XoWp+aXijEcd5N0g?=
 =?us-ascii?Q?SRkS7h2F9RuQYUrTtwDx3/M84xK3yX8MjN9Y3YH1YIXfoUKkUzgAXks6WtCb?=
 =?us-ascii?Q?khlLrg3H7V+G6tXdpAgA3iOUL2Eo4/LA5/h2M+0mhWEI+Gzc44fe+MRl10PS?=
 =?us-ascii?Q?6w5WcxoZ7BxtXoBO/a6BK7mA15jhLYoC7cBb/IylItxPw4W1zXKu47xj2wHB?=
 =?us-ascii?Q?gfmJYo+A+BK80F6CXtz3o2k9KyR3uTkfgQZp+uPJmKBIE4P0psjCZmrGQE2n?=
 =?us-ascii?Q?38B14mkJm0Wq8EbSp1xt44OaWrQh/L9lBPVvYBeP9s9183iN+q3Wbk5VTx+v?=
 =?us-ascii?Q?IyflaZ0N/GFRVv8OWB1i8p2hay3WxCxV486sagu10LUmEpIGfllLzoOAZ9fI?=
 =?us-ascii?Q?zuKN7lCYmqGCqSQvl7s3JlHLfC0tP+IGtbIhHVP9MoHL/UoEC18/Bp7Fp8ix?=
 =?us-ascii?Q?1AQQLoC9d/WxrBvALkE8/MJnhLYwhiBkL9/tDUkdvUqzBp66VFWXKpiRFwv3?=
 =?us-ascii?Q?ZmlrdVW5ThWpIy+z32kg8tQV8ocNIBMkWd4rRC8kJIcRO5tWwQGa/E76XA2B?=
 =?us-ascii?Q?t8JG9cULFDkx/TO1AANiFgUHwL5w41o8sE0g7SXo/apar32UlJPigfFnIL3d?=
 =?us-ascii?Q?2DhNr3cve7TzMkmfLON8sBvgqyt0OhF4/7/Rpv1AwJvguPGpltFVx57rYe3s?=
 =?us-ascii?Q?HmLtJjRTari9LT61vfB1ejJcK60T9iSbuKp4dcYK651B76Yj4RI7KTf79mYT?=
 =?us-ascii?Q?7O+LVvn2Q6NCsN3hLLoLIdWkqD0OcYHkadAXn5C36KBtG2AHmGvehv5RVcPF?=
 =?us-ascii?Q?xD9RAkxG11TJF8Yhhu47HCHCN57pE/9RbTtffb1yiCfRiIe0vod6p4Fnrmsu?=
 =?us-ascii?Q?p3IfV9px0Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387d5ca1-6ee8-467b-7b92-08de4c7eeabf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 17:21:52.2894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZA2C3BvCHXoOza+1+73zQHeT5fnQHYmqT+kCPOva3P9LCNKN9f80tFpexKspS7BwT8xqbxPEPxZwND0MDaqyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9252

On Mon, Jan 05, 2026 at 12:14:48PM +0100, Marco Felsch wrote:
> Hi Frank,
>
> On 25-12-29, Frank Li wrote:
> > Add pinctrl-name 'reset' to fix below CHECK_DTB warnings:
> >   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: switch@5f (microchip,ksz9893): pinctrl-names: ['default'] is too short
> > 	from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml#
> >
> > The commit (e469b87e0fb0d dt-bindings: net: dsa: microchip: Add strap
> > description to set SPI mode" force use two pinctrl-name 'default' and
> > 'reset'. switch@5f doesn't use SPI, so it is safe to use the same pinctrl
> > setting for both.
>
> please see:
> - https://lore.kernel.org/all/20251112084717.ea7fchu7jcz6dzsi@pengutronix.de/
>
> I stumbled over the same warning, but came to the conclusion, that the
> dt-bindings should be fixed instead of workaround broken bindings within
> the dtb.

I have not seen "the conclusion" at above thread. I think patch 'reset' may
be reasonable for SPI pin, which used for stub at reset. And there are not
good method to distinguish under SPI or I2C.

Frank

>
> Regards,
>   Marco
>
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> > index 020f20c8ce667..7d2fc5fdd3bd1 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> > @@ -373,8 +373,8 @@ &i2c4 {
> >
> >  	switch: switch@5f {
> >  		compatible = "microchip,ksz9893";
> > -		pinctrl-names = "default";
> > -		pinctrl-0 = <&pinctrl_switch>;
> > +		pinctrl-names = "default", "reset";
> > +		pinctrl-0 = <&pinctrl_switch>, <&pinctrl_switch>;
> >  		reset-gpios = <&gpio5 1 GPIO_ACTIVE_LOW>;
> >  		reg = <0x5f>;
> >
> > --
> > 2.34.1
> >
> >
> >
>
> --
> #gernperDu
> #CallMeByMyFirstName
>
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
