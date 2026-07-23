Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A549B3EDE77
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 09:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797992; cv=fail; b=ICVJyIsI7Roc+vYiT41DHnsKrWx/JbJlW7SLoBm08mtRXtn71sPIxIye0MIf6i8vp+9JFf8oThP+nx92eJGaYqyBIInvLRaBWR7kef8BPtP1QXN6KrM3P6jc3TyLHr1fswHBbmBIoRCwDtUVkI7znQ7SdmOVEL6UXWkgT3mxtWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797992; c=relaxed/simple;
	bh=8zzJ60bO7QSwxOd3LElRmIwlR+JR4OzfKRPv2FmK04g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=A46WmHqb2Vt0z+x3ejD3tSEQJZvAOqBEFwfdTGF54J3hv/PHncn4CESf/MdIKFnaZlgHSGKRI5mrf6k2uQl7SwnCcRv4IYSRb0L1IymiF9SYB9kgyKPgjDcQIta+a74Xh9SkP80fcvjbismW8Gvv3qU6qZ9fVkdMyMxtmaeKHAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=un8nvMUB; arc=fail smtp.client-ip=52.101.84.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="un8nvMUB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0CZida88k5eKbkjABWq06/vhVT4o8L7lr8aU66OF7suOhCCPX8+ixEz8tPLjrfmWO2+GJbh7AWwA0U3bDzUyHAuQrq2njrKR5lHxVzcwK0QJcjFtLdN8kxfWkFMBVhRegM6dGh4dMvNpis0cyA0+MwWXBjGBbvSZTGe7iHhJZE9QwKVD6n2kGCCxbwC+TlMplsacKPO6YKlEseT2JbapdyntMxq9+o5V7siFGeCroJuBVYMpscEtMmHzo3bZrmc4LDwgLWNSPyJu8ehshtX1bSkcBmaU4MNHKsgdw2ML/AxJ6ushXYzm0ScN1c74UHDfU5NWsUMn/nmykznOJScBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7Mzpy5zdtXssn+L9P2YYF6sI1BaKmigGtB9zFmVXYM=;
 b=AIAPfso8uGw9plqwQ0wCaCG89JyVmKtqRAHye0hJFyQYDRUEi6b6j9HNIjfUaFdDqODjeTygsQjWvh7Mfn9FG0GnLqDnqw3Iwdhex38abcJfyKxMrSYrf6Q2d+yS7psDOV5FajBa60uqbZQVzWzmdBMJ5zstWvbBnXUfsSKks3BWSmurCXzyL+mEoj5KctybsIWu4M4ruo/Es8thQcaooJsfgKrhhYw30bm372XF/oNfiKjSgVkbvrNpHUb7bNWnlSxvLB6YdBcOz7r1gDIJal1gOaOaG8l8PVlG6MO1DMJmEy+WGgk9XwXKiFO2tbCFtiZJlaPuOuxsodAAxacZEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7Mzpy5zdtXssn+L9P2YYF6sI1BaKmigGtB9zFmVXYM=;
 b=un8nvMUB0mnMtd6IBJC1IInenYjWwN80tWdm1IzrF0zTqo0oNwcUN9U0k6kFd5piQgC0GiXoOwpG8v/7BLZS05y3aJ83aciY+DH67NB9yK5iutSpzaG0iOIHYQfA85tLgJ9+xPh8k0zD+sVslzXJk21nwfGqA43uw3i+IFzDtZOx0ls8pxiOjtZ0Y3QsHivvHQGBlNqsoGu1xT28BoKOcnSvkHIhlHLbKn8A00a8HAITR7nf5I+OXl6ziabmeEGP2e67+40kX5Q5iVfS6fM0scpRmdewe5pWQdEi10E1riytmzSElHZcWWNmodDd+nz+5xH8fH5I4a9uuMGPktChEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by DB8PR04MB6780.eurprd04.prod.outlook.com (2603:10a6:10:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:13:04 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 09:13:04 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 23 Jul 2026 17:16:37 +0800
Subject: [PATCH v3 1/3] media: nxp: imx8-isi: Implement per-stream
 reference counting for multiplexed streams
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-isi-v3-1-594919eae847@oss.nxp.com>
References: <20260723-isi-v3-0-594919eae847@oss.nxp.com>
In-Reply-To: <20260723-isi-v3-0-594919eae847@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784798197; l=7278;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=8zzJ60bO7QSwxOd3LElRmIwlR+JR4OzfKRPv2FmK04g=;
 b=P8cmNJsg2mXOkhHqIpxuRb0xE/YKRNDbdsGpGqsAVPZRKiMkmlGuSrr8EU9kkO6QOPJBmyX5d
 0+J3vwa2zzfAhhY75n8hrTo6tB0hoV994qVUsYwJFpust8yJdQC4wa8
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI3PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:295::13) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|DB8PR04MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 96231fcc-3d71-46c5-de24-08dee89a9a32
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|921020|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 VBi3NsVYVj3BDiurVAuMhTkYVVm88bd3Fe8ZDKACI4TfmdsTwtJBgyLEdl3SvZ0yWio/hXt8ruhKvwTjHAAOAqpPbh0iKJkSUTXwRBeZtUcvBsdbUlOFeETtXHyA3Ap3OBRXMgn6QBu6WBQ6nA6XxXd1UqIHzPVZoBfxr8BHnvVzu/uFBpSCUMo1czForn4Gbr5ghxgK09aei0tLEGz5sMIWkfmUwHnZuxo2yshEu3XLkpisB4C+ugSg2Yei7nsV0cZkwJPOnGriRUtG+lXVXTH0Ltjs/CuPoCJfHWIez0fZeD+qoYVGhHZs5rv4iAl4Ia+5Batkizq2MmJgpJ6GGcfpNluvUVX2XhUGPTIaMZKfFtXdCecMa+lv+XMhzjsAlgEuzTfv9OQc3s4Io65eNTG4v9kZHpXzEDsS9+yYFld9jJhEEGcPEvq0ZBy3c1HjrWi8BPVwm/LPGmtMhSIOaK8wBR+U1TZGtpiSxKJqcWdYFOq1PH2WNT8Ocuw76r4o6JE52PwInAHJ+HCg22RpHFaa+wYU0hZejEaYKB76WXjmJiCbNVJEdPaqOmveDK1JS+aJbDzcaQ/2sQEKG+1yDivoGAIFQBV/SI3mYAnx4eghhFvIJvUtWHGGR/KBmqYws93T6lt31xyBNQzn5eYOr+anGE/ddEeSw9/t4ND7TQz2NEHr5Arrbk2ICMh/zs+amWORY2ntryybRJXs0CWwsw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(921020)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NFlXZ25KMTNmdTdCVzQ5WmVBcjIraUJCcGRLalNwTnBFNXZaSDI1VWNkUkJs?=
 =?utf-8?B?bXJrVHRudmNxdEF4S3I5eTgzM1JLb25yN01ibTNMQ1lLWGUyc3RCTVhzMXVH?=
 =?utf-8?B?WWc3TnBTYkJpNTNzNlVTOWcwSFpadVh4VlBubFJBYm1YeGlFeHVZMmdMSHM3?=
 =?utf-8?B?TjQ2Y1Jybmo2RkZlYmNPNE5LR0lNT1lrNmV6M0VDdU1nTUY0TVc3N0p0RDdi?=
 =?utf-8?B?WEQ3bHoxN0NydTBSZDJTNjF1L0t1YzlQME91THVqaEUySXpwUHNzTmMyMHJ0?=
 =?utf-8?B?QlVtTW9haHJJY1pPRHo0L2huM3RDZ1ZnWDFSUVFaZk9YMUdPeTY4VkNGMU9w?=
 =?utf-8?B?ZkNSVm9hSDAzNEdYdE5MNTdLN1hxMXhTYks2NHo0QjU0cC90dSt6ZDZZYkIz?=
 =?utf-8?B?dGRpSXovN1FmemNtN1l5aWh6T2lXTXV4Vk9hVGV1T2IzRlVvY3RySVZiUm5X?=
 =?utf-8?B?dnc1aWd6TkZXazhLMUhXMDY2NEFONFZMdVBvdEJxTlE4alJiNnZoTzRJRFFn?=
 =?utf-8?B?VWdrb0llNUMwdC9qTWJGOGNPZExnUzRudUJac3lTRWR6YjlFcTRpdHovc2VJ?=
 =?utf-8?B?cjY2dFFNSWMxanJTSVQwNE12cllwVERXNEtpSHpjK0lJaHdOQjQ1OWtGbzhp?=
 =?utf-8?B?cm40Mk9iRWRxajcrNGh1czN1NVdLMzNIUnJRSE4wQk5kdVJlZmRiMEpsa3BU?=
 =?utf-8?B?MDFkcFYyWEFnanVCLzQvUGI1aHJ5djl0cklrMXF2YjZwUEIxVnl6aU40cWpQ?=
 =?utf-8?B?NkRxcGZRcFFGczN4UGtidWZjeG9JRy9ESHFzNlhWTjNCOEg5V09FdDRyNldC?=
 =?utf-8?B?Ly9uOGtBOXRneitVdDhMOUgrQnhSdGhPaXpJMnFnUjRCKzVHOWNvbkFYNEpK?=
 =?utf-8?B?Q1RRTS82VGdxQW5EM2toVERPMjU0ZkFCL3F2YmRsc0lzVU1WZFdNb2JHakhy?=
 =?utf-8?B?aEMrbGQxREJ0US9PVGZ1U1VDZ0p2dHVxVllQa0E2R2gxZU5KbG5rMWppdE5o?=
 =?utf-8?B?bDI5NitCdkNYdWpBT016UndrdFJvQ2c2MFRXall3RXBVaVk2bkFpK0NCYzl4?=
 =?utf-8?B?VFExSlIrWlk5aS8vUHJQWmlNaUxPZ3hsRkdnTlAxOTFpREpmQ0xkZkFuKzht?=
 =?utf-8?B?OEZneDJXUkxiTWF5UUFMMmFXQ1E4TXdPSWNQTFAwSS9hSnhpZW9hZFhBWjUw?=
 =?utf-8?B?b1luQjRzYlAzSXNaSlhhL0NUK0tIQzAyT0R0WW1pZk5JcS9PNWxmWE5iL2ts?=
 =?utf-8?B?L3RjMll3NzkwRUlzUjIwVlhrQXV3SjRiZmxKSGFRdGVoSTRrQUoxVitNMTRt?=
 =?utf-8?B?MDUwZHU1blVaNU96TjBoaUVCOHhVcmdsYlQwd3JIVU5LWVAxQ216cFFhNUxp?=
 =?utf-8?B?SlVsS2hKNEkyRVZBblJIUlpBbjhpNnlSNWx5citQeUZTK0NLY2liSG1ZcmFh?=
 =?utf-8?B?S0tVWHJyQTU4QlNKVG0vMU1wSyt4R3NUMWFqL0pYNEFyQWlueXFqTGtjL0dM?=
 =?utf-8?B?cUZLYUU2NTg5MTJ4OWpETVNaTEh0MXRKL1B4T3JWd0N6T29LWGs3elJpM2xS?=
 =?utf-8?B?U1dvKzVGTTZFUVIvNE8xV2tSZW9MSzBwNFJJdXI4SVlaUlYzaXpla0FJZWQz?=
 =?utf-8?B?WkUrYXk0MU4vczZCSFhUZVFUN2FpL3B0d0lNWm9jRU02UFNuck9GZVVGb2pM?=
 =?utf-8?B?VU5KYzhGc0hlTDBleXpmMFcyY0gwT2dTVnlGU0dPNGJ6WnY5aXNVa0pkSVNK?=
 =?utf-8?B?S3BPcjZ4dmtTRnhTanc3M2xtWDlueURUZDFvd1JaTGdrUjV6ckNVN2pWMmwz?=
 =?utf-8?B?bytPclVuaTYwRUtSWnZpZ1Y5YXFJS0swWXplcXBvNDg4R3diYmVVUVlkN0dP?=
 =?utf-8?B?ZHJjaUZ6b0tMTy9KdUswc0dobEhkU3I3NmlSVklkQ3NoUERidWpvWm5ick80?=
 =?utf-8?B?ZStPVEVtWWlsUXdGelBUcnF2eWhzZFJyZFI0aEltbGxPaVg1MHFmdGkwaWUv?=
 =?utf-8?B?ZC9Xbm92OHo5RzdvTTQrSHhnVm0rbjVrMGZ2a0VaRFpnelFEbnRFNUc2Ym0w?=
 =?utf-8?B?ZzNheEhQaExkRmRCcUdWK2dQUldBeHM5NXVGTzZ1YnlVcGw5V21yZVJEWkVT?=
 =?utf-8?B?cjZGM3VXdDh0NnVnVDRnOWd2UnNPai80ZG9sbXZpVnRIdjlmUFo5TU5ZbGV0?=
 =?utf-8?B?OWp6WUt2UWFqY1V5ZUFEYVQ5a0Q0YklCK3dxVWNoYTY3VlIrZ2hicjdFWjJX?=
 =?utf-8?B?RnhDcFduckNPQ2hCZU5yRUVQOE1HYjNVckNBT2NSNlQxc2FTeGI0VkppRlAv?=
 =?utf-8?B?YU53ODZjZGlWQWZ5Mmc4WHBYUCtQSkhWQk9HZi8yZjhuNGUyNExWdWp5Ykc4?=
 =?utf-8?Q?TrT3UnOUjAKINSJ45asql6xo8iMbT1LbbG2Sa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96231fcc-3d71-46c5-de24-08dee89a9a32
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:13:04.5490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zyCuTa7EfVh+HGTBrE2qbYoO+ChTng+45dramYHaU8vYImZGRCaRfVLl9NqrzypGIv7OKyWH5x65l4VnccsPA5UjilwGWPfmM5PNxYmXbM+2cYcFjbg8/P5TOMzJvbjZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6780

