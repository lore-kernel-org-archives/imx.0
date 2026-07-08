Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013028.outbound.protection.outlook.com [52.101.83.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE773E5A12
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 20:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783543074; cv=fail; b=SynhKXuBr9X5YKcONqt7CZPKbBMZSLrji6IXFwCuhuGrly6zMRCijPkGGugYgD7WwKtqF2vMguvabAfrtmOUkKkWTfZsL8pcDQNJYmzgI2LfEJGLOy3cjfyj4MgAg/m+C9Lbd5c/noXmvtF0V9fJT2BJF6HbDRx785hOtFQGNQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783543074; c=relaxed/simple;
	bh=3rFU18j5hmZr0a3AnKMAzd5pnOiaYsPtOvtjuu2eyKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WS1ZD93Rw2SsIQItGDAsXoSNqyQE0AAiq0f8fDGXSlEeSKJZGKYYcF1E97p73iXbak9U3R0jT21GyO3HQfl+J3YUWD1NfeHpm8khek2IKIIoQyblSRbhg4mr3zDZy7k3hWS8yCL4vu7B3YFgivc12ZgP5R4CjbD2IkkcLeM2qYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=a3b/+HSD; arc=fail smtp.client-ip=52.101.83.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="a3b/+HSD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8K+ioMU4VdFRUmHQkToCHKhsGchN0+HDk4KFatWaZpT0giLOIqeh8JmuYqgSHr9Yo6c0axLUo0bRXv6h5NKU5CisAMjhxthyovxsIg68UJ1mDzcUYXKi7PhgPYaOBcNMs9UJqWVvIh6+xzmfj3uVDVPnXAAqkNzjG9WhTfQxs3pR9QW8mejrvELwB7NJZwtNum2sVaHRhSElTiAVbf8T8JL2NTSxo2so/LZEbO4FGCvwCodukQX2mLWThnHMOq48qi/aO2f+mRXYIrFRNsYcqVkHLS94oUqbSP8D2oSEuYL3e8tinkPHoQMG2NQ4NAJ9kUsLsa1qcUxKEtolWMtZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLIOwX59rHzsWSB5b+uNiac52cGHyBK2fTin2R68I0w=;
 b=mqDryuo94ToEJBUXWpq5Cm8rM6bwUOngk8bLrXMDpzLbNP3C4ixxo8LuI6YaLv6tcYW2Csp7L0nNrL/Y/Utq6Nt3eP1xjWF1WF4WcEV2Yb7gsf5MJDXabbfz26LYkJdkzbK85iEE6L8nytxh3VDA599pHmQ5r3WOK4DIrrvzbK2KJqYqaHy7UhlYAbbr9I6n0l+Y9QjiypphV+8lNi3oian32GIdub0dOymcGn9CJo+Yaj8m4JFJXuKhIRWtYCCrrSUnGv016HSlsyicAMkLdXoZ3bkcqg3slE6H/gZFXAK1YJwM5rafWXen2JEWq3Unnir8+arUKk42TgIhsibtLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLIOwX59rHzsWSB5b+uNiac52cGHyBK2fTin2R68I0w=;
 b=a3b/+HSDvPPZmU55yBZ3zFakOgZiJs8C5SH7VTxu+Qc/VTU9HMjA9Av7mRVwL03aJ2Bc+cTBRf5hW2my7ezhj87T/vYD0awW5T3dyvA9yGOoTwx96v3TsB3k+eBSHc0wUS4Q4nmIA+QPqfbVUD8EExGQXthOhB9NJwmnneTJTJRZX//TMAJaROkQYgu8AZTdUWPwGW2pTRF8zAKt0d/rClxvQXvmtr4cvrs9ZGTYxeEG2fP3xIFCXEHfjRkdXy3iKckhZY9k4e3q7TQBdasMSD7AZHrYZrCfZz48zqoidiV3Xeyok8c2+REh//TFHpzDsdTesXIHfFRu5Y8oy5n6og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR01MB10416.eurprd04.prod.outlook.com (2603:10a6:102:23f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 20:37:48 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:37:48 +0000
Date: Wed, 8 Jul 2026 15:37:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: chancel.liu@oss.nxp.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/6] arm64: dts: imx91-9x9-qsb: Add WM8524 sound card
 support
