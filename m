Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500081C292
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 06:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712037739; cv=none; b=sfCYv1A3PiKGxPleJcJKeajYiDo+nes2ElUCOBWHWIQu/FRG+sjT7SWPFf3+tw8JyZVVcBuVgJx7IcD9i/1tYjvxdQSr9pmFPwlYF+OHXdUWMir12Ekjol3z6kWa6xIr5bJE4xJxoD6/KeD9//12EvR99/T0cKks9AcWeX52SiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712037739; c=relaxed/simple;
	bh=uRNKhWnzWVII8HFWbPeoAJ1s5eGvNj4lNd8CFYF5wSw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=lD3PU3NJfC81RKZigXpYR62CvybcIB4CUU/Vn0aWOdlp2crt6Iq8RY5KJsDs4zhEo8wWASV6OOTAldDDRlPOHpCUEQ3fSfC0d1lWwLeJE/XyR/h1GX8h9gVdTORQvJAJiN9+pls7SvNY8Bw8pXuRbXKea/hkdMHmWP8cXJ0fGpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C35441A19BB;
	Tue,  2 Apr 2024 08:02:16 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 798EA1A19B8;
	Tue,  2 Apr 2024 08:02:16 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 92ABE180031D;
	Tue,  2 Apr 2024 14:02:14 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	frank.li@nxp.com,
	conor+dt@kernel.org
Cc: hongxing.zhu@nxp.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev
Subject: [PATCH v2 1/3] dt-bindings: phy: phy-imx8-pcie: Add binding for i.MX8Q HSIO SerDes PHY
Date: Tue,  2 Apr 2024 13:45:02 +0800
Message-Id: <1712036704-21064-2-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1712036704-21064-1-git-send-email-hongxing.zhu@nxp.com>
References: <1712036704-21064-1-git-send-email-hongxing.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Add binding for controller ID and HSIO configuration setting of the
i.MX8Q HSIO SerDes PHY.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 include/dt-bindings/phy/phy-imx8-pcie.h | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/dt-bindings/phy/phy-imx8-pcie.h b/include/dt-bindings/phy/phy-imx8-pcie.h
index 8bbe2d6538d8..3292c8be3354 100644
--- a/include/dt-bindings/phy/phy-imx8-pcie.h
+++ b/include/dt-bindings/phy/phy-imx8-pcie.h
@@ -11,4 +11,33 @@
 #define IMX8_PCIE_REFCLK_PAD_INPUT	1
 #define IMX8_PCIE_REFCLK_PAD_OUTPUT	2
 
+/*
+ * i.MX8QM HSIO subsystem has three lane PHYs and three controllers:
+ * PCIEA(2 lanes capapble PCIe controller), PCIEB (only support one
+ * lane) and SATA.
+ *
+ * In the different use cases. PCIEA can be binded to PHY lane0, lane1
+ * or Lane0 and lane1. PCIEB can be binded to lane1 or lane2 PHY. SATA
+ * can only be binded to last lane2 PHY.
+ *
+ * Define i.MX8Q HSIO controller ID here to specify the controller
+ * binded to the PHY.
+ * Meanwhile, i.MX8QXP HSIO subsystem has one lane PHY and PCIEB(only
+ * support one lane) controller.
+ */
+#define IMX8Q_HSIO_PCIEA_ID	0
+#define IMX8Q_HSIO_PCIEB_ID	1
+#define IMX8Q_HSIO_SATA_ID	2
+
+/*
+ * On i.MX8QM, PCIEA is mandatory required if the HSIO is enabled.
+ * Define configurations beside PCIEA is enabled.
+ *
+ * On i.MX8QXP, HSIO module only has PCIEB and one lane PHY.
+ * The "IMX8Q_HSIO_CFG_PCIEB" can be used on i.MX8QXP platforms.
+ */
+#define IMX8Q_HSIO_CFG_SATA		1
+#define IMX8Q_HSIO_CFG_PCIEB		2
+#define IMX8Q_HSIO_CFG_PCIEBSATA	3
+
 #endif /* _DT_BINDINGS_IMX8_PCIE_H */
-- 
2.37.1

