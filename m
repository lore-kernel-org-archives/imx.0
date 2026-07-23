Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338F340DB35
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784797998; cv=fail; b=W0dfEwlaVgo7VfIIhkbu2iyVaoHybS9O/2tHfJ8rBD6kCGTRIUEArYNbg6tN/T2PiApsi//KRAtT4eBTSQnBDhd0fWNAzsS7myhuEOhr8ty2XrkTrJBHonA3gWD7W4/5QObw6p0EtYwsJboKz4AaX9TLdgn/afQY9+MinNjGNpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784797998; c=relaxed/simple;
	bh=FBqKnSHGUfWOqMSzkV840/+1q3AtfMVyJLpE/l2zjEg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Bni29hBNwwJeI4wNZyDshh2xVvwiTPk1rWy8TUJDpmq5fVAgPKt7XBGsmiZGzbPb+bEFp/xFN2uLaJJglCSxYZHzrPHnlrXSXUSqE+jpPr4Hpw0drjnskKSUKIQhrTFPeMrQL2RRIvV63xrBeVyaWdUGwr2yF5sHZ36a1lKYOJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iwEmOD69; arc=fail smtp.client-ip=52.101.66.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iwEmOD69"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d01wUNSIDjrbHxxfIZPSl+RNNanGXS3xg17nn0k7hvJb0VAF95P6AjDTYAEWsbzt/hPIr48qdys28w4p1MfJi+Y6995MMzuhHUsf3pM7gVAu18M5lJh/e+O0Tth1yGBL7spmVRllrH5ii5RqH7WjGFpH8TP1VO1KFhjmhFvyz17OATcl4Z0L9bT8UdhIIq+O5gxA2czeIg97scC+DSkGx/No4ddmR2cWo5jYcYp29mDpxNJgFWUWh2uxrxcoPcHAZFw9yd15tDAM2zC2Qem6B44Dq2tc56M/k9l6ZfJiMupVCEkptcUzUwhVL8Q4waMZAmtc+gAY++SKQnlD1YT07w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/KyVCtY7F4WUAmqcTHdYeVb2be16vEeFYi+wrYA6do=;
 b=CWcmvmMnySXtWbu43FIhgBn4YMgxtqM9N7/KLopH94al6+qqM5DaDtTTXWohIm6c3Ep1MVU+tW9FGDy11spN4OJaa5a/JvldU+elAVTQ2jGj3SecvXzn0qczdA1Ts2OHUEcfq3e41Oa938o94CpCUFmZ0tZ5KgPJWSHB0Zyolhjc4kXOFH9RfMinmrXStp6R5Yymvh0sh3RI/Ah/5ZaS7lVaPUyLLaKG3ICiLO0ESzqINZI8bi4pxE04p6LJDKAXHlIgF7ZvD+hVGfAms3ux6B9ExsKfLppi7Rl9aRO6vBK4WbZGuoKJNGdPqLIn2Z3OmICsCAW5LK283UauGD/5SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/KyVCtY7F4WUAmqcTHdYeVb2be16vEeFYi+wrYA6do=;
 b=iwEmOD69UXUmdz3sdn+hs9yFdADzvjQCJf0AMPW4n9epRQbn53l1f7vS/pqT2hu0wogvzoBDimbriQFyJe9pZhfdSHVxTuLSeDM0AsUGGx7rAxjMph3wvhtRfpgPj5nFBVoQ7Uo1ofJxMoGRDD0T95Xn6u0jWEwBxn/5g3lb2j/BbSmjeBXZ0rhh20i9VLUl9n1M7Hn1wyzPfWEXy5kbFOME/S+Dn26AF0ctWTEyR38lDPIzMu5gp6xnUdNrgm5DHKZKbAyvuuTkZeTBafv2evitdWMwVrcnMPs4wpNMuTEc+lYSdfW6n7gffaRMY0t95oVcr//SpdN2DhCfzPef6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by DB8PR04MB6780.eurprd04.prod.outlook.com (2603:10a6:10:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:13:12 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 09:13:12 +0000
