Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011041.outbound.protection.outlook.com [52.101.70.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30A652F9B
	for <imx@lists.linux.dev>; Thu, 15 Aug 2024 18:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723747086; cv=fail; b=fiK9Zs2IF6CG2G6s2r6C/vllLdngiBVlvX3dWR6R0JsVCqFXoFumBSyBuFP2LO9DQPiIQo/l2T9YMVLfmCUpQgfD16pA9et3jFC+KGcpzfX8OEVLCMA8c3V1n/+MsY55amzPXeGQSXHzioX3EaA3Y7hagWx2Yv/atbDdI48j+q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723747086; c=relaxed/simple;
	bh=NwxfsXHd1PUclKECektSV4cy3TCXb5RgqK51ZIQGwRQ=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=JBuKh6E3mW/InBH2j2aY3z1biL4FCEl8PmgcCjKEdYOusb2xKR72w+jLm65VRNIiv0ZnEkQ/jIcL7TUvxQ8Y9+Jf9EVpv8Zvk3M+Xy8a9s8i/jhaY02/3nfHYG2/EA5bebYEX2CeNEErXXfDKlqdTrvVzC0c0iAUhXiFKevXn9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LT1MyLuR; arc=fail smtp.client-ip=52.101.70.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LT1MyLuR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLyDP/ViEka5QxAi3I+n7TVprDXA1F1aPgTgtZH7C2C4ymGEufFy0o3FJcovvDKTXw1UuKeb31eI+UsbXcCsLv/DDhLtOLhDydlemFHLznDezskRUM7ho0YWCC1LwPc0LkxZhtMD0FsZjiIq3Vqpt+5B6ZAivDtzLYRZOPYEitbSmrx7hk5Y+Ild2wLxjfEp9e/srLzs85nJG2z0eAYgfUOWPCkLINZn2n+nmqRJaLgFKEW0d5l/RfqdzyyW1invIYe8YCDyOKUWXTGWtSzt8gdT0Mpv760bpysLIQ5dO15LqiFnhtq2ZH3rsvrNBPNJaYhBwExoR8Rv3W13hQSXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwxfsXHd1PUclKECektSV4cy3TCXb5RgqK51ZIQGwRQ=;
 b=vQ6bJMzwnyYi8D6GZDaHNYQwtZlDm7iTFCFLYwchwAc8BHwA9CcRq6iNrIcd5R7UN+hkuFlzjqFJHOCsGsPVqX+YL3niZTTpLGGX27c/0obeRPuvkH3zWVNoNjcuO7PZv0AImFyjIQYHDmqRVn1C1+D8UNXUc5Z24CDXyne5SVei1bNAgcRe8x6DPUH37MX+ed+VOWxhbqPBCoeM0JQkgs+fvKpmAwtGOd8Yi4lHQcL8XmvSrphlyYqkb2Zhz5OHLHCt3CEhf/HbA0v7kX6XsHYI074Uulp0wD2OdLkvVqKWNYzjF6x0oWM9iVQyXLrR4bLWPG+UBJY8v7fpVhZbKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwxfsXHd1PUclKECektSV4cy3TCXb5RgqK51ZIQGwRQ=;
 b=LT1MyLuRsdBfKNA0o1tJOYdDw68x93C29lrnVr7r7ZZczwgWPaVCZt8FLGpdavOL4Aao/y8/YZabSLjKR9fI9afUS6kuEZsVCDtFdr/WynbLrt9ynMRHbwnMFY0DGPiVrWptKs++YGkl+aoHg82tSMvxQSxRRwUuAaeIAxjZdmoGr66KGMBoHs5K3DYDn7uvPuzcW68c0uPgRQxLBgkLLcnRLvlRVXnOSaYg5RP5aboWOM973mnlzXdzqYzcfao3+voi7UGHf6fC0C0Cwc5CRNc5JVeysQIpni+Xy7fVzjP4YYlte9X2mmEvN11p/GlcSWIMZwpF8K5dWKABRGIlXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8344.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 18:38:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 18:38:00 +0000
Date: Thu, 15 Aug 2024 14:37:54 -0400
From: Frank Li <Frank.li@nxp.com>
To: robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: How to delete property in device tree overlay dtso
Message-ID: <Zr5LAhuieUvM/uEC@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: 0131f5bf-c16a-4e16-16ab-08dcbd5963af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?S9OY+4k/5FOxwjv8DVHlsBVZjjfujM8mn8DyDkK59cnQRsaK65yVv9wnM6/1?=
 =?us-ascii?Q?jJ66qbnfGaUYnMlF1B9p5n2W25RQAdTYF5kgg/BeqmkES+zX5JIo0aAnLkNS?=
 =?us-ascii?Q?CmwTwuNqDO9W2nzmzq9qclllQSb8Wwu/QdehiNg5X2P6GRCi3bR/h4BbK7Ql?=
 =?us-ascii?Q?QfvHiz2ebo0Fii0EEMb49Nv0xHxQyTB7BR65t+SsXxRAOQ24fmUhwUnT56a6?=
 =?us-ascii?Q?Z2JQtX8yUHOnLOGqzoSERQ+QjtbbWhpKQu22oHFg9IOnHMhuW/QQqOKgi3gE?=
 =?us-ascii?Q?rsv5uAZrpRRBthq7mSjRzCvaqrAppzjkBeIbSnj6/Y8g3J7OBsiXX+E1i4Mt?=
 =?us-ascii?Q?jt2zFsO6t0cuoTefUv3gl/qA3SnN06C5G00wbalr0pyU4gIsDugAdtY7Z1eD?=
 =?us-ascii?Q?RRvMatQHzsFMFKwYC+8QbTzA8xgED/LTwNZGZRESCfj+/V6sNDENIDTJJmZN?=
 =?us-ascii?Q?duVDeLFzK+dZ/OX6o5rw0IFGTCGP2zGyfP+qCO96hEkXoAbMOHDBNJ46eVCk?=
 =?us-ascii?Q?Fbo4YGvG72dSZXSEf3FXef1vHsAMqnmGDFDVtONEfCPvsS5Xfah04RwEZa1J?=
 =?us-ascii?Q?H82SM0AbVtYI5vTf0KtRfN4sSaCz/VHMTxfFpr/kFdkGFpkNVpESWneQg9HE?=
 =?us-ascii?Q?8h4BSCBZUMVWkYMEVmG9Hv90lfJTOJ+V6cO1+//6rr8G7ipCy7msuOIht9VR?=
 =?us-ascii?Q?nM6RyyeaYKLODFz0vJHtCWpOEFC7h/77gbe7fnBE7LUDOum2EaLAVqaa8hNg?=
 =?us-ascii?Q?dVHZOG9YNDmBQ5dP2cSgTo6s+nLH9SNnjeK4VEYFnL0eQI1IQDyww0tEfZ2Z?=
 =?us-ascii?Q?vxFZNl/Pt52Tr9JgT0j+bYSiRnJj1heN+bcLOmwJ8/F7UeoIcXYj8V8p8U38?=
 =?us-ascii?Q?WFAd/y5drLIprqAMEdn6nK3YrFmlXj844KJfiJnbIo+saTcXjn1o/RUBDgbH?=
 =?us-ascii?Q?6Bljok/JN+Fbj6zQscpMHNIyWMTO8GWqi0hO72FmzUy/EgSlJCHNQKUCwc7N?=
 =?us-ascii?Q?Fw4DH9pbNz7yA+R+nm2V/vzZ1W6ST0FApALzOtPq7mewdtgdiLHzjbo7MSTt?=
 =?us-ascii?Q?x9+SQ3S1DqNr744Ax+bXISU/aFFZ3WL+gJ5nPb2riaYbnh6PGhJ2a+yJZtIi?=
 =?us-ascii?Q?n5GYwaUa9FhKUPHlORV1GPef6EjgLHrUQFUW4cYceUtzq2ofv95BTRYlFXeT?=
 =?us-ascii?Q?Lu024Mo+G0mFPNbOex+drReVJiebsoACHvOx3D9usbUJk+8nQr1Ingi9Iv9k?=
 =?us-ascii?Q?+xH59hVEBMTDIG99nOkFVqLv/pa3HYIDnUKOD3PCKO9gM5eV6Ke93ItzWMta?=
 =?us-ascii?Q?/JnAQfDz5tYz+MkcpLHeHkfXjlm9SRGByvKJE89emNLhfnuTS3ALUYqFeouT?=
 =?us-ascii?Q?YWg+eEg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sumX+R2kAyWB3zSKiUt8nHydQ1D+fhubGQguNnx4YIl2e46Tv+ppwpbo7djH?=
 =?us-ascii?Q?jpRca5ZgAjEzR+KdkyGxLvTSgtO99Uup3ZMNofiMMVq05EbXuxyePf4yMKDd?=
 =?us-ascii?Q?g+vt/U8wSXIQvva+5MSDKDMB/4w4NeXnWhbTFGLxVWo8u9pD0FmxVMxvwvP+?=
 =?us-ascii?Q?unVYhiJo8i5lddblc919HzTM5kAfGyBGUyqxX9OOxjm+qh4XBgxBkg/BId8e?=
 =?us-ascii?Q?V9wgjfO3siwWKD83ESGa7Y8ZNM/GU6FsfxiThWgrt/vY4WNHSkhS/0uBxBQp?=
 =?us-ascii?Q?iGjT1LEK74XMdmGPoshAcmUgzyfJZegd18TD8fufVg/M6nwoK+DWKKr+rFsm?=
 =?us-ascii?Q?mJ5vC7aT67NwvnUKh+xJCexIZ+23Auqu+t2nA60+OV2ZGjJemhf3LtGMmtiR?=
 =?us-ascii?Q?IYCvl2mOxulldrunQCsGCFdOcgG0KWKSQTiufABvcfjLCzRakR/HBTI5VYO6?=
 =?us-ascii?Q?irxRuz8vBw0SXuB5zexVmcjpELImkYdG2uzTUvuCbKNIzXAx4i63soE8DC/h?=
 =?us-ascii?Q?qCask9usI5DcdsiVK31noDa29qCI4CF/ql5vC9w9iItVljYTzugyIN2IevLe?=
 =?us-ascii?Q?ZtQGJFOhpuiuJS7iE72guBrfl1i26I6LXyxvkkQ1TX07VreUZp8uBDcs12zX?=
 =?us-ascii?Q?+J9FuuOZpC5zGxOLVIKTYfvRW0lNj9rRKLjj0w8tcW1sY763nJWsbFNZ1Nng?=
 =?us-ascii?Q?SH46F05YM3CWcF3eNt6g1nZtknVy12Qxy30fmQOwrjn2wDXMXcr9XtWzIk2v?=
 =?us-ascii?Q?f1H7AVLtjspMXe3tAaYoevy9YpjYxNXZfEtD0JqVd/zoFwf6XReEm3WKPjLJ?=
 =?us-ascii?Q?QZsx9EsHeyaWzhAWk2DUVnWb/XrR7y1TCyRt+BOqc2pnj7IC7ILorL+XXxVT?=
 =?us-ascii?Q?CEeF9yrAwLaQ73tur3QJrDczb+euSl4DkC/E3zHIisxAc67uIKVx/vUpTGom?=
 =?us-ascii?Q?gMAWBl6QoC4VZ+lDDCpWPYXIi8TL8SUP0Ybac6qMYPRbOSNktHeryq15gGZH?=
 =?us-ascii?Q?EdmPAgsZl7OL9IPPLIFJfvbHPfvepRge9Qt1SIMdgaewq4lgWzz/VLtbfNfc?=
 =?us-ascii?Q?7a0utfuaqaBMqey1DHv66YkmNRmA84qpEJPHE+dG0ltM6neeE6gyUSoA6aDz?=
 =?us-ascii?Q?TWOlJz4JZOFmoT6sLqIB41c2y4Fekzr0njvsJxRSilh+jKsVFEkfjCh/UD3Q?=
 =?us-ascii?Q?XahNjZ+Oa/dYQwEyejlkAZDZ+YnXMwgL8GA5DRWtRaaxheTDsajh4mLDF3KA?=
 =?us-ascii?Q?rH7xWT7uTlT1QrbscMTVNmi1Czle+9mHy+5uNeNFvkVbIJVpsVw66XLXHUoO?=
 =?us-ascii?Q?G//x+95R2W9Al0CE4XPviOY2IkRetiJ6sijBs8Dxxt9C2veGFZfxEcIl/TAd?=
 =?us-ascii?Q?qRI10syaeC4kA6fYqHqCLex1GoBCdCj1ZmSOPceo9P9Yu0vYoy5gKUe8QTRf?=
 =?us-ascii?Q?lGmgcq2vOjMYucLHlK4Vv9377XicZSAhDob571S5rQ77OxB+NPPUnAsQY4O5?=
 =?us-ascii?Q?cJR/OE3GhMR8F/rXjSYYOlPKl4ud+9QXaA6QM+uPhsY3XaQya9IWGjkB4m8P?=
 =?us-ascii?Q?hHwdyRAgea5pqdBDuwG9Dq9XyBZ6eaU1unHUfRrA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0131f5bf-c16a-4e16-16ab-08dcbd5963af
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 18:38:00.2692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6IuD0zF9nX62w8uEXaNs1h7o82wocOO5t8ADqsQa1VCDo+tyiUkW8sXijGKHJllJh3MfAFIMlv1nQvqhd7Jd9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8344

Rob:

It may be old topic:
https://lore.kernel.org/lkml/c342562e-f915-a853-c2a8-eecefd94b88d@gmail.com/T/

When I try to fix below warning,

arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtb: sel-usb-hub-hog: {'output-low': True, 'gpio-hog': True, 'gpios': [[1, 0]], 'output-high': True, 'phandle': 108, '$nodename': ['sel-usb-hub-hog']} is valid under each of {'required': ['output-low']}, {'required': ['output-high']}

both "output-low" and "output-high" two flags exist under one node.

When I try to delete "output-high" in dtso file, I found it doesn't work
and dtc have not complain /delete node/ not work for overlay.

It may cause some problems because people think delete success, but
actually not, espeically some important flags.

Any suggestion for it?

Frank


