Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011057.outbound.protection.outlook.com [40.107.130.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B93345736
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 10:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782814132; cv=fail; b=iB72yw6APHc7GUsv9+EQ1sbGtRwPb4/ym/KVt30dCiNP1GLbvey7Ax+ygJTvZbuvmaJ9bB9ASS/bM2YI5dJsbLmnGnvmhIRz2y2WPosfSmGRfwaDrf3kDOq2JwOpoS3l80b1WkH20FL1hY7ZPbE78IWbNWuVTGwfO5R+b4e0jl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782814132; c=relaxed/simple;
	bh=4N7Csav2FtS4ZGafWKFpggU3hpDjCV3TbpWA0+NNb+A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=X1PF0gFvLbK89HWHF2Qy4z8+cwxSYmU+M9bAB+QcsdCEzpjIffMajk70gFbl3bLFTqg9a4NU1vZAcoGJI/KW9ffzYTSy/564O3PWBJUNFajAiwWVg3bIOhVY0NtgAUz6xKAQRHIjxDS47/u5cga2frkwVjcdkckS8iqPNjPAV8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aPwxAQ4n; arc=fail smtp.client-ip=40.107.130.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aPwxAQ4n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OuHyYwdskH5XaGYDFMVr9pJB6OjWYeAObz0QVDgvXRJQeIHj4f1r0ABWb7vtuXANN1DF0O4P5VdsS4I4aRVCpsnT+cQ61KqgjISkjmBPcXPdrPr6GwC0JE6gYFuSzPMyBeoUi1ubO8ckYgt1JjT8+CLMi3kBzdVlTdTP1gUi4UKQQKnVFWhvyeIwn5y8N6QbQTCkNA/vUdyyKCUbS1up7OMzi4dl9EIM3elEXE0rSLyv1pjQUYudZLY++CROYA5YQGkpCtBvkeCWN3rUHkbeMvN2liDD/OhVo8M6oYjmiycdteFXVfRCBNQxysKv8gE8AMBG2omC+hcTxN1AASMinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DUdkM7KG1PTtR6NyDYESfn7OceH6uND3z6FSTPMFeGI=;
 b=xCFwRyukjuMhZUHwPV1NHSicktaD8t+Kyzs/EhYiUSZp7+UjKDhaPz7fcUaRaxWfjJw0hPVNh+kA5AqcSZNBQ58croZBAJ2kBHKiqPW6njcJ6mB9RheNpenpcplQRpveKEBOU6kYIUudTpi9QSiy7e4x2URUAqqtlyKcpKOcACMMb03NGNIFCmEweHslY8JKn2Q1ng60kwkIdfkB4fkY2RIgPkoOj0pu+BhVOOAAci2B7AiJYZfB1ztWAPqXYEXPP8c9Boyf02wBZTxF1mDgSAcmYp0z52VSDT7m9HmRb93pd4gbVgtyXFGPeX/S9wFGVLa2JCLS6h0qULjBE9c8zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DUdkM7KG1PTtR6NyDYESfn7OceH6uND3z6FSTPMFeGI=;
 b=aPwxAQ4nFDPXB27aGZOC7RtxGz0gRZ0jKjU6wMRQwfIdZjaYe0viG+E/mPL7vekZN4/tPGcxfoNagb0ivhgh2IIOXuxfoHrhvfCScAtU3ddI6OBYuv/44666+ghIxcvevGEVef3ME1jrIFp4YECAlUA1dMpE8hVfLmD2l7w9FmzPQYX8yQy9YYMzcVXdn+YCGqCyA63piz29gZRTIl/m5uJmX9Z2RCdZXPBVvWnN6Ze9GMS04eiRJrlUtPs8Lbox0ACsPn9eb2lNu9fqfr6ZGq+wze/hCCOfdcYDIgD+KvC1wfJrP2qOzNw+IdgppxEsAeo5iAUZYTdYlo2fLTJt/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AM7PR04MB6886.eurprd04.prod.outlook.com (2603:10a6:20b:106::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 10:08:44 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:08:44 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Tue, 30 Jun 2026 18:11:31 +0800
Subject: [PATCH v5 4/5] phy: fsl-imx8mq-usb: add control register regmap
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-imx8mp-usb-phy-improvement-v5-4-25d616403844@nxp.com>
References: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
In-Reply-To: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782814305; l=3171;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=/OKOAh6yNAHLlNaQSt3cSI5iC7V7ZmLbhbKkbjVP2nI=;
 b=PnWl0wd9A7K1u7tTjk6ZDAfeg6oRvqM3xEQrqM3e7TTphVypAEO5IpwEcg6G/62gWYkMwE08U
 qXuG5kt8vJsAVl1yR8ve7QC8+oJOdBWf4Gqlh1ELPRLT9PuFbEIxdrA
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5P287CA0289.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:221::12) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AM7PR04MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d21e3c-4495-4fda-d27b-08ded68f90fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|376014|1800799024|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	pUv+RourvicKHcvxhqpUAM09titA/2n8XBzI27QvZg/ShGKFMWtocoHDl/QRUlkqvd2IeoErsZsSJdnzNioV0NsyT8SAx9S+nIa58Cc2PzLdps07rDY0ZpWiXXJlGKigt2JoH9rvSxXuL7Jh3syCyK6yHAZvgSqaXWEhJTg/0ie4VwRyDtaMVnnb3mApBnc/jR4pQMH6jQbVc4eZz+cGLPcjtZPdEp58UFlUH5diUXvprO8C5hNAWrS3aa4y6wdzPZedVXp59slccb6Q8yjfHTX44g9fzUyogf3tBNivKjttEsX0gBWQu6AKJLKtGXQvecl18bDFSsmGGg4T3qhcjiknPwjfaJKHUC0FBjvAA7HP2h4OixBo6NC/yGx7RBK1U9fTMJobdJniFqQI6G4JbfxeleRCtnMElQnStSsJ4x5bkPmAgJAgNNTwsq/L2K6wwvVLJ81iVBYx0lBZ+NGry9s0svvRJxgvcsMBiN4LyUVK6WnxM8O0wlxArvNfGG77enWArFNtE5T/nhHepEFDQc4+jPkP7n45bfKYZRR8Wcdva8d95Y3p/nZBqcdkCfkypmMyeGHzwpRBfmk4PtAbN8dc1HMXYFjRywgTPbgJcjy1/zMEG5Pyw95isdOnRNrXCDwOkd9Tx3UUBtOPuu1y3eEgUFixVNFF+6yFC5zHRrM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anhqcUJIS2dSNDF4Y2pUQlNkVXZuZ2k2bTVsTkZuUXdMTXF0alA3MXJoSHlM?=
 =?utf-8?B?M0crTndvSnBOaUZhSmE1KzJFWnRpdGc5VUdIaEhoanFiZWFqbFozMTRXSzR0?=
 =?utf-8?B?QXZVSUVuTE80Yzg4c2syYmdWYjFSK280OWJBR3pIQnNicE1VV3pNWUc4dlJT?=
 =?utf-8?B?VHRhMjFVMEVRTDRTZUlTY2plTXdTdEtHQ3E0T1dreHdCTVN0VU43VExYdlky?=
 =?utf-8?B?Y1BsLzZ1MVVWd2hSS3JWY1VWRVFudXFmV1BjVTFuSGI4cXpUdUp1NGU3WVRV?=
 =?utf-8?B?TFA0T0tNTUpIU21VdzhPU05SRi94YlRNTC9ESm5lSGg3T2lBczduNkIwYjZa?=
 =?utf-8?B?RG9rWmluTkpIeXBYcEdSb2ZTd3ZaZzl6YzZkMzEyWW1yOEdFakV3UERzS0xm?=
 =?utf-8?B?ZFl5SU0xUzhxNU9HUXFQZldhTzRGL3p5QTNpT1JDRzM5NFU0cktwMTZ0R1E0?=
 =?utf-8?B?bEVNb0hhRk5ucmF1MXZUZTJBRlluZWhQOTU0RURwRWtlVkZ1YUhHa3VrUVM0?=
 =?utf-8?B?a25kN0VtK0kwdFEvLzZpbktXZ2pIdG5jaDUrTkVHNGhRVFM1YUlOUlFZMzFy?=
 =?utf-8?B?Y2RhendMN2VPaUIvcFVaUEpVYUlVemV3cmFXS29WOHJ6aEFoUmJlbko1Yncr?=
 =?utf-8?B?L2NoaUp3a0grT1kvUG1ZS3ZjaEZzd1ZLMENnTklFZUZhWnMxcFFWTi9XbUJE?=
 =?utf-8?B?K0FXRHEveGVpZFRMclI2YmMzVnM3aVJUeGt3ZWRGYS9pQ3I3bUEwMTBRVzRn?=
 =?utf-8?B?SFVIZVJoZTBSYzJiOHdpOUZUWmZON0tqSXVheE1nSzE5RVNoTjFiU1lPVWVZ?=
 =?utf-8?B?TUZKRHVqOGg4bTMzNDNzeFc4S21WcGJyeGluZlBOSEI3cmx3ZUFMekN0T1Jj?=
 =?utf-8?B?Mm5YckdtSXc2SVRKSitKaC92MDBxUE94Qk5Lcm05N3RqOXFZM3c4eGR1QU81?=
 =?utf-8?B?K0ovTEdpTGpTbmxnakF0WlF6QVZCRVNYYnJMNUN0eUNpOGF2Sm4xNUJia1BU?=
 =?utf-8?B?bWdXQWFxandJaFF2dk1zME5vRmZOb1FxSkRtRnJ5Rmx3dnVNSFBocDYxVUh1?=
 =?utf-8?B?TkhYa2J4MHNtY2V5STFCZlE2dytVQ2ZlNlA4MFpSOTFjNDl0V1ZlWVp0MFBs?=
 =?utf-8?B?akROdTNzY0pqMTErYitIRmVsUDVRKzJHSFZaRmQyVGlsVHR0bk9TTmdLUlR5?=
 =?utf-8?B?N1d5cGNEMlJOb2U2L2FhQkxLR3liWi80eG12VmxLRVpzMHRFZTRXR3dMZG9t?=
 =?utf-8?B?MnJmZ2Z4MDllMWdWSHkzWHc2RTdrTHgxaGxIZUEzQlI0MTJoNTZUR1VjcmFX?=
 =?utf-8?B?RmtZa3ppNkppL09CLzZYSXdYMjRkNWlBZVBzYldGOUNxMCtZQXVLSkR5RStJ?=
 =?utf-8?B?MmprL3BNSEVXSEJMZFpxcXd3WUkrWElNUVArMkx6VldLMmM0dFNWSzNHYkxT?=
 =?utf-8?B?TkxlVnNOY1BZbUJxa3pvN2VXRmV4MlhrWUN6dVZwZEZudXJOV051bXVrTkVM?=
 =?utf-8?B?Z296QUhZazc4TTAxdWVqZFFSeE5HOFM3OURGK1BvWVNjL1pRR3dYOGMwc09C?=
 =?utf-8?B?c25vTFZKQ1FQTzVCZ1dKdlFWR3NBM2dzTEVwWXVhSjJPNitBOHc2NjRFc0VJ?=
 =?utf-8?B?YmZWaDZLejlUVGk5QjRhRHhacEZNMytPSCtnanV4NERidjUyR2gxODdENnJ1?=
 =?utf-8?B?ZU1XWWVGZm9UNFJCbDNJbnFhc3N4S2dNdzVTd0JBK1loM3F0WENrczhYSkJC?=
 =?utf-8?B?REVTL25yZ0pRaUJrc0M3ZnVxSkdrZzBmU0tqM1FkdnRFenN3eE5FcEpxMGFQ?=
 =?utf-8?B?b3ZYUWVSSXZyT2tQa2tSNmRqRzlLSzcyaklhcWZPTmQ0d3gwTEU1THNTRmFY?=
 =?utf-8?B?ZVpweFdpc1NFSnZ5MUtNQ0JoS080NVZMUFVpczJ5R1p0MHhhNkxVRjVDLzZq?=
 =?utf-8?B?SSt0cEIxZzczQnd1NzR1TGVTdWhldmxxeFdpRS9CNFhnVHFHWUt0Vm85NTN6?=
 =?utf-8?B?ZkluV0N6b1JPaFM1OUpNMEUzNGZWakpWN1haMUZhaFNxakVPalVub2wyTjdX?=
 =?utf-8?B?UE04bzk4R2dpRFBKb1RJeEJmMm1YNEVHUnNRdXhaemxNMmYybXJFZ09ENzFF?=
 =?utf-8?B?SHE5c2NiUjcyM2IwQno3UlkvVzhGYVRVMEN2SVhVR2o5eEVRZG9rYU1CUFJO?=
 =?utf-8?B?aThlWXdpR3dkcFZjSE5Uek5WcEI3cmJ6WEZXMklDTHR1UEk3SnNRd2dCaFda?=
 =?utf-8?B?Vmh5MFpRNzYyd0hmcGJhb1I5SkVDRGt0c09BanVsbVZKdFBONHowWEs4Rm5l?=
 =?utf-8?B?MDVzMVpzdUc1UWhEL0VGMjFnUjFISmZxTWp4SVBQNlJZQXMxNTE3bksvRDZq?=
 =?utf-8?Q?vHdewUNIQgdubWxWGYoC4yc9m2miYurRTaSLz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d21e3c-4495-4fda-d27b-08ded68f90fe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:08:43.8819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XRBxL8JiiQd92sbrCOUueBHwf+tiRvl1rKEn3VJhucnYDV6KFc9BeQJhT9UYJJxX7Cb8t9vQiQWdDaBph1I8kRz6U7wzTzWQ3+eV62kWqszdvu4m5/In6Tfd19IJC3pB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6886

From: Xu Yang <xu.yang_2@nxp.com>

The CR port is a simple 16-bit data/address parallel port that is
accessed through 32-bit MMIO registers for on-chip access to the
control registers inside the USB 3.0 femtoPHY. Add control register
regmap and export these registers by debugfs to help PHY's diagnostic.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v5:
 - add Rb tag
Changes in v4:
 - improve commit message as Haibo's suggestion
Changes in v3:
 - drop Frank's tag because it includes other changes
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index 9d1dd0e7352e..4949ec78d304 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
-/* Copyright (c) 2017 NXP. */
+/* Copyright 2017-2026 NXP. */
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/regmap.h>
 #include <linux/usb/typec_mux.h>
 
 #define PHY_CTRL0			0x0
@@ -56,6 +57,8 @@
 #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
 #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
 
+#define PHY_CRCTL			0x30
+
 #define PHY_TUNE_DEFAULT		0xffffffff
 
 #define TCA_CLK_RST			0x00
@@ -119,6 +122,7 @@ struct imx8mq_usb_phy {
 	void __iomem *base;
 	struct regulator *vbus;
 	struct tca_blk *tca;
+	struct regmap *cr_regmap;
 	u32 pcs_tx_swing_full;
 	u32 pcs_tx_deemph_3p5db;
 	u32 tx_vref_tune;
@@ -667,6 +671,14 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
 
+static const struct regmap_config imx_cr_regmap_config = {
+	.name = "cr",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0x7,
+};
+
 static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy_provider;
@@ -695,6 +707,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
+	imx_phy->cr_regmap = devm_regmap_init_mmio(dev, imx_phy->base + PHY_CRCTL,
+						   &imx_cr_regmap_config);
+	if (IS_ERR(imx_phy->cr_regmap)) {
+		dev_warn(dev, "Fail to init debug register regmap\n");
+		imx_phy->cr_regmap = NULL;
+	}
+
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
@@ -738,6 +757,9 @@ static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
 {
 	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
 
+	if (imx_phy->cr_regmap)
+		regcache_cache_only(imx_phy->cr_regmap, true);
+
 	clk_disable_unprepare(imx_phy->alt_clk);
 	clk_disable_unprepare(imx_phy->clk);
 
@@ -759,6 +781,9 @@ static int imx8mq_usb_phy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	if (imx_phy->cr_regmap)
+		regcache_cache_only(imx_phy->cr_regmap, false);
+
 	return 0;
 }
 

-- 
2.34.1

