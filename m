Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E35F3A254F
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 13:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803694; cv=none; b=d7BOv0Go9x0TYnQcpJ8wIlt57wn0f9IeZguwlJv9yQkpF7GsGnQRj/eacw6CuLfy3L3mTJK7vryAeEXL2FXdVNGxOyMuwIo12uOORPuji82fT2RPoGnRwmXZt6PN58EN4QhBmNGP7swzkxGP87pth9nX4BuQbPqw8ICkv612FA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803694; c=relaxed/simple;
	bh=DrUlgsCcuIzne0wmXxYAn68dCYFpp2rPkNSax62ZhRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rvcNFR5kKTuhcQCH3I/La+1MU7BJTRXQk4VYWrYrCtH+OFxDxnuswzwbeBjUp7EcZkR8qbRCfuIVvwUbbCL/zlttolbUlbaxMnIxPilITnR7jSg9FMujbuBRJoU+fEQW35/aLimMjHGJOJqh5Imh6JJAzOjt/+xW0PQOsLVCjUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 800BA1A0112;
	Fri,  6 Mar 2026 14:28:06 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5FB421A0110;
	Fri,  6 Mar 2026 14:28:06 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id E770020270;
	Fri,  6 Mar 2026 14:28:04 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Fri, 06 Mar 2026 15:27:20 +0200
Subject: [PATCH v2 3/9] dt-bindings: npu: Add NXP Neutron
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-neutron-v2-3-3019bd8c91ef@nxp.com>
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772803681; l=3102;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=DrUlgsCcuIzne0wmXxYAn68dCYFpp2rPkNSax62ZhRQ=;
 b=BO70YCNryjAZnV+gMp/78Lh52PzsT2aSmzOg3CR0pE7xWnE2r5xWyrPJ02ulSQuaY9obCoOLt
 CO2BIfczV6/D+WT66IWwKh51zmsZ40KkvlaFjRc0g5/6GkIKHWye+rd
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP

Add the bindings for Neutron, a Neural Processing Unit from NXP.

Signed-off-by: Jiwei Fu <jiwei.fu@nxp.com>
Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
v2:
- clock fixes: add description, rename, make clocks mandatory
- rename node from neutron to npu
- fix indentation
---
 .../devicetree/bindings/npu/nxp,imx95-neutron.yaml | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml b/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml
new file mode 100644
index 000000000000..a06de4bc3f0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/npu/nxp,imx95-neutron.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/npu/nxp,imx95-neutron.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Neutron NPU
+
+maintainers:
+  - Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
+  - Jiwei Fu <jiwei.fu@nxp.com>
+
+description:
+  Neutron is an NPU from NXP targeting edge AI inference applications.
+  Initially supported on i.MX95 SoCs.
+
+properties:
+  compatible:
+    enum:
+      - nxp,imx95-neutron
+
+  reg:
+    items:
+      - description: Register space
+      - description: Instruction area of the TCM space
+      - description: Data area of the TCM space
+
+  reg-names:
+    items:
+      - const: regs
+      - const: itcm
+      - const: dtcm
+
+  memory-region:
+    description:
+      Phandle referencing a "shared-dma-pool" to be used for Neutron
+      inference buffers, which need to be 1MB aligned.
+
+      The memory region must be defined with alignment of 1MB and size
+      should be large enough to accommodate the targeted ML models. It
+      should be marked as reusable.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Core clock
+      - description: APB bus clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: apb
+
+  iommus:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - memory-region
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    bus {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      npu@4ab00000 {
+        compatible = "nxp,imx95-neutron";
+        reg = <0x0 0x4ab00000 0x0 0x00000400>,
+              <0x0 0x4AB10000 0x0 0x00010000>,
+              <0x0 0x4AB08000 0x0 0x00008000>;
+        reg-names = "regs", "itcm", "dtcm";
+        memory-region = <&neutron_pool>;
+        interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&scmi_clk 68>, <&scmi_clk 67>;
+        clock-names = "core", "apb";
+        power-domains = <&scmi_devpd 20>;
+      };
+    };
+...

-- 
2.34.1

