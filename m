Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C1D374A1B
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 07:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558135; cv=none; b=ap6p1DXWoLmkbZJSFXFSND+wii8B/OHGPF8dvouVrR7jxeWTjjGrbk0mwfjfbgchsLFDzlPDNQCcXDEpmOI3MmzKPmhDrT0CXUnj/2iG2OCU+tvrE77e706rYjgMQE1Ckc8V+mALFzNEAM1YtE7OmUwwwrpCdYgajoudbqS467c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558135; c=relaxed/simple;
	bh=82tOHDC7nJrDfycmSAVW9nOEAnMjFI64BjxgfbPacuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bGI5vmQghjw1y+RqMxP1t1Aror3fzFGy8v7EDMHvLU072Szc4vf2FUzOYNQK7wKTPYkjIKqX98mCmdCmMzpRDJr/uxX5QPQvK1FP8QvPiKfd2Zd9N2Ja9AQYdytKc/FjlBkfpSomvyxVR3V6RSV5kjugsJBlqzAzZGio1v4YRAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cA7MmOez; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cA7MmOez"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc891373e0so34661845ad.2
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 00:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787558131; x=1788162931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fD7HDEqAve3vYidUjX8s8f4KzZ+OcpC6vSRwhTvcNpE=;
        b=cA7MmOezhlIyqMcg3CyLJhGw+uWvR4xtzSUYbQDloGen+ZXJJykH/FahY5n8AfE6AI
         RY/g39CLRJo1igFoy2TiETcQIi7+TFZXMHo5Vu6U1PNo1jcfgWh4PztsVXZGtX0pjLJL
         t5SCJ8LszpqpbIDpsHoUyivMZ0q3mbIuC0f+RPPrI3xaHAsiKlcVJAB4HVVfc3cJq0GS
         +yaZKKRRYdpTo3JEHT87FeUhSljs2ccrGuEpmcSoOHHh4HxC54bRXsbbmmKVueLOhOi2
         Vm8uEI3xIk46YooxMOr9JxeE7PxOIMW00uDPO0WM9mgNwCGQxjQOGK0k+Erqp8AcHEOI
         gJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558131; x=1788162931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fD7HDEqAve3vYidUjX8s8f4KzZ+OcpC6vSRwhTvcNpE=;
        b=ZaqghqjTdi9whsJzqUfV9AD6xA1MSXx2QmWf1+IkdtDfTVhtVLYUippHFFtwGgPa4r
         spMfXxWcwW7JxmypMjMA5Vy+qQtAtxVwLti7iAuG2p9BT+RjYbqMalOt/3O1OSA5swDe
         p9SucAWAmLMKk9tSzpKap4JqCz/G9uLS0SvfViM89a85TvjqOkP4hMjWQM0BNpUA1qro
         VVZgVZNYNKG+8nSEMKnm4Fwt63HR0hOtXUUxxQ2DFGnL12l42sNMLqVksofMvvTItErE
         W/ZS9faFfwjeYKaOjpy3wbwTabhRwA5QPPJlXHD+V6vliMydyZa6qpC6Jchgd/DH0+xV
         Maaw==
X-Forwarded-Encrypted: i=1; AHgh+RriiI2m4gXWgvupYOhwj3+X1rk2G/ohR2Jit4/K7P5cTdi5f7ZGdAReU/uNm+V2RMey3h8=@lists.linux.dev
X-Gm-Message-State: AFuF++lH6WA0GdrLKSsYnlmiWQ5yBzYD+Kb2plNaL4BK2RhMrsRvdPvV
	KClabeuW+5XdqmNQb0YTMrWbl5e7JHX4coGsg+YsD9Wdx60QxbaXn4Y1
X-Gm-Gg: AR+sD11Zhwf6MasxBGhmEYQgECUDHJfpMgVRi0Xaqk+UUBjy4KAznVmKwzTz+eMmIYB
	wG5glZWj1Pzv7eWoY+WgKDqs4IRVBxdQu40vGa//TsjBs+3C10cFn0d9d5Lx5z9ZNbCtAiJ4fNY
	+MwkLil+QBsZb+3rT9gZ48oUfqs9LkAPc86ShYrphkYSEPJy6t8EWkG5XFq+ztaonFnG5rRmgS9
	GG4CJA2wM3MJzeLkrBL1hD+AhGQWyUq8n0Zl/BEggx/CZKYX5VThgMgqzKfuPX8+/e0dM6gzIn/
	XNCJnPFPa9xM1oZBrByFUsIU2eyOD11Ypzlo5Zo7Nmgq5VDazqJq1HxABYXyYX9gvXdaVmEpplL
	FiUEkiiNursQQ0HRE4siSKyYrpw2R+LYf66FJpok36PtQg58yM5UX2+VznskeRnBea6uUNICBse
	HSLqHb9BIV04dEyYKXN0hwbjdAwEvdadZPVPn5GLlZkKzdU3BURsDD1I18k1AajGegROMDTV+9n
	JiXpjWw7+AWw8+itZWBLD/Iz/0PYdDIGib1o6WDTMMT3YYAoRi6
