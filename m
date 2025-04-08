Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB38232360
	for <imx@lists.linux.dev>; Tue,  8 Apr 2025 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126981; cv=none; b=EQELnrSicCpfoYZAJrlTFqzqmXyAmxpW9mmB6dVqHQo1NDJ6UJVNYEjRgUHMUmEbJQCH5TR2e3uIhPua+8epKs3BYIVG6AYX/RfRgB8AxLo68EvNruVJFAEIHydtxxjd+RuMirEsl+dUoFCF4Qgvn1119fUHdYQ59sEC4M82EOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126981; c=relaxed/simple;
	bh=F8NZNfXY+db76aNNrBJbSG7T5RVx6dAyulLZqrqB6lM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jfCbzFw4r0qRC0ZmprkuXVChECRVt87a7YjTSuUqAulOatcAiaVV3zxNylulbZRvPAiykPPUWJ9OVNARlxZsBjDKc8+wKQEJKsCpPS+PdFHWaUtl5JMafPuPCwLFptJonPtGzcUW+fmERQU5hzWroR1Ee6b4X/84jvNZASDZRvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uy+a1LvN; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uy+a1LvN"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso3348319f8f.0
        for <imx@lists.linux.dev>; Tue, 08 Apr 2025 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126977; x=1744731777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=;
        b=Uy+a1LvNDXW9ZxBoPf4BAnU1AjNWpnxxj5ORcZ9sXEvQnlUZnUUSaJRz3wZO6oUyz4
         rph+C8m87RabdG3apGm2UYVjPsUB3CTXMokKYNjNEVPTOK6ZnrpqR5WqOLc6ZNbFMhDV
         BOIptLC5BR80FlyQDy9Cnxwm+c91Sq5I52z87+JdXEfCdP1knYjfODbFGF6vsCAflBMt
         TmjPyq2bAHb/gVNf3CllRCIZugjOMTMcB1hL2kyP5Lfa1fR0WjMm0Hj3R9pX51YOLVmM
         ZCSHfci96mMoiepJ7hqhPPbVyvvpaAF068hqokFUyV9GL8y1nRkKbM519o5DC/v3pmi6
         kYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126977; x=1744731777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=;
        b=XXg+JasxUDWEt7bih6coAXYfwFOzOyA4aEFxqsjID2tVyJOM5seDblbHT6fiusqHrr
         jY6wOuRAXa16k7YEi1KN8cO1JgO4806yVPqW5AACwMx39oHIxNvEBpzQJDikNhZszNVo
         dHSwnFE+6ki+fYehFUHIlUkXpyAbGuDK+bLYIb9IHVSlmiAhKjycpDOIgcGgu3N5YWed
         FOskiNtL7K5RzEAdmfZ6PIFw+GX/7adwN59BV6op6gAfNW3i/NpsQrr0+9ypzbvWo+9q
         L3cNGku/0ZysmK6YHYlWiGgYqUA60EQqenLZl2XaTnadtWLkCftjU0ohHn6R/9w7Cuvw
         TBSA==
X-Forwarded-Encrypted: i=1; AJvYcCVIUqBW2RSd8aB1sxJLM+ILvT1csAXn7xrmhfLdq+kfTZUghoMaL4LpHuU8jPeXGWAArOA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQHzdcGo9athzTznM1hZCjRoyt7lW9HJVGMfMtOg0r3cstV/Uo
	HhYmlJ+NgXVibIzTPhTXBB8AZ/beAVkIy5WC1yrlkUaPOyMuj1oX
X-Gm-Gg: ASbGnctH7DyM/FDCVAJ2AdN3U2ZkHtY0FGGV5pp8TsCYQ4YFhRL0Kl2X2l5PixZu/WH
	OnnrVUYcqegztLcqyOJg/h6ThgV59m2FLZJinNbSgOxBHuG/V9ZazSho0K48+LEr3SuUo9yO2wo
	9g9V8h40UyzXLfCqJLBTcVaz60XXgU+h1LB99QaNT3USpvNmJdhu2fprZJX5XImp+hZ/kmlYhgY
	drCfAtfWDz51Zv6Lm6SergPK1ABbCOfaMR4+SyxEXJl3jA2dWsb8t2IQTFx7MWWAkowoYXeJf1f
	hadB2NrEYeOvozW08WLsUyCZ44oNuF/v85KsBWw+5IvYTEmjDTItzgbpnnc5TGtzDAqdnGwqjtE
	760AgJ1NoVga4+zVdLw==
X-Google-Smtp-Source: AGHT+IG0AMxcw+cd08RKS5cdUE5DuDrHXtBsG7uCqS+Lpu1Nku8qrLyC5cK51TsZmHFhPyplpfJWLw==
X-Received: by 2002:a05:6000:290a:b0:391:4bfd:6d5 with SMTP id ffacd0b85a97d-39cba93cf03mr14625191f8f.52.1744126977343;
        Tue, 08 Apr 2025 08:42:57 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:56 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/6] bus: add driver for IMX AIPSTZ bridge
