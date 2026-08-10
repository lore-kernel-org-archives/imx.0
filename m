Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB48347BAF
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390799; cv=fail; b=qJFwaLn0Q8Yj8OLMR+oRThH/upCIE+NHmfZqGOXsRGW1OnSAZF954GqSHsntCApLmT7+pTuUP4IzzsLaLs4ipdTb0moXLD4QBcDm1BtmJABGmFoNZfaeGarlwZTmOXJPjM9bQuiVLDGKAdfkKELTs+nObN+9dmz/9hyoOYo3FKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390799; c=relaxed/simple;
	bh=FgNo98srGzCpEXA936UN5KYvacqCYXaWz+14T8LXUZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fSY9LgQVRdJn4XPrz1kUt+C7KcCVnvw9/qPHBzfDSxCyEi8jHm5Fy09IFOuZ1gKC51He8ycs8snaHNofZiP1VZOlj9WZ+GE0ez5HHJWg6dmDC4ng2QCDte/6g3JJyp4tEZZD72n0kScuFmtaqua0scpwN9oUR8a8G3Sm5JDD5i8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Do+Bavlq; arc=fail smtp.client-ip=52.101.70.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Do+Bavlq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIjCJQZouaoxmdIqULg444XLLOmZnUKiC+2tEZthdJOSV113uQDHoGtcGxWcMyiUE7JrR4Tp7RA1iN1ZKLIuTi7MkNx8wlvTsoiq/oH8b9DBNFxfh5DkgHS1YToLdAcL8MkJcCedilMQDa/eNt6o+iYKkByjSxbHvo2ksVutepxKWw2iD6XxEDiyC5mup89Jw4TNXnzwdukyFB+4GFmZ4hMwc4v44+NjYLJi0KKZHtc/f/IYVbqyB8OeYG1dQ85n+FYidr5w8X8RgZZGYCI4kUMgR6RPCakUDYTJ/v/iw9id8JjWNq5JdJxbXheZfkFpXzsO3Z3vPKGg/4jxEg2Bgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdysV84CF/NOnCecyKiNjJn3RfCdXDKOd+Lo5AEtBcg=;
 b=h3lweUg0kW/JfrGv2biSwBVsGsQ3aeasApImP79Z6pzkrlMhUHiLM7Ywv5/3dxKrEZTl1q81QVuqjhOPXUGrXi8dytPDiHap1kch+3NuX7OzrZedh11/vcr/f1hHj9g9dsivrMjZkHBXstsW1qeiTj8m51/LwSvSeqcBiW3A4ttxJYltj777Wfs6yLPgEFCY4s7OsFFV3vyHrIgqtPV0rAtZ30h5e9HlbD/PMwFwAetL+USq8DntXpHaAucFp+Ljq4McXEzRkSR+LUFPbLitE0Q8KPOVKhzFu4RgPgDsnFcvTEAfzCuUUQq4AHalgg2LLUJUuhuQ+vDIJD+sXkyf0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdysV84CF/NOnCecyKiNjJn3RfCdXDKOd+Lo5AEtBcg=;
 b=Do+BavlqFOApFwAs9bWrYTz+UDc9JBY8NKcAvSLaIvGSFtQr2LX433WuiMF0OoSBmjlJrGVhg+4Hu9j53OJobpFElDNzpSiBrjM2kiGY1RiIF77Fqr9tE0QBqpGO7Go3Xppln4ZrZxBvvpqgVIYe16KMobd77t6VuTIF7Je7Rzcthx3QQM9HfYi7O1sILDhCH5yjJErCWypsYeaygEkpwwH8iz03ldsUEEUjCdw2IUquQ2DxVoNusOFYKEFZ/UZpR1XawbrxcyXmi5vlBp3+7ImVsd8IT+BTI92GG6r9Yjs/6hIs8eihgVrwEBPbCGc9Ja6hvXXsjcHCblYXFZmN3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8986.eurprd04.prod.outlook.com (2603:10a6:20b:409::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 19:39:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 19:39:50 +0000
Date: Mon, 10 Aug 2026 14:39:39 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Rudi Heitbaum <rudi@heitbaum.com>
Cc: imx@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: imx8mq-phanbell: Enable the rt5645
 analog audio
Message-ID: <anoo--OdviQf6liI@SMW015318>
References: <cover.1786177290.git.rudi@heitbaum.com>
 <7b0c26c6741c64291e03f668ce961c47cbcb0772.1786177290.git.rudi@heitbaum.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b0c26c6741c64291e03f668ce961c47cbcb0772.1786177290.git.rudi@heitbaum.com>
X-ClientProxiedBy: PH8P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8986:EE_
X-MS-Office365-Filtering-Correlation-Id: b23f1eb7-1e8e-4210-be7e-08def717240d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info:
	ZS0EYT8ItTAsjfZiUOYb5Fri0o7z88vp5MuXA1GDjpPaPGjOl+Jx8Ug6qljSzBlVy9zR1e1sGj15it2EKOlXx/1XbDKyrjyRmy0zYz588XPs7y5FllOIVxe0BUODOI7LPzRHG4EGx36m6KICnhHjfYw4+v5ZaL6pPi3G3wWDp064K3EfC0emODnpYRPEFmp3drjdItOfdoJ3R1K4WtKBFCpWI8ulUwCrkOYCStWIVrpYt7KL48upJI/oNuKu4Y2gAohERN6F1c6X8g33XyeFd8+CAFAIkCKko1fu0KyzJ6baUYBouLkQ2KhdCU0cNQIsI52/oqbUW+yMn+8nk63+bmJnDNVeb8WoVqUPHRF6v7YiNNlmTbRP5+gTuF7hhSji94qbHgYZ/+5sqJ8aKLiEE8mj7JCJbSOZTiDCZgnV7+zXiJ29HqWuCV5CS8RTbjzNsYQKwZCslLyUHXJzoOoNzkSdRJRtVefWi5CLhRNwXtnbgbiMrdFswaPED5qwGrqMypFaueXV6XtV6MJM9ZXTwEBXi6TkOcbNC6JfgCbxLA/4Dwstnrnaq66RccwlXll9dDmxyJNVeSO0W0Y6TF2hFLNhWOMfzdb6VSBOPRQO1x0T+nb0a3BawQ180HdNr3hyCu4tTwNsVR7zjea9Zs6qfPcCVyma2ia5M4Q+EuEuCys=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jIjc4/NCLVoVpT9YYzRzA1FtKzFo2rk1Tuw/W9PfJ7M+8RZM/3dM1m/kIvGP?=
 =?us-ascii?Q?yytgP8S6g1YTBslIiqRhAxq/F0kpUveKGvZuPNYhFIRQAgUVxbRh6aGYZxbZ?=
 =?us-ascii?Q?OX8pWCNPr4SjXA8VNlFt1fCo76cGjKiuUsHoBSGxP1EiBwrnJuRwA8A806wC?=
 =?us-ascii?Q?J5wNfEE03EQPDEIYLZ+8eyjwsNvMAlgy/zeilxbUSCJcsb7LgF05E8uN8kyG?=
 =?us-ascii?Q?K55I1W/WKXmm0HArUUatdmVH34/wDX7rMywkacrniirnsAkAhkOdT7jwv9Pf?=
 =?us-ascii?Q?iPY9TL6Kyd9Wq8sK4goeB+B3Rq1LyRox/joegMHzFfdiVzqWhpv38CVNnQyJ?=
 =?us-ascii?Q?h5O8SwKWvlxhopGli3/qK5YdwMDESx6/GSztyj6BzUV5bepKBL5bWiHopGg2?=
 =?us-ascii?Q?gJ2bl//PmVdh80fVvCvXVnp8TJ9j6hFqVaaEJaQ0KYNehvnDGEBN6WddhzWI?=
 =?us-ascii?Q?S4hR3gFiC8vdOe3ajOTCLY+deGXX8BGE4IELKzXIOCynMpgcLGgP6/wwU780?=
 =?us-ascii?Q?Zj7CnCzBGkcrZEdcm1ert0rbePe4AfPCpOPSICfuZKQtstrZVEzvaf8hWqC4?=
 =?us-ascii?Q?GuPZlYY6vDD9GjS8GoUmzCMesUmO+PnC0CauL80SNi06WO1uKht2P6+t7QrX?=
 =?us-ascii?Q?UipI3AYulGbUwVlQqOboVDpzhO56HaINuk4O2NVJYdo8fxO8d/DmxHTw14jt?=
 =?us-ascii?Q?bNSp2Oi+Epx8AvUNcMptMrSoPxQjuwE+QX9q0Rf/6EVZucXwIYWQWKt8vtAn?=
 =?us-ascii?Q?oUcbJtcTkApLBg0wuyuwGpWgXgJ5IDpbpxeUOtEowBPu56WUD4viUnTQrerq?=
 =?us-ascii?Q?pDl88rtO81EPZKLlEnb7dRveHlolptoWgvVzKjOh5H5s0ZakEEWnQxy1i9Ja?=
 =?us-ascii?Q?yEuuYs/JMlUyM66AUcQksU9vduJKdIqIqZ1z7Y+31CV0k0Fr7DY5FybP6Pk3?=
 =?us-ascii?Q?R11t+BPZzpZ7cwX0pbrpcrHctxApFgBONMKuhNXtA+dDxWPKwp4OoalJnRBp?=
 =?us-ascii?Q?y+U4d0aqXgDJv934OeUkvL9qD3+zgtVCizjhD7yJ6+8j6B1u1MSRIveKU5SQ?=
 =?us-ascii?Q?1iVZ15723R/U8ulWWYq50BEYw//YosYdc1E3T2XLF+6++abdiBFm+I/qx+un?=
 =?us-ascii?Q?1eGaDg1dhwN9lPayQGe4Cnmo2UeYO/35NojL5F8D2ZJK/avnSyA/p3MPZ7Cb?=
 =?us-ascii?Q?C416y/i2k6ujq/meo2bqiTF0LGfrvl0bDka2xufnqU+fCNR8MeEaHdBOsvKa?=
 =?us-ascii?Q?OFvhGIlzZsjoytO2c6oXS6hd4ke2pd5eNOyXJ/cT+2meseM8dTOlC4Mkd24U?=
 =?us-ascii?Q?7ByMvDTfXbOHH+gMj11lGsUzoUfAKHvnAmUTmMbAGRefPB6T/H80LlNhq0Ge?=
 =?us-ascii?Q?dgzuvf32KIhSR2sibSN0J6FzvyC4k8JQVgk6jDjhhFqgpz8i/FawbitIqJts?=
 =?us-ascii?Q?cNFFSW7D4oSvIHbXRtqU7E6jxZkjtwJN4Q3Y7ijqEO7uGYcuc5QFWR3J7/lD?=
 =?us-ascii?Q?cDDLVKH1C8Kb0d6GYaK3mf4LkXK/84uZmRcQWLZCs4K1Y5SDtDZGmpivfuEz?=
 =?us-ascii?Q?lZPoBg9A3LVRkySGyyvT7YJUPHts/LuXhuHHPSCa4pAG53v8Xc4uZCp+SgBR?=
 =?us-ascii?Q?c4elX/OUZV1beDIrkm++sF3vF6fwO35bJgsfMEcDr9dfm8vagQrpL7f5/2UO?=
 =?us-ascii?Q?hUJziXhj76WTTnoxN6pp7uCafGM4CZw7ORB+7g2k5hv7LL7/Srk3B6c4jgiU?=
 =?us-ascii?Q?yKyoFoAdB8ILaLBz0wj0WUgGVE4flmYV/U5R4rgZ+JRz+H0l6wVc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23f1eb7-1e8e-4210-be7e-08def717240d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 19:39:49.8964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAnaBj7wdVoYbrSGb5HPrf53PfdWr+OUM/KFXSaqTb0fwsxjWCxwJZ4t6H7T7bVG1HVtOhIDeoo1PiflU/QC3mOqmtuKuRvpH0ZMNoBf4C7QxXgUGtkB9HQbFo9L7l53
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8986

On Sat, Aug 08, 2026 at 10:14:27AM +0000, Rudi Heitbaum wrote:
> The board has an rt5645 on i2c3 driving the 3.5 mm headphone jack, its
> microphone and two on-board DMICs, fed by sai2. The vendor kernel drives it
> from a machine driver of its own, so its devicetree carries no widgets or
> routing and the graph is rebuilt here for simple-audio-card. micbias1 is a
> supply, so it is the source of its route rather than the sink.
>
> GPIO5_IO4 carries headphone detect and has to be muxed away from its reset
> function, or both hp-detect-gpios and the codec interrupt point at a pad

What's means "muxed away from its reset function ..."

> that is still SPDIF_RX. Leaving realtek,jd-mode unset selects the mode in
> which the driver takes jack state from hp-detect-gpios.
>
> Pin the slot width at 32 bits. With none set fsl_sai_hw_params() derives it
> from the sample width, and a 24 bit open then asks for a 2.304 MHz bit
> clock, which is not an even divider of 24.576 MHz, so hw_params returns
> -EINVAL. 32 bit slots give a ratio of 8 and still carry 16 and 24 bit data:
> rt5645_hw_params() only writes a BCLK-to-frame ratio for AIF2, so on AIF1
> the codec ignores the padding bits.
>
> Declare both audio PLL families and system-clock-direction-out, which
> 44.1 kHz needs. fsl_sai only reparents its mclk between the 8 kHz and
> 11.025 kHz families if the node names them pll8k and pll11k, and
> fsl_sai_set_dai_sysclk() returns immediately unless the direction is out.
> Without either, 44100 stays on the advertised rate list while the mclk
> cannot produce it, and hw_params fails.
>
> AVDD and CPVDD are required by the binding. Both come from ANALOG_1v8,
> which a baseboard DC-DC supplies rather than the PMIC on the SOM, so a
> fixed always-on regulator is the only description available.

Needn't this, patch show how AVDD and CPVDD connect.

>
> Route "Headphone Mic" to IN1P, the pin the jack's sleeve reaches. Without
> it only the micbias supply route exists and the microphone input is not
> connected to anything.

Can you try keep commit message short? and leave summary of what your
change.

Frank

>
> Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> ---
> v2:
>  - add avdd-supply/cpvdd-supply and the fixed regulator they need; the
>    binding requires them, so dtbs_check failed and the driver fell back to
>    dummy regulators
>  - route "Headphone Mic" to IN1P
>  - no clocks property on the cpu dai, deliberately. The fallback in
>    simple_util_parse_clk() picks the DAI node's IPG clock and
>    simple_init_dai() sets it as the system clock once at card init, which
>    is meaningless for the SAI but harmless - hw_params replaces it with
>    rate * mclk-fs before any stream starts. Naming a clock instead makes
>    simple_util_hw_params() call clk_set_rate() on it directly, bypassing
>    fsl_sai_set_mclk_rate() and the PLL reparent, and 44.1 kHz then fails
>    in hw_params. Tested both ways.
>
>  .../boot/dts/freescale/imx8mq-phanbell.dts    | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> index 2d134eefb765..af4b9d266451 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-phanbell.dts
> @@ -37,6 +37,14 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
>  		enable-active-high;
>  	};
>
> +	reg_audio_1v8: regulator-audio-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "BB_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +
>  	fan: gpio-fan {
>  		compatible = "gpio-fan";
>  		gpio-fan,speed-map = <0 0>, <8600 1>;
> @@ -46,6 +54,42 @@ fan: gpio-fan {
>  		pinctrl-0 = <&pinctrl_gpio_fan>;
>  		status = "okay";
>  	};
> +
> +	sound-analog {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "Coral Analog";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,bitclock-master = <&sound_analog_cpu>;
> +		simple-audio-card,frame-master = <&sound_analog_cpu>;
> +		simple-audio-card,mclk-fs = <256>;
> +
> +		simple-audio-card,widgets = "Headphone", "Headphone Jack",
> +					    "Microphone", "Headphone Mic",
> +					    "Microphone", "Internal Mic";
> +
> +		simple-audio-card,routing = "Headphone Jack", "HPOL",
> +					    "Headphone Jack", "HPOR",
> +					    "Headphone Mic", "micbias1",
> +					    "IN1P", "Headphone Mic",
> +					    "DMIC L1", "Internal Mic",
> +					    "DMIC R1", "Internal Mic";
> +
> +		/*
> +		 * 32 bit slots regardless of the sample width. sai2 divides its
> +		 * 24.576 MHz root by an even integer only, so a 24 bit frame at
> +		 * 48 kHz would ask for 2.304 MHz, a ratio of 10.67.
> +		 */
> +		sound_analog_cpu: simple-audio-card,cpu {
> +			sound-dai = <&sai2>;
> +			system-clock-direction-out;
> +			dai-tdm-slot-num = <2>;
> +			dai-tdm-slot-width = <32>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&rt5645>;
> +		};
> +	};
>  };
>
>  &A53_0 {
> @@ -272,6 +316,20 @@ &i2c3 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_i2c3>;
>  	status = "okay";
> +
> +	rt5645: audio-codec@1a {
> +		compatible = "realtek,rt5645";
> +		reg = <0x1a>;
> +		avdd-supply = <&reg_audio_1v8>;
> +		cpvdd-supply = <&reg_audio_1v8>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_hp_det>;
> +		#sound-dai-cells = <0>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <4 IRQ_TYPE_EDGE_BOTH>;
> +		hp-detect-gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
> +		realtek,dmic1-data-pin = <2>;
> +	};
>  };
>
>  &fec1 {
> @@ -295,6 +353,27 @@ ethphy0: ethernet-phy@0 {
>  	};
>  };
>
> +&sai2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai2>;
> +	/*
> +	 * pll8k and pll11k let fsl_sai move the mclk between the two
> +	 * audio PLL families, so 44.1 kHz rates work as well as 48 kHz.
> +	 */
> +	clocks = <&clk IMX8MQ_CLK_SAI2_IPG>,
> +		 <&clk IMX8MQ_CLK_SAI2_ROOT>,
> +		 <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>,
> +		 <&clk IMX8MQ_AUDIO_PLL1_OUT>,
> +		 <&clk IMX8MQ_AUDIO_PLL2_OUT>;
> +	clock-names = "bus", "mclk1", "mclk2", "mclk3",
> +		      "pll8k", "pll11k";
> +	assigned-clocks = <&clk IMX8MQ_CLK_SAI2>;
> +	assigned-clock-parents = <&clk IMX8MQ_AUDIO_PLL1_OUT>;
> +	assigned-clock-rates = <24576000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
>  &uart1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_uart1>;
> @@ -383,6 +462,12 @@ MX8MQ_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x05
>  		>;
>  	};
>
> +	pinctrl_hp_det: hpdetgrp {
> +		fsl,pins = <
> +			MX8MQ_IOMUXC_SPDIF_RX_GPIO5_IO4			0xd6
> +		>;
> +	};
> +
>  	pinctrl_i2c1: i2c1grp {
>  		fsl,pins = <
>  			MX8MQ_IOMUXC_I2C1_SCL_I2C1_SCL			0x4000007f
> @@ -410,6 +495,16 @@ MX8MQ_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x41
>  		>;
>  	};
>
> +	pinctrl_sai2: sai2grp {
> +		fsl,pins = <
> +			MX8MQ_IOMUXC_SAI2_MCLK_SAI2_MCLK		0xd6
> +			MX8MQ_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC		0xd6
> +			MX8MQ_IOMUXC_SAI2_TXC_SAI2_TX_BCLK		0xd6
> +			MX8MQ_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0		0xd6
> +			MX8MQ_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0		0xd6
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			MX8MQ_IOMUXC_UART1_RXD_UART1_DCE_RX		0x49
> --
> 2.53.0
>
>
