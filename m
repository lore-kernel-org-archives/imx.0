Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013062.outbound.protection.outlook.com [52.101.83.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DF7344022
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 16:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769445623; cv=fail; b=DCv258BuuFUJApDIodPe3umGBzmea5mNPh46KqO1rJHe1YlUdYpCAIC9P7M6E9CzHJgQ1PWeQYnUy5WUfyXoQoD/0DTlHxp3LYV2stuoPhq5XN9MkvFvT+7q4f3p7Kc0/WRMffvzOBS1Y/W0SileLaxEkpOvWEQXvvzQt46ZEyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769445623; c=relaxed/simple;
	bh=srOfxYZLcx+OsE8CKkV3b9DejHudJNRlD3nG5z2i8gM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=li5S/EPea/2W+d2mYOR5c0qgnM7lVz4NgkqumddlL9iaQuxidJ0OjEJowYLJDJhGWH9nkqFPUPCdqLM7E0WNMqXvtPzxSnyspM2V7sZTQ4UyLuCT7mbpOnfzoHTq0FXJzd5Zhf5j6UfCkxL2ZpNAj+KjzaGMb8F3N1Db20OEIQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mheaeimZ; arc=fail smtp.client-ip=52.101.83.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mheaeimZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tD7YgTplffcJcuKMpzRECGXiCAQ/E5HlWlui0NHZPkorsURkIZ8do9zOhdfPj67b8nuudxhgGKx3S1idDqJrA9m1D0pJaQJceSuuVD2mNO3pB2vlSjsuwkoiLMph/Eqmygob0wB/3t0Rok63KdRyW4Ns7a3QLG4wbBaQOo70GkBsVzUwlSw5A849XZ79s0FFd+cmYuLPzlpsFeYWBBBZdyTlMiENRd/ZfdKqyG64KHatCETPpbh/9iWR6FIcjbXx9QyRyrCPl++Y9gZPzwxPUoWuZmTbVfeuvc7ol9oNY1LLv3cl0cquhz9mXVHQ5YiY/Gq84HYNotQj7VtYiNIiOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vn9yZkT3oZoIYR1/RDb64Yaf2EfOWm6dYvBMvAJRN4o=;
 b=F/XPuQ3Fqv3AfXL4JR6iIGvm21/qf+9FeoJp+9twvlZJlI+RgPVLabYJOWEBz0sPi6bO9faQh66pdFXmkE0pxUdORnlVF27uMUs0IUd26zoMZd4r13to5v9Ud0Ur0+IBbNG1X0ikIhTa2blPPsHNVdF6PscA+yCLxmZCrS/s6VoO1ul23NdjfApgAP8qU5CvYwkS2VVHPVMstrCL2Hp2bg2a55SYHchohhsD0Vatn0c3a7M+qk/qCXhtRPcPmwotfaEMlhLgkFJmglPnpNnhxl8zvEeiNSWBGulJ67LAl7ouryVxkmEvMPumIXzTeT7PBT5DXTmCaEf8xHJtNQvO8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vn9yZkT3oZoIYR1/RDb64Yaf2EfOWm6dYvBMvAJRN4o=;
 b=mheaeimZujim9ZExPPiLx7//kDKpnwvb3EncMf/GEQ980Cci7garLU3Ij+dCkhqAEi8AYUhdZ+3JRnQWNR0zL7F34UCHTOkKcGv2iCqA6q9fzuxUGCEDHb0wG2B63Af4YqTcS/5Wz2cG/qjJohTiOK2BCal/O2AC8Rmj7pvy8PfhmvxIaAWbJPZPsbCTjKJmyEF5KsaZhU908/9E/1Ng60eQyCFLyoMImzfP3oWvZWNBIXeYHp+U+IlTwL6jMbbGDrtu30mbI+lsA2cxTdhF+brl4LBzscLZNNaBIZbcX9PpQnCpKziObporzCCoHi4vwhPErm0mkBxoj15rT6Tf0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7999.eurprd04.prod.outlook.com (2603:10a6:102:c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Mon, 26 Jan
 2026 16:40:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Mon, 26 Jan 2026
 16:40:16 +0000
Date: Mon, 26 Jan 2026 11:40:03 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
Message-ID: <aXeY44T+5rvCqBs8@lizhi-Precision-Tower-5810>
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
 <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:a03:338::34) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: f6762329-1aec-47a3-4689-08de5cf995bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G4zm1uPu7/dkushc5t7Xj+9LBAb4O3BiXQiyB0OvH2Cc1PC6pGbM29Xlg6tc?=
 =?us-ascii?Q?0v8BAKeoe04cyYWsWMw4NGGdsL+L5M+NpYVpnxXkMt542rgzqQZWAMMtPGWm?=
 =?us-ascii?Q?KEcbtZXyQaJzEP9hTmBwVatvNUKsKs76rN7WVK4zj0cS83zVVqvLP3UYSNtr?=
 =?us-ascii?Q?KLVIk7GpLfnIwhxvuCdFSVcDJdTO7GHVLjg7Ycjy1gd2w5mmtRPmvtOnYOh2?=
 =?us-ascii?Q?JVe936QGYIkkUBRfBojJ6ZPRBjhbIG3DJzAsEnof7CQRnR5jcfH5w0RJW9Yq?=
 =?us-ascii?Q?Kq88qEL/jAFM2ihxa0d8z4WSpj7N5CWwBL69Pp/BtO9jAG3Hu/hhIAJ1Ukve?=
 =?us-ascii?Q?MN/blhFkdL86o6ik54UtGd3rsmoHGZLdKpOnfwC/p1HpaNgBkLpWHZJ5AdrG?=
 =?us-ascii?Q?ISIGb6i6ZIwMBdzJw7w90PZvsz548s0+3KPJukLTAol+5CyprvZyBh6n7U8j?=
 =?us-ascii?Q?dCM+Pzf3v6KkYjlY1Rfr+3DOWjF+Ik/BK9odoPlaRI9m+jp3c86SrwDrRaTy?=
 =?us-ascii?Q?HWxtUXJpLOoWh+XZu75o6hy5DSwSV3i4H4fD7kWURmFm6nKjmNUx1Hmes539?=
 =?us-ascii?Q?deFxeclqmSGxwiwXKfz3paIfk10Ac+ZOXmlbINNhfbhuPI/JeMdwuAutLMTb?=
 =?us-ascii?Q?ISxlm6NyRvWZJnb8e3UY2rdSoh7fKoQkDWzimoqjeZzey4tmbbDW+m60w+Ds?=
 =?us-ascii?Q?rMUILrRP0f8GCBFgFsNSJF+Sf8jmNzvjhy1tN0HLbxT+T8hymN3U3F1wNVYn?=
 =?us-ascii?Q?j0JY/7UnJr+WIF0CU7ASeLApBlhZeuszqneHDctOPY2Wl7YShwmqfjuEnWnL?=
 =?us-ascii?Q?ubV4xjfw4tBAGmuFwoo+jbHb7TcZtwO4kSTrNbvuXQsjE/5u6Jh+kHvQCU4n?=
 =?us-ascii?Q?t8Zu6x6On7wSkpVag2aCOORhd7CgcJ6TJHhKvdIDhXN+L8aEM3iIV/s6JmTC?=
 =?us-ascii?Q?SVCCRrLz/MuP253q0JAMr8KEuetLb/+TFao5hiDTwQOghtVSToqFsVNSzmT7?=
 =?us-ascii?Q?6Qo6Rz9TvZbhzF+o0lkHf/ctvF1pArb8CHKTgxAW8glM7+dHjZJ/DleNow+D?=
 =?us-ascii?Q?qjK+/yctaOnYGfaHt25OoYM8DOXW5m4wunznguFOEQTYbnQSJ34DzPyCEIEs?=
 =?us-ascii?Q?1QkWGVRg8HyQBRP4uxi1WivaeYi0D7dAUmgZQ5H5GmKZh+rhsQduNFtg9vWF?=
 =?us-ascii?Q?r21VRSqPkzAIKjTdAATgyXc5fhKzJ9pdTFTTqBd/Re82+q8JSt89Dg123Dqp?=
 =?us-ascii?Q?Wr7STa0aK57Wgk0pmUK9pHxT2OdG5lLrz5Yh6d28kumUJgUQcGYwHpEopMju?=
 =?us-ascii?Q?E++StMYBa52sdvzD6pkFv5CIhKBsIJDCeso71SxIsE+ZL7YPaYWZ8mQH4Dps?=
 =?us-ascii?Q?APkr0XEm8EqIzABFVCUPij/DAfTqB3syZWDqdkzFSaWFu6oJjAPkcP/d9W/O?=
 =?us-ascii?Q?I1g068THSkGmOC8TFnVNWLSv8bOd5aCUoqTROES5ZFl6GFj+EKTTP9vvOXDu?=
 =?us-ascii?Q?mAwZMXN3hOa1bWDFOp1DDRUf+Otuu7yssv0Yx/gGpuF6tCbpwet5lBSh16O5?=
 =?us-ascii?Q?IWt3vtj4zM+U4vKCYgmi3f637H3slPsypdJDPQOn3cq0XEctNZNIGfYXs4q6?=
 =?us-ascii?Q?fX44PtMIAoSMnp1+V7qEdw8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MoWJlDj7ASZWmJpj9PjAvis2jYKVwLE7pxIxOoLSTTDZ6lG8GUEwPKgRadc/?=
 =?us-ascii?Q?2AoxmIBBgf1YggvikJVRwfbKAIkZs4zOeto3Lfi1FEwGFF20WE+rhv/rcs54?=
 =?us-ascii?Q?pMrDwpdDB9sh2kIYxD9gnSxEmS1xQc8byU6klnIPZ2U4LmHOR/eaSiwKBBZH?=
 =?us-ascii?Q?ibLnw1xC2k9bOfGgxKcppmhugfut++t+5L7tIDOeFHOFZOTe3GEk7XE1yUbZ?=
 =?us-ascii?Q?TOSYTHgK0evvW8nSBLIMizMzBOx8iSs2Yq6qzuduXRR8lGljwAwV2XGF1Q+l?=
 =?us-ascii?Q?qTeM7F396NYYT9+U1VZx8Y9Gb75y5wQ1UqzRsX4Piv0ky7RzynwxdVbvITd5?=
 =?us-ascii?Q?Zp/O3QYB9IZSqSkzMTlXpr/ba8sdxqj/h3XDsCqGaV/h0a2392dTQciWsv1i?=
 =?us-ascii?Q?/Slpi5zc5gdeXs8Sw4DdZYDjDOmkj40JM44B7IzfPFOjDpMqHpA2wx0PvkM6?=
 =?us-ascii?Q?ukqXCZomKWbUOh/v96YtJKeg/zLX9V20FCOd0kULU53sMnToFnTnzDgFmp83?=
 =?us-ascii?Q?kXd02Y8sMRwrFaPBxAbQTMom8WKBSaklRs8e2GDROQHdZICKqdyasbrbWLtl?=
 =?us-ascii?Q?OMYtawZat7ppip6kePxB7I5Am46wUMsHL03oZhiloC+3iA9Yv0Zd2+nUzQmS?=
 =?us-ascii?Q?vpVoY3Ad1BxTFJgN3+CnB0LsH9PBgNrQjhvULVBGOuFa44rLU11HrxCJq+j/?=
 =?us-ascii?Q?4avcsoSG9HmgqSrxjNNmyl5dwoz/ED5ycKeQrJ/JHFqd1NDF3fPVK6ZKCewM?=
 =?us-ascii?Q?8jLO8UnpAv4REZDKEbfqfs9Pnow9vZ9lphhoYQ7FwzEC777GxcGCvcYziBtb?=
 =?us-ascii?Q?YV+4mQ3+hLbu+duW9z/KeRui9qE6YcrmTonx8ncOwHM8LbxnnpdLlQ18ckdZ?=
 =?us-ascii?Q?QFWSzAFYs5gd+5MLGOdWzWrTNuARxK7zhzIRWQzi8tpH5JE+zijWcMY4A79k?=
 =?us-ascii?Q?1PiXcVr8Sd/zCFYEuiIT8yH0iGepBNShrk818cgFcL9UCYxREuSDZnGyuFbB?=
 =?us-ascii?Q?iwrMassciims1G17EwqHHedm8yGYV8uX0qRzdLmjI3hX/bG3+pa2qZ2GkmGm?=
 =?us-ascii?Q?5qUETmRXa/Jb2n+EuWXzVfC6x48hQ7Q7u7QXIc+6LrXBilTBBAfEpCdr2D6V?=
 =?us-ascii?Q?ncjocVeOWcYSatpPRTKhHjJTRaM42YqUpHeUvXcbGqpHOlgCjSlF12I3bG2p?=
 =?us-ascii?Q?N+bOp3mwCauQDMhxMflhC7oIWbiBGYwq3ltKBTEAam5BMydsp8o/hGEVTo9v?=
 =?us-ascii?Q?wRcDUtdleFhzPzUyFZ4x8LBUGTojQUJUH3SW+vL/WF6T+kqvRY9FQQVbo7Th?=
 =?us-ascii?Q?cJeU7d/zjlKPYpydfbjohnZXlKNFWjAhFt3MiiJglCOjAQBmjyGs+L87npQp?=
 =?us-ascii?Q?7k4GRKDz+XdCUcG91aPZkfQXoZdrLDXHM4BnpM4LonOTN4cpO4N20pyI6CU3?=
 =?us-ascii?Q?7cM+OwZQKX7qczvcWznDUPD8VVsw78BIDqAV1iZSaTuWjlpPvHe9px2MAxwg?=
 =?us-ascii?Q?vKAmTbvuUst4lBTI0+0e4gsigxoVOmKjo7yP4vIVvg00XIIgHQuUl+LxZCJf?=
 =?us-ascii?Q?xMpCrqxeZez/77LlITv3K33DX6YHEbyE3Hmg4K950r/aQRz9BL3adUFJ5vsA?=
 =?us-ascii?Q?IhvilcfKMA6IMikTPiwOze0vgSLq7Lma/dmCXzn/5Kxu/cHbbXzzmxmi2FfX?=
 =?us-ascii?Q?TvTXAiZyqKNepFoFoNGukFbr2S0LVuDO+3RWq49Sj7xf2TL4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6762329-1aec-47a3-4689-08de5cf995bc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 16:40:16.4464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bm4HXd+0DLDGo8A3yTlu7RWDCErEk2zXBzkV3LXhTGqZCCx55+Wj3LfGPSvgBDeFnzKmlS9NIZ+QttoO6mJVKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7999

