Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB83A2D5C91
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 15:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770219146; cv=fail; b=Pt5ARryb4rdNAKLWB2IByEZePsYDxlsBaFdZ28G/cWi7OptW31Poun5R+zGpWW1npstaYeQWr20zrANdwHr2W5CIot/RRDoRhttMPiYamuUa/fU2QvhARfHk1M9VtNDgJjzN9j4IJIrKpCQqjQAemO7TIOTy4axhFjJs1N9tcOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770219146; c=relaxed/simple;
	bh=nfEycP4uLpUEafr2q2157WexT1Q7mUCbTBnSyymk5NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZGoLoEvOelCqpkdI1i95aQ+Ai2i90g5KlO6D6ZXoKlxwZFu2Nk1l2I63uR4U8bb9rqixhY9V87ZwjWkCOF0e5UPJQOyc6LolfMACWCucNGF5dnkprhJUW8tI+3lEJL+JGD3nKpzipnp3XoYCVY53DwnzPrdXntPcWqQ1rHFV32Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SvOmR6Qe; arc=fail smtp.client-ip=52.101.66.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SvOmR6Qe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkRIfO3l5MsEZ0ZQuJQmikIfq/ijlJAgdfXfyDkd/1nsX+hfb2QQ3+tYEiGHJz8+E8hzscCxD4wInHaz78krqEBF4WvbJ4UYI4bEc4gIf47zaIXQfppjfMuLKa7fXoDqGzzy4CSi1PE63+rTOp51Pb7galc/djzYQlSRQQSP1lr6GMArVgmEuA5G5jsgfVUnqCbxIGT7ql4dmlp2mvLJYz6XRflQ/ic3XXkovVMO3hF8Y8c1gr34l87pKE9JzHI2wYGkDrZCJBy6TAdAHtEQmMPY22LmKKIYjB/bsHZUIIoVoCLK1SJUhHO24LZRij5ri0zvv2aD1/pOJE9OY8zn3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bF8XFBkj6HlRI+qeYgiBZUMbL31oe82h8GawiyGQa4=;
 b=T0ofGBVPQ1Dflt7p6VkQ6YJ5xYIqt1XyB2xS8kjpHoUJiBwGE/w1eSUlswaZwoxMfwysxGjCMY4tpUfMK1KwWA0pMuFX8bk0KBWROtJrMwh51gBfXpbcJT78HwCVhLn02nmsCR4/Etb1odMrycOM4dmWQbZdIOwxBeQ8a4goU49xhORbyeEiZclq6qX4lnBzZ8j5xq4H15UVz6H2U5CiwsKI682FsaOWOXcg6YJwWowbMoIA6EsDSvwDSJPgryJjYi1wBwlAnZfRRiM5d4mTsWN7a3jHE3hRY/YRCCz1EvmBA9WW+EI2xhn+1F0Gb1/fuJ4p6y2bt/a4Yy4nrRlVPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bF8XFBkj6HlRI+qeYgiBZUMbL31oe82h8GawiyGQa4=;
 b=SvOmR6QeuuhNGm77Fv0sjhD1mWZP7gwZuOha9Mk578EEI6Mnl8RMfAiwViMeERNEW5i1lj84Vf099oXasjTo4llKqsfN9vas9OPSu1QpmBCYeqlzURuxhz86nZhCLdbVxs+qQIOO+kViUMFJWczZ/WoDpawIZY5mQxRmMcoO26GdQg3OXIgiV+cUQ9ipnV94EMMdWl7FhIo1qGfMa5RxxNQJm43SllbdZFDMpbQS76WHmphmrY0XatSKV9NBzzLMflZrO0K4Y0skX0Je30gmOqoX6rmLE35JiEDEloYkbz/qIeVf58WucY/J0YvGLdZJsQvu6gmv5fuiEUny0A7cjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7598.eurprd04.prod.outlook.com (2603:10a6:102:e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 15:32:22 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 15:32:22 +0000
Date: Wed, 4 Feb 2026 10:32:13 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] arm64: dts: imx8mp-evk: Enable pull select bit for
 PCIe regulator GPIO (M.2 W_DISABLE1)
