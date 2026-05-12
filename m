Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF1638E126
	for <imx@lists.linux.dev>; Tue, 12 May 2026 10:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580579; cv=fail; b=IoHTUqfK8JZddjzLIa1HeTOct+8F29kGoTy9TSpkz0UE+EXE4ujAqc7fKVUG7mV10q8S/DGt3FMBM+OjydbBgRKiJFpGWiQzAG6r0Lb8UxGNXn+0vzrBKJICfszLshIgIWmef8/Brj7rfNeYVP41YQqhVZPzmUp9c1D6utMmYF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580579; c=relaxed/simple;
	bh=H6zTs7Er4ccRY+0OWHWAdDF/uhHNqwdbakeVv9tBSBU=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ozKyQ57xF/dUKyimeWyFu4cWs3PC+kBNglUyRTDdGNJ3s415lm4rmq6JHL5I/Noo0Dnam01rjxWpwvsC/LxYlvl88NybRo+SaovL4YL52Jk25k1rLq7w65NN81cT0bmH+UJsSvm+KaCtuCnJKgKBnXad8PA/3M52O1etlLU7Nbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eBd2ReRk; arc=fail smtp.client-ip=52.101.66.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eBd2ReRk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8ieRK6yM8cpdcU8twW8E0Xyu92ZIFUHtV7p7DxDCteKhUM4Xu/efAOoYN3jo6jFaZH9cZhUwBmE59Nir8Guy0njDSq8qVSTyV8kmIO+9pB3PMCYnJQ5LDkhf4/W6xjR77GPYxfYrzFn7huc6E//83llN6awn2LgP823WxkGk/tm3dSkdR+txC8Wj/suhGR+GXKdC93DHlosClqRILduPLC8uPkVfceHx0Shs4NDSuuLMucG0BM5MlcsyoCArdNHKlq8KL2suM2nUTCTXTIV5zDtFjX8yiaCtF9CU+rAQWZmqlgSTQjOMM0znA8bbQzvHPtrDhVHMFv8UnB4sk1n8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCXLhGq+OmzknWmDT1EHT5Nszn1l66nNCpRtTMD0mwg=;
 b=qZNprOtMoSh6qQ/KbDnqVJZ1rJ0bNLisxhU9nvxvazjmed2vzyJ76VPIpcm00DbgREWByDYAv+p7wJZkYl69OJD9Fiu2/Pw9IV3MRcjQ67orERqsTqHSeMf6PRHlIvbUmOw5s/sDclnSFXbltOwaKbqUL5VLUtDHrHn5TDo/+p0e4+DNlFmIA55UG22J1LXXG4LCpQ42LVJVWyfu+R7H9vZBcB/XKnTNcQjPbLKDBFeKPgyi/c9ByouekVq/FavCVj1g/rP3aDAQnC19DrJftKNT+yMzKGtqEeQLnCOr35BEWBS7M80Y4tW5XtlYfqwX0D3JHamZv4bqucr2Rw3VaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCXLhGq+OmzknWmDT1EHT5Nszn1l66nNCpRtTMD0mwg=;
 b=eBd2ReRkJ0vxolP2Eku8Rn0CwwG+hNw/MhJmmcrL0tfj+ApUSPm8qwjxbwAUMhFdCFWDzYTvgwwaUspHf5cMOnUY3UNtzi2aSAedPW739aOcmtEMUhyTXKD8ml7dxuZU8sfo24/lCtUL1QDaaL9lg5JU+8lbB4pl2Wcmb8S5Gz9yNDy6uqEtn6YoxoxJD/zXm7e+p5ct7jRofkg3ODx9Ly1eRq4+zylNAx5x8lpNM3dRVTcraqKYdSWAc3/6xRuqw188/PSJDRBnq9ywtCcVNwCuRd3mtel8fnNFnPtpvp2jnpynQWD7rMUacAQo8UY3zvDteI93dc8s4nlODgEqOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB9638.eurprd04.prod.outlook.com (2603:10a6:102:273::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 10:09:34 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9891.019; Tue, 12 May 2026
 10:09:34 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com,
	a.fatoum@pengutronix.de,
	franz.schnyder@toradex.com,
	stefano.radaelli21@gmail.com,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] phy: fsl-imx8mq-usb: add control register regmap
