Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF67740FD81
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 15:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770219602; cv=fail; b=m6oPgVGO9T27KAjZBDLl0jUoiBTuzOPUO9t5fm46vq5tI9FayoYlh0d9rjl1bxQZ3Q8m14rftHlgz1u/oZxYUwZ4ujyU2kxwDnBl5HDVpKGXlMAs7qiNJ3Q+tv7MByIzaRZ6qQ71KhXKrGxbF6tS+UTRhRJz3QMqfaVDbVZvYHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770219602; c=relaxed/simple;
	bh=aXO+se50IHInIYkPpNPM8JqQlzW8NFSx/7eWDEqXy/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XL7a9i5b3HQu5jAzSLGA/VWgEwG9hZ4jmEUTOLIeDfaJ7WO9pqHTD4v4PvkmqvjZP413mjYq3wYpaEpBCAZ+s7eZt+IHXiiHVMA5VbGC3tVon9SjbRsEyStXiWTywUXT9C+oSb6RG2so+P9NyCdeR2CmXcSl2Plt9ByFpq3PYDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CfkBDN7q; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CfkBDN7q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdadBGFDozA/aBFa26I/5K8JdIjSRjTKsbhrlRUycpjnW81HG/frHbQNpErVqp5yWp+EbETF0bdf/r7Od6tpc4uFxG601KOdbLSjUjZwM1gow0fg0t/wyS8VtIW87wgeVQKmtZX+PNmDwtFvXiZaou6eBZFg67VVhotf8KeeBnFgOsSVD4w1q+8VJYPeRRpgcgh9/POSWEcDt2z5o7UO60ZeOETpFpv4EMqnoKBbl0ASER46RsVY8GtWuRl6P1MP3WKcYffURf5/12Kkd/0GScMPnI7YNHVj4PFrWBGfnEXeUdXdNR8wZo59H+idhMvJ4pyo6DXMpbkKmziT1gnf9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYnsXcktSuqWUkcS7eB5DTpXvebAuk/+2h0tS3WGNJI=;
 b=ONBzCJDA3MOlJUzBUh4LFK24G666VnAKVQR8NegvJYJNmwj21SDHac1aDd6Uzk33ZCApeHyDaPv7xhWs3z+3328nO/nBWT78gHNyHYbFvjA9/aidJ2Vv5wjXB70FMUrLcaPoixpzJ94juSx+CqeiBOndpRKr1wEY3P+hj1h7yD0Pq5nlS7gIgZcO9LzbbkqYBmCyMYxqzRD8SttKFQbObpl34VoeJl9hNpXXrZ9liSFNs22q4zO7GogGkcQBVzsVFe29g4HIAW1tix348rKbVXU7B3H4iVSk3ueDt5+Dl1GsrfQC3C4KyEEKPlEzUCVc+4D/tSoL49mUOmnjcKu+EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYnsXcktSuqWUkcS7eB5DTpXvebAuk/+2h0tS3WGNJI=;
 b=CfkBDN7qeQFwYfVdGgWbi3N+jsKVspIzOo5ky3YQ7PIMlji2UIgzFfFYMSAzNsf3DfO7Tz50PXwZ22MbSYeMz3rdgHHRm+fIc2FMAGgnnTi0mE+78zPr1T/6dPpuOi20AcXgI//4jp/bB87rNIyP+lRfhYRycL796iih98wRips3Z3Jn39xfqwWNWJ4w8lhpS1gMweNkxrvPty80aQJeuBted6ij1WPMdm5wyoK4ARXt8z/6+LcCb63sUfo6LJ7GdwR6FMtbXolbBmOGTn54dIBX/gkiLNNgRoUgiA+ioXmRlSa/tVv5AwfpcdZjjs4VAeIHXO03YOCtbRsodwT8vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB9779.eurprd04.prod.outlook.com (2603:10a6:150:111::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 15:39:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 15:39:58 +0000
Date: Wed, 4 Feb 2026 10:39:49 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2] arm64: dts: imx943-evk: add usdhc3 for SDIO WiFi
 support
