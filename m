Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711373C457B;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773169660; cv=none; b=FIUYszHRnaNGBg2QUinmFx9ThBb7aBlxNJ+8VlL/oIgjAYK+/xPlgV3ON/r54+v8RlSybByzQwBUVRfck6BA467FYQr/HTs+7/e55yk5LtV3MrUGwydyVxiUQrONtiivjsWUhDg7UXBrkPMdgo+k3GixqeIwc9rG2k3q7ViePrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773169660; c=relaxed/simple;
	bh=swVryWkevogj/HEKHBlOlgACQaUp6HCFWqxYjXi6JDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UTPHPjCIhQeZdzPwqaKb6NsbQqsLO6aSByUvbRbU0myS6NfivRPkK4ByQrSxGynmxqaW3Qgq2cU4XknfyiwyBlyJPyVy/yR6mist9kZ8Uay0h1QdYC+XtFMWhZSiE4KTce8WwwOlfiLmaSK6f6wsZcbxMtWqSIp8xCKXJNBJqzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcU1Uy//; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcU1Uy//"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 413B7C2BCB0;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773169660;
	bh=swVryWkevogj/HEKHBlOlgACQaUp6HCFWqxYjXi6JDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jcU1Uy//ddwtFoGfkSqMKM3rSMm0VfAqCsOqSAw5CXoPST5dHvOE5b/KtRcGIIG3Q
	 u25vR6jmZ9CaTXhhFhHmhhlhu/SF7L2r1AAVaQ1/35HgY/84VIXiRd6n7dpL8taaY3
	 iaUTflDT0XXh/8fhOdITOK+sp6UHOEuhMKPWzkVJacrpejC4F3ek9YW9bZRFBlvyQx
	 Jbgm+xoKmotyhwHVxg6YqrLYtLzcQkUDAkP9fImguw8KebJ9BoIXs6Fphq59otv8Ei
	 euAfiNtRpfdTF1bVw0BfMC7DyWhTgEhXLnSAnuyUqbKE5fTm/TN5/JOygnPtS5fsph
	 bbqJOgYEVwaDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370B0FD4F23;
	Tue, 10 Mar 2026 19:07:40 +0000 (UTC)
From: Frank Li via B4 Relay <devnull+Frank.Li.nxp.com@kernel.org>
Date: Tue, 10 Mar 2026 15:07:38 -0400
Subject: [PATCH 2/3] mtd: rawnand: mxc: set chip->of_node to nand@0 child
 node if present
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-gpmi_nand-v1-2-6a665151aa75@nxp.com>
References: <20260310-gpmi_nand-v1-0-6a665151aa75@nxp.com>
In-Reply-To: <20260310-gpmi_nand-v1-0-6a665151aa75@nxp.com>
To: Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Max Krummenacher <max.oss.09@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773169659; l=1828;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=bOj/g+UY+4s889neQOAMnpSX/wgGz20f6Io/aYMX6LU=;
 b=sh93q7HWhsnaCKLZJ2Qq9mCg1igrjdWIT0UcPJC1loYjHO6n/x55Zvvbg0+k8sraeMaRzgx+c
 K502GrP2CkaCs5pORsfOhPhKkCdy+uzAcki6HaIUqBErDcRCWwAzRZ7
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-Endpoint-Received: by B4 Relay for Frank.Li@nxp.com/20240130 with
 auth_id=121
X-Original-From: Frank Li <Frank.Li@nxp.com>
Reply-To: Frank.Li@nxp.com

From: Frank Li <Frank.Li@nxp.com>

The nand-controller.yaml binding requires a child node (e.g. nand@0) under
the NAND controller. However, the driver currently assigns the controller's
of_node directly to the NAND chip.

Search for the first child node with the "nand" prefix and assign it to
chip->of_node. This filters out properties such as "partition" that may be
placed under the controller node in some older DTS files.

Fall back to using the controller's of_node if no suitable child node is
found to maintain backward compatibility.

This issue went unnoticed because the default behavior works for most NAND
chips.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Build test only because can't find such old boards, logic is the same as
gpmi nand flash controller.
---
 drivers/mtd/nand/raw/mxc_nand.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 8c56b685bf91a462a707ff868c601358375aafce..4d8b92e7e67257535142b3a0deb5b179e1a17bad 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -4,6 +4,7 @@
  * Copyright 2008 Sascha Hauer, kernel@pengutronix.de
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/init.h>
@@ -1714,7 +1715,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	this->legacy.chip_delay = 5;
 
 	nand_set_controller_data(this, host);
-	nand_set_flash_node(this, pdev->dev.of_node);
+
+	struct device_node *np __free(device_node) =
+		of_get_next_child_with_prefix(pdev->dev.of_node, NULL, "nand");
+
+	if (np)
+		nand_set_flash_node(this, np);
+	else
+		nand_set_flash_node(this, pdev->dev.of_node);
 
 	host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(host->clk))

-- 
2.43.0


