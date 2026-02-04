Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659BB29AB1D
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 15:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218895; cv=fail; b=D2JSTh0uxl3IfQyh+vWxsYV/gTxZnvU9o3d1o4viLPFiKr7OzDTNT6m9vonEC8+hz3mzLuyh5sOhqhyajmHLqhb8faUGB5rNpi1MN/kTD0dZK24/KI75Wic1Tp9XzW+PLHkJGD0jM0O7ZSzxmf/N9tfmuhWjl+u4sAbRQCtYEjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218895; c=relaxed/simple;
	bh=ZHPcyZOnrxdhyLd7D0/DGfLJWa/4DvOpcVYTQ7+h7p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eDczOvSglTFAqk1hLZx5jL2/2zrw9UWyZQXIgKdpQ8fRQvp0aFxOU88vdTgMlwwyloOBcnpg7d8+rc9iOApTISajye3Df7CV727kWgf9/QefIzU3OMM4/T7PflOzW8YtP6+JhIUALzpKYCKm1820yZN6OYtNsdfHD2A1eYRi3dc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eJdqWqhG; arc=fail smtp.client-ip=40.107.159.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eJdqWqhG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9QIMNbUAF8GHwwMReJcMT3lvI2Vuw/hJg2/qF8lZqaIQmBD05C1eh995Rv2yOP9FPKoYBiLEmAD0+8cg9DYgJ62oVNbjvOYVxkt81tWvhxpwzqBgSRmUSpPJXdGczVFKchTJwY/fOCsTNuS50/nsY0qXRMcEfp76P1ivjkapofq69rihkx2vd11Ew1xMy2FnLCH+7IX8A/45ahqKhZdCz8tm0V0qeFBmm83kznmtk6jtOfoKQNSWuD07tfuGqILwV8refye27L4gMe1hiWPUsRbpazgE42d5zHNOhFhf0xd8lwkxF0AOxYugMrjpjRF1tK3DV3UmL4JNZQLDMNHQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdeNWWgkRZsTx29xOrnbvsXuqocPnKetZsHtr5DuBjs=;
 b=Sxk3z27dfpFN6PRsehWxHzyJfc582eyfGU/uuUWrtoOdipre9zaY1D1gOgVqByY5GqbbQoBncnK64skUEAss5CQ8Ou6Ds9429h95xEApaAUpEYS5k904/67V5j5j1EDSC0LdFs0N5BDWi87I+08/GyUr5i1mUPuGt/ystA0FgLTYdbR7hVakLSDseULSYIeqjzDNW71PmuckR1siYSfyZseIip52H/CXAhykEZe/xAUzBgzN5ZqRcqV3xqnftqiVPvf2oGJl8iCS3Sy6SHMVNwwde4OsOhQqiLAS1s4pnL7tpgZacyPA/UyBvFNumqgOv6t8F3eD3UaxhHKPSbPBew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdeNWWgkRZsTx29xOrnbvsXuqocPnKetZsHtr5DuBjs=;
 b=eJdqWqhGLUVVA4ICVA9sbUGFjb9fkUxdIlmNnJd/ocB4h+kn9IQElpMmJ2Po99HWsTT6/SjQifvoO1iP8lOozMl7UJvV3ZtK2ZlTW8FKbvXQE+DOESwgU31UsrBRr+qK2TPi4Mc9XDxb6gFvgxpuD1LIjdELswM3eikemAuhvk8fS/FHvuX2k3ETSPf7iUNfdytO0iUlGWWSeULEX3BhKhTvb12dmICNPev/K91gtR8cce8HGIH7JH93U67ELxQ+XOTJVc1LOT2xQ1eUL151E7A14pcscVI+VfEQwSBKBOIDS/CmrQZDv3u4gp0N+DYIotIsLyFlXESFkPL0GKxoYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8890.eurprd04.prod.outlook.com (2603:10a6:20b:409::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 15:28:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 15:28:10 +0000
Date: Wed, 4 Feb 2026 10:27:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	daniel.baluta@nxp.com, dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com, y.moog@phytec.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, imx@lists.linux.dev, kernel@pengutronix.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V6 2/5] arm64: dts: imx93: Extract common EVK description
 into shared dtsi
