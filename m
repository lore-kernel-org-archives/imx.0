Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013028.outbound.protection.outlook.com [52.101.83.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2D235DA43
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 06:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306927; cv=fail; b=R0Niw7BPdPoeL1++6karkkt0ftgZIrGtCgC3zGHSQiSba5K9W5K2IUc52Zx5tS0V8i1it0etbBRy4KeUtdn2GEk8GADgUOj9IhsqPa1b87LY1KtalphiaGW0aE4kH5AJCF33ElJlkrIyYlQ6IF1HygHUVWcEFzfP4R/5zypv+Vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306927; c=relaxed/simple;
	bh=G0zfH9rQu1lSqeU8K8xKpXnW56MmTHDASgdvzIM2Blk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IhwCp6xeZhRFC5sE66zlA59Po1+YB+PqCLJ8Wrh7BRwHqxEMmtvW+CjRsRanPpNfSiDqqNnZSUeG8Ig9wxaW7lkhuKFuxmSZzcegjs9oeDh2Cgb2OwY5PNfc/EIHNxpEtm3YZo9kk0gK5qMyfowhmrDdteyzieFG+fHeCs/OwSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qColNAye; arc=fail smtp.client-ip=52.101.83.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qColNAye"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LC2seevsJjPIrwUPwI35LLzs49aH+bmDNVMKXnGTm2KbuLbsR1+7Rm4FCFcE8zximk9keVrNW5RCk+PRAQSR60e2QcVVW3RO6hlemZryi7Hc1pGjyTolnJLaqLCYsRshjEuBUr5+vkmBIvyZB/O2r8ChoMlJkRGQ5ceKCrevR+qRFxIqgU2pmRRdgGssBLM4xRIZLYj47mwxmwQXPvXEhgUF8zxD2CgumajIIqG38/Xbjy0yrp93w359HKHLjcCHEoJ7PLwtDNI6GODUOHA4GResC8rrUrPHIdVbHLssfJhPE8vR9ebq/jEId4fcQl0tQ4UZIZ7MWKkKZKxGcYx53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5fygAARQFSwFuATzKhT7qJfogyNg5Vn7/r60PRiqLg=;
 b=BKEG0Q5tqKyH7DcMzno5nfJs2pILegMAvH/k6GYyxMvtMWGBINlTI9QhsDTxGDq00SXcxQaFWkxCF67rC+koGoRRKBo0syDQ+gs+s0fz9pF33MlznHszUkkbK9mcUlYHOIzdIR6V8qonQK4ykRRJNoZqIPfK/zH6UqaXMtYZbpwohoZvw8hNiOz8OG60Ljxr29R3GH95ljtBhim7xpEdBNQCSDD8cXdMdSCmAEvRNAdl37qZVbtQNfomMuXkMMf1Awu70iFplbNCg5EPh3sM/QB/+5MRf1clp9n9ig8P0rBI9KGd4PYrOamz7uE1Znk65PJLta5zg1RYm29X8HRbsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5fygAARQFSwFuATzKhT7qJfogyNg5Vn7/r60PRiqLg=;
 b=qColNAye9vcaBbZhbMPrf9WRW0c0BL45WjdDVe1A/xueR/ZJ0R4lJXXPpbY+F4BhPEKPqYI7Hw9dgq/XTnA3HVy3FLLZVW36h74bbDCsvKpquIDVduhsLTHBe91mRH+78EzgDN2OwQ3DxomYAIwQRQQF5iwA4CzW80Vu+GoppWo7S9TNAzmCTVnFh72o1dbj7Ebu8Qoz7lFczx2ybjduM5bewX3NCyYTcFnSbnKj1ziRYuZ8nElO9dyzuP1G51jQvH8qS5viKhw3SCM43ORd1jJJXabDZKB2QgYQuKi2cWKYubqIdAqcfHpNd0sF5wkH1r5tg+3hRDPaALjuZTzVYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com (2603:10a6:10:359::6)
 by MI9PR04MB826873.eurprd04.prod.outlook.com (2603:10a6:290:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 06:35:22 +0000
Received: from DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72]) by DU0PR04MB9418.eurprd04.prod.outlook.com
 ([fe80::130:1767:2462:db72%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 06:35:22 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Wed, 29 Jul 2026 14:38:33 +0800
Subject: [PATCH v7 4/6] phy: fsl-imx8mq-usb: add control register regmap
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-imx8mp-usb-phy-improvement-v7-4-c385ee40ade6@nxp.com>
References: <20260729-imx8mp-usb-phy-improvement-v7-0-c385ee40ade6@nxp.com>
In-Reply-To: <20260729-imx8mp-usb-phy-improvement-v7-0-c385ee40ade6@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785307123; l=3333;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=lyg56UhlrXHLLjAQyRu84OQkpZ4Qt2XIDozPEZSL4zA=;
 b=0i47qtHgzriXTCIFDuSZBofyUdRQmDi31xB8eYKg+CdkQ1LDsrDOxWb+J2iiWDLJrZYINWQNy
 nR6UlRcHKBFDpbr/87a36fXRHP1jHNMtC+pL5E75UOQSatxzJUna4nS
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2PR04CA0199.apcprd04.prod.outlook.com
 (2603:1096:4:187::13) To DU0PR04MB9418.eurprd04.prod.outlook.com
 (2603:10a6:10:359::6)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9418:EE_|MI9PR04MB826873:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c5e1c4-ad17-443a-3f59-08deed3b90f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|376014|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xZhnbkIBWkROGXmTOPHAth1UZleZbRIHogjMvFYjpy3H8wpbj5wzgFJNIW+D6HW8cJTM/dBpiVPGyL3rq9U7aBQsfWtZRK33Wy/gVxjYfsaxLUyZyjVdHO2b+UvWlv3sOT0dsJRP3q1TNi7DffWyr5zlTrdMGMtKufk38cNCJ+NcuQ5UpMMKhhCZY/RxBGmZBqvzpi04/Weq702Z6E9DaiuD0JrKJBHPjC403MR4NTpV2Ihjgk/25m67d3JpgK8t3mLlGaROh7cBIweiMoQ+sR5s3vNRcsm4fbvddJZJppnL51dzq9rsv1laGqRP3z/LFPr2PjKS8N7zMCOBVRXac/TAEl5DlKYpASxxqdjD09G6sSLjtVuPVkkfMkGy71QlGd4UBq2eRIkWVkCy5jMf2GJFDVuGUdp+MnM9fpk8iKTsVDSQmh3kjAWgFlC1xaTwGqFbVjF2nMrQ6OOVozKwl+mQV1e7p16DaEtKUIlfmH6QvRaugIDU7FRu0Wxaz4jC7NqTsuEoiblPTuDViGuN+VSMIhgfPYBnRS0DZZcwMtcdMGoq6PEsC5zOCcT/TB+0Ozg4Qi5WX9pBS636OEh+045KjPW/jGKJHjoI3E4DfKN9CteCmlJ5Kuqyp/uCmUfK8geqqds3yX9rLUJiju/mMQcqVs1GxsA+A/Vnh/23TC8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9418.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(376014)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L09qNHllclZmY2xKbjBVSEt4ZUxJUm9tTFdTMU90ZElsc0V2cEN1NkFlOE5W?=
 =?utf-8?B?R0g3YnZEeWkzamhWVjRIS3J6dDE4R0JvNHorWGw2UE1UVjJSMTJMdG5qUzlJ?=
 =?utf-8?B?K2Npd0Y1d1ZSQkVrNVFyeC9qNHgyUmFkY1NleUZEZTE3STZYOU9WcVhYdnRy?=
 =?utf-8?B?Qkl6UC9RVHE4NVRoZlR4enBHSEZuVUlDMWkvWUF3cGE1dEo3V0NzRERxcDZE?=
 =?utf-8?B?cStTOHkvZ0VIZnE5RHhML0RIaC9vcXVWaVhsUGZncHVyaDVqeUtHODdndUZW?=
 =?utf-8?B?YytTc0dTYlNEeTloRXMweUcxa3cvUnR5Q2JrMmZqZGswWTNkOU1KZEVYcEt6?=
 =?utf-8?B?WkU2NjdBRnY3cVJkYzlTU0xQblA2S3NKSjYzY3dVTGxCdFNzVmd1ZUZjRnBL?=
 =?utf-8?B?N0ZvS2g5bi9YNGg3cy9IR05QNjJhYlkvM0ExZUpmQWg5SlZQQlNzZlRrN0xy?=
 =?utf-8?B?NS8ydXRPT3hIN2dMblRleEowZms1b2xhV0xBVDFuaVFFdGhVS0dzb2ExREY1?=
 =?utf-8?B?L3ZqUVlzT3JIOW12ZnlsZXpBUWdKMU9WTHh6WGdoc2IrZ1JmekIrRzY4Y2ln?=
 =?utf-8?B?SlRkZjBOV3JIVFlJZkVJcDNiM3c4ZGtJTWlVSTBocUlxY0I4ZXNlZC9IeE42?=
 =?utf-8?B?M0kxQmpFRjViWU1id0FQR0RiSGp2a1llSEdxTzZ6eWxjRUoxamswN1FFdXU4?=
 =?utf-8?B?dVNaL1l3eG04azZmQnZ3aC9aV0crVWtXY3NscWxGSWJzaDRXaDZXRG1nNWN6?=
 =?utf-8?B?bGVzd3YzOEVPb25rNmlBZ1RFcGxFRTkvaWF4amQ0TFlhQ3Z1WndYZXNuYUtj?=
 =?utf-8?B?TUdIdk9GbGRVSTVVbG5yVzlsYlhZRHZCT3RUSnlEMW9XVjdpOU96Ym05dEM0?=
 =?utf-8?B?Tnp0TEc2U0h1cjBoR2NmMkNzMlNteXlyUjJ0T0ZjREIwK20rZU1uRjN3di8x?=
 =?utf-8?B?QUxNZ1BOYUUzWGN1M1YzelZDSUlSbGJpVndXa2w2OHlXTXVCN0l5NXRQUjAy?=
 =?utf-8?B?Zzg0NjZjTEZwejZycG9wMjZxWFBiZVo1c0hQaXYvcWUxNFF3b1NMZVpRMUJm?=
 =?utf-8?B?SzduR1FISEtkU3hVdXlyNGwvVXRXTHZhTWhRMTFUMjU2Mm0ydFBBVTZmSkM2?=
 =?utf-8?B?ZlNYMzBLT2FOaVo4M2Vjb1dNZFo5RWNSbUVaZ1ZRT1NnRWZaMi9XYVBFL0lo?=
 =?utf-8?B?bVhocEdTVHRkSUxSODU3VnBSQ3pVV2RrczN6TG91RnNMK29wTjBINEgvL0E1?=
 =?utf-8?B?WGRIU3RxanNUMFAySk9GQ0VRczlaZElmTllDd2ozdVpsTVIrL0VBeTkzUTY3?=
 =?utf-8?B?VExsVno4ZDFUa28zT2VnL2tBUGVRL3o3aWsrZ01QWHFnZCt4MnR3WXFMVWpN?=
 =?utf-8?B?TmE0Vm5zVzE0MkRuLys0L2JHbkxQRXJFaFFzSlhKVjZZOHlIMlcwcVEvNktl?=
 =?utf-8?B?MExNOCsxR0NnRkdjMTkrQmRCMmVVSmg3c2M5Qnh5cTBhdVRvZXdoMDVXN2tN?=
 =?utf-8?B?ME4yRVhyZDhkSkVsZWM1dlkvRms1QXVPSXJvcCt0MHYvdmtxMmszNWxpNzhv?=
 =?utf-8?B?c09DbWErdlhLV0N0QWZ4QTQ1Wk9FQTFOaHVYcTk5VnFJZXUySW92S3pmOTNm?=
 =?utf-8?B?S1h3T21oSW9UR0ZHbkdEbkFBMEhjbWlzMWcwZ3pRQXpNN0U4eWpBRFBDN3F1?=
 =?utf-8?B?T0JRN3hBNXJ0UEhxQktLNUVwekdyRGxEazNKcE84YVhUdVJIZnRBWEhiVHJ0?=
 =?utf-8?B?UGVsN3M5SVRZZ3d3eHFERUptUGgrUklNZ096ZE4rTkJlV2g3TlRsQ0EvTW9C?=
 =?utf-8?B?alRiYy9Pb1N5MUZsR05keG1OVlZlSmlyTUJaMHJKWVAwa1pNK0w3b1A5SURq?=
 =?utf-8?B?NnRXVEwrbTBYZm8yMUlJS2Mrb29NUVhFdkdSeldpeG5YZTZIb2RnSVR1dGM0?=
 =?utf-8?B?VFlUYXNVMkZEK3RVcFNpYmtKN3RBMjRkN0RKUlhLWEQvS0NESGM5NmVxbDdE?=
 =?utf-8?B?L1RkMmNGZzlNSUJDQ283WWJVcjNHNWxJcVpxVlRVWlgvUWtkaFgwVldFWXJu?=
 =?utf-8?B?Wk1zWkN3WFVlTGFOcUs4dDFxSmYxbFFqN3VWOGNLV0FJRm9ZbVc0dDFtMnVr?=
 =?utf-8?B?ZlBjYkRtd3N4akI3R0FnVnA5Tm1iekZlLy9YSW96cWYrZHpKWWdndVdxZE9o?=
 =?utf-8?B?S0RabDRwODdtM3VkaTBnQjBja25vZEx6UmVJakpKVjZkcE84ZEcwQlJLSHBy?=
 =?utf-8?B?S0ZuTi9DWVpnaGdzb1RGdzRUMkg4ajlZNWVXRzVDU2NLMzFsek1yRFJGV2Vh?=
 =?utf-8?B?TGVtY2lRWlJzalFVaDRycWx0T1ZaaklzL2pPVVhITUtVWnoxenc1UjIzTjNX?=
 =?utf-8?Q?rCGoZ1gf3i+edKS6a+5J2IJZJAmxv9NE8QDrK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c5e1c4-ad17-443a-3f59-08deed3b90f4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9418.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 06:35:22.7050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmbNm3iyOlg7NLF3t9HqAfqnvkkJiGwfMZevxaQP2SKTjRmjN1wTCgUI0CXLbSXG4GBnn0mlXFDoCF4V4irBiyBot9MXlMmlQz/pQgcHUWzuZHri85EvulnVfrjxclbb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB826873

From: Xu Yang <xu.yang_2@nxp.com>

The CR port is a simple 16-bit data/address parallel port that is
accessed through 32-bit MMIO registers for on-chip access to the
control registers inside the USB 3.0 femtoPHY. Add control register
regmap and export these registers by debugfs to help PHY's diagnostic.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v7:
 - no changes
Changes in v6:
 - no changes
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
index 74e665525ec4..83d5a44c4084 100644
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
@@ -696,6 +708,13 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
+	imx_phy->cr_regmap = devm_regmap_init_mmio(dev, imx_phy->base + PHY_CRCTL,
+						   &imx_cr_regmap_config);
+	if (IS_ERR(imx_phy->cr_regmap)) {
+		dev_warn(dev, "Fail to init debug register regmap\n");
+		imx_phy->cr_regmap = NULL;
+	}
+
 	imx_phy->vbus = devm_regulator_get(dev, "vbus");
 	if (IS_ERR(imx_phy->vbus))
 		return dev_err_probe(dev, PTR_ERR(imx_phy->vbus), "failed to get vbus\n");
@@ -757,6 +776,9 @@ static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
 {
 	struct imx8mq_usb_phy *imx_phy = dev_get_drvdata(dev);
 
+	if (imx_phy->cr_regmap)
+		regcache_cache_only(imx_phy->cr_regmap, true);
+
 	clk_disable_unprepare(imx_phy->alt_clk);
 	clk_disable_unprepare(imx_phy->clk);
 
@@ -778,6 +800,9 @@ static int imx8mq_usb_phy_runtime_resume(struct device *dev)
 		return ret;
 	}
 
+	if (imx_phy->cr_regmap)
+		regcache_cache_only(imx_phy->cr_regmap, false);
+
 	return 0;
 }
 

-- 
2.34.1

