Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B133A4ADD
	for <imx@lists.linux.dev>; Wed, 14 Jan 2026 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768409437; cv=none; b=l71v9H0+D2PX8L68MKrCfEsuvvRe01FcqOaJ3Uzvd/OAT3LfV7GkT3T0qbPuQf+vgEGSfOyhbYQfGrZqWVEKYNDHiV9qo3rcDcdEw5BSEluMcPdAlQkSDeY74ACDfAtxdVTIpxVoXqIgbjI+dD54MzILEyirdCgRH+urI9EaXMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768409437; c=relaxed/simple;
	bh=/p6n/f+kcRp3kH9AImd77ASoHcShi/7jRC9Nq/AdHZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HhwStvMjDlFtBAeH0rcfBaxtJcIWA/x20JeDTintZU+T9IpsVRyxBy1jW0ouzxnO9PAU5Dp3KJSasRAMUym8SQJ5dxU9fUjRCZz+qH8Ksz6TEdvLKv6ezYdfs1hgBxVvDIDnu1sIvO7I7nNazMntwbtHVLlYBmVCLV1PBEKRwUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gmUPcwmn; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gmUPcwmn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E1B4EC1F6DB;
	Wed, 14 Jan 2026 16:50:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 682FE6074A;
	Wed, 14 Jan 2026 16:50:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0EF3910B682A0;
	Wed, 14 Jan 2026 17:50:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768409432; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=FZchd0EVjeZPDpfSc5KLMc9HueJ8+rJRI0TjdGf6xTs=;
	b=gmUPcwmnox7arbqkymc/qtB90PaAhg2we8YkoV33vJaDAMGVKGXNW90hJDwel3tDiEEtAr
	+uHLWRzLz1XDiruulPXjwsx9xm4pQg2Kd7H9RkI5rxIn1RrwuFZaMN3FKxLmLNO8u0OESD
	TNxQfePqwfX0NUA42bZUx9nQQTcGVE53LW9jQgWvxlxkfMvgPThOkS7sh5EHvH7ZZoPGC8
	5eizFw6nCyGx8GM10Mvn3h9x53w0wyY+JkUvzs0iy2RRgxbHaLt0sBu/7IpNDgKn/HKSz6
	Ilb5BYrkqTikoLh0a6wDrdgOqiLHwbiIf/Rb2/mORE6JjqkRJnsDwdwVKQ0Zdg==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 14 Jan 2026 17:50:23 +0100
Subject: [PATCH] phy: freescale: imx8qm-hsio: fix NULL pointer dereference
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-phy-fsl-imx8qm-hsio-fix-null-pointer-dereference-v1-1-730e941be464@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAE7JZ2kC/x2NwQrCMBBEf6Xs2YWk1UT8FfGg7cYspNuYaImU/
 ruLhzk8hjezQaXCVOHSbVBo5cqLKNhDB2O8y5OQJ2XoTe+MtUfM8YuhJuS5nV8zRhUwcEP5pIR
 5YXlTwYkKBY2MhM4/rDVuOAXvQWezVtz+l9fbvv8A6zmjQYIAAAA=
X-Change-ID: 20260114-phy-fsl-imx8qm-hsio-fix-null-pointer-dereference-67b110635f77
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Richard Zhu <hongxing.zhu@nxp.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

During the probe the refclk_pad pointer is set to NULL if the
'fsl,refclk-pad-mode' property is not defined in the devicetree node. But
in imx_hsio_configure_clk_pad() this pointer is unconditionally used which
could result in a NULL pointer dereference. So check the pointer before to
use it.

Fixes: 82c56b6dd24f ("phy: freescale: imx8qm-hsio: Add i.MX8QM HSIO PHY driver support")
Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/phy/freescale/phy-fsl-imx8qm-hsio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
index 977d21d753a5..279b8ac7822d 100644
--- a/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
+++ b/drivers/phy/freescale/phy-fsl-imx8qm-hsio.c
@@ -251,7 +251,7 @@ static void imx_hsio_configure_clk_pad(struct phy *phy)
 	struct imx_hsio_lane *lane = phy_get_drvdata(phy);
 	struct imx_hsio_priv *priv = lane->priv;
 
-	if (strncmp(priv->refclk_pad, "output", 6) == 0) {
+	if (priv->refclk_pad && strncmp(priv->refclk_pad, "output", 6) == 0) {
 		pll = true;
 		regmap_update_bits(priv->misc, HSIO_CTRL0,
 				   HSIO_IOB_A_0_TXOE | HSIO_IOB_A_0_M1M0_MASK,

---
base-commit: c537e12daeecaecdcd322c56a5f70659d2de7bde
change-id: 20260114-phy-fsl-imx8qm-hsio-fix-null-pointer-dereference-67b110635f77

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>

