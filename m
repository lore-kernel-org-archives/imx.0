Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795467268;
	b=fPSd5abZ8IQxF/xiWX2t7oBN3a6Qt9yoV/ORBzRFrNVMHCsKXOQOjOOMY3h8Pajy6r8x
	 u5LOM6xoLDqa/Q18dNdXKNE3wqIzcmghkus4tr1Ndt8DR/n8948ltsZ2s66HxMs2g+8u5
	 QDa++07cYNhzQirp+JrhpUPoI6CksR7qRPjmgq4FUOWXA3iA4h2OeQWK4yH6fp53hvnrp
	 DUTEV/jzdUl/ds+NbphSI8sYsbVqrhT6WBta7rY+b3m6cEw9ZJk5z7ZsRsY7PwMDLrzOl
	 SSeKsocR1482I3dPlVkuT6OTFiiVTyBGQSOZENOZLO3Egvd5B3wfqCcrBcQWM9jbTuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467268;
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
	bh=zoLAMpGeum2E9lvPOnrU1EhnFJrxqI4joy0bmn+I9Qs=;
	b=XTBr5H6WpBLVZv949wWDJOPIyuU1Pl/7N9kXN/9RFJrNEAP3f7pYElqLDWaVO+HzNCNk
	 8hE3kPEphfxC5S70vyQS4Ro2uRrVC9dcwx0VarJ3qFSEiFJPqtfxgam8h2YrxfAm/ZpZy
	 u23sCclUU5Z+ITCHEb3YAYFGF7Ea/L/NbVtrFWCK5rrlA14CxyKpipCOdsXIsiua5Yi/R
	 Vc91AkLiYJTjyum0Ed3nwMR5W/+r1AIhdioE47xTZTZtiDoRRk8fqxrAzdELuGxW4lsoQ
	 hvGpEbS2hsSlsOEJhhiZiZW8l9/IH81uD1Pm8q64ylU6BVhOyytnzghxxQcDfTHmWlw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PH90RgTN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.3
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBCF606A327
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 20:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FBCF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PH90RgTN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NP3k8kMEPW/kmnfa/hlH6VlXqB8J4As3YINYhwryXK244/2cHxyWGGbQ0TWcBmFDnACSGGOu1zi50qSOw5eJoIvlxBRHc3TLIzyLJYf2wPY1VcwgXcaNCPN7X/TvwXZa3Q9LK2Gt4KGYbFYudRwdArsBhaYGrxgGNmeXR9D0GWFa0u7qkuzBUFH4usoYcvbG1YH+d286jeVFto1eLkkPUpMD6yVKMamR/Bz3lP0wD0LwnLGtTFe5SqbQPs2lJrkV8hffDyVjTeZSrT5TUf5MDdz9KP0Ea3QUXUkaXT527O/3jAZCo5NjLnNSbFre0/oAMm/QjnkOcu2i+aQ+fAp1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zoLAMpGeum2E9lvPOnrU1EhnFJrxqI4joy0bmn+I9Qs=;
 b=iqlgCHeQwulGygVXVLtAdBHqJiUITuAvR9+oJtoCmeeu+mYph/WJ89LsPDRraJXu+LN2+kATYYNXgWc+5Q4obXvB3hr/p+IzqiKAba5nDJ8meYwr5TTx+brKcCIAk+zOQ43CY+sau2WGi3hEDTyGS61u4fna7z9Z5g0kYYV9zOqxCuQWmRyhSHRc+BBTm/7xL4Xrnuf1n0xp7pQC/BEmDdLjZBFfgobRAFRmt8O+Tm2Gjb2sTnFOOCGkvjzqKsxyxf+aYZQ1OOxoIj+5SJNvTKgnefvo0OF7KC01T7k8U4Cl5rh3iX8kOnhPrV8i1UFPGoKsGX34NKL4zEcaDfbcaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zoLAMpGeum2E9lvPOnrU1EhnFJrxqI4joy0bmn+I9Qs=;
 b=PH90RgTN2JUhLfeWoDgDK7rNXIyN0shQsidqPwPN4M+keS4HmKKww+gWIRkFCohCyUqs23Lrwql/VwcCy6Fg/lxAzzlVwElp8VpRnsK2SA1V5+641VLFYY0c7IiO9ZoeBxHNEpxtw12uJom1PRVy4Ots7lzLHFCmtCOlyC6G0cFjB8Ss+qSngSQk/j4QLqEPmmrXso0v9Xard59kPYcVPwO0g47M2Si9ip2FtcvoeoHm4tfLTsMblz+eoYOBV2o179dUM5l1sl6IazqCdfFH3hcVZH9ri0VajHNfqhONwNA9iXlFaq2qg7n/UNHHQiZn+3OOZKC101CgSez3yDUgGQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB10634.eurprd04.prod.outlook.com (2603:10a6:150:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 20:54:20 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 20:54:20 +0000
Date: Mon, 23 Nov 2026 15:54:12 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ming Qian <ming.qian@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Zhou Peng <eagle.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: amphion: Enable non-coherent allocation for raw
 frame buffers
Message-ID: <awSn9NyulPPPIIT8@lizhi-Precision-Tower-5810>
References: <20261119-amphion-non-coherent-v1-1-c3154395e448@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-amphion-non-coherent-v1-1-c3154395e448@oss.nxp.com>
X-ClientProxiedBy: PH7P221CA0044.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB10634:EE_
X-MS-Office365-Filtering-Correlation-Id: ec63b36b-0bf9-4078-6955-08df49a3f224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|261009223027099003|18002099003|22082099003|3023799007|261021121427099003|261022075727099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	c5u+qQKG2cFVmL4t6t/ceSQLDzlH59BHNRrEQ7T3dKfQLMD/DBCS2Rd71bt7aKWgiapVoBLxCFWcqFvmWorRkJj1mWb4B6/Os4llz7ONVYcXjAj+gKtNelt2RD2mhFskFbC0xQXz38Gy2sgMn55uv2tSBl4uzFyCRjzwdEwf3PuyMkMwmmEtuobygKFjEwtXZQvaBN4jXe4PqsH6SJJef0ggM2eCtDbgszvWEp8216a+zhwCcRs2IJA9Qc5W4RHi3U3Zronbv2TXZIf2gqv0oCptYijVLYG0RUE75aTRP3wyLTtWwrL95hkkm7DQlPR/l4ibIm5+KrNnzmLzZqtyQSa8VOABFrF5Q3kCXtCbvisOCuea2PSuABiranHdI3RlSRwdtLsqVbMlT6DOtnWFvuxHaSqBdxW2pA69x/bRH1H0LiCrEmtnyqlTmaFeFI0c5Cq3tttDyUdNuS+0sP7MSqXwXH0/CnWVGChGUKID+JDNevw2fOnjKvsKO5oIXdWsS/yIhF05UXzC4vArv0wF99FVcgOcN1wUyNdNLC8+3yoFrwszr5p8F79rRRkZd7Unb/GhIz/Afl5+ShR1kyIna08OCc0NbGVggR+md7z4A7pw1pm/oCqRd4Xkhm4H+Kz2bgX6ZR7vRpKQezvsiC2nv+s9423LAJotul9axhZnX84=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(261009223027099003)(18002099003)(22082099003)(3023799007)(261021121427099003)(261022075727099003)(261102123227099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CnfQMjMRoClESvSErYOmyy06bwQd7f3bWZ92Bw7t3NwlG+3DvcSa+7EWN2jI?=
 =?us-ascii?Q?6jeY6Tcz0x11MJqM+FM6HQWAiM+ZVOljHT/P9BbnfnIyQ7sVwLevEbgSzaiO?=
 =?us-ascii?Q?ECtaLi7tX9nNNEfLGT/eVdLkh2T7E9mI7eXLjNDLeLPGNkFYKnBsBUvlaDjI?=
 =?us-ascii?Q?LRhxMhIiqtoOjm1S1Sg09MEDrcgQVwz1PtzbkJMNOUITCgJ7iqH5awKn8Un0?=
 =?us-ascii?Q?9tx9Wfny8/t+CHsxvE4yM8TXFYGO5XKdbT5JwFwxuDQIXfrPGlsoyuyWx388?=
 =?us-ascii?Q?T70QgLF1KJgujeW9BsftiBn8hkXlzTR0hRfX1u3JV5Av3lIfTuIpC2GviBMG?=
 =?us-ascii?Q?CeZrc/LkvKn328G5kA1ScVe2+t/HaBtNCmQUyHtvhjMEHRwe5emp/0THXSOu?=
 =?us-ascii?Q?rUN/9vs2QPvYpMaqFKwoqj4WhhrM3vazBGp3wQ2SPG0ubhePpT20MswYFvo6?=
 =?us-ascii?Q?GciwRUxveTtUMiSRozm10zrsOVlhMLJYPO0JkGLFhrndS4aOrBLRxRsT7Sew?=
 =?us-ascii?Q?Tc3K8/2oynEIlMr7ZqnXK1jktlo9fa15b5sMfKZOkhlg5hPHaq4RkGZstdgI?=
 =?us-ascii?Q?N6igkPLZ7Scggu5QBdjO5tTYjUa36If6pSoL+nJxAI/ce0StkVr/9nN1rt6P?=
 =?us-ascii?Q?+PZx+LU1YWN9BUjDmk0qeX3OWpXtQkBYuh62b6Fuvs7BKycEu4y6EH8SWggY?=
 =?us-ascii?Q?M1+8UN92fLnT2AagSXzuB8VXydcqi8+aCvmyRckWk1rV0YDONI6rFMllhECN?=
 =?us-ascii?Q?0vNI8iB8I6M+zqkbkJIy4O4o1URcEcdo2hyR2LiAU7xAFi+4dEYXFeAvP/7G?=
 =?us-ascii?Q?gX0W+76C1AEnhciio8Q8YmIRuSwx4oRJ40DR+Cwn7Aat1XEGaN6nCQR16trI?=
 =?us-ascii?Q?ykZzt4DTN/dxpp7EWeKIwv23Hw3RV/gPwcTOW3TflNakq7k9Js7eRkZXzGKJ?=
 =?us-ascii?Q?ZjCxrXaf96CApzPz/3Gwg3MhU2r5Lt7BQKRVLX5nM9F0NGadoqGu5aW+NfNC?=
 =?us-ascii?Q?ulKmqAtzP+PzwfNOrV76XPETyV2XFCAkjONEs12N/yJHVy++En7qabWbdp+k?=
 =?us-ascii?Q?QaJQvCgLC5iA1zO3hdqWIuLwHt82s1STjptCkbnpTcZWsNvUf0v9PRlRB9/X?=
 =?us-ascii?Q?fpbjSGhPVRE7nmfwwZEguGS1RGIrxtyWEKGyK1lwYS7rGt1vs9pbE94X8NFE?=
 =?us-ascii?Q?UkGXE06AmAZ9Ulga9ciIi5RrgvvlzPmihbbpB4n5us3xbowpEURdv91bouci?=
 =?us-ascii?Q?eUauamQxUqxnY/uaJk1hnXh2kTqVISB95MiYwHg2qzGBbyHTjgum1zwwe0xP?=
 =?us-ascii?Q?8qiPcheOE0TCcDpCSl376QvKvmvc8wGr2kzzifD1QICq5ry1F5Ym+bvUACRs?=
 =?us-ascii?Q?OjZwyhJKBLzXuX9orne84+C7kK4FlJyoHgv5WvKeRPv0pW2jM4u+ILHZ7Xja?=
 =?us-ascii?Q?MHsZvy8xwbg5MOvHmxyW33+6sJCtuKKcx4cOhInxoPJTgPR+Maq3dZopCTNy?=
 =?us-ascii?Q?b8u/XywkIEVjkjLxz57dbn8N5YJYua3aSq8MJyS0jKzaIMfafU+7RFJjTIRL?=
 =?us-ascii?Q?OSYqSEhHKW9+zQ5EQdi+8oKSOR2mPfUECq9QU2FrfEldGXm1xZKnOBhVHAYf?=
 =?us-ascii?Q?pQbyhrJP4Rb+x08XVf6QalyZCsBc/djh7DWuEWB9i0tJuYKQMf1QW9QF0XJw?=
 =?us-ascii?Q?XdYLw/L5AMeos5KJKfDWI2nLE2jhe86eLimetLZ6CRGmNbw3jdd6qCdeXour?=
 =?us-ascii?Q?e9nHlU+Ym0vKE2Scw1OAu9Xa8C5sWJSEJVtllla7ySnwq9u7f4dC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec63b36b-0bf9-4078-6955-08df49a3f224
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 20:54:20.1890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zb7Ij4XBrEi0we+fU2NdR1MpsUo1Wr5BGPZ7Pbb7yeTZ6s7puNVTqUlmIp5/WS9K5EDlsx3leBTfbCynTO3TUE+rEnvD2TJ5V7vTgiG+I5WMXUmRv0E6CjeV8XAsCKrF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10634

On Thu, Nov 19, 2026 at 04:27:14PM +0900, Ming Qian wrote:
> Allow applications to allocate raw frame buffers with
> V4L2_MEMORY_FLAG_NON_COHERENT for efficient CPU access. The required
> cache synchronization is handled by videobuf2 in its prepare() and
> finish() methods.
>
> Set allow_cache_hints only for the encoder OUTPUT and decoder CAPTURE
> queues. Leave it disabled for compressed bitstream queues, as the
> driver may access their payloads through the CPU.

"V4L2_MEMORY_FLAG_NON_COHERENT for efficient CPU access", but here
"Leave it disabled for compressed bitstream queues, as the
 driver may access their payloads through the CPU"

Look like description is contradiction

Frank

>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  drivers/media/platform/amphion/vpu_v4l2.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
> index 7cccc994fc50..c8d52f0af879 100644
> --- a/drivers/media/platform/amphion/vpu_v4l2.c
> +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> @@ -664,6 +664,8 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
>  	src_vq->mem_ops = &vb2_dma_contig_memops;
>  	if (inst->type == VPU_CORE_TYPE_DEC && inst->use_stream_buffer)
>  		src_vq->mem_ops = &vb2_vmalloc_memops;
> +	if (inst->type == VPU_CORE_TYPE_ENC)
> +		src_vq->allow_cache_hints = 1;
>  	src_vq->drv_priv = inst;
>  	src_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
>  	src_vq->dev = inst->vpu->dev;
> @@ -680,6 +682,8 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
>  	dst_vq->mem_ops = &vb2_dma_contig_memops;
>  	if (inst->type == VPU_CORE_TYPE_ENC && inst->use_stream_buffer)
>  		dst_vq->mem_ops = &vb2_vmalloc_memops;
> +	if (inst->type == VPU_CORE_TYPE_DEC)
> +		dst_vq->allow_cache_hints = 1;
>  	dst_vq->drv_priv = inst;
>  	dst_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
>  	dst_vq->dev = inst->vpu->dev;
>
> ---
> base-commit: 7969a6f407cf55b5254c824c87875452655ef11e
> change-id: 20261119-amphion-non-coherent-f61009334dff
>
