Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763E935C690
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 04:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787719960; cv=fail; b=r2ur2iW3tTaXry6FfcInolBk4SWH6w7TVm+uem1V2NW2ZGul4HaJ/VhWylWQ3b1rCM+2qeOZcxqYBmrZ0PcTvo0Ulpk/ttEd1zaJ572Iy+l0HpBoC0Wi0FwoHMJ+pmcon2nvDmxHLS5tkhnyqe0TGMuTV3C/kW9mtojojA1hUyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787719960; c=relaxed/simple;
	bh=hkjb6P38Bm6OpNtUTjJtCJfkOw7GQGZbEOsSWRRPlbc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DQOhiPKFiirqmFIk08U2ofxV4sOvJybVY3zhwS2rqptHK7gQCs9gjryobh7FSvp2+jOXCq0SjpirxNoO//2ycx8UKWL0zYuASbsyhqAy1s+PagLJc2YRyXzBXLevzl1fbdUw+R6V4hWTYpMBOykzvHGKHG0YwEtqtJ5R0XVZ6z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sKfltz/9; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sKfltz/9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbugL9n5tc0NFtQBQ7R0chMnaFBrgt6PLRCM5hEqJRwI/CwP3LICyAZiYK4jLWinX6bF1qFzdPtjywGiumFZk+PjWg0oSejU9J9ZQ61YeTUxPNQj7+0sEnNhOvTdaFV9Hzoq6QvK8em/7cA9yKJheZt12/oIyEVPmQrnjmHkSJOQP3gYN1AaRzxjBkJyCJl2C9vPhIjoUIHC3NDE/blQJw6b8YU7Cp08LJthBIHMlx4A9pfLSXZ+E7BXp7nH1qxpvbfNVrWtud9av33c7mhfpQaKmStiXWlQdfgK/At4ie2nCDWkPW2Yb1pQkzjJG2IkB7jnFNw0MVJy2vO4h7IUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfQPXvVwZ1cK7B9byDcDDre3mOgfoQuWibVJPpcXY1M=;
 b=Mo2gcsrvXadGodf1fU5EiHvL8qZj8ZLqfZblj4Sl45736PE4we01n7a6aqB/pXsqszFG11bMOVQAH2d6Zp0+lVN1V8HG1JcwipEjM+8GP/jJPiydrzlvbkF1xQvQFCSLWgv+IxXRWkP8qtN8XdKRPUliPL6xnS4YDSIMmmgzM5sKQ0GGF3SsQ1LYkZ73TT4NvhR4Bu+0WL8D8NXaVx55Q0L5E3doR0R5eN6+AwVBmEOy6MZoRNjTQGv9QZT2F8CnGhqSFwAEUJ4fQBSbkoPengfRIbHkko4MP39v2eCWIc/Lzbh6y9Bu9cw8pAcef9jKZSJzssgBbpfTJ/yd5QpF3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfQPXvVwZ1cK7B9byDcDDre3mOgfoQuWibVJPpcXY1M=;
 b=sKfltz/9AU0ZXVVPfeMHMdbMci6x5RsJdbTVTbVhaDl1mji6wDCIMspkJwpeEJcwx0Pm+OhsldolGjb1oUjcMkw+c+0V7tJzEbLTcPyicNQZ+BTeaXhv95TmO8rA2nTJgJG70FX4uKpc0e7Gc4ywjSOruImg9ZFMC6JFwbxNpwOFDPM2IXeqEV1eAvMcnazzMi3GasmwaObdm1+yIWfDEh+XrCc+4JjdNyJLY/Qi1YnMrZHKxQTmGl6WJepFQ6TOdGOHeSYUv/KtFSi6CoiX71wLVCr7vfh/y7f9yrO4u7lq5e9aMtkXfq9tj4YzHhBAyyuveSJK6rR3ujKo4eYi4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by DU2PR04MB8853.eurprd04.prod.outlook.com (2603:10a6:10:2e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 04:52:24 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 04:52:24 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 26 Aug 2026 12:55:46 +0800
Subject: [PATCH 5/5] media: imx8-isi: Enable ISI RAW10/12/14 output LSB
 alignment
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-isi_imx952-v1-5-cbfaaa3f0000@oss.nxp.com>
References: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
In-Reply-To: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787720155; l=12206;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=hkjb6P38Bm6OpNtUTjJtCJfkOw7GQGZbEOsSWRRPlbc=;
 b=AIUxUOBftntoyhUOk2GRTpieUu+0eQT4akfBIeEm+zgTy9/8fPwIRC3xT5pF+p38DsvDGnwZf
 /G7PHW0SodDCkvY9QQXJQHtwrKv1TnQSyEdqznUiJJqT96dO4FGcLSE
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:4:186::23) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|DU2PR04MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: b1847178-4df0-4f76-3f04-08df032dd1fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|19092799006|1800799024|366016|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	8pfc+XbQvVp/Aswnnyaf6aD/HgoDDzkZ5MKOBbtEPjahxiLDUBbk1WXD/gdWiwX4A4WGFdZvKZ0gaRhGRDFz2nVxuWwgBnmIRJGNDPojvO6E4HA1ivnHQwMngfxkENZHbZBlNWpiiYPtI79uTT7wHivLftuUrNVjAO3rdMgnLJZaTsbVqcpaBP+MUV7jENdt6vkE4/bmKIuizgeeCClcNfZ8de4v5Ef5eMjYxUw0PkxONjSwFmUWSF90TJvS0/RpFRZpZBq9DO6DeJepXubYEDPvXZ+dKC2fTHNF4GyMG/fq2CbliHl6jUG5M4xCmVUhUQxZXG3BoM0cWsOEZ//00+lJRT/J0GKehz1T5AgXtrf9EW5qfKBmvHEwKGZIXBDLI/rZXym+Hf5lEBq6OKbYAK6nW3z71eELYodET9jgT3UCdmpijitghUre6chfe1lRwJzHCvg3SeVFkpMu4bjhOrEXO8wd5qsl04Da8o/h+Y9ovFUghzRWYjGaTmLb4tFMR9V/QY9YEoaCAYiDPsQFuzUajMY5Yl4Xr9RmE9CvYdNEHS+tt3AYGxt9tMo21uqbA9/cYF3XPWjJyfhwXuAMyw5EsxVjXnMMM/5MomsCABbZs8WUVJeV9DPQE1JTqGWKvfwij8osW515Y0e7o38gS2frHZta6Ogl1dgqcYDqo3lpJoZFz162MQk+3YGzRuh+2JY4v5c0tHctKzxpMxxniw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(19092799006)(1800799024)(366016)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TG5MaExZZjhjdlNqYi9TY05iYlhGQzR2dHV5LzlhSlovaXMzNkJObVdZTHp4?=
 =?utf-8?B?QVdwWW1pK0txVzFUbDc1YUFsM3hHVGNPTjNSbEdncVFEWFY5SWE3bTlNTVBp?=
 =?utf-8?B?M3h1WU42MHpJclNSSDQvVHUyemxiNHlWc0VzelpQdVd2SWtiZkxNTmtXNlFm?=
 =?utf-8?B?Vlp0SDMzeTAwY0lObGlIaUdTc0RpczBLMS9BaExXMUtVbTgzMTF3d1lFNkFV?=
 =?utf-8?B?cldOaU50THRvcnVBVGI1MWRhbk9BK20vRElXdldkSmF1WjQ5RWZpNmpQcTZs?=
 =?utf-8?B?dGd1bGs4NlBxWEhSMVpnTU1LbzRJS0s0VXA3Yk1MT0trRUg1MFJ1QWtOU0Fp?=
 =?utf-8?B?NEZ0ZGVtUnFPYkdoZklmcHBSUjJwaVR3TXVZZFVZT2haVWdHY3cwMkNoa1lr?=
 =?utf-8?B?T0l1TWxDaTJGQmE1c3JxSHJTbi9VVGdqQmhVYzNUZS9ULzB3ZjBheE9ndmlP?=
 =?utf-8?B?NUY1YytFSk5SUExZUmo4RXRsWFQ0SmpqNjNQaC9lcU80eXIreGd3bTR5eHRV?=
 =?utf-8?B?TVpTV0trSGtSSFlJYVhvc1ExU3ZWeDRoZTJoUVhpZFhlancvZ1VUWC9GUEJv?=
 =?utf-8?B?L2o0aUFOa091dEMyeXRsMjBxcTdvaHRxb2FlSGptNEdIbGFXZlRRNlFrR3Ix?=
 =?utf-8?B?MFRwbjRYRklMSjFWRG9YNEdWSE1WL1lFcUVIenhaQ0xhQkdFYzROcUdKMDFB?=
 =?utf-8?B?TEFZd203MTQyTyt5bkFzQUVhc1dHOWw1UkFURmVCTCtpT01iNlIzZXA3OFJO?=
 =?utf-8?B?L3hETFg0UmllOUJsS25xRGJ5QU5mSUNsWWxDOW5PZ2FMSXFzaHVQQ3hmR0Zi?=
 =?utf-8?B?cklGRHJBTno5dzVxdzdjcG4yV1RQOFA4cFc1eXlkaU83Q2E2T0IyUmR5cXFY?=
 =?utf-8?B?K0ErczJkemViUmExTjVSdm9sekE5aTQwak1tTUJnUllQYVpiUmFmYjJyUldH?=
 =?utf-8?B?WGVQM056WGl3QWRZdWFhMEoySWlMMFh2UzZVaTJzcXZJSUlQTTAyUHNIUEI2?=
 =?utf-8?B?RS9iRVZtdk50Z0ZBcitQQXlHVlJFUDA2VGh4eEp4R3JFVUIxNjVxWUZFSFd0?=
 =?utf-8?B?bU1SbGVMWU5OVW1HVEpNNFdOb3llblBqUzJIVXVFRGlJbFphS0RORmlvUFY1?=
 =?utf-8?B?YWhBalN6a2JDQWw5aDJxRWdHb1A2MDF6TUM2T2NyWFVWVjEzamhDd0YzWi9x?=
 =?utf-8?B?cjB2bmZhVzFTd3daQ1o5M2Q2b2s5N3c2ZCtmMEVPa04rcWlKRkZiREsyNUVP?=
 =?utf-8?B?QmY4eTdHRWdCWktoMExnN3lZMmZEeC9KMXV3dGlJeUJ2R3FuRTlOYlVUZ3FE?=
 =?utf-8?B?WXNKOUxHQW9SRzUvdmdIQm82K3d2KzYwdlk0eG1XK3hTVDB3bHIyRXZZalhL?=
 =?utf-8?B?WVJOazB2RTEzWFhGclRuemZQYWpOOUVoUHNMN0dxeWNscEZYYkZ5cGN6bDla?=
 =?utf-8?B?bXp1NjNyZEthZTlRMUUrNjlxejlqSXZnTjdsQ1pIb3FzMkR5UTNubDZCMkxC?=
 =?utf-8?B?TWpIWDR4Q3Q2MzVWMlRpcXVaa3BNVWFRWUlrQS9mR05MaVVTQ2txUDc1RGVP?=
 =?utf-8?B?RGRIaWIveWVacGdsYjMyL0lXaEI3b1hrYVY5WU1xSzBpdHNPd0VpTVFGREN3?=
 =?utf-8?B?VGhyUzhsVjcxQWJQcitSaGh1WFlaSVV5NWQzUVFWMi8xSlJCbWZ5alZqZ1gx?=
 =?utf-8?B?aVFGMDkwcUkxRXVnZWQvY3N3SHNzdHdTVzJpQjUwaXo2MXZrbHdPSlBPUEN3?=
 =?utf-8?B?eTJ5alByWlN4QVNXS1ZMajAvd2JiTFQybjhTQWNWaFplN21OR1pSTlU2b0hY?=
 =?utf-8?B?MjFYS1RrUm9TUjdPWkdRTnEwMVdUT2xvVVBDQTc0QmhnaWFQd3lSdndGNWVQ?=
 =?utf-8?B?cUNMbTVKM0ZpQk53aHUxcVVhQlNML1M2MUQwZFhUeUYzOEQ5R0tGaWI2NWE1?=
 =?utf-8?B?azgwaGlMVlplR2Zsalg5OVRRc1N0SDFwUzNGbnl1dXFOYzVmLy9mTHBZWXB2?=
 =?utf-8?B?TFVBWlQyVkdGdWswMkdxay9rZFhRMXZUQ095MGdHclBpS1IrSWFlanhpbWdM?=
 =?utf-8?B?emVLbnExWk5ZTmFER0Y2aFdTQkZtT3U3V0ZSckIwOGNlMTBKQ2k3eCtaZnJS?=
 =?utf-8?B?M2xMZ2VSdVNpTGttZHQraFdOWXh3aDVtU0dBWlhTTVB3RElVMjdwN2NYcTR4?=
 =?utf-8?B?emJxRDJWemp5VFcyU1Z3RHRQYnVtTFpUNE9IQ3M0QjRjN244cUFSblpvamdh?=
 =?utf-8?B?QUJsaFk2TmpWNkpyRVBWUElYZmFibC9LNEYvc25LRzMybEl5WENQdEx3d3lN?=
 =?utf-8?B?NVJNNEtVNXNtZ3pQajBpbStNUm93d0NNKzJvZmFBTTRwS1ZRWDlKWUw2Q1hW?=
 =?utf-8?Q?B5nbBCioCN1bvfdqREvdjdSy4xC/B0jZzbe+6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1847178-4df0-4f76-3f04-08df032dd1fe
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 04:52:24.3442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BHbQJ2H/POi0InVX2DCwi3pcRDTawgMwozfCILHVGFmuvg++IXVl9YiwgghJh9gjgvJVlsviXq33SubEhAVT6VyRB06fiU1g7v3UEORLtmm1jNGlPbAn/u4wBtW3zCv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8853

