Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013023.outbound.protection.outlook.com [40.107.162.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380F81DF24F
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 14:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755787874; cv=fail; b=esPpzxD9nt3Vbjb4qVUmXGRLYLyRhBvfwEzw67YcpJQGwiaReE55LGCik4tFtUbDQL3P0QsjpuwCDf89e+VEp9RAZynLLBMrcWIo6UU0GpexadkwwmSWBqnOX92Ab5Jezp7//LJLgDA+KoTxHI24EYYsqc7MSmAL2ujl262Qq/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755787874; c=relaxed/simple;
	bh=CaYa/yNTa7xZwFIfuM4MSTxJT+1KCGnxS+7ytWDIl2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IGgG7FkIpn4Rat8WJQw7so9cVwIWRnaq2pP5Wcwa0BGx4/8/hre1SvK8c33SKQKeMO4UwcU60gQCh5l58UZ8rjuZ/hOdc4glPcAMa8Jp6G77DOcRxNytz3cFOrpWUKNr7f0CLjHgGTNLLyYbT4JB+6EkXr2DSHiJ1tCTciz00uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dk1GWexu; arc=fail smtp.client-ip=40.107.162.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dk1GWexu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzT64FqoiB3o8czSTj1RiI1TwIrhoscYryLNPva9Wqudsg/1WP5ei42f+qVTKiMEQ4bWdBSDJ8Q50iEObr1VRSdeXJBUTPGBzByb6Q741zk9jJXBZC7tlzKqxVLZkn69mS69rL8Avw8B64e+A/9gn8uRG6Q9IQiqiLrWUqXpjdpuOTERffOqiZHM3iRkSBEBnXdUyod3SoFq7Yg0Scw0UnIALWzDr+KGrPoYIMgfOCval6eb5KEk4gfK2xZY+q2YgWEPIJyT5/0BpDKcBhdgirWFBwA8WkREDGPzDKzeQiTW0BtQETXM9cIUSakvJYi4U2XE9THRS4mOtzY/OP8FkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Xg7b9NbM3H79rxbucqyA+/BNl6DthOyRSev1lT1jGU=;
 b=GAWsRTwDHiGwWy7Q1M3MACTsunRhoPkzSJWCh/y9CCqKd95/QmUPGtVhUw/YzaMALSD3WO1ObgbpbvKQKOayS1eYf72c0IuLlDPTvSMQ48wZGEMRPMq9gA0RcdFm2HSeV73MvlWgCj8iksgxUYzj/H7O04aG1W0Jyu6EURlWQAMUi5Q8cfbG73VhqJrPMpGtpMRqPC453btn+RXfVQHac/g0pHhcjVZRo5FQ+tlC71yz8bnJeb9yFe6gv+G1CMv+k7LaLzi/55FMhD9xa1KA26rdg5qMHfQJu6bBQexm2v0cUjfDVYs3ITX6J9O0HdGzxfIsK9cvkIONQR75pZj7kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Xg7b9NbM3H79rxbucqyA+/BNl6DthOyRSev1lT1jGU=;
 b=dk1GWexuX/7xQBHNNtg/7oyVrztEm/TQdtGFkaN5o4ykyVOf5rLhOWZfeiweZZJw5CseDIXr2YVVpozU2OQtKhdL+E01d3OZrkNplDOHKaciohU9YlaausrB27+uWDI5JD46aPqdT846rU2cXpvIkbRuTXUrM11zb/EUZLKuKFE3zoyX86rMH9datn5ph3XTZcaf7qRbGWJcoCK5+u/VUUy+xUHHQNyFWEwjuiNk4BORUJtn2XaGUKLZR2uhEdQ+azAdwO20xbD1SA9B9qC6ngA5m/WgfkyZ65HmiuWm9Ss9SLurHrn9YhWrtEeMyndm3CD/7kOESeniH32VzDTy3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 14:51:09 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 14:51:09 +0000
Date: Thu, 21 Aug 2025 10:51:01 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: imx95: add fsl,phy-tx-vref-tune-percent
 tuning properties for USB3 PHY
Message-ID: <aKcyVbEhHOE3O2cT@lizhi-Precision-Tower-5810>
References: <20250821110828.20980-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821110828.20980-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: BY5PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::20) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae2f838-5bb1-487c-829d-08dde0c22a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JQXyVBhrmo3pgpP7y5adWWOyoAPNzcP7x7oTAKXJPb2m7Rq+icdI0PpLllzv?=
 =?us-ascii?Q?pTgOZX+ob5aBunu6p2x6IZfGNPAqz8B9DBxYHm+ohhx+mIx+DSPakoLBrZwv?=
 =?us-ascii?Q?sONQdgfQCIVnl5Ej0vEXTDxGkHDELTWRMz7+GdRfHbRAl95ePxf7y+EXVNI2?=
 =?us-ascii?Q?oWQyQjGU9vrRKA6pvrqCsqUEB1T1141y1E5Kl9YDG5uacEqarY7fE79z3/IZ?=
 =?us-ascii?Q?+o7DbupRHUGctcLsC/uxE+XopObsm2dJ8Z1Xs34l5NujD+bFvQ366PHFdEv6?=
 =?us-ascii?Q?NoZumGih2/5XqY3ZTnInXqf6paH/ATnK8yd4mT62tAl9tSSW0aV/fqfx80Om?=
 =?us-ascii?Q?GS+nKe/t4LSteJY4pVBfS3PSeiniZDuM9bmucFjTQFmh/uoJ15GJZpbc4FZ0?=
 =?us-ascii?Q?GGu2eih9CzsPLjJk7apVqF6tZdsxwEwibRqOXAHxbAG3Ni0HlH5aKaCiifv/?=
 =?us-ascii?Q?eL5qK+JC9GUMm+Q/Zxo7HJNt2OOmFPGkPSXYsD0iMWT5wZa1ncsUksMbGABS?=
 =?us-ascii?Q?1Fx+AvdSlA68q3jhQ+Eekq2Bx/Vl554k3HiiloEg3yO05Cg+HqS3ZK6l0i0k?=
 =?us-ascii?Q?ASeRww8ee/EPYpl9dwgJqs6aWegm7rAsb17jVRr0GKnvj6xkG6Qyu/oY5c+/?=
 =?us-ascii?Q?yXgIPYD6AW1gMcl1sBc9ZuIRzOejwVtpFwSwj+fwpfbN9t/+iXzvKYdBRIv1?=
 =?us-ascii?Q?vrq+BeO1lWd4bOEqKIfXsx68/5Qd5+IACBsuxzzYizFCGMOz4JbMNI0VZrXw?=
 =?us-ascii?Q?crwutx54w7ko0OoES6tPeI45tnK0+8z7/CHPlol1K4EkBaC6g7GH3ewIdf4S?=
 =?us-ascii?Q?fM3wY2o7lPHWCpjzciLtZ1bqjg2fiT0Bq9LxPTtAUUpv2HvUjwKCLH32LOts?=
 =?us-ascii?Q?yfM5652EV70HrakTpxVXJYKMEKQC7x35Z+aUPHX07v7OGZk/SgGjEmgGnGpp?=
 =?us-ascii?Q?P3FABu+Kgd3hxd3i/BJEOQSpO4kvBt+VewpX+04e8fG9ECf7vJG038v+axlP?=
 =?us-ascii?Q?4cdhOn5kJz8G5sQa+uhOpqLZAHNXJDfQCP5VKKCFEA0nnseD9W/Yk0yDAeU2?=
 =?us-ascii?Q?R2WYuK2gAdtBVrsV5kFyDMxlRhu+MY5LCN3w1WReiDPVX1oAbsRUVQTE0sIO?=
 =?us-ascii?Q?LCP/B+4dXSg/l5ixT5BkiSXEUwvpFMohgOvzspl/uKfGeGLUq2r9xIx5mEEP?=
 =?us-ascii?Q?H5yYRV0r2eUhWYkaSs4w1JXkkeORcEq0H8wc7EYdmWh0g/Ov45iBVxHtLu5Z?=
 =?us-ascii?Q?ia4YMQqDIwYClRLGQQ2v6+YpLpiYXLRW4OfRG/wyIMt1+htGcRslBHOZFGod?=
 =?us-ascii?Q?ne+U2Xar4rdQlvq3usF8L64MePq8/VIPerAObd2oejzfVsgV960DDCNYEey8?=
 =?us-ascii?Q?Gz0DbITBBlU+hm1wit9SIR6dMHIZtHxdVSiz0Yy/Qsaoysk4HKW7sdSE/HXz?=
 =?us-ascii?Q?RgbmUO/N2c1H9Tj3jXYDNWI3IGHh8fw6+nKTA/dkTgPsygtO3vCw2A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+vUcLM3idiTIF4PYqCQVNSB81BDmRvrd503on2EWYo5XyOxKiLdJ/NiPi0j6?=
 =?us-ascii?Q?kFbJLFPHrwE/K+orTOlCUirQjA3jn6ynSlm8hlwZbRLfZBYKSwnkRqeCV+1J?=
 =?us-ascii?Q?AeND36BOwjTWjgCdOQRlyth0s5wB6PoIbXt65zDBmSn99fbn7dvIR8Fh/0++?=
 =?us-ascii?Q?wNdRY602/VGRnNTGYloZa1Va8TcfydTx9pf5cZOALsBIAnYILs8PclpGPiZz?=
 =?us-ascii?Q?ALrANXTxLNftqYSyDDeLF2vJywzMHalkpMRtk8PL4v2hzmIWzly0I3/ZUXrn?=
 =?us-ascii?Q?27y6CtIQq5jFI7RheNAV8HYKXG+ov1oOP3FCnboPVeVa/z+ryQLwYqpKEH+K?=
 =?us-ascii?Q?52J+BgFdEmw5HTr3bpnLQznUHe/6dOoBPedjjW5K/jpfe3BL6Qc3u/5eebhR?=
 =?us-ascii?Q?iXCmhkog0HAVfH2jDgbFD51Qs2pPD54fmJpLjC3v009Yz7tmv9Q7BUmsU5/P?=
 =?us-ascii?Q?cdVJta2Jh3IUBxJGy8ttyR+moB/4SsQUZP5p7aLjcEiveq6prubQf2rzPFkV?=
 =?us-ascii?Q?yu1eJsjq1BsWsWSCDy+Ke6Jd6t22V99fhklwJrntHm7/J+6dkgq8JHLpYU19?=
 =?us-ascii?Q?GqGQITDE1tkSLkUeUt8RND3H5xl6bvgSUzjqhKfxMkhRTPI0pxXn3xQ6XPdP?=
 =?us-ascii?Q?lUl/hd7pmWrIrHGPmAo/YzEepqw8gRgrt9GXslTOYnOxK2YxFs0LNsZtMwyT?=
 =?us-ascii?Q?tPFL4NjTUO5oRx3entqmBFwCfsbnTMmgSwimHTFm35Xidh/vjCNhxAtUBW15?=
 =?us-ascii?Q?jSVq0AxpUcc7FGS92g7dsKqLMHnCCewr4/lAWIZ0crJiNb9rg7vTm1Fk2yOF?=
 =?us-ascii?Q?R6MyjqZu0Q95wLBi2JYMqxXPlvXliWKHwScAuP38Mp/WyLWBv5GuTBa1FISR?=
 =?us-ascii?Q?RYc24yTmPW/WQtR31q52/k2NDHyX/DIsOjgrsm4/GvNR8o88OXMtYegvRj63?=
 =?us-ascii?Q?2mMZz9neuxJTP3Y+PrMpNYD4SH7pQeAKvV1HTcDgk/I4Fw7K0jINwDd+1htp?=
 =?us-ascii?Q?BF0laN1XZEahWUTnOvxqoZ+QQQAJMJIb2KU22n7LYPbaCMHxIhd8WpRsbjsG?=
 =?us-ascii?Q?zowIUeuNfamNaiXcZF9oCQT4vLSZAsYtaKcXAbK2WfEoTpTP88ZcWI8f4F4S?=
 =?us-ascii?Q?DQzaEiNjs00zn7/v0phbeNK7M02pk6KbHBYkHEDdd2hmAtSAq7k+5C6pMiQy?=
 =?us-ascii?Q?IuZoKAORz5PM4HqUmPtgnDj0MXQtOzJ6rNmoRcfDg0c73ESZECNks9Th4kub?=
 =?us-ascii?Q?qrfZSeSD8JiDFWiqi6Z4whhb//BaZVPYAiXbt9LK+/h9ZGbhalZuy//x/c49?=
 =?us-ascii?Q?72fS1dbeYcENB5SeGy3ALc9Om22pU5kIaVLRULzRxIqE1b2UVfJdZEJKr1Ul?=
 =?us-ascii?Q?TBIxh5OfuaBCgw0X8vQLf7qL85Sk0QN6RxGSBxW5eD8D2eJnj4n4mEylpgjs?=
 =?us-ascii?Q?RwUiWBQVhLIg5Ghr4Mok6GdmidOWJ7fl+lhlJwCuCXgUzlIDccKpYFd8Re3o?=
 =?us-ascii?Q?oEMPetY3H+yTltCemb/0fXb58Wj4QC6UoGRzO3jJmXqx94zFXGWXUwIpMUTa?=
 =?us-ascii?Q?auMzCfqaBrJ5wXtdSxUED3F8tMAkgc+3OohJz+4Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae2f838-5bb1-487c-829d-08dde0c22a51
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 14:51:09.6367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEH60FArjy7vlwLOw/8IAi/db86lrauoy2PMyz88fFz1L/NvLFt2XgHedLSULHW2jRsBNcZX3xyL6XITxkJAtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272

On Thu, Aug 21, 2025 at 07:08:28PM +0800, Xu Yang wrote:
> Add it to improve USB signal quality.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 1 +
>  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> index 46f6e0fbf2b0..f0aff01cefbf 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> @@ -1082,6 +1082,7 @@ &usb3_phy {
>  	fsl,phy-pcs-tx-swing-full-percent = <100>;
>  	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
>  	fsl,phy-tx-vboost-level-microvolt = <1156>;
> +	fsl,phy-tx-vref-tune-percent = <100>;
>  	status = "okay";
>
>  	port {
> diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> index 2f949a0d48d2..064bc508eb1b 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> @@ -622,6 +622,7 @@ &usb3_phy {
>  	fsl,phy-pcs-tx-swing-full-percent = <100>;
>  	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
>  	fsl,phy-tx-vboost-level-microvolt = <1156>;
> +	fsl,phy-tx-vref-tune-percent = <100>;
>  	orientation-switch;
>  	status = "okay";
>
> --
> 2.34.1
>
