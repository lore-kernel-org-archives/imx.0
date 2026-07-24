Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4B0349CE7
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784906978; cv=fail; b=hHmFx+tQUHX9s0OiX913PRU5h6hRADp/tborCc1F9fRo/ULan+KEMpxAP7OsH/+pE6FEgTxfBTYjaUD17ORZPeFBFSUzCirJWJP33tTVXTcMUsaTMqCzNCurPIR2zhNO8F9RTH0lypu/a5EqchNiS7W2L0rJMXGCbvT9xZ3YQkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784906978; c=relaxed/simple;
	bh=/tnPeKWId3wSVJF6tchSsV3Qd94VpcdWFbQGe37j2xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tEr6CAvE4pOITS26SGRh6ql1BeGF2D1aNsC9tfquXDKRbo4TXAQ2o5BF+NipvNB3Tjbeggl+mYsXmFfadtoFppLPVRLgtq7yBe6tcPCcmj/gyLKonNDnSKwuGek3/dZQxXrTEVvP24irKrvv4V7SzC8TTahSLvn5MFwLY0spxOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=e4k+Fasz; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="e4k+Fasz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b286MeOC/LkNJKN3o6Ec6IVh8vV4rKvSG9HlEpnUODgPkKWkE4bnwAA4l0wCHmgw+lmdURNZCDU/NDwwZwQC2Ryi798pEsvKMKgphPl9Do7ONjam5co9fUf7pypqGJ7+6TWRt8Jcheo4v+O+8k2ms4qsllv4MBrmE74CIdJjyXdrLfn5fRbnr3uiOpek4B8QOBooG/7g4wXnqE2C2Zqr7i6srzhpPpHos6nx8EXTO5SYOCaOYMcPa4RQaiazXsW5YnGfqK34SXWk9lB4cGDToUDANQzOLfAerDXhcxl8Ua/pGe+p+aVskzMZeya/Z7A0zfwIkz7PZsdvq4bp1s8q/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3reP4ukBDHXGVjk3dQmqRcVxZpWewzDKCdysd3jRqY=;
 b=RNNMpshPxmSA01rlG+YxYQwV4klZS7qLryfuiPQnFq0xv6MmsypJhpjwXah4sCsodgta21WJYAnKRkv7pzH/NvGEsXbDlXq3EcZ2h3MeHxe2XCDd2JXnS+6MBDAOHOs1fMO13B5rgyh7ajFGdEDkW1OEahl33MPKPovbzX2IyhZNHSq/MnlaSpeZJTbZZe+bzPYlHeVPlQ3Z4WWVcxiTj2i94mUbKC6fj9jKkoqVbNAWjSWNPkU5t9GNrnGMKsrfHC9Ab/yGPpKbzjxYGWQ7aKDjuT3xU0UcG/s1QqejhXL4nUN1QPej1dk/Hh6qImBdDqSuSRH8EQJKrxWdT6Jncw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3reP4ukBDHXGVjk3dQmqRcVxZpWewzDKCdysd3jRqY=;
 b=e4k+Faszmk/P8tl5JieLfzVX+ESdtQPv/XxRcXJfmQLq8t3Yzl9a5qvx/GCF2bNJL4aFiXjNiEEQF/S+T2LJGLvp+0mVpufn5MuqYTSg54ibSFSwbxdTk55gF5PPInK6r9HeTjPee3uj38L9hm4yl4gK3TxMwTXH89C0N01i/zF75b69/1QnXiF4biVznAA/TGWd/8QkbRG5hbS2SAw4QmHr4qIV3XSKBzJpvpnGPvLW4IKEsHcBuPQla9YcBRxhbidpoBTEvZECYKjMNfijcDM9lgUq2yxym+//1nHgeliR+9aR3t/3qB9u6LkHF3ijY0b3Ed9KrpaxGgLKr3GbfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8104.eurprd04.prod.outlook.com (2603:10a6:20b:3b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 15:29:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 15:29:32 +0000
Date: Fri, 24 Jul 2026 10:29:20 -0500
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
Subject: Re: [PATCH v4 1/3] media: nxp: imx8-isi: Implement per-stream
 reference counting for multiplexed streams
