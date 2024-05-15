Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CF83838F
	for <imx@lists.linux.dev>; Wed, 15 May 2024 03:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715742121; cv=none; b=drCVGIVNC880L9vllwkRsAs/wK/D9YtwefxjoYr2ZmOYP2Ad5niTGfw7dxJo/gwDPoaYZsnSMzWiOrDp8dR2HHwdpATVk7MLWbXVORv5kbFDhuiNi9MTQc08X/6IWmnDhfEN23stdKVWBzOH8YyQg9JUXDlZQ50Wego9l8Vq/Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715742121; c=relaxed/simple;
	bh=dsenZlh0fxQ5J3Fofb0WP/2HBAsaZooXBTl2uqom+3E=;
	h=From:To:Cc:Subject:Date:Message-Id; b=PQi3TGEETRnQDDdqOyJT+/15MWbr6ElQUt3+cE2rcrRiSKk5miOHTnDrAan2Yk2gn/ZbpZlQGYPyhnxK1pojaUhtAH/BwZRI0OWMnHI/sdFNtGspQDLFRcc9oRioW/GfgMuJYMFVPdaXB9ZzeBc5yM4jZJVFEdONDfPSY/b+vhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 66B611A1A0C;
	Wed, 15 May 2024 05:01:57 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1A1011A1A0A;
	Wed, 15 May 2024 05:01:57 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id BF2A51820F77;
	Wed, 15 May 2024 11:01:55 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: frank.li@nxp.com,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v3] PCI: dwc: Fix suspend hang when e1000e network card is connected
Date: Wed, 15 May 2024 10:42:35 +0800
Message-Id: <1715740955-10688-1-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

In dw_pcie_suspend_noirq() and after the PME_TURN_OFF messgage is sent out,
one PMC version2.0 endpoint device E1000E network card hangs in LTSSM stat
polling and L2 stat check.

To avoid this hang issue after the PME_TURN_OFF message is sent out.
Only poll and check LTSSM L2 stat if the EP's PMC version is 3 or later,

Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
v2:
- Add a new help function dwc_get_devices_pmc_version() to get devices PMC
  versions.
v3:
- Fetch the correct PMC versions, and get the minimum of them.

 .../pci/controller/dwc/pcie-designware-host.c | 52 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index cb8c3c2bcc790..a064972b36b7a 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -884,6 +884,48 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_setup_rc);
 
+static int dwc_get_devices_pmc_version(struct dw_pcie *pci)
+{
+	int ret;
+	u16 pmc, ver = 0;
+	struct dw_pcie_rp *pp = &pci->pp;
+	struct pci_bus *child, *root_bus = NULL;
+	struct pci_dev *pdev;
+
+	/* Check the remote EP's PMC version */
+	list_for_each_entry(child, &pp->bridge->bus->children, node) {
+		if (child->parent == pp->bridge->bus) {
+			root_bus = child;
+			break;
+		}
+	}
+
+	if (!root_bus) {
+		dev_err(pci->dev, "Failed to find downstream devices\n");
+		return -ENODEV;
+	}
+
+	list_for_each_entry(pdev, &root_bus->devices, bus_list) {
+		if (PCI_SLOT(pdev->devfn) == 0) {
+			/* find PCI PM capability in list */
+			ret = pci_find_capability(pdev, PCI_CAP_ID_PM);
+			if (!ret)
+				return ret;
+			/*
+			 * Check device's PM ability version, the fetch the
+			 * minimum.
+			 */
+			pci_read_config_word(pdev, ret + PCI_PM_PMC, &pmc);
+			pmc &= PCI_PM_CAP_VER_MASK;
+
+			if ((ver == 0) || (ver > pmc))
+				ver = pmc;
+		}
+	}
+
+	return ver;
+}
+
 static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 {
 	struct dw_pcie_ob_atu_cfg atu = { 0 };
@@ -924,7 +966,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 {
 	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	u32 val;
-	int ret = 0;
+	int pmc_ver, ret = 0;
 
 	/*
 	 * If L1SS is supported, then do not put the link into L2 as some
@@ -933,6 +975,8 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
 		return 0;
 
+	pmc_ver = dwc_get_devices_pmc_version(pci);
+
 	if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_ACT) {
 		/* Only send out PME_TURN_OFF when PCIE link is up */
 		if (pci->pp.ops->pme_turn_off)
@@ -942,7 +986,13 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 
 		if (ret)
 			return ret;
+	}
 
+	/*
+	 * PMC Ver2.0 device e1000e NIC hangs in LTSSM polling and L2 check.
+	 * Only do the L2 check when PMC version is Ver3.0 or later.
+	 */
+	if (pmc_ver >= 3) {
 		ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
 					PCIE_PME_TO_L2_TIMEOUT_US/10,
 					PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
-- 
2.37.1

