Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20783233723
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770304368; cv=fail; b=uLjCB6hO8MRoLA0a2KwtsU8MWsZMHTddDwIJSfnFjlasq2716dh76BKEqeXg+2R8v8X/Wr/cLmmqyGczXu7csybeoNdck+2n9GySJimvZpuo8wmLipOI8nr2svhY0eZ5vFzUVWyPj0uiTSuUgI6aNeuiyVOpFFtC+ipISDcq2TU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770304368; c=relaxed/simple;
	bh=Iy6wy3vmyjR47tCXMRAnbKVfgiomU5nQlCifWqoPMn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ePsmsbqVjjVMn1WFpBbHRw2O1E4xx/6URQ14SNAt1sLzdoRbNchQ3eRh1KIuIW1EOT08PIec8u26LQjuQ/vXouAYfL8b5+Srl2pjbpQPyUcXbGsaxux2JnGwtXGimKP5MHgaZ+hOuQFDUfbHLtxbaHtHFDtO5ZiKVR9ODlYj8KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SOzlsYPm; arc=fail smtp.client-ip=52.101.66.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SOzlsYPm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fm0O5YoXZBO7dtUNcVrqx5Skq9E3WKYhVEztC06O8ksFPFLklPa6ctDTUb27BIPBj1z8lSD9p3yWXtB3bjWzFshGVK+nQuNXyDT3JXuYYMUxRiA6x6JjRR2L9Qb5wGYvFSsOQo9HRqFLewI3ZwaKGR/Rqn8B43AWUX6NAOUQxW0O4E7k4knUtJEW58bM0qlwfX2BrsUs5RJXRSXTsgZROS8DLjOrPwsZ9DUF9Zi/UT9w2aUAbWYhXq5OsRr1/nonXbv/VF2WVpd80tCy8lOiyeHPJR2KJzhqnPwKm5+jmiRZifILOY6iPIGqwGf+NjREZQbRr0mBTjmaC1AOm26BDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbGETXOq/HBMbRUdP8ccMrenLkWPx/jOBOUyqJhkdn4=;
 b=EiOC2v5ds/OH3+22E4GgLIMz/vIZasPde9+TQpuJnTXZddTSm2DAJPT99WdXEvH9vayxQP3SrEtDKZtJEo6FvV9YWAWoW39Em4ARfvnSpbJK3kaRqy6LBCcUGDbZqAM3uLH9A7/dH55Au+W3iC/NutvY7uvz4kOFp6PrWbAiY85svVbukZ5vL/Nm9Zy/Pp1iIhuc+YGsPMIRz4LCzpr0RCKiHaZCBSwEDJm9bQGw2Uir6F1PfaZ+0cwasb+VTK0fpppehlhO9aY/9D5ZFTh08WQCpZwESFErx3enYgb+iU8x5KLTPvU5Baq7dSNcMZ0tmz4DH7oGKBIV+vjgLWLeSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbGETXOq/HBMbRUdP8ccMrenLkWPx/jOBOUyqJhkdn4=;
 b=SOzlsYPm/qQ/70S9WqRS7LzBN1EYP/gVM7I9pvYDJeGzsF58VhnqSkbiXrMGFZseovasC1GLS0tVhmD4TaaoMGo0bZbDfzcFMI0/HZiy4EQgsx7+S+wdcLn9tHue9DyCglpC5PSG/OI/EcjEFvL6AO/G7FbAx7re9B22hkEa3fMmbktfWtWoPyVMwzzU514VaAB6zVHeCH5OyQ1KrC+y0PSUJpX07w6IQIskmKsjhsXl5y3ce1GpWAR2doIzOxQ1zZRI2p0AguLVOeZh6sql16YkWcCeAAL/fsSDv7eM+CxBimIW5mSbcgEBdCtobZ+rYKwDXXCTZfjQWHBTBIFimQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9701.eurprd04.prod.outlook.com (2603:10a6:10:300::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 15:12:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 15:12:42 +0000
Date: Thu, 5 Feb 2026 10:12:34 -0500
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
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: imx91-var-dart: Add support for
 Variscite Sonata board
Message-ID: <aYSzYgpvxtQftc0e@lizhi-Precision-Tower-5810>
References: <20260205100125.9095-1-stefano.r@variscite.com>
 <20260205100125.9095-4-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205100125.9095-4-stefano.r@variscite.com>
X-ClientProxiedBy: PH7P221CA0062.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: 407c7937-6686-4d76-aa02-08de64c90260
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ZyJWByulnOjc9whFp+PAclUaqCgYcuzJTrFLAL/dQlkpZV7HzUvmO103Qm2r?=
 =?us-ascii?Q?zT317KxXcw3jFN7DuzB4OyQ9Rl3v9eLw64G+2McwHCVow7+KBA2Qm4I3wUk+?=
 =?us-ascii?Q?44oOJ/m8dRYjxDZHyhXtzey43Kqcmjm7Xg2sZd5aNRxbZNyieHAc8MgfU7eT?=
 =?us-ascii?Q?duhjjs2lh08Z6LPulUctpdorK4Sl+9k+JNBjwVm7n1z9fiUvRDvFLcZ6ie6E?=
 =?us-ascii?Q?vuoPM/Fqx6N3RVSmd/g5xXXlkAS//tEY3fmfcH4oqtM8GYuDA9YWLTX91dwi?=
 =?us-ascii?Q?lKB8B80Y84eEpGBysOdXEGJRcYc0GAd4mOfmgmwKj5KWp/v9fzBibVGzXRZb?=
 =?us-ascii?Q?Twke4ukF4cODwOsG1UwWCcmZu1JxXphpY0B8UAz1hNvmboqI3H2/Ad/d/VVL?=
 =?us-ascii?Q?Wr4NKDvnRjKfofirxISIA0eTj2+pgKDMP8GWfQlz+nEDLeeSayKe/VHPI76M?=
 =?us-ascii?Q?8rzNGI6wXWUzErbSPYGviwXf+woJwF9gI9EjyaqRMkTgRsG7HwrsDZeH1NVu?=
 =?us-ascii?Q?QxRtm0TPoQLmGPi/ilABLukit9U+DI4MkEG5olbF7LjEN2u2Zr3rEPhAaLmA?=
 =?us-ascii?Q?YgiBnmVruVJ5DvJXr8jnw3GNH+F4BU4PJDbpksr3/owWRtoJ3MTtX2HN4MSG?=
 =?us-ascii?Q?mRlrB/TzvvYZheeIfF9qUjG+mgn+yiEO1DYFl1m5yGDcRQZegw1n4m0GxvIb?=
 =?us-ascii?Q?MgqO71eaptw86svqbXUT51uhzO70boIvu7whz/UM8nylO2gYCJiWGuoD6iIv?=
 =?us-ascii?Q?qqOm4tGzkzZexpsGO/+37S+3teZU+oz0K5m+UAjXWBSjyF3WfCqPp6A0AGmw?=
 =?us-ascii?Q?76DkvsK6zWE/f1u23JDyt+veCtZbgoMAyBHCloTphLURPz7qvVJ6KPWwBuHG?=
 =?us-ascii?Q?n7W5UTu3fLtqahnmsyeTwPUjSyPbZoCRCUA9xPqF9tdjNm9WQsMmvpGqZtEo?=
 =?us-ascii?Q?SkgWjRnVpkh7RwWrhmYTYRXHHwG1osQbXo6p23ZDJY3e11wcH01ZT19wOcIm?=
 =?us-ascii?Q?ZhT3p3WKQKGCMNNTtn1K0Tj00kyVyXnquzRYBRB1a8ePYFLvJ890zumTUeQ7?=
 =?us-ascii?Q?8d6T/E+YH/jtkAjOEvuz8U/a5XAnOtxyb1ShmAtl8G0NOQwCX87ehF8WQr8C?=
 =?us-ascii?Q?j6j9lxV1CuG2p2PQ3V4OrEj+iUhV+k1xXjy55FiR6RI7aAV9GL90zgYP0NZc?=
 =?us-ascii?Q?JPKK6GMwSULU8NOuWcmR8QWgnXqwuup7w1MYdAOIBIn1uM1k0GqeK2gPjb+F?=
 =?us-ascii?Q?+QkRLO1iv67sC/mjVZnLzj0mE6kMOi1026xzIjatkGIVFcxfZS81P59PY3EB?=
 =?us-ascii?Q?JJsWI3xvAWgc6KE2f30gVbWdaMehbCCEqXhXqFncDnfhwl0o0aXEl3w715k+?=
 =?us-ascii?Q?zrCmLGcEQmzeByu+wtywOCvc1MQFIjzicRpLHRLotuR0njZtm8VFUPLDwt1c?=
 =?us-ascii?Q?SZrLTSx6jkch7DEsNVbvrMsZGUAhxlrudakjdIGoq9mazUP4Sao83/gdeyi6?=
 =?us-ascii?Q?L2fJ97MT1cbSTrfBRSUNjGnWAFo28bT/7s/sg8jI+OHgaVMiYO7DViEwn2L5?=
 =?us-ascii?Q?OoNCtFm39Xqo9xWqakY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?y8kSEHBYSP2a2DgBAqiRcIHt8mE5sOXJoHLbd3UvH0eAD5f5hYKkR6IImlng?=
 =?us-ascii?Q?8zql5xidquNVYaJg4X7gSgBu5AGp/pDXgGbUXgBbKsgrYNzBg5RMaJBDjOur?=
 =?us-ascii?Q?9YMbaJ570Emou84VK5hHGdn+DycoraoZOWtF3HX5MP7sJptgbEEDc23kqD6Q?=
 =?us-ascii?Q?xa78mJl2Jxj3JIaAzAKgaI6ghiEHlCDemPjrJLLW5RIbEtjCgX3wLHyHiGZT?=
 =?us-ascii?Q?2N4mE8dgPkm3NQWhlegwCK6vx6UQiJ9c14d1ATkjm3GMD10PDCwiJ7HWElY+?=
 =?us-ascii?Q?+0nuUG1DR1xQPPadP021fwBIEqoOKQ3JV12gtETwN0FR++s3+OBEUf+i+Ve0?=
 =?us-ascii?Q?N9qvMl4JW8t58jSWFrepuL2jvk/MzS4Ng5wDfsrswvHkdtiku/xV3QLoW0C1?=
 =?us-ascii?Q?8ognEWmvEFVN6EsxNHfueT8UenVxbvmx0b7uWTDLvaDooW9/vRKrUeSmyoxy?=
 =?us-ascii?Q?wwEVEMrg/4m4u5ftD1xaC/VZTnXARimGMObnPCuyffrr1ZCYmjcChQ6l4KHw?=
 =?us-ascii?Q?VXKricJzK4KNIl7xRvsZWzTAJVzeVfG32uHnHLhsk9Kfg1z1zA5E1FXkvbcx?=
 =?us-ascii?Q?kqCnxc+d0aigfB3WKrFDRXUHHOlIaUKtWjcRRYEnBQfNt811j8nKaBPCc3rz?=
 =?us-ascii?Q?DbqavrV9B5T8IldiILELvWQoqe1pDoLJ44p/22XDb+rM8m9o5zkh/wsiAzl+?=
 =?us-ascii?Q?e3yzwaN1tQoVwxqfUqlVhfvJhQ9GEspxdJDjbpCIQhiGuFINFpuP7+ykGYOL?=
 =?us-ascii?Q?vqZo1cw6H5EuWUOR+PVA9NKGfDTo6bJ4feWK66BkvAthqrKq/fnWTgkC0wGO?=
 =?us-ascii?Q?cc71+2PHjXE/kznrNjiuS3d95XK11RFjdGioTVJBNdLx3O3Q0k9tNq+AVw8g?=
 =?us-ascii?Q?4NhDFYBJRBC2QF3K5Zl6Zij0U25atLHy1puRXhfca/aKvkOQhWnGdzSOy7mb?=
 =?us-ascii?Q?Dp1LaWzl1WM417xAYcQSO/rRejIjpp/zkrJR2EV+94U4KUsmSI8ei0dMu81D?=
 =?us-ascii?Q?aT0NGoKcwTFUbznCNrCis0qj9493DIbMl6+Nq5O7Z/dvAzAsfdu/cTt5FLmb?=
 =?us-ascii?Q?cjLshoIQyal3UM2Z7cKTsuMRtJQxFRfEyL1Bomt4Zad7mkTShUx1aoMcnQOC?=
 =?us-ascii?Q?kT/1qIg7EQFc0T/EVtwvzPT7L5ix7LbL0M/XrW6cxFXR4H0PlGNXBsTjBOu2?=
 =?us-ascii?Q?tRhgA0LEzU+oXUdtxtv0hPJ5K8zyf3YyUFVi3MeVYRBQHHShCS61X1pLzsjR?=
 =?us-ascii?Q?FAuzY7EdMiZ8Y+1TAvreV/RBlvnIVjKHXY32IAZkhdLtOmJ2nJixUmCuxOs1?=
 =?us-ascii?Q?mSOXv6tvS8t3lqZ+XcVIB3J60JuZ+2RuqENXr6oQn3hiTRqPSIx2vykR3jMW?=
 =?us-ascii?Q?67Bop8ycdgyO64H0Cb4w55Uh1I6em40BNrKYoxMSax4rJ7+xN6+CFDxu0HC2?=
 =?us-ascii?Q?Q+jbX6Iv7mxulFhd6+JMCZBjXY3waR4nEVJlV5d6lrMUIOCdXv7+QDPwoUV9?=
 =?us-ascii?Q?NPUsJJagwA1iDGi6/6v+EdepC4STV3ziphbAGQrcZ6y3mcx5s3a2YZfICQmA?=
 =?us-ascii?Q?CE+RFzte3yqoT8O3Ke2wtx+1U23Ekxi4g9wh9/BWC7EMC+J6tlXV3+IoOLle?=
 =?us-ascii?Q?4fWipBBNYhf8DoPJoaIGpSQUlli5xGFngVbEF92TLmF0UgAPWrWKST8hQQQZ?=
 =?us-ascii?Q?9wg01F4KIWcP9I2aup4IRMOafv84Q8Uxk9U3Koof9MVvwHqx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 407c7937-6686-4d76-aa02-08de64c90260
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 15:12:42.7447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GjfjosOKLFHIcMmrJjTLQVgRCm2aRjUyGQLJ/inELU8v14ycxjqC/hE/h5D3fooNxkF1d0gPaewF4ygbp9ByYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9701

On Thu, Feb 05, 2026 at 11:01:25AM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add device tree support for the Variscite Sonata carrier board with
> the DART-MX91 system on module.
>
> The Sonata board includes
> - uSD Card support
> - USB ports and OTG
> - Additional Gigabit Ethernet interface
> - Uart interfaces
> - GPIO Expanders
> - RTC module
> - TPM module
>
> Link: https://variscite.com/carrier-boards/sonata-board/
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx91-var-dart-sonata.dts   | 498 ++++++++++++++++++
>  2 files changed, 499 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index f30d3fd724d0..839d98bdd2a1 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -370,6 +370,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx91-var-dart-sonata.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
>
>  imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
> new file mode 100644
> index 000000000000..b3c74feaf644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
> @@ -0,0 +1,498 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Variscite Sonata carrier board for DART-MX91
> + *
> + * Link: https://variscite.com/carrier-boards/sonata-board/
> + *
> + * Copyright (C) 2025 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include "imx91-var-dart.dtsi"
> +
> +/ {
> +	model = "Variscite DART-MX91 on Sonata-Board";
> +	compatible = "variscite,var-dart-mx91-sonata",
> +		     "variscite,var-dart-mx91",
> +		     "fsl,imx91";
> +
> +	aliases {
> +		ethernet0 = &eqos;
> +		ethernet1 = &fec;
> +		gpio0 = &gpio1;
> +		gpio1 = &gpio2;
> +		gpio2 = &gpio3;
> +		i2c0 = &lpi2c1;
> +		i2c1 = &lpi2c2;
> +		i2c2 = &lpi2c3;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		serial0 = &lpuart1;
> +		serial1 = &lpuart2;
> +		serial2 = &lpuart3;
> +		serial3 = &lpuart4;
> +		serial4 = &lpuart5;
> +		serial5 = &lpuart6;
> +	};
> +
> +	chosen {
> +		stdout-path = &lpuart1;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-home {
> +			label = "Home";
> +			linux,code = <KEY_HOME>;
> +			gpios = <&pca6408_1 4 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-up {
> +			label = "Up";
> +			linux,code = <KEY_UP>;
> +			gpios = <&pca6408_1 5 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-down {
> +			label = "Down";
> +			linux,code = <KEY_DOWN>;
> +			gpios = <&pca6408_1 6 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +
> +		button-back {
> +			label = "Back";
> +			linux,code = <KEY_BACK>;
> +			gpios = <&pca6408_1 7 GPIO_ACTIVE_LOW>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		led-emmc {
> +			label = "eMMC";
> +			gpios = <&pca6408_2 7 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "mmc0";
> +		};
> +	};
> +
> +	reg_vref_1v8: regulator-adc-vref {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vref_1v8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name = "VDD_SD2_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		off-on-delay-us = <20000>;
> +	};
> +
> +	reserved-memory {
> +		ranges;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0x80000000 0 0x40000000>;
> +			reusable;
> +			size = <0 0x10000000>;
> +			linux,cma-default;
> +		};
> +	};
> +};
> +
> +&adc1 {
> +	vref-supply = <&reg_vref_1v8>;
> +	status = "okay";
> +};
> +
> +/* Use external instead of internal RTC */
> +&bbnsm_rtc {
> +	status = "disabled";
> +};
> +
> +&eqos {
> +	mdio {
> +		ethphy1: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <1>;
> +			reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <15000>;
> +			reset-deassert-us = <100000>;
> +
> +			leds {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				led@0 {
> +					reg = <0>;
> +					color = <LED_COLOR_ID_YELLOW>;
> +					function = LED_FUNCTION_LAN;
> +					linux,default-trigger = "netdev";
> +				};
> +
> +				led@1 {
> +					reg = <1>;
> +					color = <LED_COLOR_ID_GREEN>;
> +					function = LED_FUNCTION_LAN;
> +					linux,default-trigger = "netdev";
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	pinctrl-1 = <&pinctrl_fec_sleep>;
> +	/*
> +	 * The required RGMII TX and RX 2ns delays are implemented directly
> +	 * in hardware via passive delay elements on the SOM PCB.
> +	 * No delay configuration is needed in software via PHY driver.
> +	 */
> +	phy-mode = "rgmii";
> +	phy-handle = <&ethphy1>;
> +	status = "okay";
> +};
> +
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	status = "okay";
> +};
> +
> +&lpi2c1 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default", "sleep", "gpio";
> +	pinctrl-0 = <&pinctrl_lpi2c1>;
> +	pinctrl-1 = <&pinctrl_lpi2c1_gpio>;
> +	pinctrl-2 = <&pinctrl_lpi2c1_gpio>;
> +	scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	pca6408_1: gpio@20 {
> +		compatible = "nxp,pcal6408";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pca6408_2: gpio@21 {
> +		compatible = "nxp,pcal6408";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	pca9534: gpio@22 {
> +		compatible = "nxp,pca9534";
> +		reg = <0x22>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	st33ktpm2xi2c: tpm@2e {
> +		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
> +		reg = <0x2e>;
> +	};
> +
> +	/* Capacitive touch controller */
> +	ft5x06_ts: touchscreen@38 {
> +		compatible = "edt,edt-ft5206";
> +		reg = <0x38>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_captouch>;
> +		reset-gpios = <&pca6408_2 4 GPIO_ACTIVE_LOW>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
> +		touchscreen-size-x = <800>;
> +		touchscreen-size-y = <480>;
> +		touchscreen-inverted-x;
> +		touchscreen-inverted-y;
> +		wakeup-source;
> +	};
> +
> +	/* USB Type-C Controller */
> +	typec@3d {
> +		compatible = "nxp,ptn5150";
> +		reg = <0x3d>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_extcon>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <29 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		port {
> +			typec1_dr_sw: endpoint {
> +				remote-endpoint = <&usb1_drd_sw>;
> +			};
> +		};
> +	};
> +
> +	rtc@68 {
> +		compatible = "dallas,ds1337";
> +		reg = <0x68>;
> +	};
> +};
> +
> +/* Console (J10) */
> +&lpuart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +/* Header (J12.4, J12.6) */
> +&lpuart6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart6>;
> +	status = "okay";
> +};
> +
> +&usbotg1 {
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	disable-over-current;
> +	samsung,picophy-pre-emp-curr-control = <3>;
> +	samsung,picophy-dc-vol-level-adjust = <7>;
> +	status = "okay";
> +
> +	port {
> +		usb1_drd_sw: endpoint {
> +			remote-endpoint = <&typec1_dr_sw>;
> +		};
> +	};
> +};
> +
> +&usbotg2 {
> +	disable-over-current;
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +/* SD */
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 = <&pinctrl_usdhc2_sleep>, <&pinctrl_usdhc2_gpio_sleep>;
> +	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	bus-width = <4>;
> +	no-sdio;
> +	no-mmc;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_hog: hoggrp {
> +		fsl,pins = <
> +			/* GPIO Expanders shared IRQ */
> +			MX91_PAD_PDM_BIT_STREAM1__GPIO1_IO10            0x31e
> +		>;
> +	};
> +
> +	pinctrl_captouch: captouchgrp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
> +		>;
> +	};
> +
> +	pinctrl_extcon: extcongrp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO4__GPIO4_IO29			0x31e
> +		>;
> +	};
> +
> +	pinctrl_fec: fecgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET2_RD0__ENET2_RGMII_RD0             0x57e
> +			MX91_PAD_ENET2_RD1__ENET2_RGMII_RD1             0x57e
> +			MX91_PAD_ENET2_RD2__ENET2_RGMII_RD2             0x57e
> +			MX91_PAD_ENET2_RD3__ENET2_RGMII_RD3             0x37e
> +			MX91_PAD_ENET2_RXC__ENET2_RGMII_RXC             0x5fe
> +			MX91_PAD_ENET2_RX_CTL__ENET2_RGMII_RX_CTL       0x57e
> +			MX91_PAD_ENET2_TD0__ENET2_RGMII_TD0             0x57e
> +			MX91_PAD_ENET2_TD1__ENET2_RGMII_TD1             0x57e
> +			MX91_PAD_ENET2_TD2__ENET2_RGMII_TD2             0x57e
> +			MX91_PAD_ENET2_TD3__ENET2_RGMII_TD3             0x57e
> +			MX91_PAD_ENET2_TXC__ENET2_RGMII_TXC             0x5fe
> +			MX91_PAD_ENET2_TX_CTL__ENET2_RGMII_TX_CTL       0x57e
> +		>;
> +	};
> +
> +	pinctrl_fec_sleep: fecsleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET2_RD0__GPIO4_IO24                  0x51e
> +			MX91_PAD_ENET2_RD1__GPIO4_IO25                  0x51e
> +			MX91_PAD_ENET2_RD2__GPIO4_IO26                  0x51e
> +			MX91_PAD_ENET2_RD3__GPIO4_IO27                  0x31e
> +			MX91_PAD_ENET2_RXC__GPIO4_IO23                  0x51e
> +			MX91_PAD_ENET2_RX_CTL__GPIO4_IO22               0x51e
> +			MX91_PAD_ENET2_TD0__GPIO4_IO19                  0x51e
> +			MX91_PAD_ENET2_TD1__GPIO4_IO18                  0x51e
> +			MX91_PAD_ENET2_TD2__GPIO4_IO17                  0x51e
> +			MX91_PAD_ENET2_TD3__GPIO4_IO16                  0x51e
> +			MX91_PAD_ENET2_TXC__GPIO4_IO21                  0x51e
> +			MX91_PAD_ENET2_TX_CTL__GPIO4_IO20               0x51e
> +		>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = <
> +			MX91_PAD_PDM_CLK__CAN1_TX			0x139e
> +			MX91_PAD_PDM_BIT_STREAM0__CAN1_RX		0x139e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c1: lpi2c1grp {
> +		fsl,pins = <
> +			MX91_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
> +			MX91_PAD_I2C1_SDA__LPI2C1_SDA			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c1_gpio: lpi2c1-gpiogrp {
> +		fsl,pins = <
> +			MX91_PAD_I2C1_SCL__GPIO1_IO0			0x31e
> +			MX91_PAD_I2C1_SDA__GPIO1_IO1			0x31e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c7: lpi2c7grp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO07__LPI2C7_SCL			0x40000b9e
> +			MX91_PAD_GPIO_IO06__LPI2C7_SDA			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c7_gpio: lpi2c7-gpiogrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO07__GPIO2_IO7			0x31e
> +			MX91_PAD_GPIO_IO06__GPIO2_IO6			0x31e
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO3__GPIO4_IO28			0x31e
> +		>;
> +	};
> +
> +	pinctrl_rtc: rtcgrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO02__GPIO2_IO2			0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			MX91_PAD_UART1_RXD__LPUART1_RX			0x31e
> +			MX91_PAD_UART1_TXD__LPUART1_TX			0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart6: uart6grp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO05__LPUART6_RX			0x31e
> +			MX91_PAD_GPIO_IO04__LPUART6_TX			0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart7: uart7grp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO09__LPUART7_RX			0x31e
> +			MX91_PAD_GPIO_IO08__LPUART7_TX			0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK			0x1582
> +			MX91_PAD_SD2_CMD__USDHC2_CMD			0x1382
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0		0x1382
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1		0x1382
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2		0x1382
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3		0x1382
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK			0x158e
> +			MX91_PAD_SD2_CMD__USDHC2_CMD			0x138e
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0		0x138e
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1		0x138e
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2		0x138e
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3		0x138e
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__USDHC2_CLK			0x15fe
> +			MX91_PAD_SD2_CMD__USDHC2_CMD			0x13fe
> +			MX91_PAD_SD2_DATA0__USDHC2_DATA0		0x13fe
> +			MX91_PAD_SD2_DATA1__USDHC2_DATA1		0x13fe
> +			MX91_PAD_SD2_DATA2__USDHC2_DATA2		0x13fe
> +			MX91_PAD_SD2_DATA3__USDHC2_DATA3		0x13fe
> +			MX91_PAD_SD2_VSELECT__USDHC2_VSELECT		0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_sleep: usdhc2sleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CLK__GPIO3_IO1			0x51e
> +			MX91_PAD_SD2_CMD__GPIO3_IO2			0x51e
> +			MX91_PAD_SD2_DATA0__GPIO3_IO3			0x51e
> +			MX91_PAD_SD2_DATA1__GPIO3_IO4			0x51e
> +			MX91_PAD_SD2_DATA2__GPIO3_IO5			0x51e
> +			MX91_PAD_SD2_DATA3__GPIO3_IO6			0x51e
> +			MX91_PAD_SD2_VSELECT__GPIO3_IO19		0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CD_B__GPIO3_IO0			0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio_sleep: usdhc2gpiosleepgrp {
> +		fsl,pins = <
> +			MX91_PAD_SD2_CD_B__GPIO3_IO0			0x51e
> +		>;
> +	};
> +};
> --
> 2.47.3
>
