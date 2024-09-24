Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1221B85D6
	for <imx@lists.linux.dev>; Tue, 24 Sep 2024 03:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727149833; cv=none; b=sBy1wh7XcnYIhfOXxxiMR6UG5Z8Xv+7cAbvk5QIcGeRvF7EhjdIYC1NH1cTTYBxPAw0sKb7/NC3Jnoq2ZO3toMY5OPGLhNMab7fXcAX+wpukjTUwCKU4mL+CB2cCHcTSU/yqDO+ZtHOqmbMIihY+/Q3sDj7OW+pCt5WJQsZqBr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727149833; c=relaxed/simple;
	bh=pGlGsxgPKnRVfhVB8HEjH1qepg790OX1wMdwznXzSUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=cTrPIAyNW1sJQEsapy9fY1wiedXSbalf7CMb2x0/HbFOLu39MRjzTD8YaFKrgW9V9cJAblIm/Ti+a/KZw9oyFcipJjKE07hDG6f7AI4GDHvOuJ1S6lTi3Umei4hCDaWRuvU6a6y/MGOwUJa9ZmgOpD9OGKKpqpzkjn8Nv/LJLEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0E0071A1E2A;
	Tue, 24 Sep 2024 05:50:29 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CA4F51A1DC4;
	Tue, 24 Sep 2024 05:50:28 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id BF9E0183DC02;
	Tue, 24 Sep 2024 11:50:26 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: l.stach@pengutronix.de,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	frank.li@nxp.com,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	festevam@gmail.com,
	s.hauer@pengutronix.de
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1 5/9] PCI: imx6: Make core reset assertion deassertion symmetric
Date: Tue, 24 Sep 2024 11:27:40 +0800
Message-Id: <1727148464-14341-6-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1727148464-14341-1-git-send-email-hongxing.zhu@nxp.com>
References: <1727148464-14341-1-git-send-email-hongxing.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Add apps_reset deassertion in the imx_pcie_deassert_core_reset().
Let it be symmetric with imx_pcie_assert_core_reset().

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index d49154dbb1bd..f306f2e9dcce 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -770,6 +770,7 @@ static void imx_pcie_assert_core_reset(struct imx_pcie *imx_pcie)
 static int imx_pcie_deassert_core_reset(struct imx_pcie *imx_pcie)
 {
 	reset_control_deassert(imx_pcie->pciephy_reset);
+	reset_control_deassert(imx_pcie->apps_reset);
 
 	if (imx_pcie->drvdata->core_reset)
 		imx_pcie->drvdata->core_reset(imx_pcie, false);
-- 
2.37.1

