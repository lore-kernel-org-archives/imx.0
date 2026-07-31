Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7032D3603E9
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 08:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485291; cv=fail; b=h60cfjK2xicr52tNtnyak+ezVgwn8XPAMWlCQsA1imAXBMza8+SsO41p4O/Zdl/ruZvkZfGvcGv3bcf47tIp9Y6V6+Wy6L4YzoCI0zZmkHNMH0DKcjpiiWxqSe1nKawAKVXDn0QtK+dwy3T3JEYfX4qxjL6B8toFhA2rNxpEHFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485291; c=relaxed/simple;
	bh=Y01Ej3LZYdNJh/S6LJonrTWIJSJu1EWL1XqYsX0AM+w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=f8Vd0zGBGN+ilBbZUJyMdjgjzXyLzjpmyGdDfNJlbDvbSO0JepfbrXYkJKdicH6cfFUAQGi4uzaX6reX81QkGStcGUQkU8dRsshfmQZDcoQKFmnULcCWNd3izVHc3l4pYYIL2F8nxcKQYxljjaW1EnFj8CNhdNAGZYMfD3ONPVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jW+KDXLc; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jW+KDXLc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwywNG3DWmf8m3ZmFbSScxp+FLajq4Tw0ItCL5ySpcMDGZc1wSv4x7Fp1fNSkAN6SfbXhVlMhmhzwKpBV/Kaw7Tx9tDRUrmQe+Xf6rX0JiE6dk7HSj1yPnLDp4Bdt0+9hGblcj45izo4aKcxpwfE67+Uu2fmGbpgSXFE18+fnixhzYmmtCLLB/VEiX0s6F6e2rM77+rdjt4rC01E8XuGTwfuoX3lDwURjPmIMc3wQpChhCuwb7fOqn1Hamjn1Cu3pzGmNpbBLndYGvBBHU0zYQlTMqDko6LccGiOWP1tryMWcsRRJRQc7s58wis71TCzE/rct9uvYveg1tHieP11aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8AW2opkCgleQlXAByWwLeErzFA1OEHaa+dWGPKwINA=;
 b=moi0lXCHrm2X4eVGHGv7vNtBdOPKmmNNpmGAOez49gwKLRGpzXXyrA6ZMWFVmca8FqGzQlgBC02J3VVtasO51AovN30y6PVTX7i2JZu+hgJXO7s1j8jfbLdeeATpTQL6/4WHZ74hZYdeXNpZssjBd5LvemBZW+El/U3VNRqCKxl5QV4soJn+yARKWHzeVuB8Lwl8lY79GjDma5tnfOAZLn//MLuUwvN2XntQ7PON7JZc5PiWOTcPaAYuDAFtBA/KhIl4RHAMH9KuBe3uLp3XxyxLSX3Ke6pd2gqadAE8Obcu6ZTDM0jfdF5kpl+KyzNln8jW0LV0bboGQRVyCDXAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8AW2opkCgleQlXAByWwLeErzFA1OEHaa+dWGPKwINA=;
 b=jW+KDXLcj3G2bteSLi7XnR4b6Rfb0Pkp+ux3KE1mOHY8pKWtxNaz14CXOpoizsz/8CG0KjNfW2ZwR4wLzVcci7pyK8+kFdpUDrhfAPP8VSLCqTOioYixvlwXTsW7Hf/KxYhIuUw0uYHgcmmPEIsbHD4qjMqqoedh1qD5zk5zLO6KDUfl+XIRJHV719DrpTqPlFFS9L/nY32UfiUjBpbnu0nclmnDqab5VfcQR8Y+/iSwhkp1mBB2JpsS/QkYeUTMJOj4TAhypokzTBlU9umjotZ98rBGZ0TF/XkeiSLHhHNYTf6DNrP7vDzFejmiM0UH4Iyuvj0PS6MdGuxdsfHpeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AS8PR04MB8657.eurprd04.prod.outlook.com (2603:10a6:20b:428::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 08:08:07 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 08:08:06 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
Date: Fri, 31 Jul 2026 16:11:23 +0800
Subject: [PATCH v8 5/6] phy: fsl-imx8mq-usb: introduce per-variant driver
 data structure
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-imx8mp-usb-phy-improvement-v8-5-2ec8d6b3854d@nxp.com>
References: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
In-Reply-To: <20260731-imx8mp-usb-phy-improvement-v8-0-2ec8d6b3854d@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jun Li <jun.li@nxp.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785485487; l=2929;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=vUv4Wkn/3mAebCH0NEmoka+o086CL5jVqE9DUzwhg8k=;
 b=in+wC3wS6P+HbcY1WXmRiYTuNTb/EdbZrPW+5odXNKDAIcVo89ZhlKHVUP4Zsbst5Fe+W+V87
 d6rwIq9RHDDCDQbz5tR9h9yYqRa6PLjBSwtxqU+eGMJQm2wUjTTvJXs
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AS8PR04MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: f168ecac-2d84-4db1-0697-08deeedada31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lpSxgUV//ltm0chk4Gyst13RR9ju2T8JtNURWbe9Lq/xnO/MnFNgqeh5NJhr7Sh3HpSzyRXtcE0nmqheRvMCl1vnZaOYSs6NmIzKXSTjbnZuNlaIlobMAIM9O+PSMS8tb2cUS/TFr4ko4MBCfAy6R53ZxzhmFT6gBr4y/NRIu7rM/VKq9mB05kWAdXxgNRIJQgL9cNYYX01lY2t1Q1VpKYwqI38xLgTYslE2oIpKb0JeCX8OL4b0xqsRxdXzwL/sJTT3Z1oWd0qZ+k/jbABkonnq7BcebInvysSwqYu8NZJcQRxiL/VUtlMwfHhgUbIXL72nbp2c5lsI/JhKyyp/94E7KFv5SBwdAfTSpYU9h+CGy7HnBKpWDZahQGz0W+U8Ep8IFEPOl9DG0NGB4+N2EPVQRo/C26Y8zx00t3J/nkqkqnt/HtW/f5wUuJ51asjbkosLlpwefcVaUGrxLrUrZ6bcTvxUgQsxpl8UQtu4UALpCzVDi+uC+bNpTrLCky+xFXyz/3NjeblZ6mMvqdu8t5zHme8h106jvUA8bNrnD/BTGxIAyRjQ35iyUXEqEsw+21VNqCuSfoHQHcMLE5b+wj1tZKYZTXOp40d1PL1+ILQ6BNG5G1q2d4JFPS9DuHnb3miS8Z4h2cUvxsZ4FyfT7QC3xAhRp9r4jwMhFI0Vs9w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFJCRTdXWEc3MXRXcGpGT2RaWGVaZlNTaFZ3Ui9JbHpTUi9pU1JDRDNSNEgx?=
 =?utf-8?B?Nm5KRk90eGVZOWVJbkFKWG5GbEVvNFV4N21UdWVRdGloS2loTDZDYlpLSmNq?=
 =?utf-8?B?c3p6UjRPYjg3NFJkTmcycEtsenZrbWhhREZLc0EwSk42NWxNZk82UmJ4R0Vw?=
 =?utf-8?B?Skg3RkVoS1NGSFI3aHNscnFvNE1nM1hsNytlWDQ0cTcvdHVaS1BVVHMwSkt3?=
 =?utf-8?B?NzhlTk9sWHQxNWQvMGlTSzRFMWJTc0IwaCtUaUtZVTBDL1c5b09PNVR1UTF4?=
 =?utf-8?B?cEE3VHpzaDBXYmplYWRzMkNuVnZDc2ZUa1BNdEcxelBOVEpBN3h1Yng5U2Fl?=
 =?utf-8?B?MmpHOWVwdU13SEZaNURZUEloWEdqenJWTEdxaEdndDBRYWJJWUR1djhoVU5U?=
 =?utf-8?B?VThaQzRLME5JTDhwS2hkUDd1RGdtSVB0RlNYN1pLNlg0R2d6c2tmdG1mdXVT?=
 =?utf-8?B?dlN6VERPNlY0SnRaTDNHc3NRUWhyRUIxZmpsaGhvSGZzNTlZdHNMQ1lIb0xQ?=
 =?utf-8?B?ek0yWFhBdk83RU8xZHdXY3VyVVpySmc2OVl1Z1dJOG45cHVxSEFCaSsybXZ5?=
 =?utf-8?B?VGpUWjdmOERNeHkxL0NHemZxQkZibHFVQUlXWkVJUXVkZlNUSC9rWjF3aFVG?=
 =?utf-8?B?R2paS3gzTXp5VjdUV0djR3RkbEM3YlFNYXd0TGVsekltMVovbXRqK0N0dlR2?=
 =?utf-8?B?b1Q4cnJhNTVtbGdPbW5WMmVXeXAwVE1ESnBPb1J1c0szTDVteXdlV0JlM2xy?=
 =?utf-8?B?eGcrSS91dUs1NisvZytQMXNMU3VSUXlkZ3pIQlRZNnlremdCeW1OR1JIS2o2?=
 =?utf-8?B?dHVnOGoweWpxNTBlcXptNzlxYWo5UjlxQUJhU1ExT0M4dW83Um1JbVpFbUtq?=
 =?utf-8?B?d2xxeEFGMnY1aSt6TFlmVDhnTkdOT2lVeWt3dVVTWmtSTVZTK2Y0bklMSXJu?=
 =?utf-8?B?dzYxNHM3dXJSUUpUZnJqRm45NlNRUnIzOVdkODl4UmF2bmY5ZGM1MzQ5anJQ?=
 =?utf-8?B?MVR5QXprMzhwUWdsd2o5TVdGR2s4YUhsWDBTU3N5ZWpoRmt4OWRncGpkM0tQ?=
 =?utf-8?B?bDRTV2UwSk5PSGd1RHpyNWhpWDY0RGkxVU1SSGh3NytWWGp2S2l0SkxtWm5p?=
 =?utf-8?B?alJGRkkrZGgvZ3lHME1HN2w1RnN4WVBDa3FKRWdXNjJpZXd2dWZxb04xN0RH?=
 =?utf-8?B?Rk9LSnJNMFFmRU9HZ0NsY3hBWm9OVXp6WHoxdDRySlJ1RUhiVmI5M2hBa1h5?=
 =?utf-8?B?UmNDeVpycU9CcDBoSUROYTQyUzE2YWZmT1RjNzdPbktFcjE3N0c0T093ZzBi?=
 =?utf-8?B?R1pydEhhT2d2OGJNWFVqakNVZ1loOXNYcHFvQ2oxcUtKeHFSbUt3bDE2K1VB?=
 =?utf-8?B?VlR2MTF2TUdPZnFmeG5qTXpFZlhUU3ZQYWxVbUJtQm1BRnVLWVZxakhoZm1h?=
 =?utf-8?B?V0xWczZlUm1LVnloTlFKc2JraW9DKyt0ZEM3Mis4K29VblNKcmFVQnpUQ3pW?=
 =?utf-8?B?bzNFdWx3bDdYM3lRVUN0ZEVFS0dCNlhJR0ExNmkyTktKYU5WSWNNbkJkZldy?=
 =?utf-8?B?TXY0d3FyUDZSeVowR3Z1RmxhUnF3Y1BKT215T2dmVUlCcldwU2xxV3BtWjhG?=
 =?utf-8?B?SlF2Z3F1UGovS0R5SEdLY0JJN0d3bFRmc0NraDZvWk8xdFo2STI3Z2RPU3kx?=
 =?utf-8?B?S0FYNlJlM1NUbmtyYjM0aDVNNjh4RnlTWnU1aHFISTZhS01SS0pnS3czaGhE?=
 =?utf-8?B?YmtVVkFIWFdLOHpMbDIwaUw3SHNWWjQ0WERnbHU2UzVaOERudmZkV25Jdkx5?=
 =?utf-8?B?WDlOWldMSmkrYithOGpJRm1YVUI3VjdTdUt4VnRpdVZaMWljL1cwU3NwdFQy?=
 =?utf-8?B?QURvNTRyOHFTWUJ3d21NYmR3WFpyTjlYN0x2RmlISkxEdWliR0h4N3dneEht?=
 =?utf-8?B?ZlZqbnR4Q2lIcGU3NXNYWHpyQmI5Q0xxRGYxNTdBNFFkd21aRWhDcU1QNmtE?=
 =?utf-8?B?Y1d4czZyYzNoV2dXZkxhZkhPeHFBSk53K2ZIT3FCRUhtN0VEVEJkaSs2MDNE?=
 =?utf-8?B?cThFR0RvZForNEVqRVV2aXppeEovdUplb0RDSXpBekd1cnNYUUFlcWp2ZVBy?=
 =?utf-8?B?N0JoYk90NEpVVkp3WklvRGY0SEJpYVdrRld4RlZveVJuOEUxek9Da3MyMzFN?=
 =?utf-8?B?UmpiaElIU2ovSzcyRUF6TjkxVCtUbzZpbkMyK3d1V29KdUE2SEtIcTJGRjZl?=
 =?utf-8?B?TlNYZlZ0QXVFRmdOa1I3dTJ2OWE1Y05DVXA0SXRzQUE0YXBNc0oyNWxTSTFO?=
 =?utf-8?B?L0x6blVBRGZ4ZlF0OVBKSXZQV3MvMU5lRUN3cjdDbEtSNVBlMzkvbE5hU2c4?=
 =?utf-8?Q?QQUJYFf4V1uxa0Br9JcqXOlhae3zhLCiMY/W+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f168ecac-2d84-4db1-0697-08deeedada31
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:08:06.6829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPHnwBcE+ERCYpC331gh95eKaFxfhtyVww/ctqOoIsXndVLedXtmsyjP6RpJtE7cRyy0iDUcX9iFNz4NAs09Ac5OsQYb1L6h6vE3b5D/w5mNUO1yL2oFpoeazH5gSSR/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8657

From: Xu Yang <xu.yang_2@nxp.com>

Replace direct use of phy_ops pointer in of_device_id .data with a
dedicated imx8mq_usb_phy_drvdata structure. This allows per-variant
driver data to be extended in the future without changing the match
table.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
Changes in v8:
 - no changes
Changes in v7:
 - no changes
Changes in v6:
 - new patch
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index e03f9dafd69e..ba7603a008d8 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -132,6 +132,9 @@ struct imx8mq_usb_phy {
 	u32 comp_dis_tune;
 };
 
+struct imx8mq_usb_phy_drvdata {
+	const struct phy_ops *ops;
+};
 
 static void tca_blk_orientation_set(struct tca_blk *tca,
 				enum typec_orientation orientation);
@@ -660,13 +663,25 @@ static const struct phy_ops imx8mp_usb_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct imx8mq_usb_phy_drvdata imx8mq_usb_phy_data = {
+	.ops = &imx8mq_usb_phy_ops,
+};
+
+static const struct imx8mq_usb_phy_drvdata imx8mp_usb_phy_data = {
+	.ops = &imx8mp_usb_phy_ops,
+};
+
+static const struct imx8mq_usb_phy_drvdata imx95_usb_phy_data = {
+	.ops = &imx8mp_usb_phy_ops,
+};
+
 static const struct of_device_id imx8mq_usb_phy_of_match[] = {
 	{.compatible = "fsl,imx8mq-usb-phy",
-	 .data = &imx8mq_usb_phy_ops,},
+	 .data = &imx8mq_usb_phy_data,},
 	{.compatible = "fsl,imx8mp-usb-phy",
-	 .data = &imx8mp_usb_phy_ops,},
+	 .data = &imx8mp_usb_phy_data,},
 	{.compatible = "fsl,imx95-usb-phy",
-	 .data = &imx8mp_usb_phy_ops,},
+	 .data = &imx95_usb_phy_data,},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
@@ -684,7 +699,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct device *dev = &pdev->dev;
 	struct imx8mq_usb_phy *imx_phy;
-	const struct phy_ops *phy_ops;
+	const struct imx8mq_usb_phy_drvdata *phy_data;
 	int ret;
 
 	imx_phy = devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
@@ -719,14 +734,14 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(imx_phy->vbus))
 		return dev_err_probe(dev, PTR_ERR(imx_phy->vbus), "failed to get vbus\n");
 
-	phy_ops = of_device_get_match_data(dev);
-	if (!phy_ops)
+	phy_data = of_device_get_match_data(dev);
+	if (!phy_data)
 		return -EINVAL;
 
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
-	imx_phy->phy = devm_phy_create(dev, NULL, phy_ops);
+	imx_phy->phy = devm_phy_create(dev, NULL, phy_data->ops);
 	if (IS_ERR(imx_phy->phy)) {
 		ret = dev_err_probe(dev, PTR_ERR(imx_phy->phy),
 				    "failed to create PHY\n");

-- 
2.34.1

