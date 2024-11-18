Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BA13D551
	for <imx@lists.linux.dev>; Mon, 18 Nov 2024 10:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924607; cv=none; b=jEFXWKYKDhcM4PLfXt0EfOF9qEGr20av5CuQ7mzWDTTDGQPXHabmhQVkuu50O8DrysK1BxIbiB8KEiIgA68Du2qysr6aSSD0Ty4VNxzABg153ES/Rl8bNVEIC5XCu5ol2hwuxjk5EKy1j4ziPQhC+gl6cstRAE/4ngSEpL+ELqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924607; c=relaxed/simple;
	bh=08avkvJXc6YpLMi35Ewq9sInOmvPK/XUfpBoJCW4Zgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o1t2G5JZOM4fVj5HspTiom3GmFQrXj7ncRv0EEZyvIBp3L7mF0cHpqBTEnIA6Eu9/LbrTMynWTg/sXIcBJ+AWScoA1cypVPijE8AvcJKoCJR5eG2PTXvI0rWnHBN8dR3wf1VeQSLNUPj49KpEgC/fvlTPsE0HvQVBCfItzPsHok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HjjuiGQj; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjjuiGQj"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53da353eb2eso2278897e87.3
        for <imx@lists.linux.dev>; Mon, 18 Nov 2024 02:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731924603; x=1732529403; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fOyYhW/88qHGGmM9QOYNQJqLo1yTsoyhwIyniU1DSY=;
        b=HjjuiGQj9Fqbelxve7YalprZg+HPj/uGr67gfrvS2OnEsZsSE79JSEhQaeTk2wDJCc
         OZ+fwqyuRiShThTvL+N3vx8q+539ebXOUrXbPI+FJyx1K3ND1MERmB39W4Ig1dF4U9lv
         fG5Ipv3+cewBEc4BVe9TKc654WFGyn5XORSQNUe9Jb7zehCwRKTPnyHfXmz/P9Ti/ULY
         k5q40Kg6IV41XkVzrOzEOzqgjdpaP4LScLHq8kQ2Jal8yr/23feRkOU+rOam1Z9lSJGA
         zw2yHDsdbi/RaEEKG7tPtdexMJRufAktv1FxBhckoyJclRbxmqoQ8zBaxFMaT2MjzBxc
         JaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731924603; x=1732529403;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fOyYhW/88qHGGmM9QOYNQJqLo1yTsoyhwIyniU1DSY=;
        b=J+5p9W0ddOpigKc6vUUiZ0HGf4Ng+iG0L4AUatHZFIzkmTb+/QKURG8o5ylMD7G+sF
         D+v7s7MRGS8ZK67lP9ypWCgHxH1hldBiZhlaSf/mk+STN+WzZ5D9DXnI9nhT2x2vtNC/
         gVMtkcT34m02B/gFjfqu3uJympHFdhZ0PIwAnLL9pGjyo9t7yOVRcDuu+5U9PKvq3p2X
         tVQA0Y/LCDhy0HnHNuxAwB0fcmZhHkQqKle8CDtjtkNry/jmBOmIoDIPipn9pA9wNEGb
         Ex2EzWYBJLjIjZRRU3hy2/Y/UobAdGuMqTiKQSqkq5lYbLy/WOAo9W4WE2q2D0m3+7og
         8xbg==
X-Forwarded-Encrypted: i=1; AJvYcCVDiGvDv3l1Te0w17Ve2JBgnNBKQ1TwyI5nn7V+cNyt9wRP3Xcj3Ve+GOqGfFUuqwWkmvI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy3wC4B/enWvOuOWhn013pwOPg9eT9asWlPR99OSLR1+6bTllR
	nztfQiMy44o+gx2Cy9UiwTxg9tcyGNnYQV+m8PVeoSfav7WuSsmjtz8voQ==
X-Google-Smtp-Source: AGHT+IEsM+bEYVWPcdxMX4ty+jlvxNzXr16PKephGvFY1LmTwDkGEiU9Vu06vwaLgV1jjEKcvAJWkw==
X-Received: by 2002:a05:6512:2391:b0:53d:a6c8:fb95 with SMTP id 2adb3069b0e04-53dab29efffmr5766910e87.19.1731924602776;
        Mon, 18 Nov 2024 02:10:02 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa20e046932sm518546366b.170.2024.11.18.02.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 02:10:02 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 18 Nov 2024 13:09:54 +0300
