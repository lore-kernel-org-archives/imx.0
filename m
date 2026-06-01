Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E245D334692
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 20:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347332; cv=fail; b=bUN8tv3FWUwoy8a5eD8goKzq1MpzVUvJMz9YNgJt93kcNl4mDtcCD4a6KbyFytSKWyljx7go13FoGkJSbOwZLApUJjnIKZJuHpw2qGuK2YrL+g6uIj5O/woyzWPmzpUNgyCCa2CS0TR1qpyel8nL4AMohMwla0QY+zbsCFzN+p4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347332; c=relaxed/simple;
	bh=+zgszSyPNLIoCO7+trwufue/5ZQJq46XrchBdIO/7Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aMkpUIURyH3bpcjDIzj5AAbVGYUWUI+v6BN45B6SpCXeV3Gh4pP9BLFEp3IFlIPKepe+rouERzN2ZXlgo6c8Sa+6vz4bLlcTXpZg3iLR1qaO6Y5dSznCjI17iHTWmtVqnsvLcb7bMB4E88cW2PU07s4oZyMFskuJ5cVkGlIWtdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lx5CCok1; arc=fail smtp.client-ip=52.101.72.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lx5CCok1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AghIJQA/i1tbY/TzfTlP8zjxbRxJWeIX7fJfQb3e2QYv27U/qrHKg2Y0CwzqE3jjznwej16IUmB33wieSYdipueNgPmFBk175md57lTLtvmXcGReabrPddXOhsGz5Eq+rWZuXFsrfMQ+4qNKoBsiYFXa/Y6PDuyWDwD2/YZbKQMmCB0J65MISW5P5FCh+2gIrZ0LHGgMEG8InVyGaJ5GkyydDKQA8IqsMhbp+JvnyQLpRm3MBp3bpYcOZOPffNEmcpuGRvZGndLfITiWLAunEfZ+LEFJxI3yjnFny7GnQ+KfCk8NUjFOZZA6k0zVRRJC5lMtR7Bp5gCks0Dn2dXfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BubuJNBh2pcyGwnmjR37J9wHe6O5XGloA+vDs8KVG54=;
 b=W4XiftKbMnUIfTuQaFm8gNAoxfkvDT7wAir+QNVg4p88ZJEWOjZpLYkpPjOSEWPePn6nFTvoGxvQ1KR5ffKyBpdPJ5OROmGUq8X0WNGBwfNFF+VA6zB6H/Ox1c+s+I/aUIVubJcypiirOROrs3deJZs7IMjApVlifOh12pD2hQGSjxvbTSQ1wqlcNtjwyXTX0V2mEVH7p3S7AJK7+djtUWJALrYf29FO7BWiRgmBWMzvEyEOq1yROeKVVVo9NgphEo3v552fUl5/TMiWycuWZqe5xFLbHnFPbHHdH27bJS+IrdZsNrHVuhBdWVe3dVi2uThZcjjoSgBsog+qRmsobw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BubuJNBh2pcyGwnmjR37J9wHe6O5XGloA+vDs8KVG54=;
 b=lx5CCok14g9ga0SqDb4C3PaLxgo43pc2KTpAOSBERBTJTm3s5hlxiD4ANeqk8FDZ1jNPJPnruPIBxxgO2wZe5mvkxi/eFXxkVGFGTyhaI0A47SrXcf2QGHhMX5K17TUM3vEXN9KbnJHho6PyibUbbHDjHs7m/2FcUJdt5fapRQdLoioJzFqMY0Ar6AhiRDIZ9yGAIBW71H23MwGimGTMQKl+MMYbKvrSJ8i3UDuFqjHG+phSCfgwt088qso02rKMZAPzz0Sv96UZEsXqSm6sU1R4izFal4eXac2v8i530ZbLT+iNRoHQp5TgrbsQdrDYl15nX/7Y1+BN1iN7LUlsPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB7895.eurprd04.prod.outlook.com (2603:10a6:20b:2a3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 20:55:27 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 20:55:27 +0000
Date: Mon, 1 Jun 2026 16:55:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v4 1/1] arm64: dts: s32g: add PWM support for s32g2 and
 s32g3
