Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA7336920C
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171241; cv=fail; b=IJy792nx8Wa4uCZkGWwdefyOqjzm2mXIh6x0/Tn8i2QqAOq5jp9aeUaFV0u9Zk+lXYPbRze3YUKfbnDJ/rNvyFBL2ZK/xwGRsfGwMyhRDJZe3Fjt3xx/ZDNxofujB06iXYA2+DSkBzx7wmroDgCdKWEgKFJxB2r1ZfM116RFVCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171241; c=relaxed/simple;
	bh=VC7Mr0NVXuiPRAs7MasYOLsaHooeKrBg8ZYx8S4ErUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H4CUrI05To9UYW5yQ5gf3mnp3ajKGX50Ni6fNQdqLSUwQMPk5yAePczCgldi02478p/Q9EDA94uBleMIw7qvMBZGi2R8V+fFB+gytTzrLV8UCAspFTTTq42rOfLzkch3jU0Z6pfLDiAp7JiSsLFaHZLUTcCLdb9JstIRB+0Y5wE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Db+UC3Gx; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Db+UC3Gx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2m6xjwRkwcHxNVCZOTMaKitMfJnucXITM3+DbKqKrvkJe+ziUVbmuFuamfb7/WJ8IxIpvVXQdLhnWD/E+etAS6//gJ1MGYFPPpx//dmTnMpNUsrBVbJ8kAGDfe0LPSdzWYsXYyPGXv0nEVa1pwTBAbZOO6jbJ7800NNflXyZJl9yttCvpGqipN95VUrvvwKcEz3jqNmGD/vy3nQMpD82YuMA3ixH4UUZMpWvdMiedMee/NjExEaX2064/FoT6cOAMgLsHtevwBIfPDp59sM+b3V/Mz8edgO+sAZMxFqfFXWRRvruParm4sVpJazB75SFxMGlikk5C5sFbszg/AgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/I429jyfNnd/6uwimQiwTDifFvEOWDu9gCKoeAGTy4o=;
 b=C33F+xeoZbqf3ZriDdEn0AxhJuho4FCmm3wP6xGvtdbkMPNQe8nn/HLclbfpQ23oYTSKB449tfWbnLI+qhfXr8ogjiyCxSCdO3d89XDw/+m6ToHV4dcz/K7JgNybkP01y0G6MCwK1SNQQSAzZww9v7MeHVXCc1yeI+LWVWjbE1Vfw4nMfEy1beOIYnr1kqWLz8gRr2/cPzxxnHUP8vSKFQ4qTuUsoT74Xr7lS8RDrlDhc/I2zVRE8Wy1J/Fuy6SFIEEUqlnRwY1Lr6rIzOKQo+Dv6MS4glbrlsRe6Y9Lmu0S9UfDfd0bmVO9o9rkMNgGFtFHTJsiKcgY0rBtdkLGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/I429jyfNnd/6uwimQiwTDifFvEOWDu9gCKoeAGTy4o=;
 b=Db+UC3GxEvP3hM9uuKk+QPZA1ZhMJj758LK4QfhTaT7sQrNQLhQHiAJfdhW9tZB9os0vhaRU/e/AE3aEi1pyasLYiqq+kKnqXM4UIOsheBeVCP4pdwv4J/V6OMN/2CXt6J08XevuEFs4Lw5zGWJVGU5XzGy51UB3eW8nsZOV3hbqN5Foa+zEAivhA6s9z11jKBr7XJ8AZch4gGNlWqCUSg1ZU/IBwtkZ48RNp8F2V+xPcUojSgMcyatA1PADQ+AP5wZdWmBrMm705UhrnPoiGvMqdC7WrdxA/hGs5KPWNEgYb+a1SdGMR6Te9QKEqI5eQIsZEWsSExvBQ7E2HZb8wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS4PR04MB9622.eurprd04.prod.outlook.com (2603:10a6:20b:4cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 16:53:52 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 16:53:52 +0000
Date: Mon, 27 Jul 2026 12:53:44 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] arm64: dts: imx8mm: imx8mp: Add FIO1 DTOs for
 Data Modul i.MX8M Mini and Plus eDM SBC
Message-ID: <ameNGD-hNFuvzWMP@lizhi-Precision-Tower-5810>
References: <20260716055751.279033-1-marex@nabladev.com>
 <20260716055751.279033-5-marex@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716055751.279033-5-marex@nabladev.com>
