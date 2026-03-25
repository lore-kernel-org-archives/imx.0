Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A594331A4C
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 18:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774463641; cv=fail; b=JoV2HYj7vu3hk8854Qt4FOxgh7Cji3oLEm7JWsSm6ewrfUVGfsaSuQb1KkSBgXurQCqO9rQKLi+b1RxPoCuD9QRmaCWhzDMkKICidEpMWsoeyDXp3qck4pouSEYE7G5gXX9Ow8yFRkpSzOfjp2r9OBp8CPDr9KN9k7tM2LYsgoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774463641; c=relaxed/simple;
	bh=pHc8jMcoZaNaTNQUFxcnJXTkaiPHpWgMtTSXvQHtCgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=REqpPZ+RWNnVjeXmMpLOnsNblFnjJYbqFNzsoUiRqv94HrrZii6+MSvwf0cUd7OJ0ZhnwL52eZF7xi8IV/Lx5LowBUpcyy+A9Ngcas00t1JF1A0Etoae09NfWf1s1VLl3idJvsKxySLqKV0rFMhuySyz6b1AysFlKjclpuCBLa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K2xn0AFD; arc=fail smtp.client-ip=52.101.70.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K2xn0AFD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsi56KtgvYtPDZJxU13J29bprDjgAlMXe98rn1fVjN9KivyczNIqVG4tj2naNTW8MDdJb0n8STm5NgqGuAEcrdXwvxNFnZp4FJq7Gc3M5B6RvDPufFTyrQivUae2V4nSVOEVoWjLNLJlvbrWKQS2ZorZq4hBdf8acTTntIreYJqOjnKJWZm1SyYnvYzkBBVc9Ih+MNpf8aQjH66yJa9B766OvvMHeTQpO7Qrqrfg5kidyhBmAPEoOausRb3CsI4uqjPWYvhfaiMiaW994PfrmuKQhIGHsoNw9DtG/vM3F5g+8mJudCBZmrwabjDNgD1MOjEeizQqy217BkRahBDX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+0QVDflYB9FKWYz+ub5yo4geWTJxXiVNqvN8TvF1o4=;
 b=qUXqEewpUd0TgFoZW55vhjYsnqDYAY4kbBj+TDvx6n00302Qwvh/Ae4Eb/ZdQ/h+gmqk4tn8mePuvkJtDcRlpBXv+kCDIQwrJ/FkJTHxr//lAUpJ+d18FYeMqX2uc1kaUE/SBSJ9aguXcG5PpGecEW3xwCfkzEcdOf49XYTzxjMtFn/JACdz65SKLfBKZfHe6U45zjts4BEMJMEz9Yef54jHym8Mh+KIr+smPQt3gbd+cSn+2TjjGkLS6ylMR1KSlhOqZu7PnWhoOPrIfu/cIhaJ5ttaATt6lOyaTu3k/rGj4nuXVbG+gUf6LR1qN9gsSJnPZCxz1eE00ltSPKsGeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+0QVDflYB9FKWYz+ub5yo4geWTJxXiVNqvN8TvF1o4=;
 b=K2xn0AFDN8SkBpDxXYzDYBJaVNhaaqYXMYZgrc/cxP2KwiSVxUKtfCPvgz3kDDIN7SNLqaHmDXsNO9xdb5vB/x4yN2zax9/1hcYPJMRsQVS2H/VVlb2uCQ/Q7mI5Sosanl8vMcLX2TUq8a8nJ0RaWD+UGQD5z4IHIVy8hZKVKlB4KoBARh4OpOdsd5iF95VnSxH9hb2tnlWBlWaOJ+U49WaWzvic+tIwZ8ssPly8NeoKQModk+qrhUN0JaEObQm3ln8EEBmDXs5VC0SyAm2TNZsDWqS/oRtpAWRv3M939oCvxoA0jqiq16UvbWzMewD9uSCN+M+dZ5GoHdKC8HHa3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by PA1PR04MB10323.eurprd04.prod.outlook.com (2603:10a6:102:44e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 18:33:23 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 18:33:52 +0000
Date: Wed, 25 Mar 2026 14:33:23 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M
 Plus DHCOM SoM and boards
Message-ID: <acQqc1AuCa1Tkb-w@lizhi-Precision-Tower-5810>
References: <20260324190544.74531-1-marex@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324190544.74531-1-marex@nabladev.com>
X-ClientProxiedBy: PH7PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:510:33d::8) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|PA1PR04MB10323:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d860f9-389e-4837-7b03-08de8a9d08b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|52116014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	LaElR2XGUKjq2uAGnPfjETg8KF20OWmHZUx2g5GtNOcaN9Acm8qi+2VSqZbjIC2W1BhhrCfYOxm0PtDwn9gCkUCXCgXFXS8XPfhIxaMjGAkel3LyUg/9RORqyiKqtVGrDxBxr0Rqwi1mCwjjcBYswLh12PdQu5HbFc2yX0D/fxvasMhO+KqDwdmPw1yuzHHZSJ3IN9zaGvTkGsPaW2/mkb97Q0wCMnpl3WLUqsIrMKPb5sogneF6//uD1hhwiln7GTrvN0hMLO9KShrLseBTRi6ZrbNixkYngh23N/6HvN00Bz+L7vLNH1wP/WG/5FTZyIjk/oSyJMV+EoC3fx6pN6J5M8jduNBekIjku8T0qhVUsf9B/ppQXgfhFQqhRZh/QHbD0WUPzS/dwBAYKPa5kkG1JKfCmYM28+yqXCxH/2IN9INVppsuQRCGCmrYAroQGAB1tJlGmadY4WDsM0igy2pVdBWNnZNCmvtr8dX2uUu/7lOTg4tBda6FXQOBngZwCJ50bVUILqMQyriP/yE+N9MQ7DYcipg8RkLV0fREvsPn1lDrYhhshpUCw5M3INRuNx/nx0/jOvmO6VFBsnI1NSaIHNM5JVVtfZjITOH2sMnHMEEGIBKu+2eYalDxp9XZaH91qWdm8st9WFcxawndG22dihWmN7GGVtNY9O7bxAZ+Tq6OPzjermn0NVeDSqnpFJ135Zd8wujSIQbO+6yFZg762UPcs+qT0Ei6rbtmU5ISnCSuQwOHAwovaIrYYoOruJaltixuMRSZohfN6rUzxPI1ghacg9fEQD0Hryst1uo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(52116014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l3pHE8VzYhWcA3XJWV0edp4qyaPzsNGfsNaVj1T+GIqXgGui4hFOoX64vTzv?=
 =?us-ascii?Q?q/18FSW/c3ZcSK2Z39Zo2NB/Aapg3YGd+ntajpPK0AawuM2+Pyar75FnKSxV?=
 =?us-ascii?Q?/cpIsbhSr19xnvlo0zWpECgdWcv0V5rODsNNswaP/eaMmMG2hBa2mrPFUela?=
 =?us-ascii?Q?dE+LBAkkbHRHygUNCoD1GtwoWLtT652DadV8cNH3Bscgweu1Rr0O7/3ZhW/D?=
 =?us-ascii?Q?ww2BlqZQWVJUi5PHMwFCuqrPz0x6oZWrq9Qts6liGwJZ/JhWci5jqp1j77bo?=
 =?us-ascii?Q?GL70TKjb2zHG/DFCoDQ5jM8zy4g1WznzfB2T/PzInMC8zcuvJtOR2yhp3YUK?=
 =?us-ascii?Q?0QrwvPjWepB/Rlfdiz70IsiHekNEzxrHxzn5KDGTfrlmhDqhkhKB6oOPgQjs?=
 =?us-ascii?Q?U4j8YxUltxkTZaR2Zmm4kvhf1ocDm+8apt6N5SRQW6RhutwdkskjMYX1jACO?=
 =?us-ascii?Q?nE5I6LWayIdel9DxSnDjSIEWaNJl12Rei7/0mB9TOSPitd9P1Umd1SwTjmlF?=
 =?us-ascii?Q?jrfy2Q4ts6pcW3uIsNIuVt5LrsiKt/F5xknJBqHi2A2mX0hJhTLvT7NH+h4/?=
 =?us-ascii?Q?QG1dLA3DStTpmI5IB3TSaGLT5CbomxMQkLlhr6he0KrHuN5S9h5bDwhPiKGE?=
 =?us-ascii?Q?tFyhVNnzSUlf2V93hwoq3KjcWNO3iZG0HI5Y8+AiVvaL3JsEkh/cknmlrllN?=
 =?us-ascii?Q?AqATbDeo6pTcOt5iAyLNO1SsAbDiliJVAF8/yZ5pqp56aBEswMAVRdbI2s0a?=
 =?us-ascii?Q?As1C8ZWjHtHnTO6KMd6/MfgfY1ZeWWhJdJC0ZtWjPZXmbRvZJWAZzvmwhsIE?=
 =?us-ascii?Q?KJZ1OgvwkmcLSKfM4qZwPllvsS2QTDwg8gZ7+i8sFyx+/r+2D/1uIs5yDhGM?=
 =?us-ascii?Q?oFFAHBdv23byYb3YfZIPJT4QJDegR+6upZwQZEllN5gn5CKm0XPmTYk8v9xD?=
 =?us-ascii?Q?LmolnRJDyqxRHULw1FgHTlBOHyFj8959jcQsCY4upM2fYGxWFWZnVhuMQNpb?=
 =?us-ascii?Q?kwrxpfB00VAA6xVkmC8BGhqCwjk6nCq1CwLNN1zQkFxt7iXtvqQERM9zeU3P?=
 =?us-ascii?Q?wQONLVAo7iUMnYGQuQ1xpPlZbGhpJIlpMmW6YLqP3HZ5awNWu3ugFueHTmI1?=
 =?us-ascii?Q?RucND6X0lEhX/WHWC2mVhnS2nExb/46mQnYKZoHrZJxjr4xgVmGwWQEtr05O?=
 =?us-ascii?Q?XE/XxxhpC5KnJunuqTUOUoBrB6AlnCU9Iv3o9SBmK8uJXo5B4xbqIVa7GFX0?=
 =?us-ascii?Q?GUI5SW/G0XYwp8CpiEgdYR+1JYs6J2CVFApaG8V6R6i/y7eAE8tqlYApIKvW?=
 =?us-ascii?Q?pErmlSIULniynr+k9jM2ERwmFAPVNyAGHhsiU0FEIRTltADk2cgvVPz0xPWM?=
 =?us-ascii?Q?ps15ni4RnjrElqxCYPPL89PN41pWOiWfOnAHIAJfZsAOj8sraYLFlwmJu1kt?=
 =?us-ascii?Q?LyZnu2DhypmII1NzW5KsMkENnXcilzQ0tEuzhrvlzJsg88OzgQBu/u9jkW9A?=
 =?us-ascii?Q?V5rhi1MDFYA7A58EyZU/UedQ5BjnGa3NZw9b7vxbvMqL+u/tUhZM/2FvUhfO?=
 =?us-ascii?Q?4Amn1asfJomN20H43LkUB4NWic6h0hMZpIYO7kT1QMDrt64lh+3X+jOMXqZX?=
 =?us-ascii?Q?eBDqzU5M8MDV1sQNrKxMht1VC8IKxRjrNLI+0hX0FoWeKtItHdJ8DOfpHl3w?=
 =?us-ascii?Q?6tABI6tJ0lHI6k4vAhXYMoWtvZvelFRze2rUYVGfV50lqAks?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8d860f9-389e-4837-7b03-08de8a9d08b6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 18:33:52.6842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4PzrzzLJsaDf8KZsKuxI0y9uk3OVqTC4tVvcvC4ZKSlIholhyRM/yahISpw7gJIy8uL2v+hlHKGLF+f5kIi8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10323

