Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0492F25E2
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 12:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257845; cv=none; b=noE0+OHBk+id3Akn3i6uDyrLBzyDZnIH+AntsiYxqWepmQ+n44p82juHCxIuoZpa8o54KCugfdVeM4cirECqeO4D4r4jcNptOPl1/c0ScVQMTfq6tGpZ2YhWAYaIsJxGIUFErlfZnjxLoeqhVzAm/B68H4JL3y5AtTdyxcfmMN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257845; c=relaxed/simple;
	bh=D4SadG5nYvl7nyBB87cKRikM6SJkXeonJxlw+/bopKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKuU/ml4tpWqcXmit4hROMo5Xduz5ZcdvUfiGfXphQmrHSsTsrCc7nKcAGIpk4NgRK0lqHVrMp/RR6AC/Xrqn/6vVoWmG92fA61rUyMTm/LIU29iRDJSwgAKK7mdriiVs2ZhK7jB//KVVDnElbqFvSarOOvODExMnsNrIz20o0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXvRyurr; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXvRyurr"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b626a4cd9d6so803768166b.3
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 04:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257842; x=1762862642; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/BYF33DXlVlPj+AeWQJ/lLnj1HAK6WNR64lw8fuXu8=;
        b=LXvRyurrfOickIKuIfG40+vjtYBcebL+i3IksrPmXOy539xXq7UnM6L1/cHro7lJE/
         CStvBxqVxQmXwdXr4L4fvjQuqJTqwlp2ZWnW4QmZu9VI7XnVbg+gSV9071zzyGjjVVQ7
         o/nszhy0QFTVHToew+5UWAWUB+DUoA9zsXo8OhjRBLLMkuJYs1VmWIbiPE+33Ty70L7p
         Lb2yrmJ5NREcY4VZn3ApYzPLey0YZBcFsNnVAMksy8DEFAaHQLvcOBstbQbFLNi2DfP0
         tgUBPZ3xpBtNqEx79TitgYJzUHlGzpuSaSBQrtQ8sPDDMt6v+yRcAYQjtVpNLB1GfOs9
         CmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257842; x=1762862642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T/BYF33DXlVlPj+AeWQJ/lLnj1HAK6WNR64lw8fuXu8=;
        b=hqZDmngDuWZIyosryLjc2GBzDpWjRlF0IT/yV1YxWJTUJy8zWQu8HfB7t3aBZna6xU
         BsThPc0MKqoIZrAJmSvTeoKO+lV3EgYGaJBMGC2RAvUrBfs3oX1pwA3go9fHKcIWihoT
         Lm1Xoq/90dTYiLR6uD6YChFRjki5f+bDQX5JHR2Kt1ImVErUQlleGbpvGxBRNflpciAt
         0tGCeTswRIDgzrxXNqcKyZNk9wAFas7bLeZO1VeJhhzUyXIgKbcNhlSeX6ZaMz3R2TJD
         6IaSbfuC+fAYn0lgdxnbYcdCdoqqEzGX/K+18j/dHamQsbPg6oWExE4exXrvKLGnolLx
         pe/A==
X-Forwarded-Encrypted: i=1; AJvYcCXD60jzpPAyx8rThB0BatGyYkDHdbWw1rZV9p7f9bA9/DxK+Sv2EwXmR+kV9epGQEZjVtI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVjKToE55dKr70ZwFXLn5DNMssilhzVAQ0d50lWWTSs8S/g+mG
	co51YWYoZRzCdGrbjikkDXR8xBhHYX8f1z8RmapFT5KbvyKH4p9qiEYj
