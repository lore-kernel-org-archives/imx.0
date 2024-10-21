Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F3E1EF92B
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 12:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729514971; cv=none; b=HlUR29LaCNb6rkcwrRPqPi0UaPwsQejf/GwfrFE5vXYS1bcSVj+kWU7cWXx/f4JJngB3UFqCVRJ4UqKJue7rtn5jBJvAQXJ3kaTT0St6+rFI2rybe451owN6M9zHUO3VIJG0x41HXCbvOHcrwOJlAeN0yngpNWRjwC7Nvazx/HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729514971; c=relaxed/simple;
	bh=GH+Q9t87101VfCb8kbMrKjRlxSEEKEOk1jtATHA+GOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tfkv6TJtxrYwuTAqaSE47kd9pxkkROc/+bKX/N0IFUeyswvH9P4hjTWb3LJ8Qa8vD7aCW50c3gxdY0adTJ708vW2dbLI4xpJZ+/ytMTjvPNTsZ9jylLOaEWzwXpLP49Cl5kVSEPzzMe9AbCEnf8OfIkijJ7ozEjZbwqxXYUkRNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYIOCaJM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYIOCaJM"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43161c0068bso30422295e9.1
        for <imx@lists.linux.dev>; Mon, 21 Oct 2024 05:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729514967; x=1730119767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Q32sh+uJFSpt9TLvxk2ifmsRw8yfE9HNNl0na2PYAU=;
        b=NYIOCaJM1dccTT32egetTcMyoIiHI11d6F88pW9xUY36QjT0oOAADImEEDiwiiyNwL
         dLF/onRZSogjaoBzAZmp2U3XY2jmlbPZRsTjeFgqPe20jlgLjL+/SuW9JLLai4JtgoSU
         sTNkwXlncDQqBBKhP6liSx7Qt2rgr/HJPNfSYHj3lJOlBf1EywcAl8d2PFqKDfhDfwqG
         AgfkNrUboDUFavqKcSOmvFqMT9f3u2Oud4kpHxNZU9JH0j+5YPo1lDlHZjgogrBzI60y
         yhVGH295f37A56UkXaIWdl385q7gf8BsNbba3DnyTEXsAMv08QwTtkiGB95FnvDpR9+O
         kfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729514967; x=1730119767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Q32sh+uJFSpt9TLvxk2ifmsRw8yfE9HNNl0na2PYAU=;
        b=XleSwA+YKipCXRKtuclojWlyFTT7E71AsvMxzBuQXsmYOJFXcxJnuC2q/fzlkhbyvd
         kRCbYu4rqH9rVOcauR7PLB32/gnn07Z1fQBPslIuHhAuNN1DnPYjqeaI90C1Ue/Pmqcg
         CckpMKEDy7y2sVKEiS9UU1UpAINsc44NMzeIrurciKITowJoOPFlek+/JsQD9JtA2qY+
         S817IMazw821YmuPdIO1Iyh3ThMenGGvOKCKNWK0Bymvexgo4taQ1Yvh7VEdugHjG1RZ
         KQE5jXstN7x0P0I6fyNBrpQqBT+DgMWBuevjeYDkXQuOdd4m0zAJ7yU42aYDmM6sxRif
         kciw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ2Qo7E60RdNOnFwejVuTTXzCz6fjwJlSjLjwm3hqQi7AtyLlpF0aDsZqyR9o4n23abpM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1dj5JunnPGRvXtGf4dWMcjGk3LxdxrbQyHMdd/zP53mYjfP3y
	tGcA5vzseFP8pm/6U88XHYv9T4KGLxQRawMqOnhPvjUXqVtiZHeN
X-Google-Smtp-Source: AGHT+IF7y/aVuMR4dM/wOhaLHG4+/0yWCkNhdRhKrO6vRCRYPe8M7QABDKRdq1+Ho2EKQbs991Zaig==
X-Received: by 2002:a05:600c:4595:b0:431:3b53:105e with SMTP id 5b1f17b1804b1-4316163bccfmr99788485e9.9.1729514966811;
        Mon, 21 Oct 2024 05:49:26 -0700 (PDT)
Received: from eichest-laptop.. ([178.197.202.204])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c2df7sm56460595e9.33.2024.10.21.05.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:49:26 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	Frank.li@nxp.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v3] PCI: imx6: Add suspend/resume support for i.MX6QDL
Date: Mon, 21 Oct 2024 14:49:13 +0200
Message-ID: <20241021124922.5361-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

