Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621D24219FF
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770304400; cv=fail; b=HCyIsRPF+tuZhszAfpa42RsdBmzO2GnmidSLBAdsHcsE8X6Q0yTS9u2ogODqyH9SWPNJmq5gafwv4h5A9Nu/8B7o2/TVP/eXuQfuIMEreS74rZV3wq6mLpEwGW217s5XdtKWKrUU3QU1jneGNcoIyZ6Yi22OAmVbNG63bKQI6p0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770304400; c=relaxed/simple;
	bh=G0YshrYktUvmFGHXKpb4ylWVoSiibXKqSazaIcUF77g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lAeDLqttdj9DI3wQ7Tne+M7N2cowanNOX4b45OFdsoqWc5cTXF7oZlWfVxg82uU4rbIBPgMMJtZ24trIudKMIAY6aOb1gEzD4MiJnxqCTvE1L3yMnre+Tr0Dx2d5/+fE1i8jA6nL01nfdhxRNlZ1siT/L3rwkBjJlJbA5p6jCi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mJgQsOXj; arc=fail smtp.client-ip=40.107.130.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mJgQsOXj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bcqzuo2qQjU+sTcIbpDPksQqEq4QkdNEK3EgRK+V/wyanLBiGR2e8QCcJ/QtymXwp4dUQWCcIkOyVliOuYRNuOrcaT/WSvbKESE8pZIVuXp55GsEQ1RTDQnzwdQXmKLQ7X1g/n5mPERsXH3gAWg+fkftELLQ6PwitniIhD1Fq0yMHL/vDoJGFisi9XGSGkcQY5eFv4YBvMJeqWIcq6Ri1Mk9LFeENK6MgxQ9L6it9zPWDDaogVwx1uYsKIkh34OXsLiMwWUEXVYO0rC+QtzCZyMmt1DJq3xhmpHKE+TH98qYuvP6lM4oKq77emelpcrxLYWKLPMaw8nUdxPzN4PFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3Bhx1f4wvYFzXMfhNL4hAsrqpJvnR+MyJCUl9JNAMc=;
 b=uMaY1W5ycvl72rtZDCWC3NBwwoKUztBy0qcAIJxIQO6ZfHffshXmsVT0imCK1vhY7cNQLflQgvplpDtSlBiEO8pxa3ZlmwLH+ck4oL9y33CZY1WQzeVqTQUy3BaF/pi2b4rutj5j+njPtcL6rN2XG5sWzA2wamz7zWaLFMTGtEmKGE5h7XalZsG9x7+zZj+FHAMaAv+bNpHnSLPF8lFVFyCi1GX6n+DSrdAQ3/BBJZlmDRSNTUIN25urhP+0kf1JMDsB/cyVUK3s7+2+xGdiS6qG4Kr8U/hL+3ZylUF6vyuxp2exd2bOHhm20ZmYuS6/sIORlK8v9rXHLpzyn2pvAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3Bhx1f4wvYFzXMfhNL4hAsrqpJvnR+MyJCUl9JNAMc=;
 b=mJgQsOXj9Y5ashwe+AtDTvEbAPKhyvJocBbHWLPjgklZZAr0+Ncz8TtVHiS28VR/8q+qJXooBHOTZAQFUaGyRP8WIBxQfrRTuOELChaAt0ac7ovLNsWkgBB7/Blvjc6FxcY4x2zMHAD+Gs+zshXSFF/N5oySmhiQVAd7XHGooAB4CXbFOhn+2Zss3uNAISM4S33aovFRsl5kosgQTCJMrxwInx+vVy4RckbPLTiQCpaRwv/oWca5qJaUBc+Hgn/JI9NVn3ZWPEa8BtGA322dRaC/USW7kruMwF9/CNr2VJMzvt/Gbn0Vwm0un7dAzsfn+fDXnn25A6vNbA5aDrcDgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10369.eurprd04.prod.outlook.com (2603:10a6:800:235::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 15:13:15 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 15:13:15 +0000
Date: Thu, 5 Feb 2026 10:13:05 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com,
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX91
Message-ID: <aYSzgRRGewX6uSlc@lizhi-Precision-Tower-5810>
References: <20260205100125.9095-1-stefano.r@variscite.com>
 <20260205100125.9095-3-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205100125.9095-3-stefano.r@variscite.com>
X-ClientProxiedBy: PH5P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10369:EE_
X-MS-Office365-Filtering-Correlation-Id: f2627799-bef4-40a1-5893-08de64c9157c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?vW7EaeVkMB+THsLnW5S14Vo9nMgRfB9vSp33hQVHJ6V+W+qln4eqdS0Z5AaP?=
 =?us-ascii?Q?muV3dJ6W/BNiuMlY4t9106pho08331ShIu3NXHEKQ1EtdPKJYJpJUhXaBRzd?=
 =?us-ascii?Q?iU1P34W39iC24H/V54FAhgoOAmpyk+au2gxJhLNbkQVie6WxglDa2UwiHSVG?=
 =?us-ascii?Q?+in14BvLhGB7RCG7CAMcUjrxlAbTtwESW3Y2OQjLm04FR7GxHj5IsSzM2O66?=
 =?us-ascii?Q?acMca6eLGT+Kjlfzn5OcXJDVwiJ8OwYnvAD1uW6bOCCnyofgsmrCLWIQFP4M?=
 =?us-ascii?Q?Y2XQHH4mIibepQQoV0p2QmiJ/vC24F4sXlVnKJEo5g7qqO+kfGVWuNFF3oU5?=
 =?us-ascii?Q?aaGQAi8rDiQI0xGufODfES0EaMP8/gcqYzIHL1Ix1ud+PyVGcKEdElkRmUyM?=
 =?us-ascii?Q?0V4Ss+P8tfui3fVazMHV1dOO9RJx2HwCDV2xrSBpxiplIlkb0jaWr05uhdrO?=
 =?us-ascii?Q?S/GfB7kaFqVba+YGcvWEgyq/ywEKZQV7bxBzzLivJsLWntd2UlrJSw2jKaEp?=
 =?us-ascii?Q?yyciM+dx0g7PxPAc2S1Mlj+9iL7TJ7zqlYNB0sUSrFINioO1a7NxGheoqOQS?=
 =?us-ascii?Q?qUAfoUnaoFeInYtrWs4UE4QL5RV+4zoSpiMpMy9eqO2xowVB72G4VNT5xLGi?=
 =?us-ascii?Q?4GtKNkvO/IIyP9S6mkEqoGRCScsDTAUCVxNWhlvbPA/8uGFy/lAJn+CkGJJN?=
 =?us-ascii?Q?UAsJMOs1H4WXhFD4mfHVeRk7PNo/P8CcWCy57GQod8dqY5XXr8OiSqWWWMss?=
 =?us-ascii?Q?7t3PmGjs5KyOJpsSJQBUOIvQDiM3cEMKRwsf7jDLup01pT7dGigrcWUKDO0l?=
 =?us-ascii?Q?rna4pnktdXSWZFLz8y9te5y3AcY9GixmKzkaMHmvYYbuYS8b0kpppAMdnnVT?=
 =?us-ascii?Q?dbzWbGalYxLyQ9b2qzBzMKtU794JLwHSRu2rt6e986yGBvRvODhvLvFVZV3l?=
 =?us-ascii?Q?sknc7HAAuRj+zNs2bFDRGHd29pkpVkojLxO5UZZz5uKf0MKZCv5XC8MTm0hC?=
 =?us-ascii?Q?/5tAnA9UQUx7+HMoP60oCbNdDuEoKnPDL1E0GP8CJoltRaCDqRhvw+km50tJ?=
 =?us-ascii?Q?wrFl2VcXbKby0Aa8lu9RUlhErx3crqPM1POCRHEDM3KHB9DoD1ZslKM38nVM?=
 =?us-ascii?Q?T2lfUuj5aFNayM/2ketMPi42ya60JTmRoqj50/vyRd26oFtSxcqJBHaUIeGj?=
 =?us-ascii?Q?41EIjgfT4rE3eDjpXXPPBkXWL75MbarboVTogORTREZBIfmfh6Dw8CM1Ds0g?=
 =?us-ascii?Q?Si4XCvsvf04G54NDaoTCwq/zBa3W/L1Y45fmBGu3PdVamp+CybQyJjq5Ggq1?=
 =?us-ascii?Q?FFlgQ4j/FyXIECcqX92IxVGZ2pMXRq4L8a0ZVgRUB9nHFyeFBWiUpF6fm038?=
 =?us-ascii?Q?DwxV79HmpP4BfrA3ioRG/67mVTl6EapyqUTdqVE17XaOuh8ZLPu34SPIOabl?=
 =?us-ascii?Q?jOyYeTuRKVtArAoxgFH+0lPf1WxO7TPJKlnZmW0nXB5CYCPsNSLXq2s+Ilsp?=
 =?us-ascii?Q?0HsW84F7QFTLtzzmJVR59v1K2zJmM6eeldNpk8rBUff1BiKnc5Hn2C751H4B?=
 =?us-ascii?Q?na5gUQFROACW8KBkSE8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?2QAP5S3pfbWE8jUFnrUssNLQfdO87b6rUoQAGf+7xXw1lItsmYtWLOyVirwJ?=
 =?us-ascii?Q?ECGPrQeyY+XSI4XiWasq37ZnLsSl9ztNyvPYFlrcHtY0l/n+tfU//ojHWF8R?=
 =?us-ascii?Q?gQlrPi0jSqjTNyYCtuMUS3tGMvwq9e6r3ruvbS+Se4GgkErriLsdcKFg6w3J?=
 =?us-ascii?Q?DLqqXhXJ7V2ioEcgYJ5qsHhlnmSKnu0wyStNEroQAgPjW3t9mYSYJ8kenzaX?=
 =?us-ascii?Q?Z+6JYZuZoZh9Fu8n3LpfeHeMEwO5daqb0imy0NuFIL2Pu7uV+4bS5+jNuI41?=
 =?us-ascii?Q?i/uB89z+Q4WtVm9oO9aIWB0Rk6XoT03nGL76nSFIvab5gK8sSUbUDsMsqRmN?=
 =?us-ascii?Q?MqDrYEIMiAIV7bd8Qc+efltbbmmP1yz69RJTlQWinEBHzX6hQgVLAYnoF5c6?=
 =?us-ascii?Q?OqTx5yZSqnjoTWyM02rXDFDRbqSHtIiDrGXZkpVY4O/mhMig60dDKh+FjQi8?=
 =?us-ascii?Q?n8o5/iPhMeWyWBBDdKT645pJlkYxLbnceEh1BZRWHJ+11KqBpY3vLIYtNTFo?=
 =?us-ascii?Q?bCExM16xwPRJ1R+gF7T6/1JBoFG0KpBCmuD0+tia6n2fKJD9nUyfZpTnD6Lz?=
 =?us-ascii?Q?c5m2f6NAnTRLeJiyINTo2cqckchU/f6tLspNy1aOaFLHClR4hY3FaVe3LfMV?=
 =?us-ascii?Q?iKghxKPcp7xr9B2Iq+1juEMbC24w/FvpUcCE+N3B2TNU5OODxgYFrJcJFJCK?=
 =?us-ascii?Q?uOqSKTJwRhUHR1Z5yTfrUQXfUF5ztWueFIMPHsS98cVgPF5P3b3eXODOx2Ot?=
 =?us-ascii?Q?D4BjoiREc0VcU4VBpq1lz99ulSzkS+KXXE0I5XH0QBAoppr39Cpz9nQoaNdp?=
 =?us-ascii?Q?Ya5dBm1vY8Nf+ebdbbtm4WCe1ZibeY5cK84eneF4BTXQvE1IMjG6CHDzMeEV?=
 =?us-ascii?Q?nX+9jCegR+70vS6LnYxT0yAAIgVsTMSBLLaoTBt5V1AYrl3h4XNle/4NRG+F?=
 =?us-ascii?Q?+o9d6uuM8XFiBOk7w/yZdd7yYn3z9LS8FYc5cfeVSM2MPiz/T4NZHiBleJZ+?=
 =?us-ascii?Q?2MrUrlrwEdy8aTPJOutf2RidXolo2ut4GL9NNykxOJFl6yVTXpcvraWx/lCK?=
 =?us-ascii?Q?JsM1jpLKnhheQvrDp7cpJXfsWrhI7OvzMM5J41/goTghsDLQom3NZ9dSXBXb?=
 =?us-ascii?Q?SIWZ2FNMJJL+cZHjHHX2G1AFUN/N1MOjVAjCCge7ROpMN4vJsvhvXWRn/o7G?=
 =?us-ascii?Q?kGkSHTopgaYIuDyUSmyeEpjD5viJcb2eE/b6Ol+VbndVlDWNUezoQ3W/BxIA?=
 =?us-ascii?Q?p1T4/QyG8ltaZa/J9t4UVPoRFLTtoBCsUV3EwU+E0YOoUT1a0Iv3ScuxXVdV?=
 =?us-ascii?Q?zfcMry4f/TDT+BuU6HDSVZJ1MXL5y44EC2H4l7zVgN9htufWM5u6DZgbFTlK?=
 =?us-ascii?Q?UOHp2VsEwC2Yw2D3Ut7eMMvjdX42XVAIMd5Lg8fJxukQ78d3qgOcnLeYzTbq?=
 =?us-ascii?Q?giyZcBviDW4WO5v9SGRXtJRF9pX+8glZD3ituPXD/qapgbqGuMD+H6yQAL+2?=
 =?us-ascii?Q?E0oPrm49pnAkl4J0SqzeVtdBcWV6DMcz85ICOmcIBiTnh6lepwxhRM4m4g9R?=
 =?us-ascii?Q?O3MuABI1T3SJ9+l2ddUaZM5Or37IcTesjP2eLonAa3OtABM+RZu2HPgZFJll?=
 =?us-ascii?Q?Jy+pl40MeYDh0w5dzi8po+9Hb5vtyhkCn1Dl0REbfXXI3JZbUZdAgToSe7Nc?=
 =?us-ascii?Q?xyNV4LZ5A0+g7AOF7yusRP9nF8XwQ9iSqgCP4PRlwVPs8B1Ju9n21ymiPKH0?=
 =?us-ascii?Q?N5Qfunm/3w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2627799-bef4-40a1-5893-08de64c9157c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 15:13:14.8649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHNJytc5QoyHh6hwV60qTXNJ2BlIVBSv8Z3S5MnvkkNipWyAieIp+P7KDh9DavTUlqxAmCeaWOMp/Q3C8Ze7mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10369

On Thu, Feb 05, 2026 at 11:01:24AM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add device tree support for the Variscite DART-MX91 system on module.
> This SOM is designed to be used with various carrier boards.
>
> The module includes:
> - NXP i.MX91 MPU processor
> - Up to 2GB of LPDDR4 memory
> - Up to 128GB of eMMC storage memory
> - Integrated 10/100/1000 Mbps Ethernet Transceiver
> - Codec audio WM8904
> - WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth
>
> Only SOM-specific peripherals are enabled by default. Carrier board
> specific interfaces are left disabled to be enabled in the respective
> carrier board device trees.
>
> Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-91/dart-mx91/
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 ++++++++++++++++++
>  1 file changed, 468 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
>
> diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
> new file mode 100644
> index 000000000000..e87b7abd86bb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi
> @@ -0,0 +1,468 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Common dtsi for Variscite DART-MX91
> + *
> + * Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-91/dart-mx91/
> + *
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "imx91.dtsi"
> +
> +/ {
> +	model = "Variscite DART-MX91 Module";
> +	compatible = "variscite,var-dart-mx91", "fsl,imx91";
> +
> +	sound-wm8904 {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,bitclock-master = <&codec_dai>;
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,frame-master = <&codec_dai>;
> +		simple-audio-card,mclk-fs = <256>;
> +		simple-audio-card,name = "wm8904-audio";
> +		simple-audio-card,routing =
> +			"Headphone Jack", "HPOUTL",
> +			"Headphone Jack", "HPOUTR",
> +			"IN2L", "Line In Jack",
> +			"IN2R", "Line In Jack",
> +			"IN1L", "Microphone Jack",
> +			"IN1R", "Microphone Jack";
> +		simple-audio-card,widgets =
> +			"Microphone", "Microphone Jack",
> +			"Headphone", "Headphone Jack",
> +			"Line", "Line In Jack";
> +
> +		codec_dai: simple-audio-card,codec {
> +			sound-dai = <&wm8904>;
> +		};
> +
> +		simple-audio-card,cpu {
> +			sound-dai = <&sai1>;
> +		};
> +	};
> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		post-power-on-delay-ms = <100>;
> +		power-off-delay-us = <10000>;
> +		reset-gpios = <&gpio4 14 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
> +			      <&gpio3 7 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
> +	};
> +};
> +
> +&eqos {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	pinctrl-1 = <&pinctrl_eqos_sleep>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy0>;
> +	snps,clk-csr = <5>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		clock-frequency = <1000000>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <15000>;
> +			reset-deassert-us = <100000>;
> +
> +			leds {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				led@0 {
> +					reg = <0>;
> +					color = <LED_COLOR_ID_YELLOW>;
> +					function = LED_FUNCTION_LAN;
> +					linux,default-trigger = "netdev";
> +				};
> +
> +				led@1 {
> +					reg = <1>;
> +					color = <LED_COLOR_ID_GREEN>;
> +					function = LED_FUNCTION_LAN;
> +					linux,default-trigger = "netdev";
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&lpi2c3 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "sleep", "gpio";
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
> +	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
> +	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	wm8904: audio-codec@1a {
> +		compatible = "wlf,wm8904";
> +		reg = <0x1a>;
> +		#sound-dai-cells = <0>;
> +		clocks = <&clk IMX93_CLK_SAI1_GATE>;
> +		clock-names = "mclk";
> +		AVDD-supply = <&buck5>;
> +		CPVDD-supply = <&buck5>;
> +		DBVDD-supply = <&buck4>;
> +		DCVDD-supply = <&buck5>;
> +		MICVDD-supply = <&buck5>;
> +		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
> +				    "soft", "music";
> +		/*
> +		 * Config registers per name, respectively:
> +		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
> +		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
> +		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
> +		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
> +		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
> +		 */
> +		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
> +				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
> +				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
> +				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
> +				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
> +		/* GPIO1 = DMIC_CLK, don't touch others */
> +		wlf,gpio-cfg = <0x0018>, <0xffff>, <0xffff>, <0xffff>;
> +		/* DMIC is connected to IN1L */
> +		wlf,in1l-as-dmicdat1;
> +	};
> +
> +	pmic@25 {
> +		compatible = "nxp,pca9451a";
> +		reg = <0x25>;
> +
> +		regulators {
> +			buck1: BUCK1 {
> +				regulator-name = "BUCK1";
> +				regulator-min-microvolt = <650000>;
> +				regulator-max-microvolt = <2237500>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			buck2: BUCK2 {
> +				regulator-name = "BUCK2";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <2187500>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			buck4: BUCK4{
> +				regulator-name = "BUCK4";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck5: BUCK5{
> +				regulator-name = "BUCK5";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			buck6: BUCK6 {
> +				regulator-name = "BUCK6";
> +				regulator-min-microvolt = <600000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo1: LDO1 {
> +				regulator-name = "LDO1";
> +				regulator-min-microvolt = <1600000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo4: LDO4 {
> +				regulator-name = "LDO4";
> +				regulator-min-microvolt = <800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			ldo5: LDO5 {
> +				regulator-name = "LDO5";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
> +
> +/* BT module */
> +&lpuart5 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart5>, <&pinctrl_bt>;
> +	uart-has-rtscts;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "nxp,88w8987-bt";
> +	};
> +};
> +
> +&sai1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_sai1>;
> +	pinctrl-1 = <&pinctrl_sai1_sleep>;
> +	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> +	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> +	assigned-clock-rates = <12288000>;
> +	#sound-dai-cells = <0>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
> +/* eMMC */
> +&usdhc1 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +/* WiFi */
> +&usdhc3 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
> +	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	keep-power-in-suspend;
> +	bus-width = <4>;
> +	non-removable;
> +	wakeup-source;
> +	status = "okay";
> +};
> +
> +&wdog3 {
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_bt: btgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET2_MDIO__GPIO4_IO15				0x51e
> +		>;
> +	};
> +
> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET1_MDC__ENET1_MDC				0x57e
> +			MX91_PAD_ENET1_MDIO__ENET_QOS_MDIO			0x57e
> +			MX91_PAD_ENET1_RD0__ENET_QOS_RGMII_RD0			0x57e
> +			MX91_PAD_ENET1_RD1__ENET_QOS_RGMII_RD1			0x57e
> +			MX91_PAD_ENET1_RD2__ENET_QOS_RGMII_RD2			0x57e
> +			MX91_PAD_ENET1_RD3__ENET_QOS_RGMII_RD3			0x57e
> +			MX91_PAD_ENET1_RXC__ENET_QOS_RGMII_RXC			0x5fe
> +			MX91_PAD_ENET1_RX_CTL__ENET_QOS_RGMII_RX_CTL		0x57e
> +			MX91_PAD_ENET1_TD0__ENET_QOS_RGMII_TD0			0x57e
> +			MX91_PAD_ENET1_TD1__ENET1_RGMII_TD1			0x57e
> +			MX91_PAD_ENET1_TD2__ENET_QOS_RGMII_TD2			0x57e
> +			MX91_PAD_ENET1_TD3__ENET_QOS_RGMII_TD3			0x57e
> +			MX91_PAD_ENET1_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x5fe
> +			MX91_PAD_ENET1_TX_CTL__ENET_QOS_RGMII_TX_CTL		0x57e
> +			MX91_PAD_UART2_TXD__GPIO1_IO7				0x51e
> +		>;
> +	};
> +
> +	pinctrl_eqos_sleep: eqos-sleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET1_MDC__GPIO4_IO0				0x31e
> +			MX91_PAD_ENET1_MDIO__GPIO4_IO1				0x31e
> +			MX91_PAD_ENET1_RD0__GPIO4_IO10				0x31e
> +			MX91_PAD_ENET1_RD1__GPIO4_IO11				0x31e
> +			MX91_PAD_ENET1_RD2__GPIO4_IO12				0x31e
> +			MX91_PAD_ENET1_RD3__GPIO4_IO13				0x31e
> +			MX91_PAD_ENET1_RXC__GPIO4_IO9				0x31e
> +			MX91_PAD_ENET1_RX_CTL__GPIO4_IO8			0x31e
> +			MX91_PAD_ENET1_TD0__GPIO4_IO5				0x31e
> +			MX91_PAD_ENET1_TD1__GPIO4_IO4				0x31e
> +			MX91_PAD_ENET1_TD2__GPIO4_IO3				0x31e
> +			MX91_PAD_ENET1_TD3__GPIO4_IO2				0x31e
> +			MX91_PAD_ENET1_TXC__GPIO4_IO7				0x31e
> +			MX91_PAD_ENET1_TX_CTL__GPIO4_IO6			0x31e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO28__LPI2C3_SDA				0x40000b9e
> +			MX91_PAD_GPIO_IO29__LPI2C3_SCL				0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c3_gpio: lpi2c3gpiogrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO28__GPIO2_IO28				0x40000b9e
> +			MX91_PAD_GPIO_IO29__GPIO2_IO29				0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_sai1: sai1grp {
> +		fsl,pins = <
> +			MX91_PAD_SAI1_TXC__SAI1_TX_BCLK				0x31e
> +			MX91_PAD_SAI1_TXFS__SAI1_TX_SYNC			0x31e
> +			MX91_PAD_SAI1_TXD0__SAI1_TX_DATA0			0x31e
> +			MX91_PAD_SAI1_RXD0__SAI1_RX_DATA0			0x31e
> +			MX91_PAD_I2C2_SDA__SAI1_RX_BCLK				0x31e
> +			MX91_PAD_I2C2_SCL__SAI1_RX_SYNC				0x31e
> +			MX91_PAD_UART2_RXD__SAI1_MCLK				0x31e
> +		>;
> +	};
> +
> +	pinctrl_sai1_sleep: sai1-sleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_SAI1_TXC__GPIO1_IO12				0x31e
> +			MX91_PAD_SAI1_TXFS__GPIO1_IO11				0x31e
> +			MX91_PAD_SAI1_TXD0__GPIO1_IO13				0x31e
> +			MX91_PAD_SAI1_RXD0__GPIO1_IO14				0x31e
> +			MX91_PAD_UART2_RXD__GPIO1_IO6				0x31e
> +			MX91_PAD_I2C2_SDA__GPIO1_IO3				0x31e
> +			MX91_PAD_I2C2_SCL__GPIO1_IO2				0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart5: uart5grp {
> +		fsl,pins = <
> +			MX91_PAD_DAP_TDO_TRACESWO__LPUART5_TX			0x31e
> +			MX91_PAD_DAP_TDI__LPUART5_RX				0x31e
> +			MX91_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B			0x31e
> +			MX91_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B			0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX91_PAD_SD1_CLK__USDHC1_CLK				0x1582
> +			MX91_PAD_SD1_CMD__USDHC1_CMD				0x1382
> +			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x1382
> +			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x1382
> +			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x1382
> +			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x1382
> +			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x1382
> +			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x1382
> +			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x1382
> +			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x1382
> +			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x1582
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD1_CLK__USDHC1_CLK				0x158e
> +			MX91_PAD_SD1_CMD__USDHC1_CMD				0x138e
> +			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
> +			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
> +			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
> +			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
> +			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
> +			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
> +			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
> +			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
> +			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD1_CLK__USDHC1_CLK				0x15fe
> +			MX91_PAD_SD1_CMD__USDHC1_CMD				0x13fe
> +			MX91_PAD_SD1_DATA0__USDHC1_DATA0			0x13fe
> +			MX91_PAD_SD1_DATA1__USDHC1_DATA1			0x13fe
> +			MX91_PAD_SD1_DATA2__USDHC1_DATA2			0x13fe
> +			MX91_PAD_SD1_DATA3__USDHC1_DATA3			0x13fe
> +			MX91_PAD_SD1_DATA4__USDHC1_DATA4			0x13fe
> +			MX91_PAD_SD1_DATA5__USDHC1_DATA5			0x13fe
> +			MX91_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe
> +			MX91_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe
> +			MX91_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			MX91_PAD_SD3_CLK__USDHC3_CLK				0x1582
> +			MX91_PAD_SD3_CMD__USDHC3_CMD				0x1382
> +			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x1382
> +			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x1382
> +			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x1382
> +			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x1382
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD3_CLK__USDHC3_CLK				0x158e
> +			MX91_PAD_SD3_CMD__USDHC3_CMD				0x138e
> +			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x138e
> +			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x138e
> +			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x138e
> +			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x138e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD3_CLK__USDHC3_CLK				0x15fe
> +			MX91_PAD_SD3_CMD__USDHC3_CMD				0x13fe
> +			MX91_PAD_SD3_DATA0__USDHC3_DATA0			0x13fe
> +			MX91_PAD_SD3_DATA1__USDHC3_DATA1			0x13fe
> +			MX91_PAD_SD3_DATA2__USDHC3_DATA2			0x13fe
> +			MX91_PAD_SD3_DATA3__USDHC3_DATA3			0x13fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_sleep: usdhc3-sleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD3_CLK__GPIO3_IO20				0x31e
> +			MX91_PAD_SD3_CMD__GPIO3_IO21				0x31e
> +			MX91_PAD_SD3_DATA0__GPIO3_IO22				0x31e
> +			MX91_PAD_SD3_DATA1__GPIO3_IO23				0x31e
> +			MX91_PAD_SD3_DATA2__GPIO3_IO24				0x31e
> +			MX91_PAD_SD3_DATA3__GPIO3_IO25				0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET2_MDC__GPIO4_IO14				0x51e
> +			MX91_PAD_SD2_RESET_B__GPIO3_IO7				0x51e
> +		>;
> +	};
> +};
> --
> 2.47.3
>
