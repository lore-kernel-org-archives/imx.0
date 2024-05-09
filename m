Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA308149C7D
	for <imx@lists.linux.dev>; Thu,  9 May 2024 06:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715235355; cv=none; b=Ixr6TPCBFZhtPIXxDytIqmhkkaJwTWhp1QuBmxdAvd0l9YKESdW1h16gIEIou8OiCjG6JMTrw5hnugpqeQMRiK7Vb7SU8OzGxR1Wwsv5yUge0KBMLgnld5G4zbgzevm+eWp2J5ncHRWJnvO0b5S0G/sVrNkNU0hyRQp3CUWNylM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715235355; c=relaxed/simple;
	bh=ThKVGa3d/Z0vLgTeLU9vkg+jHMgQCwzahfmHqGQoftw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=eITjOJySHcGKiiTI4HK2/etLp0q+NLvkSmxkC7Bf7YaxhuMmIoUYXOtHDzS/mAssgNFSc5gzSvMWmsnrY8zpEDZwn/+yIelXVEKYcSEZUNF9hFaDR6okVKC65A0vmD1gvcXwxcn/HG3klDJeqSUciqMwfeEBijby5rpGENGb8dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 52E981A1F47;
	Thu,  9 May 2024 08:15:41 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 090291A1F45;
	Thu,  9 May 2024 08:15:41 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 111D4183486A;
	Thu,  9 May 2024 14:15:39 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: conor@kernel.org,
	vkoul@kernel.org,
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
Subject: [PATCH v4 1/3] dt-bindings: phy: phy-imx8-pcie: Add header file for i.MX8Q HSIO SerDes PHY
Date: Thu,  9 May 2024 13:56:19 +0800
Message-Id: <1715234181-672-2-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1715234181-672-1-git-send-email-hongxing.zhu@nxp.com>
References: <1715234181-672-1-git-send-email-hongxing.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Add lane index and HSIO configuration definitions of the i.MX8Q HSIO
SerDes PHY into header file.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 include/dt-bindings/phy/phy-imx8-pcie.h | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/dt-bindings/phy/phy-imx8-pcie.h b/include/dt-bindings/phy/phy-imx8-pcie.h
index 8bbe2d6538d8..8f65a77fca09 100644
--- a/include/dt-bindings/phy/phy-imx8-pcie.h
+++ b/include/dt-bindings/phy/phy-imx8-pcie.h
@@ -11,4 +11,33 @@
 #define IMX8_PCIE_REFCLK_PAD_INPUT	1
 #define IMX8_PCIE_REFCLK_PAD_OUTPUT	2
 
+/*
+ * Regarding the design of i.MX8QM HSIO subsystem, HSIO module can be
+ * confiured as following three use cases.
+ *
+ * Define different configurations refer to the use cases, since it is
+ * mandatory required in the initialization.
+ *
+ * On i.MX8QXP, HSIO module only has PCIEB and one lane PHY.
+ * Define "IMX8Q_HSIO_CFG_PCIEB" for i.MX8QXP platforms.
+ *
+ * +----------------------------------------------------+----------+
+ * |                               | i.MX8QM            | i.MX8QXP |
+ * |-------------------------------|--------------------|----------|
+ * |                               | Lane0| Lane1| Lane2| Lane0    |
+ * |-------------------------------|------|------|------|----------|
+ * | IMX8Q_HSIO_CFG_PCIEAX2SATA    | PCIEA| PCIEA| SATA |          |
+ * |-------------------------------|------|------|------|----------|
+ * | IMX8Q_HSIO_CFG_PCIEAX2PCIEB   | PCIEA| PCIEA| PCIEB|          |
+ * |-------------------------------|------|------|------|----------|
+ * | IMX8Q_HSIO_CFG_PCIEAPCIEBSATA | PCIEA| PCIEB| SATA |          |
+ * |-------------------------------|------|------|------|----------|
+ * | IMX8Q_HSIO_CFG_PCIEB          | -    | -    | -    | PCIEB    |
+ * +----------------------------------------------------+----------+
+ */
+#define IMX8Q_HSIO_CFG_PCIEAX2SATA	0x1
+#define IMX8Q_HSIO_CFG_PCIEAX2PCIEB	0x2
+#define IMX8Q_HSIO_CFG_PCIEAPCIEBSATA	(IMX8Q_HSIO_CFG_PCIEAX2SATA | IMX8Q_HSIO_CFG_PCIEAX2PCIEB)
+#define IMX8Q_HSIO_CFG_PCIEB		IMX8Q_HSIO_CFG_PCIEAX2PCIEB
+
 #endif /* _DT_BINDINGS_IMX8_PCIE_H */
-- 
2.37.1

