Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDE935203D
	for <imx@lists.linux.dev>; Fri,  4 Sep 2026 01:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788485013; cv=none; b=aI7IsIVMNrdz6IFG6a9n3ZpiBmta4rL4GK1WwaMAK14Dw0PThBzcF5vOwTNXyznlP8T08XAou09MIZDDAegS65PyJ8rroLyMAvWaI9wKGUC2vK4LGiKjcPZpj06Bh0rgpVSIK013neX5NpoxpKOsx3zEDhhk0McwljbUSU1WHGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788485013; c=relaxed/simple;
	bh=GrZTQHRL+xr7CiDtU2wF/9vzloMtIaBswpy7OyErfqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UkfmKp8YGFvw7REhpu+XbFIzwQEyud+Akidxz0bavrkBWma8rIx9O2c+bszG39Gj6X7WY563Yr2FAogXsZ+BHkOG2afz0unnA6bqtO7bl5IaH8atEms1MBSYYPsGP3AllVTY8iQNH/ekDPexFkFbyk9oSDEYWfnn7IaCChDjxOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oB+cHq8O; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oB+cHq8O"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so536972a12.3
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 18:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788485010; x=1789089810; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Agf6KzSE2M9rfW3DTQHxsj+kTxob2VTdMv9WkSeHlI0=;
        b=oB+cHq8OVdc2TLvHVwjJinCw34QBn/VFWxnsjtombfZhfdbsLJYzBPUpss/TiHILrw
         pXzmm+3ip4feZDGF3yqz2aKY0iLqEXqtr6ruRvmcPhPl3tceHy73JjIdLWeoVz4Wfn4s
         e/zSIb+1wR0uDM/oAVmS1mUG3vbazp7gPRxcw94AMuTSgWXNlFJrfB+ibwK8wclNwWyK
         P3LVOSu7CqTN1zkU2pOSjylD2MnB27KA60IZjfX4gsQ5pSvXF9M80jam4QhI98Y7hCXi
         4XgoMeeMsv2KUg96R8y+aulXEgnnY6Q7QAfKCrw7dy3IEGMhtmNj89v1bM8cAPeQb6r7
         mBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788485010; x=1789089810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Agf6KzSE2M9rfW3DTQHxsj+kTxob2VTdMv9WkSeHlI0=;
        b=dErkkLUiy54re9BM0oHpxvjXtdeTyxxeqMkiy66agWoiZU3viVcVmMnBgioufQjyYc
         XXxfzf2x3cn2aYJyM/tGdULkwFeBPKKkR6qOqWR6KxJrBvj42PfLe15eFkaIAx9AQMmm
         NPLZrny5Aq1/8k57H02HXapMCuJnJsoCsjS730WDi3cFG5o4GThiE3u2GHdwfmOyZcYn
         3OCXbsOhZdXvN4K9wXwCdPr3zSmA01RYoYiiVtwsTOx8X8UEBQ118J8uC9+1kjlsEpl7
         XJi+U6XE4NzqJKX+kKmj+cYyp3SQaYl+iinqkDAZItQLCLDD2s4rWj/9Pq33T8hsk9FY
         9e1A==
X-Forwarded-Encrypted: i=1; AKwUvByww5O2NK/BfyvtYi9UosxPexXPUfeFIYQvHbbs8o/GN11+wX6OrCg97+M/KTGvhVlGWZY=@lists.linux.dev
X-Gm-Message-State: AFuF++lXIJHHP1yEUu0AI49aXKVIAlxAQ2CTnpVq2O4h24GM9Meb10xS
	pXNloETqty7sNbDfFhIG4Pea1S2Ey9NbS/OPjMZ7IbRJa4a7uA6vTx5H
X-Gm-Gg: AYBFou2aWN5Z86V6VeoC9KsF4K3f7aksAyMZmKG0Be+8NyEyUaoqRuiPocgNvkDcpGe
	8KKCfSI51NSpSfxknwc7off9HC2WNCTrRaa/FjCxpoQR3I/7A+AhXC8pljN9R/sc/jdtFhdUC//
	nAxlhYYU2o0UCw68vEMcKLFeXh8kw+QTgsnUmcIe8vkcPvQKLxSKJhSb7e5uldQqRBzM+fjWXb4
	eO3OBkNorTop0RV9uKoGIOGhnnTKCxbcuUbYQKQ4G1enb+EQOkIQIyeXeUKIrsqcz5Nb+t1A/aR
	PzJkS4O0TWs8in34nIbCpJzAIDAE5szCBdsHFwVah81PvmEtvgHLYc0KEfZaddHyVRnf8tbm6Vb
	cmIYWSNBVmfRMl01RhukqkVgr9tdp50jMTIeNY6v8XSmmRZ151NLbSyNAhNqMl4GR3WgAqyqxlN
	mVNswOSS17cyvZlShVIs5AydJGe1psZLOgi8sb7ei9C+9Yj+lrPlhopeiKC8cbRjbqwXoTAxplo
	0Qbp6T130CosDA24mUrrASCpZCq45Zd13lAON/odbWA2rJKvH/Jqh7a/UBdiiy5wg==
X-Received: by 2002:a17:90b:1a8f:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39b2612ed35mr3678175a91.7.1788485009621;
        Thu, 03 Sep 2026 18:23:29 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26123c99sm1513842a91.11.2026.09.03.18.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 18:23:29 -0700 (PDT)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org,
	Zhijian Han <hanzhijian1991@gmail.com>
Subject: [PATCH v7] PCI: imx6: fix resource leaks in probe error paths
Date: Fri,  4 Sep 2026 09:23:07 +0800
Message-ID: <20260904012307.3434449-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_pcie_probe() leaks both pwrctrl devices and power domains on failure:

