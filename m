Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF62D433AD
	for <imx@lists.linux.dev>; Sun, 15 Sep 2024 11:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726400702; cv=none; b=OWCm2cWZBdoKJ6EJTlViq71a/ZypIls4cPbc+ooqRdU0feT4JFFeZ5s76UbMjo6L9LaUlulaw2P3AQnblkTvPWH46tZmQ62N0yYE+XOnY1MCqgo4CwcupZBDFjuyv7i5ORqzYkwCRk6/ZV5XVOYHDqc/xBJgl5qEmz0LG20viW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726400702; c=relaxed/simple;
	bh=7sptYmZNvN380n1kQpRiRyGhzcGMEaSyHh6jLXylY6s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PnhClMDz16ar46I1iWXFmKauku4F/ilGcsnLp8XMtkfYLE0wSn4kpJyKzCGOUFZs7XOlWZdrGwryGaWf47VPBwrH3nM0jcWZYwzfNsienCiNuV7bQUOg+ugkThAYshOoPoZN+OCFIpJ1SKloWaHg+PFYa6rskuetmlk59EqCICI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJLx43/6; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJLx43/6"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c3ca32971cso4668989a12.0
        for <imx@lists.linux.dev>; Sun, 15 Sep 2024 04:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726400699; x=1727005499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjYXEh+UbA9qfzH/UnBxzC6T1hiNz97xyypMsutGg+M=;
        b=UJLx43/6ck7tikwla6klB1nqSP10qoG6kQHyYltJqWxHdrUTmiXSM4r2PwEg4enCbj
         Bkd+58UyYKvExlGdhn+IUpPuCIqldi/+TRoMKF/ZbhL4XjUgKZbC0E3xKshvPpHevM7J
         PYnYxISIJMcoPN8hhPUnmRC4Zl5/VoJ06GG7sXn1Nyv30aD7YZTkOECICPOVlVF4QkCH
         4dfjrAHYvdi9CI2ewECUKNnB6dlluF6gEBH7IwMM9mLn+Le2JSLAbg5wmvG9yo8ho82W
         kAJn0dikX1Lh0gbHc1ZOl14qZNHqK1f7uVjSn84eOB2A56ZrL7qB2kbEwE9f52YAzQmR
         13eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726400699; x=1727005499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjYXEh+UbA9qfzH/UnBxzC6T1hiNz97xyypMsutGg+M=;
        b=w0S+oOy+/KYUyUJ1k25tURGCmoKt5YkWVi9HIwsvn6WBTzb4XtIrsKtLEeb/nmyuDJ
         RSXZ3o9+M+TLFdDRBxw+fIJycvzvoWqNHMEPRBD9VtttjrQskM+Ue+YGQUnbz7HNQemU
         4r0OxIqQyrhWXrarc6vRGjA/IV34lcT/C46/iY/lX3KbEz08mwA2rUhIKjXPh6qaJet5
         1GtOxGd1Wo23yc02aypxURH10TXLLQJ0kODZxYKk3NNsiSZiZ6o6zPQRNctN4N+IFfLk
         eVG4eo8EJUGZv5oShVXJCPsQqOHli83mE3fsJ1YGNtCzdlYC0ds3OAuu54/PgtvN9F7J
         Wc5w==
X-Forwarded-Encrypted: i=1; AJvYcCWIWZmJdqYJPTktKThdzfpHWz0OPCc+/mKRUl+qkyEvJCv8iQY+WACgou8kK8pqtggPeH4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8sv70foa8SItrbwis7F2ikwHmkmDa8h9pJhrRGEI5vQyUKZml
	ZIh9KKga3drH59UYSvc4AstWOPQ9KidPZDJ1l61Q95XT/nGn2rMP
X-Google-Smtp-Source: AGHT+IHXk4ugJxOP+KLW8R2DhUn7YJ4NYahM5A6lar/YmFVgn0iuSPe4lDkcPU3xD/66jrRtBCfWkQ==
X-Received: by 2002:a17:907:6096:b0:a8b:6ee7:ba26 with SMTP id a640c23a62f3a-a90294a88d5mr1357286266b.1.1726400699151;
        Sun, 15 Sep 2024 04:44:59 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109676esm188778266b.33.2024.09.15.04.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 04:44:58 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
X-Google-Original-From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] reset: add driver for imx8ulp SIM reset controller
Date: Sun, 15 Sep 2024 07:43:10 -0400
Message-Id: <20240915114311.75496-3-laurentiu.mihalcea@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240915114311.75496-1-laurentiu.mihalcea@nxp.com>
References: <20240915114311.75496-1-laurentiu.mihalcea@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain components can be reset via the SIM module.
Add reset controller driver for the SIM module to
allow drivers for said components to control the
reset signal(s).

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/Kconfig             |   7 ++
 drivers/reset/Makefile            |   1 +
 drivers/reset/reset-imx8ulp-sim.c | 106 ++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 drivers/reset/reset-imx8ulp-sim.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 5484a65f66b9..492081354d03 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -113,6 +113,13 @@ config RESET_IMX8MP_AUDIOMIX
 	help
 	  This enables the reset controller driver for i.MX8MP AudioMix
 
