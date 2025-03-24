Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1982641F2
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742833818; cv=none; b=NTVDuRBu81I11ghtQCiof/TTGU5nbHYcxYK7TrJW7haDjT0hpq0O3+TBxmXTlRom5nZ/zq5axcFB690G6eXEpZkIjps7tPeUueYFCIXNXCMp30XMh5VJ7dj8Y7eM5I+U00LLpkdTyhd+pe3yCweJUWbdQhu/WG247zNaNbpXTR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742833818; c=relaxed/simple;
	bh=UoPzxqR7fMDh+wHIEf0arGh7Tsb9SBUP44rlOtZo9wI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JJZEHPPX/+3bfgDlGpinx8VfxbgctPAuavaZzVLqXTLj4tNjelY5gMOcfnPHcuU70KhsrAWd/Y9IJMqHsL0DA1FRuFEVM8/oM78nK7GusoJmZrA67v6Z0kWtsKDbRq1PPynpq7ow+7PR68S8myv7ArYtbFF4aLXBfqBq4vZYIl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAst4XpA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAst4XpA"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf257158fso31079435e9.2
        for <imx@lists.linux.dev>; Mon, 24 Mar 2025 09:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742833815; x=1743438615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dkHLVtiZRGLb+v1unC8oKgvdUemVJjrLv1sSsCEAtg=;
        b=YAst4XpAFWCBAGX/D0ghcXsEUjsnBhwVEpGtYoKuDyB2I2sx2nvOaqhfpERPADHR/g
         wjXNajgyj5NXVggfOW1SoQrRnoBMzM7uuL2Rlu8j2p/qH33la09C0tnkY8XmANcGl4n+
         zD2jNZS2cqNWUaTks3rZ/r8CGCNKgUEPPLxU7F9KlRi7YqyPyMWJC9lb2sDE9fyUvWE1
         jBqPmaxEGZb3f0moWTSxyFDxL79qeueD40QkZ/sFR6nTSdy0cxcCsDlHHFA+mtZziveu
         +h8kohjpae2Yk9HkKPx6za5e8dYTC3bGZRdlHawB2qCbjx93MrAgr5hnB22rphxbAdak
         HGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833815; x=1743438615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dkHLVtiZRGLb+v1unC8oKgvdUemVJjrLv1sSsCEAtg=;
        b=R7UgwFFD7b7OLgBnYaJ1dSbbq4uDYhGWti6mj2wMvd/0l6XJNJvrSlBtlJlkTGb5vK
         fIFPWVAN2NhZYvW5s/wXw0RRzx5hEZf17AE5MjHX5A4Ihl6UeYZ+G3sX7OQOA66zNAGt
         Z3s7ZW6k/lEIJacAcfovNc7WaAJ4NTxfAokH3EwEWbtWjW1shw35g4ODd7Nja+2mEpv5
         8rxf5A6uSmvNR/bhxuS6SKxilNjPDsmaCYbUT5ZMsoYC874VXPjGtXwQZcPQXmpOlKcW
         MUAT6VhpPEwkzy+HO+LvQYj2mixP0oIsMQFTMz4ZP9vQ1fL15qSKSnl7Yx/MNX3ekqA1
         jo0w==
X-Forwarded-Encrypted: i=1; AJvYcCWeDX6dGXhHCp08n85m6xnOw53M6/QwuIUqJi3NkSK2ctQE+6iMRCU8nDkUh56AgRCde7Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzS8MLt50vb9GGm0LVIOaEdVGSEK+v7WDe1XO2Cv3G0w4agqEiI
	Kk39Y/eqqQYh2doKghZcAKmcjJ6H88FBQBEABQSMI98zAk27ORNN
X-Gm-Gg: ASbGnctrIuHI6e3Vx0o9d7V/rHaAoD5O2b8/KZ8B5NzIoF3Zv/oNs8+5ug1fRWs4YLu
	plJ00BrqmYZXP2jz9N6ckaUUMJpt01PUOKmzQthLOd0qPCZf/CmliiPMaORj5TR9LLbuazMOdY1
	VuKf5Q4iIWEZNDdvNeQO6g377b1sGhUccw42f+sNpzxqRIc4l1GYLflBWSOS6zpDtujdiMvT00L
	ywFw4rOSN1TlafEYWdgt67qjPyLMIspdHpHrgz6PBFqshYqP9KSFracNGO2MlQiDnruY+bccGHg
	3xNOaL3lideLBFnLdfrBaUHWYNnNg1Vk4QwLoNddSnnPDh1AISk26v8Uqf4fTpaSWUlEenItCHF
	AHg3C/mM=
X-Google-Smtp-Source: AGHT+IH2+OEelK919FNU/gpPRx8fo5vdl1AROa4aq4iE0A/wWtsH8FX2Q56/X5JEk5OPq1wa3npreg==
X-Received: by 2002:a05:600c:1d15:b0:43d:677:3a8a with SMTP id 5b1f17b1804b1-43d509efa8cmr114128435e9.10.1742833814705;
        Mon, 24 Mar 2025 09:30:14 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb0669sm124106765e9.34.2025.03.24.09.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:30:14 -0700 (PDT)
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
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] bus: add driver for IMX AIPSTZ bridge
Date: Mon, 24 Mar 2025 12:25:54 -0400
Message-Id: <20250324162556.30972-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
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
index 000000000000..538ad89dba30
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
+	base = devm_platform_ioremap_resource_byname(pdev, "ac");
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

