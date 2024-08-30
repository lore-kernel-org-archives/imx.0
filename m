Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F94214D2A4
	for <imx@lists.linux.dev>; Fri, 30 Aug 2024 09:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725008490; cv=none; b=bpDgyAbGI3nl6fx8gH/ejPPo4Y2O8SxnS4VJlmsXqh7ZxSEB+c7LecX5zUJ9iF4HfUntLw57k8VBsm/IV2SY3dGZ4s8x35KC0w4eVARQRFUy2hcfemS0TFqiaIgriUeuYSQZgG6P1LWJTWqnuq4q0VB5mgKOwoQvab3b9bRplW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725008490; c=relaxed/simple;
	bh=aQcccC/pwXrZ5BASCm+J8C0zEShLh8Jf8cfyHqH0B70=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YeG+I+f2OKkm/kKg9XsIWk5brfi7fF6lCdK1dLRYfNxUOzG9LCIRWJcD1yqTad8uScqUnd99Do/S5Ys3MknvoexTLQRH/Vws+c8fhlujh+P1bw3H8vhtAz7pU3m07urq3eEqfYhwybqFd+ujOrolR5NrWuOx1tcy7IjX50dhu3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=kF58sBm6; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="kF58sBm6"
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 1B3F688D74;
	Fri, 30 Aug 2024 11:01:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1725008486;
	bh=2tjNE1MMuJ9pQoQqSYZdXnlM2vXm9UQ78avNU8WXADE=;
	h=From:To:Cc:Subject:Date:From;
	b=kF58sBm6nZBKgANBt2Uw0Ov2n6bj2GklWmGx2HALoHqiy9x+GssBQRIshlYfJ6ykB
	 gDkkDQ240BxLOWfy04RdVFEXnhqNAOl9AD4966pbQ+cWUU4j7Ucga4R4xARG75LLZg
	 NRtK0jbNdgmU8aIYjiqRB58QsD1pwAL03RlzSyprLG/DjjikaTee1ddVzL+FOuBlJS
	 Uo/a0EJdwaM2pPq9hrJzz8nwDKZuXw66U6/f34GAlQj5oIx4IgJJm2BpaSD5d+DdpF
	 KDNBD0qtSBtaf9FN8bPhdgDMJIjJmbJ+CYmmyngTOsjjYAVgD6rHjonzb8JEwlz8az
	 i8pzl7BwdlY8A==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@denx.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5] ASoC: dt-bindings: Convert mxs-saif.txt to fsl,imx28-saif.yaml (imx28 saif)
Date: Fri, 30 Aug 2024 11:01:11 +0200
Message-Id: <20240830090111.3591648-1-lukma@denx.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The 'fsl,imx28-saif' compatible has already the mxs-saif.txt description.
This patch converts (and removes it) this file to fsl,imx28-saif.yaml.

Changes for the mxs-saif.txt:
- Adds 'clocks', '#clock-cells' and '#sound-dai-cells' properties
- Provide device description

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

---
Changes for v5:
- Keep 'saif0' label

Changes for v4:
- Change file name to match compatible (fsl,imx28-saif.yaml)
- Remove 'saif0' and 'saif1' labels as those are not needed in the
  example node

Changes for v3:
- Add #clock-cells property

Changes for v2:
- Remove mxs-saif.txt
- Add description with information about extensions required for this
  device's current DTS description
---
 .../bindings/sound/fsl,imx28-saif.yaml        | 82 +++++++++++++++++++
 .../devicetree/bindings/sound/mxs-saif.txt    | 41 ----------
 2 files changed, 82 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx28-saif.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mxs-saif.txt

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx28-saif.yaml b/Documentation/devicetree/bindings/sound/fsl,imx28-saif.yaml
new file mode 100644
index 000000000000..4f55288e11e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,imx28-saif.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,imx28-saif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS Serial Audio Interface (SAIF)
+
+maintainers:
+  - Lukasz Majewski <lukma@denx.de>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+description:
+  The SAIF is based on I2S module that is used to communicate with audio codecs,
+  but only with half-duplex manner (i.e. it can either transmit or receive PCM
+  audio).
+
+properties:
+  compatible:
+    const: fsl,imx28-saif
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rx-tx
+
+  "#clock-cells":
+    description: Configure the I2S device as MCLK clock provider.
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  fsl,saif-master:
+    description: Indicate that saif is a slave and its phandle points to master
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - interrupts
+  - dmas
+  - dma-names
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    saif0: saif@80042000 {
+        compatible = "fsl,imx28-saif";
+        reg = <0x80042000 2000>;
+        #sound-dai-cells = <0>;
+        interrupts = <59>;
+        dmas = <&dma_apbx 4>;
+        dma-names = "rx-tx";
+        #clock-cells = <0>;
+        clocks = <&clks 53>;
+    };
+    saif@80046000 {
+        compatible = "fsl,imx28-saif";
+        reg = <0x80046000 2000>;
+        #sound-dai-cells = <0>;
+        interrupts = <58>;
+        dmas = <&dma_apbx 5>;
+        dma-names = "rx-tx";
+        clocks = <&clks 53>;
+        fsl,saif-master = <&saif0>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/mxs-saif.txt b/Documentation/devicetree/bindings/sound/mxs-saif.txt
deleted file mode 100644
index 7ba07a118e37..000000000000
--- a/Documentation/devicetree/bindings/sound/mxs-saif.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-* Freescale MXS Serial Audio Interface (SAIF)
-
-Required properties:
-- compatible: Should be "fsl,<chip>-saif"
-- reg: Should contain registers location and length
-- interrupts: Should contain ERROR interrupt number
-- dmas: DMA specifier, consisting of a phandle to DMA controller node
-  and SAIF DMA channel ID.
-  Refer to dma.txt and fsl-mxs-dma.txt for details.
-- dma-names: Must be "rx-tx".
-
-Optional properties:
-- fsl,saif-master: phandle to the master SAIF.  It's only required for
-  the slave SAIF.
-
-Note: Each SAIF controller should have an alias correctly numbered
-in "aliases" node.
-
-Example:
-
-aliases {
-	saif0 = &saif0;
-	saif1 = &saif1;
-};
-
-saif0: saif@80042000 {
-	compatible = "fsl,imx28-saif";
-	reg = <0x80042000 2000>;
-	interrupts = <59>;
-	dmas = <&dma_apbx 4>;
-	dma-names = "rx-tx";
-};
-
-saif1: saif@80046000 {
-	compatible = "fsl,imx28-saif";
-	reg = <0x80046000 2000>;
-	interrupts = <58>;
-	dmas = <&dma_apbx 5>;
-	dma-names = "rx-tx";
-	fsl,saif-master = <&saif0>;
-};
-- 
2.39.2

