Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E7813C8E4
	for <imx@lists.linux.dev>; Thu,  6 Jun 2024 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717658862; cv=none; b=UxI86dYXfVNdveWYA311M8I16mSQgOwp5XUIm5O+Q5JteNcDWXt3sILULgp1KGwLdF8e3vKQj11vWVkQFp06kyZNmGJKfw38w7mHu4/qzsDaN4s5pAHbd+Kvf2yPlPnHK3HSG1bJLcDZTnnq0SbRgm7MhDjxJJiECE23umyMY9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717658862; c=relaxed/simple;
	bh=CyPVVcJODJ2tCBdthwAVOus+8aJwJCp9nbRVeHHFCiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fqc2pdWACA5PGLvk4CjW5howizBAHsEL7Vb+j424mgtr/ceAGQiLwa7fwyGUwvbbRTQN+izqsp6dQQ1SpTkbzOKMDAs2sY77cl5omoqZ58hGvXWj605fajnp/Sw72tUfneKfKAProYL00BcdrwJ/K9YmmfYHT0idNEkUXkMUH7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=APUAVWou; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="APUAVWou"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7025b84c0daso528537b3a.2
        for <imx@lists.linux.dev>; Thu, 06 Jun 2024 00:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717658860; x=1718263660; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7dQ9TfqMHdXG8LG6tUjAnjQ7RMaAYCpFAwKOPZMm9w=;
        b=APUAVWouETUW1zuGoM8vU5frpAAnFEz5ML1E4yvhkRvxeQTkUfhfKGUDj5ZO9vn/eY
         GkS/wFJBmZRbGWIXbc1OFhuKubdEi9T3tgskFAVHg9TwJrStUCOSiXFTGifa1BKAk0tB
         nJStrvf8XHi1nKQdpt92nGNnFIdTlokVFFYrpLIsZEQ9bCe8m3ol6bdQS1Iwb7SUb7IU
         oox786FzGujxSpFlbmOd9ID0hTJPo0fWa2dWuWlB+Lg0zRYmPK/jvvd1yo84CZ8ctxH4
         FgMkKI424W7upAMGBp/tO7StOp5lav12bICZJEmV5wjuhYtMTFoMFKZGnnjB4jQ+ZCCz
         1Crg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717658860; x=1718263660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7dQ9TfqMHdXG8LG6tUjAnjQ7RMaAYCpFAwKOPZMm9w=;
        b=XzBw4hvyXjIMm+z0OkHrWlpO9IxJRpg3g2wLlLXzltsL4Mxl6xSqF7VZ8g+6uEYgmz
         ENiSTQRI4EvLaEAmNV1b8xQOEiDgs6EPIikHprkP751bQQ2dBAFY0bm+dUNaxFouxCR9
         S0Toza/lX/2PQRE71FJfKDyFc67qqLNi07v5efxXmzDfxmnGTrdUyF+sGzAMVpaC/8A7
         XBtCC4nyHrhzq2AUlDWIUOCE+JegNX1ABALOZQ0bYhP5O0Eygh4J95t5RxU1tHSg9KDC
         ZUUKAgRYkBh0BWmMenCyvGFW6fK+Ahe2t6sLHKpyAgtZm0VNxGbpcBOgPSisXEIUT/fq
         MgPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF7hEHo0RNpj7hYwEoKwbkmdxR7S+/WazpyQzHppJvNkLN8TPSjRu9+0guGpRMXNlzQgB7f3MLy/03CdgCv3rXzKmy
X-Gm-Message-State: AOJu0YyUJkUNZqh88Zt8JdcPCMMgOk6d8V9XDxwloiCeK5fgwqiE1RWi
	rbt40eDwu8Htlt63sm7JXyWm87167gXJnQRhwy7DIKZRmtk3FwOKFqKYb76OIQ==
X-Google-Smtp-Source: AGHT+IEHiQ8WtwlFSj6EjFB6496Btx4UY0bPcJcqZ/rLzZcY0YY29ZVlXGd6vnqJZdPzzFq9RezUpw==
X-Received: by 2002:a05:6a00:198d:b0:702:5b3f:6c1a with SMTP id d2e1a72fcca58-703e5a5d66amr5009435b3a.32.1717658859582;
        Thu, 06 Jun 2024 00:27:39 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.142.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd494feasm566621b3a.100.2024.06.06.00.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 00:27:39 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 06 Jun 2024 12:56:36 +0530
Subject: [PATCH 3/5] PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API
 to handle Link Down event
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240606-pci-deinit-v1-3-4395534520dc@linaro.org>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
In-Reply-To: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
To: Vignesh Raghavendra <vigneshr@ti.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Minghuan Lian <minghuan.Lian@nxp.com>, 
 Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@axis.com, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
 mhi@lists.linux.dev, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6883;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=CyPVVcJODJ2tCBdthwAVOus+8aJwJCp9nbRVeHHFCiQ=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmYWTC1tIEUprHWLU3EJbohGb4dhy/c74Ocfx/L
 gFMNksZJ96JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZmFkwgAKCRBVnxHm/pHO
 9RqiB/wMM8Tt9y5MfBLY75mIEysw4v7tQX00FYGFLUMXPKf2oEKReZt+8J/fkmIfXEHWwiGONN2
 uYmAwIdX2adk3LvRje/TCwo/ejcIJ2zykk0oss3oBr6t2GJXXIPuAKtNzISB4p2D3ey/Vjy/6xk
 0Rtzznh3Wlz5rda3ypN/B5AEOGTLlzLQiqIYgn4iuPIgntiAE18mp0zhbiRpO4X/EwLyFSV7cwB
 X8XO5m6EKI1tkg6yVUJAsu4CJFSupVEEJbczhUSeXBVeFErpeyQeDM4ovmeHVXxvX+JHrTwPk+q
 eP90fxT0EFQCjKr/rr15hqsncrMBMRB74CQmXHyqxFRtrBCr
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