Message-ID: <aYNlfyJwbhfnjPs1@lizhi-Precision-Tower-5810>
References: <20260204083551.2867263-1-sherry.sun@nxp.com>
 <20260204083551.2867263-3-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204083551.2867263-3-sherry.sun@nxp.com>
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 3174402a-93b7-48f2-137f-08de640200af
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?7omhDbfGNZ1Y+bZ6ERI6DWhCjiVtKKO4+ZxrHHtPOUqwx7pCAg7K0vJz4ATK?=
 =?us-ascii?Q?X7mJEC9IM6ZTwNQ39L7IOf7DqyxaRnwJ761zNO/Q45URJMwN4ecpckqg5a/a?=
 =?us-ascii?Q?VOzQ9FRg4dx7clU7KXuAgBKxWNE4B0cVwHrxm/HLyP7e/WsMsYnKXboAOawW?=
 =?us-ascii?Q?0cARQB30BSe7vcmOrtb2pBEEkzZnW2QdXak5n/fq/W5z1kQp4riZZ5IjUpBB?=
 =?us-ascii?Q?G4BBYYZAGc93QjEd/wieCGrEabfjUWugSuDG9snsl6UW1HbHAOX4rfvuma22?=
 =?us-ascii?Q?8AVOUhIAHQqKJqvCe8ySP8UlhpxIhCM0YtniyaGhyAPBqFy4GYx/CvvjXeoi?=
 =?us-ascii?Q?uxlunhuL9HlQ3UXYYIBzYvKeeBTenUWGUpJnxCGlEdiTI//PP4HT22JFA1hk?=
 =?us-ascii?Q?POxrXWG2C0CuliyE6+t9GLm2gDzQZHOwdZIyDV19Xdt2BetA/n1tFaIOeaGn?=
 =?us-ascii?Q?2VEsXkMdaB2o2Biv7M4NOAsVdJCLD6Swz23TRJSJm9YSFX9FGu8nes3WduRJ?=
 =?us-ascii?Q?OFXztrSdK2yCGZfjrpbPB9wacxk0iHB8r88RiRmKHd0IlKXqgDHLCmyV9+tO?=
 =?us-ascii?Q?YI61LABSPFxjMQM2fJEpSIrAs6M8Dooj4i8qlyYGsw/ACL39VeInFdAmVCsO?=
 =?us-ascii?Q?6kYXhFayGaovP220Wus/Xvw534qczrmVY/JzoROG71ljeXmLj+1CI4iAvA0z?=
 =?us-ascii?Q?atsN1jgUilNmhKc0v5uteTKVyU8RvWIKr6oiHpDjFfw4C99iPnOc8eXPgqr8?=
 =?us-ascii?Q?tqivbD10kuPdwGck6ptqh54h4tl1GXp/USJVm96Kk1zQTwZA7bQo75kHRqRt?=
 =?us-ascii?Q?0lNSt+MlIq7PjlJVpNVrydsZHE4IclX0KuV3+H45KC9wf/sqB6EDKSxzRr9+?=
 =?us-ascii?Q?ESwXo94zQWxEEVqF61bP3DigxvTFskSxxRGxfhAagidrPy0srkCM8uTyBnlJ?=
 =?us-ascii?Q?ROjPqsjy7MEBiU98/JzhXssVHSus15E9owuUh5CeDMeTdU6ceeIUgEC6Revp?=
 =?us-ascii?Q?BCKjH33e2nVkW9SI+X7KaxAIoUgH+oYgusvjKzEl8E0YuRtrL923ZcS4qvVs?=
 =?us-ascii?Q?r4lYU2VFgj9w4sAqV6ZPmpbeazjXNkPHwI74vhQno1lIvVwGc9uPX9pJ8i8L?=
 =?us-ascii?Q?DRHtHc86wXfE1p/vII4JXnIloE3znec7lje8igMvgpyQr554vjygI9BYQPJb?=
 =?us-ascii?Q?qpSRWRU8xjMP8wvO1kbMteJGbXb3jsYLSRzUVlUVL1WJ8Rb6NGe36Y3GJk0v?=
 =?us-ascii?Q?56WgaokCIddEmAaKwPygRDsG6XHaTK78buIL9iJDUA0VEnSRDZnO+eM8XdEI?=
 =?us-ascii?Q?ZWNEko7EhhAwAYla1ybxUtEVGkzSCJ6UiOY+P0uvNFiYL4QejKA+XB5e+7h+?=
 =?us-ascii?Q?GLAWSeOCLNkN/HdzlYrjVNNG/6eyI/NQftOQPKpUGw3CAxOWrVKgpss98kBS?=
 =?us-ascii?Q?k/PEuERrBmQPZyY9z+v8m+/vGQHvPzpDhLpt4M7zqdil8V3XmJfUkbo0VXnU?=
 =?us-ascii?Q?/cBrbJwaKN8+r3bxv1uCHU7ZdXre16Bv1KTN1IcDOXoe9i9zSESPd14jGZIB?=
 =?us-ascii?Q?cN47KEIe+T5k7JnpYt4IA9aRRGE67QVueZ+JonKp2eQMQMyEpbImK9lFeRxZ?=
 =?us-ascii?Q?E8DBEVeoF4hK9q4GdAQ5r3M=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?3FLH3rZgwj2r21QiZUrKshkQZIsvlrOnYQxjI2lL4yVmlaFr4L1ju5Vn/dTc?=
 =?us-ascii?Q?vTkbZ5qlTTc5/bRMqf0Vy45NXnMfTYXvSYEduToufi5CVsn8onUJKvqSGgz/?=
 =?us-ascii?Q?u6VQpmT1G1Y5iE+Adn06qk277Tv305pjpunv1XVbb6KnhqlqdUAyqYr8ab6j?=
 =?us-ascii?Q?C0cQ78fTRvbLPf4BqR+He11yPwNfUSdGp9pzXAY1AFFOfbcnPP9uaxQhN1HK?=
 =?us-ascii?Q?B1UUYfXeFabZRwtUReYNMsBibRMjo91O6tCQgfdeB2U1DQ/hrRmGXV+K4ZEZ?=
 =?us-ascii?Q?2lZS7rh6HA2esM9kVNGFmKA9/ptxG9kEK34lk3z5zuWSKc299xUYFcTBMsEu?=
 =?us-ascii?Q?KTU7C8sMDreFxBRQY46rQYW/ihn/OjVZAcmZHSCUTqiOmpmKeFK2EOsy6FVA?=
 =?us-ascii?Q?C8wXIrVlIWKrYEPIyD55N6hfnZZg9+chLeTF4qeDac0RgyTGTPs+xd8YhOqQ?=
 =?us-ascii?Q?WMoEX/Mocbu2oGaXcDpSlYmeCWs9SPnY17Ofel9YVwlnIAUBJ4I+Crl+aAbf?=
 =?us-ascii?Q?KPpLIgc59bECL1+wUir0eQSqZgmkGnKD4yFTZBqt5mSs8DUQw8a+rkHVIgID?=
 =?us-ascii?Q?oZYbxlBaAj6Au/Q9qMPVQPZ4JV7Y5AyiqziPbgsQB5WJtbXjbA8FOn2u9X82?=
 =?us-ascii?Q?xro+rbRtDe1bMmkkV1giPaLmvTL1IOSQgPgMHXBf0uik2kRt34gKGO3hT7YH?=
 =?us-ascii?Q?O+I05mwFAaz0+EXaohzLJnyBznQgOPdX/xsH+wnGjr9V2t943VZL2TA1T86L?=
 =?us-ascii?Q?0oEwR5H1C3S5tq6JOF4DKOFChtW//UgssqkODiJ9V93FKNkd9XLDTlOC+hkR?=
 =?us-ascii?Q?YuLe9zOH6QJX0xTbOQKKpltstcIpa8Tjj8XaU5VI+hnKxyXINZZlOLoUriCe?=
 =?us-ascii?Q?g6qtLxShouw1bOe3xkRDIHAeVgKVi2CObMz6WDtRDBK/zylFZk62xC5TnSiU?=
 =?us-ascii?Q?A3Cb2LdFSkTXo9Z9N8xl5TFZ4ruGk9QPvgQxe+MQ2/yh1kRozpxMyEnHBDyi?=
 =?us-ascii?Q?HBbCphRamrIG/NxmBmp9X1q+Ev2QWvhV+n8O20uyNgkv6FoK1tScKpKHq8GS?=
 =?us-ascii?Q?ttOJniAoZgBKSDnA8p7/gvstFAVaVUNZxR5m3V3DT99ESKR5EuCKnSo2pZdu?=
 =?us-ascii?Q?jMCM1WT5IRhSFFqSuOgSOhBA4/OIUXzc1/lxqltvwng5HxEcIZsDeRLwMSpi?=
 =?us-ascii?Q?3/NWRNG5CCWzuU8qhBlmvFrdBoq39wUGwdn7Q43+yijeMN3ZfpGFvo8D2iJL?=
 =?us-ascii?Q?JzCF84Fd3JbmVIh/Ye3EGFmZ8fol2/kgUHEIp270qL5BAx4HQC/NHivufqq+?=
 =?us-ascii?Q?CTTlnM2VKvzx2VWLHAeEexCLhTX0E20tOmc8Zu30MAFL3BSbrx7Ic74klzMv?=
 =?us-ascii?Q?OTSTNM60pw7E8R2oySzFZZsIvStqka3RuOKg5zEM4ICq5jU138iC8/s5BhjY?=
 =?us-ascii?Q?wx+A1NR/B3WYzoaRGqlAZg1IuigPPTyR4yS1DDSrp3TJBAE+cgBIUdy648IF?=
 =?us-ascii?Q?gAVKJXb28ZObtHYvKBMeXCNr1MDcOiU8j2wa25/FYMTwdDEpyibNVgcxWfWc?=
 =?us-ascii?Q?C2ojWZ55U0z8Klb0WOqTsOqMkbGWP38p8czL0QZB6W4kCWmGQ9LM2q3Hwa+r?=
 =?us-ascii?Q?E3b+62qf0J0Az2Z6Bdz2+uC6DidBCY+PgTvfhJZQ5RNh3iEGA4eSqThwfDvx?=
 =?us-ascii?Q?tHg4+1bkMgLZQIvcO3+iLEqwVFMjOyXXBy9a5WGCe69x7PBY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3174402a-93b7-48f2-137f-08de640200af
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:28:10.0339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTomXvfnvvld0AvKKx6K43jwia9kb6EfXjT75BwbUXS7ni/9UfLgYlQTHxzuWUbKvnIq4SIipzQXKHl9tZg3oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8890

