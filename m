Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013020.outbound.protection.outlook.com [52.101.83.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A533314B62
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 19:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292488; cv=fail; b=X/zUyVPQJaC3BAoa6EO7BPJr4m/5XXnqDSEM5+gSbOUoDa2AWKD/BRrouhFdA2ZFsmvkBYlH3orIyUapfRag1ArGYJYOlkqFuaPt8q2axeuRGBTonGHDeBNUXAk/58WYjJoWPITqY7RPpXDUjWy901cg3lz5kbEKa9ESh+nBQZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292488; c=relaxed/simple;
	bh=8ntltlmEDGiKfftznpDVeJCCDBTDnLDCr4SEA1RGcCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Y3Gd8E2JwZ6c0C1JRtKiaZPJnsCmhZlUpgi/i3kxCkNMRkmuWGR6iM7NStOYpzQGHsd6c4vI1QPyH4NOMYfy6Lda4wGz1V386Ym2gwM46YrlsO/8Xi4rLcAzfpnUcb05MxaHFBYjqYDSazoEKcaI9n/QHYyR6VHwvbYITpBT0uE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UJX01gxA; arc=fail smtp.client-ip=52.101.83.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UJX01gxA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LnD2+Pq1lLnieXV+7673xZzms3oWWOFa0L/TWl3+WgnnqzpktFSHjQE7JcBaxfIf4Q4nd2jtw6ovx2hiqEXhtyxVAMvhe9pFGUBV+sTNR0VDgCjlN7shBHpV15Hfoz7dJyfjS2UZvLNu0Ir7baSX3S2HBo+o2XpDcEv28tcSD3vooFPz3Bi2aldVYqvaYJt0P0fA4AAPtu2Wt3qw3kf1p/aDW81cC473GKCEFIKVKJGsm9SIZTPbkONyPmCM93x5xqLk/gPmdhgdWYugU+1AJhxFg7Oyvoc11/BnQwWmImzUkiQ2F8mcMGKp+e81NMHpAt1Amjz3AlQWxw9+QWONEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiFmhG9kaKcsf2GFmrm9cIFK+Zseo+zICK3TsuM5V3A=;
 b=N/eyQk4hYZD1sHf3fEYaxKi/febSICega05SMIUPGN1i6Q4w7DAAWEiZdd3fQXfKml7EaEqQT4/w7IPbdvyIMLHhPONyvvHLSFnqoLlFxr2vY+aBPwE/CVwodyqAd7H+9SrIRZ2YPJWtOXzV5vyQlmJqPe0q5Z+BJ1vKm7Ga1obSBJll/T/RRiO3NUpMS0XHRRApzHJmQKasqALiCALvrrxJ083/sNgthWOEzRkMfXnJTsNBIEPqCKPstuT3CNqu3e+xxCqLTiB0Edu1xLX6kRBKl6z2DLsfN8EGtug72aLQ1kcYbkJeh9VXx/Ldoeho8e2bhWhf+UH94Pf8Wj5jVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiFmhG9kaKcsf2GFmrm9cIFK+Zseo+zICK3TsuM5V3A=;
 b=UJX01gxApt8Hj3bAdUDiWTzcRom+aLQrQXEvh167uHtzESc7f/cDGyWMOWXj+DqGNF3eL/U/PPC3SayNvfun4uM+ZJ7gfHwJqq8U0PNN6cbuhCQdZn5VkZuZvf96lZ1SRsLE0R2KBQTChjWZUby7avrvW0RdmlJjtydgz2eMwqDu2WhKKXbUpkrOuozWybL750685CNNIB52FODm2tO+7pX0mqZ874W99SEWQ/o5R+LC3+gCYCdQCjUjJnK3A8ZL61olqOEXMOzDVec3DNe4Z0KVB39sN+dAGq+DXyOyqydzSIL3tIOvfAvs1HTeVX8yHwG/kq39Fh25fYnmQ129ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10782.eurprd04.prod.outlook.com (2603:10a6:800:25d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Mon, 23 Mar
 2026 19:01:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 19:01:15 +0000
Date: Mon, 23 Mar 2026 15:01:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	hongxing.zhu@nxp.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64: dts: imx8mp-evk: Disable PCIe bus in the
 default dts
Message-ID: <acGN-QsB65Kbs7Gf@lizhi-Precision-Tower-5810>
References: <20260320090353.1483418-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320090353.1483418-1-sherry.sun@nxp.com>
X-ClientProxiedBy: BY3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:254::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10782:EE_
X-MS-Office365-Filtering-Correlation-Id: 36188318-ecac-433d-30d4-08de890e8ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|366016|7416014|1800799024|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	uOT+rQD7e3VltdgJfsmBDrL82QXuLYCYY3e94G82J6sz1PAvzZO/fKL3yKDhjNJVF2HSl3lh7JNf3QI0u8+1hUtHojTrfe8nW8Gyv5/hnr7o/UVJ+cBoezmstTROoINZQuO32iiLcqMcSxgmR4d9H+uzfNbGNtQq7UP3cqsgjMbCZZzIB3Uws3O5OCYsk1ApVq3OtGY4aBFaJjKGQSRGC0tYd5eu6ueYgmEvuA3+dnfHXwwKEmJb0ojAXIuHj4Rh2FBm1VNQ8cp1cwkuy6W92eaPiaOkFimUHmfxfUyLpdnzKZw3EzeGQrCWyoffiT6LWUp3X47ceLj3K2aJHZe0IUY4+urRICptIGXwa/LFGF6GBlStNyBkLMZ9EAsdGgGQ0aafKQ3069PrNdOf8p7w5Hjd5mlDy04rxMWFrEei0z3w+QaBfSDspIUcU+cGsho630bgzZPl9UQ7y4kZOymhKHMXR0eixu0hPNChdpkCxAyjsKKL+cqTgi2op9R5s2ivbW7kH4zvF4sRZbCttny07WcQGsieTv/G+ItPCfad8ELj2pHPrsT2D1acEjDuHpoW7Rr41kfaLAD8oRziguRWVo28zkBff8o46zxBG+98RP84qPD0+9vYawvRe7gUDWa2l0ji4PmmG+w2oLqgS3fVPbhj4z4x+B9jmWY0r5PJoMyO1ceDxZz1FFrCo92eqFXG9TL8hGgje6BvahyP6qLjTAMRP8pvygkAQA1mJ8D5NY4DFG1pY2Ofy4/+ZLJDX4KCebTsHMNpYX5QJGGKwURbW+W7KO3vU255KZvfmTqDqd4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(7416014)(1800799024)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d0Dy9PM8MnFUMZ9c5PtgnHxBGwuITMxNYyqhs01jAlmEx97QggMqkFUAU8GT?=
 =?us-ascii?Q?yAtO+X8Zw/N+SmA/QEtU023OOPDehiS+3Kcn8fMH1GcBJCOisBngtAJnBJ+q?=
 =?us-ascii?Q?iMzHKGAcJLREBwQZyG+q12olxGnxVa50v+0uXUpBg/E34hLOlRzgvPmarnQ2?=
 =?us-ascii?Q?t4R+CSLxxwEanoZ/hK/PrPYCXm8yE1QsPOaE7j5jFz8z2mSppFUheOL5ZeBI?=
 =?us-ascii?Q?jYG9DMSx3z8gGiXzkQUNIc0+myoybw3CrOLGbYQjm0ttK5tryX4NIWte4b83?=
 =?us-ascii?Q?bIrDLKm6ffOkp9lcUJI0TEExRs21sw4DIMK+XC0KwkYdl2Y4NJiXVz1XmFSt?=
 =?us-ascii?Q?qkIFoFOduVjGCyhFSnsaykubPdT6mbGL7gwiPvR5L37UA+zMjjpbe/3O7stC?=
 =?us-ascii?Q?vzb5h4WBa1HL2gN7MwGlTGYbDAk51n91td/CCgXuEHGhn+aoXlT0MMolma/L?=
 =?us-ascii?Q?dnOOLPaT5t7t4RMbSwJzh2soDIBvQbQFKWvdpFC1O3uUHpT85t14Ut5o+Yvi?=
 =?us-ascii?Q?uPW8lGR0CBa1D1HKlwmKL5Poh+IvgzigoT7VjznjhLrLiI1LPiGx0aNiYH06?=
 =?us-ascii?Q?Zwwzb4IG6aAE7+zuBd+NUXeBnF5tU0bCGX5HMSsgWIt9bQTnQCD/fml9C7Ga?=
 =?us-ascii?Q?8NAaoW7mZ8NAt38w60208d/+gQVFki92vvI8PkVVvtcSbmWA0zKPGUMA1w5n?=
 =?us-ascii?Q?nkH+mlCh4FkbSUpc3p6MXKDR8ZrlFc1LhBI6swrTDF6NN5IP8w/n8Z/4m8EM?=
 =?us-ascii?Q?kr3PdgQCTrNIi+RiTwJToFEQpx9aj1hzXsTN/t24ObbEXY5QQ0XZwZr74i3Y?=
 =?us-ascii?Q?6mIVdTW6jgCf/nHf2jdweYvQzh9FJBA+G3t36iXsBcKZXEG2b2Jh6pe+jzAu?=
 =?us-ascii?Q?I6GJxic67fAC2hN4JImy99JO/bx+sWq+nzfFgkwD2yzb4tfAxCrzww/b34Nf?=
 =?us-ascii?Q?YIgWess7kOaA+3r73vDJ37ucgPkksvJBwdF1Hp8CHOWTCqRBG6QGa9x1GO2P?=
 =?us-ascii?Q?JiT9W2gGoPX3anHLi6gnx34wLt7j/arCqIlPBCqMG/Jm2cxjeriTx6N5CIr5?=
 =?us-ascii?Q?/p2vfO8+hYWFtHvJTzgCbYEK3uPaaenK1q1dmHX4NiGqL66M4yRQWbDNf07J?=
 =?us-ascii?Q?BV7mQkHPjGqLRHe1mXaGHKIkl6HDHG/+cAG5XNRE8EzVXo2c2cC8NUmgcb3i?=
 =?us-ascii?Q?UGyeBrXJ0M9o7cIIr3PXFulP/zHCsGIHVo3y7htsnUyQpCuX9voaSSpzxkQL?=
 =?us-ascii?Q?dTxpJJIGBmX5uERaxkmFUIm0yb1kHSrp1Ygni+M3IW8XuASlrBqpeMCkhml5?=
 =?us-ascii?Q?LphytZNT1POnbG8p/SuAIInzvP0+3A1J+AepjkCLjglDyc8cbTZwWGbcXrkZ?=
 =?us-ascii?Q?VQGSuYOrWclxYw01X9SE6Egx2AloGz4KtrLMZRh7al2PhYZSijtpFKpzMb8Z?=
 =?us-ascii?Q?nAyfOZ5GAGHBYt41NzKa6/fiVhM9iK9vehjjIVb06/d3EIWH5jrRdqeUlaQL?=
 =?us-ascii?Q?mHBHEBk6o0SGu0qQeN35nsodTZGJ/rs6KivOOtrCzRjCEl4xDSYi6P96m5H2?=
 =?us-ascii?Q?PzGp4s+TEs4sl9hT1WHaf1JkozbTIN4gxqrBQ7LFgd1VSJ1kof+QFRfUSlY1?=
 =?us-ascii?Q?1H/Db65b9GfpyJSW49wihamuRebO0P+caBglUeAnuRHLq3vg6JfDdvwH+68i?=
 =?us-ascii?Q?Mh+DlgdGiv50r1ESZ1EAlLPnzdpPodznOme0WU1z6s+rGNl9B/TAYrmzOu+2?=
 =?us-ascii?Q?n5XgSx+biA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36188318-ecac-433d-30d4-08de890e8ec1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 19:01:15.2242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2MaIEQD66cAYOJ8p6x0euQCG93jP3xv95odU2zsZoRDhpsuv582F4vjiQ1iur5haQGuS4EKPk57jQhBf1fCryQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10782

On Fri, Mar 20, 2026 at 05:03:53PM +0800, Sherry Sun wrote:
> Disable the PCIe bus in the default device tree to avoid shared
> regulator conflicts between SDIO and PCIe buses. The non-deterministic
> probe order between these two buses can break the PCIe initialization
> sequence, causing PCIe devices to fail detection intermittently.
>
> On i.MX8MP EVK board, the M.2 connector is physically wired to both
> USDHC1 and PCIe0, however the out-of-box module is SDIO IW612 WiFi, so
> enable the SDIO WiFi in the default imx8mp-evk.dts, and provide a
> separate device tree overlay (imx8mp-evk-pcie.dtso) to enable the PCIe
> bus when needed.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
> Chanegs in V2:
> 1. Improve the commit message to clarify SDIO WiFi is the out-of-box module on
>    i.MX8MP EVK board.
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |  4 +++-
>  .../boot/dts/freescale/imx8mp-evk-pcie.dtso   | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  4 ++--
>  3 files changed, 24 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 780682258e71..107ca270ef32 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -333,12 +333,14 @@ imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-
>  imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
>  imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
>  imx8mp-evk-mx8-dlvds-lcd1-dtbs += imx8mp-evk.dtb imx8mp-evk-mx8-dlvds-lcd1.dtbo
> -imx8mp-evk-pcie-ep-dtbs += imx8mp-evk.dtb imx-pcie0-ep.dtbo
> +imx8mp-evk-pcie-dtbs := imx8mp-evk.dtb imx8mp-evk-pcie.dtbo
> +imx8mp-evk-pcie-ep-dtbs += imx8mp-evk-pcie.dtb imx-pcie0-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
>
>  imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso b/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> new file mode 100644
> index 000000000000..4f6546d442bf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&pcie_phy {
> +	status = "okay";
> +};
> +
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +&usdhc1 {
> +	status = "disabled";
> +};

Please use one overlay for both imx95 and imx8mp to enable pcie0 and disable
usdhc1.

Frank

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index aedc09937716..f09335e6388d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -763,7 +763,7 @@ &pcie_phy {
>  	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
>  	clocks = <&pcie0_refclk>;
>  	clock-names = "ref";
> -	status = "okay";
> +	status = "disabled";
>  };
>
>  &pcie0 {
> @@ -773,7 +773,7 @@ &pcie0 {
>  	vpcie-supply = <&reg_pcie0>;
>  	vpcie3v3aux-supply = <&reg_pcie0>;
>  	supports-clkreq;
> -	status = "okay";
> +	status = "disabled";
>  };
>
>  &pcie0_ep {
> --
> 2.37.1
>
