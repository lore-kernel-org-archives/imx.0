Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011034.outbound.protection.outlook.com [52.101.70.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27AE2367B5
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 06:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769407430; cv=fail; b=DOdtytft/Z30m8gL68ir0wLbJOuZlRQvfLVLfbCMSGvZjscDnIsMIlQV90LqnEM2aQZ9jy9EFPFnDsycJZzeBpu4+Uk5omjpkRG0Em7mZJoDd5Qd0QKdzKWt9Jw6FCRRQ5p+FPVo7Jaxa8vN6BpMg3VVw7Cg8ugRXqATV2/9Cu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769407430; c=relaxed/simple;
	bh=+xZu6FEFTEIw30JRYFcbsU54D2tqUU7X4HmXAh8k51M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NLbuh3wGm45DLcn5Mv5OMh/kRAg0l7PBS3Jcwis4FGChldGrNqPX9zGorxt7NG8Q3vPZd5RgxuyDYdRV6rzVy0zwsRGJK/3kozux+yYCW9QVVbl7j4KZpidCYNOJbinZ2xXs2sA5A6OnVBXrpZeknotiHb2rQo/aenJJjOby4vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WAXHOP27; arc=fail smtp.client-ip=52.101.70.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WAXHOP27"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kug/pxgGJCux7a95+dSrMxp/oUupcbkoFSP6Z9YyilAzj9W+kiIukvSLZUfRtp8z5q+FN8MKOkc+r9N9SSul2uEOc6FtBTtLx0oNbjWixYhuz7a3qFScHRSKGIqTnuOSlA+rzJNiOGMAGTjWJvnstBFXB6/FawqL1YbUqEymmsBxdStJ/r+/KXeoO/MBJRuCy7ItFRMnpyPzyDg7dN7vCiyvqhsFBrakmAiu+qMeR7CZEyQlRNt7XuZgGTlXPRLmKZWSkda4q+eHHXyD8wcE9YSTwxSxD8XJAYx+hzunHRks14h85IsuI6tlTnftk3OLYRVcFMKrRLuOYDbkIXK+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upNbGfswllQHOg9XF53v0Xq4Kr9a0dD+EhFvhE2dlnA=;
 b=umea2+ftkReDSjNWiddzXRmKPEWEX/4GhKH3N05L/NThUcum6FxIkSYDCuKzJdCu/pz02SJJlIxGv1YaOMT2D9j0sbAAjpVcwGvGJZ4o0Nu5xHKHS1FJ4K7YLVBri6Kx1dEql/MGXb6Dep7TiVyd8i9/Qd48bQohzRl8lf//f+dvvFjwjUvbjK90N5E2Q++R0SyvzW69jMARekRk2kDydoCD7AYbNEt+GoH3xvQ7zxdgadDpE1EKn14fjcPeLedG73M6JN4ikRbO2u/cqNHUsjoqWzCHsdSpG7OltIKMLMaDbOElxdOQN2IV0CyhlPCgHKGBOYg+S6Z79ffTtgVBXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upNbGfswllQHOg9XF53v0Xq4Kr9a0dD+EhFvhE2dlnA=;
 b=WAXHOP2748+fY6ANhfx7p3xBYuwYrPSD+PuiqEKGYfmG1iy0u2wvdbmfDglVS6I+5Tm4JPT7vS8ki0e8oq2c3uA4/m/bAtmH2DjdhBCqomQ2zzNkFBobA8KZtWGl8CAMU0u+sBocBYs5kO5dtzOXSXi/3XHwkQTYzsJuLcwGvqgHFQ6PYR2q7j5bHDVHsfRz2aMhSHYcqsqsm2PD6a7JxXS70drQc3hGQps0rA+sARVQBG2or/mPstSX3B88avKDvbYFm+29RrbOhAkzU093MCoawx4zz4yxB0sqwNKCNHoiIB9o8x01/A6TUI5m9jGT82+mjU7ErickDlrs3y617g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GVXPR04MB9734.eurprd04.prod.outlook.com (2603:10a6:150:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 06:03:45 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 06:03:45 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com,
	Frank.Li@nxp.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] phy: fsl-imx8mq-usb: add control register regmap
Date: Mon, 26 Jan 2026 14:03:18 +0800
Message-Id: <20260126060318.815275-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GVXPR04MB9734:EE_
X-MS-Office365-Filtering-Correlation-Id: cc0d887a-85da-4b3f-5202-08de5ca0a9ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ah5+DDPQEZ4+8DP51LaIMlXFXJWtkBoEjUT1gTredB2Z8omzuqesQUyqBu5y?=
 =?us-ascii?Q?wvA5pX0z9s+ui/1Guz1bumQOxpr18Lj43vgegzfqENUMv9w8lqfformrebgD?=
 =?us-ascii?Q?8THtxjTyFqWJMfTU6uMS0E35lB622FGbl6T7xhv9kHq9iDhYoZYQzuzzGxnL?=
 =?us-ascii?Q?Hdc98qHFtfbqoUXLBcA8DE0FUli1OMiTB+ybDK0KHzraESdaaW/eSzLm/qMH?=
 =?us-ascii?Q?5dbmVCuUHcHhDY/On7ttNRhRmtMLoOBDAhbVxNuCk15KVPZVIC1nO4Ty+8Y2?=
 =?us-ascii?Q?SXvVcJ7AiShwH2ZR0uoPGO6ZLdzPN7lTZoxFGtPEcP5SRedHubcy9wC+268B?=
 =?us-ascii?Q?kBrCfAd4rJVU5x9lBv9Sqx5ob/absF0Khs+rzbMIsMOaFMAnhPI4IQJJiQ6D?=
 =?us-ascii?Q?gqYMTO/dkq338eQ3vQNuHCIDrqtPfa/ljGosKwOBHKP0iJD11/lYfi7jsPy0?=
 =?us-ascii?Q?OplxzOes8kh7sqE5rdaQK5gHVMNsp1HnxvH5Q0rvPaXPuk3d+Sgujc4wKi5W?=
 =?us-ascii?Q?p6HAC1BhDzfdiPdAF+FN2fz7U8oEeWi/iV2U8JzDpL1n7I9jXMPCZ3X6gAhI?=
 =?us-ascii?Q?qYWJB4oxPFezWGT/LPPRRe+kT5HWqbptzWzbKzwgV8tBAJjx3Pp7D9FNIjhc?=
 =?us-ascii?Q?aEB/DZjj8jgY387dG/LrGBkXw3n1oZ9CONA+PFc4kYfqIwJWufqxGASc5D60?=
 =?us-ascii?Q?qJhdJzsS7AvfX5/15YeEzcQHZAwQb5/JyzTvUbliaSp3gnLtiW+dhsuvbKd/?=
 =?us-ascii?Q?WkN9VLsBTsI+b/kbNfvZYNFV+nEAyCcIkb4zp0ghzwaO7bXguADNtnrOz32y?=
 =?us-ascii?Q?9Oi6aMdKuAErU2ZZWVHA6V63sGviEP6If8QuwyEZfjnEKha18Hc/b2n3QEmi?=
 =?us-ascii?Q?Dp8YHFCU8sY7NEV3k/cglLwQiApHiyrQ03c72wUiD8xWt79i7SmASJRRF0Ji?=
 =?us-ascii?Q?InFi/QMJL0UoKAaKrgxPv9cUVeJfYS04vbpbcbuunVFIQzP1iqqDv95XY2lE?=
 =?us-ascii?Q?3o94L8DcKGRLGmFrisG//yKdplNnM1pI5KLm/hSH95PXHccFGTTjSOUKGM+q?=
 =?us-ascii?Q?zTbPygjGFhtUyqUEFKvctleTzO5hbmgprp+d91awpPP6/bugpjM4Y2bGvbul?=
 =?us-ascii?Q?JSWxlPU6GEGuuF/8mLPSRUj50yGPPU8X5dXeebzaQD4elO4RRnzFk4Tyc3Ew?=
 =?us-ascii?Q?pkpBB5YUBpOVx0esrPigrofn1HkGseIv4yhwsdHdpDOMxvjOuuzynh4s/6Yj?=
 =?us-ascii?Q?/k953EcpCIVZMR6jNuKTFZUQwwdkFuZ2PsshtwdT/0ALEWYZEk5d3228CKg7?=
 =?us-ascii?Q?6b4ZijQLwbF0miaJea5K+k2cMGzevPK1IeGQJxbm7PBMezaWEihtctwB3Uj7?=
 =?us-ascii?Q?+tVNXKF3xl5cPW/PKlv01hkJY4CSJbcVs+7NCKQYuc6OEqb+el+4q4tSm88u?=
 =?us-ascii?Q?0oeUmeft2+NNM8txa5bUelHVJ2EOVw+30OwRqFQvQ+O+zTr77t/mACYu7Mdc?=
 =?us-ascii?Q?QCu7ULKBqxMcAvzeCVqGE7kXqASI63kcMte+0zJcYLZ1i0876gEAexRiEjTL?=
 =?us-ascii?Q?waB3befMKYJRAjJGLQhg4UeB6IQUr3cg31PiZlfeJ1n3A7nvdF+1J7S6IiXs?=
 =?us-ascii?Q?xNYgOsJVv/KovOe6Q0JFJjs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3CrQFpcAXJUOI25YFwmZ3b/XWC068kIcBy7oiekhvzKpdMIfiTHT+9qGZ6OD?=
 =?us-ascii?Q?U2jIc91dgqZvHOgPI1DOUY9Rm+tlHZPJKh3zJMJ0ovwXA19KUczZ7BAyMkJA?=
 =?us-ascii?Q?t70orakPV11ViCrVwtw2UQctFxNWPmzny7tZRsGwZSeTJqsSDe1S0yxM+DTI?=
 =?us-ascii?Q?28PPQgatI4Xxff6+W1rl/p8FR6tieYzy4WoWvt5RGq6uB96prPXAQBnzXP0/?=
 =?us-ascii?Q?4cG/wtgVEuFY2IWtcbYIDsc/1THSB012ahmWWPLZ7nsITVtEo2XaxArLgQ9K?=
 =?us-ascii?Q?Z7tDazFM+5xWnyJqFWdyzAz1HcyMlgC+KJeT4suGF8FCHME17BxRaTQ97wYs?=
 =?us-ascii?Q?APH78pADpK+KDw4IwQJH7gNWHogFU8wKw3G70kgOa/Nn83hUPLZgS+K6GS8F?=
 =?us-ascii?Q?x5EXd5u9wKzlf1+v7hCHYcT75rZ5bmQDtzxUspBelfHqdbORNokBR85bkXnV?=
 =?us-ascii?Q?IP6U0fHWxpUq4lnGwitEdpqOWHp6THcA/7NUJv1UjQt42Bh2s3X1jX/wwRrS?=
 =?us-ascii?Q?EzSA0relIK9VRBaBmrPcMSSCsO9CdeH8XtWmq1lmqbamvKKasRJJucCtH2RH?=
 =?us-ascii?Q?z16OW6VcGnHODyAaALEuVaD7BoaZSInS5H/cPsfyUiOt5Gw+bS4AbBVlwUdi?=
 =?us-ascii?Q?+odoea520menTesSa185/j19qOyE5vdkT+cNGaNe9JHPO13H5e2NaCcpydut?=
 =?us-ascii?Q?Mw0fG/uUPFWdsCi9/Ju4U41HGVPhhFG/Bsr/ewxRbhOTctDV8FZMgP7dUOFQ?=
 =?us-ascii?Q?3PmH89fg5Jbe3hNhky4/1ay1hYmNHvZqzeBQe/o9oxa0mOSsYCa5p8g4ctn0?=
 =?us-ascii?Q?uldlMoGX61gQHheTWq2MdYEGF/g6LgiSIRO2+U2c68+olkGoG64NAlfHU4rc?=
 =?us-ascii?Q?4+W2D4WJENG5fhffrkh1IkgBs0GGYb2+SeproBZc5aOBYsw2GRUY87Xd+MZ+?=
 =?us-ascii?Q?BxBZ1Ka6whYbasxsQxXxC8Hm8opVSZ5sjd+3mndDVX/+PLo5DcObcMIqq2A/?=
 =?us-ascii?Q?LBXdQ6HRY4ysKU2NPH3XaZBp/5qz6Sjz/bfy8LTTQ5g29Oj0QIp+8c0EHRrS?=
 =?us-ascii?Q?CD9wP6SmH7rCRDRqwX6r+KxqrTxVFPB1NKhvKvHO7kVaq6wuuH/sDSJco2jd?=
 =?us-ascii?Q?3d3/KT4J4qfCGdzbFrpoiju/Hv8716DCodfExbL00YvK0n4Sb05rn2AfSDyY?=
 =?us-ascii?Q?SXQUdbqYRdmbLFYTLJhEpWgVOmIHBVi1Ta7ZrYwbCXv0eZ/cHS0AaYGKLLxm?=
 =?us-ascii?Q?/vNSBigR9kvOWnzkn2/nYWvL1aDyeFzHrvd/W+ETgwNxz02SkUEfv8msI6U3?=
 =?us-ascii?Q?4nasTE1SZh82JQ1SKXeyjKEdsApKd7abDXXs/9jV3L9NhwqkEzWOeZ4USRyq?=
 =?us-ascii?Q?LzkJvwQ8hH9WVTU2ys/Hu1GiT0mZby6/n9SXBIWjkB1Vdu4ItCafBeEpecyM?=
 =?us-ascii?Q?F1uOZQbSmoyyov8ounzx6gFFXxScfBptMmbUK5FQesJe39dJd+VUgJrSliXi?=
 =?us-ascii?Q?ZXWPMVnmIeg23P4ivtdlMP/qq+KruJnNkTGcSzF2IWmg8GA3NVV3CH+mfB8K?=
 =?us-ascii?Q?hknq+LgNOXidVD7D1UGTkhxlWZbC0PfSsWqPQwudkHDA/YVS6/ddkcQTUDfq?=
 =?us-ascii?Q?/lUmNub2mgWwLY9aqQPVUuUr6g2aqtPRjQpe99pUsAhSHqrq4sIO8FQ0rjn4?=
 =?us-ascii?Q?U93L35qd+jUeNpmjoMAjAV82UwzP2XxqDc0a1H/NsvIltCWMhjwmTD7HWOgF?=
 =?us-ascii?Q?rPyVZtvAvA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc0d887a-85da-4b3f-5202-08de5ca0a9ca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 06:03:45.0566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsiA6jEi/JFO9+ppKP7GeRD6YypZW1L+H7wAJywb9gh1JJlXDauNe4OYF85UR9PetVR3FmgbY7yyvRJ7Os9AjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9734

The CR port is a simple 16-bit data/address parallel port that is
provided for on-chip access to the control registers inside the
USB 3.0 femtoPHY. Add control register regmap and export these
registers by debugfs to help PHY's diagnostic.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index b05d80e849a1..958d114b0c83 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0+
-/* Copyright (c) 2017 NXP. */
+/* Copyright 2017-2026 NXP. */
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/usb/typec_mux.h>
 
@@ -55,6 +56,8 @@
 #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
 #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
 
+#define PHY_CRCTL			0x30
+
 #define PHY_TUNE_DEFAULT		0xffffffff
 
 #define TCA_CLK_RST			0x00
@@ -118,6 +121,7 @@ struct imx8mq_usb_phy {
 	void __iomem *base;
 	struct regulator *vbus;
 	struct tca_blk *tca;
+	struct regmap *cr_regmap;
 	u32 pcs_tx_swing_full;
 	u32 pcs_tx_deemph_3p5db;
 	u32 tx_vref_tune;
@@ -685,6 +689,14 @@ static const struct of_device_id imx8mq_usb_phy_of_match[] = {
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
@@ -713,6 +725,11 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->base))
 		return PTR_ERR(imx_phy->base);
 
+	imx_phy->cr_regmap = devm_regmap_init_mmio(dev, imx_phy->base + PHY_CRCTL,
+						   &imx_cr_regmap_config);
+	if (IS_ERR(imx_phy->cr_regmap))
+		return PTR_ERR(imx_phy->cr_regmap);
+
 	phy_ops = of_device_get_match_data(dev);
 	if (!phy_ops)
 		return -EINVAL;
-- 
2.34.1

