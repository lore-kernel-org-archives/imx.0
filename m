Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B87F224895
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 16:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588870; cv=none; b=JdbD78o6d+ombfj1rtrjEOOHdEO09Ns4GQDW1UmyOYHxkbe8ukhKt/Tj+4orJMqhNQwBWjGIG2MYyz0I7PKrKT18eP9L1mtRMXI/OWleAKnCFxF9xqOWrV/3EGbgZrMAAE5PDYlGhJuKTZWW43OZsEy7FnAQER6Vdcc7fDbGEdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588870; c=relaxed/simple;
	bh=1gZ0EI8sd7+vHVi6GHanqIKfaQMapA6GDDBTPlN15OE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X5hy1OJ4q1BNDHQ/k2104knSa7gOi9u/iNWRJFUfwmXfaKhXo65SOE30wNcXZirHKUluW9hpkIAe4KTHT1nAQDIJ76n6qlSc+CQ3VefInBVQ7W8BchWIhDYStwAWYCMP2FaPzcMQSCBSxKwP/ZJn7jb6O3zk/YArUBygkMb8rvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6FcoxAP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6FcoxAP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so385015e9.0
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 08:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588866; x=1741193666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aozAnWpbhCam5E6+6zNz06mhlqboVoG1Yv6qg/1M0vU=;
        b=X6FcoxAPlYZ4cfzDIHZJN568s5ufkV/d94CGdC5Wd6Znie1jpvCMrKTvhlxdYd2bIh
         3C4eTxvKLKsJ1d3o6yPhxs6Eg2mVniG6j5UQtHu2NixL4G+Z0fdJOSwQuyEQN+3vLdzB
         D+kKt09LBKvEsYDyJnzd9KdLWYUmnddlqmLmtD8q3r/weLcYNTzRncHmGb0Fl0hu684s
         +Xwexl0Y0VxLopc2ds3UmTcuJNzQKD4Kxb+Hui8+FRZW5YW2xX7xueWYc113DYOK4jmI
         xQr5ES3bW9jXOpehjB5O1Ar3V1JATV/+n5YfKGjnPMyLiYVTiFcPBj3Q4gLlds0m/ZU5
         lGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588866; x=1741193666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aozAnWpbhCam5E6+6zNz06mhlqboVoG1Yv6qg/1M0vU=;
        b=Rnr16nIikfWwOJzheiOMBC/31yQLITIXw47V7hLBCvSKdOXqNLm+LfGkGg3YwaclRN
         Z4KSXHpQuQaaEGmtXzuaMMJXbS5Qu5Yz+2pQJxsgCQstvXIiAyi+OlIP74uevhBisUEq
         n4XD17EHDJrnMwYz7XkXVYbVGvm96Wpb1wCK7J19eRjfeFxQKUvVjIEZ2eZTlmk2bqkb
         CTY2gJOgk3rN/we+ym7B9NtFFR7s4HO41ljWrQU7g9WZcA3TLQe5PBOUsjpK6M2AJiE+
         8ztSzEjsfOvcWk55Wd4c+NC4W1Vp2SNMR0iROY5/285lWpmX6bkns3WBpIJnA/th20nM
         YtfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx8KVlDu8OcDUJBfbLg35KZM649w8mfrY57Xd0g2ingUETh5UHd3eb2UfVqV8eu59tMp0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcGm9TBcgg8OYdCozfVoAFDJkzodSJiMFHCrEK5piwNVDjVVCI
	ikbK8MH8ZHwu7y49u7qgXnAZJYdo0j6bVtHkn1sjdqdoHLlFP6yc
X-Gm-Gg: ASbGncuY0H3kwpg82NLgMjgXV2FdXraHstTyoJOfaInjAc8V66NdExrKo70i40HnAL8
	Gr0QM3pSSbis/Gz0xrP02gY57PYTv7OGA2QSmzajV5AFoedAC1UAAeOlQmHoFxbLu5D5IPViLT0
	ITEJ6H0h33eCgc4rEAA0rSS2ubmsKaJCvkEUB/losmYWLbHuEGtTKC6zVkpIetk64GhXRqxNM+p
	OSB9BObI7js8TYHwudKvgFrfdGk7j/v4zUwV6MuGJFk/1K56WFNp9KCcmUNex4hAOPp+ZW2vy3U
	6U0zmlGfpjGk9Pl211QTsIB2m33/h+DImr+zRi89Uu451J7l1LtieqUACeFnrohS
X-Google-Smtp-Source: AGHT+IFACgAUKq5wmfKVcHjK35/otoDg213tSOtDa+s2dpYjWDl8G1TUQEQB59e49vjyaP8FtEj8dQ==
X-Received: by 2002:a05:600c:3548:b0:439:a138:1d with SMTP id 5b1f17b1804b1-439aebc2408mr158492005e9.22.1740588866434;
        Wed, 26 Feb 2025 08:54:26 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba587163sm27672515e9.36.2025.02.26.08.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:54:26 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] bus: add driver for IMX AIPSTZ bridge
Date: Wed, 26 Feb 2025 11:53:12 -0500
Message-Id: <20250226165314.34205-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
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
index 000000000000..c90580da17a1
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
+				     "failed to get/ioremap memory\n");
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

