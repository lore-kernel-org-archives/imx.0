Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921F286410
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 16:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838710; cv=fail; b=nY4dsk155IUHhLSQMEzoPjs+Qp46UAerTRYWHlhKyOjND7SjOtGDboRUkuYZHQnnN7FA3rSRZvu9Ck3duSbOPbVu6nPBea9GW9e1GxDRr/i34/f8kSnb5i9JX3MDpHcgTXKhdPub1Ownl86UxHAtq2DqLdhryQs7mkwOXq8AzKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838710; c=relaxed/simple;
	bh=DVwVq7zVTiNDiW+I5WQ1lA64zkzNYS3D1kbuJ5XkHus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EmbbMjm//dCPQJbtNaSt1fAmKmEFpnF4vjddLX2vBSxR+M0kopGohw3A+x0RN3sgDcp2Z+qmCxJ8HThUH3cAz0m3uUNfaMBqsiHriUv+mVRZcP8vhuuTKnsq4618WkzqS/D20mCULuz/STRUayeV21yRDZzwqIpQeYGzUemXXEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BO2tmocw; arc=fail smtp.client-ip=52.101.69.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BO2tmocw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCMZz/y3v3hyH14mElsEJtmdVonbPWm38UPRo/zexWfWrtUvlJo3v4zZXeLMW60SSvLjdfPwv7JrRfs5H71P7jiEx60nPdp8dzg3QyVh0umdHh8X89NM1IHmwOrw/4EJIorEzKi7t56tq/tq6U8jtv33QUFdq71NBzbPG+M9+g3MNtt9rSTAupTqZuo3ryeqGywjyHeiu0lZBHHsPPtvuxmmW5B+jUWF9lTu6v1nx4t5kPp1MDDhJEtyyCGFxl2wOKTOH5YKuwlX8km67UYIVpXQVgOG3fWJitqfKYe79A6+kqCZNtZtXCWs5DNtRLm0UE+9EDw9M4XGueA0ph4VHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=To8geqTI5UjE5k89c3MUaFO+w+PsunQRdfsTEbH86qw=;
 b=t93Fpz2Au6VUEcEEaF7dFSoDVTKhIAybCOKHIGh+lG3Q7uW2GtTunouJ/lgBdtdcS4UV1YVfYjAmdpCruneD5YWBvWTDRZKeUs5ANLr32MyPl1FFvoG3FKQVj1zNcM6H+Ro9dNg3vdNgC/UggrxlqIfTur6Tr7jTNf44vsczuLnssJMbr2V7/hD+qFf6swYAagW/EAwUz/ECCOZICm+sB51GmUP46W8D+if4qQ7vhx8Libjpiodfd8l1SGl4XBvDQ4M9f52nhgy8tnSzJs0hATibFC1n/agcOjRCyAxoR9HOZ3Whrmxq+flk8KiNY3Nd1DwDlvAhAlh8SiueDQxTUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=To8geqTI5UjE5k89c3MUaFO+w+PsunQRdfsTEbH86qw=;
 b=BO2tmocwTRb+kng3syRhzZIwmYJOhN+rFGvTNLP98rTw6mbkch4KijHm02vLrhPFzQKZepImQbTCpyc1F9cQIR9qRlYeFdf50QI7rVmhz13yfTh7FBK2TtxnMhycyhoryekiZKmOLx2X9hLZ8AdMOwiM81fE+6PdQ5GLZ09F8RZMzKjv668rtY+PGAF/pCiqFXKy56vCbKlm6frs2k8fjBXQptsu0rURIOF3rcuU5p62N5s+1Pfz5VVWYAW4CKGY2T2okWgCl5/nKmn/nWdL8UD0XzbJz7RGig2MNabRctMcr3Q+5QtODtXro3SoqfT4dEC7ZQiwK2Mp7lPTcML1Gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PRASPRMB0004.eurprd04.prod.outlook.com (2603:10a6:102:29b::6)
 by GV1PR04MB11485.eurprd04.prod.outlook.com (2603:10a6:150:283::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Mon, 19 Jan
 2026 16:05:04 +0000
Received: from PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd]) by PRASPRMB0004.eurprd04.prod.outlook.com
 ([fe80::6ab3:f427:606a:1ecd%4]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 16:05:04 +0000
Date: Mon, 19 Jan 2026 11:04:56 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx943-evk: enable lpuart6 for Bluetooth
Message-ID: <aW5WKM31MVOiq+5c@lizhi-Precision-Tower-5810>
References: <20260119105215.1238855-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119105215.1238855-1-sherry.sun@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0141.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::26) To PRASPRMB0004.eurprd04.prod.outlook.com
 (2603:10a6:102:29b::6)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PRASPRMB0004:EE_|GV1PR04MB11485:EE_