V4L2 requires RAW formats to be LSB-aligned (right-aligned). Before
i.MX952, the ISI shifts RAW10/12/14 output left to MSB, so the driver
works around this by using RAW16 format instead.

The i.MX952 ISI introduces a RAW output LSB alignment bit. Enable it
along with the input MSB alignment on platforms that support this
feature, so that RAW10/12/14 output formats can be used directly
without the RAW16 workaround.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  1 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  | 39 ++++++++++++++++++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  3 ++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 40 +++++++++++-----------
 5 files changed, 63 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 5b19b581b38e..439c7bdecfa8 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -403,6 +403,7 @@ static const struct mxc_isi_plat_data mxc_imx952_data = {
 	.format_mask		= GENMASK(30, 24),
 	.buf_active_reverse	= true,
 	.has_36bit_dma		= true,
+	.raw_out_lsb		= true,
 };
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index a4b638508522..39dbb35bc4cc 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -179,6 +179,7 @@ struct mxc_isi_plat_data {
 	u32 format_mask;
 	bool buf_active_reverse;
 	bool has_36bit_dma;
+	bool raw_out_lsb;
 };
 
 struct mxc_isi_dma_buffer {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 2405f7d33d0a..4838b445f279 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -308,6 +308,7 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 					unsigned int vc,
 					bool bypass)
 {
+	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
 	u32 val;
 
 	mutex_lock(&pipe->lock);
@@ -357,6 +358,20 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 			val |= CHNL_CTRL_VC_ID_1(vc >> 2);
 	}
 
