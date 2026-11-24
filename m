Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795538756;
	b=3PME8XlaSNi6w3Y7TREnTDzk0kLQme/zZD3Z1IacpTXbnekrDV/g7faUdLR/Ge2MkHUe
	 CIR2oNymmliAIzT4wiRVD66FEv4CgGGIApuwHf2XBGHuSlcx8vSMny15GMztvJQ1kfWZE
	 mt5YWBLrJU9QWWquYSlNnM76KSliD56aGujTkWH0W19NNXoJNok7cH4BN+1kwcirAm9d3
	 A1bXX4jZ2UwmK7g/4ex5lMVPSbcpK5AwzVTwD7phsTNR8lP/VR/IpDmtPiYF+zXZSx/U2
	 K9XwTsxbE4gJ/qJXnfFZrAJMZgxcV8ITcKcats1ogpUBrb+soBj80EvgfRy4GjXUfjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538756;
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
	bh=r2V3R9bNLExcyLesiJ7NJkcxy0xzdmySEw3xXRuoEmo=;
	b=mHtp51E+ec0kTajJwTyVkmcCkYiKS0jXbCxsnXYRLEbd2C70xQYvYEA3k567pkGi+w5u
	 LlYATC8KygNH1Pgmma3mg5/5432jNXj0+oxxIV1vuawI735xtxclUhWgby6jNSpTdnRgz
	 08UBblRn02RTmXfx3HOVfloXdF2hX2rWl+QnySwXBQWQQtcpltYGg5WjWW3GAYuSBljfp
	 vEb67Ji0dMNxio2wQaxcolW57M7LLDMFFqmf8Ne+hA5IlHK2EMdsf5IlEUuUM1L3DlNRj
	 Eck8kHs/PkR8kIAqu3GTRlFxb4YPcTeihqdlSOTf+UraWGBy8LakEuJ84LFdPzQeanw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iv8eX3gN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.7
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3C5606A33A
	for <imx@lists.linux.dev>; Tue, 24 Nov 2026 16:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D3C5606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=iv8eX3gN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WxQLJHdBuFeLFxIGShAFRJ0LmreDssHzzlVSLM3aM78z+LEbjgTu2kqYKFLIwZrJxm+qiSsY+dHcJSP2jV+5CSPnQ9mXzLdDyVmz+GuZl6rbXO75pMIw5PRMfy8tIBYU1WxEjDEm5rPGPPZLbvpKp1HDjQVXhLTiIFZSPTGr0NKt34ZGf8vOUTvRjDpzGbwJlbWFHPW6DO8m4xaF+R8lOCtrPA0hEJuU9kS0DOiU8B2CNFVj2rS73odZqCIgeekjjHA3eGdZ5g33eUgk9yYuGpF51FRmXzV6TFM85ufulpHRpuGZZkCc16FLCsbWSvCggWRY5n3fg9juA+cKkgtaXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2V3R9bNLExcyLesiJ7NJkcxy0xzdmySEw3xXRuoEmo=;
 b=GtZEOtjlW0oQsyeGnIkDDtsoPFIN165R99a/c+da1PlWfRn9wj/w3D+7Ye9O8y93mQ/igeOz5dEr1e/gcpyCP+AfMH+kv81mUy2COfzT+nVIRZZ1CFiG6ZKv4Vc06g7bG9+FKQTQfYWPUo4GnGPnySJkOQbJv7CLyzG+Xne2VGBdDnySxSiD12PrkrTbGein2WGWe8hCfAN9NlE6SLT1rhHzHoD/8kEVGB4DZHB1bZyXiV2e/LTei/6tZNoKvgk6/K2f74cu0W4x3St/5R3JyQ2ITrGmBBGvsvWMmg42RWrcdtklK43CdiLpbRotZSOlNXWB4cTj5GQFXcni0M/hVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2V3R9bNLExcyLesiJ7NJkcxy0xzdmySEw3xXRuoEmo=;
 b=iv8eX3gNxyB1oIimLLzyQxv0AxDp0/LpRTxcmrUzR2+n/qzLxWwc8sCG5Cg3QTTpE05bNkBynUy0zR6l86+a6CpHLmFzGSWSB4h6Sw2bjlFJ6NTJZHWL5QhXQt/IqJR9bnaestfAYRQYqwD5ivU5VkMfjjKJiUjN7yqv1aGmj7sAOv/4yQmotczUpD3Q+INSxyDUqti1PoulwSQekPJiL/zRh6/qmVYZLlvEL4MqsJX6kdiSTpiRAmcfffjbr3v6Oq7aPo6P40mQfToAC1I6iH4sc3HyuZauf3RzfKweBldKodbc0ngft1+vds1p/b593/SjBnQpxlJxtHujWD35+w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 (2603:10a6:20b:75e::21) by VE1PR04MB7359.eurprd04.prod.outlook.com
 (2603:10a6:800:1a0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 16:45:52 +0000
Received: from AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06]) by AMBPR04MB12445.eurprd04.prod.outlook.com
 ([fe80::ba23:1fa4:ce58:ff06%3]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 16:45:52 +0000
Date: Tue, 24 Nov 2026 10:45:45 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Zhou Peng <eagle.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: amphion: Enable non-coherent allocation for raw
 frame buffers
Message-ID: <awW_OWQaGyRzNQ91@SMW015318>
References: <20261119-amphion-non-coherent-v1-1-c3154395e448@oss.nxp.com>
 <awSn9NyulPPPIIT8@lizhi-Precision-Tower-5810>
 <awUiZWa4ZTMhFeVL@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awUiZWa4ZTMhFeVL@lsvm11u0000189.swis.ap-northeast-2.aws.nxp.com>
X-ClientProxiedBy: CPBP307CA0014.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:2::8)
 To AMBPR04MB12445.eurprd04.prod.outlook.com (2603:10a6:20b:75e::21)
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
X-MS-TrafficTypeDiagnostic: AMBPR04MB12445:EE_|VE1PR04MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b62b45d-7107-4af5-11f0-08df4a4a66b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|19092799006|10067099003|261028144727099003|11063799006|4143699003|261021121427099003|261009223027099003|56012099006|261022105027099003|261022075727099003|261102123227099003|261026140227099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	HcgTKFueRKVo3xvULfD6gqOmhDWTCAfAW+dR9Q+2P/KhrDrfgqK50GZQ78qNLVEbZ9jURFPJipKKAvOR2mOzMCRWDJ0Y6myS53if4qTSFT/iZ8/0YGzVlh2Cs9K1HZNKIyM4WVzFW9Yk4zPKbnGJQJ1NZJnKXTW2gCUJqgGfRYdK5hf0V11pdpkzFvZH1kY0vHDpf3qKh5dBkSchxB3SBMExRiH7ArII+bTYlSMovHQA09rCizcp2l6z0KWZ8xlzDFaz9I1ZgQJSbwFgB6h0nl7+3L+ZUH4ScwFPtlV3DDboaOfWE90+W8HZoE5/c2wDmK134jJ8lI/SA3e1xTw/KDhoYfaCCsZv6miZB3MBVj96mYgijx60kAI2fp7y6mGzKl+x0mzz8JxunzXBaEET0BnRHdPoZhdMz6+nw6QQACaHMwGIq2aG1HQQYP386A8d7eaFo8JJEiP1GKPEXj/T8J9mkpsmKdR2Xd+5t7N307icVoz3irohiGtYy8UNR4RCthGsJyYVLqW0fd3DpARf04j5/5z6SNVzbLLOfjkU6XFAbP536ZOjfNYJGh4croNTzJHE6Z35tU9GX+sEHG05FRZtggg0YvjZAXIDK3HJarDwLNE7mBGCRXxgK8aJugS4nZZEg2nH+uFJWyVoQRBvtZvPpdjdh5tFFTUOMuKKEkg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12445.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(19092799006)(10067099003)(261028144727099003)(11063799006)(4143699003)(261021121427099003)(261009223027099003)(56012099006)(261022105027099003)(261022075727099003)(261102123227099003)(261026140227099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+js7pYiJTVelx6OkZwDW75sd7XVe445mU9q475GN5qk6T9XK0VAT3Rd0x9RQ?=
 =?us-ascii?Q?I3CQBt/OhGNVvTY4zdrRVs41YgGv7AzEfr0C9HNPwISurcCDtis40wKZEvT9?=
 =?us-ascii?Q?F8NwWFMWWQVAX8U51a6xFm3UUVDQuhM0KX3dCAlas9KMj8lPM5iA7THSSAEQ?=
 =?us-ascii?Q?0lve88A3arL9+9HkECXnDnII3yI8DfILW4L22co5GvqQFbOv+pXsyBJqRnDU?=
 =?us-ascii?Q?/pwFGWRTdSvepVBG+ejNpjqi8cGpSNxusEdQqgeWTbSiwgX6WzOFyA7K6gZC?=
 =?us-ascii?Q?8z1CFxVO/GTNLyay0ZEK8V9Y8L+VWSqg/QmlHjw5cPftRreH9B3u9Q9osOnt?=
 =?us-ascii?Q?fGaLespReWHCVQNAB+Kow83zAdUcr+2q8Pb6VWCKUzE246OOXb0EKKVT4Vqz?=
 =?us-ascii?Q?jPjidMBokTaHsDOzCBs51Q0wTLWXMKnloFZGgvoTSfqMkGpxFa+B3jIU4l2E?=
 =?us-ascii?Q?Y5cVOUOlKczUJBqyJ6tkB9FlQzf8uAoTFCDSl1z4ai24NQqOIe9kVCkevSdV?=
 =?us-ascii?Q?sZNTenYCmih3GJ7aB2L3EYSqVA//+U1J15DTcfD+AZZBdoq8CiYJFMePUuid?=
 =?us-ascii?Q?w8sAYTMwODFCfpNCO1SmMQRrdCHu16Dlsrles/e4h7V1SSndjrBHQ7PpSWd0?=
 =?us-ascii?Q?61zDgF2ugGPSn36z7+CfNojCGSliUTh3/ZbIPrSTRwDL42Lap52AyVQ/RYQ0?=
 =?us-ascii?Q?XqO5iPE9sCJp12D3cjNc58J59/dKXXTY6bAzeu1XI/ewOhQmFOv9hxyqdbJl?=
 =?us-ascii?Q?Td/83Wd0/HfyF64K3/67ErjXg7E5wiNgMmnXzj2azXlHb0PIzp+ung3DsRnt?=
 =?us-ascii?Q?DijvV/9XWee37kTcfolUzy7u2/4FaktT4T4viWF7I2ElPFHfiQ8Yf1iJ6mtm?=
 =?us-ascii?Q?3t9NmHKkXA6NEB94tYuwpERcJi2yKEcfSrrwGPBE6EGE0jTPGsbWApnxqMfG?=
 =?us-ascii?Q?kSxV+WTINtU6SVl7oQGVzMle4Tso4uTqTM8dox/3lTgzxDxiTY1QIvL9jTcp?=
 =?us-ascii?Q?2lD0Mm0xb+1ug2/3IrcRM/yJqLs4ObpcQ0lng53C9CATB99oMHLYbTkQByJR?=
 =?us-ascii?Q?+RlTU7UqFitriDdIS7WrhJxQz9qQk82ELmxSQ4e624bycO6TzV7BFfn416WE?=
 =?us-ascii?Q?x9gaKdEvAna0ORu6hNudv55gM5jLKgfyw0VxMJNy+vMmT+bpXeL7foPdT6BN?=
 =?us-ascii?Q?2kOQ30bKMqDDUlxB6CA9C9vBLrQ3OsHSdBSqGGULfeJyHxdJxSc+Sf39deXv?=
 =?us-ascii?Q?fxngcKnWA43MhHgB7u7lV5BqySd/rTMrqtRC7Q0DDAzdvqAIXjYuXfxvSm9J?=
 =?us-ascii?Q?P/eHqbGz3YiCrZOwdcf4q59MO0ekXRzRPBORdgOjUOEaN5ukMTvSH7ndvw82?=
 =?us-ascii?Q?RVVAAE1zphc8beMmRM0uCxZU9CMxvne2sz44Q3nWN98dYUaMYig9wa3DzUkg?=
 =?us-ascii?Q?ShZz1lSwQocLE5jUr87LZ7K2A45xNfFBTU5x407Bc2ClKkOj/SRwntwYsPZu?=
 =?us-ascii?Q?+g4jxYFXBjvEuBeS+QNVANK4PwuuXsYG8altgwKvmchrnzhfYexO/2s6eTSi?=
 =?us-ascii?Q?XSpD0PonIhsBj67Fi/Q7078J+cVGn7ASgG2lfZ4vkpmYZ72CWLuppwl97gk6?=
 =?us-ascii?Q?xSQsSWSvSdykiubhX6GOlkI+e+qo9IWgG8q3sKKpsZXLg9iq2rDbMq8E/mFu?=
 =?us-ascii?Q?PuV+5flgTFogLOHBnpX15H94VbnPnyBhPg8Gp3cU9nVH5YGu/dm8uhKwTPHY?=
 =?us-ascii?Q?7whPUQFRokQoY0g7VyEcIIF7MvCTRM2ZoLaIT4mCpYjNNBSwdZca?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b62b45d-7107-4af5-11f0-08df4a4a66b6
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12445.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 16:45:52.3627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pghgQQHN/GIbYtHgdhlgts6fxvKX2xeWbLsNXtmflDmDR3gEaaP+3fEky6GVfRUMJ8WnPrr+EY1rTZWqu8TtnIWaLHbASNijZ/xXo/y+hrhobVVo9aoArpTXnBSHIuMs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7359

On Tue, Nov 24, 2026 at 02:42:19PM +0900, Ming Qian(OSS) wrote:
> Hi Frank,
>
> On Mon, Nov 23, 2026 at 03:54:12PM -0500, Frank Li wrote:
> > On Thu, Nov 19, 2026 at 04:27:14PM +0900, Ming Qian wrote:
> > > Allow applications to allocate raw frame buffers with
> > > V4L2_MEMORY_FLAG_NON_COHERENT for efficient CPU access. The required
> > > cache synchronization is handled by videobuf2 in its prepare() and
> > > finish() methods.
> > >
> > > Set allow_cache_hints only for the encoder OUTPUT and decoder CAPTURE
> > > queues. Leave it disabled for compressed bitstream queues, as the
> > > driver may access their payloads through the CPU.
> >
> > "V4L2_MEMORY_FLAG_NON_COHERENT for efficient CPU access", but here
> > "Leave it disabled for compressed bitstream queues, as the
> >  driver may access their payloads through the CPU"
> >
> > Look like description is contradiction
> >
> > Frank
> >
>
> Sorry for the confusion. By "efficient CPU access", I meant userspace
> access to linear frame buffers.
>
> For linear frame buffers, V4L2_MEMORY_FLAG_NON_COHERENT enables cached
> mmap access from userspace, while videobuf2 maintains coherency through
> prepare()/finish() during QBUF/DQBUF processing.
>
> For compressed buffers, the amphion driver copies data into the
> internal ring stream buffer when decoding, and out of it when encoding.
> Enabling non-coherent allocation for these buffers would require
> additional synchronization around those CPU copies.
>
> This patch therefore enables the option only for linear frame buffers
> and leaves compressed bitstream queues unchanged.

Okay, is it more clean

For compressed buffers, driver simple copy data into internal buffer and
non-coherent can't bring much benefit and involve additional
synchronization.

Frank

>
> Regards,
> Ming
>
> > >
> > > Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> > > ---
> > >  drivers/media/platform/amphion/vpu_v4l2.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
> > > index 7cccc994fc50..c8d52f0af879 100644
> > > --- a/drivers/media/platform/amphion/vpu_v4l2.c
> > > +++ b/drivers/media/platform/amphion/vpu_v4l2.c
> > > @@ -664,6 +664,8 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
> > >  	src_vq->mem_ops = &vb2_dma_contig_memops;
> > >  	if (inst->type == VPU_CORE_TYPE_DEC && inst->use_stream_buffer)
> > >  		src_vq->mem_ops = &vb2_vmalloc_memops;
> > > +	if (inst->type == VPU_CORE_TYPE_ENC)
> > > +		src_vq->allow_cache_hints = 1;
> > >  	src_vq->drv_priv = inst;
> > >  	src_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
> > >  	src_vq->dev = inst->vpu->dev;
> > > @@ -680,6 +682,8 @@ static int vpu_m2m_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_q
> > >  	dst_vq->mem_ops = &vb2_dma_contig_memops;
> > >  	if (inst->type == VPU_CORE_TYPE_ENC && inst->use_stream_buffer)
> > >  		dst_vq->mem_ops = &vb2_vmalloc_memops;
> > > +	if (inst->type == VPU_CORE_TYPE_DEC)
> > > +		dst_vq->allow_cache_hints = 1;
> > >  	dst_vq->drv_priv = inst;
> > >  	dst_vq->buf_struct_size = sizeof(struct vpu_vb2_buffer);
> > >  	dst_vq->dev = inst->vpu->dev;
> > >
> > > ---
> > > base-commit: 7969a6f407cf55b5254c824c87875452655ef11e
> > > change-id: 20261119-amphion-non-coherent-f61009334dff
> > >
