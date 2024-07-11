Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D2115885E
	for <imx@lists.linux.dev>; Thu, 11 Jul 2024 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686617; cv=none; b=LErRZI56EAGE1SJM9i0ngjHfMGTk62E/Oma/j+0r5J/D293+bw05lphdHUM+vizd8z68tqwjgWOTFuK1ymq8IhVfNj6os/1biy4yoEbcPNDm5/4zjFPfHRh8PP8M4DrBu9Wwrl28M48x8IhiSkVYaWLs+QRWp9KP2ADi7fCGhOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686617; c=relaxed/simple;
	bh=O/3ZVknaEDRf9FzsUJCjc+R3UBIFyGWcjetg4gOyhmw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=XF4Dr1z8NlOmXO34iIp6Rl4R0OF4gyn3OI9iKy1gGr3cXenUjoDVFsfilT2V/YBlktVOnYUnijWWVDTj/0LlHs0nHe4RhZarsGeVbN6d/xCGJD33whzWwUsup+/EpRH1emk8heRj3iJwVYBnuTkA7PaO5ql3vur++1eEZV42AXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B632F201B53;
	Thu, 11 Jul 2024 10:30:14 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 87166201B42;
	Thu, 11 Jul 2024 10:30:14 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 97EC71820F57;
	Thu, 11 Jul 2024 16:30:12 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: tj@kernel.org,
	dlemoal@kernel.org,
	cassel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: linux-ide@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v1 4/4] ata: ahci_imx: Correct the email address
Date: Thu, 11 Jul 2024 16:11:58 +0800
Message-Id: <1720685518-20190-5-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1720685518-20190-1-git-send-email-hongxing.zhu@nxp.com>
References: <1720685518-20190-1-git-send-email-hongxing.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Correct the email address of driver author.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 drivers/ata/ahci_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index 9147cd14f587e..f3b89a7df062c 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -1041,6 +1041,6 @@ static struct platform_driver imx_ahci_driver = {
 module_platform_driver(imx_ahci_driver);
 
 MODULE_DESCRIPTION("Freescale i.MX AHCI SATA platform driver");
-MODULE_AUTHOR("Richard Zhu <Hong-Xing.Zhu@freescale.com>");
+MODULE_AUTHOR("Richard Zhu <hongxing.zhu@nxp.com>");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.37.1

