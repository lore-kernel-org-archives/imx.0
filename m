Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251BE4C79
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 02:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721009549; cv=none; b=AoKc07NZZ2AVSQhVdv37U4DAl2IgiyltCIyWytDfVRYpXNkqyXQGre/2kEfaYpSrE0c2cTuXkeFP3yfXStwL9TnecEG5voPY7MjvJyAICp1V/ome3AyBAODiwzhXDgGo/BCmmWlAbiSGiLFtGrwyuFZFTTTl1pRPZnKXhUcOLl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721009549; c=relaxed/simple;
	bh=Tt99vW0yPGRlG70EaM0HA3UHhbwRYeYBF2lX+BqlYa8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=EA7YPM7//tpKOSo1BoSHCjM0E6BwsjABAuz78dndxjOvE/l6VDi247Da5ateYHy2Rs+iA+xBPPoGrq84k2Xn02fG129jQsp9q4T7zo+0HFIRJOz1LcvwnliyDsDESqnVYHgEgz+zYgRId86/aEwEi7OTuH1aQjQJDcevK8l+bps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4C5A32003A9;
	Mon, 15 Jul 2024 04:12:21 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 10C87200121;
	Mon, 15 Jul 2024 04:12:21 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 15BD4180222B;
	Mon, 15 Jul 2024 10:12:19 +0800 (+08)
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
	stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v2 1/4] dt-bindings: ata: Add i.MX8QM AHCI compatible string
Date: Mon, 15 Jul 2024 09:53:53 +0800
Message-Id: <1721008436-24288-2-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1721008436-24288-1-git-send-email-hongxing.zhu@nxp.com>
References: <1721008436-24288-1-git-send-email-hongxing.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Add i.MX8QM AHCI "fsl,imx8qm-ahci" compatible strings.

i.MX8QM AHCI SATA doesn't require AHB clock rate to set the vendor
specified TIMER1MS register. ahb clock is not required by i.MX8QM AHCI.

Update the description of clocks in the dt-binding accordingly.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/ata/imx-sata.yaml     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/ata/imx-sata.yaml b/Documentation/devicetree/bindings/ata/imx-sata.yaml
index 68ffb97ddc9b2..f4eb3550a0960 100644
--- a/Documentation/devicetree/bindings/ata/imx-sata.yaml
+++ b/Documentation/devicetree/bindings/ata/imx-sata.yaml
@@ -19,6 +19,7 @@ properties:
       - fsl,imx53-ahci
       - fsl,imx6q-ahci
       - fsl,imx6qp-ahci
+      - fsl,imx8qm-ahci
 
   reg:
     maxItems: 1
@@ -27,12 +28,14 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: sata clock
       - description: sata reference clock
       - description: ahb clock
 
   clock-names:
+    minItems: 2
     items:
       - const: sata
       - const: sata_ref
@@ -58,6 +61,25 @@ properties:
     $ref: /schemas/types.yaml#/definitions/flag
     description: if present, disable spread-spectrum clocking on the SATA link.
 
+  phys:
+    items:
+      - description: phandle to SATA PHY.
+          Since "REXT" pin is only present for first lane of i.MX8QM PHY, it's
+          calibration result will be stored, passed through second lane, and
+          shared with all three lanes PHY. The first two lanes PHY are used as
+          calibration PHYs, although only the third lane PHY is used by SATA.
+      - description: phandle to the first lane PHY of i.MX8QM.
+      - description: phandle to the second lane PHY of i.MX8QM.
+
+  phy-names:
+    items:
+      - const: sata-phy
+      - const: cali-phy0
+      - const: cali-phy1
+
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -65,6 +87,31 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx53-ahci
+              - fsl,imx6q-ahci
+              - fsl,imx6qp-ahci
+    then:
+      properties:
+        clock-names:
+          minItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qm-ahci
+    then:
+      properties:
+        clock-names:
+          minItems: 2
+
 additionalProperties: false
 
 examples:
-- 
2.37.1

