Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F17B13C9C4
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 10:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719483044; cv=none; b=cHlzmIpPEXbZ9L1gaPcl2Ff9tM4U4FDbW2Sp6kASP8Q0kyU9/S3NnulITavGDnHo70RbaI1ixke0bsqst75xmUZDCmPsN7zYhbYA8hLeMLNH2KEaNeEMje1kdfFSvVJldbjA9n9lid8LtczCOriFZkn/DmRlRRaA2ZVTyYqo544=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719483044; c=relaxed/simple;
	bh=u1jXzy6eJUUrBURLV54AXqkx4za7RrQWtNms2ROxIdw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=ne57TpyCERMAhDJURH6qs9DLsJOUhxN2dVhWaDz5R8guxU/LCcDh/Zukc62uVC5SsyZtcO58xiYzRX2n535qfEQ8LmRfL4YC915aJ2A3qwa030xRi+AbX8R7BHMvShJjAtRUvSpwg9svmJ2lDyqyAnRLDysGkc3eGoRhfyJ9Dlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F1555201934;
	Thu, 27 Jun 2024 12:10:33 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C3135201924;
	Thu, 27 Jun 2024 12:10:33 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E9A03180222C;
	Thu, 27 Jun 2024 18:10:31 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] ASoC: dt-bindings: fsl,xcvr: Adjust the number of interrupts
Date: Thu, 27 Jun 2024 17:52:59 +0800
Message-Id: <1719481981-4069-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1719481981-4069-1-git-send-email-shengjiu.wang@nxp.com>
References: <1719481981-4069-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

On i.MX8MP, there are 3 interrupts, the third interrupt is
SPDIF wakeup interrupt from PHY

Add ref: dai-common.yaml for #sound-dai-cells is needed and
XCVR is a DAI device.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
index 197ae8ba9c30..5e2801014221 100644
--- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
@@ -42,6 +42,7 @@ properties:
     items:
       - description: WAKEUPMIX Audio XCVR Interrupt 1
       - description: WAKEUPMIX Audio XCVR Interrupt 2
+      - description: SPDIF wakeup interrupt from PHY
     minItems: 1
 
   clocks:
@@ -88,6 +89,7 @@ required:
   - dma-names
 
 allOf:
+  - $ref: dai-common.yaml#
   - if:
       properties:
         compatible:
@@ -112,7 +114,8 @@ allOf:
     else:
       properties:
         interrupts:
-          maxItems: 1
+          minItems: 3
+          maxItems: 3
 
   - if:
       properties:
@@ -128,7 +131,7 @@ allOf:
         clock-names:
           maxItems: 4
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -143,7 +146,9 @@ examples:
                  <0x30cc0c00 0x080>,
                  <0x30cc0e00 0x080>;
            reg-names = "ram", "regs", "rxfifo", "txfifo";
-           interrupts = <0x0 128 IRQ_TYPE_LEVEL_HIGH>;
+           interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+                        <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
            clocks = <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_IPG>,
                     <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_PHY>,
                     <&audiomix_clk IMX8MP_CLK_AUDIOMIX_SPBA2_ROOT>,
-- 
2.34.1

