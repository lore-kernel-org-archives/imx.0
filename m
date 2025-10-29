Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7658355818
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746172; cv=none; b=XV0BdXlPY7hQRepVe6k87eQpF2c7lxV0aapKfviNmcYL2PP7PHB84cXI3glh6DDDO2b6+9/5SvmYX1sljStdsfjmLFtvBUn9570n1zZF/nXkJiiDbxHM3FzXKB9+cs2lq/Kk+Cy9Zocm3PVsrQdqJyq4GOKGkavCrszHOi93nzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746172; c=relaxed/simple;
	bh=OKYSetcDO2rFXo/y45ZZWWssOa+5KtBgQGteOChOd3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ASFGnlx2i6sLlzwDd4HAM13Iq/ciLcmYLdz5uZS2ujHLOSww3ggOtEV/xLg0gOX7r2TGD4rHQ35T7AV2gWwrzflDAeFy6VTffPiHGAiv494HSoAFi4i7196vgYVOCYHCML4Zu8thwKy1b9oj5Z2S8dM2d/sKSGL6M+z8w8Y/Irc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K99HfDIH; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K99HfDIH"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so1376102866b.0
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 06:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746167; x=1762350967; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3VoDc4JO2kSm8qVM4RA31MFseJ8uanXq2MvOCfPyqg=;
        b=K99HfDIHTYSDL8W1HsBva+aQL9WA7ooOem97KzDMPSx0JBpFChwQMhufzwsHaVkf8e
         ICqEFmzqBvJ9JrTYSWsTz3W/IsXAqbjPi80+d6qVxfI1u9vATBZuTvxLuSmHGNbKU5IN
         umxvL443cBwgOA1rpq84/Q40PXO6JytXOKtlzifo3EkgwBsiPOtEPHg9RTA5r+cVCOJ7
         TtVsOPpJpMLGwM5TvSWmGE5eK/aEUFuP3uWTnMurdDEelsFRcA1dPFS7QzLBBQ27edwb
         czbJA2ek+4tNm7DlT/LdBHdoOJU/s7gs552qRASyrUfmsfofTnERlH8oEQErL+V5q3XA
         MWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746167; x=1762350967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3VoDc4JO2kSm8qVM4RA31MFseJ8uanXq2MvOCfPyqg=;
        b=kYzPCTLeBFOdQwprWm3M3E+Tt1XoAtY6ynDRtsdBy4Lud2aoIAVcCOSbMboDGp9toS
         6AesTCNeZUHj+4N2mSLFkCZPYjg+qj890lK75yGYTglfGwE1J7AtmnC+QnTLAIgnGcyx
         4h7r1GB8NTvdRWCU7hsv+ILUcNVjznD6pxSs1RDHJIQWUHaF66FQ7waOz8A4oiqj7+nb
         fck8cDP2bGkU87yTkTcqyKeqZdUpcx2riAubAlsOGBkK7duZZEE4B5W6DQK+g5HK4ogF
         +zXh/fbvvODWFwIZhdjPjav+5EDyipdnI09veOUTuE29koDeqAMlsje5YPeaRv3FeWDF
         xFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw/TsbaqF76fGRSbzLkq2Q/kgqKTKkhh/YW322T92jqJUuTAXQxFOLxu828tMvK0Yu28Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YztFcMFJqZEGQ5YCDEY2h3u1HXPuqAKuJSfvIEfSEo/ZjRkWbTo
	mk2JNCMP7bRkrsoQ12nXzlx58viSQwqjn2HzBJO/VOw2FDyWmUgWrVvx
X-Gm-Gg: ASbGncvbEBKokAot58HUJMvdoyUZ/Q3UbMJ4EStnWlLQpV2UguDsLBCa8uyjhcYM1lL
	UPQUk929kzHISdfBhjAR0WsLO5hGRmPzWG59Nll3nnbPk49f1VwoKb8D/AkWv4Cqiea4ywfPOap
	MmdGxhtJJhNY3SdkTbmb/I74bPyXalg0x9yZbGpYvnormhkc2o4oFbqLSKaJcHhyJWVYKhqqr0b
	BKCYy6NrYLwAaiBAxzJk0O+ZI7nQllw8xXdFSuPsBb7XNc1U0vrHnw8RVX3hNOD87EPH0b8MgCL
	oIYEGcfWoHP6IUphcb9LIgLKVHHPY8p26wmttndMPnjaUBwsopFMuaT75kDdkpWzN6e61KEHtSc
	mQtUJgZR5Omi4EpvwWL+1JQpIpgS+Y3l902JUU0qu5M4XPxqlX/HXwOV3rwCOu4hAUmI2hKrGYN
	kbMKV3qzu9WYtoOJpjXGl9xUbppg==
X-Google-Smtp-Source: AGHT+IFJsqqYrA0WrTuMNeD7nw3M886Ul6n9khe7BJCg7Kfwbb6WZmCEdmQ2yDNV4wiQtrjXo+zUqQ==
X-Received: by 2002:a17:906:f588:b0:b6d:bf78:8bde with SMTP id a640c23a62f3a-b703d2e3f70mr271201766b.7.1761746167029;
        Wed, 29 Oct 2025 06:56:07 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:06 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 3/8] clk: imx: add driver for imx8ulp's sim lpav
Date: Wed, 29 Oct 2025 06:52:24 -0700
Message-ID: <20251029135229.890-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
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
 drivers/clk/imx/Makefile               |   1 +
 drivers/clk/imx/clk-imx8ulp-sim-lpav.c | 160 +++++++++++++++++++++++++
 2 files changed, 161 insertions(+)
 create mode 100644 drivers/clk/imx/clk-imx8ulp-sim-lpav.c

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
index 000000000000..1614d9209734
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8ulp-sim-lpav.c
@@ -0,0 +1,160 @@
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
+	void __iomem *base;
+	struct regmap *regmap;
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
+static const struct regmap_config clk_imx8ulp_sim_lpav_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.lock = clk_imx8ulp_sim_lpav_lock,
+	.unlock = clk_imx8ulp_sim_lpav_unlock,
+};
+
+static int clk_imx8ulp_sim_lpav_probe(struct platform_device *pdev)
+{
+	struct clk_imx8ulp_sim_lpav_data *data;
+	struct regmap_config regmap_config;
+	struct auxiliary_device *adev;
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
+	memcpy(&regmap_config, &clk_imx8ulp_sim_lpav_regmap_cfg, sizeof(regmap_config));
+	regmap_config.lock_arg = &pdev->dev;
+
+	/*
+	 * this lock is used directly by the clock gate and indirectly
+	 * by the reset and mux controller via the regmap API
+	 */
+	spin_lock_init(&data->lock);
+
+	data->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->base),
+				     "failed to ioremap base\n");
+	/*
+	 * although the clock gate doesn't use the regmap API to modify the
+	 * registers, we still need the regmap because of the reset auxiliary
+	 * driver and the MUX drivers, which use the parent device's regmap
+	 */
+	data->regmap = devm_regmap_init_mmio(&pdev->dev, data->base, &regmap_config);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(data->regmap),
+				     "failed to initialize regmap\n");
+
+	data->clk_data.num = ARRAY_SIZE(gates);
+
+	for (i = 0; i < ARRAY_SIZE(gates); i++) {
+		hw = devm_clk_hw_register_gate_parent_data(&pdev->dev,
+							   gates[i].name,
+							   &gates[i].parent,
+							   CLK_SET_RATE_PARENT,
+							   data->base + SYSCTRL0,
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

