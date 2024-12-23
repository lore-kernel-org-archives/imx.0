Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110CA1AF0D5
	for <imx@lists.linux.dev>; Mon, 23 Dec 2024 13:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734960679; cv=none; b=KqSPFgI/0lGQgTeA9mC+S1GPaIQy332z6f41Hzz3czXVQaanZQKzQchoGqxY3swMvoeNN+xQAxXJ8ntng60IkWZVaTTSjd3I7ggD+zfu8QqG2cd5ViV0r7bLUCVGTCGkfvnwn524D03G7r8z6mfiKP5ngRJqPDB6WT1z9m0w2AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734960679; c=relaxed/simple;
	bh=CsA8p5yHzaSIiP1c2/pE9CLJULSv0HYY6su7li6YTA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TEUV96+xK2DaMdJ5tfMY1yX2KJRWjR90s3NeZlrtoz49z00+mEkKbFLcensMAo0uvItsQdks3qrkTPYZLoqY0rmO864rMWUsJR9SW7YYGfaHLU5W3eqctA82KDuyX30D9KJB+JYheK1uV5YX4oHqnjCHanCw0QEqf5r+z+oxVp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlEinNrj; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlEinNrj"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so753141266b.2
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 05:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734960674; x=1735565474; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ajg7xx/d8ESd5hASRxHgzAQg5WAudGbS8KuIMOLuqU=;
        b=jlEinNrj4DSUb4LjZDm8BoRdpAfwgUiOmcPZU/1YwKELm4sFDnK/PJbn+QJHU0hNi6
         dJFv7pThaeR0u2XeyVkTAFkAvPOTT+T+TC+5kbaLyEmdgO+wAGrJ5pJB/mqCJkYwcB9A
         qZ6byZ2xlZ31QY5EQHoYMWD+kV0aa8CH0yLhRLRGEJK8wmAIvFxOcD9WTBJTca82sOcH
         0986GdlAvf9cX5iJTc5CrBN1dFm7bDY6t6ntYplv1rbHlv9YiCChImcYynX5kCDILjiG
         VgmTXkvEgxrCUe2oNkTR/mbiFaCkqebOB4hp0r1ZDrwKTo4dcHoizA5p4ofUNQRr1y/0
         z/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734960674; x=1735565474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ajg7xx/d8ESd5hASRxHgzAQg5WAudGbS8KuIMOLuqU=;
        b=u8ircezrmmFEBvzdf4Wr9JFXsf6E8EfMIh+IIJr9VRFNjwgTbWKD3tJtAHaocNaR6G
         Uisk+dH8wSdp5+sflLF6O6nnPjp7pnOzWfu/YEuJ4DSGFVwbUXa5BAeXI8PgQtlWrnuy
         9xB4vZWUU/xGAMk59/By2tiY7VfML1yMUjVDuiSe54kJ7KiyMJKXFHGSMz0CGsB92vSJ
         i5uZtZZCmbU3uZ6KBDNCPpvKuoh4aK1T27h5/S0GvcgnAUMQhg0YudTshCbYNb8c8YP9
         X0qeiqOQYuZSmJg45k3hHYTPdT/TBNHcvOm8qwf1MhbGmbLH+viCBfVkE5ecxozfm6Lq
         +u+A==
X-Forwarded-Encrypted: i=1; AJvYcCXA4lD/SariycrdQeMfRuTmCulfBXPdGxPYOeC/qsOdXNP8FDXopea3JkLiFugkrKf9qkM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaQzdnGElerBARk9itmkI9JqwbgZtYjvbykz5qjzyPpNf8BH5k
	0zetE2nR8wJtrQ4uqWNmBFifrXNUZVdDzoONb1yNq3hBzAtx9Zwg
X-Gm-Gg: ASbGncus3QACuABqYGe4uLIBTmQSPvLWOcnFYewIhmhDHAzlsk994mj8ZaDevsApu9z
	j1ZjoedTRbMzrhpTIIKI31hQZVpg3BlHKRE8hXGhjUBiaZXOTMS4kcrV/JkEJsN6/W70jvmhyGx
	drY02ii9fYzGRNn5AUAm2AfnoD2CmYjhdsIWcig/4ChRQfKOolQ6G6I+QgggZOENBy1JLIYIHal
	bBY5KD1hRU3oeVnmjCHvWpSBF+5HZlxnCUehabL9LJT5vWCLrDHg9ag/Z77Dd2uNfGhXyZwtSIL
	Vq3VGM7UCJGh1UD+R35EXItxaQ==
