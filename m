Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A770481CE
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062007; cv=none; b=qg9fgrHZV+QgfK+3Jgyac2p2fZ+oaoUoI9Ek/W9PhIELdb/DzF/I0btAOL+YruPHbUOFLMV9etWUsYsdjnSNJjXE9w1ly5FevGsGfLshXazLxSqbTuhfuBDbyNIooMVJXIwyl77r56J1sDbKqBRKF8WIaR71zpPYsj6WnFpTCPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062007; c=relaxed/simple;
	bh=2i9fi87fwGI/U7ZIjVQcpIYrxTU8HgNTEMUHbWJFl6c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qYak6d/uWl3oXUlEEWEcjynVPDGhp1eBYcUXNrbAOMNUk6Pjo19nR61OBa1zg9s4T9d75KVhZqSZqplboy0ChcSAO26V2304gPQO2mC9FS5P7gtVwmbvAqWvzKnQWhsm7VEhOSy9HyidWtpODbnsvm/Hgs3tDH3MYJQZN+Zw9mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjH4T1DF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjH4T1DF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4266ed6c691so28558355e9.3
        for <imx@lists.linux.dev>; Mon, 15 Jul 2024 09:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721062003; x=1721666803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jh6JZ+1LYv7M2Ni3seuv4GEQ7MYtjKnioH0Jix8Ipz0=;
        b=RjH4T1DFUYsgjScwVk1feVC2xVz5SjkZV9rh0ykATgpFQy7Gb7dtW+Mb0eCTMTH1K4
         VDNd5wcSso2zFZc4ijBDILvoOFk35TBpoIhCtQ1+ahyNUFJ0m9G30O8CZxLzhs8XnGj/
         3vzLC7kypmKKgigunzNX6S3MhBYK/Ktql/ByfQuJDfrcCG/h+R11DsdA20Xuyv/BKOTV
         pV2XTwofwBHod1MR9bw5IOB1A+OLWoQF6Zx1xprXNlFy8Da9Kom7ogj9g+nEJuUpm7ax
         UlicqXooALTphHrrKlv6uMvV2KeM3ZWvHhs8blb+wsiJ87gxHHav1nbTmOIGVD5eMDZt
         bgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721062003; x=1721666803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jh6JZ+1LYv7M2Ni3seuv4GEQ7MYtjKnioH0Jix8Ipz0=;
        b=g6QzMovVh1TWMARVonGZzxXL/OLk7TU3NdvWXXitIP81L2eAs+M5/gLJmCRhoTVbL+
         /B4U5i/u0AIjRDpEvxNvBWXEQLI86NVviImIu5dXsR5b4uiIIgjcWm1xke5+AlAEFoC5
         UUriXmAtN6SNsAt6ndU3eUHbymYg1I/ASeFj/WpUaBT+HAI1aymApF35NQ4x3TasKGhx
         HwgFDGCTFdL76WSY0arOnP/SEuTVF8cUsdrja4ouMc7BipMoe+sHEiaFt2GDAF+kDeSR
         ECjeo0Pzh0bqtoUtJlUE8nVqlQ8NsSyWMuRayFFD+3st2xb11KTg/B1sacsJVBbDY+g8
         rkfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuoWYTqkky6QdnIODVjPlY50QhDnYZCyNsm2vD9zgBM76rZTt5bTnfGJl4+8ZFcn5k9BgqpmzIhlLjEgk39Rshc/g9
X-Gm-Message-State: AOJu0Yxjpz5Tl//2JLTapBad9gW1nMsUHBX3sE3TEfSzVGildQ3ADVsb
	DDKFEipOeEu6Ck/sjKIu2MbFcKtNMw61fEtsrEMrIZ4qbl4YTvpt
X-Google-Smtp-Source: AGHT+IEr6cCHa9wTd0C+ds1nssosgD28+7x4wtLWpAatjKXHXE7WHF1w1QpLnGh9WYZlFn6Fb/QL9g==
X-Received: by 2002:a05:600c:1911:b0:426:5dd0:a1fc with SMTP id 5b1f17b1804b1-427b88d00f5mr1337135e9.34.1721062003548;
        Mon, 15 Jul 2024 09:46:43 -0700 (PDT)
Received: from playground.localdomain ([188.25.209.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e7749esm94316975e9.2.2024.07.15.09.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:46:43 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
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
Subject: [PATCH v3 2/3] reset: add driver for imx8ulp SIM reset controller
Date: Mon, 15 Jul 2024 12:45:13 -0400
Message-Id: <20240715164514.8718-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240715164514.8718-1-laurentiumihalcea111@gmail.com>
References: <20240715164514.8718-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

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
index 67bce340a87e..8e9cbf2859d6 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -100,6 +100,13 @@ config RESET_IMX8MP_AUDIOMIX
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
index 27b0bbdfcc04..685e08982283 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
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

