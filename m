Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010013.outbound.protection.outlook.com [52.101.69.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D8B34D907
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 08:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772612047; cv=fail; b=l7eUErT30o5wnamqhh2M9ogOzMrPAgowYiHLKeJQKokZvOgkoZvUWhmUpoP1P0x5B76OKONzn93u98PVTRUBQ9ayeyXsl8sAkZxALyuyjcqc42j10ZblfIEONbmYfif8TQhXGF/2h39Kr6NOVNtRRgu4RKOVj1eBquIGcstT/zI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772612047; c=relaxed/simple;
	bh=/g1Cj81SiZAhmj0y76zlr3OkHd3yV5gEFT6Rc3QcHZM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ggGPe+FC96+2wGJRG02mhvzBOEjtdoi9iO8g5/hwy9jPNI0K6mk/Y4NURGb6t2DSX6FR3GgXKA1AWrtf0FfKX3hqo+5bslc4zDoEzZRWpjnjMm5gU2x0vVMLOQdoM09nMpOklzxuhUfDa7Aob7ChYeA9td7acGGFPIE21tUZSRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hxgaq4qn; arc=fail smtp.client-ip=52.101.69.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hxgaq4qn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSCSuOKajXr9AisobfAiXj08EPd9T+TjIHE0+t+GJFV1hL+YmBeJKGrG8OTElzxJ/IBppVIiAXEEd1fboqaHppfhFZrlHeHW0I80/SAR/jOfXKk5M2EXtIpN1VJS/RN8N13MxTLI+G9mvoNcvI0fkgHR1uJytN9NQ1fDmSEcjRbbmcChmKEdULJOfjA1zDx6ak+AqpAbHCPD0k/mg0ahtEBHkR2JCRlgrg4cYgosgT9AQ2WEaqii9DJwy4NlnD2whFZevMjIiyNiMp85v5uuKLYN/S4bvLbAZoh97kR9HouEzrdrcgR9ZJkSbo8HyyesNAcIZ/VD4AgR9DvvahskCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RheqG8VKoXurtUZph32KCkaOsl2zT9kaxrRYmaNlN/E=;
 b=S7YZl737Bd8t9ToGs1k3ZhhIJrdj4tcI4E9QsS9WjQCV2NtA3FqPjDiBAk8ENRYFNNy3VGxc8vLMlfGPKXNq5R4D4ZqhHi1jFRH4rPA+BOWnnpMU2Rm2Xa+t/qg8xeS7rwpDIy8Ih6G5SYi/l5S1Q4jNA5jszHuYW8HsPV/XjwKDUUECMGdRJasqcQcoZq/qhu2GVZrksQcW6RFrcp40pxjj5q0zZb2p7hL+7cvk8iOMHV/d+TsnHhMhCM+LKTaBuAMgbtQYMAMTaCG0qurCbkUV81QLLiDDF54KCfJ6exGlYoInFnQd8kD1/lI8co11kgoY8gTiybyUcQ6HHiC3lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RheqG8VKoXurtUZph32KCkaOsl2zT9kaxrRYmaNlN/E=;
 b=hxgaq4qnt6ZGsL9vlMBaqn0r9jrvAFgxSGhkdctTbAUrl1K7RTviDS3EXYf3RvdpJ1Du+q1pGPyteGxNYTOaOY0tw0TaZi98v5e42DkWtWw9a68NbaRTjl9aDbhUltF7XvGyjKNmCNDE8eF32xhaI9gXx0vJ150NDNKQFoidy0dUYkNFO24X1Q65gdERrRFs80RT80hGlfV1niEsltmeI4bKUMItlLM1ajxhWKOef5G2a6ygJuSw6bHvkBGE4DAdZSvm9gSMKirFD1ruN/KYOdHehQ9oni7GJfIGom0LKrdJVUbcsz9FiOyzJSnFMcrLqJAB/M3Acd1pKqU0XKOWUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by DB8PR04MB6796.eurprd04.prod.outlook.com (2603:10a6:10:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 08:14:01 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 08:14:01 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: daniel.lezcano@linaro.org,
	tglx@kernel.org
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com,
	walter.chang@mediatek.com,
	jstultz@google.com,
	amergnat@baylibre.com,
	aisheng.dong@nxp.com,
	jindong.yue@nxp.com,
	xuegang.liu@nxp.com
Subject: [PATCH v4 4/4] clocksource/drivers/imx-tpm: Support building imx-tpm driver as module
Date: Wed,  4 Mar 2026 17:12:07 +0900
Message-Id: <20260304081207.4030882-5-zhipeng.wang_1@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To AS8PR04MB8420.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fd::16)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8420:EE_|DB8PR04MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: f4431126-d3c2-43cb-f135-08de79c5fe45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	l/SMbmV56fH/170R0k0FkXM4qT6oV11zfPQREexwkK8tS50DRWxyWyxYf7ZGbQ15JKunwamGwkb/io5MrJz7CWsJcV4oIGL2gYhnkkCY6s1xtt1wxCjgYzWuAhKOh4m4kw+w3K4XaGK6mnOXard4Qr72TzY3Oju2xNcSW/GKJKY3NvcuOYt+jhHfxWkNQGlgvtSoNdoEnlMdMdVQA0f/hpsO0IgWpXYnx8D3d38m6a1+xU9nsLDs/dxiGcPkb+9N0fAay1XkO1fu9vGfW5CJ3eLuv7EE8oUxirsvOmgADvgvBI+0+ov/Dgtbo3qMLVmRxZMTVrVsoFNNP8q6GAV5lM3LQsJY60IIfcW3mn+mm+KPJlJ2Fsca+yEDXQ8KxUskVJkUWXlMX6m2qI9dp404mfF52+220nfpqQv9bIgGSMl6en9agwfEOCQGaLPyzs8yFZrWpy183nD4YeX6sC7AU2EoeBNHMNvWlv0hXEDkY2CCPQ9oWT2RDwg1yHGjUp9GapgpDWGyFgVHfZEkjssLfs0qQxJlCylMkmA9Ind2nMFFys6AfRabn9p8RfDCGmWllOjYNMbJOfAPdC0+nv14lI1bsTaMnwRwVgKoO8lyDecdLWLC7L+QiAxZbLRqI3SxYwM+FOzuG5IX+LJFP9jZ2qvHbVjieTKfyBQz/qb2dIeLhY45y+9i5uepooxJkCAQcli1tLGdCExZI4dSsqXyMJMQ68/7pusqA7DD7eRPmJq9OQD+zwxygYTDLC4XygyrVzn3AwuFgebQ8IDyi+nK88c+wFG3dilMuzYha6WevN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YEK6U8OkhEJwV3h3OZkVuWxzKtcZpP3THoR//1l3u+IsaZ5sw7adhRX6NRKn?=
 =?us-ascii?Q?zl6QgOPP2dC/sCxvOPbdPmobMIUdtgbw3/1iF/GWdJN2WnQbQ2K+hUWF/D4+?=
 =?us-ascii?Q?1MmWCGv6pywoESwhv7fyT5+b89D4VomMWWFhfzuNMMWUc2Q9WKc9QXJyxnvd?=
 =?us-ascii?Q?KAw64MwNWRfiVWFqPsCbVkZdjVuFkAhfzo+1NwHEo437/W/qbcR88uhJnUnK?=
 =?us-ascii?Q?bjN19hUMi80PpK5HDpkhJxdRXEY2JazaverQaqHIHMKqWRtCVaj7yXoj9qCb?=
 =?us-ascii?Q?igBAdMiYf0b7pc2iMTS/7eCITq4+QmtNlyrQlu96IVTDJzro+ebqpmKw2Q1b?=
 =?us-ascii?Q?fZGCnqOzVcdGjzINv92NsjF7GorQ2uwx2R7LA/8dxjQ02WgSyMUQGe1t5ufF?=
 =?us-ascii?Q?VTqle4B5eDNuGyAngzuXCbO5gDdR2pHH2mr4PCXF7umLZrqPCi+I5jrEWOhH?=
 =?us-ascii?Q?PQVrPxW+IpcH84+Kv6xJ9N9uL2yNmREcRORZZm/UCg+ZvJOslyte8aQqNco6?=
 =?us-ascii?Q?2JvwWqBvQ4iTzpnT/yoiCCWG3sY1PxWu6OVFug8HvcLyoQd2i2aJqfQl8KEn?=
 =?us-ascii?Q?rNlPtbhOMdR8upLcO0R41I76bTRH/MLv1IBy/mDzGqQ466yIy+sEidZktCw4?=
 =?us-ascii?Q?OMk2RPT+Op0Zy3fAP1Ax+nMdoFz8g8jSNs/dknHbzHW4jD4lpf0Y6a25H8KO?=
 =?us-ascii?Q?WqFr0+kY7nfFLTDaZiSiV7YB6gvg3Zvl4lQF+8mhknVnb0BaKm6OmDcF7CIr?=
 =?us-ascii?Q?By07Eas7kQpEAuiHzAHemin0s0F3o7171DFgvCGCD4rjabuo868NACqD9Go3?=
 =?us-ascii?Q?j67PiEV4W/OHlcAXE25cndK4bajIskwP3KsYXHaOEgQKQjI4tflSTCRmjpY0?=
 =?us-ascii?Q?QaH+JhAC4Qpxun8WkoJFyopYjPJ3JREEGH74EWR/pRm57bbqKQPw0ytbF9UT?=
 =?us-ascii?Q?+IqWWE0ZPqmBngs0E876r5KK1OmYYIyPBL87g1JKYAByN2CBhRT+f1PUr1Q4?=
 =?us-ascii?Q?H7pAVcM5zlhpcOkSHkUUw4Xb0+9LKnWaW/nPbhsOwglQwud8vWg21QlGOIKp?=
 =?us-ascii?Q?ieL7A8ZkFUjAAvXvj2qgwqcCOsDy95AG95kJPQUmpR7aWBGWgmdLbbo50cyQ?=
 =?us-ascii?Q?+nY2w+dnfLi/hZM4kBo03Hsv4z0tgiMlqcLwiCgoujW5Mfa5zsTw6w43l8lW?=
 =?us-ascii?Q?qLUZtZYT2ZXL+fmxo13E/WxQ9Bs59+6gX/nytNuMr2hO3AUOzaLYHm7CwFte?=
 =?us-ascii?Q?9do9vDptnn+/HJZVmV5OeECDg7itcz4JNZ3e8tZpCksj7WUVLMb0BxO4pgBZ?=
 =?us-ascii?Q?IjkYKL4CFaeLz0onwEa6CBB2MskUi/jlscIMI6GjXmRw2eQdeM/M8lL8sbJx?=
 =?us-ascii?Q?oFzHm5+XQki7J9oyeiOjAVV658pDgtfwJfGej8+2YoqzBxxiaax4PEOyaUJC?=
 =?us-ascii?Q?tQQm37hlrDazZnlz94Z5luUx6psWqb+kBulYzGQ1XKO0SHF2rJZX623saqSf?=
 =?us-ascii?Q?Pt62zJ8MsT3Bq+W4JXeSZsIbiXfk4wj7eZiEIgRlxVyoK/D0iuxVaG7KCaIv?=
 =?us-ascii?Q?eKZDh3ugXd1RxYi7mgLbxpgWnwLN4anIrtufJ1vyZ615ClH4l84DL/BT73DT?=
 =?us-ascii?Q?TaN7zJPtJCxY0c7pPdCnTets1+hp66TbHyZJ2wAD3xD55kOiYzerTtMnxTYN?=
 =?us-ascii?Q?dLJdJnW2MIAW+lsbq+bY9Gly6Tr2aPCu8DNe7Gm7RumlI8WwVCYqMRGGE1AE?=
 =?us-ascii?Q?zwF82z+VHQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4431126-d3c2-43cb-f135-08de79c5fe45
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:14:01.6430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MH12i4qzQAoIni6rRlAMEPHvHjFgYBO/1z7vCKFV0GIVb2Idx6XOg99IDuMdpegX+PJGVAvIUr51vlQjvwtBvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6796

From: Jindong Yue <jindong.yue@nxp.com>

Change defconfig as tristate type and add platform driver
to support building it as a module.

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
---
 drivers/clocksource/Kconfig         |  2 +-
 drivers/clocksource/timer-imx-tpm.c | 36 ++++++++++++++++++++++++++---
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 2112efb85029..1ba3e9bca3db 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -613,7 +613,7 @@ config CLKSRC_IMX_GPT
 	select CLKSRC_MMIO
 
 config CLKSRC_IMX_TPM
-	bool "Clocksource using i.MX TPM" if COMPILE_TEST
+	tristate "Clocksource using i.MX TPM"
 	depends on (ARM || ARM64) && HAVE_CLK
 	select CLKSRC_MMIO
 	select TIMER_OF
diff --git a/drivers/clocksource/timer-imx-tpm.c b/drivers/clocksource/timer-imx-tpm.c
index 92c025b70eb6..419d094459b2 100644
--- a/drivers/clocksource/timer-imx-tpm.c
+++ b/drivers/clocksource/timer-imx-tpm.c
@@ -8,6 +8,8 @@
 #include <linux/clocksource.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 
 #include "timer-of.h"
@@ -152,7 +154,7 @@ static struct timer_of to_tpm = {
 	},
 };
 