X-Gm-Gg: ASbGncvlCjdLNwRdi1QFANKBrjj0yabERizxBtjcy0sXx91/7zKXTT5D2E3nJHbHMX1
	Lh1lOqT1fMNbDb+16vNp8ZgZRmGmcClNLp6treWNyLEBuZGav1EhvwXMrJiMAMK4CClBR/9Ntw8
	7/HA2Kt8HKn0rUZmwLQDShtkKfihWnGdK2/NolWMfAOq3ergOEMc+STPOCTB/KcE6n2jwUnBUGH
	og5gzwa7Txq5ZvaBlNQV8Ld72A2YFhjlGdDQqpl9MpscXwkVysPlodF14TYdwjvz5YLPSK6Q++b
	u/K1zYctZTqG9BdfeUiV/efk5gQoeXVKh9VL9aO5ZG0cHGVenRSCANmg/Pp12mmRkM5G0CYknTc
	fyQGCav6GhCu6gqNaaRnUXGGg+5+Wsqakrdncc9ohXwp5ATaVzr/rCUBtQ6br/yAsGhKZ60eeFo
	i6SV7ttjFBPdpcMEoii3xuf0uBOk6wYmiL4X+U
X-Google-Smtp-Source: AGHT+IENrgHXUckIu1P8DzjyOH/pQJ15zIuOl+8iK5w7p2OYmzxyymXxjra+BK5po5WGmx8SH+hcTg==
X-Received: by 2002:a17:906:fe4e:b0:b65:abf2:417a with SMTP id a640c23a62f3a-b7070891072mr1736993766b.64.1762257841281;
        Tue, 04 Nov 2025 04:04:01 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:00 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 3/8] clk: imx: add driver for imx8ulp's sim lpav
Date: Tue,  4 Nov 2025 04:02:56 -0800
Message-ID: <20251104120301.913-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The i.MX8ULP System Integration Module (SIM) LPAV module is a block
control module found inside the LPAV subsystem, which offers some clock
gating options and reset line assertion/de-assertion capabilities.

Therefore, the clock gate management is supported by registering the
module's driver as a clock provider, while the reset capabilities are
managed via the auxiliary device API to allow the DT node to act as a
reset and clock provider.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/clk/imx/Kconfig                |   1 +
 drivers/clk/imx/Makefile               |   1 +
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c | 156 +++++++++++++++++++++++++
 3 files changed, 158 insertions(+)
 create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c

diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
index 6ff6d934848a..b292e7ca5c24 100644
--- a/drivers/clk/imx/Kconfig
+++ b/drivers/clk/imx/Kconfig
@@ -105,6 +105,7 @@ config CLK_IMX8ULP
 	tristate "IMX8ULP CCM Clock Driver"
 	depends on ARCH_MXC || COMPILE_TEST
 	select MXC_CLK
+	select AUXILIARY_BUS
 	help
 	    Build the driver for i.MX8ULP CCM Clock Driver
 
diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 03f2b2a1ab63..208b46873a18 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -41,6 +41,7 @@ clk-imx-lpcg-scu-$(CONFIG_CLK_IMX8QXP) += clk-lpcg-scu.o clk-imx8qxp-lpcg.o
 clk-imx-acm-$(CONFIG_CLK_IMX8QXP) = clk-imx8-acm.o
 
 obj-$(CONFIG_CLK_IMX8ULP) += clk-imx8ulp.o
+obj-$(CONFIG_CLK_IMX8ULP) += clk-imx8ulp-sim-lpav.o
 
 obj-$(CONFIG_CLK_IMX1)   += clk-imx1.o
 obj-$(CONFIG_CLK_IMX25)  += clk-imx25.o