Date: Tue, 12 May 2026 18:12:12 +0800
Message-Id: <20260512101212.1498223-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB9638:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0eef1e-e089-4d3c-ee04-08deb00e9128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014|921020|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	o3TuQSH08MDje7m0cxZgtl9jCjTSSap3QM3XwGA+u2UnFO1iyx8ehxme2YFw5IyGzBV/8Lde/b+xzWpa9Vnp7Sj8pVDH3KSElnEaMk984EaiiEgTTHNq7B8TTPbHYexewGorPZl3D2tFDD3sKVUbK8s2qOwysFSTUngDYW/Jg0dlHDfjR+G1OYO4GhzR55v/R1lAnIlrZN691V1D5ezrGXMsOIrvpmDQ1iCr7WMhxYrdf5SriENHcliehSGv6mC/xzACVRd2h8KsIfI4AvIgTa9U5IFqJEbvicXTAQgjN3us4ZXER7+zcESXMMnhImSlZJXB/HwAzmvcGo4ygnlJ8Nonb1gJkC11cKxJCXjnS63r6Nvoy+BmAp2MU7axyy9J2GH2g623I1Dl0AWQ79kQH0KP5vtqDaKUi2RAjDUIp1ItXZe9B29uFR4qFyUUIhBQ1Pr1siTa/DbXU6iYQm5xIKNWHnE1zNvAyL+7jZ9TH1nsDZO7TeMTfFE96akuP+Hon9YxP7++gWfdFWTUHewRMqcDOALxjLJ0WWRJXQsL/dJKAVWIzAG9a3FfE0r1LqUNwBCsbN+8lcoCfYTL6EjmvGnjakQP+OKdaEkBTr3EQ6VuU9yCtvy9kPjY3UaOucJ4IwM/ENP5IuXlieqVbim4na/gw7aoFpcwyzJ7iHwGwyFcLzQylD+l/S2L8YqT7dQ5Y01y41oFKeZ7eTL8jF9xlSjJAYT1RdRjumxI4YfqWz7iUdBtItxWBfE6RTPgT2Yh01tRceJUGTy/Y6NgAy7KRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014)(921020)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JliZNVwo0RFFfVgBNWMfYTo+A6twF2jalOKXW4NWPh0PsAKixmEOSKlsHzsC?=
 =?us-ascii?Q?s85w8nVmrLFNJSC8Y5Y3tWKcR9IkMgc+tkp/Stg8IvR4sqbj6kZD43HOZAQL?=
 =?us-ascii?Q?ud+aTwcUdNBMgxkCdReWJFLIIR9HBJ/G8Ycd6tWw8vdhgOBbQ+4KKaIMw2u2?=
 =?us-ascii?Q?Pz+Xm5cpMFws/0FP1cAHyj2hs+XxQdtXr0Za89VmLWeVOkcqoWO/m6qip6dG?=
 =?us-ascii?Q?lILW7G+N631EHzxmHFDuy2uQDQ3WEsiIjN5YyfJMkwn8q9GScD0SvL3qjtgM?=
 =?us-ascii?Q?UvxjAv2IXzjvqFORjBpQaT1xKT0PcyTwje8q4KZPkidNkupz8LzZFULnceeU?=
 =?us-ascii?Q?FgnOA0eQkE3J/SUJYtQ16Ms0WoasmiTttpBR+vymad9dqFAT+b96j5jOPRQo?=
 =?us-ascii?Q?sC0vYMrJ/knAJEs1Zva0HGPWaUJT3J7uIyOMnZHfe22yzEJT4umYYDvdXlI1?=
 =?us-ascii?Q?mBnh+KsCf1qIn1onjlMBzXMKydoxKQMfw2zkO3+MqmEpQ3ANXAeChk2tOif7?=
 =?us-ascii?Q?qjyp3xM1BUrHqxGxrMJv2r88BkX1xyPkm6XnjqDzZzkybNuRdyjvi1vUzJSN?=
 =?us-ascii?Q?O9N0W4IvgQZgqYrk8RCHSMWTYu4k9mQZr0mxMjNrh0dPRHWYThM4mAXp9irH?=
 =?us-ascii?Q?pLZ1tPU+9nVicM5nbChpu7GzCicf2RwZPM2ZYYxh5Tv0SsXHIaRHmIvvKtsl?=
 =?us-ascii?Q?wKVkqlxZgkqvO9mSXa68on0GfJLIIBS7oYMfZoI4yIOU97irpo1hzN8vXVnn?=
 =?us-ascii?Q?n4C3QMTf40H9ja8jH8vkdm6lj3Zi+y7DXn3jHUdwAx+Tkm4hvJFq4GdHg0S2?=
 =?us-ascii?Q?F55hQUIsVHz6UWW94urAAahUdqFVhW3GIFbs/C3xFKCBMMvp5uRen+PBMCtd?=
 =?us-ascii?Q?l5sDmwJRs5UQ80+ESxM0WvASKihR7JS3iraFtUTDy5yJ03tyJ2D4w2++oPWv?=
 =?us-ascii?Q?CEQBjI/rvtbqWV/N4m81cRCmnuDCnPjsL2+Qcfii60XafJYuSve7bQ4EDmo/?=
 =?us-ascii?Q?+BcwSKWKFjqWt+HtOpYxsgVubP3rHIBZB35mbag+7Dzv2yhHGwPY5tRTW3j8?=
 =?us-ascii?Q?AQ11MHdUqmrjXoBHa5UrgozA0N0QENvDp+iAA8Diw7tX/eyvlPB3P5IxkXE0?=
 =?us-ascii?Q?LcdMjn0TG9SLqKbV5m4wolzXT6s9bti2HamqI3QHqvdfNNfnlEAQQaivyTcA?=
 =?us-ascii?Q?e1uXS9BRIEVaQ3OIozie3ok8L/EfDixTkBFLzGMqNkvgSiVrIjpkx3v3pSTk?=
 =?us-ascii?Q?SYhTSbct28EGhs3K7moSQYsd246xaUf3EBR++qm9olYWgmIBjXdAJ58UXEce?=
 =?us-ascii?Q?9YRGx5o7R/IPgNR/mTyRga978qQf/6tBLz6oQH+MF1I6/RPsM8XpYthfzNrR?=
 =?us-ascii?Q?MnWp5pL8RhAIjnIoSmNros7GZoh/B58CAN3ri+uSFzj+PLdfRqf0Sxoe02SX?=
 =?us-ascii?Q?/Ei+2i0/PP5aYzfg8lg6XXLthD8b9o7zKQGNQ8/5agiWcm/k7GUv1RmPrfJc?=
 =?us-ascii?Q?meo/T2pBRjpu7CF2vhmTAL2IbOIZTVmbB8cMQzqsJ51IUaj1xKQ3bEUbAKbV?=
 =?us-ascii?Q?vuPpOqoyguLQYJ5+frP6+IsbrTvNgBuqjDxEGC7y4H9aIBGEJlwR+bBFq/T0?=
 =?us-ascii?Q?TO6BYYZbelzes09p8BAynUkMACXVftUPyYHef29Kn1WkmXWUAzxIZiIRUHSR?=
 =?us-ascii?Q?xwGthhRKsT4BPH4q4qmGP8Ey2cnXrIHUHkI7cbxqQU2WKQmYqMIHN3YYD+DN?=
 =?us-ascii?Q?7ebK1ZW2qg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0eef1e-e089-4d3c-ee04-08deb00e9128
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 10:09:34.6290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yCuYac+Si09sxQvwot8vC9JziNw6H5HMUHJ0k36cevurpBO0m2+gsgqc5uUzBYGDemu6RZtAfuS9DCb2vlg7Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9638

The CR port is a simple 16-bit data/address parallel port that is
provided for on-chip access to the control registers inside the
USB 3.0 femtoPHY. Add control register regmap and export these
registers by debugfs to help PHY's diagnostic.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
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

