Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BD0374A0F
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 01:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787017306; cv=none; b=GkBzxuKX8WwHsSkIKyGBGhuy9nJ3KaUFEgTu866qPxvqBdPUjqYcFrFobG3N4d7u+1EhOdP2n3i/6h8VCeRHD2XU1k02DR0Z4ySWDnHntazyXV+7s+Y1R7V+RlhwUf2Z8fvPZ00ekJLjsopc5nngMbxfrfZNmpbOOVzjTRZiSsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787017306; c=relaxed/simple;
	bh=8bKDC2Equ52KU9kNtEIpPUSElfKwYbT05tsYB7sSYuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tmc1yTldo2e8tOhH2FgRaqLyXL4LzgGnzK4SrorPEVK6jsRKW+f/oAJMgy7JZrSrAOpZ7HMJjOhRSEyYgbLicQqHyQ+g8CfMh17xxt9H6UxLjtfAh1ubdKWqYt7jETFBKMMpNikjMr+jNYTr+TbzanYtLcbLvr0k5Yvi26VqR7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAZicqxS; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAZicqxS"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9693bbb962eso2478395241.2
        for <imx@lists.linux.dev>; Mon, 17 Aug 2026 18:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787017302; x=1787622102; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lX+K9XxfcsBKvrdgR9AJTurv5mgqY/Qbl1yLC0rsNLc=;
        b=rAZicqxSqjg1Gn/kLJlIpC1yDAJLKYgLq+FKEhyey0OFAAFFfnLpvUXTOZT0tFWoUu
         VnR3S4BfJ14sUjheNK7EZIH5eMtCQGIARykTKYhtOBJfcVDXgLs7A+lyvWFNegDcEoQZ
         Rn0xrXdiGw09rkklK+4HmK3tgpMoDpFB7n0j4M1qsyZpJ2kIHeIw2QkmBbeX4iILxB+t
         Nw+8FYIQtsbns/UeaaqvVTCfvdENWtCjLOOiNwrCYtO8Re9MMbz4Ra6VLSiGu89gohgn
         /C/npsvl21YkT8FBtpYGrHHd7PcuQj74DT5JgOIjche17LymVr1hMPoWWpXEc4QH+xlM
         BVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787017302; x=1787622102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lX+K9XxfcsBKvrdgR9AJTurv5mgqY/Qbl1yLC0rsNLc=;
        b=UqtcbWt0Z/nGlsRUOrbF4jZCPnqLhHicyCv+Qui/XO7VHx7WU1BANd+H+cTyCVcUa6
         jJrJAnACUjfssb5gzwAKwPS+F44W1KlkAKr1rnnrO+hTzSB0kRr6DZX3DKV4X2RPQ8Ax
         y2alDxhbHsH2VPP5lbZtXAWElvwryFGyDtkUF0mFM7TXc6s8mppUCOuc9Svyo4eu2JMx
         AUD6PoLOKv6N1RLZ/q/fDhasE3QCJcFbcSLPfScnREy/4NFSY2dIVlWR0v9nnnti1G2b
         9jJj4EEPRxqGn4XvzOr9Ej6M0m8qZSSoaBUBu/Nrl+Qzzr3PmqPVDkAMqthGfhi8Gcd/
         SQ5Q==
X-Forwarded-Encrypted: i=1; AHgh+RpON+FUhhdemT9lutNwpIZEBSeHyfFJoEiXxIE//x7jc14w3pFca4/RR+t8pTix7Vq+9ys=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTbXtO+jguH16EJR7e6ytDVicUBiEl7KsiszzguGrlVvQb3ACF
	WfNFMD5sKvRxxQfchnH63y1vdl5jFDykkMZnXXAfgulqTmUbhapPoyRH
X-Gm-Gg: AR+sD12B8+J/Vlh4MnhRuUrbp9fyYW20O3V4/rSWUKuQ5KhEL1X3PdyeUwuyCw0TDJF
	Gcefa/X3MGIh5GBRZFW8/sFHWn5gpC6ZrAwq+/thtw79StGyCxIik7CzLxQy5LfTASUx1QXyWdp
	iC8fCLTYLTYqqvVkGW0tLeJryrbRlT3BtvmcQ/hbPeqAz4+dQuwInsRNA2nnZmF8RK3BCws3M/r
	P+k2Hndcjm2Ti7aSejkPx//KU+LaaWLCs/CR7oaTHuq9WajnnaBYwOp8Ub7fy6BWrvNJ1l9NeOw
	lRbHaXwOsx2VxE3KO55KTl6XfVSnxeQFNL/xV7cO1PJCZGOzUmJ3585wmxxr3LWLARHoDD3+zdJ
	EPTSSHc1OayCcA9XKa05nk2Xe87lFGZgi2ICZUt6+dzRWu0VCov6h955KfP0e93bVzt8hw4d9wI
	AtXCIlegRR6WZU/xTvaU3qhYHamLJSHIr2whBwouKUEsZsBlJ/t6IX9o9NNtJd0Gd49zMj407ai
	OvKVuh7chxUroqLAxeuBLGlIYRtZWwtFS+saA==
