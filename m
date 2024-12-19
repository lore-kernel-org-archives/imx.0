Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC0C155342
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629858; cv=fail; b=pNsBPfGDaALTT7MYbBra6Y5Z9xUWDucl/vAUT6LAS6RobwyF1hyMErLvPGq+nMkqWr9WF+yYQG0xKHJN/iN1F2oS4gPXyP/K+UuBXs1KxlVJ+7qEBQHYCGk662hfXzpySRQWRXupJ06aQC6b+K4v5sac8TBAmh9gFB2R1OJcNtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629858; c=relaxed/simple;
	bh=v4cvncii2ALGsjUBb6vREt8ZIM4xKieUu3a2LLrVFWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BgIyhDLJpffB3dEgjq43qUBmAp3hKl6+8xYvRHwO+Mjqq0swxGzHJlFb8mLEeuXLD5KHqBt13oRKiSd/S1zRcLj87foErqO9xRn7P1YwhnVsSY9WKC2H865RsgE616loChjfDhFmIzaVH7gaHtosua2+RWfmXt/waqnHkRV9Kg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=APxOmdi9; arc=fail smtp.client-ip=40.107.20.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="APxOmdi9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXyf983/Ngt/NVxXx+BbLEig+rUDES0z7L9fZ7MdzuN1X7Pon9pCdNGWi/BgV9shapEhT5FNdZdJ0xxXJsn8WEFdKnopoAY2yhl2+DUkvTD8+h80gFWuK4TVH4FXdnm+Hc1gFp6bbN5u00/pm1ViVkXZ6MQHBrsQBQdC+sCM8JXtAKaDgY3G6jZlqg9Emd14GdaByXv4Gm7jLXyP2AzsI1IYIh0Txm/21rfiZf1WIKRmrHIwf3EECC4Stor4Wna2z9LhAqbaYKGsT7aX5+wIdc9fhnjWqtZ0NRQ6Avmsa8//uCv/8kwitXS6SS/y0Q/7A8xeQ1fIoTkceDhRPx/qRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wH2qMXMMf6GaSF5crRbCdByLT4uckXRGFTUef0V1m9c=;
 b=otSjotHeC1G7sSVVz9rkzcrN7dWbWejZ2+cdra5+iWDCKRVgV9sazRbQT9ylBKg7hJy0B3/yH06cS4Hlu5IlR/lN1D+2yvZVzodY1r+fIQTVQh1Khd1abbt0NS/ghPAKKOaGP9JqGvcV29JsJdg6aX2vhO0uqOMOlqBh1tnFq7lhNBzDjNYEuUzm+rWmFiWLqhLCnW3Yn4CGN/+DbZ9dtqgwWa2pJ1YUry3lI6PWNn61kZJy567KaIZG/BtWAw0PAjf3SAJsl/YWFyT8NJ8h3CZ1gZAGvrF8GM0Kyze34wKa6qc2rb5osl3aJJVy2/ya6pdPFrqh+fSY7zlnYGx35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wH2qMXMMf6GaSF5crRbCdByLT4uckXRGFTUef0V1m9c=;
 b=APxOmdi9TgX6Ss0R6x26GHCsfvp9qcSdNF3UupMcSye4ecl5ZXXo3zmVtlNKtHBXGz8x6aBTvvXe1Z8YDXf/Dpz6jV4hnHDApyvvg7p8eceP5c9wDJMIzdBwTszaTDYVn93xBSz8htyNjvUpEvbea3H4Qbt5/PDaswxR+gWgvPfylBCJh492YTB60rIpbFqdy4DsuKeK+QHRrLHSepRfc12hV93BM3nVJJbgGbzEXnqWxsyTan1FjdZX10J/Ocb6SZ2cl+cI/NjfSpPW9tqlWGzqVYeAcLMHLhusNcMLpkXi3GjMWHTBiL4l67/TeHA8QqbITVqqexe2BmJZr49BMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB9194.eurprd04.prod.outlook.com (2603:10a6:10:2f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Thu, 19 Dec
 2024 17:37:33 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:37:33 +0000
Date: Thu, 19 Dec 2024 12:37:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/10] arm64: dts: imx8mp-skov: describe LVDS display
 pipeline
