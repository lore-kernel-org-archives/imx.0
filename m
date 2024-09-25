Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E627D154C18
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 06:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727244683; cv=none; b=SP7ytqvcuWgZa6NDPBoy5n3tDDAra48qouAHLY0DsnTukYBMq+2C1DlJ1ov0O6vRcC8GktN6HGFYt4wLhs1dAVqNguJ8Dry/pOtWm1+dyJU6ItcQZ4gP+MAzwqyQ8h8HO5QFiY8IiUI9S0JkZ/dn38xLpmwH2BhOWjKN31LpyxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727244683; c=relaxed/simple;
	bh=/Na4mmXiKLt8UcFVI72fQXazUo7b1yDzIc3NeYd3v20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ZlGMQ5EbuGCcG0N+UWFTqak32EQhlwPD+e9od4pCkAFDIslJH9mvEV3powFNch+84TyKA45lkTAkPCgBkXhty0CgCvTfZj+ZSKfrCUAWPffziOkTnrjHM2lJmKHFBW2yrLfDP3JMcZQHw+uH5vgV8eiJhG6sVQj4YsHXFmxC6tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 92CB7201FD3;
	Wed, 25 Sep 2024 08:11:13 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2DD93201FE7;
	Wed, 25 Sep 2024 08:11:13 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id C5AB7183AD51;
	Wed, 25 Sep 2024 14:11:11 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: jingoohan1@gmail.com,
	manivannan.sadhasivam@linaro.org,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	frank.li@nxp.com,
	robh@kernel.org
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1 2/2] PCI: dwc: Do stop link in the dw_pcie_suspend_noirq
Date: Wed, 25 Sep 2024 13:48:37 +0800
Message-Id: <1727243317-15729-3-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1727243317-15729-1-git-send-email-hongxing.zhu@nxp.com>
References: <1727243317-15729-1-git-send-email-hongxing.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

On i.MX8QM, PCIe link can't be re-established again in
dw_pcie_resume_noirq(), if the LTSSM_EN bit is not cleared properly in
dw_pcie_suspend_noirq().

Add dw_pcie_stop_link() into dw_pcie_suspend_noirq() to fix this issue and
keep symmetric in suspend/resume function since there is
dw_pcie_start_link() in dw_pcie_resume_noirq().

Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index cb8c3c2bcc79..9ca33895456f 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -952,6 +952,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
 		}
 	}
 
+	dw_pcie_stop_link(pci);
 	if (pci->pp.ops->deinit)
 		pci->pp.ops->deinit(&pci->pp);
 
-- 
2.37.1

