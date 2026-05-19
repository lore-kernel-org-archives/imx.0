Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013034.outbound.protection.outlook.com [40.107.159.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B7C407CEB
	for <imx@lists.linux.dev>; Tue, 19 May 2026 16:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207605; cv=fail; b=CUF22AhcI0epNXvEJe5ZzzhOkJ54JNrgX9sQTc4YgFvEcwJcjZNfSUEXPJ4dUmpD9tECEDO1OXLo4dAgbrAh8uz1+R4EPxfn73Nn4k1nQAxvn9347JWD/VrqcnKmebmRWM9/5dxYCTG6/yLrfAqEI7Oq0lI4f0NryagvtrIgAMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207605; c=relaxed/simple;
	bh=xv9DhZCOVAOgB4I7g/GrN75Kwn4xnYyS2I14P+Df6R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kPbZ0F7z62RRUQYzT6WQnARRZfRgx2siaMcPpQd41vQjXE/E/9Qt5Uz5zZi6sMCwlonP8Bu/TIrC+VdH8aS2C2zg0IAI+/sHx4466FVtzqxEn2Z6aaGcxKlEELzd0bJhTur5OOp0uIUBhnvXOwxqxruFm/Pa0PLuktwhZ5dd4wY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cYgDUFNy; arc=fail smtp.client-ip=40.107.159.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cYgDUFNy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X9njmeeBbmcYECK6Z1aOLysL54qQUJlBYSysmqu3mxpe11yDjZJ7Vkrpc8jboko/RjwTrs3Xtj6G09mzNVbjcXU5ag5kzKR6n+5kAEQ1dy3onyoxgHeaB1J83WeQ9LGGlZdyZqTar8a3Q4lN0erQHo5ZVRfT9gPnMMimZJtQrryjNAUKE8mNcLBZv0T3J+XI2qwPp4UY4HU3HqJS0xs3CtL/5H95bnRDaddCGoCl25WIRAv7wtQAl/A8SLxMhjx+NXxMZaC0nDp2ctSv/b7k9Lw44phMIna2fBprPio35rJ+bF3fginRzWDB/s9xlae5clst5Z2AXBaa/WpcCxaT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYqQ1uiZoi3O09FHIwgbb7EXloTwEM7hfX7dvB3hCnc=;
 b=hjkY0mAtw1LQmmTwH7++jn7L/GlvErV1UkaBIReRzPbONLZxzIyCaatxC8C85BUZvOT+KQjtmV2xmTihK1C0nXF3tNVqboqcMJijD+7LBhMvO8aLURxHy6pFWpZvLRU54eFaTVq4UR+hnJzlirSeceKW6u9vlB3bQvmxE29ZIXZr3mO0jDkEMfep9ZpZpEUnVPSQ7SnMt+dMVQLLXu7pmmq95S4zAxahrwvGpeNfYiAJKsQ1E0FMwCRiRtJErcfvmlz7GBd24/SL8TZLrtrxD/ZUwrjyHBDAOO93c6jLn9afwpn1FHTc+diJojqLzbFLD1u3kLeLfSXZeDmoJRJVtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYqQ1uiZoi3O09FHIwgbb7EXloTwEM7hfX7dvB3hCnc=;
 b=cYgDUFNyO1qRBhiqGvQcGSCU63soLzARClzxNYLEutBkGSqhn4Yd1VZ3X4IuAsG1AIXYtMSknJ4n3IUSIomAKYgAhTXEvQ/FLRlHxXFoNvfb29DG/WCZHDJCWJJyfT2BpXpVXq82L3gT3MpVu2obXQoxZxcV+oeaib5Lwp8g7eruZc9lvNuJZgiOKNxhedcQhxzqaj0e3xa2/+AD4qFKjg/jE8u+MRQZ5WpY1qeFKk7PGAgJYIyVGYZ2+4YIxUhjlD0ZpiGXqQO+u6w2zyC5kEzT7SwPLfv9zYYTHQtcp96hfkAlGrf96KaBKXJKTXvzB37yO7inL6UwICsh2kkjZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by DBBPR04MB7964.eurprd04.prod.outlook.com (2603:10a6:10:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Tue, 19 May
 2026 16:19:58 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 16:19:58 +0000
Date: Tue, 19 May 2026 12:19:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexandru Ardelean <aardelean@deviqon.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, kernel@pengutronix.de, s.hauer@pengutronix.de,
	conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-frdm: add support for SD-card
Message-ID: <agyNp1f8wYDQ_Zmb@lizhi-Precision-Tower-5810>
References: <20260429135717.178982-1-aardelean@deviqon.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429135717.178982-1-aardelean@deviqon.com>
X-ClientProxiedBy: SA0PR11CA0207.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|DBBPR04MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ee6730-6cd7-4843-9091-08deb5c27840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|38350700014|13003099007|56012099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	ff5OnQ9MD+6K9P/jpibn1KmiGArmNHKHJ0VF1cKy06ovyKnE8XZfmBZA39cOyQjMCuF9e/G59FDo8rAL1vupcZBL+bc4XOtt3J18D6lc79dtLqsTBZsbbR7QF0YrJP26/WFVjeyb2a0/tDOQQQPZFMog2Zn07XYQF0q+kY1BfWB+Zti+aOBp1rbPXU2gYxQTLpcN9O8Ea7oWLsHfCWJw6pxcQER1knQ7cTLJEiuNllwXz96XEyRzVenhKe0zWiv+gmRPJM5kF0iEXw8dV/wupLUDEc7hXnu0P4PAE/Wuv0r5ln74uXKofljeHvzR64kYGlj/8nkz+JnVSmCqhRZJaRlJEnefPO5CWIxQ9JwaZULMCCXoEAqDg7T6YtG83mse0OUt0idWxbPl5NP8Np4ZZF88cfwl1gfkRCamm/hDR1k7FUvOWJCf0oO6dJgTpf2gFisypF3ZZFi2+2ThQvPTpkBPn9LzVcWwd6QEekdRqMCqcyU/zuP1jNA0q/s0Oe0YRaQuMDRHgWEiHm7KUI5NB/1B77rhiG9ckv9RakPiKQZbXfZs1kL+ZpBAh8wg8Yl+w0/bCGDtl9CAvdmdUkj12f37/qQsfDP364pgBLUvHCdABoeIkdd5ZVqeo0y2ev4EY3QdKc/on2eJ9ZE4SrwH+nbH+jMXsHNOes6GS+ix/jo4tr5VEM2+xUgqCbL8tQrz4D30FcOkAks91iK0/vnARvvc40nd8f0Kp9Tv4pOwYsMXnbgYukQjlibufqUVgLjf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(13003099007)(56012099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y7CUz3z43avdwX4itTtyU92AacRfk6MfdEd3tj0vnVtgLgAnYUTfeapyzdqa?=
 =?us-ascii?Q?tIACAOnCv7PnnPfDi5fBotCg6NVqo+8UeJvmc73Jh2ebIb4XXaQxHIK4sUFp?=
 =?us-ascii?Q?IPnMR+CdFM/Xz/BLMSY1bkQYzwjEXTJXLTR7W8/KUJjkoOD8uFcyZGdWx7yN?=
 =?us-ascii?Q?Zr0m/NyPMDhs8sLfyVpuiRQTp1KoE+eh+urd3IFu9DzBDjXI6gHdNLo+ZVPe?=
 =?us-ascii?Q?cZep95VzjfYyOTATm2X0pdWt5usPYn+K5odUk7Kyarbn+t94Vpzh2UARfV0A?=
 =?us-ascii?Q?fNjETYuTIbjQuhsWo6XYInA5l83akmruC3c7NhJ0iR6EO4yveSuhJOoc2hvm?=
 =?us-ascii?Q?9NYISUc+IgNuZzqJQhkvUJRVvZfHQvZ7O4LUxPs7tdNpimme0ArmEDTlgDZ9?=
 =?us-ascii?Q?57h+e8Wf5WjF8eAb/BdRCHdcJvEUQDIP4XwchbHMBzvarBquG4b97r1dYIB3?=
 =?us-ascii?Q?kKFrj6MB8eMd6+Yu4kU6gk7I9w1e2TsGBBHABzhuWeHx8UX3/iC/yHsDbJOW?=
 =?us-ascii?Q?qBxx+gtpkumSMo8NNuAREMU2TWce5aCqRSmqT3BLZ1yuLD1soQObHRWSXfYX?=
 =?us-ascii?Q?PsRwj3KWSnR1yQx6YWQJP70A0N3sikXRi1IQQTYojl72x4qdPUjupSWOfH0Z?=
 =?us-ascii?Q?XJ7votVGsbSM7CWQzSkTIe5wPwTbN5TyVzwaCD5zL1D8zt2tvNbeolRPYJzV?=
 =?us-ascii?Q?WDk6i/SF+C1NyX06xuPC9GF6IoThHFAdCOfRimYyaw5hxp9elV8XgGguOLZw?=
 =?us-ascii?Q?URkfFvBS4GWS/+x7Nw0hiUrNo3WnWuGgcAm7J/zPvUHFH1oO7JFFJZdnjQrQ?=
 =?us-ascii?Q?KcLgJvMelj/TlSdRPasam7vPnQCUAu5VTN17KMyrNOVAuCMkA1HHHD6VSxGj?=
 =?us-ascii?Q?QRLVRVL75LHy5DXFdpUUS3xsTK9mS8OJOj9WbzWXJdG3JmuRg7BkcWPlxVMt?=
 =?us-ascii?Q?GdGD8iQCq20+O8yRZBiv9MNSc4smNq1w5XlVOT06ebFYmXZSE7TGFM4S/Kqv?=
 =?us-ascii?Q?4Pg4iGIdD40mcOBgH9dg4es77M+6PpcZUyHp9EepG8kWtRSqr/KnICLqXv+0?=
 =?us-ascii?Q?QeSru5qGZhkhhtYELkDIJYlw4GIeoBlW1H/qheyrKrKXMJWPtaGhZZAq1ake?=
 =?us-ascii?Q?bszQV5qHwSYcWtfFRRoYmHfnMjqXmE2J8K0dMFbpw2ZJnhBPqt4uQzWzTKB5?=
 =?us-ascii?Q?pn2CRlhYdH0eLq9PKfRTUTvMVIfNF7FNQYiITXL7WqlC8yU8ghElZ95DnaEg?=
 =?us-ascii?Q?PVOda68Y1ncAKMKhIUxQzagcvc8T0UEZO9+xUyhiOLb81wehR92uzmGHGvmi?=
 =?us-ascii?Q?qVKTfmmYQAktTCxAmvXcfrdhndq9T5pCuNW99Q3DBEPjuFpKS8zFFIcii4OC?=
 =?us-ascii?Q?mfX4NqYS9i4gRwrkdURtAq1IU+ablBPMnQYiO7EBpkcW2zI8WmWx5c6Hpjne?=
 =?us-ascii?Q?zKC4poFcUisk7GlX5Wl7i0MY3fUfcaC02Hu4x/0G2xd1Xe/sRs2r9j374o6A?=
 =?us-ascii?Q?tc7eL9CXBsZl/bXG5sz6dU6aikCZiArpl3RJ6ppPsalltC2lffSdnk56CINk?=
 =?us-ascii?Q?KN1ISu5XrV3gWtZUBIBkUVSIxoexSHVNIgQ29sH/VC+/279UiDBYUex9YljB?=
 =?us-ascii?Q?3CDdSSQ8rc5owE5ewcMI8RaclkluTAD5diZVPsJE9e7TM6pV53G0u376wdNB?=
 =?us-ascii?Q?GsYPr3hv3iAQWf6Pj3uaYxza9V0yEY4l0JGlLC0Ptd0+V/hNdzqOITd9Ra9c?=
 =?us-ascii?Q?JH4HNPwdLw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ee6730-6cd7-4843-9091-08deb5c27840
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 16:19:58.4537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaQRw/lxlbNQqvS8nu7NG5o2cGDfm+9LDo+Ep+qedleGU990bUZNR5dr8IWNyuvXoNH6TPFcmC2ItP46o7dSfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7964

On Wed, Apr 29, 2026 at 04:57:17PM +0300, Alexandru Ardelean wrote:

Please Rebase to https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=imx/dt64

> The i.MX8MP FRDM board also has an SD-card slot, which is useful during.

Reduntant "."

> development.


> This change picks it up from NXP's BSP repo:

avoid "This config", just said

    Base on https://github.com/nxp-imx-support/meta-imx-frdm.

>   https://github.com/nxp-imx-support/meta-imx-frdm
>
> Adding Xiaofeng Wei's as he is the original author of the DT.

I think needn't mention, you keep signed-off-by tags.

Frank
>
> Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> index 55690f5e53d7e..84034b0ccb12d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> @@ -42,6 +42,17 @@ memory@40000000 {
>  		reg = <0x0 0x40000000 0 0xc0000000>,
>  		      <0x1 0x00000000 0 0x40000000>;
>  	};
> +
> +	reg_usdhc2_vmmc: regulator-usdhc2 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name = "VSD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
>  };
>
>  &A53_0 {
> @@ -237,6 +248,19 @@ &uart3 {
>  	status = "okay";
>  };
>
> +&usdhc2 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
> +	assigned-clock-rates = <400000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
>  &usdhc3 {
>  	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
>  	assigned-clock-rates = <400000000>;
> @@ -289,6 +313,12 @@ MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x146
>  		>;
>  	};
>
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
> +		>;
> +	};
> +
>  	pinctrl_uart2: uart2grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
> @@ -305,6 +335,48 @@ MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS	0x140
>  		>;
>  	};
>
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
> +		>;
> +	};
> +
>  	pinctrl_usdhc3: usdhc3grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
> --
> 2.43.0
>
