Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011043.outbound.protection.outlook.com [40.107.130.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD1422A7F0
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 18:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784573588; cv=fail; b=q1mbBH2CGgtLHBAm62+CAxBQuWURl1bW37ab58BCgNaj/l0Jb+oRcNkFYWuMve2AOVMFRmBo/ioAQ13n6XMxuzaJNqXnssGQ/lv/XEXF6/jsdk8ozs3Fq6A2ntsCMwXJ23kBTBSs6f780Tg2DsqNvRrkbKYskK8fCbSQmbfqJ/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784573588; c=relaxed/simple;
	bh=pB7evlOLXjgmcqtvGS5pg2zmwgK9cFHMkK4Fcd3CCSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QJqcRtvDxSGwdCiX0gvAvYr9aF80vMt9NpnxFnfaQmgfX1eA7Gx9IiXA21h2uCYjS/90itAUrMV9Rv5tW4TKG1a/0dRSphM4vIlUAowtNc6JbSKFPpXneTE7//ce4HWKp1QXbl4AnhtA79F2PD4Hcp/r5Vw5oZJ+o75BKsckcNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q33LFyFH; arc=fail smtp.client-ip=40.107.130.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q33LFyFH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gYLuqEoXpYAspRQJqvnaH4177vkvjlU7jXZAFeparOw8wfKHgUY0/mfyXFWUxt8OhdSFSV0kf/cdrC8nNYBvP9woTcMcgZDGmLGkcDnTpUP93DCBXzEGrtwqf/qhMtbT4yH08iMnBAzgphqSG0GyPaZop3TUkLSAUo408KWqX6sYljYu2rSzOI67mCDOUJ7C0zMqdmz1lPEW5nXJ8w+XkZaaQTmJWNWMchIzIBFOudM3sp7g6V/70vkF2JncjsbDreGvWmCdcAhYAHYIE7OmVJRLD87wvjYvHalSJ+jakxb6tGCssEHKLAd6eT1NqalVDYaAJJLMRvekgDgL0vDCCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtWKZI5jGSiXkDBWKcoezS2UmXcwsKmDWSuW+66sNfE=;
 b=KVlnKhSWSISq+9oLwjMbmVa/WeAxUrrG+dMn3CxIw2CIa+aaVU/FRdvzE0/YfUb13azoGwr4EKg9bpoMFsNuDbDBM/IPLJAs5G7JhdAnhB7xNKiUavXl32pJQN74XPynIfveUtfXBEXVQu43Bu/ZrjJKWOruGQUC7Y0UGrvMdyO+681OWNsn7uBMrnpXddFX1vn/1sOrs4vOLinbPnWKeEg5oxVUY9RIG0xqfpdHY6txAq0rTdVfFj5ZBdJWu23fez04YhuxUUsxv3j1e0ahNzdi/LGuz0WqcY7gArEMRbMvkpOQCbHsdI6sZjpEMWAwx4JjZolSl90lrba4S2UUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtWKZI5jGSiXkDBWKcoezS2UmXcwsKmDWSuW+66sNfE=;
 b=q33LFyFHN6Wv6T1vw91+jh1pKfCxKwjRrvF3qoJmrqrT363JzsEe1IrHAIHbcVGSNMOP6ZlkfpUJmfbCClDIZ4XH65lXPj0x/NOjohRXprjDZhHZGRGYiXYGR74mbhxtmn4pVz8ixAelsNcSCuuQ+sdQlgCp0R1LYFInk0Km3Z2AXjULbDKAT6LtxxF9ylHymsxVh1D5Tk2z5ERW4AjUbsWhT+bQ0cHjpS/BwJFNkpcnoEOQVpLZ4MG/D02i6b8N/AWpg1W4LYNMjs+TqFd0Kd6VdD1AbyV4OLNfQKTUamigLblqpQ3+flZ/icm6+mg2MfoGugSEgV6pG2E7FHs/5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB10015.eurprd04.prod.outlook.com (2603:10a6:10:4d9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 18:53:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 18:53:02 +0000
Date: Mon, 20 Jul 2026 14:52:55 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <frank.li@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>, imx@lists.linux.dev
Subject: Re: [PATCH] media: nxp: imx8-isi: Drop unneeded downscaling factor
 clamping
Message-ID: <al5uh4RMReHOLXKH@lizhi-Precision-Tower-5810>
References: <20260520202738.86782-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520202738.86782-1-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: SA9P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB10015:EE_
X-MS-Office365-Filtering-Correlation-Id: a173f03f-8c06-48de-89e5-08dee690200f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|19092799006|18002099003|22082099003|3023799007|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
 s4leYNTPWETxRyzLrp1INMQVsxk4oRoZES6IUdOTlVpzfHiCy6GvJyEi8vrAx7MFKmQ4oRf/Ho13LQUFFYz9GpUNIpLy8eFGpxPA1GKJPUG1cy+RhY3ezONZORdBAfJ/tPIXNtp97n9m/mjhW2MvnEo9B7xmg8dedVPU1NIHeDyxETylwqc4/2xcSXy+amhhlSl5JPizQ86X8ZPYsBEFLScihhCNuf31QLxj6vFhIAr2vkmjjBMRJA+seI6Gf29SRLAofTPBj6HTMJO0Ap5lS7TvzhVzgyfnwoavV0ANCU2ibEWHj8l6sHLNH1rcuJmTGCv2uU4oHAxYlJnV9V9ZXh8m1Gk0sWCAe+2i8LmbuFiDQ46Yy560dNINXQEiAmgk78Haf77ycsbB62szIbv4XGQIAqTaSz3D9tk4lbwpukkAuqs0PVUW/AUN0fBPkjhB32ZSKctlrUazXtRp/2zvT28oEYhX3JxgWy5wx7uU7VPcSvEC+DvoW2PMrCHAv9RKeVWJxh4tP3H173kHlMnuI5HcchKBgCbLqYnreIUqSgWleDcUyPjJw/C35M2nQ55OfPpeRh1Ho/6jtVDyOnO3CzrrfeLZpr3b7NJz2gKOn+9tNwA8Y9RWDSN96+qI0XblW6oD+vldPXq3VddMJ3emiYiCwBDUsRsmkS5HZDrFaB0=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(19092799006)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?9UXjJEmz/U9uizByU1bKNCckjKlZPw98LUu7pMvM/r7U6YYNk6iRgVQfaJsU?=
 =?us-ascii?Q?iCcAoezEzD4OwkYGyVnOh4jLfBmFAxiTTezbpYP70cBR6OMcQS6AC118kuhL?=
 =?us-ascii?Q?vO8wrutdA7Lyux2NFZRYp4VbJjaiEazGOnORe7Ea3PTn3TGxYL2eVxNTQVrL?=
 =?us-ascii?Q?Mry5R3c1UghmDpgZe4sqaHXZMOpuQ6uNAMuGo43vNTttpTUsFvkzQffko9Dg?=
 =?us-ascii?Q?H6BsSrk5CCQ5b74sA4XkV8+vqA/fwQ8xAR+vYttyEs4IKIcfno32AdUBH9VE?=
 =?us-ascii?Q?lvBfZCiWpLa9SVwXMXTc6tjM1Yc8ngQziN/CMm89nsaW2GO3KxjPSPFmZBet?=
 =?us-ascii?Q?2bZqHv9O3Q72y2qEVOzPj0ONGaZsgDxoHgnvSWE7o1k6mf4uVGowmepYqs/T?=
 =?us-ascii?Q?4nyLBlc2qlZ+ZbAg/ZpWZeStS0ywSgwxaEwunMAFGamfLAISSnmXF7yUWucu?=
 =?us-ascii?Q?79hze02dkyOi8kGm/5AnROlFJ37V7Jvhmk2HyiNx3f67J3vh+SepkU7Y7QNy?=
 =?us-ascii?Q?6GtdRE9Pclr5j4OH6cSd4lkXuvvqx9uRYNudwveapPMjRdHKg8WcnrHNtS4c?=
 =?us-ascii?Q?GykGi1T7TTdorxqoRTMN80Y74uex3qCI6+DPsrx+kT2O2L739tjM46CmqYZW?=
 =?us-ascii?Q?mjReCmxAkB0gmHMaLeqSoIqRtcdgE4il3TgM/kjZ7XgzFdYh1ISILcqR3t24?=
 =?us-ascii?Q?vXQY2B3t2xxwmgSORrWkjm3ihF8A+gM2gfzCFnA/lp/FYq/IErfR2nIn15Be?=
 =?us-ascii?Q?DTIkFLSKqesf99MoMuIk494voCl15J9lEyAQ+nsugOutkYJ9EIpGjUqpcH3A?=
 =?us-ascii?Q?vJkuRTfbDgFk/b7fssWjBrTJFOEemZkcpZ0b0TFWlUVYW6I1yrWWram3S8vK?=
 =?us-ascii?Q?PTa5YIzBOCj9TdvGC5KGVvmdzmT60QEiVoW9/333M1G2H+vjolC5bwmMqsIO?=
 =?us-ascii?Q?1XoKfjNClTmc19WXu3IF/Ufi33In/SKR0X0S0HfHQ5GqQQZDQ2Wno6wwntgT?=
 =?us-ascii?Q?dsSkZtSSSvDnQHf4lVaEeMmrjTrSXR/gR7TYtAX0qxVooKFAImqiqgkEKRRB?=
 =?us-ascii?Q?AxdZG7edeAIeNRGNAUPStuXJlflzIlRddcGDLaXuBw+e/nXIpCzKevkpsbi7?=
 =?us-ascii?Q?WkkzKeireZIapgCI5LSbgvD9AqCzepst627w7vByuMKKXAtkIuHR3CCg1QUR?=
 =?us-ascii?Q?cnSMPoolQqwXh6Pi323t/f7eCK5pXI742WoDHW2P5oOQC5W1Dc6nHJN79Wo9?=
 =?us-ascii?Q?jQpPPESO/cRt3zIL81+50JuzIlDTJbxBmO6Qb+74WQPcijdJPGnh1jPq5X5M?=
 =?us-ascii?Q?LZww9pPd8YAKIqyvub37TCDEdpBuRXXJJ7rrra2tjgQyO4QxhnaT/d5+pt+/?=
 =?us-ascii?Q?Hy/IF38nNRPOxUd3G3VpA3Z8aGfTAtabJfNVXmoey1jy5SJaCDkz8DArVlZE?=
 =?us-ascii?Q?hhm2mdgNmoGYf/GTx9YgovHfe0UD6IYnr+atFiF4JCHZ6pp9gu/0bx19KVbT?=
 =?us-ascii?Q?x29KjWL9Dz3j7KbFkZKQMRMI9pQlKKuzbEz70rvq1XN1WG7daDbvKsLI1uk9?=
 =?us-ascii?Q?gIxrOL5HncWj5MXKLqOC86Wh54rUzCAvxVvr5g5j9AuOk4A43ezNkHfM9SVz?=
 =?us-ascii?Q?3FON8s4a02Y3vXybtbaAmzFGzgAUG+WAtjAU789hNYRllpB4bsEYQLepu/vX?=
 =?us-ascii?Q?ZOF/bC+/xdqYdkz+7LMJbxXhH6gv8igFkn6OOd6wYI7thJvO+wrVSNg5/8Cr?=
 =?us-ascii?Q?t+N/IucJpb8Kxg8theAD7cCkFAwnWd4BkRmS9SC3kMmobz6FYoVg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a173f03f-8c06-48de-89e5-08dee690200f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 18:53:02.3009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6YHpVJj4ZqfV1TTwSXb04zjA10cIBEEeFT+Flk7OcJpUPAsOKLmwyL/T0nNRY8b+og+tHMWbRN5AUuN/H9YN7LmmKRGtNYaWPh387V18BqGLvM5XzdpJMbhPMh2NWGe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10015

On Wed, May 20, 2026 at 10:27:38PM +0200, Laurent Pinchart wrote:
> The total scaling factor including bi-linear downscaling and decimation
> is clamped to 16. The bilinear factor calculation therefore produceds
> values guaranteed not to exceed the maximum factor of 2.0. The clamping
> is unneeded, drop it.
>
> Note that the ISI_DOWNSCALE_THRESHOLD value of 0x4000 is incorrect, as
> that would be a factor of 4.0. This was inconsequential given that the
> computed factor never exceeded 0x2000.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 16b20ea2d1db..e07eebae9e2b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> @@ -11,8 +11,6 @@
>  #include "imx8-isi-core.h"
>  #include "imx8-isi-regs.h"
>
> -#define	ISI_DOWNSCALE_THRESHOLD		0x4000
> -
>  static inline u32 mxc_isi_read(struct mxc_isi_pipe *pipe, u32 reg)
>  {
>  	return readl(pipe->regs + reg);
> @@ -118,8 +116,7 @@ static u32 mxc_isi_channel_scaling_ratio(unsigned int from, unsigned int to,
>  	 * output (input / scale_factor) rounds up to exactly the desired
>  	 * output.
>  	 */
> -	return min_t(u32, DIV_ROUND_UP(from * 0x1000, to * *dec),
> -		     ISI_DOWNSCALE_THRESHOLD);
> +	return DIV_ROUND_UP(from * 0x1000, to * *dec);
>  }
>
>  static void mxc_isi_channel_set_scaling(struct mxc_isi_pipe *pipe,
>
> base-commit: d97d13c24d7893abcfb80d38630ce74daaa1434c
> prerequisite-patch-id: 2d7379698fb55fe2345d604dfb73914f91705a5a
> --
> Regards,
>
> Laurent Pinchart
>
