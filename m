Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013010.outbound.protection.outlook.com [52.101.83.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0992411605
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 16:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469031; cv=fail; b=EOnsaFzoQDHrjWCJAUqVZyGe+xufhU5J02LGVXhPNs5nYp0B5o9CRmF/HAXZT3PNdhPblyVR+TpcEjeXfetcCOlV34owDG2K7Zwnl5y419Q3R5HsuM0u7cFHXpV/9sA5ruZcwb8B+lESV+yfru+/jXrXzEVIX/MG1hkUEmhZo0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469031; c=relaxed/simple;
	bh=wmtStcq/5JcOGiGqfFp+/JTZHCUhTBqkkBvaLhMgnc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iRnzW8UuBoImDJl+O5ejPYDVRGdWmVB/ahybphoOq2l4HPwSceITFZHWOrWb+sw+pxcbo1eXn7FKQb9AiGNrpN5XAEaP06d1T/qSM866yu/HReHNwq1AP0GzwkDKVKh/XhEeQTS7NJ9TsglJmnMxYh9rzEp7zq5SRUPLGvrgnmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BuE2fZlt; arc=fail smtp.client-ip=52.101.83.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BuE2fZlt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UlAd7navzcjvIT3JzILiMdL2nJH8IJDxEqPyNZBTsjpyzb1cS4Fw6VHr1H3SLVNHydxkHFPN8iYbMykAPwakrHVl5H1PeFnku9rtM0NmUxAlfw2H1GslmLwHl4FSOSwF/nhoztjcQOVHtJqvr2AAjMn9KUbWJAb8dKkCAbAGsah0Qu1WYRY4D/o1mNVJae7DfZmnclL2NrbYScYyds2mcW8n7X/fqFVfK4SNJrh/YeXvMC9Si4RUwEFeIf6fITLJuToqftKsHBWWw1964DbbwxezN8wSBqLx2qKmSvHQ6j81fBkMH9PT0e5/7gPzuDqfRUGZh8Bsb/+MACkbDcEdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyoEiqwJAY5F9G+bz6KL9be/Uv1esmsKDozkFb5PzEI=;
 b=FEs8x0lHO47cxDSfrQnHDuprJr70BvVT3nnvolcYQthbL9+dzoIk+AbPa2CkvQ+zr8hwq2whT9Km8wrmE+GOHPo8pSTbODekl8aXZXbYbjrtIDf66jNT0dcfRNukaSwVSQ2m4zI6cLwvCdjvPi0ZdSWFCvRXqFhGmUCcYMvDuL95v2XoyygBOubaSK70j9Fhqvz1FK8laluE/79OrcB23bzNYTex6GMCCedbAYiP2ea30mGoUMXv4f2GbLxxhgIdV6AW62QowgbALfvPQc8Kyol2Pz15qxgAgATddRb6ymiEM3hEtkD8EnqlJkF4a6PfetjGz5kDcCoQGLTjAkxZPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyoEiqwJAY5F9G+bz6KL9be/Uv1esmsKDozkFb5PzEI=;
 b=BuE2fZlty128oK41vEdP7VmaqC4h7qsaPIFAqBETLLbQDiWymXkcFuNfVxLlA1EUZjAPY83Y0mU6H/RolfhRupUV1GIHMrVaZ5rFtvq2z9vfezCQ6iE7kgFeG1mW9C2g0sciOVQ2333w6OLTc329V519kHA5KR3HxftHi222mm81+szI1LOuaPwe6SVgaL8Fx4qwgN4Kosd+igGF7fxTTsPsuCrP9RuAtvcKPxHUArsQCnJmrPmGrkBOqBg2RlLdI0v0Aw6Z8+W7QCI9jHLy50LAEMJ+vNmVXwCcPbRcvkVn53shF8Kd56RpWKTnPCF669mH4h+pAOgKIl3TBZHW7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VE1PR04MB7295.eurprd04.prod.outlook.com (2603:10a6:800:1ac::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 16:30:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:30:21 +0000
Date: Mon, 2 Mar 2026 11:30:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com,
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX91
Message-ID: <aaW7EpLmhxk3elmd@lizhi-Precision-Tower-5810>
References: <20260205100125.9095-1-stefano.r@variscite.com>
 <20260205100125.9095-3-stefano.r@variscite.com>
 <aYSzgRRGewX6uSlc@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYSzgRRGewX6uSlc@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: BY5PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::40) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VE1PR04MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 0737301e-61f6-41a3-22b5-08de7878ffbb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info:
 uLWezwmIvUqpM9M3kAf8BIJewuBGiybesIgSLgLStSdNy7piV/tS6cIrYhdyHZDa4Eox9TSCqZlvijnAYeL+2CVBRGrmtr4Dy3JE1C2PSyF4EPLItkxSO65715pMtxTFRZt/4BlyyFLwNsFU+6Ui2rWCUJE3cc0eNBA93aqD3O3bWivPEQl6LQrs5zK1RVYkSzhUR6zHhi3Q4YjsHuhMC58T/MnBc2kE/qkQ2oPuookcucKMNgtejo0CSSJolGVNYWqM4fU61T3XT6lwx72C5iOvr3lrzUpeTPpL8+XAa18jXxYVJB5BR2aJZtoWSLaTyvjPDL3gxMHH+o+Gt2RcwIUWT7/RXkr9w4M1dYylAdGtSr3FoIiHDtQYhIQpvrKagqRUk1WeyVgnyfLN3tDJn8VS/O1TKb8mIF2zlBcnvUSi7Jjv1zjW4rc0U05KaLgSSq5mJUCqsb8L5MolzcT5KmNG0Ia8KgbjzQXQJht7l7pOfGxN6JRPeZ83cdZ8C7pynMcKlABhvE+DHJ3F/+/4/KtMeBhm3ZMKvNLptK6bif9hUyGZgghM4r74Qrp59oX+UI0+GhZpx40FHUmCIV0ECEJA8gck62TYrVhvV6ekZ1CesasLUzTHjWZtlXelsvvb4NytLLGoQ2U2VRSDdSjHBotlSOjrPs1qEhhnPqi2wTpqJ/zrNEKTBMN+5P4W6KmCkQ7i9TCYpcOa9IM+Tqx0fZro5Afh2Y43dHf09EFX768=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?7jShqk/KUZ0uRD9LRb91yLAzw84BgJ5z18eOdRWkXYvZai7bVe9SQfG5BAiq?=
 =?us-ascii?Q?iHoM0mNhQsBvSK7l+FfRkGd76rt4hh5LPtkpxhJJ6QnRTKfkkhPOhASQt2cy?=
 =?us-ascii?Q?YJ9xhXm+9qm1PpfLbk0FVQnRUlpdmSyHqnQOfKCeOReUguwXTYaqGbbJd0L5?=
 =?us-ascii?Q?9U/lLYehjK+PBu31SdokQjvBnVYHoNpdI0451gxDj3Y3XuQnFahR/T0/Gcgs?=
 =?us-ascii?Q?bSC6DebskVxL10Bj9Jbaw+ABdF15WTmJ5T2bGoryg4N90O+iJ/r17piXgQTQ?=
 =?us-ascii?Q?j0ovGik1wNGuXJBccPpGRZ9vWXn/mYuP8OxsAPLXeldTXNm0I5r3sUvBPc1s?=
 =?us-ascii?Q?aAUUxo5ensVSPUypG8llHvF76XW+RNsa3XhVRJGQDd3S+39Q7t2usK11ztsT?=
 =?us-ascii?Q?UUgI4NLIN3GCeLXlykgqXEi+LRdcnJTlovnIL48af8Omi/uXz+zChEAl45BH?=
 =?us-ascii?Q?GPN5F7ub84Fq+bo8AnN5myMfkz2cwJAHi0xmfGCynjpNuq+f+Ytc5VVban1c?=
 =?us-ascii?Q?nDhvn3K58Ycpdpi1A1dfu9Q0UJIi2Zk3h7sxTHY7jKerw1UjB8P45GORh6dh?=
 =?us-ascii?Q?qR8B5eMmVUK4vYA+An14QRLdsMduO9/V2mLTEWcYea6aYfCkhqX1uv6ncutf?=
 =?us-ascii?Q?NnONO4nE/Ylm71Lewtvo5P5gtjVUebmybTwnoaI4FHu1J34lNi9WfFRurYGg?=
 =?us-ascii?Q?ZjfOdKPA45c0ZDZbH++BPLTmzC86vVltEx2RWJ/C6eq+Ljb0H5v0tAeIHPTp?=
 =?us-ascii?Q?jBcDMa5ivX0oOoBbJYqFUMMMP28zzJV1lT2lqW6ryuBy5Dmv2G7pckh+JwjK?=
 =?us-ascii?Q?MKfZmvpnZ9ZR1kqzdmJKLt2IfEmWfgZF+XR86Ys+ydkQz/CvJh8lZLLxumrh?=
 =?us-ascii?Q?cXAKktCVWqXjaUc4gwPqPfbJ8Lz1X3OKCabf1KyN/PqeGC7sJkPOUfXt9BrZ?=
 =?us-ascii?Q?l/rS9r+T71+nF0jgWuHAabmMrfmDJOvofaWtw/6ew0sy5F7imyYWIlg3I7Lw?=
 =?us-ascii?Q?0ImHem5seQuRma7bUP4y3Qb+3Uv8vIL4AdHDmwkvSF0Ag4SrtWsXUPtg2eV8?=
 =?us-ascii?Q?LnYIiQO/Kc9WCPXLzD/4BkI+dH3ElwuG4ZQ0PIdYrLx0K4l9VaVb8s+qjA38?=
 =?us-ascii?Q?4MPWuYwOwQnkIXYBGYw00vdI0S52Y/fKQ0Isfppu/LTd2OgGCPEGyfVWn+nl?=
 =?us-ascii?Q?NGKHUaW6rBOECam/erDmcxqXmppvbzmUZsjkAX+0DL/9gOJtngHWK7zhgh4k?=
 =?us-ascii?Q?8zXCiI7nPoD26q5FJddgoKDb8qWqhruu3WxIMpooa3gHCGjO42Cj6HqtqXVD?=
 =?us-ascii?Q?tLxl+vMgltsKmBIM7E92Xf/dVsBYv7cWH4e5FpWoVrjiUxu9MV3oc/QXyt9v?=
 =?us-ascii?Q?w9Ttvqvwk3zaFRPDnfsBhbqD+T0wgH2OWTRo2M3wMiZJqxGtoon+iRK2oukj?=
 =?us-ascii?Q?ITmC7RuGkzrHK7+LiFne4zRgXINewh0qouQkW/pvjAQ6/t6Ax1QYUx+XSXjF?=
 =?us-ascii?Q?Ab00ovDCHkU7Gs7zlUbdo1a8Ml6BDmyh7+kjLcf47pqMP5Fk64q3WJcmwdkT?=
 =?us-ascii?Q?EE2/q0L6v1t8Qq/3GvawaaX2tR/4OcxqzyIImbBZruJtD5MUYeqp1b83hXV3?=
 =?us-ascii?Q?0rp4d8Yn3gWajCEkztWEPxsipT8dZGhkt2Yi8v4DHRgMUcjlDJKaiU1xSwbe?=
 =?us-ascii?Q?jDj36dmPgUnzvNL+Xt1fHv0j0SheRmKQq8e8raUkxmeFknDX/pCJfDb1NwKY?=
 =?us-ascii?Q?b1JzZ7inVg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0737301e-61f6-41a3-22b5-08de7878ffbb
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:30:21.7132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AASm6Q4dASH82XfpQGWpFG/QKRFV7SVpdkj8pZglU3s7Hhe/T0QlslPY80do3OEft4Yv35MElSrFKWPHrgFN4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7295

On Thu, Feb 05, 2026 at 10:13:05AM -0500, Frank Li wrote:
> On Thu, Feb 05, 2026 at 11:01:24AM +0100, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > Add device tree support for the Variscite DART-MX91 system on module.
> > This SOM is designed to be used with various carrier boards.
> >
> > The module includes:
> > - NXP i.MX91 MPU processor
> > - Up to 2GB of LPDDR4 memory
> > - Up to 128GB of eMMC storage memory
> > - Integrated 10/100/1000 Mbps Ethernet Transceiver
> > - Codec audio WM8904
> > - WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth
> >
> > Only SOM-specific peripherals are enabled by default. Carrier board
> > specific interfaces are left disabled to be enabled in the respective
> > carrier board device trees.
> >
> > Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-91/dart-mx91/
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

dts part can't apply, please rebase.

Frank
> >
> > Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> > ---
> >  .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 ++++++++++++++++++
> >  1 file changed, 468 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
> > new file mode 100644
> > index 000000000000..e87b7abd86bb
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
> > @@ -0,0 +1,468 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Common dtsi for Variscite DART-MX91
> > + *
> > + * Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-91/dart-mx91/
> > + *
> > + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> > + *
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/usb/pd.h>
> > +#include "imx91.dtsi"
> > +
> > +/ {
> > +	model = "Variscite DART-MX91 Module";
> > +	compatible = "variscite,var-dart-mx91", "fsl,imx91";
> > +
> > +	sound-wm8904 {
> > +		compatible = "simple-audio-card";
> > +		simple-audio-card,bitclock-master = <&codec_dai>;
> > +		simple-audio-card,format = "i2s";
> > +		simple-audio-card,frame-master = <&codec_dai>;
> > +		simple-audio-card,mclk-fs = <256>;
> > +		simple-audio-card,name = "wm8904-audio";
> > +		simple-audio-card,routing =
> > +			"Headphone Jack", "HPOUTL",
> > +			"Headphone Jack", "HPOUTR",
> > +			"IN2L", "Line In Jack",
> > +			"IN2R", "Line In Jack",
> > +			"IN1L", "Microphone Jack",
> > +			"IN1R", "Microphone Jack";
> > +		simple-audio-card,widgets =
> > +			"Microphone", "Microphone Jack",
> > +			"Headphone", "Headphone Jack",
> > +			"Line", "Line In Jack";
> > +
> > +		codec_dai: simple-audio-card,codec {
> > +			sound-dai = <&wm8904>;
> > +		};
> > +
> > +		simple-audio-card,cpu {
> > +			sound-dai = <&sai1>;
> > +		};
> > +	};
> > +
> > +	wifi_pwrseq: wifi-pwrseq {
> > +		compatible = "mmc-pwrseq-simple";
> > +		post-power-on-delay-ms = <100>;
> > +		power-off-delay-us = <10000>;
> > +		reset-gpios = <&gpio4 14 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
> > +			      <&gpio3 7 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
> > +	};
> > +};
> > +
> > +&eqos {
> > +	pinctrl-names = "default", "sleep";
> > +	pinctrl-0 = <&pinctrl_eqos>;
> > +	pinctrl-1 = <&pinctrl_eqos_sleep>;
> > +	/*
> > +	 * The required RGMII TX and RX 2ns delays are implemented directly
> > +	 * in hardware via passive delay elements on the SOM PCB.
> > +	 * No delay configuration is needed in software via PHY driver.
> > +	 */
> > +	phy-mode = "rgmii";
> > +	phy-handle = <&ethphy0>;
> > +	snps,clk-csr = <5>;
> > +	status = "okay";
> > +
> > +	mdio {
> > +		compatible = "snps,dwmac-mdio";
> > +		clock-frequency = <1000000>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		ethphy0: ethernet-phy@0 {
> > +			compatible = "ethernet-phy-ieee802.3-c22";
> > +			reg = <0>;
> > +			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
> > +			reset-assert-us = <15000>;
> > +			reset-deassert-us = <100000>;
> > +
> > +			leds {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				led@0 {
> > +					reg = <0>;
> > +					color = <LED_COLOR_ID_YELLOW>;
> > +					function = LED_FUNCTION_LAN;
> > +					linux,default-trigger = "netdev";
> > +				};
> > +
> > +				led@1 {
> > +					reg = <1>;
> > +					color = <LED_COLOR_ID_GREEN>;
> > +					function = LED_FUNCTION_LAN;
> > +					linux,default-trigger = "netdev";
> > +				};
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&lpi2c3 {
> > +	clock-frequency = <400000>;
> > +	pinctrl-names = "default", "sleep", "gpio";
> > +	pinctrl-0 = <&pinctrl_lpi2c3>;
> > +	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
> > +	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
> > +	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +	status = "okay";
> > +
> > +	wm8904: audio-codec@1a {
> > +		compatible = "wlf,wm8904";
> > +		reg = <0x1a>;
> > +		#sound-dai-cells = <0>;
> > +		clocks = <&clk IMX93_CLK_SAI1_GATE>;
> > +		clock-names = "mclk";
> > +		AVDD-supply = <&buck5>;
> > +		CPVDD-supply = <&buck5>;
> > +		DBVDD-supply = <&buck4>;
> > +		DCVDD-supply = <&buck5>;
> > +		MICVDD-supply = <&buck5>;
> > +		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
> > +				    "soft", "music";
> > +		/*
> > +		 * Config registers per name, respectively:
> > +		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
> > +		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
> > +		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
> > +		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
> > +		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
> > +		 */
> > +		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
> > +				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
> > +				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
> > +				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
> > +				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
> > +		/* GPIO1 = DMIC_CLK, don't touch others */
> > +		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
> > +		/* DMIC is connected to IN1L */
> > +		wlf,in1l-as-dmicdat1;
> > +	};
> > +
> > +	pmic@25 {
> > +		compatible = "nxp,pca9451a";
> > +		reg = <0x25>;
> > +
> > +		regulators {
> > +			buck1: BUCK1 {
> > +				regulator-name = "BUCK1";
> > +				regulator-min-microvolt = <650000>;
> > +				regulator-max-microvolt = <2237500>;
> > +				regulator-boot-on;
> > +				regulator-always-on;
> > +				regulator-ramp-delay = <3125>;
> > +			};
> > +
> > +			buck2: BUCK2 {
> > +				regulator-name = "BUCK2";
> > +				regulator-min-microvolt = <600000>;
> > +				regulator-max-microvolt = <2187500>;
> > +				regulator-boot-on;
> > +				regulator-always-on;
> > +				regulator-ramp-delay = <3125>;
> > +			};
> > +
> > +			buck4: BUCK4{
> > +				regulator-name = "BUCK4";
> > +				regulator-min-microvolt = <600000>;
> > +				regulator-max-microvolt = <3400000>;
> > +				regulator-boot-on;
> > +				regulator-always-on;
> > +			};
> > +
> > +			buck5: BUCK5{
> > +				regulator-name = "BUCK5";
> > +				regulator-min-microvolt = <600000>;
> > +				regulator-max-microvolt = <3400000>;
> > +				regulator-boot-on;
> > +				regulator-always-on;
> > +			};
> > +
> > +			buck6: BUCK6 {
> > +				regulator-name = "BUCK6";
> > +				regulator-min-microvolt = <600000>;
> > +				regulator-max-microvolt = <3400000>;
> > +				regulator-boot-on;
> > +				regulator-always-on;
> > +			};
> > +
> > +			ldo1: LDO1 {
> > +				regulator-name = "LDO1";
> > +				regulator-min-microvolt = <1600000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-boot-on;
> > +				regulator-always-on;
> > +			};
> > +
> > +			ldo4: LDO4 {
> > +				regulator-name = "LDO4";
> > +				regulator-min-microvolt = <800000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-boot-on;
> > +				regulator-always-on;
> > +			};
> > +
> > +			ldo5: LDO5 {
> > +				regulator-name = "LDO5";
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-boot-on;
> > +				regulator-always-on;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +/* BT module */
> > +&lpuart5 {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_uart5>, <&pinctrl_bt>;
> > +	uart-has-rtscts;
> > +	status = "okay";
> > +
> > +	bluetooth {
> > +		compatible = "nxp,88w8987-bt";
> > +	};
> > +};
> > +
> > +&sai1 {
> > +	pinctrl-names = "default", "sleep";
> > +	pinctrl-0 = <&pinctrl_sai1>;
> > +	pinctrl-1 = <&pinctrl_sai1_sleep>;
> > +	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> > +	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> > +	assigned-clock-rates = <12288000>;
> > +	#sound-dai-cells = <0>;
> > +	fsl,sai-mclk-direction-output;
> > +	status = "okay";
> > +};
> > +
> > +/* eMMC */
> > +&usdhc1 {
> > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 = <&pinctrl_usdhc1>;
> > +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> > +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> > +	bus-width = <8>;
> > +	non-removable;
> > +	status = "okay";
> > +};
> > +
> > +/* WiFi */
> > +&usdhc3 {
> > +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> > +	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
> > +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
> > +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
> > +	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
> > +	mmc-pwrseq = <&wifi_pwrseq>;
> > +	keep-power-in-suspend;
> > +	bus-width = <4>;
> > +	non-removable;
> > +	wakeup-source;
> > +	status = "okay";
> > +};
> > +
> > +&wdog3 {
> > +	status = "okay";
> > +};
> > +
> > +&iomuxc {
> > +	pinctrl_bt: btgrp {
> > +		fsl,pins = <
> > +			MX91_PAD_ENET2_MDIO__GPIO4_IO15				0x51e
> > +		>;
> > +	};
> > +
> > +	pinctrl_eqos: eqosgrp {
> > +		fsl,pins = <
> > +			MX91_PAD_ENET1_MDC__ENET1_MDC				0x57e
> > +			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
> > +			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
> > +			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
> > +			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
> > +			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
> > +			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC			0x5fe
> > +			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
> > +			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
> > +			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1			0x57e
> > +			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
> > +			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
> > +			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
> > +			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
> > +			MX91_PAD_UART2_TXD__GPIO1_IO7				0x51e
> > +		>;
> > +	};
> > +
> > +	pinctrl_eqos_sleep: eqos-sleepgrp {
> > +		fsl,pins = <
> > +			MX91_PAD_ENET1_MDC__GPIO4_IO0				0x31e
> > +			MX91_PAD_ENET1_MDIO__GPIO4_IO1				0x31e
> > +			MX91_PAD_ENET1_RD0__GPIO4_IO10				0x31e
> > +			MX91_PAD_ENET1_RD1__GPIO4_IO11				0x31e
> > +			MX91_PAD_ENET1_RD2__GPIO4_IO12				0x31e
> > +			MX91_PAD_ENET1_RD3__GPIO4_IO13				0x31e
> > +			MX91_PAD_ENET1_RXC__GPIO4_IO9				0x31e
> > +			MX91_PAD_ENET1_RX_CTL__GPIO4_IO8			0x31e
> > +			MX91_PAD_ENET1_TD0__GPIO4_IO5				0x31e
> > +			MX91_PAD_ENET1_TD1__GPIO4_IO4				0x31e
> > +			MX91_PAD_ENET1_TD2__GPIO4_IO3				0x31e
> > +			MX91_PAD_ENET1_TD3__GPIO4_IO2				0x31e
> > +			MX91_PAD_ENET1_TXC__GPIO4_IO7				0x31e
> > +			MX91_PAD_ENET1_TX_CTL__GPIO4_IO6			0x31e
> > +		>;
> > +	};
> > +
> > +	pinctrl_lpi2c3: lpi2c3grp {
> > +		fsl,pins = <
> > +			MX91_PAD_GPIO_IO28__LPI2C3_SDA				0x40000b9e
> > +			MX91_PAD_GPIO_IO29__LPI2C3_SCL				0x40000b9e
> > +		>;
> > +	};
> > +
> > +	pinctrl_lpi2c3_gpio: lpi2c3gpiogrp {
> > +		fsl,pins = <
> > +			MX91_PAD_GPIO_IO28__GPIO2_IO28				0x40000b9e
> > +			MX91_PAD_GPIO_IO29__GPIO2_IO29				0x40000b9e
> > +		>;
> > +	};
> > +
> > +	pinctrl_sai1: sai1grp {
> > +		fsl,pins = <
> > +			MX91_PAD_SAI1_TXC__SAI1_TX_BCLK				0x31e
> > +			MX91_PAD_SAI1_TXFS__SAI1_TX_SYNC			0x31e
> > +			MX91_PAD_SAI1_TXD0__SAI1_TX_DATA0			0x31e
> > +			MX91_PAD_SAI1_RXD0__SAI1_RX_DATA0			0x31e
> > +			MX91_PAD_I2C2_SDA__SAI1_RX_BCLK				0x31e
> > +			MX91_PAD_I2C2_SCL__SAI1_RX_SYNC				0x31e
> > +			MX91_PAD_UART2_RXD__SAI1_MCLK				0x31e
> > +		>;
> > +	};
> > +
> > +	pinctrl_sai1_sleep: sai1-sleepgrp {
> > +		fsl,pins = <
> > +			MX91_PAD_SAI1_TXC__GPIO1_IO12				0x31e
> > +			MX91_PAD_SAI1_TXFS__GPIO1_IO11				0x31e
> > +			MX91_PAD_SAI1_TXD0__GPIO1_IO13				0x31e
> > +			MX91_PAD_SAI1_RXD0__GPIO1_IO14				0x31e
> > +			MX91_PAD_UART2_RXD__GPIO1_IO6				0x31e
> > +			MX91_PAD_I2C2_SDA__GPIO1_IO3				0x31e
> > +			MX91_PAD_I2C2_SCL__GPIO1_IO2				0x31e
> > +		>;
> > +	};
> > +
> > +	pinctrl_uart5: uart5grp {
> > +		fsl,pins = <
> > +			MX91_PAD_DAP_TDO_TRACESWO__LPUART5_TX			0x31e
> > +			MX91_PAD_DAP_TDI__LPUART5_RX				0x31e
> > +			MX91_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B			0x31e
> > +			MX91_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B			0x31e
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1: usdhc1grp {
> > +		fsl,pins = <
> > +			MX91_PAD_SD1_CLK__USDHC1_CLK				0x1582
> > +			MX91_PAD_SD1_CMD__USDHC1_CMD				0x1382
> > +			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x1382
> > +			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x1382
> > +			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x1382
> > +			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x1382
> > +			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x1382
> > +			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x1382
> > +			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x1382
> > +			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x1382
> > +			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x1582
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> > +		fsl,pins = <
> > +			MX91_PAD_SD1_CLK__USDHC1_CLK				0x158e
> > +			MX91_PAD_SD1_CMD__USDHC1_CMD				0x138e
> > +			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
> > +			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
> > +			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
> > +			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
> > +			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
> > +			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
> > +			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
> > +			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
> > +			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> > +		fsl,pins = <
> > +			MX91_PAD_SD1_CLK__USDHC1_CLK				0x15fe
> > +			MX91_PAD_SD1_CMD__USDHC1_CMD				0x13fe
> > +			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x13fe
> > +			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x13fe
> > +			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x13fe
> > +			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x13fe
> > +			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x13fe
> > +			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x13fe
> > +			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe
> > +			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe
> > +			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc3: usdhc3grp {
> > +		fsl,pins = <
> > +			MX91_PAD_SD3_CLK__USDHC3_CLK				0x1582
> > +			MX91_PAD_SD3_CMD__USDHC3_CMD				0x1382
> > +			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x1382
> > +			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x1382
> > +			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x1382
> > +			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x1382
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> > +		fsl,pins = <
> > +			MX91_PAD_SD3_CLK__USDHC3_CLK				0x158e
> > +			MX91_PAD_SD3_CMD__USDHC3_CMD				0x138e
> > +			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x138e
> > +			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x138e
> > +			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x138e
> > +			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x138e
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> > +		fsl,pins = <
> > +			MX91_PAD_SD3_CLK__USDHC3_CLK				0x15fe
> > +			MX91_PAD_SD3_CMD__USDHC3_CMD				0x13fe
> > +			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x13fe
> > +			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x13fe
> > +			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x13fe
> > +			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x13fe
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc3_sleep: usdhc3-sleepgrp {
> > +		fsl,pins = <
> > +			MX91_PAD_SD3_CLK__GPIO3_IO20				0x31e
> > +			MX91_PAD_SD3_CMD__GPIO3_IO21				0x31e
> > +			MX91_PAD_SD3_DATA0__GPIO3_IO22				0x31e
> > +			MX91_PAD_SD3_DATA1__GPIO3_IO23				0x31e
> > +			MX91_PAD_SD3_DATA2__GPIO3_IO24				0x31e
> > +			MX91_PAD_SD3_DATA3__GPIO3_IO25				0x31e
> > +		>;
> > +	};
> > +
> > +	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> > +		fsl,pins = <
> > +			MX91_PAD_ENET2_MDC__GPIO4_IO14				0x51e
> > +			MX91_PAD_SD2_RESET_B__GPIO3_IO7				0x51e
> > +		>;
> > +	};
> > +};
> > --
> > 2.47.3
> >