Message-ID: <Z2RZ1o6AWGRe0ww9@lizhi-Precision-Tower-5810>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-6-38bf80dc22df@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-skov-dt-updates-v1-6-38bf80dc22df@pengutronix.de>
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: 62863dca-db69-4669-d357-08dd2053d214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Nsq55nkXkDRvWvQ8YoMYaREvLS1xxUsUW5EIuNN0HprgrWbpKwTppm1V29P?=
 =?us-ascii?Q?skusByhnW1abzOxFY1zje+gJfvhpvmFFYXA10jD5umXh0zGXXG62BibTKMXa?=
 =?us-ascii?Q?sQvM6H5xoLKxnCoHJ7OkDC7sNwkwHBBstzv8MzKmhJnl81msgI8baUg8G5n/?=
 =?us-ascii?Q?JIyNdOb754nVKCG6NByK5tD+28h0GETRw3tyAB5d0g+6HkMTMS2LenRpXoI9?=
 =?us-ascii?Q?kt3QhztJyKuHvEc36tYLyj33+WKgHeNHyTa9gdkJw1X16T3LuDm+kmTw4DEt?=
 =?us-ascii?Q?BwlaNvFXkfuI3t+8T6iRZKEVF7esRC3X2n/rzuz96nmyjOr1Aaqs5fxxnpwd?=
 =?us-ascii?Q?WF0QKO4Lg+/lw2EUmvyJV3Sl9q/K+ubepHrrBUBCGhtRWFnxnlb8pWgVPnZD?=
 =?us-ascii?Q?rx8z+vLbUD3Xm8DossKgAr45RNVBU5I/83F4EtVdZ6Wbqnt/Km5vHrx9LF4R?=
 =?us-ascii?Q?xQAkzqSyV1Pd+fSA28xIzaWqnXTJe+KDHQohJOFcSBijTRD97o0ePtF5a+dH?=
 =?us-ascii?Q?Xjm3Gh7m53HfdxI7wRxkv9ObJEJBTAF/pvBT467tqzEjZxJHvppncBwFAybq?=
 =?us-ascii?Q?nsakmzqnjYWkKRG8yZO7jIYvBPQINaeyJ4i66U5O20yqmQ/KiwNcDDzzkxqP?=
 =?us-ascii?Q?63ttfoVnxUMcA1qKU9rEiMFmn+Ypu6kdiSBeMslc9A578vO/s3gB/V4f1/W0?=
 =?us-ascii?Q?y873SrL6hEIHbrHQgQTkjsdvvI0PnUtB3+PuTBFjGMfIQ7pw/s8AejjjaRGV?=
 =?us-ascii?Q?6scaSOogvwZdWRI23/UYJgyLx4U35gsAKTRKZ/UVJEcYH1gzIUnZ4pEef1LA?=
 =?us-ascii?Q?tnLq7pxGAdVn0Fm6/Jfq4glnla6pfiVT5HQ0vJ2KAqgGVssBlxQpcUf7dktF?=
 =?us-ascii?Q?5+RKNObibnDkPu4oiadlqFn9E8LPpaQ2oP8vnntusXpWanx5odHSxbQK5YDz?=
 =?us-ascii?Q?/TMdJiuAku4cjdxKDyuxRYigC9WMMTs3ebxm7nEGHxO0xgxdXA9NjjX30Sr/?=
 =?us-ascii?Q?F4CTDHnzZ62Z3Ad9jbKxDA5+unXQRdEBVf4dDLzLj9eDnWNsucVzlpDh1Iw9?=
 =?us-ascii?Q?6eXLbhlwnYZWTpN/QDvqDpBukcRsN75gPWgc3zil8+Y5L9d3lUsaXM6YTR4v?=
 =?us-ascii?Q?+vsBplGG9LPv/yA9UHvD/a/idv0oAVcioqZeN1rYvn4fgfbjyXGN2gzCidlp?=
 =?us-ascii?Q?FnhSZtsHuJnIk4UoJD8RFJpiU7erVEcx58cBQnGAzqQGzVxk9HSu0Ae69cDV?=
 =?us-ascii?Q?8bq9TPNRqveF+iFWE49i/wHraEfeA43RkV5BgVMIkorkaHlCVUavDpPt18ST?=
 =?us-ascii?Q?Y+lrwi8c340efjou4qiRzNVaC9+LCMQUMbN/wDZst6ByPOtgGqb3MAq7bNzH?=
 =?us-ascii?Q?w44G4dcVPV9xH7VsatbEuynerqLo/lMS9AmnHl5tJAAmHlPPAyQDK9Mw6jf1?=
 =?us-ascii?Q?czBg8Kjv+Fhik+SgZVebdhcwZkvQDFf7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oosSvsgyAy21+GiD0CkCiR5KfYbKeEF4YCeuJm1+wV2NTcsxpHNNdYVcDhbQ?=
 =?us-ascii?Q?VfOfYCIFflaJ576sktYV0z7OOfX1hRvcDbCVCkKDeMaB1FJjRzaBDZSOd915?=
 =?us-ascii?Q?eVhkRxGWFZQAFdc/jrqOLAKwV3FlRW0f/5Prue6F2XPHaGgPKjKooaKW1HRj?=
 =?us-ascii?Q?3TyQIgdA0sHD+kvRFKE3WzGCAJvPPa9HA+2hYsF0qgkEjhZKo1inv4DGy4BO?=
 =?us-ascii?Q?nqC+Cvyf9SvmOO56ULrF2UKfVoSwMvMjtR7yk9vmC6+fM5LUYWEirLnVX4A6?=
 =?us-ascii?Q?NfTld6UA3tODA4GM4S+OMSabYvgBaF410mGlf4WCuZ4qYCKm7Xo4rf3ThN2E?=
 =?us-ascii?Q?9lAXyXqNq4n13tgb7MMQMafd/jq62yBV8/aVGU3n3Xa0GeSU9lrElUPpf3xl?=
 =?us-ascii?Q?j4JRt0oiqQWry9Q+oAiyatcVXLHittwZp8HxjT2TW+04Ry8moqTs2yA11bDA?=
 =?us-ascii?Q?TABaPw2JRVbiZG2zZhPTeDbNtji37HA8F0MY8C1EgO4iuqcrzA3ez95vrAT5?=
 =?us-ascii?Q?SUF6gx7ZU93YFypH3xaY2wE5U0DU1Axq8brcqD7tMQo0BVWu3Cu4su59tSI5?=
 =?us-ascii?Q?fLSeED1txkjriuZS9l6qMRrQTYXP/OlnOEvBHmBCRB8ZzkxKEQ9wBgNRAJMg?=
 =?us-ascii?Q?OKyw7x8EowMid4lpq5qO4AqfJ1v5CzqnDkOY46tyFYTKMMXCESRjuvvptWBA?=
 =?us-ascii?Q?vieCSVZAi3Bl87/rdbcRRXmcPketjSTQo63H1sg3LFLQHdH7rVuZDL3nIwQc?=
 =?us-ascii?Q?12c/iNM6YmqhYtooGjMS9FZuiIZDQ8NdOguSDYLuOY+lOIFpSYLuZ+D5j/XI?=
 =?us-ascii?Q?SA0g8K9u3mjk9/ebcWejJZgffnFQKbHOmYv+Lnx86dSwwgqw1L0e7VBVlb8P?=
 =?us-ascii?Q?Tk9k8h+zy8gE23PfjQgNG6wh+/J+bCUjFl/2d2spn1uPM66QfazwiqG7hQ62?=
 =?us-ascii?Q?BrSevh9mLNCZj5bLMJQsi0+UUqFtOMw2q7m95M9bN5j/vsqIMBweHWhKTDSi?=
 =?us-ascii?Q?strsgYohQ/DDUlSPHaxIdUZmWKABzGy7HLGxamTU7z5TwjNTGjOwRgT9Z38d?=
 =?us-ascii?Q?ub8gxz95yapadCmr3gIqEhm9xf/cT3BCwEDkbPiLfJbl/qpTFHPgSpMLukVF?=
 =?us-ascii?Q?q6EPTTbrZSX2zmjNQ7/RX0B3FHwgyRavL89nhxtjM5A5q3yd4ohlsCSZj4sn?=
 =?us-ascii?Q?XNPzvxsUE5TtsW4FyTp5EE2j3EBI2KmWXyEdN1QvITQm8M4d4qPZ4lIbOhGQ?=
 =?us-ascii?Q?j93utGEFK+ryGtXZb4DscJqGuMjoH9lhb1VNHj/WAKpBLp/UtNVXd2yTf2eB?=
 =?us-ascii?Q?ukFsA0U8QS9U4SGk6uiGrsZ+o4974H3FLkzv71r2KuU9N9ocedvnN2Vd5IKI?=
 =?us-ascii?Q?zeh6BzbtiRGRacA1LUtrOGaT1tQfcZKaVHDbp9PuiTHi62t9CthQH1P0ncPi?=
 =?us-ascii?Q?YhPql4I98ex07Q9jYj3BEDwbN8Itra4CxuMzhsPJzCA6fenLs/11l4zcyd+j?=
 =?us-ascii?Q?cMkt+kv5NVxFjmbl8gwU3Y0o/M5dn5kPB7/muV1yTrhqqNcaw6L6+PuwEwCW?=
 =?us-ascii?Q?unFsk5S5UT0XVaY0WlM8D3gkxgy1I380si0OGBTP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62863dca-db69-4669-d357-08dd2053d214
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:37:33.6571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfvWpGFdWa7Hx6WmzjIoIs3V/8eyszV5GKD7XnD1GT2Nc3n2SHuoTCfIOG67uLhYtcMY6iQhHqyb4CbV5nDRTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9194