Message-ID: <ah3xtqdaI89XOv7x@lizhi-Precision-Tower-5810>
References: <20260529073436.1767786-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260529073436.1767786-2-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529073436.1767786-2-khristineandreea.barbulescu@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB7895:EE_
X-MS-Office365-Filtering-Correlation-Id: 79dbc6a0-2d2c-4578-f0e4-08dec0201bd3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|22082099003|18002099003|56012099006|11063799006|4143699003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info:
 lK6gZlVXqW6gh671YVU6nSZzEpDSbnc39MxfqK6HXyp2csreuwW7QBKsuExMi2FwyF7e/USMi4ayfWDLymVrB9nyCNxxXb98EyWVQohGhk5M3xv9TYCr3so27eN+GyNXyaq/DAcNETXMB+fVRilBNQTYjw6MbU7dWZXv0bHAgVhqy+rKR/uHnJC5B05V+V+phqHt09s372uWDxLdBWRujKfCOpFjHb/3y39UXNoK9PuNPSzTw55BhFsWKCQixRPp/3XqpeGkirrLAdHDrxX6FEqgyENsfOBB1q/xCl8EY+/TxuwgqTA3DGlfiZYYJ/otFT/l6g7tai8Z4tl5rt7Y4GnitNW8mcMi+IgeuuVZINZ9zjT4Jo3tUtu7yx+jp3wgE2WdCXoz4YerH3vVrPQRPNz9uweA+w5Y05+w54NZ3k0mnUx9G2cvY0i2gbjg2K0+aMVoNjcCcPq/Ivsh3ZXuOxlbrJiv44SWXJpHHIh1q8k6wjLf6bu2MylU+Vj3+v2rFDpHH+xJN4K84inLp6bNAlU8lOmcvd6sG0xXLPa33N6pyDaA1qZKH6FUR4hTOLZDN5AsMyLraU3XmpG4Bfj0r9DFLRVj+gy/qmxHLnE5JEOYja/g96ksjrV85T5n9C6hZRIWBFSVciZB0QPnOjB1UKVfmZasoNUzKnOmlpI2HZ86yfyJqeqluFKJF0DWpj5HiAXvsrG1QDDMBONEmGXJtAmkPLgh2wYoll9o0RyGp73PlfvsOPsnUeD4PxifPhNh
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(3023799007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?gEMUloF86lg7onCDgs4fV15WfpjtsICM/KBQny37lHR8o6hcxi5fTsLFwAmr?=
 =?us-ascii?Q?VQxPSF9Qc7l3b/wo+AkV2zIaZYNsEQZ8z4BW0EarVEW73+J2ybBNkNLRZq3R?=
 =?us-ascii?Q?OsahfjRKh0VdxB2PP3561pe0WgZqxmHeWV7v7wff/iuRsccX+Jcw6he6KFwT?=
 =?us-ascii?Q?LqzcqW19+T2q8aCXBkdW6ad9dw2Hdzk92XkRN82/ST4syvU5TwHkBIBBGQrI?=
 =?us-ascii?Q?cge1zFMVaPrLI6yhycHQegG5zVp4kwr9iqOts5N8HcgbXS4RcQe/XKu/8FiJ?=
 =?us-ascii?Q?gXuda50341XK9WudMkkQV1KlTpGQe6jUcSaDV6ZcYn+GGdcZ1sulT7ptJa97?=
 =?us-ascii?Q?k/lxIBZrSR94Wka1ywF8X2o6Chmr2F0ZEtJ6GcKyh/9jqU3FQKmcmc7JLcqf?=
 =?us-ascii?Q?D2laH27FkBVj6gsvhCjLNg+6nSNdKDfg23gUGf4TwDKdC1/gdRffOCBtEkbi?=
 =?us-ascii?Q?a8Fenz3qINZIYhvnk9WC4239S2lGtVJ8VwJprse6btxtsrLjmjPWAZSj/3Cb?=
 =?us-ascii?Q?Y/YcQ/wur8GdHsSEu3AP4rfq0Kfx4OYglplL7mf/zjKz97tXldibg/37zpb0?=
 =?us-ascii?Q?s7ValX4W+3lwU3VWMNJMnDmfRkti6P8Q1ZurM39scY4AwCvLnmWbBleaijoj?=
 =?us-ascii?Q?S+XW/dF7Ax0WCI5M7eXULmgrQCXAG6h4PCwNh56mH380Pc4rCR7F7utdEnIb?=
 =?us-ascii?Q?Hg3XtoGW52sOShvIUE5XMmhy0M9UfMlOjIa0HNrVU8kZbD1NhgNr3ZiG7qpr?=
 =?us-ascii?Q?NI2/w9/1iM/xKqn09wgfYsbFTL9xQkIox7xUg8QIiXh+u0jE5l3teThw+fFT?=
 =?us-ascii?Q?6FqYTqyGQgtaw5X265lpD2OIssTuGud0DYeKHwsP+CLXi2ZYE3hHJr9Kfymr?=
 =?us-ascii?Q?ql1iMTS/1HQWx4nOI4wzHGibpHMbHcgKOAJN9KQ7NdN2pmbDYoVoErZVl5JP?=
 =?us-ascii?Q?lqzwaLV+Kf4ErRAbziYAc67coCJ5fYbYZuLieGGXC+nZxc6+ggCOQ3N+ZiYU?=
 =?us-ascii?Q?zB1xOJ2nMgM3FXw+KdN7B8JolM9csvE8evBzFxzHOKpHD1PG1jm2m7cWJGSw?=
 =?us-ascii?Q?/SzzaAkCFtPQVeFEK9sg26LXbDRvJ3yiIg/ow/bUzBpzTpbDHip+YZezLb/Q?=
 =?us-ascii?Q?+l1m8I5aoLcdYL1juUbwOIbE/oXSGcC5rqZdG4XBEvibgpjPOIEtQA9K5v/M?=
 =?us-ascii?Q?jhhMw6s8qT4vf/tAcfhnzkBrttvQomugc8tA/OrgfGSktc3xrshcv7L3dh40?=
 =?us-ascii?Q?mR24ytc6IGqviDjM4nGCg4GQbd0V2eIXljrH4NUTZ8CvU6adj75C1AMmlJ3t?=
 =?us-ascii?Q?YUC0ENCfmSguez4NzcY1cAuX7paY+L2GjfKYDxRWGEPpFeW1AllvaNOPL86w?=
 =?us-ascii?Q?+MX0U4lVcUw4B/cBIB++bzyOcCZALZo9nFP47E0igz0DpT5i1fHzhI8XKKJL?=
 =?us-ascii?Q?W1S4zZVDC/YdFRES2VMbLi8q6IrCb3ZhuQwHkaTJsoHuG/5TgB8nEGnVG/FQ?=
 =?us-ascii?Q?G6GYt/KCb6zdOiL6cj6npxYneAFmyq0NvdFKpY9iw6/eW6/vRfD/OHrgwVpc?=
 =?us-ascii?Q?1ZlQdnLz6XzibB3DfIkja5RwyFyD/jHSfTwpRV0Rsz91QmqEiE2WYW03h9F6?=
 =?us-ascii?Q?AWX4u+m4coGSZdaYcXfeYJpzQCjOw+IHF1BuAK5yPbMEIP23Z9YnyxLirJqp?=
 =?us-ascii?Q?ntUg63c5dusVcsEp1+sHe7UO2t8srSfSoE626v/b0OHBsNuu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79dbc6a0-2d2c-4578-f0e4-08dec0201bd3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 20:55:27.2933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7/BMvhe1vv2MyEJkAF0pEzyYMzQOKXkCcsguCV/7dPbj3qorrkYT1MNDh/ifxPLfC9DIYGQfheHK2JtZZMmPTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7895

On Fri, May 29, 2026 at 09:34:36AM +0200, Khristine Andreea Barbulescu wrote:
> Add PWM0 and PWM1 for S32G2 and S32G3 SoCs
>
> Reviewed-by: Enric Balletbo i Serra <eballetb@redhat.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---

Please rebase to https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=imx/dt64

Frank

>  arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
>  3 files changed, 133 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index 51d00dac12de..907cf74e61f3 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -3,7 +3,7 @@
>   * NXP S32G2 SoC family
>   *
>   * Copyright (c) 2021 SUSE LLC
> - * Copyright 2017-2021, 2024-2025 NXP
> + * Copyright 2017-2021, 2024-2026 NXP
>   */
>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> @@ -554,6 +554,19 @@ i2c2: i2c@401ec000 {
>  			status = "disabled";
>  		};
>
> +		pwm0: pwm@401f4000 {
> +			compatible = "nxp,s32g2-ftm-pwm";
> +			reg = <0x401f4000 0x1000>;
> +			#pwm-cells = <3>;
> +			clocks = <&clks 5>,
> +				 <&clks 6>,
> +				 <&clks 5>,
> +				 <&clks 5>;
> +			clock-names = "ftm_sys", "ftm_ext",
> +				      "ftm_fix", "ftm_cnt_clk_en";
> +			status = "disabled";
> +		};
> +
>  		swt4: watchdog@40200000 {
>  			compatible = "nxp,s32g2-swt";
>  			reg = <0x40200000 0x1000>;
> @@ -717,6 +730,19 @@ i2c4: i2c@402dc000 {
>  			status = "disabled";
>  		};
>
> +		pwm1: pwm@402e4000 {
> +			compatible = "nxp,s32g2-ftm-pwm";
> +			reg = <0x402e4000 0x1000>;
> +			#pwm-cells = <3>;
> +			clocks = <&clks 7>,
> +				 <&clks 8>,
> +				 <&clks 7>,
> +				 <&clks 7>;
> +			clock-names = "ftm_sys", "ftm_ext",
> +				      "ftm_fix", "ftm_cnt_clk_en";
> +			status = "disabled";
> +		};
> +
>  		usdhc0: mmc@402f0000 {
>  			compatible = "nxp,s32g2-usdhc";
>  			reg = <0x402f0000 0x1000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index e314f3c7d61d..a4a9e21d1361 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2021-2025 NXP
> + * Copyright 2021-2026 NXP
>   *
>   * Authors: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>   *          Ciprian Costea <ciprianmarian.costea@nxp.com>
> @@ -617,6 +617,20 @@ i2c2: i2c@401ec000 {
>  			status = "disabled";
>  		};
>
> +		pwm0: pwm@401f4000 {
> +			compatible = "nxp,s32g3-ftm-pwm",
> +				     "nxp,s32g2-ftm-pwm";
> +			reg = <0x401f4000 0x1000>;
> +			#pwm-cells = <3>;
> +			clocks = <&clks 5>,
> +				 <&clks 6>,
> +				 <&clks 5>,
> +				 <&clks 5>;
> +			clock-names = "ftm_sys", "ftm_ext",
> +				      "ftm_fix", "ftm_cnt_clk_en";
> +			status = "disabled";
> +		};
> +
>  		swt4: watchdog@40200000 {
>  			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
>  			reg = <0x40200000 0x1000>;
> @@ -792,6 +806,20 @@ i2c4: i2c@402dc000 {
>  			status = "disabled";
>  		};
>
> +		pwm1: pwm@402e4000 {
> +			compatible = "nxp,s32g3-ftm-pwm",
> +				     "nxp,s32g2-ftm-pwm";
> +			reg = <0x402e4000 0x1000>;
> +			#pwm-cells = <3>;
> +			clocks = <&clks 7>,
> +				 <&clks 8>,
> +				 <&clks 7>,
> +				 <&clks 7>;
> +			clock-names = "ftm_sys", "ftm_ext",
> +				      "ftm_fix", "ftm_cnt_clk_en";
> +			status = "disabled";
> +		};
> +
>  		usdhc0: mmc@402f0000 {
>  			compatible = "nxp,s32g3-usdhc",
>  				     "nxp,s32g2-usdhc";
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> index 803ff4531077..be7b645afa2d 100644
> --- a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
>  /*
> - * Copyright 2024 NXP
> + * Copyright 2024, 2026 NXP
>   *
>   * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>   *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> @@ -245,6 +245,70 @@ dspi5-grp4 {
>  			bias-pull-up;
>  		};
>  	};
> +
> +	ftm0_pins: ftm0-pins {
> +		ftm0-grp0 {
> +			pinmux = <0x2912>;
> +		};
> +
> +		ftm0-grp1 {
> +			pinmux = <0x122>,
> +				 <0xb42>;
> +			output-enable;
> +			input-enable;
> +		};
> +
> +		ftm0-grp2 {
> +			pinmux = <0xb13>,
> +				 <0xb53>;
> +			output-enable;
> +			input-enable;
> +		};
> +
> +		ftm0-grp3 {
> +			pinmux = <0x2904>;
> +		};
> +
> +		ftm0-grp4 {
> +			pinmux = <0x2925>;
> +		};
> +
> +		ftm0-grp5 {
> +			pinmux = <0x2936>;
> +		};
> +	};
> +
> +	ftm1_pins: ftm1-pins {
> +		ftm1-grp0 {
> +			pinmux = <0x1d3>;
> +			output-enable;
> +			input-enable;
> +		};
> +
> +		ftm1-grp1 {
> +			pinmux = <0x29b4>;
> +		};
> +
> +		ftm1-grp2 {
> +			pinmux = <0x29c3>;
> +		};
> +
> +		ftm1-grp3 {
> +			pinmux = <0x1f4>;
> +			output-enable;
> +			input-enable;
> +		};
> +
> +		ftm1-grp4 {
> +			pinmux = <0x202>;
> +			output-enable;
> +			input-enable;
> +		};
> +
> +		ftm1-grp5 {
> +			pinmux = <0x29d2>;
> +		};
> +	};
>  };
>
>  &can0 {
> @@ -293,6 +357,18 @@ &i2c4 {
>  	status = "okay";
>  };
>
> +&pwm0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ftm0_pins>;
> +	status = "okay";
> +};
> +
> +&pwm1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ftm1_pins>;
> +	status = "okay";
> +};
> +
>  &spi1 {
>  	pinctrl-0 = <&dspi1_pins>;
>  	pinctrl-names = "default";
> --
> 2.34.1
>
