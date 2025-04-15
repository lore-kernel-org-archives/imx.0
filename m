Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5072206BA
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 17:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737669; cv=none; b=ZkiawaytiUrbRGukaMkqCGyIVZHbVytF/EFbuM5G77CsAAYPknpTZ9B59mRa71DlkDq+mnllELRpB8ZqSfb0WTfEK5Iy7/vjRbc/o2wxY/dXqVppw72rrUsjKZWk/yLKxR1wTTjxfz6m5KoWP7yytXGdmMrVgGlE0gsuuNvK79k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737669; c=relaxed/simple;
	bh=F8NZNfXY+db76aNNrBJbSG7T5RVx6dAyulLZqrqB6lM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mT+6mJrL/a74TOgIVdjKVeLYqGiHBPOpJTxffvHIOiL4Wp3pHZafzIXdsEwgMeJkk6ktwNu9W2sVq5YRFGUZAMXpSXxbyMmosxd3TttKVn9uz/3usYbKu7PPCSLQLWatutDVIOdQo+jVZ+se699hDz2fUn9aHU8K3McF6R2avxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ksv79TvW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ksv79TvW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3913958ebf2so5149827f8f.3
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737666; x=1745342466; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=;
        b=ksv79TvWc88nJjM1BHtEQmG0dQfgO4XCAd4J5ZZPEQ8rfiVnHUz+xWonSmX8m2FbwS
         byKz6BSffxstxFvjQxzSKS91+qEayb44kJTMi0oNftEvex4Xt1ZX/oI3OxuZTn2llXUi
         plajcNkHbNPTkxbvtbHBv9nqmIzEdZ6YXoSacx1vhHBPRgFiiQenWCaB4ZUH+S/SerrL
         pK7MhXm+j1riOpaRHt/cj7u9xXx79JnJnl5TqB+rV3ERnFc/XVEYm9r+HrAueCrZ+biC
         zMpD1eKIgQd7IVms/PYDtoZdPc051HJSyBTRX0OivQDRu4xC/ceGpiTH+itTptKma+wg
         Evow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737666; x=1745342466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+/ol304EYZFzmHf5qWZCvTKblJaCdBMbBu4cFrdM28=;
        b=ZqKFs0gSyck3cqfD3d82ubrF3js/L+3aFPKW/eFXMyy1Imgfk5sL7i8Fa1Hrqjvk9D
         fgzvinmxBxThsMf40U3PBFLvqZJ1FpIedU0vvR2NnFDxz9436/+H4RdGlYz7V12ZjgfH
         jWdBeBcpRGr2o402z+6UALDoKAgEtZ02QqXnNH2ohxiGw0GY+CtQZSuu6JmVEmoZM9nc
         Ro8OJmOaJkf8BLxee3m9kQzNdfcf1zDXAmUc+ZgkdtXWkraTXLjIex3v+RQqL74xsI3b
         ZY3FLDJf2s7KcybJ46XVSsqvij0kTG13u/tLiPKfiG8JOV7og0bpwqXYDTy5X27gYQZ8
         rIhA==
X-Forwarded-Encrypted: i=1; AJvYcCUseh8U9Fi0S65YS7u3+TxedUrIsDjbPhgUDPCG5rGUaEHe8NN2v4cmfbaZcE6cHxmQZqQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCfFW4xi88gj/3lO7wCQ26nVZLO7YxT1eD158J4Iq0hEaWxus/
	qPKPqQMzrJPDPFvdbZf3P0tQ0vG8v0erVJ3nd7cF+yTyEZBtrcEj
X-Gm-Gg: ASbGncsz3vmOpndeP/VSq+N5tcIckQC9aoOBe4vEG0U5+88y7fLZTbYvcX2l8/rdrwr
	OfVk9z54dTJ0fuAccF6QcFrtjojcRny2NOJZumE16WGB4ca3lwdpyTgUYYJc1CAH6uWk5pt8aC2
	G0kzyISbIFxelJ6jm+HLxGreE+Ld1WOhJVTDFGja71af7gW6CjozVCWK0DInsK4WevSqPWYHUWI
	qy4Ns6Jr1qF7CNfCdMgWYJKSQ5pgpUPOlqfpDp9fNi3n+XLkKsnrjcgkJdUJ3xlsi/X/ITzuENq
	LQL7Xia5PzlsiEiBMuMaCnzSTv5QU1t/boB2jPh1DNuKut5WCvLv6NW9W8oFXlX0SNN5Dd37Gxj
	QuS6uxA68LtYnrQ==
X-Google-Smtp-Source: AGHT+IGluMtsFmqw+QbXEPUMGrf4Yg+XMsClLT/fyWCDWpKwYSIgHYsl2lHPQCscdBps9+U6EsmWUA==
X-Received: by 2002:a5d:64a7:0:b0:39e:cbf3:79db with SMTP id ffacd0b85a97d-39ee2737516mr306093f8f.10.1744737665614;
        Tue, 15 Apr 2025 10:21:05 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:05 -0700 (PDT)
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
Subject: [PATCH v6 3/6] bus: add driver for IMX AIPSTZ bridge
Date: Tue, 15 Apr 2025 13:19:16 -0400
Message-Id: <20250415171919.5623-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
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