On Thu, Dec 19, 2024 at 08:25:30AM +0100, Ahmad Fatoum wrote:
> From: Oleksij Rempel <o.rempel@pengutronix.de>
>
> The Skov i.MX8MP LT6 device tree so far described the touch screen, but
> didn't describe the screen itself. Fill out these missing pieces.

Add "ti,sn65lvds822" touch screen description for i.MX8MP LT6 board.

Frank

> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  .../boot/dts/freescale/imx8mp-skov-revb-lt6.dts    | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dts
> index ccbd3abedd69..baecf768a2ee 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dts
> @@ -8,6 +8,45 @@ / {
>  	model = "SKOV IMX8MP CPU revB - LT6";
>  	compatible = "skov,imx8mp-skov-revb-lt6", "fsl,imx8mp";
>
> +	lvds-decoder {
> +		compatible = "ti,sn65lvds822", "lvds-decoder";
> +		power-supply = <&reg_3v3>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				in_lvds1: endpoint {
> +					data-mapping = "vesa-24";
> +					remote-endpoint = <&ldb_lvds_ch1>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				lvds_decoder_out: endpoint {
> +					remote-endpoint = <&panel_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	panel {
> +		compatible = "logictechno,lttd800480070-l6wh-rt";
> +		backlight = <&backlight>;
> +		power-supply = <&reg_tft_vcom>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&lvds_decoder_out>;
> +			};
> +		};
> +	};
> +
>  	touchscreen {
>  		compatible = "resistive-adc-touch";
>  		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>, <&adc_ts 5>;
> @@ -78,6 +117,27 @@ channel@5 {
>  	};
>  };
>
> +&lcdif2 {
> +	status = "okay";
> +};
> +
> +&lvds_bridge {
> +	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
> +				 <&clk IMX8MP_VIDEO_PLL1>;
> +	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
> +	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
> +	assigned-clock-rates = <0>, <462000000>;
> +	status = "okay";
> +
> +	ports {
> +		port@2 {
> +			ldb_lvds_ch1: endpoint {
> +				remote-endpoint = <&in_lvds1>;
> +			};
> +		};
> +	};
> +};
> +
>  &pwm1 {
>  	status = "okay";
>  };
>
> --
> 2.39.5
>
