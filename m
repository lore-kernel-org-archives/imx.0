Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D491DD9C6
	for <imx@lists.linux.dev>; Tue, 15 Oct 2024 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728982651; cv=none; b=QalTgncvUbOZCpGoiRiKOByz3qE4xM2VEYbxuNNifNobBEUbNdS23cg/pLqdjcFEgii8byc8Iv6J+L0C0igyTV+8Bcj8dqKK5HdbnklSvZSIUa3QsxRDoOj5lBzsvYbMVnTLPc/RY3wXiWr7zYPxS57Bz5DWfR6kGFs/g5XA+Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728982651; c=relaxed/simple;
	bh=fFUfoQr7BDA8XW3C7x0D31L9BuEwyuCray9WmFT5Ijg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=NGhq3krjU5kMx2zktjzdsBK7V8aON8cxI9W98Pek1qZsOrRBXoK1b/TF/4Jwu8IIstAXgVAqmlx+b6OgyJForxZYvlfahGAYm4eR+JuCU/TL5Cijo6icAgKGSNq/GIp8EF/BCn/eLcW+HI0HCqExNK3oS2SvdT8OaJWprREOIUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D8AFA20168E;
	Tue, 15 Oct 2024 10:57:28 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 99CF7200C87;
	Tue, 15 Oct 2024 10:57:28 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 6BB0E183DC02;
	Tue, 15 Oct 2024 16:57:26 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	festevam@gmail.com,
	s.hauer@pengutronix.de
Cc: hongxing.zhu@nxp.com,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev
Subject: [PATCH v4 4/9] PCI: imx6: Correct controller_id generation logic for i.MX7D
Date: Tue, 15 Oct 2024 16:33:28 +0800
Message-Id: <1728981213-8771-5-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1728981213-8771-1-git-send-email-hongxing.zhu@nxp.com>
References: <1728981213-8771-1-git-send-email-hongxing.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

i.MX7D only has one PCIe controller, so controller_id should always be 0.
The previous code is incorrect although yielding the correct result. Fix by
removing IMX7D from the switch case branch.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 2ae6fa4b5d32..ca8714c625fe 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1338,7 +1338,6 @@ static int imx_pcie_probe(struct platform_device *pdev)
 	switch (imx_pcie->drvdata->variant) {
 	case IMX8MQ:
 	case IMX8MQ_EP:
-	case IMX7D:
 		if (dbi_base->start == IMX8MQ_PCIE2_BASE_ADDR)
 			imx_pcie->controller_id = 1;
 		break;
-- 
2.37.1