Message-ID: <ak61EPNcUKdDetbt@SMW015318>
References: <20260707065725.312450-1-chancel.liu@oss.nxp.com>
 <20260707065725.312450-6-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707065725.312450-6-chancel.liu@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0099.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR01MB10416:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f03baf-79fc-43f4-0dae-08dedd30c5b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|19092799006|1800799024|18002099003|22082099003|4143699003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	T/w2l+kHel2vnJcWad0nbw3apX+meVSRTEYB48cFfFinEez7PLWyh2dcACAoU0uM4LX3yicWz1LK8Zt2qZfApiyLQfLI9bOBAUYF6rS+BsTltxvK1siebe6fPYrNAgIRJ+KTRbclJVTqY2O0qExbhLOgdbELLtKD+xJ+QKzjq7U0u7B6uluQ7vgpYykk3lW1s7Vuxwd3MwW2wy+2rKnXQK+Mratrwt32m19N2wEvDOxUhn99nK4fLFW+l1iloR3omeTyVzGTOI0aeGqV3HRWhaLmlfnxuHs5C/n4/9YjzFpLyGQcFFhZoM37M+ZrINP+7i8OKd61DcFrTt8HXnqLVbzfVuX9tuCe/5NGoFKRUP4fhWXvLVAeFYDO6iZjJJxDoRVbCdhBVQ4U85ulc6FFPiDzBFVaK6wQzHqFnYpTsVKYupEbIAXZJf4dc8Ksh3L0tQ64R29ZQoF0xBiB8p+F8Xmi12/nnOvgQ1HzXNLMLGpZMog4cOrXjChybGDFO5lO/AlPEUoqps4yI1QouBw3q6vPGg+BuOhtNe86BAlemnoF5IY0AZBJ9GmIVmiYJNbZ4S5ggzgu5W93icvckCzQ8n2pL5kp7+ZgaOB9pPL7fBlsnQ/jGt1ZykBU8yX/T/sEEmmzUNv0jfBH+a5RXY8AOByqXntghhyvopQUJFHhV0c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(19092799006)(1800799024)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5tXjw5EEmKUjwk0LhVvRgsgwX0oy2EhSnx1RB/arvH6MBurNUFc0hSAmqi32?=
 =?us-ascii?Q?RipWQs+WQSqLXM6GbecgPV+uiMBxTZKbtpbbU7HLDd6YAE/upmcAOPoFRHeM?=
 =?us-ascii?Q?ggavWclA2xEKK97V9U1npTRkNfSKdUebkKTbJ6UWiUZnezlip4g9IXcOV0w7?=
 =?us-ascii?Q?7oqiIlsI+VSrxoR2xwjKsnfcCFzo6Rd44atPAeWHJLA9z7pQ0ht2Gm9HYIw3?=
 =?us-ascii?Q?2dGlG02wOP7u6+pwb28QMZwXth+CPAzRhxMglka57YzWRd7ZzPT+SgZpOZNL?=
 =?us-ascii?Q?8A++hscD1fCWsEeWbvgLtLd5eb/mzLQbBBSF+oOq3/nrO1+ErbS+gurJ7fP1?=
 =?us-ascii?Q?lck22K3JW0wVaIQQsAGIu66GG3I8Uu7jTblROSViAzV+0NVBOnvrnBq9W17z?=
 =?us-ascii?Q?WvO9qD/RF8zANTERWkk9vvvEEDSibwZKfOto60CShQkfKhxpxceOdplDP4xA?=
 =?us-ascii?Q?RwwZiZjE9tLG1O4lRn61sg8ntrqDUJJUUo1wFb0rtUKW5APCmHK488yDu9fJ?=
 =?us-ascii?Q?Jt3ONU/t/PG+VybDzPo3J1jrAsueNDJQM4FSUnR1vlHKZiDicINXQ81LHWFe?=
 =?us-ascii?Q?imlxEyZL+m28EiCXNpqCHGaxL0ODIoNDwG17L8X94QSr0MF5/Sifj9bORmtO?=
 =?us-ascii?Q?yVQW5Z2HccmEBtgQRsKNJ9kartVmQTYQn/wcGqsbWJ5n2J3ohLZdJbX5Crbf?=
 =?us-ascii?Q?bcbZLQcX5oUu0ZN5jaCw51x4WDsEf7hJb/fUqktNBkonivxzC8PW+TBaj4LE?=
 =?us-ascii?Q?KkkmB/VqpzL1MXaVy9NOOMRcbiQfkIq4PqqeOqIyJjecLPR7w10omsAi75+W?=
 =?us-ascii?Q?n+Ey69I/QyNKgx/HcBPPmcehJ0c6l/PBMQKuIpwwoM+RPcT5L0K8VStONscH?=
 =?us-ascii?Q?1OM8SXYW14c0HvCAoKD7WI4h4X9qa8NsJSNPyHPMfxXIDG9+HmRknlE2JfoZ?=
 =?us-ascii?Q?QdSfWu989nw5Tks7OoS6oYcxiNYh4ND0wRgo/nMQ2w+gZRTIL4yAKo7KNZcR?=
 =?us-ascii?Q?ZfviDa1xmyOFqxWA1uXLlLYrHdSnX/V3dVw6aGAOhrqs5GTLiN1hlAgThM7y?=
 =?us-ascii?Q?MDbHnN4RaJbaPb2fW1DcAKeleASTckpLL3nGgWfg6wzXl6jd0pGKMn3F1Kjj?=
 =?us-ascii?Q?nn49PwHzC07K+14idsWu39x/I1i2H6DfFMHASQHOeca49mejsBJHIyCfbXKo?=
 =?us-ascii?Q?KCKRXIC/z4my8O5KwHlBgf2RLfAH1BAFhqoPDE5lAAsVsOvC9+X2w8lOFqJA?=
 =?us-ascii?Q?VtO32GVP5A6dQDuBdsCfC9iaEcuRIQAr2iz8U/7g8trVJxIfWeR/tPhoOWfo?=
 =?us-ascii?Q?jIDOaj6JNDtIo3pmm62TxHMvBsbCOezeLzkbcNAhNHaSrL1ndgtsHjzOy49L?=
 =?us-ascii?Q?6ysnAsKc9r9LPHpimETTdEJe8Z7WX2JzMrjZAqpFxfdH2Q7dD7LCBkTtFN4k?=
 =?us-ascii?Q?qfP1Due9+3d+UrgG0mrQOpPl4w2MmBHAaqByPhp2gQNNPxl9+XeQ1IM6MTlq?=
 =?us-ascii?Q?bntwjHwfPfb95a6vrP/ReFhdleNwOsjNKFj75UnrVq/PuuMZUnmlIspoepDU?=
 =?us-ascii?Q?JKJglipLsMHTkp9l/eeieOU1mlfXKyozmf5TWleMHbjPSkT7j4wLDOll90NZ?=
 =?us-ascii?Q?EhGGgWQKgLJG/cIDle97LiFvbRgrxeD8HZekHkzUjY4PO5cMCLTZD+XIgKCZ?=
 =?us-ascii?Q?vCaKMpVA6csAOOfk6Y57UMmFi9EKaGD5n6e0b6aFLcVoSLpbHO5SfCR7RUrY?=
 =?us-ascii?Q?3wZN8XWH6gdQohq7I/F9SFFaDYGkIRcanHwbBSq+pZBeI+wDIq2F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f03baf-79fc-43f4-0dae-08dedd30c5b1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:37:48.3373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENTyrHcNUh5hNa2aGOSDfBP5FpYZ1mZJY/ygSQLhBHwsW8HhwQbaBil7BAT5qK+3zgJqNoyxFBfU/rqrbNV6oIHcN3/ghxiTSAxF8L/BeEYCmr+dz9iFi6VaYTKsyjeA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10416

