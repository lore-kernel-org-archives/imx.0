Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990E3375F72
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 21:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772571757; cv=fail; b=gt48O3ieC8sM5PlIDE+0+QzAoWT+Kuxoy5uAD0DH9Dmbgxj1gr3K+L3BaqkgPmfyBCsG7WBhTLuza4FTqG6/AK1Oam6QLJvKHnEo68S+MgyRRgWAateX3EJ245+9pPhP5MdrU1DZTrm/bpuzL4CvlaI7QlmlwAX1i9MesUcuDO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772571757; c=relaxed/simple;
	bh=x7PL1U/7u/GqCO97rqU3NRxKBHSNe4FiZXhd0NaWjVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oggGUhlhdLWet1AaWHxVkjxm99NtO5AavZcCnS60k4t03VcoiE8EAW7GzbjfPh5FSQrtCBZjK2nJTD0gqJS+mDkp9nP1CTFIcs802/hHodXOQ9EHCWU1Z7o8eH0wNWlynaY/Ud7xKd6+SvpNIUaUEfNYjetNqHHzTIqJYK6tNUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ARcrpChL; arc=fail smtp.client-ip=52.101.70.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ARcrpChL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L72IV1Zrv3a56RCk5AAzQRGBxJ5vy6aQjcv/eiCoVU6bXvl862D2wYR7twVFinKuPyLRkNEk9B1Dp/AwGAdkO8fKGI80RBGUq5toSjUhgPY9L5RE642oWMFEbzmKEfXO6tXuEftqV7Jd1F5IKUhzn6R5aN30mldPKyJ1sFRMqIaFi8wnBVPSVdVIEwpQ6/pO8PidyOv2SxgrFWQp8XKFcCi/mem7EK0kh22R5+3ITKKwWpCjFZ235bdNVD457o+j4OP/2R7ZvyKJyhJgi2oMPYX5QK70VCgXIySLLyW9ujFWCT33WgdwcoS+5WSYTpILTD4At3yjkJAFDwG7CEmhBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePOV3SqX5mlUQ6WT0rPhjJj71KRKYX7wMQztxYVzEhY=;
 b=ODeavs+TGbxy+HcXMi7xGx1J323kaP+gzwh6y8URBJvMfsX4VZgXZSUlLKcM5wGj3QUQrhOXyv0IhucQUF/+dcbrSwPVzFa348MYJLaD6gSfzWIbqrey8K4MYzgZmaaGNHz20iskGK6qjBoUUP7zvb475KJGt+F6Yk4sSroJDd/aMYg8MmJ9J2uDjvJWm/Kc8GuqohyZld7F/ueWG6eNThoTzu1FyjgnHrw1fU8QwtUiPFziL/P99lyiayLPxg2Ea0zoOOC0l6nXrUA6DM12w2zXuTz18enMJc5MZRO9gGZ8pwHuTuoJXL+BvPr+MTfYogB1S7KaN0RO58/axYud5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePOV3SqX5mlUQ6WT0rPhjJj71KRKYX7wMQztxYVzEhY=;
 b=ARcrpChLvlHJYnaVjgij6vmA/K5S3crHZWVDGGkoA+/eN/nSMeSK1uCSyOJ2oURwYDYGxnDfuo5QBZsjAzCmGjIHJQgAtNrlPPgxtDLj6MbpoeySGRtB4yGgkMS7ihFrXwd0/skXAtJzbD1jkVE9FXm+Z7xl7ig1EE3I/rk6nJeEEFgBhNsLeVo1Q3t2ck41R4Mz+G5RsSzgNajm/hjwKVTHns5PkmdshiykiQGC+p+sssf9Jik/yGsjHZ0NMkLqvzfWCTmw7sExftFat+7Go4R+4Z2Z4fgdhmP++2CmY/MrG1T5ADXrIT7p4WFiXGcxApIXt0DfppNLCmyL4dRi7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVUPR04MB12217.eurprd04.prod.outlook.com (2603:10a6:150:33d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 21:02:29 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 21:02:29 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: Frank Li <frank.li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] arm64: dts: imx91-var-dart: Add support for Variscite Sonata board
