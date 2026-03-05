Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667C33BFE29
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772724940; cv=fail; b=L4wsqj44lKrgyII5ipkWlfwfLzsID9hxUpfIjUaXMKTekYEVTgIUpc9BAMyNPH9NZrhukK43CORVx0rm6GsRGau/0I+MC3ae2A2q632ZIjxPq53HxvmWp5lgFYsQE/Mp4jgKpMPh5Vvllory/mvrjUadNJEtRexXsvt2uRQ/U7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772724940; c=relaxed/simple;
	bh=uWffHBsrI/70RZAWSnv/xlcIoUEwht74wFnvPoxN5Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aBeq2fT2rgA0+C4HFRT/N76Sa1IxV3Mp5m/X4XaKnkoGrs66/40jirCXg/yZACaxS+PwqsZAyArRe86RKhCiQtdRH5PGTkPbCdMm/MQ7KabFvzG3z8Km6/5Zehi6znZfFZlhoc4OSrvm2IyUKpIHuMCkYHRMaRE1DRSitW2eDew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ID/UxK/y; arc=fail smtp.client-ip=40.107.159.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ID/UxK/y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDXFBB+bVskSeY5HkBZ+a8pK6N/a85d92K137UwiIACi90Bat3TYysRm9Gzx8gtkiZos9nbYz6SFf/axJvleQMUIg+N0v8Ytl1c/h6m5wz5qoeZevamUTS5Bx+iy6EMj2EtZVpSk322cnCrj4RPSaoDA/+sqlG1cLeNAL22MiY2hgvG4znFdISFAwxJW8UotcxYQTmx9K4ZIVK6rrcIdGhvo34iT9wfB82B3B9zR0GaVfOmu8J6o2+kJbXaNNjWX4f8x1f4P1sdb1KRFBXUafijLBzujvdoJgii0ww2F9U8jviUVtvsX4vMOJHa6ilqjfbS2rWsOWC/qa7c7FoLGyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qt/G/eEpL/ufjiEVKzN1+bZIyi1on+4F57I3KNT3kS0=;
 b=XjgeK41ecKV/S4pE6gvZ24d27CX+VHWUEA6og6AHVGdovtjfZk5Ye9fc4Thbma/6mWsobQAnTsmREUBqluwzj6x4T8DkOkql5SDwUPdfirhCV1OzgEE1mXDj3B3sTraLqHdqk1F86RB9LxsMq4PFBhtPeXbWcXHI7zDVbe5pZK0qK35VQNnlJarstX4ZE9FoNj9bOyu3zBr7dPmajyJp4Sn3TWCgA9A/8Ln51GQIRCXT3UQU6s8+EScbjru7PNbcAiIjOxN0Da1v7dJlMAwlgZRS489zwrwIhBdaZYyJDPN0lLTEsspaxfPp/9WWucX3vFMXHvrKUR/2syPpADHHTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qt/G/eEpL/ufjiEVKzN1+bZIyi1on+4F57I3KNT3kS0=;
 b=ID/UxK/y9dTDSZp16H1m5ZZjlyBXg82lAuRRF+tQ+t89oEzvLvf9tsudFpfjFdaOS6SXvYfuGYuz2M50otaME7MvDyDGoQriChVjo8wv6ErH8gWOT0artU4ifLZvJ2eVupqEQLgPAYA7dL4G+Rltp2xatjcJX5iplokdRyQs0srDcY5u1ptcjS2uj5w0bdT3CwDnKw3STstcx2UHVLKx1gvirhBbo+pu/cE1E9uMudRerMaXfq0+qnXhqR8Wkx2PLjbFqMS0gvLJ6pdWGSX6BTcbWzkbK+XBvtdTxIMqwqcUMs1FIpkh/zshCZbKaTEyvEtZCfXAXoDcNZDHcUTz5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB12161.eurprd04.prod.outlook.com (2603:10a6:150:302::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 15:35:34 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Thu, 5 Mar 2026
 15:35:34 +0000
Date: Thu, 5 Mar 2026 10:35:25 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH 1/2] arm64: dts: imx94: add USB nodes
Message-ID: <aamivVBK7Aygh_cJ@lizhi-Precision-Tower-5810>
References: <20260305075527.1116943-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305075527.1116943-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: PH8PR20CA0010.namprd20.prod.outlook.com
 (2603:10b6:510:23c::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB12161:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f3cbc2-6f89-4b12-65c7-08de7accd71e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	WVqq3VDwfSUPW3iNhcg1/oa0wmsizjJov6Onsq4ARibK8gSYinqtSZULjYOPkp7wTsPyTlLPPgI7Js+9zFSFtPEr10sHS+iUA05PUsWW86lbqrtbuWCQ464A6MFm8bvrHof13V2p4pzGpHY0rQZq5V6w8LejyrM68nsJNoHp79TpDEa6MFRTKSvwQ10dPapBO0xpsrONjNa0zCPJBoYJ/YFZBmqEBC3C07Q4Z3AQmD29nYTm191IuGsgQWTVgZo0b2RaEwbrtCko3esw0PyXRvdcLY5pY+F1DJU5ytoFoamLk/3iUWaoqKgLpAS/OMaX1/j8famfoClienylLHmvQNdoUbq2cQjFIAwOTraGJ91KTZYsBS/nULBxdYE4ZTO1EuTbHbKJWeQMP4bVctGWPdBnwfMxblyAhUHpsVkg4fLVIK4QWS9mfk0k3PR1VJzjOT/ibXaFXPvteHIV4gK/R+eLtANDr9/JJeQmlN9TWJJW7cEAN7UP6EI+0vI+tOjMPGGpt+s73bH4/WouiyPoT/Lauwsb9HdZgY3Zul8iMkqXct9au/9ofYal2eh/FHcHfVbeQvnOS/aWzBa8pH0OTPZH5wHcDmZjO8DKek6/TfR86pJPgc2/lrW+gFLAW6NCb5eaBbyKUDGMMtSxor478gtXXnjDbiqIDQa6CMEz/T76lJqoVtnzuE8TyDh1qbo23vM4BtmVEhjOxEeBPTPmU1H+qfgjqYlEUNLMT/wyGRmTMZKkWTMUBKiEuoyFthcka4ao9HOpaBlEyYs01GljUokgBqVSaMKPT7XowHFT5R8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BmI6cTXKWl+MGxN39cLb3Dpvk0SabiPFlsqJpxrRG7H2dCtPyp+aPIspRNjK?=
 =?us-ascii?Q?eN0PpNUuVW5pb1t3/27DjT3wp1iIf9udN2qq9rUfshTMw1b2rotKIlr1lMSA?=
 =?us-ascii?Q?Yzb8HCkxR4i+2bgf733OL+at8RzroUEPcVoenHnGDqOADJxSYtn9jqO+f9aL?=
 =?us-ascii?Q?77/9DXl2R2dJyWFSw7J07RMxVSSKKvlf7HaRKV4g4i3hLl+d4roCnk3wbCkv?=
 =?us-ascii?Q?4No6+vJn/vY/ceXRlyAb+OvLjsNdHg/jGmeNRO8NaG6m5ugmGxZWKDgfaUfB?=
 =?us-ascii?Q?OigqNx4mIQzlHi4/Yp+PzqYG700IjM9uV7zRtDdLQhAXkVgH2ztDbGIRhkcQ?=
 =?us-ascii?Q?Nx3SWEqIbL7065/l4PDOkfuNhh4rIfV9G5TAXUQRwO10GKzuZQIftC8+Tw1r?=
 =?us-ascii?Q?JnBhq/Ycdn13S/qh6pBHzj98KjJB0nMhZyLXmoI8imkT03UwA3MuAx4KvAS9?=
 =?us-ascii?Q?5FRTIEoyFwZxSBQCUySwuTAJjHA6Jd7urcmYvZJzrjYD95zuZ28hmOTaDMM7?=
 =?us-ascii?Q?LcyxkZRRd4l0VRoapk0BCtChJ/3L1eOoPwqDFNMgAzZ1kgh0U1haLi031Icd?=
 =?us-ascii?Q?kVXoNjmGP8x6zf4vGAMbycuHhByyHb7f85Vqhun0Zecw2vTIpUd0d0kL1u/j?=
 =?us-ascii?Q?nd0vz0Oixb/D7VAlW8Z9kpofMfsPfjEB4gUiRFlIt7pN03W/VKsm8tVsXSr0?=
 =?us-ascii?Q?VJcP5huJhI++7748haQWaywZtpGSrG6wDjDeyyRIy/a3O3NfebUPABVKvKvo?=
 =?us-ascii?Q?ar86dBzthtOJCKXRR6TqfwS61TQ8gzJPXGbtL/pJMH1qm8QbtjRinV1vFa4i?=
 =?us-ascii?Q?M8VI9YjsD+WFhMkYxaj650wvzceqi6wSVSsJSCyELdTnYZbmIyPT+a6YvMXN?=
 =?us-ascii?Q?libCMLiGQJVVS2xqXn/dhNqdXUQ/bV9iMxCCi2QEhEnHDjcfaPRaNNMDFzjq?=
 =?us-ascii?Q?TlmRRxU3Tl5vpdJUjxYPJD7bXFMdhY7s3niZa/qHskVZLxLlyBgnHR1GkkIu?=
 =?us-ascii?Q?7AC2uJfghZTGUHQpnV2XmzXT6E0TKKWAQx77cK55BpAZ6L+mo6glaP8VFP4g?=
 =?us-ascii?Q?32vnRgDMcs3nCOIBj4xlpj7I/mzTVL7LcG6TwmR7JeMH7+HS3Peh4unKwWTD?=
 =?us-ascii?Q?h/AYLj9VILRcxTyyqJPySD1oAYGxzRbY9OHwaMrB/z0ShQoZYIszloS7lsek?=
 =?us-ascii?Q?R4Q5kjsUw5NvK3AIgVhbxklO2xIM+0kcpH0Y4PC7HYPtFTFNLMgLi9V9nXNp?=
 =?us-ascii?Q?lobHMNIhul53HpYdrWM799gLlLUWzaluQCWGoDWJzMAyc5aj5DLvT5abzQZC?=
 =?us-ascii?Q?ij0pHo95ugqjlhvvThiVPnThZ6AHWnOqP7fLskemdMD734dzHfFvkIbYH98N?=
 =?us-ascii?Q?OskTrmw/FUjFNWFQS5WVlOj3xNL6SyTbfa4utrAv59hXmgvdI48/16NG55Us?=
 =?us-ascii?Q?a4ShWGZdYk5ihYZMwP0URD93XavA4WDDUGPzFB7H3hx45M8jVRcBqMYjiaCD?=
 =?us-ascii?Q?gCkJX93iGnOb3LwMLDhEksabhy7IoTNOA/DSsvVAiQ11NetAGBA6baFNcpkW?=
 =?us-ascii?Q?MPi0qCVLc8EsKgs9lBcQRxel2nJbNxRm5+HpNe70Vjjl7wHG7ZJ0xrJnbN9j?=
 =?us-ascii?Q?QxNz8YSzxzPk20KLMhfiXMYKKNp8Qg/V2hFx3h7WLJVxjVd6HmlbFJbgG8Ux?=
 =?us-ascii?Q?UWoo3lhl9Cokzsf9RXkFxu7Doq0XoNVcyiyEV9SL37g8tnox?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f3cbc2-6f89-4b12-65c7-08de7accd71e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:35:33.9216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfnKH0Q9vrfRyAkpU8Vykb8diLU1JI6SoE1RUASX0r+UzzeIJ0Wksk+v4iwRcN2j4wXBxsDYxSTHoVMzzpQbgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12161

On Thu, Mar 05, 2026 at 03:55:26PM +0800, Xu Yang wrote:
> add USB2.0, USB3.0 controller and USB phy nodes.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi | 61 ++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
> index d2f31c8caf6e..8384166400e9 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -161,6 +161,13 @@ its: msi-controller@48040000 {
>  		};
>  	};
>
> +	usbphynop: usbphynop {
> +		compatible = "usb-nop-xceiv";
> +		clocks = <&scmi_clk IMX94_CLK_HSIO>;
> +		clock-names = "main_clk";
> +		#phy-cells = <0>;
> +	};
> +