+config RESET_IMX8ULP_SIM
+	tristate "i.MX8ULP SIM Reset Driver"
+	depends on ARCH_MXC
+	help
+	  This enables the SIM (System Integration Module) reset driver
+	  for i.MX8ULP SoC.
+
 config RESET_INTEL_GW
 	bool "Intel Reset Controller Driver"
 	depends on X86 || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 4411a2a124d7..38354e701811 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
 obj-$(CONFIG_RESET_HSDK) += reset-hsdk.o
 obj-$(CONFIG_RESET_IMX7) += reset-imx7.o
 obj-$(CONFIG_RESET_IMX8MP_AUDIOMIX) += reset-imx8mp-audiomix.o
+obj-$(CONFIG_RESET_IMX8ULP_SIM) += reset-imx8ulp-sim.o
 obj-$(CONFIG_RESET_INTEL_GW) += reset-intel-gw.o
 obj-$(CONFIG_RESET_K210) += reset-k210.o
 obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
diff --git a/drivers/reset/reset-imx8ulp-sim.c b/drivers/reset/reset-imx8ulp-sim.c
new file mode 100644
index 000000000000..04ff11d41e10
--- /dev/null
+++ b/drivers/reset/reset-imx8ulp-sim.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/of_platform.h>
+
+#define IMX8ULP_SIM_RESET_MIPI_DSI_RST_DPI_N	0
+#define IMX8ULP_SIM_RESET_MIPI_DSI_RST_ESC_N	1
+#define IMX8ULP_SIM_RESET_MIPI_DSI_RST_BYTE_N	2
+
+#define IMX8ULP_SIM_RESET_NUM 3
+
+#define AVD_SIM_SYSCTRL0        0x8
+
+struct imx8ulp_sim_reset {
+	struct reset_controller_dev     rcdev;
+	struct regmap                   *regmap;
+};
+
+static const u32 imx8ulp_sim_reset_bits[IMX8ULP_SIM_RESET_NUM] = {
+	[IMX8ULP_SIM_RESET_MIPI_DSI_RST_DPI_N] = BIT(3),
+	[IMX8ULP_SIM_RESET_MIPI_DSI_RST_ESC_N] = BIT(4),
+	[IMX8ULP_SIM_RESET_MIPI_DSI_RST_BYTE_N] = BIT(5),
+};
+
+static inline struct imx8ulp_sim_reset *
+to_imx8ulp_sim_reset(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct imx8ulp_sim_reset, rcdev);
+}
+
+static int imx8ulp_sim_reset_assert(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	struct imx8ulp_sim_reset *simr = to_imx8ulp_sim_reset(rcdev);
+	const u32 bit = imx8ulp_sim_reset_bits[id];
+
+	return regmap_update_bits(simr->regmap, AVD_SIM_SYSCTRL0, bit, 0);
+}
+
+static int imx8ulp_sim_reset_deassert(struct reset_controller_dev *rcdev,
+				      unsigned long id)
+{
+	struct imx8ulp_sim_reset *simr = to_imx8ulp_sim_reset(rcdev);
+	const u32 bit = imx8ulp_sim_reset_bits[id];
+
+	return regmap_update_bits(simr->regmap, AVD_SIM_SYSCTRL0, bit, bit);
+}
+
+static const struct reset_control_ops imx8ulp_sim_reset_ops = {
+	.assert         = imx8ulp_sim_reset_assert,
+	.deassert       = imx8ulp_sim_reset_deassert,
+};
+
+static const struct of_device_id imx8ulp_sim_reset_dt_ids[] = {
+	{ .compatible = "nxp,imx8ulp-avd-sim-reset", },
+	{ /* sentinel */ },
+};
+
+static int imx8ulp_sim_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct imx8ulp_sim_reset *simr;
+	int ret;
+
+	simr = devm_kzalloc(dev, sizeof(*simr), GFP_KERNEL);
+	if (!simr)
+		return -ENOMEM;
+
+	simr->regmap = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(simr->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(simr->regmap),
+				     "failed to get regmap\n");
+
+	simr->rcdev.owner = THIS_MODULE;
+	simr->rcdev.nr_resets = IMX8ULP_SIM_RESET_NUM;
+	simr->rcdev.ops = &imx8ulp_sim_reset_ops;
+	simr->rcdev.of_node = dev->of_node;
+
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		return ret;
+
+	return devm_reset_controller_register(dev, &simr->rcdev);
+}
+
+static struct platform_driver imx8ulp_sim_reset_driver = {
+	.probe  = imx8ulp_sim_reset_probe,
+	.driver = {
+		.name           = KBUILD_MODNAME,
+		.of_match_table = imx8ulp_sim_reset_dt_ids,
+	},
+};
+module_platform_driver(imx8ulp_sim_reset_driver);
+
+MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX8ULP System Integration Module Reset driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

