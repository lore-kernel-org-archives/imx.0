Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025A23FBA7
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781189601; cv=fail; b=gAEdkvP46vBTAVYbHqtF/1IgM1bE0+O0lU3ZnCoCM2FazEjv1qt08e8zfH/3zkg4dYY6eAXKtcCagpx/G78DXCE+kYGpb0kup4s7vmSUXkMOEbm9cEm6dF+xxsgmu1EZc7I3U8pujcZzVQNITAot37ppfbLW6xpobN/6raAfYiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781189601; c=relaxed/simple;
	bh=q1cVp6qNyQoOFuf9IXXAxJAFd/VAwkLb32iWD3Eklgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D7eoePNx66nCuO6vcM1xUBDR/vKIgZHN1AekPnftMx0wZfztE3Uyz2d0G7nxz+KesVndLRsBDA2y8M9my+BZIJ+F3kZgFMtuo4hfBNgDFE98+ALpRtsERWQj/u2c0gYA1SlKfUTFnPgbug8RBNUAH6xUEAhAHdNySy8va3HiReI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZSgG3RKC; arc=fail smtp.client-ip=52.101.69.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZSgG3RKC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzWKfspVxZ7iUChrdqmTKCXjUXVS9dokwOTP/VKeL28gZWcCi3/x9eWU4NpGTDGvWXr6mc35G0Dpznz/D42AAJLfjADJZpMXfjq47ZCo6+4hs+jnmEY7MZspfHSx5/X0WAee5qkxNybu7dXZSDN7vPMpaMg4+pdm+NDZijSr1EF5yyhw0RfBaP9J47AgXMoCJS61SRAaYTKSPFPRjSNe53erVdkx2X+RVt6kZbxxfVra7knC6DpNB7f+6Ll6mlDLbcZIQZdSfHffx4yFLnedu5nhgUpebB48fiF4uGjjh1rIDjiCupbaeY03p7ulGq67XP7zw31NHf2SVYIS+2VFEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Gg1VFZw1PfNh4krZ8ijzOr00e/Be3YOHjhAkrCMPeE=;
 b=KS2j8FBT10JB+drns1uBEftnXrLDrrqFCm1N/zc4YWPR1oAnwwLPvxvta3Sqrz6FnD2H+zijIlRaEcFbZuJXzjIyJiWbOpW79+cwbwmTe2yuWns4r8Aq9fqGyPPAITNhxcJ6dTHOpFtPRshIvh/IE5Qn91UAixtHTlZ/ER9SWOU//qrDhLRD4bztNs7AQGtPRFDqPDKR8FxosqVg2Ph669RZPD6/LPgYNfohtdTgDJ+6ZeQ/ZLapRf8Bcuvc0tUwsPe0BoSXJL0+Y9/XOAG401iKsQeAHRycgkwSInaemISIMz8KvZrbpKSHB05r6hoIciK9dv9FO07Ws5rgTccYHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Gg1VFZw1PfNh4krZ8ijzOr00e/Be3YOHjhAkrCMPeE=;
 b=ZSgG3RKC/hWtS4H/McfkJ022Nph+HoRtJrYj67U3An/z58JH7Oma3pwG4A1WetYrDk4OoRCKlTyHI1fiaj6Y/n7dlZwsaMXsF2DDBkiYFjuRANDMUqhbqrTVGSE4e1X+K3P1A3SIW94ZYuhAZB5ksoNTFVQh+vZ8+8daR2gxhM/97zI+L/22LlojNebmeLhvLbFUF32Oi7/QFPVvKmR9AWRq/GIWylz/r6hSTfjpI0090KzrzcS7NqBHmWq5InR4wWt3+XtLAJzqCS/Ta140YuVe6PbynEsj39kMfzt7bL0SJaL7BrLRdVqAOZHqTdvCCmPpjA5pbRGJYiAkY2btrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10763.eurprd04.prod.outlook.com (2603:10a6:800:27c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 14:53:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 14:53:14 +0000
Date: Thu, 11 Jun 2026 10:53:06 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp-frdm: Add missing HDMI DDC pinctrl
Message-ID: <airL0l3pgGRaPFVt@lizhi-Precision-Tower-5810>
References: <20260611-imx8mp-frdm-hdmi-ddc-v1-1-b4e4c9bb0729@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-imx8mp-frdm-hdmi-ddc-v1-1-b4e4c9bb0729@pengutronix.de>
X-ClientProxiedBy: SA9P223CA0013.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10763:EE_
X-MS-Office365-Filtering-Correlation-Id: 95f5ae58-c24a-4b73-aa6c-08dec7c92a42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|19092799006|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	O++BhAkfRWTSJfTDFnCupXs9RYMY8gG48yRQqIMadezR0zxwb5YvOJkId2LwJS9RQsXo8LR2jvsEi3QYymLTuET0nhMt2kvdcRSSE6imBgkUmAS+qXpQQ+wug17RkIWGal0VFpqF8FMJsWtiJyQi9VnW/PljovvJLSSbkHPHeCRUtridAOiYSB2YBQDA7gT/AQHRH///GRtDJyUE+mnSkWirhepsegvRYjx2RaVMsa/+27UrG5bwSy+ZIR2Yv8ku50eb+5yeWXEkGw8bbbyMmFgboSjotT7uPS+t8/bWxUyMim6x1T8xGkq2hvuJmLINVfP9cyVJk2duFnH5/bsE+Dl+BAJf9gOnyytXQRtfjMGc5ats8hha8O7+TI66Y0l/d5G41bzuN0qUF4os7EwEGpkV1NYAu2wvinX+4jL6SmzyVENvSe7Aheoq/oqvovEM441V6IU96MleZovNd3+JOap6U9JU/MKot/qt3kah6Q5rdGBNQi/e9bpUJdgvcBAVPSPPXHtR1XNA3sE0PiIdctFTr0IAP3SGXwAxVEn8ehLhMhx6o1MQDImczBRXr23q3KcuRVWIaoss23u2Gjtf/hGOoWNOjgqkJuAKU/n/X69Hyez3aqDz3pXWgpj7UQQOhKzvIqm5WjBhMWOJ2jjQy6vRZR1eiw5rhvUBiDuXaf/YCHWWrsy1AhruzGETuZhC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(19092799006)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ms60Qp8KbrCM4YD4CHG6IjxqKdCs9m0TJgY9O+fVECvNgqZ0OCrsBdoqt4/i?=
 =?us-ascii?Q?yVv4OEVa+tP3IzTzy5gPIGcb1OQtgA5UJ1TWds1Nld/ZbvKGTOYNbc6wk3W1?=
 =?us-ascii?Q?slVKeML1bZU5+FLLFquQUpuqZd7z3DrUdi7A75iuhpMcSaTORGsprQH/TDWU?=
 =?us-ascii?Q?mGnBjG+oKo8lMciBVXgRg09J9wnFYUuFtTqlQapx3kE7NbZ4z4bHMdyZ60bu?=
 =?us-ascii?Q?5EdVr/g1uBYr5TpGoATm9XjoCIRjNnZXR+sRGlpYfc02Ln+Ba38knfEfasiY?=
 =?us-ascii?Q?O00BvyUQFpjkNVl1dLi8Qfd0cYcywbbt4etkaHHz1WBQwH/tp0S75K1moRAY?=
 =?us-ascii?Q?LeNzPeC+LGvEtrXGzc37VmhHnj/6ERqCs+vQ428loGVvIw2Yj5zpjhTOga8f?=
 =?us-ascii?Q?KKW6K1xHiFlDGKrOsY8H7JdEAeSOMHbwdrICf+AoSNn5aTD1XdjcV19tMxcu?=
 =?us-ascii?Q?T0M+RXF2/DA/Rt8qEbl/ipVan4ttNacq2WUP1PatdKFk41+s0IRmYpPPPFgy?=
 =?us-ascii?Q?plC9JPDyx0bAeudN+yrX7gcZaQhLzf6PHSg1a3R5a+KqsvlhBVE1djThCMlo?=
 =?us-ascii?Q?ajAZDlH2e5ncjvSVGFqTWGZ0Hd3KaELhsJrVu0v4yQR37oUAA1OmHC3jb7ny?=
 =?us-ascii?Q?UOKclUNtAUF3daNdz/HCrINyBUcy3ACy/pZ6VxjYeNXAcI6JWpEz74eh9GkM?=
 =?us-ascii?Q?ZjDdHCVGLBVMkOjRKT8BR+0TIp+tKJ9Q0hA+P+CTSQWL6PcQR/znzTsVCbYh?=
 =?us-ascii?Q?OR31cmDumn5EtarcOuTyigJg8WG7di+lVwFic/nGMyP5hOBinRt9lsd+gTTp?=
 =?us-ascii?Q?AT97qRBdp3ikE7YfSFbkm/IWtQpvA/0frtaw4ormUlYdfJhx3GwHJYX2eo/Y?=
 =?us-ascii?Q?lonp2Xxx4vBf0RVMH4fmlR2CZtmBrfomWTJbZwgq6NeYPZ/3znqDu5jX/KmV?=
 =?us-ascii?Q?n4ZqkwvHcxGjhr0FvoOBoce98KWxzKl3oBvp5SAehMIHOh2EkKidjr/WD4UM?=
 =?us-ascii?Q?UkcnA9TL5PZ3aiY6Bq6kSIsgknLo/IYWZjvAxBkqFnbD1dqYshnr8z4Qq20W?=
 =?us-ascii?Q?9nqO2AS129f+0mTblEtdb2GQp/ZRIGjEsf+v+HGmUG1Z1+2eqDFGHLXv1xCB?=
 =?us-ascii?Q?3BzGKU8aEenfgpKsB0X6igd48hl/OUA72lGA/P0t9Vqz8cfeHP3FydfWBOgv?=
 =?us-ascii?Q?SfXdVo0QLxM6L6UM1HtYYDCiHqfwC+ICLiPuvHFd8DhmbcqyhEOLrZmy/wee?=
 =?us-ascii?Q?vB+OyYkEHAGsEoRzKKsahZPN6UUxc3YTxMFev31sbnpwGdg16/ZKwinwweDU?=
 =?us-ascii?Q?fTyeOWVezoB0G6tgFd4latpl7g6fZ6D9oXuS7lSRQa9w+/jGU9TAmC23aJLO?=
 =?us-ascii?Q?DoWmdty95j4YBNsJVIfEe9zCpLxHSObF3744bq1c+8jEtv6g3a5eQIQfV3p+?=
 =?us-ascii?Q?pdpAXWrBJlcVvk3wfR8by83dc/l+v07outjPXGXBvSc9aOnhxVUea5NaPmyx?=
 =?us-ascii?Q?ALo/M3xPdq/wBjpPTcYFVfBr5sdK2ihn6kVXQ3nRx52GZl4404GhJSe7D3kT?=
 =?us-ascii?Q?xLs4uZpzWFYvsP+eRbR+C3hUMXwb9M/uHpmRnk1CeRGgyWXILpumRAmdJiDX?=
 =?us-ascii?Q?O4+a8zb9NdJHPf7idbeaUZccjY2+V5e9BeiEY/0Vzql7NPqen2nFXVXRkyq3?=
 =?us-ascii?Q?xKqDuVVXTbcd5HfFdxKhVGaZt6toleTXy0XD/9OLMGDJD/zqLKz5yEEqQ4Dj?=
 =?us-ascii?Q?dmKW9D8JnTx1uh7pwn/zkzC3NTeLsVY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f5ae58-c24a-4b73-aa6c-08dec7c92a42
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:53:14.7535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uBP68Len2JVkZSTDjhCFj0wjVqTDMsqeVnjBbz8bChT4/dFOgIb4NBPLf+km9VjowNhAAvQD6jQwiHcor634tMJrtnOZ65WWAN0fJT2ZGPgPJOWl6ORKXzURDf4EeQ0c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10763

On Thu, Jun 11, 2026 at 10:18:59AM +0200, Philipp Zabel wrote:
> Configure HDMI DDC SCL/SDA pins to support reading EDID.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---

Fix tags here?

Frank

>  arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> index 5fb9714215bf..f43330d1ff8b 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> @@ -562,6 +562,8 @@ MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02		0x10
>
>  	pinctrl_hdmi: hdmigrp {
>  		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x1c2
> +			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x1c2
>  			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x10
>  		>;
>  	};
>
> ---
> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> change-id: 20260609-imx8mp-frdm-hdmi-ddc-715a3cd5a9ff
>
> Best regards,
> --
> Philipp Zabel <p.zabel@pengutronix.de>
>
>