Message-ID: <aYNoRaDA0vCUyyHC@lizhi-Precision-Tower-5810>
References: <20260204022306.2372889-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204022306.2372889-1-sherry.sun@nxp.com>
X-ClientProxiedBy: BYAPR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::37) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d28865-f0bb-40fa-cd3e-08de6403a6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F0ZEXgqFII75nOASfmYSdpBHnkCliwdNXFTgr2pxH8AreMnUs5RMDAWMosCv?=
 =?us-ascii?Q?k64HPb24rKsK6KteAoY5aAZzWV84eiUR2lnNRC1seMc3o/jcUIZ64mjNzQ+m?=
 =?us-ascii?Q?xtnVNGEH4mlbLG+FSvU1docR5fn/ErDh+Y/7hB8g16DVCni831Zv+P93+JIM?=
 =?us-ascii?Q?cQoRe+7ypGkY54U8oopeRvQYg6bk4wXw2NNdUGUpAtlN+8CebdOvrt7ixBKa?=
 =?us-ascii?Q?j9KcSQ50e9nL2CF0PubvfNEzGw1oaWKkB/Iyam8ar1Iq/BuB66AJm2fTnDRE?=
 =?us-ascii?Q?AkTycde8GPRXGSgvm45ZXFppPy2dEs5bGJFsK/cjo/GI3d7DPjB2Drq815XZ?=
 =?us-ascii?Q?ttv0/83YLVrjFCZigHYb1r2exdvasUsMVnWMM8Cl14t5yQ+SKH6qxAe5uz84?=
 =?us-ascii?Q?W+lRe5Kt/Xui1TF2lrio6lh9Q+eUCCc1QvEvz8T7BJyh5CYx1acXYL3OUQDz?=
 =?us-ascii?Q?ayScUBddpWWe5KkJajdBQfXJOj53P+WpQ0ReUpm9RxO8s2cTwiKXi7LyJxFu?=
 =?us-ascii?Q?pAjpMasb1jzIhXYGVaFh9go8ymaAsfNb38prZAKJ9ZOjVBEWF8V6L+tet9CO?=
 =?us-ascii?Q?6EiUWVJIGO/ELkwfmCZ0/pE6xOqBlHAFGmV14iY03rr3ZDrFHki158e01tmG?=
 =?us-ascii?Q?ba4SYwIXrgwi9ncsNE+QEm6phcLC6LvNpH/AeUU90JfrOzVa11aH1XA9VMtx?=
 =?us-ascii?Q?gM88H5C+o/J8eYFq7K9Wm/cTiNJXUY/CRjow2W1aVFR2M7ZDWrQokY0SvQj6?=
 =?us-ascii?Q?Xa5oJXeuyOhBtZmLK744caxvzk4fBP/ukxiacNMsZs2ZG4Y4vwDtxeUQsdLJ?=
 =?us-ascii?Q?+OeXlJk6qJ21DEJKY2oP08xt0LblnlmUwy9IRcaDylzcdYbXCIa5ovBpbD54?=
 =?us-ascii?Q?b6lp1fGs4ppX5fiwik+RAzAHpCZtncpYoMY7pJS2QLJtJAg9bFDFzKuW0YfE?=
 =?us-ascii?Q?jphkfwC/FMK4N+Nwx89TYldWD5xywsbmeuVEzkbzpJwe0ucbfiu61S6xN8UG?=
 =?us-ascii?Q?TBc4jyxdd8SH5+7ijIfyK5bXdVwT2BAvaxMywanBamXm/OGH9yzHLWCqho82?=
 =?us-ascii?Q?abubh0TNnAfGiuEb02YQL8gMZG32/k35MlPZT/Tj2R8KJ2pUyCJPd9t6sV5F?=
 =?us-ascii?Q?mF0DrIp8Lw2/7wWkuX3F4i4L5ApEN2AdGSm3778p8PN2C4w4xKbxMZjO3Ovi?=
 =?us-ascii?Q?CB3nXCg0/pz6ohy52+P73TPvG0RYZnhxaag4y6l6wsjGRV7nYGktMi95QXFS?=
 =?us-ascii?Q?IDzhRLF+f/OPHcienw6YCOYF1upGhepiYgN9On/5sOCpN/kme1a74oiG5r7A?=
 =?us-ascii?Q?8+/X7Nw3sH3vXmOa9Y47g4N48ENkFTES3pve3GITevq4xi3W63jsXx624iWe?=
 =?us-ascii?Q?7BeDZDa4bPA4OejSBV4A6CoDObLwU0QyAhoBMLMXQUd3Ob2jVXV/95eFwqnu?=
 =?us-ascii?Q?FIwh1X6oeRhnSUuK4Ihan2pS7Rz0yloh9HyoXUZgdSD4WeXRbeJOy4miPTfb?=
 =?us-ascii?Q?etqUdzyor3JMe0hcmLTF0v49XfI2Zp598mlW/TXrxKvMVKvt5Ea11eLuVfOJ?=
 =?us-ascii?Q?rzZ3Lwzs9SapE3w0Zyqd3kULCg4Dy3ZxmQ/6HxUnffjbyLZJDD0kspHAYkcp?=
 =?us-ascii?Q?wl1wy9VshQj7B7ShjWG3Prk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XwRoa3xqXsvEzkvaorl1awKbO4IHeUYxP2JHUH/rr6GzDNKxALpsOD10JBCF?=
 =?us-ascii?Q?LrdiAw4ttIKweFuM+1NyUUl21WrMivOMDVfaExTRCitLrdHdh1u/i2o5/fKU?=
 =?us-ascii?Q?MdZa6YLTQvpmYndVnQ85LEd0/N01qfvToh6yPiI+D6P7bpyB6L4UEYA8l+ga?=
 =?us-ascii?Q?iWm9DptPNFGPdw7lwetzUNVJnh6+UxR9MWpAliaoXi5C2ENBAK5bxgYOu42i?=
 =?us-ascii?Q?SElQGykXmjHtGlB9cJH7T4oIRghsMxP8fYj+cYNkcpvy6rgRsN4+4pTVLSch?=
 =?us-ascii?Q?1oSZmmR+9x5U8j7FRVdlZ6mfCVm6LCsdTi+divJq3kH1Babw7mIbcidA+TXz?=
 =?us-ascii?Q?aR7Rrs+dRcNU7Y9GwyJEyQENhCGsBMUENHfpRv0xdrLC6R6lZkSo/ehs9Sjc?=
 =?us-ascii?Q?cr35j2CWl9yjR3s2bMJ76KckjuRd8si19+ubTRZgdiPiW2s3Y2yKUKG1jn0M?=
 =?us-ascii?Q?ZRtOpCHDvXgMIQG8kmjQ6+JTmaby0/7+nftdABfydjPyEdoTp2VLMKdlVfPX?=
 =?us-ascii?Q?HBr28oehjpuhw98VwgZUklIsczoKG2qvLpIrYYplB9aPEkZrxaWVk8sqR93f?=
 =?us-ascii?Q?GUoOtwYwKTQ64BOM72FuK4/St6odKbuHm9XjiYc/3XZCJb03iS2CYvNRmDnN?=
 =?us-ascii?Q?sBOKUBCaViGtdFVkJ2Ib0Tjc0vs403tFKcJHWtPqPuHp99Lf22atS6A+QHun?=
 =?us-ascii?Q?+7GFa2i8CTvJk9cxg9DeIKKoLsSyX632RSKNKMPiFj1FwceAxn6zXvhuW1wK?=
 =?us-ascii?Q?u87Xm3QiKVlHzaF1zA6F6UTYZqZbLIxmso14OZ/op/xUpa6KSax6+IE68dtM?=
 =?us-ascii?Q?CJAPkHEvR4h/dzkhoZDVSIcwpWdCe13sSAStkDMWBhqiLCDQF3VDjzcovS3N?=
 =?us-ascii?Q?gfUh3q3gER3wrCoeuGzZrDNg38J6K5QRlq3ClsL+545pxjW4nseUGvKbQuIx?=
 =?us-ascii?Q?89WOVkAqWt4cVeQJq2zoGHiHFkhCGz960tzdeukdi01zmp2OLJFj+/zyCdO7?=
 =?us-ascii?Q?6+ppwRA5OkLUHoqgcI3QqlXJBfaGKw7BqUqdYSZWxeJT6bZ4Tv8VOLJwf7VH?=
 =?us-ascii?Q?q01Ni+PoJgOiGsQ5pP/ADfMuWa3IWXcdUxxZzWElY2R2mNTYu100KpM7hfLY?=
 =?us-ascii?Q?kWcqFCfNJgslbxoAmE7Ka6Q6PDf1vf3jK+ZnFZtW+P7mQGt7ZSUfnia2wO30?=
 =?us-ascii?Q?gRi0nOvmZnXkzvZNnkH0iRhLxvl3X5h9jk6EHeJf+6ui5mewKGS/du2uLdb4?=
 =?us-ascii?Q?7okAzUhwnhsHoRmBmUzJiVJxkuv7M4K4bLGOYaxafs6fjOJpHirP3OVtGnM4?=
 =?us-ascii?Q?LP2+W4d8L1PteCvhOrlSCLfHvX6pqoB4qw8E/YGFI7hRuXG++UP2z1hEOpuF?=
 =?us-ascii?Q?nJNEvIsiaVDcos8gLyg6EKyBDgOeW1moLWVkA2uZwWjDVnVn6jhMLr8Bh8Cc?=
 =?us-ascii?Q?XZH2nF0EXIe8BLeRoniZztc6tv2qETETxoyLJQSTmn8A6scfYmRxua5XsTQU?=
 =?us-ascii?Q?su9BMGhMK/yQHG45M6BD7rrRUcny+HDFJObwJQYVCPhAeWmckPoiLCX+6tsS?=
 =?us-ascii?Q?WCwrawlA6yzeVjKXxzsV664aV3wb50AYqj5tBvP6pAdylHOOxwbBy8xswuQx?=
 =?us-ascii?Q?/sJvo6deL9WPG7YyGhaKTIShJf8vASzPRX86BE8esYhONtlssGXT0TVUBcIN?=
 =?us-ascii?Q?4NHP8Z0zXcw2Dhs63R27XFxUm7FuOw5oD8vkcCKIvz/yhQKOXChgcU+ayKKT?=
 =?us-ascii?Q?LFcFHBfkGg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d28865-f0bb-40fa-cd3e-08de6403a6b1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:39:58.0725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c8m1PrNhtdTZ+jqDD7HyRLOC/rFopeET418reFLd2bYi8W/lWmbahsPuFJM8sJkBYcpPdQaJBv7NDQOzHDeQsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9779

