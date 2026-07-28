Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011012.outbound.protection.outlook.com [40.107.130.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D407456E04
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785250689; cv=fail; b=MSqQKF1VAN3ubPlxCF8fjpvjSFNf61/kzvqDmRdnx5SgaO6G0er+WDNsLMpSTBwtgJQYkc/tAjQTfiLALQGj/JVZftXUpe4FvkSEL4Xm3Vq06dSqVE/utQAGWR5TEvR5CJvFtOeaAdizcyCuYInbQT+BxC+mcDCGry6HVYkxgDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785250689; c=relaxed/simple;
	bh=DNiwGo0AosrOME2HLo7LxjRfukvgHeesODWRj5qunSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fraX7KmJbo7tQnkCrJU5OIDnK5v/55VKXO9sMxB+tdocZx3D4k/4mEVswJO/d5WBzXR58P5qZJr2eNvcNfGkgHbIxwvApPAb8DR9BSh60qVRMo9ZcFabAZSMSSuWF4qAKO1/hwwXgRpT1vOyDRA824vwCEiQPLBjhbf3/kKxgJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bRXEkEki; arc=fail smtp.client-ip=40.107.130.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bRXEkEki"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v42fvQUAJtKqzRX+2dfsVP8Eezdb0i9rE9ZzqjAIKSPuqAUtm/2cA9ekAjwrnw5Cvw+s91hUkNGyytE0+vkYP98898VOdjCVWS04V/1cZgRbJFCwr6Lw/EpQBfB46dQipu2DbNmflzq5NPM7PDwSqClNQSIc0Cyvgm2m9Q44hhyoEF4PVxvIgUeLd0QXVEy0g9Gk+EKKFL1GKOb3Z8+oZZiKJgKZffN21E4H0C0+niOJ/dWDp9QCx0IuBiiZAaLjmDqeVy+GASxON3qO7Y7hf5p529ONZf9PYeuyoxyI8oOq6eTerfV0a8PHv3KLxs7DRcpxcWeclIlOf10ixjt1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMgE8Lh8oa99QffmYZuTYSNXx5gN4ryBt5w0cehMBYM=;
 b=YE49iVCnHQR3uDE0XxxtFIIxgt5Bp+7SB+CeK7JLuv4R498X+8cuBlWBV+9JIkEQz4AGgAGd/BOYV3DfbrWKq5I7JfeO8Qb0sewTxE/9n70IwOAkiPWEoU6bo2VuFJYl5iXSL364Lp73iTyryrvRKdNvj5+wl8cm2y5zDWIuWAhzlyYLOqxD4IKl9ZTxpoGKWVorDlPs4bU4jxZTEgd1g8Nh/cYjvJOdjSLmJ/WBxg+gB0+DHkWX77PgFoatJjuHC0NLXh2Wml1MMC8IMLzcod7H/hCdcJE0BXRrPbSwr8FPmVBCr0/IClmTH4s9bdBDYRhJKv+0VSl8v37PeaFyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMgE8Lh8oa99QffmYZuTYSNXx5gN4ryBt5w0cehMBYM=;
 b=bRXEkEkieuOVFSmw9pmhg+V9mBxTserJftjEl0PG/P5K+6R/FbWCWDUH6ADcE4qzY4vreNCYXjC7L7pBtpdYVOgvec8mCIZUnFbUlRgjVWZYuQ2m2Y9jt3dd2lSM2zygMaWcgI+VP2XntKpTh8m91KN/d/9ufYBYcmvFhM5cgRMqh2IyPB04RzZycDdUkyeFj8I7wQSQWo1pVMdmFDV9BBMTbyvhBKhW195NazOA5PQ9Q16rtaoMsiOmt2rqOwwlKQbEpOJgb+u6Tvjl25Kb1YISW2Tr4K6HZ2PGsWJRd83hNScgTQQssx3dnMyz6sdGI8IfRVrXKgodWl6Gl6FCkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7531.eurprd04.prod.outlook.com (2603:10a6:10:20c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 14:58:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 14:58:03 +0000
Date: Tue, 28 Jul 2026 09:57:53 -0500
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
Subject: Re: [PATCH v5 2/4] media: nxp: imx8-isi: Implement per-stream
 reference counting for multiplexed streams
Message-ID: <amjDcfDNmRxPSXGV@SMW015318>
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com>
 <20260728-isi-v5-2-1d22ab91602a@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-isi-v5-2-1d22ab91602a@oss.nxp.com>
X-ClientProxiedBy: SA0PR12CA0002.namprd12.prod.outlook.com
 (2603:10b6:806:6f::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a45ba1-3e0e-43f7-6e09-08deecb89fd0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|19092799006|23010399003|6133799003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 DSopNceMj0yh9Qprowy1qaoA8VjNKAOfnWhD3Uqv5qG13DjWn9wN78oPZfKsIkF6A8DXjQf6vBha0b9P9KkJKvaF4Yx2Pgo8Ro4rQ220p/dDGCyLjSnI9Rao+/F1V62iuw/wc2FLCsDG12nFdgzMv1/+ep5tdTUsAlkQ+bc38aRzVFx6/K3UB2dcUvnd2yqtUym+hhQZc+ba+/oNBUmdWdetTlS+NFjofZh8N6bREt9LFJeB+WIgiNh/Gt0NHf5x/uy6tUsd5avZKQQk8qxJLXdYawFteDOYiO92JkguiN2nfPOmbzzdWH+jMOOsFo9FsQfYvHj9bTZ16I8tDFnbMnqN+MR8s3vb/FcScNULH8D7J4x5L0s9okw7loAe/JruOL/v/zpkgseFK7MiL/c5SMdyAvyLkMP+/u8hGUl9oetBmiOq7u2uizcd+rJibKZY2yJ3xWDIjG8atcfZiS+ZWE7W3hpFsR3b8rQL6DHGpKoh/Q8Qh1zLJkgZpEYyGxInP4lClP4K2m6qYAiC0P4xWmKSqw/VHCXOrBwH/SAyBu/DaP1fDkzUdTHQ3pPv7AlVgJ9JBfgOgSHWGNtce/JKPklQshWocEAGgyi7/Yt46wgaU8vBP0oB40eqv//HKGguw1J9Uhgd69fDBn4eWyutwxlAGBa/coG8NOqruCZcQz8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(19092799006)(23010399003)(6133799003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?sY1q9lCr4zirsEaDSuvaYuphM6XfB/pgXrD/Nbdhj8EdofeZiZmKFN4LTP4T?=
 =?us-ascii?Q?jTtswTl4FD4+Ndn4/TJHgTXg9CQ2I+oGcZ5MMLQBJH43IhrtF9tV5DQVPGWz?=
 =?us-ascii?Q?8S2kfspwgV+QuZYn/S/j13z5Aadpvrq1y+cksAUpiZ1HCl0uES4CDWfhFmJ9?=
 =?us-ascii?Q?Q5ExmbTFMrQd9PO+qWDWICQyVCgCgK+2dHxTOSfngrfLxSgvJ5FK4FUiSGkC?=
 =?us-ascii?Q?mT+OC9Mjht3OqEXEeOTNff32nyN7KlaicGNrg9B2ia4g6UVT/Al9RpxtNAKg?=
 =?us-ascii?Q?GPdm3EwbqUfoiF604YvThTKmRY47BB1KRNpAP6MhoMBKcHkkCxGgfm/vLSqy?=
 =?us-ascii?Q?aWL5iNzOHoNSnHZHnnerp/hd2Xgo24w8a8NWVnFUnNhR42Npb65fOQMYf1nx?=
 =?us-ascii?Q?Szl5geFDz74Sg2PYOfguvgpKfXgwypCSvsFklhRLJ5qNFYv5Man6zxmZp4Cz?=
 =?us-ascii?Q?3/addB3Ld9HADQYKbutjRJETZq10zFeWBfvw0NnXhN7tW+qIKoK1UPnt6DWh?=
 =?us-ascii?Q?i0x9w71c1QayEGMH3CE8KM74d1N2N+AYZZDUuzfIo5P6MRAqDscZksFaQfYc?=
 =?us-ascii?Q?3XzKd2U374C9Fpzrm3WwzNnHv3uvJ4CNBwh+0p/pXtYVQFuhaIADBzE5ADvC?=
 =?us-ascii?Q?hvpNfC9214o+zTDFOoUCntq7QRE2LXrrmjI8riR4qRHPni/QBBqw5n1ytajx?=
 =?us-ascii?Q?bK8adGTuGp8Us64O6ArGZXR76ki0ulzdNXxAuzBY6FQeC3yK6kCWyCSBSd1B?=
 =?us-ascii?Q?D41rPhVxlqWy6uIz7RE2drvrfLBtwEnLLcJWhtjaX/PYaF4OTScKWvUIBBgM?=
 =?us-ascii?Q?0Ur8bYCIP2dvZUaza5U3GsyYip95evnqHSvjEq/0yUldj/bqvsTsNPk8Q4Gs?=
 =?us-ascii?Q?Ul2sDtrhlFbpUFnPfPRrJfUWFFvpmxutp7JZ6kdgoCQAVWlql3muUpWRwF67?=
 =?us-ascii?Q?wHEkvfrwa8AxNTHholLpsRgjoKxkvW5eJmssfwU9X9JIV4+DAHvBrueJVYB+?=
 =?us-ascii?Q?bncvvyPlx8I2O/FWNFKIOF2ymXsGcuvQnYRj5Yz5F3x4Eu9xh63c9bLsFi7N?=
 =?us-ascii?Q?iTuLeyWFwC3D7bPN0nHNLx6OdJPInlWswkqH8ppWxfRnuWD3fbSKCtTIXbOK?=
 =?us-ascii?Q?FovRodtZFna8GhNYtjtGI5+Z7RA39fn4xUgtBPcvgfoKek98KgU6P3j6GCag?=
 =?us-ascii?Q?B7QA/KTmZHDIYrs4zJ9v3B3Llu38/gGvrkiL28WR1ZxiD7m5IbTLFlRtNzyB?=
 =?us-ascii?Q?NPcKpepqa3tVP1GUanG5owtci2tl3DCR7DKw768pqpA248NmkTknFYHu8cWo?=
 =?us-ascii?Q?DkeG/7PUDThObxAYr47p7LagA7FRJpnu/QSRt21dze4vqWWg1oNYis09hRGm?=
 =?us-ascii?Q?EcV/hEqx1KR8Zc656PmyvYyX2dF1y4TQWS8O1fVfWCbGnXb6xriJJ+h+7N8Q?=
 =?us-ascii?Q?52XJNUl3cJ5ThvaEsCbD+QoG1j0j32q+slxltm68Q3vMrK4K3gwi7wTp0Lkg?=
 =?us-ascii?Q?XElQxQPalCMca5nNa0Ttl2/vJASKhR30uxswgbydG3opmBy03RyodyeOP7Ji?=
 =?us-ascii?Q?L39+DqNeft4yZBeQXF50l6C4xcdGcIHRnn6k3puvkIz1iSI0DsX+e0EYljt7?=
 =?us-ascii?Q?OZcHMVygW4WkK+tXCwL3ArB6u/1srthSLj9FaKflK8AGAaQ7lxK2ZgFyXlt/?=
 =?us-ascii?Q?GRT+piQh/ECgKo2H83H+2oG4dfw+DLIBkGw58FQslBAjQWvbU+EzBbXmYW6+?=
 =?us-ascii?Q?X0szumZ4L14YMzAkCUHK1+kfzLOPRqsEoVXnH+eJIb+cbgUmhk/M?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a45ba1-3e0e-43f7-6e09-08deecb89fd0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 14:58:03.4445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIvFirRiOX0c04/QUSnaW9t2IO/UBMz/djA5VqNYekr77HIaC+U8X+pDeknptegbfRDjglw5RSuXnnATu3cBGZofOp6xDIqB+raqAIS0S7Ev2j5ve9amN+hiD+GzZt3o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7531

On Tue, Jul 28, 2026 at 02:58:57PM +0800, Guoniu Zhou wrote:
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v4:
> - Make enable/disable symmetric by checking stream_in_use
> - Add mxc_isi_crossbar_stream_in_use() helper for both paths
>
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
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 84 ++++++++++++++++------
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  1 +
>  3 files changed, 67 insertions(+), 23 deletions(-)
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
> index 9db9c6e55c2c..eacc3bb28f9c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -330,11 +330,26 @@ static int mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
>  	return __mxc_isi_crossbar_set_routing(sd, state, routing);
>  }
>
> +static bool mxc_isi_crossbar_stream_in_use(struct mxc_isi_crossbar *xbar,
> +					   unsigned int sink_pad, u64 sink_streams)
> +{
> +	for (unsigned int i = 0; i < xbar->isi->pdata->num_channels; ++i) {
> +		struct mxc_isi_pipe *pipe = &xbar->isi->pipes[i];
> +
> +		if (pipe->input == sink_pad &&
> +		    pipe->input_stream == sink_streams)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
>  					   struct v4l2_subdev_state *state,
>  					   u32 pad, u64 streams_mask)
>  {
>  	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
> +	struct mxc_isi_pipe *pipe = &xbar->isi->pipes[pad - xbar->num_sinks];
>  	struct v4l2_subdev *remote_sd;
>  	struct mxc_isi_input *input;
>  	u64 sink_streams;
> @@ -351,29 +366,44 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
>  	input = &xbar->inputs[sink_pad];
>
>  	/*
> -	 * TODO: Track per-stream enable counts to support multiplexed
> -	 * streams.
> +	 * Check if any other pipe already receives the same input stream.
> +	 * If so, just record this pipe's usage and return.
>  	 */
> -	if (!input->enable_count) {
> +	if (mxc_isi_crossbar_stream_in_use(xbar, sink_pad, sink_streams)) {
> +		pipe->input = sink_pad;
> +		pipe->input_stream = sink_streams;
> +		return 0;
> +	}
> +
> +	/* Enable the gasket when the first stream is enabled for this input. */
> +	if (!input->enabled_streams) {
>  		ret = mxc_isi_crossbar_gasket_enable(xbar, state, remote_sd,
>  						     remote_pad, sink_pad);
>  		if (ret)
>  			return ret;
> +	}
>
> -		ret = v4l2_subdev_enable_streams(remote_sd, remote_pad,
> -						 sink_streams);
> -		if (ret) {
> -			dev_err(xbar->isi->dev,
> -				"failed to enable streams 0x%llx on '%s':%u: %d\n",
> -				sink_streams, remote_sd->name, remote_pad, ret);
> -			mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> -			return ret;
> -		}
> +	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad, sink_streams);
> +	if (ret) {
> +		dev_err(xbar->isi->dev,
> +			"failed to enable streams 0x%llx on '%s':%u: %d\n",
> +			sink_streams, remote_sd->name, remote_pad, ret);
> +		goto err_gasket_disable;
>  	}
>
> -	input->enable_count++;
> +	input->enabled_streams |= sink_streams;
> +
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
> @@ -381,6 +411,7 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
>  					    u32 pad, u64 streams_mask)
>  {
>  	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
> +	struct mxc_isi_pipe *pipe = &xbar->isi->pipes[pad - xbar->num_sinks];
>  	struct v4l2_subdev *remote_sd;
>  	struct mxc_isi_input *input;
>  	u64 sink_streams;
> @@ -396,18 +427,27 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
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
> +	if (mxc_isi_crossbar_stream_in_use(xbar, sink_pad, sink_streams))
> +		return 0;
> +
> +	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad, sink_streams);
> +	if (ret)
> +		dev_err(xbar->isi->dev,
> +			"failed to disable streams 0x%llx on '%s':%u: %d\n",
> +			sink_streams, remote_sd->name, remote_pad, ret);
> +
> +	input->enabled_streams &= ~sink_streams;
>
> +	if (!input->enabled_streams)
>  		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> -	}
>
>  	return ret;
>  }
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
