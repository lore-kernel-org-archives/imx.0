Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1EB3905E6
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 16:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451445; cv=none; b=GqAWX0d2mcZc+dOXOdx6lFMMikFCVVH6v7yGCYLX2SlFEO/wgxxHO0Zb1nsJV+MZQ3A5YzJLqxOvRXTMkambCIlZ6QebDryOcCzUORyP39JtvWyyInjn3WPmRKLcw6MWlXNIcFvMixAd5wS7+bSZPgTm7D1LeFBXER7pzNTVMVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451445; c=relaxed/simple;
	bh=KvPeqZ5tXKYRlwDjNuXGtSeUVdNUoSnJ/Q/wobW583g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UTyKTYvVsvgs+YFQlY7vkwvzAfLEjeMbZcKeVu4018cppCcG3bRTbSSCL9KzKsGBWX35yzpKwlp78ukkg+m+98gi4gONH5PCarI+36cPS2LHaMKGoguxLq6eq/Ni217/AfQ3mhtIidkQj4p/3F/+GJy+b8KmocHArlA3eBUQpsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwIp1dcS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwIp1dcS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso28726165ad.2
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 09:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788451443; x=1789056243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=297pUGyvgajMiDzKmtW40WgWCQM+NoQo+Lf6H7vbyHA=;
        b=gwIp1dcSJbQgj3szB/e2k2OS4YKCJY4KkZrk15e4JDxJWutIOtRehFIVwuqFg4iSlW
         KIcGJ/ML18ZJWgdFu2wIQVxeNW8O2t0YqWd6/vhWWSlZJrmTk/MBsZVeL/xWI49r2bzw
         Xqq3FInZI0mB507ndGr6kdjGHHoLJwmz9WDWSTo5UnV67be1z9WP958BIRcAi4fmvgdb
         PC3IlJlvS4wxI42Xlf/syYZJ8MPNtEGuMDZQkXYuRMk7wDTDWI792fVS/MwF3QDLfmb2
         /cfs5m/Y+RQUDKL8c+EG79awU9ZEFHe3dodn+Yut7k7TRGPNvTccZQT1GSGrENweR8Lj
         JPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451443; x=1789056243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=297pUGyvgajMiDzKmtW40WgWCQM+NoQo+Lf6H7vbyHA=;
        b=grDl+J14UJn0Jetcbk+g3CWk2M5+1rm0lCI17Ov17dQNHrrg0cI9nZzoM5jqlk51lm
         5t8ia1SL6s/zwm4jL7vcH1y8woTECjFa5LVcuSTor7Z9dGl8wdk3XPXA5dN77JoZTFT3
         ZChkU6N07Fz+kOyA6xHg4bJl7vXrR9hwcqurRv9/DzZPrCkrHvv7Zyh1j8xvj9HichBK
         j29byuSOcZCLMkocGEbGMtuRqQ69XPzNvJ/K5A3E0cf2x4+PJAaPTLqRuu+16aiu9WCc
         XK9HIkIlVgZcA9tGwzcCt7bfmCd5KDduT4qWFAApkeQZcWgr7fBaJSyfHiCqAtHOYVQd
         oWpA==
X-Forwarded-Encrypted: i=1; AKwUvBw6a6Bei3WIt+cz5MInD0CpLhOJ36+/AzDvbC++qGGXkQOTPE5TE8D+2yoHXPRKgLNOr20=@lists.linux.dev
X-Gm-Message-State: AFuF++kyUUzExlaTSkCHmRJj8yzYp983Qn3a6pmcaA0AVEcDRKLTyrpe
	lvlBEn7ZM+BEmLvysrRDRHJhyxYXgI1J41CtCY+h9I4ozO9cEHF2Ihb7