On Wed, Feb 04, 2026 at 10:23:06AM +0800, Sherry Sun wrote:
> Add usdhc3 to support M.2 SDIO WiFi on i.MX943 EVK board.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Changes in V2:
> 1. Move the usdhc3_pwrseq node before memory@80000000 node.
> 2. Remove redundant blank lines.
> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 61 ++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index f54404c9bfc9..c8ceabe3d923 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -20,6 +20,7 @@ aliases {
>  		i2c5 = &lpi2c6;
>  		mmc0 = &usdhc1;
>  		mmc1 = &usdhc2;
> +		mmc2 = &usdhc3;
>  		serial0 = &lpuart1;
>  		serial5 = &lpuart6;
>  	};
> @@ -54,6 +55,32 @@ dmic: dmic {
>  		#sound-dai-cells = <0>;
>  	};
>
> +	reg_m2_pwr: regulator-m2-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "M.2-power";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pcal6416_i2c3_u46 2 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		/*
> +		 * M.2 device only can be enabled(W_DISABLE1#) after all Power
> +		 * Rails reach their minimum operating voltage (PCI Express M.2
> +		 * Specification r5.1 3.1.4 Power-up Timing).
> +		 * Set a delay equal to the max value of Tsettle here.
> +		 */
> +		startup-delay-us = <5000>;
> +	};
> +
> +	reg_m2_wlan: regulator-wlan {
> +		compatible = "regulator-fixed";
> +		regulator-name = "WLAN_EN";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_m2_pwr>;
> +		gpio = <&pcal6416_i2c3_u46 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		off-on-delay-us = <12000>;
> @@ -141,6 +168,11 @@ sound-wm8962 {
>  		model = "wm8962-audio";
>  	};
>
> +	usdhc3_pwrseq: usdhc3_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&pcal6416_i2c3_u46 4 GPIO_ACTIVE_LOW>;
> +	};
> +
>  	memory@80000000 {
>  		reg = <0x0 0x80000000 0x0 0x80000000>;
>  		device_type = "memory";
> @@ -760,6 +792,18 @@ IMX94_PAD_SD2_RESET_B__GPIO4_IO27	0x31e
>  		>;
>  	};
>
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO48__USDHC3_CLK		0x158e
> +			/* Need to config the SION for CMD pad, refer to ERR053138 */
> +			IMX94_PAD_GPIO_IO49__USDHC3_CMD		0x4000138e
> +			IMX94_PAD_GPIO_IO50__USDHC3_DATA0	0x138e
> +			IMX94_PAD_GPIO_IO51__USDHC3_DATA1	0x138e
> +			IMX94_PAD_GPIO_IO52__USDHC3_DATA2	0x138e
> +			IMX94_PAD_GPIO_IO53__USDHC3_DATA3	0x138e
> +		>;
> +	};
> +
>  	pinctrl_xspi1: xspi1grp {
>  		fsl,pins = <
>  			IMX94_PAD_XSPI1_SCLK__XSPI1_A_SCLK	0x3fe
> @@ -802,6 +846,23 @@ &usdhc2 {
>  	status = "okay";
>  };
>
> +&usdhc3 {
> +	/*
> +	 * Only enable SDIO2.0 mode as the corresponding GPIO pads are 3.3V, the
> +	 * max frequency is 50MHz.
> +	 */
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3>;
> +	pinctrl-names = "default", "sleep";
> +	bus-width = <4>;
> +	vmmc-supply = <&reg_m2_wlan>;
> +	mmc-pwrseq = <&usdhc3_pwrseq>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	wakeup-source;
> +	status = "okay";
> +};
> +
>  &wdog3 {
>  	fsl,ext-reset-output;
>  	status = "okay";
> --
> 2.37.1
>