On Mon, Jan 26, 2026 at 06:55:37AM -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Add support for AONMIX MQS (i.e. MQS1).
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++

Chip's dtsi and board dts should be two patches.

Frank
>  2 files changed, 78 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> index ca1c4966c867..0f43e3be7058 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
> @@ -243,6 +243,12 @@ codec {
>  		};
>  	};
>
> +	sound-mqs {
> +		compatible = "audio-graph-card2";
> +		links = <&sai1_port1>;
> +		label = "mqs-audio";
> +	};
> +
>  	usdhc3_pwrseq: usdhc3-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&pcal6524 8 GPIO_ACTIVE_LOW>;
> @@ -473,6 +479,21 @@ &mu7 {
>  	status = "okay";
>  };
>
> +&mqs1 {
> +	clocks = <&scmi_clk IMX95_CLK_SAI1>;
> +	clock-names = "mclk";
> +	pinctrl-0 = <&pinctrl_mqs1>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	mqs1_port: port {
> +		mqs1_ep: endpoint {
> +			dai-format = "left_j";
> +			remote-endpoint = <&sai1_port1_ep>;
> +		};
> +	};
> +};
> +
>  &netc_blk_ctrl {
>  	status = "okay";
>  };
> @@ -534,6 +555,51 @@ &pcie0 {
>  	status = "okay";
>  };
>
> +&sai1 {
> +	clocks = <&scmi_clk IMX95_CLK_BUSAON>, <&dummy>,
> +		 <&scmi_clk IMX95_CLK_SAI1>, <&dummy>,
> +		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
> +	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
> +	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX95_CLK_SAI1>;
> +	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
> +	assigned-clock-rates = <3932160000>, <3612672000>,
> +			       <393216000>, <361267200>,
> +			       <24576000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* leave unconnected - no RX in the context of MQS */
> +		port@0 {
> +			reg = <0>;
> +
> +			endpoint {
> +			};
> +		};
> +
> +		sai1_port1: port@1 {
> +			reg = <1>;
> +			mclk-fs = <512>;
> +
> +			sai1_port1_ep: endpoint {
> +				dai-format = "left_j";
> +				system-clock-direction-out;
> +				bitclock-master;
> +				frame-master;
> +				remote-endpoint = <&mqs1_ep>;
> +			};
> +		};
> +	};
> +};
> +
>  &scmi_iomuxc {
>  	pinctrl_emdio: emdiogrp {
>  		fsl,pins = <
> @@ -618,6 +684,13 @@ IMX95_PAD_GPIO_IO31__LPI2C4_SCL				0x40000b9e
>  		>;
>  	};
>
> +	pinctrl_mqs1: mqs1grp {
> +		fsl,pins = <
> +			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT		0x31e
> +			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT		0x31e
> +		>;
> +	};
> +
>  	pinctrl_pcal6524: pcal6524grp {
>  		fsl,pins = <
>  			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 55e2da094c88..0c55861d673c 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -391,6 +391,11 @@ scmi_misc: protocol@84 {
>  		};
>  	};
>
> +	mqs1: mqs-1 {
> +		compatible = "fsl,imx95-aonmix-mqs";
> +		status = "disabled";
> +	};
> +
>  	pmu {
>  		compatible = "arm,cortex-a55-pmu";
>  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
> --
> 2.43.0
>
