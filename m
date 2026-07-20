Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B073B7B8E
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784560300; cv=fail; b=FTbynzLY2qhYX2cD2sEUyXPNKtaGNeALowjTxxS+3J+IeFoUD5U7Vr0FVm2VI3tkOiU2PuYPdS9IsHtgeMS5vLaMGy1Qpjl/nsugrQRZuM1W7lCNV9soU7GHeD2msMw0JJ222BMA6vbLbdP2O+aUDKuI5+wNMPC2pm9q7/LjWGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784560300; c=relaxed/simple;
	bh=tmDQs6L/Dpyu34mLzg58wGBNqynmcH9RDHHrtNyPjwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZGYyl4qEZrTUHog0kSqu0Df1vw1E6BS/2JG9MOsXo+4D1tGag/qD/DJNUxHarf9fZu4zZV0izZe+m7cOXf7ItFD3FDLnJ2M6t8Ob9bt/SLMccU9hTWNP8l4erOcEjwLGEPjz9O549tBZVgO3es2Ff4jn1ko68YhgPOXQCgXtWu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=orOuNdTh; arc=fail smtp.client-ip=52.101.66.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="orOuNdTh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiPV+sKldRBg8HctgvOhVIuSqc8Gmi+CXnRiNtVys+ZaJRLeLzBmjUxkaMJQyva0NEy46HQoP57UaVUjHvOiUL/rRFFnVNt+p7o/cl6sH9zYLIQYDOv/zQPPW4ynP+5Cb33XkOXgZFbZ2PD6AsYeuO5+nVliEYH9FbL7YeehIhU0xBrq9MCISzXhShJB7Wx4imKkoH3jCTtWZMYPFjtntZPEdoi5XQTOAPGjPXkyArPaQhKw3uTIjugkyl/6WWK64Pjhyv8SDVfJ/L11zVF+InMYH1gyB2Hh0E/FnMjMmIcivb2lcLPRNphiW1HBv4//k84sb+lBGwzF9eZvvt+ycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yR0oPZhBSzB7AxMqelyLNv/aOznXuc4sWVQ78kxEEEk=;
 b=JO/Wu02hAG3QeB2exEHytJGhixKmJkehlCL+sy9L3+1N53Xr3A9z9hRP/C5ZwUXTIjHxS74E9hcuvk6JGxeJMtzx/vq4tSzqTWFG2hDdiiZOBAnZOoAAGybCXC9ykxFaEw8nt5V0z/W6J2LdQWuQXgz3c1sgogO9eCETiyEV4lw+lr6Zp8eSNdh6hhFgFJkpeQ4jvLXrmypJaK8L2/esZEyj9ompaDvqYqBrGOP+5snzQWYtwyL5zfZZn/g2jP3niRTcEzRjg/zSkGzbLRrESscMXOcpuPvk6nziQjaOsnwL92WoveBlHNtdTbCsPRs/LpNe35y+brTNQpAjE+W/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yR0oPZhBSzB7AxMqelyLNv/aOznXuc4sWVQ78kxEEEk=;
 b=orOuNdThoMdHol1aPJpry7XtwuW5jZBX817VeZ1fNBFpxDL9D3eaKWwNiWgOhL2Z4P91PHTx+gHRxt7EPpjt2hlf+tKk/BgAT6ZyRRuZ1OHAb1Ayl456Ptosf+fQb6ejsuSpy/G2SFW8uEfPjDpVsFLbcZH+sS5kTEiUrkpcOUQM/gB16qtQ/kdz5wnf2plW3R40cUh83Ih5a3NkxImlglBAM4JP+V58KqixMTpEJ7l4OCIuylBUtjgppEzpYyIkeLqkh1PpvD3YKhVUde6t9YTH5n7UG7L7gAFCvdrLEW/OC9y6cx/odlIomn8hcnHqPExMWsY4Gu4zPr56EALqJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB11673.eurprd04.prod.outlook.com (2603:10a6:102:512::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 15:11:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 15:11:31 +0000
Date: Mon, 20 Jul 2026 10:11:21 -0500
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
Subject: Re: [PATCH v2 2/6] media: nxp: imx8-isi: Add stream ID validation
 for crossbar routing
Message-ID: <al46mfiUE5lr8rRF@SMW015318>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260720-isi-v2-2-45845bc5d4fa@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-isi-v2-2-45845bc5d4fa@oss.nxp.com>
X-ClientProxiedBy: SA1P222CA0129.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB11673:EE_
X-MS-Office365-Filtering-Correlation-Id: 910e7144-08cd-442f-6b85-08dee6712e26
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|7416014|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 A2URXc9ZHLyM8CwPofnrohLeKQiaRSgQIbV682drywHNejdZQeC5hE3+HEUw0TICHz2wgJpd4pExoBY5bEsJfdRLmcVeroi3nWJqrzOdDA9Nz8AHaY2NfI2C4qepGxpMfbsHZa9upO6KWvUaIa7Zr4jVM9LB3eA+pjxzd+oDWvepfKWwvw5v48s/zok4UJsJYijB1whRqllHgoVCjZFCzwVnh07WP/ShhoBfMw1OCuuQpEs5NX+/tqmUuJHwdN1XcOlCq1s5KyH3faz8iKJdeZMeP450Z7YM8jl2oT7DdzJvlEXMKsst/9SVHGCZWpyg4vhu/gZPUDibXScSm24LT1kRqsQ0qL65s4CWpFtnj6eqDZo5IEszfJ+m9CCbSmMpFHTxRTPcGSUmUsDzRijc55YzLiR0pyrLhWQ5b+qAlu9RXwFwDQYngbz2G6Uq2c4GrUV/3HbfOCyI+ZYWRpOrBqFrXBc0b/eVsUWXHxVckwAb2gfuHrnqLGBkkfQAvj3NmJo6xddaIcjRL6pxDepa9h0eBRt962RwTiVF+J9s2y+hZpigfiS2j/BozDm3k8Ff4mubAo7ZRthpOA1Er1DlaEevsAsCHl2FVr74fVb5Ycz6e78wX/UT6+EpXHD5wU49oM/0mV7hGJL6TAv4M82BD1G2zBP6fI7O6Y+IMLOT1H8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(7416014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?qLERJGApa4GBxDdEvlyBd07aqyYAwHY6LexOMuIu64+ljsm5ArNKt6CKHMfB?=
 =?us-ascii?Q?a5iIdz6Zugv9McIfr+6BUguxkqifw3gxyrtx8QUcBN4filAwXefVhTkGHcdo?=
 =?us-ascii?Q?TsoJWt+iXTY3ONovWb2FvKs4RzkkxE4S52Uxdt8CvDw9O+PgaW9SyIF788O8?=
 =?us-ascii?Q?YQ6J5Yy2GN9m8a9GAEdVL0r3ZKat7NdZB+cE3teLzj/TVLmGGVVshUEeRcvv?=
 =?us-ascii?Q?LVSHOwtsKYy8fZkIep4lPvtWFcJ59Z3ahxHd7ypFUtN7Rgq0U4c/TBdTTh+x?=
 =?us-ascii?Q?JYS1zIlvz7UPSBxDVdcd3IUkshQ5/imI0ecQ/Nem/WTyFUc+WHnGTXIm/Wgi?=
 =?us-ascii?Q?i3THw4ts0LyLj9YsIkdmbP66C5Ia6pR+kz4LiFQEaxlg4cUE/wpoWAK/fEUP?=
 =?us-ascii?Q?uUI0Dpdbl8qMIgrYn+CIC1YMcq8ytpmKsMiCABThlR4gp1E8E7jUkngQT/tn?=
 =?us-ascii?Q?EYlOIgSM7kCGXiBAXH+oYI/FRCL8Jsht+/AOAN5/HR81Ho0lB4o1T/B8GtkI?=
 =?us-ascii?Q?eqMbhbbRQLOtCc3wfpuzPq7dGIBRu4C5HvWBRfBXsCGXtVQGhR6mKp4GDDKy?=
 =?us-ascii?Q?+A/eKZnj6xOaVxJCZcVrgDsjA0FzZlW/y3D8VyMX4IESDcdGTT3l2SSSyVnf?=
 =?us-ascii?Q?bK9OD1m0N1Oeg/WwmBU0qpe/71T85yuxnlENfS9yy7nSN2+XgYjyKYRKwutx?=
 =?us-ascii?Q?O0x9k00PWTWIdxKDrL/Skku/ohFSwNLDLSeCHOYp6lt327UQvwWvhPqIzX0u?=
 =?us-ascii?Q?+w/YPKac01NJPyd6lEfZ2vsJ4LeEJe8SxXaIuIa65CEbDdnTir+u/j+Ze/M2?=
 =?us-ascii?Q?ejSVXCjqw1BhvMZdCHXHhpeRvMopQ4c3lRj57I41KXESYy3pz1rzm9iZ0/kj?=
 =?us-ascii?Q?G61/ZDHAKsm1Gl3He1AXh8TnG0o0BNsHFk0fEOs+iODYOb+JVSp840Tk92FU?=
 =?us-ascii?Q?ZbPK+ss7D0TJ1tVr6SmTG2xIeOUhXmWnWYJ166Cw1gU4IFp0puR99IKvcQYD?=
 =?us-ascii?Q?MAPm0XNHwkj893whB9Ls67Vc0y9n21GlQgyCIowWV4wZKBKJFgzZpa53whmS?=
 =?us-ascii?Q?Ek9YBzr6rozdmtWNEVD9w13afZyg7NgLy3VylIgCi+Q4M/5iYpgi2yYnhQJf?=
 =?us-ascii?Q?zh0jgQnIlZc3/W5ZWXwsNCqlIC3kE8qs+AweVhW53TE/uMp5KIix1FaFqeSg?=
 =?us-ascii?Q?7enIjItWZqureBtz6VJeIhqej7utLgpKirlnBKLecRPHye/C/hweybS49v0K?=
 =?us-ascii?Q?t3ARZPMM9MxF3GFJKhm/KsiRWij12FClv5JBN/6T7FZflPVXE/wTGtOpjzl/?=
 =?us-ascii?Q?MdKj8SBw5fdi+zemNOiBNCvwei8P9yYJp6QSwow/NspgBWY6iYUfb1nzTxDo?=
 =?us-ascii?Q?/R3sb0UmGxCr9wDkrQjoHAHhwD2AV0kbaa1/1nIY27+JQmjjCJ2wjtuyojGk?=
 =?us-ascii?Q?2Pwd4cnXEDwADpfyWEiDptp+XjF/6lgFkQXFjhIlPkFiQ35A+eXdhEwSbiif?=
 =?us-ascii?Q?SAViQzhDFipm0aM/mT5wIdZAVKF0YJ6ke60aCC3CZamtT3TNH1Hf1rFIYnaM?=
 =?us-ascii?Q?MidpvYPGRiTFe9hz+GKojEUsNcF8Ut+xtCg+EMWdpJ0nuoSOetvNxaTc6ifF?=
 =?us-ascii?Q?OHq6Kbinj0b54wvf1GlMKDsv+W0zl1q14wWF8B7M496PEZZAq2J6Rg2YXdFx?=
 =?us-ascii?Q?DrRD6Cuwg5gQxZHTF5Buzt0JDOFIBlhUP7kIhsN9y39QHEG5QG0MhF8m7wOq?=
 =?us-ascii?Q?byoRq/b98GvmxxMIHYZ1XqMaJ4O+Fz8QO0J0F0JZLAN2PI4F6/Nw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910e7144-08cd-442f-6b85-08dee6712e26
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:11:31.5972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rt8wjvaJdAnRLWFL0umupAkclsGwB39tLXljiz/U59AsMkVDScasvTq6IkuQibMsXExNOtNgyt/HpsvjLNqnwZ6nupALWke3XyMB59dyJlDRw6xKh2EUjDsGzdY9V5oR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11673

On Mon, Jul 20, 2026 at 11:34:04AM +0800, Guoniu Zhou wrote:
> Add validation to enforce hardware constraints that were previously
> missing in the crossbar routing configuration:
>
> - SOURCE stream must be 0 (ISI pipes are hardcoded to stream 0)
>
> This check complements the existing memory input validation and ensures
> that all routing configurations respect hardware limitations.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v2:
> - New patch split from v1 1/5: adds stream ID validation on top of
>   for_each_active_route() fix (Frank Li)
> - Remove incorrect sink_stream validation
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 84871bceb31d..328d08a278ea 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -106,8 +106,20 @@ static int __mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
>  	if (ret)
>  		return ret;
>
> -	/* The memory input can be routed to the first pipeline only. */
> +	/*
> +	 * Validate routes against hardware constraints:
> +	 * - SOURCE stream must be 0 (pipes are hardcoded to stream 0)
> +	 * - Memory input can only route to the first pipeline
> +	 */
>  	for_each_active_route(routing, route) {
> +		if (route->source_stream != 0) {
> +			dev_dbg(xbar->isi->dev,

it is one error, should be dev_err()?

Frank
> +				"route to pipe %u must use source_stream=0, got %u\n",
> +				route->source_pad - xbar->num_sinks,
> +				route->source_stream);
> +			return -ENXIO;
> +		}
> +
>  		if (route->sink_pad == xbar->num_sinks - 1 &&
>  		    route->source_pad != xbar->num_sinks) {
>  			dev_dbg(xbar->isi->dev,
>
> --
> 2.34.1
>
>
