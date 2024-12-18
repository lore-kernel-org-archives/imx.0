Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2061.outbound.protection.outlook.com [40.107.249.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98D11FA8C0
	for <imx@lists.linux.dev>; Wed, 18 Dec 2024 18:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734545225; cv=fail; b=mm5C1I+7Cg5mOkp5XBrKUZvb+I3fXj1u9h8GT4YqoYECdzDk8y1R2UeU2N3mk2kDMiDwLGBLL9qaDlx8eCvXm9sBI8G1y5kB5c0U2LAzPUVXyl+CzykBjG+21n2d0SgPwvMvufzPYiMtVWiCCNCbznM60oHlG4SJlhdgv03ORhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734545225; c=relaxed/simple;
	bh=vvG/8e1IvMt2V6zwUvOKt0ekeWlaOZmrcMr2kycA2Lc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CNuHBsAv36U+grSiLAq0Sdt8hMtvaNkR1pCSGK2CBAZtRxFfKQPAeg9iOFpEuaGfFjoLClVa9ZJHxo9CYXnjkhg3/yfImyLoNlnk/hCh/S8f2cBK819dDreb/5buVzpgQzjkvRgTiJpk8+6MFADt0sxec0ddRYFAVB8247I1prY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HY40S8qF; arc=fail smtp.client-ip=40.107.249.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HY40S8qF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxfmrpytJnUj5BtSf2yv/CCLxZOG4Bee4EI4MLKULUTnKnSCyD3pKOml6O2ONLDmiKrfmoFxyw6auNt3hB/vTFCkgLoxzxhram3OuE3rmUsIpmcNPzsZNYrnKH5SxChwM5QBiFkGbrrDP3il5xlRHMTn0ataxwb77EeQzUc2Q/KIEWgL/swoSJ6WEg8dUiox21jLBn1leFX5nGVi3XfKwnk7hN4YVvvk/3xcfr/WWMFIjXFpI4YDyHqb5oA81CCJADD1PfcazMKvBX0oraC4Lptdy6avfXaFpXEYFsqqsJzcdeKm9HnXf0gnjiINazPyH1K6OV8WygX8IwHeN6aZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOvBOY56CvV9akIu9o8666WpzyACQCMyTaaa1AahIXY=;
 b=uyPFgYtw0CaffgtIS049oPPsdYT11V2zHgPJoXp8NhZSJFFgjNGpJFA334cHTjk3705YKzYp2c+JKnL2E8M0uEx6smir5Xw6LxzGSSTGrvBOU1c1LtIo/ssMRADEA60i7B7DMOQpeO0XXIBkqaaoePQ+npIEZaeEtXaPuymelMAgTVvxyKOP37YDNQ0KGp97eMos8ZO2WMZi+4XhzJ0lncYQ6G3mZ0Mi3ptkWMgOX2Z5RD5lzgsPg7XbE3wXinRAAql66CqcTBMu/4j7kG4hMirH/OgjoAJWrCmqasTPeXf140IOSd7KqFAtMpEIdO5eKS4UOw1vermOLKwI1G+4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOvBOY56CvV9akIu9o8666WpzyACQCMyTaaa1AahIXY=;
 b=HY40S8qFSP+puG0e6BnU8ajANn9j3/UYYxEXbOzt5AhBxuQKH+NzmMbjEcAuawPJFP/tMTZg326OIZShVUbFCyxximPY3+DO8YfBf5uLcBtMfnH9nJAskY8SwrAgdJ0asfPAOueFU7ptqe5eo04Gr/acO9+CqSeLZpOloN9vKUvNvL+cjG0O43LYcIKBICft5xNE0LsA1JOwxHouXTT0w6yTS6SkDd4vaIa/1RcbVlV8vQxhHej+prTwjjrA4fCsVQ+QCnVb4kG4v0VP7YEVj4XPt3+eB4AcOAV24D0OjEskgtfj3kczw5wi90HOhmImadbpufj2cq+kysa0Dq48Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9057.eurprd04.prod.outlook.com (2603:10a6:102:230::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Wed, 18 Dec
 2024 18:06:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 18:06:59 +0000
Date: Wed, 18 Dec 2024 13:06:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: imx95: add NETC related nodes
Message-ID: <Z2MPPFZ9hETCXfVl@lizhi-Precision-Tower-5810>
References: <20241218061725.1608466-1-wei.fang@nxp.com>
 <20241218061725.1608466-2-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218061725.1608466-2-wei.fang@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:a03:333::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9057:EE_
X-MS-Office365-Filtering-Correlation-Id: fafa8d2b-f4c9-4f9f-1d8c-08dd1f8ec452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?acOFkoSsmP0j7mxpmm7LiO/a8rRigdwAnHhHtf0qkNZ5F0btJ3JMnyU5wRhh?=
 =?us-ascii?Q?tU6vMO8GurXHsd4fShE1xrnyf79YmQ8LnqBveiWZTOExGKAAYx9fYXV/dqS8?=
 =?us-ascii?Q?Jw1ZkRssj5xv6O6cSub5ZXqHHbKDO8Xky4cz1ZLiUiJFjiYlPHqOw1enFBHk?=
 =?us-ascii?Q?3MHrZYqsDc2ILljF5sbK3K52HF8t0lhRvvldJrNA0LicxM8rZL8S79N+ATzV?=
 =?us-ascii?Q?9IXDxPYNPF1HGEYB5zyZlGZLukDP5h0bLeIK9NpZ/vLX8jP7L9UlkTF9VdCp?=
 =?us-ascii?Q?rQ+SoX2DbsKEmD8PkD7EN9tLDAvHblekLYt59ABhlI9pbnpSSMhfMYd2WM8K?=
 =?us-ascii?Q?7Er8H/TF5EN4KArCTxgmQSN0zYfuxriFUNN3SMppHbgB4HK0WDxBJfoc7vr3?=
 =?us-ascii?Q?qDRsok2ukAS1WpUp6XIi4VNgY5s9Tqx9oy61PYeL28YApZ0WDkZAOoq2+DI7?=
 =?us-ascii?Q?kL+W5g2ce6iKZBFVbIYDP41y/q1wnlRzS1B6ENwf9Gin87ED4JMsOmfp868l?=
 =?us-ascii?Q?L8nXf4ihSxZ3QIJA3QClB56M843+6zXySKJFzNaw3/y3xef/PshW36bBmhe7?=
 =?us-ascii?Q?DBNXv9LK4ZdNl3atVuS6Fn/sn8m1QGgJuoHKfxaqG7jNRGI9Bq4AaZqynn6Z?=
 =?us-ascii?Q?WJEOv3EEZm/fengk6lOyMxYBqTsEXcNkcwS/VwjwodCFAuudus0HlW06oOFg?=
 =?us-ascii?Q?J+6we0xmeqgkMdJedMZunSI9Nx3Ay9kEsepLV/irX/m5G4FQK6UOaq4KNyD1?=
 =?us-ascii?Q?MTm7ATA5wzl9Z4HKYLZe52rqCxE7e5oElgYslm1LTMaogjB2p+5gwbbzDmAN?=
 =?us-ascii?Q?ZZdmosOIZNrUawQS1NiNqj5pqmPE2t3Ihqlkm8yv+EiKvOHHwU16iavIjhTa?=
 =?us-ascii?Q?Ip/ydKx69/KqF4H2gbd5i/Rgt9hbYxwl8UNT0OgMMdD5FUwYwIpNyKvCtlsu?=
 =?us-ascii?Q?eZ5k3fMffuPQ+0BmIyZG/rDgxSg6JkRwiYS4SQsxYmnztUaFWHFcI5Sc0v4B?=
 =?us-ascii?Q?WUvg3CioN7hSE9TOUwksixkeC3SD3IavDFa2Srihpk5TZnn99Ew2hEHdXkHZ?=
 =?us-ascii?Q?03ZXMzSR88rxgFsET78k5kQt4hOpzj3cUp5bY4Q0rFrtbsOLTU8cb48yUJY+?=
 =?us-ascii?Q?5B28jS0E/MmpLPyV4t5UwhzCrSNwvgBhSt0azJf8iu2hXqSotRRSWW37q6vC?=
 =?us-ascii?Q?fBbU1OUGehxCMy9xWe55cM45LyuL2QI9BnBNT77dsyhZVXaFG3Vv2HnqGdLc?=
 =?us-ascii?Q?lr4X2lD15Wjv1RMH2iqMBMBeSbUsZe82Yy9cunEb1Z8CgZFbbHUaYD55Fa76?=
 =?us-ascii?Q?4jwr/sIB9U9L8xv7CGepVle4iDUDskl7KA3MKgdh5MM7HL1BI+jn0HZ+axOG?=
 =?us-ascii?Q?vJiTx5H1BhLggCalT+AW1oO50IXgqOhQceiipwNj0IAzalkkQH5/doQLvbzn?=
 =?us-ascii?Q?APqspkCu8jIxX6XLSz5cUBd5O5uKAgej?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DTa/EQ7COcc5R4As/qiFhxUVDe0da0JqpZUA9ur5ThHNEN/VnIBpc78hFn/H?=
 =?us-ascii?Q?fIUaaR1P222xJHzQZ/Wy0Aj3xKdFqOqWUkv2AjDSgJDJFCoUTikWHwgXuwMC?=
 =?us-ascii?Q?a49LQwILJJsq0+mXLxVXHL+nEQ68s08IeCGldkChXkh8/L5dXhczQaN8YAzf?=
 =?us-ascii?Q?ZB4RoCv+Fzh9baczj3nOlxOjYpoG7drKgrc0hGHVLLBtXG8e41pIvOWZkgvr?=
 =?us-ascii?Q?WMpKukc4vngBBmnQOOZIBZgM0CrdGybpOkx3QxRCFjQkXffEubs/mVz8Cw1k?=
 =?us-ascii?Q?N7ZGYzyXxe06fLt8685QmqaDLeWvXEUpMGuHPHuX5Wuq0qVWGhjOkTZt9Rgs?=
 =?us-ascii?Q?aFcf0bgyGamxMkN0y3My0GrdraObr3CfUT+meQGQ5UrEviPihZtoU2RgGntG?=
 =?us-ascii?Q?krMSAKzmdsViHofdZqf30wW01tc4LVjZtQ4X/LH2mR94VYSmPvDf9l+jioxi?=
 =?us-ascii?Q?SbEY+MB6E9WjRopeOXIgutJPR5n+36AW2/hi8XzCiw8ExN4xKZScvweLxcrj?=
 =?us-ascii?Q?SRlvbx7mMasSlk7E4A3zo1FfRNfiNv6BQQwZbHuve/iJ34bapc1E01pB6uwV?=
 =?us-ascii?Q?2E6Gc2eVt032/xEWnKY/eHDqHYNhLxrsvRK2xLDZkgD8jnKuDgF0kM/7HKFl?=
 =?us-ascii?Q?5MnzG83Eyc1JHptNKm6mH91GG2Frx9EkhtLS4Mu1CtgDOTZSqkmT7xbIgDdr?=
 =?us-ascii?Q?KMQFM01W6kv6x7o/v0uyGVgp3c+tZXs+7QirigYE13u57+rab4vkI/ySJaQc?=
 =?us-ascii?Q?etGf1STN6FCNxDPcOdaC+rrQ31+8Rlz7d/f/Q6c786POsBhJtOAaFcb+iQFy?=
 =?us-ascii?Q?BkoiM91GvwkR+N4vN5WatDdsyU3auM5meVrUk3OZQ8/OU2C23nXrRoC857cj?=
 =?us-ascii?Q?HuhjP7pAUAO1uIqP2RUxGG5lrhNleU/Edr6AhXPbmiYXWZqfB/Llw/JN3bBn?=
 =?us-ascii?Q?93TS9KMCmHWsUJxqNN7GL4SVijJHgmx3guNkYT9XiTl+wW91aDGMHWUE2Fv9?=
 =?us-ascii?Q?HdDgU56a5XF/thobF8HXonH9kKooqnxG96TWaDNnLb1AI0wFvyzCakuT+z0S?=
 =?us-ascii?Q?uwVc2lQfr/5sxGC+0qQgeUel07OeaZh1yl1ZO1b7iUmc65Q1izHIePDGUQ7o?=
 =?us-ascii?Q?qKkvrq7k99e1ek9eMpin66k74Umf3ecSb4iOqY6NhUsKZBaSVusBdWPGK48I?=
 =?us-ascii?Q?1BsgV9+mrobcUZX3IAb/6m6oZgxubF8QGNLHAIOzQAz69WkseKlrYLpxuyXv?=
 =?us-ascii?Q?AgeqnD5wiROw0gZUnWCR3ojzynlq+B8J2wvNIpy2K4w/s5IfCot1XzVAZMkE?=
 =?us-ascii?Q?aOAFXNkCiXAU5VTc45L9UuYdTSba7rK6pzzJSLmwginJJnYgh4l8PqjtMrfL?=
 =?us-ascii?Q?WhDVNcGkRLe0IWThowO/FqLR2krYTAPPG58sH+FwVbd1rVL9y42ArCoJCF7T?=
 =?us-ascii?Q?i10lorOqvgnBx3k+w1hMEyhUxsBncngXzHgVxwcqnvlAICiaCBrRBSzW1SYY?=
 =?us-ascii?Q?6OUGwcLGGXPJtrHe08sPguCWttbBj1fmo8y1lgGTZCzTkyvrMdWPDM+gLHqE?=
 =?us-ascii?Q?qY+/sk2HzIisINn8kTTDInQTdG5XSxZ8W/YwKUpq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fafa8d2b-f4c9-4f9f-1d8c-08dd1f8ec452
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 18:06:59.6967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rALMlCIQhw51bnuNk2Z9RyaOD6s9fwbOCNDwR5HE/K7jBp4SUU2xGf2SU1wTabLDztyBoeN2jr01FSHN2IyAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9057

On Wed, Dec 18, 2024 at 02:17:24PM +0800, Wei Fang wrote:
> Add NETC related nodes for i.MX95.
>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 93 ++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index e9c7a8265d71..86f9fed9998c 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1702,5 +1702,98 @@ ddr-pmu@4e090dc0 {
>  			reg = <0x0 0x4e090dc0 0x0 0x200>;
>  			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> +
> +		netc_blk_ctrl: system-controller@4cde0000 {

keep order by hex address value.

4cde0000 should ahead ddr-pmu@4e090dc0.

Frank

> +			compatible = "nxp,imx95-netc-blk-ctrl";
> +			reg = <0x0 0x4cde0000 0x0 0x10000>,
> +			      <0x0 0x4cdf0000 0x0 0x10000>,
> +			      <0x0 0x4c81000c 0x0 0x18>;
> +			reg-names = "ierb", "prb", "netcmix";
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			power-domains = <&scmi_devpd IMX95_PD_NETC>;
> +			assigned-clocks = <&scmi_clk IMX95_CLK_ENET>,
> +					  <&scmi_clk IMX95_CLK_ENETREF>;
> +			assigned-clock-parents = <&scmi_clk IMX95_CLK_SYSPLL1_PFD2>,
> +						 <&scmi_clk IMX95_CLK_SYSPLL1_PFD0>;
> +			assigned-clock-rates = <666666666>, <250000000>;
> +			clocks = <&scmi_clk IMX95_CLK_ENET>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +
> +			netc_bus0: pcie@4ca00000 {
> +				compatible = "pci-host-ecam-generic";
> +				reg = <0x0 0x4ca00000 0x0 0x100000>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				device_type = "pci";
> +				bus-range = <0x0 0x0>;
> +				msi-map = <0x0 &its 0x60 0x1>,	//ENETC0 PF
> +					  <0x10 &its 0x61 0x1>, //ENETC0 VF0
> +					  <0x20 &its 0x62 0x1>, //ENETC0 VF1
> +					  <0x40 &its 0x63 0x1>, //ENETC1 PF
> +					  <0x80 &its 0x64 0x1>, //ENETC2 PF
> +					  <0x90 &its 0x65 0x1>, //ENETC2 VF0
> +					  <0xa0 &its 0x66 0x1>, //ENETC2 VF1
> +					  <0xc0 &its 0x67 0x1>; //NETC Timer
> +					 /* ENETC0~2 and Timer BAR0 - non-prefetchable memory */
> +				ranges = <0x82000000 0x0 0x4cc00000  0x0 0x4cc00000  0x0 0xe0000
> +					 /* Timer BAR2 - prefetchable memory */
> +					 0xc2000000 0x0 0x4cd00000  0x0 0x4cd00000  0x0 0x10000
> +					 /* ENETC0~2: VF0-1 BAR0 - non-prefetchable memory */
> +					 0x82000000 0x0 0x4cd20000  0x0 0x4cd20000  0x0 0x60000
> +					 /* ENETC0~2: VF0-1 BAR2 - prefetchable memory */
> +					 0xc2000000 0x0 0x4cd80000  0x0 0x4cd80000  0x0 0x60000>;
> +
> +				enetc_port0: ethernet@0,0 {
> +					compatible = "pci1131,e101";
> +					reg = <0x000000 0 0 0 0>;
> +					clocks = <&scmi_clk IMX95_CLK_ENETREF>;
> +					clock-names = "ref";
> +					status = "disabled";
> +				};
> +
> +				enetc_port1: ethernet@8,0 {
> +					compatible = "pci1131,e101";
> +					reg = <0x004000 0 0 0 0>;
> +					clocks = <&scmi_clk IMX95_CLK_ENETREF>;
> +					clock-names = "ref";
> +					status = "disabled";
> +				};
> +
> +				enetc_port2: ethernet@10,0 {
> +					compatible = "pci1131,e101";
> +					reg = <0x008000 0 0 0 0>;
> +					status = "disabled";
> +				};
> +
> +				netc_timer: ethernet@18,0 {
> +					reg = <0x00c000 0 0 0 0>;
> +					status = "disabled";
> +				};
> +			};
> +
> +			netc_bus1: pcie@4cb00000 {
> +				compatible = "pci-host-ecam-generic";
> +				reg = <0x0 0x4cb00000 0x0 0x100000>;
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				device_type = "pci";
> +				bus-range = <0x1 0x1>;
> +					 /* EMDIO BAR0 - non-prefetchable memory */
> +				ranges = <0x82000000 0x0 0x4cce0000  0x0 0x4cce0000  0x0 0x20000
> +					 /* EMDIO BAR2 - prefetchable memory */
> +					 0xc2000000 0x0 0x4cd10000  0x0 0x4cd10000  0x0 0x10000>;
> +
> +				netc_emdio: mdio@0,0 {
> +					compatible = "pci1131,ee00";
> +					reg = <0x010000 0 0 0 0>;
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					status = "disabled";
> +				};
> +			};
> +		};
>  	};
>  };
> --
> 2.34.1
>