On Wed, Feb 04, 2026 at 04:35:48PM +0800, Sherry Sun wrote:
> The i.MX93 Wireless EVK reuses most of the 11x11 EVK design. To avoid
> duplication and DTS-to-DTS includes, extract the common parts into a new
> imx93-11x11-evk-common.dtsi shared by both boards.
>
> Rename imx93-11x11-evk.dts to imx93-11x11-evk-common.dtsi and include it
> from imx93-11x11-evk.dts.
>
> Only structural changes are introduced, with no intended functional
> impact.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  ...11-evk.dts => imx93-11x11-evk-common.dtsi} |    8 +-
>  .../boot/dts/freescale/imx93-11x11-evk.dts    | 1053 +----------------
>  2 files changed, 3 insertions(+), 1058 deletions(-)
>  copy arch/arm64/boot/dts/freescale/{imx93-11x11-evk.dts => imx93-11x11-evk-common.dtsi} (99%)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
> similarity index 99%
> copy from arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> copy to arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
> index acb160d3186c..6279b8eb4ea7 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-common.dtsi
> @@ -1,17 +1,11 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2022 NXP
> + * Copyright 2022,2026 NXP
>   */
>
> -/dts-v1/;
> -
>  #include <dt-bindings/usb/pd.h>
> -#include "imx93.dtsi"
>
>  / {
> -	model = "NXP i.MX93 11X11 EVK board";
> -	compatible = "fsl,imx93-11x11-evk", "fsl,imx93";
> -
>  	aliases {
>  		ethernet0 = &fec;
>  		ethernet1 = &eqos;
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> index acb160d3186c..b88876bb7128 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> @@ -1,1063 +1,14 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2022 NXP
> + * Copyright 2022,2026 NXP
>   */
>
>  /dts-v1/;
>
> -#include <dt-bindings/usb/pd.h>
>  #include "imx93.dtsi"
> +#include "imx93-11x11-evk-common.dtsi"
>
>  / {
>  	model = "NXP i.MX93 11X11 EVK board";
>  	compatible = "fsl,imx93-11x11-evk", "fsl,imx93";
> -
> -	aliases {
> -		ethernet0 = &fec;
> -		ethernet1 = &eqos;
> -		gpio0 = &gpio1;
> -		gpio1 = &gpio2;
> -		gpio2 = &gpio3;
> -		i2c0 = &lpi2c1;
> -		i2c1 = &lpi2c2;
> -		i2c2 = &lpi2c3;
> -		mmc0 = &usdhc1;
> -		mmc1 = &usdhc2;
> -		rtc0 = &bbnsm_rtc;
> -		serial0 = &lpuart1;
> -		serial1 = &lpuart2;
> -		serial2 = &lpuart3;
> -		serial3 = &lpuart4;
> -		serial4 = &lpuart5;
> -	};
> -
> -	chosen {
> -		stdout-path = &lpuart1;
> -	};
> -
> -	reserved-memory {
> -		#address-cells = <2>;
> -		#size-cells = <2>;
> -		ranges;
> -
> -		linux,cma {
> -			compatible = "shared-dma-pool";
> -			reusable;
> -			alloc-ranges = <0 0x80000000 0 0x40000000>;
> -			size = <0 0x10000000>;
> -			linux,cma-default;
> -		};
> -
> -		vdev0vring0: vdev0vring0@a4000000 {
> -			reg = <0 0xa4000000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev0vring1: vdev0vring1@a4008000 {
> -			reg = <0 0xa4008000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev1vring0: vdev1vring0@a4010000 {
> -			reg = <0 0xa4010000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		vdev1vring1: vdev1vring1@a4018000 {
> -			reg = <0 0xa4018000 0 0x8000>;
> -			no-map;
> -		};
> -
> -		rsc_table: rsc-table@2021e000 {
> -			reg = <0 0x2021e000 0 0x1000>;
> -			no-map;
> -		};
> -
> -		vdevbuffer: vdevbuffer@a4020000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0 0xa4020000 0 0x100000>;
> -			no-map;
> -		};
> -
> -	};
> -
> -	flexcan_phy: can-phy {
> -		compatible = "nxp,tja1057";
> -		#phy-cells = <0>;
> -		max-bitrate = <5000000>;
> -		silent-gpios = <&adp5585 6 GPIO_ACTIVE_HIGH>;
> -	};
> -
> -	reg_vdd_12v: regulator-vdd-12v {
> -		compatible = "regulator-fixed";
> -		regulator-name = "VDD_12V";
> -		regulator-min-microvolt = <12000000>;
> -		regulator-max-microvolt = <12000000>;
> -		gpio = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
> -	reg_vref_1v8: regulator-adc-vref {
> -		compatible = "regulator-fixed";
> -		regulator-name = "vref_1v8";
> -		regulator-min-microvolt = <1800000>;
> -		regulator-max-microvolt = <1800000>;
> -	};
> -
> -	reg_audio_pwr: regulator-audio-pwr {
> -		compatible = "regulator-fixed";
> -		regulator-name = "audio-pwr";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		gpio = <&adp5585 1 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
> -	reg_m2_pwr: regulator-m2-pwr {
> -		compatible = "regulator-fixed";
> -		regulator-name = "M.2-power";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
> -	reg_usdhc2_vmmc: regulator-usdhc2 {
> -		compatible = "regulator-fixed";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> -		regulator-name = "VSD_3V3";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> -		off-on-delay-us = <12000>;
> -		enable-active-high;
> -	};
> -
> -	reg_usdhc3_vmmc: regulator-usdhc3 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "WLAN_EN";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		vin-supply = <&reg_m2_pwr>;
> -		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> -		/*
> -		 * IW612 wifi chip needs more delay than other wifi chips to complete
> -		 * the host interface initialization after power up, otherwise the
> -		 * internal state of IW612 may be unstable, resulting in the failure of
> -		 * the SDIO3.0 switch voltage.
> -		 */
> -		startup-delay-us = <20000>;
> -		enable-active-high;
> -	};
> -
> -	usdhc3_pwrseq: usdhc3_pwrseq {
> -		compatible = "mmc-pwrseq-simple";
> -		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
> -	};
> -
> -	backlight_lvds: backlight-lvds {
> -		compatible = "pwm-backlight";
> -		pwms = <&adp5585 0 100000 0>;
> -		brightness-levels = <0 100>;
> -		num-interpolated-steps = <100>;
> -		default-brightness-level = <100>;
> -		power-supply = <&reg_vdd_12v>;
> -		enable-gpios = <&adp5585 9 GPIO_ACTIVE_HIGH>;
> -		status = "disabled";
> -	};
> -
> -	bt_sco_codec: bt-sco-codec {
> -		compatible = "linux,bt-sco";
> -		#sound-dai-cells = <1>;
> -	};
> -
> -	sound-bt-sco {
> -		compatible = "simple-audio-card";
> -		simple-audio-card,name = "bt-sco-audio";
> -		simple-audio-card,format = "dsp_a";
> -		simple-audio-card,bitclock-inversion;
> -		simple-audio-card,frame-master = <&btcpu>;
> -		simple-audio-card,bitclock-master = <&btcpu>;
> -
> -		btcpu: simple-audio-card,cpu {
> -			sound-dai = <&sai1>;
> -			dai-tdm-slot-num = <2>;
> -			dai-tdm-slot-width = <16>;
> -		};
> -
> -		simple-audio-card,codec {
> -			sound-dai = <&bt_sco_codec 1>;
> -		};
> -	};
> -
> -	sound-micfil {
> -		compatible = "fsl,imx-audio-card";
> -		model = "micfil-audio";
> -
> -		pri-dai-link {
> -			link-name = "micfil hifi";
> -			format = "i2s";
> -
> -			cpu {
> -				sound-dai = <&micfil>;
> -			};
> -		};
> -	};
> -
> -	sound-wm8962 {
> -		compatible = "fsl,imx-audio-wm8962";
> -		model = "wm8962-audio";
> -		audio-cpu = <&sai3>;
> -		audio-codec = <&wm8962>;
> -		hp-det-gpio = <&pcal6524 4 GPIO_ACTIVE_HIGH>;
> -		audio-routing =
> -			"Headphone Jack", "HPOUTL",
> -			"Headphone Jack", "HPOUTR",
> -			"Ext Spk", "SPKOUTL",
> -			"Ext Spk", "SPKOUTR",
> -			"AMIC", "MICBIAS",
> -			"IN3R", "AMIC",
> -			"IN1R", "AMIC";
> -	};
> -
> -	sound-xcvr {
> -		compatible = "fsl,imx-audio-card";
> -		model = "imx-audio-xcvr";
> -
> -		pri-dai-link {
> -			link-name = "XCVR PCM";
> -
> -			cpu {
> -				sound-dai = <&xcvr>;
> -			};
> -		};
> -	};
> -};
> -
> -&adc1 {
> -	vref-supply = <&reg_vref_1v8>;
> -	status = "okay";
> -};
> -
> -&cm33 {
> -	mbox-names = "tx", "rx", "rxdb";
> -	mboxes = <&mu1 0 1>,
> -		 <&mu1 1 1>,
> -		 <&mu1 3 1>;
> -	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> -			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> -	status = "okay";
> -};
> -
> -&eqos {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_eqos>;
> -	pinctrl-1 = <&pinctrl_eqos_sleep>;
> -	phy-mode = "rgmii-id";
> -	phy-handle = <&ethphy1>;
> -	status = "okay";
> -
> -	mdio {
> -		compatible = "snps,dwmac-mdio";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clock-frequency = <5000000>;
> -
> -		ethphy1: ethernet-phy@1 {
> -			reg = <1>;
> -			reset-gpios = <&pcal6524 15 GPIO_ACTIVE_LOW>;
> -			reset-assert-us = <10000>;
> -			reset-deassert-us = <80000>;
> -			realtek,clkout-disable;
> -		};
> -	};
> -};
> -
> -&fec {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_fec>;
> -	pinctrl-1 = <&pinctrl_fec_sleep>;
> -	phy-mode = "rgmii-id";
> -	phy-handle = <&ethphy2>;
> -	fsl,magic-packet;
> -	status = "okay";
> -
> -	mdio {
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clock-frequency = <5000000>;
> -
> -		ethphy2: ethernet-phy@2 {
> -			reg = <2>;
> -			reset-gpios = <&pcal6524 16 GPIO_ACTIVE_LOW>;
> -			reset-assert-us = <10000>;
> -			reset-deassert-us = <80000>;
> -			realtek,clkout-disable;
> -		};
> -	};
> -};
> -
> -&flexcan2 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_flexcan2>;
> -	phys = <&flexcan_phy>;
> -	status = "okay";
> -};
> -
> -&lpi2c1 {
> -	clock-frequency = <400000>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_lpi2c1>;
> -	status = "okay";
> -
> -	wm8962: codec@1a {
> -		compatible = "wlf,wm8962";
> -		reg = <0x1a>;
> -		clocks = <&clk IMX93_CLK_SAI3_GATE>;
> -		DCVDD-supply = <&reg_audio_pwr>;
> -		DBVDD-supply = <&reg_audio_pwr>;
> -		AVDD-supply = <&reg_audio_pwr>;
> -		CPVDD-supply = <&reg_audio_pwr>;
> -		MICVDD-supply = <&reg_audio_pwr>;
> -		PLLVDD-supply = <&reg_audio_pwr>;
> -		SPKVDD1-supply = <&reg_audio_pwr>;
> -		SPKVDD2-supply = <&reg_audio_pwr>;
> -		gpio-cfg = <
> -			0x0000 /* 0:Default */
> -			0x0000 /* 1:Default */
> -			0x0000 /* 2:FN_DMICCLK */
> -			0x0000 /* 3:Default */
> -			0x0000 /* 4:FN_DMICCDAT */
> -			0x0000 /* 5:Default */
> -		>;
> -	};
> -
> -	inertial-meter@6a {
> -		compatible = "st,lsm6dso";
> -		reg = <0x6a>;
> -	};
> -};
> -
> -&lpi2c2 {
> -	clock-frequency = <400000>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_lpi2c2>;
> -	status = "okay";
> -
> -	pcal6524: gpio@22 {
> -		compatible = "nxp,pcal6524";
> -		reg = <0x22>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_pcal6524>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		interrupt-controller;
> -		#interrupt-cells = <2>;
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -
> -		m2-pcm-level-shifter-hog {
> -			gpio-hog;
> -			gpios = <19 GPIO_ACTIVE_HIGH>;
> -			output-high;
> -		};
> -	};
> -
> -	pmic@25 {
> -		compatible = "nxp,pca9451a";
> -		reg = <0x25>;
> -		interrupt-parent = <&pcal6524>;
> -		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> -
> -		regulators {
> -			buck1: BUCK1 {
> -				regulator-name = "BUCK1";
> -				regulator-min-microvolt = <610000>;
> -				regulator-max-microvolt = <950000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -				regulator-ramp-delay = <3125>;
> -			};
> -
> -			buck2: BUCK2 {
> -				regulator-name = "BUCK2";
> -				regulator-min-microvolt = <600000>;
> -				regulator-max-microvolt = <670000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -				regulator-ramp-delay = <3125>;
> -			};
> -
> -			buck4: BUCK4 {
> -				regulator-name = "BUCK4";
> -				regulator-min-microvolt = <1620000>;
> -				regulator-max-microvolt = <3400000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			buck5: BUCK5 {
> -				regulator-name = "BUCK5";
> -				regulator-min-microvolt = <1620000>;
> -				regulator-max-microvolt = <3400000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			buck6: BUCK6 {
> -				regulator-name = "BUCK6";
> -				regulator-min-microvolt = <1060000>;
> -				regulator-max-microvolt = <1140000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			ldo1: LDO1 {
> -				regulator-name = "LDO1";
> -				regulator-min-microvolt = <1620000>;
> -				regulator-max-microvolt = <1980000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			ldo4: LDO4 {
> -				regulator-name = "LDO4";
> -				regulator-min-microvolt = <800000>;
> -				regulator-max-microvolt = <840000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -
> -			ldo5: LDO5 {
> -				regulator-name = "LDO5";
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <3300000>;
> -				regulator-boot-on;
> -				regulator-always-on;
> -			};
> -		};
> -	};
> -
> -	adp5585: io-expander@34 {
> -		compatible = "adi,adp5585-00", "adi,adp5585";
> -		reg = <0x34>;
> -		vdd-supply = <&buck4>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		gpio-reserved-ranges = <5 1>;
> -		#pwm-cells = <3>;
> -	};
> -};
> -
> -&lpi2c3 {
> -	clock-frequency = <400000>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_lpi2c3>;
> -	status = "okay";
> -
> -	adp5585_isp: io-expander@34 {
> -		compatible = "adi,adp5585-01", "adi,adp5585";
> -		reg = <0x34>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		#pwm-cells = <3>;
> -	};
> -
> -	ptn5110: tcpc@50 {
> -		compatible = "nxp,ptn5110", "tcpci";
> -		reg = <0x50>;
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -
> -		typec1_con: connector {
> -			compatible = "usb-c-connector";
> -			label = "USB-C";
> -			power-role = "dual";
> -			data-role = "dual";
> -			try-power-role = "sink";
> -			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> -			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> -				     PDO_VAR(5000, 20000, 3000)>;
> -			op-sink-microwatt = <15000000>;
> -			self-powered;
> -
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> -
> -					typec1_dr_sw: endpoint {
> -						remote-endpoint = <&usb1_drd_sw>;
> -					};
> -				};
> -			};
> -		};
> -	};
> -
> -	ptn5110_2: tcpc@51 {
> -		compatible = "nxp,ptn5110", "tcpci";
> -		reg = <0x51>;
> -		interrupt-parent = <&gpio3>;
> -		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -
> -		typec2_con: connector {
> -			compatible = "usb-c-connector";
> -			label = "USB-C";
> -			power-role = "dual";
> -			data-role = "dual";
> -			try-power-role = "sink";
> -			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> -			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> -				     PDO_VAR(5000, 20000, 3000)>;
> -			op-sink-microwatt = <15000000>;
> -			self-powered;
> -
> -			ports {
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				port@0 {
> -					reg = <0>;
> -
> -					typec2_dr_sw: endpoint {
> -						remote-endpoint = <&usb2_drd_sw>;
> -					};
> -				};
> -			};
> -		};
> -	};
> -
> -	pcf2131: rtc@53 {
> -		compatible = "nxp,pcf2131";
> -		reg = <0x53>;
> -		interrupt-parent = <&pcal6524>;
> -		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
> -	};
> -};
> -
> -&lpuart1 { /* console */
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_uart1>;
> -	status = "okay";
> -};
> -
> -&lpuart5 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_uart5>;
> -	status = "okay";
> -
> -	bluetooth {
> -		compatible = "nxp,88w8987-bt";
> -	};
> -};
> -
> -&micfil {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_pdm>;
> -	pinctrl-1 = <&pinctrl_pdm_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_PDM>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> -	assigned-clock-rates = <49152000>;
> -	status = "okay";
> -};
> -
> -&mu1 {
> -	status = "okay";
> -};
> -
> -&mu2 {
> -	status = "okay";
> -};
> -
> -&sai1 {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_sai1>;
> -	pinctrl-1 = <&pinctrl_sai1_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> -	assigned-clock-rates = <12288000>;
> -	fsl,sai-mclk-direction-output;
> -	status = "okay";
> -};
> -
> -&sai3 {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_sai3>;
> -	pinctrl-1 = <&pinctrl_sai3_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_SAI3>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> -	assigned-clock-rates = <12288000>;
> -	fsl,sai-mclk-direction-output;
> -	status = "okay";
> -};
> -
> -&usbotg1 {
> -	dr_mode = "otg";
> -	hnp-disable;
> -	srp-disable;
> -	adp-disable;
> -	usb-role-switch;
> -	disable-over-current;
> -	samsung,picophy-pre-emp-curr-control = <3>;
> -	samsung,picophy-dc-vol-level-adjust = <7>;
> -	status = "okay";
> -
> -	port {
> -		usb1_drd_sw: endpoint {
> -			remote-endpoint = <&typec1_dr_sw>;
> -		};
> -	};
> -};
> -
> -&usbotg2 {
> -	dr_mode = "otg";
> -	hnp-disable;
> -	srp-disable;
> -	adp-disable;
> -	usb-role-switch;
> -	disable-over-current;
> -	samsung,picophy-pre-emp-curr-control = <3>;
> -	samsung,picophy-dc-vol-level-adjust = <7>;
> -	status = "okay";
> -
> -	port {
> -		usb2_drd_sw: endpoint {
> -			remote-endpoint = <&typec2_dr_sw>;
> -		};
> -	};
> -};
> -
> -&usdhc1 {
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> -	pinctrl-0 = <&pinctrl_usdhc1>;
> -	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> -	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> -	bus-width = <8>;
> -	non-removable;
> -	status = "okay";
> -};
> -
> -&usdhc2 {
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> -	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> -	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> -	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> -	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
> -	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
> -	vmmc-supply = <&reg_usdhc2_vmmc>;
> -	bus-width = <4>;
> -	status = "okay";
> -	no-mmc;
> -};
> -
> -&usdhc3 {
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> -	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
> -	mmc-pwrseq = <&usdhc3_pwrseq>;
> -	vmmc-supply = <&reg_usdhc3_vmmc>;
> -	bus-width = <4>;
> -	keep-power-in-suspend;
> -	non-removable;
> -	wakeup-source;
> -	status = "okay";
> -};
> -
> -&wdog3 {
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_wdog>;
> -	fsl,ext-reset-output;
> -	status = "okay";
> -};
> -
> -&xcvr {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_spdif>;
> -	pinctrl-1 = <&pinctrl_spdif_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_SPDIF>,
> -			 <&clk IMX93_CLK_AUDIO_XCVR>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>,
> -			 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
> -	assigned-clock-rates = <12288000>, <200000000>;
> -	status = "okay";
> -};
> -
> -&iomuxc {
> -	pinctrl_eqos: eqosgrp {
> -		fsl,pins = <
> -			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
> -			MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
> -			MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
> -			MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
> -			MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
> -			MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
> -			MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x58e
> -			MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
> -			MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
> -			MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x57e
> -			MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
> -			MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
> -			MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x58e
> -			MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
> -		>;
> -	};
> -
> -	pinctrl_eqos_sleep: eqossleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_ENET1_MDC__GPIO4_IO00				0x31e
> -			MX93_PAD_ENET1_MDIO__GPIO4_IO01				0x31e
> -			MX93_PAD_ENET1_RD0__GPIO4_IO10                          0x31e
> -			MX93_PAD_ENET1_RD1__GPIO4_IO11				0x31e
> -			MX93_PAD_ENET1_RD2__GPIO4_IO12				0x31e
> -			MX93_PAD_ENET1_RD3__GPIO4_IO13				0x31e
> -			MX93_PAD_ENET1_RXC__GPIO4_IO09                          0x31e
> -			MX93_PAD_ENET1_RX_CTL__GPIO4_IO08			0x31e
> -			MX93_PAD_ENET1_TD0__GPIO4_IO05                          0x31e
> -			MX93_PAD_ENET1_TD1__GPIO4_IO04                          0x31e
> -			MX93_PAD_ENET1_TD2__GPIO4_IO03				0x31e
> -			MX93_PAD_ENET1_TD3__GPIO4_IO02				0x31e
> -			MX93_PAD_ENET1_TXC__GPIO4_IO07                          0x31e
> -			MX93_PAD_ENET1_TX_CTL__GPIO4_IO06                       0x31e
> -		>;
> -	};
> -
> -	pinctrl_fec: fecgrp {
> -		fsl,pins = <
> -			MX93_PAD_ENET2_MDC__ENET1_MDC			0x57e
> -			MX93_PAD_ENET2_MDIO__ENET1_MDIO			0x57e
> -			MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x57e
> -			MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x57e
> -			MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x57e
> -			MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x57e
> -			MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x58e
> -			MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x57e
> -			MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x57e
> -			MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x57e
> -			MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x57e
> -			MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x57e
> -			MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x58e
> -			MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x57e
> -		>;
> -	};
> -
> -	pinctrl_fec_sleep: fecsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_ENET2_MDC__GPIO4_IO14			0x51e
> -			MX93_PAD_ENET2_MDIO__GPIO4_IO15			0x51e
> -			MX93_PAD_ENET2_RD0__GPIO4_IO24			0x51e
> -			MX93_PAD_ENET2_RD1__GPIO4_IO25			0x51e
> -			MX93_PAD_ENET2_RD2__GPIO4_IO26			0x51e
> -			MX93_PAD_ENET2_RD3__GPIO4_IO27			0x51e
> -			MX93_PAD_ENET2_RXC__GPIO4_IO23                  0x51e
> -			MX93_PAD_ENET2_RX_CTL__GPIO4_IO22		0x51e
> -			MX93_PAD_ENET2_TD0__GPIO4_IO19			0x51e
> -			MX93_PAD_ENET2_TD1__GPIO4_IO18			0x51e
> -			MX93_PAD_ENET2_TD2__GPIO4_IO17			0x51e
> -			MX93_PAD_ENET2_TD3__GPIO4_IO16			0x51e
> -			MX93_PAD_ENET2_TXC__GPIO4_IO21                  0x51e
> -			MX93_PAD_ENET2_TX_CTL__GPIO4_IO20               0x51e
> -		>;
> -	};
> -
> -	pinctrl_flexcan2: flexcan2grp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO25__CAN2_TX	0x139e
> -			MX93_PAD_GPIO_IO27__CAN2_RX	0x139e
> -		>;
> -	};
> -
> -	pinctrl_uart1: uart1grp {
> -		fsl,pins = <
> -			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
> -			MX93_PAD_UART1_TXD__LPUART1_TX			0x31e
> -		>;
> -	};
> -
> -	pinctrl_uart5: uart5grp {
> -		fsl,pins = <
> -			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX		0x31e
> -			MX93_PAD_DAP_TDI__LPUART5_RX			0x31e
> -			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B		0x31e
> -			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B		0x31e
> -		>;
> -	};
> -
> -	pinctrl_lpi2c1: lpi2c1grp {
> -		fsl,pins = <
> -			MX93_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
> -			MX93_PAD_I2C1_SDA__LPI2C1_SDA			0x40000b9e
> -		>;
> -	};
> -
> -	pinctrl_lpi2c2: lpi2c2grp {
> -		fsl,pins = <
> -			MX93_PAD_I2C2_SCL__LPI2C2_SCL			0x40000b9e
> -			MX93_PAD_I2C2_SDA__LPI2C2_SDA			0x40000b9e
> -		>;
> -	};
> -
> -	pinctrl_lpi2c3: lpi2c3grp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
> -			MX93_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
> -		>;
> -	};
> -
> -	pinctrl_pcal6524: pcal6524grp {
> -		fsl,pins = <
> -			MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
> -		>;
> -	};
> -
> -	pinctrl_pdm: pdmgrp {
> -		fsl,pins = <
> -			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
> -			MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
> -			MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
> -		>;
> -	};
> -
> -	pinctrl_pdm_sleep: pdmsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_PDM_CLK__GPIO1_IO08			0x31e
> -			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09		0x31e
> -			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai1: sai1grp {
> -		fsl,pins = <
> -			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
> -			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
> -			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00		0x31e
> -			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00		0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai1_sleep: sai1sleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
> -			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
> -			MX93_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
> -			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc1: usdhc1grp {
> -		fsl,pins = <
> -			MX93_PAD_SD1_CLK__USDHC1_CLK		0x1582
> -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x40001382
> -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x40001382
> -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x40001382
> -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x40001382
> -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x40001382
> -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x40001382
> -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x40001382
> -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x40001382
> -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x40001382
> -			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x1582
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD1_CLK__USDHC1_CLK		0x158e
> -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x4000138e
> -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x4000138e
> -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x4000138e
> -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x4000138e
> -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x4000138e
> -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x4000138e
> -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x4000138e
> -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x4000138e
> -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x4000138e
> -			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x158e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
> -			MX93_PAD_SD1_CMD__USDHC1_CMD		0x400013fe
> -			MX93_PAD_SD1_DATA0__USDHC1_DATA0	0x400013fe
> -			MX93_PAD_SD1_DATA1__USDHC1_DATA1	0x400013fe
> -			MX93_PAD_SD1_DATA2__USDHC1_DATA2	0x400013fe
> -			MX93_PAD_SD1_DATA3__USDHC1_DATA3	0x400013fe
> -			MX93_PAD_SD1_DATA4__USDHC1_DATA4	0x400013fe
> -			MX93_PAD_SD1_DATA5__USDHC1_DATA5	0x400013fe
> -			MX93_PAD_SD1_DATA6__USDHC1_DATA6	0x400013fe
> -			MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x400013fe
> -			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
> -		>;
> -	};
> -
> -	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai3: sai3grp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO26__SAI3_TX_SYNC                0x31e
> -			MX93_PAD_GPIO_IO16__SAI3_TX_BCLK                0x31e
> -			MX93_PAD_GPIO_IO17__SAI3_MCLK           0x31e
> -			MX93_PAD_GPIO_IO19__SAI3_TX_DATA00              0x31e
> -			MX93_PAD_GPIO_IO20__SAI3_RX_DATA00              0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai3_sleep: sai3sleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO26__GPIO2_IO26			0x51e
> -			MX93_PAD_GPIO_IO16__GPIO2_IO16			0x51e
> -			MX93_PAD_GPIO_IO17__GPIO2_IO17			0x51e
> -			MX93_PAD_GPIO_IO19__GPIO2_IO19			0x51e
> -			MX93_PAD_GPIO_IO20__GPIO2_IO20			0x51e
> -		>;
> -	};
> -
> -	pinctrl_spdif: spdifgrp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO22__SPDIF_IN		0x31e
> -			MX93_PAD_GPIO_IO23__SPDIF_OUT		0x31e
> -		>;
> -	};
> -
> -	pinctrl_spdif_sleep: spdifsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_GPIO_IO22__GPIO2_IO22		0x31e
> -			MX93_PAD_GPIO_IO23__GPIO2_IO23		0x31e
> -		>;
> -	};
> -
> -	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
> -		>;
> -	};
> -
> -	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x51e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc2: usdhc2grp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK		0x1582
> -			MX93_PAD_SD2_CMD__USDHC2_CMD		0x40001382
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x40001382
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x40001382
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x40001382
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x40001382
> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK		0x158e
> -			MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000138e
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x4000138e
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x4000138e
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x4000138e
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x4000138e
> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CLK__USDHC2_CLK		0x15fe
> -			MX93_PAD_SD2_CMD__USDHC2_CMD		0x400013fe
> -			MX93_PAD_SD2_DATA0__USDHC2_DATA0	0x400013fe
> -			MX93_PAD_SD2_DATA1__USDHC2_DATA1	0x400013fe
> -			MX93_PAD_SD2_DATA2__USDHC2_DATA2	0x400013fe
> -			MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe
> -			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
> -		>;
> -	};
> -
> -	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD2_CLK__GPIO3_IO01            0x51e
> -			MX93_PAD_SD2_CMD__GPIO3_IO02		0x51e
> -			MX93_PAD_SD2_DATA0__GPIO3_IO03		0x51e
> -			MX93_PAD_SD2_DATA1__GPIO3_IO04		0x51e
> -			MX93_PAD_SD2_DATA2__GPIO3_IO05		0x51e
> -			MX93_PAD_SD2_DATA3__GPIO3_IO06		0x51e
> -			MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3: usdhc3grp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
> -			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
> -			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> -			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> -			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> -			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> -		fsl,pins = <
> -			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
> -		>;
> -	};
> -
> -	pinctrl_wdog: wdoggrp {
> -		fsl,pins = <
> -			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
> -		>;
> -	};
>  };
> --
> 2.37.1
>
