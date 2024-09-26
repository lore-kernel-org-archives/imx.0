Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B9B13CAA5
	for <imx@lists.linux.dev>; Thu, 26 Sep 2024 06:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727332228; cv=none; b=MpvqU4a1NNUxt56mNWw9ZDMHw4tUBhf+tR538vMY3Z6alyqOlv+38y3JphQw6QR0dS/2q5QSDEc2RYypXzJXnDOEA0XE3+tOlHEls+WGRZlgbM7xi+jPV6vJyXdnWm3gn/7eTNTxyApGNI1czr9YHPpqbADk7eqz8tHnEWkYU6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727332228; c=relaxed/simple;
	bh=2Gr7Gyl6KSXdpmT6YixG30N6o6dzO/zBKJeg3OlbKWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=uAKzi+QRZ6ps3PC4x/KT3JbE1SnDgBhx+HxxTwwZTynlH/rqBekPqPMeUl598wz9/WaCvi1RJsreDv0acYMwR9cduc57eQ2oKBqrUA9lqx9Oy0s/Nqn05gYolbHFPkVdUc8OkF3f2icOXCuqWrqu2QCK2vdF2j4TJJunUhF4SE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 38C171A0A59;
	Thu, 26 Sep 2024 08:30:25 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F083D1A0F98;
	Thu, 26 Sep 2024 08:30:24 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B1247183F0C1;
	Thu, 26 Sep 2024 14:30:21 +0800 (+08)
From: Richard Zhu <hongxing.zhu@nxp.com>
To: l.stach@pengutronix.de,
	kwilczynski@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	frank.li@nxp.com,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	festevam@gmail.com,
	s.hauer@pengutronix.de
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: [PATCH v3 1/9] dt-bindings: imx6q-pcie: Add ref clock for i.MX95 PCIe RC
Date: Thu, 26 Sep 2024 14:07:45 +0800
Message-Id: <1727330873-17486-2-git-send-email-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1727330873-17486-1-git-send-email-hongxing.zhu@nxp.com>
References: <1727330873-17486-1-git-send-email-hongxing.zhu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Previous reference clock of i.MX95 PCIe RC is on when system boot to
kernel. But boot firmware change the behavor, it is off when boot. So it
needs be turn on when it is used. Also it needs be turn off/on when suspend
and resume.

Add one ref clock for i.MX95 PCIe RC. Increase clocks' maxItems to 5 and keep
the same restriction with other compatible string.

Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
---
 .../bindings/pci/fsl,imx6q-pcie-common.yaml   |  4 +--
 .../bindings/pci/fsl,imx6q-pcie-ep.yaml       |  1 +
 .../bindings/pci/fsl,imx6q-pcie.yaml          | 25 ++++++++++++++++---
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml
index a8b34f58f8f4..cddbe21f99f2 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml
@@ -17,11 +17,11 @@ description:
 properties:
   clocks:
     minItems: 3
-    maxItems: 4
+    maxItems: 5
 
   clock-names:
     minItems: 3
-    maxItems: 4
+    maxItems: 5
 
   num-lanes:
     const: 1
diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
index a06f75df8458..7df43e710ef3 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
@@ -101,6 +101,7 @@ allOf:
       properties:
         clocks:
           minItems: 4
+          maxItems: 4
         clock-names:
           items:
             - const: pcie
diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index 1e05c560d797..4c76cd3f98a9 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -40,10 +40,11 @@ properties:
       - description: PCIe PHY clock.
       - description: Additional required clock entry for imx6sx-pcie,
            imx6sx-pcie-ep, imx8mq-pcie, imx8mq-pcie-ep.
+      - description: PCIe reference clock.
 
   clock-names:
     minItems: 3
-    maxItems: 4
+    maxItems: 5
 
   interrupts:
     items:
@@ -127,7 +128,7 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          maxItems: 4
         clock-names:
           items:
             - const: pcie
@@ -140,11 +141,10 @@ allOf:
         compatible:
           enum:
             - fsl,imx8mq-pcie
-            - fsl,imx95-pcie
     then:
       properties:
         clocks:
-          minItems: 4
+          maxItems: 4
         clock-names:
           items:
             - const: pcie
@@ -200,6 +200,23 @@ allOf:
             - const: mstr
             - const: slv
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - fsl,imx95-pcie
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          items:
+            - const: pcie
+            - const: pcie_bus
+            - const: pcie_phy
+            - const: pcie_aux
+            - const: ref
+
 unevaluatedProperties: false
 
 examples:
-- 
2.37.1

