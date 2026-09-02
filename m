Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC6A4A92C0
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367418; cv=none; b=HGQJmAo/I6VW6WmYIxK2TbSkk2ITS+yi5gRJB0UFXA3mujVLGuKOgo5r/CpXgQ50pOAi8LsiJhVqPV4jPEjP64KcgbLAXF3SNYBToMMYolGSqPD+0IFXKXzYeNxBr0kyNoIzjobziLjah8g8P3o8OS6clRjRN1aDPnKN+BDRfgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367418; c=relaxed/simple;
	bh=xN1cyu916wIN7mzmzjFJvH00DRPPzz4qZRFZ2XCRN8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QTv9slkIat5FcoKFdFqGSQb7+OM+5qRlv2H0q1QQLqHnrhKCERq6y2HnQBu80oHmWiDmdCsqw+D5/VxNFUX2bzJY39IUBCHq/VdoyimfP1AHyq7+wQPgY6Gc4K6nBvqzVM+vJDZ2PBueNcWa+fSTzd8FRAsfYeOh1dPIJdAGJuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r3EvYLcw; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r3EvYLcw"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso52549b3a.1
        for <imx@lists.linux.dev>; Wed, 02 Sep 2026 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788367414; x=1788972214; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7VyQUQWJnOntAVMrtqSWEPb9QZWEDyQ9M01GPlIB7rE=;
        b=r3EvYLcwIAfIszRhT6DdSXDVlQdO/hP/TQoJKobKy2My5YaY2e7O2DGBDAMLlfuRaV
         2J/5JKBq2tfP0Y7ARbfOiN6R6t3rwDx2Bkvn84eJLkwdY8slP667K9U4aKmZUs6iyzmS
         fz/O7+QNmqZiXqR1Syp52d84YWP9mkRm/0X7+KUeLG9sayfaJCebgSMXH3gmBpXlbkTh
         yueXMw8yEy85aLm6HGWlDcKXZ8Hvv8BKGAKM2RAaXSEsRbjKjRBGslrO/3cdSFrPH9gN
         H5gcRjohJRZSHGateiQLqdeBFppqokxM0Qrf1z3mk/EdyQ2RNG7nN5rht3VghyADei3S
         FDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367414; x=1788972214;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VyQUQWJnOntAVMrtqSWEPb9QZWEDyQ9M01GPlIB7rE=;
        b=UxfKoI76yhMn2adIyQ2VJNImQWUL1Y2aenNqVDJeZsgIMLg4HHisH6Hf6BLEUKR58j
         TF3c/vgQGA+tM8dpPUSEuD0StedAcpxRUi1RMXHUKcNAo1tAjhBc9deich/V8P5ppL6v
         x6eo4E+NpZQaV3Qc5gns9cSu+MQyKGpT/O/brAZvBsI8TCmetYL0dP1o7JukP2UnAIz+
         nMyWFQpAayoIAtpA+XxdrD/6xdu5oEn1GHGYJXG+GNVfbZYv+17bBuHHK/rxf72cK9eL
         GeisBnYhSht8/2HTEXr28mpo+UbiX52K/zc1tM0RBj0+iwpUn5HAncyrWLBCcbbLNik9
         VZSQ==
X-Forwarded-Encrypted: i=1; AKwUvByT6uobRLeQPCUX7DZL1oXvUDhoVAbYHBSjSryWDxiE7jtKzy93rI3Wonzf4B0/au/7xTs=@lists.linux.dev
X-Gm-Message-State: AFuF++lL3xiKFEf/rfa+mb7dGNLMpTAV5cBD/n5+pEwb4ZmYZKvlxLns
	2OJYb5ufGga7ZlIah0W3knLgK8TWQHfN5x5JqZoBxc+gkSs1g+T4ZtrS
X-Gm-Gg: AYBFou3g++iDFeK2Ny/guYBkFBz7YNSCx5fb2K8CZ+Ti1UUv/UDDRq8tcS6hEfoK2Th
	4QEsAfFowOad8Yj0h7ba2ZPPDrp2l2kzgFHaur2yf8NlL4sFTrNJLwNjCt9gMnb4EB+/3UKImQM
	xMNzNt/vbnhnF5OEFZ1dYX2AP06+q1VEMsuJoJX22igOKxVwmZZshU9WS4bdIFkfANbJ1XqItca
	KU+ycyimsn85mmGqWK6u9Ql5uPDIgVVLom2WQCrooFbxV3/fUFtYaV0SDxMpyvMPOvVYa53FV72
	W46nTYoBW9oZ9444mV2ku8WeFmB8n9SEg9r1l3d07dK4guc3VJfbxFcLkjfDXb24nR44BJtwa01
	M0DbBaib7yn3CxO67cJ661nGKmHTxSrBSxwOHVG7vLnIjBTYWqEcn0ajjFf1NoK30sENrRmrZp+
	F7a3W/RRYW334qP+pXtwcpFZqszZ6xTkc9Uz1kI6LuxpC0kAtjhhnSZX7zeNN1JfRjmI4Xx2xOL
	+VP+54pYamm/cjGnXk4UmdZzD0ptjgu1JbDKaYw3rrb2CsuNX6P