X-Google-Smtp-Source: AGHT+IHEjo3x7fD8aSiXxOmFUV3hV1/DIPle/JX4NtwkWVI7TfmAfR2G3lYPFinPk/RyEV7fRoWnxQ==
X-Received: by 2002:a17:907:6096:b0:aa6:800a:128b with SMTP id a640c23a62f3a-aac271305cemr1109984466b.9.1734960673411;
        Mon, 23 Dec 2024 05:31:13 -0800 (PST)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-232.telecom.by. [46.53.210.232])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0e895502sm523749966b.63.2024.12.23.05.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 05:31:13 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 23 Dec 2024 16:30:40 +0300
Subject: [PATCH v5 2/2] power: supply: max17042: add platform driver
 variant
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241223-b4-max17042-v5-2-e4e409723bce@gmail.com>
References: <20241223-b4-max17042-v5-0-e4e409723bce@gmail.com>
In-Reply-To: <20241223-b4-max17042-v5-0-e4e409723bce@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734960669; l=14031;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=CsA8p5yHzaSIiP1c2/pE9CLJULSv0HYY6su7li6YTA8=;
 b=Keb/p3VYxjVZja9jO9lwQQEdinxhirqOLuxsH5MHwjI27znBDcpWQoKTHZx3tZtxhXnayJngg
 u3oXVH4JoDcDqTpWmQCHEJtKAFzg6u1rgJT9PtgMNhcPdpz/hVeCq7Q
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Maxim PMICs may include fuel gauge with additional features, which is
out of single Linux power supply driver scope.

For example, in max77705 PMIC fuelgauge has additional registers,
like IIN_REG, VSYS_REG, ISYS_REG. Those needed to measure PMIC input
current, system voltage and current respectively. Those measurements
cannot be bound to any of fuelgauge properties.

The solution here add and option to use max17042 driver as a MFD
sub device, thus allowing any additional functionality be implemented as
another sub device. This will help to reduce code duplication in MFD
fuel gauge drivers.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v6:
- use parent device of_node

Changes in v5:
- replace *client field on *dev and irq in driver data struct
  this needed to provide correct dev and irq from platform probe
- s/&chip->client->dev/chip->dev/
- s/chip->client->irq/chip->irq/
- add regmap name to avoid possible conflicts in debugfs
- get i2c_client with common to_i2c_client(pdev->dev.parent); approach,
  not from platform data
- add device types to `of_device_id max17042_dt_match`, for platform
  version to be able to set platform device id, like in `clk-s2mps11.c`
  driver.

Changes in v4:
- rename module_init and module_exit fuctions
- rework max17042_init
- assign chip_type in probe function
- pass i2c_client as pointer on pointer, to use same pointer created in
  MFD. This allows devm_regmap_init_i2c to cleanup gracefully.

