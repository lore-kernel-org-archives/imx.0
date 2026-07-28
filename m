Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010004.outbound.protection.outlook.com [52.101.84.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BFD3C3C00
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 06:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221739; cv=fail; b=lUIHHvbjfT4ihRzscKEFKkR9KjP7tdni81N1l94OELCF73B1wyVh0lg5/8EhFaTZFpY3WRqiCxljdZpeLrndHDfLrObL8SFU6fO3RS4A/QUZWDXaHUYBhb9Njf8QUO2pkSSTDmJbb+j73iuuGSlQrFl/bPBsjbeKifGmu2tqA6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221739; c=relaxed/simple;
	bh=UbRq/OOJ2F2ls0ko25rwn4B6JMQOFmzA5nACc/fwwOs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XGMjoSqT4qjR6OSj2yWgLaEvsYGq7XwjHSHvuwrOTOWXpuI8doh3xr2BYTEmPC7pUrxoBo0SNVyWl2Dv7p14MAce3iBR9QmhfAcoxSTGoSdgp4Tmob4imVfYaU+M3IbXUbW6VyDS7+ZIRVt8SfNCDML1kJyIffYsQU9dkMRFViQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oUVOgEXt; arc=fail smtp.client-ip=52.101.84.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oUVOgEXt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+Q9Xwz31uliFLQ0TBMm3cDvNRadBZplmYBDBUCjL5fgl8+1YlW5oHquKW5/Le2OUzN1AubEGOMRP7m+KTddeDmJn+3nC7HO3W91MvxlEXsT6DTEPsiLtu7LH+Szh/Ol0/AwuKbbHI+W1SJl2MD6SlAbsQ8NVvfjvJWVLhreuOphIKf0TFKkdBFuWOO8QKmh1jMqbNX0VSD6QpTLVo3EwZNPJdkcEJVm5eJelTvOE3TNhUzd40s+DUKsm+R2365shVbOggnMAzJNDLAfutFVpb4rQh4p9Jpkb86F9l6U9pouqaDlA3WfW8Nhn1/bu6FlcOPonlTSAJwtEhlY0r0pLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cu4eDv5AIH1sGxzSDwjvOczLU2bT/vsSmeWPfPSymGI=;
 b=WwAB1dvXYnpb/oC9Nenj/xp5p00WlTGs+IX+yWLPM4Y/TXkxvjMfQwOl21ZQPs4axn62F1m6VWctFa8V4NZFIjm7xhXegQeMFX6Plmk6QRnfB5GzPMTdC95C4cpNva1SWFdQcJbE03Sa65sKTc1exy/UxU6XFEBnGH9o0qL5CMBhxDUQXoQfewa3jhD/h+QUW+SWBEBERUe+BbIqfCgWk4WxQMW/EZilrKMbvcgmzkxrXiNxJ+Cy0Xf/s6ugd/roRubc9vt+zY8dK+vNxuWv9Eli1biL8yMn3bCFXgTR5saeib6g2DRv3eemMCkE2RhwYOIqj/R6sLRL9uEN7fK6gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cu4eDv5AIH1sGxzSDwjvOczLU2bT/vsSmeWPfPSymGI=;
 b=oUVOgEXtTamKWY/D2bdVxeZUYTWFnn2wiJ6MrCOXsGWoVIB+th2i1pOeoaxCh00dtsRmyJEZt1RgJqhteQZZRYE5hgoMgbK34k5AnqqXYFpkKtJ43civznHzsArkboM+OgEWGCEkV6Hy/cEeQSuM4OobDNUDDnht2ffmxmhnVJiXqDQJ5J0XA6wANRTDpw/sysgevtyktLDiZchTJ88mKzSgomecRfCUqqsrAiFG/ShTWfKJMM3EXhNkcdGvIOhbvP2RB7FgJ7FllQ0pTFGkKxq59/ccsik8bn7VRaxUjXh4f/ms4D1TFyGUuM7LAQdUCjw4kMcaaAj5oOxm9ecXyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by AMDPR04MB11584.eurprd04.prod.outlook.com (2603:10a6:20b:71a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:55:34 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:55:34 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 28 Jul 2026 14:58:57 +0800
Subject: [PATCH v5 2/4] media: nxp: imx8-isi: Implement per-stream
 reference counting for multiplexed streams
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-isi-v5-2-1d22ab91602a@oss.nxp.com>
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com>
In-Reply-To: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785221945; l=7987;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=UbRq/OOJ2F2ls0ko25rwn4B6JMQOFmzA5nACc/fwwOs=;
 b=6wyk4oznDT3xpB7U8eAddxxfVJhGJXs81v7CxHo9NfKnSO8y+3CtTvOfTZe7kTd+jVluAHpCf
 g6B4SVKeHBMDPJACdcL7r40TafaC/zcgJiTf10LSuPZNSIjxgZvo1lE
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|AMDPR04MB11584:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4f2246-6e89-4d3e-b980-08deec7538fc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|19092799006|921020|11063799006|6133799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 ixmLcwbMwAi2+lg0Z78tQLaKT43oSYf69DPDKtZtZUzYMKTgl2xEwA8ggQX9ml7zaKgaZeUO69NCs76XKZWmdXPzcyPkKsMD+LnfMQgNkjIuxRrs/ynCwhWAX7RhT0Zj8iqpEbreVJXFX/12gNdG2l5USfs9VFS+J+R3my6Eu+v6V9WQCX+WfjfKhPBrpqKQV7RkfvXuD9f1RXw0dMN31m84j70bZzmM90SBh66zwZsX+XQkCnQ7tygGa4bcpT12qQCyarOvLy/LeyxL3RSQpU6rKCrGa30L7TBWjreoRctLxYsrL/mX2yelImuHw8JF67wgOPOlTn/DVqLsfYrmwrbJUD3ZIs7LI+1o/eoyP3k8a8J9PIfmFcrcVXAM+kQKx9c90xRQyI0E7VmP9LCn2BpoMLsrPUVJPLrsc86KMvM6AFxbX3Ja8FqycjpXlsRNIzpqc0ZaQi685DIaQDqfZ05qyUcFMP1KV2Wg3ifpnEiImZVwAGMNLONEa7nIeWxcXvSTkvi4Q6wx+SmuQJADbCSVx2YgHgjNGItQ3IpuENau/IQmEoB23jIROkIUiFjuziejzziHi1XPAcx+SggDoxokaOxpB8GLPFQOuw6ZKDqn1JcCbelyMIdxjqAMGCXkTmpAWO9M2QAcpspkgSWr0gzqhsrJnau07mHPXHJc4rTr9RTDm+smPLb865A9/bu9MoVI/v8Z5HV1/3qx5ILiGw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(19092799006)(921020)(11063799006)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?b2UyelIvbDRKTDIzRXNiZjA0YzN2cTd3T1dpaDdrcVhrajA4ejlpRzhZN1ZN?=
 =?utf-8?B?T2ZqQVBFVHJPWlluVDNQS25PMmEyRlhwa3BuT1A3aG5WdDZibHhBWU9xVVlG?=
 =?utf-8?B?MXVPWWlHT2poWjNtQlZrME42blo4cU1YU2lQOFVlQ21Id1RkZEpYY3Jmb2J0?=
 =?utf-8?B?VlYzTzM3YWxTZ2MzWGNTaG5Sa1dXSEk4ZEovTWUvdmN4eE0waHlSd3ZLblhF?=
 =?utf-8?B?L3J1ZHcrK01mR1Z1Y05sOFZHMy9xSVlhM1dHc0thOXlKdFRKS0lBd0hPNlU0?=
 =?utf-8?B?Y1JRSktPc3JZM0VodVpNSnBmZTZudFJxSUliWHpOajZ6cExKY1V4QVhnaE5w?=
 =?utf-8?B?OExjWENxcUlaancxR2NqWE5xWUV4SnNSTERyTmNsU00rMlJEL0JuTk1sTFBB?=
 =?utf-8?B?YkNkejFlZ2ZhQVZyaXEyY25KWTg0OFJaZnRPNEUwWVY3T3R3Nk1TMk8rTlR2?=
 =?utf-8?B?d2VUVUs3dDhXQXVMNWJjVWpPOE14bnFKVHZCM3pLTW9XTDBTa29YZFF5djI3?=
 =?utf-8?B?RlhwdGsyTCtGZ0Z1bVhwNENhcXdHeGNsRCtoRnpJRCtUTkxScURYc08vZ1dp?=
 =?utf-8?B?VkpFaUx6RW9wSllXRkNmZTFZQlB1VFJ5NS9wRjdUSUdtakd4SHB5TnA1ZXNv?=
 =?utf-8?B?UlpBaFUxYysyZXduMmxQY25YaUI2Q0VoRzAwTEpTZ1FJZjk5WFBhNERZak9r?=
 =?utf-8?B?REFvQjYrY21WcEJmYnpKS1ExVXNFaENyOGgydEhQcDdNTFF1OEZ0Y3lBYUdp?=
 =?utf-8?B?N0xsbFVOTlkzVi9KSVJsWHY3R2lPTVFmNXk1QXpHQ0JYRlFPN0IyMXRxVi91?=
 =?utf-8?B?YXNwYnJNUnpFWU40OUJwRGMwelhKL25HdDQrbk8xcW1wSFBGcUVVVkpWSWtr?=
 =?utf-8?B?dnNYSHA5czc1MUEzWlRNSm94c0p4WE5kc0lOa1VMVVpPZkhVK3FRMFpsNFdC?=
 =?utf-8?B?dEF4Tkd4SDYzNldjNVdoeUVZMnFJb1l3a2Z1SHVtZHNCbTUwM0pTaFd6OHBI?=
 =?utf-8?B?aGlPQ042cDl5Vzg1MW5ETU41c2R4dVdtbnVLZXFsejc0T3dIM2hGMHBkVSsw?=
 =?utf-8?B?TmdNTm95bTArTVN3c200VDN2WVQxc3lhdEJVSmVWaWNna211ektEczhwdUpJ?=
 =?utf-8?B?YXUrNnN5MkhQMXdVNTBXMU1wdGc0d0FLaGFQK1lieE1BNURDaXpwNkVkaDRB?=
 =?utf-8?B?NWhVZDJ6MzkrUU5EQmFuNThGUEZVbVdVWDdkdmlvZmJRY2tNK0JPREE4aERM?=
 =?utf-8?B?aHFoWCtDRFE4c0lUQ0hMMjVqUVRwdzBHd0tEMGVKS05KM2s4bStjTHM2Ny9J?=
 =?utf-8?B?eVdBdG1SODN2RHVRNUt3S1F0Vkc3VUJuSTkwMHgyKzZxMWpqdTlEdUwrVk4v?=
 =?utf-8?B?Yzl3WUdJQjNjRnVsV090eXp3cDhVZmlaQXVMckxyZmlyZ2lGVXV2MkZpWUJI?=
 =?utf-8?B?TkFreVNhZ1JSbnU3MkRWMjFZQnkyWFBiNkF3ZTlzRDZXSDhZVmdkeFBiRGpH?=
 =?utf-8?B?R08ydDcxOVlFbHlNWS9yOVo5ODFVQzdmS2ZiRWI0SHluS29KUEg1SWdHMWwv?=
 =?utf-8?B?MHA2amU1T20zSit0dmhmdS84Y053VzllWjBxSS9CN0FDM0RiNjFOMkpSYnVt?=
 =?utf-8?B?RXN1b3MyQkxmd1Y2UHB2T2dpeDBGUkE4WlN2Tm5WNmswSUREZlN4SWRXSSti?=
 =?utf-8?B?b1hIcWk5SmlDR1IyQkV2N2RaSmljNG1wQkM2VnVMWnlhVGNtTC9tQ1FuQU81?=
 =?utf-8?B?ME9MNlMwcGRnYnlWL1lXbDBubHRWVkI2ZjY2ZDdaUkdkSUdkTFU3SjB1dEha?=
 =?utf-8?B?QXEydDE1U0Y3eXhpMFZncGxIdzFLM2NjcHFiOFlOY3hBL2o3Zy9OMTNkTjFH?=
 =?utf-8?B?a1NvelYvcDA5a1lkY1RLd3dZQy81bWtHSjZzQXNQb1gyNnhBcW9tclE5RFFm?=
 =?utf-8?B?dXcrVmFnaEVlcGlQSGlscVJZTElxZ2J2cEtTOGpFRGMrS1lHTlM4a3ErVVJG?=
 =?utf-8?B?ZVV6SEpyUkRJcHlVUzdsbWlFTGR3M1R0UGY1MkkwdFdJTFpBclM4SURFdHZN?=
 =?utf-8?B?bFdiWHpteVVndG5tQmZsbmNKWGkwbDR5MDFvaXRTSy9SaUhwQitSTjFiYVlh?=
 =?utf-8?B?U3NKVVJkVm1KdGEzOWc3Qk0rZkVHU3BHOGZnQlhrUjRsTTgyRjBzUkxjeEox?=
 =?utf-8?B?UDhqeHVDai9zd2xKMWpiRHhCaTJjRWp5OVN2dlFMdVhKYXdpZVJxV0gzaWJV?=
 =?utf-8?B?YUhrVnl5ZVJ2TU15RUdYNjRoeHBpQVk2SUJPTEtxVFBXQ2NGUjA3MkVHc2pH?=
 =?utf-8?B?RkJLUWpWZC9Ea0lsV05pejY2bnhhQUl0RGx6UllKL2J6VEd2Um9rTExJdGwv?=
 =?utf-8?Q?ALX4taUQ8KHBQ5RKqF8oqdIAHYflSEln5M9w9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4f2246-6e89-4d3e-b980-08deec7538fc
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:55:34.6861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: abK3TQf595ajeW3hnjbz+JRP3fdwD61ji+UFBe+LEGcrb1T3N/8iKaAjRIMCmcr5O5BYh1uWqQ2cwWT16dDpwv28c1O2riR5jNyMXRfJ414zgSjEEDkV6gSaSd7KWDgF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11584

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
Changes in v4:
- Make enable/disable symmetric by checking stream_in_use
- Add mxc_isi_crossbar_stream_in_use() helper for both paths

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
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 84 ++++++++++++++++------
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    |  1 +
 3 files changed, 67 insertions(+), 23 deletions(-)

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
index 9db9c6e55c2c..eacc3bb28f9c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
@@ -330,11 +330,26 @@ static int mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
 	return __mxc_isi_crossbar_set_routing(sd, state, routing);
 }
 
+static bool mxc_isi_crossbar_stream_in_use(struct mxc_isi_crossbar *xbar,
+					   unsigned int sink_pad, u64 sink_streams)
+{
+	for (unsigned int i = 0; i < xbar->isi->pdata->num_channels; ++i) {
+		struct mxc_isi_pipe *pipe = &xbar->isi->pipes[i];
+
+		if (pipe->input == sink_pad &&
+		    pipe->input_stream == sink_streams)
+			return true;
+	}
+
+	return false;
+}
+
 static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
 					   struct v4l2_subdev_state *state,
 					   u32 pad, u64 streams_mask)
 {
 	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
+	struct mxc_isi_pipe *pipe = &xbar->isi->pipes[pad - xbar->num_sinks];
 	struct v4l2_subdev *remote_sd;
 	struct mxc_isi_input *input;
 	u64 sink_streams;
@@ -351,29 +366,44 @@ static int mxc_isi_crossbar_enable_streams(struct v4l2_subdev *sd,
 	input = &xbar->inputs[sink_pad];
 
 	/*
-	 * TODO: Track per-stream enable counts to support multiplexed
-	 * streams.
+	 * Check if any other pipe already receives the same input stream.
+	 * If so, just record this pipe's usage and return.
 	 */
-	if (!input->enable_count) {
+	if (mxc_isi_crossbar_stream_in_use(xbar, sink_pad, sink_streams)) {
+		pipe->input = sink_pad;
+		pipe->input_stream = sink_streams;
+		return 0;
+	}
+
+	/* Enable the gasket when the first stream is enabled for this input. */
+	if (!input->enabled_streams) {
 		ret = mxc_isi_crossbar_gasket_enable(xbar, state, remote_sd,
 						     remote_pad, sink_pad);
 		if (ret)
 			return ret;
+	}
 
-		ret = v4l2_subdev_enable_streams(remote_sd, remote_pad,
-						 sink_streams);
-		if (ret) {
-			dev_err(xbar->isi->dev,
-				"failed to enable streams 0x%llx on '%s':%u: %d\n",
-				sink_streams, remote_sd->name, remote_pad, ret);
-			mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
-			return ret;
-		}
+	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad, sink_streams);
+	if (ret) {
+		dev_err(xbar->isi->dev,
+			"failed to enable streams 0x%llx on '%s':%u: %d\n",
+			sink_streams, remote_sd->name, remote_pad, ret);
+		goto err_gasket_disable;
 	}
 
-	input->enable_count++;
+	input->enabled_streams |= sink_streams;
+
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
@@ -381,6 +411,7 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
 					    u32 pad, u64 streams_mask)
 {
 	struct mxc_isi_crossbar *xbar = to_isi_crossbar(sd);
+	struct mxc_isi_pipe *pipe = &xbar->isi->pipes[pad - xbar->num_sinks];
 	struct v4l2_subdev *remote_sd;
 	struct mxc_isi_input *input;
 	u64 sink_streams;
@@ -396,18 +427,27 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
 
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
+	if (mxc_isi_crossbar_stream_in_use(xbar, sink_pad, sink_streams))
+		return 0;
+
+	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad, sink_streams);
+	if (ret)
+		dev_err(xbar->isi->dev,
+			"failed to disable streams 0x%llx on '%s':%u: %d\n",
+			sink_streams, remote_sd->name, remote_pad, ret);
+
+	input->enabled_streams &= ~sink_streams;
 
+	if (!input->enabled_streams)
 		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
-	}
 
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

