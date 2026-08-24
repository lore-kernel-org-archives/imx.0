Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E24400E0D
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 15:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787583917; cv=none; b=fqi/KepqOGGhBfLwE+KpuMxehB/v/oW6IoZDrWThk4kGXY4e0edXk2lQV5ikIMcPkM574OSuVmjAdZcmmDX45pSAFwWjyj6shOSdZ8RwVGve7i/AH4BwAdNuHamGRl9E6pQGP6AX2jqBHP0V0YIE3HU+M9sOYwct3IEQAgq7aWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787583917; c=relaxed/simple;
	bh=ju4qkcay9aFIOBXd9Zj+pGSoj+vltNoxQlWIHXsYtuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aSHNpuFU+qUP7cTFboLKYu3DbTFo7nkNINJIxHSRlYOjjN+WkZ7+bLJUEd0ZCX/l+wHLxfwuNuNuRKSdD2l1655QV6K27K+hBfbePHEmBkY+8j763VSnOZIdcDyLneeyCx/kzSurIiq8tKCDcdRS11cPYB2bWm/jY2wZ/kG1vfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5Wb8YZw; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5Wb8YZw"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so3113962a91.2
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 08:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787583914; x=1788188714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GcEy1N5KBTqN53ZVbLUCAVWGTJK3E+IlMVbr5qPIo6k=;
        b=i5Wb8YZwgqcPCOVMeTEVCSe4rDe6UtJHIk8l+f4udHPVH5eEGJcDGw6hyyquXd9K5d
         AZFm+MdAElXteBotzUJp6gxQh6ItfgAC8zzK1oN44XQWh83lps62YSL2YKu2x+PNwlft
         j047lneiKd0Gel/DmrIKd15t8tha+6h3DS8Or6I4WFMVjArEnk2QujC3l25oKnY/xbc/
         2DKgMnZ6qU2nem+WeofqHPMOdKGWDb05Fios9xDWob6b347pzOekS6SQAu7NBZFkFGco
         BJebbR2TrNkuPfxaygf3neb5gJ3wIeowaRYmxm5WrlM+e1bTE9Kn2+rRXDOegynvZpyc
         RtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787583914; x=1788188714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcEy1N5KBTqN53ZVbLUCAVWGTJK3E+IlMVbr5qPIo6k=;
        b=q5l48N7P3AE10qY/gPvwmlu04GM3t0AvQhqnEAm7i3KvOVADSjNcUOZ9WVx8LutxwE
         YPg1Dp9OBZIllMvp8d9PpQpy44IlPVEU6i4Zb07kGbneQL4Xqa54YCfQCPkzN9wujb3E
         Kr0/UtWkHo+cehNWbDl42RhltihbnlFTzf9XFL0YoNmJI2Iph71G24R6IWkaDvOCAQhD
         mNEB0HYrrK3x7uBLKQeuR2gfPDYhqjRjEVR0h95XZDqgjMFGu+dMrbBLb+L/JIbhMTHG
         UHYjlJbT2435T1n5sh562zAgxcylIGfJLOW4jHgM1lU6u2traS69Qzw25V73hVqgkclU
         vvhg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7YV0qiKxWEGTh34ntx5rBwRg4Pu5NnmCAjj7kLByQd7MH6GqUTUkiytB1eEXp21GsFb8=@lists.linux.dev
X-Gm-Message-State: AFuF++lp0SuVq8nKQfNWm+Qoz6hKs8qjznX3lletrkV5iPiYS0BxuuxL
	bPYWt5Q1wM+/v0fdY0U7cbt3L93VkafzowC2wK78f4vxiUYy9XewufQW