Subject: [PATCH v3 2/2] power: supply: max17042: add platform driver
 variant
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-b4-max17042-v3-2-9bcaeda42a06@gmail.com>
References: <20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com>
In-Reply-To: <20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731924598; l=7718;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=08avkvJXc6YpLMi35Ewq9sInOmvPK/XUfpBoJCW4Zgo=;
 b=Tb5f0aAMBx2MGt3QTrkgclj08UpXH0InARdTWId9PBKICIi4GRNuva4CIHo0xUUNPX4OG64yq
 tgZv4Ji6Oe6DCAShAYu8XgKwIixcAaIg1oTLpWOdRFCFDU6SObAAzr3
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
Changes in v3:
- pass dev pointer in max17042_probe
- remove prints
---
 drivers/power/supply/max17042_battery.c | 114 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------------
 1 file changed, 90 insertions(+), 24 deletions(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 99bf6915aa23..d11bf37aaae2 100644
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
@@ -1029,14 +1030,12 @@ static const struct power_supply_desc max17042_no_current_sense_psy_desc = {
 	.num_properties	= ARRAY_SIZE(max17042_battery_props) - 2,
 };
 
-static int max17042_probe(struct i2c_client *client)
+static int max17042_probe(struct i2c_client *client, struct device *dev,
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
@@ -1045,33 +1044,24 @@ static int max17042_probe(struct i2c_client *client)
 	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_WORD_DATA))
 		return -EIO;
 
-	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
 	chip->client = client;
-	if (id) {
-		chip->chip_type = id->driver_data;
-	} else {
-		acpi_id = acpi_match_device(dev->driver->acpi_match_table, dev);
-		if (!acpi_id)
-			return -ENODEV;
-
-		chip->chip_type = acpi_id->driver_data;
-	}
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
 
@@ -1095,17 +1085,17 @@ static int max17042_probe(struct i2c_client *client)
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
 
 	if (client->irq) {
 		unsigned int flags = IRQF_ONESHOT | IRQF_SHARED | IRQF_PROBE_SHARED;
 
-		ret = devm_request_threaded_irq(&client->dev, client->irq,
+		ret = devm_request_threaded_irq(dev, client->irq,
 						NULL,
 						max17042_thread_handler, flags,
 						chip->battery->desc->name,
@@ -1118,7 +1108,7 @@ static int max17042_probe(struct i2c_client *client)
 		} else {
 			client->irq = 0;
 			if (ret != -EBUSY)
-				dev_err(&client->dev, "Failed to get IRQ\n");
+				dev_err(dev, "Failed to get IRQ\n");
 		}
 	}
 	/* Not able to update the charge threshold when exceeded? -> disable */
@@ -1127,7 +1117,7 @@ static int max17042_probe(struct i2c_client *client)
 
 	regmap_read(chip->regmap, MAX17042_STATUS, &val);
 	if (val & STATUS_POR_BIT) {
-		ret = devm_work_autocancel(&client->dev, &chip->work,
+		ret = devm_work_autocancel(dev, &chip->work,
 					   max17042_init_worker);
 		if (ret)
 			return ret;
@@ -1139,6 +1129,38 @@ static int max17042_probe(struct i2c_client *client)
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
+	return max17042_probe(client, dev, chip_type);
+}
+
+static int max17042_platform_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct i2c_client *i2c = dev_get_platdata(dev);
+	const struct platform_device_id *id = platform_get_device_id(pdev);
+
+	if (!i2c)
+		return -EINVAL;
+
+	return max17042_probe(i2c, dev, id->driver_data);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int max17042_suspend(struct device *dev)
 {
@@ -1204,6 +1226,16 @@ static const struct i2c_device_id max17042_id[] = {
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
@@ -1211,10 +1243,44 @@ static struct i2c_driver max17042_i2c_driver = {
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
+		.of_match_table = of_match_ptr(max17042_dt_match),
+		.pm	= &max17042_pm_ops,
+	},
+	.probe		= max17042_platform_probe,
+	.id_table	= max17042_platform_id,
+};
+
+static int __init __driver_max17042_platform_init(void)
+{
+	int ret = 0;
+
+	ret = platform_driver_register(&max17042_platform_driver);
+
+	if (ret) {
+		platform_driver_unregister(&max17042_platform_driver);
+		return ret;
+	}
+
+	ret = i2c_add_driver(&max17042_i2c_driver);
+
+	return ret;
+}
+module_init(__driver_max17042_platform_init);
+
+static void __exit __driver_max17042_platform_exit(void)
+{
+	i2c_del_driver(&max17042_i2c_driver);
+	platform_driver_unregister(&max17042_platform_driver);
+}
+module_exit(__driver_max17042_platform_exit);
 
 MODULE_AUTHOR("MyungJoo Ham <myungjoo.ham@samsung.com>");
 MODULE_DESCRIPTION("MAX17042 Fuel Gauge");

-- 
2.39.2