move these to after clock-sai4-mclk1, no address block is before @hex node.

Frank
>  	soc {
>  		compatible = "simple-bus";
>  		ranges;
> @@ -1223,6 +1230,60 @@ wdog3: watchdog@49220000 {
>  			};
>  		};
>
> +		usb3: usb@4c100000 {
> +			compatible = "nxp,imx94-dwc3", "nxp,imx8mp-dwc3";
> +			reg = <0x0 0x4c100000 0x0 0x10000>,
> +			      <0x0 0x4c010010 0x0 0x04>,
> +			      <0x0 0x4c1f0000 0x0 0x20>;
> +			reg-names = "core", "blkctl", "glue";
> +			clocks = <&scmi_clk IMX94_CLK_HSIO>,
> +				 <&scmi_clk IMX94_CLK_HSIO>,
> +				 <&scmi_clk IMX94_CLK_24M>,
> +				 <&scmi_clk IMX94_CLK_32K>;
> +			clock-names = "hsio", "bus_early", "ref", "suspend";
> +			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3", "wakeup";
> +			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
> +			phys = <&usb3_phy>, <&usb3_phy>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +			snps,gfladj-refclk-lpm-sel-quirk;
> +			snps,parkmode-disable-ss-quirk;
> +			status = "disabled";
> +		};
> +
> +		usb3_phy: phy@4c1f0040 {
> +			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
> +			reg = <0x0 0x4c1f0040 0x0 0x40>,
> +			      <0x0 0x4c1fc000 0x0 0x100>;
> +			clocks = <&scmi_clk IMX94_CLK_HSIO>;
> +			clock-names = "phy";
> +			#phy-cells = <0>;
> +			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
> +			status = "disabled";
> +		};
> +
> +		usb2: usb@4c200000 {
> +			compatible = "fsl,imx95-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
> +			reg = <0x0 0x4c200000 0x0 0x200>;
> +			interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&scmi_clk IMX94_CLK_HSIO>,
> +				 <&scmi_clk IMX94_CLK_32K>;
> +			clock-names = "usb_ctrl_root", "usb_wakeup";
> +			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
> +			phys = <&usbphynop>;
> +			fsl,usbmisc = <&usbmisc 0>;
> +			status = "disabled";
> +		};
> +
> +		usbmisc: usbmisc@4c200200 {
> +			compatible = "fsl,imx95-usbmisc", "fsl,imx7d-usbmisc", "fsl,imx6q-usbmisc";
> +			reg = <0x0 0x4c200200 0x0 0x200>,
> +			      <0x0 0x4c010014 0x0 0x04>;
> +			#index-cells = <1>;
> +		};
> +
>  		netc_blk_ctrl: system-controller@4ceb0000 {
>  			compatible = "nxp,imx94-netc-blk-ctrl";
>  			reg = <0x0 0x4ceb0000 0x0 0x10000>,
> --
> 2.34.1
>
