Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7494925228D
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 01:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775527133; cv=fail; b=lCB+OZ1ZUNx9TT738HvLnZDVsJgfc+zgOuVjpXmtu6DTxEnrPyWS/2ycEkS34ew5TG7r3Ujrx01ex8y5lN2oh1qvNCowNJwY2tOmEiI7I5S6ZhOry+mD8bfz3KubTmpl3wdf1a4kYjlJs0Yi4hMbD/WnFX/bHjbptMZVELwi8vM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775527133; c=relaxed/simple;
	bh=EubwhISH1eA+YjQHp2v22ZYAofTeLkPXGu3iwin4kzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uLQ9VOgJwS3C+UBYQJ2ICJAunffvuqkw9CpBaDGHmJidGAoU0LEhitB+Ex385nGS8T1y+dsU40IQhEW/h66HoA7AzVdb1lDekE3IDTvYrI80VOGtyZP5drht6NyCtHahMTCQ78Xr5KAD2gJqUIaXCXfOThuoeE+bEZ98ziJGR8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EkhK2n5Y; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EkhK2n5Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SncGC5pL9nBGBk6eQdt3JmIl9G+26OUjayDZ1mwup3cbZAfHaT316Qjc1Jo5yZEyyH48vzlr50oE//c2FhKEerGExCUnhW6RghdWIiTTKHrw1lLCBD4n8WHlpsHmpTd65D735nrDgaUURp4a57qSa9oE0YC0FNOzelWQ/yk7RoshFer+GlFL+o8h558vjolr10w8Gb6qDRGbYtJcv4u4Kyx3iff0ppdIKoZWcyGOkVLJyiJtkMJFKUtmHALX+w/6w4vLKaZ7NNZm52uWWwajg5fq/ya4R95wE2D+TyHWZGTRMx87ibzIwEcAGThXoRraWGnZmECUEJyqq1WFZ2A52w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67UD+i1iuDaqDGP0iaS/6YLAh0FvD2uno2EZiGs5b7Y=;
 b=m5YKgCJzvwu/7/69QFIpD7UQLvVTX8DzbH+IdOnFuxWKAm8RwFldJhNKuYewagG/aKTQDVqanAlA8TdO5Gf87UXFi77dD440E0luoRuP9uAxX4YoGn0jbCKnVt7jULGLOLZT/+M3VZZeRIScEgHRlu7oNCGbGOIz/PpdtkaGkS7Y7++Iw/4lmzwI8DVv7fKJlHD6ExW/0qHOAmpSPB/u+Q8wdf7venRzW9qPFfMpJkdrPfm7c9wFgH8/qY0SadAK+qYt94fMCwD7oW2phofR+WLmHBc7GzJy8D55PwUV/UMVy4JChLPX9BkHzXNMDuY8CM5t5cpxjM4ToOpO3M+llQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67UD+i1iuDaqDGP0iaS/6YLAh0FvD2uno2EZiGs5b7Y=;
 b=EkhK2n5YbWHIW7egFp4G7CZQTI2AiJ75MBCTG4A9D0OGhcrGsQERltBRu4dm7/R0wBUQznj+KECt2l92KIIsAw8i2IZeO8E5yf0sb4gdWTluGge0WPrRyGPENKKTWXB1wERWGaejCg4pRH1zRue1Z61T3R/intb7Jip850+LAjHtTv8Rsiai4PguyyjYl1Zg/Jjj3d2r3ypWXthEUrAIHmVAFylN1gAd4dKwss8XnmYqnK0I6p+0m6usBYybfev3JcSZlPoZ3hdQbBQwTu0EohGbSWKrJLjjHwoVe/CuRauRB8Pbp1K3sMZbEBoDmI26y97c8GH+eKd44t2pAYcfiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8848.eurprd04.prod.outlook.com (2603:10a6:102:20f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 01:58:48 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Tue, 7 Apr 2026
 01:58:48 +0000
Date: Mon, 6 Apr 2026 21:58:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mm: imx8mp: Add DTOs for Data Modul
 i.MX8M Mini and Plus eDM SBC
Message-ID: <adRhN_DDthCDHymn@lizhi-Precision-Tower-5810>
References: <20260406215959.184061-1-marex@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406215959.184061-1-marex@nabladev.com>
X-ClientProxiedBy: SN7P222CA0017.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f8b541-6b54-4ae0-8280-08de9449357b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	/sHgBe/9Jo77mVJdl4/TZW05tHJQ7SehtUXT+dgz4yL4ZHqQR4Lb+WiaRkTRo1Pe7puD+OrB9ku9UX3v5JIVLbn4Fs8ToE1olXYocDONyRq1Vd/+l4Iq3iGuH1hcqQFAbpX9qvXmRMCCEMx9p3gvJVKFycZdvlgvu/8dxGUh2ETIOM1b5A4N/s/JwjmTXJTtzxN7pTK6lSkmChPvZQH0u481VDdOXJTVcdV8S5LqW9JG+eBwtNLRRg4Yek4KO8DQSjmRU78/Hbhie7Ma0c28CBXAvJyUPpNsqqjNgvw+6rzWYQewV4c9PkXsmezicumV0j/tEgWFDDXuKxwbQKxRcyv+M0jQ7PuUkhMAxiJFm9MOLBZ26VvGj6YJWbytqgmySl9dcyWlLgwovdLgky/F46x4/Zb4IrekEjadeHdN9Diqy8ylyo+jjCeZhhXD7uOfGeJECT416svH/YZUncglKNYPZuAm/8NRaIeqz04lW9KpWDPLIOu7uB2v8cYGMJq9JxDt6WeKB2BMLsrniyLVlPJ8xiDAfN3vJwXgqZaoQgT1/9Usq0x4cRgylQitbVzTgN3gJxY3Z3zax/L8o8oCDRJsYGm4+3wPPXAJMRn2YQ8tnkhKqbQtCFEm3zSQbhr8UztVpcHeVEXBk+BBcQZ7mLFzt09fmK+LlZibMXunGi/xvs4aBAgQU+htqKO9HCdhnR0GUL2eWV+l56PfNoBfRPkK4p+yTcPFPI0Fap2DVI9oGtt50ty86UggCvA20d9oHIsv5krgMAF3Zrh5ZVg9lmseX8FDRACUikRQ2p7Rf9k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5awQeZp0czJULSPw6ojJgWDdedOLX2LUzrKnIswHOeZVb+iJVAI0riu9CIis?=
 =?us-ascii?Q?Dr5C6nhaFiLPcsZ9xnHXK87io/IPxA4GI3DFFYNLmQCgfrmTinGZM5htYmTf?=
 =?us-ascii?Q?wOUghjfvxgkaZ+cB481f3b4WFBwj3562Eqq5SaBRkOTbRCrF0avjIJeRdh0G?=
 =?us-ascii?Q?O4UfPYgjQ2avFes/miGYqaw95VNyeaXT//kzbBN9kgvKwc8YkiCuUSXJWXov?=
 =?us-ascii?Q?3z9e4Ncljzfjmr/KSubIY3VxbJKnC18iyMReGSJfyy5GrwqomGeLg3fL7cxV?=
 =?us-ascii?Q?QAewSQRZ9kseGWdLmxBD09TRhZZ8w99GBKJF4xOr3MUuYM7bS1Ug/ImAM0Af?=
 =?us-ascii?Q?gOJmP/VheSfeRz8jwprqJTL+tJ8G16hRZEMCCxjGuIRzyqSXxQ2iAIj0CT1c?=
 =?us-ascii?Q?t9AGzvFLn7Z66Y6ywdiFX9WE+CH2MWpaQTF2JE8HaWYgM5lh+EdpyWjWi3oK?=
 =?us-ascii?Q?oDskf6nMW907CUxbCc+Ua8EZgDHAad5qssYt8JHmc3sOmsi9CipiBp4s+jn2?=
 =?us-ascii?Q?gck11oMok7mKVITo0XGhGKXV94f5yHJ8mpQ4a8fDhXXUgVCZcTCdbOhYkr7s?=
 =?us-ascii?Q?zqTaLSGhqwngSDdKmuub3PelDen08DoyA2HRaEzU1z+tmG4DeVn9QO8PlmRY?=
 =?us-ascii?Q?I2dxIJ/vzOaRVFkNtPPOlwHT1jIi96/1ie0Byb2icnPt+ZKci61/cn0vo5e8?=
 =?us-ascii?Q?BhXgGolqSjJgEJDs6toTeSrg5bxQiWIb5JFuh7IPNgXpvTrwCHRLwjqcxckL?=
 =?us-ascii?Q?NfP6hHa+Psoj2qMJNLd9D08ISPDJ/drUCLKONE3ZJN8wnPdPdAymdkfw0/H8?=
 =?us-ascii?Q?iSsk57KFWnmQp/3ZusPvvJ8kUieD/pJ29F/E7jXEqe4Woay3VYhkIDneQyiG?=
 =?us-ascii?Q?lF6Au7b7ijL8Z5Mu268IEUcV42cIokn8itgP7/tSALjh54NZGVCMp7AEayuK?=
 =?us-ascii?Q?IGflG/LG8W7BNzdhtEZNHbHEvWToZdoxX0cAvfFmB8Chc7NfN4/Icjo+cYJd?=
 =?us-ascii?Q?IklctqmyAVkS1N9go6ut+QPDsrpOInmO10x1XsrAEHg46gBdS31CPszx940U?=
 =?us-ascii?Q?Zwzho7r5WjqP0iZV/tk2JOCs/iD7Lz+kFXz1s6IRKjPLYSMZTPYOcjEZTqzH?=
 =?us-ascii?Q?Zova3Uu6bTJCrk+Il2r5wZCweVSp+AzQnJzHsQqHrVq9NcvnsnYpB2FXFCo2?=
 =?us-ascii?Q?XR/JqX7b/RQ1J15S5kKqVt5Dr6ZytX/HV94bpO3mzklvv7FJENHvHP9Hmx06?=
 =?us-ascii?Q?ZXqrURAbUaih5Ts5+CQSNV9ggxlQOzPHV6SPGeF0UN61bmxYwSWYsjsZIuQD?=
 =?us-ascii?Q?O1jVcnpAbejZYxIGz6IUCoWFQZsnaaqAk6bzoGhEIpUXelZ+LJRliPnB0UuY?=
 =?us-ascii?Q?kgzVpTkhf14s9p+qp/NBdy0brrMp67sRVd2PUmqMfEw2FrFusVUAzGr7yoJi?=
 =?us-ascii?Q?AZYKw2aJrTWX3E1KU4R+MJXHZzGyY4PXL3kY6+oIbj4227+d4juvZsIch2Tu?=
 =?us-ascii?Q?XDys+b+ciEZVVsEyKub3064edM58gaP+kCvmtn+2b/D40D1TwZRCi3lh9w4+?=
 =?us-ascii?Q?1h8Pr8Rp7dTxqJ/suBE1zqWpHZkiiMnzvUGdZbiGwbq7Yoh2TW810ejJ/ztM?=
 =?us-ascii?Q?h9o38RLkgpBSjAD63zvw/vExnJrcvpGzJwrGjhbTvX8OsAXy+m23h+iluONS?=
 =?us-ascii?Q?nJN4csxUYnHXExDpQf9M0f1vJzTlU41gLyrH/Fj4/JEUEGtB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f8b541-6b54-4ae0-8280-08de9449357b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 01:58:48.6039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FRyJb2m3KaM1KFwaDdv40zd4VRuBXbEFXVLlnHNGLNkqnhWOBfaK0/aF2XvzKnAagARdUcjvoGZqx/s5vRFPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8848

On Mon, Apr 06, 2026 at 11:58:45PM +0200, Marek Vasut wrote:
> Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1
> providing additional UARTs, CAN, PWM Beeper, I2C, SPI and GPIO breakout.
> This adapter can be optionally populated onto the eDM SBC.
>
> Add DT overlay for the DSI-to-HDMI adapter eDM-MOD-iMX8Mm-HDMI populated
> with Lontium LT9611 bridge. This adapter can be optionally populated onto
> the eDM SBC.
>
> Add DT overlay for the DSI-to-LVDS adapter eDM-MOD-iMX8Mm-LVDS populated
> with Lontium LT9211 bridge. This adapter can be optionally populated onto
> the eDM SBC. This adapter can be extended with multiple panels, currently
> supported are the following:

At least you can split to 3 patches to add these.

...
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> new file mode 100644
> index 0000000000000..f446938b74006
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024-2026 Marek Vasut
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/imx8mm-clock.h>
> +
> +#include "imx8mm-pinfunc.h"
> +#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi"
> +
> +&can_fio {
> +	interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;

Now, I have not good ways to unify this information for difference boards
yet. It is quite common user case, let me think more.

> +};
> +
> +&iomuxc {
> +	pinctrl_codec_mclk: codec-mclk_feature-grp {
> +		fsl,pins = <
> +			/* GPIO4_IO27 */
> +			MX8MM_IOMUXC_SAI2_MCLK_SAI5_MCLK		0x2
> +		>;
> +	};
> +
> +	pinctrl_sai2: sai2_feature-grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_SAI2_RXC_SAI2_RX_BCLK		0x90
> +			MX8MM_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0		0x96
> +			MX8MM_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0		0x90
> +			MX8MM_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC		0x96
> +		>;
> +	};

I think this part should be in main boards's dts file, there should have
hardware plug header, which include these signals.

If there are other added on boards, add-on dtso can resuse the label,
pinctrl_sai2 and pinctrl_codec_mclk.

> +};
> +
> +&pinctrl_hog_feature {
> +	fsl,pins = <
> +		/* GPIO5_IO03 */
> +		MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3				0x40000006
> +		/* GPIO5_IO04 */
> +		MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4				0x40000006
> +
> +		/* CAN_INT# */
> +		MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25			0x40000090
> +	>;
> +};
> +
> +&sai2 {
> +	assigned-clocks = <&clk IMX8MM_CLK_SAI2>;
> +	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
> +	fsl,sai-bit-clock-swap;
> +};
> +
> +&sgtl5000_fio {
> +	VDDA-supply = <&buck4_reg>;
> +	VDDD-supply = <&buck5_reg>;
> +	VDDIO-supply = <&buck4_reg>;

buck4_reg can provide addtional label, such as porta_vdd ..., so needn't
this sections.

> +};
> +
> +&spba2 {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	sai5clk: clock-controller@30050000 {	/* SAI5 */
> +		compatible = "fsl,imx8mm-sai-clock", "fsl,imx8mq-sai-clock";
> +		reg = <0x30050000 0x10000>;
> +		#clock-cells = <1>;

Not sure why need overwrite these informaiton here, suppose it should be
the same for Soc.

Frank
