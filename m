Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010051.outbound.protection.outlook.com [52.101.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC7F421245
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323641; cv=fail; b=HEJlmcMnrcuR4W34bsqVkdurVCNqBN05j3m7F77d7Kb4+uTQSh81pKoyEkvBESy19agGYt3d75DqI7GjPY+l0mBtLt4RRr03uqXd0GLfKnGrFUgu8FsZ7i+03Pi3/h3vHbRNgGKOUrQ06r+N9kOyEM9qXAUxVRnYyzJEpYBDKNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323641; c=relaxed/simple;
	bh=25z9aYTRpYF7ltPTC6wfrTf6mYIPSFwn5J7qfo4MQ/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RY3tGjNV22eJ710GQTxN1CsJwtmvO/hXDVQJsuS/j269kk8m6NegTBZ2eMB4xoPxD1GpWpgk+VGKVgDK2LW9MKoI0SaYrXvcmDB+oorXLieDd6LNUkxbKM4spla6y/MlFHTgjmfWrNu8D0HcUM+2xVi4gUCp0gWJLw2fIBq+HnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IfNkxdJy; arc=fail smtp.client-ip=52.101.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IfNkxdJy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OkAd8aqWZ04sq83RjBUtq/UtTUwn05TtcfwbHOZsUZ3CaqPdbvgj/VGk+Q7L+yLe8Ic84Mz5iky9imlfb5Xoqjrw/IK/kXsCJyMw0WOvoBhgqgW0WIgOF70IcuD46t0Fj8+DaEYK9pBx8JH6VShkxqLlW3fF5uLEXqT6f/YSBfCN/9kPHK9Mf7K9U2FaZbni7TT2NkwG2zNLiacnPk2gzc6CN7i+1a0TCMY5dXGCy2Xzx5hUs2VH9cOZMS5gQNzoYpxa3M81m2D5De6AkN845Afv1ITPTpCxwRsyVzK98L6GtQ4sy1BEv8a12W4wkiM7GCEbYH8lOrXl0hKA69gqUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCz52Besgj8Ebca/xSjgchOhIlTlxbp2YsDCDC/BvnM=;
 b=D9BE/qJwQFgtKg8tuP4JejdwO2XnQkAwdocyjlQxSIhrgtHVpdVKERvN0gjVS3SpmtIoNogOAekRVhZ2WhC2AdsA6TRVZBHhYggtBmATwL3psgsCh+jMWRPTEPDH3s3WnXWE6SO/E9ZN4A2A0S2thH5I0iMxtPSZQm1ikPsF5MFrOUQ5Q5lL82gca8Cr/dZ2xJl/RTz8+sGG22RDoBDae5OErMOViMwLDt+uynWVUanTyfDhZRmF+SZ8BanrsXEIv1l/nDI4/WjjdP4u+/LbnK2MJbmqjazKvhfFXivImUPZRUrnTV+jo3MyX64fRGZBy6ZiYEBcCtLeDmxTFMxcZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCz52Besgj8Ebca/xSjgchOhIlTlxbp2YsDCDC/BvnM=;
 b=IfNkxdJysIPxODgdedhu01KvGSsLCXn99hx5cEnDP1VKV9xXP+WsapJlf2S1dn5BS0LR/yBvgeRwlYKwfkXfxxg6WsrJvWb1CQ6ZaFUvmXs9YtZGJff4tDIcrtmhMddJS13BaUk/XwETfE3cSohCpLKa5K5uuksVhL2KmSG67qKu0PRGKFfgY3uacCfTRLKL8TDFyuBffTxpBXbEWUfDC/1J6WxgEaXogo3dPdmweGwWEZngUrbK3SHyCbfyEX7yI8dRNf0nj+1Ya87jv3vxPyk1sjDbjUsGkp8rVwDwoFx4mM1TUPFDIy63RTJJSqmO2pKjOaVlQXBX0DJNZlTpzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8893.eurprd04.prod.outlook.com (2603:10a6:102:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 14:47:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 14:47:14 +0000
Date: Fri, 21 Aug 2026 09:47:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: hongxing.zhu@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: imx95: Avoid 32-bit PCIe window
 System RAM overlap
Message-ID: <aohk6D8ay79lGAtw@SMW015318>
References: <20260821054334.1277088-1-hongxing.zhu@oss.nxp.com>
 <20260821054334.1277088-2-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821054334.1277088-2-hongxing.zhu@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8893:EE_
X-MS-Office365-Filtering-Correlation-Id: 77ad642f-4c65-43d5-506e-08deff9316f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|19092799006|22082099003|18002099003|6133799003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	S55lFJAiU3DYrcjDoPEyYBSYACR9ZJFTZ2m2Gik56dqg/YF/KRHTmgQALRFXzEZ75RcbntlXgd8FyxbarCP9oT65pVWE58r1YqZUKjtcn1f/XjEJEy34QVNY1J9sT4xTXOEuRJW90dSYS/V1BJKlQhyNGEPSSAYDNvx8/OTl/vGKDwh/O63L7M8bhX4he7Lv9BdEFaHU6aBq0xSQnSxmmchLsmEJf4H/GcfAGpbCGIOuB34uOAFbJiDv9C+HF0H4Fq02VkcNVjiIPix9QeC4rU5h4GDQ4B6jp+vPBXrGpE8Hi7+G/TN97YBUnDSzng+xTR+Ien6hPIuyhjtKPSQfwdGHLBdiXaPIlUca0w/MYuIVz4TCdI7GGVFqKuxs55OXG38YZbXOHu7N1bKEdZ+Qg1zZJeplRmnJgqLl/fI3Cs9PyW7QXBcC+OjsedvCAEhv+TZMCCaFvkEJZGTWOd/ZaQRBIUAYrdipIZ4XdAEtBy5CfkSlKmKvZRpmnrQ+Cj2DRPOgJDGLADiUXbPcMKUnDZJTSfy4xxjjgMmqQsQC8uhOCfuUi6pu+Blwfm69uV1qMKavXdEZcnhta/kBwpGcA/HjlIlvukBvesT8JalYxkdVxXnWNGlBDIaBU41XmPdkKg8RQl0PsTRJmZQMGG4HLC4COtFAczXVqd+R3xo4ExI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(19092799006)(22082099003)(18002099003)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kpy1PRRHqPqvl58kEJVkRRLVZhHt1rtt/3sP1n2vn3wPk6QzZziCNLI+hxw3?=
 =?us-ascii?Q?hh3TfAkM9MCO8IsEpqCAvIsK8H+kUBCk9mrw7RMfeIbNFjy1qJ8yA91ZkSB7?=
 =?us-ascii?Q?MonjWP0IXCeyjuzouH1M2nAu3HT42RVF60RdloP6d4lfOIm5VFZk9jEAeAKT?=
 =?us-ascii?Q?KIGLV3uePv8LuUNLxvzegRwmJdbM8DgPix5JO5ObstOByZUF0wk2XuIXMBgK?=
 =?us-ascii?Q?iJaaHy/F51wPYYXbXIm7lDswqrRhRZG0Vq8/7QCy/+2J46/NDHKTb8zEcSll?=
 =?us-ascii?Q?zsYRjWAuSoAgiXv9szHL3B1io5rxVXXvmloa2/S75pnUxk5IP9NLMamEF6iY?=
 =?us-ascii?Q?dCGAZid6xQ071QOpea02gwOatlgyRCOMjZCHTi6nyEE+WJW7rUs2g/HiVRFs?=
 =?us-ascii?Q?rnDJxYiTBJMbOc1UMNENKfGFPqBoqUPBvKaZFZe5N5nDqIDtfaRL3uvkKnlW?=
 =?us-ascii?Q?hIpPUgvoVlAwiBpc0YeQDjYCkJZBQpkrZKw1m8U1ggCv2zr821tUbzk5jATR?=
 =?us-ascii?Q?JIPahchCy/smusUt1PfcS3ALg8m9GgGY3RubvwMtbR5+i8HxvgVIPcEHBNxq?=
 =?us-ascii?Q?82XKvwMEaJSOt4HgxsmAZCqgEEplSWPuf5CU4h9fYQOIUCE+IkijdeMHfGyD?=
 =?us-ascii?Q?YHOGeqho1Q2kUsLXIUt4C26B6deg9+jdtGkNLBZV95CgOUD1rPiBHBI9+4wB?=
 =?us-ascii?Q?SKR7PZR5r5V/2TXWZU0KV4/sL7HpWpVRlNbDTxUpLcCGU4IOfvG9/bueLoxj?=
 =?us-ascii?Q?Ckz5E32xRkVwigmE4XAxLXtBAI4p4t7vCxOoRnqZOamq6PAelAeEwYw4sUSH?=
 =?us-ascii?Q?5J6UqE+fX9fFo24qVyJ/JF/JbJsRwa5CJRYNQFFj5lpIbHHdoPhzqQ5zLPg4?=
 =?us-ascii?Q?SO6fTnJ+VVdAsPRA7s8zPy4803GLaWqAJ7ufsnctiEzuKMpfYmuJDFfJceKF?=
 =?us-ascii?Q?KsZW5kJhlzoT/ncDYl1K9GC47s5ZEfjD8sYpwwltyn996Wcv2MJNDkuRXkIk?=
 =?us-ascii?Q?d9xDFAUVrxwU6G+RMvohd4/GUewllX9LeBw2y1PhYKBqskVQMCW231BLZrmV?=
 =?us-ascii?Q?sLZ15q30ksQbU2EWTJhDJJgcwJFElnV7T7IIwVXhJzj1TOpZi44fHng6VYSD?=
 =?us-ascii?Q?jMgrhYf4L2MIIN2ARG+q1rs3+loFftzcjMWdMBvfgLK0w24JcYNmxSB3Rb86?=
 =?us-ascii?Q?IEixAZnQcR+hx5g+rojZyoc92fEXLKSrG2eC6+3FbPktv/K1HvLkseEgJ5R8?=
 =?us-ascii?Q?MBCFymVk6BL58CbJx00vL96SVfzpxXJ95NJ0uzbrv6uJ9gGBXRdAmi3uXxZj?=
 =?us-ascii?Q?GrsiYMm5W+i2caE1ONSy7xtiI4LzRHEQ417EiGDUW5rOBnYoVj3IbN8YvbBq?=
 =?us-ascii?Q?cc7Hi4QYjrU1NcxPyO7aaUjvH5sOIJwaqA0qV1ERrvyJOBf301EjKhwGj+Ru?=
 =?us-ascii?Q?NyljE9ISdenKyI8FJy5PAmf6fBmakjO1jGfCW3UIxfgGWe+t/79p2kZcwanG?=
 =?us-ascii?Q?4sWEO1kpLZlt1ZZKQd6BznGYNOyw5/FaN+nLOZdORkkBXhWMeuaHcprOM2rv?=
 =?us-ascii?Q?MMb8J740gIOdjiFqCJd1SknNkzSw09FTa1+DGqVwo6yK5JdUbPohSzNbebwy?=
 =?us-ascii?Q?di7aeOIfDW7FWaRFPQ9Ws4KwoK28GeReJhGx7kjtMwmrboCxcgIETKExvH74?=
 =?us-ascii?Q?7zc3vuJIrr1HOJJiZO9iGmGGYTLzn79qNar11tl0Bs5BoBR/fU6i8yt7zZs9?=
 =?us-ascii?Q?mOu6zeR4DupoUn5aFOIS4Q5ujFW+Q4+6zgojeYk5LlbcdLMEUTVQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ad642f-4c65-43d5-506e-08deff9316f4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:47:14.6457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIu5byX5c9SsLgbhBdORjmgxHTkALB1NFANc74Bom+vyI8n0ss/z5tjsgGYo8w149bZFP0pS7Y7qQTHy5ZHOYLoVxlnW9/IbeLXK5MDljF3zk6lL7t3n6JxdFvJe5WRG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8893

On Fri, Aug 21, 2026 at 01:43:32PM +0800, hongxing.zhu@oss.nxp.com wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
>
> Move the PCIe non-prefetchable memory PCI bus address from 0xe0000000
> to 0x10000000 to avoid overlap with DRAM. The 0x10000000 range is
> reserved and safe to use.
>

If you agree, I put layerscape discussion link at here when apply

link: https://lore.kernel.org/imx/753fca23-c3eb-45e3-aeac-b7b248fa723a@app.fastmail.com/ [1]

Frank

> Fixes: dbecf38e60d4e ("arm64: dts: imx95: Correct PCIe outbound address space configuration")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 38fc47024841f..0f03b85aaec17 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1948,7 +1948,7 @@ pcie0: pcie@4c300000 {
>  			      <0 0x4c340000 0 0x4000>;
>  			reg-names = "dbi", "config", "atu", "app";
>  			ranges = <0x43000000 0x9 0x00000000 0x9 0x00000000 0x0 0xe0000000>,
> -				 <0x82000000 0x0 0xe0000000 0x9 0xe0000000 0x0 0x10000000>,
> +				 <0x82000000 0x0 0x10000000 0x9 0xe0000000 0x0 0x10000000>,
>  				 <0x81000000 0x0 0x00000000 0x9 0xf0000000 0x0 0x00100000>;
>  			#address-cells = <3>;
>  			#size-cells = <2>;
> @@ -2039,7 +2039,7 @@ pcie1: pcie@4c380000 {
>  			      <0 0x4c3c0000 0 0x4000>;
>  			reg-names = "dbi", "config", "atu", "app";
>  			ranges = <0x43000000 0xa 0x00000000 0xa 0x00000000 0x0 0xe0000000>,
> -				 <0x82000000 0x0 0xe0000000 0xa 0xe0000000 0x0 0x10000000>,
> +				 <0x82000000 0x0 0x10000000 0xa 0xe0000000 0x0 0x10000000>,
>  				 <0x81000000 0x0 0x00000000 0xa 0xf0000000 0x0 0x00100000>;
>  			#address-cells = <3>;
>  			#size-cells = <2>;
>
> base-commit: eba4724641990bd9975ca10ababe726b6143f0b6
> --
> 2.34.1
>
>