+	if (pdata->raw_out_lsb) {
+		/*
+		 * Enable RAW10/12/14 output LSB alignment to match the
+		 * V4L2 requirement that RAW formats are LSB-aligned.
+		 */
+		val |= CHNL_CTRL_RAW_OUT_LSB_ALIGN;
+
+		/*
+		 * Align the data selection from pixel link to MSB to
+		 * avoid data shift since the data from PL is MSB.
+		 */
+		val |= CHNL_CTRL_RAW_IN_MSB_ALIGN;
+	}
+
 	mxc_isi_write(pipe, CHNL_CTRL, val);
 
 	mutex_unlock(&pipe->lock);
@@ -406,11 +421,19 @@ void mxc_isi_channel_set_input_format(struct mxc_isi_pipe *pipe,
 		      CHNL_IN_BUF_PITCH_LINE_PITCH(bpl));
 }
 
+static bool isi_out_raw(u32 format)
+{
+	return format == CHNL_IMG_CTRL_FORMAT_RAW10 ||
+	       format == CHNL_IMG_CTRL_FORMAT_RAW12 ||
+	       format == CHNL_IMG_CTRL_FORMAT_RAW14;
+}
+
 void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
 				       const struct mxc_isi_format_info *info,
 				       struct v4l2_pix_format_mplane *format)
 {
 	const struct mxc_isi_plat_data *pdata = pipe->isi->pdata;
+	u32 fmt;
 	u32 val;
 
 	/* set outbuf format */
@@ -418,7 +441,21 @@ void mxc_isi_channel_set_output_format(struct mxc_isi_pipe *pipe,
 
 	val = mxc_isi_read(pipe, CHNL_IMG_CTRL);
 	val &= ~pdata->format_mask;
-	val |= CHNL_IMG_CTRL_FORMAT(info->isi_out_format);
+
+	/*
+	 * Before i.MX952, the ISI shifts the 10/12/14-bit formats left
+	 * by 6, 4 and 2 bits when using CHNL_IMG_CTRL_FORMAT_RAW10/12/14
+	 * respectively, to align the bits to the left and pad with zeros in
+	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
+	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
+	 * After i.MX952, ISI add RAW10/12/14 LSB output alignment, so skip
+	 * the above workaround.
+	 */
+	fmt = !pdata->raw_out_lsb && isi_out_raw(info->isi_out_format) ?
+	      CHNL_IMG_CTRL_FORMAT_RAW16 :
+	      info->isi_out_format;
+
+	val |= CHNL_IMG_CTRL_FORMAT(fmt);
 	mxc_isi_write(pipe, CHNL_IMG_CTRL, val);
 
 	/* line pitch */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 35dec3a650ac..c9c22a3668f9 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -20,6 +20,8 @@
 #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
 #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
 #define CHNL_CTRL_SW_RST					BIT(24)
+#define CHNL_CTRL_RAW_OUT_LSB_ALIGN				BIT(23)	/* i.MX952 only */
+#define CHNL_CTRL_RAW_IN_MSB_ALIGN				BIT(22)	/* i.MX{91,93,95,952} only */
 /*
  * CHNL_CTRL_BLANK_PXL: i.MX8{QM,QXP} only
  * CHNL_CTRL_VC_ID_1, CHNL_CTRL_VC_ID_1_MASK: i.MX{95,952} only
@@ -88,6 +90,7 @@
 #define CHNL_IMG_CTRL_FORMAT_YUV420_3P10P			0x3a
 #define CHNL_IMG_CTRL_FORMAT_YUV420_2P12			0x3d
 #define CHNL_IMG_CTRL_FORMAT_YUV420_3P12			0x3e
+#define CHNL_IMG_CTRL_FORMAT_RAW14				0x41	/* i.MX{8ULP,91,93,95,952} only */
 #define CHNL_IMG_CTRL_GBL_ALPHA_VAL(n)				((n) << 16)
 #define CHNL_IMG_CTRL_GBL_ALPHA_VAL_MASK			GENMASK(23, 16)
 #define CHNL_IMG_CTRL_GBL_ALPHA_EN				BIT(15)
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index f45c2aae59ce..9a6a8302774c 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -221,11 +221,11 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 	/*
 	 * RAW formats
 	 *
-	 * The ISI shifts the 10-bit and 12-bit formats left by 6 and 4 bits
-	 * when using CHNL_IMG_CTRL_FORMAT_RAW10 or MXC_ISI_OUT_FMT_RAW12
-	 * respectively, to align the bits to the left and pad with zeros in
-	 * the LSBs. The corresponding V4L2 formats are however right-aligned,
-	 * we have to use CHNL_IMG_CTRL_FORMAT_RAW16 to avoid the left shift.
+	 * The format entries use the native RAW10/12/14 ISI format codes.
+	 * On platforms without hardware LSB alignment, the driver
+	 * substitutes RAW16 at runtime in
+	 * mxc_isi_channel_set_output_format() to avoid the left shift
+	 * that the ISI applies to RAW10/12/14 output.
 	 */
 	{
 		.mbus_code	= MEDIA_BUS_FMT_Y8_1X8,
@@ -240,7 +240,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y10_1X10,
 		.fourcc		= V4L2_PIX_FMT_Y10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -249,7 +249,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y12_1X12,
 		.fourcc		= V4L2_PIX_FMT_Y12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -258,7 +258,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_Y14_1X14,
 		.fourcc		= V4L2_PIX_FMT_Y14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -312,7 +312,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SBGGR10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -321,7 +321,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SGBRG10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -330,7 +330,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SGRBG10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -339,7 +339,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
 		.fourcc		= V4L2_PIX_FMT_SRGGB10,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW10,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -348,7 +348,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SBGGR12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -357,7 +357,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SGBRG12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -366,7 +366,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SGRBG12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -375,7 +375,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
 		.fourcc		= V4L2_PIX_FMT_SRGGB12,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW12,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -384,7 +384,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SBGGR14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -393,7 +393,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SGBRG14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -402,7 +402,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SGRBG14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },
@@ -411,7 +411,7 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB14_1X14,
 		.fourcc		= V4L2_PIX_FMT_SRGGB14,
 		.type		= MXC_ISI_VIDEO_CAP,
-		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW14,
 		.mem_planes	= 1,
 		.color_planes	= 1,
 		.depth		= { 16 },

-- 
2.34.1

