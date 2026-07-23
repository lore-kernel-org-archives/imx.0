Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAAC37F327
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 16:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823800; cv=fail; b=WOmgP2hHIkK7MoOGYM7Zq+iyZrtIJI8ejMapuaifWx/0bj+J7guCBHI2RtFBeLjn3chLKj2+yctoHZjQ4aZYJzBpctN7jovztma8HtGlLTbKZXI+94ZvcLEL5pDHgwz/qYOOkTItEOSVteNn/J+yZdjrcLuu27WpvG+hzzf3sUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823800; c=relaxed/simple;
	bh=cQip1UQauXemykqTvzF0YIuWJ65kEwA25Z1tyYeirDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=omDt+PKX7qUjYGzNDm4We5awshex8ZfIjVCs/wJb6R7OtI2yYZpMuzQtEoTg4eSZHZrfNog/f0t35vettPAEsZ3SkhxNAj8KiHxdOnD2M7JR39L/taXVHnXi9/7ZUD5/5iIZoGUJkGIuQMFBvzpVVC/6tbCUdOqUDM/zVFkSDX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QK3+zpyn; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QK3+zpyn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTAupQtHGs9ZR8uSYpD7E04cPEIOp8HkvMWqijslWWJufMpemYnux9BwvbzDya5AGsWnYPKLtXoFbUuN5caG05VdOUJFbRu5MiWohykPQ7d+JF8MFqJn296EZi3tldxK91bkjccvyoUORqZBwJHc990uF7sSbG0joGmmNKARaS78GEqoLtrFJkvq4pcuo3IJsG4LHR49bTqnmUnvQh3XWU0B7CU14m7hFXKnBxZTdu+eL/7of8rdlWSHn16eesY7yFq1RK3wvq7zrvIoSpUFP8ONNzpMh2aRZ/tbxAOnYhs+ca1suqRme/BMP0YDOvjrOIMoxG6QfC4f9Mp2+XUKRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avFB/3dCj05T1lwSnmurx2VPPjecsThwjyDJGAHzv8o=;
 b=ReFaez32HOchDPrbkGOD75kUCXOELqdnxRaUhoaPhUxPOhO97sO3pwoJhw5j8ukg2yR5vhJuGo69bn01f5yIrrt/beTlFEYWcqvtaf2lrntgrM5RByfUk9EH0J5CLx3J+Dcpp3jy9dsz37VmFPr0ven+IUQANnzp0VE3+dCSEN71k9u+Lxhe5pyifwvwV/c4H1piVxTgILV3nblIKDW6NujtgZOSAxqID9Mtqc257/cQMJM0xEI8THODYeXzZKFrv/ItBqbGr3vI5oI2zfRDNpM5EnOMdgAdNK1ne6o7RCoMIFbU+/ypekKTZYwGcwRipB004a0ToIbEFDDNv5OsmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avFB/3dCj05T1lwSnmurx2VPPjecsThwjyDJGAHzv8o=;
 b=QK3+zpyncuv6MRCzyTXb+z3Oj6YxQ651HIKG2MFj9+ZZQ2VDW58UdVRDhKSKB11PXwD3ox4xMiaXyqGf4fhX4iUnuKQnKKm2YZCCBAjFkvpExat5KQz6laUHSqSC2QGDWnAIsDE4+b3+pOO1BTu3SAJOAnSAg+IvmNfFD+yrJYz3OPH4oDltBiRJRWjTe8SuYin+iTdHKcs3qKXv/Yr97WLIDdstzEswYWPXwn6+MJDfNCgOlm/SF3cvyKvHMlR0KP6sNehrbKnqRNS/eVrcn7UdjbMsogdbcU0daXMKrNXoDeLSAQ9s5rorPZjkYl1l9wwYnA9rVwiEiHbzsBQGCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS4PR04MB9364.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 16:23:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Thu, 23 Jul 2026
 16:23:12 +0000