X-ClientProxiedBy: SA1PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS4PR04MB9622:EE_
X-MS-Office365-Filtering-Correlation-Id: 31036aa5-3c6d-466a-e8a6-08deebffa325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|19092799006|366016|11063799006|10067099003|4143699003|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1G4zhAPGLTeI61tR7S3nw9s/tPeSEBIaioICnc4Kgv0ersc/N25k2Qhuqd64IwCwFnUzUxFUj2dCj4ifKxABYxqNKQQEoGVT8t96R1qO7iqQcFw9yaQ5gmwkDhtDd15KFcMc6DgSzOEMmn/+bvnfOkpTUvYY5HhZMXNH90yxGnh36PLpuNbth4PLT5M4TPTCWAxcnjPFGiZeHuLJWObwm++tJJPq8F0zsnQuhuaKhYezvzi217zlj+WOtJ5B7m/Js/PIvesHnxl0NPD1HHgNriejB1WVHLaPF7c5cubbkeGCy0XYLBNSYqapacmU+WrXvnerrgujaAEJ5HRXHceKgSTfiGWOmY0FRwjjqTgLpXw+TzGtjB2zohhcO4XDtdaxwNha4g49FFGBfDp1TEu5N7On+cbALSDz/ZVpO0L8AlH0TwFFLVIJ5vBflCNbyX3iOxeHdQQZKvpG2ojh5wnT2QXc/gSPrh9z7+ehC/1YBwK4y5qyD8qphDK+9LRexR3K3/FU9dF6BW76mYy0Sgh4gAJSmkqDUQ7wZloQJeZ4zOal7yJnt+WgnzphdH+mKHMoEH4MAJ6eNxPvRL8riSIN9IjkZXhlo7+H6WkL5IUSErRGeFepCMTiadvRSgq68/jsLE7Nk3qzhRXPo3TdnyHmpzjnPKct/inO51Ris6hLAPQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(19092799006)(366016)(11063799006)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SvWGrQERL6baA37JoPnm0RHbO8IbohLVEioV7cyQLt7CUozMK2k1wH1v4vys?=
 =?us-ascii?Q?Fta5NjdCGPnR96wQK1ivw6J65WTq6XHnt7VyaUByASkhRStgaJpDKHXYVopH?=
 =?us-ascii?Q?wLuUr6+FACDoI9jGZo63n+rpkAyVbpDhwGmKgjyDXvFUcVCBCOVAfWOqOOFX?=
 =?us-ascii?Q?QfynJpkfxy8ZuWIpyHOB9QJNvQYh1LsTJP7Nkwc4e4WQf3YScVG0h+Dl8Ah0?=
 =?us-ascii?Q?4VXllBVDrn9NJ9b0XTE9bayTuSGC0MKH+w6m/Y85bw5VkWkM3l2cI5LVmv2i?=
 =?us-ascii?Q?lU2phruht7T7xVTk8PTFej16SUUCt6hTzGvGVtKml/cZ4lnuOY6vUWqNegJa?=
 =?us-ascii?Q?dQLpPcd62f4tAJDeR1bj3HAP76jSmLFutkXlCASrlXnh+x/XMwWo8VXaUKrw?=
 =?us-ascii?Q?H2XWQxqZR0CPu8WWoEtTYqNowXjkg5yvWonzxUIy+X6keUuRGrPhD/3mEz8Z?=
 =?us-ascii?Q?bX058sFm5O2GFw/0PryG58fQJZxEnRg3RMk3xbdOt4gwdkr5zpKwMycni/Ij?=
 =?us-ascii?Q?umsaIipSpcte3SlMgl1QTAwAtvfmPvtIHAy8Saf2E+QGD+6cplyQJRbZB5W2?=
 =?us-ascii?Q?9kWdJRXuugSydbvX6XTILLw/FTogPJqhd817AZfuwoeO94qt+YpH7K7DtHZ+?=
 =?us-ascii?Q?qkw6Y9bqRU33uolEqG2IlIU/fD70rKRTGMOcfL6A2KXeYEvAAFO9wM1UhT2O?=
 =?us-ascii?Q?O6xU4cQHnEWwwODtXVm/6nxdZ3JiK3DV8psuvxnmgv0zevQixJnWnEhWQ4QI?=
 =?us-ascii?Q?aAhpKt8+ipVlOofzcZB9E892dAXlHeK4ZlVq84OeL11QrfBqEN3yoQ1Neb1s?=
 =?us-ascii?Q?Mt8nx0hJ7185ec9WweTZntCQqKLa5zyyyIQsJn2TOmApmK3qtNK/vTiW1DaC?=
 =?us-ascii?Q?098ONCu9a7/m7SS0wW730cPqbW46moQjwFu+rLA2n55QAex/po6MZbU7QwMm?=
 =?us-ascii?Q?372+sp0Fd+dWFFviaSpzk+/TJjjos50pLARIY5GgCexG5pBz4AQBjzUTjF6b?=
 =?us-ascii?Q?Bq+3HrE30H66+Mv5qz2XvUlbA1bH/H45N6S1fX67GHipmWNjYy+6+w/k7frV?=
 =?us-ascii?Q?7NK6+44TJAuomUY1vMivsI8UgpewNRooedlP5UFuPU0d3yl3Y+RGBgkmkEQr?=
 =?us-ascii?Q?BJgY9RhtkN/TNK22u6iHjAzE/v0iDlLgOxANxlNiClS+sR7isgecR23DRA5A?=
 =?us-ascii?Q?Gu14n6Wpgi8vCFgoPJxDdJuYP/J1PSAdRJxIfnVBEj9Ez52P+U/r8Jxj8iUW?=
 =?us-ascii?Q?HlyY/Jg4BmpDLd28aTLIIaSdTbxG0r43P1hcOMIAlLGFeNiwcVt0ZK8Nq5/c?=
 =?us-ascii?Q?gkieMNpY1dE73/VgtYaxSuBsB4PgrDmaDJQvHGrJMFDCTOzx8nLjMy/7EmYM?=
 =?us-ascii?Q?pUCp6DaE335zcbQrJXNHMOAVT1uHv08CklnsAhyEFepPaTjZncBqXpWUzDGd?=
 =?us-ascii?Q?8HXm8X2mF+nJ8C9b0qlY1KetWV2pGeil1LMAqs5kEZcV1cKJqjXXLGjqwbn+?=
 =?us-ascii?Q?svdPBuvHcZI9ZhpCXCx9fgV8GgbvpZURkcPq+Hoersa4xjynsYEXOeamhDxr?=
 =?us-ascii?Q?Ok9Lawhny7qeCtNj2Q2+7P4t9HqZ5XljYrTF1IF6hvMJZ3NCjgPXfBAo/AvU?=
 =?us-ascii?Q?Km2U9dwsUxwCqgtlqp8f+wAMGDUIQ4W1W+h2phLjffAysKkxN59pm41KmgYH?=
 =?us-ascii?Q?JleMQCUYlH0Ou4flO7e/46neN6bhYNBw14iLNzoi+wRkMripxV59gJjdXoL3?=
 =?us-ascii?Q?yr9PH68LOXaUV9ihigljBVCjo8mtPwubXb2RQS2zcdlCPPJdNzQf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31036aa5-3c6d-466a-e8a6-08deebffa325
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 16:53:52.2422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpkeIUNzbRR1LMj/INlhrOhz1SfPfCz5oSfsJ/fxWkEZ+QvLj1mAJ0KOF/7ezoDpKy4aZfHOySd1PSbNmHiBB1Gqh/biE5Y2D638LMnOFiwVZuP7mt4urmRCWbIyXN25
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9622

