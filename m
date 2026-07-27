Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526FF3DA7D9
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163400; cv=fail; b=p0JEuhcbocsD5M1mLzezG71tbUiexTySUftCF5BWjd06A0hmKHxv2MR6jwAyHut40HxiLxmvvklLiqwFXKDv67GOeMPQ93TePmrWTwCZof2I0hAYO8kLhXaOXlGEkcZznx8zq57gY1WAsBcBDS9BV/whd35tFJZZaJG/Y+qK+j8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163400; c=relaxed/simple;
	bh=xtI4wT5CTQ18DEq2R6BQmI/9urJbvSg7VyUNDab/TjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DD0ihArWUeLWsh+gflikZEG9JgdKTMozZI7UEJBz7jTQfucaSQPMT8vK0AmfpU4RTJluNJzOu83fbEcjEqyGk1zkblUS/r5e3Hrp5kOP3fPn3Y/h1ECG+B7phspyp/eK0mJzhMyv/gsgZK6B2iKaCSlSt9ghI0Llrltr9T5HzGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=S6Urjy3o; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="S6Urjy3o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5//MXqlW/Q/3IvPAvTaqXxTxiGhoznFVRkJjSHsi5wooLCYn2NaQ3ximyPali7uzK3YakHD1JttOoMwUUdeoR9vAB3pa1FyeQSgofgG2a5Z8DTd5R269bqH1ytWSomY12Ru0XZedMXr3Tl/kKdYSjc/ANMsZUjl7H8desq4pqg+x9EMROKBY5i1gTeGkF/pf1D2ziNimrdcWLkBe6N5DlY9vnN25llpf6u1X3wZt/IXHEi8EvQaNsx16PmuhbzLY8NNTw30wRN2yqLG7hPMBAVKw/BQCSaNBc0PqExKdoxmYaw13oP1KkRtADmF//vLT48iNCtP0+ULHck/VyMtBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOZzPWdWQAhwg+7NNyuvTtkNRqjeCuQxDx7m0J2Gz18=;
 b=HcVbmTZo+jhgswix6PTH85ko8MLEayKXaSKPpeXNHox3d+i7eNT1VspEwK3+H705YiqXEnS9a7KH++963G0aqOuZzG/hAeCsMXCe+ukZ+FhRaPSAYGuQONla/T3DqfQdceElUw9irhkQrSS9S3zb/EzVJ/F3hZ6jHOBVDaG9iqKdZ3AD4say1P0GWJIfbffk8UZXa9dILDKeIgbmFPG78cp4WRBYxT29VPQh7lpjYzfZvQMuPfyaNl9tWdOTzAIpdOysHjbGPNHVMDcDpCtoaO42JpqUe7LfQbruLH0iWlHRWyy0cql6uxJWg/ogODCtHbXVyzSlCGRS0bgG5qClvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOZzPWdWQAhwg+7NNyuvTtkNRqjeCuQxDx7m0J2Gz18=;
 b=S6Urjy3o0NLovC/kNh+Wf2kg+FAkbzrF2BCH6CZtcNJ3vilSRuuUHkaA0pPOW7Y6I4vQLqWWLwLiY3qELDVl0s3DYcgsQhEFNf7J+X3M/tSad2JIkkRz+GUIa6SQ3hxrI17C81lngNvlCumxDuDFzMCp2EpoaDJ5DiBAkRjJg/5XvmYLr7d4K1fZIDJ4kRjf496i+YiHIWl+FBRZKNuiBZ1D4T7063+yyP+qf4RFUWqhnKNNrLK5rVOYN3YNib+synmPEu/7GdkUXypS3xkH/QNAN2XepZp+oYTzlhzLUtiOmChf2FJnOMJw/5/KxLcMiaMyj9v7GfCNNFDoco26Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB12173.eurprd04.prod.outlook.com (2603:10a6:102:561::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:43:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 14:43:10 +0000
Date: Mon, 27 Jul 2026 09:42:59 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/11] Support ELE API in i.MX OCOTP NVMEM driver
Message-ID: <amduc2ISVquBlD8c@SMW015318>
References: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-upstreaming-next-20260609-imx-ocotp-ele-v4-0-1a515de33093@kontron.de>
X-ClientProxiedBy: PH8PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB12173:EE_
X-MS-Office365-Filtering-Correlation-Id: 6101c3ea-b14a-40e3-5a57-08deebed6145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|23010399003|6133799003|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	wGGsz5bm5EngGa4Hk1biMNxCMDROhcrNvLwrAQQpupWae2Gutok7XhSTr9EQ108bMciqiQbRs0XXDSxaftYGVlXUgP5JQ4u3E40UlaSqSc7OJ51LNOIxCVGK/VRjzKfU9JXSatU21us9iW2jDHHaMsWGBNkvasUXqqTlCl7xjTh9+hCqnI9AIyimrB+ECZm3FNufuqjltAh7LbBI7kleTFhfiwdbZkz+n+ElgKF2fm2UBDcovqstmIYjlm7rDX9AbmdMUee+8ofOoV2sVCWiUFoHXw0UDly7HoLKaDIwX32wPHL5zR7W4VKqaamurWcOqQt7hAhcea91XSZm0Pukz/3IYiMyBiaH2TrJELcrn3jY7efsh+gZ84nFEaV+I5Q8VLA8rqHv4JG7LP9bsQNXpRxNnKgcTh/SnL1Ngedd4tcbYvJTO9aQiYFjyMeJnIXtYZEy/SbncnYYnFHwVNGPPPE5LNeNamDEaORsPFpS32892iqVBdciFmYb26T41MzQ5dwegiEYBgFdWtpeLz+8wTDlI3h9/PTe+SiZRKUiNmKtrVIwvCIH6YLUPAv/S4I0VMNxwALrGHtx765ivVAN6WeyBFPKlRgPIpEGQFtgl6N9VYjc9gW971uK8VULSLKZy17DC3IF5sQ7hKIICGe3gLBJLhWOaErGNPssuH0W3+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?igdImi5XetBV3oEWI8ImQR5p7TYpcNFotP0t5NnlfA6yEng7uAbfoRoWyuZM?=
 =?us-ascii?Q?nwDW4MrDOgoMrjUtI3TmaXaXk3RpkO32eUhrjeZ0lJdqubCxOhW8XjahUz/x?=
 =?us-ascii?Q?LEpNlynT7mRkU0CmkhAFiufnOrN0rL7vYffII9V+n1UpJ7pKRe4JG3rBVujC?=
 =?us-ascii?Q?abePcn1LvkUjMDIPbY8jzSzzE/kC+w39eGvqwwJZ33l+xWz0Do5umADtehV1?=
 =?us-ascii?Q?LFh7UYFGl8Tl0pntyeI0KsgUBV7xY8hnOQGXOgtefRskBFyb/dXFR7GHWHfX?=
 =?us-ascii?Q?NW4UdZZTbZdrteXB1nJFTmD8OP3eM2uI9JRea737DbWOlg88Bd3oCvAVSy8H?=
 =?us-ascii?Q?kMSr8DgubJXqpuX3W/8fjvKgH5OgGXGK5iAf7UlGZHIHsVERw4f8sjatIc5z?=
 =?us-ascii?Q?sIvCTzeQo3R9ivgF/67TU/pDJ8rz8ueKwlGxqmaVMPI8zz8wQsLuknSl4wUX?=
 =?us-ascii?Q?S1r46DbZJrkDTjVN0LSIQtgBJV6/lOOpxdHJE6YGsCEANn3qTrZZIoYYMTD6?=
 =?us-ascii?Q?6/sFedbHVoM28YTL1ggJ4+ogFVTChknXaN+kQi7kXkmXfwHq1H+x8qZ2fZiA?=
 =?us-ascii?Q?rICAHUjuBAkN9KiPaPK+wFbcYS59FK9feLtoEFygU/6ps6OCBd4dmOkl1VAc?=
 =?us-ascii?Q?M5L6/BSehEq9ESE3Hp6bk9Xi1+HkpohEEXJaRA1ubrEZSi6Ryo3eLBSQHmGI?=
 =?us-ascii?Q?PKsicgPoH9oXl2U4QzboyvghFOwd8HbzzdY0A1sxJKqW1M8+EA0NYyasfxyB?=
 =?us-ascii?Q?+G7Tngpsr7Hu80Yha4p5JbHKhtF/8eUALh1JnDE6b+2bYk0UrJHRQGf5tQc7?=
 =?us-ascii?Q?vwxnzv8YhdBYrfkCEepmlCC+n/1pb0vu1g+AQPZrCMmtAroFX1o6UVWyWOPw?=
 =?us-ascii?Q?2Aof3yQNxt3c9JDKcikd0Mg3a0vDWEjT333Wy9IIXMACV1Oy+daEShBxICNt?=
 =?us-ascii?Q?d26PGwStkr9TKLSU74arF3LI2kiIrXB/7xz2cNBPXIQKN+G8x5hri1vEKYFn?=
 =?us-ascii?Q?xmEeyt9DT9FCRJhLCrPOUeoyZ8k3H0GJ+bPOYrzbTb1aXNto7+v8ba6NGw12?=
 =?us-ascii?Q?XbOSqWQhmO2CTNvUz0eT9MqfGqHB/olYp5eDyxyyv5+mw/7B8vJnbYujFr0n?=
 =?us-ascii?Q?Kd7uZssAG31L7zVqQZbpTLYfAns5qg6aIoCO1223WnJf8WeWWIb/Bx533ih1?=
 =?us-ascii?Q?faTk3gWu8OGslY/W95qU451rEGktIGg59RUr33f0qyU5AaGNuv+7vantzQRi?=
 =?us-ascii?Q?r6AzQXxJo3iqVCc1h50DXjZ/n/s537wCLKcNNGu/S3OtaT7Dq2+NZBqRgDsr?=
 =?us-ascii?Q?Y7aIGX/6xjufIkV6tkBLXklWHA5ZTSpFh39bv/mAqBYaB4zZdyVF+kzoS/Pl?=
 =?us-ascii?Q?wmx43snmtoWWr9s0IcFHXILWTsc9tmN6DIM31NO49Nh2rsMSHP/kZWE/z0iO?=
 =?us-ascii?Q?v2bFOj63fHa6My2vHgzbiZEOi2Hjcv60YLvNVMpCEsTi/CwYqnBShp2lXRsJ?=
 =?us-ascii?Q?UDmYGnp4K8mfyXYs3L/3d96AANg2y95+zv4G1HNrrkfMzp+NjqoupNr1c/T2?=
 =?us-ascii?Q?egRzpa7SmBHS0mHy8+Xn8itJj0TV7IXF0bQGGz9SSHzsjJQfl2DzPbIn5PyM?=
 =?us-ascii?Q?Blyx+qUDc4Vn1/v8+N9X/yESOmVpeMOVqfDOUrzYaFV8vy7bXTY+XmENeQ4r?=
 =?us-ascii?Q?92IujPxtqlesX/9VPa0HF4ToCj/BZ3hXbpCR1jPcbjnWfQy0nXUaMoGN2TAe?=
 =?us-ascii?Q?CKXPL1BwUcXM04usaTau/PnZ1z8y8tSYdtfIIsxxL7IdkA7Nyvo7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6101c3ea-b14a-40e3-5a57-08deebed6145
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:43:10.6393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHDRZSqHopj+F6Klqm92PrRX1TSHgXOWn+AwY3E5BF64e4VFsdgrObax7T8SOy/Wsji00jID4CgVs74a9Yt9z6FiZ0sFHe8nvjfCgN682OgqSAAnkis7IBqcuPrA045R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB12173

On Mon, Jul 27, 2026 at 03:00:43PM +0200, Frieder Schrempf wrote:
...
>
> ---
> Frieder Schrempf (11):
>       dt-bindings: nvmem: imx-ocotp: Add support for secure-enclave
>       firmware: imx: ele: Fix indentation in ele_base_msg.h
>       firmware: imx: ele: Export API functions

Srinivas Kandagatl:

	There are depedence with firmware ele. what's plan to pick this
patch set?
	Will you take firmware: imx: ele: with my Ack/review-by?

Frank

