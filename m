Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012002.outbound.protection.outlook.com [52.101.66.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B06B372049
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 05:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780464881; cv=fail; b=SQzY+gF4notRocH8Wa62R8OpwzQ6VVFA/jDRMvCF/jpZyklGNtnIluBDDLqIh1mM1edqRR8DTxT1XpERtjELz1JboxBPgdAcHiHYVgLAgEYgsmbKrkO8+i6NYZC0yTM/tIxo671UkpIg30W9JAtNPl2PkdtjTiynZOq5UyFeM0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780464881; c=relaxed/simple;
	bh=k1zFy5T+zt+KO555Ji9eLQGix60NX84CvxCZeHIsSU8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Mub6j1DhuA4PygjT7batyconauFU0dBFcxD5pHjhL84+Hj7Vb2Nv1OdKeYTP6vU1a7WJyBt0wGVzQ0hDD49ZvXVZdmvxX+QFbXML9tRqrR/L7tYi6YrW6rxTIA7XG6F1+lNQkhP2BB8FfIZXUXlw+jKjZNCE8wlk+a1sNqiyKSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MwQjPcNd; arc=fail smtp.client-ip=52.101.66.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MwQjPcNd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShQqyX+2O4XS3VzD3tROmo6y8zf1aDDnSn4QttT37X22219aKuYdiXvqje+Ou4I4C56FNp89ZQ4bFgiDxsmNF5anO8Ou90K6Vt5MzwO3enhTjjv6rSUGOSU98xD6J6Aqqbm74b10LnGF2OHetIq4kHvu1MTX62cndyuKMSDqCI1V318s3WIzpPHRytuAMT6bRI8yd3YPWAllNUvt/Ftc7LgYGRUjf0JSjkgAQ0vMjk1qW66z67yoyvRUkm6uw4qXsBeKS3JzNWs84GNqqgJ2QsAP4F0v9UDgPhUgRTOdnHgUy+JcNCjYTeiMPRBEc363+kQpJLo3JNbMbvJ8rsAQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nt+OeIiZC6xw0TYAX7LYrBBfk/8tBSxXm0WiKMs0Ytw=;
 b=dAcwtjaQzHj93cnPUHyRUTDupFxLBECsB94ZZTQBLfu5pgF5m9ZTAiee8mIGSG6XW9o4QqJZ7pIdLM3ByfGAzKwXxwMbtv99nI8JLIw86guPVVLU3DpQBbx1nigF4dNJ8uW8Dpp2eWMETJZOzSLXUgb+yRDexLpEZLGFBHlp0h9CXNWPLhlUXWWMTuDNKctcdfReLZCiNDB1jdwvZ9hOXnkRBGgYzcLSBhkp3jWduSXygnr5dw1Fa+J8A1liJ2/hct3ZiJJBxhQumzuq4JQKzcz1tGXVzE1wm/wJbmtyV+kqpxsYgThpRwSL2TAPWXRN0K+NRPdZwGDQCFLgu7anJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nt+OeIiZC6xw0TYAX7LYrBBfk/8tBSxXm0WiKMs0Ytw=;
 b=MwQjPcNdjQ8PuTvEkSgHLwmjMhxdg2DsRkdZZ47EmjWZIqZb7Olv4hFRYSzYGGJtXpilVxx+B3LnxQTyRpfOEUhRfB1hgSzqvbtqhILZcsEXb0ZiwbVBaLhJ8cbFeeWQsNF1l0LNbzaeX6sN6/c+4q5PFXMvwePgKwC/H5wACgfpLguftnsZlHtkD88Wyla4/aad+dKkQX5cJLoP18jhb0t/ibLMnrwZkud9Y1ddU8ZJQx8Os4CxeGHlmII6vvRaqvkAIhy/ZyFoa+nRFR2P7qjBgo1MbA1k2Ul5il6JW7K562udJzNdiffnFwQ198CJlaXkv4fpqaaqVyXNr3V3dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8150.eurprd04.prod.outlook.com (2603:10a6:20b:3f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:34:34 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0071.015; Wed, 3 Jun 2026
 05:34:34 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 03 Jun 2026 13:37:17 +0800
Subject: [PATCH v3 4/5] phy: fsl-imx8mq-usb: add control register regmap
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-imx8mp-usb-phy-improvement-v3-4-7afb8f89abc6@nxp.com>
References: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
In-Reply-To: <20260603-imx8mp-usb-phy-improvement-v3-0-7afb8f89abc6@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780465041; l=3073;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=i3uz3mgzoRinmbGZIGPs0vdmGXlsJkbN2arPhg0BuEA=;
 b=eeG2K4NqN5umAAVkD8jFWd0nsmnk0NQgm8AJqc6CEHxcd30YPMwyFm+TsGQlZa8xsbmcO0EI6
 SVhGpMTTE/GBqGW8lVKilhDjl51NguM3Dk3jwyVjenaTDatVZFdBCg+
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c8ce0c-daa3-4582-f630-08dec131cb93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	a+SS6K9prcs4npSoRVwSyp2n4ZkxNiiiSVJ3l3SCrcTsTWE+/niXRAYwU9TqM/pllGdh4kHfSBunSUYWeL9LrknT5cEirygM50tbdC3QiXpfk3MjRk5d5tPicUmSlHBWpZxthYt7jsexRLYM5TjXMxM0wVxB4qCy9ACsaezy3rbepcewAfsIUxIARcuGYJ9qQtU34atM/BQDJ8GRNFRE9a5v9K2rlokCLpxcxchflJkyQXGRJeEndMHnDTcumuNUpoMIsXRVPSGbACwOmis1AaAvyguJGJkJNVq+wU7X7DOECPpM/okyWAbNvhCij7c2TMC4YCkQNSLmyUufV5xzj7rv0tW7cTuSVAJIcFCeYAqW9TIfkxmQy4+ASOj/c7cvYDOfUkxFMDHRXf5hdgBBWKwZ8/D22Gzh9ttO/yjJmgkd0V5/9PnIITedQTqSyAzfWuS+e08uquRsA0hyDzu1ILNeKgWT0Yj7LcocpLtAOkWauHZEQppO2bfc0/HvEdEBGZ2FrIROkrM88lzmSV2KteyfVJgzqY50f7/QgQyDBVs5BNOw/ff0dh8J+q4G/dgtpMHesuPTxt2XkeWXL+qETkwNPc5kR0HLcWUgDYSicWKPRdSuEegsFtw6Sz0LGxhkzo3M4KnlDxCFsxbEw4hs69RmuYv9nAM9ar/pIoVt6OLN8HqfdZdyaOtJ2BE9bhql
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3JDcHZlaW50WWJ6WFlaWTBZVVM5QjJEZlo1WFBsZTBZVGtnT2djMmZxNzFk?=
 =?utf-8?B?ZS9XUEV3Q3VEbDhBN0ExN1lyWC9QNTdWMG5DalY3VHBkK090UHZqL01WN0wr?=
 =?utf-8?B?OTRwL0gzWkpTd3NkSnIwaDdoYTh2RXVhc21QNy9rb0MxMiswRVJ1NWl0cEJB?=
 =?utf-8?B?Nm1ZdklJTlRVVTBkeTlXczJtVm8xU1hPSWRDUk0vRERRSzcySVZLQ2Z3K1BV?=
 =?utf-8?B?Y1NRSzd4Qy92QUp3SWRyTjUrNUw5b01ZTFY4WnJwdmdnYUFnQnBiUDROSXcx?=
 =?utf-8?B?bU1HUi9FTGdXS1NiUGprNUhidVlycnlJbVo1YXVDSklMZ1BWZEd3ZmZzbEtH?=
 =?utf-8?B?Ujl0UWlMazVxNlVuR1Z2anliTEl5eXN0V0pBNFI4bWFDa291bkh2U3YvTzNl?=
 =?utf-8?B?Tys1aFE3MHlhTzYvVE9naENKQ1hkTXBkV0tGNEpxUXFBUFUxcVZncitCZkVm?=
 =?utf-8?B?dkk1RVJ2Rk5yY3BpdlpvTXp0UDJwbytVbExaNDBBUEhPSnN1Wmw3NDl5TzMx?=
 =?utf-8?B?SXJSSEZLM0l5S2JTa2lwVHdGandnRFlVS1FXcndEdUVXN2gwdlN1UktubVNl?=
 =?utf-8?B?THlWRGpEQ2Z0cFlIUUJDWmZNN3VsSndTOUY2Z2ViNUFscUNZbGtrWVBaWWdM?=
 =?utf-8?B?NHZoblkzMitqejdtSXFza1BERUlvcmYxQnNzUWF6ZUNLYVB4ZEJXb3FQQThs?=
 =?utf-8?B?TWdZdEVRblhoRzRiWVdJNmowenhwUDAvVWEyMzNzTUNiK0I1RjhBTE1PMS9F?=
 =?utf-8?B?VmRrbSsrQWw3dlRvQW1Ba0p2R0JjSzZPeDlDcG9OMWJIcFVEMlJvZVdJelRa?=
 =?utf-8?B?Q3MvYTJYYkFFRTNZRjZYd0dlUUNkL0l5WjBxeWhhVkEzaU4yZEhha3hDVkRh?=
 =?utf-8?B?a21RNVhHNEdOVWE0cDRRNHJIZEpQWHhSOGE3Nm1nSGlhQ1pCclJlam5Rcjcx?=
 =?utf-8?B?Y21yK1p1eXcrOG81eHIzMDBDRDFRZ0ZCZjU1NTNFWVB1aXR2ZUh4S2RPZ2tB?=
 =?utf-8?B?UUJhQkkzckk1N2o3aUNkMHI4STlkSFNBK3huZzB6N1JVYUVPR09pNEJYNFdT?=
 =?utf-8?B?ZENNdkJEMzBBK3J6c3dkdHFTTW5xdHB1VFhodGxpeFZoc2tUR244TUcxWTBr?=
 =?utf-8?B?MjFPdUlqanRyVUUwdWR2WUtreXdPcVpTMENueTFvTDZiUHlPTTRYU0pDN0xT?=
 =?utf-8?B?SHNSejlsdXAyV0V6Y3ZEcDdFNEU0OWJ0ZWs3a1FrcTY0WjFzUUx1R3k1eDFI?=
 =?utf-8?B?WXR3RmhkT3FWVzNTS0czZ3Y3UStGaUMwMGRIYVRodEVhbTl1QTU3U2xkbGJy?=
 =?utf-8?B?a2ZUbkdxZWxEdy9YTFFWWjBLK3F2OW1Gamdaay9POU1uQkZ3T0x2MjVNWFhL?=
 =?utf-8?B?NEpvVlZuNlVxN3Z3MlJITEtDMUthS2EwQjB2UnlkWkwrUGRJUjJVcWxSMXlu?=
 =?utf-8?B?LzhWakNaMzBGM3RiSWgvMU9LY0k5L1l2SGpiL0lpbXIyaExtUUZqM0J2WFJW?=
 =?utf-8?B?ZUlmVytBN3lybmg5U1k4NndId2ZObFRxemJ3a24rZk5jUnlGcENlc0tOOWly?=
 =?utf-8?B?R1VEdCt3UVlHL2RZZ0tWQlZRaFJ0T0t2UVBZb1FPOWRpMTNSMlkwR05FWHJl?=
 =?utf-8?B?S09VcTVCVE5pUjRqMVhqdkZXYlpIL3ROWEw4TldMUE9vREhMU2d3WC8ybmlk?=
 =?utf-8?B?ZlQycVBIRG1nQXVwczlOeW5sSnNhdEhkWmhoeEFhbHdpSVdlMGMwWFYxaVNj?=
 =?utf-8?B?aTl0eG1KSWNpWU44YUVoZlhsaUVRVE1iaGtmckRTNU9sSTJza2hYZk52Unll?=
 =?utf-8?B?bmFNR09MUGVPei9la3oyUDNHaWJ0dW1qSVpsVDIyd0hjNit3VVk3YnR0YzBL?=
 =?utf-8?B?MVFFWmtNUFNjMGRiRkx5YlpwTFFtcllpeTlWWmFEanRObWt6RWpmYnpwYVZu?=
 =?utf-8?B?UDE5Y2k3NWQwYVlGYllmdUlCZTFkT1RqOUhQMVNUWU9TdGlHMDhBaHFHWmNX?=
 =?utf-8?B?TUdkckNhSVJqUmU5VUJRTnZTeFlvMml6a1hBalpsZHdla2l0VUVCMi9JVy8r?=
 =?utf-8?B?emx4Y1NGUUdXNlhrVFFiem1za1hlM1RYVndMd1lEc0wrVUVaWWNaSjdadGx2?=
 =?utf-8?B?K0hpN2lqelMzVjlENmlkQUpWck4vSUQ2MzRieVhBYjVDcEluMFFIQUhDSDdo?=
 =?utf-8?B?NXNaZnlBek9aTmQ2Q0RDNnpQQldkWTJESEFWMWdTMmZ0VEZ1Ni96MkRJTDhE?=
 =?utf-8?B?WndDNFkwRlNTOXZxZTNhTWNkakdmZVQxNTNXU2d2MzQ3Yk1EZnhGM0VEemtJ?=
 =?utf-8?B?VGJleEsraFdSRnFHNFVxMmQ2UFVkdWRmTUg5V1hNUzltemlWUE1aUXVUYlZZ?=
 =?utf-8?Q?vZ7Q6Vm8xH+IjeRba2kuJgqG6KxQpdBpEnqaR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c8ce0c-daa3-4582-f630-08dec131cb93
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:34:34.7548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sgF3glrB8JScURjN4dM0aXb5KDVSDq9q6FF3zwGFbuZPlrQ7w1USRvT+vNpTO3SkNcLcUUSZ2E+TdidmoOyjFLGVlcKCrJ5yByjpk6wdIpf3KW8L86zagu3jRFYeAk9l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8150

From: Xu Yang <xu.yang_2@nxp.com>

The CR port is a simple 16-bit data/address parallel port that is
provided for on-chip access to the control registers inside the
USB 3.0 femtoPHY. Add control register regmap and export these
registers by debugfs to help PHY's diagnostic.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v3:
 - drop Frank's tag because it includes other changes
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index b0092c34416e..cda88ea1f12d 100644
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
@@ -665,6 +669,14 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
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
@@ -694,6 +706,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
+	imx_phy->cr_regmap = devm_regmap_init_mmio(dev, imx_phy->base + PHY_CRCTL,
+						   &imx_cr_regmap_config);
+	if (IS_ERR(imx_phy->cr_regmap)) {
+		dev_warn(dev, "Fail to init debug register regmap\n");
+		imx_phy->cr_regmap = NULL;
+	}
+
 	ret = devm_pm_runtime_set_active_enabled(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
@@ -729,6 +748,9 @@ static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
 {
 	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
 
+	if (imx_phy->cr_regmap)
+		regcache_cache_only(imx_phy->cr_regmap, true);
+
 	clk_disable_unprepare(imx_phy->alt_clk);
 	clk_disable_unprepare(imx_phy->clk);
 
@@ -750,6 +772,9 @@ static int imx8mq_usb_phy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	if (imx_phy->cr_regmap)
+		regcache_cache_only(imx_phy->cr_regmap, false);
+
 	return 0;
 }
 

-- 
2.34.1