X-Received: by 2002:a05:6102:e10:b0:738:6994:eb8 with SMTP id ada2fe7eead31-76f2767926amr6910596137.0.1787017302410;
        Mon, 17 Aug 2026 18:41:42 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a802:463c:ff0a:9155:ae80:b1ba])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-773c508ab92sm2160162137.7.2026.08.17.18.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:41:41 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v2 2/2] regulator: pca9450: Support regulator-off-in-suspend
Date: Mon, 17 Aug 2026 22:40:59 -0300
Message-ID: <20260818014059.351152-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818014059.351152-1-festevam@gmail.com>
References: <20260818014059.351152-1-festevam@gmail.com>
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

Implement set_suspend_disable() for the buck regulators and LDO3-LDO5.
The suspend and runtime controls share ENMODE, so first read the field
and leave it unchanged when it is 00b. This preserves the state of a
regulator that was already disabled at runtime. For an enabled regulator,
program 10b to keep it on in RUN and turn it off while PMIC_STBY_REQ is
asserted.

Most buck descriptors set enable_val to 01b, while BUCK2 uses 10b. When
enable_val is nonzero, regulator_is_enabled_regmap() checks for an exact
match. It would therefore report most bucks as disabled after their ENMODE
is changed from 01b to 10b, even though all valid nonzero ENMODE values
enable the regulator in RUN. Use a custom is_enabled() helper for the buck
operation tables that considers a nonzero ENMODE enabled. The LDO
descriptors leave enable_val at zero, for which the generic helper already
performs this nonzero check, so keep using it for the LDOs.

Runtime enable and disable operations remain unchanged: disable writes
00b and enable writes the regulator's default mode. The suspend callback
reapplies 10b on each suspend after any intervening runtime operation.

Keep LDO1 and LDO2 on regulator operations without
set_suspend_disable(), because these regulators supply the SNVS domain
and must remain enabled in STANDBY mode.

Measured on a custom i.MX8MP board, turning off NVCC_SD2 (LDO5) during
system suspend reduced power consumption by approximately 64 mW.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v1:
- Preserve the state of regulators that are disabled at runtime.
- Add a custom is_enabled() callback for buck regulators so that valid
nonzero ENMODE values are reported as enabled.

 drivers/regulator/pca9450-regulator.c | 75 ++++++++++++++++++++++++---
 include/linux/regulator/pca9450.h     |  3 ++
 2 files changed, 70 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
index 93d0af7f7eda..613bce411f31 100644
--- a/drivers/regulator/pca9450-regulator.c
+++ b/drivers/regulator/pca9450-regulator.c
@@ -77,10 +77,56 @@ static const unsigned int pca9450_dvs_buck_ramp_table[] = {
 	25000, 12500, 6250, 3125
 };
 
+static int pca9450_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(rdev->regmap, rdev->desc->enable_reg, &val);
+	if (ret)
+		return ret;
+
+	/* All valid nonzero ENMODE values enable the regulator in RUN mode. */
+	return !!(val & rdev->desc->enable_mask);
+}
+
+static int pca9450_set_suspend_disable(struct regulator_dev *rdev,
+				       unsigned int suspend_val)
+{
+	int ret;
+
+	/* Do not enable a runtime-disabled regulator when returning to RUN. */
+	ret = pca9450_regulator_is_enabled(rdev);
+	if (ret < 0)
+		return ret;
+	if (!ret)
+		return 0;
+
+	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
+				  rdev->desc->enable_mask,
+				  suspend_val);
+}
+
+/*
+ * ENMODE = 10b keeps the regulator enabled in RUN mode and disables it
+ * while PMIC_STBY_REQ is asserted.
+ */
+static int pca9450_buck_set_suspend_disable(struct regulator_dev *rdev)
+{
+	return pca9450_set_suspend_disable(rdev,
+					   BUCK_ENMODE_ONREQ_STBYREQ);
+}
+
+static int pca9450_ldo_set_suspend_disable(struct regulator_dev *rdev)
+{
+	return pca9450_set_suspend_disable(rdev,
+					   LDO_ENMODE_ONREQ_STBYREQ);
+}
+
 static const struct regulator_ops pca9450_dvs_buck_regulator_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
