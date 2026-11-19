Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.110
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078835;
	b=h95M8C9+4j6m6rTn9XKypKSDUqcIwKFoovdOBaNjNW7oR1bGpYivCX7//rQ1n6B+O9ov
	 2N8BSwzhThPl4PNAHaO28Gc2aUwa1Jv72PKKPqMSuJ6N9VU5iLNM0S3eQItmclf2usS8/
	 VZ+Z/DQubGy2kCTm0MzvhRthvTjJMV7J6/08MTb6gG+9Sz9GyVxULLKV+Ks49ZezuQUuo
	 y8jwfUtsuGQDuFeDqETByCCvAXK5M33eGQGa4+7/bynXtWBPdUGj6xxjDQKwWqJWcqznJ
	 YdvwzqrDt5cMtwwoI1pa0h01yZM4vtySq2afwMMbfy6HxRoT1s2okQN5pSial9JBMhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078835;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=F/F2usTe1z7SWyf2Vg0W1HENbiWDwOKh1m6twIpFY74=;
	b=eJ2E7O7TS1CnBt5dyTRr14SjYGQczp8dnC3cqmZXDMgJGhtn7LQlHbJoETYNuOtPsucL
	 zuYWJ4+f40CVeVPFPFJKB/+Fur70CXsFQa0hzSrpIyBjL+FfsHpyG70ua2gXAW3pmpg9W
	 J/2UMfZd8wsKDqIcPqKxSO1dHwrt1RLPN7Tx3leUR3euyMVIpRt2bbKOCWBuf2O2G2ECM
	 zROTiTuHQJ3NNuPyaYFglBOZICraU7zJcWTY5medbPRLh4f/ilh4ngDrepTs4LpQUwTYG
	 /wPINWaqpun0NezX0um+BJfW1yMLMSicrti0hq+3A0wwxzlhLHSWHalYxKVttstAjMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=UlLecL30;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.42.110
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021110.outbound.protection.outlook.com [40.107.42.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC84960A3822
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC84960A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=UlLecL30
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpjiA5TqKUTT3BFd7OXStcSgDhVKLjfll7/t0olqPs8+Ng//MPiAbsFm7mbBLdnES3AWZ2qlMHM0N6YHjl8XEpmzKdNS71eiKkgJ3nCmj+OTYWVyO/nPDxSTQbLmKCcM+0fmFylINDcQHwUd5n2/0gCFMFgHptC6CX7tbkuSuLbb64guONBfkf6wbTWvstiaqxOGU29uERGMNNOqFp1+J6XH0r0UCHMPJzyDIAf2eoNHOOFtrUH8EW6cy6l9bL7Tpu/LL/ZiD5KtWeP/1M4jgWTSqhrTS/e5FN5VtQjeYcx+IubMDXS7rrp6rNC33MTv0GERFHNCXQCp6gOvuwyBkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/F2usTe1z7SWyf2Vg0W1HENbiWDwOKh1m6twIpFY74=;
 b=x0CGy0Iv2EW9J6E3XkrY5zcxIku1IWp5d6rzmQkbYlTCULlJcV1tWFQellomnAlafUpU71LandQ24gBz35pN6feh8zzACdOt/7HcQxa2WrvTvH6/NKdEtfzfhDf8ed2LWIkzBiT6W+REBvP8wg1siYYfdP8hG4F+dgTnBbeFxj6iF6BYAyBjH98HL/zM8rF+BJ+b8ELtms8sEM5T7Gg+O5devarh22U1+JyaXLUm/tDFETaYyretxuisR5FnEpsj30pYJaAftejVvz3AQ43dH2FQWaAC2n4oMla/rABv/1ejOCbBfzfTJ18yN0B7Es8L49b29b9JgWPqrnMhGLyn/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/F2usTe1z7SWyf2Vg0W1HENbiWDwOKh1m6twIpFY74=;
 b=UlLecL30yCJ0a0BSVoalqcAoulENzMJKZzIqLG1M5SFjfKx6fd1dp+ubqoLd3JpqXiegpyQk30ClWUAlEOIuLUzDYSyMdATotQ8DNweLkPWp62Y405UhnjDZzjOiby41JaW6duhqjYg2T2iIZ4uWblE5Jb7qFIMwD7FeJPbsXzRK8qIJr8QEsBsEI/5lvK9cEIsbtvcCmEGP/gyFY6omEF4X1kTH0kZnuomuLW7W7SfhbZnk0kNIM4BoGkmJ5alr0ymz3ERyfr+4q3WfjnTYcAvHyuk/h9UKzZU1wUb8pJZGcBV+vR23lpvsSMADdkjScX1q27Dca8FPrMbQwJkZhw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SL2P216MB1466.KORP216.PROD.OUTLOOK.COM (2603:1096:101:33::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:00:27 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:00:27 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com,
	kernel@pengutronix.de,
	nicolas.dufresne@collabora.com,
	ming.qian@oss.nxp.com,
	marek.vasut@mailbox.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v8 07/11] media: chips-media: wave6: Add Wave6 m2m encoder
Date: Thu, 19 Nov 2026 18:00:01 +0900
Message-Id: <542892d0f75d82102f122dfd55c73847e6b8c6f1.1795075581.git.nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1795075577.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0060.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::8) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
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
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SL2P216MB1466:EE_
X-MS-Office365-Filtering-Correlation-Id: fe189a6c-3d7b-40ed-e643-08df461b8e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|4022899009|23010399003|7416014|52116014|376014|1800799024|366016|22082099003|18002099003|6133799003|3023799007|56012099006|10067099003|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261022113327099003|261022105027099003|261021121427099003|261022075727099003|261022115727099003|261009223027099003|261102123227099003|261009221227099003|261009220027099003|261009221727099003|261009223327099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	hd7MURNNKK9JLa/SN6Fi80fu5r13jZoFeUdvIbdO6utJzhS/xoZkLlF4zwDfIQuyD3df15CLSdIzpZQQ/s3WBke6/ggMrJXdlFQ1dWJ3Kr7OH+FP8yh5524fk6nK1XAsGbD9NfbbDu6n627bP5Ej9GEv6mF0o4tYDP+hnp7JD7OqHGysUg731JJ4x7vf3wR5DHhV8DKnUJd1yi68e1fmodJJQ+WYGiEJCHPAgnG/7SWz3R8lInBk2tm7yGCXsTK0kXduaOWY7Ti06vUIAPhHBqAn5vCemVCZdKceEaC3jtqRj/WhUm+cxSUNRpoGB5hxrwohmsyVIKNs+c2UiTaliCTiCDRV9WOZijY1yejVUixO4ljE8OPdEHac2OYnY0YTEo2LR+ldLr4Jm7kgGLBmiTrlYf3tnVQWgQ6hUfHh1yY4v7HcT4nBxcJGSNiC1NR1jcTAeHC0V6EDp5TycDDaLuR3i8SkWZAdh8BD3wo15y/O1lwT3VapoPt10nfav4o+Emb/ZDL/NzNfDkIf1aGRe4xiz0Q55uYs5BV4EtoHzAKewamc41fGmT3nRjI6yZryZ1wmghhaooFPCAF6h2gakcjRN1d8K9KQLD/YLW9DzBIilltJxt581lZDs3mkLgi652iHxMF3j4VzPQCkEOyoqLwqXk82vFbqgchsToVC3Mqmu5iNLwj/LujcrpdmfGEc9i0Efb8khb0cELdze55UIYd8tBU2NbQqi9iP/xZICaM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006)(10067099003)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022113327099003)(261022105027099003)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003)(261102123227099003)(261009221227099003)(261009220027099003)(261009221727099003)(261009223327099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9PSIWWzniMuZofIxe4GVo0jelTqyefzMxiF1i/2ahzji1+R639HCnZnsN+sG?=
 =?us-ascii?Q?qxdu/BJQHM7gXQGzDaq8vZgyNxMX698ixa/NLN/uH+b60RTMFOf8jVG/KdTk?=
 =?us-ascii?Q?GjarQ68flNho5SPnxh3cOFex7FDm4fbaIc1Y7If4NYVLudlzRLdSH+OBPNfW?=
 =?us-ascii?Q?DW18XGn/GlS9ZmfBICbZ4ShlMxOn7s6WLaPDnhl5Fqm1ITRpwRZwqkd+Uwhd?=
 =?us-ascii?Q?yJfy9/gDPltG0iVlCGqlqxwRWLm4SvbEAwNR7E9tnuo6Ta3ziS/ghEadgpAp?=
 =?us-ascii?Q?xrgfi6bdjpSnuugd4mMGYkvXUx4XEepXjUKmLrsSV8LlQFNRf3VcelgomN4G?=
 =?us-ascii?Q?pqYxZha1GS1wCdoLwKhqssnUiewutcR4hhCibUz/Yn0e/K5IqbDRjbmshKBY?=
 =?us-ascii?Q?Ln0Ufw0oSjaF4gZuySG96MzL7/yR1vevmqArc5Lrrh3Pl1yv/osuSnHQTERS?=
 =?us-ascii?Q?3ij2YsQjXkGiTAxvMuYflB1yUcHjvyGQ4TBtpGkNntNzw2GIoVb9+meq52ic?=
 =?us-ascii?Q?EX1xEQ36a/NZE0FEJJLwWThVCbJBy+AJlUt+6Tria4mrWWfyP4zS97BwJ9y0?=
 =?us-ascii?Q?5qKCB1jR3rOqo7rkepFtYVCsNZvciFfZWhryvui086sLoVxvYBSGbibAq65p?=
 =?us-ascii?Q?GyqzWE8ARenC4med4t09t8W65LCFB/xkmf70K1mE94oTVbsK+qx3fJP/H90s?=
 =?us-ascii?Q?IJiazw/eWcj2qOo6q4i9YEo455W/g7aNMgzVFESYr3x6efadL5MW915l9mic?=
 =?us-ascii?Q?6baYrbQtyQtuxdTYm6jHBsGlYtfOMT/tVDZKJHZsnBg9661cqZOB/o6CxAIb?=
 =?us-ascii?Q?E4SSxwrBdKlEXNyb55R52Fffja+hN001Xjh5qQrngR9hgxTtL3r+3I6ud1n8?=
 =?us-ascii?Q?HmGdJkpU82Bhh51xjQEtcBfRRSS1UWNLcHiz8Z/DaeQFD5WKijPjjN27XvHM?=
 =?us-ascii?Q?INEbcb/ttdFa6oxnXYuybjxcUfD8y2WjOiJLqDMjhmAhXbiSRa2WLMuy/Xd2?=
 =?us-ascii?Q?DH+XfGgJ7JlPaA2cyRAqWm5evS/DqN8bXjuiBIpXl2vr9Thb8+di0L5yBL6H?=
 =?us-ascii?Q?Ub+hKas/EzCRNaBwJjubKTzDr2Np3u1x4RdxQf2FFSAVNYZh/hCN85OKOJH6?=
 =?us-ascii?Q?/9ghXd9r8MBI0GpVrt5UewBCk0WzqNU6WLmqJ3Hx8s9YWTXjHUXrMDsBLupi?=
 =?us-ascii?Q?S6Jqe0lXL4sPuu3HmwQKXdJ6OcC+bU77f+Tka2IwmcXT5pH6qAWms+jGvCcN?=
 =?us-ascii?Q?sZO+nWFD/4s0eKW+kqmm6mbSxf02yJ66sUgRsRmrhcTGOl4bs0ysXZgsKCJw?=
 =?us-ascii?Q?9Sz8IwNkbK0sXPrpq5mRlu/W/nP33FqvJiCeMWWez+cqdM1WXLKb1LRgIsOD?=
 =?us-ascii?Q?BTehS4GIIJn4UlGKtN9XnbbQqGoShGNHitor0lWzVSCa2KUT2KPV6gJC8OXR?=
 =?us-ascii?Q?FN/jhaSZLFMvGWTGxku9Ka6DpLRpZ3WQgVpYHGwUdIVcPawOmaaUHyNFrqBx?=
 =?us-ascii?Q?tUENpbBnstqpbtHwu3+s2niZgT0zbhCBMrdp43bj+TZ3soSTCz3SRynZxq54?=
 =?us-ascii?Q?QAPGoTD265t8DUxV3ZdaF0v60td0VjRuNtzu8vLPOjeXa4B+qCc173Wyf68c?=
 =?us-ascii?Q?RLeRQiHG4NpWsS1PqqvI8iYRy6ERmHDPPBBshlVoGV/IgObkTKcVO1B7rU7x?=
 =?us-ascii?Q?ktLrr5+wjUQiYY9wULzE3ktOEr2i8o8yD/aeTkxdKlOexr6RBwkguu2GLm4z?=
 =?us-ascii?Q?H5qwRv6HVki/6Mokyj1SNGe9B5YsAYU=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe189a6c-3d7b-40ed-e643-08df461b8e40
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:00:27.6698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4LYsbISZxqFp8A9I66Xa7Sbv8bIL3+T6iaEJN2Remrq7PkXJp9aQ7HAPwHyHQ83avs6QC2ERax3qo9w7sD3X9cgEEP4oll0Qb3L+U6rkPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1466

Add the V4L2 m2m stateful encoder for the Chips&Media Wave6 video codec
IP.

The encoder supports the following features and formats:
- Supported codecs: AVC, HEVC (8-bit streams only)
- Supported raw (OUTPUT) formats:
  * V4L2_PIX_FMT_YUV420/NV12/NV21
  * V4L2_PIX_FMT_YUV420M/NV12M/NV21M
  * V4L2_PIX_FMT_YUV422P/NV16/NV61
  * V4L2_PIX_FMT_YUV422M/NV16M/NV61M
  * V4L2_PIX_FMT_YUYV
  * V4L2_PIX_FMT_YUV24/NV24/NV42
  * V4L2_PIX_FMT_P010
  * V4L2_PIX_FMT_RGB24
  * V4L2_PIX_FMT_ARGB32/XRGB32/RGBA32/RGBX32
  * V4L2_PIX_FMT_ARGB2101010
- Although 10-bit raw formats are accepted (P010, ARGB2101010), the
  encoded stream is limited to 8-bit
- Supports crop
- Supports rotation and horizontal/vertical flip, except for YUV 4:4:4
  and RGB input
- Supports the V4L2 encoder controls

While other versions of the Wave6 IP may support AV1 encoding, it is
not implemented or validated in this driver at this time.

Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../media/platform/chips-media/wave6/Kconfig  |    2 +-
 .../media/platform/chips-media/wave6/Makefile |    1 +
 .../chips-media/wave6/wave6-vpu-core.c        |   20 +-
 .../chips-media/wave6/wave6-vpu-core.h        |   12 +
 .../chips-media/wave6/wave6-vpu-enc.c         | 2732 +++++++++++++++++
 .../chips-media/wave6/wave6-vpu-v4l2.c        |   22 +
 .../platform/chips-media/wave6/wave6-vpuapi.h |    2 +
 7 files changed, 2789 insertions(+), 2 deletions(-)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c

diff --git a/drivers/media/platform/chips-media/wave6/Kconfig b/drivers/media/platform/chips-media/wave6/Kconfig
index 9f2c2f92ee38..64a11dea18ed 100644
--- a/drivers/media/platform/chips-media/wave6/Kconfig
+++ b/drivers/media/platform/chips-media/wave6/Kconfig
@@ -10,7 +10,7 @@ config VIDEO_WAVE6_VPU
 	select GENERIC_ALLOCATOR
 	help
 	  Chips&Media Wave6 stateful codec driver.
-	  It provides decoding capabilities for H.264, HEVC,
+	  It provides encoding and decoding capabilities for H.264, HEVC,
 	  and other video formats.
 	  To compile this driver as a module, choose M here: the
 	  module will be called wave6.
diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
index 9bfb8b45d091..53ee91b88bed 100644
--- a/drivers/media/platform/chips-media/wave6/Makefile
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -5,5 +5,6 @@ wave6-objs += wave6-vpu.o \
 	      wave6-vpu-v4l2.o \
 	      wave6-vpuapi.o \
 	      wave6-vpu-dec.o \
+	      wave6-vpu-enc.o \
 	      wave6-hw.o
 obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6.o
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
index 2baf51a5709d..aad4023d66a4 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.c
@@ -187,6 +187,11 @@ static void wave6_vpu_core_unregister_dec(void *data)
 	wave6_vpu_dec_unregister_device(data);
 }
 
