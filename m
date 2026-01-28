Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011065.outbound.protection.outlook.com [40.107.130.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FB62F0C63
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 17:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769621095; cv=fail; b=i6FRb3znRJVoM7JNem+wFbfB6pr3QTVbHzJIzR162LYB+QyEu0OSDNnBs7qklfxUkHxPwGX3IAyRNjmLSXvffLtFywIU0RF7x9BXK+f/f3A3DI/2dCiQjxBLxGct++O4U3KTzOJu4/Tjgk+lV9SXtn6kbfUnzeuiJFfolP/bdiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769621095; c=relaxed/simple;
	bh=nZqfgMEl2WnzLGTxHJlZzaCnytxYrzqFMuk5leI+sAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hpi7cR82CrIDzPQA5x66hRDzGLLgIIBZE0ocj/bESA6EvCotL6ezep6q42ve8+JCdRwHe5YpLXGggyQrK3JtIiEj/KvOY9cUgr27QjizMSkkLwcUP5YKC7KYKCJ0awZIefHI/2RpErWh6t+be0o/z1apERCwV8jcZxBD4pvl5X0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mxzpd5C7; arc=fail smtp.client-ip=40.107.130.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mxzpd5C7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpZaOcUW9pP3II3piH80sLrNbTKLI9TcH+NC6yjJPCkv+gU2wYcZyCf9xBStI6QG36wadFpZv6C8nHWUmEsFgLYAWXBst/o7rYmFUNlhwDuUV1ipem6TS4prNJF/TG8lf1+DUsvmHqx7gPJkJGFOrhFLvbRULKB4UK6YSNg5wrxQ1lOd+QDrlFFY6RXqsoJYY8tVsiaz++Pl+g9ETutWkGwzz7bI/3K2VSYbmWNVZ2gqNL597/R1cPEgL4PiAaijkFFnQDz6HVsQRe5nNumxxqxgdMNrqYEOH0UGL2LAiBwrSiQUtTLm2q3tOmbGv5CbD9M2g7T9vcLO54tv2+kjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InogM2l7OBkXjLxO2hOzL7SdJCP5TNs5IkrU8MezNC8=;
 b=L2XGrzxU7MmbwDobU90/2qrOeRcGY2Rq096IiM9jOhJ9n9OrnUtxy1qcq9L34Ki1IZDe+mST8D0fteAD3j2XvER19CJpodF6boEsuJt5xxSiBxY99XpYJNuL9JmgmqJT/ru+AZ+fC+ajX0PukJCP3MQLKdgGVR77UpuCZdu1qxTqtt7sci+wPCt47FO1Ge27QrRD362ZeqK5ZLEkP5FN3tULft8s5l83msic140PkjXGS4q10qrWe13SJ0kPMrqFq7dr0NYKyLvARHFGtR2Rq3yAf3ZgaogoAyqnUwoaQ/ETrKdfG894q3Az1qE2xcoZ9oaslclM3LCsEoCjIY82MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InogM2l7OBkXjLxO2hOzL7SdJCP5TNs5IkrU8MezNC8=;
 b=mxzpd5C7AO7p7YyI08hu4hiMiO7/ewANysOoA5gGCOQ6czgy5IPrCuTqwbm2xInoy0Qsk/cycdBgGIvpDWqarJskxl/BRnUOHRYDgWdijtUP0Nu4/uwfp/vPVDdQujICNx2zHBXwBiSPAKSxnNfONzzmmEYO0F2vY/gz/fOY3yeHrA1/LsDrS3rQ26nLK/kKuCnYAVFczgBiNPYh48yOOYuMBqaMXlddnceOVNU5nGQhRHG2/1Svtt7kdoBZK/xC36I6i2tzgb/VWwGmEYct8lJLbAEWWRIWfHmXERgLkfoEOPhzZHMzOTJ1Pi4pAhuKlCb2YWb7fK0D+oJ+/Swxzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10779.eurprd04.prod.outlook.com (2603:10a6:150:21c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 17:24:48 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Wed, 28 Jan 2026
 17:24:48 +0000
Date: Wed, 28 Jan 2026 12:24:38 -0500
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
Subject: Re: [PATCH v8 5/8] arm64: dts: add support for SolidRun i.MX8MP
 HummingBoard IIoT
Message-ID: <aXpGVrpyM3nwmVN5@lizhi-Precision-Tower-5810>
References: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
 <20260128-imx8mp-hb-iiot-v8-5-9646a3025cf4@solid-run.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-imx8mp-hb-iiot-v8-5-9646a3025cf4@solid-run.com>
X-ClientProxiedBy: SJ0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10779:EE_
X-MS-Office365-Filtering-Correlation-Id: a20a03f0-0979-413a-7729-08de5e9222d3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|52116014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?H18TEKdz5qSRJd/z/YZY9gDA3jP0XFaPwyGiL8JAh7kB+8MBKrwJoaX1Bqpt?=
 =?us-ascii?Q?nbnbMrKbLP31MB525e+6bpdS6TA2bo8KBPRYEYnZL4M9SlwJRnUuyEPrGKrO?=
 =?us-ascii?Q?W5junrHIh6vSVUZjOn0wtohlj1IXECJhSdIzkdSL5UYuXHGyJaq139QVsDt+?=
 =?us-ascii?Q?0iQ15QFllbHKtZPw1M1UMOQgnlSaaloeIkZ4F3t4sJ3kDjK1TMurC4HKBStl?=
 =?us-ascii?Q?BLK+S3FO3pRWZNXtvI0LUmWvfjZk5xzhDEcDYumqKVwq+1bPSoErTVuvAT7V?=
 =?us-ascii?Q?nBlSA6iTOMrGmPq+vY3bABXGXv9m3VkF8SiStbVvQniwqkKWYQ3Isrg3sZSe?=
 =?us-ascii?Q?nm3iK0OnY95eKuv+gccNciHPtoYWqYItxptYtbjfW0mFFGPrdXA2RmvnWuP9?=
 =?us-ascii?Q?0QeZJLROlCBRh2figxvEFp/rdvgiOylh4qJiXgwHg7eQn/adF0aROq4TR+xJ?=
 =?us-ascii?Q?H/ljsSXEdLUVOI5+aT2e4MfcwS6rj34RqySvrhtwVriGprEp9pr5z+k8eckb?=
 =?us-ascii?Q?ksXgvc0+9CjMJyhMfxefBETBsOgc9V4XtdmDemlTU69EESq13ks2RSCDFS09?=
 =?us-ascii?Q?CkIVorHO+UaElcspN2bP2bVZIzcY1A7WsgSXa67QcQlLi2JjOKAwRp+E98RK?=
 =?us-ascii?Q?WIiwLZy5pROo9vHUNjQZzpn1TSbHq2Ns7hqPtpiqBCn+lnCp6Mcm8hJr2F/9?=
 =?us-ascii?Q?7UgsTNOi9Zt0ztKeelS5oS8mpwhN91mPZxZii33uD/HYX/VN+kmvvY0486f7?=
 =?us-ascii?Q?UyCwm2/qqujPFDLs652V0iW9rzPm6iSyi54mI0pFZNgCmZRv5dKfBM4+nPui?=
 =?us-ascii?Q?Iz98STFIkCrCz/HhNwGqUNQsbfjuDLSOUSrF+OkvCIXCo2VpGSx7c/BA03Sa?=
 =?us-ascii?Q?W9xNY8KqTuZXSDutpnZBBB8BCc9QJkVD0emBWE/2yIowetUFX4lS3VO5sOI7?=
 =?us-ascii?Q?sAvYwzRjBJO7F9KIkcDShssvppoQLaxz/+9wK4Ta0zhDMQ00IgGEPN5TPoq7?=
 =?us-ascii?Q?4kTFiKW3DLnqWCG934l2B7WuI91+j/wnAeAWueeI8shQjvbNVkqt8uTwoyMR?=
 =?us-ascii?Q?wKmKFIwDQYaYGlTQtXAfWwxjh4e9h+uJcMi0YXoedKaRHqopoLvIf05GBu38?=
 =?us-ascii?Q?U5yUEdFCjLNupi9lUz592buKJJESQtRf5Hlw9Q9vR7Lszv7r2Q8dRgEUpVfD?=
 =?us-ascii?Q?Ci/kpE/nEdur+odbJvVyDf/1ryBcinj3+MB/QOfsBNg3G2jq9qnzecfqUHmd?=
 =?us-ascii?Q?7CHG7huNi/YedTxGCAf9M4CPoaWJFZBIuwwN3yGOFZBKjFoxjmqcG2mICFC+?=
 =?us-ascii?Q?ZCXQQFksDLiLqnwESD6e1jhkMicf8/KIryV3o/sF8TmqqJYe3IUEQPbygbh/?=
 =?us-ascii?Q?udceVukyy2yjHJIuhDlKiuHgBbJrLXWUS/6s7xTra5uvTJ722mGI2/8DJrVx?=
 =?us-ascii?Q?v2lqvum748IzJzOqMTF0x+ZGJ1a4CZDu+GU0GVMouIDFhMjnU78wb4nbRL5V?=
 =?us-ascii?Q?dHp0IxKdmMLdfmCiRmPt9A3vNNbqTw6GIAbTj/8mwzcrFTTgq8PE5HYW6wQQ?=
 =?us-ascii?Q?XKPtIafMFUGsA18RgfMSIww/zU7x/zZL53QDyVJ/vN+rY02WpX1wcns/EH/E?=
 =?us-ascii?Q?cruxxtOx8DeqqEysbRS++DA=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?TzZ7lNO5CVHS4AnJAC6THRM4Xcp6gSFcet8hq/p1MSeazwvKRKKNVL5WPCgJ?=
 =?us-ascii?Q?j/LW0FPwhOrCjh70+TWc4ghT/TgVQL4CHAuyMp/C5aMr72GJYOCQNtLIkiNd?=
 =?us-ascii?Q?Dawo2onw/tpHxAnb4gIcoAA40a8rOZVYD1fS2QB451nU3Adb+11w81yAFEBw?=
 =?us-ascii?Q?Sz8YH5X4RVER7bykIfUrMPWM+j3L5w1WZDwg1i7Savm2GceVEcjtvQXkogSh?=
 =?us-ascii?Q?IuuzxSLREgHxKNCM03OVrh7n+0GOr6bVnUfp+qjuwhZozqNT9mpAEfyZhy97?=
 =?us-ascii?Q?x+ofS+a3bdRyJcb7I/tjNebZt88LTp35lr8QnQNoBLbaZIk5m12KgRd5+ZT8?=
 =?us-ascii?Q?p2GDU+He4EMbBUrOx3gMVdN5jOYHMayvv3dAqRhdwWDgSdBJWCno2wVkLAqc?=
 =?us-ascii?Q?6dNqch3H0scv8FwRgGfesGutXoA2/nQPjhPSum/9h4FpxTq3In/HezsGdrQ0?=
 =?us-ascii?Q?w0gsk0tE5+YO/EWm1k00SI0vqbunlZ13UG919Rii67nr6Td/OBlsdvSipDK1?=
 =?us-ascii?Q?J4kXDJjbJn6ocIrQ8PV9QP9E+ThOB3X/37cA4cmh1e06rPeNvunBsF5PrRLX?=
 =?us-ascii?Q?O/6ZgQ6W5y/QlgTG6SEiqgUZAgQtf/1I9rz9iRxB/TbA7NqwIW4MVumYx10o?=
 =?us-ascii?Q?p2RGQzL6qDyZsEe0lK7pa/hN6mwe4/pMqp1n3nUIzsKIeHhtSX4sPQ+gsyBR?=
 =?us-ascii?Q?ZYQOm4iplZWVjHyIP5xbJkgBJ53yX/zc6f/pVYZwNnk9ThjojDFocNK2BlTb?=
 =?us-ascii?Q?FU7xuLpuRNy1CzM1YvxkCkfVHne+IJXpFyL6MDjVReJcPRp2amKmUHLT8s7O?=
 =?us-ascii?Q?7hS/QjP7Yb2Mpyjd1Vgk1WxPs0gGF+rt1/OqqdwnkGRHrp3OzmlnQ82K+pmm?=
 =?us-ascii?Q?tvUng6xN52Bdj+hqg0M+wYN2Vg5GY9njeiEadT45BccBekqkbEyAaPNidDdg?=
 =?us-ascii?Q?Vy7Z8PNlcHzvYvaMDBKe30ePIl385LZwXWXVcjWoFVtqGTK5b2WnhqBYBwho?=
 =?us-ascii?Q?UfFz4v24DUVSqCovNkprMp8bfc6/qmKRded7njmnNdqfUNDAoyq2axAEmBWY?=
 =?us-ascii?Q?JHnc7G3MVnc5bC1dB4hpYwuvpvYVdMzqP0yeIeq6C1TxvmMRxJK592IKNexq?=
 =?us-ascii?Q?iE+HFLGnnfz9J8unPddNy75meDC1brJe21BomCyg1aC6wzVD7Uj2VRGCGJwd?=
 =?us-ascii?Q?NhEEI+7LC9BHhAkVsZ/pTudqTnFDRKE0PnqXTO6Xr392iSeAI5bgrYsoUHRg?=
 =?us-ascii?Q?NoPE2SBGlJTz99UFnFIWwXEwLFlMMUhasmKf6PlkY5sC+/l1nNvqP7Aa5Jce?=
 =?us-ascii?Q?rrALl/tzUZe6mB8Zagc5GdFhbGGRGe1HQDfJdeE2C3ksLr4iL9qVN103a1Xp?=
 =?us-ascii?Q?e7vU6yMDgypuMFr4sSd8LhkJg/yn7jxcf3ybtCbUpTL+lHp09WM0ybFxoqUT?=
 =?us-ascii?Q?0n9TPzE6M9lCABGWiX78AmXQdGH9CO7EWaUwazjnBfMdv25x6SbZnoREq3NR?=
 =?us-ascii?Q?28mefplwdkfgF1bYUpXz2+jUTtz/hHULKUDdqwtXFUX2pXFHG0e620nwkOEn?=
 =?us-ascii?Q?ebDvpUnaKU7cbrMXE3KBy9OfFddEnow4CV6BcUraj2t+5Y/i+wF3+FLBQNlU?=
 =?us-ascii?Q?7F47QT8IAbLFWBAkHH/KrVQKFnXGy6sJwCcEUjQfQ3AE6hB9doewVoS4eibD?=
 =?us-ascii?Q?tvCF/RlzEALC1qjRH11x1rSEL+mbfAU8kmjhl0GYJthYdICX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a20a03f0-0979-413a-7729-08de5e9222d3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 17:24:48.3423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BdG37lnxXNKP+9x56wW1YHKKUZPCD9K87Hxj9pTwKUFBqOBkRZdnNXrs9fUcxtE5AQy4IQClbvw22HSfbb1cSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10779

On Wed, Jan 28, 2026 at 06:21:29PM +0200, Josua Mayer wrote:
> Introduce support for the SolidRun i.MX8MP HummingBoard IIoT platform.
> This board is a new design based on the i.MX8MP System on Module and
> does not share much hardware with previous HummingBoard variants.
>
> It comes with some common features:
> - 3x USB-3.0 Type A connector
> - 2x 1Gbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 M-Key connector with PCI-E Gen. 3 x1
> - 1x M.2 B-Key connector with USB-2.0/3.0 + SIM card holder
> - 1x LVDS Display Connector
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
> - 2x CAN
>
> In addition there is a board-to-board expansion connector to support
> custom daughter boards with access to SPI, a range of GPIOs and -
> notably - CAN and UART. Both 2x CAN and 2x UART can be muxed either
> to this b2b connector, or a termianl block connector on the base board.
>
> The routing choice for UART and CAN is expressed through gpio
> mux-controllers in DT and can be changed by applying dtb overlays.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>  .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 721 +++++++++++++++++++++
>  2 files changed, 723 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index f99a24ad115a..0847347786fa 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -213,6 +213,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
> +DTC_FLAGS_imx8mp-hummingboard-iiot := -@
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
>  DTC_FLAGS_imx8mp-hummingboard-mate := -@
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
>  DTC_FLAGS_imx8mp-hummingboard-pro := -@
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
> new file mode 100644
> index 000000000000..c4dc32621f6d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
> @@ -0,0 +1,721 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2024 Yazan Shhady <yazan.shhady@solid-run.com>
> + * Copyright 2025 Josua Mayer <josua@solid-run.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/phy/phy-imx8-pcie.h>
> +
> +#include "imx8mp-sr-som.dtsi"
> +
> +/ {
> +	model = "SolidRun i.MX8MP HummingBoard IIoT";
> +	compatible = "solidrun,imx8mp-hummingboard-iiot",
> +		     "solidrun,imx8mp-sr-som", "fsl,imx8mp";
> +
> +	aliases {
> +		ethernet0 = &eqos; /* J10 */
> +		ethernet1 = &fec; /* J11 */
> +		gpio5 = &tca6408_u48;
> +		gpio6 = &tca6408_u37;
> +		gpio7 = &tca6416_u20;
> +		gpio8 = &tca6416_u21;
> +		i2c6 = &i2c_exp;
> +		i2c7 = &i2c_csi;
> +		i2c8 = &i2c_dsi;
> +		i2c9 = &i2c_lvds;
> +		rtc0 = &carrier_rtc;
> +		rtc1 = &snvs_rtc;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		wakeup-event {
> +			label = "m2-m-wakeup";
> +			interrupts-extended = <&tca6416_u21 11 IRQ_TYPE_EDGE_FALLING>;
> +			linux,code = <KEY_WAKEUP>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	flexcan1_flexcan2_b2b_mux: mux-controller-0 {
> +		compatible = "gpio-mux";
> +		/*
> +		 * Mux switches both flexcan1 and flexcan2 tx/rx between
> +		 * expansion connector (J22) and on-board transceivers
> +		 * using one GPIO: 0 = on-board, 1 connector.
> +		 */
> +		mux-gpios = <&tca6416_u20 3 GPIO_ACTIVE_HIGH>;

where use label flexcan1_flexcan2_b2b_mux? how to guarantee gpio-mux is
probe before flescan driver?

Frank

> +		/* default on-board */
> +		idle-state = <0>;
> +		#mux-control-cells = <0>;
> +	};
> +
> +	mux-controller-1 {
> +		compatible = "gpio-mux";
> +		/*
> +		 * Mux switches can bus between different SoM board-to-board
> +		 * connector pins which is used to support different SoMs.
> +		 * i.MX8M Plus uses J7-12/16 and J9-54/56 for 2x flexcan.
> +		 */
> +		mux-gpios = <&tca6416_u20 4 GPIO_ACTIVE_HIGH>;
> +		idle-state = <1>;
> +		#mux-control-cells = <0>;
> +	};
> +
> +	spi_mux: mux-controller-2 {
> +		compatible = "gpio-mux";
> +		/*
> +		 * Mux switches spi bus between on-board tpm
> +		 * and expansion connector (J22).
> +		 */
> +		mux-gpios = <&tca6416_u21 0 GPIO_ACTIVE_HIGH>;
> +		/* default on-board */
> +		idle-state = <0>;
> +		#mux-control-cells = <0>;
> +	};
> +
> +	uart3_uart4_b2b_mux: mux-controller-3 {
> +		compatible = "gpio-mux";
> +		/*
> +		 * Mux switches both uart3 and uart4 tx/rx between expansion
> +		 * connector (J22) and on-board rs232/rs485 transceivers
> +		 * using one GPIO: 0 = on-board, 1 connector.
> +		 */
> +		mux-gpios = <&tca6416_u20 0 GPIO_ACTIVE_HIGH>;
> +		/* default on-board */
> +		idle-state = <0>;
> +		#mux-control-cells = <0>;
> +	};
> +
> +	uart3_rs_232_485_mux: mux-controller-4 {
> +		compatible = "gpio-mux";
> +		/*
> +		 * Mux switches uart3 tx/rx between rs232 and rs485
> +		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
> +		 */
> +		mux-gpios = <&tca6416_u20 1 GPIO_ACTIVE_HIGH>;
> +		/* default rs232 */
> +		idle-state = <0>;
> +		#mux-control-cells = <0>;
> +	};
> +
> +	uart4_rs_232_485_mux: mux-controller-5 {
> +		compatible = "gpio-mux";
> +		/*
> +		 * Mux switches uart4 tx/rx between rs232 and rs485
> +		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
> +		 */
> +		mux-gpios = <&tca6416_u20 2 GPIO_ACTIVE_HIGH>;
> +		/* default rs232 */
> +		idle-state = <0>;
> +		#mux-control-cells = <0>;
> +	};
> +
> +	v_1_2: regulator-1-2 {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <1800000>;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-name = "1v2";
> +	};
> +
> +	reg_dsi_panel: regulator-dsi-panel {
> +		compatible = "regulator-fixed";
> +		gpios = <&tca6416_u20 15 GPIO_ACTIVE_HIGH>;
> +		regulator-max-microvolt = <11200000>;
> +		regulator-min-microvolt = <11200000>;
> +		regulator-name = "dsi-panel";
> +		enable-active-high;
> +	};
> +
> +	/* power for M.2 B-Key connector (J6) */
> +	regulator-m2-b {
> +		compatible = "regulator-fixed";
> +		gpios = <&tca6416_u20 5 GPIO_ACTIVE_HIGH>;
> +		regulator-always-on;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "m2-b";
> +		enable-active-high;
> +	};
> +
> +	/* power for M.2 M-Key connector (J4) */
> +	regulator-m2-m {
> +		compatible = "regulator-fixed";
> +		gpios = <&tca6416_u20 6 GPIO_ACTIVE_HIGH>;
> +		regulator-always-on;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "m2-m";
> +		enable-active-high;
> +	};
> +
> +	vmmc: regulator-mmc {
> +		compatible = "regulator-fixed";
> +		pinctrl-0 = <&vmmc_pins>;
> +		pinctrl-names = "default";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-name = "vmmc";
> +		startup-delay-us = <250>;
> +		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	/* power for USB-A J5003 */
> +	vbus1: regulator-vbus-1 {
> +		compatible = "regulator-fixed";
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "vbus1";
> +		gpio = <&tca6416_u20 14 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	/* power for USB-A J27 behind USB Hub Port 3 */
> +	regulator-vbus-2 {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "vbus2";
> +		gpio = <&tca6416_u20 12 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	/* power for USB-A J27 behind USB Hub Port 4 */
> +	regulator-vbus-3 {
> +		compatible = "regulator-fixed";
> +		regulator-always-on;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-name = "vbus3";
> +		gpio = <&tca6416_u20 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	rfkill-m2-b-gnss {
> +		compatible = "rfkill-gpio";
> +		/* rfkill-gpio inverts internally */
> +		shutdown-gpios = <&tca6416_u20 10 GPIO_ACTIVE_HIGH>;
> +		label = "m2-b gnss";
> +		radio-type = "gps";
> +	};
> +
> +	rfkill-m2-b-wwan {
> +		compatible = "rfkill-gpio";
> +		/* rfkill-gpio inverts internally */
> +		shutdown-gpios = <&tca6416_u20 9 GPIO_ACTIVE_HIGH>;
> +		label = "m2-b radio";
> +		radio-type = "wwan";
> +	};
> +};
> +
> +&ecspi2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ecspi2_pins>;
> +	num-cs = <1>;
> +	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	ecspi2_muxed: spi@0 {
> +		compatible = "spi-mux";
> +		reg = <0>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		/* mux bandwidth is 2GHz, soc max. spi clock is 166MHz */
> +		spi-max-frequency = <166000000>;
> +		mux-controls = <&spi_mux>;
> +
> +		tpm@0 {
> +			compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
> +			reg = <0>;
> +			spi-max-frequency = <43000000>;
> +			reset-gpios = <&tca6416_u21 1 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
> +			interrupts-extended = <&tca6416_u21 9 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +	};
> +};
> +
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&can1_pins>;
> +	status = "okay";
> +
> +	can-transceiver {
> +		max-bitrate = <8000000>;
> +	};
> +};
> +
> +&flexcan2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&can2_pins>;
> +	status = "okay";
> +
> +	can-transceiver {
> +		max-bitrate = <8000000>;
> +	};
> +};
> +
> +&i2c2 {
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9546";
> +		reg = <0x70>;
> +		/*
> +		 * This reset is open drain,
> +		 * but reset core does not support GPIO_OPEN_DRAIN flag.
> +		 */
> +		reset-gpios = <&tca6416_u21 2 GPIO_ACTIVE_LOW>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* channel 0 routed to expansion connector (J22) */
> +		i2c_exp: i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		/* channel 1 routed to mipi-csi connector (J23) */
> +		i2c_csi: i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		/* channel 2 routed to mipi-dsi connector (J25) */
> +		i2c_dsi: i2c@2 {
> +			reg = <2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			tca6408_u48: gpio@21 {
> +				compatible = "ti,tca6408";
> +				reg = <0x21>;
> +				/*
> +				 * reset shared between U37 and U48, to be
> +				 * supported once gpio-pca953x switches to
> +				 * reset framework.
> +				 *
> +				 * reset-gpios = <&tca6416_u21 4
> +				 *                (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
> +				 */
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				gpio-line-names = "CAM_RST#", "DSI_RESET",
> +						  "DSI_STBYB", "DSI_PWM_BL",
> +						  "DSI_L/R", "DSI_U/D",
> +						  "DSI_CTP_/RST", "CAM_TRIG";
> +			};
> +		};
> +
> +		/* channel 2 routed to lvds connector (J24) */
> +		i2c_lvds: i2c@3 {
> +			reg = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			tca6408_u37: gpio@20 {
> +				compatible = "ti,tca6408";
> +				reg = <0x20>;
> +				/*
> +				 * reset shared between U37 and U48, to be
> +				 * supported once gpio-pca953x switches to
> +				 * reset framework.
> +				 *
> +				 * reset-gpios = <&tca6416_u21 4
> +				 *                (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
> +				 */
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				gpio-line-names = "SELB", "LVDS_RESET",
> +						  "LVDS_STBYB", "LVDS_PWM_BL",
> +						  "LVDS_L/R", "LVDS_U/D",
> +						  "LVDS_CTP_/RST", "";
> +			};
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	/* highest i2c clock supported by all peripherals is 400kHz */
> +	clock-frequency = <400000>;
> +
> +	tca6416_u20: gpio@20 {
> +		/*
> +		 * This is a TI TCAL6416 using same programming model as
> +		 * NXP PCAL6416, not to be confused with TI TCA6416.
> +		 */
> +		compatible = "nxp,pcal6416";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-line-names = "TCA_INT/EXT_UART", "TCA_UARTA_232/485",
> +				  "TCA_UARTB_232/485", "TCA_INT/EXT_CAN",
> +				  "TCA_NXP/REN", "TCA_M.2B_3V3_EN",
> +				  "TCA_M.2M_3V3_EN", "TCA_M.2M_RESET#",
> +				  "TCA_M.2B_RESET#", "TCA_M.2B_W_DIS#",
> +				  "TCA_M.2B_GPS_EN#", "TCA_USB-HUB_RST#",
> +				  "TCA_USB_HUB3_PWR_EN", "TCA_USB_HUB4_PWR_EN",
> +				  "TCA_USB1_PWR_EN", "TCA_VIDEO_PWR_EN";
> +
> +		m2-b-reset-hog {
> +			gpio-hog;
> +			gpios = <8 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name = "m2-b-reset";
> +		};
> +	};
> +
> +	tca6416_u21: gpio@21 {
> +		/*
> +		 * This is a TI TCAL6416 using same programming model as
> +		 * NXP PCAL6416, not to be confused with TI TCA6416.
> +		 */
> +		compatible = "nxp,pcal6416";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tca6416_u21_int_pins>;
> +		interrupts-extended = <&gpio1 15 IRQ_TYPE_EDGE_FALLING>;
> +		gpio-line-names = "TCA_SPI_TPM/EXT", "TCA_TPM_RST#",
> +				  "TCA_I2C_RST", "TCA_RS232_SHTD#",
> +				  "TCA_LCD_I2C_RST", "TCA_DIG_OUT1",
> +				  "TCA_bDIG_IN1", "TCA_SENS_INT",
> +				  "TCA_ALERT#", "TCA_TPM_PIRQ#",
> +				  "TCA_RTC_INT", "TCA_M.2M_WAKW_ON_LAN",
> +				  "TCA_M.2M_CLKREQ#", "TCA_LVDS_INT#",
> +				  "", "TCA_POE_AT";
> +
> +		rs232_shutdown: rs232-shutdown-hog {
> +			gpio-hog;
> +			gpios = <3 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name = "rs232-shutdown";
> +		};
> +
> +		lcd-i2c-reset-hog {
> +			/*
> +			 * reset shared between U37 and U48, to be
> +			 * supported once gpio-pca953x switches to
> +			 * reset framework.
> +			 */
> +			gpio-hog;
> +			gpios = <4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
> +			output-low;
> +			line-name = "lcd-i2c-reset";
> +		};
> +
> +		m2-m-clkreq-hog {
> +			gpio-hog;
> +			gpios = <12 GPIO_ACTIVE_LOW>;
> +			input;
> +			line-name = "m2-m-clkreq";
> +		};
> +	};
> +
> +	led-controller@30 {
> +		compatible = "ti,lp5562";
> +		reg = <0x30>;
> +		/* use internal clock, could use external generated by rtc */
> +		clock-mode = /bits/ 8 <1>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		multi-led@0 {
> +			reg = <0x0>;
> +			label = "D7";
> +			color = <LED_COLOR_ID_RGB>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			led@0 {
> +				reg = <0x0>;
> +				color = <LED_COLOR_ID_RED>;
> +				led-cur = /bits/ 8 <0x32>;
> +				max-cur = /bits/ 8 <0x64>;
> +			};
> +
> +			led@1 {
> +				reg = <0x1>;
> +				color = <LED_COLOR_ID_GREEN>;
> +				led-cur = /bits/ 8 <0x19>;
> +				max-cur = /bits/ 8 <0x32>;
> +			};
> +
> +			led@2 {
> +				reg = <0x2>;
> +				color = <LED_COLOR_ID_BLUE>;
> +				led-cur = /bits/ 8 <0x19>;
> +				max-cur = /bits/ 8 <0x32>;
> +			};
> +		};
> +
> +		led@3 {
> +			reg = <0x3>;
> +			chan-name = "D8";
> +			label = "D8";
> +			color = <LED_COLOR_ID_GREEN>;
> +			led-cur = /bits/ 8 <0x19>;
> +			max-cur = /bits/ 8 <0x64>;
> +		};
> +	};
> +
> +	light-sensor@44 {
> +		compatible = "isil,isl29023";
> +		reg = <0x44>;
> +		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
> +		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +
> +	accelerometer@53 {
> +		compatible = "adi,adxl345";
> +		reg = <0x53>;
> +		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
> +		interrupt-names = "INT1";
> +		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +
> +	carrier_eeprom: eeprom@57{
> +		compatible = "atmel,24c02";
> +		reg = <0x57>;
> +		pagesize = <8>;
> +	};
> +
> +	carrier_rtc: rtc@69 {
> +		compatible = "abracon,ab1805";
> +		reg = <0x69>;
> +		abracon,tc-diode = "schottky";
> +		abracon,tc-resistor = <3>;
> +		/*
> +		 * AM1805 RTC used on this board has only nTIRQ pins wired,
> +		 * which is for countdown timer irqs only.
> +		 * Driver does not support this, disable for now.
> +		 *
> +		 * interrupts-extended = <&tca6416_u21 10 IRQ_TYPE_EDGE_FALLING>;
> +		 */
> +	};
> +};
> +
> +&iomuxc {
> +	can1_pins: pinctrl-can1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX			0x154
> +			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX			0x154
> +		>;
> +	};
> +
> +	can2_pins: pinctrl-can2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX			0x154
> +			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX			0x154
> +		>;
> +	};
> +
> +	ecspi2_pins: pinctrl-ecspi2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x140
> +			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x140
> +			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x140
> +			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x140
> +		>;
> +	};
> +
> +	tca6416_u21_int_pins: pinctrl-tca6416-u21-int-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15		0x0
> +		>;
> +	};
> +
> +	/* UARTA */
> +	uart3_pins: pinctrl-uart3-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x140
> +			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x140
> +			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x140
> +		>;
> +	};
> +
> +	/* UARTB */
> +	uart4_pins: pinctrl-uart4-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x140
> +			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x140
> +			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08		0x140
> +		>;
> +	};
> +
> +	usdhc2_pins: pinctrl-usdhc2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
> +			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
> +		>;
> +	};
> +
> +	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
> +			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
> +		>;
> +	};
> +
> +	usdhc2_200mhz_pins: pinctrl-usdhc2-200mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
> +			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
> +		>;
> +	};
> +
> +	vmmc_pins: pinctrl-vmmc-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19		0x0
> +		>;
> +	};
> +};
> +
> +&pcie {
> +	reset-gpio = <&tca6416_u20 7 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +/* M.2 M-Key (J4) */
> +&pcie_phy {
> +	clocks = <&hsio_blk_ctrl>;
> +	clock-names = "ref";
> +	fsl,clkreq-unsupported;
> +	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
> +	status = "okay";
> +};
> +
> +&phy0 {
> +	leds {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* ADIN1300 LED_0 pin */
> +		led@0 {
> +			reg = <0>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_LAN;
> +			default-state = "keep";
> +		};
> +	};
> +};
> +
> +&phy1 {
> +	leds {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* ADIN1300 LED_0 pin */
> +		led@0 {
> +			reg = <0>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_LAN;
> +			default-state = "keep";
> +		};
> +	};
> +};
> +
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart3_pins>;
> +	rts-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
> +	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
> +	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart4_pins>;
> +	rts-gpios = <&gpio5 8 GPIO_ACTIVE_HIGH>;
> +	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
> +	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
> +	status = "okay";
> +};
> +
> +&usb3_0 {
> +	status = "okay";
> +};
> +
> +&usb3_phy0 {
> +	fsl,phy-tx-preemp-amp-tune-microamp = <1200>;
> +	vbus-supply = <&vbus1>;
> +	status = "okay";
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb3_phy1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	dr_mode = "host";
> +};
> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb4b4,6502", "usb4b4,6506";
> +		reg = <1>;
> +		peer-hub = <&hub_3_0>;
> +		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&v_1_2>;
> +		vdd2-supply = <&v_3_3>;
> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible = "usb4b4,6500", "usb4b4,6504";
> +		reg = <2>;
> +		peer-hub = <&hub_2_0>;
> +		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&v_1_2>;
> +		vdd2-supply = <&v_3_3>;
> +	};
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&usdhc2_pins>;
> +	pinctrl-1 = <&usdhc2_100mhz_pins>;
> +	pinctrl-2 = <&usdhc2_200mhz_pins>;
> +	vmmc-supply = <&vmmc>;
> +	bus-width = <4>;
> +	cap-power-off-card;
> +	full-pwr-cycle;
> +	status = "okay";
> +};
>
> --
> 2.43.0
>
>
