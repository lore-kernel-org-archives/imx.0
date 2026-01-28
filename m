Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873B8313527
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620241; cv=fail; b=PRHT/aKX722XIG3qR3WSM2QkXXSeOUVARsKze0qErXpsf++mdrWPTTUKLkMBtmMOSeJeJSMfSZfP35aNk/oeGQ+SK+6eJ9amgC6HPpS0S5W/+o5NBrqK+yZC8i5Al+Yh605UpQmAx8YMcaV1rj9eP3GOVbnALjtwTEwJIaAYKDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620241; c=relaxed/simple;
	bh=ifMD6TvYK3Z7RpBxUdFCRI9gdTDkcr4jQdNSbAM2PRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CXBI46FDefnwIIESKboM8rbkg07enJdZ3BraRsAT2F0O7aV9/nbQe6wx38aYLTuFa/y/0Ay/buIQM6ojBN7oAfZOHT9SmM8oVs5aX4RgH3McvLPKOl3PORV6UXO71YtK6IrRzLu0x7hlTd/+5IDPLQTRjmQxYq2kB4wDwzrz6cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Suqh870L; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Suqh870L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WowaamydEN2YZDfXfbf8+daovl6NTq1OpOmEo4V0YX4R65AS3soK40qURtg8IFIAPgiGQTnZXsxrfsQsMnrxRcz5AusMZaQRZGXEkxt1P2suwEdpoDJ18FabfkhmfisULebdgi8myz57JccFd4uSJA3BN4fye8gnUKvlKlyOwQZwfhNlA4nfmut5oDxBtUM22gyFTM0y6tqAfDWGr+HVYlcTVQLhbc/ak3qNfNJHMur/FzNm+4zilFGpj7fZrSnGegICoPYPJpu6DIqsL/5y2mZl++IGX8n94loFqZEZ7BUvcnLrDajFnj47CJ7EbRRNtIZFOyUO3gqnlXIf7THXFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Foqb9b67v4svjyNEiYZd2uip+NcLMR8sk6CyN8E+OGY=;
 b=YUU/4HHiGEcPCXx4MCq18s2Utce313azRr9o+fOYRYpzw+ttPrGoOJXasvIzr1hxDXg+bzs5QqRBBcuMIUWZU4CLBaDsd5wYqS4FxnoVvz24yEn5lvwGw/Ma5D9qtQlXww+tllL5Q/ArisMGquBY0HflcNbESbYz9KXzHUXNDCrUb6K0iRiwfZcpGOnvJhYy4j1pBETncD6i30Ruc5hk82Tz9+wgDPCSGLTVlB0KKSzGjRePZxcXTcHTOTezdjdtzlMvNC2NLDvRcojjoO8iqaVp81MVFUk4eteFNsT1dDtIP1dS/w6VFr8Z2vtfSRAAJtbJNCR54rMqR1bogEuAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Foqb9b67v4svjyNEiYZd2uip+NcLMR8sk6CyN8E+OGY=;
 b=Suqh870LgCtEkqdUsMFb9JTzpzJLbRYTMVdBbVla9CXZDTd6eaGAK7FnddbGME5GlIPlErXx5SM+Z6El81JO7fnFdrI60VrbtTibvEibM4bLNIDWueWnVsXXitye+qJhyTMLUyVGSpf0kWWQYgCclx2SWzlDv0kE91l4AOEmUr7+Ea02N751CnsHz6FXCMyhBP2rCLJKrZsoXQuu7THsgnQS63lomCVOPx92mpmpyINug7sPwu4wM2q3fytg+XZk/J8tKzUQDTAYsyE0MF3uasJUf7TCA2XLs7emib4ZTlhyvuv1KnLfdhApXt4wTomACpuYzpO5H2uRXJTI6vjHbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB7714.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 17:10:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Wed, 28 Jan 2026
 17:10:34 +0000
Date: Wed, 28 Jan 2026 12:10:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 2/8] arm64: dts: imx8mp-hummingboard-pulse/cubox-m:
 fix vmmc gpio polarity