diff --git a/drivers/clk/imx/clk-imx8ulp-sim-lpav.c b/drivers/clk/imx/clk-imx8ulp-sim-lpav.c
new file mode 100644
index 000000000000..990c95b89b75
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8ulp-sim-lpav.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <dt-bindings/clock/imx8ulp-clock.h>
+
+#include <linux/auxiliary_bus.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define SYSCTRL0 0x8
+
+#define IMX8ULP_HIFI_CLK_GATE(gname, cname, pname, bidx)	\
+	{							\
+		.name = gname "_cg",				\
+		.id = IMX8ULP_CLK_SIM_LPAV_HIFI_##cname,	\
+		.parent = { .fw_name = pname },			\
+		.bit = bidx,					\
+	}
+
+struct clk_imx8ulp_sim_lpav_data {
+	spinlock_t lock; /* shared by MUX, clock gate and reset */
+	unsigned long flags; /* for spinlock usage */
+	struct clk_hw_onecell_data clk_data; /*  keep last */
+};
+
+struct clk_imx8ulp_sim_lpav_gate {
+	const char *name;
+	int id;
+	const struct clk_parent_data parent;
+	u8 bit;
+};
+
+static struct clk_imx8ulp_sim_lpav_gate gates[] = {
+	IMX8ULP_HIFI_CLK_GATE("hifi_core", CORE, "core", 17),
+	IMX8ULP_HIFI_CLK_GATE("hifi_pbclk", PBCLK, "bus", 18),
+	IMX8ULP_HIFI_CLK_GATE("hifi_plat", PLAT, "plat", 19)
+};
+
+static void clk_imx8ulp_sim_lpav_lock(void *arg) __acquires(&data->lock)
+{
+	struct clk_imx8ulp_sim_lpav_data *data = dev_get_drvdata(arg);
+
+	spin_lock_irqsave(&data->lock, data->flags);
+}
+
+static void clk_imx8ulp_sim_lpav_unlock(void *arg) __releases(&data->lock)
+{
+	struct clk_imx8ulp_sim_lpav_data *data = dev_get_drvdata(arg);
+
+	spin_unlock_irqrestore(&data->lock, data->flags);
+}
+
+static int clk_imx8ulp_sim_lpav_probe(struct platform_device *pdev)
+{
+	const struct regmap_config regmap_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.lock = clk_imx8ulp_sim_lpav_lock,
+		.unlock = clk_imx8ulp_sim_lpav_unlock,
+		.lock_arg = &pdev->dev,
+	};
+	struct clk_imx8ulp_sim_lpav_data *data;
+	struct auxiliary_device *adev;
+	struct regmap *regmap;
+	void __iomem *base;
+	struct clk_hw *hw;
+	int i, ret;
+
+	data = devm_kzalloc(&pdev->dev,
+			    struct_size(data, clk_data.hws, ARRAY_SIZE(gates)),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, data);
+
+	/*
+	 * this lock is used directly by the clock gate and indirectly
+	 * by the reset and mux controller via the regmap API
+	 */
+	spin_lock_init(&data->lock);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(base),
+				     "failed to ioremap base\n");
+	/*
+	 * although the clock gate doesn't use the regmap API to modify the
+	 * registers, we still need the regmap because of the reset auxiliary
+	 * driver and the MUX drivers, which use the parent device's regmap
+	 */
+	regmap = devm_regmap_init_mmio(&pdev->dev, base, &regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
+				     "failed to initialize regmap\n");
+
+	data->clk_data.num = ARRAY_SIZE(gates);
+
+	for (i = 0; i < ARRAY_SIZE(gates); i++) {
+		hw = devm_clk_hw_register_gate_parent_data(&pdev->dev,
+							   gates[i].name,
+							   &gates[i].parent,
+							   CLK_SET_RATE_PARENT,
+							   base + SYSCTRL0,
+							   gates[i].bit,
+							   0x0, &data->lock);
+		if (IS_ERR(hw))
+			return dev_err_probe(&pdev->dev, PTR_ERR(hw),
+					     "failed to register %s gate\n",
+					     gates[i].name);
+
+		data->clk_data.hws[i] = hw;
+	}
+
+	adev = devm_auxiliary_device_create(&pdev->dev, "reset", NULL);
+	if (!adev)
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "failed to register aux reset\n");
+
+	ret = devm_of_clk_add_hw_provider(&pdev->dev,
+					  of_clk_hw_onecell_get,
+					  &data->clk_data);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to register clk hw provider\n");
+
+	/* used to probe MUX child device */
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static const struct of_device_id clk_imx8ulp_sim_lpav_of_match[] = {
+	{ .compatible = "fsl,imx8ulp-sim-lpav" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, clk_imx8ulp_sim_lpav_of_match);
+
+static struct platform_driver clk_imx8ulp_sim_lpav_driver = {
+	.probe = clk_imx8ulp_sim_lpav_probe,
+	.driver = {
+		.name = "clk-imx8ulp-sim-lpav",
+		.of_match_table = clk_imx8ulp_sim_lpav_of_match,
+	},
+};
+module_platform_driver(clk_imx8ulp_sim_lpav_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("i.MX8ULP LPAV System Integration Module (SIM) clock driver");
+MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
-- 
2.43.0