On Tue, Jul 07, 2026 at 03:57:24PM +0900, chancel.liu@oss.nxp.com wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
>
> Add WM8524 sound card support which connects to SAI1.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../boot/dts/freescale/imx91-9x9-qsb.dts      | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> index 1f2d8082d255..c5b9dfee95eb 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> @@ -110,6 +110,28 @@ linux,cma {
>  			linux,cma-default;
>  		};
>  	};
> +
> +	sound-wm8524 {
> +		compatible = "audio-graph-card2";
> +		label = "wm8524-audio";
> +		links = <&sai1_port1>;
> +		widgets = "Line", "Line Out Jack";
> +		routing =
> +			"Line Out Jack", "LINEVOUTL",
> +			"Line Out Jack", "LINEVOUTR";
> +	};
> +
> +	wm8524: audio-codec {
> +		#sound-dai-cells = <0>;
> +		compatible = "wlf,wm8524";

compatible should first property

> +		wlf,mute-gpios = <&pcal6524 2 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			codec_ep: endpoint {
> +				remote-endpoint = <&sai1_ep1>;
> +			};
> +		};
> +	};
>  };
>
>  &adc1 {
> @@ -186,6 +208,15 @@ MX91_PAD_SD2_RESET_B__GPIO3_IO7                         0x31e
>  		>;
>  	};
>
> +	pinctrl_sai1: sai1grp {
> +		fsl,pins = <
> +			MX91_PAD_SAI1_TXC__SAI1_TX_BCLK				0x31e
> +			MX91_PAD_SAI1_TXFS__SAI1_TX_SYNC			0x31e
> +			MX91_PAD_SAI1_TXD0__SAI1_TX_DATA0			0x31e
> +			MX91_PAD_SAI1_RXD0__SAI1_MCLK				0x31e
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			MX91_PAD_UART1_RXD__LPUART1_RX                          0x31e
> @@ -433,6 +464,42 @@ &lpuart1 {
>  	status = "okay";
>  };
>
> +&sai1 {
> +	#sound-dai-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai1>, <&sai1_fun>, <&sai1_enable>;
> +	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> +	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> +	assigned-clock-rates = <24576000>;
> +	fsl,sai-mclk-direction-output;

vendor property should be last but before status

Frank
> +	clocks = <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
> +		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
> +		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
> +	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		sai1_port1: port@1 {
> +			reg = <1>;
> +			playback-only;
> +
> +			sai1_ep1: endpoint {
> +				dai-format = "i2s";
> +				dai-tdm-slot-num = <2>;
> +				dai-tdm-slot-width = <32>;
> +				bitclock-master;
> +				frame-master;
> +				mclk-fs = <256>;
> +				system-clock-direction-out;
> +				remote-endpoint = <&codec_ep>;
> +			};
> +		};
> +	};
> +};
> +
>  &usbotg1 {
>  	adp-disable;
>  	disable-over-current;
> --
> 2.50.1
>
>
