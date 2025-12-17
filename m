Received: from mx-relay47-hz3.antispameurope.com (mx-relay47-hz3.antispameurope.com [94.100.134.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F28C348896
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765959214; cv=pass; b=oE8u8Laki5W6s8eTgoGtAEdY/2ZnX/VylM5eXISfsR9LutVrP1pesDWIQtzD7ulspZNr3Z3bz+cZuKRp6RHGelvzcV/VYG8bGMnjaVo3nQJ6NqIUw0iLI2ev5OFkGTaFsbPXQgNltjHna2HesprIG9IapkLQwuXprdS4FIWiaWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765959214; c=relaxed/simple;
	bh=ryi/Ef/saj9VSvDpF0t+ugqgQh2IyrT3yrEzBdcjLbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SHomFkdCyECyMHFSyWGEr7BTU5+uyToCg8mpOUI1DCC3wX8fBM4WO+kJP5SWb0843/cANng7BDyU2CH8uVZA9WTJjUp5UOj85IKrSRWJETUW44CmUpU0jTdz+Aer8OQooO1Ov9s2yqrIXrqBj7D+gagzkgWUohFzcyyVfmaa9ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=OoacMUnB; arc=pass smtp.client-ip=94.100.134.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OoacMUnB"
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=gBojcA9uKcuTxPzbTmt63WipEC3ONCXYd+7KHmpSJsI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765959194;
 b=dcQZkoGKov2TGGpukjEhrrNe+Ukt1TM8bxgdjbEQL1bQflTJeqxWjh52r1pqqxyCkkaOQ4JL
 S57Bt83tRXxQ+b0/eNS3OPRcAo5UJSqNc7lh/ZnRMFFAFDiMKV63uNkQzM3oEDMnZS3O2SEHlF/
 IBr9tZ/4eq/vz3Y99yo12P5+W/5Q7FVo6rN0V+0oEPf27w5jbWRjm5yASspO88wg3cgsznvn1cq
 d8PNrBqOJGp0CaRLGECAOSj40VmM4iZi0I1RYH9zCOzWZpE/viq+MM5BiNJ1/G/GpDxhGkLsIGv
 A+Cvy0TzPIn+/mAHSYtxPmSaESRZrHXIEgWMympYHJRUg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765959194;
 b=Mswr0aB5czdQqvWFogVZL0kt8Uh4dPPF0yfJUcOQ+jh2hzkNk39mfKK//ypztV3SeIifx9aO
 gR8InAfNOE7uSjmiy+LSPZscDu6pq5Gm+v5u7K1+984/uxeS5ofmL4JpnHddWjuJlzK8+ghmN+N
 lWXYLJiJsGW1nc2Z29p8Iix18yA/HhWwgbE3d95qcT6dYwqu4PgREn0GVnV1sFEpfZs6eXkYk7N
 cfN64Pfv5kGosCU0KN/gyZP2m9qnUzrmtwWkdHixBFuGuaSNrLdHKXddhjldroJYOHYT4PJxIiQ
 x8DBWBjtYQeMRJtuxf+wPy1sxzouRclx8lhyTFkPPPV7Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Wed, 17 Dec 2025 09:13:14 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 135C5220D78;
	Wed, 17 Dec 2025 09:13:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] phy: freescale: imx8qm-hsio: provide regmap names
Date: Wed, 17 Dec 2025 09:13:02 +0100
Message-ID: <20251217081303.1181922-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4dWRPY5DcFz4MJtD
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:d01e9fb050804b371cf9e7666b08d8ae
X-cloud-security:scantime:2.392
DKIM-Signature: a=rsa-sha256;
 bh=gBojcA9uKcuTxPzbTmt63WipEC3ONCXYd+7KHmpSJsI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765959193; v=1;
 b=OoacMUnBykQiiuLihjFA/L8woz51JxFKJhnP0HZrRH9X+V1BDEnXicS7a0toW5iVUxuvfapi
 3RBys/NbNaqJH49h8ckhQlIwa9B6d3y6iEerttRZLFlqiv4J1NkO+lDq0zpNVahaa2+OEqjTqyA
 tWKsQ16ErtVYunJl+AUYcDLAacXcZsoXky5gPHQ/7rkwoPepip2ATSa3/io0nNys2BVVClPwOkl
 pYZBKnlRZqVFTJPmackILZWKmpFW598Y+2g+GHs4FDNmPBa3SGu4xz7Uq8XLYdMj3hhvs7KbKhn
 RJj7XI2T/so2JD0OPk2Q+8pDW+ylqsZoH63ImpE71OB5Q==

This driver uses multiple regmaps, which will causes name conflicts
in debugfs like:
  debugfs: '5f1a0000.phy' already exists in 'regmap'
Fix this by using a dedicated regmap config for each resource, each
having a dedicated regmap name.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 23 +++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
index 977d21d753a59..0a0e10792dff4 100644
--- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
+++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
@@ -107,7 +107,22 @@ static const char * const lan2_pcieb_clks[] = {"apb_pclk2", "pclk2", "ctl1_crr",
 static const char * const lan2_sata_clks[] = {"pclk2", "epcs_tx", "epcs_rx",
 					      "phy1_crr", "misc_crr"};
 
-static const struct regmap_config regmap_config = {
+static const struct regmap_config regmap_phy_config = {
+	.name = "phy",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static const struct regmap_config regmap_ctrl_config = {
+	.name = "ctrl",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+static const struct regmap_config regmap_misc_config = {
+	.name = "misc",
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
@@ -562,19 +577,19 @@ static int imx_hsio_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->base);
 
 	off = devm_platform_ioremap_resource_byname(pdev, "phy");
-	priv->phy = devm_regmap_init_mmio(dev, off, &regmap_config);
+	priv->phy = devm_regmap_init_mmio(dev, off, &regmap_phy_config);
 	if (IS_ERR(priv->phy))
 		return dev_err_probe(dev, PTR_ERR(priv->phy),
 				     "unable to find phy csr registers\n");
 
 	off = devm_platform_ioremap_resource_byname(pdev, "ctrl");
-	priv->ctrl = devm_regmap_init_mmio(dev, off, &regmap_config);
+	priv->ctrl = devm_regmap_init_mmio(dev, off, &regmap_ctrl_config);
 	if (IS_ERR(priv->ctrl))
 		return dev_err_probe(dev, PTR_ERR(priv->ctrl),
 				     "unable to find ctrl csr registers\n");
 
 	off = devm_platform_ioremap_resource_byname(pdev, "misc");
-	priv->misc = devm_regmap_init_mmio(dev, off, &regmap_config);
+	priv->misc = devm_regmap_init_mmio(dev, off, &regmap_misc_config);
 	if (IS_ERR(priv->misc))
 		return dev_err_probe(dev, PTR_ERR(priv->misc),
 				     "unable to find misc csr registers\n");
-- 
2.43.0

