Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5156E6F2EA
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 02:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723429285; cv=none; b=U9HAxci0Uf07DP4by+4A5LcJoGtaO0x32kerGYMRUsnAvb80PYLK3G6GwlxrCvQhgYvdzU8eF9HJ0wYuOiLnzxwjNs1uE/aH4/sgqkdQlztbn34rz/lVk3ojjZVYcBtAbQ2LTorRvMl52TxGdDeFG5j9JGP80U0mxcRSj6IyKTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723429285; c=relaxed/simple;
	bh=ZVb80+3Oq81PRDmhbU8kSUzYiBenncm5i+GG/eZ+T2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=rwqBfQDn9TS2tD1ykXow8CDE0kCyAaD/JG3kS1d271O2nR/r3iowqF5ywF00aMzgfPw3eb3HD9M3y2VKV5vldRqSlWrdPYo3g5tiJaOZ7KU3NO96tfa5KWfwr+OjI4XfsIAI7dKN2hzpIXlhERMyqMcDvC85oAWVKV8GJUtgPmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C70852010C4;
	Mon, 12 Aug 2024 04:21:20 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8D578200FF3;
	Mon, 12 Aug 2024 04:21:20 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 8635F183ACAC;
	Mon, 12 Aug 2024 10:21:18 +0800 (+08)
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
Subject: [PATCH v6 5/5] ata: ahci_imx: Correct the email address
Date: Mon, 12 Aug 2024 10:00:55 +0800
Message-Id: <1723428055-27021-6-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1723428055-27021-1-git-send-email-hongxing.zhu@nxp.com>
References: <1723428055-27021-1-git-send-email-hongxing.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Correct the email address of driver author.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/ata/ahci_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index 627b36cc4b5c1..65f98e8fdf07b 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -1036,6 +1036,6 @@ static struct platform_driver imx_ahci_driver = {
 module_platform_driver(imx_ahci_driver);
 
 MODULE_DESCRIPTION("Freescale i.MX AHCI SATA platform driver");
-MODULE_AUTHOR("Richard Zhu <Hong-Xing.Zhu@freescale.com>");
+MODULE_AUTHOR("Richard Zhu <hongxing.zhu@nxp.com>");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
-- 
2.37.1