-	.is_enabled = regulator_is_enabled_regmap,
+	.is_enabled = pca9450_regulator_is_enabled,
 	.list_voltage = regulator_list_voltage_linear_range,
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
@@ -88,18 +134,20 @@ static const struct regulator_ops pca9450_dvs_buck_regulator_ops = {
 	.set_ramp_delay	= regulator_set_ramp_delay_regmap,
 	.set_mode = pca9450_buck_set_mode,
 	.get_mode = pca9450_buck_get_mode,
+	.set_suspend_disable = pca9450_buck_set_suspend_disable,
 };
 
 static const struct regulator_ops pca9450_buck_regulator_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
-	.is_enabled = regulator_is_enabled_regmap,
+	.is_enabled = pca9450_regulator_is_enabled,
 	.list_voltage = regulator_list_voltage_linear_range,
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
 	.set_voltage_time_sel = regulator_set_voltage_time_sel,
 	.set_mode = pca9450_buck_set_mode,
 	.get_mode = pca9450_buck_get_mode,
+	.set_suspend_disable = pca9450_buck_set_suspend_disable,
 };
 
 static const struct regulator_ops pca9450_ldo_regulator_ops = {
@@ -111,6 +159,16 @@ static const struct regulator_ops pca9450_ldo_regulator_ops = {
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
@@ -164,6 +222,7 @@ static const struct regulator_ops pca9450_ldo5_regulator_ops = {
 	.list_voltage = regulator_list_voltage_linear_range,
 	.set_voltage_sel = pca9450_ldo5_set_voltage_sel_regmap,
 	.get_voltage_sel = pca9450_ldo5_get_voltage_sel_regmap,
+	.set_suspend_disable = pca9450_ldo_set_suspend_disable,
 };
 
 /*
@@ -575,7 +634,7 @@ static struct pca9450_regulator_desc pca9450a_regulators[] = {
 			.of_match = of_match_ptr("LDO3"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO3,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo_suspend_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO3_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo34_volts,
@@ -594,7 +653,7 @@ static struct pca9450_regulator_desc pca9450a_regulators[] = {
 			.of_match = of_match_ptr("LDO4"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO4,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo_suspend_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO4_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo34_volts,
@@ -820,7 +879,7 @@ static struct pca9450_regulator_desc pca9450bc_regulators[] = {
 			.of_match = of_match_ptr("LDO3"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO3,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo_suspend_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO3_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo34_volts,
@@ -839,7 +898,7 @@ static struct pca9450_regulator_desc pca9450bc_regulators[] = {
 			.of_match = of_match_ptr("LDO4"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO4,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo_suspend_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO4_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo34_volts,
@@ -1040,7 +1099,7 @@ static struct pca9450_regulator_desc pca9451a_regulators[] = {
 			.of_match = of_match_ptr("LDO3"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO3,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo_suspend_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO3_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo34_volts,
@@ -1059,7 +1118,7 @@ static struct pca9450_regulator_desc pca9451a_regulators[] = {
 			.of_match = of_match_ptr("LDO4"),
 			.regulators_node = of_match_ptr("regulators"),
 			.id = PCA9450_LDO4,
-			.ops = &pca9450_ldo_regulator_ops,
+			.ops = &pca9450_ldo_suspend_regulator_ops,
 			.type = REGULATOR_VOLTAGE,
 			.n_voltages = PCA9450_LDO4_VOLTAGE_NUM,
 			.linear_ranges = pca9450_ldo34_volts,
diff --git a/include/linux/regulator/pca9450.h b/include/linux/regulator/pca9450.h
index 2aa73624d0b8..bf94df5fafe3 100644
--- a/include/linux/regulator/pca9450.h
+++ b/include/linux/regulator/pca9450.h
@@ -212,6 +212,9 @@ enum {
 
 #define LDO5HOUT_MASK			0x0F
 
+/* LDO ENMODE value: ON in RUN, OFF while PMIC_STBY_REQ is asserted */
+#define LDO_ENMODE_ONREQ_STBYREQ	0x80
+
 /* PCA9450_REG_IRQ bits */
 #define IRQ_PWRON			0x80
 #define IRQ_WDOGB			0x40
-- 
2.43.0

