Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C6E33D50F
	for <imx@lists.linux.dev>; Fri, 29 May 2026 13:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780060918; cv=fail; b=ckF/VcvG2mdbN7v8RZnItqFEkpotnidthlKlinjJG0udljPM4APm6/h1M0czCPDFsb/Uc42hhP5DX04K3ahWuqzGOLBeeDD3se91ySSB9Rxr8jSFiv9SMmH1UEH3LeaI7bN33Kj0vaNdNvYCzBm0K5IMJR+uZe4TJk7YcEBn/is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780060918; c=relaxed/simple;
	bh=CHlpqZl44jVGETamKjtLYbM38KXyxxFB1yybSCtwNv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CE4ggrpcVz7TAgMWTZJL+4iQQoJGU8F5UsFoFg7Mng+BteIb0MaRT3uXTzT9BzOgV/WO92ETxBidsP8IGOHJOWpvD5V1bkdQhvnQ1uwtlI+6+zx+47xC00tjQpKMDkYhjyEVw3NAEuYJfsWcFOOKknZsg8ORciJHR15ZQcJvqV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JX7BEbET; arc=fail smtp.client-ip=52.101.72.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JX7BEbET"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BU5EMnT0Vu8KlfxVc+/bDjb58W3JiDQ9KFwKcbQYgG9jTSq5nyzUjkbiN6X8zf0/eO5MZlz2FUQ0DVxX2wSOKqjnG35V0iaJNJIVJcdr3fdQ6yppcARuwl7YzfOFE10yqqxBfz433hXPAHrTgHMyT/xckmg0X8YRsNW0U6yN8UmfhO5n3R+EpFOyPoHhxCfG9VYHQLzebOzvYphhzv8q8/Zd7DUDfZOLuoZqUb18UCvx0i67x7uaMOuhg0BK6qE2MOij/NoI2JGZiCJ+jNuamoeQxie8Cv1k343l2GHA7KRIasI+EnexURxPadOiu9xEpyk7F5qGkCqqOehdWhOcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSb47Cwjjyi4lLhMuJy/ixAmcAa1E+xis6XgYKRGOlE=;
 b=FGHF6oBnMxL4McWHzNOHSEGSUR/d3ln/mdaw5P1RqEQhmSgA1ygQzHxvdIZA+uTcY87t1jaLsgz3l5v98/zpMJwEQy5w5jFliah9NZapdLELYZD8/zv3Bqb+cYcRZcdE08UYIt1NdM0rd2K1w4NTOhf/C9C+XGkcuFNncxU+83PmuasZVhB5gNnWepmm//SoxvHIVw8WL4FGkLckSnL3Rf66bdRxk2/+1mqEpJGt4wUz/wZc7vZcscMS9jAlxrwUVLC68O074ijyQ8uLU1m/JGWYrB14VlAGVnXplU9CyYl29pzk909Kg+4nEgXB9Pp9dnSPVHTd5BZctLXIOWY+Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSb47Cwjjyi4lLhMuJy/ixAmcAa1E+xis6XgYKRGOlE=;
 b=JX7BEbETBlEsgEYfmmO5eE4JBPiP7fsrMCJTBw0EdEGOn/bR5YV28Z8Azgz8J4x2FuANo8RHdaCNVlnVh0TMVHYiwHVTE1TSVKuwhJELkfVKaDCcvwpsLTsvX766H+ZSXTIDxPUUIjzLP91zXzwhuRMh01BlZU2J4b2P/PY7DG+k2TMEnOVaYkUCgy8W9k9+6hBK3DOGVAz7d+sFX6LWYKOITbur+nX8S1Q6AqKz8O0lmwZ4vtC8kSQw2OMxFg8LLyBCypGMorMkQWCed4aLuN8Tmen+5Qb9jy7OId+h+WxH/N+4C7eAREUvwkoschf1oCn4JU12VBze3irWEfjbMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by PAWPR04MB11552.eurprd04.prod.outlook.com (2603:10a6:102:50f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 13:21:54 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%6]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 13:21:54 +0000