Changes in v3:
- pass dev pointer in max17042_probe
- remove prints
---
 drivers/power/supply/max17042_battery.c | 191 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------------------------------------------
 1 file changed, 141 insertions(+), 50 deletions(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 99bf6915aa23..4037843e25bb 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -16,6 +16,7 @@
 #include <linux/i2c.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/mod_devicetable.h>
 #include <linux/power_supply.h>
@@ -52,13 +53,14 @@
 #define MAX17042_VMAX_TOLERANCE		50 /* 50 mV */
 
 struct max17042_chip {
-	struct i2c_client *client;
+	struct device *dev;
 	struct regmap *regmap;
 	struct power_supply *battery;
 	enum max170xx_chip_type chip_type;
 	struct max17042_platform_data *pdata;
 	struct work_struct work;
 	int    init_complete;
+	int    irq;
 };
 
 static enum power_supply_property max17042_battery_props[] = {
@@ -573,11 +575,11 @@ static inline int max17042_model_data_compare(struct max17042_chip *chip,
 	int i;
 
 	if (memcmp(data1, data2, size)) {
-		dev_err(&chip->client->dev, "%s compare failed\n", __func__);
+		dev_err(chip->dev, "%s compare failed\n", __func__);
 		for (i = 0; i < size; i++)
-			dev_info(&chip->client->dev, "0x%x, 0x%x",
+			dev_info(chip->dev, "0x%x, 0x%x",
 				data1[i], data2[i]);
-		dev_info(&chip->client->dev, "\n");
+		dev_info(chip->dev, "\n");
 		return -EINVAL;
 	}
 	return 0;
@@ -812,14 +814,14 @@ static int max17042_init_chip(struct max17042_chip *chip)
 	/* write cell characterization data */
 	ret = max17042_init_model(chip);
 	if (ret) {
-		dev_err(&chip->client->dev, "%s init failed\n",
+		dev_err(chip->dev, "%s init failed\n",
 			__func__);
 		return -EIO;
 	}
 
 	ret = max17042_verify_model_lock(chip);
 	if (ret) {
-		dev_err(&chip->client->dev, "%s lock verify failed\n",
+		dev_err(chip->dev, "%s lock verify failed\n",
 			__func__);
 		return -EIO;
 	}
@@ -875,7 +877,7 @@ static irqreturn_t max17042_thread_handler(int id, void *dev)
 		return IRQ_HANDLED;
 
 	if ((val & STATUS_SMN_BIT) || (val & STATUS_SMX_BIT)) {
-		dev_dbg(&chip->client->dev, "SOC threshold INTR\n");
+		dev_dbg(chip->dev, "SOC threshold INTR\n");
 		max17042_set_soc_threshold(chip, 1);
 	}
 
@@ -907,7 +909,7 @@ static void max17042_init_worker(struct work_struct *work)
 static struct max17042_platform_data *
 max17042_get_of_pdata(struct max17042_chip *chip)
 {
-	struct device *dev = &chip->client->dev;
+	struct device *dev = chip->dev;
 	struct device_node *np = dev->of_node;
 	u32 prop;
 	struct max17042_platform_data *pdata;
@@ -949,7 +951,7 @@ static struct max17042_reg_data max17047_default_pdata_init_regs[] = {
 static struct max17042_platform_data *
 max17042_get_default_pdata(struct max17042_chip *chip)
 {
-	struct device *dev = &chip->client->dev;
+	struct device *dev = chip->dev;
 	struct max17042_platform_data *pdata;
 	int ret, misc_cfg;
 
@@ -990,7 +992,7 @@ max17042_get_default_pdata(struct max17042_chip *chip)
 static struct max17042_platform_data *
 max17042_get_pdata(struct max17042_chip *chip)
 {
-	struct device *dev = &chip->client->dev;
+	struct device *dev = chip->dev;
 
 #ifdef CONFIG_OF
 	if (dev->of_node)
@@ -1003,6 +1005,7 @@ max17042_get_pdata(struct max17042_chip *chip)
 }
 
 static const struct regmap_config max17042_regmap_config = {
+	.name = "max17042",
 	.reg_bits = 8,
 	.val_bits = 16,
 	.val_format_endian = REGMAP_ENDIAN_NATIVE,
@@ -1029,14 +1032,12 @@ static const struct power_supply_desc max17042_no_current_sense_psy_desc = {
 	.num_properties	= ARRAY_SIZE(max17042_battery_props) - 2,
 };
 
-static int max17042_probe(struct i2c_client *client)
+static int max17042_probe(struct i2c_client *client, struct device *dev, int irq,
+			  enum max170xx_chip_type chip_type)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct i2c_adapter *adapter = client->adapter;
 	const struct power_supply_desc *max17042_desc = &max17042_psy_desc;
 	struct power_supply_config psy_cfg = {};
-	const struct acpi_device_id *acpi_id = NULL;
-	struct device *dev = &client->dev;
 	struct max17042_chip *chip;
 	int ret;
 	int i;
@@ -1045,33 +1046,25 @@ static int max17042_probe(struct i2c_client *client)
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
 		return -EIO;
 
-	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
-	chip->client = client;
-	if (id) {
-		chip->chip_type = id->driver_data;
-	} else {
-		acpi_id = acpi_match_device(dev->driver->acpi_match_table, dev);
-		if (!acpi_id)
-			return -ENODEV;
-
-		chip->chip_type = acpi_id->driver_data;
-	}
+	chip->dev = dev;
+	chip->chip_type = chip_type;
 	chip->regmap = devm_regmap_init_i2c(client, &max17042_regmap_config);
 	if (IS_ERR(chip->regmap)) {
-		dev_err(&client->dev, "Failed to initialize regmap\n");
+		dev_err(dev, "Failed to initialize regmap\n");
 		return -EINVAL;
 	}
 
 	chip->pdata = max17042_get_pdata(chip);
 	if (!chip->pdata) {
-		dev_err(&client->dev, "no platform data provided\n");
+		dev_err(dev, "no platform data provided\n");
 		return -EINVAL;
 	}
 
-	i2c_set_clientdata(client, chip);
+	dev_set_drvdata(dev, chip);
 	psy_cfg.drv_data = chip;
 	psy_cfg.of_node = dev->of_node;
 
@@ -1095,17 +1088,17 @@ static int max17042_probe(struct i2c_client *client)
 		regmap_write(chip->regmap, MAX17042_LearnCFG, 0x0007);
 	}
 
-	chip->battery = devm_power_supply_register(&client->dev, max17042_desc,
+	chip->battery = devm_power_supply_register(dev, max17042_desc,
 						   &psy_cfg);
 	if (IS_ERR(chip->battery)) {
-		dev_err(&client->dev, "failed: power supply register\n");
+		dev_err(dev, "failed: power supply register\n");
 		return PTR_ERR(chip->battery);
 	}
 
-	if (client->irq) {
+	if (irq) {
 		unsigned int flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED;
 
-		ret = devm_request_threaded_irq(&client->dev, client->irq,
+		ret = devm_request_threaded_irq(dev, irq,
 						NULL,
 						max17042_thread_handler, flags,
 						chip->battery->desc->name,
@@ -1116,18 +1109,20 @@ static int max17042_probe(struct i2c_client *client)
 					CFG_ALRT_BIT_ENBL);
 			max17042_set_soc_threshold(chip, 1);
 		} else {
-			client->irq = 0;
+			irq = 0;
 			if (ret != -EBUSY)
-				dev_err(&client->dev, "Failed to get IRQ\n");
+				dev_err(dev, "Failed to get IRQ\n");
 		}
 	}
 	/* Not able to update the charge threshold when exceeded? -> disable */
-	if (!client->irq)
+	if (!irq)
 		regmap_write(chip->regmap, MAX17042_SALRT_Th, 0xff00);
 
+	chip->irq = irq;
+
 	regmap_read(chip->regmap, MAX17042_STATUS, &val);
 	if (val & STATUS_POR_BIT) {
-		ret = devm_work_autocancel(&client->dev, &chip->work,
+		ret = devm_work_autocancel(dev, &chip->work,
 					   max17042_init_worker);
 		if (ret)
 			return ret;
@@ -1139,6 +1134,44 @@ static int max17042_probe(struct i2c_client *client)
 	return 0;
 }
 
+static int max17042_i2c_probe(struct i2c_client *client)
+{
+	const struct i2c_device_id *id = i2c_client_get_device_id(client);
+	const struct acpi_device_id *acpi_id = NULL;
+	struct device *dev = &client->dev;
+	enum max170xx_chip_type chip_type;
+
+	if (id) {
+		chip_type = id->driver_data;
+	} else {
+		acpi_id = acpi_match_device(dev->driver->acpi_match_table, dev);
+		if (!acpi_id)
+			return -ENODEV;
+
+		chip_type = acpi_id->driver_data;
+	}
+
+	return max17042_probe(client, dev, client->irq, chip_type);
+}
+
+static int max17042_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct i2c_client *i2c;
+	const struct platform_device_id *id;
+	int irq;
+
+	i2c = to_i2c_client(pdev->dev.parent);
+	if (!i2c)
+		return -EINVAL;
+
+	dev->of_node = dev->parent->of_node;
+	id = platform_get_device_id(pdev);
+	irq = platform_get_irq(pdev, 0);
+
+	return max17042_probe(i2c, dev, irq, id->driver_data);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int max17042_suspend(struct device *dev)
 {
@@ -1148,9 +1181,9 @@ static int max17042_suspend(struct device *dev)
 	 * disable the irq and enable irq_wake
 	 * capability to the interrupt line.
 	 */
-	if (chip->client->irq) {
-		disable_irq(chip->client->irq);
-		enable_irq_wake(chip->client->irq);
+	if (chip->irq) {
+		disable_irq(chip->irq);
+		enable_irq_wake(chip->irq);
 	}
 
 	return 0;
@@ -1160,9 +1193,9 @@ static int max17042_resume(struct device *dev)
 {
 	struct max17042_chip *chip = dev_get_drvdata(dev);
 
-	if (chip->client->irq) {
-		disable_irq_wake(chip->client->irq);
-		enable_irq(chip->client->irq);
+	if (chip->irq) {
+		disable_irq_wake(chip->irq);
+		enable_irq(chip->irq);
 		/* re-program the SOC thresholds to 1% change */
 		max17042_set_soc_threshold(chip, 1);
 	}
@@ -1183,12 +1216,26 @@ MODULE_DEVICE_TABLE(acpi, max17042_acpi_match);
 #endif
 
 #ifdef CONFIG_OF
-static const struct of_device_id max17042_dt_match[] = {
-	{ .compatible = "maxim,max17042" },
-	{ .compatible = "maxim,max17047" },
-	{ .compatible = "maxim,max17050" },
-	{ .compatible = "maxim,max17055" },
-	{ .compatible = "maxim,max77849-battery" },
+/*
+ * Device may be instantiated through parent MFD device and device matching is done
+ * through platform_device_id.
+ *
+ * However if device's DT node contains proper clock compatible and driver is
+ * built as a module, then the *module* matching will be done trough DT aliases.
+ * This requires of_device_id table.  In the same time this will not change the
+ * actual *device* matching so do not add .of_match_table.
+ */
+static const struct of_device_id max17042_dt_match[] __used = {
+	{ .compatible = "maxim,max17042",
+		.data = (void *) MAXIM_DEVICE_TYPE_MAX17042 },
+	{ .compatible = "maxim,max17047",
+		.data = (void *) MAXIM_DEVICE_TYPE_MAX17047 },
+	{ .compatible = "maxim,max17050",
+		.data = (void *) MAXIM_DEVICE_TYPE_MAX17050 },
+	{ .compatible = "maxim,max17055",
+		.data = (void *) MAXIM_DEVICE_TYPE_MAX17055 },
+	{ .compatible = "maxim,max77849-battery",
+		.data = (void *) MAXIM_DEVICE_TYPE_MAX17047 },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, max17042_dt_match);
@@ -1204,6 +1251,16 @@ static const struct i2c_device_id max17042_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, max17042_id);
 
+static const struct platform_device_id max17042_platform_id[] = {
+	{ "max17042", MAXIM_DEVICE_TYPE_MAX17042 },
+	{ "max17047", MAXIM_DEVICE_TYPE_MAX17047 },
+	{ "max17050", MAXIM_DEVICE_TYPE_MAX17050 },
+	{ "max17055", MAXIM_DEVICE_TYPE_MAX17055 },
+	{ "max77849-battery", MAXIM_DEVICE_TYPE_MAX17047 },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, max17042_platform_id);
+
 static struct i2c_driver max17042_i2c_driver = {
 	.driver	= {
 		.name	= "max17042",
@@ -1211,10 +1268,44 @@ static struct i2c_driver max17042_i2c_driver = {
 		.of_match_table = of_match_ptr(max17042_dt_match),
 		.pm	= &max17042_pm_ops,
 	},
-	.probe		= max17042_probe,
+	.probe		= max17042_i2c_probe,
 	.id_table	= max17042_id,
 };
-module_i2c_driver(max17042_i2c_driver);
+
+static struct platform_driver max17042_platform_driver = {
+	.driver	= {
+		.name	= "max17042",
+		.acpi_match_table = ACPI_PTR(max17042_acpi_match),
+		.pm	= &max17042_pm_ops,
+	},
+	.probe		= max17042_platform_probe,
+	.id_table	= max17042_platform_id,
+};
+
+static int __init max17042_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&max17042_platform_driver);
+	if (ret)
+		return ret;
+
+	ret = i2c_add_driver(&max17042_i2c_driver);
+	if (ret) {
+		platform_driver_unregister(&max17042_platform_driver);
+		return ret;
+	}
+
+	return 0;
+}
+module_init(max17042_init);
+
+static void __exit max17042_exit(void)
+{
+	i2c_del_driver(&max17042_i2c_driver);
+	platform_driver_unregister(&max17042_platform_driver);
+}
+module_exit(max17042_exit);
 
 MODULE_AUTHOR("MyungJoo Ham <myungjoo.ham@samsung.com>");
 MODULE_DESCRIPTION("MAX17042 Fuel Gauge");

-- 
2.39.5

