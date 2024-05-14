Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4034155C1A
	for <imx@lists.linux.dev>; Tue, 14 May 2024 09:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715680384; cv=none; b=jhyR1RsOgmJBvk6/d9xaTwW7NEQVi1XT4IdD99r3XDUKUEv1jjVpic/mqAOkiO39A0c8+oP7tM1I50QbzSePMbPdYqKrBEiSIlqifjLs2Ff6YVdT2p71pTZLHvHxkwskEEA3hmBP9F70tGV9mwkYJpqV+4vaSeehLA3PCXq8+K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715680384; c=relaxed/simple;
	bh=BpkOooU1s4m3CWExxo5Bz93jiYM7/cI8NedWu2YZ93I=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=P1Szi7MMXXYrZXczFRBBW2HlNsGPRLE4mXk96scAVF+PMGpUjvy4swjtX778L+cKSmDuo5K/XmKinyBSfeU4U2tEINwJquhaIke/dCCD63Pm8n9bk+vUnLZYYyj0qAVjI+KNOV7Byr1OMxRW07w3ZQTsRVYTW+OPyRTVbaHs6nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 220B5200938;
	Tue, 14 May 2024 11:52:57 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CD4C42005E2;
	Tue, 14 May 2024 11:52:56 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 87D931820F77;
	Tue, 14 May 2024 17:52:54 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	shengjiu.wang@gmail.com
Subject: [PATCH v3 1/6] dt-bindings: reset: fsl,imx8mp-audiomix-reset: add bindings
Date: Tue, 14 May 2024 17:33:25 +0800
Message-Id: <1715679210-9588-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1715679210-9588-1-git-send-email-shengjiu.wang@nxp.com>
References: <1715679210-9588-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

The Audio Block Control contains clock distribution and gating
controls, as well as reset handling to several of the AUDIOMIX
peripherals. Especially the reset controls for Enhanced Audio
Return Channel (EARC) PHY and Controller.

Add DT-Schema bindings for the reset function in i.MX8MP audiomix
block controller.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../reset/fsl,imx8mp-audiomix-reset.yaml      | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/fsl,imx8mp-audiomix-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/fsl,imx8mp-audiomix-reset.yaml b/Documentation/devicetree/bindings/reset/fsl,imx8mp-audiomix-reset.yaml
new file mode 100644
index 000000000000..71a10646ab2b
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/fsl,imx8mp-audiomix-reset.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2024 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/fsl,imx8mp-audiomix-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8MP AudioMix reset controller
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@nxp.com>
+
+description: The reset controller node must be a sub-node of the i.MX8MP
+  AudioMix Block Control node
+
+properties:
+  $nodename:
+    const: reset-controller
+
+  compatible:
+    const: fsl,imx8mp-audiomix-reset
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller {
+        compatible = "fsl,imx8mp-audiomix-reset";
+        #reset-cells = <1>;
+    };
-- 
2.34.1

