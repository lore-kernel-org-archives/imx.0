Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969C325B0B2
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 18:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289086; cv=fail; b=Goy7GCZgY0vMTu+uZTLC67yutwlbwHiYkZefqtLNQd7fBNLwSYOLCuU9YM5+roHZkAvjRNHxD7kFCNK9Ih263Enno1F1CqqzAs9ziqdF1FFlaM0hmFOEUJ7p6fA8Jt+CcgKUTJ9hSvyHp2dAItcnJfAlOz1FQsyckzhbh9W61II=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289086; c=relaxed/simple;
	bh=s8CJDzNEyxOlRh+EEzYbVdD8Ei8CKvmPoCCIjpBtj0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=um7XMKsANo+qWKcwBhJS7kPHCw9ItfJQq2BtF+gNTU1abz8GluNIesWUg88hcO++AfwyI5olT9mwNZgtQlX+14BfqGoFaakRP/52ydoHJM9g481w7XLHqR7VVYKljkh2kDC6EtGAm8+GSfa9YbtzEV0C5jXt3m8m1pUm8e+Mai4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E/UerWlY; arc=fail smtp.client-ip=40.107.159.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="E/UerWlY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkr5LAvL4ccXYmSvH0O4Ldh5OOGeK1vP1HVctLPap58ljwZfZdbiKwj67Gu7OL/vBXuGmzCoZ0kXHXTpiPSpZzkIIfLz5wFjUmzdPsRWzzQH0j1Hidg22Qbknn8DvtWuxFTUILSHVdGEOCzp49d0xLtAFA0EmGGXzTlRbQIo90sYYxTbDOBviuWmwoMVjOTwLHJB2Tji+we9WT7AIJ4w/DCxYRR4BJfSlEKbExW2uE6IpxW45fkmLdFWBj1mQALwtH3AexJ1E7PomLI41NYm6i+fFcp4TjwJU6zNnVsPruXtPaubyw/hTJnzKpxviRtx92CWGfHqlnxqHMHvM3WgIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZN3m0bj521lhsvcvMV5aqGDDp4jeWliz/e6Idb9ypG0=;
 b=ch5LVGDYjUREjkObVhh4SFJ6j1EHlQ2cfY4rwlm8sUnIeDwOd51ShL5VAjdqYRDvFmo0dst/uBapeF+emxw5lEFD5nykwrkR28l8CV7wMF2ciJFG+j3lcYd6pzI14dWb1ZJe/Y+LnG+e5UrhYnPjg5ZCGrkZd+k1vus5cbXIlV4hjeU57wOR4L6jlMk57rNdiTEgzTd9OCkIsIuTZ93NLOiyGJmuA6NgY13QRzEUd2xcKMRg6uazXLVHjYt7K9oC7GzKyHzJvH9th0ptLGuk5/1GrQz4UtYuxpNCIN2yd+dKYFgDgQejcVodwAJqqWyVd3eJFIPa8M9WRSh9XqyZQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZN3m0bj521lhsvcvMV5aqGDDp4jeWliz/e6Idb9ypG0=;
 b=E/UerWlYhZzBjPuXOLDamXVzq2ON4NPgnVpzy584UT8ZOCvmPnsoTOtOdH8EdJrjT6BXkzgZGz/FkkHcy61BW1OR0MpmTsZX3cyJ9llW/LXwetavFOz6dyAT/S2mAhxipd8bynx4NcK5oNQ5f0SPtjzJrsi2wHT99sbFLdYgPxieEXbbP4PJ4Ii3MMI3xvHKNXMzEEID6Ly6lLIp1dhgxwuXgQozQ0ovjtaJils67SCE3ONiUH+1XwxdzPKYcn8bPj4mOjvQr/AblQGGahEBVOOY0xw3HBpfvrprNyFT6c3bqaFCeW3VonvrKoVWOwPIkMfKxSCKl3y9lvTV7+poqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU0PR04MB9346.eurprd04.prod.outlook.com (2603:10a6:10:356::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 18:31:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 18:31:20 +0000
Date: Fri, 12 Jun 2026 13:31:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, michael.riesch@collabora.com,
	anthony.mcgivern@arm.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com, geert@linux-m68k.org,
	sakari.ailus@linux.intel.com, hverkuil+cisco@kernel.org
Subject: Re: [PATCH v3 4/8] media: uapi: Add NXP NEOISP user interface header
 file
Message-ID: <aixQa13BHIWbT-q1@SMW015318>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
 <20260612132039.2089051-5-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612132039.2089051-5-antoine.bouyer@nxp.com>
X-ClientProxiedBy: SA1PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU0PR04MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b765861-2ed3-4bd3-ad8c-08dec8b0cc37
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|19092799006|56012099006|4143699003|3023799007|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 EyHvLGqWK4gbyiLxuiijhHXPgbmc6ykQaxL6iFxGsQGp6TXjRH1iuWXNSI8+eYqBzf8fuV6kWIbkKqTQ0SmmSTU38fWgXjjMh/05MYGPXJ1EmvFxrcog4X7aHpp3DrGQDD3cKdVUXIm/+5gyGLlsDFswXKGNXtKCC6uFC/GTj0U4lxTZrURuQqCgUAJ+z6a8JIhRmnE9vyjB3Y0YHN2e4DIPfIbJeRar4n7PjlSPcojJ/+yWufdqYy8URU5aHGHbOa+LmN2MryjWMJGSHknLJ8uV/DAB8dVEeqQsbXCzgCM7SVfoHl1XVxKg4LKB6KFtxMXIhLucSI5z6ahn6M4g34K8mfjLDm5lMfxSOI7ruRQA4FzJUh0J7zzCBsdeJpoGYdPVbKjx0e/Pnj4m5gqYgGnZPm8tfw7zLuLG9Ch5ZG+3qkDUyqXpCpRaybrk8dKGDSt8ONGVgVCuTOizetdGx/YdSkw/DmmS95kBr3y07528ss4RdQVYK+oaDr21Pp2ziHLX2LcR74P/x+MHGeMcsCGufKim4vJxyGT1KFiAJ3CPTE6J7YK8JyFDB96BckK22WPxo6cdi8/xzrBCtTuZ0tXYinFK7QsSt5BldbMaJAU2fU69Q0YTfAlbwdaBYwgkXNEM87pFtgd3PB2Z2AHdr4enUL8C8y8sKyYMGi6ZavpFGKjt6MJkrnv1zzAarTuz
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(19092799006)(56012099006)(4143699003)(3023799007)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?KUTweLZkjxL5Y+MbzMcggTFzD58elg0SAbfHJcWGmKCjq4QcgAO8IteTaP8y?=
 =?us-ascii?Q?tYJYPHXTzVuPcRS2iq/rO4vfYtSoJKpOLl7SIHhiZWpjsZab7xEjqtnQyQ+V?=
 =?us-ascii?Q?5Y84UqKv5+1DqRUjfhNldOLZJr+V9MSNshJXnyKgepgt1A1a0imIE0GGifRJ?=
 =?us-ascii?Q?9fHjK4dOhY+mz1v1vvi3U4lZDtOayRECQz46f7BdMsuEZHjq05IduXDRcfUa?=
 =?us-ascii?Q?Pv40qFk/TtyUx+nIpDEJkuX0ehDugbT06F2/DZEy9kWNUNXDv8bO5ssqeLyd?=
 =?us-ascii?Q?234K+oUPK8yX1MPJnWi71OSnN6Zp3RiQ0BcsPs/0NGqY0YUgMsZdt3XFM/km?=
 =?us-ascii?Q?AVzxOeiYmbg+WiLL/YYhVXaEfWxzpwurIGVMpsJirwnfnrcHJgS95ou+WtM4?=
 =?us-ascii?Q?QGxuGIG8howh2rnIMWyjjXzCFr+AiymqOnPAieKRCAOTpvY56lCOWEbUlJ50?=
 =?us-ascii?Q?yNDJbG+KMZ7pywx7wQWebXApZkSwi2pIcHrd+YSWSjOiSpuYtP+GsfzEtvHO?=
 =?us-ascii?Q?0pBpnAmA3WDb4cPKnEW+gNltS3Z/JlUf7HN8Smn6N+XU2LGtQyLxmnkNDequ?=
 =?us-ascii?Q?P8koDO4brr9MjI3YUHjHVpks1PTvzw+5YexDJy7uZjYXWDK3PCG+3fdzIeAH?=
 =?us-ascii?Q?zMySig0x4S1o2zwk5hdxYT6B4Z8eROJcHJ8lALteXv64uZ9Qa6Bb06js6b8T?=
 =?us-ascii?Q?UUt0uwiHjGF3i3oiVc+QllVLppQk9JEi1pb5slHwpEeq+2ThZoaM13Q4UN1l?=
 =?us-ascii?Q?0mqXRSl5ASjX+RcyR3bX/sA4h3GZcJ6YxSB0F/SvMZWLmLXSqvw3nBhSVQ5D?=
 =?us-ascii?Q?T2iZUvpGVKo34EmALNpTjff0DpJqdgRa4LRneo0xdnmVyGXgKmwZDPuS24IH?=
 =?us-ascii?Q?bp9+DUZVr5ytowCZVIvGMicPtvz1PNqTdP3NyIZRYqdQNcK90lzt80KffEne?=
 =?us-ascii?Q?VjLRnYSTSU0D4G9njZ82UKSA/80TkWVpFoeHlJyARZ7e6zJa2Aw+01rCC5T8?=
 =?us-ascii?Q?d1+i6xoJVqk0iklseZusko1wFgKWIAcN3yYzYzStdTy0d/SaKvHBJLLJwMNG?=
 =?us-ascii?Q?6uc6+Hz82QgNDVVVrdjQLvsoUhHGnv4Sdw9CHW6zhA742T002JEFC5/QH4E+?=
 =?us-ascii?Q?QZjoc/OS/qv10djDBqrB1ovG+5DPjeErtf6+/hLpBlH70zDqjSZfERAgr9dB?=
 =?us-ascii?Q?CIDZMs9YDVSQYnJ4htH7Q/8cMEQbhr4lITnkemAEuq/kITUCV67l1v4ZLLun?=
 =?us-ascii?Q?1frLSu6fdC7qdV6cFbp/1CEcZoA70oSp1BOWi9Za70ZR+pIyS/MkqHgXEHJF?=
 =?us-ascii?Q?p7sgfBmrHPfRQBWeqv5NyTMBhzh8okKqcV+Ey+T8NoAvP3BhPxSGXnR2rt38?=
 =?us-ascii?Q?JLh9geh2+Tr3+KixHQIlkgZJ0S37qCm0H2mi6+COV4sMSzA1ZIM6AfbnWEJU?=
 =?us-ascii?Q?JGKYhlipIekPFuIobR5Te8ihxf3DFhxkr+O5LjPviesCRKC0FRRimxK5NxkX?=
 =?us-ascii?Q?llAFBNQFE3SgjwnmIMfNQHu7pyHQRUdp5sMc8EYn0mJGOq8y3lfsfA/1vHnG?=
 =?us-ascii?Q?nGLKO2KRWL6ieRCQE6nhcuKTGnswyD+kvsX/cOBuh155PXLvXn17nOR+1T32?=
 =?us-ascii?Q?p8fJh2XbE/kHmY00NsuuhsttvPlmXifHXFBqjAJdqybBOSdY88a0W80UjrvN?=
 =?us-ascii?Q?dFfyKJRXbMyYXzs/H5eHJnV3jyS2p+WXB33Q3NDMcbae52zGf++hKR97wsPE?=
 =?us-ascii?Q?pJlCDUpBn48HgKo9ne54idKyvfIbgdLoaT1o/i70kn5RnCLoskV0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b765861-2ed3-4bd3-ad8c-08dec8b0cc37
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 18:31:20.4383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qi4rPG8cr7Yun/0dMyGpS308RH5Ta7Xq/aa+ljItYrZC8Mo10mzjePX40GhxxIp47Lm1817zvkCDbnZ9p87SYNYMuPozkDjrOvw+xHY/B0qDPr6e/2KRLUSFVjZ39B1A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9346

On Fri, Jun 12, 2026 at 03:20:35PM +0200, Antoine Bouyer wrote:
>
> Add user space api header file for meta data structures definitions.
>
> This header describes `parameters` buffer for the ISP blocks control by
> userspace, and `statistics` buffer for userspace and IPA handling.
>
> Both buffers use the newly introduced generic `v4l2_isp_buffer`
> definition, which behaves the same as the generic `v4l2_isp_params_buffer`
> already used by other ISP devices (rkisp1, mali-c55).
>
> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> ---
...
> + */
> +struct neoisp_hdr_decompress0_cfg_s {
> +       __u16 knee_point1;
> +       __u16 knee_point2;
> +       __u16 knee_point3;
> +       __u16 knee_point4;

Not sure why don't use __u16 knee_point[4] to make code clear and short?

> +       __u16 knee_offset0;
> +       __u16 knee_offset1;
> +       __u16 knee_offset2;
> +       __u16 knee_offset3;
> +       __u16 knee_offset4;
...
> + */
> +struct neoisp_ir_compress_cfg_s {
> +       __u8 ctrl_obpp;

do we need pad some data to align next __u32

> +       __u32 knee_point1_kneepoint;
> +       __u32 knee_point2_kneepoint;
> +       __u32 knee_point3_kneepoint;
> +       __u32 knee_point4_kneepoint;
> +       __u32 knee_offset0_offset;
> +       __u32 knee_offset1_offset;
> +       __u32 knee_offset2_offset;
> +       __u32 knee_offset3_offset;
> +       __u32 knee_offset4_offset;
> +       __u16 knee_ratio01_ratio0;
> +       __u16 knee_ratio01_ratio1;
> +       __u16 knee_ratio23_ratio2;
> +       __u16 knee_ratio23_ratio3;
> +       __u16 knee_ratio4_ratio4;
> +       __u16 knee_npoint0_kneepoint;
> +       __u16 knee_npoint1_kneepoint;
> +       __u16 knee_npoint2_kneepoint;
> +       __u16 knee_npoint3_kneepoint;
> +       __u16 knee_npoint4_kneepoint;
> +};
> +
...
> +struct neoisp_bnr_cfg_s {
> +       __u8 ctrl_debug;
> +       __u8 ctrl_obpp;
> +       __u8 ctrl_nhood;
> +       __u8 ypeak_peak_outsel;
> +       __u8 ypeak_peak_sel;
> +       __u16 ypeak_peak_low;
> +       __u16 ypeak_peak_high;
> +       __u32 yedge_th0_edge_th0;
> +       __u16 yedge_scale_scale;
> +       __u8 yedge_scale_shift;
> +       __u32 yedges_th0_edge_th0;
> +       __u16 yedges_scale_scale;
> +       __u8 yedges_scale_shift;
> +       __u32 yedgea_th0_edge_th0;
> +       __u16 yedgea_scale_scale;
> +       __u8 yedgea_scale_shift;
> +       __u32 yluma_x_th0_th;
> +       __u16 yluma_y_th_luma_y_th0;
> +       __u16 yluma_y_th_luma_y_th1;
> +       __u16 yluma_scale_scale;
> +       __u8 yluma_scale_shift;
> +       __u16 yalpha_gain_gain;
> +       __u16 yalpha_gain_offset;
> +       __u8 cpeak_peak_outsel;
> +       __u8 cpeak_peak_sel;
> +       __u16 cpeak_peak_low;
> +       __u16 cpeak_peak_high;
> +       __u32 cedge_th0_edge_th0;
> +       __u16 cedge_scale_scale;
> +       __u8 cedge_scale_shift;
> +       __u32 cedges_th0_edge_th0;
> +       __u16 cedges_scale_scale;
> +       __u8 cedges_scale_shift;
> +       __u32 cedgea_th0_edge_th0;
> +       __u16 cedgea_scale_scale;
> +       __u8 cedgea_scale_shift;
> +       __u32 cluma_x_th0_th;
> +       __u16 cluma_y_th_luma_y_th0;
> +       __u16 cluma_y_th_luma_y_th1;
> +       __u16 cluma_scale_scale;
> +       __u8 cluma_scale_shift;
> +       __u16 calpha_gain_gain;
> +       __u16 calpha_gain_offset;
> +       __u16 stretch_gain;
> +};

Does have data alginment problem if use difference compiler? User APP
may difference compiler and compiler options.

