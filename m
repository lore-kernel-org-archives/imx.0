Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F3C2701CB
	for <imx@lists.linux.dev>; Mon, 12 Jan 2026 19:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768245465; cv=none; b=Eae7KoYmEuP5PCw+LiO+VxsoSu9lN4TFtEMeZMVAzqLoHP7wssFj3d1RI/JPvhxnRG8u7mLFWFUhZQzFxmREY0bOrROggOK8HcGpDS4Hvcc7m0rN/nDET7NybcBjIvJVV24qBSl/4kiuAQbRM/l1e821uTZIIM3nUse3ej0T5k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768245465; c=relaxed/simple;
	bh=1Pxj4oCluiKLepBu8sfazi6rV6kMCAcMHnjVLHROAlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=D8IpDbCQbU/qiXx4QbrhTTCSZJ4qZmY2W6P9aO6ew5iANJnVuXMjbs82UO2gNLNFxGK8TR/wAjTnSjzQMj3GdYT/ItNJUSp69YzMCoadS2NM2CEiDK/EKo96d9p4qC4jubC3nxRI/y+sAaKvGjjtPJQQ0QgQf0dReHZTH3U7yeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1vfNPd-0003nP-0Y; Mon, 12 Jan 2026 20:17:13 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 12 Jan 2026 20:17:11 +0100
Subject: [PATCH] PCI: layerscape: Allow to compile as module
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-v6-19-topic-layerscape-pcie-v1-1-1cd863fce50e@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIALZIZWkC/x3MQQqAIBAAwK/EnltwrQT7SnQw22ohSjSiiP6ed
 JzLPJA4Cidoiwcin5Jk3zKoLMAvbpsZZcwGrbRRRBpPg2Tx2IN4XN3NMXkXGIMXRjuSGkxTa6o
 s5CFEnuT6965/3w/uII1AbQAAAA==
X-Change-ID: 20260112-v6-19-topic-layerscape-pcie-9d10b6542139
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
 Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, Sascha Hauer <s.hauer@pengutronix.de>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

From: Sascha Hauer <s.hauer@pengutronix.de>

The layerscape pcie host controller could also be compiled as module.
Add the necessary infrastructure to allow building as module instead of
only as builtin driver.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/pci/controller/dwc/Kconfig          |  2 +-
 drivers/pci/controller/dwc/pci-layerscape.c | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index 519b59422b479..abfa4a6e62c25 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -121,7 +121,7 @@ config PCI_IMX6_EP
 	  DesignWare core functions to implement the driver.
 
 config PCI_LAYERSCAPE
-	bool "Freescale Layerscape PCIe controller (host mode)"
+	tristate "Freescale Layerscape PCIe controller (host mode)"
 	depends on OF && (ARM || ARCH_LAYERSCAPE || COMPILE_TEST)
 	depends on PCI_MSI
 	select PCIE_DW_HOST
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index a44b5c256d6e2..14d6ac4fc53fd 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -13,6 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
+#include <linux/module.h>
 #include <linux/of_pci.h>
 #include <linux/of_platform.h>
 #include <linux/of_address.h>
@@ -403,8 +404,16 @@ static const struct dev_pm_ops ls_pcie_pm_ops = {
 	NOIRQ_SYSTEM_SLEEP_PM_OPS(ls_pcie_suspend_noirq, ls_pcie_resume_noirq)
 };
 
+static void ls_pcie_remove(struct platform_device *pdev)
+{
+	struct ls_pcie *pcie = platform_get_drvdata(pdev);
+
+	dw_pcie_host_deinit(&pcie->pci->pp);
+}
+
 static struct platform_driver ls_pcie_driver = {
 	.probe = ls_pcie_probe,
+	.remove = ls_pcie_remove,
 	.driver = {
 		.name = "layerscape-pcie",
 		.of_match_table = ls_pcie_of_match,
@@ -412,4 +421,9 @@ static struct platform_driver ls_pcie_driver = {
 		.pm = &ls_pcie_pm_ops,
 	},
 };
-builtin_platform_driver(ls_pcie_driver);
+module_platform_driver(ls_pcie_driver);
+
+MODULE_AUTHOR("Minghuan Lian <Minghuan.Lian@freescale.com>");
+MODULE_DESCRIPTION("Layerscape PCIe host controller driver");
+MODULE_LICENSE("GPL");
+MODULE_DEVICE_TABLE(of, ls_pcie_of_match);

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260112-v6-19-topic-layerscape-pcie-9d10b6542139

Best regards,
-- 
Steffen Trumtrar <s.trumtrar@pengutronix.de>