From: guoniu.zhou@oss.nxp.com
Date: Thu, 23 Jul 2026 17:16:38 +0800
Subject: [PATCH v3 2/3] media: nxp: imx8-isi: Add 16-bit raw Bayer format
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-isi-v3-2-594919eae847@oss.nxp.com>
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
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784798197; l=4848;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=6aW5Gxspe2hmQsP07FnJdw4wxhOn0r0RgT67abG/4xo=;
 b=5lSJ/r4L3WNQ8sf0k9GnXebor0Wu9KNVnWvGdvcNVhkuILMc/a1bAlOrriHb2ha43b8QtWi1/
 bnV8H0H+mrHDGvpFof+6wndSujQ/u+K93jAb6B+DiM5eeoPlrJBGehJ
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|DB8PR04MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 23936b89-21e3-4679-5cca-08dee89a9e70
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|921020|56012099006|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 xf6LZlTFMvCEKx0NslOBXWne10g2kNg0Cw/7DpPuMsDUT0FLPR6DAq/kFj0+OMbInYr17CmDr3WFk9bamGOoOG+pqKxyA349ZEoI4a/O54AbhVgYvj4af2RdqN8JMwnz7nSVXYmzTtsr6JE1GxsmadAI/d5WPncTfC1WkeZhpUg1aDnEajRCjc+XV6GVMwMfXXgUapshKgh3IlnwO1KlS0HFlfnRsNx+a95D84MCOJtp1sF4cHJewHZgiit2nSoqRjHa8TTzSksYiN6r5LqNZRATn+uyK4lrHcumZ6mXW9RQ6xzpilf4TST0BoUA/Bztew+YIvOD9qLI13mUdG/QEpA0DKnKA1tQPLq0vKeH2J6rgnzEcUD7vn4ZO1cOe73//Cs+FUpDRBqTLRhEaZ2WoXCiO4lW2nCCoihreN5fQhyo4Z3HMYuTCtvj2ch78A4E5QQTL1b69b40M01Dn94DCWSsaTbcD3PIqkxzLdtLiqUSWGh7v8FeaJqzdlPtq19+foL/7hxPMJQ6BC0rGrr2dn9SnKg1A8SKUT/wLQ8ocf5AmwGoT55eVSdRX/gMtXukfc15znxzDCcI6oZ+RyGs+JAHNZZv7UwCGbRXj7kI65KjJFwa8Gc/gKi5RH8qkWafdbPdjXo5zv17LUIOSEEryk7zCCVsUAaNXYxjrkLDBWF3DdstAeP+yorLgolR3TXJ63LU0hQTdCczRhjKtRlw8g==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(921020)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dEN3Y3RDYmI2WFMzK1FnY1RxSmhxQjhEUU1mM0lSQVBUSE5wQUNUYlp5enV3?=
 =?utf-8?B?ckZLc1NWZlRMZnBhc0laNFpMZnBlNDNOTCtEVUZqMnE5dkU4c3RIY1FOdjV6?=
 =?utf-8?B?ZjVaYTBQOXpVN0htdGoxWCs3UjE2WFlnQlV6MWNJekV3Mm85QVExYVFVRDd1?=
 =?utf-8?B?aVUweTB2N3djSFpkUXU0aTJkUGRCc2pOdS83a3owZGlXY1QyM2lxVllFUTBT?=
 =?utf-8?B?d2tjUVNXR3ZqRHBwbW1SQ2ZaUTFvc3E5a3dDd3Z3c0I1ZndTckFsY3FuNFAv?=
 =?utf-8?B?aUl4bEhEYkQzQVRaWE15N3JvV1A1ZE5VYXhUbFViZ0wveElSaVl5T3QzTU1u?=
 =?utf-8?B?bzJ5K1JWMm1ZRzlNMXBCeFQ2NjF0eWdnSVVpRFhHZHJIb0JKblV2SGFpOVIx?=
 =?utf-8?B?clhVZmVvNEtxeDBmUHp3RTlnWWVUZXFTeWJUbzZ3L3B3VTN2TTdxN3gwTEU1?=
 =?utf-8?B?Y0dCQ3d6Zzh0RExjTXVENDNVNGRwUk5HSVY5MUEveFV5ejM4M1BHSTBIV3Ny?=
 =?utf-8?B?YWxqYjczSTZvbmh3R1NmRGMvMjF3Tnd3cittbS9xbmUwTVVqUzVqNWVpazJl?=
 =?utf-8?B?V3cySzJhaGlxS2JXOFJuVXgybktqT3QzOEZ6elRPNUpQdTc1Q1grZFI1bCtj?=
 =?utf-8?B?UEsyWTJhYkRjT0Z5VHcycWdpRUVsOE1JTFFISlJxN0tObGxCR0ZaV3J0bC9U?=
 =?utf-8?B?dmJvRXJ3UkpKRDdFU3N3UjZUK3JJRUdFdXkvZER0VVRKNjF6Q1o5Tm1WVXVR?=
 =?utf-8?B?dENVWkhJRTI1Q0Y3VTI1TDNwVWhaU2RQWCtiMDlCelBrb2pDUEJnSE0weGMy?=
 =?utf-8?B?NXhrK3NOaDRCWWhSTnlZbjYyaWZUbGpaL1dOYnBZWitTcTl3Qm5SSUVHQXM3?=
 =?utf-8?B?SFVaUU4xTTNYdWR4MHhpVS9JTkoya0t6ZWNmdTZ0eFNidUEwQytrM1k5dmJy?=
 =?utf-8?B?MlZVc0tXdnBpQW04dnl1UllwSGo3d2EyK3hvT2tPbVRSOXBNeHU4YjRzYUox?=
 =?utf-8?B?WjlVSlRXVDlRTDRudWZWTFIxNnY3aFBCZWVhREN3aGFuL2VFcjVjMWNsWlZh?=
 =?utf-8?B?VW9YRFZoV2liWVJBbHVVVEJjdjlFUW56SHlPUUJLVTV0eTZ5alNkKzhrQjBZ?=
 =?utf-8?B?N1dCQTZsYlAvdU1ramFBUHc2ekx2R3F0bk8xNlhJVXNtZG1xanpUTDUyN21P?=
 =?utf-8?B?VDFPZmlWN3VFRGdKNmR4OWlCSmRET1g4VGM0UWdrTS9XZVB6eEVBeTArNXY4?=
 =?utf-8?B?ei9TZkVmV2ZIM01LZE1HYm9STllhVHBLRWFpelNyZ2xCN2REMFdYQ05nRTlm?=
 =?utf-8?B?Tm1wWjBXVzFkVW4vbkl3dmVPUVVaSWZaWjFUZXNyaGFKNW0wWXA1a01scTJi?=
 =?utf-8?B?WFMyVkpueDBFb3NuOVUvTytSdG5hT2F2NHlZM2xkakx4Z1p1T2QvQVZxU0Yv?=
 =?utf-8?B?ZjV5Mzc0MGJSRHJsUlFDa01DNnJRdFRLUkw2Z3owaWZLeSt6R1FMemRORnVT?=
 =?utf-8?B?M3p1Z2EyRDh5eWlTTHBucTQxTzVEazZ2OXo4ajZ2eWxLejZDdk14RFJnTTJL?=
 =?utf-8?B?R3Ftcld6YkdlYUg5NGlTelkxS2pjYWNJVlMrclBFMUZMV21MbTlVNUtCVlVq?=
 =?utf-8?B?L0ErY3h0WWtFaDQxYXFnN0xrM1pmZE1FOHUvYzVLT0FUcncvc2FSdkhRV1k2?=
 =?utf-8?B?U0oxeEM1MUNSdzdtUGk1R1F3K3JkQ0loTndNQWVqQWVLMEJJTWVudk4wV0sr?=
 =?utf-8?B?aHNyZmJiYlN2bDVGWjJTb2tLWEowbnhWUnZaTzVVNEdiZGhMU2k5Q0pnYVVo?=
 =?utf-8?B?V3h6K3ducTFYR1Nqc25rSm14RlVDQmZ3K1ViZGc2QUFCMUFMUHdEYWs0bG1Y?=
 =?utf-8?B?SWxOUDZwNVNxVmRObEtXUGpFbUxWL3V6eFlmSHAvTG9OYzNQL1BDK29HRkFX?=
 =?utf-8?B?YTNha1dIZHN2NHoyOHZObFNPUGg1eTBtNUxNaStHSkVLNzRZYzI2UmhURnp5?=
 =?utf-8?B?VHgvUkpPMVZ0Yk4rclp5UkZFK2lMclY0RFlpWndNclplSmFRczJkaHlHenEz?=
 =?utf-8?B?RFRVZ3Z2UW1YRXM4NjhXVExMQ1lQUEd5bnVMWWloVnZhaURIUEtZVHNjMERB?=
 =?utf-8?B?aWVtak1vOE1kUHJSREYyc1VtYmVnbjFMZW15eWpZQTNuZDBQRXBRMkFRQ2RG?=
 =?utf-8?B?bmVldEl3bHc1cXRmMTBTeFQvbE1DOWlORkFQTEVqeWVJbW5xanB2bERiRFEy?=
 =?utf-8?B?Y1VNb1hqcFFMeStQNmJCY0pid1d2L3p4Wm4rQXd1ME5TTmFWMW1CSEZHTkxl?=
 =?utf-8?B?QmU4b3gySHlpakpGYVEvVGx2UW93UzN2Tms4UmtyM1VxcXZ4WUdtZUM0bW1B?=
 =?utf-8?Q?Y2oxFSvV5jS/VoPY0VDYK1M363k/D6or5RKnF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23936b89-21e3-4679-5cca-08dee89a9e70
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:13:11.8955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xXSWHzurWCmNC12f0sTVUqYfe+cZOgXSUwhtXK4QLIDYumXcJqU6o4wzwWJsKhcA5bOrV8zSd3VTd/6FqK2JpK7iC3FosjzVP1SquDTEHTX6sicYfH3+hwKN1gk4hmOB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6780

