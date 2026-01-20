Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0D6449EC6
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 16:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768927092; cv=fail; b=QMSVD29W9ASrnDC0cjztOxYsfDMBlw6Qr58BTa5BDnkTzDYaUP3GomYVXRreC9H2ivUPcgjM5xao53PisbJSPtZ9pKML1MpFJf1KshY7gKz/TAg0cLXDrzZzNgGgJMwKusIuEljXjm7pv1XKGt3LR5bcBWjY6cJ4UrXbUP2Ib+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768927092; c=relaxed/simple;
	bh=XeXBaRAxuCCbTBxPY2tB1Qmv1Lf274+FXVYJAbQsw5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qyMuJXRabGluxeE1+C1l/pqAv4/eY14n/033O685RNTPySvw95XM4OCXn406dW5PS+hvttTrxYUUmP6UwnZhCAyb9uoj47dsj4nsQsdf9usMNUG0Ip9ZCsOLvFdCz0ypXKJtjPh2F0Hquy9BoxdoyPTBp7tMuZDFVPnTL7hv30k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zusq3935; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zusq3935"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m8f8eZv3Gr31v3jpmnEczSpp59NCHITqDaRz7YwyAAQA3JeiKd7Ayw+Jjk+iVGz4dTpJXU4caXTUCygmbk20pDY6ka32wcRHECIJr66ebjtG2/hNFluakv7CeIcVHx7AvQEhkuJ+W4UYzmyf0XRnnXFca6/Bit5VcpImeDJeIwLDI7kbTxi7b86bv9VDYOsKX2zk6TzqM6CQk1pVdQl5UBkRfbm54rJ0I8vXcan3fkm4wyBNqgvviqEXzYH086fSdjsCiwlx8LXBz9nDT3Vx7Onx4Y3GEpxWBkYNHvYjCW6QHPCD6M78GCxggLmwScCaKSkNrY7SsR9eNdzZlnPScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eO/NxxHGuoHGUTjI5r6xUQxk6ryzZKtIa6QfbXJc3QM=;
 b=Ix+ACdVt95Z092ScVW27bhB20HEKgDWwnMhypNYrWbvBcL8S+hS3mAyCe14w2eMr5ZnRs4cJjtJaZVkqPjpXIM/gts3foAMXCytC+/e11lChjm1ZwC2GKDfnefg7gps7QwrxQpotBehDwv/GnTLC/OxQl0jNVX7+ws8z9CmoFnF/6PfINttPHB06zxLzam8nQcAlFQKcVvqQthD8zvHVaY48jy6Gdsf2g381OAT7EGPZLNm2WELhdavyXSxI7PH99uR32y6G3c/rZ9WKruaMhBS0yuaLCAgLTb+yIUacZKqaaB/D6+Wn7M3ii0VyDM2I/unda1brFAHPYdy8VgdVIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eO/NxxHGuoHGUTjI5r6xUQxk6ryzZKtIa6QfbXJc3QM=;
 b=Zusq39352iBWGJMhy78Ae2uMP3ExM4achEaxKz+4u9nIQRX/Gyn7npQeocjIfp2uF1gMP+FlBFzG34Aa4ggLBhrKO7RtQyEiRly2Wp+uY0Uaaag5p4Tc4gFHIbb+GipncBZRggBRMabNgu9U63kX8qtCubNM7NuAmGgCE0VlEvrDKKYS6LCafqqlkqkIyLUjvL/m4qU8w51BPSh2ifeRBLGTLwBT+6B/S5g+Q1SrNDRDd8Z7HVLMxuVea7TLHOHdjHqzuPLd0UIhip2uig28GjxMByyj+yvXD8i0YOgPtBVbdkYcZpKjL0/jiP/B2Wo0i4mjlyxWEjmbxWf8lYYqxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS8PR04MB8229.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 16:38:05 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:38:05 +0000