The suspend/resume support is broken on the i.MX6QDL platform. This
patch resets the link upon resuming to recover functionality. It shares
most of the sequences with other i.MX devices but does not touch the
critical registers, which might break PCIe. This patch addresses the
same issue as the following downstream commit:
https://github.com/nxp-imx/linux-imx/commit/4e92355e1f79d225ea842511fcfd42b343b32995
In comparison this patch will also reset the device if possible because
the downstream patch alone would still make the ath10k driver crash.
Without this patch suspend/resume will not work if a PCIe device is
connected. The kernel will hang on resume and print an error:
ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
8<--- cut here ---
Unhandled fault: imprecise external abort (0x1406) at 0x0106f944

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
Changes in v3:
- Added a new flag to the driver data to indicate that the suspend/resume
  is broken on the i.MX6QDL platform. (Frank)
- Fix comments to be more relevant (Mani)
- Use imx_pcie_assert_core_reset in suspend (Mani)

 drivers/pci/controller/dwc/pci-imx6.c | 57 +++++++++++++++++++++------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 808d1f1054173..09e3b15f0908a 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -82,6 +82,11 @@ enum imx_pcie_variants {
 #define IMX_PCIE_FLAG_HAS_SERDES		BIT(6)
 #define IMX_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
 #define IMX_PCIE_FLAG_CPU_ADDR_FIXUP		BIT(8)
+/**
+ * Because of ERR005723 (PCIe does not support L2 power down) we need to
+ * workaround suspend resume on some devices which are affected by this errata.
+ */
+#define IMX_PCIE_FLAG_BROKEN_SUSPEND		BIT(9)
 
 #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
 
@@ -1237,9 +1242,19 @@ static int imx_pcie_suspend_noirq(struct device *dev)
 		return 0;
 
 	imx_pcie_msi_save_restore(imx_pcie, true);
-	imx_pcie_pm_turnoff(imx_pcie);
-	imx_pcie_stop_link(imx_pcie->pci);
-	imx_pcie_host_exit(pp);
+	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
+		/**
+		 * The minimum for a workaround would be to set PERST# and to
+		 * set the PCIE_TEST_PD flag. However, we can also disable the
+		 * clock which saves some power.
+		 */
+		imx_pcie_assert_core_reset(imx_pcie);
+		imx_pcie->drvdata->enable_ref_clk(imx_pcie, false);
+	} else {
+		imx_pcie_pm_turnoff(imx_pcie);
+		imx_pcie_stop_link(imx_pcie->pci);
+		imx_pcie_host_exit(pp);
+	}
 
 	return 0;
 }
@@ -1253,14 +1268,32 @@ static int imx_pcie_resume_noirq(struct device *dev)
 	if (!(imx_pcie->drvdata->flags & IMX_PCIE_FLAG_SUPPORTS_SUSPEND))
 		return 0;
 
-	ret = imx_pcie_host_init(pp);
-	if (ret)
-		return ret;
-	imx_pcie_msi_save_restore(imx_pcie, false);
-	dw_pcie_setup_rc(pp);
+	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
+		ret = imx_pcie->drvdata->enable_ref_clk(imx_pcie, true);
+		if (ret)
+			return ret;
+		ret = imx_pcie_deassert_core_reset(imx_pcie);
+		if (ret)
+			return ret;
+		/**
+		 * Using PCIE_TEST_PD seems to disable msi and powers down the
+		 * root complex. This is why we have to setup the rc again and
+		 * why we have to restore the msi register.
+		 */
+		ret = dw_pcie_setup_rc(&imx_pcie->pci->pp);
+		if (ret)
+			return ret;
+		imx_pcie_msi_save_restore(imx_pcie, false);
+	} else {
+		ret = imx_pcie_host_init(pp);
+		if (ret)
+			return ret;
+		imx_pcie_msi_save_restore(imx_pcie, false);
+		dw_pcie_setup_rc(pp);
 
-	if (imx_pcie->link_is_up)
-		imx_pcie_start_link(imx_pcie->pci);
+		if (imx_pcie->link_is_up)
+			imx_pcie_start_link(imx_pcie->pci);
+	}
 
 	return 0;
 }
@@ -1485,7 +1518,9 @@ static const struct imx_pcie_drvdata drvdata[] = {
 	[IMX6Q] = {
 		.variant = IMX6Q,
 		.flags = IMX_PCIE_FLAG_IMX_PHY |
-			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE,
+			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
+			 IMX_PCIE_FLAG_BROKEN_SUSPEND |
+			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
 		.dbi_length = 0x200,
 		.gpr = "fsl,imx6q-iomuxc-gpr",
 		.clk_names = imx6q_clks,
-- 
2.43.0