X-MS-Office365-Filtering-Correlation-Id: 93512312-ff30-4c73-883d-08de57748217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ql6sr8wKSKeqYcuB6G2U5a5QW2HOiSGiPG514gksr2ngJLfPgbavuPbz2luk?=
 =?us-ascii?Q?8lbXbiIZR2+Mio5G0/NVaxK4K9OwGHtKyv0NzUFAFFUB4N2K8PhzI5M0keNc?=
 =?us-ascii?Q?AJ6iDJEePFW+t4C0GfAK9UbihZZxxwsUbf/fhmdKdpM1R6oLaXkS8TEuHnNM?=
 =?us-ascii?Q?M72V3wlWmXkUCFX0iBivnN/szOPVxtE+xRon8R058/FklS7c4im/z+p7FWns?=
 =?us-ascii?Q?LW1pEKyFkeYrELWxRzw21DyWP3zn+Lb7kOr3hi6f47UNf7+341lp4p0A74uM?=
 =?us-ascii?Q?WhlzgRPGr8NtBZou/letGu3YKwIq+FayWzCn0euZzTPw/n9UZh2ltalX0lOp?=
 =?us-ascii?Q?l/KzCvvy34zCBnbE4it+MCRNP5BkRMvMZMQ+3SvdOeFSVWxXWmKMRvINqVb5?=
 =?us-ascii?Q?ZeSo3IuUUqp7lO3cnPvPgct5vrrcgprbibKQVfRH7xHxHixWwj+CGpZuz4r0?=
 =?us-ascii?Q?nNmk7MC/CNaZS+pLw5BhV5POsdaC8CFUKEZ0mzGLS4EFav2w8vEHbuuyP8Pr?=
 =?us-ascii?Q?acmDPwaGjKB0aZvECfXuuQZeeV/FdiyuH2+WyRaWPF/lzy3s1V2UkZdHIryE?=
 =?us-ascii?Q?EzXE+KsIt/HfOntK344hYK9NK1EhTCvSnTBDqxakdio0CXU/ocLaHOvT420d?=
 =?us-ascii?Q?dZsu9MPkXQP8R2MxUf+fN8lCPdmBvfXQYawYZWd1z3IAf6nJdZJlPP0Cysj+?=
 =?us-ascii?Q?JjiP/xZUCPmKwtcxZFE9uF/CXBE74h8hHRVEkxnnhXuz8J3FuIWri/N79+3M?=
 =?us-ascii?Q?3lW5frGzRuFvpT5ApaE+X4r/H0R/FkC0c20+MlrTzmWa0rkCskZO7/6vcTMM?=
 =?us-ascii?Q?PrD8qGbd1E9GOgJY4XTiS7B4gipN0a/hMtrdKR5rBqTKHG0oNLFqLXKoUQ61?=
 =?us-ascii?Q?wosx7UwV1jIYrntpCDe8bjZa6nBFi/vLi+e2zBZB37kJwqOh1Hed0W/YgzY/?=
 =?us-ascii?Q?6giV5HAce1dJkHq2ZQnxnQn4xct+5HpnEeSNVbz3WdzNNYMmTsMoEknglsvw?=
 =?us-ascii?Q?sj6yH8uSudH0ilBWPz4equl9EI7EMJ+hnck/YgXS3o7wg0iGXXdA+BSp5oUE?=
 =?us-ascii?Q?Q/5sg29RGgHtJAkkrYsDFjqnyXSZtqqmrmQu1PJEw23sI/ZS9prjQ7C+Lhq0?=
 =?us-ascii?Q?molhuA3yXRrcvVve9WJwMcfMlDOnjkzyIejhtB/V6dloibyVcuwBtECoh0es?=
 =?us-ascii?Q?smUb9sYlO4CKi12ewIq5tVj+S3QyeXk4xCBXBsCJZ94J1/3DLbbsuKcJ7vaW?=
 =?us-ascii?Q?F5UcECzF99db5CeVefqLHmufqKLy7kVyXzlKN438erzbudSuVQXQAyluTXiG?=
 =?us-ascii?Q?M2bZZjOz8VEZeJSbdKjpEqYh/mopl/nZtsMEilXG/bN8XE1cmqPZ869/KoOJ?=
 =?us-ascii?Q?BMlNsWffelRBNwDy7vetZG0cNPcll1wKNV/mPqTsFxAgi8HZTOLOGhXN11q7?=
 =?us-ascii?Q?b9onuZ/SvGu9itPytoqENUywfTNjg7oD1+t4HXDHIn//jUipG1o6WtYRXO9m?=
 =?us-ascii?Q?tKcLz8XKUnAop+Vwyy7mcfVfKmWeOcg/0Rjaq0tEZbGd6bCDroTwdwN/P8Gp?=
 =?us-ascii?Q?H1XPb1sjvgrhGmQfGqCInE314aavApp1vols2Dg9QzyuxFTgoGoQ5C968JPK?=
 =?us-ascii?Q?g9SQaY8sntZLCQyFMS9m+P4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PRASPRMB0004.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6SPTTyGr3j7bFMvO1y6OmVr3ggRG5EU/clA9VmR+TqOWELgLKcmkw9/fjCwT?=
 =?us-ascii?Q?iuWc9O/AndOemcOUc+pjgs7GhtIComdHck9j2Oejv08x8NEwhzvl7fS9E8i1?=
 =?us-ascii?Q?K9ZHiVs/kgXEcFM29y1Dp9Si1/o8YJHxgfN9tX9gpVEpgwOBtkdrrDcYW6Lb?=
 =?us-ascii?Q?JocM+OboZ5AlBC7YzG1KnhqqGgnif4AR2Kl/jw/1bMdZXXXIy8G18chYX7Y3?=
 =?us-ascii?Q?7i0/E4QD4ojmHDy/KZJje48xTjZf82YlO5Gsx1IrLHeGBM5pytDt0oRyB6BF?=
 =?us-ascii?Q?9/fli993N09KSSfnOLZ2MhmP8vrjTos1Bt/lF9RZBkdJSd2N2XhPIo1jIneu?=
 =?us-ascii?Q?6Db5RAmO80XJS79XBGpckoPFkn77JxlfbXGr8dBrdIsvfJKGY4yoX9Dtcik0?=
 =?us-ascii?Q?bVf/k1Wl0dywKnFmHjiTNffa3y+8gOBV4+MkE8I/2Uc5DkWXhmehGSeLnKF1?=
 =?us-ascii?Q?vGhZUxpGcD4+dApI8rX5yAVPr90GdzhrAQ+f3ZMlEd5RdSxi551DfnmSpMKs?=
 =?us-ascii?Q?I6UJF4uf7cJ0xc2qZVXVRpuYc8tH8AE2WtlMsGZUYWPOZmdpbgpgjjWpZrOn?=
 =?us-ascii?Q?wwhWY0APnX3ZgXft0h8Q73eYmDqa+3TDzRukXd8tk/NDbdcYqcTwNLk39/ct?=
 =?us-ascii?Q?qVPhRRhTbxBRpFmSpS6tGj6PEbFFMcDeSCkNlz92bZ+BmHhTSMlyDI9gYpA7?=
 =?us-ascii?Q?6K57nLtBW5Yi3LUiywoauVp2lXCLdqZGljKGeqnsgXdyS50BLBmSwTboXZMX?=
 =?us-ascii?Q?xVDkSKLA948POOV46ImCTkX8/eJ6FdkR6fh+VAL+TyhU2owN0v+2/5a3311s?=
 =?us-ascii?Q?NVRTPtLeoelzL9v8DjzRP3hmvnORGJLfr0JuDbuPOZpxj816zwv0qfmErOkZ?=
 =?us-ascii?Q?kY0q48R42HdxaZCLsYNZOa/3P6UYP/5oRH05c/lpYjByPcZe0mgYOokTMfYr?=
 =?us-ascii?Q?LXTE+iJmqi9dRUcyUo2e8QZB3o7BcdqgI+cubL0MNYiKTC7ysZPAsDBJOT3r?=
 =?us-ascii?Q?0igN+aRNZjYl653xYbiksD8qciwlApYiQz79Q9oiU2yDWKgmB9777SK63UtQ?=
 =?us-ascii?Q?LMIXkPhIhXb5DSRfrNPKlLKz26WjbRQzjVfDnGlbYK8FJqXQ+yj21xszhgtS?=
 =?us-ascii?Q?pSdC3p5SELFl15pD6h5YVEkNHjd8K5nPlU40rCOirL5tpqxunym4uwqd3RWs?=
 =?us-ascii?Q?Iwx3zIrnh5/A5JwZnJW4lReWFmf7pX9shlJkJb1cJ/eFPmah9q1I6lxkIr6d?=
 =?us-ascii?Q?wLMCouj8QUgxsuGR7Q0LlLSQ3ortg8zhEqtvk4aObhLPp1Jt4P6W/u5O0WJr?=
 =?us-ascii?Q?6pS1Ohme8YCOC8X7YU3dsGMZj9zsnNuIOL6uidvUYIwyydbZ9qw1H4MEe6c7?=
 =?us-ascii?Q?nAzzeRRTiALB0SJA6CuEr8Gjv3ITAELkqikNsMKxdzUDmaBi7a3rlwLPa7U3?=
 =?us-ascii?Q?LdGfP/HFd+zexe8FQlXttJ9T7qP2d23iSGUtTr4fxDfOJjZ8FxZYhwAFMyhu?=
 =?us-ascii?Q?zf7+lWg0pJJN04hlXb1aWH2PAzBl1sIpsGZjPc8OW1boTW7mD/cRo4db0Oq8?=
 =?us-ascii?Q?itG0aL/UBbAjX9yCd93tOl8yIqUPhWe81fo/UCuAQXWrBnNLyEAxY+6sQ5E+?=
 =?us-ascii?Q?IboVGcIhy4lVNKYSxBd1KnpXto34px/cjt2RiM+jwW6n23FiEYqSmsCFmyAy?=
 =?us-ascii?Q?qhdlwusU+/IkndvWaZ2Da3zi7qXjuKM+tMqdsrPXt3jXcpw+KK1O5b3tKk7q?=
 =?us-ascii?Q?AkJ/jEWzwg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93512312-ff30-4c73-883d-08de57748217
