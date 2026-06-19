Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010010.outbound.protection.outlook.com [52.101.84.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3CE36B046
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863409; cv=fail; b=bKaRGcTg+K+qK7fEWt7UuL+G2Dp0SRkavmhUzR4UXOE8qNsDjSDa5Knju7d/NZsIgBtevDcca5YXh2RfagClMokdHMCwYH3m1JyntnxTixU44diaieY50O7669N+Amzyipam/Pn9hfq0wkJIi4GF5VDH5Xun01tro4Zd/3cz6T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863409; c=relaxed/simple;
	bh=5NshE+sfAvoIPXs4kyEmgMjsvyiRBqrgCLP6Nz4CF3o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UV40o+oHXqPZdvPRWOefzOfaSogMQ09/cLZVNl7X0+6NLJqtr5CqIyvOk6FTKiZrfGygUGfkyKzQFmIehjiUQS9EGcwOzxpz1sayRYOR5CU7CcqYNCTsdjE89rh5BP02JnwgW8qeuk49sKlPpkXUEeobNdXWcgV57xeg9C7b6lE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZSuff5gI; arc=fail smtp.client-ip=52.101.84.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZSuff5gI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBPSEoDNlEbZHaZIL56hS19Z7ZlPCXxBG5pgM18csKms3uK7LMC7KMDp9ljZGo3ra+7TNXo2k/rX183pJPWJhavnX7c/k1efuPDSSYge4iEyRXOZFYFCQ+8HevgGgWP+4xLtoOHeO2PnYrrFj0qMUCpn5Il6mbnRejqEFqqagaFtp+/mNrRRbyru89JIIdlXnfnPU/idKRQOdAOkYtqwyhIE23cTenDTblshi7owdSKY0cm6s/9nhOAjozZPBfb2qBzg8xKVoCMFdwazRQUZUXN7E84EhNDRTpgj1jGcPZUtImLpKg+lyNJMuCsZcoefpztXTg19YGjbBoOtnQaL9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gg/HF0kDsh0FDwMC3ZMXewITu6TpSB9evhKrGvquT7U=;
 b=fceyRS+3LQsGgy13YaSzpQil3luKbfzYtgzON0kRPhMQbhlB0Mm3decKu4BXCAdqf2+olG5Gn0ZdA/5cXcD9+rWl+6ub85D0w8ISh7R9g/17r+frgDepyw+kR/SCIvqfy3OosSiEo6EErvfkOWb/Xsdo06lVBdfTxTM26JWSc46LtLXWg/icLznLXz6PcggOB22Q23Sh2QJqdQVSo7xJ1L4vjR1fZd5XT8tftaBAwhrOgvAAlyrXTxmj03igl8Jhlu5tjuNSyIvb15noY4TNSbwadjfecr0ZUzPs54Yz9U/qlDBeqP2U3T3znVI/XhrUFi6edSyOlp0GM5+VwTSXsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gg/HF0kDsh0FDwMC3ZMXewITu6TpSB9evhKrGvquT7U=;
 b=ZSuff5gI19wJlzgkeB1R5K9z9AdEWmg0iyW1wPWxYxfrp7FIMT8fAGmw5x9lPoXEKsFlDMk4rhAHnIsvMrSfOqO0LOxMPxWTBgbwkM1Eee/msiArL33U4Qn6g84KIPoay/GkoaTi7aO/1vXI4GyetIjzql8RMEzKFD38szuaEeUVdF3lx6y5SDOlvfdULJp/JAKlLgCSwwjmLZjfTie1D1YgPLhnd0PISH0zOI8DT3CRmKuG4MFl7XpPhcbIzRaF36SNjIkP5pMhrridWSuKIbb5SSPRe1AKIL2FR9fnRBi3KmWyTyVK4TKzJ/eF39uo+dkg02Kz62f4u0w57sAYMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com (2603:10a6:800:1dc::10)
 by GV4PR04MB11425.eurprd04.prod.outlook.com (2603:10a6:150:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 10:03:17 +0000
Received: from VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c]) by VI1PR04MB9738.eurprd04.prod.outlook.com
 ([fe80::33e2:39d5:e3f4:580c%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 10:03:17 +0000
From: robby.cai@oss.nxp.com
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
	p.zabel@pengutronix.de,
	kieran.bingham@ideasonboard.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] media: i2c: ov5640: Add reset controller support with GPIO fallback
Date: Fri, 19 Jun 2026 18:05:32 +0800
Message-Id: <20260619100532.3779934-3-robby.cai@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619100532.3779934-1-robby.cai@oss.nxp.com>
References: <20260619100532.3779934-1-robby.cai@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0205.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::14) To VI1PR04MB9738.eurprd04.prod.outlook.com
 (2603:10a6:800:1dc::10)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB9738:EE_|GV4PR04MB11425:EE_