Date: Thu, 23 Jul 2026 11:23:00 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] media: nxp: imx8-isi: Implement per-stream
 reference counting for multiplexed streams
Message-ID: <amI_5AqWpFCMwNhL@SMW015318>
References: <20260723-isi-v3-0-594919eae847@oss.nxp.com>
 <20260723-isi-v3-1-594919eae847@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-isi-v3-1-594919eae847@oss.nxp.com>
X-ClientProxiedBy: SA0PR11CA0173.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::28) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS4PR04MB9364:EE_
X-MS-Office365-Filtering-Correlation-Id: 928bcd39-5353-4fe0-c67c-08dee8d6b0dd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|19092799006|366016|6133799003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 U01/PMBu3DKU5NgpE2iJKNvChqw4A6hLeaVz1Vy9t8+mXUb1YcQFpkPNCjFQhcPx9AfgoPfnct45pBfW90xiXagz7cKIS80fnf1d+OxAow5QaH8x0iudweI5JaeoyyvtTxgnnG7fv0Yimqi6j027iIuZFUJy5WAS8hGEzxJ8X0kKpna8PXrXi1lUb7qV9NOFRS+aDyqnzgAYEN5j5+IvV6QwGvPoGFULwQKW+J5xj7G1JqbESfR7VJmJaZjDkgjqMspD0PAkfg3pVHxOxJw+4TUSd1/Hrk9UqJNQC3wOUrSyRlKA/hvwGZx/UkLa3d6p0zny5+ARz4G3Dcrjj8mL4gQphJUcMXlLyPY/5x+DbV0fwpKt5NhbJuKxNGigCDXCUIbfFgqNI/x3smK3flF9kvFQEgjNmYYDqTNmDYawUzVDtZ4j3tMbDEIe8ezSCF1VIdJeQlaU+Wy9rfOL6DzIE4fFNYt/ayPGnnAK9Tw2f69Rp2EqKce5IkLFASwVk3pcQpiHHHYk5EKckHnigsptOXcOAhCCWoY2CzjsgXhh3GwStDAW0rpSjDa8ErgRV6O7xsQKiZO6+m2/ePFaGprzXHeTtaI6tpotxbKL23bvJUQxmf4X+hqHZkPpxxcYNJ5/KdFDD5N9qeDbb/6d5ljcM7h2Am4TuDsyd0NRAeBK1j8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(19092799006)(366016)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?WLplsL8GHWegMwqyMWTFjwPzOzcgHqoS0dUEb/jfmpvaQrn+O1TeKdvcYgcq?=
 =?us-ascii?Q?jDt3a7A/g38SYhmaXO6jhng7432bF8I8PVRtZoArLpDZmFKn2Zy5DfpsjU/s?=
 =?us-ascii?Q?FbyG4nHw5yCGPFcap6xLDxFtA6LPCBSQiHbQgQ4dB4/yOa7CUtLJ1zh25B9X?=
 =?us-ascii?Q?JxRVMsnLUg6SyBrce3NZxf07cG0Y2actYKCQ+43z2d0+qiY1803njh8Grlej?=
 =?us-ascii?Q?+ojpwvBZAPl91w45VanP0qQMgxOLQVM2RQc7xSRfup2uYdRTkWhC1HTqwvMQ?=
 =?us-ascii?Q?DaDVelmTp/dgTMpLUyOAA/Itr1TgOsDrA1e48iPqPs4tJzp2+NOHCUIpDTu8?=
 =?us-ascii?Q?Pca/+Z/pVwIcR7x+qQTqO3dIhbeF7UWIkvYN5hdvj4Ogk9QIhzj+7olemKaA?=
 =?us-ascii?Q?e9jLNjhaoY6r23rkEagy5yg1lOfvUDG7x2w/X0vC4ulYtrMyPR3YjZ9LtfVD?=
 =?us-ascii?Q?QbLw0gllgZR2lIgM4ulX3P6PQD/9dKwMfF7iCzYXNERFpfy58mKlAuFtEVpf?=
 =?us-ascii?Q?6zmxpgGbefIjsLHLC7bZSPKvWDFe4HRDxjMby0hD2yu7ig/GqEBD6egmKnw2?=
 =?us-ascii?Q?v8mt3kTZrObVNjLpSfX/SbsDvM4IejmhazuW0BHma9fvbzdLWqKHGLSKxtiL?=
 =?us-ascii?Q?tPSFr8rTN7cqcqteudVkYx6kFu6uq1LqPGpZPE0ugUNkBJxIQO9PGW+2sOnJ?=
 =?us-ascii?Q?t2kgNVjM1/RM2ezbAh62wNfHd8QWAG90UQaCni+Aje+gq0wOuaETKPOPEh4w?=
 =?us-ascii?Q?pGLo3tR414+qln9MOTUdiwdVeVDSk/dvR/QlgwMVR0Lnx4iBWRaXv6GQPs6R?=
 =?us-ascii?Q?vk7mEyRRs66PhvNGmxsskFKApSRqQYtwithqx5839r2JvKZHWE0TBScl3hK1?=
 =?us-ascii?Q?hhC0jUBSOx6lcJoRaafXiWanGvu0gSWJmdBadMgUGEnwrZkN14K/zeK4vlrO?=
 =?us-ascii?Q?qRZc5BkYbVI3X5Ru7SEZigtND4dzMqMxfXl95+SO9vj8tOtXqFWU9zgz+vxV?=
 =?us-ascii?Q?zaZ/r/YH8hPL3c8LFjZ5+py8fWn/HK17XW5821iU+XKwdNqnlt9dtR63Ptr2?=
 =?us-ascii?Q?GJvShD6DOu/jqK2a20/12BehDrr6Eb2qH5v5g/H4EP8BM42iVZ+uZsTARpX9?=
 =?us-ascii?Q?VJu1cmrhe7vYpCCVC/2EAtmWec2lA7NT7I/34zGmZXjVXfxzzANIzeV0O3sA?=
 =?us-ascii?Q?hJsQJHQs53m54kzoN//hc6A4fKf+itm8IIRVD/rUM3tWYlW4Csnuw6Bs1oam?=
 =?us-ascii?Q?kiU8iYUggxQqVP+4GRxwK3swbhoCBySMnglwG9bvXXNc2YfrvBbI7hmOpLgs?=
 =?us-ascii?Q?/aoCaj1JB0EaIomgV8IN8QbAQrqy4YRTbhBxQunG3sHYPLPiiI0vh7/4oDDu?=
 =?us-ascii?Q?wThHh+Joo+Dm1X+1q4QwUoRgvQBAzH6XoPP5PxkQ2wmcrcnn15m8doT+HR3F?=
 =?us-ascii?Q?ttnSS/nKisBZWxv2pVrjbulr0zvyaP2fngjNskgn+uPjp1zJeUlBvFGlmm6i?=
 =?us-ascii?Q?nk8657YduGGrtWrA6/fjd5++XBqWW5wxLUlVWoeAsvwjFcsmLL3vJF/bzVjF?=
 =?us-ascii?Q?V7Ny5l4CqG+pl530Kud25V03YD3fNxZhwDsYY2b5Uimqp5T1u45n5ikqpmnn?=
 =?us-ascii?Q?fPkofiw0bOkQCju4QPdfn5r9rzYXudPQx9IEtOScBCpgN1/4Dzrpj/ewh4qm?=
 =?us-ascii?Q?Zz/gNLlNvzOpobJb+YWCckLCyevYvSaM/2GXFCXeGyKjkpqGotckL+0M7zXz?=
 =?us-ascii?Q?ZAe0Babax0xf0CVWLj/cmgoP3cfjzmsz5YeRiALr6eWo8Jr8v8om?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928bcd39-5353-4fe0-c67c-08dee8d6b0dd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:23:12.5042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGUFTZ7FoZM9kxkd8RxoB/D84Qxq3E27R4Ut8ZmQlNP+yfcVHW/8DbwUJGPeCYOLLjfxffZU9GMOSDFn2cH6UQrjGb3jXYVIUhv2S1qRM2iAhEhNKj9WthXuyZfsnL1h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9364

