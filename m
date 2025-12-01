Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013023.outbound.protection.outlook.com [52.101.72.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211C5334C04
	for <imx@lists.linux.dev>; Mon,  1 Dec 2025 16:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764608090; cv=fail; b=SYWSnRkQRZcGy1AVY+LBYshWc/vl6j4V4i0npfqzqOTUghwvof2WXbgYbAbVaOJUQNHYOgFflrcn9eNj9Bz8bqtKXl4uEypBfZIOgipFtAHhZ7HT7yZUBLyoKuXfX3V8H9WQ9aUPxAUFSvC3iqJlyBUT6e3m4diDvjOG/VgR7JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764608090; c=relaxed/simple;
	bh=HmNbPdHfg32qPjQYg000txtVCqQmaZpnDtySj5nLJ2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SENMefHjkqr5KmUrRGWxWzUgGX1WQlrrftH9Q5r1z7yr6aJ48VQiUXk1Dijo3GL79pwkJxISs99+arKA1tNfaspNGe5NLq2chiy2B0B6DiiMnf4v8iTEgEud32JM7aMKIKsI5X+j5ZMkroOhtbeU3E5dgbfg6BOYQtkQjIXxON8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=INOxACip; arc=fail smtp.client-ip=52.101.72.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="INOxACip"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgUCrLSYRlFt7J+xNhny2vKZzzeHBNsFLTkfyoLRS3Q32bv0ed7ezFegEQm8RoZqKE9zp40tSPyRcczq7gwGbx6IApBILxPsbVeCXcnsrR32KaclGQw00ZtoUbfy7NRd7Y7ltYO6ouGku66yX+V3RdhtE7s6LN9eA+F4KYoS4O1ovmfyj0UwFHzRdOdqMAL6xNRnRe7Fo3Mrqw04akCaeAHtfnkR6HrBxrlGmaj9Cv5Zc5TRTH6qkzgkUC7KqrQ6lAVzpnykYkLuErmzpHZnbyD9+VyqEhxUSohjMvrelUzCrzmYvCoDK2W/dQ2JpzbuherNr+4XJxg6ouLefxqHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JeBECU8nswMipqWqN6UcFTyGbkU37Lwfu5LhzgslvY=;
 b=llNnbfOFNVUYj+7XpYnTT4bhzdTHXU+wkPwW4bLtFAB/keIIX6epUVQxlAl34FmTHVyuas8MHwTLzansS+yVnzjM0sRmOO9EwkWTb4PWU6neVEwb3B0iSfux56V+P+GTMDGIaNalnjh3w2SFW2HF5U7szwh0iJ6B7sx7Y0Sfu7uxnt/YB/+0DDl2WTfekPqJrAYDuGlIFwIYiV+thsrlc+KTf7KwlpPs6oo95LjzQ7by5NLSF3FAqH0xDNIzgYOKzY9TRCLhbWw4fcWwTnb7IK9kH3/aw4yHrbGZ7p0WEVBYWK1IPyQV8QFmGUKq3kaVsOKZmsr7LTKjoEnBxkxn8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JeBECU8nswMipqWqN6UcFTyGbkU37Lwfu5LhzgslvY=;
 b=INOxACipYxelVgOgwc8GPsnfxCCLfTPMisJ4peXNGyaCBq4rpGHmMNZIBl8Lbs/vt5h3da38eNCMkqWRE/zdHr4Q43CcYSnoW+3s+50sEbuWw1kVAD0gzWKTPkfo/u/mkbus6t59RbF+rZfXQykpZ3JqmOxkcDxJVwlrfzLsH7dIO8klPyOUTh+vkpvNwMnHaMd5CHbYep0PZpGMkKJsFaF6sG7FjtA3R/QtnxOwKkFiLsrcuRVlOUvHBR6/1aEblTxIXtASwKdiUrtq2AlQ9gIhB+pElaUw8W9ty8eBuPhcSUInkcxlg62ApG0NjBO4lbYcCr1M8P9Xkbqmf08Aow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI0PR04MB11747.eurprd04.prod.outlook.com (2603:10a6:800:2ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:54:45 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:54:44 +0000
Date: Mon, 1 Dec 2025 11:54:36 -0500
From: Frank Li <Frank.li@nxp.com>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx93-14x14-evk: Add bt-sco sound card
 support
Message-ID: <aS3ITHKoLF0ecw2o@lizhi-Precision-Tower-5810>
References: <20251201065844.3823323-1-chancel.liu@nxp.com>
 <20251201065844.3823323-2-chancel.liu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201065844.3823323-2-chancel.liu@nxp.com>
X-ClientProxiedBy: SJ2PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a03:505::6) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI0PR04MB11747:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f9e2276-52e4-493d-1f4c-08de30fa541a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FePCNsdbn+AbChJFWmZz0he4mxxxUqIY6hNlV90NzR4gGcpQVwkNo8jmJjXu?=
 =?us-ascii?Q?tK4vGciVIJSBuFUxA/juRfwnEiHNA8JECuMUm4G2+7NxxvEd13vQuGhJbE90?=
 =?us-ascii?Q?+JMXEOEKUkSbL660LGgb7KvbFkEensuNeYlq0RI7ox0bNm5QBsvSr0pktUni?=
 =?us-ascii?Q?BrGWryX9FEVHrZ2ej6I6bfaQYM58bhhrsNX6d4I/ifX1uOyc3c+y7oVLSbCF?=
 =?us-ascii?Q?I5kSIcTjhDKRGhH+Z8dR1M9FbMLQxQ8gIeVizXPPW5WzC1dBid2QgraWlrH8?=
 =?us-ascii?Q?a+J4hafRp82SNgzeFAAnw6Vs/inCuSpz5UlgRV2hfnJ4XdVwKL0ACibCHFBw?=
 =?us-ascii?Q?ZJvTf/mf4hyjJMoGAfxRg3Imnc+m18m+5FYCSJBZ+z1WpBX7K5KumB27yQNp?=
 =?us-ascii?Q?WjwXxCpF5T/kL6Vd9XPgrteadHi06WkeYGDm7bN4hs5ToJFrqB6uaXzWBP2/?=
 =?us-ascii?Q?De+KPdRfmZYKqRvumMs7PtWgKnshpH+LlaANij8P5yDD63W0QGLewDOEhLTR?=
 =?us-ascii?Q?tOVvgxutXAJjsoWXxpJrjZYP4zi+fMsr92B2y/DqALEoEJCvCn/Y02AUu3LS?=
 =?us-ascii?Q?IcEYlsDj+N6NQFbfOwLiIfz5mJyRqyXZXDwphTVEoe1PoQNr27lY6cUsee17?=
 =?us-ascii?Q?E5hyVlyboIUsmFPepXhm1DVkiuO0K5r6iMWmAtIfZXsUHpgV7jvkcAtTPZno?=
 =?us-ascii?Q?mSYgEuf/PRvXfoy93CypazfrB+F7/Uhf7rSTC7xtAS6ZeUlsG8wNvQ792ttU?=
 =?us-ascii?Q?AL2QukfTGQCeU2YXS/fmetQrkWUmXlPovHwkxDm4SuTwl508qDl1Fm4LSlJq?=
 =?us-ascii?Q?DeSlbVF+HeY1r10FS0VIhtdliUTw1m7M/EIYQxAC+UMXQwuwSBw6uwNbxerk?=
 =?us-ascii?Q?VPMVoYo4rHxXO6fqVxLKIRYNjplxPCFmixP4X4TzKcrQU2Q1N5TyHaXj/xnR?=
 =?us-ascii?Q?Afv1sOh7Tudyz1crPYLsHFA1s6SYoVWO5IWHTVgDKnGcnKFRSm9LqbEpb3i0?=
 =?us-ascii?Q?HGJKK5B8lHzkSzcH/IlNKiVGt5jp1iex4amjkBmjv2PEa0kcuXVoyqLHcKTs?=
 =?us-ascii?Q?RdUkdYyiFSJ0yrglBp3qwmeOOOQqAMK1qqc8qJJvktvGw9KwH0Npftu4IW6y?=
 =?us-ascii?Q?2XvkLxDyjDVeVYxsiAFW0Tajs0i2Wu8qBLFITTC8gOCFcHsd6RwFuPCeK9yE?=
 =?us-ascii?Q?L/eVdhp6Nh88XHFY+RGl/gTFM31yeUyGo4N+vXi5hp4lUq+BkxzR8XWQPriS?=
 =?us-ascii?Q?5xqnSLxPtlR4/uZuTW+dpJQ6aVzLnFHMphCIQk/hjCpnDm71Q/l2uLGU+7Ug?=
 =?us-ascii?Q?WV4lQEhhEScg9wwb4l9t7elqIppEj1lYgY3if6uVqGqh5DNSi3VJhF26me0w?=
 =?us-ascii?Q?hLwzvKiKDQlQoB+QrnAj8OlqypWWXMo3BhZ9e1tZIedRN9Bm88TfcP6sLsRM?=
 =?us-ascii?Q?zhrAuyP7e/G61fPkY8n3C84zvZ/LzE5haWBFu2pvbiDh3ZmPAPYSPgupIHoI?=
 =?us-ascii?Q?3f1EdfsC5X+K0904eRw3uGfF5H+x2rdypZoo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YHREqL+vhdCR8KleBCqaqhfkCDUuZiTP4cVkN9F0mVhngxMwhPme9fiARvrw?=
 =?us-ascii?Q?e/chHj1P2n4TkTX3aA+OnbE0NGPGc0/nEy+sBDeX6hK+qe2vpE+MzSGWyZnS?=
 =?us-ascii?Q?PyagE8BONBknCLL13rq1o3tdcV5vcl+/0ah0SJQH7LYrzZHMMWODlHn8MW6M?=
 =?us-ascii?Q?5VNty03LLN6E94OkRjZd85zK4cNi2h4tzGxRkBA5yXOfIa2CXJ3pvBqHM73v?=
 =?us-ascii?Q?ra+/jd/L5haq3ccKKi9df6krZza9e46SfVqi3GlmySI9zh0HJiWLpOe8FKuC?=
 =?us-ascii?Q?p0Y2ftYHeLQ0+nC91C1cl5u/05tRaFq61j6DRDeoJUPBDNnwkXJiBWOA7wsD?=
 =?us-ascii?Q?gL8ZFYAJHXRec533kA13giXiYoXe2WlahqF97wjTJlh8SfjuHYMnmYp6AiQG?=
 =?us-ascii?Q?3/IRn8kwdd6hp6igCB9+5ZXxQ7tFSQR8A2xvUYlgQd/mTqpedhRfL36kwY2F?=
 =?us-ascii?Q?jtUAYSMt5CNoPudXXR/phvmNhiIGRH2CKVdhb7x9o6YvC1tm7FIzxGrQq9Rl?=
 =?us-ascii?Q?G8po5EJ0Cih9afI66MK1k/RKi6LXqV0xAC1z3Ywh7m6dlf4XOWB8jN3+/tzY?=
 =?us-ascii?Q?hW0b+1toFwC661IEq9qLOB8g7QBhybNIJqYJA+z1i5ROP80RsCaD4enBj/w0?=
 =?us-ascii?Q?LdZU0lnGVFzObO7cWOKySIRJeEUOaq3xYY9/zMlXBTnVbatgeHO7qNnWNnex?=
 =?us-ascii?Q?BIDBOg+6XX19uF+ixo/wlHr25mAYcKNVJGZz2Y0+8F0yXR5wh8LGehxN32wq?=
 =?us-ascii?Q?T1E0lsQuXeUJY3BvngvhwLYzKE7YrP6jPeVyi/CF2djIvqNUAZcVQbo8D9Vy?=
 =?us-ascii?Q?62V+i51H8nQ4du60ooEqlwc0W6jztgtK4L72K+FCxTJzqfLyTpLsRAqIpl9c?=
 =?us-ascii?Q?2mXCoweFI08rReft5N828DML5bseVYUJ/yV32QR3pXk7IVf+Y3CkUVVW1WTC?=
 =?us-ascii?Q?JtVlOvIJS39YRQYk40wf5AIYxi2bPds6Bry/vLZemVXa8805xRgZU/zPD8V9?=
 =?us-ascii?Q?DIXco+gjhXowpuZkMupbjAcouFHz2bmYFEhjNOv068i0Z3MqZhTfC6ReYIKD?=
 =?us-ascii?Q?86VBA7xqk2DBeRivClIZeA4uJRQs8tb6jZkiVKRijvxgzQbnH0JFKfNt76Ga?=
 =?us-ascii?Q?2C02y/V6QM4adkRYOxHNH92SysP7Y5xaM8JA0EAW64ZBLoH74kLiJvQVmMWl?=
 =?us-ascii?Q?lWdR4RsTmAgHnS4hkdWlXnxf+mN99rDCobdtOjYoV0HjYu/4jz8r+/Hyv5B+?=
 =?us-ascii?Q?JV9ORPBmYPQVjQd7xYgtpRl923N13I13QDYDJ1EFGvx+nmcYO2+5jWYkBRmw?=
 =?us-ascii?Q?S9H7U5h52ySF+T2AirWUpOB4me+ohEKhzq/Rlu1oQXincMHzwpfFckj0QqJ9?=
 =?us-ascii?Q?/Ze8H3fM1f09zTr7Dmg9yuQ7B5BLplXDntNeIMa9qps931wJuZrXNFhuODVT?=
 =?us-ascii?Q?sBrG1SjNf0impT/R7R9BTJBQYtcjTeUdwM3RbftLl2D4aKXtbi70Njg9ESxI?=
 =?us-ascii?Q?s//mYuiIRZ57yuHTDixFL7vq1pFQuGwiRBTjfVSat5fRRN1KsyzmgYdFyPxg?=
 =?us-ascii?Q?2U7uFGr0vw+pdAj0cwA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9e2276-52e4-493d-1f4c-08de30fa541a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:54:44.6804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rmDcdDvjPe4r6EYmLKib3F/dhQXx8jW+qjMzfiWG9ahaGheyq+VO0qnQFBktpoUIrkaNWJ7Yo4XxnKytOwGEIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11747

On Mon, Dec 01, 2025 at 03:58:43PM +0900, Chancel Liu wrote:
> Add bt-sco sound card, which is used by BT HFP case.
> It supports wb profile as default.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../boot/dts/freescale/imx93-14x14-evk.dts    | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> index f9eebd27d640..e47fee24471a 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
> @@ -27,6 +27,11 @@ aliases {
>  		serial0 = &lpuart1;
>  	};
>
> +	bt_sco_codec: bt-sco-codec {
> +		compatible = "linux,bt-sco";
> +		#sound-dai-cells = <1>;
> +	};
> +
>  	chosen {
>  		stdout-path = &lpuart1;
>  	};
> @@ -168,6 +173,25 @@ reg_vref_1v8: regulator-adc-vref {
>  		regulator-max-microvolt = <1800000>;
>  	};
>
> +	sound-bt-sco {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "bt-sco-audio";
> +		simple-audio-card,format = "dsp_a";
> +		simple-audio-card,bitclock-inversion;
> +		simple-audio-card,frame-master = <&btcpu>;
> +		simple-audio-card,bitclock-master = <&btcpu>;
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&bt_sco_codec 1>;
> +		};
> +
> +		btcpu: simple-audio-card,cpu {
> +			sound-dai = <&sai1>;
> +			dai-tdm-slot-num = <2>;
> +			dai-tdm-slot-width = <16>;
> +		};
> +	};
> +
>  	usdhc3_pwrseq: usdhc3_pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
> @@ -371,6 +395,16 @@ &mu2 {
>  	status = "okay";
>  };
>
> +&sai1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai1>;
> +	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> +	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> +	assigned-clock-rates = <12288000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
>  &usbotg1 {
>  	dr_mode = "otg";
>  	hnp-disable;
> @@ -568,6 +602,15 @@ MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
>  		>;
>  	};
>
> +	pinctrl_sai1: sai1grp {
> +		fsl,pins = <
> +			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK		0x31e
> +			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC	0x31e
> +			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00	0x31e
> +			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00	0x31e
> +		>;
> +	};
> +
>  	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
>  		fsl,pins = <
>  			MX93_PAD_SD2_CD_B__GPIO3_IO00		0x31e
> --
> 2.50.1
>