X-MS-Office365-Filtering-Correlation-Id: 40466bda-c988-4aef-1301-08decde9fbe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|366016|23010399003|1800799024|921020|6133799003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Kpk0jmVfihfSPM1UTu/R5Z5qbvSsZxy99uatt9kIRcBLZwIFhFwbJEBXrk2vjk4BP/dX+BTeX2LORwhBBgvrHL6zi9eIx9mvwiXxt8qPkSSQpbYQRrtsIHLZg8CNkHR5fkg1M3mW7T9qfeRyq8m2duyJ/WnuniNtqSO+ImTy9R9vi8ESlfOQf+v+75mrY+AMtgbOU99+E5lEl14LcFyMDk6tuL/AelBGWMzpyPr5Uc+S0a1Oxg5XBD0aPtGfxBi6AL3IjZuNOhk/MkJAT4Rn5BXJsRE2FJyySSrKIBwo9Qd7S6J9FPROwJ6RMr8u3Zuqk7LiqRpAhXsX1G6pz+gGVwlnoSpgLbPow72RtKOXeocVVeMfp4F5scWa8ktYMmDhGc+1/Rf9UMS9BV7NQtcN6RDdukbVeHtcr+Ib64WqXCSBmEZ2xHXNzzKZDE8XGPtV8ZI/F+JWM0vpYxbnYhMdGc5OJMPU6deM/6BB4pLeW6NZ9sOaFMQqGyVETxaXLmN1Z7xq9Ai7vLspVbGC65cG5MG638w7pGMDMc/8S1bW8BdOJceFrPgYXg6TwfLJnkYKMJyJkEgHXRx53E6qLkrGnR5WkkraPT1MpOZuBS8I7x+ngv/ZoOmZ8lIN/RLhJIRpYf0EPu4C/rLo6+e4ICK5tN9Hwovsm+ntXDoS32efxLn+fjrPTjd1sWEgKAwyRIc7rmOE4vIyg+QgSkuINjuXyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB9738.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(23010399003)(1800799024)(921020)(6133799003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L6guaUhKrphig+CfHerD4N+IsK5+2WRMDUZK0HBd5OmbdRQx60ZDxGPOG2WY?=
 =?us-ascii?Q?JglU9cl/hfzKa0fA0HCVv12UYgAWZeDktc2bw5IJt1CScYBF2altx/Ur2/TE?=
 =?us-ascii?Q?9/swAk9cEEtSKLjLgkhlZpM999KHH7i0jTO8VdEIt984KjvcRJmK+BsDkrqe?=
 =?us-ascii?Q?8A8nms3L8jR7cV3EGuWRpy81EQG3QKG+uvQztx2G2rrcQLf3/eF5QtRsi5YN?=
 =?us-ascii?Q?WSWySyN5TVwUfTo/JKaXgpHn6nXbWWcTrqRk+i18y5pr4NVU7n6sXhXjLAnm?=
 =?us-ascii?Q?djUp7eD9CYZUiSytruYkGx1Ts5k68DuwpFZhzhZ0wq9XiSnz5/1TsDV0pZZy?=
 =?us-ascii?Q?3r259GP6FgZhrgEqHsuyDRg9rZ6FsHyasC/aQPQDX35DBQocdsl6dhwLHuqN?=
 =?us-ascii?Q?4Nr23vdCg61VEeyNZYci55PEjxFbp7TuviRtmD++x68miJT8iWl+KcGeF70P?=
 =?us-ascii?Q?7qWNrPh2k7P7UAVbJlw7jN21U1s5o7+9HMjGUyqnKdazkOfVek/XO/5raQ8I?=
 =?us-ascii?Q?mEM/XshFyk0NlFIJ/iqJPyJorrsXqAuIOzHY6JqcOIUezyf323RkVO7EowqG?=
 =?us-ascii?Q?INXX1/WRRyCWet5PovctfIvgnVQurGfxSPzkoXc2KixVAUsSFpiOAEyioWfL?=
 =?us-ascii?Q?CnXF2WPDGvBX0S70UxSLkwi6+bs23pKlspPHPh1GDJa020Q62uHryVUMCq7K?=
 =?us-ascii?Q?3uFgL2o5TYFPiOaeOYfSsb30Jqe6Rrp5fv8JMpV1BBOnGifzywVto+g5s9LQ?=
 =?us-ascii?Q?rIbW1eHJySbqMBlaHevwYI95BGXI+yQKI3mqLC65YJLWRAm2Ms1yZ+Z3+ANx?=
 =?us-ascii?Q?TgNzR+AnYOcm58kn/XbVPNlExBdVxIPG8BST15+ogvqRdMDwFWBWuU2iVp6g?=
 =?us-ascii?Q?GjImSCyUYbbZEJmAPSmuIN9l9PlNb/ZBzcF9nE6X0pWB7uzYBlLOgISQnk+8?=
 =?us-ascii?Q?YC7WrUzGTIK2mTyuAbdW1g6h3JaeIjTvW69zbv+9Nkygy6o3mLaNb2qu8D3d?=
 =?us-ascii?Q?FznjrJZE3JFvpa2i84/W/ajQ91VGZsrWGQei4e9hOP6euNTiwAod4vHZ7Xv2?=
 =?us-ascii?Q?16hM9+Ca8GGXJJcoM/+MXMGEdALJXz4cv6JMAk+KpFslH4limoxMhbBF7CeB?=
 =?us-ascii?Q?a0Iq6DFfcDcx0D9KtYvAzG0j2N5lgn0ECTmEUdzseNVBLRPze/PRi6Ev5oJ1?=
 =?us-ascii?Q?32A07ba2fSBHj6yd3neophP7JtdM9WvWSGaCESbEBhgEg+m17NalrXhPsiQB?=
 =?us-ascii?Q?mlvQyq4m4CwesB0jVgCBvmo06vEU3S+EvbSTt17Z9q/8g6DvwAD49Y8n+AZt?=
 =?us-ascii?Q?HtlWC/VaCnSldw6nmgipyDDF7Z2CeNjNEXItdvmzhhsEWxIs1N1QPfVsv6CM?=
 =?us-ascii?Q?aqXziV95331g4m+Od7CL0exG2lfIJ9t8HSyO4LvcDh79hfItG6vBmhnuS696?=
 =?us-ascii?Q?W8qTkuTnTvWxcCzr9LSrKkwyFIxv4Y6bjztrlByuQnOfWqu/WSk3LC91oesz?=
 =?us-ascii?Q?Cb/UwHqIuZHdM83rQ80/gN2fkudevgroAMPoIfpqmI8SBq2XGU7LkCJCUziH?=
 =?us-ascii?Q?Bkk+Ed7npIkVgMLUj6m8eSzD4lcvA3oxrVq3CNOUhmVRhxNL/f3ljJ3RUkT8?=
 =?us-ascii?Q?mehyDXttPi7wUa9huviZt1+b0b+V8UASyVw59EMy5fd66BkE5pTEpXfTXrLG?=
 =?us-ascii?Q?uL+bmB87FkNG5L+wOCZfIF5yNxEAHdTsGb2jai8A8me/opWPL/GDz5sfOpSE?=
 =?us-ascii?Q?3hSEEzK4ePSxjQJBrAIv0em/ysZdQBDt4XPlqKFrkCcVji2/PedU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40466bda-c988-4aef-1301-08decde9fbe1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB9738.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 10:03:17.2483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJyh8YGaZn+CVdn6m8g+t2ajI0uBabx2YAqEXlajJoArozRhCqrYzSVF3ZBIs9nMg0uSR/reofMY8Dw678a0KA5ayNsty5juliHIl1JyzEP3jggfLZPGvSg9RICds9UA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11425

From: Robby Cai <robby.cai@nxp.com>

Add support for the reset controller framework by acquiring the reset
line using devm_reset_control_get_optional_shared_deasserted(). This
allows the driver to handle reset lines provided by a reset controller,
including shared ones, while avoiding unbalanced deassert counts.

Retain support for legacy reset-gpios as a fallback when no reset
controller is defined. In that case, request the GPIO and keep it in the
deasserted state as the initial configuration.

This enables the driver to support both reset-controller-backed reset
lines and older GPIO-based descriptions while preserving the existing
power-up sequencing behavior.

Signed-off-by: Robby Cai <robby.cai@nxp.com>
---
 drivers/media/i2c/ov5640.c | 80 +++++++++++++++++++++++++++++++++-----
 1 file changed, 70 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 85ecc23b3587..5e6db8aacb11 100644
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
@@ -442,6 +443,7 @@ struct ov5640_dev {
 	u32 xclk_freq;
 
 	struct regulator_bulk_data supplies[OV5640_NUM_SUPPLIES];
+	struct reset_control *reset;
 	struct gpio_desc *reset_gpio;
 	struct gpio_desc *pwdn_gpio;
 	bool   upside_down;
@@ -2431,6 +2433,48 @@ static int ov5640_restore_mode(struct ov5640_dev *sensor)
 	return ov5640_set_framefmt(sensor, &sensor->fmt);
 }
 
+static int ov5640_get_reset(struct device *dev, struct ov5640_dev *sensor)
+{
+	/* use deasserted version to avoid unbalanced deassert counts */
+	sensor->reset =
+	    devm_reset_control_get_optional_shared_deasserted(dev, NULL);
+	if (IS_ERR(sensor->reset))
+		return dev_err_probe(dev, PTR_ERR(sensor->reset),
+				     "Failed to get reset\n");
+	else if (sensor->reset)
+		return 0;
+
+	/*
+	 * fallback to legacy reset-gpios
+	 * GPIOD_OUT_HIGH ensures deasserted state for ACTIVE_LOW reset
+	 */
+	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						     GPIOD_OUT_HIGH);
+	if (IS_ERR(sensor->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(sensor->reset_gpio),
+				     "Failed to get reset gpio");
+
+	return 0;
+}
+
+static int ov5640_reset_assert(struct ov5640_dev *sensor)
+{
+	if (sensor->reset)
+		return reset_control_assert(sensor->reset);
+
+	gpiod_set_value_cansleep(sensor->reset_gpio, 1);
+	return 0;
+}
+
+static int ov5640_reset_deassert(struct ov5640_dev *sensor)
+{
+	if (sensor->reset)
+		return reset_control_deassert(sensor->reset);
+
+	gpiod_set_value_cansleep(sensor->reset_gpio, 0);
+	return 0;
+}
+
 static void ov5640_power(struct ov5640_dev *sensor, bool enable)
 {
 	gpiod_set_value_cansleep(sensor->pwdn_gpio, enable ? 0 : 1);
@@ -2448,12 +2492,19 @@ static void ov5640_power(struct ov5640_dev *sensor, bool enable)
  *
  * In such cases, this gpio should be mapped to pwdn_gpio in the driver, and we
  * should still toggle the pwdn_gpio below with the appropriate delays, while
- * the calls to reset_gpio will be ignored.
+ * reset handling (via reset controller or GPIO) will be ignored.
  */
-static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
+static int ov5640_powerup_sequence(struct ov5640_dev *sensor)
 {
+	int ret;
+
 	if (sensor->pwdn_gpio) {
-		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
+		ret = ov5640_reset_assert(sensor);
+		if (ret) {
+			dev_err(&sensor->i2c_client->dev,
+				"Failed to assert reset: %d\n", ret);
+			return ret;
+		}
 
 		/* camera power cycle */
 		ov5640_power(sensor, false);
@@ -2461,7 +2512,13 @@ static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
 		ov5640_power(sensor, true);
 		usleep_range(1000, 2000);	/* t3 */
 
-		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
+		ret = ov5640_reset_deassert(sensor);
+		if (ret) {
+			dev_err(&sensor->i2c_client->dev,
+				"Failed to deassert reset: %d\n", ret);
+			ov5640_power(sensor, false);
+			return ret;
+		}
 	} else {
 		/* software reset */
 		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
@@ -2475,6 +2532,8 @@ static void ov5640_powerup_sequence(struct ov5640_dev *sensor)
 	 */
 	ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
 			 OV5640_REG_SYS_CTRL0_SW_PWDN);
+
+	return 0;
 }
 
 static int ov5640_set_power_on(struct ov5640_dev *sensor)
@@ -2497,7 +2556,9 @@ static int ov5640_set_power_on(struct ov5640_dev *sensor)
 		goto xclk_off;
 	}
 
-	ov5640_powerup_sequence(sensor);
+	ret = ov5640_powerup_sequence(sensor);
+	if (ret)
+		goto regulator_off;
 
 	ret = ov5640_init_slave_id(sensor);
 	if (ret)
@@ -2507,6 +2568,7 @@ static int ov5640_set_power_on(struct ov5640_dev *sensor)
 
 power_off:
 	ov5640_power(sensor, false);
+regulator_off:
 	regulator_bulk_disable(OV5640_NUM_SUPPLIES, sensor->supplies);
 xclk_off:
 	clk_disable_unprepare(sensor->xclk);
@@ -3914,11 +3976,9 @@ static int ov5640_probe(struct i2c_client *client)
 	if (IS_ERR(sensor->pwdn_gpio))
 		return PTR_ERR(sensor->pwdn_gpio);
 
-	/* request optional reset pin */
-	sensor->reset_gpio = devm_gpiod_get_optional(dev, "reset",
-						     GPIOD_OUT_HIGH);
-	if (IS_ERR(sensor->reset_gpio))
-		return PTR_ERR(sensor->reset_gpio);
+	ret = ov5640_get_reset(dev, sensor);
+	if (ret)
+		return ret;
 
 	v4l2_i2c_subdev_init(&sensor->sd, client, &ov5640_subdev_ops);
 	sensor->sd.internal_ops = &ov5640_internal_ops;
-- 
2.50.1

