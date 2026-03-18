Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5088430E855
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 22:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773873652; cv=fail; b=OBfBIu5D81gR+XMQVZoFRMyxR3tIuk38VpJqWX5ncaKg9c/88u1QM+AsPP/YTib2sa+7K4yk2ljJQ2c1DFjeVXC5XklsPqVAhO/AKyFrsrEqZkR0otPSP1TQ6lGkryL3feUyCegAICJOG0zc/ZWm1CKrctYGyVG4j2bAkoLlDeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773873652; c=relaxed/simple;
	bh=9jP2RiTDYQBSd/EoQ1mrXem2NkysbGE0GB9wa7XcBV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HZbh8hrUhdlcajocHFmu4wngZWXKqxPtktt8ZEZ81m2zkA0yj2kMIkC2Zvy0S9QEAYeRKm+KlbJcFIkOcB8EuVMk8Ck/nQ1vYVOoDRN0DlLd+YXH4FK0GyFOLOTK110qppmADP+DTfQijuRtFRO7nt1hXpurhVB6rvDw2/5nJZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aBQ2xHkZ; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aBQ2xHkZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2xOPNKq+ORbDMb531m6WNzTzaT0FQFwIAuGHIJKZJgwx4iQ7xayVylUpscUTtISG1kL0E3ngLa9oKncTcTGTvZWIF/oBn983qZK3YIpa1zmmgsunCLwvLNDMyIm5tPMTRaSTPSzk8FfS2sKf6dOl8H8LaqCgFnk+tocngjhgCNDVNr2PuuTuv3g+F4CAOZeAt17h2pqoA/ZAi9kUeFkVchwnFdSUkVgJgRN8sltx2W2ZEtaAOHi3KkBlhJH/jjjY9QgfmoJ5RivxX3FOPaJdipF4tTpoMzbmHahbQ/on18mqx1TPUabDsQ/RCgsihmYJp31inVXiX5YyjKb0DCLzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSgoaGqAg5YZKx1+s5xjt5LCr6OezfaBOTv1fTz0DxU=;
 b=Blny1gWh0YW69ymF4TenmPIcKbOgEfGN61PfZhqxiqH7G+UH8HoQ3fSVoS4Td5iKPhC4mwFcKc0SYD9qRzR3nyEUNUrU5Z1sDHa4Bmz8vny5XdPrBTDdsUq+CgMgggg7i2omRHJoTvLOJxbcf5PNR+hTLVtqsIxTaSj32GCQlVSVZuMsQHq46dWNIPFOgvRcRfeONYfGD/Ytjxp2cpzthsoNgkTFBQuCTvORc34Mcu7SBT9FYj1FSBA+s2iIrHoTo0J+GyOQbiYrlYRCq2tWfyUqFZe4HDLfcoP13/z8KVFxZaWcBmrQCp9CkY/dTEuYH/c2hLeo+qO3eypsYZa3Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSgoaGqAg5YZKx1+s5xjt5LCr6OezfaBOTv1fTz0DxU=;
 b=aBQ2xHkZSoETPNOCI/5BfAO8jfT3tQio9jqyP3YLGz0lXqPKP6yrD2wyFZl05LaoBx1L1raOHVy1ZSQR3IAEi8elXZ4/sfNayfVwbz6w6dlknEg0yQiKpoGW6j46967uTQATUJ2f7vMZEx+Hz6lABKOSgB2/3tjDVmcM3647EbJ+iW8FVNZlniKzODi8El2RHsmvj72+Sg1fYai9EjHENsonIrxRUOX/BLnPFN1PxS11dw65ufX/rW7lSpM3ZU12X4Hq6kO3VqkLhK2+ScvoF9BPI7WfXJ40QPXQqhrgCuHCnh9DsxbVUkbapvDevFv8vGssPGgaOJXhjpu5qf7VvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA2PR04MB10471.eurprd04.prod.outlook.com (2603:10a6:102:41f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 22:40:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 22:40:46 +0000
Date: Wed, 18 Mar 2026 18:40:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	hongxing.zhu@nxp.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95-15x15-evk: Disable PCIe bus in the
 default dts
Message-ID: <absp5jdSsyAdLUCH@lizhi-Precision-Tower-5810>
References: <20260317031024.444157-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317031024.444157-1-sherry.sun@nxp.com>
X-ClientProxiedBy: PH7PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:510:339::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA2PR04MB10471:EE_
X-MS-Office365-Filtering-Correlation-Id: 597a1d59-0f3b-4aac-3c5c-08de853f657c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|7416014|1800799024|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	havxL6RPhF/8B5sXVxVwnTa6AOlunRVIqgmpV3OHh8+k/uSiCqvGR6qTlTN3YOHG8Ev+0Eu4+gnlceO5HiFsN776KeohtYjRG1xbOJR/7uj1UQjka/aHp0xO+zgpTOKEXfe4g77rptMBP+U+pXKsg+vD2k4r6Ho9DpKr6SZlkr94+B60Yx9P2OwIvM6YfqcXY5U8a5KD55Fd3MxapwJq3c9ZR72BdK6SNYqhrDX/3wJtdPDKI6uf/RuDBX+GvFtkimPIA/WIkWRArJLx2fWsXEok3HWz7il7Ml30SkwgbYDgW+i9sPephekoLifpRqZGOI4TuWiu09JEAemoL2tNM5VKQKekf6zFI74O4L67w4bqavXTh/d7NxnoDEPP49yKYFE4cyX45sIdJO9hZLIhAe7lB6O895N3dCtY3wTDnbWVkxVLxywlmFTjyCzD/XwPRZOaZIauxPOQ0encjGnNR4vUaSTi8EKVHrZ6kBbajpnSd31Q/lcrs9DELFjdyY3xX+YmLweGJ9Ay4R2JCW5mKYuy9rk8Vh9ojpKDGqm0gCqzqQBSzQYER4X4ZSyZQoF9P7IH7K6RJHCK0OBsq81GesbRovBRVfs+OZ7na67h9Ow2jGTJjiLhWc3FEpOWJX+5HGNB5bznxL3k04DR6FPNjA4yrMqSBD5XfnEd1EVgb3bv2cTVW5pA1GBDtwx+ZtBRi4+vDODgvHEASL6YpU5XLVbfkvTL97pocQLYO1KM2U9CUoN7JxsUGZ+JPWmlmadE0mNuzNXtdFxP4QJ9hqlZXuiF4wHQgQD0x6xbGYUFs10=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6laRSlqi1m5mv5cpPE9qkYXIDe4g1Xg/+wZhgbi3KiTSnkWIK+l97mChjIPU?=
 =?us-ascii?Q?EU3gXtKhGBjDO24eagEEwsE21wYcuvy4ux+cObC30ngyDrdDcMNIlY3Gmdo6?=
 =?us-ascii?Q?Qnx1mUKC7QUTqeHesRMq01P13vylJfmCJZlBg9CEh+fm0+lXWY12yNy0mdZC?=
 =?us-ascii?Q?AQa+NcUbAsZ7mwuxmjY4m/NyRv2mcMfXDTvbo39Bwrk6vhPk1Iq41P0LpW+A?=
 =?us-ascii?Q?x4AUFG+9O5vPoMFbgRhGl+vQjQFxBT/Wah2EiW3brwtB0g7ztL95lpR+IoJM?=
 =?us-ascii?Q?XDjTt44ANmiArGf5TwfycwsqRhQo8z+36ASoXQzNm2SKCtUy/QuT2ePWZm58?=
 =?us-ascii?Q?+3r2qPFYnsAfhN0GtXk353StOFYoEiaV/RxGWJ+c3SzUXv4vq7a1uUP/RZx/?=
 =?us-ascii?Q?uKQa2QKjpbYs56rSS0u5otM9nl8C/EffOGra8dtkohOIPm1f+6z244ggMgG1?=
 =?us-ascii?Q?MuQEScLcPzjF/czX38GftoyOSCxGdWM9YNvKsUY9YhlN/xF2V8xgzLDh2lBJ?=
 =?us-ascii?Q?XYf42EsFFcVelD7R4L4g1QwsO1bVOGc2bl8hQk0x/y/s+HlZTf0raJCoZhUQ?=
 =?us-ascii?Q?pYMrxpRUr6+jWFZJfrnaJV8VXp/jG8FkeGCShEaXIsF0017audPFErNno7US?=
 =?us-ascii?Q?yBuh+lxp4poXYLUMCoyjfgdtl3Tl+sOpHhSe8ApFd/oDX1u854sCfcC1q5kh?=
 =?us-ascii?Q?EW5FClQBQh/MavJNQSz60S6jwjYbNN/oJ58LyiT2K/TdtFR43ikryPKT8e4u?=
 =?us-ascii?Q?jqK+F2jGuZWEgpQgmJj1/Lla/LQW2J+xgoBy3NUQi4XQv5HbHZx7+rH+oLwy?=
 =?us-ascii?Q?0NNwwCPi2A3YQQ6ZvsqAc863p2u5wK7NYilL0lw927bD50+GH3OBAYHaeGM7?=
 =?us-ascii?Q?Es99BVgqpMWFgUnvPW+mKiiCHOpjXCYhEV6wIV/O2Dnnj1PifE+dkGTchmT9?=
 =?us-ascii?Q?5BjiGagPc6Cd4zkmprnRXmHgqP0Z5/QWf7S7BKQ/qaw3QGqjzQdJkVPjimiv?=
 =?us-ascii?Q?vHy/XnXdcmXgxPXUsjzU9aaDyuWqfZpG86/GGNvAaeqg2Mtfz1B1bvLhbVs3?=
 =?us-ascii?Q?VcDnBdTw6+onOnGN19pqGT/yxxQFMincgJQjCbCYHyo+OI2sOrT/NExupjiH?=
 =?us-ascii?Q?/KaS7WxwKKdpD8q1dKEIGYHVJeQRJaM93DjO0qtABsWOhwqJ5rQyDhXfKVs0?=
 =?us-ascii?Q?eZg+NBymKErFt1IIdDWVjxUrTG5SuA9DmY3tbiVp6Yb38VXj//PFni05JlL2?=
 =?us-ascii?Q?wTVNjwx9P9+B/ueSD6UqSKu875QJqu6DO/aHdfKtiJCw+A7+v8XTA69X4Oos?=
 =?us-ascii?Q?lTt0EnYAUwdM2iw9THeNDg5CNQt+fmreTj+kRFgCObIzrEHmOjcCPZw1Qi+N?=
 =?us-ascii?Q?aqf0wFXUAL5PNs+vJE3CxGRymbC8b8Kw+x+I7yMFjnVfqfA0UOEjm7ujnTs4?=
 =?us-ascii?Q?odni1xEYXj/rPUUSkZeEjZ3Uz6/DDhYzSrvMuluzEi7lH0xLiwngELuvv0K4?=
 =?us-ascii?Q?5zEUzYv9Z6D3BS4fQPZ4gIAjUsyckRdhModQwsbYg+JthEbCW8uxNGni/GcP?=
 =?us-ascii?Q?Qo+ghReZBraRd9ba2NvwHHdMyeAfmZr2KNcc2G0znx0mH/TBr1szikMi/Ca2?=
 =?us-ascii?Q?l05QISJeY64vC7Rq8kWX+3KdQlBqupc59fnyiISVGOlg/ZwF/OReJ/M5LHhp?=
 =?us-ascii?Q?cr9tfXmTxPeSmQRH6tsI2Jlj1zMQ5mwkJKva+K5TbghP2QlSOZiHwVsighp0?=
 =?us-ascii?Q?7fseIIRBkA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 597a1d59-0f3b-4aac-3c5c-08de853f657c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 22:40:46.7482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFNavz6KnPOTbVdJfpOoEy0vklUzGz9iDlNVMGfXExIjj4m1QmjCL87tshzwY80ytmVffULc93N5M0THDtf4lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10471

On Tue, Mar 17, 2026 at 11:10:24AM +0800, Sherry Sun wrote:
> Disable PCIe bus in the default dts to avoid the shared regulatory
> between SDIO and PCIe buses, the random probe order between the two
> buses may break the PCIe initialization sequence which cause PCIe
> devices has probability of failing to detect.
>
> Enable the SDIO WiFi in the default imx95-15x15-evk.dts, and add a
> separate imx95-15x15-evk-pcie.dtso to enable PCIe bus.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---

Why SDIO WIFI is default one? Generally, PCIe have better preformance.

Frank

>  arch/arm64/boot/dts/freescale/Makefile            |  5 ++++-
>  .../boot/dts/freescale/imx95-15x15-evk-pcie.dtso  | 15 +++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts |  2 +-
>  3 files changed, 20 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index c4e790a268ae..505efc9ebd58 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -471,7 +471,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
>
> -imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
> +imx95-15x15-evk-pcie-dtbs = imx95-15x15-evk.dtb imx95-15x15-evk-pcie.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
> +
> +imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk-pcie.dtb imx-pcie0-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
>  imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
>  imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso
> new file mode 100644
> index 000000000000..42384e6233f3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtso
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	status = "disabled";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> index 7eb12e7d5014..afd89ce3cc5b 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> @@ -557,7 +557,7 @@ &pcie0 {
>  	vpcie-supply = <&reg_m2_pwr>;
>  	vpcie3v3aux-supply = <&reg_m2_pwr>;
>  	supports-clkreq;
> -	status = "okay";
> +	status = "disabled";
>  };
>
>  &pcie0_ep {
> --
> 2.37.1
>