Message-ID: <amOE0LR8QbcVx-rV@SMW015318>
References: <20260724-isi-v4-0-27df7b5f6060@oss.nxp.com>
 <20260724-isi-v4-1-27df7b5f6060@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-isi-v4-1-27df7b5f6060@oss.nxp.com>
X-ClientProxiedBy: PH7PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:510:323::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fab0eea-216b-4a83-bf9b-08dee9985c02
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|19092799006|376014|7416014|6133799003|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 ZM+qRjaFVFXWSV/bPnfWmt2nSPBP9Z5NqAhio5rKLnAJsS9bjOjRfDpXYJx0dJws8qIuqtVKnGVehmHozapoXAacyE5jWDVgaHxt3/2BShuTis+eE7QNzPzuNOvxt15z+Mmj5cja3EeM7UZdK7YCiUv4zmDoikXQuAnQdj+rMPmyQa2Aq8W1qFVM9n9CP42VOwO6euir1dxuBBHjw76dOPnSmuuZuMpPyUkd/kW16vOvm3PCnn1mOnumGyJUp8+q1+XA+EQSmuDY0hAtCPPqwRW1BHx74Z3azr4Uql42hYm1KgPp/j00w/aqHNIhawdaOPS4CoJeysU2zlat8hYCeWIXLGo7gFqU9tdOT1wSJ6PE9hla3AsB9/C7wX2vxNnDrmotIdyIpV2IbgSG6u59bnPU6WR56brGKNO6okJLknZzfCq3fOJJo5oDP4mnMjm5GyGBs/J6cqhI80a7vHWLJk1pzvVP2npFYz6lqE5C63wriqdY5vpjzVGRtgAgwB3CQGsXlCLd1OYnylsXReHz5d75qFIQ3H6MeH8bxb/fqtIfXunwOSlwYGqYq9a8ktd1mVM1/q61cOX7jDg6MkJXD6wcnrWorvzxHIQ53x66WQ9GDfh4OhC26y9DB5XVu4UzouZwCSIvb47SHC9RNE6KUVgflXcFC/GR2e3k297zONY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(19092799006)(376014)(7416014)(6133799003)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?ns9e5I1lEQAof+jnRUN69cSrx0RUUFR+a10bE6YGAyjZU5iYbRzIt5gc2M2p?=
 =?us-ascii?Q?xSC0iYBHwShx/NjRD4SNFMUr7jtdr1vjMKMdk68oQO06Txq53O44IqqcHID+?=
 =?us-ascii?Q?ZTiVtLvTFdiERuSuhjQTaqAvWfznKG1BxVy/12Z1InlknYmr53aoYBikGDyr?=
 =?us-ascii?Q?bzggFohV3W3WuIs1DnvaDagomXh9++gFYEx9C0FUfsCH0veexj/6xx3esnUh?=
 =?us-ascii?Q?JSrZM2ugvl/cqnEwM0Mpu3nN6YFcrLRNIXgdwXPBC3oL/tBvDHvuBYprdT3Y?=
 =?us-ascii?Q?k7QCNdTwzG3oh2L5/8SpAkbi/qdpmX8QwoAobNqaGw9Ko50U8au9+cEjy4fK?=
 =?us-ascii?Q?lfF2eCXTuNXQ6+6fg973DLjWYX3+CXR18w4Rm1HRFb5izUEhq9sJDo3glWSM?=
 =?us-ascii?Q?v2yWhwF2AgaNi6+G8+teSMOa5+ezJ8cBdQoUEIYB5cd+dJd4msgNydkKcale?=
 =?us-ascii?Q?G06sZ1yuQcec91Z1Z2cma3D29e10LMWuji1I8OAcvWXVf42aDWbjmP+t9YxG?=
 =?us-ascii?Q?+oW5JdBFAO49sAwoeD7CZhxpuIh1PYDsGIeJ0bkwzydzBwK8lh1chUyglAeO?=
 =?us-ascii?Q?+ScRQy/9bpfeeZXvPl4clW8UNZl3ZI6a2VeL62e8pppHujAc49pZ3udZDMwg?=
 =?us-ascii?Q?k9sB8AfNKmf1B1IzniNOSWYV7//cfQZRg00XcmbbDijMlJ+LAGnHG+3v17MN?=
 =?us-ascii?Q?QYgKFsznHxfeGiELZpPv/9W07LoTdgXGidxMtsbBvFzdErnCP+dvNQLzNOu+?=
 =?us-ascii?Q?6MJU6yai/RQi3QgY4bVza9iF+dNWrMpbltxv2yz/i/LcV2eqP3GMfBUZRfRw?=
 =?us-ascii?Q?Vo20cRtQAtWSMP5anKfdnsGFJUdOzrmH/gbqkRFPe7aHVZL1A84tf9JjiIVw?=
 =?us-ascii?Q?qrnO1t121LJ3X5EXlrgor1R6qi/4AOKxyaz7cU5Obfx7wWK5C+ES1ojKAaak?=
 =?us-ascii?Q?QyIe7sgRJz528FSDfXza3x2KusUtlQ7GntQNaUAGlz2Lo2AzcrwGc3etu8Ba?=
 =?us-ascii?Q?/Hk/+BBbxpkp0Y426kaA6i64iU3K4SF5VAPWdIYYsn8EJv6r/aXnRn5NztG1?=
 =?us-ascii?Q?TqtOh/4PvwHoCZ7cPDsvyJKjFf+Y5QPuQmFS2djFLIMHmbLa22D2ih6FFqJa?=
 =?us-ascii?Q?0cHkVBaoqfpW9vnQ5lTFpKiAPR/LVIUIwxzmFnwWSaioR21tozTyCIRGmgvo?=
 =?us-ascii?Q?Utma997Ou6w0oQ4D/hpFYra8AfvLLtaljwKGDI0SlEXNRZkR2VB3mJuiAam8?=
 =?us-ascii?Q?o3sILuHZDnXY5QOwFrLCFFE+KhxqnLiNF/TnJ8aDOIa3r5MMYH1Yz6yxuEXu?=
 =?us-ascii?Q?v+sNzAPM+SeYzUmKzSEbUOJ2We+4chUQz7HZ/rX+O5MrLIYoGj2dhLruBiO/?=
 =?us-ascii?Q?0klKZimJcPM7ZBNnKouoi1mvagl86ZXjUG7AtEt/e2vQsh9zIGIRK0LC6OCL?=
 =?us-ascii?Q?LI1fI58AqCwbeCWRbUPCfQ846QUr7EWpgF4bTncj29aBe5C3Hg7tfqusjB8B?=
 =?us-ascii?Q?RMKBS95kuamF6G2+gVzMbCOiyelw46vZIz6RMtR1xNT+SaFPvDQqZwZChwkA?=
 =?us-ascii?Q?zJdZ0W9oUpAZ9jC2Ha7/t+cdfgtFwlHJT8eLjae+JvvRtF3WxllCk9c1No06?=
 =?us-ascii?Q?cOhPMObpKNAX1MDvZ8mQ+zWSs9y4OAWhxsJFatl3ZIZPz4hb1GLEOQwAF4iV?=
 =?us-ascii?Q?k2cwp81nv+FDJLIELmidBaVdJyr846yOUqwMJrkBltbpqeNjUoe53im12/QC?=
 =?us-ascii?Q?DBIv1eUhaXOKrYwOFp2nt8/vsly/8l9PdYW6G2UhKJ0gMJZ+LhGs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fab0eea-216b-4a83-bf9b-08dee9985c02
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 15:29:32.4317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0EVcPf7CFm9WPvnAdSWkFomb82erUNQCpOxPgWPPUZubDy4H1hY7KeAvpYgFGkXm59wrxgUDxtHzs4TehPMB2xt1HK75F8RpT2SvtpFQ89sMBo3SrQ+igsUNLInpLRZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8104

On Fri, Jul 24, 2026 at 03:52:56PM +0800, Guoniu Zhou wrote:
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
> index 9f0231ca47a3..f7a629b341cd 100644
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
