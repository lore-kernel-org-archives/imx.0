Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012000.outbound.protection.outlook.com [52.101.66.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA083016EE
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764173809; cv=fail; b=jKG3eJOxZl0a2g5VB6lV8TmWcJ3YTMzcVCxySMIC/ncm/9kWe87kZVAUNLx1VYy9IaUCLbTROzczNJ61+C7WXPVWIPB2gpgQ5R9k6p2Xc8j3R4ZqFvPcMIT4UotRui2deMIBHhF27eXTVNRcQDIORFv+wgD151Fn6gOJDdT/jI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764173809; c=relaxed/simple;
	bh=HABFFtZxCUNTYAP/E+YlhumbbyPxEYKpFxq77HbvgQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rm67ZMfQPc76FjUTIEtfGHSWpXCKX41G8v+BI105QmXiX2riA15PpKDXm4UZwWr76DACZDCgyEdjrV6VA2c1tuRVJ9kbcI+rr59PEV2HW6c9+0VmRetRDJpDUyCAhBrFJaS4qAZKoul9OgSe9d1QzDo060XvxtSZVprjqIf5IGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dstT60ih; arc=fail smtp.client-ip=52.101.66.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dstT60ih"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rup0NaBGXqo8EZDAQC4vhsx3ptQg7VsgksPUvfmS6ICJv/sBPIoi+PSY0/+fnZOUmx+RgXfcbsvu/pfRfOkL5RY7pXa3fvw0jwnps/BKy1xmNakVAReduZ3ZzwfS84vNfM4nBBAwmcLPMy6JgWRMcVerxmwp8x8Se90nOavSTpu1w8mW7M9eW+tSGPW9gtoVNwtQEEtivau+lfvK3jBPF/vP6tXjeSB9uLG02DXm+YY7YexmL9+PA6Vrq2sHp3fInvG2f2waFn7i3ZgFbWEb36xABQmAgticRuy7lXBNchD+kbwDqcwKhjOAG6O2SRHJnvPYmE8WPbP8PEk8EYj0UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sav0FY6ptI9rKW8HiKmizaVGGLS/Yn+0d4lKtuL2tpI=;
 b=Ei0yRHsNKN98VuoiHCeyt+UftLGMSyyBQYtirIkv1DuinannsTd2/Zkdivmi0+e+skzRh0jf5T/NCGesDnUdYn8IHI55XzklLKO4YLffh1QkWxXQXhmLs8mi2CBSXSh+/eIJ/TTccNiDJ8BhS6LCSWIznba+jCszGMlc7IAbu/zXUiGOhM6We2UYbBIE/9/PCxfpqQwPgUUp1KwgKZ/T+KmvC/njE6zP8AcxS6EINw1GA4JCn6sslMgJyyqonJ52O7wbcbSQKiESjmh6QUkOmL1GnNb4xcUMMKbDLnWfOBukjEFitcahi/FWkDcdiCKT5j9wxp8QvQ4I5mYL0aub0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sav0FY6ptI9rKW8HiKmizaVGGLS/Yn+0d4lKtuL2tpI=;
 b=dstT60ihVuQKIne0LaHX6WCE1pnpyxTOxzlERwRQEpsLCi9j0NGIIA/wjEgUGyJEVn96pSq4Icedndo/PtfcfSy4OfTG96CnLTJ8/4htt03hmhGKAcbqakoxucfh5F8LSAQ93lXcWhswhXw7FzSOcbQZqnJT+sAtJ7RMqDAt4jXbC1XOc0+9rhv6f0KuR8qgJlRJvidT3Dzf9niiFPrcivS+7M5pB96dvoq1ZmihdffkMhxhGzYQQvRrG8I8CiYcxEMlpWDhEu0qLf004tMDns7HwhLl85QnTYWMWmj/stMyhoQMVFLF3EyNU8vCBufe5VXn1b9GA84i5wxi3lJdpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PR3PR04MB7259.eurprd04.prod.outlook.com (2603:10a6:102:8a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 16:16:44 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 16:16:43 +0000
Date: Wed, 26 Nov 2025 11:16:36 -0500
From: Frank Li <Frank.li@nxp.com>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: imx943-evk: add flexcan support
Message-ID: <aScn5NsbzXxOd4Zx@lizhi-Precision-Tower-5810>
References: <20251126-dts-v3-1-7545d957e795@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-dts-v3-1-7545d957e795@nxp.com>
X-ClientProxiedBy: PH8PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::7) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PR3PR04MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a514c4-e3f0-4531-7ea3-08de2d0730a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HdMeVIMwnkJp1s4jHjsooHBGW6bqsryZasgvOMgDT7BQUwi6hjh2n0rUSZaT?=
 =?us-ascii?Q?Y8t9ihSAA582h3r056YUmoJLuSOMlKsXlH3ZQSxNUVzbGlK11Dh53vFWmaZI?=
 =?us-ascii?Q?WZDIrKL9ZnIKs0FjPcbrnNf7kQDeCgotoQQXENCX1Q8cJg8y6nhD+TekiVMc?=
 =?us-ascii?Q?EPS91tR6Qs7dLy8XErvgSGDwZSwpWLpcLWUVD65GAertdYoOC3hrBzFAiwUS?=
 =?us-ascii?Q?AvaHsc2Jj8ieozeU0IpHg4GF0trunJN4/YaG9+QfpXVKuOR1DODGaOyBS5fh?=
 =?us-ascii?Q?YRaU/WT+xWCZII+9/g5sVuYbaUFb33IfMIvKqR/jRNqfPwLJFOg+iVsC6FIr?=
 =?us-ascii?Q?0/i/SzlHao5DQQFHaVdep+BQE+Ngd8RTnaPiIxyVtaz+sqwSWf++pjt7QjHH?=
 =?us-ascii?Q?ETCNhinIi7t4V1MTK4zaAge8E2MYZiy/hxdcDdXW44K7jx4LV2ZbE4/PXxiJ?=
 =?us-ascii?Q?sJCwQfiFTN6aMJQX3Ru4J5exCV0oqcAUyIeplr2C/+jBwNHxXySzchFA8v+R?=
 =?us-ascii?Q?xw5dgv5polFu7fpxFYmnbRcT/32vJqaiKhlXUTSmfZOFQrdud+f6+2jjDT40?=
 =?us-ascii?Q?P6ebtAYqVrcBOVie2PUkNnxzqIjkVPcGJtgfIXhTn6pKYr5C4o89CnYZN9PO?=
 =?us-ascii?Q?H+DAmyRqxQzhlqgaKo3mMQv9JXzZMppP6PEJhT0RL0VrL7IbcSPlqPPC+EGW?=
 =?us-ascii?Q?X1srGgYS7I7nUzOjRzgUtYipT+GUso9JW6XE9C0BdLiILtSUHfnuo5yyJEuL?=
 =?us-ascii?Q?NX4f0oQyr3i7NXxK/jfWZPfbG2y8QzfCPwrJ+aBlsyRnRn1LOoGOLVx1XL8F?=
 =?us-ascii?Q?2Qr2PRbwRsP+D4Jq69aypBI1S9LVrLOR/f6SBGfp+wszYS0t7R6GmlmErM/W?=
 =?us-ascii?Q?V1wW78F7pGhdUgP7/E18EWJZ2rUPJT5ndUfhQt+OppN+Gr2qHv9oCA7rD+Iw?=
 =?us-ascii?Q?M5x53NPEjG8xElULr/MJ7g081q9lcXhSRT/OvweptG8VLOOoTr4VBVw3oIZA?=
 =?us-ascii?Q?ed2whXnIrKEqgqbFANSsswOKYWj+YY7X9uH/CPRrpug9eHz0vIOELUYkigt/?=
 =?us-ascii?Q?jyZbpSdslGJfmSwwYc4FEdC7SdBCWZw5u0zekNSDTq5O8tmyL8B1c0yEeTSc?=
 =?us-ascii?Q?yjQRvENWx5UuE1raf7jy9WuFLCWtT5e9lGo1KFxz9wdZiXI4wy/SgzBu+oe6?=
 =?us-ascii?Q?AaAuMRJRyjJBWDHxJ6ztEixAc33+GaRsGBkMa//yxye+ziUiw2/w6zGi2Ugz?=
 =?us-ascii?Q?eFAPEXeCO1/nN0qG0bwHhULKmC2PNkb94iGfLvM7CwNJF4XHjNaaD51vTraY?=
 =?us-ascii?Q?QNTpNWmF0Ww1f/vW7Wr3FH1hDRDS3yhB4cB3M3xMqhHeP4mM6O00H5fH+j5X?=
 =?us-ascii?Q?I+hqD4kcH9BclVaHtitsHYbGOzmulSRNmOqLdM9/eOB4Td6cOqJ5u9bmOweP?=
 =?us-ascii?Q?uvQUvqffJGiBxzG7+2cQu4R4o+/jnE2Wo/4TFPNlHUy44xT4BvDNPaltqRjl?=
 =?us-ascii?Q?e8gAgN+sHYroZ/S7vyTDcbDM+w9PIRczpZiuGSdF5G69tRtXdtMFxJkDjA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2FOfT+s3/RZ4VZMwyNSS6DXSFFDm1SShTxjm3h1JmbMDg0u8rRgcRx7Vimud?=
 =?us-ascii?Q?6yDP8EUz6GWLLVSScGV91uhqVVu4A2HcyasIHKT3Ju1OR9sTqzsQeSaVelSI?=
 =?us-ascii?Q?5KoljTi+kuuWZXbELQN01ZHv6qFBLL4DOoaHe6yld9VwLAg0zwwHD2Qat4pU?=
 =?us-ascii?Q?HzuUZHx4qv2Nmqt2/tmlN6BWZcQYeRUTtbjZrSj/DmPk/jV3amHtVxOqFzX9?=
 =?us-ascii?Q?6pkq7aRPxzL6dJK0ouYFeaF8wxgOkv0zTEU2BmVI6ewr+t1Luuz+J4/ITYGf?=
 =?us-ascii?Q?8fAGCib1Yq/qk8+vIPa9wJXoW8jpnRzwkeJoFueTbEnQSCgqpdsGumk5qZ6v?=
 =?us-ascii?Q?yESePTsex7UJrI48YdyVIfCAykTUqIdjc6NcY85vQXo9pO//Y6I0zA/v4bxT?=
 =?us-ascii?Q?osmVWbrfBq+1BEUkn2Yx5/dwDVRKwOehTDjAb7S9/LiC6Lhdkt+/h9TFOqnc?=
 =?us-ascii?Q?c9hTmC5mSNGQ8ILxu8tOZlW0gqVYPbU15Yd5uQh+Wd1mfWc8rXDjXfsiFdRz?=
 =?us-ascii?Q?oD3bYtbo1yB5kZ8RXBZQ2/NNf5WKYp/jTSSqqYUHlKgmQy17CkSChVSfuylL?=
 =?us-ascii?Q?CboGTGhJYStuA3DZt7yztlf+K8kkbWRLsyzNheJvNqWk9++1TSw9fzD/j7zV?=
 =?us-ascii?Q?CARVGkwkhP44OWisdeETAQ+sW0ylpUhCS0gEH4eWa4sV7vxiQ+TTc9xoDglA?=
 =?us-ascii?Q?byEfM7zwXyGjc7+ZYeUz+WeuTiP/LMzZNrX0NhUuLK9/deUeKaQXMds4yoHs?=
 =?us-ascii?Q?+6YdIO96JOJW6VUI2cEZZt9sm+z1Y3A/6AR9OPEmxdrMZ1D2VLgU3I/muEDh?=
 =?us-ascii?Q?ReAd8ZvD4RasVeuv+0jZqSHczjBqeFG/kiXqf6Srs5/nkTXYPwyQnwwWaESP?=
 =?us-ascii?Q?2zsEgi3CjTg6wzZBWAYtHExQzg2LjtrPVMegoj10afpSoQzGZXHTY8pxP8D0?=
 =?us-ascii?Q?yvU11SvAPSFX13FNiQZnljmjGC39o91zZpG44nEPOIsFkTBz2GcBfBhuFZK3?=
 =?us-ascii?Q?NGK7QarBx+Dp6MujzCz8lbrBMNz3H6z5XuYQuKWdRpqJY7LJW4Kyb5k0Qhx5?=
 =?us-ascii?Q?/SkYSpRJGk7yJRgMOc2fyS/K0JDCU/OXA/aRByMSPDPfi1QwVD6SCBrzY2sT?=
 =?us-ascii?Q?5rW6hC+YQJ/4YrJIJ2Xc5LLZbdjYZVSqW0rg+44FQw4Xuj7THkbGNzOrKIOl?=
 =?us-ascii?Q?7zvjHc1SsZJ5uRat0CTVSwv59a7QeCrv2FP32RdoOJX5eDNlHF2XBYpfwaxN?=
 =?us-ascii?Q?JmiHffpt0AYZzQiEOltfNCiVDtA+XnbDFDtSUeoraRd7uD64PhlB5PCA9fqN?=
 =?us-ascii?Q?XFjcAswSfMbtSKvq2NjsbZUZKfVyWPdcmQPQkArHmy3+d69jN7YhEY8hOicF?=
 =?us-ascii?Q?zVTsAVbdnVNPEXD45/JaIttYnhkP0/9eiwuK8eO8ne63qCLGpyDdZ6XzT5/O?=
 =?us-ascii?Q?FdY9UVfK130p1j0weI9SVQaBq13NmCriyMs4ReeSv9MzmUWhYilfnzwvZu/R?=
 =?us-ascii?Q?j+FeJ7ptTp43N1nU0+uqz/1xNyH3Xq9AAWrzrDJxZhWCmDDaSdcV89QbXnQt?=
 =?us-ascii?Q?VaSZlBxYuyp7+uPYIoyN8V4BPBw3G+cuDF/KpDoJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a514c4-e3f0-4531-7ea3-08de2d0730a1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:16:43.8711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4pB0sfE4vC+Nv2e39VaTs848KPKk6v40KXMQpZ2atwxi9OyMRpjADBJaFSe5evzFCMJESWrviltIeR5hclRbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7259

On Wed, Nov 26, 2025 at 04:06:44PM +0800, Haibo Chen wrote:
> Add flexcan2 and flexcan4, and related phys support.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v3:
> - make all the changes in alperbate order
> - Link to v2: https://lore.kernel.org/r/20251119-dts-v2-1-e8f8d91280dd@nxp.com
>
> Changes in v2:
> - move the can-phy0/1 before dmic, use nodename order.
> - Link to v1: https://lore.kernel.org/r/20251118-dts-v1-1-81b6249f455f@nxp.com
> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 43 ++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index c8c3eff9df1a23c52e74bf2bc5d4ba543bb5a65b..9f68f491fea07312be595fd6829617fb59413616 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -25,6 +25,22 @@ bt_sco_codec: bt-sco-codec {
>  		#sound-dai-cells = <1>;
>  	};
>
> +	flexcan2_phy: can-phy0 {
> +		compatible = "nxp,tjr1443";
> +		#phy-cells = <0>;
> +		enable-gpios = <&pcal6416_i2c6_u50 3 GPIO_ACTIVE_HIGH>;
> +		max-bitrate = <8000000>;
> +		standby-gpios = <&pcal6416_i2c6_u50 4 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	flexcan4_phy: can-phy1 {
> +		compatible = "nxp,tjr1443";
> +		#phy-cells = <0>;
> +		enable-gpios = <&pcal6416_i2c3_u171 0 GPIO_ACTIVE_HIGH>;
> +		max-bitrate = <8000000>;
> +		standby-gpios = <&pcal6416_i2c3_u171 1 GPIO_ACTIVE_LOW>;
> +	};
> +
>  	chosen {
>  		stdout-path = &lpuart1;
>  	};
> @@ -127,6 +143,20 @@ memory@80000000 {
>  	};
>  };
>
> +&flexcan2 {
> +	phys = <&flexcan2_phy>;
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +&flexcan4 {
> +	phys = <&flexcan4_phy>;
> +	pinctrl-0 = <&pinctrl_flexcan4>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>  &lpi2c3 {
>  	clock-frequency = <400000>;
>  	pinctrl-0 = <&pinctrl_lpi2c3>;
> @@ -431,6 +461,19 @@ &sai3 {
>  };
>
>  &scmi_iomuxc {
> +	pinctrl_flexcan2: flexcan2grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO34__CAN2_TX		0x39e
> +			IMX94_PAD_GPIO_IO35__CAN2_RX		0x39e
> +		>;
> +	};
> +
> +	pinctrl_flexcan4: flexcan4grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO36__CAN4_TX		0x39e
> +			IMX94_PAD_GPIO_IO37__CAN4_RX		0x39e
> +		>;
> +	};
>
>  	pinctrl_ioexpander_int2: ioexpanderint2grp {
>  		fsl,pins = <
>
> ---
> base-commit: 187dac290bfd0741b9d7d5490af825c33fd9baa4
> change-id: 20251118-dts-ad4bd4fdacd6
>
> Best regards,
> --
> Haibo Chen <haibo.chen@nxp.com>
>