From: Robby Cai <robby.cai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	sebastian.krzyszkowiak@puri.sm,
	slongerbeam@gmail.com,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	p.zabel@pengutronix.de
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] media: i2c: ov5640: Use reset control framework to support shared reset
Date: Fri, 29 May 2026 21:23:34 +0800
Message-ID: <20260529132334.3333294-3-robby.cai@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260529132334.3333294-1-robby.cai@nxp.com>
References: <20260529132334.3333294-1-robby.cai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::7) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|PAWPR04MB11552:EE_
X-MS-Office365-Filtering-Correlation-Id: 6379659b-e3c3-41f7-9541-08debd854038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|18002099003|22082099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	wx2bF16JIESa+GjDPNVcCExJh7ICm2TsQDB6/RHkHotZREXHp8h7YmTnt+yPo3iRfcGy/raQ9BXxi0qN1K16yZ0eUro0//CU5FiyXAWwEGovxRPFIjfNAPbDypCSXSqeEzAvPAIt7KKSwDQQAUu1Ku6DrJkgfL9Q+u2UbTF9AVyubUsd73lIQXTcwOTYKpF0c1una6KwlKgUv1qieqtB46wLfDJKpF4mzNKmg86wWTHj5EILZbAZDcRyEx3lM8W5My+w3/DxKts+RbUZy6GGfR6ta5TzREpPDkOjbVTAMvG4Hb2/TGNmpR2x/UfeqRAbUPm5ex2l2OWtCWkqkOgE15CRf/AbWNTwC59JiXuPae/dcmwqOTuejRWoAFiN2sOO1W9TCLuBR0+abANY75AfFoaxFDLdr64pL+1FhThacOrqU0vvewp6scTR/J6EA3+2Nmu+XbBYQj9lHD6WkpTi9SV1RoPZjHOUKMSlcYuILNYDanVK6r70ZEt92Kw9OgF/KId24EMxYeXzQM7Dry3Hu1f+tupTKcEe2XmVnlX6Xupxz0k++bnBzN7uWNXg3v0kjfTgAB8XJSeqgv0x6ZBBYonAbPux6cRttVTVOrfDBx5val1P3G4Vn+svUy72eV09ydTqyFXr+wCM2RZGD+M4C/9Fusp9MEwYsPWDzfs35u4C/bfGOHg6kjP9f1pWODXM5h9Od2YXGO27pkTfy+FA4X+tZUk+dRIGTh97pcIbwCivCeSQduZyUgdylDADB4hMNdzhIM9adhjJeiDJreeRRQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(18002099003)(22082099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ltMx2skOxh5pE26Vues2YhgrzJRBeGctfLJYz3mBsfjUNUTEOd07th9jubUX?=
 =?us-ascii?Q?tjjdor6CiDxWrRGJbJkydUEwN9EF+NIaaMzQoZeSWuBtFpDtjGGFmzo6nwtl?=
 =?us-ascii?Q?IPNxN91HVRVgj6kqG4rWOdq1DRxGMnbdf2VjQhHJ29ua+oItDxOg7MbhFB4B?=
 =?us-ascii?Q?JAO/SVG7enLIaTEf2g0tdInjuhelBDh5mkhGGmHWI5ozkQhuNaiLXmVxLlL6?=
 =?us-ascii?Q?N/3jGCSJfROkkQU843qwOkE544n1jOdedkXiz0VCr6maMpUnUm6ClbL2eVUp?=
 =?us-ascii?Q?y8y06IT9cN4kI03Sa5U6eKJ68pIzfPw6li+55ArhHGCaIfbvsXQX3y6wT/Sn?=
 =?us-ascii?Q?slYY9kqYLalM1dcc0om8t+SUxjf44UAKVaEYDEvr3ad6gCS3jGJIVaIVo7Vu?=
 =?us-ascii?Q?Jafaowrh8nvFhHwvec5tghVRLCz8VRCtkVN7vGnbif6HQ85PZOTECSBeL8LK?=
 =?us-ascii?Q?R0h+2ko2UQ/tV04WEUUWcUQ7wXKtJE+Ls3qC8lg2DE9/ujXtExvOw0l5dZfy?=
 =?us-ascii?Q?IaGyhM4Tcbf0zCq+Dd84utmA0ekq8MbeRedYnLzDKekOLzU3z+Gm/p0VynZ5?=
 =?us-ascii?Q?eQjkDnyk+rxy5w2HFNjo2Pgr6SkA7it9nX2P+1OAH4q4obAiHD+I2wWKx66J?=
 =?us-ascii?Q?cRQLApd7AhcgFHyj31ouD9nFL6cwSMDaPgezBAvqJomcA7UUehWjlnfDsYkX?=
 =?us-ascii?Q?RiSU5lhGdhEVzY2aPzGaa7wvIysVSpzvF8dUapL3JbzmhXqvGEE6xq/eqh3T?=
 =?us-ascii?Q?dZRmBdcfAQMXlbZyecppJt3r5zckUOfCNrw/9A2dyxW8XQhvPs80eNhAt0PB?=
 =?us-ascii?Q?psqP8prixO741ByAtL9fGmXmiVXmbCVMeMzNNulbCj/FK4EhjvZZD0mGGalJ?=
 =?us-ascii?Q?eOOQGx4PvDX8nczNaoBacRVQG4sdG55MJUrI7PVy+GuVwMEO4IOA5TqHgCof?=
 =?us-ascii?Q?MiUoUnvvzWI4mctG3znLSe7mGk6zAQkQ/hwP4aalVJRMdLpjjkOI69IZLkoo?=
 =?us-ascii?Q?qljkk4lCrw2BwKLeEW3lh8FiF0ipzH3JhJlxjbuylZltt12Ug6vsV2vxvL0Q?=
 =?us-ascii?Q?6IaPmP63CwzJhRw7M3kFqpn4zjp/Ig/5YpVkuPnkgKIgDJE0Vjq5unxD1yv6?=
 =?us-ascii?Q?AExO4mhndC1fNS+7bbOoVPEO8JiQ3TK/go5DscGzZ+kdzcElkfKebLW1v3HR?=
 =?us-ascii?Q?frWrizivm086zTwTpMKwqrj5f0bmlliKnd00wunFOK1hZ2ZBDK2rcp5PqO87?=
 =?us-ascii?Q?OWMVazH958Sq0Jw/PCezAUMeXMsmORnV3YEcTTgGbDc/wSyz8Ra7FSVdJTgq?=
 =?us-ascii?Q?Mq6GoBTtBJUJmEDdE8B0g2JfPC8Xl3tquZlWoMHt4Ypgpz3Y9Rrilsn1RwnJ?=
 =?us-ascii?Q?L3IizZAQiUNMcIRGG949TbiWo5MSsX8HUEO9IKMQVywFBfj6oB8FQkd188EK?=
 =?us-ascii?Q?1YhYrHYWrouI5epoNMVDWF/17BIKIBH9EkJpjsBemquzOTgfp+ED01VRE6oQ?=
 =?us-ascii?Q?0gPwhyVRIidY4hegx2RdBWS+zaW+zU2O402aB6jik0P7BI0fSAIeWOIEdh14?=
 =?us-ascii?Q?GweVjwQWJUh8TfqigpWmRvwHuL7l6YPqtmgUUJ/Qih88yTUX6xHWahooaSfb?=
 =?us-ascii?Q?CvDHxCDQYIg04kuWouGBX5RWGw/5RWqVqrAQ6ev+DsuCHkwcx2wHlDkk/kPo?=
 =?us-ascii?Q?zg/3MGrF6TfDHvYA8cY+2pP74TwmnJn+hq3JCddEw4Ns5+OvaFihVObcW7pY?=
 =?us-ascii?Q?olIOMbvgSA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6379659b-e3c3-41f7-9541-08debd854038
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 13:21:54.1757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n0/hsvDsddqQ0Vth82SxzaxVhb0lpY1Tn0IjmUJujCQDMv/qAyYLvrBCnjur5QGWeANN5GHDehS7bqCmLwZpPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11552