Message-ID: <aXpDAmD7ae8i1T3u@lizhi-Precision-Tower-5810>
References: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
 <20260128-imx8mp-hb-iiot-v8-2-9646a3025cf4@solid-run.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-imx8mp-hb-iiot-v8-2-9646a3025cf4@solid-run.com>
X-ClientProxiedBy: PH7P220CA0133.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c07d87b-fdba-496b-df8e-08de5e90266e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?rP7R3N9aR9qDxavUzt3tyHzYlloDIKIzd/K/zfkIb6aVR/0sr1jKyp13r+iS?=
 =?us-ascii?Q?O1d+P9WGY1t8Emp3tSa57y5+e0B7WadFHbqbqf8f/EHaPpQiohpJgkOgusPw?=
 =?us-ascii?Q?VTYkI9G61vU90U2G+0U4jSXBMqHdVmdwPkX2i8k1Jg7qjloEho7XT0y12VdE?=
 =?us-ascii?Q?Wkj53kNZd/5zK3AF8d8HfnoQOTyP0VXG+XQbyEypeU4yeIYMJFWvUj80fTUN?=
 =?us-ascii?Q?EiVzxaViKulxpikkMJrYi4UkTlYXMER4pS+xYRHKgMaWtYHO+M66FphWGKY1?=
 =?us-ascii?Q?tqLaoyMGuCrfQtBIb/WKffKNgPJ2tbm0GenQDuGlrzA/2ovUIkqzKEM6pWry?=
 =?us-ascii?Q?+9ocVYK9sqqFPZXGlcZERWUS0GMD4aNxvdKiYX8TAR+unLGv9Jt6uTDK/3Os?=
 =?us-ascii?Q?j+wtjpi/kfwOU/3UufzC0I+bns7b0fqKt6dOJ2Sl/VKni1Nj3mcNyedOQcow?=
 =?us-ascii?Q?+D0RrShr6HMD4fC/yNPPPksAYdfEcbV8EBqG9iIqcDtKc2UvJW+XjxrSaTvW?=
 =?us-ascii?Q?mXUdCwSQ5cvAnjKMFKtxrD3c9JGrOtqcf/NbpkbNvoyrrCQBq+C3+azmvszZ?=
 =?us-ascii?Q?jHUbskkDzLcyVmIGdDUwkQuhbK4CuytAe6VM/5NZAmBiuOzaE95E0mik1o/x?=
 =?us-ascii?Q?xBjMKBmu75f3mULGqV8RzluUzPmVzqr22IbZBOs8+y0ZymP+7+nTcLGUJsLw?=
 =?us-ascii?Q?1CsNkvrOlRY4aEfB0Pgv2OG7wcaV5XFcALAs+jElFsUstTzoBq9VyYcm9lp1?=
 =?us-ascii?Q?TZquS+mO/2o4m/DrhPLYE7bSWddVJOUVoh69sf9tM3yCi5cffDeHKntjOr4D?=
 =?us-ascii?Q?RYp6AKWsGbZbsqUzzMcBRxJbpyj3vlC2tHiK3oxVssHviMktJLi+/YcFVOgf?=
 =?us-ascii?Q?Kq2Fkp2U6ALwINhz6GmpI8b+x/5PuFW2kHQ5VUo8xaZm1qhjPMfF8jSrrEJ7?=
 =?us-ascii?Q?Lf6WcDLy2y9JTDhQjoUXMMb2wW26BJrS/fsJubdp/TcZxSo1uWKQVRSH/hnh?=
 =?us-ascii?Q?U3JGesawNyYUzy6PJa5ITVtgNp+2LIrMtDr0WjomcVPETJ1IokNL+46EaXVq?=
 =?us-ascii?Q?R+xC7MvS0s4gTTYN+4C+8u6SNaRUZyIbFy27ps5xqn2IIlSenO2TnWpI4kM0?=
 =?us-ascii?Q?DH1hDf+nn68jrtF2nFWkCPgEXHno2ONVnsDRnHbcu8IqInAHvyao3ah8jFTT?=
 =?us-ascii?Q?n1YaI2O3Y2JvdIWfx1UYZo9tay5jnDn9j4SdxitO0rLmbB1CZ4cT604og8aS?=
 =?us-ascii?Q?v2ENRENr+JW3Ft3dft2NiapqLt3578dwD51f2riylRYyKDg76DKLVWHawW8e?=
 =?us-ascii?Q?pAzIPcsy75eMGG4P6bhntUPFGQtA4klsTeZgK16lPLVF5PRfcm9brIei2+4M?=
 =?us-ascii?Q?77fEwiuYlJwEcmfatZR7AbQ8UjZcgzRH0FkMT6J6IEyKdhqIljNxGHeZyJkb?=
 =?us-ascii?Q?HyF3dKylNpKXRtBDnodQVwRsLlkp1VDnOgFB8WRZWPQkorBQuY9NTw+FdoTa?=
 =?us-ascii?Q?9eUfCboSX3Zw6eDY4sGvaBLhcrXy1mLUHWTEoTQZkLcsZGnXkU8u4b2G6NpG?=
 =?us-ascii?Q?jC7RzfukDFF2fiUODeQzi+hRbs+18jhwAFIUC2uTY8EhNHsafLpjiOEIfZAe?=
 =?us-ascii?Q?1EDj+ZrsiXFToPbYf5NvXGQ=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?jdosZxr2NhbHl3uVblOgqe2Dtej0BRWnVgcZhif3nPkDKpKjYqOASWPXfhyJ?=
 =?us-ascii?Q?LqwmONjJdqexvhSfYJSRsAJ0WSVlfyKpvL7YZdffGgrHatC4/jRVdniYrFWE?=
 =?us-ascii?Q?1W0BV/ZiKTauvXyIsLcEMZ2uV6ed2uPWt6tU8XlyhazxuNuJH9Hk01G4G0GC?=
 =?us-ascii?Q?xkmxz7TypV3hGIYmPu3kG5OrgOQlBtTmiqSCkLbzJaHyT2tzQB9amBnLrEqP?=
 =?us-ascii?Q?k9gEW7BNe+GnrI9nWvXz4EtpN/lKPstF8A6iYuhlhWT/tf6VF88+8L3YRzJp?=
 =?us-ascii?Q?x3SROPYRtHgvJJLKT5LU72errsSx0vt2mO2ZamdczBu/vD99q+kD6Ny1XyNb?=
 =?us-ascii?Q?N/a6jyQnaathWj4GJ7H3KDzwVB+0FaNWCLOqclANVX8qEgSOFFqEk79tgDoe?=
 =?us-ascii?Q?Dw3K6RQQ5IGldKQi9JZg2sKA1wlNxtrayXH/liRO9SO5lWk/6pn1hAP3kRAw?=
 =?us-ascii?Q?hHKczTFmaqhScjWwkMimTLAFNUXx1hcX9yaPQx6WUZTvb9e9hNUvW6ESTvzd?=
 =?us-ascii?Q?R7U9SNIZ/N0Z7EKf9PLNQDZIxFrNiwND04mM03RzYTlv2IMeGICuqJyEmeCp?=
 =?us-ascii?Q?tAZuv0UdULohOwPcGbILUq3jD6VFAwYm5tLl3nG4HKG9O8O6gjeZEtTcelnW?=
 =?us-ascii?Q?XY2KuK+kjr/u3kMas2xxJCNNfwwCME8hWTwwZKteVjBtFXzL1XP9hAOYB66D?=
 =?us-ascii?Q?Gg+mtB658SezBxhB2U/auSDPV8bmWBMUUHw7Rbr28bIQffZFuDD3MItBENr4?=
 =?us-ascii?Q?muWwAL04VH0YAaF4Q4EEJ9qWXaEvFieZatYPnIJYNlPV2fRlmYFBep0CtRwp?=
 =?us-ascii?Q?P5QDa+oCYZwGb2WN6K4NjlEG5J2+gX1Um+lYLEVXe8HXisQqwKH5LaFX2LbH?=
 =?us-ascii?Q?6zVi8+OX1CYgw0inlgOZXJiua0henYq9zDwh58m7LHk9tO/uEoeuOQt9KQSg?=
 =?us-ascii?Q?Xm9U/h+ysTZJw3te3v6n42GUiONPPUNFQt3vnrMEu+vl1FHO/Dn8KaUqjUte?=
 =?us-ascii?Q?sGIj3YLF3LvsJWvgSEGpQyNMcW4/hKaZO1kmiqyydfmKbyfxSn9tFnLG4tIl?=
 =?us-ascii?Q?nBurc1pxn04V0VZVmJn47g6dKhcyjQZ6pQ8NiFDAxVZT7B2qhy2n+rNMKhYS?=
 =?us-ascii?Q?p48lBwt2VC3fl3mlyyjBSTfRavQ8DBbrDufJ3OkOjjmseQKwMoM1D+940NSG?=
 =?us-ascii?Q?LHcJ1KwAmm0TzkJuhfGVo3znakbBKYvSEeKwW0BYTSRXyvly3+bJCZryNxO/?=
 =?us-ascii?Q?/Zj18TjsGO+eRlzFWpr2A7WBowOWSSOjjPeMymbpIP3sMiHINoeTCJcEyKHa?=
 =?us-ascii?Q?DbA7F9x8B0MFLJxGs7I/uzgu34h72+EiMObAQNm7b1ukrQ2rGJ8Lr6+pxagt?=
 =?us-ascii?Q?o/9tOu5dHWq8Bc/9nHGqFMc2d7fqczK3NsbMXJhpxUR1S0XU3AQlDeiHLkMF?=
 =?us-ascii?Q?BJGtGYwCIJwrzsRFk/Sn9kJkSLoCdj/0TEorqjbAlnfoVL5xhgcrE62UvFIN?=
 =?us-ascii?Q?bzBGH2RO3oFS5NU743mn4HK/zm0Gg15wykxi5NZ5OUkAOvz1CLbGR7RCwTTh?=
 =?us-ascii?Q?zwMdJsD9CX8sqShxuD5Y5eFkUBSGAmbk3zVDNlqBffnHMwQfF0K1JsgX+iiv?=
 =?us-ascii?Q?RE+jqPPXJpSlNaeoNWcW12RvYlGheiG/pyY0a6SqXrATyasnay8Ugl5EsYtq?=
 =?us-ascii?Q?4lDZXRq6+LvCsnzCYlkyMHWGBdMbAUHtzPLtLItMVW8qAbDi9LGTILc31ZY/?=
 =?us-ascii?Q?0HruF8f4DA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c07d87b-fdba-496b-df8e-08de5e90266e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 17:10:34.9202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYf0HEqXr7L1nosaPRTlLolEvwEAtaEw+nBHK0g3clnVc1ota82or63TFlkOaNuRlO2fMp9nq1pCcLcjIPbLoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7714

On Wed, Jan 28, 2026 at 06:21:26PM +0200, Josua Mayer wrote:
> Fix the polarity in vmmc regulator node for the gpio from active-high to
> active-low. This is a cosmetic change as regulator default to active-low
> unless property enable-active-high was also specified - ignoring the
> flag on gpio handle.
>
> Fixes: a009c0c66ecb ("arm64: dts: add description for solidrun imx8mp som and cubox-m")
> Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts                    | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
> index 8290f187b79f..7bc213499f09 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
> @@ -68,7 +68,7 @@ vmmc: regulator-mmc {
>  		regulator-name = "vmmc";
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
> -		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
>  		startup-delay-us = <250>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
> index 825ad6a2ba14..5b8c8489713c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
> @@ -73,7 +73,7 @@ vmmc: regulator-mmc {
>  		regulator-name = "vmmc";
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
> -		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
>  		startup-delay-us = <250>;
>  	};
>
>
> --
> 2.43.0
>
>
