Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E083131A07F
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 19:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770234310; cv=fail; b=JRwcANeB5cC6nzpXrjlZVBFYhvtlSx3VPakb8da/rQMwGZ56Skmsxhgo1l44NSsbyNDUA4y4+0sRP1nC5OiXD4KTnTR34yRPJ17o6h2PPXBYrBgbVw+ERtq9oKXam00GBKMUEKO7mEi6cQ4kaS25F6BgS9P3chOggdmHRGK7Ly8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770234310; c=relaxed/simple;
	bh=D93gJT7959VZC0jBd8uMy9WoMO/0qw2bTGd2YcmrKD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=akGhYpR8Tfee4+Pk9DGhDq7wAtg1dDx1ijkA0YWq+f/0bcUz+CkxIG3ef9kblQFAa1fEdHHgH/TdMoQXCv0g16DyXRb2x3a9+VQsIXpnxeX0HYEEDiagFVufAxheNat/HIX1DPtmB0jjPHsKDPpbdfXQLPte+Wvh5W22onnLIEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UbwzKW01; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UbwzKW01"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myeH4YCb8n5H1j8MVvJNuhQFYIZEf+pEHgfTgQW0yQ1a6sD6ejlljXBonFP4gPrJO/wC0n1d8dH53ayT4SPsTiT01C/E0ocJNq0ax0VORqoAtHS3qJIldZV1qKK/J9uU74fKFcozzOhhjyzmpRsUnReZJV0/9HgZ33hdSF+WqgqwCMYN/WbJD4Z0jsyvKSc2sBlMi7fn4fOb7lC6MXqJ1OVbTw8NtHFLjUjaoindGhJp+cVx4CN0Gyw9joFs8KEpMdVyfKgGPG5Jy5gSwiX7U5XLFDlUoygwcWWIwRe25xCM2/0kM4ORbFt1HtbsRYdkqjkIClYj+lDG0yUig69iUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtTXycwaNjKB0KLJRpyIH2+Tje7b9Xv8ztjIiiizGcs=;
 b=l3Uid/+3B5U1xsRxg7AJYDvy6EkIbTCMG71SVkyJXMcrM/Hi/+92jzpxAmW+0SlPSmXr6AqtNW516m4nkeneb66kGc9ELxn0l1EADjnVVG3zZCmtd8Npjp//t38mwAtZ4tUXksiYls6D7LASV3xqjQMhODv6UwKB5cvoFgnKfsAIVn3+k9tHfK/3hwpjm8xM5S4MC/Ou5VcUmg/+d66vhMBFQLfT0DkKxi103z8TZs+pb+MkQ02T4N5TrfOudc+9q1huxiHGgHso/pSlsKEgJj5/1pN91k2JAMi6ED40Iklxp1R3thgZ+keHDoSGaLgKlkyXMMBq4fBCrH8Nns8HOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OtTXycwaNjKB0KLJRpyIH2+Tje7b9Xv8ztjIiiizGcs=;
 b=UbwzKW01kk8eV0hmVhaCzEKBshYqpq0fM20s6ap7InNw1lMWAEH+1L1AoX00HaXechBs+TQNk6vB+GBOdyFgC7LdtUrenfiLNymapd2CFhxsgolgnX/i/NWMAo1dQnKsoCR+04RQ6XjXah/kzj4S8z9M1a2Twjg6OYAXxHGwdEB2yQwa4HTov96wtj2gtzK0ZKp7DnbVhczHjSvJBU5CjCAzC8NUW2e6oVFAbfP1iJUQ3VRwe1amBdWeIJobh+3ckTRjY5JskopDqYVZfNz6Itu+5vwmwOXPyqW1PxSIOea6jk0ZXkpySAfPxuwcZhjyWgAUwk09+lRodnZLcOupTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10306.eurprd04.prod.outlook.com (2603:10a6:150:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 19:45:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 19:45:05 +0000
Date: Wed, 4 Feb 2026 14:44:55 -0500
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
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX91
Message-ID: <aYOht2HNhEIS8VZV@lizhi-Precision-Tower-5810>
References: <20260204170356.35169-1-stefano.r@variscite.com>
 <20260204170356.35169-3-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204170356.35169-3-stefano.r@variscite.com>
X-ClientProxiedBy: BYAPR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::41) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10306:EE_
X-MS-Office365-Filtering-Correlation-Id: 04037965-df93-444b-5c83-08de6425e50f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?omUEunTRlb00a+SylDXk4IkDjdbh91u46LhX6YMTd7HI5t3CRY5pps2xUlOw?=
 =?us-ascii?Q?wxG1a6wAsM3i27VPR3yKDCZyDEafOutSxQqGdt8GYbmq1urGcsVcqTAm21sb?=
 =?us-ascii?Q?UIB4i4Xayef3hcSh6QuW1r/7EtUAOXKkJNnF3ilTx3ykap5LqvF+qaJ+OZQk?=
 =?us-ascii?Q?GdfILAsaCSDbJZr9nB7vWbyEfUiAV0vA3hrHxl2boQsNnofKmcG7MOXWbHR8?=
 =?us-ascii?Q?Ka2DgzmCPy+rmP/XoE5ywAM7si4yr4L6S1103Ftr/2Ae5xAdoZ3K0c+Ze6PI?=
 =?us-ascii?Q?Z0mO56thKtqwYjVi87ZQCFrfWm5REENAbb4suinQfxCQKIuK6TDD9it9g+v4?=
 =?us-ascii?Q?FVFVMxEjMUmWdpliF4MCg90fsgHmCFdOsHxcRwGZ2W+PKa+f8DP7r8cu4Kde?=
 =?us-ascii?Q?PFOawvRFBWiuGNMrlMbUwnmzi/wG3+LYiUAn9dnrVpGs8Ab0rIFNgHh4zGqu?=
 =?us-ascii?Q?JkK28gkoGMEwnwgOXQDaptAdEtxDTgnltTckEtvSQ+Mt6JwjkDUVBYZ5v+FU?=
 =?us-ascii?Q?dnGl3zdNa+M9DoZY6w/A8jWayTJBGVIXjXZyj4HgZmB0LYnqyg8M1y8oL2x0?=
 =?us-ascii?Q?tlQ0Wg+A+QmYMyi6GojlZ5wOCDlfbDnD23J0vypksGp+DFi8ozpQIMVcPQjK?=
 =?us-ascii?Q?p3lVhSDuiMLGd5EMknVI8cVPqt+nUFHtAYwxp7g+Xq5c58CDDrk7tYqBIat9?=
 =?us-ascii?Q?qUBb3YzkSVG5Tp+GKGKTIqumZBY9XemGTcX0nG4akcRMW9E5LIh62pOJYhiz?=
 =?us-ascii?Q?/6gD4MhzOf/id7gpmxcTb3sjH0DQpY4VLpbR/B1uPoOcgGpd+b+G3HCILZ/Y?=
 =?us-ascii?Q?svp1JrEuTvdo6r2dTCHcPAkt46CyG+OFgGphYSa07GDjINYCrSBmoxn1CWie?=
 =?us-ascii?Q?bX1OHl/ya8I/qaCWPDeCxe5mqXDU5p97AKWFMdqwvdrMTVvNhjSJIUGWWyv7?=
 =?us-ascii?Q?lQXdlWrRXRnW1Ia5cXcYcK0DCeBjvx2cjT/SfIIR1I42Xn9zqVQeU8UH4Hxb?=
 =?us-ascii?Q?YN7DhGuLNzAsrZ9gMepKqUH3r3Q3Wk9I9ouIDalWTFwSlb2lbaa+42V8k+op?=
 =?us-ascii?Q?vCg/tk/JzFYzhebnGdmQnCXCuY9IqU2WFRiydXcXI7BT2+ra+WsYrV/ls3wN?=
 =?us-ascii?Q?mnQjnnYL/l6q/ydlIhlVkhEpF/mNCqh6bdWO6WMR1TUw+fScy2oWUOFb7O1D?=
 =?us-ascii?Q?5cwrl2r28kIg2hyPahwf/PmpywxHnXLcFAxiepzBr0y2SVXGgH5qjU4sV9RA?=
 =?us-ascii?Q?6GyJMN9c85f2n0AFsxXJups6P8sQMyzFIkGvBvAlZChxXfBcxgsjGI/hCG3J?=
 =?us-ascii?Q?RgKWVlL4iVoFAtpcM7UpUdM8fA7T1bLjBGKreHEko7IXG0wmBnN3HDcEGc1t?=
 =?us-ascii?Q?UGPmwksINBLf/4IdanVZC2dOeNlzzgWoF/Do6G1n9vPVfN1IqyAliVyoEBm0?=
 =?us-ascii?Q?WtFRLQ4egKN4RbQGoIgpEE9P/dyLtdseVlLAiQT0/EYnWyWGcqTIwsbPU9e3?=
 =?us-ascii?Q?wGt+mQkw3Bw/TDZF4kOUv1tr23jwgwx8g2ZPQKZlrvfn8iJWlqjKLxXofn+9?=
 =?us-ascii?Q?s3FnpqoLvGV/tS6jFe9W6e5MOM1g4mnGW+JVA3WaUOyqDF/rnDbzk9iXCTBE?=
 =?us-ascii?Q?oQ5+v2KIa8sK4aqfdOrUfck=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?hbIUwg1nnpAsUprcz57s3x4bzB2wnAP5k90zn8bZsaGOMYOR2wG3Zs8gmuAC?=
 =?us-ascii?Q?7vK5PtZZeGQ56jfsYQgkfprrrjjcARiINsv1JbGuTVbYV3uxNmqsUnFdQ2nn?=
 =?us-ascii?Q?hDN5tCt0LQKOXf2TZf+Z31eKOCSvWf1pzK/qxxdGXRKTWll5gJk5gtUdRegN?=
 =?us-ascii?Q?6TCFPVSk8SI4muRNqd7oyneP+xP5LTJD7GzWospNFgFv9H8pHQhyEF2TbkzM?=
 =?us-ascii?Q?uLj2rQwvCFJomW3zwtoBDAlWbp43NFntrvtOrXJoPCoUfRjksNGpZy3moKQB?=
 =?us-ascii?Q?e2JupskQvo++iKfvIojgfQ4iSSZYRLvUuhoRNT3UdCttjeQi5vLYUXT4Ij+d?=
 =?us-ascii?Q?3NVXB8+N4jrxPsMp0tiRcOinTxFtOiQmd2F/1tNjIV0ba2FzgPUaFQXCzYKQ?=
 =?us-ascii?Q?q43SASXXMWQqKWtFOEahyS9BGU0e70cZc1NPatM9DJcfVXEqoGkIYAsCYORg?=
 =?us-ascii?Q?5j0ywN83AopJMo5isOQAc6DnrMB0Fx+5Zo3IHLHTlWk8sZrHUfUVtdPbV5fi?=
 =?us-ascii?Q?YHuM3N7rZ5dD36XJygmwCdUjEl88kEgI9HIMf5hnurpsAM1f0xdCJW7CFcxA?=
 =?us-ascii?Q?nqILPEnBFGFX1WPrwYFcFLnvWwh6RblXR54FtGgvACwi5ERmyEdmRxgUqJg2?=
 =?us-ascii?Q?rChGE2V5S1943rYofAyLozadymobAxTB7s/Ir0QG1+RxZ7kkkn3FptSSEXvb?=
 =?us-ascii?Q?8ih5BLZN2oOm01DtLmhPlkR2kih46WOPZ+dS+f5d7lUmidXv2tMLxbtgFhSW?=
 =?us-ascii?Q?Yz5YWWVzMgkp5x0rTEHkk72JyBTMYaUUMJpZnZ5dUzG5mRV2s7Edh76AgkcW?=
 =?us-ascii?Q?0XUOuSSlMKgGIMeMl59DhVxwEb697U1FIzMDXjiiwATUwWIgUN5AMLq5EDFz?=
 =?us-ascii?Q?W8g/a18cEf94ZibrDynovUvRATrgfGpZm03xyc0ahUL0jxDUsT7djhgJwMYD?=
 =?us-ascii?Q?5B100ugXyRWmFbp3rO4RRWP/i61uYtCgSupPnhkzn59hpAEbTzjRMW64v3Lg?=
 =?us-ascii?Q?qTopm7X0e7kDwxrKhfTyz0gzDKCArpakwEtrR3UZhfIdbrhPYi3gF78o8bM7?=
 =?us-ascii?Q?+/T+T7PKMTRf+nGyBaFVsabLKleNMKD1p4m0i3VI36w15mvJiWCobY8c/TG/?=
 =?us-ascii?Q?dElSg3SO2kilDqIRanC+qR0gC1GAEUsX6pKRqPWZQVSbMhVFvZsOwWDAFUAM?=
 =?us-ascii?Q?ey8uZSxQ7H4agVnikoR7K93pPwAz5n2oArr55a+dzT0zdvbBQsUNq4YnJWES?=
 =?us-ascii?Q?3doxox/5Tdzh2kgWOJQ8ExNl9ywi1SW2U8VbmfuEqgEg3zn/g6czFCjBe50b?=
 =?us-ascii?Q?MFe0JDEF5F3tkjfKDCIvXB4f8R6yY6qNKp+X2Py4S96fatr5Fb3uy5iO6bI5?=
 =?us-ascii?Q?hagsSt1Kx5B4Fwgaypci6QoAQy99Bae0NTIOeX7taJsjndnqUv13amKDHOtM?=
 =?us-ascii?Q?lbVfuZiQC7pjbch/IoAnxx7JuqSYxTG0FIA6I1e/hEbxeziB3es32x1JrH92?=
 =?us-ascii?Q?rbq4Zl3WZZh2MrkbxqDauUfhyI/Ty1kk6i193YDaRRTLQXl8e1qNCsWYRHgZ?=
 =?us-ascii?Q?S6Rbmzde8IrdikaatpN7mF2qsLChFp4+pfeHDcs/iyFsID8fPcimROtzEgi2?=
 =?us-ascii?Q?Fmf0EOSg7DoZbi28ZPrxgfSwRi7NgGUCif24HEYzY59y430L+epekMINmo6L?=
 =?us-ascii?Q?JL/DEE6PPrR6+mF+eFZTsnVvJwRJ41lYVBii+V0YGuqVRN7M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04037965-df93-444b-5c83-08de6425e50f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 19:45:05.4795
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1M30MooRa4vu+yaCHcfT4hSNjw29ydEfchpzNn/vFN/buBMUDiff/P6s7HQSAcHCOYcX9sHuGqLj7kbao6Yzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10306

On Wed, Feb 04, 2026 at 06:03:55PM +0100, Stefano Radaelli wrote:
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
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
...
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
> +
> +	wm8904: audio-codec@1a {

order as hex address value

Frank
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
