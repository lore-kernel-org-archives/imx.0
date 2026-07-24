Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F564477EF
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 20:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784924048; cv=none; b=Q0vnuj6f5SMHaSWu46wtI7uIg4IzqAb6EtEEA4wwOwTgQLsjMUUM5+D0AJ4cbAAkuqOM4Aeey0xMI7ip1O1UUBP9H33HtZapt9XU9e+Z4av8wN+0cl0vjW1Eax0eMKKYrsCr/Nbnf0+jbhVMZcDyoqpTqgDIDopJLk461VDlahE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784924048; c=relaxed/simple;
	bh=3BfKO1lcycbbs7e5gsWvcpH4V/zivQXN//VhP15u6gE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AuMebXkcranOS8y3YNpU01q+tzNBiEODDzTD2buEjWRbwQEpA30VEM74pKFL7NvxtG4JfT8jkru0q5wW+k58V8lk1kYjT69ARcVeuzxg3pszmbPDreqNU+rNjaJkl1g9uC8k+Ry+xlXSC2cGRLUUvOeZmvjshvXfO2E2Gq0UHe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eS3W5OBa; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eS3W5OBa"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso9259795ad.3
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 13:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784924036; x=1785528836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b3eDk2AKIB7oouamFfigrUPQRcoPts0plkwt9xT+u6Y=;
        b=eS3W5OBaPJ9olrhxRswrx3+tvT5TAZlfEGccVsScu6DjoZ0jPY/TaUT9j+tmYIbSAi
         zAIVSziYxUUVm0E3L//BO4sgCWEbvj5OmGXvq4S8g1xf00dPGCxpJ/OK1UJf1qFB5FNJ
         cprySDcEMuHppFOQ1jcWYsfLzWvGmMPIHM7lSJDhtpKL/LkdgKpaNzxIBUQZjcpUZ+FL
         dgiUdQvL8MRIcNek+720ZD572WQu8ajhx9xNNOeS5IXfsiny8v3EY/gWRLXCRWmBIq2V
         MJUcIzmYy88bMHpxJLmebBZdyVqzPn27ZdeVlge8HwIz9FppifJ+/otevQSACylZ+9cd
         PKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784924036; x=1785528836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b3eDk2AKIB7oouamFfigrUPQRcoPts0plkwt9xT+u6Y=;
        b=Zn7sKWlOAT/dBeq2Jo/QavMuKyrQhy2JIwBaCZ6ngXsSUhBz7fkuRoMH49VxJgLkZq
         GxO/nGc6OYYcT2cU8phn4Tw1HMtw3hTztZQUhqT7vJoBnXwkPlzKQ/BAvT/HrsPfS5Kq
         /7jQKiVxE9zJviOpW7cIlfVvVMrr9Ae+rnNmzwG71T/Qbz7LfR5GwC5Jsf1AAoI88ar1
         mQuWARnl9EFX95MxS9qI32mueof8u+3z8rScTP6CZ+aAFveenUkNM2oLrTSiBcDqFRDX
         2drQsIy0jjjfCGbz4Kx9mA7fM98zzxu2KO2zxv9uNBjbZPl4n7k47Lk/Q6kOOdB1kBN3
         T+yQ==
X-Forwarded-Encrypted: i=1; AHgh+RoO1hiFv+mW5MI+UNEcVemK2sbjg8nuTg/N4KgobljR8QowmzxaGUbenxQBGEy3CtW9sz8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxe9kxt+8sRUpAjLMpbaPgyaUxI2uaMMW9xpdJHY9OACXxTo8o0
	juDIXDSpJWU/xHEL3KlpThkpoz0KFJ2zbdUQo9kW5NmjTaQML86P7IcM
X-Gm-Gg: AR+sD133EdDQlzaKp60RDz56gQLG/twyaXkXiKNzHtWBp6O/eq07cyS5s2LXK2p5M8o
	dNiMWWlNzXvrt2YFi2GNGoTsp5F3jNnGOECmQH2QkAhufId1q88gn+fxlThm9qLhtK4VtKZ2GFv
	M2swSe9ey0V/lHwxIoFJuq8AVOYf2q4++Vh9k7F3m71f00OGQ0os38IPMUkqtWG+MMMEvY+vG+c
	vra5wDM4Wm8W/pXqw+3We6RQsDuAlKuqF4P06CZ/1QfwbOD8xcL4xo5GxfAcHhfGwAmf9BH2L4b
	sjcIkcp1Rz4VQdF9nYu1Iwz35ko1C9Hrc1N3Rg8A2v2/SCZ5Lkd+s0IwsbaBchjIgFV2WzK++4R
	dIcEZs/IyQtr4BEHty5SRLo1X4C4CskZNXjERANT0EUxlsWpl+6YkcytUy4J7moHToxpvCIYJ/i
	jJTKUXCazwCSmM+MAZrt3LEsR5lS+LYzuTj+Pvb+sXkgYUb8cf5kw=
X-Received: by 2002:a17:90b:568b:b0:38e:7d77:2fbb with SMTP id 98e67ed59e1d1-38ec6631f60mr8543951a91.32.1784924036263;
        Fri, 24 Jul 2026 13:13:56 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:60b4:ddf8:a4ba:150b:5c93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130158c0sm28850203c88.6.2026.07.24.13.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 13:13:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH] regulator: pca9450: Support regulator-off-in-suspend
Date: Fri, 24 Jul 2026 17:13:22 -0300
Message-ID: <20260724201322.73937-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

The PCA9450 uses each regulator's ENMODE field to control whether the
regulator remains enabled when the PMIC transitions from RUN to STANDBY
mode.

