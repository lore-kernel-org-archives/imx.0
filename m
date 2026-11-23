Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795469437;
	b=LM+T8JOyTHHD8TSm6mHleA8qAzqz2S0sVQf0+jyVFdNLjfxx6MGIXWi8OiI39xSp1/jv
	 20jhBBwUv07qQXqD27iOwbt5VIhU+fKwA5emFf8IOGxNQCRHjwN+/9sn0120zIweOboF6
	 5PreBch6RuIWDoxL2dKm1yJBlWkDoznYeigJ1WI4u2+Vu9nTWnwQ/+2GDBXz2uIEv0L1O
	 L4hi6iV+KdsrXPEC0UP3pJTToX72cZnBtZB5lrueO0hdjf68Ejg+3bbfjh38At/ZxkL/n
	 MIE+FH1fz0DlrK0JGfzf4yLRP6FfAficpVFVaa+Ct8GKz4y+UVw8FTt2mFwxcQTASfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469437;
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
	bh=UknjKM/2e+00MUhQQt0NXDwdL3NEyetFuZAF+JKC/GE=;
	b=Plp8jxwibRPCLtnunusaBnqSrFKSZAzp+rG9Ikq+2kys9Plyen3pA+CndyXL/nTGD9+s
	 e1CmDfl22ubT/YJjI+CtuCIsnoCp1HZ5pWIos1R8jdBid+DM8mlYuJOMNIc2gqc+PRqN2
	 2NmNQCUgI28MLcuMK2xEgPC0e5ZZXNhCX2XkcRrMP+fPM718Kn8bNQXhkCxHEKAIwgExW
	 H1VwSe1/+XE0JHRquyf7eudRSlO40oREAITrByostYG6Y7vphbKyo2MY3RU7D6XhqodvE
	 O6j1PMJCRD2iUYmJ7VHHJI9+Fcr2+5cs6tiS2ecxu6i6Q9upHoPIQnE/VMW/PFOfyLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=og5B9sP6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.38
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9A8606A327
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 21:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E9A8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=og5B9sP6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlZFc2XUK9ye0WulJbmfbs3iM2VFXqFiIxXHQJdMBeq+4UligywbacLMEgeCrHOLcFvkRVsPzPYK3HtpsEKcbxYMxgerGDdz5fvH1Fr7Eeeq9XmTniFvmdSBsJ2lvje0Q536h5Qu52VnHe97Qq7BIRJ/c/6dhrxeRpcL6tIjjH2P2qNYUE8ht+MDwGTZPfs3AuEvITNxyH+vpC9dyD80pyfTYKMc5GHA8JQm5a/igyt7PGNsv6OaEVb2MU7yVV3Nwx6Z+hzHNnqIF6DTquWqJmRnZqbHJOj5ja7Z93vtGT022SvXDJyZQuOEgcHTX9J29z+lLdcexxVkKol8Z2riYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UknjKM/2e+00MUhQQt0NXDwdL3NEyetFuZAF+JKC/GE=;
 b=XvlAMBcnOJj9v297xra4dO+w2KCSI8Ebhvt4F0tEeNkIXHZkt8sxQ0Bkk3jXOCn0pZ/NkGbRPvWNAx+sEzTkUi9EgL8LT+9YwLzzAWcO3gaMHlfA5cbRuQRABrgcBbyLG8ZjDwFdNKz5EGqwkxl2nuTHHTNFyBYX/m5Rg95bU8GkDYVp4JY3hsCZyY2LuPuqwHT/XqXP6P/F3YSsrtKHr8lV5vePSM1a86S+vvt3BZPXxWceWOGT80VXGPcOJciHXtMbQPiZLfru5koxEXCPE3rSjA2A2ytjnUjFNC+3dslUciFMGQKVc35g/XjvSjyD1gT3xm5VgM03JGOE07Pmug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UknjKM/2e+00MUhQQt0NXDwdL3NEyetFuZAF+JKC/GE=;
 b=og5B9sP6UYh9a7bFW1O/q0RzJIFzDUtPO+NYv0KxzPjAjZgk2M3ndrs4vaHhLqzk8mtei3GDjV7ARuk2rSpq+FZynglypr+JAQ3WLBqLbaaNZUan6SoB25WAU4QgztQUhpikN8yqpnxOvNjgM5GffSjDZ/OnTumWLcf5myUGUH0MYK49VF9axrXzbtQcn6P3cp3wdFsawSwZzzqXjtUmjNh5Z6PO6jMN8oJvFVvv5N6m3daelsABLFTS7aVzp+HNrAW0SBzCPvBwtLCSPIxQf+hhgnajGFJALeUy4vJeQldY9Nov0wzUkUTxj861p7MovhjJbEYPw8nz5zCAfI3gSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM0PR04MB6963.eurprd04.prod.outlook.com (2603:10a6:208:18b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 21:30:33 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 21:30:32 +0000
Date: Mon, 23 Nov 2026 16:30:24 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Arun Iyengar <aiyengar1990@gmail.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: verisilicon: Limit the i.MX8MM G1 decoder to 1920
 pixel wide pictures
Message-ID: <awSwcDzT60vVypXE@lizhi-Precision-Tower-5810>
References: <20261119-hantro-imx8mm-vp8-v1-1-835dd9b5382c@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-hantro-imx8mm-vp8-v1-1-835dd9b5382c@gmail.com>
X-ClientProxiedBy: PH8P220CA0053.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM0PR04MB6963:EE_
X-MS-Office365-Filtering-Correlation-Id: 076297b5-6fec-4a4d-0413-08df49a90122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|19092799006|261009223027099003|6133799003|260925021311599003|260925021911599003|260925022911599003|18002099003|22082099003|261022105027099003|261022075727099003|261022113327099003|261102123227099003|261026121527099003|261021123027099003|261021135927099003|261021121427099003|261028144727099003|261026140227099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	uPlHfqZEAJ7xu/Y6OlBfkIrPsFZPHXeTQg88mW1bv8tNvzmjjvUZCGwfgIwMFK8GfcGHtKFZV2xjRugZuAcJPVYWPxgbxR+/b7S2t3SjJ80dg4vwJjuoI77Cnsrs1WTuNxUDdbS0IVfelmrD3HAWJffhNa8jAuOFyak57OlXpbREqofARvIk6s7wlb5a69XRQSrap1Jx5mcJiWR18w02iqkdmMKPe99T5rmxqyjH+MWHCvpFs5AqRHFh/GAxAncjDCGajHiTy37hCQirsH8ia6tv/0PrwN2CpR4fq2H1WgDadBnah1maHJuAIDd9DL2zatQ8/KK9WjXSLABmIZjLhbGAb2bb3nlUr0shvqz7r3cBEoVdZjaN62oQ9tGx264ZMgXP51OpcC87S8PhNIGhD+OLOa65G0/yrwnyaiP/6faKmpZdnFUGy7boIJOrcWeGhmESVZdKl1+QdPxTVFROLJPHVgCv0rBUmab2mHRNhy/BczLMJLFl9tszm3P5e82f5ntlIx7b/y04Fq8BGrEmyjgQ50HBsvUg593sSgyFkkgmE3p6uLg/bw8Nq9EQQVKFQ91v/44O4X2GCMH6ZhjEF4cgeIq4e/0VXLPSj3DEK+p7Qnjye08HnajU0278iB2j
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(19092799006)(261009223027099003)(6133799003)(260925021311599003)(260925021911599003)(260925022911599003)(18002099003)(22082099003)(261022105027099003)(261022075727099003)(261022113327099003)(261102123227099003)(261026121527099003)(261021123027099003)(261021135927099003)(261021121427099003)(261028144727099003)(261026140227099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IIMJ/JUYB+AsxWHBsgWMc5j9DT8dF3skmB9wPVFSHaxzlzNnDiSxU/+NzLf7?=
 =?us-ascii?Q?adrC5W8ypl4IfCd3fGX/mZzR945KhRY87DI1dZuGOLBwzeA2WgS+45OoTAH2?=
 =?us-ascii?Q?hfHlGRV60OXpOmpsfZf+GOXWb8NGMhOAW81df4H6KOMaJn2+V0Gy7HOEI3o8?=
 =?us-ascii?Q?4+58l4rUdaPj8aWrjn7UbUhipFZBrd+n+N93jngZ6AHfu6PiUbRNioAPHPAj?=
 =?us-ascii?Q?lO6eEWL00oOomQAh5yozQeIKp03yYop9uuvvYxARC+WsOsqelfKXWdlIg7yu?=
 =?us-ascii?Q?wBfCtfD2GsetMfFby/q8f573EcBfGwe10P6vds+etU/01hyS7GOe2o11SYV3?=
 =?us-ascii?Q?sL84CiZg8PgYe+UehKvpZRWaP2uBS8V3tI1C60r9FJ5gaXAJNeGVRTo9LEnH?=
 =?us-ascii?Q?/A2XnhVLjK/HT8B+hU9v0uBiWEyH51qAfxmXZlaCWOzgBlpJJHAHRIAhaKdI?=
 =?us-ascii?Q?yvJQNMWBY1p6reIbigJDhnT0j+G+uPwnPQixl568ECglQLgUp0rPabU2GyXu?=
 =?us-ascii?Q?9q1mQyayLlHAPFj6UnQHO8Cf9vB7JG1thklOgDqD5WbquazCrUPBE7jd0hld?=
 =?us-ascii?Q?/iAYQzFXJkK4Z6XfjkTL4lVCeTOKTKdflVw6EENWqHcsBhzyEyfryx/HmPXE?=
 =?us-ascii?Q?j5iDMeDSOko6OiKzvQ7ikOtT4Q8y0SnuOmd3Xw0sxi8X+o4ryCJG3IfY162n?=
 =?us-ascii?Q?x3RPlfzrGnTmQKPIPxw+3MaevebZYY4TvkWint9v4H33jT9h/I3DqmxoiF4Y?=
 =?us-ascii?Q?TrBtMJpU6QzBS9ddblFhGK0GiWdnb+7GHVH6+wRVFeb4WL3uHfLAvgQroKXS?=
 =?us-ascii?Q?4wIUlZH26r8CyCI5dJD2FivvGIWlxuT/yjgThVURR4ajJSzkJAvQ5FZ2iHlO?=
 =?us-ascii?Q?mzeW8vtUrqtHifg26AP1WK2BZiuqg3QX/INpWAx2BpIeFRcq/ab0qtjAKpOR?=
 =?us-ascii?Q?MOZhBt8qfA55EudIlkFuZ2e6cWyR1pFwr64SOAa879cf61q1xNViY25i12xj?=
 =?us-ascii?Q?mZcJA8+fWpuaR+deR+Fn4LMKxldgYn1nMvnN/R9mdRTs+fr+DpwFy7Pho7ss?=
 =?us-ascii?Q?tK3TwBdrtgSaZLS37puyxEBu9fIJckx0/O4DdJJJdcXIB0ry6ofmxyzSmJkK?=
 =?us-ascii?Q?5ehvcmS0O2QTU3GFPROxcbg21WUHj40YJyWQbDaI1cwY+V1AA6Pb2NksJnCD?=
 =?us-ascii?Q?/s3+Yp/vlJBeMFQB7f7xhd8faO7XMygNeWQxqHj51iBS97E7Jg1mrFBEkdhZ?=
 =?us-ascii?Q?5UAPZaruJfNDuuWmDJd3YH/8qHi1QkAC8Cv6gRLIosj7Zzv5qMrZSzuBSVfp?=
 =?us-ascii?Q?cZbo5Jyat6b7++cTAl6YM6wRuxVDrhLAjGcMyhvSyQa3J7mPSOqokW0K2FL8?=
 =?us-ascii?Q?kWokM3hTWEeYrmBgxNQuMROu7HA0p/M+OR6m8ZRrnXLm6zWxQrnhWTkKWF6o?=
 =?us-ascii?Q?rIbh7HQt+iOmJ0F0i0+7digoSjcnnVcfiz4FGijqg4nLvKxhtikZuay48Hff?=
 =?us-ascii?Q?uBFr4hpai2PXDGWIJD9GKGAWA7gBRCiAGDI3DjFtuMvvJgj25s0p5Zh5jx5M?=
 =?us-ascii?Q?XOAM+7wA2fFokV9MtkQfV34U5Wl4QL6pURpogRDf1LQ7ovW3TN2Ktuq+cbjq?=
 =?us-ascii?Q?GOZX2zFLOUJY00hwBjg9ooN3+bjNQCa365iQWxl7zBZOdy750KLC/O34RwGR?=
 =?us-ascii?Q?GtrBFcQ84gGgQrigMp86yfWO7N5q46K7dTqIDJlrfWSNEJ9BNsS012CPRPYc?=
 =?us-ascii?Q?wG8a5XF7vEqaAwSdtdCWwJUid08dDAJJGaFoYvAduGbPzJTtCcJu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 076297b5-6fec-4a4d-0413-08df49a90122
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 21:30:32.7940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UStuit0A06eBRMVWWP7T06x+6+tPyy08O7tpbZqvD/uLDEzwLsNgq6Xo8mPtrsdqyUP5aQtqnkhBFG+NHz0hAjkJOvrFTpkW4haV8U4QKZVWiAIjsQQlq70ej1mWyZi9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6963

On Thu, Nov 19, 2026 at 10:07:58AM +0000, Arun Iyengar wrote:
> The i.MX8MM G1 uses the i.MX8MQ format table, which allows H.264, VP8
> and NV12 up to 3840x2160. The i.MX 8M Mini data sheet rates the decoder
> at 1080p60, and NXP's hantro_v4l2 driver offers a decoder of that size
> 1920 pixels wide and up to 4096 high.
>
> Give it its own table with these formats limited to 1920 pixels wide.
> Heights are kept so that portrait pictures such as 1080x1920 are still
> accepted, as in NXP's driver.
>
> Fixes: cf1abc501a5c ("media: hantro: Add support for i.MX8MM Hantro-G1")
> Reported-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Closes: https://lore.kernel.org/r/f041c5d87698ab3be8283ecc71ead0679327238e.camel@collabora.com
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Not tested on hardware: I have no i.MX8MM board, so the limit is from the
> data sheet and NXP's driver, not from the decoder's configuration
> register. Build-tested only (W=1 arm64). The i.MX8MQ table is unchanged:
> NXP's driver gives VP8 the same 4096x4096 as H.264 there.
>
> Developed with Claude (Anthropic), which wrote the code and the commit
> messages. I reviewed every change.
> ---
>  drivers/media/platform/verisilicon/imx8m_vpu_hw.c | 58 ++++++++++++++++++++++-
>  1 file changed, 56 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> index fa4224de4b99..805c57a4adcb 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> @@ -148,6 +148,60 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
>  	},
>  };
>
> +static const struct hantro_fmt imx8mm_vpu_g1_dec_fmts[] = {
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV12,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.frmsize = {
> +			.min_width = FMT_MIN_WIDTH,
> +			.max_width = FMT_FHD_WIDTH,
> +			.step_width = MB_DIM,
> +			.min_height = FMT_MIN_HEIGHT,
> +			.max_height = FMT_UHD_HEIGHT,
> +			.step_height = MB_DIM,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_MPEG2_SLICE,
> +		.codec_mode = HANTRO_MODE_MPEG2_DEC,
> +		.max_depth = 2,
> +		.frmsize = {
> +			.min_width = FMT_MIN_WIDTH,
> +			.max_width = FMT_FHD_WIDTH,
> +			.step_width = MB_DIM,
> +			.min_height = FMT_MIN_HEIGHT,
> +			.max_height = FMT_FHD_HEIGHT,
> +			.step_height = MB_DIM,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_VP8_FRAME,
> +		.codec_mode = HANTRO_MODE_VP8_DEC,
> +		.max_depth = 2,
> +		.frmsize = {
> +			.min_width = FMT_MIN_WIDTH,
> +			.max_width = FMT_FHD_WIDTH,
> +			.step_width = MB_DIM,
> +			.min_height = FMT_MIN_HEIGHT,
> +			.max_height = FMT_UHD_HEIGHT,
> +			.step_height = MB_DIM,
> +		},
> +	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
> +		.codec_mode = HANTRO_MODE_H264_DEC,
> +		.max_depth = 2,
> +		.frmsize = {
> +			.min_width = FMT_MIN_WIDTH,
> +			.max_width = FMT_FHD_WIDTH,
> +			.step_width = MB_DIM,
> +			.min_height = FMT_MIN_HEIGHT,
> +			.max_height = FMT_UHD_HEIGHT,
> +			.step_height = MB_DIM,
> +		},
> +	},
> +};
> +
>  static const struct hantro_fmt imx8m_vpu_g2_postproc_fmts[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV12,
> @@ -382,8 +436,8 @@ const struct hantro_variant imx8mq_vpu_g2_variant = {
>  };
>
>  const struct hantro_variant imx8mm_vpu_g1_variant = {
> -	.dec_fmts = imx8m_vpu_dec_fmts,
> -	.num_dec_fmts = ARRAY_SIZE(imx8m_vpu_dec_fmts),
> +	.dec_fmts = imx8mm_vpu_g1_dec_fmts,
> +	.num_dec_fmts = ARRAY_SIZE(imx8mm_vpu_g1_dec_fmts),
>  	.codec = HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
>  		 HANTRO_H264_DECODER,
>  	.codec_ops = imx8mq_vpu_g1_codec_ops,
>
> ---
> base-commit: aa0f4c41d4870a18e65772a1817af16427200371
> change-id: 20261119-hantro-imx8mm-vp8-23fe87f19d49
>
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>
>