On Tue, Mar 24, 2026 at 08:04:19PM +0100, Marek Vasut wrote:
> Add DT overlays to support DH i.MX8M Plus DHCOM SoM variants and carrier
> board expansion modules. The following DT overlays are implemented:
> - SoM:
>   - DH 660-x00 SoM with 1xRMII PHY
>   - DH 660-x00 SoM with 2xRMII PHY
> - PDK2:
>   - DH 505-200 Display board in edge connector X12 via direct LVDS
>   - DH 531-100 SPI/I2C board in header X21
>   - DH 531-200 SPI/I2C board in header X22
>   - DH 560-200 Display board in edge connector X12
> - PDK3:
>   - DH 505-200 Display board in edge connector X36 via direct LVDS
>   - DH 531-100 SPI/I2C board in header X40
>   - DH 531-200 SPI/I2C board in header X41
>   - DH 560-300 Display board in edge connector X36
>   - EA muRata 2AE M.2 A/E-Key card in connector X20
>   - NXP SPF-29853-C1 MINISASTOCSI with OV5640 sensor in connector X31
>   - NXP SPF-29853-C1 MINISASTOCSI with OV5640 sensor in connector X29
> - PicoITX:
>   - DH 626-100 Display board in edge connector X2
>
...
> + * Copyright (C) 2022-2026 Marek Vasut
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#define DH_OVERLAY_PANEL_I2C_BUS			i2c5
> +#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_PINCTRL	&pinctrl_dhcom_b &pinctrl_dhcom_h

This is not straight forward.

you can add label like panel_i2c at dts file.

panel_i2c: &i2c5 {
}

in overlay file use

&panel_i2c {
	....
}

So you use the same overlay file for difference dts. The same as others

Frank

> +#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_IRQ_PARENT	gpio1
> +#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_IRQ_PIN	11
> +#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_RESET_GPIO	gpio1
> +#define DH_OVERLAY_PANEL_I2C_TOUCHSCREEN_RESET_PIN	8