X-Received: by 2002:a05:6a00:3001:b0:845:cad1:d691 with SMTP id d2e1a72fcca58-85ffc18a90amr422148b3a.5.1788367412611;
        Wed, 02 Sep 2026 09:43:32 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f4140sm1691158b3a.1.2026.09.02.09.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:43:32 -0700 (PDT)
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
Subject: [PATCH v5] PCI: imx6: fix resource leaks in probe error paths
Date: Thu,  3 Sep 2026 00:43:13 +0800
Message-ID: <20260902164313.2901302-1-hanzhijian1991@gmail.com>
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
  and adds device links to them, but nothing detaches the domains on
  probe failure or deferral, so they leak.

- A failure of devm_pm_runtime_set_active_enabled() returns directly
  without destroying the pwrctrl devices.

- A partial failure inside imx_pcie_attach_pd() leaks the power domains
  that were already attached.

Add imx_pcie_detach_pd() to detach the power domains in reverse order of
acquisition and register it with devm_add_action_or_reset() so the power
domains are released automatically on probe failure.  Add
DL_FLAG_AUTOREMOVE_CONSUMER to the device links so the driver core
removes them automatically when probe fails, instead of tracking and
deleting them manually.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260822013640.182C01F000E9@smtp.kernel.org/
Fixes: 2c5768344f88 ("PCI: imx6: Move pci_pwrctrl_create_devices() to imx_pcie_probe()")
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
Changes in v5:
- Register imx_pcie_detach_pd() with devm_add_action_or_reset() instead
  of calling it manually on the error paths

Changes in v4:
- Use DL_FLAG_AUTOREMOVE_CONSUMER so the driver core removes the device
  links automatically, instead of tracking and deleting them manually
- Add a Fixes tag

 drivers/pci/controller/dwc/pci-imx6.c | 41 ++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b98d..ec8339e03d58 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -639,6 +639,23 @@ static int imx6q_pcie_abort_handler(unsigned long addr,
 }
 #endif
 
+static void imx_pcie_detach_pd(struct imx_pcie *imx_pcie)
+{
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
@@ -655,24 +672,30 @@ static int imx_pcie_attach_pd(struct device *dev)
 	if (!imx_pcie->pd_pcie)
 		return 0;
 	link = device_link_add(dev, imx_pcie->pd_pcie,
-			DL_FLAG_STATELESS |
 			DL_FLAG_PM_RUNTIME |
-			DL_FLAG_RPM_ACTIVE);
+			DL_FLAG_RPM_ACTIVE |
+			DL_FLAG_AUTOREMOVE_CONSUMER);
 	if (!link) {
 		dev_err(dev, "Failed to add device_link to pcie pd\n");
+		imx_pcie_detach_pd(imx_pcie);
 		return -EINVAL;
 	}
 
 	imx_pcie->pd_pcie_phy = dev_pm_domain_attach_by_name(dev, "pcie_phy");
-	if (IS_ERR(imx_pcie->pd_pcie_phy))
-		return PTR_ERR(imx_pcie->pd_pcie_phy);
+	if (IS_ERR(imx_pcie->pd_pcie_phy)) {
+		int ret = PTR_ERR(imx_pcie->pd_pcie_phy);
+
+		imx_pcie_detach_pd(imx_pcie);
+		return ret;
+	}
 
 	link = device_link_add(dev, imx_pcie->pd_pcie_phy,
-			DL_FLAG_STATELESS |
 			DL_FLAG_PM_RUNTIME |
-			DL_FLAG_RPM_ACTIVE);
+			DL_FLAG_RPM_ACTIVE |
+			DL_FLAG_AUTOREMOVE_CONSUMER);
 	if (!link) {
 		dev_err(dev, "Failed to add device_link to pcie_phy pd\n");
+		imx_pcie_detach_pd(imx_pcie);
 		return -EINVAL;
 	}
 
@@ -1955,6 +1978,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, imx_pcie_detach_pd_action, imx_pcie);
+	if (ret)
+		return ret;
+
 	ret = pci_pwrctrl_create_devices(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to create pwrctrl devices\n");
@@ -1975,7 +2002,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 			pm_runtime_no_callbacks(dev);
 			ret = devm_pm_runtime_set_active_enabled(dev);
 			if (ret < 0)
-				return ret;
+				goto err_pwrctrl_destroy;
 		}
 
 		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