The driver does not currently implement set_suspend_disable(), so a
regulator configured with regulator-off-in-suspend remains enabled
during system suspend.

Implement set_suspend_disable() for the buck regulators and LDO3-LDO5
by programming ENMODE to 10b. This keeps the regulator enabled in RUN
mode, turns it off when PMIC_STBY_REQ is asserted, and enables it again
when the PMIC returns to RUN mode.

Keep LDO1 and LDO2 on regulator operations without
set_suspend_disable(), because these regulators supply the SNVS domain
and must remain enabled in STANDBY mode.

Measured on a custom i.MX8MP board, turning off NVCC_SD2 (LDO5) during
system suspend reduced power consumption by approximately 64 mW.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 drivers/regulator/pca9450-regulator.c | 43 +++++++++++++++++++++++----
 include/linux/regulator/pca9450.h     |  3 ++
 2 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index c41db70fa052..13082585140f 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -77,6 +77,24 @@ static const unsigned int pca9450_dvs_buck_ramp_table[] = {
 	25000, 12500, 6250, 3125
 };
 
+/*
+ * ENMODE = 10b keeps the regulator enabled in RUN mode and disables it
+ * while PMIC_STBY_REQ is asserted.
+ */
+static int pca9450_buck_set_suspend_disable(struct regulator_dev *rdev)
+{
+	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
+				  rdev->desc->enable_mask,
+				  BUCK_ENMODE_ONREQ_STBYREQ);
+}
+
+static int pca9450_ldo_set_suspend_disable(struct regulator_dev *rdev)
+{
+	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
+				  rdev->desc->enable_mask,
+				  LDO_ENMODE_ONREQ_STBYREQ);
+}
+
 static const struct regulator_ops pca9450_dvs_buck_regulator_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -88,6 +106,7 @@ static const struct regulator_ops pca9450_dvs_buck_regulator_ops = {
 	.set_ramp_delay	= regulator_set_ramp_delay_regmap,
 	.set_mode = pca9450_buck_set_mode,
 	.get_mode = pca9450_buck_get_mode,
+	.set_suspend_disable = pca9450_buck_set_suspend_disable,
 };
 
 static const struct regulator_ops pca9450_buck_regulator_ops = {
@@ -100,6 +119,7 @@ static const struct regulator_ops pca9450_buck_regulator_ops = {
 	.set_voltage_time_sel = regulator_set_voltage_time_sel,
 	.set_mode = pca9450_buck_set_mode,
 	.get_mode = pca9450_buck_get_mode,
+	.set_suspend_disable = pca9450_buck_set_suspend_disable,
 };
 
 static const struct regulator_ops pca9450_ldo_regulator_ops = {
@@ -111,6 +131,16 @@ static const struct regulator_ops pca9450_ldo_regulator_ops = {
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
 };
 
+static const struct regulator_ops pca9450_ldo_suspend_regulator_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_suspend_disable = pca9450_ldo_set_suspend_disable,
+};
+
 static unsigned int pca9450_ldo5_get_reg_voltage_sel(struct regulator_dev *rdev)
 {
 	struct pca9450 *pca9450 = rdev_get_drvdata(rdev);
@@ -164,6 +194,7 @@ static const struct regulator_ops pca9450_ldo5_regulator_ops = {
 	.list_voltage = regulator_list_voltage_linear_range,
 	.set_voltage_sel = pca9450_ldo5_set_voltage_sel_regmap,
 	.get_voltage_sel = pca9450_ldo5_get_voltage_sel_regmap,
+	.set_suspend_disable = pca9450_ldo_set_suspend_disable,
 };
 
 /*
@@ -575,7 +606,7 @@ static struct pca9450_regulator_desc pca9450a_regulators[] = {
 			.of_match = of_match_ptr("LDO3"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO3,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo_suspend_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO3_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo34_volts,
@@ -594,7 +625,7 @@ static struct pca9450_regulator_desc pca9450a_regulators[] = {
 			.of_match = of_match_ptr("LDO4"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO4,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo_suspend_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO4_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo34_volts,
@@ -820,7 +851,7 @@ static struct pca9450_regulator_desc pca9450bc_regulators[] = {
 			.of_match = of_match_ptr("LDO3"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO3,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo_suspend_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO3_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo34_volts,
@@ -839,7 +870,7 @@ static struct pca9450_regulator_desc pca9450bc_regulators[] = {
 			.of_match = of_match_ptr("LDO4"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO4,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo_suspend_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO4_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo34_volts,
@@ -1040,7 +1071,7 @@ static struct pca9450_regulator_desc pca9451a_regulators[] = {
 			.of_match = of_match_ptr("LDO3"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO3,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo_suspend_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO3_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo34_volts,
@@ -1059,7 +1090,7 @@ static struct pca9450_regulator_desc pca9451a_regulators[] = {
 			.of_match = of_match_ptr("LDO4"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO4,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo_suspend_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO4_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo34_volts,
diff --git a/include/linux/regulator/pca9450.h b/include/linux/regulator/pca9450.h
index 0df8b3c48082..8925e9c9376b 100644
--- a/include/linux/regulator/pca9450.h
+++ b/include/linux/regulator/pca9450.h
@@ -213,6 +213,9 @@ enum {
 #define LDO5H_EN_MASK			0xC0
 #define LDO5HOUT_MASK			0x0F
 
+/* LDO ENMODE value: ON in RUN, OFF while PMIC_STBY_REQ is asserted */
+#define LDO_ENMODE_ONREQ_STBYREQ	0x80
+
 /* PCA9450_REG_IRQ bits */
 #define IRQ_PWRON			0x80
 #define IRQ_WDOGB			0x40
-- 
2.43.0