X-Gm-Gg: AR+sD10k+u/q57n2mOk48ExnQ0yLxa/YQyiuZWpeleJLrJ0EMhUcQHZw1d3r8mqAqeX
	Lcn3aZA0AJ9YFP+tqKcs6TWQXuey5Xwgw86r5dXzJakyoeiB9XzG3pbAWqrbppzqmpbaAAhaGZm
	PMdzxjd4ly0KprSp0J5l4BNDSaxv+vgwf8C/Y0pyub7KOF8vTurstdDFN5H1lrWFf7M+cUqMLmg
	Cj4wc4+AS0dy7ctOmnCZUltbiyeR+h9+VaeFO1y95qFb400JnVXROkk7BOkM7GGGi2RRaVxh6gu
	3XM1AbuPBKt/EIC7+iIEEE7UdMqnfbx7SYIdjZq/8tpVpza33yCzGw1Q4B91ESG7IAGLU7d5T7Z
	DmPYXf5pDwlc8P5fSL4mBHOLePiWTdZPf8YGawNSklHxj4+z0LLwcbZl188aLKUZl3jGAQGm/Lb
	xKY3Wrrp+OVI+6bWinxfaE/YpX4Ru91TlTcJe6QtuA1RuPWnb8DLhRhpPHgQmN3KT9IpJO+fN/h
	6lJfhBC+1wRsoJVe69nHIycO+fjyBBF9zkyJQAALaCPVRi0wNDLvt+nr8QgVSs=
X-Received: by 2002:a17:90b:33c2:b0:38e:c232:9d3f with SMTP id 98e67ed59e1d1-395c3597c56mr45416894a91.5.1787583914094;
        Mon, 24 Aug 2026 08:05:14 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4af75acsm10232694a91.12.2026.08.24.08.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:05:13 -0700 (PDT)
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
	Zhijian Han <hanzhijian1991@gmail.com>,
	sashiko-bot@kernel.org
Subject: [PATCH v4] PCI: imx6: fix resource leaks in probe error paths
Date: Mon, 24 Aug 2026 23:04:54 +0800
Message-ID: <20260824150454.3511203-1-hanzhijian1991@gmail.com>
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
acquisition and call it from the probe error paths.  Add
DL_FLAG_AUTOREMOVE_CONSUMER to the device links so the driver core
removes them automatically when probe fails, instead of tracking and
deleting them manually.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260822013640.182C01F000E9@smtp.kernel.org/
Fixes: 2c5768344f88 ("PCI: imx6: Move pci_pwrctrl_create_devices() to imx_pcie_probe()")
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
Changes in v4:
- Use DL_FLAG_AUTOREMOVE_CONSUMER so the driver core removes the device
  links automatically, instead of tracking and deleting them manually
- Add a Fixes tag

 drivers/pci/controller/dwc/pci-imx6.c | 37 +++++++++++++++++++++------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b..0b4209365 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -639,6 +639,18 @@ static int imx6q_pcie_abort_handler(unsigned long addr,
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
 static int imx_pcie_attach_pd(struct device *dev)
 {
 	struct imx_pcie *imx_pcie = dev_get_drvdata(dev);
@@ -655,24 +667,30 @@ static int imx_pcie_attach_pd(struct device *dev)
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
 
@@ -1956,8 +1974,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = pci_pwrctrl_create_devices(dev);
-	if (ret)
+	if (ret) {
+		imx_pcie_detach_pd(imx_pcie);
 		return dev_err_probe(dev, ret, "failed to create pwrctrl devices\n");
+	}
 
 	pci->use_parent_dt_ranges = true;
 	if (imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE) {
@@ -1975,7 +1995,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 			pm_runtime_no_callbacks(dev);
 			ret = devm_pm_runtime_set_active_enabled(dev);
 			if (ret < 0)
-				return ret;
+				goto err_pwrctrl_destroy;
 		}
 
 		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
@@ -2001,6 +2021,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 err_pwrctrl_destroy:
 	if (ret != -EPROBE_DEFER)
 		pci_pwrctrl_destroy_devices(dev);
+	imx_pcie_detach_pd(imx_pcie);
 	return ret;
 }
 
-- 
2.43.0