The ISI crossbar needs to properly enable multiple streams from different
virtual channels on the same input pad. Currently only the first stream
gets enabled in hardware, subsequent streams are silently ignored.

The driver uses a single enable_count per input to track the input state.
When enable_count is non-zero, the code assumes the input is already active
and skips calling v4l2_subdev_enable_streams() for additional streams:

  Call 1: enable_streams(stream 0)
    -> enable_count == 0, enable gasket and stream 0 in hardware
    -> enable_count = 1

  Call 2: enable_streams(stream 1)
    -> enable_count == 1, skip hardware enable
    -> enable_count = 2
    -> stream 1 never gets enabled

Similarly on disable, when enable_count reaches zero, ALL streams are
disabled regardless of which streams are actually still active.

Implement per-stream state tracking by storing the input index and stream
mask in the mxc_isi_pipe structure. On enable, record which input and
stream the pipe is receiving. On disable, clear the pipe's record and
check if any other pipe is still using the same input stream before
actually disabling it.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Change from "Fix" to "Implement" as multi-stream support is for newer
  SoCs not present when the driver was merged (Laurent)
- Remove Fixes and Cc: stable tags (Laurent)
- Store input/input_stream in mxc_isi_pipe instead of using per-stream
  counters array, avoiding arbitrary 64-entry limit (Laurent)
