Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013047.outbound.protection.outlook.com [40.107.162.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB60D3A839B
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 07:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879388; cv=fail; b=DV34NmjP+w8MkPW9IF67pz8a8mszFhR0cDZDvmT7UiRRAJxGPPha9hQq1JtWOaBv5fd58txSit3v+IdRv13ZXKyY0a+s2QDY+ebxJppN1Xcp1yVNcz6rCnBEYNOodmD0y6XUS2BCmXODksjLo5y+bkwZ4DxYigDpqovjW97SKeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879388; c=relaxed/simple;
	bh=7vCwoD8zRU/F2Yx0YQTwIE4S7+I6QlRgpgis7oo0VUs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Rsnur663NDN2Bx1tPTaYT26qBW5Z86TjArYELWXxtT97EUQFLufO0I1ng2MUqqyojCMhzg5uWaPoZwxANVmUVWokzSHGvQRDuz0fyR1rMR7J9J+R4KiiOYKzzTxqXMmkaVngYXPU/dweN53VPDGsB5/3SK9mh44OfQh1PXGdqXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kRscyD2g; arc=fail smtp.client-ip=40.107.162.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kRscyD2g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmmITysj6OLMb32hsZokb0xQEI4wtkKK5UJ84AMiksYtWjUPVI4MRrF7hYc14O5n5bWGJu7EhOaE1v00xoWZRQclT8SRLfJT5eNBLRkV8WhVzY2c27Q+FQKfxtpNBWwOgKWScSPeUPGHfl6LREAv4PNBz/iQdG/wgyNy82eY3YbniHYe6ygv63vpA71n3ArickmyCCGIPBWIe96d5iq4yipDUaVUubmW5x3M/As9dpQdnq8qoW2GBa1PCSYdmrphKXzDh+UB/HxFHUYtoVe0hGr/0JfhrXh8xdbCybMRUUydiv3ocNDGcL9vLcAWXtqJgOGpho8VMIiUYVHLlu17xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aF1/ZWz3Hq66anD9pqpoMeSBzfhmRxhu1+4/n8m1KE=;
 b=xP35aUShEVecGXH69lmrSDo68aV7w6Ezs8rm7UoKbGrUExOGKrONLkcvmWXhaHD2ZpaP8CEgOsv2IOeUR7/4PN4sI5Kdi0TlrzLDJZ6fibhCelCxbNhX3TmaH29L5ero1/Xv6PMGZGV/evu/+SGsQVwMyF+JBsiL0lfWMlX0fCgR3Cq274Y3pWNUGDeJisqtzKP4vPuqGxdhHEfcIPLSFlngi6bc6bviL5qNPVK9kTdJEofPVkmPNy7RPVTmqULmbRFBcPWzF+Z2Kzs86C0DoCxSfKYLs47aMikzioBb6vVzT/E/v67jCHU/DiJtB0YVZoVKfDSoz4uWTFbBx+y27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aF1/ZWz3Hq66anD9pqpoMeSBzfhmRxhu1+4/n8m1KE=;
 b=kRscyD2goo2YHmS4+4osc2jzHkSeOH8yvzzX5IwUwOgHQbtdZRMu1YoYPauXEAm8zSap7lEvRq0uy1LR5u+kSRslwrXSsoagomCj4lzJ+r51+YpBtTtOPKYpVAXek8+NUcaSYDi4HjdiWeHeULi/iUhebGwCvO0q4d+FvQg24/S6Q6CD+pkK3XfqWVMdzwIArKh2CsjmHDWK1sua43xB4VlT4gvF4tSANDbVHYtu8INxNkL2Y+HeEGozWCahoY8YlrUNcaNkjGAzRtkdBvcMhWY9b5T/m1P1iS2QmQsqK5HH26ScbK9irA7GwG81GwpK6vDepyzD/pIYQoP1DbURXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by VI1PR04MB7023.eurprd04.prod.outlook.com (2603:10a6:800:12f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 07:49:40 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 07:49:39 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 24 Jul 2026 15:52:58 +0800
Subject: [PATCH v4 3/3] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-isi-v4-3-27df7b5f6060@oss.nxp.com>
References: <20260724-isi-v4-0-27df7b5f6060@oss.nxp.com>
In-Reply-To: <20260724-isi-v4-0-27df7b5f6060@oss.nxp.com>
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
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784879577; l=3093;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=7vCwoD8zRU/F2Yx0YQTwIE4S7+I6QlRgpgis7oo0VUs=;
 b=hJQEj46eB/TcUmzhJnmYEyEUCHY5IdDFyiO9fh2txO1dcszv0mLGo3OhXcLxQJdqPHu6jwQpD
 I/eLMp3W4DcAGaeWuHsMe92AuCPIrsznAKa//5vhkBxXVZFYowkXUfj
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0115.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::15) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|VI1PR04MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 67caeb88-71fa-4613-583e-08dee9581d87
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|19092799006|23010399003|366016|921020|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
 roxvmtjEFfxW5C611FbkA8HN5Cj5n7M1kFr9bbJkGmLwWSt7Fm7yRSAfdEQ9nVBGarZRn9B7b3ONkGTVhikQemezZLBF4ufG89QaMqV43dDffH5OB4gw4gZqgVNxJk7XAoFgp/bRUzkGnoXy5VJxAH03SZobakAgTsLlxCQx5PbxfRi5oYFlGkXUZMhz42yxeEQ9At7CrM4xkKPJvaafl333iULYwczb+S6JzaPnSWTut/BWW9N5SkcIKXYtP1nPLMyvleouvvGoKCd8Ls2c/asnYaqFYHjJSaBZJqvXV4Ff1wRdEzHlQoiGrcfDKFISWQ7p/iZA1mehTQGIEWIUvHPSursJJs+jnngDd842swge845HyWKtgJCpiUnR1gPCrW1XL6tJt53UnNaRPHPPzWdceBTt4sipu/KZSGH3UMPEIdmDK8JbzLCstvtPRoo2nOVFZtZ7sb1Ds8qsQ3ZQsAIJ2WEU0v8g1dBBQkhR/1FiwhAGGezn0j7ure7Ov0Rq64Eeo66yUCsGqGyZ9vluPAk5qSnD3IceDCqG8SN9aW84piH9CIGhM94h+bst+7lxRlG4iYIQjqW2OJepyPMhNsWtcbqsCoDpbdQT9SbVSwgyCErIFSWWW6s2aFmDZDnDcIIo4t8URWRYuf/SLVTmS5MOoOCsXXhw205oyXQvKDFhw7/WWyNk3psHsA5BwlIPDzBPmqFTg1fkVbhis+bvgw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(19092799006)(23010399003)(366016)(921020)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SGZiSGsrYzhzYVJWczVvbE1tZWVLblI0bW1UMFV5dnUrcHQ4Vk4vSitFNjFW?=
 =?utf-8?B?a3FiSkxwWGpZR3Z0OUN4alRSdjY2QkUzbVEvL2J6RXQrVXd1OFR6RXNCYmY3?=
 =?utf-8?B?aWNsb0Q3UWJTVlN0Zlh5dmJwSkxKZzFQL3NsV0FoWm5CSnJoeXdjblRnZnpQ?=
 =?utf-8?B?OXJHVEttVUl2dXJ2M0syMy95aXpjTGREQmtML3p5dU1LVDNQbW9JOCtjeFpZ?=
 =?utf-8?B?bGhmT2NwNlFVVVVucitEaXpsZW0xOG13ek1KNE5Nb2pCamtJOERCYjJzK1lJ?=
 =?utf-8?B?bjhZYVNRdmNmZjlYUlcvcEk0cFBvU2NNVG16V29UeWVEMFV6RVFhRUh0M3ZU?=
 =?utf-8?B?R2oxeGF3MGdCYnpYNUJzTTNVNUJHQ3R5QTJtZXN1c0xDZjhPTjBvWEZaUVc4?=
 =?utf-8?B?enUwMkM5dG9uT3NSeGZpZ3ZMVjNjZ0pOS05qVThVZGpESlNlZElMaFlMWW1o?=
 =?utf-8?B?Z2FSNWFmS0c1dGs5bm8yOUFLRm9zc0NFWHJ6Q3NzY09OaWgyaHRwQURsdmlu?=
 =?utf-8?B?S3ViYXdYM3FOdzVMdTVaR2t3OTNwMWx6WEIrL1p5Y2g5TG9mN0ZkVStIaGRU?=
 =?utf-8?B?UE9EcXl6aXl3b2l6WHVZTDFveUxzTEZLL0NyeFY5NWFuTDhveW1oZlRaNjZn?=
 =?utf-8?B?YlVERWo4SU1FQlo1cFp2Y01heXdtRTRmQnIrbWpRRER0UVVKY0xHYmlqdWFV?=
 =?utf-8?B?NEplVVc5VlVtTGpDSmp2QnBObnZSb2F2WXk3NC9WbVdMcUJqR2dLQ3lUL3Ax?=
 =?utf-8?B?YnRDcGRRY3RRa0RhYkY2dVJZYlovUW9oRk5ST0djUHZrNHZCZlg0UGU2TDhj?=
 =?utf-8?B?d3prS3pnYUE2OGY1a0RzNGNicnI4S3VUNDV6RkV5NjdJYjdvZEgydks4UVZP?=
 =?utf-8?B?WHlHdkFqaVd6VU1LZGg2NGZaMTZGeTYvYTFORXN6S2QxWGhwQlJTV3pNTDV6?=
 =?utf-8?B?VzVpNmNUWllWeGdTc2I3dXFqZFRscGJQaFZCbE12Y1ZiaUJuNFRic1VrTDlo?=
 =?utf-8?B?eW5qNEhIdXNkZ08vMnlCN1ErRmdrT0l5TWZjQjJTZEViYU1WQ1BKMzVjOUV1?=
 =?utf-8?B?WThLa3RvbVFQMGpqdUFva0xablBvVy81ZkpmNlFGVVh0UkFCcmpYcitKSWN1?=
 =?utf-8?B?eVVFeTJSelROUHU5bGs1ZTRGSm1rTjFJTmYvT2dNVG1zRVE0T2txUjU3R3pR?=
 =?utf-8?B?QXJpRmxmNkQrMWoxL3g4eUQ0WFlBRkN2ckpjTGVzbU5BeVpVcmxvMFNHTjFy?=
 =?utf-8?B?QkFwM29HWnZNNVdnRklnd3RCZTVXR3h6UHJvUUdPSDJIbUVGVTdjYk5KVjVW?=
 =?utf-8?B?MHRNM01xWGRRSEpDUnd4N0lKWnR5VllUZTVGemNHLzdzdXNaTk9qcG1aeGxF?=
 =?utf-8?B?ek1sT2VaVStORU9XcVhjeStRNnNEdDZjSzNHMWRLSTk2aEZTdWxPL0ZYMEtk?=
 =?utf-8?B?SmJOeGxVZ3NjTUlhYnhMbElac0FsWTZubVZDN2xvTjB2RTVLNVhJd2k5VEVQ?=
 =?utf-8?B?RnpqbWVUUFB6d0UwR1E2eFQyT0Y2ZnpQeG05bS8xUG1iaStVdmRWWFZmSmRl?=
 =?utf-8?B?clltdy9wSTYzVHpVbWhhb3E4UUs5ZzlwS0I2RisrU2tNaEdmamxBVmhob3FV?=
 =?utf-8?B?RHZkWjl4YVV4clVYWkR2VTR3T3JuQU5mVTZsOTFHdHoyNzR5MEY5dTB5Q3lo?=
 =?utf-8?B?eHIzUWwwT01Fa3hGVEFyKzlPT0JpWENQZ080ZTR6V2JDQnp4cGgrSnhpREpj?=
 =?utf-8?B?Umx3RWhyWXl5TU1EOVd5RDRLQ2NIeTNON3BOeTJRTTZzZnZwK21HekRjS1d5?=
 =?utf-8?B?SjRBWUxpNnhUNW0vY052TFBua01qN1pjWUl6SlhDNElTNk9XV2VndVVObWlk?=
 =?utf-8?B?bWpVcVNFbnZ6R0NSZno3Slh2VU9DVXJKM3I4VGU3UFZ2eUY2UkRzOGJWVWl6?=
 =?utf-8?B?bnJnelpIWXdiU3N5SXoxWnNHb3ByY1BiUkxSeDk0ekRvRTdkeThuUDdZaFJS?=
 =?utf-8?B?Ky9HV0srVm5QT0hPV2FtSjQwRWYzS2NLWmJnaEx6Mmc4MEh3M2VFN1Uwc2Fo?=
 =?utf-8?B?eWJ3Uks5RzVua3diejUrSGxweVg1elRQMVFBNVI1V1pQYzBRRTRXS1V3UGpl?=
 =?utf-8?B?amdieUp5WTRLK014WlE3dm9OYmNranpSQzgwbGJYUlFxUUg0ZnZLNTE3bkRY?=
 =?utf-8?B?N0IzL0JrM0FoNDhPNXUxdFdqSUhUMkRsNVZQbGZHYXMxWlEyZEdPNmUxSzNS?=
 =?utf-8?B?WHg5RWtCQmZFc0J4dEg1anUwc0ZnbjZZK1ppNUt5VTZaMXIwcWpvWnhRZkZq?=
 =?utf-8?B?azZPeDdtVXp4ckF1cEtaL0RrSXg4Y05QR2tQN3JkSUVOMzF3NmovSGphQzVJ?=
 =?utf-8?Q?gpEFnesqPYyBRsNi7ohJEFmtrFAxeEfnP331G?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67caeb88-71fa-4613-583e-08dee9581d87
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 07:49:39.8039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0o5R1t9RG+CSt2m3d2dhIwStwet0PXffBe6azmKS2o9odc/7W4PjAHXOul05aCIdZAORsX3cfGtM0pcuCCoJd16LSfnpnOV3ZCP+VzLP13Il2j8BzYz2EICWkXWudD5f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7023

Add support for additional 32-bit RGB pixel formats (BGRA32, RGBA32,
BGRX32, RGBX32, ARGB2101010).

Formats with alpha channel (BGRA32, RGBA32) only support capture as
ISI ignores alpha bits when reading from memory.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Drop M2M_OUT for ABGR32/BGRA32/RGBA32 as ISI ignores alpha bits (Laurent)
- Remove Android requirements from commit message as alpha formats
  cannot be used as M2M input (Laurent)
- Add Tested-by tag from Laurent Pinchart

Changes in v2:
- Add Reviewed-by tag from Frank Li
---
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index a6e044056762..f45c2aae59ce 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -166,6 +166,57 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.color_planes	= 1,
 		.depth		= { 32 },
 		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_BGRA32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBA8888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_RGBA32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_ABGR8888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_BGRX32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBX888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_RGBX32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_XBGR888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_ARGB2101010,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_A2RGB10,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_A2RGB10,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
 	},
 	/*
 	 * RAW formats

-- 
2.34.1

