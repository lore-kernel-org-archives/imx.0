Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B02D23AB96
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 16:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571350; cv=none; b=sqrNTRUNXcWLfYhO5w6jGJnfCknEBa4JvwGjVZwbyG+KjUIB4YCv8zYZr5oo0laELMwzjyJxHvJ7cp+dqeX2MeS/fU//DVpzpyesuQM/qyFRF/Oki+CJkpyA14Z1HK+XY4NCErDK1jPa3CvvHo22iE5EpkAZWmUJifiX22i+z9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571350; c=relaxed/simple;
	bh=LUuMnTsPxCWGCQ1S7pwLEcQQ6RNEye6ZXCb6LSazH1s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nQn0hsO4iQFlnrK6mM8p2FMxHefm/IdTNb6pYPp03cc3hfqm+U7PFDc87pBKQRYvRb6NtoYl+FxtfzbNMRIEEYp2pg9p5widXwVbC4S17/MOl5bHL1MwFrgrtgwkpZJIy/PJOmbTg2kL9dI2dYM+EE/sjGKnVQP7WYeSyCwgse8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RoL/lafL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoL/lafL"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so4264747f8f.2
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 09:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571347; x=1750176147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67VEu7Em6E5HQaJhzv+j8FH2Rkd50dtS2qYsocCeLKg=;
        b=RoL/lafLoFuNAm+H/qkGFgTlVm30d4TS6vG93FZthz7LLtKET8zzMRMqv7lvOzFFvQ
         1s6BWbMAIPq7c9uOu3uWJC2Riym/vO8+9BwTpeCuPcipVn0RROtt/YtQ8gSBwN/3RxdP
         3XRvfpnDGM6wZBEUO01eHMYZgs6z1CQ7YONUdpXCL9TTDcOH+xrzjGIKaaUoi/b7t8R9
         5qzL81RLpdQL6j3GqQFaQJY1r5CkZqRMGRS+UtRvqrh+J7V/MszMezNdX+lZl58bgSQe
         hj++XziXYK6TMzSzQdzO6/Rj5SISKIUrGvOSlx2PxUyY+SIeFaJyo08Wb6pxmUVxOej9
         aq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571347; x=1750176147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=67VEu7Em6E5HQaJhzv+j8FH2Rkd50dtS2qYsocCeLKg=;
        b=cSOjHHoY7u+zMUUNJfPcNKvBeM0oAUGxLyy222zal1LHT7QtZYiwoFz+K4Vb5GpQCB
         PkFsKLhIW7i6Kf9aK442jtEr6d3ejYQlpZqL7gaDYDb2UOQLwDkmlc5v2J0jJ0wnAwvi
         4FOvQK1R9SwOmR4oicdcZlo7hinKePn551yDSTm51WLCP2vYDm3K2LjEZ8gbK0DSlVtH
         BDL9iEVPkvxBAVAnjv1UvIjUDdlyw0e6TZxvWaaz8JMGix75BByIotgnPRQVWEU7mkDc
         mYlRQwQHKv0W43+E+k/YRf1X017Nm7XSk2GBxd5TOUSbxm82+sci2RGiTobHHPMSWGUB
         YkPA==
X-Forwarded-Encrypted: i=1; AJvYcCXqRfpQx/0IQVTXTDeOVvvYhDH7v+ZV30ikTkwHA3vYOnygY++1J1M9kFXuvjQLxlg2OUo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMw/Yq3bGTwDEoY1/Cx5cl7nVQ3t0J2yt/lIkiOLMk/qVGiZkV
	QsYU058lSEN5jt7mNBfKdiR1KngOL5te8OOJGqt1USVnw+kY8OjZOlEs
X-Gm-Gg: ASbGncsTuHCiFogabEgoNJA1eJ7fYE2924KG3PdpLXkM3kKypiDgwqkeWQVP48GXg5a
	0u+zdm6BY2KeyYQJRBmbtt4dLpeLMn1qf17wIFSHpNcg2YRyfeA+Dys3LjgptotMuDJqjthbDQb
	tFs9F/KQDW+2wk7dpSB8OiQms9u9kYZIxuuUqIuAVf3NmkQfuivbHzhmIH4aGn1/8qbb8SMOkjX
	aPic/OCN2JXvqpkIOnRHVxi398tS7o+mYnkZZCno8AxrIBT9bvARhxxtOi07ChqZkYqu41/J3ow
	D7bMm7lT3QbmTUQIIGI4WS7SsR/8Tuh6a0Ruuvdv2ss1hx5TqbtbOgfZCMvcNcPse9frTT+1kxa
	RKy3kg/B8v/TR7eu5OB2rfxo=
X-Google-Smtp-Source: AGHT+IGHhW/p8zADhnFLJnKLHKJ98yUEXlzsMVwwzjxsFGqrs0N2We4X8hpm2okE6IPM60AODO77rw==
X-Received: by 2002:a05:6000:26d3:b0:3a5:2cb5:6429 with SMTP id ffacd0b85a97d-3a5319b5c98mr14820076f8f.43.1749571346552;
        Tue, 10 Jun 2025 09:02:26 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:26 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/6] bus: add driver for IMX AIPSTZ bridge
Date: Tue, 10 Jun 2025 12:01:49 -0400
Message-Id: <20250610160152.1113930-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
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
 drivers/bus/imx-aipstz.c | 96 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)
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
index 000000000000..6610251f41c7
--- /dev/null
+++ b/drivers/bus/imx-aipstz.c
@@ -0,0 +1,96 @@
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
+struct imx_aipstz_data {
+	void __iomem *base;
+	const struct imx_aipstz_config *default_cfg;
+};
+
+static void imx_aipstz_apply_default(struct imx_aipstz_data *data)
+{
+	writel(data->default_cfg->mpr0, data->base + IMX_AIPSTZ_MPR0);
+}
+
+static int imx_aipstz_probe(struct platform_device *pdev)
+{
+	struct imx_aipstz_data *data;
+
+	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "failed to allocate data memory\n");
+
+	data->base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
+	if (IS_ERR(data->base))
+		return dev_err_probe(&pdev->dev, -ENOMEM,
+				     "failed to get/ioremap AC memory\n");
+
+	data->default_cfg = of_device_get_match_data(&pdev->dev);
+
+	imx_aipstz_apply_default(data);
+
+	dev_set_drvdata(&pdev->dev, data);
+
+	pm_runtime_set_active(&pdev->dev);
+	devm_pm_runtime_enable(&pdev->dev);
+
+	return devm_of_platform_populate(&pdev->dev);
+}
+
+static int imx_aipstz_runtime_resume(struct device *dev)
+{
+	struct imx_aipstz_data *data = dev_get_drvdata(dev);
+
+	/* restore potentially lost configuration during domain power-off */
+	imx_aipstz_apply_default(data);
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

