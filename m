Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2044.outbound.protection.outlook.com [40.107.103.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F75154C04
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734630190; cv=fail; b=JfvsN/IOjRnOTqjkO3oLRmA7sYyfoe35usntO5bSDJHsrkpkY+gUXaY6owK17owrUcxz2gmLSKXDaVnD2X5ML3w951g9M2e9yf+XYJHMbTF6Heinzks7VabOOPzGPwHT9PqA2u9sR5/q6stWd6W0gfiQUHMeMepN59oOMOZTAow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734630190; c=relaxed/simple;
	bh=+YyekMGW27M/EYoKyn5eIDvz8dzHmOxt0F6Q6q+Ah+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TzshKCdHECRmh5wdcXvdbZ0abFwaqGwmc2qGXoMsa1/Vl3Yj280GkAhByPIwv/SuIUt5zayrzQ5RP+C3myxK6U4BnQjcc5ctNyD9gGcKeSiuiMLsV9WCbrM0IbnBHjHwYOg+usseoYcOFqlJ49Ia0FvrdUJwK95kWZ+Rc1Y+9h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ftJlVJLt; arc=fail smtp.client-ip=40.107.103.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ftJlVJLt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQNLFbUMrZnqD4nk4h+I1EUmdQ6FGoiAd9/SoIR9JVigAQEIxIosp55txGWyZceqyTkgarwqJwTGtURxFMZKWnUQNJFO4OfshCBGobTmeddUiTSa/WDMMFksuA0WAu4ZZbYVhsCwAguqYou2VuZ/ht8tSbbkHryBWw5ZWUtP249Lr4PbIiOXrbjfqE6JrKMHFWhbNcKeSuUv5SmWf5TU/e6UgH7/x+poq9DhfVcUev/sbJ8w9WUGHtu9oiiI9LduO0H73S7Hw3rsiAxFdp4cdLZ4sv+O1Q7QQ06BFSDieVgzPyUDFM9FR/3g7mXNFfYuCd3WN/up9zJBwc9NPr27QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Chh+wU8BMJJjiHC8HyeWfbQhVV1HWefzdN8wu2dPSZE=;
 b=M6DsYhjn9HOatO440y/6pUlPSMPUuoap3S5pjrk1XWiEUZVKdLdUIFWKL8+lQPCZasJDXGdrTiDxWEaExzuiS0i+E0LUp/ABeR2XbMSmMWq2rC/oso9uPDmSBzffV9fiQFJkxI2T0O1/q7GaVy7Pf5m9COcHn6J7kORTB7b73vR98ft5vYptUFD+6sx3f7TW1blbSyLo+7cfm3Pn0sy2GjfRuA0aFEnW1VPV+A/v8RJPeT1IzKN5+ZLrATsnor1yImAG6FicDck5S6bCqk3qgN2xXhdKDB5h/6iPQN4IynuV0GTyxl3Itb75HsUK7IQBCuUqugz3XM48NF1yd1CUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Chh+wU8BMJJjiHC8HyeWfbQhVV1HWefzdN8wu2dPSZE=;
 b=ftJlVJLtKBVB1zT5H3t/HhTIZWuQVL5b6npuKvE1FaeYmpmzI7htTw8UpQ1ZVat1s8afzs1kk9gNSX5xLYUnyPBnfiQ3et271IEJNX7li3ImlAnDrfiZKXj3U4UANJH1WqvYAVv/KJpw32f4G0MoYP1wWuqWUKQqipKlsVMsUmBwYg0QeuT0WETNdgw84NxF9MeQKLuW1k0ZTguQhA8LMRsLep9q1CmchcGouTVK3vbnw+EDvcrtdK//+aaOlYyhTIAejs0puztP6b9Sc4qJaYAWsmxsX/CFG+7SOOC18fNMMAbrCvKdoXH6Flj8JiR3ZONqrEvmAbV9MEUUeSj9Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9046.eurprd04.prod.outlook.com (2603:10a6:20b:441::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 17:43:05 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:43:05 +0000
Date: Thu, 19 Dec 2024 12:42:56 -0500
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
Subject: Re: [PATCH 07/10] arm64: dts: imx8mp-skov: configure uart1 for RS485
Message-ID: <Z2RbINlmO9UL+MPH@lizhi-Precision-Tower-5810>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-7-38bf80dc22df@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-skov-dt-updates-v1-7-38bf80dc22df@pengutronix.de>
X-ClientProxiedBy: SJ2PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:a03:505::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9046:EE_
X-MS-Office365-Filtering-Correlation-Id: 459c4d3f-aa5e-4071-a4c0-08dd20549799
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|7416014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xDzbs/eN6F8ibfpRYcyIHPmahfl/4k3ul4nXt340zVensCU1NSmNWIJ8Zi88?=
 =?us-ascii?Q?cPxdyMvcMy4FhlkbYPkUslSEYD37fLQCngQ7LG/o9JAloqT/1WgaepmUcoOQ?=
 =?us-ascii?Q?AIaHHrixJo/NsWTUoHAQQdj5UEjaWvBZATzGi+2f5Va9zOnX3SPN5W6Kk0tD?=
 =?us-ascii?Q?k2NQ4s6aeRssLjMlkRMSxqY6Qo5IS2NPA2p7j6jC73lP5rW7wC6uNlH7rdNp?=
 =?us-ascii?Q?vuhHIN4cUqMkk937dDXi5APUF8FdBC/dwHWWZeWPTBhbyPSUzh5sEk0cfnmS?=
 =?us-ascii?Q?9YHIcj/59HpXMft7vL5SA5xXl3GJ9DtUDGGD0g2ZWi0obBE3izYvdEMJoyse?=
 =?us-ascii?Q?evzpQJ8mMPWVSNQyDk6URwlMthCRbcy3wMAciUQXZP3VbGn/quIkBQlwWcfB?=
 =?us-ascii?Q?qM0ydmDy8z6ZGx8IE3hEGHtFcCv8DCumlSYWQMHEobFBSf6zK3U1yfrIOimw?=
 =?us-ascii?Q?XaGaQRaAELgPYz2b09nVvy+rDLBQAWjXWPPANdmKgJ033f1vNLY7mZgU4nz6?=
 =?us-ascii?Q?8FXafw3JMvcX8ElX4u8GewR0Nryd7LiBHTC4XD+C1BbtRD2no+i3ryiRE8gb?=
 =?us-ascii?Q?1oMsqiy060458N38aSqvss/ko+xSnIALokl4jNABpQjqppzJT4mYIrYKP36x?=
 =?us-ascii?Q?qqieRT2HqQzMIwfkaBfMLXJTtQ98pWACX0Q+QZ/Co57uMd5sjQ8x+pYIZ63i?=
 =?us-ascii?Q?9JtYPcHMqzbe0T/kEYv+CTsrFn4JSsYxJsxN0ub5bihkrgdmDYQ8kwV7fr6X?=
 =?us-ascii?Q?HHf+GJfMPRUhxqH0pdbuqqj0tbuHt06IYxVfzkfXb43VypNB32m+voVgtKOJ?=
 =?us-ascii?Q?ijm7FIsObnTfrDcgv/WlkyPaEJlEFTAJBE3hHQJxNlpottLt/Bw65H5ekt8+?=
 =?us-ascii?Q?hLy+FRgSzvDxkHT2z+DlXtt1fZXg6V41E7gZs3P2PMJ9t5a6IN8Xb1XK2iHf?=
 =?us-ascii?Q?5/PFDn3Yuj1kVWPnTAKYt8LPXRt7bkVnRWlMt62KmrJaT5fJBhabE2YkMUsx?=
 =?us-ascii?Q?i4bxFTvGa2lkAclR5MLZNDmYXtIjKqB/J0CnhWzpvWxuhANUfp7Vxpkeg0cV?=
 =?us-ascii?Q?SL6oyJi+h4+rRRWEc91woLyvda+QFq6J/1B7QytGzdKm75KBev1xlp4tnkH+?=
 =?us-ascii?Q?NMxe73uPArCwpuIl3rubX7DsXkyi7BSFGPcIETYXs5cAzoHTepeAUwbCGMuU?=
 =?us-ascii?Q?DWvfp83DifwqkjBCFw93lh1t/b52xUqFbvtZOSCdQu+zh1fWCJJ83zm4tnUc?=
 =?us-ascii?Q?+/JhRL5mZ8jUTIQYtyjitIr5/5zo2OmTXqpTQmi4HwmGJ5Hxa/fqxZBCzVE4?=
 =?us-ascii?Q?uoGlUEKJ94RFEBKNqkyn9JV6IlJTnt1BcMyrNjX4+gMOHYr3IcBfBGkG0xUY?=
 =?us-ascii?Q?Xf/YlL8EV+WYksJIC8YcqcYUPaCBzDuO6lHcc2WOcaE36DsPuQudTti4bZeF?=
 =?us-ascii?Q?4gxQWAbkgk47XHiF3EoYWtIKetRfS3hh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(7416014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1yprN/5DAZRVJmwMG7sSMAKez9hg7Y8o1dH/yB1sgWMOcsXTbFmOkzKBD+QH?=
 =?us-ascii?Q?PXdxWiu8kpOoA5TEg1kfZgSg3S4JAs9hKTT+keUkj7+bwgNGZSv0Lcq8FSED?=
 =?us-ascii?Q?SBtQIggd5w0Ik7i5mBxSqN/MkM0DszA53UBB0IP2yMU9fXfXjWzhMFYcLZ47?=
 =?us-ascii?Q?dWxPoJUodx/qCEZNsoWIiUwhSsFBSVvSBcKY8/zoe8eDDS8u645sZlKdoQU1?=
 =?us-ascii?Q?SqQripo2QhktpX9iQXecBg9oQteP4FJErdz/dyuwhhVOZLfUBIpqtsSbOSVz?=
 =?us-ascii?Q?U7VLlARLy5KVJRgu6TqYWHuvuyHeOy3plVvLXfM50GfG4SedfIQv+UlaSpab?=
 =?us-ascii?Q?9uEYRcbJhJFEfDfGIa3yKxtSY4O+p8I2DGljLXWRX7xVmVMivJ2mdskLvPEt?=
 =?us-ascii?Q?OwOOYwyS9LjO44gYSc4M3du7oq8VyLPVERwjnsSPOxdHI0UZmCwMUzdogxLb?=
 =?us-ascii?Q?nbGZIH4NazvZOAbQeJ1MJ6CD57CNdJ/NgfLGFVIYFgy40XwmB6uObKDoaS2r?=
 =?us-ascii?Q?vS7YcHHai3F6yjKW80aHvmfPuagyAMoLO5YU0PZNOGnH3oliN+9yr0/RQVp7?=
 =?us-ascii?Q?VGEdYNNdSiGnLsqplUslfrcrhvucER7bYoSexw/s9N2YL6jajReN0ae20MWh?=
 =?us-ascii?Q?kLCl+nv5s4jKK+QB7J/5tgb7C1aRLa+gRaVw+Q5FRMkD4xm131SdOcP7U5ac?=
 =?us-ascii?Q?iccJ0vb1hedoMMykkx/lfg0c0wKl9eqyeIMTi10cbOvtTS/EBVxG6whxysR8?=
 =?us-ascii?Q?BZppoi9KVLFu2kidcGkxo9W6IJKDfUJiTA5a4i/BfbhKeqsm+ZjeBpjiXzAT?=
 =?us-ascii?Q?BiyhRyRKzyLhbyJj08+FMUdNIHSJm1Ymmu6NK9dlNx4q10ch1u+P/MxjRVXv?=
 =?us-ascii?Q?+w+HFmVqgvTdgGUcwowZymmcanYgfbr61CtbqWowhA8rDNyXf6uj/9EZ1Gaw?=
 =?us-ascii?Q?AmA3eZv7zHLtzgr75HVuOxb7lravLb28yk4bmSUXR8yOS8Ml69x8AfeXJMbu?=
 =?us-ascii?Q?LcJsgXq0eQobNpNTIPm5kDIIBa8xd3SgT+BXiI11NhL1W+xrBgxTCC+fQRYc?=
 =?us-ascii?Q?MM10eQ2BIGUWIJmC8fmvq3QTrUWsQXnKF9imnkhwKLDpxGESkSTrQOd1v+Zo?=
 =?us-ascii?Q?a8COSw3BivmwSov3inIRfpu+k7qzw+nCvVjl+KCaLyAHsflWfn0UMhG3RvDd?=
 =?us-ascii?Q?7hMXGbsZMFrm+6DyAHoO/oXSwTdneiYmwqGZB4h7NijGR45a8ZWP5z2ZHW98?=
 =?us-ascii?Q?2VHz4x/iOT01UI9tvuTlIN5RQ4GaCRU1XxWO1iI2VurArKNosuwtYbp+VLO/?=
 =?us-ascii?Q?HKUn5knLgpvIsVbSeB3YiOvf5C2JNZlpyrOrm67xNGSr7TwaNmxyXn6u9aZ5?=
 =?us-ascii?Q?8iQ4vT1ouVuHY+Lz1xsethJtEB5lz/ZFRxGQ1EvksSTRwtfPb8sBVLn9p6H9?=
 =?us-ascii?Q?tDsi+Tm1zUbtrT1uaxlHNGvHI7rfHHkyafGNUpKmxtJ2/fAgHgeN4FRI06v+?=
 =?us-ascii?Q?b5gbZrJKeypxxmRgKDDQRrXhE1PXfTxhyYpy8sOGeX0k6zoPDqYq2I8tOtmy?=
 =?us-ascii?Q?0HDH9kTdyn679Q6WWTiDWD5l3D1J0EFnx1FsEdTm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459c4d3f-aa5e-4071-a4c0-08dd20549799
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:43:05.0862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZJAJ5bz7dRfXf3BuxFstcXQP/M5x9HC9V3xlqShHgtOWsYtSq5xESY2Ay7onIh0qkZamFf5lKRefJ4pZjl9ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9046

On Thu, Dec 19, 2024 at 08:25:31AM +0100, Ahmad Fatoum wrote:
> uart1 TX, RX and RTS signals go off the base board and to a RS485
> transceiver. Describe this in the device tree.

Look like it is not related what your did in this patch.

Add uart-has-rtscts in uart1 to ... (because ....)

Frank
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> index 7ae686d37dda..bce23d62cd27 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> @@ -404,6 +404,13 @@ &uart1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_uart1>;
>  	status = "okay";
> +	/*
> +	 * While there is no CTS line, the property "uart-has-rtscts" is still
> +	 * the right thing to do to enable the UART to do RS485. In RS485-Mode
> +	 * CTS isn't used anyhow and there is no dedicated property
> +	 * "uart-has-rts-but-no-cts".
> +	 */
> +	uart-has-rtscts;
>  };
>
>  &uart2 {
> @@ -618,6 +625,8 @@ pinctrl_uart1: uart1grp {
>  			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX			0x140
>  			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX			0x140
>  			MX8MP_IOMUXC_UART3_RXD__UART1_DTE_RTS			0x140
> +			/* CTS pin is not connected, but needed as workaround */

what' means here! what's problem to be workaround?

> +			MX8MP_IOMUXC_UART3_TXD__UART1_DTE_CTS			0x140
>  		>;
>  	};
>
>
> --
> 2.39.5
>
