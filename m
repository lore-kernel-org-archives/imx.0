Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFDB14A96
	for <imx@lists.linux.dev>; Tue, 14 May 2024 05:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715664404; cv=none; b=T9/nSOfCkLMpATyiljoQSVXYsSNP/DiLdDpbMFOiBpQqe13V/KZ8kldX3mRS7IYqIovU4HdeiupL8SMinuXGjEWORZQVq8DgeRhwJ6aBWdpOtq5oYbn2up7Pc6lLcJ/oF/NjsCfQt+/gmyS5qGWlVCUWPjo5AuuA6+u6BVicqWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715664404; c=relaxed/simple;
	bh=NRqzaYlat30Cka6lLWm1QfveJqU5KFy7bW8Zc9IvWpI=;
	h=From:To:Cc:Subject:Date:Message-Id; b=PuPl4CUz17RQHDUHFluTYctsV3a/bG0/1PGLRmW4gNYjWOJG70GpULCGkSUa4o2GJQ2hz9sy1jyEry0jsAxueUkxThqrHopXcTr2wr9XPuuCN9xwfP7PCNUuLuieGNkSp3fp7GUeDdgFZccZWO1gD+hBEmQtUFD8wX1vpfTn0fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9DEC82000F6;
	Tue, 14 May 2024 07:26:40 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 544C92013D6;
	Tue, 14 May 2024 07:26:40 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 30BB1180226C;
	Tue, 14 May 2024 13:26:39 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: hongxing.zhu@nxp.com
Cc: imx@lists.linux.dev
Subject: [PATCH v1] PCI: dwc: Fix resume failure if no EP is connected at some platforms.
Date: Tue, 14 May 2024 13:07:20 +0800
Message-Id: <1715663241-8826-1-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

The dw_pcie_suspend_noirq() function currently returns success directly
if no endpoint (EP) device is connected. However, on some platforms, power
loss occurs during suspend, causing dw_resume() to do nothing in this case.
This results in a system halt because the DWC controller is not initialized
after power-on during resume.

Change call to deinit() in suspend and init() at resume regardless of
whether there are EP device connections or not. It is not harmful to
perform deinit() and init() again for the no power-off case, and it keeps
the code simple and consistent in logic.

Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=controller/dwc
This patch depends on the branch listed above, because it's not in pci-next.
But suppose it will be in there soon.

 .../pci/controller/dwc/pcie-designware-host.c | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index a0822d5371bc5..cb8c3c2bcc790 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -933,23 +933,23 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
 		return 0;
 
-	if (dw_pcie_get_ltssm(pci) <= DW_PCIE_LTSSM_DETECT_ACT)
-		return 0;
-
-	if (pci->pp.ops->pme_turn_off)
-		pci->pp.ops->pme_turn_off(&pci->pp);
-	else
-		ret = dw_pcie_pme_turn_off(pci);
+	if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_ACT) {
+		/* Only send out PME_TURN_OFF when PCIE link is up */
+		if (pci->pp.ops->pme_turn_off)
+			pci->pp.ops->pme_turn_off(&pci->pp);
+		else
+			ret = dw_pcie_pme_turn_off(pci);
 
-	if (ret)
-		return ret;
+		if (ret)
+			return ret;
 
-	ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
-				PCIE_PME_TO_L2_TIMEOUT_US/10,
-				PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
-	if (ret) {
-		dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
-		return ret;
+		ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
+					PCIE_PME_TO_L2_TIMEOUT_US/10,
+					PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
+		if (ret) {
+			dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
+			return ret;
+		}
 	}
 
 	if (pci->pp.ops->deinit)
-- 
2.37.1

