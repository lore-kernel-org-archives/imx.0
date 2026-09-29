Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B950547051
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 19:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711037; cv=none; b=ZvtaPbvaOhNiEJFtE2ko/MqlHe2aMZ6Tl9DZECT7XfItsTNlYfZoLeqEtQoK+po+q+7g/CV3j1a2CbpRe+B+bSRoDyVxXnPfIX7MxQRTqtm1Ui24Ox5zJv9WzF0PYE1+8mDt+PfpWf/JHwdwgDuegc7kysZiTp4g2zHtM1j/PTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711037; c=relaxed/simple;
	bh=M0Da55fAk3f5sg11hCY0mZN4G1cBSfd5x8sRoxUgQJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=phiPBurxFaIpvYYimRtAzPG+ORmyJtsSenQyvA9d8HX3BcDGPhZWYCjOCk3qRzBXfgSTydgOZQt26NDhAOJeNxO0164+5ruxwdHhu9YjRvv9LUj/ZEOt++l9dWNMtVMjlBrEDJHjMMY74zL17AAwrVI9uB+8QnSCoTZGRF1OqLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=X5YInvO1; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="X5YInvO1"
Received: from jeffbarnes-ThinkPad-P14s-Gen-2i.corp.microsoft.com (unknown [52.167.115.14])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8964020B7166;
	Tue, 29 Sep 2026 12:42:56 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8964020B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1790710978;
	bh=XSr/FpY6Ep2Y64lvgMS/GCnnKAwRUccneELijM9K4dk=;
	h=From:To:Cc:Subject:Date:From;
	b=X5YInvO10SJeiGSwh9q8U8njS2R52RaMF/ewdT7PfgPwRAcbZVaKZqEI8dRBpt8tk
	 W0/v6GLlABhxJpjDf4l6fVWcmbSzrRS0w2C77FuwsoR69MFLHiO2PlDheP7jD1Ofny
	 HPj5fSKCYtfmb4tA+0ZELdpJGtD2jh728EJkdGlc=
From: jeffbarnes@linux.microsoft.com
To: linux-pci@vger.kernel.org
Cc: minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	roy.zang@nxp.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	Zhiqiang.Hou@nxp.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] PCI: layerscape: use default error response behavior
Date: Tue, 29 Sep 2026 15:43:39 -0400
Message-ID: <20260929194339.233271-1-jeffbarnes@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeff Barnes <jeffbarnes@linux.microsoft.com>

The Layerscape PCIe driver programs PCIE_ABSERR to forward errors from
outbound non-posted requests to the internal AXI interface.

A PCI configuration access can race with the link going down after
dw_pcie_other_conf_map_bus() checks the link but before the MMIO access
is performed. When the resulting Completion Timeout is forwarded to
AXI, it causes an asynchronous SError and kernel panic.

For example:

  Kernel panic - not syncing: Asynchronous SError Interrupt
  ...
  Call trace:
   arm64_serror_panic+0x78/0x90
   do_serror+0x84/0x90
   el1h_64_error_handler+0x30/0x40
   el1h_64_error+0x68/0x70
   pci_generic_config_read+0x64/0xb0
   dw_pcie_rd_other_conf+0x1c/0x68
   pci_bus_read_config_word+0x68/0x118
   pcie_capability_read_word+0xa8/0xd8
   find_device_iter+0x8c/0x160
   pci_walk_bus+0x60/0xb8
   find_source_device+0x78/0xb0
   aer_isr+0x1dc/0x230

Restore the controller's default error response behavior instead of
forwarding these errors to AXI.

Reproduce the race by instrumenting dw_pcie_rd_other_conf() to call
map_bus() while the link is up, then schedule a worker on another CPU
to set PCI_EXP_LNKCTL_LD. Synchronize the CPUs immediately before the
Link Disable DBI write, then perform readl() using the address returned
by map_bus() concurrently with the link transition.

Without this change, the overlapping configuration read results in an
asynchronous SError and kernel panic. With this change, the same test
returns 0xffffffff from the configuration read. In this test, AER
reports a non-fatal Completion Timeout, and no SError or kernel panic
occurs.

This effectively reverts the error response behavior introduced by
commit 84d897d69938
("PCI: layerscape: Change default error response behavior").

Fixes: 84d897d69938 ("PCI: layerscape: Change default error response behavior")
Cc: stable@vger.kernel.org
Signed-off-by: Jeff Barnes <jeffbarnes@linux.microsoft.com>
---
 drivers/pci/controller/dwc/pci-layerscape.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 14d6ac4fc53f..d333f1ae8a41 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -28,8 +28,6 @@
 
 /* PEX Internal Configuration Registers */
 #define PCIE_STRFMR1		0x71c /* Symbol Timer & Filter Mask Register1 */
-#define PCIE_ABSERR		0x8d0 /* Bridge Slave Error Response Register */
-#define PCIE_ABSERR_SETTING	0x9401 /* Forward error of non-posted request */
 
 /* PF Message Command Register */
 #define LS_PCIE_PF_MCR		0x2c
@@ -103,14 +101,6 @@ static void ls_pcie_drop_msg_tlp(struct ls_pcie *pcie)
 	iowrite32(val, pci->dbi_base + PCIE_STRFMR1);
 }
 
-/* Forward error response of outbound non-posted requests */
-static void ls_pcie_fix_error_response(struct ls_pcie *pcie)
-{
-	struct dw_pcie *pci = pcie->pci;
-
-	iowrite32(PCIE_ABSERR_SETTING, pci->dbi_base + PCIE_ABSERR);
-}
-
 static u32 ls_pcie_pf_lut_readl(struct ls_pcie *pcie, u32 off)
 {
 	if (pcie->big_endian)
@@ -180,8 +170,6 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct ls_pcie *pcie = to_ls_pcie(pci);
 
-	ls_pcie_fix_error_response(pcie);
-
 	dw_pcie_dbi_ro_wr_en(pci);
 	ls_pcie_clear_multifunction(pcie);
 	dw_pcie_dbi_ro_wr_dis(pci);
-- 
2.43.0

