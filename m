Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA34C25335B
	for <imx@lists.linux.dev>; Fri, 21 Feb 2025 19:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740165598; cv=none; b=EAZpkAQhGCNl/U7GFopzyMH3pDq0x3DgCEjp1F+Zka959c+KgmBHTmx4ikk1JXhfAaJwrI7adhKEdpcK5sCvC6EeKO7yLI0sUhsAaH1V58Ad30IRuFF6Sxk3F2PSK8GDY5AKqCbTEE9cLS74rocL1D/hATHgHJQoHTf50Ic/1Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740165598; c=relaxed/simple;
	bh=zbfAUKiUNSyy6oSEBdQN+iRDEr73rZQgEXyyQSAdsFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kqfwiJ9rcTSgZqKP8XKFN0aoKiv/8g1x1ksTeALUYhZL102g0J5nBqpOGhukpz3qui9ezODICL3orbly3P/RG9tn+ATdcUfE03zkm5qstaM6uJ1EpyWvQK7HtaLONdsjnHNdiPBcocEc1z800FbI8pi8oGdlinPIKCAQj7Eegxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFtENEOn; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFtENEOn"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abb7520028bso344199866b.3
        for <imx@lists.linux.dev>; Fri, 21 Feb 2025 11:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165594; x=1740770394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQ9m9HGe9/qjs9gf28iHfA2/6NxUxjMKKdh6HhKymZg=;
        b=LFtENEOnZVUKfaK+LhuWWUe7VdlqARdWidyHvJKPPp1h9u0t12QYD4KcsGEuiWPpLN
         vYyPGp7CxY+YKGwOdz7gRoSfsDSFBuzBa7RQosJcZlsY6NknsrfI9SJ9Zjq3+iDDuLuh
         4s3H67Za6NSLyxVDMj3nwDEBCuScKhV2yug6xyFlGW8SsqnySMV9cJGzdCIDVIAkZWtP
         3wYwleX7FP7CrWYeuJOOBkHCvqq3vnTf0jHIDV0b1UIdMrb55PUMEzyYcBpeRfhUryJT
         Mmt3PtVobJoLkg8mVN6KFsNKnsouCzteIWzgiGT4pF5fgR/9U647xfM++02mByhWk3fM
         V5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165594; x=1740770394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQ9m9HGe9/qjs9gf28iHfA2/6NxUxjMKKdh6HhKymZg=;
        b=EDWF9i3kYnHUv1b9vix0bHD1JtkGOPJecutV2HYLqh55SZLCFQ8tv6grnO5ooKS9C2
         7NtYnYmkqb+O49zp+5nOrbDkWOsC0ub8S+Ot2HkX1PXCetgZFiiQSNMm9N+Izw/o1huF
         O6KxhhUu8XNRd12/lOEqZIKQ7bkkb37bERY1qhUM15RtkVdeejESDM48MIOfrYH2qOjB
         1sR7zRPM0prdLNj09QearcxFvejECvJyOncx1ewWMX0sFwZ+tsIkbH2+Ko7Zem7Qj+/n
         hFfYHLVqtC4Ioi9Vzw82Nyt7FYq94Fb9N+u0gek0JYtXdcH/blvQDl7vABfhP0epmoSo
         3Z+w==
X-Forwarded-Encrypted: i=1; AJvYcCX63VcgUkt2sjaP2CWU9a10urFi1fvN0xQc9n9Ko2bgw6XMoqD8OM+MJtSwRZVql+TiIXA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1Dd2OkLuvtfEtdtABr2qLMgda7nMJAC5sqlt16aE7IXiyc4r/
	aWrH1KAtYlSmajJKNA+EHlaqfNooLPhG8R8FPEymwRF59KswUmhE
X-Gm-Gg: ASbGncscMYkL3RbbiM/Bzydrq5BfSbQVVodCRCpQon3v96DsA6Fi6NLLE7KdP0TtRRf
	6HkpVdWMV+JAG0b/p6r1l0uPyx/6N6RMYP0Rcud2jPelPmccqhWj5gxcxQ0MysCshD/SygYNuaG
	3j9zJoWpUxLzxDVZOJXS4We6p5hsJGxcoCK410VOikoX3d6XKdH7stip63VFXydl9OqRspVT1zY
	+GWD2r0gm6+mAe4XKl8XkQCqEjjxer4sjiLbTnWhVW9G81hwNgjSnEYf+DNL0KdTuHkVwGlFtd/
	pQ6HHKUkadx3Sp4pdlFlOeLvKC+KzQ9Lc1H6x3aycfmU4Ll5AmsLEiiK0Hk=
X-Google-Smtp-Source: AGHT+IE3CwqgwPcD60DkN7R6068FIpprPZitsT+PIQCgtbOY0Zrq/F8xkAzZ5w5gvOhKLrjtzpX6hg==
X-Received: by 2002:a17:906:794e:b0:abb:d9c6:ecb2 with SMTP id a640c23a62f3a-abc09aa9b80mr441416066b.21.1740165593802;
        Fri, 21 Feb 2025 11:19:53 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9cee79fasm995276266b.129.2025.02.21.11.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:19:53 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] bus: add driver for IMX AIPSTZ bridge
Date: Fri, 21 Feb 2025 14:19:07 -0500
Message-Id: <20250221191909.31874-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
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

Note that some instances of this IP may be tied to a power domain and may
lose their configuration when the domain is powered off. This is why the
configuration has to be restored when the domain is powered on.

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
index 000000000000..75696eac8ba2
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
+	void __iomem *base;
+	const struct imx_aipstz_config *default_cfg;
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
+	void __iomem *base;
+	const struct imx_aipstz_config *default_cfg;
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

