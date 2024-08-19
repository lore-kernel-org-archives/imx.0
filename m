Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1705C15E5B5
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724058279; cv=none; b=f14+UDrIX/piwNLiHwsiWgEAQWGIGK/so9vlCKwcMlqVWPBVYyoLlokppsF6zNfn/2fZgG7V7cOhO770qg8p4NVmWEdazFl0xdvvvh0Q2YYVjle+qt7BMHZHeR2NuRFDA2WtNjm025BgQpGx6tdSZBknGes1+nkLRTBo0619Hys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724058279; c=relaxed/simple;
	bh=k0kc+QTAqBx5aRP9ejxkGxkgN/n6bbv6rD4rzOSvbiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/Quk3K5bs/7myP6Yd8uKRIgD3mAFFFbxPQ81tmZEiwhWKBzPIve+Sr8qlmj00R4imfr60FGXT8tFvrWSHn7h86nOcj7vwmMDQH8Ykh/DC6/g3jTY5sCXWu08QuCyxmPdmtwGRxU0uMH5Tr7qxsdMMU/UVAC2L4O7MD7fY7yM2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfOV1gx7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfOV1gx7"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4280ee5f1e3so32457415e9.0
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 02:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724058276; x=1724663076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zR4Ofv19bSC63uSv19yH+Zec5wT7Br2CN3wzGxETKgc=;
        b=XfOV1gx7aL6uDgxRAVoiU0T4Lts2BHQL5hoaQCwvfDhNisRELkSlh3HP0cctsxkJ+P
         CeWwQBHis6muropLR9stDHlNiuPOV/r9ZIINoKIBOTFkeWfHb7WDJeI17n1KY73tmnyI
         WOC5Nnbf0ARhd9yXJecR1D3ojRInb0Y1Osa30ioNNh2VgcRo+I33B/Gwj2bo5hAM4fj6
         tmCAqX2pVyOARtDb/s5D/HbGH4iErEa9U8J7IHKlmcz4mFulVdInXNyVzYgTesyqo3BV
         PM6fgKoxoFp8sG87GSDn3DiwuBVfCL0S2RPIqv3699iMBaIU+rhULS29gckGPRmz1Fmy
         bGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724058276; x=1724663076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zR4Ofv19bSC63uSv19yH+Zec5wT7Br2CN3wzGxETKgc=;
        b=eSsFrgqRSWsV3rd4Yk1fcLcRM2laK0h70YgLZ/IhROw1u1IgymzmbPt+dcKgKeoG61
         x2FF6dfW15kC8HP8Q72EZeMo6cldMHjXcXf72bcyd6hDwgNX7FiwJaG3Dj/2eI3A5fsJ
         grmMxKSFZ76Z2zJuNfe7utsPoAWz59AbIhiursRugO5zusKWVSFQPkHxwwo3YFXXn28m
         bTzm/yfKYUUVEeybqy1u6JQMlp23fTtY9wrTtVI06Aiw43w7rL+IQCs2+H479a2ZrPzJ
         fi537JCbZTJY/vjHqqrtEshWWpBpubpUxi5PAK0AlDoOTmPVGnpMfL1bc97q0YRGaRef
         kZVw==
X-Forwarded-Encrypted: i=1; AJvYcCXH4s6vDG+ivQad71fhWoc/jHw+CTwg+E7sxpu/I6Hu4RpFMJw/R1g+cNjKgKXtwyTUxjwEKkmlc3tGJLdFYjWMOE19
X-Gm-Message-State: AOJu0YwZ+eFor99EO3E4N7P2idLweQOk1SbN1XtB2kD1OIYOdOxK2F6P
	BD3aG/BLmB8VAA8A2b4FUVmWvPsaIFrKgQhTVjYJxf9duU0jIUjMTsfGr6g/