On Thu, Jul 23, 2026 at 05:16:37PM +0800, Guoniu Zhou wrote:
> The ISI crossbar needs to properly enable multiple streams from different
> virtual channels on the same input pad. Currently only the first stream
> gets enabled in hardware, subsequent streams are silently ignored.
>
> The driver uses a single enable_count per input to track the input state.
> When enable_count is non-zero, the code assumes the input is already active
> and skips calling v4l2_subdev_enable_streams() for additional streams:
>
>   Call 1: enable_streams(stream 0)
>     -> enable_count == 0, enable gasket and stream 0 in hardware
>     -> enable_count = 1
>
>   Call 2: enable_streams(stream 1)
>     -> enable_count == 1, skip hardware enable
>     -> enable_count = 2
>     -> stream 1 never gets enabled
>
> Similarly on disable, when enable_count reaches zero, ALL streams are
> disabled regardless of which streams are actually still active.
>
> Implement per-stream state tracking by storing the input index and stream
> mask in the mxc_isi_pipe structure. On enable, record which input and
> stream the pipe is receiving. On disable, clear the pipe's record and
> check if any other pipe is still using the same input stream before
> actually disabling it.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v3:
> - Change from "Fix" to "Implement" as multi-stream support is for newer
>   SoCs not present when the driver was merged (Laurent)
> - Remove Fixes and Cc: stable tags (Laurent)
> - Store input/input_stream in mxc_isi_pipe instead of using per-stream
>   counters array, avoiding arbitrary 64-entry limit (Laurent)
> - Use UINT_MAX to mark pipe as inactive to distinguish from valid pad 0
>
> Changes in v2:
> - Use fixed-size array for enabled_count instead of dynamic allocation
> - Use BIT_ULL() macro for u64 bitmask operations
> - Use MXC_ISI_MAX_STREAMS (64) as loop boundary instead of num_sources
> - Remove mxc_isi_stream_counters_alloc/free functions
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  5 +-
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 66 +++++++++++++++-------
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  1 +
>  3 files changed, 52 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 9bb4d430d15e..c07abdd6a1f0 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -186,7 +186,7 @@ struct mxc_isi_dma_buffer {
>  };
>
>  struct mxc_isi_input {
> -	unsigned int			enable_count;
> +	u64				enabled_streams;
>  };
>
>  struct mxc_isi_crossbar {
> @@ -259,6 +259,9 @@ struct mxc_isi_pipe {
>  	u8				acquired_res;
>  	u8				chained_res;
>  	bool				chained;
> +
> +	unsigned int			input;
> +	u64				input_stream;
>  };
>
>  struct mxc_isi_m2m {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 9f0231ca47a3..6bd61bfb15d6 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -335,8 +335,10 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
>  					   u32 pad, u64 streams_mask)
>  {
>  	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
> +	struct mxc_isi_pipe *pipe = &xbar->isi->pipes[pad - xbar->num_sinks];
>  	struct v4l2_subdev *remote_sd;
>  	struct mxc_isi_input *input;
> +	u64 streams_to_enable;
>  	u64 sink_streams;
>  	u32 sink_pad;
>  	u32 remote_pad;
> @@ -350,30 +352,41 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
>
>  	input = &xbar->inputs[sink_pad];
>
> -	/*
> -	 * TODO: Track per-stream enable counts to support multiplexed
> -	 * streams.
> -	 */
> -	if (!input->enable_count) {
> +	/* Enable the gasket when the first stream is enabled for this input. */
> +	if (!input->enabled_streams) {

The similar with disable case, if other pipe already enable it, do we need
skip call mxc_isi_crossbar_gasket_enable()?

enable() and disable() is not symmetric

Frank

>  		ret = mxc_isi_crossbar_gasket_enable(xbar, state, remote_sd,
>  						     remote_pad, sink_pad);
>  		if (ret)
>  			return ret;
> +	}
> +
> +	/* Only enable streams that are not already enabled. */
> +	streams_to_enable = sink_streams & ~input->enabled_streams;
>
> +	if (streams_to_enable) {
>  		ret = v4l2_subdev_enable_streams(remote_sd, remote_pad,
> -						 sink_streams);
> +						 streams_to_enable);
>  		if (ret) {
>  			dev_err(xbar->isi->dev,
>  				"failed to enable streams 0x%llx on '%s':%u: %d\n",
> -				sink_streams, remote_sd->name, remote_pad, ret);
> -			mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> -			return ret;
> +				streams_to_enable, remote_sd->name, remote_pad, ret);
> +			goto err_gasket_disable;
>  		}
> +
> +		input->enabled_streams |= streams_to_enable;
>  	}
>
> -	input->enable_count++;
> +	/* Record the input and stream for this pipe. */
> +	pipe->input = sink_pad;
> +	pipe->input_stream = sink_streams;
>
>  	return 0;
> +
> +err_gasket_disable:
> +	if (!input->enabled_streams)
> +		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> +
> +	return ret;
>  }
>
>  static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
> @@ -381,6 +394,7 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
>  					    u32 pad, u64 streams_mask)
>  {
>  	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
> +	struct mxc_isi_pipe *pipe = &xbar->isi->pipes[pad - xbar->num_sinks];
>  	struct v4l2_subdev *remote_sd;
>  	struct mxc_isi_input *input;
>  	u64 sink_streams;
> @@ -396,19 +410,33 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
>
>  	input = &xbar->inputs[sink_pad];
>
> -	input->enable_count--;
> +	/* Clear the input and stream for this pipe. */
> +	pipe->input = UINT_MAX;
> +	pipe->input_stream = 0;
>
> -	if (!input->enable_count) {
> -		ret = v4l2_subdev_disable_streams(remote_sd, remote_pad,
> -						  sink_streams);
> -		if (ret)
> -			dev_err(xbar->isi->dev,
> -				"failed to disable streams 0x%llx on '%s':%u: %d\n",
> -				sink_streams, remote_sd->name, remote_pad, ret);
> +	/*
> +	 * Check if any other pipe receives the same input stream. If so we
> +	 * can't disable it yet, so return immediately.
> +	 */
> +	for (unsigned int i = 0; i < xbar->isi->pdata->num_channels; ++i) {
> +		struct mxc_isi_pipe *pipe = &xbar->isi->pipes[i];
>
> -		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> +		if (pipe->input == sink_pad &&
> +		    pipe->input_stream == sink_streams)
> +			return 0;
>  	}
>
> +	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad, sink_streams);
> +	if (ret)
> +		dev_err(xbar->isi->dev,
> +			"failed to disable streams 0x%llx on '%s':%u: %d\n",
> +			sink_streams, remote_sd->name, remote_pad, ret);
> +
> +	input->enabled_streams &= ~sink_streams;
> +
> +	if (!input->enabled_streams)
> +		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> +
>  	return ret;
>  }
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index 16085f23bc0b..c0ec59856374 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -816,6 +816,7 @@ int mxc_isi_pipe_init(struct mxc_isi_dev *isi, unsigned int id)
>  	pipe->acquired_res = 0;
>  	pipe->chained_res = 0;
>  	pipe->chained = false;
> +	pipe->input = UINT_MAX;
>
>  	sd = &pipe->sd;
>  	v4l2_subdev_init(sd, &mxc_isi_pipe_subdev_ops);
>
> --
> 2.34.1
>
>