X-Gm-Gg: AYBFou39zzRXLinQp/jfGfbHnb1N4d+9WZalyXNEiFgrp8EgPeQBOwLXxm1h4vAXTAY
	h4U0QxynO0Kp2i//MxWaZ9XO5KD+jpyQGOdyTRl87JZeRLHoRT6EoFyngjWYDS+qtufYAMVAjym
	erkYFbgaxK3zDOu6Jq87PdEkNXWPUEblzVmXMetQeggzHPnwpq7eGv4iIeI7cnb1yVy6bkZ6NQM
	+Uyj1buBSN9AjtjZApZzD1vtUKEWCvkrQ+2nJ3CmCVaj7LOu8md6HHWnjIUQDZ7+VQl0rIjOw01
	LEMtLAhzEWFqrXGFhfkNFebBKWWW+g9v/vIRUl5vqda64psmCBJPyUHYAH3b5mmqwPlExjLQdX+
	r60mu5vJFBFz0/8eAADXXWRj5yOgIJnCnUDGrWt37PvVYjlTfif0YExnKgGHg2AQbJ2dJ8Eanwf
	1yXNQSZhuItB6a0HsGquHd0xqSfETAhKWPYE4Ww+MIJbV9d2i6iLwZuWT73kzFzbv3QqQ5A4fsG
	EhLZNXlcPMMvyFw/8aD9ISreveVWj4Nv57YWrcnHEMMgwcF3AnW
X-Received: by 2002:a17:903:22d0:b0:2d8:d4ce:7e40 with SMTP id d9443c01a7336-2db12674f20mr124645ad.21.1788451442696;
        Thu, 03 Sep 2026 09:04:02 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafe62dbc7sm12815615ad.28.2026.09.03.09.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:04:02 -0700 (PDT)
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
Subject: [PATCH v6] PCI: imx6: fix resource leaks in probe error paths
Date: Fri,  4 Sep 2026 00:03:42 +0800
Message-ID: <20260903160342.3282199-1-hanzhijian1991@gmail.com>
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
Changes in v6:
- Keep the device links stateless and remove them with device_link_del()
  in imx_pcie_detach_pd() instead of using DL_FLAG_AUTOREMOVE_CONSUMER,
  which creates managed links to power-domain devices that never bind a
  driver and would trigger a WARN_ON in device_links_driver_bound()

Changes in v5:
- Register imx_pcie_detach_pd() with devm_add_action_or_reset() instead
  of calling it manually on the error paths

 drivers/pci/controller/dwc/pci-imx6.c | 58 ++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b98d..7dd22b4f826a 100644
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
@@ -654,25 +682,31 @@ static int imx_pcie_attach_pd(struct device *dev)
 	/* Do nothing when power domain missing */
 	if (!imx_pcie->pd_pcie)
 		return 0;
-	link = device_link_add(dev, imx_pcie->pd_pcie,
-			DL_FLAG_STATELESS |
+	imx_pcie->pd_link = device_link_add(dev, imx_pcie->pd_pcie,
+					    DL_FLAG_STATELESS |
 			DL_FLAG_PM_RUNTIME |
 			DL_FLAG_RPM_ACTIVE);
-	if (!link) {
+	if (!imx_pcie->pd_link) {
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
 
-	link = device_link_add(dev, imx_pcie->pd_pcie_phy,
-			DL_FLAG_STATELESS |
+	imx_pcie->pd_phy_link = device_link_add(dev, imx_pcie->pd_pcie_phy,
+						DL_FLAG_STATELESS |
 			DL_FLAG_PM_RUNTIME |
 			DL_FLAG_RPM_ACTIVE);
-	if (!link) {
+	if (!imx_pcie->pd_phy_link) {
 		dev_err(dev, "Failed to add device_link to pcie_phy pd\n");
+		imx_pcie_detach_pd(imx_pcie);
 		return -EINVAL;
 	}
 
@@ -1955,6 +1989,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = devm_add_action_or_reset(dev, imx_pcie_detach_pd_action, imx_pcie);
+	if (ret)
+		return ret;
+
 	ret = pci_pwrctrl_create_devices(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to create pwrctrl devices\n");
@@ -1975,7 +2013,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 			pm_runtime_no_callbacks(dev);
 			ret = devm_pm_runtime_set_active_enabled(dev);
 			if (ret < 0)
-				return ret;
+				goto err_pwrctrl_destroy;
 		}
 
 		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