Date: Tue,  3 Mar 2026 16:01:04 -0500
Message-ID: <20260303210131.2966214-9-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aec58b97aecd317e1fe274afc2844334feb9b9ab.1772534362.git.stefano.r@variscite.com>
References: <aec58b97aecd317e1fe274afc2844334feb9b9ab.1772534362.git.stefano.r@variscite.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::23) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVUPR04MB12217:EE_
X-MS-Office365-Filtering-Correlation-Id: 278f3079-fe5e-4cea-4db1-08de79682e1c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 xBlu2MoU6tg2w4rRp7TlU1y3AtW1FJq4TiJjNFCTM571ewcZ90GGn0ovFiP/68ElXwruvgH6exHoNq2fdN8WiLOsj2Ud5sY00rJnIKkmPnXKdKMDGolWhhff5GIlMochoy8rWCOz6k2SHSEfpyxCNX4phl4Qr8jWtPpK0hpC8vhaK9VYilKCHy4DiSPmchbEb9XNWLLXwhdq1Iazsm8XB851/+V2cxmEjKffbCSWvjJboaFo2xLuClVZei4ZyXkMgxo3b+OrLwah35g6J7T7OJd2dK08g+srwWoUsybli+G/3h437fBsHrHGLVjTrUZAGBFYnJ+eO/HV//TPd/RXAeA3NahUQ2VPAlkbteyloA0IOlG7vsHltohoQkQj4zfwpGgjgNR6utTEzowEPliLnpROvSGq6eKN1GCLQsmnvWSrZgd1WkVDWFArIdDoCil14jp0JOUecxb+KpuVyK85DarqaHQmQ6d4NosR2WRUxiANVZdsE96rej7dK6J/285jA9Grv5uS3GNK1E1Lmyj+7rovod9ncdNbevgNuiHPUnQaThiXTq7EH8R/0ezchjE7Qxn6mskLkLwYUoCKabjg5nU7KGKfRjbULgQXdjDBmAQ7Ay0qTN/Y50jKe9vFquuuhi9S/W9wAceD3Q+nnYbX1mVjvMkjtAEPt6kiALzhbT5lz6ToY08HzmwNRUo6pOSrjLYjN9hSE9vApJNZ/yPz+4BIhSlohyOlneqPMm+ks/jaLUqLDFjiNG9CtkczjIP9cuAn4W35ym/Y7oFT7orBLJCOutFt7rdhGAZ8m4DdULA=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ubBTDEvdzozjlslB8COiQYDi6g8m1NJujkUXK2asjo4sUL2yIC+pIRDuwDSc?=
 =?us-ascii?Q?dek/0S/EAgTiF9dRu9V1sNSiytTu6v+fKwlgPQUGF8xHoFciZe36e3uMr0UV?=
 =?us-ascii?Q?aBfRuqQdlbB3EKeooKepuwa4ZqKiWCZoiREPsXvAWU9Se1+XqXakRHpd4OWO?=
 =?us-ascii?Q?gS31gPQtO1KjFvilSynY58Fam6Zwa2HfAG0A37HiOeoGJbKSv/n+MUBvympO?=
 =?us-ascii?Q?ApWROJtzNA6kizmvvJqzlrLSKdAMQb/cB1nmvHAy50SlEA7doRY1WO1vgdIS?=
 =?us-ascii?Q?qSxSkokCrJX8LV6mRhJFOZVZF66/ekn/lb7V9cPNeKM7fbOJuT9VZjtSXA9t?=
 =?us-ascii?Q?eK44U8bH3js7yGzMGb3y2CYyUa0kbSPLy2mOgIx+4MjQdFvoGl2LueYAmd/h?=
 =?us-ascii?Q?LcsrupXxOQKgPXGeRGuhjhy+voxwoT06cyFX0d1SaB6SELQRijRrKsTVzxyA?=
 =?us-ascii?Q?OsiQX1rUlUPExcfmM8gaOP+hzrrzqFsPTWcehL+vKzuJo34rVjR3SP29KfH2?=
 =?us-ascii?Q?YLqVI05Jtycte79u+ZM+9lPSj/a227dOmLbSd66vfXNCKmCi+Te+g47JHYtB?=
 =?us-ascii?Q?cx2sQnnASMEeBHVGK4a+8W1TsfYkcYhsbL4FeyPmh8BoPqmMok2zOG5Nv1Ks?=
 =?us-ascii?Q?sIxeZlxRp7EgSb4RfuRXATQUp3qTyQjzL+8XCCMOGQh43vPX4c/5meDBUbHe?=
 =?us-ascii?Q?x/JcOMCCk1V02YZeUBvrc1UWjkr+wMb19pfUWV+WQs3orAq/m7yBdoxmX+lh?=
 =?us-ascii?Q?/9/YLzMossLoWMK/dz87KBXVHH3X47am6dPCDYRWyMuprpcIh3dDC4LXUkgJ?=
 =?us-ascii?Q?buCSTBk96UbQ4E2vl8k8sLZfMVTHpI8mw7RyQBK98Hl3g/b4nSrhz2JEUSv0?=
 =?us-ascii?Q?Bv6xgdnEmcCiNV2S+OYg57k9XPqHjM1t6VYwpzNrn5GLgPwRGXTtTsEWkNYr?=
 =?us-ascii?Q?U0ZUJQMqBsiHmTRIpe/8QC/nHgBdw4Pzs2JFNTCfKKjMuWFDakam3l+pTxW0?=
 =?us-ascii?Q?INEYRKMSrnCn0iLq4GZ7QSXy3NYKkgDusLuSdXmku8pQCoCrbXsUVhfilge8?=
 =?us-ascii?Q?yyUWqE0ZdS7sohcqmu5txyyJMtQBooOQSfFlGZi2ADvTYIbiArKHTXolXMh6?=
 =?us-ascii?Q?sQLtVYqhMRBoZ7koLCL2TMygx4gULrE6FDKFPQds4+R6lErwoC+jiUeE0/n0?=
 =?us-ascii?Q?qSlHZkAumsebhzUE46IL8kfzqAdwgKj+US9aLJ5O8Jg4ymXdR8Xs2AY1b/Qa?=
 =?us-ascii?Q?+BVM6cM1v5QBEFuwtp09l4R+Q0m7snvQN6O9fZsjuOOZwe9jjdS+3jg8sEgZ?=
 =?us-ascii?Q?V7i1f4IDB7bBNCNMj5RmPeGX2MIGqOcHSKMxfLehn1y0Qfi/QQvwGg1HTBmr?=
 =?us-ascii?Q?THBa/b3P26G5IfLxIvgYcwXzQf3zRPdrmkQX9xu1qn1t6AAsMg8HKL+dWGUX?=
 =?us-ascii?Q?esF6lwoP+D0JwCWaNnsrf1+nveDGg8u9BouplcCQlv4SRyVtrvMeHAMWbLOP?=
 =?us-ascii?Q?5BOjysL2HD0cFgtrPlT0cb4LxlGcbJ0SoucZ8fv4jfIlmD2Rp0pDs0QQgFV1?=
 =?us-ascii?Q?sjkOWsNmraoO9l5bkR9kTOiVabtFOaaiOQ9n+K6cN5Mavqx9Q+lbjlXjyHCu?=
 =?us-ascii?Q?KLre4SWcv/WI3VC98gIMECoXHIIWX7kO9yfImM4AgLoQUeGsvU9IeqqqyH4W?=
 =?us-ascii?Q?KApsWYr/1wy4hRMvmIw23BRPpn3VA4TKG05XIiFWPRfw2ZF8l0vp5yszgD8f?=
 =?us-ascii?Q?SsFhgZEnGA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 278f3079-fe5e-4cea-4db1-08de79682e1c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 21:02:29.3157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnS2F6PsWxewKu+lScA+ZbmbyqrHJ0yxteRmNpp7DbP6cxB+J9LNg1fymsy1zl7gcYBoS6Ydr0oBVlIwlKukcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12217

