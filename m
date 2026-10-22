Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792701104;
	b=IfVt6peEg98MtwVdJvSRKZO7LsTllyKMNqjRunMuOYJZ1QmVD2RAc/DbmK7CZnrzLR1T
	 EqnrV2DNVr3iAS64PAtdwYL7H8JJPIjHXjDCkigvsT9BlACIXcnZF8D9SHJN2iqF2L2F7
	 TG5a/NkVKoUOAlbnxonpmB+R9RdgKfQFECBE7Z4h6lTLEh0gygo8LFXBRVr7SVJiFChTM
	 Duwm3O3iwUEhdzLlQg3BLeX6nTlGYbqgKUN0AN2Ng6urDJzx3fWqfQSfPjQzIQhD6vuMI
	 50FUD5GCoiKN7cB+sSieEKwvQqnPH/CwGRsH/9ScmNujc3rv414/YSzyq9pkHLCbSmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701104;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LW0VJ432obkNHqOLZKOZC1Wdo/+XQhcXUhCSmSQ6gME=;
	b=LyOetzyyKW6Foe2iM/xoHW13EUIChGqrH4kK9+s+tdsRYoTvHPNn2AxLnTQdyPfQ/Jrp
	 EqjAqsPxgA9//7uPXEAYGtfZog07IOUPnoNUnVTPpKjMCOGYeTuiAN9hT5rFfEnkDNKoD
	 4G5PGvCdZ8prTsWQWeJg/eiNynHpMWbPO7g3Sa7aw6wLTgy4UqeZaCjtNCFaB3ZNFOwWW
	 LrKwzQfoXDnyY1TNZXtg31/xJikoALwqly/xB2vkxFVyIp3eIgL5Z7XQ+9PYec8v4N8DH
	 9NoYNO4Jy5+zwY5czEDc6ZDsa3aeOxh/dPd8hf/jnObVmHfRtvNYohIdVNS5mwzsUSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=J5dFCnX5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.42
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010042.outbound.protection.outlook.com [52.101.84.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F055B606A319
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 20:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F055B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=J5dFCnX5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wY98S6a6tdBn/z3P/3wbwM66m2hOyZc800A2bi3saJQMsvm+2vUsEjJLr7VOGEbyn2ay3J8S/o269ufdRT3v/KH8ehIDgI/ib3qkRGDV/fpUvlmbU7WriYDBMFhskX37bMSPHTUxgHqOGf/rwbzk0ckxGkts6bNRS2CL4zYTt6tBU3+Ad/ONXbTwPGDkB4C5G19dWQzVXdXQ6H1SBgGoOws0ad1XjW41oN9X76kolhl1KaXLokqFxkJ1b6dtFZ6JAHPrtEyu7IriXMBlbtwnQlz+wz1ChNBpx55vxuRLSUWhwd53ZTYT0QQ25SXUzyicIAC0wqAF4z+imSsoasFAeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LW0VJ432obkNHqOLZKOZC1Wdo/+XQhcXUhCSmSQ6gME=;
 b=kU5mmcTAuIleEDBlhsix7Ztl0WyWqKMi4WiS+1syrDVLgyetzDwiSr1OMpijZ7TaBieS4tN4osMiltA082P8fWNK1+ZTUjjVvgMODImZBSwqVsgDWWioTD9eQ8RDvIQt7NSCvtY1kLBJMdYJTQd3M9YQCl4Pu55nvIG9b0hLs+t9D1JFW1MOy3VMBoA+5GaFqoqZv1lI6xmCvlHi2Nr4OABSB2ZQBIf75MlHRNeB4UY5WDUbEMl6lyppdf2+0k5YpPVfEF2iZ6QXGohyXkpJ7IJ2u8URVWy4nI3ii3ubuE1hs/534IDw3CLzwD3KSJ7pZqY00PxehxWF2ZXbjG2W8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LW0VJ432obkNHqOLZKOZC1Wdo/+XQhcXUhCSmSQ6gME=;
 b=J5dFCnX5KkfMNf2/NaP0I4N5MoDc2dOibBOkY03NlQMrOcq1PAEvWPk4tyBhPxBj6qMBVp9f06Juh6T4xtQf31k95UUMvXNfSocIMXyw1hQDyIOZP/2jtC9SvhMcJfgVSiyXw234y9CgzJhLZK8uNNGHbfv0haUqi/jf+93Wpc38nCo7oDde9uILsolBjfSSXpGnGP05VkOJDibqvXD9faAJqeW9g3opAg5CCtBvCxQarY2mPKextsH7GnXYk9XTT20J9kXL5MCsBJADRvoIx1I8YBjTLb4CuDf8f1pSz8j59ADyxNkOgUmU34Hm0l1EHDxuaOBmgpKyFa4lJchKhw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:31:40 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:31:40 +0000
Date: Thu, 22 Oct 2026 16:31:32 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Martin Lukas <martin.lukas@chargebyte.com>,
	Michael Heimpold <michael.heimpold@chargebyte.com>
Subject: Re: [PATCH V6 2/2] arm64: dts: freescale: Add chargebyte Charge
 Control Y
Message-ID: <atpypGhYz0g-ok_1@lizhi-Precision-Tower-5810>
References: <20261009181551.6478-1-wahrenst@gmx.net>
 <20261009181551.6478-3-wahrenst@gmx.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009181551.6478-3-wahrenst@gmx.net>
X-ClientProxiedBy: DS7P220CA0058.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:224::22) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS5PR04MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: 379dffc4-f9dc-47ea-0b96-08df307b7a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|7416014|376014|366016|6133799003|10067099003|22082099003|18002099003|261021121427099003|261021135927099003|261021123027099003|11063799006|4143699003|261009223027099003|261009221227099003|261009220027099003|261009221727099003|261009223327099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	6UKoOETtFbkWoTwu9kHNViaGeaVAff/UWHbwQAOutM2z2aB18lxNsufTnu8bTEeBoYwiEhRsUcJ3Ze3ekwGE77ZLurDwJHTv00YrUF8bdXCHsZCYzRCppCipdnxRltXVgV1PGVlFO7ruxQo2ylPYh3wMrDMwHww9aCSB3ijNw+sh2M58FRa34s992ehAMPjbBx/7txfN2mGokhT7iZjDXwmBUFAPRCRzVuAtD1GtJ+Hi1JW612MeYaODdoRg1DBDZ1entiyKusrvSQA/fGO+A4n2P6mr3C2ImgCr+MKv7SyYuCwWWvZJUDKaoguMoF2Xg3C6ql3czU+UuFx+E5AzjuvdLvDGFgNe5HaGz76aZBzWjfCEH2CDaJF8psjr5rUPDN745tRs1C0rYzMaNDGIzLmjHZ6FIU0si/6XTLe1D/a3NBxUU1J32EZIasyVcrlzsWr83lPzyHZyDlz5Sr6JibqFDgDEEVLvHlQxLJy0O02AxnPSyn9PzCbHcK0NYQ2l/jB7PsAphESmumH0KHoNJH85Nu90Idq7rWGpDJI5p4cKcby4YUKrsPM2aOOGODQU8NNVBMyWb10evxXcCaiUhoLaQjl7Qpp1Wpm5X6HQkNYyyjeXgcE+AFWcgWAz9+TZx9PDzDoKqeXcpHXP0Hw0JgrRmfe1Ez3CncHVUjVB4zM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(7416014)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(261021121427099003)(261021135927099003)(261021123027099003)(11063799006)(4143699003)(261009223027099003)(261009221227099003)(261009220027099003)(261009221727099003)(261009223327099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Q+r5E3OtVUjhGPyCtMkXH9/nJBv0ZsVsIO/wTSYnEwKIwK5XKlvV0OygGIr?=
 =?us-ascii?Q?C/LHHFqzhc6+uOp+I1IRfBI9ffNccoAC9A1Vj6cudf2Q3/92kSPRlrebZl+a?=
 =?us-ascii?Q?23uHMjG9dF+7GZM4oLgB+aHndzyX0H4gy486ArclSfgtSs3icvzxNEGYVqqg?=
 =?us-ascii?Q?m7tCNEriNMzs/nsJ0e9qZm9iMpKRbCZGZ7Tpm7y4kOgd5lHkX15Z8S6bMiVm?=
 =?us-ascii?Q?JNdNje9OAEQFYkxqXaLMxjxlDFmxmGpH0Jj1rMDkW//Bi0JOBOjwEDgw1Fzd?=
 =?us-ascii?Q?Ksl1TjaZDVGueZ429tTPBOCmnpFKlouJZLhByef/3cyi9hQmEmOer3RAk/wB?=
 =?us-ascii?Q?Q7H0LFNrjXlF5iLg3qBXB+59LBcPiwShwGoD9SUgU31GdYQDrmIIk/cEUsjW?=
 =?us-ascii?Q?PqRs2rVlWvznj08hftuiA8l9t5SmrLZ1KEShTBdUHADFJlF9BY1DEBrqtHtS?=
 =?us-ascii?Q?ZY0D0PiI1b8pv3XyQ0koZEhzivVSHvKvFb6M3LC0Y02U+ackHpFf1RXbOSbv?=
 =?us-ascii?Q?LH8uEWf6x35Ztyq0WlUaY9ooeWVlYioE1E4b1aM70mTQbpCreqPjflkc9NM6?=
 =?us-ascii?Q?M8WMfJrRNjR0N/OnRPh9giRP1dqM5uJvRsi0wZiQDL8LwcATYlHFrY5+rYBo?=
 =?us-ascii?Q?P3OhptPnkVyIjHIUI/zg06FenpTDeCqDERiZn37E7BDTGEV2Cj9cC/wIpmUP?=
 =?us-ascii?Q?fV5L8Eg/bXjOtuwaO9JLaVOCJQamLMhOGaN+K+MVrQymbH8q8l/It7X6thi/?=
 =?us-ascii?Q?Jp58yk4s+2wbS5fO1Z12BqJGRJTM3dspMDPIviMe7BVUrDberSowyg8d7r3V?=
 =?us-ascii?Q?zu9v/6VihxyvcgTJk89XR1fzEmevymK4RJ3FSM7IZnk0qBdPI8ld97vGxl5C?=
 =?us-ascii?Q?8adTQhWQ0c/fcAZFBS6gMow4bz80tJngk6VXkoKQkYtyFG7wb8N/9bEtPv5g?=
 =?us-ascii?Q?9Lr8ERjiphYFFq6O8Vu9cwKZY+mJHgDE3ml6OREF63uIAYDCBMbwKdeWGcj6?=
 =?us-ascii?Q?WVW3AX9HuWSFjwg1FmgJ5EwD+Gy+B3sKBcj52tsKvS5r0tZ4CEZE0QNF3OfD?=
 =?us-ascii?Q?Di18PZF8oB5Phhe5mFYy0mHAfMHZexKy53yQI7ISKf99s/fubafcV2uGC+yf?=
 =?us-ascii?Q?gSVWYBOLMENJ+SFHkE6Se13ggShDu3/cFgk3Nwvf109ikkFElqCsG1DOp2sk?=
 =?us-ascii?Q?YI+iIChb6qh1CtBUWJArGEQlWPIwxubc4JchRZH1meKNDF/t0dPNms5MhDeE?=
 =?us-ascii?Q?k2hjj3EEgYFuxIQl5sC/RjfLI06SsJN7g9csrSHQejgqa7JjLbmWYfZhGMWw?=
 =?us-ascii?Q?rYmIeOTYoX40OnA7NJFjWT2WVrR2QcobCfdFO0M6YBGQMQuYU0JyUvKxnZjv?=
 =?us-ascii?Q?BzlwHImT0j6ohhg0/PkYwVENInJp8/tlhNspL1tif+iM0wDhTstO7nBoFx0D?=
 =?us-ascii?Q?Wzafs5j0pdm7+XYJs/00lO0HGxrN8v+PPobyh37GeLBvX4XqTegC0vIFTY73?=
 =?us-ascii?Q?iJ+QhbhVlfoDgIlUqXo8NXCoyYPJsP0gK/5XpbJ6EjKWyEZpV09qTK4O0cZ9?=
 =?us-ascii?Q?uMS3+YqlXFHxe6+gcD7lGj5mUyp0exC6SlHaANCHpMwSj6Kq/J0A21jb/OMO?=
 =?us-ascii?Q?elCCr5r8SVdO3gwWGY07tc26MpN7I55G67yZOIxITCVX2fE0UmNbWVxmF7xk?=
 =?us-ascii?Q?N1EG2foBosFYVHJSaSlyGkj3KR3uANvSrNMTbrRSF88iO6L+2x4l3uRiwAbM?=
 =?us-ascii?Q?OPjB4ul/Av2RoiWT0c6cdPEcfbGjdnx7xezi05GJHYJxt/mZPFIk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379dffc4-f9dc-47ea-0b96-08df307b7a4f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:31:40.1970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1C5Y7muXVkxllOxfhvL5T5TuywS84Fs2NYo0dMG/zAKGPYEkxebvGrpvXTjwMOVNMF8wL1GdGKOpVLExflnpHQ3nOa4xFJDr8tHbVrPx/itvrbl4Rv/h24wyV2yaDn7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970

On Fri, Oct 09, 2026 at 08:15:51PM +0200, Stefan Wahren wrote:
> This adds the support for chargebyte Charge Control Y, which is
> an Electrical Vehicle Supply Equipment (EVSE) for MCS (Megawatt
> Charging System) charging stations (according to IEC 61851-23-1).
>
> chargebyte Charge Control Y uses phyCORE-i.MX 93 ARM
> - NXP i.MX93 1.7 GHz
> - 1 GB DDR4 RAM
> - up to 8 GB eMMC
> - 2x 100 MBit/s Ethernet interfaces
> - 10BASE-T1S Ethernet for MCS communication
> - CAN interface
> - separate safety chip
> - TPM chip
> - power buffered RTC
>
> Co-developed-by: Martin Lukas <martin.lukas@chargebyte.com>
> Signed-off-by: Martin Lukas <martin.lukas@chargebyte.com>
> Co-developed-by: Michael Heimpold <michael.heimpold@chargebyte.com>
> Signed-off-by: Michael Heimpold <michael.heimpold@chargebyte.com>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx93-charge-control-y.dts  | 438 ++++++++++++++++++
>  .../boot/dts/freescale/imx93-phycore-som.dtsi |   2 +-
>  3 files changed, 440 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-charge-control-y.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index a80cccf34eb5..5984d3742ef8 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -898,6 +898,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
>  imx93-14x14-evk-mqs-dtbs += imx93-14x14-evk.dtb imx9-mqs.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk-mqs.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-charge-control-y.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dahlia.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-lino-verdin-dev.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-charge-control-y.dts b/arch/arm64/boot/dts/freescale/imx93-charge-control-y.dts
> new file mode 100644
> index 000000000000..7c5666cd4730
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-charge-control-y.dts
> @@ -0,0 +1,438 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025-2026 chargebyte GmbH
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include "imx93-phycore-som.dtsi"
> +
> +/ {
> +	model = "chargebyte Charge Control Y";
> +	compatible = "chargebyte,imx93-charge-control-y", "phytec,imx93-phycore-som", "fsl,imx93";
> +
> +	aliases {
> +		ethernet0 = &fec;
> +		ethernet1 = &lan8651;
> +		ethernet2 = &eqos;
> +		gpio0 = &gpio1;
> +		gpio1 = &gpio2;
> +		gpio2 = &gpio3;
> +		gpio3 = &gpio4;
> +		mmc0 = &usdhc1;
> +		mmc1 = &usdhc2;
> +		rtc0 = &rv3028;
> +		rtc1 = &bbnsm_rtc;
> +		serial0 = &lpuart1;
> +		serial1 = &lpuart2;
> +		serial2 = &lpuart3;
> +		serial3 = &lpuart4;
> +		serial4 = &lpuart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &lpuart1;
> +	};
> +
> +	// Heartbeat LED of phyCore is not populated
> +	/delete-node/ leds;

Now don't prefer delete-node for new files. use status = disabled to
disable it.

Frank