- imx_pcie_attach_pd() attaches the "pcie" and "pcie_phy" power domains
  and adds device links to them, but nothing detaches the domains or
  removes the links on probe failure or deferral, so they leak.

- A failure of devm_pm_runtime_set_active_enabled() returns directly
  without destroying the pwrctrl devices.

- A partial failure inside imx_pcie_attach_pd() leaks the power domains
  that were already attached.

Add imx_pcie_detach_pd() to remove the device links and detach the power
domains in reverse order of acquisition and register it with
devm_add_action_or_reset() so they are released automatically on probe
failure.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260822013640.182C01F000E9@smtp.kernel.org/
Fixes: 2c5768344f88 ("PCI: imx6: Move pci_pwrctrl_create_devices() to imx_pcie_probe()")
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
Changes in v7:
- Register the devm action before imx_pcie_attach_pd() and drop the
  imx_pcie_detach_pd() calls from its error paths, since the devm
  action already tears everything down on probe failure

Changes in v6:
- Keep the device links stateless and remove them with device_link_del()
  in imx_pcie_detach_pd() instead of using DL_FLAG_AUTOREMOVE_CONSUMER,
  which creates managed links to power-domain devices that never bind a
  driver and would trigger a WARN_ON in device_links_driver_bound()

Changes in v5:
- Register imx_pcie_detach_pd() with devm_add_action_or_reset() instead
  of calling it manually on the error paths

 drivers/pci/controller/dwc/pci-imx6.c | 56 +++++++++++++++++++++------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b98d..371b2a11d8f5 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -180,8 +180,12 @@ struct imx_pcie {
 	struct imx_lut_data	luts[IMX95_MAX_LUT];
 	/* power domain for pcie */
 	struct device		*pd_pcie;
+	/* device link for pcie power domain */
+	struct device_link	*pd_link;
 	/* power domain for pcie phy */
 	struct device		*pd_pcie_phy;
+	/* device link for pcie phy power domain */
+	struct device_link	*pd_phy_link;
 	struct phy		*phy;
 	const struct imx_pcie_drvdata *drvdata;
 
@@ -639,10 +643,34 @@ static int imx6q_pcie_abort_handler(unsigned long addr,
 }
 #endif
 
+static void imx_pcie_detach_pd(struct imx_pcie *imx_pcie)
+{
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_phy_link)) {
+		device_link_del(imx_pcie->pd_phy_link);
+		imx_pcie->pd_phy_link = NULL;
+	}
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_link)) {
+		device_link_del(imx_pcie->pd_link);
+		imx_pcie->pd_link = NULL;
+	}
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_pcie_phy)) {
+		dev_pm_domain_detach(imx_pcie->pd_pcie_phy, true);
+		imx_pcie->pd_pcie_phy = NULL;
+	}
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_pcie)) {
+		dev_pm_domain_detach(imx_pcie->pd_pcie, true);
+		imx_pcie->pd_pcie = NULL;
+	}
+}
+
+static void imx_pcie_detach_pd_action(void *data)
+{
+	imx_pcie_detach_pd(data);
+}
+
 static int imx_pcie_attach_pd(struct device *dev)
 {
 	struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
-	struct device_link *link;
 
 	/* Do nothing when in a single power domain */
 	if (dev->pm_domain)
@@ -654,11 +682,11 @@ static int imx_pcie_attach_pd(struct device *dev)
 	/* Do nothing when power domain missing */
 	if (!imx_pcie->pd_pcie)
 		return 0;
-	link = device_link_add(dev, imx_pcie->pd_pcie,
-			DL_FLAG_STATELESS |
-			DL_FLAG_PM_RUNTIME |
-			DL_FLAG_RPM_ACTIVE);
-	if (!link) {
+	imx_pcie->pd_link = device_link_add(dev, imx_pcie->pd_pcie,
+					    DL_FLAG_STATELESS |
+					    DL_FLAG_PM_RUNTIME |
+					    DL_FLAG_RPM_ACTIVE);
+	if (!imx_pcie->pd_link) {
 		dev_err(dev, "Failed to add device_link to pcie pd\n");
 		return -EINVAL;
 	}
@@ -667,11 +695,11 @@ static int imx_pcie_attach_pd(struct device *dev)
 	if (IS_ERR(imx_pcie->pd_pcie_phy))
 		return PTR_ERR(imx_pcie->pd_pcie_phy);
 
-	link = device_link_add(dev, imx_pcie->pd_pcie_phy,
-			DL_FLAG_STATELESS |
-			DL_FLAG_PM_RUNTIME |
-			DL_FLAG_RPM_ACTIVE);
-	if (!link) {
+	imx_pcie->pd_phy_link = device_link_add(dev, imx_pcie->pd_pcie_phy,
+						DL_FLAG_STATELESS |
+						DL_FLAG_PM_RUNTIME |
+						DL_FLAG_RPM_ACTIVE);
+	if (!imx_pcie->pd_phy_link) {
 		dev_err(dev, "Failed to add device_link to pcie_phy pd\n");
 		return -EINVAL;
 	}
@@ -1951,6 +1979,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, imx_pcie);
 
+	ret = devm_add_action_or_reset(dev, imx_pcie_detach_pd_action, imx_pcie);
+	if (ret)
+		return ret;
+
 	ret = imx_pcie_attach_pd(dev);
 	if (ret)
 		return ret;
@@ -1975,7 +2007,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 			pm_runtime_no_callbacks(dev);
 			ret = devm_pm_runtime_set_active_enabled(dev);
 			if (ret < 0)
-				return ret;
+				goto err_pwrctrl_destroy;
 		}
 
 		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