Message-ID: <aYNmfX8MlT8EDVgq@lizhi-Precision-Tower-5810>
References: <20260204023204.2382433-1-sherry.sun@nxp.com>
 <20260204023204.2382433-2-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204023204.2382433-2-sherry.sun@nxp.com>
X-ClientProxiedBy: BYAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::36) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: fce9f75a-803b-4bff-5482-08de64029748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?19bbZu5cEEZiVbJ/KA3gbEYl4beZHmgdMKUsMH+62GVG1OaynEaY6eINQhfA?=
 =?us-ascii?Q?g0Ne5R/BtGbQg7w6AVgroWfza8pfTtaj3CARSJr13ZuuWLsKXwU9EWTp58jY?=
 =?us-ascii?Q?8tICLT6xt4O6VZmcy9SeEf/9zXb+mQFi9CojGF6RRWpaywbPh3WLy7k1c0UN?=
 =?us-ascii?Q?b4aWSjUAxE2E0I8IZnjgYAm5Fv60EuHT0A1cQFdBi2Ook3Xf6IFU3CBSddnc?=
 =?us-ascii?Q?q6sH2h+WIpaK4vGAmtfA3KI0iD78IUQmfJ83zShQOy8DoUBkSZGPe5gcVSel?=
 =?us-ascii?Q?tC9PRfWfKmCjUmrdKKZoP1B4kFuP3dBq4q2jVI5cyWbTshKXSYBSupbOWCjj?=
 =?us-ascii?Q?6nwyJ9RVXGaayqeWU1JCx0XmoyY4S5+T0WuuMrKfhhmH+YoZnhp63gpnzRqF?=
 =?us-ascii?Q?gQpkOkuOz5GwrYxnsGWAbk5/Cm12wkS3wmsl6m7vfAor6g0hDmavESL6NKn/?=
 =?us-ascii?Q?N1SGbe22J4ldXD2ob8fNGDq4QZBS1/n2KGtPDnu/+z9vQuDhAHRmXpmVERK3?=
 =?us-ascii?Q?13mMWH2xlq4Tg9x15xsufANV/Ptz/BYX2NuUx70SJymFszyrNRrAQP0nvU6J?=
 =?us-ascii?Q?d+p1YqIjAVxngzmbkMBXNmnEKKMmmiXhqv2dIqepHLMqA/RySxNYQWm4mGvz?=
 =?us-ascii?Q?2zRf3DWrZ7YEesa00wDrFv3nXFrGcyote2cG6tYl0ohiZOwKQR4+Zx7O6eaM?=
 =?us-ascii?Q?V2laLfcqTw/LuPqVnIHhs5wB9OXjb45k4gx3XyCwbchn2+kQvPhBnaXUY0hV?=
 =?us-ascii?Q?RpWKcO1j7Eg+MgZe258Dc7cexArd3i019O7TKaBnUuXKtjoMT2oSdaPOy3e9?=
 =?us-ascii?Q?lqdzePJ+vot4/Ppe0+3WNt0RNXyhCm4Pjzdsm09yhiwjIg37dlCvYNOHK64v?=
 =?us-ascii?Q?zxFi6Km/tiU91lnVP8XfJu6JmC+2e2eIRQHbJUoaoDrD8hiEA9gPNNpY4vjv?=
 =?us-ascii?Q?dpEskI900SDIActGecLdudB41flMSEH0h0ykN2aaQyQ5Z4jYvfY1UjFgDNOe?=
 =?us-ascii?Q?rTkznetxcHyZ6D2x1dfpktLxAPfsLJZlyCVTy1yvnsBCqk7S5gWrEv/Pg3NC?=
 =?us-ascii?Q?c8qq2V19D2+FMVTZdBFL/6b77xehk5juK7H2akGMjZlttAiRorRJ9wP2/Hwg?=
 =?us-ascii?Q?y39ipunTePB4GXZkHrN19eR1sE6WZOWRSExTQU/U3wYuRPNiod+Ou0VgUzRz?=
 =?us-ascii?Q?Zuo3qBbHac97WU+KrVqlCgs4G/Z4c1rEgViw7nw7kEPZ+hfUQU1L5iTXZXT7?=
 =?us-ascii?Q?cS8rcDJ4O60lBUYVoglG7311YxmN969MBAmf/K7j9nu/uReuAcnyq4W9Ly9R?=
 =?us-ascii?Q?AePMkld8HsoX5/Dbqs/xG9AuH1Hw638fq6D8oeuGGQlFOb3E0OE4FosmMErn?=
 =?us-ascii?Q?TmaDGtbeNnQoHwswdSGu2xfYkfysCS21XOVQ+pYi8N14f4kfVPCAMylXK0RL?=
 =?us-ascii?Q?fbXNhwRHaa7JWRs2Bb+rrNXAMTIqTbgzYVtxjj+gq6duVfjoXNCb5zJZT7cZ?=
 =?us-ascii?Q?8TVVWRgtyIU4v1Cj6MmuWP6yswahqzdEaVD0r5Or9vB8AUrO/OJSVkGcKAVo?=
 =?us-ascii?Q?1mr10D5WePd3KYd7fso6J8hdgXxJDD3PYdG9wJ/D2D19NB/f/zb4gqXEirI2?=
 =?us-ascii?Q?kZ9mvKKxBgwC90mxdKOQDEE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rIUZlKniTUNh2CeyfuHSwx1bxprKYEqjQKqG7Z0Nfm6SEveDP9f8KAGCHpK/?=
 =?us-ascii?Q?se3m1DjbDscCLpBFPYik2C8nVA+rYPUMM6wXBDmf/koVzxzV8mGXuzvT+vgu?=
 =?us-ascii?Q?WLNbI2NPNvSrMnuGHT6EVz+7idF1q5qyBvbz9A8Hv+cpl5Do64F5IptZdFwF?=
 =?us-ascii?Q?qejmPXXNQ1RgkdjSaq3SR+UBertJOdKbi0mhnQ5SMutRop+Rx+IghmkkLjxU?=
 =?us-ascii?Q?IZeei8PPZiAvGjgbvKLFSxNd/poIVAu6MxlGhDR4WetIFV585DZSeTA2olf0?=
 =?us-ascii?Q?NCefB30/O5SVtafDspQozlQo7+ITeCeWIynLnaM2JrNwtCt6y84HfiiYM5Qv?=
 =?us-ascii?Q?poWFipLtJFTbbgZZPJbWD2lETIG5kNRr03KTcQUYMQtD9VXnTddY356VCNoV?=
 =?us-ascii?Q?hlQYG5vwL5fVCMNUjCCdKc8j4JSRTHryMuKGn1klpjNdZ1D1/1B81NpQXUnL?=
 =?us-ascii?Q?74/CfchGUlcFNkdmQ8QAhdnl/jnClOVVxE49PZfbV6VggTV3RUcXmCSvVBQM?=
 =?us-ascii?Q?DevW98uwlmOVcapBong2q2K9NkK5u0UAcj/Nkl/BJBrit3jrUQ5EjPxboP91?=
 =?us-ascii?Q?fSKY5CfRGxmitl7hpnAdFQUzxKm032L43ahHh+EwRK3A4fItWtdsO3EiJjPL?=
 =?us-ascii?Q?Gu1W4jMzKUEvv594tGqPXZaaKS3ixdQKiC9qZ6SSaoPe76KQ97jnznaXW4Di?=
 =?us-ascii?Q?QSxF26STPhktRQ90WQRtUuTwgyZJvN7Z2lu9M3Tus/Fz8mM/E8cTWhm/trhi?=
 =?us-ascii?Q?zXJeF/rhxRkSdomHD/OomrazvZv+Pznc/0Y3JPBnQHJNvhTLF2V8DsFUrKhy?=
 =?us-ascii?Q?Vc2UsHVWt99XkhIrPKdhw0jOQPHXd2qb3nq8KKA+ROtNTtBG5KKhwbdfSSj8?=
 =?us-ascii?Q?54NWLmZX/8TVFNHRO88rBoY+g/NuiACtRvWbSjFIINI4T2y8V9hNlfKJGJTA?=
 =?us-ascii?Q?hTeKdQDkECylRoStqnRSr7eizwXFDZVRtIkFdc8rRL4eA2U8eQDP3XjpPp7W?=
 =?us-ascii?Q?IQpp3MnxJhNh8MHbYrTa3WZMFokbn4zsiNDudkbXzLhDyiedpU47f27NdiXD?=
 =?us-ascii?Q?PawEmNJmMv1FYH83OAFl4U/4Gq8l4Ev3dom6mIgVEQ+TdgfbjjRJ/XstdYQh?=
 =?us-ascii?Q?xcs+FJOkHIxqnwErH03BnfEE+TuMS3YDi5qPf3uxF2z1EPL/lziTnRaXErTu?=
 =?us-ascii?Q?3umc2Hisgvcr9SQZGJCZhy5Vy45Ta8pw1XEn8dVIFoKibXBcPWF8JpzQVv9t?=
 =?us-ascii?Q?4iD/6WEgRsPDFuEtYOZY/rzybhHc0qmF0NO/0mGvk27SPFg2gGJuALouaD6o?=
 =?us-ascii?Q?j3FFQzssE8zoITI2wxR8sdr1paqUoxVn3gabcgmAkPidg/hXHswQkZ7kI3Iq?=
 =?us-ascii?Q?vRCIx6CkyEE4CGtQ01/C9U6lI7UQRGbzoJx95TZ0oFMNmNq1C8GVtCjXWLhL?=
 =?us-ascii?Q?W385RiorEGLAqho7eqVq3X1EzEDwfKyuS5TWZZXRpxz76Af4qt071jrvAQ96?=
 =?us-ascii?Q?sekWmPxRz+H7WUore/k5PWmQsoWTnyz92djGVGwOl7wLy73SDi6zogVqItMN?=
 =?us-ascii?Q?wtqpZrfzHJeejs+bgfSQdGnghqgutXoj+E4Zv7BNBZOft9Zl6cfm4TU7akas?=
 =?us-ascii?Q?pXavbJYz/Obw7t2cY0nCKe9Tokxmr6O8BH3Owx2jMXF1WlJQvdf1KjJTWrAt?=
 =?us-ascii?Q?wKRLVQFGlsWak2NxKYEo55bh2ULdIw3Z9bGNu2+coattXXQdf/co6oPm3AZa?=
 =?us-ascii?Q?RVVHmept4g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce9f75a-803b-4bff-5482-08de64029748
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:32:22.5581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhfZv90ch85jie21RidcIqZSSIrOUUace3WgEthAFDmuVLaClY9RtVijpuu5YvbREI94VqVO8FFWvK2WRq6Gyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7598

On Wed, Feb 04, 2026 at 10:32:02AM +0800, Sherry Sun wrote:
> The current pin configuration for MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06
> sets the weak pull-up but does not enable the pull select field.
> Bit 8 in the IOMUX register must be set in order for the weak pull-up
> to actually take effect.
>
> Update the pinctrl setting from 0x40 to 0x140 to enable both the pull
> select and the weak pull-up, ensuring the line behaves as expected.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---

Add fixes tag

Frank
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index 3f9b3fab8ac3..a1269c7a6cc2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -1069,7 +1069,7 @@ MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07	0x40
>
>  	pinctrl_pcie0_reg: pcie0reggrp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x40
> +			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x140
>  		>;
>  	};
>
> --
> 2.37.1
>
