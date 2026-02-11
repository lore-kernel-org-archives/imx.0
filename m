Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE02314A0BC
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770821419; cv=pass; b=TcW3Rs3AT76DwXhH+bJaD+8gcDJp1xd5QfI1TpYLYWbWJ0+DGuUP7ASuLFOvR9Mr/1oZOTvRliC4QWAt7nmrOu7zGKU6JWDdLtIOeoChrRrEh8FWiNTXhWUgqIICI//HnUdgqSN9xoSf7UWSIXo/Z4X4GD9QGRmyfjOERt2o7DE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770821419; c=relaxed/simple;
	bh=1zHeRjedKdVb8wZrGIaAKcPQD6CWmS55GcNwHY0NYXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uiBII7LdNlr5zKyRJK26SYMPJPPidC5tNPlLmKmf2z8cIvo80cRbtHttwDZET/xg0gp9XmJl48+rdk+Ufmwb5qp9k4vu89oIScQ4X3rCXVObEb/veG2jX3LYfvKPB73T/axU/gC0zdYm6c6MJpz2tbOMTRnfb4t/Gqdl3/JtxMg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=FFo3GX14; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="FFo3GX14"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=L4vyNH4YErLs5bwpzmTX4TQ2ymTibM6HD0Mohhb6Gt4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770821401;
 b=ecgIT+zKu53zOyhmRFmGFb7Kcr4GLlD7RLvT+SzhkAJmDD17kfMKyd8ii/Mj6Dz0nOiTlAIi
 viLthfqD1QFovFfwCUmGrgYpKRxI2eVfn+f8l38zsG5mpCjcZ8ET65oRqz2JKqtfYLVLLbtIyxd
 zqgxXW5QO+EbxmUYlw4AKcbe9SMNlyGzLv7sQ5jTB0xWbxfsc1ILnO69qt/+Jq7cT/Ydyv+vY7+
 v6HXbo5nhi9ORiu5aUdA1j8nJlpFnYEiJfFx9bVqushXHq9BYyYUGzPNhpXZqdtjF1TuFzb/4Pi
 9JWVKsHuAgeGdpRu1Yso7ZO2314VJrZ4aTEOQhPb50Ovw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770821401;
 b=gfS9FclybIYms74Y0VUqACapkvQqlNKQa+p4gzWOYA6oUs49ZlJ+AB30WzekjyRW63P1aacq
 8pXIOQQRYOX+HFl1EAIS8J6XPQjk71FecwTLNBQ2UzoqCym0ESD3dZMy+xJVOUuj6OwqG/5w/KJ
 UN84VhfkktSp2Tb4hW+8wElYg2XbYnMQJhJXP1/hUJavw8h35fdZOAoTH2HV6MgW6k3wAaHz0Wf
 pAVQPs3iRLxxhfPMjCN1svs6KtKYCa195mYJ9uv0jaSflfZuotY8efzZ7wIMU3IhxPX5e9yWUUN
 Z3lwnU4+iT+f2f3JFP4ySxddAWHTuBm5NtCLmYgl9dk5A==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Wed, 11 Feb 2026 15:50:01 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 0CCCC5A12E8;
	Wed, 11 Feb 2026 15:49:51 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND 1/1] phy: freescale: imx8qm-hsio: provide regmap names
Date: Wed, 11 Feb 2026 15:49:48 +0100
Message-ID: <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4fB1YW4rTYz2nJGn
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ba1eb0984800e64e2245420c91fb4aab
X-cloud-security:scantime:2.114
DKIM-Signature: a=rsa-sha256;
 bh=L4vyNH4YErLs5bwpzmTX4TQ2ymTibM6HD0Mohhb6Gt4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770821400; v=1;
 b=FFo3GX142D3AJq77nQDuUY6TZNSBanvsGDM84dknkYWT40jrSfj82TdtKvdzlR4/MZFP+IWl
 DTxjMTyjO7ZT0JL2bLb/9QbggaNzyafQ5ajmiZ2VzCuBoW7xou/SDAr1jy/lFW6Plo8NPxRLnRt
 ThKm59bZcPVNoofGoU4WJlzNthObrpgGFngyncUVp4MHT3FsGkDikdCfHDXwxHWgo4kxDQeHXa5
 DtK/sXIN5IvEF7XDV5RVbr4RImgVDWISrU5aWDFGyXD+B7cEtdFt6ql0VCha0lQbbqF8yk5WIBa
 aGKuNGFrahocHrvwUFgS85sYPYhXB2zwPGhnlrG3LH/qg==

This driver uses multiple regmaps, which will causes name conflicts
in debugfs like:
  debugfs: '5f1a0000.phy' already exists in 'regmap'
Fix this by using a dedicated regmap config for each resource, each
having a dedicated regmap name.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Same as the one sent in December but with an updated CC list.

 drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 23 +++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
index 279b8ac7822df..4ab45c9f53dff 100644
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