Date: Tue, 20 Jan 2026 11:37:58 -0500
From: Frank Li <Frank.li@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: imx8-apalis: Disable the audmix
Message-ID: <aW+vZgJs3cb+kGH5@lizhi-Precision-Tower-5810>
References: <20260120100221.47274-1-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120100221.47274-1-francesco@dolcini.it>
X-ClientProxiedBy: SA0PR11CA0025.namprd11.prod.outlook.com
 (2603:10b6:806:d3::30) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS8PR04MB8229:EE_
X-MS-Office365-Filtering-Correlation-Id: 397f4b05-17ca-4fe1-8cd0-08de58424922
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?xrspBazuFudg7q/VRFWZrNpYD1rZTcgU1qnuEWrsBI/AVCF1QvbhL5L3bVqf?=
 =?us-ascii?Q?eTbRykDY/pv7QkJe/+97UBgtSv1Vel3Um/PlJ19fJeOfHMW9cQsBJw8BojDY?=
 =?us-ascii?Q?Tv1bvPHzEp2zjBhKFPzHLX+BZJaOti1xyuqjMu6cNmE1wrFobWDuuI8LfJRu?=
 =?us-ascii?Q?94YhjZeXVVO2xyn6rvQn1qJwvX2nFQd3Kq97v5EGAelNaDIs8LZz3/3PgK00?=
 =?us-ascii?Q?Ae7JsaMVac4iQXQqTdHrWcWCryNrJANaKfF28WjfOe+DXJBdFDwRF28q/wh8?=
 =?us-ascii?Q?9357Fnx8h3vHHX8MLR9pA8Ii238pRAhNb6/zDaWK4tMbUYPsaYYP01+9YWJ/?=
 =?us-ascii?Q?el5Ge5ryYJtqQlC3E8bdWw4fWpCpL3onD1PPVo9aGPG8OCr/Hd4sAntZCLRD?=
 =?us-ascii?Q?PWYwYjwGHcvxwSAyTn7fmlSZ6ReaSniftCafmDyKWWu/NhwJKjBJjzZg7RLh?=
 =?us-ascii?Q?yIYLd3zM4KBUHIaNQdFi+Q3fIR1FyZEUoHAMPvl0XUJm8cBNj4fRcPStTITr?=
 =?us-ascii?Q?mOJ5/4m8GZT8X4IIYXA6LVd1QtxHEZTN2SxEco4Z3icvlDsW/3KmdZr4+2Dy?=
 =?us-ascii?Q?Gx/SYDGn8DTjLZvoxmiIF0KpZrT7eNdiBNhMm0Ry4BCuyBIcmpjkhcZfOEHv?=
 =?us-ascii?Q?l1f21dg39zJFkihMT2gWnz9dAysM22FRrTxN2HamoZbvi9o1tZOD63puiOUt?=
 =?us-ascii?Q?C5e5UJ9J8lDdYyms7RpNbAui2yzZNCe5iFTTIj8P9c0pLifEV//DTx6s2Q4+?=
 =?us-ascii?Q?d898dojveFCarizcc8jxxMA7R3OEndLNehBbgn4h9RYLLeSA2LRz6UoH5uTt?=
 =?us-ascii?Q?JSX4dsgkeYPdasePkDVxT4azw8PhcSUnekylssP9M3z9wTPwLQYN0w2JKJrF?=
 =?us-ascii?Q?14cQKxXwkJCwFh+B1SNorPtOY28846K+m4U5vb6Dexbn8kd0JVCzuekTZXdE?=
 =?us-ascii?Q?yhhnX9Jf2v7zPyFEjXfsCmmE07iTgnOLiv1RIKDk2PVSJDmp7n5fQhj3XJCR?=
 =?us-ascii?Q?mK5GUAYGB7UU84aEJpVaFj8cmJ5FA/JqYUCAwCHPpXmDJPpQRssKvVCd3Jql?=
 =?us-ascii?Q?1KGsF6jauNS07oFTKiPzJhxd5e/U63rRaw2PyVS9szmsETwM0lLY83x8s859?=
 =?us-ascii?Q?XtwkMlJE2crEaaDalpheA1MVK9V4NpMblbrYPXZhXHqEcBUkHZmFPwziBQnj?=
 =?us-ascii?Q?lQdupOTuww9zv6CvXhuqTMZ6mmQ/ExtHeo4k3ubHTEcRKx7YTGm7whhwpEAl?=
 =?us-ascii?Q?DrDNBze2N4vGoLBIsPQq2uKSno/SNslDZS1ewtLrkrDND7OgAM3E+xEEqZpV?=
 =?us-ascii?Q?HD5haMQndLi+jBNm1XBdPPJuthr7QcxfsjHioWFBtPI4SM/sMa5ppggevoB8?=
 =?us-ascii?Q?un8gdOnT+xu9lsT6gjB/wePl7ozvaQYF2Ml3Rugb3SFZiM5P/xvtidp16gpi?=
 =?us-ascii?Q?ZphBT0YslNQ+RQPfrJ3RGqA+QDBc3GFGaIAPc1hDX8i5AXbiZW4DhRVbWN8K?=
 =?us-ascii?Q?AKyQOaLZKhwLN7WgAtSGy74EdHTXabVlvc9uWsf9rWiheSaYnB7I461oNS5J?=
 =?us-ascii?Q?dBHgZ4EKhd0/kxk/calA8ah/JoAHl7ElKZw7Flx3cmxhelJ3dqqXkS2bH66/?=
 =?us-ascii?Q?kStgxXpqLRmuZoixQY9scLU=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?2dMDv65tC47yxhEsVmTnQLa5UBigamCtjTGk1QuJHq5iu2i2/gRydW/9IfZF?=
 =?us-ascii?Q?rS9+FjtqSnv95gPnVn0ucuXIFSjwuiaZSQbPqX9P7WbNSmGNa4V23OZN8pMe?=
 =?us-ascii?Q?vc9zkfljLvpH/XLninAL5C462e8CD5oIJSE769d95G1z/hY7wEJ5xRUyWXoe?=
 =?us-ascii?Q?zzA0XxBuFRE1g2MGxaBKvKK7a5cXsOAaKpuHm4OXDyfoQhoWgra3O6pBy94Y?=
 =?us-ascii?Q?t+h1eB1vtzOK6bm09jwjEIUCew9TXmKHj1MZnoeNyfZb9nWpMKh4T9gWwzmu?=
 =?us-ascii?Q?tKNxCh0DdY2y/xUwS2dGczwVpdMV9MW3j7HWM4LUlekw7a61EWcK6/c26v8A?=
 =?us-ascii?Q?E+Ztv8odUks3f8DRW9mRnB440kJjTeZkbVYkkUDYGmFU0ghq7e7Jb0kWH+ub?=
 =?us-ascii?Q?uHeZpvzyWLrHhT/73AYI7g7pdfzF2ybw4UzRHkqQTkAJo6xfkhV6/r9blMHt?=
 =?us-ascii?Q?cVff8XFksma3DehXga3fjWmDaSY/YD2HIrGcelh596sbwtthnGtpf0Hm3Y3t?=
 =?us-ascii?Q?L5oHb+zRc8ActtqSzz15lozynCM9PuC/hT+/qUAHqrvUC+p91XMNFrec/IMP?=
 =?us-ascii?Q?JNK3Jfi90Iw4EmqN/l1BppZaEGsfmgBCNnD9Uyu5DJoM3UgjeVMK1m3jd3hw?=
 =?us-ascii?Q?/FJIGlQtLnQ+POoTA2DFnc6FniYiuY5LoFtZ4hL96jdFODg/ppaxa9ppopP8?=
 =?us-ascii?Q?iSTBDvJmxXdC8wpuTDB1RcOnxsHvX3NAo03313UP5OqQTVdBKy/H1l0iBuj1?=
 =?us-ascii?Q?avYBsCl3iuetc6BBiYVxlo7/6kR+Y678hbrSCl4L3/RLKFYRGyFLVZHj8cp7?=
 =?us-ascii?Q?5axFhDyM+5OvThWbY39RH0B0pEDNhW6hbAL9cqdd3ZQXdiabvt2/5r11p+pg?=
 =?us-ascii?Q?3PoiczXLLYEaWOrpGuI4ZblmpZZfyPYTPvNvyRsPEChmUYs+dqQhbjYdsK9P?=
 =?us-ascii?Q?FUi9smtgGqoSpOoYwjzsl3IMGoY40p5oGlsWzTzmMBfsyEdxIsqY7ySoAWYB?=
 =?us-ascii?Q?zjjAQzTpkXChW9OH3GLdZIZf3I/4gHjisXoxLgHRbgaubd3bewpbQxzOyqP1?=
 =?us-ascii?Q?O+ETxxrReZU1LYyB/l/45lfoh0lDEk4Xzk1CANzP2frlyMI4cUVg+LeejTbW?=
 =?us-ascii?Q?cI016+iAnIw5/9Zjz7Lj9Dx9NJaAP5iRZkAO8tSGj/ru6ZxVLW1SrIp0Pqfm?=
 =?us-ascii?Q?XBd3mi/M+BdokbTTuQBzNjhvorzZ2oMVT07WWw2qh/dgP0a8DXAp4NgeMX2d?=
 =?us-ascii?Q?mF8UVmNkICHutAoaKD5lntC/eNaySJOAMOVpbdRFzzN4Lo2SAvbGZWTenOZM?=
 =?us-ascii?Q?R/mf2Bob5Q9YJ9X7xOq1zEI8Da+VgXe5HdHLhN0Z7W2SRQF/b2K3fr0r1b+a?=
 =?us-ascii?Q?i2vY1pOsBzos5bl0T0wkUe4D2HIkuZcxfFHrsydsGlHaE6NvH+DBUUJ20/er?=
 =?us-ascii?Q?IiS1Y2X7xMHJriMExVTRcead1nC/KD0AA/MY1w412XtsdKqdy/VpdPwLZupq?=
 =?us-ascii?Q?eI6DJWJMyu09AIJMd7tRbboFXx3i4/lYRci38GNQqBAWVFJE8/hFhrZQpjVR?=
 =?us-ascii?Q?wRmFOk5i+zsLoTszFg9sgaxJJwUBis49cS0Z1aWUnTwrq+WiVwViJ974tule?=
 =?us-ascii?Q?Px8WnXjcZpIf8uP93GTSqypthUiSegoZDsUzW2jj0yr1IHmUTv3d+RDbn9NF?=
 =?us-ascii?Q?Z7JZSczgDqVTSRRMwO2mLELeiV3YJHk1xR/kXUG7KRrrSy+p?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397f4b05-17ca-4fe1-8cd0-08de58424922
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:38:05.2300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgjQDTHxrM7R0pFbCRxW1VaadXBlRu0WkBEaKKBdL/FYMWztFgsWHbb92I+76nKaYsD+JDYzMzGgJcKmXG/YNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8229

On Tue, Jan 20, 2026 at 11:02:20AM +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> The audmix is not used on apalis imx8, disable it.
>
> This solves the following warning message
>
>   imx-audmix imx-audmix.0: failed to find SAI platform device
>   imx-audmix imx-audmix.0: probe with driver imx-audmix failed with error -22
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi       | 4 ----
>  arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi | 4 ----
>  arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi | 4 ----
>  3 files changed, 12 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
> index 06790255a764..6f5af37ba9af 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-apalis-eval.dtsi
> @@ -22,10 +22,6 @@ &adc1 {
>  	status = "okay";
>  };
>
> -&amix {
> -	status = "okay";
> -};
> -
>  &asrc0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
> index 7022de46b8bf..97fcd865fe3e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi
> @@ -62,10 +62,6 @@ &adc1 {
>  	status = "okay";
>  };
>
> -&amix {
> -	status = "okay";
> -};
> -
>  &asrc0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
> index 12732ed7f811..b70cf3e8f8c1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi
> @@ -94,10 +94,6 @@ &adc1 {
>  	status = "okay";
>  };
>
> -&amix {
> -	status = "okay";
> -};
> -
>  &asrc0 {
>  	status = "okay";
>  };
> --
> 2.47.3
>