X-Google-Smtp-Source: AGHT+IH7JYzrD4WQ2IczOX6U7P1voHwlgUZmPc1foVjQrG13R7Z0iK1/sLxIgbdwHptG5vYiK5hczA==
X-Received: by 2002:a05:600c:4712:b0:426:5fbe:bf75 with SMTP id 5b1f17b1804b1-429ed7d1eccmr71255425e9.23.1724058276061;
        Mon, 19 Aug 2024 02:04:36 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a64c:8731:e4fb:38f1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded19627sm154672095e9.5.2024.08.19.02.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 02:04:35 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 3/3] PCI: imx6: reset link on resume
Date: Mon, 19 Aug 2024 11:03:19 +0200
Message-ID: <20240819090428.17349-4-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240819090428.17349-1-eichest@gmail.com>
References: <20240819090428.17349-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

According to the https://www.nxp.com/docs/en/errata/IMX6DQCE.pdf errata,
the i.MX6Q PCIe controller does not support suspend/resume. So suspend
and resume was omitted. However, this does not seem to work because it
looks like the PCIe link is still expecting a reset. If we do not reset
the link, we end up with a frozen system after resume. The last message
we see is:
ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0,
device inaccessible

Besides resetting the link, we also need to enable msi again, otherwise
DMA access will not work and we can still end up with a frozen system.
With these changes we can suspend and resume the system properly with a
PCIe device attached. This was tested with a Compex WLE900VX miniPCIe
Wifi module.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 45 ++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index f17561791e35a..751243f4c519e 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1213,14 +1213,57 @@ static int imx6_pcie_suspend_noirq(struct device *dev)
 	return 0;
 }
 
+static int imx6_pcie_reset_link(struct imx6_pcie *imx6_pcie)
+{
+	int ret;
+
+	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR1,
+			   IMX6Q_GPR1_PCIE_TEST_PD, 1 << 18);
+	regmap_update_bits(imx6_pcie->iomuxc_gpr, IOMUXC_GPR1,
+			   IMX6Q_GPR1_PCIE_REF_CLK_EN, 0 << 16);
+
+	/* Reset the PCIe device */
+	gpiod_set_value_cansleep(imx6_pcie->reset_gpiod, 1);
+
+	ret = imx6_pcie_enable_ref_clk(imx6_pcie);
+	if (ret) {
+		dev_err(imx6_pcie->pci->dev, "unable to enable pcie ref clock\n");
+		return ret;
+	}
+
+	imx6_pcie_deassert_reset_gpio(imx6_pcie);
+
+	/*
+	 * Setup the root complex again and enable msi. Without this PCIe will
+	 * not work in msi mode and drivers will crash if they try to access
+	 * the device memory area
+	 */
+	dw_pcie_setup_rc(&imx6_pcie->pci->pp);
+	if (pci_msi_enabled()) {
+		u32 val;
+		u8 offset = dw_pcie_find_capability(imx6_pcie->pci, PCI_CAP_ID_MSI);
+
+		val = dw_pcie_readw_dbi(imx6_pcie->pci, offset + PCI_MSI_FLAGS);
+		val |= PCI_MSI_FLAGS_ENABLE;
+		dw_pcie_writew_dbi(imx6_pcie->pci, offset + PCI_MSI_FLAGS, val);
+	}
+
+	return 0;
+}
+
 static int imx6_pcie_resume_noirq(struct device *dev)
 {
 	int ret;
 	struct imx6_pcie *imx6_pcie = dev_get_drvdata(dev);
 	struct dw_pcie_rp *pp = &imx6_pcie->pci->pp;
 
+	/*
+	 * Even though the i.MX6Q does not support suspend/resume, we need to
+	 * reset the link after resume or the memory mapped PCIe I/O space will
+	 * be inaccessible. This will cause the system to freeze.
+	 */
 	if (!(imx6_pcie->drvdata->flags & IMX6_PCIE_FLAG_SUPPORTS_SUSPEND))
-		return 0;
+		return imx6_pcie_reset_link(imx6_pcie);
 
 	ret = imx6_pcie_host_init(pp);
 	if (ret)
-- 
2.43.0