As per the PCIe base spec r5.0, section 5.2, Link Down event can happen
under any of the following circumstances:

1. Fundamental/Hot reset
2. Link disable transmission by upstream component
3. Moving from L2/L3 to L0

In those cases, Link Down causes some non-sticky DWC registers to loose the
state (like REBAR, etc...). So the drivers need to reinitialize them to
function properly once the link comes back again.

This is not a problem for drivers supporting PERST# IRQ, since they can
reinitialize the registers in the PERST# IRQ callback. But for the drivers
not supporting PERST#, there is no way they can reinitialize the registers
other than relying on Link Down IRQ received when the link goes down. So
let's add a DWC generic API dw_pcie_ep_linkdown() that reinitializes the
non-sticky registers and also notifies the EPF drivers about link going
down.

This API can also be used by the drivers supporting PERST# to handle the
scenario (2) mentioned above.

NOTE: For the sake of code organization, move the dw_pcie_ep_linkup()
definition just above dw_pcie_ep_linkdown().

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 103 ++++++++++++++++--------
 drivers/pci/controller/dwc/pcie-designware.h    |   5 ++
 2 files changed, 73 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 78d5fc72c9cb..09ad6f7b5095 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -15,18 +15,6 @@
 #include <linux/pci-epc.h>
 #include <linux/pci-epf.h>
 
-/**
- * dw_pcie_ep_linkup - Notify EPF drivers about Link Up event
- * @ep: DWC EP device
- */
-void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
-{
-	struct pci_epc *epc = ep->epc;
-
-	pci_epc_linkup(epc);
-}
-EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
-
 /**
  * dw_pcie_ep_get_func_from_ep - Get the struct dw_pcie_ep_func corresponding to
  *				 the endpoint function
@@ -661,6 +649,34 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 	return 0;
 }
 
+static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
+{
+	unsigned int offset;
+	unsigned int nbars;
+	u32 reg, i;
+
+	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	if (offset) {
+		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
+		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
+			PCI_REBAR_CTRL_NBAR_SHIFT;
+
+		/*
+		 * PCIe r6.0, sec 7.8.6.2 require us to support at least one
+		 * size in the range from 1 MB to 512 GB. Advertise support
+		 * for 1 MB BAR size only.
+		 */
+		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
+			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);
+	}
+
+	dw_pcie_setup(pci);
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 /**
  * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
  * @ep: DWC EP device
@@ -675,13 +691,11 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 	struct dw_pcie_ep_func *ep_func;
 	struct device *dev = pci->dev;
 	struct pci_epc *epc = ep->epc;
-	unsigned int offset, ptm_cap_base;
-	unsigned int nbars;
+	u32 ptm_cap_base, reg;
 	u8 hdr_type;
 	u8 func_no;
-	int i, ret;
 	void *addr;
-	u32 reg;
+	int ret;
 
 	hdr_type = dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE) &
 		   PCI_HEADER_TYPE_MASK;
@@ -744,25 +758,8 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 	if (ep->ops->init)
 		ep->ops->init(ep);
 
-	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
 	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
 
-	dw_pcie_dbi_ro_wr_en(pci);
-
-	if (offset) {
-		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
-		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
-			PCI_REBAR_CTRL_NBAR_SHIFT;
-
-		/*
-		 * PCIe r6.0, sec 7.8.6.2 require us to support at least one
-		 * size in the range from 1 MB to 512 GB. Advertise support
-		 * for 1 MB BAR size only.
-		 */
-		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
-			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, BIT(4));
-	}
-
 	/*
 	 * PTM responder capability can be disabled only after disabling
 	 * PTM root capability.
@@ -779,8 +776,7 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 		dw_pcie_dbi_ro_wr_dis(pci);
 	}
 
-	dw_pcie_setup(pci);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	dw_pcie_ep_init_non_sticky_registers(pci);
 
 	return 0;
 
@@ -791,6 +787,43 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
 
+/**
+ * dw_pcie_ep_linkup - Notify EPF drivers about Link Up event
+ * @ep: DWC EP device
+ */
+void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
+{
+	struct pci_epc *epc = ep->epc;
+
+	pci_epc_linkup(epc);
+}
+EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
+
+/**
+ * dw_pcie_ep_linkdown - Notify EPF drivers about Link Down event
+ * @ep: DWC EP device
+ *
+ * Non-sticky registers are also initialized before sending the notification to
+ * the EPF drivers. This is needed since the registers need to be initialized
+ * before the link comes back again.
+ */
+void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+	struct pci_epc *epc = ep->epc;
+
+	/*
+	 * Initialize the non-sticky DWC registers as they would've reset post
+	 * Link Down. This is specifically needed for drivers not supporting
+	 * PERST# as they have no way to reinitialize the registers before the
+	 * link comes back again.
+	 */
+	dw_pcie_ep_init_non_sticky_registers(pci);
+
+	pci_epc_linkdown(epc);
+}
+EXPORT_SYMBOL_GPL(dw_pcie_ep_linkdown);
+
 /**
  * dw_pcie_ep_init - Initialize the endpoint device
  * @ep: DWC EP device
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 49ae845a3662..89f9046af7eb 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -668,6 +668,7 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
 
 #ifdef CONFIG_PCIE_DW_EP
 void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
+void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep);
 void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
@@ -687,6 +688,10 @@ static inline void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
 {
 }
 
+static inline void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
+{
+}
+
 static inline int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	return 0;

-- 
2.25.1