Replace the direct GPIO-based reset handling with the reset control
framework.

Use devm_reset_control_get_optional_shared() to acquire the reset line,
allowing the driver to support both dedicated and shared reset signals
described via reset-gpios in DT.

This simplifies the driver by delegating reset handling and sharing
semantics to the reset framework instead of managing GPIOs directly.

Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 drivers/media/i2c/ov5640.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 85ecc23b3587..754be6573b8d 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <media/v4l2-async.h>
@@ -442,7 +443,7 @@ struct ov5640_dev {
 	u32 xclk_freq;
 
 	struct regulator_bulk_data supplies[OV5640_NUM_SUPPLIES];
-	struct gpio_desc *reset_gpio;
+	struct reset_control *reset;
 	struct gpio_desc *pwdn_gpio;
 	bool   upside_down;
 
@@ -2448,12 +2449,12 @@ static void ov5640_power(struct ov5640_dev *sensor, bool enable)
  *
  * In such cases, this gpio should be mapped to pwdn_gpio in the driver, and we
  * should still toggle the pwdn_gpio below with the appropriate delays, while
- * the calls to reset_gpio will be ignored.
+ * the calls to reset will be ignored.
  */
 static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
 {
 	if (sensor->pwdn_gpio) {
-		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
+		reset_control_assert(sensor->reset);
 
 		/* camera power cycle */
 		ov5640_power(sensor, false);
@@ -2461,7 +2462,7 @@ static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
 		ov5640_power(sensor, true);
 		usleep_range(1000, 2000);	/* t3 */
 
-		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
+		reset_control_deassert(sensor->reset);
 	} else {
 		/* software reset */
 		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
@@ -3914,11 +3915,10 @@ static int ov5640_probe(struct i2c_client *client)
 	if (IS_ERR(sensor->pwdn_gpio))
 		return PTR_ERR(sensor->pwdn_gpio);
 
-	/* request optional reset pin */
-	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
-						     GPIOD_OUT_HIGH);
-	if (IS_ERR(sensor->reset_gpio))
-		return PTR_ERR(sensor->reset_gpio);
+	sensor->reset = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(sensor->reset))
+		return dev_err_probe(dev, PTR_ERR(sensor->reset),
+				     "Failed to get reset\n");
 
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov5640_subdev_ops);
 	sensor->sd.internal_ops = &ov5640_internal_ops;
-- 
2.50.1