From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Add support for 16-bit raw Bayer formats (SBGGR16, SGBRG16, SGRBG16,
SRGGB16) to both the pipeline subdev and video capture interface.

These formats are used by image sensors that output 16-bit raw data,
enabling the ISI to capture full dynamic range from such sensors.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Remove "high-end" from description as RAW16 is common now (Laurent)
- Add Y16 (16-bit monochrome) format support (Laurent)
- Add Reviewed-by tag from Laurent

Changes in v2:
- Add Reviewed-by tag from Frank Li
---
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 30 +++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 45 ++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index c0ec59856374..934f7b356258 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -83,6 +83,12 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
 		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
 				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y16_1X16,
+		.output		= MEDIA_BUS_FMT_Y16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
 		.output		= MEDIA_BUS_FMT_SBGGR8_1X8,
@@ -179,6 +185,30 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
 		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
 				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.output		= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.output		= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.output		= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.output		= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
 	},
 	/* JPEG */
 	{
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 056603055c81..a6e044056762 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -212,6 +212,15 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.color_planes	= 1,
 		.depth		= { 16 },
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y16_1X16,
+		.fourcc		= V4L2_PIX_FMT_Y16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
 		.fourcc		= V4L2_PIX_FMT_SBGGR8,
@@ -356,6 +365,42 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.color_planes	= 1,
 		.depth		= { 16 },
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SBGGR16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SGBRG16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SGRBG16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SRGGB16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
 	},
 	/* JPEG */
 	{

-- 
2.34.1

