Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3481AA1CD
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734630621; cv=fail; b=l9oONSS6YnbkGE0qI0XQhXCxidVwq63i7C1zNlbTFpsUuAar59In7hfluT7EmCYpKByA2njAVTWb44P1X8SQn8OwYdOmj/zwntPBCVIVaoY/N3i3K3Rpn++GcOMXfT+pnSLakdOoq3lnHyiUZ76MrJhnNdGXdrMR/Y/wRGL2usQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734630621; c=relaxed/simple;
	bh=JjK0V2y9XTZC3dTnhfR2KW9C+VABigjV6EbvMe203SM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d6E1iYAJ6IVz11ePte1axNLqdYIrfCzwqczzXSB1mfZ41cRZvaI8HUmi/OeX0CsfZtEiFZW2Fpigomn0IwaCaapqWJ/jFXA1YVD4VHkVK64nxafKNpCvFsEJz3gPgws3sx+tRd2ZZNvVY3/FLt5WGdq/DG8j54wOCB9vrjTwfeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zi5tVjeJ; arc=fail smtp.client-ip=52.101.70.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zi5tVjeJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMh29AHWUSp6D/gKUFLqw4m2rfLhrZOw8cd8c26/NdOVZgHBiVm3mZm+XjAvCd6TXdRsT/FBUb/JNSpLEcfUBhHbxUUh1r5xPK86Jf4DYIPMHXyzx7cVOfT7d7WVzCD+4TkV5hm2OnamzI3Fh1E9VUkl5atOBDZWWDuhOcoZM6ibRLg5K7mz/LUFiBQL7tegK1yiZXAd31wmJLMqPX8jEgzhPGFPmX9miA8NfYVaBNuvwQpytMn7CrlD0jnAHWRmP4cvL7IYgWgaSzNJJxNwIAgmDjHQSK4DCs6kwcU2CfTA6E0uS/uoIui1p/o3goEuOdh9jsf31YzU6gbyDUN+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtyRIRsWWzvt/JiOq/52UdUzklqiesNcPi2fh4tbTT8=;
 b=xccFI0ZhXRiisrHAlwNG82DYq2IGWT/o1JuEQceiatrEqLp4XZsisKP53ENQTaZqIZB/b+jOCgyMR5jhJkkge+51gX9MbS8hg1l5RWZdXb5pe/9lGQhtzjHm+SpR0ywrZkbCjjPE00zZXv0mZmo9qJwdSgYZxGopSfu6KJZqaCludBpMTOuO6tJPeueEc1zvRXBmMyyvWtkHNGd8QoByc3kuP5mSY29on4nkdxyl/GI6U/qfOyqHEQc5CMs6PZhz2SlFaF7IL7lCLTeSKgPK5FOMwMl4dadyP0Kvv9/UIq1MnAAqnaWWTRnvYSuUHc/b91eTPpXQA65Vtlxiqa39Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtyRIRsWWzvt/JiOq/52UdUzklqiesNcPi2fh4tbTT8=;
 b=Zi5tVjeJoPsMXqgLPDl4oC2WcJEcTEmth+/zpBbBvenwwlyHk/O8Cx1Bb3vnbH5D+YIZ2LCROf25YEu44B668Sf1kTg5l3XrJUJ2hvsWE02OWEcLQxVlKALj6l69wd7BiK9Rrp0vR96Od2Jzu1jkELXf7d3j499MpQGp0HKz36hgA0fAxVp/0GZ6QtaW/WUtb3VslgqCBMPJ12OMsH3Piyx/wlZ511XvAYSa1JXsFpoRg8xnW15oMK2SWxvdC4jFq0L5VNkAc7ImaD6K8ehavqIQcNbAGQfZQdf8XYQQYiXmG4tLKRV8xhDMsNLwZNFzKs1PGpmgyPiyBdUolimzEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8750.eurprd04.prod.outlook.com (2603:10a6:102:20c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Thu, 19 Dec
 2024 17:50:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:50:15 +0000
Date: Thu, 19 Dec 2024 12:50:07 -0500
From: Frank Li <Frank.li@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: imx95-19x19-evk: add ENETC 0 support
Message-ID: <Z2Rcz9CtXuzQUMko@lizhi-Precision-Tower-5810>
References: <20241219061340.1633173-1-wei.fang@nxp.com>
 <20241219061340.1633173-3-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219061340.1633173-3-wei.fang@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 138d1dec-2b6f-4628-8ee2-08dd20559824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Afdrme8vYOeiRKtHl1pZ8CQ/IIHv5tuoNfUwq/IkXbdkAcjiWvQnYUxYiqCi?=
 =?us-ascii?Q?rDDUwls+j2+kRR1Zp9Az4/ChRs3wFlilJiaIkQCNntEE0OFvv44bod5YpaJr?=
 =?us-ascii?Q?yKc9ZF4T7AP+6etWYQ0+ZIdelp376DL+X/VvqZCWSUb88dWEU3uKAjOGHpAJ?=
 =?us-ascii?Q?nUUI6HIrtortXla/aNtEGwV5uPOXLh/xAm8QhBL77QAVtVsqCfI8Q6Qby9vz?=
 =?us-ascii?Q?9ABjC1jrc8B8E9rjGwJIdI3GGqMYTs3ymSnl4mi/Rt5sZH/n3NWeTzA2qu7w?=
 =?us-ascii?Q?Couj2Lg1DUIJlsLdTy8Y1MiqI5Xppzvg6YUljVYb75mYZ3IrdJgkjQ0vIWyO?=
 =?us-ascii?Q?7DtRM7szA8BDnWGBgIk23QaM9oDliOPSj4OtMZynSgjgDnDfkaga/a4AgmW2?=
 =?us-ascii?Q?x2qqhCAKstaTisoeWmFmqYWR4o19kQ9SdKrLaX1U9YGjB3CmnvkTboA7lNko?=
 =?us-ascii?Q?wGfUHC/TgZcsvgfACBawe7/CC4Bkwia/Z2fDzLGPVVT1jZIngRxgpOGWflFL?=
 =?us-ascii?Q?e9dbeuizk5NpAF0JIHJlS40MbpTL2n93QaM+rj9mfKtIO3jLIe6JvvfVVUAE?=
 =?us-ascii?Q?cDEZhnoxZjvjub+CfFWnDZfwGyVphPF6ipJhena4YF4PscHWksBcOxsl5rYe?=
 =?us-ascii?Q?mdap9kmffG4mrnlEEXOGuOMZ1C5O4VwOC/bHYbetbmGhCBBfkc8XgQ2D6IoN?=
 =?us-ascii?Q?xksC3sPPQpcTJQ4ufHq6C/84q3aiLc1h9WBoJDz7xQTqndFowQm5s9snN/9y?=
 =?us-ascii?Q?7ENO/9aVEgGFnxYhlDWjrMIM1mUnQzCxw+iJIq8+bIzaAfXyacwkA4XLkXsN?=
 =?us-ascii?Q?9l3YBwBtowxqN0oTmJepguVRWs/4uPnqoPZdje7tFd752ICd/gpwlkY6cyMB?=
 =?us-ascii?Q?KFnj91lNsCdXSMkcPHv7zGmdajIwoSRg7pBRZxYNkDuz+6bzGNQtG5NF3x1Z?=
 =?us-ascii?Q?3X6NPteJ63PrBWIuhx3kHwkfAxPEYMQHpYvOTyaQiiTfwqpLvCWVCerzzdBt?=
 =?us-ascii?Q?meuLtBpddFwwkz4IW6CFvGMpSUNeqAWJDGsqXU/c9OfUnRum2bjlUgmrdH0X?=
 =?us-ascii?Q?EmO57MYElXpQSgQKFgOkxZST6zfaaGDysHDspy1ARgP+07r0IzgiblU+5E/O?=
 =?us-ascii?Q?v9SL6CvJlDcuV0qLN+I8ttS4tbZ6kDeZT4gtMVyf5lyoZf6ovWwlHIPCJ/Ak?=
 =?us-ascii?Q?ZAjcCuENJw7fQrAIsyUiPEmXG4lCsoaLvPtfj5GEMel2s6hzdr+XmgdvThjA?=
 =?us-ascii?Q?mcq3ogoT+Cv27bv6ifvAbQpTFXz8Pgr7AUcbSB25owjhw+DiSfbJBTs6+kLj?=
 =?us-ascii?Q?nnLWPZPZjHCYmkkqp1lwItV4M36v5cGrtNd2BO5INCumPKRSr7AwHgtXuNON?=
 =?us-ascii?Q?dkIKlyeAlzp1W2F0ftLVnOVW/5/fsGfZQZ2xONgN13Yj0QPgXrL6/6aRcril?=
 =?us-ascii?Q?+FT4bjaMFph3/sflVb66IFfqoyBPq/Xf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iReWlRWf61B9dmYb9dN4MpkguHwW9ySmjgzkpt8APes/bnxb7wW7BUlS0kMV?=
 =?us-ascii?Q?NH4dFnFtmUOVtrnUq4MMLNqe7Xm2DS3rvlw9HyTsnSAVxLa/sC/iMidw2Y1X?=
 =?us-ascii?Q?Lr8Jon+KGCm4wS+HoGJwX7wMIsvE6FJwe8a9xoLfkKj4oojrLmrM/9pE+nm9?=
 =?us-ascii?Q?ohXeDmc3vAiIqDC4MGig2Du+sLTbVXCbFqkQKHoA43HOg6Azl4FqqHve2I+u?=
 =?us-ascii?Q?8X0Pu0jsXk4JTO4Q+DbSS1MWQJqfIuc/JwsznIAd6NHPkoXonYvhOhblk202?=
 =?us-ascii?Q?NaVNhPGYN9nRRs8E3sWk+O+4yetmgY8R6+nM4WwzCeqfZexTyWJ/8vibvU+e?=
 =?us-ascii?Q?lsNI77R2Rk/LjDlhdfDe0Lqi4vJXGWCRr4NHGpYKhlxtk44tybzxiJxOA8aI?=
 =?us-ascii?Q?gcRFIxSqkGok6FCZEY5J2iGjxRp93JczYg0Ez5DGk1wnNzs3+QmLZmyVqq2B?=
 =?us-ascii?Q?5aOEYyesTlwMRtjCFlA2AWO5MwuhKgdqexXLpm8uipicrjKPiIsaER6sojzt?=
 =?us-ascii?Q?NqHxCyCGAsYgQWadzTxy9j0SkIKpq3z6+i6a+lJqPUhrX0cz+NeBIGU92q01?=
 =?us-ascii?Q?x57LaBpp/nL0fZtixUwFID7gUiEDIDr9bN+DIJu3sBY8/jTYwfyjN/39Ra7Z?=
 =?us-ascii?Q?Chjm1qsMYZuA3Ez+d1u4XO5LAsIMk2/XTfxkOJix+53rGi2CaumzsvweN02p?=
 =?us-ascii?Q?grzD0TylTjPRggsenJ+0BhoXGS7qlXk9g8ZDlXZNQISe9YU26mkydf0UhJT3?=
 =?us-ascii?Q?WFpY7zdFs36outH3K8wjWaEB39Sd3ohYWgoyqo44dlOeBP4R+6XS0n0ZXb3v?=
 =?us-ascii?Q?7aRHRcnNiyny3FgJ2n83QrUBbeiSfdU9XjCEEifLD1iUKOg44IQX9AC8av/K?=
 =?us-ascii?Q?zubz9v2fkV9VPJzdeJ6SNMrYe/zUmHCU2PbXSk4RL36Ofpl3b1uIh1jUxYV2?=
 =?us-ascii?Q?YuKNO0hlFC68/vmodyeOM808IhuI6p7LmdB1yG+lMjAzsk3KyxC+noukUtPu?=
 =?us-ascii?Q?tyn9tA3Au+PgRQr8gtPCTSOVPsNFKj6QICyXRG6XjX6Mkjmf3PxmCgxaH5Vl?=
 =?us-ascii?Q?Bz8EDZOn3FZ3b1JL68nCRuizxSI/3KrVJ9kdXcrTfdaC/n0wCMPc09xuUSv8?=
 =?us-ascii?Q?CXUY461SjNB6r10ZY3hFIWL1YHc62kvcImTxsu1GKamFFcawSgHn+LWhBgRD?=
 =?us-ascii?Q?3WWKS/CmX/EZf9veVGQTQcLf/sDdN5DxILS02Tk4TCJRCQMNZIlb1N9orsBN?=
 =?us-ascii?Q?Y09zBdHZXezeTE24wjat/U8weSVR7YHv6PdfxjE0grOORwapqXvEl2h2JT54?=
 =?us-ascii?Q?G8sxnlFZFmNXHTYQ9I8/FVGUe0Lzjt7qZFU+W1brxhWWUo5Zgq7/0TdNxtZY?=
 =?us-ascii?Q?7D6e5n7gt8OXJL9/CK+7eDkPYR505tW58KXmA1YAf3PnDcN22vkGFC4TUPmd?=
 =?us-ascii?Q?8GnJRuVaKlrn2FDeIj1TtmHB1CGHWoUp9sGEPCM+iBFn6jVreFeo3rfGDUHj?=
 =?us-ascii?Q?vCsG8oZrWIoUO17k0+xDnF4Q1iGUhnGRZaufeit6R6aIV1DytQWGXPZIeVqe?=
 =?us-ascii?Q?zcdLAkG6SrgS0/1/uuCBsdmGIyJaEcvyzIT1QUTi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138d1dec-2b6f-4628-8ee2-08dd20559824
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:50:15.4087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyiauEdosIky8XQNYUgIqh96/wfoCRJmHmQL4FfelCdKe4KOgdxUFHyYQ6Y48LMgc8VoI87SXWN6E6Mxm8714A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8750

On Thu, Dec 19, 2024 at 02:13:40PM +0800, Wei Fang wrote:
> Add ENETC 0 (1G ethernet port) support for i.MX95-19x19-EVK board. In
> addition, because all ENETC instances share MDIO bus, so enable EMDIO
> at the same time.
>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../boot/dts/freescale/imx95-19x19-evk.dts    | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> index 6086cb7fa5a0..8bc066c3760c 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -22,6 +22,7 @@ / {
>  	compatible = "fsl,imx95-19x19-evk", "fsl,imx95";
>
>  	aliases {
> +		ethernet0 = &enetc_port0;
>  		gpio0 = &gpio1;
>  		gpio1 = &gpio2;
>  		gpio2 = &gpio3;
> @@ -193,6 +194,14 @@ sound-wm8962 {
>  	};
>  };
>
> +&enetc_port0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enetc0>;
> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};
> +
>  &flexspi1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_flexspi1>;
> @@ -338,6 +347,25 @@ &mu7 {
>  	status = "okay";
>  };
>
> +&netcmix_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&netc_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&netc_emdio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_emdio>;
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@1 {
> +		reg = <1>;
> +		realtek,clkout-disable;
> +	};
> +};
> +
>  &pcie0 {
>  	pinctrl-0 = <&pinctrl_pcie0>;
>  	pinctrl-names = "default";
> @@ -429,6 +457,30 @@ &wdog3 {
>  };
>
>  &scmi_iomuxc {
> +	pinctrl_emdio: emdiogrp{
> +		fsl,pins = <
> +			IMX95_PAD_ENET1_MDC__NETCMIX_TOP_NETC_MDC		0x57e
> +			IMX95_PAD_ENET1_MDIO__NETCMIX_TOP_NETC_MDIO		0x97e
> +		>;
> +	};
> +
> +	pinctrl_enetc0: enetc0grp {
> +		fsl,pins = <
> +			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x57e
> +			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x57e
> +			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x57e
> +			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x57e
> +			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e
> +			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e
> +			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e
> +			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK	0x58e
> +			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e
> +			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e
> +			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e
> +			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e
> +		>;
> +	};
> +
>  	pinctrl_flexspi1: flexspi1grp {
>  		fsl,pins = <
>  			IMX95_PAD_XSPI1_SS0_B__FLEXSPI1_A_SS0_B			0x3fe
> --
> 2.34.1
>
