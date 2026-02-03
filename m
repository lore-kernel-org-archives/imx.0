Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013011.outbound.protection.outlook.com [40.107.162.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EAB253B73
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 17:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770140786; cv=fail; b=gleYG/Mz+Q7JaGQIM8p7t15yuQjdQNiyniv63wlg0X7zAd+zZg8B8E5QUiBSoMxiJQnoK1NsAK5vwvCvZl76QVuXIEG/EnvykjQH9os3K7lPUrYpt5slO9rAgdLlOlOLBiPcOvQXyw7zQaOWbn/AGPP9FgwP0KURXJiCGXQOhF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770140786; c=relaxed/simple;
	bh=/astJmDY/IseVgoZWTJd14aL7cZLvcxqNl8H8nib+Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HnOxV4LKLZFqo2GTieA/WUojs0eIOfFRUtfzVSoWEj4q6IqelfVSBGZZhcDaidjRGWqGy8N+3MdUrkYCBz9+7pKp8k4un+KTmqa9jbwAt/S9orfjjixsyb/LN5lJNa5Y7j5cZjowC/8Nstz0xrREPSfgwV0qyA+6zE2kESIriXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M5tH0sLC; arc=fail smtp.client-ip=40.107.162.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M5tH0sLC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaMldSrboQgMr3fxhh0LICZtSE9VWQfj8kI8W4wzrOcgaAa8U6yzPC/mcSeqBfd3JiJKy11ZdSWwRVovLABZtPEKkBWwqSvTLW2RhtK6Jfkw2wll+RRRq+rVY6rtiqLuSWbFnCMZTiFKlWu655DUHM/xHf79sRTgWX9TRqvz14MssCdKu0NoYT1u6X3W8QcU/SrZavsGxxSvEX5tZmgaDJBGYE/YiltdarUso5WCFVNCeZCgZlC3GBfSYwiDsInjYwpUyeozVitSGu5Y7KkoNnhqG71Z8Q+r6Ch7GBRABHzpv/+5JpTOQD+3UruNydq+h3X54v34aJMhQXyX96mhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4FBjSTpRN0UwqLJWiviZUTujlbm2mjF/+5kRROsu0s=;
 b=VLd9pOcW8UjjxClFx1Dl+Ngs9hmjXKI4MnJGrf2lghXFICIoUKCB3PQps9FECb7ChQjdUgDD5Q5timVEKOzIbRIYtkcRvZyS7gXGae/4B1KonyEvuMrZ/IdvCdQWs/8yiA/uVYwETSmSHDxAkLUs040TmRezrEG+aCyQHpvJzp8//zaI5qHCRB28oENJvbIM5r1SWMKvi0RzIXF4LxWa7YM8KJYOrfqhf3G9RtSHBPXpaTCf1CJwrzUUIvxPza4t9aEbfeAX8IBIeoQJrudqIqbxdMQwLJvze3TEKbwL5yZ37bnXMkV/fMPcV5C7q1dJFjQRevCSznXD0Tx4DKlIkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4FBjSTpRN0UwqLJWiviZUTujlbm2mjF/+5kRROsu0s=;
 b=M5tH0sLC20Syzx1qNnt9wum/UztA2hUUO7ZXo5XubOb2VxVK0dCNRZ/w6VDw1fqj+S25WGtC6T6NAMf6ICuWeCR9WG0swLIwr5cfTguMNeDQE8cQQPbWsvhHl2kCGhE0Yr6FqfUZmJbf0L1JtSb+US6HYfkIb6rFvDm1eqRJEwJqeSUtOuwtIt6Wt3Ly84gsn2TMUKrOYyPkvG6GNGk9J2K00d1wyOTWyjMHOkn5vcbqrKsiCJf+CJeicLlHLnLF37DWSTz4srPxj14npDakx5jzjz96jRD6NjRiXue7duI49fYtw1dCLBgb54BIIuqszU0dpJrGo5oO/5fLkPCkfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7499.eurprd04.prod.outlook.com (2603:10a6:10:203::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 17:46:21 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 17:46:21 +0000
Date: Tue, 3 Feb 2026 12:46:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
Message-ID: <aYI0ZqJGg7MaMmnH@lizhi-Precision-Tower-5810>
References: <20260203100332.915-1-laurentiumihalcea111@gmail.com>
 <20260203100332.915-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203100332.915-3-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: PH8PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::13) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f79b77b-78a9-4542-c5e5-08de634c243c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c0dCHtUZB0mgAZIokNPkNXP57DSg09igpP37/asN76sQvesuGqDK7VNhFvVC?=
 =?us-ascii?Q?urn5LbOKyLfbLV/EnFy2VmqPWR/jnXSUhSp8WKiJusR5MTK4EsrrFwijrVRp?=
 =?us-ascii?Q?b0t39q4RluqoyQKKYzNNJPWi6X+skaiUh/k/IQOnVZhU5QWFMsm0jfhkn7bP?=
 =?us-ascii?Q?xMacv/+R8TqW3DDhx6pFLjKTbABDx9UcQbr+a6d1RlzWbkuQLIgx4ZApILgv?=
 =?us-ascii?Q?DOfLGJpfQUK73sR/6GxuVkkaABu2UhxTP126M33X92ATVwtZjkUvdJPLc6/3?=
 =?us-ascii?Q?o9uq/VckGD02euFKZLTMZBjaBKYlctbbeWrZROGd+elwk5ME69+5lj0EIwsU?=
 =?us-ascii?Q?lxCwfwEfN5ZMkAFGtrV3G/N/24V1Yr+HlNfbF2TWn7dkGf9Bk3moup2vCjPa?=
 =?us-ascii?Q?LhC7V20cl29w+GN/xY2HL4hljy7/mop5uzgEm43DHkcgQ5IgqRUT2vF1rQLK?=
 =?us-ascii?Q?GACbK7ypeF92lOCPUydT7INCs5cx9hty8VGwVMcSh2aiKayFTt9w63nI4Upl?=
 =?us-ascii?Q?dYoFVrv8jeg3sb9uOKAehWuGwylocOdBCWenEFoIXxkhFc6tQkkwvtVaVVDs?=
 =?us-ascii?Q?IP2kKxCTHodGC2IuTBxeIGTx0Q7OLnQQVlcI5KmTHJO/4tZUSywsLru5eeUo?=
 =?us-ascii?Q?gFZKXDFKsnTcEzzIl4C326s11iHpLyeVn/mEodVo/D4y292szPKqfLXH3oy2?=
 =?us-ascii?Q?A6YdG2hTjlpGaTNqdlAXvkvrTQjiLTHHcrY72u/4rN9Ul961AvS6+0kQPKAB?=
 =?us-ascii?Q?avPicgF4Fqo+bU+Z7dBDDe3MxJc3I7bDBk0MpK8OaH/T36mgJLgen8kKzvXq?=
 =?us-ascii?Q?+MAZ6VFamGC4N3hxVn61K5JcOiicdwOnIXbg8PHff70K72LZsaEp6gRngBHa?=
 =?us-ascii?Q?tQ+rdQhRRpqYsWvEeR753sIeHpYXsmKWy7LS0quSPUveOlSYNl4AnhwV4Bg0?=
 =?us-ascii?Q?zQFKmmCuXaGgT999Glk6Fhn9Yc9hpPvr3BtW1m7N/t5Afh6pc0WeKwdugrsR?=
 =?us-ascii?Q?cAOsvNozzkft+nNks3l+cqJhWTW6Cp20IdObbEFwF3DIqCrRtd9N7ubDJgm9?=
 =?us-ascii?Q?xoW94HX0OVoY1lcyZnsPStvLtW8SZvDpacI38gOFxuSmN0WMY5Mr8QfBn5zz?=
 =?us-ascii?Q?qsiaaLE7saBEhfcZG51mwivfQQaAQPfVRctFhHOKPsQ2d8mPbT0SJ5INqdnz?=
 =?us-ascii?Q?hBJnfb6z8vPWILFidxbSITI5HxifL56ISx1ItpsZ6aOSm9xoOR0Tz1ClpHBf?=
 =?us-ascii?Q?WPcL4kkkTPaRVwxAHivCYWSo1+08KVQa2Urt1bmcgne8v95bZF4HoU5pSCRG?=
 =?us-ascii?Q?1C+c2xxNl4Z3r8mPL2ZxORlXAQISRgAxJih1v0SPNsc1QrhRdei4eMSMfq/Y?=
 =?us-ascii?Q?dsyAbIo7myYPwJop2MSHKLwo1SwvEtlVFnBgpoxeVIiitILYmbsbDYR3EbBi?=
 =?us-ascii?Q?Mp0rUWytg9rS7UwHguFJTGYJLIidu97kxQ2EjfopJgfF7RdgK4E+V0c89ifI?=
 =?us-ascii?Q?BKPHMZk0NjotqgV9OumYMLw1wGuMDYRHz9eq/tyY8Tajm/6v3DAKT20IDx6A?=
 =?us-ascii?Q?FyE8NJkXGwmMvv6vCVTog2QjJEh0eF+pq5UiJ91hsoJ+MYt5EErX6bEx9adg?=
 =?us-ascii?Q?erO87xP5ijc61G/DQVPBT7g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzzFYlnshuTJapVLSGOKDwIRsoQN2l7c+pwMPAAGuzmAmV6AmVB4SaOecll2?=
 =?us-ascii?Q?C02MWW+SHx4LmvIJuePVqdbWv3HXrw3bxLRlex415czlwtx6XlhVc2SrNjFL?=
 =?us-ascii?Q?QssJMuZJWRjh4wzyz8mPPyl4k1IVmbUAysiwj5NUICXbmEDrSoWE0Tj9tfT6?=
 =?us-ascii?Q?CyVSj4DRG/mfFqy/XJ/sycmyKgixvZvYGfiLAAxX04Fi4gj2rDREHEu2KKRd?=
 =?us-ascii?Q?txoVFaxA1jvzBJDZTnIG4OsZXHQiSvbZ4FNAaq58rTdn309h8brytF3ktClc?=
 =?us-ascii?Q?4dlDzUBJNZY4fcJ5lxMVEkCsQXu8pLRHw5w2Xk5cGTvPYsxjDrmbMXGNh/xL?=
 =?us-ascii?Q?dlUesuroKAjX0Wuc7dNNbPiRaWTeMZtq+cy188IN3xLIiKjjMHZNLURb0Utp?=
 =?us-ascii?Q?+mlwZ9wWFjDKMFjwgUn+EEqEjcgGHnWw6xzsDcfAIVTqt27MdU3HI9CvaMwc?=
 =?us-ascii?Q?NcQ5QKXWar22Z17LMOZWl7CFi5HbzFKFn8aOPfcrsCSrzvXU+EIW0PWe1CLK?=
 =?us-ascii?Q?zU8qhf+yBgXQSwFmCBUouuzd+139CtfoyIBd3cWiUPqDkuFSrXYrp6Fh20NK?=
 =?us-ascii?Q?1+1hsKp9QzSgQTWy5cG0XlKL2HPNgMqls1o2G3Y4FmZopiuH/L3AwdsMuPzS?=
 =?us-ascii?Q?Se6FxuP6WXl/xDmrJHOt1DSGIAmMmwgAnP9Rgffp92j9T9B9fIEDNqSk1qEB?=
 =?us-ascii?Q?UXk4cl/3H5Cj0r0WqNQR7TANvUEGK4B7ag+Wb8y0yTSYMJ3IVrc6ZlsFaDJY?=
 =?us-ascii?Q?dq/Y2VDB6B/y+xOntaZ3hrwqVRJIy/Op9S2FbiwC6usOOT8qj2cmH14JUEmv?=
 =?us-ascii?Q?gmuB1WVs1TQABGttSuWxmDyz4AIqrSrrt9cVn42IV6Jws3GIT6n3Zf3omndo?=
 =?us-ascii?Q?8+5v9lVRl95Qg5P2GtJyHQE17VdHv6gcaEVEuT8LIMy5Rn+EkdkSFBgBNu1H?=
 =?us-ascii?Q?t3jxwqkVTYQvqOgq7NVZFhqa5qCfii3nI8arPer3S8yvHNLQmZIZ5fkaXiiT?=
 =?us-ascii?Q?bD/81AQgWQfpI+rO9H11oENdEZ3rglcBFPHIk+Zy7n8mDT1YPZV2SnRotUgY?=
 =?us-ascii?Q?49YI8KC/+F7AMKwJKp3A05KnSgBC5OLUXhtwQbe+3GBPHlnZtOdIXRZZm7mq?=
 =?us-ascii?Q?+APayjd2c1eBs8ay65eCGTWWU6yNICTmPXe3axdRH839PRLUNZu8eYBJuWop?=
 =?us-ascii?Q?C/JtyNWyWTEGOkzLd1kioR3iq+CdqderHam7WCc+o6Nlrb6vMjW7oAvVaAsl?=
 =?us-ascii?Q?JDkQv7qJBm3clPBxT6ug84OfavUvagSBOJ5WBtcqHre07DuPJJYhtmez1dnz?=
 =?us-ascii?Q?0cnNfeUu+zcn7wvxmlGNTQpfdGU6NvogKbl+/RIE7oIYng3lR7kzFonqMcRl?=
 =?us-ascii?Q?yJ8SgSM5JjyighY/Tbm1NspwHsrQ6MSPBse3eXNIKCo33LtAtmH0LdRGqY89?=
 =?us-ascii?Q?fk4wJ1L2p32f/2ZWvQkPmkgadF6JQ2Xp6Pl3RVhwRdb+1xm8PvSQf9Zh2cgt?=
 =?us-ascii?Q?UvsxamnLWBZs2SVGJJy77/ElHRFJBzGoGCRryFCbgqfAwmYClRTYv+WhxKI6?=
 =?us-ascii?Q?Wb920W6NJxtTu91ysLva2lCA7qLw/hpbiHvQPD4Mh0iiqzKsfG88wE6lJkb1?=
 =?us-ascii?Q?+mYR49rC5tN29LnndtTFrLxXn23iyRsDvNK1uLKjWzkHiN4rsANZipss+KAK?=
 =?us-ascii?Q?djTgc+VG3tAapToQDpeG4ZAOgT2a7zhnICZCEvjyn4Rj6wz3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f79b77b-78a9-4542-c5e5-08de634c243c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:46:21.4021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEM7bPYkAjJF/iRkbXn1b0CLcv3ZkstTwjtDcSZWkOhJNYCbQvaRFHC5JLT2BG/NwC/DFPFiIGi504SuLy7iRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7499

On Tue, Feb 03, 2026 at 02:03:32AM -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add support for AONMIX MQS (i.e. MQS1).
>
> Reviewed-by: Chancel Liu <chancel.liu@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> index ca1c4966c867..0f43e3be7058 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> @@ -243,6 +243,12 @@ codec {
>  		};
>  	};
>
> +	sound-mqs {
> +		compatible = "audio-graph-card2";
> +		links = <&sai1_port1>;
> +		label = "mqs-audio";
> +	};
> +
>  	usdhc3_pwrseq: usdhc3-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&pcal6524 8 GPIO_ACTIVE_LOW>;
> @@ -473,6 +479,21 @@ &mu7 {
>  	status = "okay";
>  };
>
> +&mqs1 {
> +	clocks = <&scmi_clk IMX95_CLK_SAI1>;
> +	clock-names = "mclk";
> +	pinctrl-0 = <&pinctrl_mqs1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	mqs1_port: port {
> +		mqs1_ep: endpoint {
> +			dai-format = "left_j";
> +			remote-endpoint = <&sai1_port1_ep>;
> +		};
> +	};
> +};
> +
>  &netc_blk_ctrl {
>  	status = "okay";
>  };
> @@ -534,6 +555,51 @@ &pcie0 {
>  	status = "okay";
>  };
>
> +&sai1 {
> +	clocks = <&scmi_clk IMX95_CLK_BUSAON>, <&dummy>,
> +		 <&scmi_clk IMX95_CLK_SAI1>, <&dummy>,
> +		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
> +	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
> +	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX95_CLK_SAI1>;
> +	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
> +	assigned-clock-rates = <3932160000>, <3612672000>,
> +			       <393216000>, <361267200>,
> +			       <24576000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* leave unconnected - no RX in the context of MQS */
> +		port@0 {
> +			reg = <0>;
> +
> +			endpoint {
> +			};
> +		};
> +
> +		sai1_port1: port@1 {
> +			reg = <1>;
> +			mclk-fs = <512>;
> +
> +			sai1_port1_ep: endpoint {
> +				dai-format = "left_j";
> +				system-clock-direction-out;
> +				bitclock-master;
> +				frame-master;
> +				remote-endpoint = <&mqs1_ep>;
> +			};
> +		};
> +	};
> +};
> +
>  &scmi_iomuxc {
>  	pinctrl_emdio: emdiogrp {
>  		fsl,pins = <
> @@ -618,6 +684,13 @@ IMX95_PAD_GPIO_IO31__LPI2C4_SCL				0x40000b9e
>  		>;
>  	};
>
> +	pinctrl_mqs1: mqs1grp {
> +		fsl,pins = <
> +			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT		0x31e
> +			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT		0x31e
> +		>;
> +	};
> +
>  	pinctrl_pcal6524: pcal6524grp {
>  		fsl,pins = <
>  			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
> --
> 2.43.0
>
