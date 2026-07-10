Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011056.outbound.protection.outlook.com [52.101.70.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91464343EF
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 15:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698633; cv=fail; b=LPg5dKMvwGn0jrmspLS4Ike76DvIfVKTs7lYsTfDev+9oPZgs9HGXUTB7g6fW4jN9LXXpf2eBblCIrw3NBeUBkzUFFFMd9LqlRtk3xb6cjKObbkAlr2qaYrtVTJ9+c7A7bbBk8ap9ZHg1OXY+Tj64lZsweX1GBVtTUexltv+L+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698633; c=relaxed/simple;
	bh=rPgcp6s5mGiuEKPAYo6eRCV0VAiA30gTrSLFsO+5e9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VvCsOFQPYLbbuo+PHBjCE4GUpNq+KmH5XqnoKcutSkEsox8hP2CifPPjQJ35smpqoE4AwYeDmQbOzVh19Nl5mDMptuvaoPliKcQAryzteXKtm9gXjuDNhNAYLP+4aFtOTp0eMoUj1c67vHPHoI0r62boJmDIsqwwVaDXBb+Pgg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=l83nxCLr; arc=fail smtp.client-ip=52.101.70.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="l83nxCLr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRm6bwn64JEbRPmIu7ydqfk9r0ZLeGqNdpMgRQqa2biIspd6Qnt8edU5+v/J9oUE/H8LrB4TKytCmWuD3CUxRCGNkIJNXMuU5Z2cx71COU01sWl+d4j7k3PHMvNX9JZ3DXcKCwJw17DT+Q5VeZ6VsInRinhB8U6InCX/bGZB80wwIjiuXli4iMXj4AxqStAVvHO3GrFtU7CmUIhblg5ghiIs0LNSwyHjW6QJ3N+b9t7O+ysnyEHTLQGQbxt4hoTrKT/uxHG00nxW3mNV/mhkmqDSoROWu3n0ZBm9ygjIGWsdKDPEyLqLIuLBB+P1LZPGu4n0VPfHaET1vhG6J8HSyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhyHcbZfhLM2JKea3zIEXSKXOlb/WnYl0yQY8g/ZAVs=;
 b=e78J5CKMwaQ+AXrAlJlrVA74VjTB5YKi28LC2O8EY9XMlU1Qs8OCvgl+60sAfJhcJyRWcOKPcpDrVMfn7scEMUtleOzNO2M2yM8VIcKLLJhd+yCrW6+x/OtARzNXh9BXcinHg2WU+tBR52PBWOYfdJbpKo1GrFKIaKKyFmAiAI4146+LV8ORhofWKiVKDwG5hwBZFeR9wfhVsK+9yxf0cSQRphEEquFoQ5f1+f8S2ZIgnNptYTNMgz8JOLMBdaVJgaYr31UMAeDtRad11VgA0b3VYOx8ALAbsfnQhwFRiAcizQO27JElUtxKfSU5K/iZZMJvICBBYZLMwfDp4moOxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhyHcbZfhLM2JKea3zIEXSKXOlb/WnYl0yQY8g/ZAVs=;
 b=l83nxCLrs4EKyelp0cPsf6q178cJzqS3FmH4zyulaO5oJ+x7on5YpR+BelVrq+uh/ZLry+th5mhWGPkLy2+435i6qrjCTY+klHObVl5lZIL+KSlt2u44Xqcdmw+5DDVrR4arJikPDxvrXA8G8jxgZYm/xLt1HKx1lzzgU6pZf2uvD0AL0pvDYC7D90xTLtjmb6W2+9xMz05B3C9OixWSVD4z/PcoZusOflFzQqRg8zDpN+K/fJAr94Xv2oxZ0oW6mWlfaHmCDECg3LfahWW8BXGsRhJ4xGmYHn9tWqHMK6YiA+mvM9OMI6yYd80vcJztwTVNKg7F7+IantOj6uKXbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB12042.eurprd04.prod.outlook.com (2603:10a6:501:95::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Fri, 10 Jul
 2026 15:50:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Fri, 10 Jul 2026
 15:50:27 +0000
Date: Fri, 10 Jul 2026 10:50:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] arm64: dts: imx91-9x9-qsb: Add PDM microphone
 sound card support
Message-ID: <alEUu_Vj7ZAkWikC@SMW015318>
References: <20260710024204.3462444-1-chancel.liu@oss.nxp.com>
 <20260710024204.3462444-4-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710024204.3462444-4-chancel.liu@oss.nxp.com>
X-ClientProxiedBy: SA9PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:806:23::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB12042:EE_
X-MS-Office365-Filtering-Correlation-Id: fdbf6937-424f-4639-5756-08dede9af64a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|7416014|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	B2xPuwXWffe2TJdu2uQ59K6HWLypKphynz+eEwSbrxrleFN9xd3PGYptJFcA1VcV9TzcadhKQenkIrObTs8D2hUjzkC9nu0J335yY9OpBVTc2wpJpw732Afn59CoC6bEePhTqGXB5QRozRsU3UvHKLuSNxzpOkF6gzkbeuIMA+FwHM4h+H1kWpZZO7ErsORRm8VhSJa5kcU24AkCALSArx3RrGABPhHXI4e2SKNe673TTfwGIudJkJ5sVejxg6aKZ43A2k9ZPBxc2z0NTEiNNj4nM21eBI/lgxyaUXji7LzzMvHGdbKeInof7AJlTAtEMtUaf+QU15kyaUBO++fJslK09H+DRYOyrQsTUWEWVwDH0TTXqSLnBPnAFNA/gDrKIvX4cGIf8IJDCPozoFMz9jhs0Vpfskln0ybfIL6eyh+Vvg92RQrrRx/PiAZZQlPAsWGzU1Fc5l0Uu15cLBeBXaH1tB2EPdpz8L86P9E+STx+LiyNm/+DN4RtgKyxQ/Bfx4AFpOrUCL9IrvHA+rgqdCeK67fzhSIdt14DeQNfPl92rXS0Aadz6IIzGH5EtdqYS13TaymXymMfxjmNeumpZFpxg3HvrmsnCeL7xd2zWm7bXkh11E12zCEQ2U0h4MK4o8nTaxC1ufeAQmzdW92MTlO2aKMe5Jm+Jbw47i84f/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(7416014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kqM23oCgr1SGrtlgwFsWDyiprXXbKoz5TCi5VFM7k2AflF55L/a56WFvOj9J?=
 =?us-ascii?Q?4c7XBxCtNxJd6eMJNT4aLO93IGpW9O6CeZJgawipmiADbZzbBOCnayMIyn0t?=
 =?us-ascii?Q?mmsP1Wqeib56wyjAu4dof3k2ghIr16qzN3dJTOIngNqjfalRNongl6oHkbYN?=
 =?us-ascii?Q?ZvYymob2zUjhS5GxSVmAkTc6mDecuqIUWOkzWFGw+/NsL6JND5h8rO8uXZHs?=
 =?us-ascii?Q?aA2KM7xiHIlqZkkzO0ij5BZNBrRt1Iwbtfy68a/7pjLM4xgPWL4GxrKExJTD?=
 =?us-ascii?Q?pDavhXfOf4A3Zkkz8MXwYGYnXp9mJl3YogJWigXuukD+KOqS1CutpJfGLfT/?=
 =?us-ascii?Q?NWQqAvHDgs3Mr2E8FKLnUsgvLEfeEAFjyFh2PlpGNteWdRG2ZoiN9/1lizMo?=
 =?us-ascii?Q?XDjR0wQ1bbY5ZPyHULZB+dh5bmwKvBNqReKoxRc+745Ac7o+pDiRZz7QWZXx?=
 =?us-ascii?Q?3awUqJxPShjOK03WyzlT4E6biWShQR1wDdyH085kceERKOtH3rIdjkCUJWYs?=
 =?us-ascii?Q?a9cXg9nLcu8H6FO33exraSC2MDQtbX982ZOcXtM13CZGcp20ZuO6fw2mGTmH?=
 =?us-ascii?Q?hCsE8TgD6k2yIknpIJ/FEB2jLQTS906DFI3Rx5KKDqqrHrv8YChJOf92VfJq?=
 =?us-ascii?Q?5idbPomD+Gc5bgFLklVJK/DYMBbkQhG1M6o+wuOh1sSaAvdEcAjC9oZzsDyw?=
 =?us-ascii?Q?qLOeV70K2Upn0eUZnX/2rjX6pYyvTaGkqo2/tQcvEHGvwnHeV5Hcq2HcclpH?=
 =?us-ascii?Q?dEWr+MB3bOJ8VFb27yrz9sGy4ZGY6m95M4GGFsen88z4s1OtWVUTlsCcAEOV?=
 =?us-ascii?Q?wKq6/mUTupFIh0TK0e1MIZq3p3zW1XuOXjvpA4kUW/GJy+AJiN/A7BG6X08l?=
 =?us-ascii?Q?x3M2gGD4td+3R4EY/cmyuahokz1/45DjMhPbqPCmVGb3ocxbG7ptWTyNN+Qx?=
 =?us-ascii?Q?6jJrKyhM2hWaFIffk9NcDgxCZFXHjga6yfpnf3cxq205SiTSXGsDusfH/fbl?=
 =?us-ascii?Q?bjR5YoRrbUGIks7lsKHr5EWl/wcHYE64ue+wY/igYnPZa0Ft2X+2HBm832X8?=
 =?us-ascii?Q?sqPYwkpFvfnCtfRHS7T6C72FM7hhLBxEx6rqlg814Rr2LKPv+kdCsa/VlUwU?=
 =?us-ascii?Q?EiZBdO4j2N8KXWjQT8x7Qbpp15VRydIIVE+s8KQPhgAaa5PmHsEZhm4eFCdm?=
 =?us-ascii?Q?VepKK2klncADhWi5DnRLukXam1tdr8Eh6EWusalPyWKGxrxDPv8QQ0jBwnEZ?=
 =?us-ascii?Q?ve75+IBu3wyBlkO7X8Kz687mIa04vXsECg9gsCh5ElMhSHr5sop95zsIUQr6?=
 =?us-ascii?Q?odFctX2hD1CLUezL+EZOYsUChZmtV8UGTAvnL0wbO1X+KzbIfNgq1tQoHxTM?=
 =?us-ascii?Q?kJ5WoRwlejKrsTCU9GiMkOYCZqAEdcqmB3LtatIkreVa/nE6U4piisyNSMoN?=
 =?us-ascii?Q?6cvPRUcUS9sKWujhy2G1H5ur7sTnZvBWYv0jLCObAUqid4UnulCTrUMyH4qc?=
 =?us-ascii?Q?wZP5CpWIw47ifvIARQzTE5ECRdMCnGa6b+gOxai4jPkMjUFIYvd1eCYKjorx?=
 =?us-ascii?Q?Wardv5/ozkJjLh0HSojyyKIfOP1ydEPb5IHgNh3mSjFWc+kuoS//UYPAu8gw?=
 =?us-ascii?Q?Fb/WmbpY3j4cIoBNZpyX/oR4US1ydGJtn8tp6QZzQA4lGAYqVnKbA+C3SoFr?=
 =?us-ascii?Q?0NhVQIYUCla8iIpWImnplwO3InQA7JgzgmbqVAAIKjm8Rjk5eKZkp3uZ3rlu?=
 =?us-ascii?Q?1RiG0Px3mR+32ivesMpP/+ZhFxjyUSqABcGla4WgRj5jg+Z8fYAJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdbf6937-424f-4639-5756-08dede9af64a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 15:50:27.3865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 49Qsd4WIkq5TBSltiB1lUM2A5le8lu0/6DvLwW2uxh5/NF+lyxfpz1PeRpzD5+xIcjhJftZ2oiokgxq0ltJYneUpiX2JTSLr+AocfzPUCS7VFnW1AkXPU3wzyZQx1EWZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12042

On Fri, Jul 10, 2026 at 11:42:04AM +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
>
> Add PDM microphone sound card support, configure the pinmux.
>
> This sound card supports recording sound from PDM microphone and
> convert the PDM format data to PCM data.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../boot/dts/freescale/imx91-9x9-qsb.dts      | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> index e5983bb083ea..2f663b1f7c56 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
> @@ -79,6 +79,18 @@ sai1_fun: sai1-grp {
>  		};
>  	};
>
> +	dmic: dmic {


Is it order? look like it is after pinctrl-gpiomux, can you try best to
keep nodename orderred.

Frank


> +		compatible = "dmic-codec";
> +		#sound-dai-cells = <0>;
> +		num-channels = <4>;
> +
> +		port {
> +			dmic_ep: endpoint {
> +				remote-endpoint = <&micfil_ep>;
> +			};
> +		};
> +	};
> +
>  	reg_vref_1v8: regulator-adc-vref {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vref_1v8";
> @@ -111,6 +123,12 @@ linux,cma {
>  		};
>  	};
>
> +	sound-micfil {
> +		compatible = "audio-graph-card2";
> +		label = "micfil-audio";
> +		links = <&micfil_port>;
> +	};
> +
>  	sound-wm8524 {
>  		compatible = "audio-graph-card2";
>  		label = "wm8524-audio";
> @@ -202,6 +220,14 @@ MX91_PAD_CCM_CLKO1__GPIO3_IO26                          0x31e
>  		>;
>  	};
>
> +	pinctrl_pdm: pdmgrp {
> +		fsl,pins = <
> +			MX91_PAD_PDM_CLK__PDM_CLK				0x31e
> +			MX91_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM0		0x31e
> +			MX91_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM1		0x31e
> +		>;
> +	};
> +
>  	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
>  		fsl,pins = <
>  			MX91_PAD_SD2_RESET_B__GPIO3_IO7                         0x31e
> @@ -464,6 +490,24 @@ &lpuart1 {
>  	status = "okay";
>  };
>
> +&micfil {
> +	#sound-dai-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
> +	assigned-clocks = <&clk IMX93_CLK_PDM>;
> +	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> +	assigned-clock-rates = <49152000>;
> +	status = "okay";
> +
> +	micfil_port: port {
> +		capture-only;
> +
> +		micfil_ep: endpoint {
> +			remote-endpoint = <&dmic_ep>;
> +		};
> +	};
> +};
> +
>  &sai1 {
>  	#sound-dai-cells = <0>;
>  	pinctrl-names = "default";
> --
> 2.50.1
>
>