From: Frank Li (AI-BOT) <frank.li@nxp.com>

AI bot review and may be useless.

This is a device tree patch, not C code, so traditional kernel style rules
don't apply. However, a few observations:

> +	pinctrl_lpi2c7: lpi2c7grp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO07__LPI2C7_SCL			0x40000b9e
> +			MX91_PAD_GPIO_IO06__LPI2C7_SDA			0x40000b9e
> +		>;
> +	};

This pinctrl group is defined but never referenced in any &lpi2c7 node.
Consider removing it or adding the corresponding device node.

> +	pinctrl_lpi2c7_gpio: lpi2c7-gpiogrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO07__GPIO2_IO7			0x31e
> +			MX91_PAD_GPIO_IO06__GPIO2_IO6			0x31e
> +		>;
> +	};

Same issue: orphaned pinctrl group with no consumer.

> +	pinctrl_rtc: rtcgrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO02__GPIO2_IO2			0x31e
> +		>;
> +	};

Orphaned pinctrl group. The RTC is on I2C (address 0x68) and doesn't appear
to use this GPIO in the device tree.

> +	pinctrl_uart7: uart7grp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO09__LPUART7_RX			0x31e
> +			MX91_PAD_GPIO_IO08__LPUART7_TX			0x31e
> +		>;
> +	};

Orphaned pinctrl group. No &lpuart7 node is enabled.

Consider cleaning up unused pinctrl definitions or adding the corresponding
device nodes. Otherwise, the patch looks structurally sound for a carrier
board DTS.
