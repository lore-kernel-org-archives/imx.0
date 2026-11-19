Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795120072;
	b=fE6Ko0hmbPyx+g+UYMyKPt2kH2RIX1r/EP/l3w/SxRxS/xRfco702KA+MfjBt/RHto8X
	 WZE/YSMT2RmFQw6cZ+u2tQeY0I/QkmUV1rwFy0PzyEE8cpz59OLJ0zyOKNzBGO66/yp5n
	 0P/K5YG5mTFepvAXRXh4kYrOyG3xym49JhqnRuxDt30lNeUON+x6v0iDSppf2Hs5aLK/G
	 2Gi/JwnvTkBvLGx/i9fJ+sbnoGC1yYY1as/fsTj+D3yuMuhW1M2fk518FayRthT+ta//B
	 /+lFEXBVe8pjqPCKrREAT/dHfwpTn2zElnETyCGG+QWXT8ZlcwWr1sSHzBwciZEf8CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120072;
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
	bh=B+/Begdyc+1jvfZ3TBu26Y+7QysP+nr8awurMjRGl78=;
	b=l2bCshcIS4rF2T68jdLTWquFLNrRp0BZ74zUDvi59N3cLjyy2w8OtSJleu0k5J2dIyoM
	 aCt0cBbpW7zXvzmZRc0gdWgSd3SzvxmsOkGrSE/j9TSkef8kxrKueudgqvMQLVZOfrUxT
	 cyeurHD7KrkLrtgQwxvnJWddsM53WOof5yfv7+lUs5OsvaIjLF3E3iUEKq9iezWUuFC3j
	 jKCjDTgAbAk4agvf4L0FhLaQKLwEZiZB5Ffq1ShuMJStaLsXIZV6rujc7LA9aen85zW5Q
	 SLCOp8/AHxZbxx1n+EX4rGp/32zz7P/pS+KkXWxorWcUEZJ+s1UHjEkEH7qnblDmL4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="BDsLd0/4";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.10
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011010.outbound.protection.outlook.com [40.107.130.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656ED606A334
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 20:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 656ED606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=BDsLd0/4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jE3H7Ch8jgCz4FCR1V4RAd78TTbW2z92cj3/TmTtt80HcACKkAHWntBVOVowjb6wk/eCdnTaHIOOxoOYy+o6Qw8GWbuYq0gBSjI3fftzDMKRc5zjvK8M7vEPjQ7wY/AdD61M0Nvo1DpLm0nt/v5t7+TaU3u3jWbVV2BcSsJU8AI8PAIo4U0y7AylRZBxG9l+PN3+0vpasQSvnU8xoyxnrRqv5b5u6zX3wFUve9l9SoOf3Q1aAecDyRp60KvOCqdqZdm+FdQwNcBu63Yz5b4C+wOa0svPGYYwmXn9pTauUnbViJqb1bNvd4GaQhIUr1guf7UFl6DLqgx1yRMzvsVI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+/Begdyc+1jvfZ3TBu26Y+7QysP+nr8awurMjRGl78=;
 b=cRa0Vmyn6mTgdXYCA822H1t5FQAuKKqrvgJZ4kU2LuJcqXVPqdrNtQ0RywHU5TZrq8eJ2gaxNrN25+RR6E577ccVlHTEOR2fCOVBidF68AENRGJlMUzsROrHfAzeY1t6trAr2lxvCle+tk27kS7kYqqcgR6zXMrH+4ilzLF9Un3oOwrXcE7q4mmA4WEjNFGVKJj4BHYwHoOx1mY4A5TKXFx6tt++Y2CrBL9nVH5W8fJi9TMwL36A5AQHQ2DHK8xc26OzOgurh4OtmVe4iwG9+kwtCXgCJ/bJI2yYKY3ZWg7TsDcMY7s2dtL54cD3HkmF8WH1o7M34iQMj+3gE0/O1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+/Begdyc+1jvfZ3TBu26Y+7QysP+nr8awurMjRGl78=;
 b=BDsLd0/4qkNZGEph9pOgAG/EWRaNR7KIX04QcdYDmEBz20UDfZ4bSzi8eXR7wRpSbdVRdAXW8NmyxtWw5vewj/kMJmBGGzyoQw7ZX8fuXn3IE4RDTlYsiVs4gh7Hl/LNmbxHPJB4kxPlrGloLBZlUfj5f9egHSInjSfgVf9wXS4I+gHKnhQ6pizh0UjGejaxqGLQjJG0sFMZ02/UOlZ4Z9az3BQ+p1HaQPhzgyfSmag+1NUUO3hc4FSl0ogWCfOjuMfxCPreisLiTR41NYlzMpmYYgiK+yzZGMzTzQUnjafPs8I1SrI7sz0iqsUNvPhnGsqfbikk1L3CC5OLA4hI2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU0PR04MB9371.eurprd04.prod.outlook.com (2603:10a6:10:35a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 20:27:48 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 20:27:48 +0000
Date: Thu, 19 Nov 2026 14:27:38 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com, kernel@pengutronix.de,
	nicolas.dufresne@collabora.com, ming.qian@oss.nxp.com,
	marek.vasut@mailbox.org, jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com
Subject: Re: [PATCH v8 03/11] media: chips-media: wave6: Add Wave6 core driver
Message-ID: <av9bugRyMCQRNEcQ@SMW015318>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <1030b93108a94a28b572a97695f3b5bfc75e0ac9.1795075580.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1030b93108a94a28b572a97695f3b5bfc75e0ac9.1795075580.git.nas.chung@chipsnmedia.com>
X-ClientProxiedBy: PH0PR07CA0110.namprd07.prod.outlook.com
 (2603:10b6:510:4::25) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU0PR04MB9371:EE_
X-MS-Office365-Filtering-Correlation-Id: e08d752f-0ce4-41d1-f79d-08df467b9386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|23010399003|19092799006|261026121527099003|10067099003|4143699003|11063799006|56012099006|261021121427099003|261021135927099003|261022105027099003|261021123027099003|261022075727099003|261026140227099003|261028144727099003|261009223027099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yuNWqO0MubvQ1o8hVFWVvuUhB4+Gnn15O/sM429/QkCw1jcZypVH2XWPPOxbArD25OhlXYDzCKSsviRdVX3vaMZivr5uoRWfYIk0h04RJ5/LS+XPN5qSWePEJMC37+J0ao8rN3p8OJCAn+/YgwiLtuz6gF/1yZpUjKlXIP+AAhPXCFTR9B0hKLZ8f3J++pxs41CihQPQANI0GEPb4GExt1VjwjWP8wWsS+0/jITY+2WDkRRJSmP1NBFz2bwYCeP7lWYspLumFHGC2PEgfdfjJso42yJ/UXUk506XSblAfb19nz+Jrb9lK4uNIeUFVnwfSXYYRiuB6wWvpj+frq7X+4Gs7k3uI1RdxmYR9E54J8EZQn+OF7AztrbMplCOl+VCbMd3xLvguIWrbL6RO2gLoi0k190Rgn0CMzN03q6xsYOKNSF6pac2OX9zdF8/SzoXvE2CnJ48VVe97Udgf1wymVwKodhffRtr4X9BVdsLeLEQddTI8j70lJAMV+Zho1IJma1NLJsZmeTvJ4uqY9+wlOQVNpkludvr6XepJ25UY/S+aC5xFORocdzpV2aGn6DglSRbSegv+P9kOpmmhwguInGQQoA5o9z40EYA/O4QF2gDfFCjZdF4mLbO3gLrgvuo53yklDiWnSzd4OHRuD5bOJHH4aNq+181cTyIgLcdB4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(23010399003)(19092799006)(261026121527099003)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261021135927099003)(261022105027099003)(261021123027099003)(261022075727099003)(261026140227099003)(261028144727099003)(261009223027099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?31Kbge2YoMzEq6JNk4WP2Vz5YRgbMUh+o2gh0W3n+LchdjW1M3rzFHqXOJCs?=
 =?us-ascii?Q?bB128O/Sjtd48Bj6rXGSz45/huMdBcZNJi0NSTC78HOV2MIDRYe7Tvjk9TZv?=
 =?us-ascii?Q?6aqpvhQWeGO1IaIUNFjCs3wmicwM1y3jhwOG1Xg4VaEXRnFBTVJrfElwsZvC?=
 =?us-ascii?Q?i9MNVi9Ea5f/p3oQCwBrtN/nsIa0/PHEQcugHqxXuavSN1Xh+VkPf0rQcDGw?=
 =?us-ascii?Q?Zw6EqJTA4V87XONWoLY2H6vT0oqzrg/F7WIF6Ci7wVZLMElPNIRwYexlu8dA?=
 =?us-ascii?Q?7vR/xyzpUJlo10leEJHdXU5X/CK74BRZlXEhlcF43hkdob5OFyHv4/Exhomk?=
 =?us-ascii?Q?NUxq7JPvErnLQvPRueJe/ejN2dGKG6CyazIgd+0rHiFGaEOmIj7S5GtgbOhC?=
 =?us-ascii?Q?oTa56IknY/QmHPIr+2zUVmv0mFL5e5S3fB+ZbjVwmyj9Du9MyZy3IGvZoFeC?=
 =?us-ascii?Q?fKf6pNQDOMGhugVH6cGLhGrta29Wh3SnJ9ltExBx0SKQCgcCclJJ5nlrgH/y?=
 =?us-ascii?Q?m7GKZ0lsQQtgGEe/7pR2wTXR+T6VmrKqC3s9tbkcuaoA8wp1+mm+xE7caozd?=
 =?us-ascii?Q?mA/y1aNA22RSx6afhFnIeKMD+kPpXyd+1Rlfet1b/uL/w9HlIk++1wBZdudI?=
 =?us-ascii?Q?OsCV+yZGkFh6pv7LZMfG6SXJ/+rJjtl3d/Q4+gJTNjWNspRJgcDpSWJbZ5WT?=
 =?us-ascii?Q?XLCA9Fsdvgw4rfA3EczhCQlqc/vVf6xUwjrfB4ntauhXONwgBKqnXshY5JOY?=
 =?us-ascii?Q?BYoE7DmmZsJnsbeWfx8kbVy/Io80nEKmD1atjogr/yRxrqEmoYtO+079MOup?=
 =?us-ascii?Q?8v4lsvo5PIib8OcPmXpxU8sWuNDvTN1RlcgOg9FQapgFzOIXYqGJo0Y7lhf+?=
 =?us-ascii?Q?l3y15rFWPiReDKyrV1Bv5d8LG8see31xTZoVl+hkmjSPAlXabjWn5Lq1f4CR?=
 =?us-ascii?Q?ftmKPmuwFj1EX+/2vqEN6sBwXYdYLe5ZbEQa41SvZHmiVNrDh+AX1vQTQNUA?=
 =?us-ascii?Q?JSRLGNnNcfHm3qe9n3GR/GPdaRzdnV7etyCuXEwAeYNA/E1OBkyk1/SOjYC8?=
 =?us-ascii?Q?L2s3h9p4TGcXHqW4d2AKvWlksvD5UHO+9+MDp6+0UbRuK9yP+oAoA815zg/r?=
 =?us-ascii?Q?EP9uGnkfyQbL6e8GL1gI58ih/pwv6tPiCDznlGFZ7QqDT4tr4zjdFuX/27Ae?=
 =?us-ascii?Q?Pbm6g6UOi+xxSIcFNj3aHD8L1iaT9P556rie5hER4zP8DlkxyoFxMNqJZRY6?=
 =?us-ascii?Q?3M8HLGVTDoE8VQzQPfja/zGJ10QhXFIDoB1O9/LRbvBLvp6cuS5gzBh5OnNo?=
 =?us-ascii?Q?RLoG/woXzgbmJjUaLecCGcKxfsSNGAYAf2d0jS7+d0y4A7X8e2JDgwaf2gcQ?=
 =?us-ascii?Q?eW36PDjasz4DzbqXPF89U8KdHLTDfrPKaJxTqJ0dO4YUZ5K3U+FQDr/PmWz/?=
 =?us-ascii?Q?hDCvNFAgO0rpTO0YQJCGV27XVfKl6r5I7OrllaCtGz6P9ZOs9NMgc0H4WgEj?=
 =?us-ascii?Q?tqoUyvTfjgX4UvTxvbwx0wDEb95C1siWKbzGF3aVy2HKe96vJxJOzhDS0A3r?=
 =?us-ascii?Q?hRKuURsl1oCH0W3pxR4cWTYQIQYSOICCdByTnz//3OlNDnN9Ypi8M/+/2YCH?=
 =?us-ascii?Q?zUJhClbz3EUNxmd5UdN/Un1XRtno+ABDpceof94XloKI5E6dbC4nrcrHHw1x?=
 =?us-ascii?Q?2cGH4sCtJ1DepCp/452oS0j1pLxRkQyf+sbsHfhhuC7dKYSR/f2QJTL3vhix?=
 =?us-ascii?Q?jzl8saRJic/IYnEsOde+etV2HZkjzKg2fzR0KF0CG9wcZ0HksLqG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e08d752f-0ce4-41d1-f79d-08df467b9386
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 20:27:48.2135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0ap2ulFTwh3w/k2D0beQhSz7hz0shaWry8EukToIV2QOTwcJWlvboLUmdRKK8vK0ufeLhve9h9JYqBUmkSV4ELo81CChgKUXfSKweWTwjbl/A6n2vBATQ+zl7CTTvuc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9371

On Thu, Nov 19, 2026 at 05:59:57PM +0900, Nas Chung wrote:
> Add the core driver for the Chips&Media Wave6 video codec IP.
>
> The hardware contains one control register region and four interface
> register regions for a shared video processing engine. The core driver
> handles the interface register regions, each with its own MMIO range
> and interrupt, while relying on the control driver for firmware loading
> and shared resource management.
>
> It configures the V4L2 mem2mem devices and communicates with the Wave6
> hardware to perform video processing tasks.
>
> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../media/platform/chips-media/wave6/Kconfig  |   2 +
>  .../media/platform/chips-media/wave6/Makefile |   5 +-
>  .../platform/chips-media/wave6/wave6-hw.c     | 181 ++++++++
>  .../platform/chips-media/wave6/wave6-hw.h     |  22 +
>  .../chips-media/wave6/wave6-regdefine.h       |  65 +++
>  .../platform/chips-media/wave6/wave6-vdi.h    |  20 +
>  .../chips-media/wave6/wave6-vpu-core.c        | 392 ++++++++++++++++++
>  .../chips-media/wave6/wave6-vpu-core.h        | 106 +++++
>  .../chips-media/wave6/wave6-vpu-v4l2.c        | 384 +++++++++++++++++
>  .../platform/chips-media/wave6/wave6-vpu.c    |  24 +-
>  .../platform/chips-media/wave6/wave6-vpu.h    |   2 +
>  .../platform/chips-media/wave6/wave6-vpuapi.h | 381 +++++++++++++++++
>  .../chips-media/wave6/wave6-vpuconfig.h       |   6 +
>  13 files changed, 1588 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
>  create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
>
...
> +
> +u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr)
> +{
> +	u32 data;
> +
> +	data = wave6_vdi_readl(core->reg_base, addr);
> +
> +	return data;

return wave6_vdi_readl(core->reg_base, addr);

> +}
> +
> +void wave6_vpu_writel_relaxed(struct vpu_core_device *core, u32 addr, u32 data)
> +{
> +	wave6_vdi_writel_relaxed(core->reg_base, addr, data);
> +}
> +
> +u32 wave6_vpu_readl_relaxed(struct vpu_core_device *core, u32 addr)
> +{
> +	u32 data;
> +
> +	data = wave6_vdi_readl_relaxed(core->reg_base, addr);

return wave6_vdi_readl_relaxed(core->reg_base, addr);

> +
> +	return data;
> +}
> +
...
> +static u32 wave6_vpu_get_product_id(struct vpu_core_device *core)
> +{
> +	u32 val;
> +
> +	lockdep_assert_held(&core->hw_lock);
> +
> +	val = vpu_read_reg_relaxed(core, W6_VPU_RET_PRODUCT_CODE);
> +
> +	switch (val) {
> +	case WAVE617_CODE:
> +		return PRODUCT_ID_617;
> +	case WAVE627_CODE:
> +		return PRODUCT_ID_627;
> +	case WAVE633_CODE:
> +	case WAVE637_CODE:
> +	case WAVE663_CODE:
> +	case WAVE677_CODE:
> +		return PRODUCT_ID_637;

what is use for? why not direct use WAVE*_CODE?

> +	default:
> +		dev_err(core->dev, "Invalid product (%x)\n", val);
> +		break;
> +	}
> +
> +	return PRODUCT_ID_NONE;
> +}
> +
...
> +
> +#endif /* __WAVE6_HW_H__ */
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
> index e879a9743cb3..aa9b972c82d1 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
> +++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
> @@ -14,14 +14,51 @@ enum wave6_command {
>  	W6_CMD_INIT_VPU		= 0x0001,
>  	W6_CMD_WAKEUP_VPU	= 0x0002,
>  	W6_CMD_SLEEP_VPU	= 0x0004,
> +	W6_CMD_CREATE_INSTANCE	= 0x0008,
> +	W6_CMD_FLUSH_INSTANCE	= 0x0010,
> +	W6_CMD_DESTROY_INSTANCE	= 0x0020,
> +	W6_CMD_INIT_SEQ		= 0x0040,
> +	W6_CMD_SET_FB		= 0x0080,
> +	W6_CMD_DEC_PIC		= 0x0100,
> +	W6_CMD_DEC_SET_DISP	= 0x0400,

BIT()?

>  	W6_CMD_INIT_WORK_BUF	= 0x1000,
> +	W6_CMD_QUERY		= 0x4000,
> +};
> +
...
>
>  #endif /* __WAVE6_REGDEFINE_H__ */
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vdi.h b/drivers/media/platform/chips-media/wave6/wave6-vdi.h
> index 69ebf0ebcb13..67704fdbe27d 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vdi.h
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vdi.h
> @@ -13,6 +13,26 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
>
> +enum endian_mode {

name is too general and easy happen name collision.

> +	VDI_128BIT_BIG_ENDIAN = 0,
> +	VDI_128BIT_BE_BYTE_SWAP,
> +	VDI_128BIT_BE_WORD_SWAP,
> +	VDI_128BIT_BE_WORD_BYTE_SWAP,
> +	VDI_128BIT_BE_DWORD_SWAP,
> +	VDI_128BIT_BE_DWORD_BYTE_SWAP,
> +	VDI_128BIT_BE_DWORD_WORD_SWAP,
> +	VDI_128BIT_BE_DWORD_WORD_BYTE_SWAP,
> +	VDI_128BIT_LE_DWORD_WORD_BYTE_SWAP,
> +	VDI_128BIT_LE_DWORD_WORD_SWAP,
> +	VDI_128BIT_LE_DWORD_BYTE_SWAP,
> +	VDI_128BIT_LE_DWORD_SWAP,
> +	VDI_128BIT_LE_WORD_BYTE_SWAP,
> +	VDI_128BIT_LE_WORD_SWAP,
> +	VDI_128BIT_LE_BYTE_SWAP,
> +	VDI_128BIT_LITTLE_ENDIAN = 15,
> +	VDI_ENDIAN_MAX
> +};
> +
>  /**
>   * struct vpu_buf - VPU buffer for a coherent DMA buffer
>   * @size:	Buffer size
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
> new file mode 100644
> index 000000000000..67c6666579d9
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
> @@ -0,0 +1,392 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Wave6 series multi-standard codec IP - wave6 core driver
> + *
> + * Copyright (C) 2026 CHIPS&MEDIA INC
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/interrupt.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/iopoll.h>

sort

> +
> +#include "wave6-vpu-core.h"
> +#include "wave6-regdefine.h"
> +#include "wave6-vpuconfig.h"
> +#include "wave6-hw.h"
> +
> +static irqreturn_t wave6_vpu_core_irq(int irq, void *dev_id)
> +{
> +	struct vpu_core_device *core = dev_id;
> +	struct vpu_irq irq_info;
> +
> +	if (!vpu_read_reg(core, W6_VPU_VPU_INT_STS))
> +		return IRQ_NONE;
> +
> +	irq_info.status = vpu_read_reg(core, W6_VPU_VINT_REASON);
> +	irq_info.inst_idc = vpu_read_reg(core, W6_RET_INT_INSTANCE_INFO);
> +
> +	vpu_write_reg(core, W6_RET_INT_INSTANCE_INFO, INT_INSTANCE_INFO_CLEAR);

suppose only already set irq, irq_info.inst_idc, like below code?

> +	vpu_write_reg(core, W6_VPU_VINT_REASON_CLEAR, irq_info.status);
> +	vpu_write_reg(core, W6_VPU_VINT_CLEAR, VINT_CLEAR);
> +
> +	if (irq_info.status & BIT(W6_INT_BIT_REQ_WORK_BUF)) {
> +		wave6_vpu_require_work_buffer(core->vpu, core->reg_base);
> +
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (kfifo_in(&core->irq_fifo, &irq_info, sizeof(struct vpu_irq)) !=
> +	    sizeof(struct vpu_irq))
> +		dev_err(core->dev, "IRQ overflow status 0x%x idc 0x%x\n",
> +			irq_info.status, irq_info.inst_idc);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +	core->irq = platform_get_irq(pdev, 0);

...

> +	if (core->irq < 0)
> +		return core->irq;
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, core->irq,
> +					wave6_vpu_core_irq,
> +					wave6_vpu_core_irq_thread,
> +					0, "vpu_irq", core);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
> +		return ret;

return dev_err_probe();

> +	}
> +
> +	ret = v4l2_device_register(&pdev->dev, &core->v4l2_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register v4l2_dev: %d\n", ret);
> +		return ret;
> +	}
> +
...
> +void wave6_vpu_writel(struct vpu_core_device *core, u32 addr, u32 data);
> +void wave6_vpu_writel_relaxed(struct vpu_core_device *core, u32 addr, u32 data);
> +u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr);
> +u32 wave6_vpu_readl_relaxed(struct vpu_core_device *core, u32 addr);
> +
> +#endif /* __WAVE6_VPUAPI_H__ */
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
> index 1d4e016c2a58..fccb854a8a8c 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
> @@ -18,13 +18,19 @@
>  #define W6_VPU_MAX_NUM_CORE		4
>  #define MAX_NUM_INSTANCE		32
>
> +#define W6_MAX_PIC_STRIDE		(4096 * 4)
> +#define W6_PIC_STRIDE_ALIGNMENT		32
> +
>  #define W6_VPU_POLL_DELAY_US		10
>  #define W6_VPU_POLL_TIMEOUT		300000
> +#define W6_BOOT_WAIT_TIMEOUT		10000
> +#define W6_VPU_TIMEOUT			6000

Need unit

Frank
>
>  #define W6_MAX_REMAP_PAGE_SIZE		(1024 * 1024)
>  #define W6_MAX_CODE_BUF_SIZE		(4 * 1024 * 1024)
>  #define W6_CODE_BUF_SIZE		(1 * 1024 * 1024)
>  #define W6_EXTRA_CODE_BUF_SIZE		(256 * 1024)
> +#define W6_TEMPBUF_SIZE			(3 * 1024 * 1024)
>  #define W637DEC_WORKBUF_SIZE_FOR_CQ	(3 * 512 * 1024)
>
>  static inline bool wave6_is_product_w_series(u32 code)
> --
> 2.41.0.windows.3
>
>
