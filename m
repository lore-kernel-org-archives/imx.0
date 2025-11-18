Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012031.outbound.protection.outlook.com [52.101.66.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AE036B073
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 16:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481676; cv=fail; b=anDkIsjykjLt6xCKvCKsJjWaE4L9xuyTJXAOQiY11eXTebWuTCtqNMd0SMtugEUB63VNQ3eSsqxv2s4apyfV5oPaODgWk+80AkVqKYvhGJRKUAr3UJ3+msG19mlPwhjYRhEUP8tVManYpSwJ8IwrsOnIQ0+rla+Z2JIp8fnReMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481676; c=relaxed/simple;
	bh=hpwpo1E6BgRjYdk3ObY7l+Loimf6ppIg908Q/zqB0K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g/AZkmsTBKvPyvJE1WgZPLzzOzy25SUaptoU3nXxsHtq+O+CnP48odeW/WYPRO6Vv05s0NHeqLF3+LvVws6nVmdpaFTOq57DVp5fJF5jRWN/Ty//VrTRzJDLymL+qzIra/NcY4wS2IH1971EDJIENwPyhUVxvC8js5eCR/87Pug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=adHTo3NG; arc=fail smtp.client-ip=52.101.66.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="adHTo3NG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wcx3M5iMKmIIVyKd0EvUYXFAeBK4zVc1lXQacLRQtkCqQbAbjclZHRsSNJ+U+GVpd+3ZVkZ4orI1Z5292m4IwUEDGI9jsVRc57PZ7FySS2x/9s9dRtZrdi6UQk7M3GZevXHxIrXeAbdaxA17mL1Q2n6eQgdn4dmsCwQdbuGv6TLKouMHYyjq2zpdottIjyWxGbJkTqqPEy3aBhmA8vKHzOAsr9skZ/Xa3XBFw+GGrZMJTkaF/vVfurpGxlQIYtnCtwkZQB5jFByfxWuWdsp3sSwFFMEbIWTpaOIctwS3238xsKDDPJtbG8gqen0Cnkj5c9dIwI3E84m4NwD2nUfVVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WK4s4a9oI44Po+t0VcUOtFDRIv/rRTKMQ09dNSun6s8=;
 b=yidbYO+vqLYC2v/rlBw/q0w4ebTLTidOsrPQFdEjJJP+0mRtbkAEaOOvxOJCph45PTgbKSZWZzXs5bPzGbRw1uCLdZgKEyIqgsdleuxtAVp/shNeNMIrq9re1DN51Wo78byG5fTfY4zBg3ka+tbLNYZ72njXijtrvw7v0ECcGaGRW4Ju9fmmy3HtRKnhq4TgmeVBtgPwCRq0zY3/aKQYouVLTOx9znLbYWeGXM3i51tf05G+ieb/6Tb7UhyI7ns/APdyBg3SaBA9zW3MCU5dZJnMtQUf3GTwqY+1N8EztBm7Cj3Hljpb1TOatHYnJCQsPqnSL4zpTNTqYYlQ/hXIeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK4s4a9oI44Po+t0VcUOtFDRIv/rRTKMQ09dNSun6s8=;
 b=adHTo3NGrA5bafzjnCuGpH9CrQqhOknDSXfMFLMvo31gTdGqtiDZzTZpX9EGcGIIJPg9QsU61/fNqIDAvlihoRiS59jgqxGiSlB3qGAzopDYgU0d/Qkr+VN5aRMHsKHe8XtJwROgeyFMZwaH0PItzhv0UaWpcw2KsaVcLHDql4Zq0uFHtitVbaYDLkIre8vUHXeB0bbaoFpamKCzmMD/m7xowGNXNjWiK9qyzH/LeTUXC5QPaSgjuZ1SSOHH22uC/g3KG3PpCBlKGP4bFbCOuFGZrZO8Ki6Z9lPBZZrni67ni83D6/0QeM4drrSrzd7qZwMdwmbDsbH60AfOFcTizQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8601.eurprd04.prod.outlook.com (2603:10a6:20b:438::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 16:01:11 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 16:01:10 +0000
Date: Tue, 18 Nov 2025 11:01:02 -0500
From: Frank Li <Frank.li@nxp.com>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx943-evk: add flexcan support
Message-ID: <aRyYPnn7H/+y+OEA@lizhi-Precision-Tower-5810>
References: <20251118-dts-v1-1-81b6249f455f@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-dts-v1-1-81b6249f455f@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0203.namprd05.prod.outlook.com
 (2603:10b6:a03:330::28) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8601:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd7d712-54c7-4dd0-e593-08de26bbb139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|19092799006|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BBlZ/igPybJ4yFsEmoYZiJ0L2HXA0HRKxYQZ9V6bsU3OBO9zj+Z8H1GPuXxq?=
 =?us-ascii?Q?7ErKCliu8vmuFZmC4OWX/fV19Di/1rG1wA1kq5KLRjmDH3c5Yj+W19e53yVD?=
 =?us-ascii?Q?JgAhSfGX5a9vTaLUE5yKOnO9wmGqcNa29VHi4MADRYNvzXDKbYImADD/xYKn?=
 =?us-ascii?Q?zB3MxCNGweDay47BjPWRzchXI4bBOoEdY1+05iGi7hi+U7hQ+wFga9PVqThd?=
 =?us-ascii?Q?tZK8oE3ssLxGcLaf/ocUDdidmYBIqGm870sXSyoeGzt9yyUf/N9MGNwVAJ0C?=
 =?us-ascii?Q?iV43Dm5ROCXSx55bsEucglN7+30wU0X8m2aJ6albFlP4rmNARGtvFYgsVGfV?=
 =?us-ascii?Q?gGE7FvrWXr52aRVPFUUrLlrlsVwmO2jJX0SbkjmZLi3kgG3xvw8nyCpRRG6m?=
 =?us-ascii?Q?LhvEbFQmsgDcbkF1L2OEou73zDyqIWHoefThI7IqLttL9lcoImw0ixJ+WhCE?=
 =?us-ascii?Q?ft9vjYTjOb+/PrxL3FP9UdHxW1J26driS+T3TJiuGpJCjemhwaXD7SedrJ26?=
 =?us-ascii?Q?fN/xADwP96Vq4Mkc2g3x0OVl+af6rdKZ5j+a0GN9gyFOXgyGoDndhFJiEwG/?=
 =?us-ascii?Q?oV6WXkHXzliefRFTrPJvKxQ5ocOmjnj6/DWXimRVKqVr0U3ZQYrr/YCdhlI/?=
 =?us-ascii?Q?yJL0GtQlodbVPYrR3A0+hdYpgNcrLgzs2e+CZ2fSyOXUoSEc8q1VpwNk0Ywi?=
 =?us-ascii?Q?fB5q1KFT1XU/3AdbzO+hVr4NqIENdpgDrtOfq3wgeV9sbdJje/77ZUdetdCE?=
 =?us-ascii?Q?vb+wAOEyTMdYvTYhnpNsJAIpV7vDDX2w0hNgQx17LJEepH36nEFAJoVTFXT+?=
 =?us-ascii?Q?yMAriVm2yTWtoY2qSzN/HCIRSJqwnMHqXEnNa4clzZYhWJ00whaHd/ltWoQx?=
 =?us-ascii?Q?es8jTRHgYtCQmxTQOAbbOG8Ak0hPo7DM59ttzHL4Ujlo9JVIrKrOfCi1jGT6?=
 =?us-ascii?Q?V218AeFtHKs8HoW+4OC6dw0IqwSW041NJ3nEsqH4j218qLEyIFJ8N+FeAeY0?=
 =?us-ascii?Q?hB4en5n2lq6MtwvdIkASU5fHGukAYAZ7N/c97aQAaeO1noiFPCsD/f77jqld?=
 =?us-ascii?Q?vnc2nAGIc+Qe6v53ZxSTh1kYoNiVk0MPWdN5lcqpetsdXU6QDEYs4Ulxs37Z?=
 =?us-ascii?Q?QKzbbulRYH+KPGrjZDcNArHfpxVMjYEGWoytvTq+QN4i2TO+vXEw0XOtUaeb?=
 =?us-ascii?Q?bEsHnP3GqUG5mJVEx/DA/sa429WDaiMU06dZ9GJMJA4sbAEARHhFHxDmy8Fb?=
 =?us-ascii?Q?PiqYWwN7TKjm3S2SQkVwRRgzbIk7H3XAAEoT6eTlp3Drw+caFeExST3qsafo?=
 =?us-ascii?Q?2MIad8lkiDHHrvbfCs+tDL7cwBZFdCv3dZNY/EvZnp3VV+acBNH7/thNNkpB?=
 =?us-ascii?Q?4WgbkfKkQ9JjOYt/P/Ls9mjhgqOpex3IJ3qxwYOR4SSkYagWOdcP5A6uL2zV?=
 =?us-ascii?Q?mPfyM7b5ERMsCR04GSc3Drt7p4I8Wdz8HQVK9IaVseR1f+vi1btg+hUQ2S6V?=
 =?us-ascii?Q?F4KRftA3q5sK63YvubgBTmrQt15LeKdXJEln?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(19092799006)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T0vgr5V3IfVwz9LE1kClWDaTv+uI57Qj3FS7zPDj5geMpzz13xMsfi+A4a0B?=
 =?us-ascii?Q?KLYbscmLxxZWpfV3v+upakRjWLy4vsIhHawlVM42HyeIJbr5V7ASlhEB8E2l?=
 =?us-ascii?Q?z/Kw9X1D4neLeIFjx2YDMy1vBLZXXsUTOwZxTN2ZSWLnYE34Kpk8zCgrlETj?=
 =?us-ascii?Q?h5uPIehDk2IJKnQJaVvoFXlAU2NDd3+Axo0xottjHIlJEhu9bYrz5CCFjlca?=
 =?us-ascii?Q?XHxC09V1PSe/m6riYv/Yy7mqVPzq87FJgCThxoAXtwF9PPl4BtHNDoHejGO7?=
 =?us-ascii?Q?oZI52H03ABUfWU5+tWnxYiphVwxAZ3QzXMIH+esI62cMgwRCTXEf9XW9tYoF?=
 =?us-ascii?Q?Xu4Pg634Uq+TTFf4eZj+AsZ6X+kWEBQSo8K1bVN6JTZObBaA3hhXvW7LCWq2?=
 =?us-ascii?Q?91gWzOt9xVe7nxsaZVxCLMdArRwQtngAl2xjuBF7fI2tz5HFMGLy44b63rjR?=
 =?us-ascii?Q?ycx0sey5la7wwy0EZVj7BafsSIfQKw59tMykXTbSAr4Ij6x0JZdjJ59253fe?=
 =?us-ascii?Q?QY6tmTvNWRos0Ey/NQoNycFfH+10OPr46nLSqfm6ajPcUvsaHQE487SI1wqt?=
 =?us-ascii?Q?DtnI0OoVV6luZJwz9vUov+DuDe7QxUsbDtHHYEYr5ZTPFiRnSMf2pi5L4hJY?=
 =?us-ascii?Q?hPRzB+Ie0YgrOCeRFRgMg1wE0BIoS8TI2C4WziEytdMiOb+wjgawtiHqaEJs?=
 =?us-ascii?Q?f6uOGsbrUvqEbC2rIERx2K/ZRbZKsOmC1ySLnCmTV0ElvZUNoPPpbOIZozil?=
 =?us-ascii?Q?7P+pxgtLjK6/5MVDZh1FLgpFeY127ZdZ/Gl984bBX6ZWT9AMkTo2VFozXbWF?=
 =?us-ascii?Q?wNiFJig3WVnFmEW5T/FwqonzDsJo35H+53vL5DNyjfp/8Ao1VwYqeT2jnURb?=
 =?us-ascii?Q?muV/95LaGdp3fviC6gAzMfqI0BIuSdf/3BMHk91Br1f9adidqamaqFdceurO?=
 =?us-ascii?Q?r4/ldOaZWQvjRv8JrikzGaJHvie0EivoS0NqL2qrbpl5Qe1+ui+OnfwNAiVL?=
 =?us-ascii?Q?/u8pUBL+eRa7FmMdyyV8GQlZyAZnA2VWOJSorF2ArZ5PqXTSt/hfO1ewkFzo?=
 =?us-ascii?Q?QzVA0GWqWviMiNvsJauNkZlTD9ToChz/AVJJaCnzPDmhroRiRCTfJzCljFA7?=
 =?us-ascii?Q?hjgRP13rWlRQZKbthb+QuvR8FNK2HaNJoFsCUO3LCwtjrkbEwhCpRTanTE4h?=
 =?us-ascii?Q?wzSc46ym6WgQTJCbNsURT2XgTQFGO9a4R5vabXpVvDBInTo9LqGFg8M2y87x?=
 =?us-ascii?Q?+/AsZ9vxoT9i8O3b2sqwd69+UEuFmEMUHO/5l8rEoTk+2TYd81hDW4elW+v+?=
 =?us-ascii?Q?ZYdMQb7fpczJxHu4kzSxTCCbsZkbYI85awz921gzn+8rUirIm/GO92j+YppC?=
 =?us-ascii?Q?QyNQAVQ5g/EdqVTFj5iYxWSCRk4KgqRYG5SfMw4OXwsU1bc2yrpoywlea4e9?=
 =?us-ascii?Q?uwqO4VryNRjVWkqB+6/EYhGb+5Wo3QLPxdHFcjAaAfmCN58RgkNZDsXvs7WU?=
 =?us-ascii?Q?NThnG8ndPI+eLkNGFLE+0srSSiE8ByNPRUGuiH0H+othnpie09tmSglg8xC2?=
 =?us-ascii?Q?FqSKqtMx1yt1uXoTCVXKZiRaCzJNSUOZFnYYrsdl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd7d712-54c7-4dd0-e593-08de26bbb139
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:01:10.8952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rU9cT2l65g2fzjRsln2AXZKhtZz5kgiCYVCmBKb/5T2AQve66XxkKIo19aghLkCjOGxtBla36P4KBxirjv+DOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8601

On Tue, Nov 18, 2025 at 03:09:24PM +0800, Haibo Chen wrote:
> Add flexcan2 and flexcan4, and related phys support.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 43 ++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index c8c3eff9df1a23c52e74bf2bc5d4ba543bb5a65b..9b2fce25532fa0dbca3a14041399adec0f753e68 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -34,6 +34,22 @@ dmic: dmic {
>  		#sound-dai-cells = <0>;
>  	};
>
> +	flexcan2_phy: can-phy0 {
> +		compatible = "nxp,tjr1443";
> +		#phy-cells = <0>;
> +		max-bitrate = <8000000>;
> +		enable-gpios = <&pcal6416_i2c6_u50 3 GPIO_ACTIVE_HIGH>;
> +		standby-gpios = <&pcal6416_i2c6_u50 4 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	flexcan4_phy: can-phy1 {
> +		compatible = "nxp,tjr1443";
> +		#phy-cells = <0>;
> +		max-bitrate = <8000000>;
> +		enable-gpios = <&pcal6416_i2c3_u171 0 GPIO_ACTIVE_HIGH>;
> +		standby-gpios = <&pcal6416_i2c3_u171 1 GPIO_ACTIVE_LOW>;
> +	};
> +

Is it orderred? can-phy0 should be before dmic: dmic. (use nodename order).

Frank

>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		off-on-delay-us = <12000>;
> @@ -127,6 +143,20 @@ memory@80000000 {
>  	};
>  };
>
> +&flexcan2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +	phys = <&flexcan2_phy>;
> +	status = "okay";
> +};
> +
> +&flexcan4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan4>;
> +	phys = <&flexcan4_phy>;
> +	status = "okay";
> +};
> +
>  &lpi2c3 {
>  	clock-frequency = <400000>;
>  	pinctrl-0 = <&pinctrl_lpi2c3>;
> @@ -431,6 +461,19 @@ &sai3 {
>  };
>
>  &scmi_iomuxc {
> +	pinctrl_flexcan2: flexcan2grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO34__CAN2_TX		0x39e
> +			IMX94_PAD_GPIO_IO35__CAN2_RX		0x39e
> +		>;
> +	};
> +
> +	pinctrl_flexcan4: flexcan4grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO36__CAN4_TX		0x39e
> +			IMX94_PAD_GPIO_IO37__CAN4_RX		0x39e
> +		>;
> +	};
>
>  	pinctrl_ioexpander_int2: ioexpanderint2grp {
>  		fsl,pins = <
>
> ---
> base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
> change-id: 20251118-dts-ad4bd4fdacd6
>
> Best regards,
> --
> Haibo Chen <haibo.chen@nxp.com>
>