Date: Tue,  8 Apr 2025 11:42:33 -0400
Message-Id: <20250408154236.49421-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The secure AHB to IP Slave (AIPSTZ) bus bridge provides access control
configurations meant to restrict access to certain peripherals.
Some of the configurations include:

	1) Marking masters as trusted for R/W. Based on this
	(and the configuration of the accessed peripheral), the bridge
	may choose to abort the R/W transactions issued by certain
	masters.

	2) Allowing/disallowing write accesses to peripherals.

Add driver for this IP. Since there's currently no framework for
access controllers (and since there's currently no need for having
flexibility w.r.t the configurations) all this driver does is it
applies a relaxed, "default" configuration, in which all masters
are trusted for R/W.

Note that some instances of this IP (e.g: AIPSTZ5 on i.MX8MP) may be tied
to a power domain and may lose their configuration when the domain is
powered off. This is why the configuration has to be restored when the
domain is powered on.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/bus/Kconfig      |  6 +++
 drivers/bus/Makefile     |  1 +
 drivers/bus/imx-aipstz.c | 92 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 99 insertions(+)
 create mode 100644 drivers/bus/imx-aipstz.c

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index ff669a8ccad9..fe7600283e70 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -87,6 +87,12 @@ config HISILICON_LPC
 	  Driver to enable I/O access to devices attached to the Low Pin
 	  Count bus on the HiSilicon Hip06/7 SoC.
 
+config IMX_AIPSTZ
+	tristate "Support for IMX Secure AHB to IP Slave bus (AIPSTZ) bridge"
+	depends on ARCH_MXC
+	help
+	  Enable support for IMX AIPSTZ bridge.
+
 config IMX_WEIM
 	bool "Freescale EIM DRIVER"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index cddd4984d6af..8e693fe8a03a 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_FSL_MC_BUS)	+= fsl-mc/
 
 obj-$(CONFIG_BT1_APB)		+= bt1-apb.o
 obj-$(CONFIG_BT1_AXI)		+= bt1-axi.o
+obj-$(CONFIG_IMX_AIPSTZ)	+= imx-aipstz.o
 obj-$(CONFIG_IMX_WEIM)		+= imx-weim.o
 obj-$(CONFIG_INTEL_IXP4XX_EB)	+= intel-ixp4xx-eb.o
 obj-$(CONFIG_MIPS_CDMM)		+= mips_cdmm.o
diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
new file mode 100644
index 000000000000..44db40dae71b
--- /dev/null
+++ b/drivers/bus/imx-aipstz.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#define IMX_AIPSTZ_MPR0 0x0
+
+struct imx_aipstz_config {
+	u32 mpr0;
+};
+
+static void imx_aipstz_apply_default(void __iomem *base,
+				     const struct imx_aipstz_config *default_cfg)
+{
+	writel(default_cfg->mpr0, base + IMX_AIPSTZ_MPR0);
+}
+
+static int imx_aipstz_probe(struct platform_device *pdev)
+{
+	const struct imx_aipstz_config *default_cfg;
+	void __iomem *base;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(base))
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "failed to get/ioremap AC memory\n");
+
+	default_cfg = of_device_get_match_data(&pdev->dev);
+
+	imx_aipstz_apply_default(base, default_cfg);
+
+	dev_set_drvdata(&pdev->dev, base);
+
+	pm_runtime_set_active(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
+
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static int imx_aipstz_runtime_resume(struct device *dev)
+{
+	const struct imx_aipstz_config *default_cfg;
+	void __iomem *base;
+
+	base = dev_get_drvdata(dev);
+	default_cfg = of_device_get_match_data(dev);
+
+	/* restore potentially lost configuration during domain power-off */
+	imx_aipstz_apply_default(base, default_cfg);
+
+	return 0;
+}
+
+static const struct dev_pm_ops imx_aipstz_pm_ops = {
+	RUNTIME_PM_OPS(NULL, imx_aipstz_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+/*
+ * following configuration is equivalent to:
+ *	masters 0-7 => trusted for R/W + use AHB's HPROT[1] to det. privilege
+ */
+static const struct imx_aipstz_config imx8mp_aipstz_default_cfg = {
+	.mpr0 = 0x77777777,
+};
+
+static const struct of_device_id imx_aipstz_of_ids[] = {
+	{ .compatible = "fsl,imx8mp-aipstz", .data = &imx8mp_aipstz_default_cfg },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, imx_aipstz_of_ids);
+
+static struct platform_driver imx_aipstz_of_driver = {
+	.probe = imx_aipstz_probe,
+	.driver = {
+		.name = "imx-aipstz",
+		.of_match_table = imx_aipstz_of_ids,
+		.pm = pm_ptr(&imx_aipstz_pm_ops),
+	},
+};
+module_platform_driver(imx_aipstz_of_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("IMX secure AHB to IP Slave bus (AIPSTZ) bridge driver");
+MODULE_AUTHOR("Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>");
-- 
2.34.1