+static void wave6_vpu_core_unregister_enc(void *data)
+{
+	wave6_vpu_enc_unregister_device(data);
+}
+
 static int wave6_vpu_core_probe(struct platform_device *pdev)
 {
 	struct vpu_core_device *core;
@@ -296,8 +301,21 @@ static int wave6_vpu_core_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 	}
+	if (core->res->codec_types & WAVE6_IS_ENC) {
+		ret = wave6_vpu_enc_register_device(core);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"failed to register video_dev_enc: %d\n", ret);
+			return ret;
+		}
+
+		ret = devm_add_action_or_reset(&pdev->dev, wave6_vpu_core_unregister_enc, core);
+		if (ret)
+			return ret;
+	}
 
-	dev_dbg(&pdev->dev, "Added wave6 driver with caps %s\n",
+	dev_dbg(&pdev->dev, "Added wave6 driver with caps %s %s\n",
+		core->res->codec_types & WAVE6_IS_ENC ? "'ENCODE'" : "",
 		core->res->codec_types & WAVE6_IS_DEC ? "'DECODE'" : "");
 
 	return 0;
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
index 1c473c8ce562..dc0b9867ca37 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
@@ -27,6 +27,12 @@ struct vpu_buffer {
 	bool consumed;
 	bool used;
 	bool error;
+	bool force_key_frame;
+	bool force_frame_qp;
+	u32 force_i_frame_qp;
+	u32 force_p_frame_qp;
+	u32 force_b_frame_qp;
+	u32 average_qp;
 };
 
 enum vpu_fmt_type {
@@ -36,6 +42,9 @@ enum vpu_fmt_type {
 
 #define VPU_FMT_FLAG_CBCR_INTERLEAVED	BIT(0)
 #define VPU_FMT_FLAG_CRCB_ORDER		BIT(1)
+#define VPU_FMT_FLAG_10BIT		BIT(2)
+#define VPU_FMT_FLAG_RGB		BIT(3)
+#define VPU_FMT_FLAG_SUPPORT_ROT_MIR	BIT(4)
 
 struct vpu_format {
 	unsigned int v4l2_pix_fmt;
@@ -46,6 +55,7 @@ struct vpu_format {
 	unsigned int num_planes;
 	enum frame_buffer_format fb_fmt;
 	enum endian_mode endian;
+	enum csc_format_order csc_fmt_order;
 	unsigned int flags;
 };
 
@@ -94,6 +104,8 @@ void wave6_vpu_set_instance_state(struct vpu_instance *inst,
 int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout);
 int wave6_vpu_dec_register_device(struct vpu_core_device *core);
 void wave6_vpu_dec_unregister_device(struct vpu_core_device *core);
+int wave6_vpu_enc_register_device(struct vpu_core_device *core);
+void wave6_vpu_enc_unregister_device(struct vpu_core_device *core);
 void wave6_vpu_device_run_timeout(struct work_struct *work);
 void wave6_vpu_finish_job(struct vpu_instance *inst);
 int wave6_vpu_init_m2m_dev(struct vpu_core_device *core);
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
new file mode 100644
index 000000000000..7142666d4503
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
@@ -0,0 +1,2732 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - v4l2 stateful encoder interface
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#include <linux/math64.h>
+#include <linux/pm_runtime.h>
+
+#include "wave6-vpu-core.h"
+
+#define VPU_ENC_DEV_NAME "C&M Wave6 VPU encoder"
+#define VPU_ENC_DRV_NAME "wave6-enc"
+
+static const struct vpu_format wave6_vpu_enc_fmt_list[2][23] = {
+	[VPU_FMT_TYPE_CODEC] = {
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_HEVC,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_H264,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+		},
+	},
+	[VPU_FMT_TYPE_RAW] = {
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_SUPPORT_ROT_MIR,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_SUPPORT_ROT_MIR,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_CRCB_ORDER |
+				 VPU_FMT_FLAG_SUPPORT_ROT_MIR,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422P,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_422,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_SUPPORT_ROT_MIR,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_422,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_SUPPORT_ROT_MIR,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_422,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_CRCB_ORDER |
+				 VPU_FMT_FLAG_SUPPORT_ROT_MIR,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUYV,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_YUYV,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_SUPPORT_ROT_MIR,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV24,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_YUV444_24BIT_PACKED,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV24,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_YUV444_24BIT,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV42,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_YUV444_24BIT,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_CRCB_ORDER,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 3,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_SUPPORT_ROT_MIR,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 2,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_SUPPORT_ROT_MIR,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 2,
+			.fb_fmt = FORMAT_420,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_CRCB_ORDER |
+				 VPU_FMT_FLAG_SUPPORT_ROT_MIR,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 3,
+			.fb_fmt = FORMAT_422,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_SUPPORT_ROT_MIR,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 2,
+			.fb_fmt = FORMAT_422,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_SUPPORT_ROT_MIR,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 2,
+			.fb_fmt = FORMAT_422,
+			.endian = VPU_SOURCE_ENDIAN,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_CRCB_ORDER |
+				 VPU_FMT_FLAG_SUPPORT_ROT_MIR,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_P010,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_420_P10_16BIT_MSB,
+			.endian = VDI_128BIT_LE_BYTE_SWAP,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_10BIT |
+				 VPU_FMT_FLAG_SUPPORT_ROT_MIR,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_RGB24,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_RGB_24BIT_PACKED,
+			.endian = VPU_SOURCE_ENDIAN,
+			.csc_fmt_order = CSC_FMT_ORDER_RGB,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_RGB,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_ARGB32,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_RGB_32BIT_PACKED,
+			.endian = VPU_SOURCE_ENDIAN,
+			.csc_fmt_order = CSC_FMT_ORDER_ARGB,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_RGB,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_XRGB32,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_RGB_32BIT_PACKED,
+			.endian = VPU_SOURCE_ENDIAN,
+			.csc_fmt_order = CSC_FMT_ORDER_ARGB,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_RGB,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_RGBA32,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_RGB_32BIT_PACKED,
+			.endian = VPU_SOURCE_ENDIAN,
+			.csc_fmt_order = CSC_FMT_ORDER_RGBA,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_RGB,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_RGBX32,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_RGB_32BIT_PACKED,
+			.endian = VPU_SOURCE_ENDIAN,
+			.csc_fmt_order = CSC_FMT_ORDER_RGBA,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_RGB,
+		},
+		{
+			.v4l2_pix_fmt = V4L2_PIX_FMT_ARGB2101010,
+			.max_width = W6_MAX_ENC_PIC_WIDTH,
+			.min_width = W6_MIN_ENC_PIC_WIDTH,
+			.max_height = W6_MAX_ENC_PIC_HEIGHT,
+			.min_height = W6_MIN_ENC_PIC_HEIGHT,
+			.num_planes = 1,
+			.fb_fmt = FORMAT_RGB_P10_32BIT_PACKED,
+			.endian = VDI_128BIT_LE_WORD_BYTE_SWAP,
+			.csc_fmt_order = CSC_FMT_ORDER_ARGB,
+			.flags = VPU_FMT_FLAG_CBCR_INTERLEAVED |
+				 VPU_FMT_FLAG_RGB |
+				 VPU_FMT_FLAG_10BIT,
+		},
+	}
+};
+
+static const struct vpu_format *wave6_find_vpu_fmt(unsigned int v4l2_pix_fmt,
+						   enum vpu_fmt_type type)
+{
+	for (int i = 0; i < ARRAY_SIZE(wave6_vpu_enc_fmt_list[type]); i++) {
+		if (wave6_vpu_enc_fmt_list[type][i].v4l2_pix_fmt == v4l2_pix_fmt)
+			return &wave6_vpu_enc_fmt_list[type][i];
+	}
+
+	return NULL;
+}
+
+static const struct vpu_format *wave6_find_vpu_fmt_by_idx(unsigned int idx,
+							  enum vpu_fmt_type type)
+{
+	if (idx >= ARRAY_SIZE(wave6_vpu_enc_fmt_list[type]))
+		return NULL;
+
+	if (!wave6_vpu_enc_fmt_list[type][idx].v4l2_pix_fmt)
+		return NULL;
+
+	return &wave6_vpu_enc_fmt_list[type][idx];
+}
+
+static u32 wave6_cpb_size_msec(u32 cpb_size_kb, u32 bitrate)
+{
+	u64 cpb_size_bit;
+	u64 cpb_size_msec;
+
+	cpb_size_bit = (u64)cpb_size_kb * 1000 * BITS_PER_BYTE;
+	cpb_size_msec = div_u64(cpb_size_bit * 1000, bitrate);
+
+	if (cpb_size_msec < MIN_CPB_SIZE || cpb_size_msec > MAX_CPB_SIZE)
+		cpb_size_msec = DEFAULT_CPB_SIZE;
+
+	return cpb_size_msec;
+}
+
+static void wave6_vpu_enc_release_fb(struct vpu_instance *inst)
+{
+	for (int i = 0; i < WAVE6_MAX_FBS; i++) {
+		wave6_vdi_free_dma(&inst->frame_vbuf[i]);
+		memset(&inst->frame_buf[i], 0, sizeof(struct frame_buffer));
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][i]);
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_C_TBL][i]);
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_MV_COL][i]);
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_SUB_SAMPLE][i]);
+	}
+}
+
+static void wave6_vpu_enc_destroy_instance(struct vpu_instance *inst)
+{
+	u32 fail_res = 0;
+	int ret;
+
+	wave6_vpu_disable_instance(inst);
+
+	ret = wave6_vpu_enc_close(inst, &fail_res);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed destroy instance: %d (%d)\n",
+			ret, fail_res);
+	}
+
+	scoped_guard(spinlock, &inst->dev->inst_lock)
+		list_del_init(&inst->list);
+	wave6_vpu_enc_release_fb(inst);
+	wave6_vdi_free_dma(&inst->ar_vbuf);
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_NONE);
+
+	pm_runtime_put_sync(inst->dev->dev);
+	wave6_vpu_core_deactivate(inst->dev);
+}
+
+static struct vb2_v4l2_buffer *wave6_get_valid_src_buf(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *vb2_v4l2_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vpu_buffer *vpu_buf = NULL;
+
+	v4l2_m2m_for_each_src_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		vb2_v4l2_buf = &v4l2_m2m_buf->vb;
+		vpu_buf = wave6_to_vpu_buf(vb2_v4l2_buf);
+
+		if (!vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "no consumed src idx : %d\n",
+				vb2_v4l2_buf->vb2_buf.index);
+			return vb2_v4l2_buf;
+		}
+	}
+
+	return NULL;
+}
+
+static struct vb2_v4l2_buffer *wave6_get_valid_dst_buf(struct vpu_instance *inst)
+{
+	struct vb2_v4l2_buffer *vb2_v4l2_buf;
+	struct v4l2_m2m_buffer *v4l2_m2m_buf;
+	struct vpu_buffer *vpu_buf;
+
+	v4l2_m2m_for_each_dst_buf(inst->v4l2_fh.m2m_ctx, v4l2_m2m_buf) {
+		vb2_v4l2_buf = &v4l2_m2m_buf->vb;
+		vpu_buf = wave6_to_vpu_buf(vb2_v4l2_buf);
+
+		if (!vpu_buf->consumed) {
+			dev_dbg(inst->dev->dev, "no consumed dst idx : %d\n",
+				vb2_v4l2_buf->vb2_buf.index);
+			return vb2_v4l2_buf;
+		}
+	}
+
+	return NULL;
+}
+
+static void wave6_set_csc(struct vpu_instance *inst, struct enc_param *pic_param)
+{
+	const struct vpu_format *vpu_fmt;
+	bool is_10bit;
+
+	vpu_fmt = wave6_find_vpu_fmt(inst->src_fmt.pixelformat, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt)
+		return;
+
+	if (!(vpu_fmt->flags & VPU_FMT_FLAG_RGB))
+		return;
+
+	is_10bit = !!(vpu_fmt->flags & VPU_FMT_FLAG_10BIT);
+	pic_param->csc.fmt_order = vpu_fmt->csc_fmt_order;
+
+	if (inst->ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT ||
+	    inst->ycbcr_enc == V4L2_YCBCR_ENC_601) {
+		if (inst->quantization == V4L2_QUANTIZATION_FULL_RANGE) {
+			/*
+			 * Y   0.299(R)    0.587(G)    0.114(B)
+			 * Cb -0.16874(R) -0.33126(G)  0.5(B)
+			 * Cr  0.5(R)     -0.41869(G) -0.08131(B)
+			 */
+			pic_param->csc.coef_ry = 0x099;
+			pic_param->csc.coef_gy = 0x12d;
+			pic_param->csc.coef_by = 0x03a;
+			pic_param->csc.coef_rcb = 0xffffffaa;
+			pic_param->csc.coef_gcb = 0xffffff56;
+			pic_param->csc.coef_bcb = 0x100;
+			pic_param->csc.coef_rcr = 0x100;
+			pic_param->csc.coef_gcr = 0xffffff2a;
+			pic_param->csc.coef_bcr = 0xffffffd6;
+			pic_param->csc.offset_y = 0x0;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		} else {
+			/*
+			 * Y   0.258(R)   0.504(G)   0.098(B)
+			 * Cb -0.1484(R) -0.2891(G)  0.4375(B)
+			 * Cr  0.4375(R) -0.3672(G) -0.0703(B)
+			 */
+			pic_param->csc.coef_ry = 0x084;
+			pic_param->csc.coef_gy = 0x102;
+			pic_param->csc.coef_by = 0x032;
+			pic_param->csc.coef_rcb = 0xffffffb4;
+			pic_param->csc.coef_gcb = 0xffffff6c;
+			pic_param->csc.coef_bcb = 0x0e0;
+			pic_param->csc.coef_rcr = 0x0e0;
+			pic_param->csc.coef_gcr = 0xffffff44;
+			pic_param->csc.coef_bcr = 0xffffffdc;
+			pic_param->csc.offset_y = (is_10bit) ? 0x40 : 0x10;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		}
+	} else if (inst->ycbcr_enc == V4L2_YCBCR_ENC_709) {
+		if (inst->quantization == V4L2_QUANTIZATION_FULL_RANGE) {
+			/*
+			 * Y   0.2126(R)   0.7152(G)   0.0722(B)
+			 * Cb -0.11457(R) -0.38543(G)  0.5(B)
+			 * Cr  0.5(R)     -0.45415(G) -0.04585(B)
+			 */
+			pic_param->csc.coef_ry = 0x06d;
+			pic_param->csc.coef_gy = 0x16e;
+			pic_param->csc.coef_by = 0x025;
+			pic_param->csc.coef_rcb = 0xffffffc5;
+			pic_param->csc.coef_gcb = 0xffffff3b;
+			pic_param->csc.coef_bcb = 0x100;
+			pic_param->csc.coef_rcr = 0x100;
+			pic_param->csc.coef_gcr = 0xffffff17;
+			pic_param->csc.coef_bcr = 0xffffffe9;
+			pic_param->csc.offset_y = 0x0;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		} else {
+			pic_param->csc.coef_ry = 0x05e;
+			pic_param->csc.coef_gy = 0x13b;
+			pic_param->csc.coef_by = 0x020;
+			pic_param->csc.coef_rcb = 0xffffffcc;
+			pic_param->csc.coef_gcb = 0xffffff53;
+			pic_param->csc.coef_bcb = 0x0e1;
+			pic_param->csc.coef_rcr = 0x0e1;
+			pic_param->csc.coef_gcr = 0xffffff34;
+			pic_param->csc.coef_bcr = 0xffffffeb;
+			pic_param->csc.offset_y = (is_10bit) ? 0x40 : 0x10;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		}
+	} else if (inst->ycbcr_enc == V4L2_YCBCR_ENC_BT2020) {
+		if (inst->quantization == V4L2_QUANTIZATION_FULL_RANGE) {
+			/*
+			 * Y   0.2627(R)   0.678(G)    0.0593(B)
+			 * Cb -0.13963(R) -0.36037(G)  0.5(B)
+			 * Cr  0.5(R)     -0.45979(G) -0.04021(B)
+			 */
+			pic_param->csc.coef_ry = 0x087;
+			pic_param->csc.coef_gy = 0x15b;
+			pic_param->csc.coef_by = 0x01e;
+			pic_param->csc.coef_rcb = 0xffffffb9;
+			pic_param->csc.coef_gcb = 0xffffff47;
+			pic_param->csc.coef_bcb = 0x100;
+			pic_param->csc.coef_rcr = 0x100;
+			pic_param->csc.coef_gcr = 0xffffff15;
+			pic_param->csc.coef_bcr = 0xffffffeb;
+			pic_param->csc.offset_y = 0x0;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		} else {
+			pic_param->csc.coef_ry = 0x074;
+			pic_param->csc.coef_gy = 0x12a;
+			pic_param->csc.coef_by = 0x01a;
+			pic_param->csc.coef_rcb = 0xffffffc1;
+			pic_param->csc.coef_gcb = 0xffffff5e;
+			pic_param->csc.coef_bcb = 0x0e1;
+			pic_param->csc.coef_rcr = 0x0e1;
+			pic_param->csc.coef_gcr = 0xffffff31;
+			pic_param->csc.coef_bcr = 0xffffffee;
+			pic_param->csc.offset_y = (is_10bit) ? 0x40 : 0x10;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		}
+	} else if (inst->ycbcr_enc == V4L2_YCBCR_ENC_SMPTE240M) {
+		if (inst->quantization == V4L2_QUANTIZATION_FULL_RANGE) {
+			/*
+			 * Y   0.2122(R)  0.7013(G)  0.0865(B)
+			 * Cb -0.1161(R) -0.3839(G)  0.5(B)
+			 * Cr  0.5(R)    -0.4451(G) -0.0549(B)
+			 */
+			pic_param->csc.coef_ry = 0x06d;
+			pic_param->csc.coef_gy = 0x167;
+			pic_param->csc.coef_by = 0x02c;
+			pic_param->csc.coef_rcb = 0xffffffc5;
+			pic_param->csc.coef_gcb = 0xffffff3b;
+			pic_param->csc.coef_bcb = 0x100;
+			pic_param->csc.coef_rcr = 0x100;
+			pic_param->csc.coef_gcr = 0xffffff1c;
+			pic_param->csc.coef_bcr = 0xffffffe4;
+			pic_param->csc.offset_y = 0x0;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		} else {
+			pic_param->csc.coef_ry = 0x05d;
+			pic_param->csc.coef_gy = 0x134;
+			pic_param->csc.coef_by = 0x026;
+			pic_param->csc.coef_rcb = 0xffffffcc;
+			pic_param->csc.coef_gcb = 0xffffff53;
+			pic_param->csc.coef_bcb = 0x0e1;
+			pic_param->csc.coef_rcr = 0x0e1;
+			pic_param->csc.coef_gcr = 0xffffff38;
+			pic_param->csc.coef_bcr = 0xffffffe7;
+			pic_param->csc.offset_y = (is_10bit) ? 0x40 : 0x10;
+			pic_param->csc.offset_cb = (is_10bit) ? 0x200 : 0x80;
+			pic_param->csc.offset_cr = (is_10bit) ? 0x200 : 0x80;
+		}
+	} else if (inst->ycbcr_enc == V4L2_YCBCR_ENC_XV601) {
+		if (inst->quantization == V4L2_QUANTIZATION_LIM_RANGE) {
+			/*
+			 * Y   0.2558(R)  0.5021(G)  0.0975(B)
+			 * Cb -0.1476(R) -0.2899(G)  0.4375(B)
+			 * Cr  0.4375(R) -0.3664(G) -0.0711(B)
+			 */
+			pic_param->csc.coef_ry = 0x083;
+			pic_param->csc.coef_gy = 0x101;
+			pic_param->csc.coef_by = 0x032;
+			pic_param->csc.coef_rcb = 0xffffffb4;
+			pic_param->csc.coef_gcb = 0xffffff6c;
+			pic_param->csc.coef_bcb = 0x0e0;
+			pic_param->csc.coef_rcr = 0x0e0;
+			pic_param->csc.coef_gcr = 0xffffff44;
+			pic_param->csc.coef_bcr = 0xffffffdc;
+			pic_param->csc.offset_y = (is_10bit) ? 0x40 : 0x10;
+			pic_param->csc.offset_cb = 0x0;
+			pic_param->csc.offset_cr = 0x0;
+		}
+	} else if (inst->ycbcr_enc == V4L2_YCBCR_ENC_XV709) {
+		if (inst->quantization == V4L2_QUANTIZATION_LIM_RANGE) {
+			/*
+			 * Y   0.1819(R)  0.6118(G)  0.0618(B)
+			 * Cb -0.1003(R) -0.3372(G)  0.4375(B)
+			 * Cr  0.4375(R) -0.3974(G) -0.0401(B)
+			 */
+			pic_param->csc.coef_ry = 0x05d;
+			pic_param->csc.coef_gy = 0x139;
+			pic_param->csc.coef_by = 0x020;
+			pic_param->csc.coef_rcb = 0xffffffcd;
+			pic_param->csc.coef_gcb = 0xffffff53;
+			pic_param->csc.coef_bcb = 0x0e0;
+			pic_param->csc.coef_rcr = 0x0e0;
+			pic_param->csc.coef_gcr = 0xffffff35;
+			pic_param->csc.coef_bcr = 0xffffffeb;
+			pic_param->csc.offset_y = (is_10bit) ? 0x40 : 0x10;
+			pic_param->csc.offset_cb = 0x0;
+			pic_param->csc.offset_cr = 0x0;
+		}
+	}
+}
+
+static void wave6_update_crop_info(struct vpu_instance *inst,
+				   u32 left, u32 top, u32 width, u32 height)
+{
+	u32 enc_pic_width, enc_pic_height;
+
+	inst->crop.left = left;
+	inst->crop.top = top;
+	inst->crop.width = width;
+	inst->crop.height = height;
+
+	inst->codec_rect.left = round_down(left, W6_ENC_CROP_X_POS_STEP);
+	inst->codec_rect.top = round_down(top, W6_ENC_CROP_Y_POS_STEP);
+
+	enc_pic_width = width + left - inst->codec_rect.left;
+	inst->codec_rect.width = round_up(enc_pic_width, W6_ENC_PIC_SIZE_STEP);
+
+	enc_pic_height = height + top - inst->codec_rect.top;
+	inst->codec_rect.height = round_up(enc_pic_height, W6_ENC_PIC_SIZE_STEP);
+}
+
+static int wave6_allocate_aux_buffer(struct vpu_instance *inst,
+				     enum aux_buffer_type type,
+				     unsigned int width,
+				     unsigned int height,
+				     int num)
+{
+	struct aux_buffer_size_info size_info;
+	unsigned int size;
+	int ret;
+
+	size_info.width = width;
+	size_info.height = height;
+	size_info.type = type;
+
+	ret = wave6_vpu_enc_get_aux_buffer_size(inst, size_info, &size);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: Get size fail (type %d)\n", __func__, type);
+		return ret;
+	}
+
+	for (int i = 0; i < num; i++) {
+		inst->aux_vbuf[type][i].size = size;
+		ret = wave6_vdi_alloc_dma(inst->dev->dev, &inst->aux_vbuf[type][i]);
+		if (ret) {
+			dev_err(inst->dev->dev, "%s: Alloc fail (type %d)\n", __func__, type);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void wave6_update_frame_buf_addr(struct vpu_instance *inst,
+					struct frame_buffer *frame_buf)
+{
+	const struct v4l2_format_info *fmt_info;
+	u32 stride = inst->src_fmt.plane_fmt[0].bytesperline;
+	u32 offset;
+
+	fmt_info = v4l2_format_info(inst->src_fmt.pixelformat);
+	if (!fmt_info)
+		return;
+
+	offset = inst->codec_rect.top * stride + inst->codec_rect.left * fmt_info->bpp[0];
+	frame_buf->buf_y += offset;
+
+	stride = DIV_ROUND_UP(stride, fmt_info->bpp[0]) * fmt_info->bpp[1];
+	offset = inst->codec_rect.top * stride / fmt_info->vdiv / fmt_info->hdiv
+			+ inst->codec_rect.left * fmt_info->bpp[1] / fmt_info->hdiv;
+	frame_buf->buf_cb += offset;
+	frame_buf->buf_cr += offset;
+}
+
+static int wave6_update_seq_param(struct vpu_instance *inst)
+{
+	struct enc_seq_info seq_info;
+	bool changed = false;
+	int ret;
+
+	ret = wave6_vpu_enc_issue_seq_change(inst, &changed);
+	if (ret) {
+		dev_err(inst->dev->dev, "seq change fail %d\n", ret);
+		return ret;
+	}
+
+	if (!changed)
+		return 0;
+
+	ret = wave6_vpu_wait_interrupt(inst, W6_VPU_TIMEOUT);
+	if (ret) {
+		dev_err(inst->dev->dev, "seq change timeout\n");
+		return ret;
+	}
+
+	ret = wave6_vpu_enc_complete_seq_init(inst, &seq_info);
+	if (ret) {
+		dev_err(inst->dev->dev, "seq change error\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void wave6_calc_source_frame_info(struct vpu_instance *inst,
+					 u32 *stride, u32 *luma_size,
+					 u32 *stride_c, u32 *chroma_size)
+{
+	const struct v4l2_format_info *info = v4l2_format_info(inst->src_fmt.pixelformat);
+	u32 height = inst->src_fmt.height;
+
+	*stride = inst->src_fmt.plane_fmt[0].bytesperline;
+	*luma_size = *stride * height;
+
+	if (WARN_ON_ONCE(!info) || info->comp_planes < 2) {
+		*stride_c = 0;
+		*chroma_size = 0;
+		return;
+	}
+
+	*stride_c = DIV_ROUND_UP(*stride, info->bpp[0]);
+	*stride_c = DIV_ROUND_UP(*stride_c, info->hdiv) * info->bpp[1];
+	*chroma_size = *stride_c * DIV_ROUND_UP(height, info->vdiv);
+}
+
+static int wave6_vpu_enc_start_encode(struct vpu_instance *inst)
+{
+	int ret;
+	struct vb2_v4l2_buffer *src_buf = NULL;
+	struct vb2_v4l2_buffer *dst_buf = NULL;
+	struct vpu_buffer *src_vbuf = NULL;
+	struct vpu_buffer *dst_vbuf = NULL;
+	struct frame_buffer frame_buf;
+	struct enc_param pic_param;
+	u32 stride;
+	u32 luma_size;
+	u32 stride_c;
+	u32 chroma_size;
+	u32 fail_res = 0;
+
+	memset(&pic_param, 0, sizeof(struct enc_param));
+	memset(&frame_buf, 0, sizeof(struct frame_buffer));
+
+	wave6_calc_source_frame_info(inst, &stride, &luma_size,
+				     &stride_c, &chroma_size);
+
+	src_buf = wave6_get_valid_src_buf(inst);
+	dst_buf = wave6_get_valid_dst_buf(inst);
+
+	if (!src_buf || !dst_buf) {
+		dev_dbg(inst->dev->dev, "no valid src or dst buf\n");
+		return 0;
+	}
+
+	dst_vbuf = wave6_to_vpu_buf(dst_buf);
+	dst_vbuf->consumed = true;
+	dst_vbuf->used = true;
+	pic_param.pic_stream_buffer_addr = wave6_get_dma_addr(dst_buf, 0);
+	pic_param.pic_stream_buffer_size = vb2_plane_size(&dst_buf->vb2_buf, 0);
+
+	src_vbuf = wave6_to_vpu_buf(src_buf);
+	src_vbuf->consumed = true;
+	if (inst->src_fmt.num_planes == 1) {
+		frame_buf.buf_y = wave6_get_dma_addr(src_buf, 0);
+		frame_buf.buf_cb = frame_buf.buf_y + luma_size;
+		frame_buf.buf_cr = frame_buf.buf_cb + chroma_size;
+	} else if (inst->src_fmt.num_planes == 2) {
+		frame_buf.buf_y = wave6_get_dma_addr(src_buf, 0);
+		frame_buf.buf_cb = wave6_get_dma_addr(src_buf, 1);
+		frame_buf.buf_cr = frame_buf.buf_cb + chroma_size;
+	} else if (inst->src_fmt.num_planes == 3) {
+		frame_buf.buf_y = wave6_get_dma_addr(src_buf, 0);
+		frame_buf.buf_cb = wave6_get_dma_addr(src_buf, 1);
+		frame_buf.buf_cr = wave6_get_dma_addr(src_buf, 2);
+	}
+	wave6_update_frame_buf_addr(inst, &frame_buf);
+	frame_buf.stride = stride;
+	frame_buf.stride_c = stride_c;
+	pic_param.source_frame = &frame_buf;
+	pic_param.src_idx = src_buf->vb2_buf.index;
+	if (src_vbuf->force_key_frame || inst->error_recovery) {
+		pic_param.force_pic = true;
+		pic_param.force_pic_type = ENC_FORCE_PIC_TYPE_IDR;
+		inst->error_recovery = false;
+	}
+	if (src_vbuf->force_frame_qp) {
+		pic_param.force_pic_qp = true;
+		pic_param.force_pic_qp_i = src_vbuf->force_i_frame_qp;
+		pic_param.force_pic_qp_p = src_vbuf->force_p_frame_qp;
+		pic_param.force_pic_qp_b = src_vbuf->force_b_frame_qp;
+	}
+	wave6_set_csc(inst, &pic_param);
+
+	ret = wave6_vpu_enc_start_one_frame(inst, &pic_param, &fail_res);
+	if (ret) {
+		dev_err(inst->dev->dev, "[%d] %s: fail %d\n", inst->id, __func__, ret);
+		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_ERROR);
+		vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
+		vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
+
+		dst_buf = v4l2_m2m_dst_buf_remove(inst->v4l2_fh.m2m_ctx);
+		if (dst_buf) {
+			dst_buf->sequence = inst->sequence;
+			v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
+		}
+
+		src_buf = v4l2_m2m_src_buf_remove(inst->v4l2_fh.m2m_ctx);
+		if (src_buf) {
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+			inst->sequence++;
+			inst->processed_buf_num++;
+			inst->error_buf_num++;
+		}
+	} else {
+		dev_dbg(inst->dev->dev, "%s: success\n", __func__);
+	}
+
+	return ret;
+}
+
+static void wave6_handle_encoded_frame(struct vpu_instance *inst,
+				       struct enc_output_info *info)
+{
+	struct vb2_v4l2_buffer *src_buf;
+	struct vb2_v4l2_buffer *dst_buf;
+	struct vpu_buffer *vpu_buf;
+	struct vpu_buffer *dst_vpu_buf;
+	enum vb2_buffer_state state;
+
+	guard(mutex)(&inst->lock);
+
+	state = info->encoding_success ? VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
+
+	dst_buf = wave6_get_dst_buf_by_addr(inst, info->bitstream_buffer);
+	if (!dst_buf) {
+		dev_err(inst->dev->dev, "[%d] encoder can't find dst buffer\n", inst->id);
+		return;
+	}
+
+	src_buf = v4l2_m2m_src_buf_remove_by_idx(inst->v4l2_fh.m2m_ctx,
+						 info->enc_src_idx);
+	if (!src_buf) {
+		dev_err(inst->dev->dev, "[%d] encoder can't find src buffer\n", inst->id);
+		return;
+	}
+
+	vpu_buf = wave6_to_vpu_buf(src_buf);
+	if (!vpu_buf->consumed) {
+		dev_err(inst->dev->dev, "[%d] src buffer is not consumed\n", inst->id);
+		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		return;
+	}
+
+	dst_vpu_buf = wave6_to_vpu_buf(dst_buf);
+
+	dst_vpu_buf->average_qp = info->avg_ctu_qp;
+
+	if (v4l2_m2m_is_last_draining_src_buf(inst->v4l2_fh.m2m_ctx, src_buf)) {
+		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
+		v4l2_m2m_mark_stopped(inst->v4l2_fh.m2m_ctx);
+	}
+
+	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf);
+	v4l2_m2m_buf_done(src_buf, state);
+
+	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, info->bitstream_size);
+	dst_buf->sequence = inst->sequence++;
+	dst_buf->field = V4L2_FIELD_NONE;
+	if (info->pic_type == PIC_TYPE_I)
+		dst_buf->flags |= V4L2_BUF_FLAG_KEYFRAME;
+	else if (info->pic_type == PIC_TYPE_P)
+		dst_buf->flags |= V4L2_BUF_FLAG_PFRAME;
+	else if (info->pic_type == PIC_TYPE_B)
+		dst_buf->flags |= V4L2_BUF_FLAG_BFRAME;
+
+	v4l2_m2m_dst_buf_remove_by_buf(inst->v4l2_fh.m2m_ctx, dst_buf);
+	if (state == VB2_BUF_STATE_ERROR) {
+		dev_dbg(inst->dev->dev, "[%d] error frame %d\n", inst->id, inst->sequence);
+		inst->error_recovery = true;
+		inst->error_buf_num++;
+	}
+	v4l2_m2m_buf_done(dst_buf, state);
+	inst->processed_buf_num++;
+}
+
+static void wave6_vpu_enc_finish_encode(struct vpu_instance *inst, bool error)
+{
+	int ret;
+	struct enc_output_info info;
+
+	if (error) {
+		vb2_queue_error(v4l2_m2m_get_src_vq(inst->v4l2_fh.m2m_ctx));
+		vb2_queue_error(v4l2_m2m_get_dst_vq(inst->v4l2_fh.m2m_ctx));
+
+		wave6_vpu_set_instance_state(inst, VPU_INST_STATE_ERROR);
+
+		goto finish_encode;
+	}
+
+	memset(&info, 0, sizeof(info));
+
+	ret = wave6_vpu_enc_get_output_info(inst, &info);
+	if (ret) {
+		dev_dbg(inst->dev->dev, "vpu_enc_get_output_info fail %d\n", ret);
+		goto finish_encode;
+	}
+
+	if (info.enc_src_idx >= 0 && info.recon_frame_index >= 0)
+		wave6_handle_encoded_frame(inst, &info);
+
+finish_encode:
+	wave6_vpu_finish_job(inst);
+}
+
+static int wave6_vpu_enc_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
+{
+	strscpy(cap->driver, VPU_ENC_DRV_NAME, sizeof(cap->driver));
+	strscpy(cap->card, VPU_ENC_DRV_NAME, sizeof(cap->card));
+	strscpy(cap->bus_info, "platform:" VPU_ENC_DRV_NAME, sizeof(cap->bus_info));
+
+	return 0;
+}
+
+static int wave6_vpu_enc_enum_framesizes(struct file *f, void *fh, struct v4l2_frmsizeenum *fsize)
+{
+	const struct vpu_format *vpu_fmt;
+
+	if (fsize->index)
+		return -EINVAL;
+
+	vpu_fmt = wave6_find_vpu_fmt(fsize->pixel_format, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt) {
+		vpu_fmt = wave6_find_vpu_fmt(fsize->pixel_format, VPU_FMT_TYPE_RAW);
+		if (!vpu_fmt)
+			return -EINVAL;
+	}
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = vpu_fmt->min_width;
+	fsize->stepwise.max_width = vpu_fmt->max_width;
+	fsize->stepwise.step_width = W6_ENC_PIC_SIZE_STEP;
+	fsize->stepwise.min_height = vpu_fmt->min_height;
+	fsize->stepwise.max_height = vpu_fmt->max_height;
+	fsize->stepwise.step_height = W6_ENC_PIC_SIZE_STEP;
+
+	return 0;
+}
+
+static int wave6_vpu_enc_enum_fmt_cap(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	const struct vpu_format *vpu_fmt;
+
+	dev_dbg(inst->dev->dev, "index : %d\n", f->index);
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(f->index, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	f->pixelformat = vpu_fmt->v4l2_pix_fmt;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int wave6_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct vpu_format *vpu_fmt;
+	int width, height;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	if (!V4L2_TYPE_IS_CAPTURE(f->type))
+		return -EINVAL;
+
+	vpu_fmt = wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_CODEC);
+	if (!vpu_fmt) {
+		width = inst->dst_fmt.width;
+		height = inst->dst_fmt.height;
+		pix_mp->pixelformat = inst->dst_fmt.pixelformat;
+		pix_mp->num_planes = inst->dst_fmt.num_planes;
+	} else {
+		width = pix_mp->width;
+		height = pix_mp->height;
+		pix_mp->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		pix_mp->num_planes = vpu_fmt->num_planes;
+	}
+
+	wave6_update_pix_fmt(pix_mp, width, height);
+	pix_mp->colorspace = inst->colorspace;
+	pix_mp->ycbcr_enc = inst->ycbcr_enc;
+	pix_mp->quantization = inst->quantization;
+	pix_mp->xfer_func = inst->xfer_func;
+
+	return 0;
+}
+
+static int wave6_vpu_enc_s_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	struct vb2_queue *q;
+	int ret;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	q = v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, f->type);
+	if (vb2_is_busy(q))
+		return -EBUSY;
+
+	ret = wave6_vpu_enc_try_fmt_cap(file, fh, f);
+	if (ret)
+		return ret;
+
+	inst->std = wave6_to_codec_std(inst->type, pix_mp->pixelformat);
+	if (inst->std == STD_UNKNOWN) {
+		dev_err(inst->dev->dev, "unsupported pixelformat: %.4s\n",
+			(char *)&pix_mp->pixelformat);
+		return -EINVAL;
+	}
+
+	inst->dst_fmt.width = pix_mp->width;
+	inst->dst_fmt.height = pix_mp->height;
+	inst->dst_fmt.pixelformat = pix_mp->pixelformat;
+	inst->dst_fmt.field = pix_mp->field;
+	inst->dst_fmt.flags = pix_mp->flags;
+	inst->dst_fmt.num_planes = pix_mp->num_planes;
+	for (int i = 0; i < inst->dst_fmt.num_planes; i++) {
+		inst->dst_fmt.plane_fmt[i].bytesperline = pix_mp->plane_fmt[i].bytesperline;
+		inst->dst_fmt.plane_fmt[i].sizeimage = pix_mp->plane_fmt[i].sizeimage;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_g_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+
+	pix_mp->width = inst->dst_fmt.width;
+	pix_mp->height = inst->dst_fmt.height;
+	pix_mp->pixelformat = inst->dst_fmt.pixelformat;
+	pix_mp->field = inst->dst_fmt.field;
+	pix_mp->flags = inst->dst_fmt.flags;
+	pix_mp->num_planes = inst->dst_fmt.num_planes;
+	for (int i = 0; i < pix_mp->num_planes; i++) {
+		pix_mp->plane_fmt[i].bytesperline = inst->dst_fmt.plane_fmt[i].bytesperline;
+		pix_mp->plane_fmt[i].sizeimage = inst->dst_fmt.plane_fmt[i].sizeimage;
+	}
+
+	pix_mp->colorspace = inst->colorspace;
+	pix_mp->ycbcr_enc = inst->ycbcr_enc;
+	pix_mp->quantization = inst->quantization;
+	pix_mp->xfer_func = inst->xfer_func;
+
+	return 0;
+}
+
+static int wave6_vpu_enc_enum_fmt_out(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	const struct vpu_format *vpu_fmt;
+
+	dev_dbg(inst->dev->dev, "%s: index %d\n", __func__, f->index);
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(f->index, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	f->pixelformat = vpu_fmt->v4l2_pix_fmt;
+	f->flags = 0;
+
+	return 0;
+}
+
+static int wave6_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct vpu_format *vpu_fmt;
+	int width, height;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	if (!V4L2_TYPE_IS_OUTPUT(f->type))
+		return -EINVAL;
+
+	vpu_fmt = wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt) {
+		width = inst->src_fmt.width;
+		height = inst->src_fmt.height;
+		pix_mp->pixelformat = inst->src_fmt.pixelformat;
+		pix_mp->num_planes = inst->src_fmt.num_planes;
+	} else {
+		width = clamp(pix_mp->width,
+			      vpu_fmt->min_width, vpu_fmt->max_width);
+		height = clamp(pix_mp->height,
+			       vpu_fmt->min_height, vpu_fmt->max_height);
+
+		pix_mp->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		pix_mp->num_planes = vpu_fmt->num_planes;
+	}
+
+	wave6_update_pix_fmt(pix_mp,
+			     round_up(width, W6_ENC_PIC_SIZE_STEP),
+			     round_up(height, W6_ENC_PIC_SIZE_STEP));
+
+	if (pix_mp->ycbcr_enc == V4L2_YCBCR_ENC_BT2020_CONST_LUM)
+		pix_mp->ycbcr_enc = V4L2_YCBCR_ENC_BT2020;
+	if (pix_mp->ycbcr_enc == V4L2_YCBCR_ENC_XV601 ||
+	    pix_mp->ycbcr_enc == V4L2_YCBCR_ENC_XV709) {
+		if (pix_mp->quantization == V4L2_QUANTIZATION_FULL_RANGE)
+			pix_mp->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+	const struct vpu_format *vpu_fmt;
+	struct vb2_queue *q;
+	int ret;
+
+	dev_dbg(inst->dev->dev, "%s: 4cc %d w %d h %d plane %d colorspace %d\n",
+		__func__, pix_mp->pixelformat, pix_mp->width, pix_mp->height,
+		pix_mp->num_planes, pix_mp->colorspace);
+
+	q = v4l2_m2m_get_vq(inst->v4l2_fh.m2m_ctx, f->type);
+	if (vb2_is_busy(q))
+		return -EBUSY;
+
+	ret = wave6_vpu_enc_try_fmt_out(file, fh, f);
+	if (ret)
+		return ret;
+
+	vpu_fmt = wave6_find_vpu_fmt(pix_mp->pixelformat, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	inst->src_fmt.width = pix_mp->width;
+	inst->src_fmt.height = pix_mp->height;
+	inst->src_fmt.pixelformat = pix_mp->pixelformat;
+	inst->src_fmt.field = pix_mp->field;
+	inst->src_fmt.flags = pix_mp->flags;
+	inst->src_fmt.num_planes = pix_mp->num_planes;
+	for (int i = 0; i < inst->src_fmt.num_planes; i++) {
+		inst->src_fmt.plane_fmt[i].bytesperline = pix_mp->plane_fmt[i].bytesperline;
+		inst->src_fmt.plane_fmt[i].sizeimage = pix_mp->plane_fmt[i].sizeimage;
+	}
+
+	inst->cbcr_interleave = !!(vpu_fmt->flags & VPU_FMT_FLAG_CBCR_INTERLEAVED);
+	inst->nv21 = !!(vpu_fmt->flags & VPU_FMT_FLAG_CRCB_ORDER);
+	inst->colorspace = pix_mp->colorspace;
+	inst->ycbcr_enc = pix_mp->ycbcr_enc;
+	inst->quantization = pix_mp->quantization;
+	inst->xfer_func = pix_mp->xfer_func;
+
+	wave6_update_pix_fmt(&inst->dst_fmt, pix_mp->width, pix_mp->height);
+	wave6_update_crop_info(inst, 0, 0, pix_mp->width, pix_mp->height);
+
+	return 0;
+}
+
+static int wave6_vpu_enc_g_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_pix_format_mplane *pix_mp = &f->fmt.pix_mp;
+
+	pix_mp->width = inst->src_fmt.width;
+	pix_mp->height = inst->src_fmt.height;
+	pix_mp->pixelformat = inst->src_fmt.pixelformat;
+	pix_mp->field = inst->src_fmt.field;
+	pix_mp->flags = inst->src_fmt.flags;
+	pix_mp->num_planes = inst->src_fmt.num_planes;
+	for (int i = 0; i < pix_mp->num_planes; i++) {
+		pix_mp->plane_fmt[i].bytesperline = inst->src_fmt.plane_fmt[i].bytesperline;
+		pix_mp->plane_fmt[i].sizeimage = inst->src_fmt.plane_fmt[i].sizeimage;
+	}
+
+	pix_mp->colorspace = inst->colorspace;
+	pix_mp->ycbcr_enc = inst->ycbcr_enc;
+	pix_mp->quantization = inst->quantization;
+	pix_mp->xfer_func = inst->xfer_func;
+
+	return 0;
+}
+
+static int wave6_vpu_enc_g_selection(struct file *file, void *fh, struct v4l2_selection *s)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+
+	dev_dbg(inst->dev->dev, "%s: type %d target %d\n",
+		__func__, s->type, s->target);
+
+	if (!V4L2_TYPE_IS_OUTPUT(s->type))
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = inst->src_fmt.width;
+		s->r.height = inst->src_fmt.height;
+		break;
+	case V4L2_SEL_TGT_CROP:
+		s->r = inst->crop;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_s_selection(struct file *file, void *fh, struct v4l2_selection *s)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	u32 max_crop_w, max_crop_h;
+
+	if (!V4L2_TYPE_IS_OUTPUT(s->type))
+		return -EINVAL;
+
+	if (s->target != V4L2_SEL_TGT_CROP)
+		return -EINVAL;
+
+	if (!(s->flags & (V4L2_SEL_FLAG_GE | V4L2_SEL_FLAG_LE)))
+		s->flags |= V4L2_SEL_FLAG_LE;
+
+	if (s->flags & V4L2_SEL_FLAG_GE) {
+		s->r.left = round_up(s->r.left, W6_ENC_CROP_STEP);
+		s->r.top = round_up(s->r.top, W6_ENC_CROP_STEP);
+		s->r.width = round_up(s->r.width, W6_ENC_CROP_STEP);
+		s->r.height = round_up(s->r.height, W6_ENC_CROP_STEP);
+	}
+	if (s->flags & V4L2_SEL_FLAG_LE) {
+		s->r.left = round_down(s->r.left, W6_ENC_CROP_STEP);
+		s->r.top = round_down(s->r.top, W6_ENC_CROP_STEP);
+		s->r.width = round_down(s->r.width, W6_ENC_CROP_STEP);
+		s->r.height = round_down(s->r.height, W6_ENC_CROP_STEP);
+	}
+
+	s->r.left = clamp_t(s32, s->r.left, 0,
+			    inst->src_fmt.width - W6_MIN_ENC_PIC_WIDTH);
+	s->r.top = clamp_t(s32, s->r.top, 0,
+			   inst->src_fmt.height - W6_MIN_ENC_PIC_HEIGHT);
+
+	max_crop_w = inst->src_fmt.width - s->r.left;
+	max_crop_h = inst->src_fmt.height - s->r.top;
+
+	if (!s->r.width || !s->r.height)
+		return 0;
+	if (max_crop_w < W6_MIN_ENC_PIC_WIDTH)
+		return 0;
+	if (max_crop_h < W6_MIN_ENC_PIC_HEIGHT)
+		return 0;
+
+	s->r.width = clamp(s->r.width, W6_MIN_ENC_PIC_WIDTH, max_crop_w);
+	s->r.height = clamp(s->r.height, W6_MIN_ENC_PIC_HEIGHT, max_crop_h);
+
+	wave6_update_pix_fmt(&inst->dst_fmt, s->r.width, s->r.height);
+	wave6_update_crop_info(inst, s->r.left, s->r.top, s->r.width, s->r.height);
+
+	dev_dbg(inst->dev->dev, "V4L2_SEL_TGT_CROP %dx%dx%dx%d\n",
+		s->r.left, s->r.top, s->r.width, s->r.height);
+
+	return 0;
+}
+
+static int wave6_vpu_enc_encoder_cmd(struct file *file, void *fh, struct v4l2_encoder_cmd *ec)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	int ret;
+
+	dev_dbg(inst->dev->dev, "%s: cmd %d\n", __func__, ec->cmd);
+
+	ret = v4l2_m2m_ioctl_try_encoder_cmd(file, fh, ec);
+	if (ret)
+		return ret;
+
+	if (!wave6_vpu_both_queues_are_streaming(inst))
+		return 0;
+
+	scoped_guard(mutex, &inst->lock)
+		ret = v4l2_m2m_ioctl_encoder_cmd(file, fh, ec);
+	if (ret)
+		return ret;
+
+	if (ec->cmd == V4L2_ENC_CMD_START) {
+		vb2_clear_last_buffer_dequeued(v4l2_m2m_get_dst_vq(m2m_ctx));
+		v4l2_m2m_try_schedule(m2m_ctx);
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+
+	dev_dbg(inst->dev->dev, "%s: type %d\n", __func__, a->type);
+
+	if (!V4L2_TYPE_IS_OUTPUT(a->type))
+		return -EINVAL;
+
+	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	a->parm.output.timeperframe.numerator = 1;
+	a->parm.output.timeperframe.denominator = inst->enc_ctrls.frame_rate;
+
+	dev_dbg(inst->dev->dev, "%s: numerator : %d | denominator : %d\n",
+		__func__,
+		a->parm.output.timeperframe.numerator,
+		a->parm.output.timeperframe.denominator);
+
+	return 0;
+}
+
+static int wave6_vpu_enc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(file);
+	struct enc_controls *ctrls = &inst->enc_ctrls;
+
+	dev_dbg(inst->dev->dev, "%s: type %d\n", __func__, a->type);
+
+	if (!V4L2_TYPE_IS_OUTPUT(a->type))
+		return -EINVAL;
+
+	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
+	if (a->parm.output.timeperframe.denominator &&
+	    a->parm.output.timeperframe.numerator) {
+		ctrls->frame_rate = DIV_ROUND_CLOSEST(a->parm.output.timeperframe.denominator,
+						      a->parm.output.timeperframe.numerator);
+		ctrls->frame_rate = clamp(ctrls->frame_rate,
+					  MIN_FRAME_RATE, MAX_FRAME_RATE);
+	} else {
+		a->parm.output.timeperframe.numerator = 1;
+		a->parm.output.timeperframe.denominator = ctrls->frame_rate;
+	}
+
+	dev_dbg(inst->dev->dev, "%s: numerator : %d | denominator : %d\n",
+		__func__,
+		a->parm.output.timeperframe.numerator,
+		a->parm.output.timeperframe.denominator);
+
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops wave6_vpu_enc_ioctl_ops = {
+	.vidioc_querycap = wave6_vpu_enc_querycap,
+	.vidioc_enum_framesizes = wave6_vpu_enc_enum_framesizes,
+
+	.vidioc_enum_fmt_vid_cap = wave6_vpu_enc_enum_fmt_cap,
+	.vidioc_s_fmt_vid_cap_mplane = wave6_vpu_enc_s_fmt_cap,
+	.vidioc_g_fmt_vid_cap_mplane = wave6_vpu_enc_g_fmt_cap,
+	.vidioc_try_fmt_vid_cap_mplane = wave6_vpu_enc_try_fmt_cap,
+
+	.vidioc_enum_fmt_vid_out = wave6_vpu_enc_enum_fmt_out,
+	.vidioc_s_fmt_vid_out_mplane = wave6_vpu_enc_s_fmt_out,
+	.vidioc_g_fmt_vid_out_mplane = wave6_vpu_enc_g_fmt_out,
+	.vidioc_try_fmt_vid_out_mplane = wave6_vpu_enc_try_fmt_out,
+
+	.vidioc_g_selection = wave6_vpu_enc_g_selection,
+	.vidioc_s_selection = wave6_vpu_enc_s_selection,
+
+	.vidioc_g_parm = wave6_vpu_enc_g_parm,
+	.vidioc_s_parm = wave6_vpu_enc_s_parm,
+
+	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
+	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
+	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
+	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
+	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
+	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
+
+	.vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
+	.vidioc_encoder_cmd = wave6_vpu_enc_encoder_cmd,
+
+	.vidioc_subscribe_event = wave6_vpu_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static int wave6_vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct vpu_instance *inst = wave6_ctrl_to_vpu_inst(ctrl);
+	struct enc_controls *p = &inst->enc_ctrls;
+
+	dev_dbg(inst->dev->dev, "%s: name %s value %d\n",
+		__func__, ctrl->name, ctrl->val);
+
+	switch (ctrl->id) {
+	case V4L2_CID_HFLIP:
+		if (ctrl->val)
+			p->mirror_direction |= MIR_HOR;
+		else
+			p->mirror_direction &= ~MIR_HOR;
+		break;
+	case V4L2_CID_VFLIP:
+		if (ctrl->val)
+			p->mirror_direction |= MIR_VER;
+		else
+			p->mirror_direction &= ~MIR_VER;
+		break;
+	case V4L2_CID_ROTATE:
+		p->rotation_angle = ctrl->val;
+		break;
+	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
+		break;
+	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+		p->gop_size = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
+		p->slice_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB:
+		p->slice_max_mb = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+		p->bitrate_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_BITRATE:
+		p->bitrate = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
+		p->frame_rc_enable = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
+		p->mb_rc_enable = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
+		p->force_key_frame = true;
+		break;
+	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:
+		p->prepend_spspps_to_idr = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
+		break;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
+		p->intra_refresh_period = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
+		p->frame_skip_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
+		p->hevc.profile = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
+		p->hevc.level = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:
+		p->hevc.min_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:
+		p->hevc.max_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP:
+		p->hevc.i_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP:
+		p->hevc.p_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
+		p->hevc.b_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE:
+		p->hevc.loop_filter_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2:
+		p->hevc.lf_beta_offset_div2 = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2:
+		p->hevc.lf_tc_offset_div2 = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE:
+		p->hevc.refresh_type = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD:
+		p->hevc.refresh_period = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_CONST_INTRA_PRED:
+		p->hevc.const_intra_pred = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_STRONG_SMOOTHING:
+		p->hevc.strong_smoothing = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION:
+		p->hevc.tmv_prediction = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
+		p->h264.profile = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
+		p->h264.level = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
+		p->h264.min_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_MAX_QP:
+		p->h264.max_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
+		p->h264.i_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP:
+		p->h264.p_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP:
+		p->h264.b_frame_qp = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
+		p->h264.loop_filter_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA:
+		p->h264.loop_filter_beta = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA:
+		p->h264.loop_filter_alpha = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
+		p->h264._8x8_transform = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION:
+		p->h264.constrained_intra_prediction = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET:
+		p->h264.chroma_qp_index_offset = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
+		p->h264.entropy_mode = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_I_PERIOD:
+		p->h264.i_period = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
+		p->h264.vui_sar_enable = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC:
+		p->h264.vui_sar_idc = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH:
+		p->h264.vui_ext_sar_width = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT:
+		p->h264.vui_ext_sar_height = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE:
+		p->h264.cpb_size = ctrl->val;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_ctrl_ops wave6_vpu_enc_ctrl_ops = {
+	.s_ctrl = wave6_vpu_enc_s_ctrl,
+};
+
+static u32 to_video_full_range_flag(enum v4l2_quantization quantization)
+{
+	switch (quantization) {
+	case V4L2_QUANTIZATION_FULL_RANGE:
+		return 1;
+	case V4L2_QUANTIZATION_LIM_RANGE:
+	default:
+		return 0;
+	}
+}
+
+static u32 to_colour_primaries(enum v4l2_colorspace colorspace)
+{
+	switch (colorspace) {
+	case V4L2_COLORSPACE_SMPTE170M:
+		return 6;
+	case V4L2_COLORSPACE_REC709:
+	case V4L2_COLORSPACE_SRGB:
+	case V4L2_COLORSPACE_JPEG:
+		return 1;
+	case V4L2_COLORSPACE_BT2020:
+		return 9;
+	case V4L2_COLORSPACE_DCI_P3:
+		return 11;
+	case V4L2_COLORSPACE_SMPTE240M:
+		return 7;
+	case V4L2_COLORSPACE_470_SYSTEM_M:
+		return 4;
+	case V4L2_COLORSPACE_470_SYSTEM_BG:
+		return 5;
+	case V4L2_COLORSPACE_RAW:
+	default:
+		return 2;
+	}
+}
+
+static u32 to_transfer_characteristics(enum v4l2_colorspace colorspace,
+				       enum v4l2_xfer_func xfer_func)
+{
+	if (xfer_func == V4L2_XFER_FUNC_DEFAULT)
+		xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(colorspace);
+
+	switch (xfer_func) {
+	case V4L2_XFER_FUNC_709:
+		if (colorspace == V4L2_COLORSPACE_SMPTE170M)
+			return 6;
+		else if (colorspace == V4L2_COLORSPACE_BT2020)
+			return 14;
+		else
+			return 1;
+	case V4L2_XFER_FUNC_SRGB:
+		return 13;
+	case V4L2_XFER_FUNC_SMPTE240M:
+		return 7;
+	case V4L2_XFER_FUNC_NONE:
+		return 8;
+	case V4L2_XFER_FUNC_SMPTE2084:
+		return 16;
+	case V4L2_XFER_FUNC_DCI_P3:
+	default:
+		return 2;
+	}
+}
+
+static u32 to_matrix_coeffs(enum v4l2_colorspace colorspace,
+			    enum v4l2_ycbcr_encoding ycbcr_enc)
+{
+	if (ycbcr_enc == V4L2_YCBCR_ENC_DEFAULT)
+		ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(colorspace);
+
+	switch (ycbcr_enc) {
+	case V4L2_YCBCR_ENC_601:
+	case V4L2_YCBCR_ENC_XV601:
+		if (colorspace == V4L2_COLORSPACE_SMPTE170M)
+			return 6;
+		else
+			return 5;
+	case V4L2_YCBCR_ENC_709:
+	case V4L2_YCBCR_ENC_XV709:
+		return 1;
+	case V4L2_YCBCR_ENC_BT2020:
+		return 9;
+	case V4L2_YCBCR_ENC_BT2020_CONST_LUM:
+		return 10;
+	case V4L2_YCBCR_ENC_SMPTE240M:
+		return 7;
+	default:
+		return 2;
+	}
+}
+
+static void wave6_set_enc_h264_param(struct enc_codec_param *output,
+				     struct h264_enc_controls *ctrls)
+{
+	switch (ctrls->profile) {
+	case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+	case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
+		output->profile = H264_PROFILE_BP;
+		output->internal_bit_depth = 8;
+		break;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
+		output->profile = H264_PROFILE_MP;
+		output->internal_bit_depth = 8;
+		break;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED:
+		output->profile = H264_PROFILE_EXTENDED;
+		output->internal_bit_depth = 8;
+		break;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+		output->profile = H264_PROFILE_HP;
+		output->internal_bit_depth = 8;
+		break;
+	default:
+		break;
+	}
+	switch (ctrls->level) {
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+		output->level = 10;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
+		output->level = 9;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+		output->level = 11;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+		output->level = 12;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+		output->level = 13;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+		output->level = 20;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+		output->level = 21;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+		output->level = 22;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+		output->level = 30;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+		output->level = 31;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+		output->level = 32;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+		output->level = 40;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+		output->level = 41;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+		output->level = 42;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+		output->level = 50;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+		output->level = 51;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_2:
+		output->level = 52;
+		break;
+	default:
+		break;
+	}
+	output->qp = ctrls->i_frame_qp;
+	output->min_qp_i = ctrls->min_qp;
+	output->max_qp_i = ctrls->max_qp;
+	output->min_qp_p = ctrls->min_qp;
+	output->max_qp_p = ctrls->max_qp;
+	output->min_qp_b = ctrls->min_qp;
+	output->max_qp_b = ctrls->max_qp;
+	switch (ctrls->loop_filter_mode) {
+	case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED:
+		output->en_dbk = 0;
+		output->en_lf_slice_boundary = 0;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED:
+		output->en_dbk = 1;
+		output->en_lf_slice_boundary = 1;
+		break;
+	case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
+		output->en_dbk = 1;
+		output->en_lf_slice_boundary = 0;
+		break;
+	default:
+		break;
+	}
+	output->intra_period = ctrls->i_period;
+	output->beta_offset_div2 = ctrls->loop_filter_beta;
+	output->tc_offset_div2 = ctrls->loop_filter_alpha;
+	if (output->profile >= H264_PROFILE_HP)
+		output->en_transform8x8 = ctrls->_8x8_transform;
+	output->en_const_intra_pred = ctrls->constrained_intra_prediction;
+	output->cb_qp_offset = ctrls->chroma_qp_index_offset;
+	output->cr_qp_offset = ctrls->chroma_qp_index_offset;
+	if (output->profile >= H264_PROFILE_MP)
+		output->en_cabac = ctrls->entropy_mode;
+}
+
+static void wave6_set_enc_hevc_param(struct enc_codec_param *output,
+				     struct hevc_enc_controls *ctrls)
+{
+	switch (ctrls->profile) {
+	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN:
+		output->profile = HEVC_PROFILE_MAIN;
+		output->internal_bit_depth = 8;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
+		output->profile = HEVC_PROFILE_STILLPICTURE;
+		output->internal_bit_depth = 8;
+		output->en_still_picture = true;
+		break;
+	default:
+		break;
+	}
+	switch (ctrls->level) {
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
+		output->level = 10 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
+		output->level = 20 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
+		output->level = 21 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
+		output->level = 30 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
+		output->level = 31 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
+		output->level = 40 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
+		output->level = 41 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
+		output->level = 50 * 3;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
+		output->level = 51 * 3;
+		break;
+	default:
+		break;
+	}
+	output->qp = ctrls->i_frame_qp;
+	output->min_qp_i = ctrls->min_qp;
+	output->max_qp_i = ctrls->max_qp;
+	output->min_qp_p = ctrls->min_qp;
+	output->max_qp_p = ctrls->max_qp;
+	output->min_qp_b = ctrls->min_qp;
+	output->max_qp_b = ctrls->max_qp;
+	switch (ctrls->loop_filter_mode) {
+	case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED:
+		output->en_dbk = 0;
+		output->en_sao = 0;
+		output->en_lf_slice_boundary = 0;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED:
+		output->en_dbk = 1;
+		output->en_sao = 1;
+		output->en_lf_slice_boundary = 1;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
+		output->en_dbk = 1;
+		output->en_sao = 1;
+		output->en_lf_slice_boundary = 0;
+		break;
+	default:
+		break;
+	}
+	switch (ctrls->refresh_type) {
+	case V4L2_MPEG_VIDEO_HEVC_REFRESH_NONE:
+		output->decoding_refresh_type = DEC_REFRESH_TYPE_NON_IRAP;
+		break;
+	case V4L2_MPEG_VIDEO_HEVC_REFRESH_IDR:
+		output->decoding_refresh_type = DEC_REFRESH_TYPE_IDR;
+		break;
+	default:
+		break;
+	}
+	output->intra_period = ctrls->refresh_period;
+	if (output->idr_period) {
+		output->decoding_refresh_type = DEC_REFRESH_TYPE_IDR;
+		output->intra_period = output->idr_period;
+		output->idr_period = 0;
+	}
+	if (output->profile == HEVC_PROFILE_STILLPICTURE) {
+		output->gop_preset_idx = PRESET_IDX_ALL_I;
+		output->decoding_refresh_type = DEC_REFRESH_TYPE_IDR;
+		output->intra_period = 0;
+		output->idr_period = 0;
+	}
+	output->beta_offset_div2 = ctrls->lf_beta_offset_div2;
+	output->tc_offset_div2 = ctrls->lf_tc_offset_div2;
+	output->en_const_intra_pred = ctrls->const_intra_pred;
+	output->en_intra_smooth = ctrls->strong_smoothing;
+	output->en_temporal_mvp = ctrls->tmv_prediction;
+	output->num_ticks_poc_diff_one = DEFAULT_NUM_TICKS_POC_DIFF;
+	output->intra_4x4 = DEFAULT_INTRA_4X4;
+}
+
+static void wave6_set_enc_open_param(struct enc_open_param *open_param,
+				     struct vpu_instance *inst)
+{
+	struct enc_controls *ctrls = &inst->enc_ctrls;
+	struct enc_codec_param *output = &open_param->codec_param;
+	u32 ctu_size = (inst->std == W_AVC_ENC) ? 16 : 64;
+	u32 num_ctu_col = (ALIGN(inst->codec_rect.width, ctu_size) / ctu_size);
+	u32 num_ctu_row = (ALIGN(inst->codec_rect.height, ctu_size) / ctu_size);
+	u64 max_pic_bit = (u64)inst->dst_fmt.plane_fmt[0].sizeimage * 8;
+	const struct vpu_format *vpu_fmt;
+
+	vpu_fmt = wave6_find_vpu_fmt(inst->src_fmt.pixelformat, VPU_FMT_TYPE_RAW);
+	if (!vpu_fmt)
+		return;
+
+	open_param->src_fmt = vpu_fmt->fb_fmt;
+	open_param->source_endian = vpu_fmt->endian;
+	if (vpu_fmt->flags & VPU_FMT_FLAG_SUPPORT_ROT_MIR) {
+		open_param->mir_dir = inst->enc_ctrls.mirror_direction;
+		open_param->rot_angle = inst->enc_ctrls.rotation_angle;
+	}
+	open_param->inst_buffer.temp_base = inst->dev->temp_vbuf.daddr;
+	open_param->inst_buffer.temp_size = inst->dev->temp_vbuf.size;
+	open_param->inst_buffer.ar_base = inst->ar_vbuf.daddr;
+	open_param->pic_width = inst->codec_rect.width;
+	open_param->pic_height = inst->codec_rect.height;
+
+	output->gop_preset_idx = PRESET_IDX_IPP_SINGLE;
+	output->temp_layer_cnt = DEFAULT_TEMP_LAYER_CNT;
+	output->rc_initial_level = DEFAULT_RC_INITIAL_LEVEL;
+	output->pic_rc_max_dqp = DEFAULT_PIC_RC_MAX_DQP;
+	output->rc_initial_qp = DEFAULT_RC_INITIAL_QP;
+	output->qround_inter = DEFAULT_QROUND_INTER;
+	output->qround_intra = DEFAULT_QROUND_INTRA;
+
+	output->frame_rate = ctrls->frame_rate;
+	output->idr_period = ctrls->gop_size;
+	output->rc_mode = ctrls->bitrate_mode;
+	output->rc_update_speed = (ctrls->bitrate_mode) ? DEFAULT_RC_UPDATE_SPEED_CBR :
+							  DEFAULT_RC_UPDATE_SPEED_VBR;
+	output->en_rate_control = ctrls->frame_rc_enable;
+	output->en_cu_level_rate_control = ctrls->mb_rc_enable;
+	output->max_intra_pic_bit = min(max_pic_bit, MAX_INTRA_INTER_PIC_BIT);
+	output->max_inter_pic_bit = min(max_pic_bit, MAX_INTRA_INTER_PIC_BIT);
+	output->bitrate = ctrls->bitrate;
+	output->cpb_size = wave6_cpb_size_msec(ctrls->h264.cpb_size, ctrls->bitrate);
+	output->slice_mode = ctrls->slice_mode;
+	output->slice_arg = ctrls->slice_max_mb;
+	if (output->slice_mode == V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB) {
+		if (inst->std == W_AVC_ENC)
+			output->slice_arg = clamp(ctrls->slice_max_mb,
+						  AVC_MIN_SLICE_MAX_MB,
+						  num_ctu_col * num_ctu_row);
+		else
+			output->slice_arg = min(ctrls->slice_max_mb,
+						num_ctu_col * num_ctu_row);
+	}
+	output->forced_idr_header = ctrls->prepend_spspps_to_idr;
+	output->en_skip_frame = (ctrls->frame_skip_mode) ? 1 : 0;
+	if (ctrls->intra_refresh_period) {
+		output->intra_refresh_mode = INTRA_REFRESH_ROW;
+		if (ctrls->intra_refresh_period < num_ctu_row) {
+			output->intra_refresh_arg = (num_ctu_row + ctrls->intra_refresh_period - 1)
+						    / ctrls->intra_refresh_period;
+		} else {
+			output->intra_refresh_arg = 1;
+		}
+	}
+	output->sar.enable = ctrls->h264.vui_sar_enable;
+	output->sar.idc = ctrls->h264.vui_sar_idc;
+	if (output->sar.idc == V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED)
+		output->sar.idc = H264_VUI_SAR_IDC_EXTENDED;
+	output->sar.width = ctrls->h264.vui_ext_sar_width;
+	output->sar.height = ctrls->h264.vui_ext_sar_height;
+	output->color.color_range = to_video_full_range_flag(inst->quantization);
+	output->color.color_primaries = to_colour_primaries(inst->colorspace);
+	output->color.transfer_characteristics = to_transfer_characteristics(inst->colorspace,
+									     inst->xfer_func);
+	output->color.matrix_coefficients = to_matrix_coeffs(inst->colorspace, inst->ycbcr_enc);
+	output->conf_win.left = inst->crop.left - inst->codec_rect.left;
+	output->conf_win.top = inst->crop.top - inst->codec_rect.top;
+	output->conf_win.right = inst->codec_rect.width
+					- inst->crop.width - output->conf_win.left;
+	output->conf_win.bottom = inst->codec_rect.height
+					- inst->crop.height - output->conf_win.top;
+
+	switch (inst->std) {
+	case W_AVC_ENC:
+		wave6_set_enc_h264_param(output, &ctrls->h264);
+		break;
+	case W_HEVC_ENC:
+		wave6_set_enc_hevc_param(output, &ctrls->hevc);
+		break;
+	default:
+		break;
+	}
+}
+
+static int wave6_vpu_enc_create_instance(struct vpu_instance *inst)
+{
+	int ret;
+	struct enc_open_param open_param;
+
+	memset(&open_param, 0, sizeof(struct enc_open_param));
+
+	wave6_vpu_core_activate(inst->dev);
+	ret = pm_runtime_resume_and_get(inst->dev->dev);
+	if (ret) {
+		dev_err(inst->dev->dev, "runtime_resume failed %d\n", ret);
+		goto error_deactivate;
+	}
+
+	inst->ar_vbuf.size = ALIGN(W6_ARBUF_SIZE, 4096);
+	ret = wave6_vdi_alloc_dma(inst->dev->dev, &inst->ar_vbuf);
+	if (ret) {
+		dev_err(inst->dev->dev, "alloc ar of size %zu failed\n",
+			inst->ar_vbuf.size);
+		goto error_pm;
+	}
+
+	wave6_set_enc_open_param(&open_param, inst);
+
+	ret = wave6_vpu_enc_open(inst, &open_param);
+	if (ret) {
+		dev_err(inst->dev->dev, "failed create instance : %d\n", ret);
+		goto error_open;
+	}
+
+	dev_dbg(inst->dev->dev, "[%d] encoder\n", inst->id);
+
+	scoped_guard(spinlock, &inst->dev->inst_lock)
+		list_add_tail(&inst->list, &inst->dev->instances);
+	wave6_vpu_enable_instance(inst);
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_OPEN);
+
+	return 0;
+
+error_open:
+	wave6_vdi_free_dma(&inst->ar_vbuf);
+error_pm:
+	pm_runtime_put_sync(inst->dev->dev);
+error_deactivate:
+	wave6_vpu_core_deactivate(inst->dev);
+
+	return ret;
+}
+
+static int wave6_vpu_enc_initialize_instance(struct vpu_instance *inst)
+{
+	int ret;
+	struct enc_seq_info seq_info;
+	struct v4l2_ctrl *ctrl;
+
+	ret = wave6_vpu_enc_issue_seq_init(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "seq init fail %d\n", ret);
+		return ret;
+	}
+
+	ret = wave6_vpu_wait_interrupt(inst, W6_VPU_TIMEOUT);
+	if (ret) {
+		dev_err(inst->dev->dev, "seq init timeout\n");
+		return ret;
+	}
+
+	ret = wave6_vpu_enc_complete_seq_init(inst, &seq_info);
+	if (ret) {
+		dev_err(inst->dev->dev, "seq init error\n");
+		return ret;
+	}
+
+	dev_dbg(inst->dev->dev, "min_fb_cnt : %d | min_src_cnt : %d\n",
+		seq_info.min_frame_buffer_count,
+		seq_info.min_src_frame_count);
+
+	ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
+			      V4L2_CID_MIN_BUFFERS_FOR_OUTPUT);
+	if (ctrl)
+		v4l2_ctrl_s_ctrl(ctrl, seq_info.min_src_frame_count);
+
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_INIT_SEQ);
+
+	return 0;
+}
+
+static int wave6_vpu_enc_prepare_fb(struct vpu_instance *inst)
+{
+	int ret;
+	unsigned int fb_num;
+	unsigned int mv_num;
+	unsigned int fb_stride, fb_stride_c;
+	unsigned int fb_height;
+	unsigned int luma_size;
+	unsigned int chroma_size;
+	struct enc_seq_info *seq_info = &inst->codec_info->enc_info.seq_info;
+	struct enc_open_param *open_param = &inst->codec_info->enc_info.open_param;
+
+	fb_num = seq_info->min_frame_buffer_count;
+	mv_num = seq_info->req_mv_buffer_count;
+
+	fb_stride = ALIGN(inst->codec_rect.width, W6_FBC_BUF_ALIGNMENT);
+	fb_height = ALIGN(inst->codec_rect.height, W6_FBC_BUF_ALIGNMENT);
+	if (open_param->rot_angle == ROT_90 || open_param->rot_angle == ROT_270) {
+		fb_stride = ALIGN(inst->codec_rect.height, W6_FBC_BUF_ALIGNMENT);
+		fb_height = ALIGN(inst->codec_rect.width, W6_FBC_BUF_ALIGNMENT);
+	}
+	luma_size = fb_stride * fb_height;
+
+	fb_stride_c = ALIGN(fb_stride / 2, W6_FBC_BUF_ALIGNMENT);
+	chroma_size = fb_stride_c * fb_height;
+
+	for (unsigned int i = 0; i < fb_num; i++) {
+		struct frame_buffer *frame = &inst->frame_buf[i];
+		struct vpu_buf *vframe = &inst->frame_vbuf[i];
+
+		vframe->size = luma_size + chroma_size;
+		ret = wave6_vdi_alloc_dma(inst->dev->dev, vframe);
+		if (ret) {
+			dev_err(inst->dev->dev, "alloc FBC buffer fail : %zu\n",
+				vframe->size);
+			goto error;
+		}
+
+		frame->buf_y = vframe->daddr;
+		frame->buf_cb = vframe->daddr + luma_size;
+		frame->buf_cr = (dma_addr_t)-1;
+		frame->stride = fb_stride;
+		frame->stride_c = fb_stride_c;
+		frame->height = fb_height;
+		frame->map_type = COMPRESSED_FRAME_MAP;
+	}
+
+	ret = wave6_allocate_aux_buffer(inst, AUX_BUF_FBC_Y_TBL,
+					fb_stride, fb_height, fb_num);
+	if (ret)
+		goto error;
+
+	ret = wave6_allocate_aux_buffer(inst, AUX_BUF_FBC_C_TBL,
+					fb_stride, fb_height, fb_num);
+	if (ret)
+		goto error;
+
+	ret = wave6_allocate_aux_buffer(inst, AUX_BUF_MV_COL,
+					fb_stride, fb_height, mv_num);
+	if (ret)
+		goto error;
+
+	ret = wave6_allocate_aux_buffer(inst, AUX_BUF_SUB_SAMPLE,
+					fb_stride, fb_height, fb_num);
+	if (ret)
+		goto error;
+
+	ret = wave6_vpu_enc_register_frame_buffer(inst);
+	if (ret) {
+		dev_err(inst->dev->dev, "register frame buffer fail %d\n", ret);
+		goto error;
+	}
+
+	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_PIC_RUN);
+
+	return 0;
+
+error:
+	wave6_vpu_enc_release_fb(inst);
+
+	return ret;
+}
+
+static int wave6_vpu_enc_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
+				     unsigned int *num_planes, unsigned int sizes[],
+				     struct device *alloc_devs[])
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(q);
+	struct v4l2_pix_format_mplane inst_format =
+		(V4L2_TYPE_IS_OUTPUT(q->type)) ? inst->src_fmt : inst->dst_fmt;
+
+	dev_dbg(inst->dev->dev, "%s: num_buffers %d num_planes %d type %d\n",
+		__func__, *num_buffers, *num_planes, q->type);
+
+	if (*num_planes) {
+		if (inst_format.num_planes != *num_planes)
+			return -EINVAL;
+
+		for (unsigned int i = 0; i < *num_planes; i++) {
+			if (sizes[i] < inst_format.plane_fmt[i].sizeimage)
+				return -EINVAL;
+		}
+	} else {
+		*num_planes = inst_format.num_planes;
+		for (unsigned int i = 0; i < *num_planes; i++) {
+			sizes[i] = inst_format.plane_fmt[i].sizeimage;
+			dev_dbg(inst->dev->dev, "size[%d] : %d\n", i, sizes[i]);
+		}
+
+		if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+			struct v4l2_ctrl *ctrl;
+			unsigned int min_src_frame_count = 0;
+
+			ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
+					      V4L2_CID_MIN_BUFFERS_FOR_OUTPUT);
+			if (ctrl)
+				min_src_frame_count = v4l2_ctrl_g_ctrl(ctrl);
+
+			*num_buffers = max(*num_buffers, min_src_frame_count);
+		}
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_buf_prepare(struct vb2_buffer *vb)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
+
+	if (V4L2_TYPE_IS_CAPTURE(vb->type))
+		return 0;
+
+	for (unsigned int i = 0; i < vb->num_planes; i++) {
+		unsigned int offset = vb->planes[i].data_offset;
+		unsigned int size = inst->src_fmt.plane_fmt[i].sizeimage;
+
+		if (offset > vb2_plane_size(vb, i) ||
+		    vb2_plane_size(vb, i) - offset < size) {
+			dev_dbg(inst->dev->dev,
+				"plane %u: offset %u size %u length %lu\n",
+				i, offset, size, vb2_plane_size(vb, i));
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static void wave6_vpu_enc_buf_queue(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vpu_buffer *vpu_buf = wave6_to_vpu_buf(vbuf);
+
+	dev_dbg(inst->dev->dev, "type %4d index %4d size[0] %4ld size[1] : %4ld | size[2] : %4ld\n",
+		vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
+		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
+
+	vpu_buf->consumed = false;
+	vpu_buf->used = false;
+	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
+		vbuf->sequence = inst->queued_src_buf_num++;
+
+		vpu_buf->force_key_frame = inst->enc_ctrls.force_key_frame;
+		inst->enc_ctrls.force_key_frame = false;
+		vpu_buf->force_frame_qp = !inst->enc_ctrls.frame_rc_enable;
+		if (vpu_buf->force_frame_qp) {
+			if (inst->std == W_AVC_ENC) {
+				vpu_buf->force_i_frame_qp = inst->enc_ctrls.h264.i_frame_qp;
+				vpu_buf->force_p_frame_qp = inst->enc_ctrls.h264.p_frame_qp;
+				vpu_buf->force_b_frame_qp = inst->enc_ctrls.h264.b_frame_qp;
+			} else if (inst->std == W_HEVC_ENC) {
+				vpu_buf->force_i_frame_qp = inst->enc_ctrls.hevc.i_frame_qp;
+				vpu_buf->force_p_frame_qp = inst->enc_ctrls.hevc.p_frame_qp;
+				vpu_buf->force_b_frame_qp = inst->enc_ctrls.hevc.b_frame_qp;
+			}
+		}
+	} else {
+		inst->queued_dst_buf_num++;
+
+		if (vb2_is_streaming(vb->vb2_queue) &&
+		    v4l2_m2m_dst_buf_is_last(inst->v4l2_fh.m2m_ctx)) {
+			vb2_set_plane_payload(vb, 0, 0);
+			vbuf->field = V4L2_FIELD_NONE;
+			v4l2_m2m_last_buffer_done(inst->v4l2_fh.m2m_ctx, vbuf);
+			return;
+		}
+	}
+
+	v4l2_m2m_buf_queue(inst->v4l2_fh.m2m_ctx, vbuf);
+}
+
+static void wave6_vpu_enc_buf_finish(struct vb2_buffer *vb)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct vpu_buffer *vpu_buf = wave6_to_vpu_buf(vbuf);
+	struct v4l2_ctrl *ctrl;
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->type))
+		return;
+
+	ctrl = v4l2_ctrl_find(inst->v4l2_fh.ctrl_handler, V4L2_CID_MPEG_VIDEO_AVERAGE_QP);
+	if (ctrl)
+		v4l2_ctrl_s_ctrl(ctrl, vpu_buf->average_qp);
+}
+
+static int wave6_vpu_enc_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(q);
+	int ret = 0;
+
+	v4l2_m2m_update_start_streaming_state(inst->v4l2_fh.m2m_ctx, q);
+
+	if (inst->state == VPU_INST_STATE_NONE) {
+		ret = wave6_vpu_enc_create_instance(inst);
+		if (ret)
+			goto exit;
+	}
+
+	if (inst->state == VPU_INST_STATE_OPEN) {
+		ret = wave6_vpu_enc_initialize_instance(inst);
+		if (ret) {
+			wave6_vpu_enc_destroy_instance(inst);
+			goto exit;
+		}
+	}
+
+	if (inst->state == VPU_INST_STATE_INIT_SEQ) {
+		ret = wave6_vpu_enc_prepare_fb(inst);
+		if (ret) {
+			wave6_vpu_enc_destroy_instance(inst);
+			goto exit;
+		}
+	}
+
+exit:
+	if (ret)
+		wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_QUEUED);
+
+	return ret;
+}
+
+static void wave6_vpu_enc_stop_streaming(struct vb2_queue *q)
+{
+	struct vpu_instance *inst = vb2_get_drv_priv(q);
+
+	dev_dbg(inst->dev->dev, "[%d] %s, input %d, encode %d\n",
+		inst->id, V4L2_TYPE_IS_OUTPUT(q->type) ? "output" : "capture",
+		inst->queued_src_buf_num, inst->sequence);
+
+	if (inst->state == VPU_INST_STATE_NONE)
+		goto exit;
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		inst->queued_src_buf_num = 0;
+		inst->processed_buf_num = 0;
+		inst->error_buf_num = 0;
+		inst->sequence = 0;
+	} else {
+		inst->queued_dst_buf_num = 0;
+	}
+
+	if (V4L2_TYPE_IS_CAPTURE(q->type) && inst->state != VPU_INST_STATE_NONE)
+		wave6_vpu_enc_destroy_instance(inst);
+
+exit:
+	wave6_vpu_return_buffers(inst, q->type, VB2_BUF_STATE_ERROR);
+	v4l2_m2m_update_stop_streaming_state(inst->v4l2_fh.m2m_ctx, q);
+}
+
+static const struct vb2_ops wave6_vpu_enc_vb2_ops = {
+	.queue_setup = wave6_vpu_enc_queue_setup,
+	.buf_prepare = wave6_vpu_enc_buf_prepare,
+	.buf_queue = wave6_vpu_enc_buf_queue,
+	.buf_finish = wave6_vpu_enc_buf_finish,
+	.start_streaming = wave6_vpu_enc_start_streaming,
+	.stop_streaming = wave6_vpu_enc_stop_streaming,
+};
+
+static void wave6_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
+				     struct v4l2_pix_format_mplane *dst_fmt)
+{
+	const struct vpu_format *vpu_fmt;
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(0, VPU_FMT_TYPE_RAW);
+	if (vpu_fmt) {
+		src_fmt->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		src_fmt->num_planes = vpu_fmt->num_planes;
+		wave6_update_pix_fmt(src_fmt,
+				     W6_DEF_ENC_PIC_WIDTH, W6_DEF_ENC_PIC_HEIGHT);
+	}
+
+	vpu_fmt = wave6_find_vpu_fmt_by_idx(0, VPU_FMT_TYPE_CODEC);
+	if (vpu_fmt) {
+		dst_fmt->pixelformat = vpu_fmt->v4l2_pix_fmt;
+		dst_fmt->num_planes = vpu_fmt->num_planes;
+		wave6_update_pix_fmt(dst_fmt,
+				     W6_DEF_ENC_PIC_WIDTH, W6_DEF_ENC_PIC_HEIGHT);
+	}
+}
+
+static int wave6_vpu_enc_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
+{
+	struct vpu_instance *inst = priv;
+	int ret;
+
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->ops = &wave6_vpu_enc_vb2_ops;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->buf_struct_size = sizeof(struct vpu_buffer);
+	src_vq->drv_priv = inst;
+	src_vq->lock = &inst->dev->dev_lock;
+	src_vq->dev = inst->dev->v4l2_dev.dev;
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->ops = &wave6_vpu_enc_vb2_ops;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->buf_struct_size = sizeof(struct vpu_buffer);
+	dst_vq->drv_priv = inst;
+	dst_vq->lock = &inst->dev->dev_lock;
+	dst_vq->dev = inst->dev->v4l2_dev.dev;
+	ret = vb2_queue_init(dst_vq);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct vpu_instance_ops wave6_vpu_enc_inst_ops = {
+	.prepare_process = wave6_update_seq_param,
+	.start_process = wave6_vpu_enc_start_encode,
+	.finish_process = wave6_vpu_enc_finish_encode,
+};
+
+static int wave6_vpu_open_enc(struct file *filp)
+{
+	struct video_device *vdev = video_devdata(filp);
+	struct vpu_core_device *core = video_drvdata(filp);
+	struct vpu_instance *inst = NULL;
+	struct v4l2_ctrl_handler *v4l2_ctrl_hdl;
+	int ret;
+
+	inst = kzalloc_obj(*inst);
+	if (!inst)
+		return -ENOMEM;
+	v4l2_ctrl_hdl = &inst->v4l2_ctrl_hdl;
+
+	init_completion(&inst->irq_done);
+	INIT_DELAYED_WORK(&inst->task_timer, wave6_vpu_device_run_timeout);
+	mutex_init(&inst->lock);
+	inst->dev = core;
+	inst->type = VPU_INST_TYPE_ENC;
+	inst->ops = &wave6_vpu_enc_inst_ops;
+
+	v4l2_fh_init(&inst->v4l2_fh, vdev);
+	filp->private_data = &inst->v4l2_fh;
+	v4l2_fh_add(&inst->v4l2_fh, filp);
+
+	inst->v4l2_fh.m2m_ctx =
+		v4l2_m2m_ctx_init(core->m2m_dev, inst, wave6_vpu_enc_queue_init);
+	if (IS_ERR(inst->v4l2_fh.m2m_ctx)) {
+		ret = PTR_ERR(inst->v4l2_fh.m2m_ctx);
+		goto free_inst;
+	}
+
+	v4l2_ctrl_handler_init(v4l2_ctrl_hdl, 50);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE, 0,
+			       V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
+			       V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1, 0,
+			       V4L2_MPEG_VIDEO_HEVC_LEVEL_5);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
+			  0, 51, 1, 8);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP,
+			  0, 51, 1, 51);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP,
+			  0, 51, 1, 30);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_QP,
+			  0, 51, 1, 30);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP,
+			  0, 51, 1, 30);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE,
+			       V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY, 0,
+			       V4L2_MPEG_VIDEO_HEVC_LOOP_FILTER_MODE_ENABLED);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_LF_BETA_OFFSET_DIV2,
+			  -6, 6, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_LF_TC_OFFSET_DIV2,
+			  -6, 6, 1, 0);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_TYPE,
+			       V4L2_MPEG_VIDEO_HEVC_REFRESH_IDR,
+			       BIT(V4L2_MPEG_VIDEO_HEVC_REFRESH_CRA),
+			       V4L2_MPEG_VIDEO_HEVC_REFRESH_IDR);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_REFRESH_PERIOD,
+			  0, 2047, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_CONST_INTRA_PRED,
+			  0, 1, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_STRONG_SMOOTHING,
+			  0, 1, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_HEVC_TMV_PREDICTION,
+			  0, 1, 1, 1);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_PROFILE,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH, 0,
+			       V4L2_MPEG_VIDEO_H264_PROFILE_HIGH);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_LEVEL,
+			       V4L2_MPEG_VIDEO_H264_LEVEL_5_2, 0,
+			       V4L2_MPEG_VIDEO_H264_LEVEL_5_0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_MIN_QP,
+			  0, 51, 1, 8);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_MAX_QP,
+			  0, 51, 1, 51);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP,
+			  0, 51, 1, 30);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_QP,
+			  0, 51, 1, 30);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP,
+			  0, 51, 1, 30);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE,
+			       V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY, 0,
+			       V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA,
+			  -6, 6, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA,
+			  -6, 6, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM,
+			  0, 1, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION,
+			  0, 1, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_CHROMA_QP_INDEX_OFFSET,
+			  -12, 12, 1, 0);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
+			       V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC, 0,
+			       V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_I_PERIOD,
+			  0, 2047, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE, 0, 1, 1, 0);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC,
+			       V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED, 0,
+			       V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_UNSPECIFIED);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH,
+			  0, 0xFFFF, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT,
+			  0, 0xFFFF, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_HFLIP,
+			  0, 1, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_VFLIP,
+			  0, 1, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_ROTATE,
+			  0, 270, 90, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE,
+			  0, 18750000, 1, 0);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
+			       V4L2_MPEG_VIDEO_BITRATE_MODE_CBR, 0,
+			       V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_BITRATE,
+			  1000, 240000000, 1, 2097152);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE,
+			  0, 1, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE,
+			  0, 1, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_GOP_SIZE,
+			  0, 2047, 1, 30);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE,
+			       V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_MAX_MB, 0,
+			       V4L2_MPEG_VIDEO_MULTI_SLICE_MODE_SINGLE);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MAX_MB,
+			  1, 0x3FFFF, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME,
+			  0, 1, 1, 0);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR,
+			  0, 1, 1, 1);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE,
+			       V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
+			       BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM),
+			       V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD,
+			  0, 2160, 1, 0);
+	v4l2_ctrl_new_std_menu(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			       V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE,
+			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT,
+			       BIT(V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT),
+			       V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave6_vpu_enc_ctrl_ops,
+			  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 32, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, NULL,
+			  V4L2_CID_MPEG_VIDEO_AVERAGE_QP, 0, 51, 1, 0);
+
+	if (v4l2_ctrl_hdl->error) {
+		ret = -ENODEV;
+		goto err_m2m_release;
+	}
+
+	inst->v4l2_fh.ctrl_handler = v4l2_ctrl_hdl;
+	ret = v4l2_ctrl_handler_setup(v4l2_ctrl_hdl);
+	if (ret)
+		goto err_m2m_release;
+
+	wave6_set_default_format(&inst->src_fmt, &inst->dst_fmt);
+	inst->std = wave6_to_codec_std(inst->type, inst->dst_fmt.pixelformat);
+	wave6_update_crop_info(inst, 0, 0, inst->dst_fmt.width, inst->dst_fmt.height);
+	inst->colorspace = V4L2_COLORSPACE_DEFAULT;
+	inst->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	inst->quantization = V4L2_QUANTIZATION_DEFAULT;
+	inst->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+	inst->enc_ctrls.frame_rate = DEFAULT_FRAME_RATE;
+
+	return 0;
+
+err_m2m_release:
+	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+	v4l2_ctrl_handler_free(v4l2_ctrl_hdl);
+free_inst:
+	v4l2_fh_del(&inst->v4l2_fh, filp);
+	v4l2_fh_exit(&inst->v4l2_fh);
+	mutex_destroy(&inst->lock);
+	kfree(inst);
+
+	return ret;
+}
+
+static int wave6_vpu_enc_release(struct file *filp)
+{
+	struct vpu_instance *inst = wave6_file_to_vpu_inst(filp);
+
+	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+
+	if (inst->state != VPU_INST_STATE_NONE)
+		wave6_vpu_enc_destroy_instance(inst);
+
+	v4l2_ctrl_handler_free(&inst->v4l2_ctrl_hdl);
+	v4l2_fh_del(&inst->v4l2_fh, filp);
+	v4l2_fh_exit(&inst->v4l2_fh);
+	mutex_destroy(&inst->lock);
+	kfree(inst);
+
+	return 0;
+}
+
+static const struct v4l2_file_operations wave6_vpu_enc_fops = {
+	.owner = THIS_MODULE,
+	.open = wave6_vpu_open_enc,
+	.release = wave6_vpu_enc_release,
+	.unlocked_ioctl = video_ioctl2,
+	.poll = v4l2_m2m_fop_poll,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+int wave6_vpu_enc_register_device(struct vpu_core_device *core)
+{
+	struct video_device *vdev_enc;
+	int ret;
+
+	vdev_enc = video_device_alloc();
+	if (!vdev_enc)
+		return -ENOMEM;
+
+	strscpy(vdev_enc->name, VPU_ENC_DEV_NAME, sizeof(vdev_enc->name));
+	vdev_enc->fops = &wave6_vpu_enc_fops;
+	vdev_enc->ioctl_ops = &wave6_vpu_enc_ioctl_ops;
+	vdev_enc->release = video_device_release;
+	vdev_enc->v4l2_dev = &core->v4l2_dev;
+	vdev_enc->vfl_dir = VFL_DIR_M2M;
+	vdev_enc->device_caps = V4L2_CAP_VIDEO_M2M_MPLANE | V4L2_CAP_STREAMING;
+	vdev_enc->lock = &core->dev_lock;
+	video_set_drvdata(vdev_enc, core);
+
+	ret = video_register_device(vdev_enc, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		video_device_release(vdev_enc);
+		return ret;
+	}
+
+	core->video_dev_enc = vdev_enc;
+
+	return 0;
+}
+
+void wave6_vpu_enc_unregister_device(struct vpu_core_device *core)
+{
+	video_unregister_device(core->video_dev_enc);
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
index 75371566de38..cc17f43e5d2c 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
@@ -131,6 +131,12 @@ static bool wave6_vpu_valid_instance_transition(struct vpu_instance *inst,
 			    next == VPU_INST_STATE_INIT_SEQ ||
 			    next == VPU_INST_STATE_SEEK)
 				return true;
+		} else {
+			/* to NONE: instance destroyed */
+			/* to INIT_SEQ: encoder parameter configured */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_INIT_SEQ)
+				return true;
 		}
 		break;
 	case VPU_INST_STATE_INIT_SEQ:
@@ -142,6 +148,12 @@ static bool wave6_vpu_valid_instance_transition(struct vpu_instance *inst,
 			    next == VPU_INST_STATE_PIC_RUN ||
 			    next == VPU_INST_STATE_SEEK)
 				return true;
+		} else {
+			/* to NONE: instance destroyed */
+			/* to PIC_RUN: frame buffers registered */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_PIC_RUN)
+				return true;
 		}
 		break;
 	case VPU_INST_STATE_PIC_RUN:
@@ -155,6 +167,12 @@ static bool wave6_vpu_valid_instance_transition(struct vpu_instance *inst,
 			    next == VPU_INST_STATE_SEEK ||
 			    next == VPU_INST_STATE_ERROR)
 				return true;
+		} else {
+			/* to NONE: instance destroyed */
+			/* to ERROR: encode command failed, encode frame failed */
+			if (next == VPU_INST_STATE_NONE ||
+			    next == VPU_INST_STATE_ERROR)
+				return true;
 		}
 		break;
 	case VPU_INST_STATE_SEEK:
@@ -177,6 +195,10 @@ static bool wave6_vpu_valid_instance_transition(struct vpu_instance *inst,
 			if (next == VPU_INST_STATE_NONE ||
 			    next == VPU_INST_STATE_SEEK)
 				return true;
+		} else {
+			/* to NONE: instance destroyed */
+			if (next == VPU_INST_STATE_NONE)
+				return true;
 		}
 		break;
 	}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
index d5ecf381276d..57ead590e3f0 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
@@ -784,6 +784,7 @@ struct vpu_irq {
  * @instances:		List of VPU instances
  * @inst_lock:		Spinlock protecting instance list
  * @video_dev_dec:	Video device node for decoder
+ * @video_dev_enc:	Video device node for encoder
  * @dev_lock:		Mutex protecting video_device, src, dst vb2_queue
  * @hw_lock:		Mutex protecting register access
  * @attr:		Hardware attributes retrieved after boot
@@ -806,6 +807,7 @@ struct vpu_core_device {
 	struct list_head instances;
 	spinlock_t inst_lock; /* Protects instance list */
 	struct video_device *video_dev_dec;
+	struct video_device *video_dev_enc;
 	struct mutex dev_lock; /* Protects video_device, src, dst vb2_queue */
 	struct mutex hw_lock; /* Protects register access */
 	struct vpu_attr	attr;
-- 
2.41.0.windows.3