-static int __init tpm_clocksource_init(void)
+static int tpm_clocksource_init(void)
 {
 #if defined(CONFIG_ARM)
 	tpm_delay_timer.read_current_timer = &tpm_read_current_timer;
@@ -171,7 +173,7 @@ static int __init tpm_clocksource_init(void)
 				     clocksource_mmio_readl_up);
 }
 
-static void __init tpm_clockevent_init(void)
+static void tpm_clockevent_init(void)
 {
 	clockevents_config_and_register(&to_tpm.clkevt,
 					timer_of_rate(&to_tpm) >> 3,
@@ -180,7 +182,7 @@ static void __init tpm_clockevent_init(void)
 					1));
 }
 
-static int __init tpm_timer_init(struct device_node *np)
+static int tpm_timer_init(struct device_node *np)
 {
 	struct clk *ipg;
 	int ret;
@@ -241,4 +243,32 @@ static int __init tpm_timer_init(struct device_node *np)
 
 	return tpm_clocksource_init();
 }
+#ifdef MODULE
+static int tpm_timer_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+
+	return tpm_timer_init(np);
+}
+
+static const struct of_device_id tpm_timer_match_table[] = {
+	{ .compatible = "fsl,imx7ulp-tpm" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, tpm_timer_match_table);
+
+static struct platform_driver tpm_timer_driver = {
+	.probe		= tpm_timer_probe,
+	.driver		= {
+		.name	= "tpm-timer",
+		.of_match_table = tpm_timer_match_table,
+	},
+};
+module_platform_driver(tpm_timer_driver);
+
+#else
 TIMER_OF_DECLARE(imx7ulp, "fsl,imx7ulp-tpm", tpm_timer_init);
+#endif
+
+MODULE_DESCRIPTION("i.MX TPM Timer Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

