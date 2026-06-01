Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337A4364028
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 20:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346943; cv=fail; b=QSZdu4Z0vN6PMPQfVqJ4810Wd+j71yLl1Yh6C+TUyOTbXYs+RwaSnBn4gMOPzCx0lFgRl/dujyT5danoZt1rd9cNd9YRp4lDYn/BE+aKLNZp9h9uzyy6D75MQJjkCgF4EZUm8KZac3T78CRRlIF+naYnCKPqWYTdEnbr5lpYz2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346943; c=relaxed/simple;
	bh=IWGxj/0ok8lQvMGB2LEGQNL2ARpEPRFdgPSM/Vz8XQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tONF02msNdKfZMUDbgUON8hKNNX8e52cuKwLJagcFdgNlURYAFhv1/WiGiHW7j+M/RpzBPPyXpwsiMJm8Fzo1UGphDfE9yb12KfJWW9go0HU8MM5oyznEv8OvKT0UnMMz6VVDiP7sfyDx6pFDbKzIR5UD+7VxJgMsAToNvCmjZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BpZ+sSmo; arc=fail smtp.client-ip=52.101.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BpZ+sSmo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzuUdxnBQRq4I51Gw7wNL2mcIiV1Vf9dLfnSHzVMHjIPcGFs1VqY6fnEoJTQ+JnMdzLLgQMMpVkVa0fXpV6QyijGUnh8RdCziyJOXjh79/C/TbPnUJZtTtsvSyZZfFTtyG5IEd4U3VtD7kenBvwwQT0CWubOwBnPYiPnlMGYFLh4Z7NN53B8aB83kVXwEuxWLs+nTLqYtz+bzdfSgtZPoggyzRjZJ+wBsZRF1R1vL150Y+BPtFivyTnA3hSOaTTCfbxrQxDrKU/CFpkOamdTZGeWS/urKYnO4CVAr/xYPXrYJvFp3SnJEKPLp+yJZIDfqwdNsNI+rkhVmizq5sfNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtdvuYPoePr+9koPxqm6pZk/Sfo2YFu6eHNI3S/4xhk=;
 b=itE+xQTNVstjBPs2Bl+WpiBFirQLkwc7TJPF7af27WTQnPq533ojoG3Xzu85smbfudKlJKUR4gacknbpKcNFumJYoRWmVMxiIODhvXfJ1dh+BzRbCAl0hr+AmnnwUGQPQknnkh1g6WgLUld4u2gA55jdT98pjpjwL9ATszvRW+buTvbZ/5sN7OIYZF0Wkhh/v2Qa5B3fxMHMFNsklSCha2tljaNtz0EVeyG5S2CgfdQlmJRlr5i0xMj71wmG3eQhHurWCvlfta5szxKuMK/SwzOpKmpl1nxGPc8hOOjiycm1S1gZYsxpiOArolsd2rW7/NKKX/toxYb/ogwuBB6hPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtdvuYPoePr+9koPxqm6pZk/Sfo2YFu6eHNI3S/4xhk=;
 b=BpZ+sSmotWrEj1EKaqdYJndDOl5vjdotfNOskLk1RFAYzhuWyzanZB82Wzgw7l2OZl7/2ThoROnwxBtiEEkAtURyxHIdM7ro+0NyEJvZml9DNI7SiwNkIN6ziKlSjelkoTpkH77QLAn5yrecp3olJY/rTRb0/G4+fZ+80603N4ZzSNGXVKLN5gtgqAi4ostIs5MZcu6Y+64yvvWo00PklB5EnsLiZWxtk/uf/LFVREYJDG6m0XsM2QvSfjAwJO1YSZ24rXSqcjrkhBMl/UfWfi3whhSnsSYVSN8GAsq/xv8xL5K2S+1uNam4ELP633PSPJilklOqwYy8EkjWvayYcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10976.eurprd04.prod.outlook.com (2603:10a6:800:25b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 20:48:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 20:48:57 +0000
Date: Mon, 1 Jun 2026 16:48:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: imx93-var-som-symphony: add TPM
 support
Message-ID: <ah3wMi6QW6DUPrS4@lizhi-Precision-Tower-5810>
References: <cover.1780051874.git.stefano.r@variscite.com>
 <64adb6f0cf9efe107c761e1a69b9a63c7dd0141a.1780051874.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64adb6f0cf9efe107c761e1a69b9a63c7dd0141a.1780051874.git.stefano.r@variscite.com>
X-ClientProxiedBy: PH1PEPF00013306.namprd07.prod.outlook.com
 (2603:10b6:518:1::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10976:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b2f2c2-1689-4b86-a580-08dec01f3397
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|38350700014|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
 i6ZUVZ53e1xMS6TXEiXvkRgvOp2Et1eGYpppEsrSZyewTQhdQmRAZooxcqE1BHUs6oEYlpiTo6rBmxxKQzi5HIBUxIie1FDB7T7HVQmjrzATxgddTU1MpCvKO9JAvuTgJElxERiS4MY6P0FtRKfqQO+sjlCsrWD1Tpa6vt0bPNbz3GQRrtIBYfTH7rM1mYZTwEz/xyVnXtX8gwIbBvtREu0Z1PgDYgwjJg5OO9CQ+LWKmdpe5yArC5qxZGrRmYTSYzMCJttj1t78EXCSmGq06CVRkP3Fj4yWzE1uSDMvj0rYQxA53QXvCDgZdJ2GCJ37HFFqpsakqgwoiHpqBEoWD2MPHvTzYRSjULMt+QurzedyFaFyUdbJmEAaIvLVaUcs7PiBqWxOQVo1FOTfYXfy0txAhv2jNhW/D3NuBMTRE0iCNXbT8NCcBRiT+DoSHjOMixAGSMRaL84rcvaHEUalkFHAlBvC+zkqLzP9e2N1y6evNpRAK/5E50k2NQrujrNqOBQjKryQAS6JGM/5PRfOs16OvQzay3xGcOGI5QbUMJtoQuQfTE3R8AbICKU62kovBPDeaxW/UZjk7hkSQK0zUEluwdHzf6sGapQj17n2AvbaBe8g/9Vl7yXjuLa+A0Tr8bKDQKBJuZvnZy9u67A0y0XJgeDQ89ZPtZ/UGoPT+DX3c+XZXLHVANAx/O5b4xyTXKGRFSSYy1Ijd6WXCghbUarsR6tNeBKLiFv/2MY+GRi9usIlTA2hsvGf2yIW5w3r
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(38350700014)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?jH+JDXjn4cmRQ8SlE+VZlapsoFDy9b2DeNXmF7ymoDhzH9N/V9nCz1VcMdFi?=
 =?us-ascii?Q?BPNiFHHl6ijcup9xZZfNyzStNa8IN0H+TAwgIe4n2+T5x4HMLwdEFa2cBpfR?=
 =?us-ascii?Q?HT6R1qQDT90HnrNgPjDvI1U0wwowERgfwWYHRGSJZOLdp5nXa31KJSXW0uGJ?=
 =?us-ascii?Q?4VLjAc2RSnDmS+n3fEYXpGJvlNNzXcp+n87RQGeePNmSlkyowVXNt2dji2VP?=
 =?us-ascii?Q?ixAQxQFk4piGtUbRQlRHhbV2ZNlEmtwb1yMuDML/ZEmqAYC8v8KCfnlrdXUT?=
 =?us-ascii?Q?Xcg1353n1zctHR1WOo9k+AylxVw8kT8DjKANl3YPkTwVfwD9L3lec1X5VS3K?=
 =?us-ascii?Q?w7m/Mm++034YCWkilKtZxuwFgkT6V7y1AYf/QYqQFkh0jfTE+V4eUdGZvcDC?=
 =?us-ascii?Q?7vKIaa563WxZH+cr8QlJaiEb3Y11d07mPii2VC1MrCfidjcNRZDBLICJeQPB?=
 =?us-ascii?Q?FHOmsgmE4QM7WEs3vhsSNgKasLjgMecyTqxU6wT8pRf+QyE3bhppmOAsEK3W?=
 =?us-ascii?Q?PpXCKIoGPIw2nk8U2pKcN9v3Hh+L0pFNMnX9P2b2h0AylSwILeo0BVReaDUt?=
 =?us-ascii?Q?+snOo+tt6rVvCG65/p7X88+slNXRjKtX0F0sCKB4gul7kkaKJHKTof3AUFXF?=
 =?us-ascii?Q?d1RW3s+Gnqz3X8Bm8fBgU6SeG21INzHJrfqxez6vrmCHV7QHkUOOAGN6CIhM?=
 =?us-ascii?Q?KYoq+PRnbYlrv9b4u9gl2vFu+8VwSfYQkBlTp5CZiiyW7cZnWBLgmfnkPCYR?=
 =?us-ascii?Q?jJ7J3MsBPTIfT3GgJ3l6rXPWkng/57WVL5iFU3qurO2/B2ROZXUjWMHbDOno?=
 =?us-ascii?Q?RB38kwBCkyIXkjpiRS0w2Jb3VQI7rZYFvxNBkfJRA8i17qKls42+JhAxXp/H?=
 =?us-ascii?Q?74oyAzOaMzu9Kibza6G+6dOw87+RVtINFPEm6RsN1WiqNDvxyU4MykkvP/pM?=
 =?us-ascii?Q?bwmmawOgThu53XdTOMEiouVUR+KJkxQS2uf5ha2vyoaab4nfRC8AYIhs0jOa?=
 =?us-ascii?Q?WTcluR0SLebhnZueKjr2rLM39perXTfGn3wxWS8nnQ/sRFoeMsmdVbmV6nIr?=
 =?us-ascii?Q?FNqS/U/NApuUZTamo2+Rs0yH1qfMJZl8WbxSonA/9suJ1UyE0guV+tsNu7TG?=
 =?us-ascii?Q?dsLG1q2LdEfS8MWDvaguUmZ+po1zLKqscJ+/tQc4eKWJ+7aPASI2EY6BOfyr?=
 =?us-ascii?Q?AzZXW7R5VTklJT2vIjAGheqSykOonwoiZOLgN852r9Yj52DqlN2qF2BUqV2Q?=
 =?us-ascii?Q?VrbiPc1jo+Bea+Hh8/G1ofmJQjA9EkI9qqG1EuwrmRWbvfWd05ip656I++v2?=
 =?us-ascii?Q?4qD1RgGUS8V1ZjYbPbYVLd9JAASrvmJdr0+5ZaFkwKs5SsKl4fXWbvY3rcOE?=
 =?us-ascii?Q?ySq7UlhgiVfpO7QBslBE3cPrFH94GJ4QZcvbF07rKHjE/kE7ymNuOH8UXH7H?=
 =?us-ascii?Q?TTyNkVf/F9wndJaYBwF3weuOQHfer+XWCA5z+3jSg3bwly9rdD8jo6FP245l?=
 =?us-ascii?Q?DSLRgiQOA/kZjXrixLPcnLMmgb+4qXEKvdyREIg68057uSH8Z2PBh5Y/jBbF?=
 =?us-ascii?Q?a2nsJKV6qWbVLki3C2DerMD0+EKuiZ3UiIV+PyI8au0FWBID4pOxbVZ8Xt+A?=
 =?us-ascii?Q?I3lAINMZ6aDU258iS4T4AbhZ50plDzbqVMYzLtZpEwMO05c7LIIUFfRVkKM+?=
 =?us-ascii?Q?oKgAwKSEMPoG6fH7dIdHlkTnYG7VWwkj46ynis6t3hjstIXw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b2f2c2-1689-4b86-a580-08dec01f3397
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 20:48:57.6430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcWAMOl3hMRD4P/W35pu8CJUZO38kDIp9z4SfZWJ9D9rst8qa4/xzUvuyi83b/v0EqOJn3mXiO0eBRdF77IHmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10976

On Fri, May 29, 2026 at 12:52:44PM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.
>
> The TPM enable line is a board-level signal driven through the PCAL6408
> GPIO expander. Keep it asserted with a GPIO hog so the TPM is enabled on
> this board.
>
> The TPM binding does not provide a dedicated enable GPIO or supply
> property, so this cannot currently be expressed as a direct TPM
> dependency.

there are reset/reset-gpio, can you use it?

Frank
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v1->v2:
>  - Rename pca6408 label to pcal6408 to match the compatible
>  - Clarify that the TPM enable line is a board-level GPIO hog
>
>  .../dts/freescale/imx93-var-som-symphony.dts  | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> index c0842fb3cfa3..f541308ebf6b 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> @@ -208,6 +208,26 @@ &lpi2c1 {
>  	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
>  	status = "okay";
>
> +	pcal6408: gpio@21 {
> +		compatible = "nxp,pcal6408";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		status = "okay";
> +
> +		tpm-enable-hog {
> +			gpio-hog;
> +			gpios = <4 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "tpm_en";
> +		};
> +	};
> +
> +	st33ktpm2xi2c: tpm@2e {
> +		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
> +		reg = <0x2e>;
> +	};
> +
>  	/* Capacitive touch controller */
>  	ft5x06_ts: touchscreen@38 {
>  		compatible = "edt,edt-ft5206";
> --
> 2.47.3
>