- Use UINT_MAX to mark pipe as inactive to distinguish from valid pad 0

Changes in v2:
- Use fixed-size array for enabled_count instead of dynamic allocation
- Use BIT_ULL() macro for u64 bitmask operations
- Use MXC_ISI_MAX_STREAMS (64) as loop boundary instead of num_sources
- Remove mxc_isi_stream_counters_alloc/free functions
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  5 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 66 +++++++++++++++-------
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  1 +
 3 files changed, 52 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 9bb4d430d15e..c07abdd6a1f0 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -186,7 +186,7 @@ struct mxc_isi_dma_buffer {
 };
 
 struct mxc_isi_input {
-	unsigned int			enable_count;
+	u64				enabled_streams;
 };
 
 struct mxc_isi_crossbar {
@@ -259,6 +259,9 @@ struct mxc_isi_pipe {
 	u8				acquired_res;
 	u8				chained_res;
 	bool				chained;
+
+	unsigned int			input;
+	u64				input_stream;
 };
 
 struct mxc_isi_m2m {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
index 9f0231ca47a3..6bd61bfb15d6 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -335,8 +335,10 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
 					   u32 pad, u64 streams_mask)
 {
 	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
+	struct mxc_isi_pipe *pipe = &xbar->isi->pipes[pad - xbar->num_sinks];
 	struct v4l2_subdev *remote_sd;
 	struct mxc_isi_input *input;
+	u64 streams_to_enable;
 	u64 sink_streams;
 	u32 sink_pad;
 	u32 remote_pad;
@@ -350,30 +352,41 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
 
 	input = &xbar->inputs[sink_pad];
 
-	/*
-	 * TODO: Track per-stream enable counts to support multiplexed
-	 * streams.
-	 */
-	if (!input->enable_count) {
+	/* Enable the gasket when the first stream is enabled for this input. */
+	if (!input->enabled_streams) {
 		ret = mxc_isi_crossbar_gasket_enable(xbar, state, remote_sd,
 						     remote_pad, sink_pad);
 		if (ret)
 			return ret;
+	}
+
+	/* Only enable streams that are not already enabled. */
+	streams_to_enable = sink_streams & ~input->enabled_streams;
 
+	if (streams_to_enable) {
 		ret = v4l2_subdev_enable_streams(remote_sd, remote_pad,
-						 sink_streams);
+						 streams_to_enable);
 		if (ret) {
 			dev_err(xbar->isi->dev,
 				"failed to enable streams 0x%llx on '%s':%u: %d\n",
-				sink_streams, remote_sd->name, remote_pad, ret);
-			mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
-			return ret;
+				streams_to_enable, remote_sd->name, remote_pad, ret);
+			goto err_gasket_disable;
 		}
+
+		input->enabled_streams |= streams_to_enable;
 	}
 
-	input->enable_count++;
+	/* Record the input and stream for this pipe. */
+	pipe->input = sink_pad;
+	pipe->input_stream = sink_streams;
 
 	return 0;
+
+err_gasket_disable:
+	if (!input->enabled_streams)
+		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
+
+	return ret;
 }
 
 static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