X-Received: by 2002:a17:902:f70b:b0:2d6:3c2f:6a4 with SMTP id d9443c01a7336-2d670d07a21mr311514175ad.13.1787558131477;
        Mon, 24 Aug 2026 00:55:31 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d67679e55bsm14421565ad.30.2026.08.24.00.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:55:31 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Rob Herring <robh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>,
	sashiko-bot@kernel.org
Subject: [PATCH v3] PCI: imx6: fix resource leaks in probe error paths
Date: Mon, 24 Aug 2026 15:55:12 +0800
Message-ID: <20260824075512.3386898-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823071129.2980059-1-hanzhijian1991@gmail.com>
References: <20260823071129.2980059-1-hanzhijian1991@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_pcie_probe() leaks both pwrctrl devices and power domains on
failure:

- imx_pcie_attach_pd() attaches the "pcie" and "pcie_phy" power domains
  and creates device links to them, but the device links are only kept
  in a local variable and nothing detaches the domains on probe failure
  or deferral, so all of them leak.

- A failure of devm_pm_runtime_set_active_enabled() returns directly
  without destroying the pwrctrl devices.

- A partial failure inside imx_pcie_attach_pd() leaks the power domains
  and device links that were already attached.

Save the device links, add imx_pcie_detach_pd() to release the power
domains and device links in reverse order of acquisition, call it from
the probe error paths, and make imx_pcie_attach_pd() release everything
it has attached so far on failure.

Reported-by: sashiko-bot@kernel.org
Link: https://lore.kernel.org/all/20260822013640.182C01F000E9@smtp.kernel.org/
Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 42 ++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 39790e66b..467006d83 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -182,6 +182,9 @@ struct imx_pcie {
 	struct device		*pd_pcie;
 	/* power domain for pcie phy */
 	struct device		*pd_pcie_phy;
+	/* device links for the power domains */
+	struct device_link	*pd_link;
+	struct device_link	*pd_phy_link;
 	struct phy		*phy;
 	const struct imx_pcie_drvdata *drvdata;
 
@@ -639,6 +642,26 @@ static int imx6q_pcie_abort_handler(unsigned long addr,
 }
 #endif
 
+static void imx_pcie_detach_pd(struct imx_pcie *imx_pcie)
+{
+	if (imx_pcie->pd_phy_link) {
+		device_link_del(imx_pcie->pd_phy_link);
+		imx_pcie->pd_phy_link = NULL;
+	}
+	if (!IS_ERR_OR_NULL(imx_pcie->pd_pcie_phy)) {
+		dev_pm_domain_detach(imx_pcie->pd_pcie_phy, true);
+		imx_pcie->pd_pcie_phy = NULL;
+	}
+	if (imx_pcie->pd_link) {
+		device_link_del(imx_pcie->pd_link);
+		imx_pcie->pd_link = NULL;
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
@@ -660,12 +683,18 @@ static int imx_pcie_attach_pd(struct device *dev)
 			DL_FLAG_RPM_ACTIVE);
 	if (!link) {
 		dev_err(dev, "Failed to add device_link to pcie pd\n");
+		imx_pcie_detach_pd(imx_pcie);
 		return -EINVAL;
 	}
+	imx_pcie->pd_link = link;
 
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
 			DL_FLAG_STATELESS |
@@ -673,8 +702,10 @@ static int imx_pcie_attach_pd(struct device *dev)
 			DL_FLAG_RPM_ACTIVE);
 	if (!link) {
 		dev_err(dev, "Failed to add device_link to pcie_phy pd\n");
+		imx_pcie_detach_pd(imx_pcie);
 		return -EINVAL;
 	}
+	imx_pcie->pd_phy_link = link;
 
 	return 0;
 }
@@ -1956,8 +1987,10 @@ static int imx_pcie_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = pci_pwrctrl_create_devices(dev);
-	if (ret)
+	if (ret) {
+		imx_pcie_detach_pd(imx_pcie);
 		return dev_err_probe(dev, ret, "failed to create pwrctrl devices\n");
+	}
 
 	pci->use_parent_dt_ranges = true;
 	if (imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE) {
@@ -1975,7 +2008,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 			pm_runtime_no_callbacks(dev);
 			ret = devm_pm_runtime_set_active_enabled(dev);
 			if (ret < 0)
-				return ret;
+				goto err_pwrctrl_destroy;
 		}
 
 		if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_SKIP_L23_READY))
@@ -2001,6 +2034,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 err_pwrctrl_destroy:
 	if (ret != -EPROBE_DEFER)
 		pci_pwrctrl_destroy_devices(dev);
+	imx_pcie_detach_pd(imx_pcie);
 	return ret;
 }
 
-- 
2.43.0