X-MS-Exchange-CrossTenant-AuthSource: PRASPRMB0004.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 16:05:04.6448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYp0FJtFvelVTiHqISA1FMwMmnx8nRCz1206xlJ3rVqTxpRcKrgiHeS01Z2NeT1Oug6bR5gf7SAoGWt85BS0Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11485

On Mon, Jan 19, 2026 at 06:52:15PM +0800, Sherry Sun wrote:
> Enable lpuart6 for Bluetooth support.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 21 ++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index 31fa9675cee1..f54404c9bfc9 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -21,6 +21,7 @@ aliases {
>  		mmc0 = &usdhc1;
>  		mmc1 = &usdhc2;
>  		serial0 = &lpuart1;
> +		serial5 = &lpuart6;
>  	};
>
>  	bt_sco_codec: bt-sco-codec {
> @@ -437,6 +438,17 @@ &lpuart1 {
>  	status = "okay";
>  };
>
> +&lpuart6 {
> +	/* BT */
> +	pinctrl-0 = <&pinctrl_uart6>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "nxp,88w8987-bt";
> +	};
> +};
> +
>  &micfil {
>  	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
>  			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
> @@ -643,6 +655,15 @@ IMX94_PAD_UART1_RXD__LPUART1_RX		0x31e
>  		>;
>  	};
>
> +	pinctrl_uart6: uart6grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO04__LPUART6_TX		0x31e
> +			IMX94_PAD_GPIO_IO05__LPUART6_RX		0x31e
> +			IMX94_PAD_GPIO_IO06__LPUART6_CTS_B	0x31e
> +			IMX94_PAD_GPIO_IO07__LPUART6_RTS_B	0x31e
> +		>;
> +	};
> +
>  	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
>  		fsl,pins = <
>  			IMX94_PAD_SD1_CLK__USDHC1_CLK		0x158e
> --
> 2.37.1
>