@@ -381,6 +394,7 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
 					    u32 pad, u64 streams_mask)
 {
 	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
+	struct mxc_isi_pipe *pipe = &xbar->isi->pipes[pad - xbar->num_sinks];
 	struct v4l2_subdev *remote_sd;
 	struct mxc_isi_input *input;
 	u64 sink_streams;
@@ -396,19 +410,33 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
 
 	input = &xbar->inputs[sink_pad];
 
-	input->enable_count--;
+	/* Clear the input and stream for this pipe. */
+	pipe->input = UINT_MAX;
+	pipe->input_stream = 0;
 
-	if (!input->enable_count) {
-		ret = v4l2_subdev_disable_streams(remote_sd, remote_pad,
-						  sink_streams);
-		if (ret)
-			dev_err(xbar->isi->dev,
-				"failed to disable streams 0x%llx on '%s':%u: %d\n",
-				sink_streams, remote_sd->name, remote_pad, ret);
+	/*
+	 * Check if any other pipe receives the same input stream. If so we
+	 * can't disable it yet, so return immediately.
+	 */
+	for (unsigned int i = 0; i < xbar->isi->pdata->num_channels; ++i) {
+		struct mxc_isi_pipe *pipe = &xbar->isi->pipes[i];
 
-		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
+		if (pipe->input == sink_pad &&
+		    pipe->input_stream == sink_streams)
+			return 0;
 	}
 
+	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad, sink_streams);
+	if (ret)
+		dev_err(xbar->isi->dev,
+			"failed to disable streams 0x%llx on '%s':%u: %d\n",
+			sink_streams, remote_sd->name, remote_pad, ret);
+
+	input->enabled_streams &= ~sink_streams;
+
+	if (!input->enabled_streams)
+		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
+
 	return ret;
 }
 
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index 16085f23bc0b..c0ec59856374 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -816,6 +816,7 @@ int mxc_isi_pipe_init(struct mxc_isi_dev *isi, unsigned int id)
 	pipe->acquired_res = 0;
 	pipe->chained_res = 0;
 	pipe->chained = false;
+	pipe->input = UINT_MAX;
 
 	sd = &pipe->sd;
 	v4l2_subdev_init(sd, &mxc_isi_pipe_subdev_ops);

-- 
2.34.1