On Thu, Jul 16, 2026 at 07:56:57AM +0200, Marek Vasut wrote:
> Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1
> providing additional UARTs, CAN, PWM Beeper, I2C, SPI and GPIO breakout.
> This adapter can be optionally populated onto the eDM SBC.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
> V2: Deduplicate the DTOs further
> V3: New patch split from the original megapatch
> V4: Rebase on next-20260703
> V5: No change
> ---
>  arch/arm64/boot/dts/freescale/Makefile        | 12 ++++
>  ...l-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi | 69 +++++++++++++++++++
>  ...l-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso | 59 ++++++++++++++++
>  ...l-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso | 46 +++++++++++++
>  4 files changed, 186 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 21902f095bf49..43ffdd70ce2e1 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -124,6 +124,10 @@ imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
>  	imx8mm-data-modul-edm-sbc.dtb \
>  	imx8mm-data-modul-edm-sbc-overlay-cm4.dtbo
>
> +imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-dtbs := \
> +	imx8mm-data-modul-edm-sbc.dtb \
> +	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo
> +
>  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
>  	imx8mm-data-modul-edm-sbc.dtb \
>  	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
> @@ -163,6 +167,8 @@ imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900-dtbs := \
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb \
>  			  imx8mm-data-modul-edm-sbc-overlay-cm4.dtb \
>  			  imx8mm-data-modul-edm-sbc-overlay-cm4.dtbo \
> +			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtb \
> +			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo \
>  			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
>  			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
>  			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
> @@ -311,6 +317,10 @@ imx8mp-data-modul-edm-sbc-overlay-cm7-dtbs := \
>  	imx8mp-data-modul-edm-sbc.dtb \
>  	imx8mp-data-modul-edm-sbc-overlay-cm7.dtbo
>
> +imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-dtbs := \
> +	imx8mp-data-modul-edm-sbc.dtb \
> +	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo
> +
>  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
>  	imx8mp-data-modul-edm-sbc.dtb \
>  	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
> @@ -392,6 +402,8 @@ imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902-dtbs := \
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb \
>  			  imx8mp-data-modul-edm-sbc-overlay-cm7.dtb \
>  			  imx8mp-data-modul-edm-sbc-overlay-cm7.dtbo \
> +			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtb \
> +			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo \
>  			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
>  			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
>  			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi
> new file mode 100644
> index 0000000000000..7851ca73ccd8e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 Marek Vasut
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +&{/} {
> +	can_osc: can-osc {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <20000000>;
> +	};
> +};
> +
> +&ecspi2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	can_fio: can@0 {
> +		compatible = "microchip,mcp2515";
> +		reg = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_can>;
> +		clocks = <&can_osc>;
> +		spi-max-frequency = <5000000>;
> +	};
> +};
> +
> +&i2c_feature {	/* Feature connector I2C */
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	gpio_feature: io-expander@20 {
> +		compatible = "nxp,pca9554";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_expander>;
> +		reg = <0x20>;

compatible is first property, reg is second.

Frank

> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-controller;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +		gpio-line-names =
> +			"GPIO1_output", "GPIO1_input",
> +			"GPIO2_output", "GPIO2_input",
> +			"GPIO3_output", "GPIO3_input",
> +			"PCA9511A_READY", "";
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c32";
> +		reg = <0x50>;
> +		pagesize = <32>;
> +	};
> +};
> +
> +&uart1 {	/* J500/J501 */
> +	status = "okay";
> +};
> +
> +&uart2 {	/* RS485 J302/J303 */
> +	linux,rs485-enabled-at-boot-time;
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
> new file mode 100644
> index 0000000000000..ad410db5f5b76
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2022-2026 Marek Vasut
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include "imx8mm-pinfunc.h"
> +#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi"
> +
> +&{/} {
> +	beeper {
> +		compatible = "pwm-beeper";
> +		beeper-hz = <1000>;
> +		pwms = <&pwm3 0 250000 0>;
> +	};
> +};
> +
> +&can_fio {
> +	interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
> +};
> +
> +&iomuxc {
> +	pinctrl_can: can-feature-grp {
> +		fsl,pins = <
> +			/* CAN_INT# */
> +			MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25		0x400000d6
> +			/* CAN_RST# */
> +			MX8MM_IOMUXC_SAI2_TXD0_GPIO4_IO26		0x6
> +		>;
> +	};
> +
> +	pinctrl_gpio_expander: gpio-expander-feature-grp {
> +		fsl,pins = <
> +			/* GPIO4_IO27 */
> +			MX8MM_IOMUXC_SAI2_MCLK_GPIO4_IO27		0x6
> +		>;
> +	};
> +
> +	pinctrl_pwm3: pwm3-buzzer-feature-grp {
> +		fsl,pins = <
> +			/* Buzzer PWM output */
> +			MX8MM_IOMUXC_SPDIF_TX_PWM3_OUT			0x100
> +		>;
> +	};
> +};
> +
> +&pinctrl_hog_feature {
> +	fsl,pins = <
> +		/* GPIO5_IO04 */
> +		MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4			0x6
> +	>;
> +};
> +
> +&pwm3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm3>;
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
> new file mode 100644
> index 0000000000000..0eccb7f7c0a8c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtso
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2022-2026 Marek Vasut
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include "imx8mp-pinfunc.h"
> +#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtsi"
> +
> +&can_fio {
> +	interrupts-extended = <&gpio2 10 IRQ_TYPE_LEVEL_LOW>;
> +};
> +
> +&iomuxc {
> +	pinctrl_can: can-feature-grp {
> +		fsl,pins = <
> +			/* CAN_INT# */
> +			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10		0x400000d6
> +		>;
> +	};
> +
> +	pinctrl_gpio_expander: gpio-expander-feature-grp {
> +		fsl,pins = <
> +			/* GPIO4_IO27 */
> +			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27		0x6
> +		>;
> +	};
> +};
> +
> +&pinctrl_sai2 {
> +	fsl,pins = <
> +		MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI2_TX_SYNC	0xd6
> +		MX8MP_IOMUXC_SAI2_TXD0__AUDIOMIX_SAI2_TX_DATA00	0xd6
> +		MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_SAI2_TX_BCLK	0xd6
> +	>;
> +};
> +
> +&pinctrl_hog_feature {
> +	fsl,pins = <
> +		/* GPIO5_IO03 */
> +		MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07		0x40000006
> +		/* GPIO5_IO04 */
> +		MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08		0x40000006
> +	>;
> +};
> --
> 2.53.0
>
