Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010069.outbound.protection.outlook.com [52.101.84.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1647928DC4
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 14:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773928879; cv=fail; b=Gm4kVH1tVMUiHGG8vnd6ilcYND3YS6yrmMWAYUXf6dEeHDMRqKsh0qQ8kjTqoZK0sWvsAgDKw03+bysePCEjoqV6iW8TYCEHXwmN/wuys848Q6fYXyDXPVNSGerDUkeNVyw14Rzf5HO78i0k9nm+kWZ+Ye1l+Y5WgccQVlEn9jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773928879; c=relaxed/simple;
	bh=szAep9EXTiRAAPSp878SBTrWYhEMbBuYSbMeMqcIU6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jH6O0k5auGUD9iub4p5O8wP/3DxAXbijNKTV6c7Gfz2P/3HTha5LrKsLl4kAlnl0FA0doyDReEUFmosBtYWaGITfhIdoH4qotvGqaTQg/cYH0/TG8MD3AiMA+5jjuhkoLsAyC4grtE2EQVL1HrcG1899UVoKM6xga4D4Xl0ZQOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C4BpHKaD; arc=fail smtp.client-ip=52.101.84.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C4BpHKaD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rbhlto9RC1Scsc1RTgazgYVUau5niBVdy3pK7cZn+m965NDCAjn8qz1EuZ8mAu+DJDpcAG3a/4hKHgu4MzzZO1ma4QFH98TRtKs4fJCx9KR6OBQNAS9ovHQRMVO9bDIucUywVjZy9iIHFmYe3iYT0JfzsGQ/sk/4A2AfTORlqkgHOKwBZzKMOlzS76/6YwTF5MetOiU+n3vz2aMe/svQWZHN1Y6/vMSuW0/CkrEpo0ZAL9Nei2+eVsO/vpy794Ex+3Gc7+TYB1mC7UtApKFCYueUTGtpDhXVkkAYxn6TseSYByh1f57lrZKXMAg0HVQ01uFqucwqG3mE4DmBu22GCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njxw/WR6K6GYhderHJIYiH247XqLyvnF4nn2onNrerk=;
 b=q6k1oYxuZd/K9Wb5Bm8uZOU+9qRY0EKwcZ1ajze7eD0dTD59kxseBItO8U4kw0SwUaLeAadENVUnGXuvu9dzSOpdu0aoe/POTZ0Cp4TiEyxENJitesoaC3F9uL9VLTY1leqa87jwJn9Vs60KCu4iUDQUE617v6ZQhc9NHvV9OssGDGNZ0g9nszRsSm5sBWZi4/uwfImvqaXNrTbpqTiajEHGj23UO4Le3nechs2/wXtqngJyUvD377gNPis5Tihmxel1Cxh5/OZkRrx1PSstJqZEzcha1w/0caVQLM+lqxy+KlXI0Kus0O5gr00WBkkFHsnijcjJ5tz08bWRSJbZ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njxw/WR6K6GYhderHJIYiH247XqLyvnF4nn2onNrerk=;
 b=C4BpHKaD1cgoY1iDl6s5ITyr1GJosQGO/p4aAMaDzF1AyOHvM1tXVHIb5749XelKOUG4Q+aB4LoAu+DmFwnv7tFWwduMlOXdQwDYzmcZRVgn95FBU8q4l+VTL4cM16VcckaZ+Ww0xmWrk0JdOKsDrFJscRJugD/CKA1/+VrRgqWvzlkFcixq1tYBxzWliwIifKrLiXAnSIp+dEkO5sJIALhp01gDMje0KEJdQwKWmBL1pLjOCKUzRW66rbdYuGslArrq7hgF+OsN78g1nm0SwdUQwX2NNlrKpH/fj07qGMtNK9RxrTuQd0M8eQ0lnubcN7gYyVI8h8sBGxvo+NBP0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB12213.eurprd04.prod.outlook.com (2603:10a6:150:336::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 14:01:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 14:01:10 +0000
Date: Thu, 19 Mar 2026 10:01:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 2/3] arm64: dts: freescale: add initial device tree for
 TQMa93xx/MBa93xxLA-MINI
Message-ID: <abwBoB29cns28PWl@lizhi-Precision-Tower-5810>
References: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
 <20260317111704.1075938-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317111704.1075938-3-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SA0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:806:130::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB12213:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c5f008-2d17-4d8a-6ec9-08de85bff950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|7416014|52116014|1800799024|56012099003|7053199007|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	oJ5RhPobJlABl91MLTkjbjEkKTy8kWgbhIyEzixa02Q2g0kSWB+cuaQvwf/+OuIsCSjbf2FrtCS/VoMlWBykvnmLCkpuxFmYqVZBc/chY0Kxd2p3tkUH+UxDb0a6vnLwLYLwMtphLbtLUt4WdjeCJWd/DU67ELho2l1Gtw1d+QGFVHNWI7PyNiyGQ64yuGvFMrMDsSSJDj6R18pmnHtlqJIk4XsmH0U6oiBR/FcILt3Sr7HVLyxj/RymaBNzG5KVWYkQZ3jEtSfDNvW9kLeNQ9C1oHZDW6RjKA5h+sS8HpAGCxDaAcAK+5DgKW3LogepSBo4niTtLcLfAwrQQEFAUbCuFLweit76d0Oe5XvNay2k75ao19SQ5FP4SPaRUw8khwFPM9XVGYDvZsMeT28iVKw/WCyL/FuV1HIHYP6b737GqF+hjpBO3E262Qtfm5lYqHyHTsIzmy8CtJ5Vd0hOvOfh5HjNlwtWVuRjUi2PT8KLVieYyIj7icxF9rIFUhXGgkuTwBLSyMmwLT49152r7Qv5HKQCWltwKpvnZz38wCuFU5cbtLL96FXJxx67Gmec0gIm8DJqd1gZUUUyDNZKcgoHzPFajwN91g3Ls6BB5aJ/0VuCDC9boREDt8qrFNux+HXnaSsvefJmeyNKC+Ux+1S8stUJyrDa+1oy869z95hU9O5YmD8w/FTkdJRHjkkBWBZhFw+gsWmhdWBR/+yI7IXPOyNF7Q8UkJM41Z4WVeFZHXR8VeIz6Kh4w3NeIqTDJnW+q1hRGSX4ApxDEiMa/Emj1XSg6C1GlnVHt4UVSQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(7416014)(52116014)(1800799024)(56012099003)(7053199007)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R78Kyj9N6IZFeDP0abn8ke5kvKrSbhhBh3oqcwi7hXaFOIOnBYExDK7tc/F9?=
 =?us-ascii?Q?HzmGMkAdfL3qtgkHE2Lp4FgwNCBxJXEvp6SSgsF40pRJ4wrb8LMg+1mBBpp+?=
 =?us-ascii?Q?rrDT8Ue5laLM2hZJuZ/pqHe4n98Zd4xg6nZYoM6fy3+WmLwe2+XjH9aCChg3?=
 =?us-ascii?Q?43uDgkrmREaYEmH7dYFZCspi8FTkvk+Q+uFH+phOH1veNLCl21hO9jk7GVJN?=
 =?us-ascii?Q?NpXu2JFntKjKs/nTV9eQw5bN7wnIgA1aWrWwAR3GHhZP5vswbxDiKSEGYVxM?=
 =?us-ascii?Q?lfgCTOfabpDTHqu/cPWgJf4D6NwY3Uxzx9ESX6b0UlCppD8wpY/zgtKX4NSR?=
 =?us-ascii?Q?BWvobOmsludgl/MMcF0srBvsFAy5hrwZJt9011ExDEYSN9PsiNIHluUup7lN?=
 =?us-ascii?Q?IcDqT5J/mffYYTXyNUm/66A3Xlqy0iRW91ymN1jt5kjsIBfzPdFaITstJwFP?=
 =?us-ascii?Q?bQqFFMHnV9q5TI/pCtE1lrQYgE+qqdy9uGXumJBl8xYtF4umjGRu/rWu5Vun?=
 =?us-ascii?Q?fflZMCQIzlzkqQ6L4o6gFUeGY61ASNGmtCB5nyCCEfO6sCKnCaj/8iDXkYLI?=
 =?us-ascii?Q?A8HnTZ6p3/V+w8X/w4ppeNjpAMGXjxaEaP5sW4hwjqw3DqGiGyaYmXBJcvwL?=
 =?us-ascii?Q?w2ED0irxAFcGsWVYSuiPLYMx89cCkdQpGNUWhtNTbMrFGRLcn4+U6Z4jMfcD?=
 =?us-ascii?Q?oFOWO0uaRxtcYaBS9M0I72DDFmpDXpWIxCrO5B5wWJrt5ntIsWeZaUo170AG?=
 =?us-ascii?Q?QhsX/g7GlRfSf2YqP+Nt6TIa6GZSBq8IX8oV3GRm1KjEVHbuzlxM7t/PDWnK?=
 =?us-ascii?Q?WxyeQTVEsHYoDWOdJ38RUl6ayKp5eAZ2svpD5cPnznbB5k1lv0iakGharz+/?=
 =?us-ascii?Q?q1LudhixO8/c+VbAsXuSEieEcQy8OYLFmmc8AS3YuwOue5jpk2gfLr8UjQQb?=
 =?us-ascii?Q?z5IrLdAXS95J5HksLvqC2SPUT24olWni9kTaUMW8C6H5iuCix1C2/YN5zuui?=
 =?us-ascii?Q?sZmCgCdEUL6z8wUe9pVWDlxMYE4rO10Ifux6U1G0enU176W5t9QFfdo9cJr+?=
 =?us-ascii?Q?nb9pRZinSIndLidzmZksHTCXN/RLsDYFiRjNTSsLZTtOQVFUK1Wo4uV7Bde1?=
 =?us-ascii?Q?Zah0Z111KtU8tXYtZyn3/DAE7HdJ6hvjViMXJrHdZ01cRCIWvl/yJwqpICi1?=
 =?us-ascii?Q?J0ym2MopR1gyBNMqemyOlh8N9383AsztS60yARYPFVIdGOBqX4tB4bHt+de0?=
 =?us-ascii?Q?jN+h08xLuG/I/m3K1VFRd25j1su+8okzy5imICoV6KpI2DIY6Qfwm1/2AavN?=
 =?us-ascii?Q?DYv1PVOHEIBEquFsb4oo815ZeT9Exyg2Tuac51OhZnm/MZQT2E/iIuoSp20u?=
 =?us-ascii?Q?gq75fZYcNtzbzftCjraS+rfJRkpNl7lYrbbbTh1HEMn7PRuceWImLx8rKJwG?=
 =?us-ascii?Q?H4GQsPR3E0l7hnmO/PMMqSS57JzXmNg79XPcOS1PdCS8wisaeqgNVBebwXyT?=
 =?us-ascii?Q?P0X6k0J3MnhrwzbhaUTtZWleOZbim7rubn9ydggNKxtXYnms1YblDOAf7nBC?=
 =?us-ascii?Q?SwE1CuBuRJuylYk9MgePkvekSsjbRMdT09vAvZzN6ExdOXgazsqm+2teHml1?=
 =?us-ascii?Q?3bCwtMTJaiqnpBnT30//vBzcQB3DSrGen+4ELWvzkrt3niPEl9Zmlh5Ztpwo?=
 =?us-ascii?Q?Qx+3kiTKP3lVyjVL/hDp/ZBgdwvYtJcGUq9YJSxfai0RU/kayR/zZU3PTA1W?=
 =?us-ascii?Q?v9Dl0YcjoA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c5f008-2d17-4d8a-6ec9-08de85bff950
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:01:10.4503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4EX2zmkHoHH4HIgp7NapN7EZi10PZbTlSnlwnpqzwv3F/Xu7uBT9ovB5z1yUO4nhfXoGfc16ZdgBX4xO2HQ4nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12213

On Tue, Mar 17, 2026 at 12:17:01PM +0100, Alexander Stein wrote:
> From: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
>
> This adds support for TQMa93xx module attached to MBa93xxLA-MINI board.

Just said "Add support ..."

> TQMa93xx is a SOM series using i.MX93 SOC.

Need extra empty line between two paragraph.

> The MBa93xxLA-MINI has a small form factor and is designed with
> WLAN, Bluetooth and WWAN applications in mind.
>
> Signed-off-by: Martin Schmiedel <Martin.Schmiedel@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../imx93-tqma9352-mba93xxla-mini.dts         | 637 ++++++++++++++++++

New dts, please run dt-format. iomux is not necessary at last one.

Frank

>  2 files changed, 638 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 31bc80586c682..db536522600ac 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -461,6 +461,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba91xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla-mini.dtb
>
>  imx93-tqma9352-mba91xxca-lvds-tm070jvhg33-dtbs := imx93-tqma9352-mba91xxca.dtb imx93-tqma9352-mba91xxca-lvds-tm070jvhg33.dtbo
>  imx93-tqma9352-mba91xxca-rgb-cdtech-dc44-dtbs := imx93-tqma9352-mba91xxca.dtb imx93-tqma9352-mba91xxca-rgb-cdtech-dc44.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
> new file mode 100644
> index 0000000000000..97693aa5e904d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
> @@ -0,0 +1,637 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2025-2026 TQ-Systems GmbH <linux@ew.tq-group.com>,
> + * D-82229 Seefeld, Germany.
> + * Author: Martin Schmiedel
> + */
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include <dt-bindings/pwm/pwm.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "imx93-tqma9352.dtsi"
> +
> +/{
> +	model = "TQ-Systems i.MX93 TQMa93xxLA on MBa93xxLA-MINI SBC";
> +	compatible = "tq,imx93-tqma9352-mba93xxla-mini",
> +		     "tq,imx93-tqma9352", "fsl,imx93";
> +	chassis-type = "embedded";
> +
> +	chosen {
> +		stdout-path = &lpuart1;
> +	};
> +
> +	aliases {
> +		eeprom0 = &eeprom0;
> +		ethernet0 = &eqos;
> +		ethernet1 = &fec;
> +		gpio0 = &gpio1;
> +		gpio1 = &gpio2;
> +		gpio2 = &gpio3;
> +		gpio3 = &gpio4;
> +		i2c0 = &lpi2c1;
> +		i2c1 = &lpi2c2;
> +		i2c2 = &lpi2c3;
> +		i2c3 = &lpi2c4;
> +		i2c4 = &lpi2c5;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		mmc2 = &usdhc3;
> +		rtc0 = &pcf85063;
> +		rtc1 = &bbnsm_rtc;
> +		serial0 = &lpuart1;
> +		serial1 = &lpuart2;
> +		serial2 = &lpuart3;
> +		serial3 = &lpuart4;
> +		serial4 = &lpuart5;
> +		serial5 = &lpuart6;
> +		serial6 = &lpuart7;
> +		serial7 = &lpuart8;
> +		spi0 = &lpspi1;
> +		spi1 = &lpspi2;
> +		spi2 = &lpspi3;
> +		spi3 = &lpspi4;
> +		spi4 = &lpspi5;
> +		spi5 = &lpspi6;
> +	};
> +
> +	backlight_lvds: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&tpm5 0 5000000 0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_backlight>;
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <7>;
> +		power-supply = <&reg_12v0>;
> +		enable-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
> +		status = "disabled";
> +	};
> +
> +	display: display {
> +		/*
> +		 * Display is not fixed, so compatible has to be added from
> +		 * DT overlay
> +		 */
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_display>;
> +		power-supply = <&reg_3v3>;
> +		enable-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
> +		backlight = <&backlight_lvds>;
> +		status = "disabled";
> +
> +		port {
> +			panel_in_lvds0: endpoint {
> +			};
> +		};
> +	};
> +
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>;
> +	};
> +
> +	reg_3v3: regulator-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "V_3V3_MB";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	reg_5v0_usb: regulator-5v0-usb {
> +		compatible = "regulator-fixed";
> +		regulator-name = "V_5V0_HUB";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&expander1 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_12v0: regulator-12v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "V_12V";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		gpio = <&expander0 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +};
> +
> +&adc1 {
> +	status = "okay";
> +};
> +
> +&eqos {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy_eqos>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy_eqos: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_eqos_phy>;
> +			interrupt-parent = <&gpio3>;
> +			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
> +			reset-gpios = <&expander0 0 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <500000>;
> +			reset-deassert-us = <50000>;
> +			enet-phy-lane-no-swap;
> +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
> +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
> +			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +			ti,dp83867-rxctrl-strap-quirk;
> +			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy_fec>;
> +	fsl,magic-packet;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		clock-frequency = <5000000>;
> +
> +		ethphy_fec: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_fec_phy>;
> +			interrupt-parent = <&gpio3>;
> +			interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
> +			reset-gpios = <&expander0 1 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <500000>;
> +			reset-deassert-us = <50000>;
> +			enet-phy-lane-no-swap;
> +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
> +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
> +			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +			ti,dp83867-rxctrl-strap-quirk;
> +			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> +		};
> +	};
> +};
> +
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	status = "okay";
> +};
> +
> +&flexcan2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +	status = "okay";
> +};
> +
> +/* deactivated because pins are used for SDIO */
> +&flexspi1 {
> +	status = "disabled";
> +};
> +
> +&gpio1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_m2_key_b>, <&pinctrl_m2_key_e>;
> +
> +	gpio-line-names =
> +		/* 00 */ "", "", "M2_KEYE_ALERT#", "",
> +		/* 04 */ "", "", "M2_KEYE_UART_WAKE#", "BM1_M2_KEYE_SDIO_WAKE#",
> +		/* 08 */ "", "", "", "BM2_M2_KEYE_SDIO_RST#",
> +		/* 12 */ "M2_KEYB_WOWWAN#", "BM3_M2_KEYB_PEWAKE#", "", "",
> +		/* 16 */ "", "", "", "",
> +		/* 20 */ "", "", "", "",
> +		/* 24 */ "", "", "", "",
> +		/* 28 */ "", "", "", "";
> +};
> +
> +&gpio2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_gpio2>;
> +
> +	gpio-line-names =
> +		/* 00 */ "", "", "", "",
> +		/* 04 */ "LVDS_RESET#", "LVDS_BLT_EN", "", "LVDS_PWR_EN",
> +		/* 08 */ "", "", "", "",
> +		/* 12 */ "", "", "", "",
> +		/* 16 */ "X1_9", "X1_19", "X1_15", "X1_11",
> +		/* 20 */ "X1_13", "X1_7", "", "CAM_TRIGGER",
> +		/* 24 */ "CAM_SYNC", "", "X1_5", "",
> +		/* 28 */ "", "", "", "";
> +};
> +
> +&gpio4 {
> +	gpio-line-names =
> +		/* 00 */ "", "", "", "",
> +		/* 04 */ "", "", "", "",
> +		/* 08 */ "", "", "", "",
> +		/* 12 */ "", "", "", "",
> +		/* 16 */ "", "", "", "",
> +		/* 20 */ "", "", "", "",
> +		/* 24 */ "", "", "", "",
> +		/* 28 */ "", "DSI_GPIO", "", "";
> +};
> +
> +&lpi2c3 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
> +	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	expander0: gpio@70 {
> +		compatible = "nxp,pca9538";
> +		reg = <0x70>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		vcc-supply = <&reg_3v3>;
> +		gpio-line-names = "ENET1_RESET#", "ENET2_RESET#",
> +				  "M2_KEYE_PERST#", "M2_KEYB_PERST#",
> +				  "M2_KEYE_W_DISABLE1#", "M2_KEYE_W_DISABLE2#",
> +				  "M2_KEYA_W_DISABLE1#", "12V_EN";
> +	};
> +
> +	expander1: gpio@71 {
> +		compatible = "nxp,pca9538";
> +		reg = <0x71>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		vcc-supply = <&reg_3v3>;
> +		gpio-line-names = "USB_HUB_PWR", "DSI_RST#",
> +				  "CAM_PWR#", "CAMRST#",
> +				  "M2_KEYB_FULL_CARD_PWR_OFF#", "M2_KEYB_W_DISABLE2#",
> +				  "M2_KEYB_RST#", "M2_KEYB_DPR";
> +
> +		/*
> +		 * Controls the LTE card FULL_CARD_PWR_OFF pin which is low active
> +		 * as power down signal. The output-low states, the signal
> +		 * is inactive, e.g. not power down
> +		 */
> +		full-card-power-off-hog {
> +			gpio-hog;
> +			gpios = <4 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name = "M2_KEYB_FULL_CARD_PWR_OFF#";
> +		};
> +
> +		/*
> +		 * Controls the LTE card reset pin which is low active
> +		 * as reset signal. The output-low states, the signal
> +		 * is inactive, e.g. not in reset
> +		 */
> +		wlan-perst-hog {
> +			gpio-hog;
> +			gpios = <6 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name = "M2_KEYB_RST#";
> +		};
> +	};
> +};
> +
> +&lpspi6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpspi6>, <&pinctrl_lpspi6_cs>;
> +	cs-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&lpuart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +/* disabled per default, console for M33 */
> +&lpuart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart3>;
> +	status = "disabled";
> +};
> +
> +/* disabled per default, used for bluetooth on M.2 slot */
> +&lpuart7 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart7>;
> +	uart-has-rtscts;
> +	status = "disabled";
> +};
> +
> +&lpuart8 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart8>;
> +	status = "okay";
> +};
> +
> +&pcf85063 {
> +	/* RTC_EVENT# from SoM is connected on mainboard */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pcf85063>;
> +	interrupt-parent = <&gpio1>;
> +	interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
> +};
> +
> +&tpm5 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_tpm5>;
> +};
> +
> +&usbotg1 {
> +	disable-over-current;
> +	dr_mode = "peripheral";
> +	samsung,picophy-pre-emp-curr-control = <3>;
> +	samsung,picophy-dc-vol-level-adjust = <7>;
> +	status = "okay";
> +};
> +
> +&usbotg2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usbhub>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	disable-over-current;
> +	dr_mode = "host";
> +	vbus-supply = <&reg_5v0_usb>;
> +	samsung,picophy-pre-emp-curr-control = <3>;
> +	samsung,picophy-dc-vol-level-adjust = <7>;
> +	status = "okay";
> +
> +	hub_2_0: usb-hub@1 {
> +		compatible = "usb424,2517";
> +		reg = <1>;
> +		reset-gpios = <&gpio2 22 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&reg_3v3>;
> +	};
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc2_hs>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_uhs>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_uhs>, <&pinctrl_usdhc2_gpio>;
> +	bus-width = <4>;
> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	no-sdio;
> +	no-mmc;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	bus-width = <4>;
> +	non-removable;
> +	vmmc-supply = <&reg_3v3>;
> +};
> +
> +&iomuxc {
> +	pinctrl_backlight: backlightgrp {
> +		fsl,pins = /* HYS | PD | FSEL_2 | DSE X4 */
> +			   <MX93_PAD_GPIO_IO05__GPIO2_IO05			0x011e>;
> +	};
> +
> +	pinctrl_display: displaygrp {
> +		fsl,pins = /* HYS | PD | FSEL_2 | DSE X4 */
> +			   <MX93_PAD_GPIO_IO07__GPIO2_IO07			0x011e>;
> +	};
> +
> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins = /* PD | FSEL_2 | DSE X4 */
> +			   <MX93_PAD_ENET1_MDC__ENET_QOS_MDC				0x51e>,
> +			   /* SION | HYS | FSEL_2 | DSE X4 */
> +			   <MX93_PAD_ENET1_MDIO__ENET_QOS_MDIO				0x4000111e>,
> +			   /* HYS | FSEL_0 | DSE no drive */
> +			   <MX93_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x1000>,
> +			   <MX93_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x1000>,
> +			   <MX93_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x1000>,
> +			   <MX93_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x1000>,
> +			   <MX93_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x1000>,
> +			   /* HYS | PD | FSEL_0 | DSE no drive */
> +			   <MX93_PAD_ENET1_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x1400>,
> +			   /* PD | FSEL_2 | DSE X5 */
> +			   <MX93_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x53e>,
> +			   <MX93_PAD_ENET1_TD1__ENET_QOS_RGMII_TD1			0x53e>,
> +			   <MX93_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x53e>,
> +			   <MX93_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x53e>,
> +			   <MX93_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x53e>,
> +			   /* PD | FSEL_3 | DSE X4 */
> +			   <MX93_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x59e>;
> +	};
> +
> +	pinctrl_eqos_phy: eqosphygrp {
> +		fsl,pins = /* HYS | FSEL_0 | DSE no drive */
> +			   <MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x1000>;
> +	};
> +
> +	pinctrl_fec: fecgrp {
> +		fsl,pins = /* PD | FSEL_2 | DSE X4 */
> +			   <MX93_PAD_ENET2_MDC__ENET1_MDC		0x51e>,
> +			   /* SION | HYS | FSEL_2 | DSE X4 */
> +			   <MX93_PAD_ENET2_MDIO__ENET1_MDIO		0x4000111e>,
> +			   /* HYS | FSEL_0 | DSE no drive */
> +			   <MX93_PAD_ENET2_RD0__ENET1_RGMII_RD0		0x1000>,
> +			   <MX93_PAD_ENET2_RD1__ENET1_RGMII_RD1		0x1000>,
> +			   <MX93_PAD_ENET2_RD2__ENET1_RGMII_RD2		0x1000>,
> +			   <MX93_PAD_ENET2_RD3__ENET1_RGMII_RD3		0x1000>,
> +			   <MX93_PAD_ENET2_RX_CTL__ENET1_RGMII_RX_CTL	0x1000>,
> +			   /* HYS | PD | FSEL_0 | DSE no drive */
> +			   <MX93_PAD_ENET2_RXC__ENET1_RGMII_RXC		0x1400>,
> +			   /* PD | FSEL_2 | DSE X5 */
> +			   <MX93_PAD_ENET2_TD0__ENET1_RGMII_TD0		0x53e>,
> +			   <MX93_PAD_ENET2_TD1__ENET1_RGMII_TD1		0x53e>,
> +			   <MX93_PAD_ENET2_TD2__ENET1_RGMII_TD2		0x53e>,
> +			   <MX93_PAD_ENET2_TD3__ENET1_RGMII_TD3		0x53e>,
> +			   <MX93_PAD_ENET2_TX_CTL__ENET1_RGMII_TX_CTL	0x53e>,
> +			   /* PD | FSEL_3 | DSE X4 */
> +			   <MX93_PAD_ENET2_TXC__ENET1_RGMII_TXC		0x59e>;
> +	};
> +
> +	pinctrl_fec_phy: fecphygrp {
> +		fsl,pins = /* HYS | FSEL_0 | DSE no drive */
> +			   <MX93_PAD_CCM_CLKO2__GPIO3_IO27		0x1000>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = /* HYS | PU | FSEL_0 | DSE no drive */
> +			   <MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1200>,
> +			   /* PU | FSEL_3 | DSE X4 */
> +			   <MX93_PAD_PDM_CLK__CAN1_TX			0x039e>;
> +	};
> +
> +	pinctrl_flexcan2: flexcan2grp {
> +		fsl,pins = /* HYS | PU | FSEL_0 | DSE no drive */
> +			   <MX93_PAD_GPIO_IO27__CAN2_RX			0x1200>,
> +			   /* PU | FSEL_3 | DSE X4 */
> +			   <MX93_PAD_GPIO_IO25__CAN2_TX			0x039e>;
> +	};
> +
> +	pinctrl_gpio2: gpio2grp {
> +		fsl,pins = /* HYS | PD | FSEL_2 | DSE X4 */
> +			   <MX93_PAD_GPIO_IO16__GPIO2_IO16		0x151e>,
> +			   <MX93_PAD_GPIO_IO17__GPIO2_IO17		0x151e>,
> +			   <MX93_PAD_GPIO_IO18__GPIO2_IO18		0x151e>,
> +			   <MX93_PAD_GPIO_IO19__GPIO2_IO19		0x151e>,
> +			   <MX93_PAD_GPIO_IO20__GPIO2_IO20		0x151e>,
> +			   <MX93_PAD_GPIO_IO21__GPIO2_IO21		0x151e>,
> +			   <MX93_PAD_GPIO_IO26__GPIO2_IO26		0x151e>;
> +	};
> +
> +	pinctrl_jtag: jtaggrp {
> +		fsl,pins = <MX93_PAD_DAP_TCLK_SWCLK__JTAG_MUX_TCK	0x051e>,
> +			   <MX93_PAD_DAP_TDI__JTAG_MUX_TDI		0x1200>,
> +			   <MX93_PAD_DAP_TDO_TRACESWO__JTAG_MUX_TDO	0x031e>,
> +			   <MX93_PAD_DAP_TMS_SWDIO__JTAG_MUX_TMS	0x1200>;
> +	};
> +
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = /* SION | HYS | OD | FSEL_3 | DSE X4 */
> +			   <MX93_PAD_GPIO_IO28__LPI2C3_SDA		0x4000199e>,
> +			   <MX93_PAD_GPIO_IO29__LPI2C3_SCL		0x4000199e>;
> +	};
> +
> +	pinctrl_lpi2c3_gpio: lpi2c3-gpiogrp {
> +		fsl,pins = /* SION | HYS | OD | FSEL_3 | DSE X4 */
> +			   <MX93_PAD_GPIO_IO28__GPIO2_IO28		0x4000199e>,
> +			   <MX93_PAD_GPIO_IO29__GPIO2_IO29		0x4000199e>;
> +	};
> +
> +	pinctrl_lpspi6: lpspi6grp {
> +		fsl,pins = /* HYS | PD | FSEL_0 | DSE no drive */
> +			   <MX93_PAD_GPIO_IO01__LPSPI6_SIN		0x1400>,
> +			   /* PD | FSEL_2 | DSE X4 */
> +			   <MX93_PAD_GPIO_IO02__LPSPI6_SOUT		0x051e>,
> +			   <MX93_PAD_GPIO_IO03__LPSPI6_SCK		0x051e>;
> +	};
> +
> +	pinctrl_lpspi6_cs: lpspi6csgrp {
> +		fsl,pins = /* FSEL_2 | DSE X4 */
> +			   <MX93_PAD_GPIO_IO00__GPIO2_IO00		0x011e>;
> +	};
> +
> +	pinctrl_m2_key_b: m2keybgrp {
> +		fsl,pins = <MX93_PAD_SAI1_TXC__GPIO1_IO12		0x00001000>,
> +			   <MX93_PAD_SAI1_TXD0__GPIO1_IO13		0x00001000>;
> +	};
> +
> +	pinctrl_m2_key_e: m2keyegrp {
> +		fsl,pins = <MX93_PAD_I2C2_SCL__GPIO1_IO02		0x00001000>,
> +			   <MX93_PAD_UART2_RXD__GPIO1_IO06		0x00001000>,
> +			   <MX93_PAD_UART2_TXD__GPIO1_IO07		0x00001000>,
> +			   <MX93_PAD_SAI1_TXFS__GPIO1_IO11		0x00001000>;
> +	};
> +
> +	/*CAM_MCLK, DSI_GPIO, CAM_TRIGGER, CAM_SYNC*/
> +	pinctrl_mipi_csi_dsi: mipi_csi_dsigrp {
> +		fsl,pins = <MX93_PAD_CCM_CLKO3__CCMSRCGPCMIX_CLKO3     0x0000011e>,
> +			   <MX93_PAD_CCM_CLKO4__GPIO4_IO29             0x0000011e>,
> +			   <MX93_PAD_GPIO_IO23__GPIO2_IO23             0x0000011e>,
> +			   <MX93_PAD_GPIO_IO24__GPIO2_IO24             0x0000111e>;
> +	};
> +
> +	pinctrl_pcf85063: pcf85063grp {
> +		fsl,pins = /* HYS | FSEL_0 | No DSE */
> +			   <MX93_PAD_SAI1_RXD0__GPIO1_IO14		0x1000>;
> +	};
> +
> +	pinctrl_tpm5: tpm5grp {
> +		fsl,pins = <MX93_PAD_GPIO_IO06__TPM5_CH0		0x57e>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = /* HYS | FSEL_0 | No DSE */
> +			   <MX93_PAD_UART1_RXD__LPUART1_RX		0x1000>,
> +			   /* FSEL_2 | DSE X4 */
> +			   <MX93_PAD_UART1_TXD__LPUART1_TX		0x011e>;
> +	};
> +
> +	pinctrl_uart3: uart3grp {
> +		fsl,pins = /* HYS | FSEL_0 | No DSE */
> +			   <MX93_PAD_GPIO_IO15__LPUART3_RX		0x1000>,
> +			   /* FSEL_2 | DSE X4 */
> +			   <MX93_PAD_GPIO_IO14__LPUART3_TX		0x011e>;
> +	};
> +
> +	pinctrl_uart7: uart7grp {
> +		fsl,pins = <MX93_PAD_GPIO_IO08__LPUART7_TX             0x031e>,
> +			   <MX93_PAD_GPIO_IO09__LPUART7_RX             0x031e>,
> +			   <MX93_PAD_GPIO_IO10__LPUART7_CTS_B          0x031e>,
> +			   <MX93_PAD_GPIO_IO11__LPUART7_RTS_B          0x031e>;
> +	};
> +
> +	pinctrl_uart8: uart8grp {
> +		fsl,pins = /* HYS | FSEL_0 | No DSE */
> +			   <MX93_PAD_GPIO_IO13__LPUART8_RX		0x1000>,
> +			   /* FSEL_2 | DSE X4 */
> +			   <MX93_PAD_GPIO_IO12__LPUART8_TX		0x011e>;
> +	};
> +
> +	pinctrl_usbhub: usbhubgrp {
> +		fsl,pins = /* HYS | PD | FSEL_2 | DSE X4 */
> +			   <MX93_PAD_GPIO_IO22__GPIO2_IO22		0x151e>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = /* HYS | FSEL_0 | No DSE */
> +			   <MX93_PAD_SD2_CD_B__GPIO3_IO00		0x1000>;
> +	};
> +
> +	/* enable SION for data and cmd pad due to ERR052021 */
> +	pinctrl_usdhc2_hs: usdhc2hsgrp {
> +		fsl,pins = /* PD | FSEL_3 | DSE X5 */
> +			   <MX93_PAD_SD2_CLK__USDHC2_CLK		0x05be>,
> +			   /* HYS | PU | FSEL_3 | DSE X4 */
> +			   <MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e>,
> +			   /* HYS | PU | FSEL_3 | DSE X3 */
> +			   <MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x4000138e>,
> +			   <MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x4000138e>,
> +			   <MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x4000138e>,
> +			   <MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x4000138e>,
> +			   /* FSEL_2 | DSE X3 */
> +			   <MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x010e>;
> +	};
> +
> +	/* enable SION for data and cmd pad due to ERR052021 */
> +	pinctrl_usdhc2_uhs: usdhc2uhsgrp {
> +		fsl,pins = /* PD | FSEL_3 | DSE X6 */
> +			   <MX93_PAD_SD2_CLK__USDHC2_CLK		0x05fe>,
> +			   /* HYS | PU | FSEL_3 | DSE X4 */
> +			   <MX93_PAD_SD2_CMD__USDHC2_CMD		0x4000139e>,
> +			   <MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x4000139e>,
> +			   <MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x4000139e>,
> +			   <MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x4000139e>,
> +			   <MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x4000139e>,
> +			   /* FSEL_2 | DSE X3 */
> +			   <MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x010e>;
> +	};
> +
> +	/* enable SION for data and cmd pad due to ERR052021 */
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = /* PD | FSEL_3 | DSE X6 */
> +			   <MX93_PAD_SD3_CLK__USDHC3_CLK		0x05fe>,
> +			   /* HYS | PU | FSEL_3 | DSE X4 */
> +			   <MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000139e>,
> +			   <MX93_PAD_SD3_DATA0__USDHC3_DATA0		0x4000139e>,
> +			   <MX93_PAD_SD3_DATA1__USDHC3_DATA1		0x4000139e>,
> +			   <MX93_PAD_SD3_DATA2__USDHC3_DATA2		0x4000139e>,
> +			   <MX93_PAD_SD3_DATA3__USDHC3_DATA3		0x4000139e>;
> +	};
> +};
> --
> 2.43.0
>
