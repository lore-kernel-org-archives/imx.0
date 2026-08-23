Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632924AEEF
	for <imx@lists.linux.dev>; Sun, 23 Aug 2026 07:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787469110; cv=none; b=Q/3nswu/CR61cRUlxUIQzSIlZodgVkTgZd/RbKbfJIlLBJTHd3rgsXZPFjZWW/Hrjiqrd5pyRjmSXgI9myBJRdJTuNDCsFaOBKNFnTsFqNEwa9MX5XJubRF7GOOidC9I8AMRDuvq+tYvFmJD7UZQ4l2kbXyL2xrlXChSNZy0jpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787469110; c=relaxed/simple;
	bh=5E1s7lUtKaiuCp8Wtr0jt8WzTyQeUUM0dkL2I3Jsxhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PF+e4ky+mfioO4nRlPwK/YtkliwrOODS1HMfQeParonsPpT6vBeb3JVj0/v/Ev+wXn6pg0hU3Hzu/hxCFh28ATvXWKA758DE8/tfdaeffy60pVxdG3t2DciCYlvaI7Wb+MfCziOYbDh9m7zkVKRnsAIAZX8hWC/5QtDx+BPRhUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COFjKzsE; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COFjKzsE"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1469c1b83so3174986a12.1
        for <imx@lists.linux.dev>; Sun, 23 Aug 2026 00:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787469109; x=1788073909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpvEmSfetcKu58vemKhIVNLIz2Kr8KQYzNtwaCQIwdM=;
        b=COFjKzsEKUstioRGCoZoWAQ9vurw87fCG7JHAW6f+rjOf15ddJxIDGIP9lyTeyb/B7
         QMekDimzyb89NkW3g201lwcTL0N6zC/foAo5bHWSejzyxxnNIS0XH31xHXWg4SscRxHp
         0KBmSRTcsLg/zslXMwCbdSXRyz4BUzUJAkP2366DJ/QIQEE18uouriKHfRLsPEzbEXyM
         jUEZ9baIpGR4mIFm+d5fxppu8Zz/TbUOKZ5EA7cB7IKR2np+AtREOPIWmBS6bvbc4Rzg
         8fYb/nMtO+/Hf8F9Ll226CcGi0f6B6zPGBXxiu04ldZHcyiXNbtWY9YjMjVSEqKsoRcW
         RfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787469109; x=1788073909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpvEmSfetcKu58vemKhIVNLIz2Kr8KQYzNtwaCQIwdM=;
        b=k/sg4U1E/ntG+k9vcsrZ2PHj5NUxxQon9dcA96vrjKEhR+DoTCcmCcasZNC03sMhwR
         nagtknI94GzFboUxaXnq/ZcXgjaByzG96Cqr4M3Jlb5PGyAeV3Py45BerbJ/qEMx4cp+
         xsrAMRDRdLomolD6r1nDLWLYENBn6NuweOV3jrFjwxoXhwT1CALosNilS+Y09wrsaphT
         C9ywSKTNBC1NiY8mE75/qWp21RMcD/geyPlb4JTFppOq6TgQGJpcMgjxfND9MpFElDyk
         hIoO5JUDVd3jNmV7AtQbtl/k8z57WHMlPjuRVf03/juJV/FQVVu39R8NFMVYPmejP8Ee
         xkyA==
X-Forwarded-Encrypted: i=1; AHgh+RoBeEi/tcNxHspmOjMqpOmwfiXmZbk1inMyStPeBbr/UAAqQffaK25vEGRiyT3WnILkdEs=@lists.linux.dev
X-Gm-Message-State: AFuF++l579ixiIjpPlih899ypdCClDFhQQKH1T3O92AMgbT/6NuUMtSL
	wmUBJEmeJ3pc8yU/7y78Q383JZlHdcnwG/kYC/N7Pb2kg5Eea/uGqQtQ
X-Gm-Gg: AR+sD10KohLvmBlTxuv1xn4uKdgYzl+1a9jvn3beP3PSmnB5pPqRrC9dmPGvvt80Xyw
	/vu6xuYet0Nnr8B9wHc/FvHMs5/IeGV1AvDguDnhxi0z0Neaot+BJW0X0qKOnn3fGc3dRHX0nF/
	V8DTRGHB0kfbF1wcZGkhso7QfQhjF7CZMiCVkV2B21SANoVsMTH2x52VNhCA0F52/1EVTkdy7nb
	dXdfaBJq6g9NGHJq1ntCGphHzq5T7caZ2gYVhnRB0VoOs5WCBhRFKAq9zY52/S8wcGZxALxbmvo
	6R15biYe4job7RR44KQlyTZcUGvLYC1uNN9hqnBWQ/e1ibVF9W/wX2NUsvf9j7vUNenr2mPtZ9g
	fyhxtB8kSiayA6HvVVuTbNvtcDsbED882fzgde209vLde3Vh/upJU0KjW/3CTbZO9W/cw5hIr7w
	Lkh2R/VsVt37BRhCMQYPX1w9P4m4SxzK0RFLBPrF+oNxyRGQEb4v6C9H88DtGsSKkkLBfnmYn5i
	55Vx9aTzsLH4KA9Xfljry7nhkSjAmxj1+guLxbDNpDSWJvcpP6N
X-Received: by 2002:a05:6a00:a8c:b0:84e:d5e6:a085 with SMTP id d2e1a72fcca58-851f969b7a9mr28112156b3a.0.1787469108569;
        Sun, 23 Aug 2026 00:11:48 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f149e77sm1034990b3a.42.2026.08.23.00.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 00:11:48 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
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
Subject: [PATCH v2] PCI: imx6: fix resource leaks in probe error paths
Date: Sun, 23 Aug 2026 15:11:28 +0800
Message-ID: <20260823071129.2980059-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823011125.2876504-1-hanzhijian1991@gmail.com>
References: <20260823011125.2876504-1-hanzhijian1991@gmail.com>
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
index 39790e66b..a2bae4a2c 100644
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
@@ -1999,6 +2032,7 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 err_pwrctrl_destroy:
+	imx_pcie_detach_pd(imx_pcie);
 	if (ret != -EPROBE_DEFER)
 		pci_pwrctrl_destroy_devices(dev);
 	return ret;
-- 
2.43.0

