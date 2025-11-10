Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B34B283FC8
	for <imx@lists.linux.dev>; Mon, 10 Nov 2025 17:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796022; cv=none; b=HIWjEzLn6BUD8uRg+VvQiqZOw6rDFIeWqs4cWhmPPuegTfSr1awuCM5QHie8g71VFIgGtfuG7B9g7Uu9MYYn8AwdKE13GQb6q9JSobbA9D6RWO533LF8Jndwk9pDXksBvc+ToIh8GNH7y23uLL8S7pzeugYZhdwvNdcZ0K6pk9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796022; c=relaxed/simple;
	bh=VwXqjqb0vlwdIay3FsUmamgWNpL8wpFbJjWxzHFn1II=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXx+N5AlLwjBEnVa9Xvxq8NkZ8SeITyTKqbEFsaiggvDZiomTi7AJ1xBESAXrqFiWI9sXl2+NFn7brrjgKv3WeHE4lsVxmtD9ByMT6QC/tdpSRqTZK2ghKgvYrimCQTRN3sk5sHuX9WZaruecWihqIQRi+vNlJsYCfZHqNjXtao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Siw8G9QL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Siw8G9QL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso14120865e9.3
        for <imx@lists.linux.dev>; Mon, 10 Nov 2025 09:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762796017; x=1763400817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sHMOBUaDG1Wui3cyeff4HsBqo1sgWu6v9dYZ/ORpKI=;
        b=Siw8G9QLVsqxWLW+QRx0epVzB3n+cGDcaL8/bcDyV3GKxdBzyQRPvuipvt+TmF9+99
         7sPgApvfY0USpcPWhMDqOHOPg10JR6kE47pZpRK6ZNPTvbzrY7GGRw7S97cgDCrdC5Hr
         Hh4YbTUs5fPsGjas0lBjx8II8jIXk5r7S07s2qko9JWJAZLpEXzMZ5L6bp6Fbd5JmGM8
         XavJxcBsKCdGemwZwsNjDw55uqub91pN+20aOz2W/viuj3p/XyITUyj0EwE34eqlySRg
         ygnV4ZF76T4HuXmAGxBVK+RVGWcizleYAMkx0KHUoEaPKXbfg6O2OE2lYGNzqcrVWwTE
         DaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796017; x=1763400817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7sHMOBUaDG1Wui3cyeff4HsBqo1sgWu6v9dYZ/ORpKI=;
        b=csQRtLZPfzTSO2s/WLjlQ3F0eX1x2vw3N2cTkRp4P/k+lTK/nNo3ddy/IFRvfdEPB/
         M6Kl/DL3z7HGwZNFzCYX+Pz2okeyODGQf03au7w8fXoSsSWrnipyTCNwwFExpyID8vM1
         NFi+Dnk+MpC0Dzg5Z0TNnpaPAQ7fXBU5XL78dnw4cz3H+MF4OeeG2NxREW5/tI051fa5
         v0yOGpmW2/i25rfnNJzupW4FutJRtI3yJNTIMseb+yv5imTd2reqM/zVyisAz0zHzRYV
         e0N9SRhHLhrPq7NcZRMzacBcyZ5RaKgIl1Zf32s3tSqvLHVpvWZxNOdcjkyplVURedDc
         J5FQ==
X-Forwarded-Encrypted: i=1; AJvYcCX19UaZqGwRApeNam/QED0Ie4eHYpERO5VmEvfKv/nB5Z5AggHSHVIQzuQ6yyulm3oFybc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzP7YWhAFVXUTYRzHoymWo+VRH5NDqZZ3UUOBu7ZRpqwcM1HrZQ
	/ZAyidN7F3iTYlU3LytTIL8tlHbmemrytjm7cZMpo95SYDJIqOLMtrxK2dBCE9qWXTE=
X-Gm-Gg: ASbGncto//QL3MmQtlxxgRzQ6s3h9dqgLhA4K6GPuXEK19RZnIJzbrN3NZXtEe7PFBH
	4K+HkXtxQusG2a7mCO7rw5vMMfDmviDiUk6DxmVC1yYTgBtMaN2rtAe7my+O89P3Xsm0paoNdjG
	ztldPndh3/w1Lt8Fss4cRyAw47bWsRTCZxxql/+ivvhcbflb7xwbJr1BiM2ZGd2zMWWUeILr5xG
	3UW5UCCbNsk/NKmoUIcSMtU5ACl95ZRspy2uSCJmG9tMHLpWDjSzeGHZXcSpij8W9+BurdtxcR2
	B7qYSYy/0pC9OZF8DCxna2vol44wlutuDEVVrkeGDv8+R/VHkJUNG0c5oMC89eROCovsKqjAV4a
	9zSekSny/DLkAwEmPMcJTGziMq8otR7diuhHe5LMP8wD1Sxt5qAV7rGeaVGB1GOJTRvYiVoL2UH
	v/iN/7I3Yz
X-Google-Smtp-Source: AGHT+IFFes5RpqIkwRV81cjLZLjmcQ90Ib1gecuHLTiUtJRRieBtbR+NqpbH88IgcfUI1Bw2hVKcTw==
X-Received: by 2002:a05:600c:474c:b0:475:da13:256b with SMTP id 5b1f17b1804b1-4777329777amr79682445e9.38.1762796017253;
        Mon, 10 Nov 2025 09:33:37 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:d5ec:666a:8d59:87fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47774df2d80sm140111375e9.14.2025.11.10.09.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 09:33:36 -0800 (PST)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 1/4 v4] dt-bindings: PCI: s32g: Add NXP PCIe controller
Date: Mon, 10 Nov 2025 18:33:31 +0100
Message-ID: <20251110173334.234303-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110173334.234303-1-vincent.guittot@linaro.org>
References: <20251110173334.234303-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the PCIe host controller available on the S32G platforms.

Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 .../bindings/pci/nxp,s32g-pcie.yaml           | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
new file mode 100644
index 000000000000..6077c251c2cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/nxp,s32g-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2xxx/S32G3xxx PCIe Root Complex controller
+
+maintainers:
+  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
+  - Ionut Vicovan <ionut.vicovan@nxp.com>
+
+description:
+  This PCIe controller is based on the Synopsys DesignWare PCIe IP.
+  The S32G SoC family has two PCIe controllers, which can be configured as
+  either Root Complex or Endpoint.
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,s32g2-pcie
+      - items:
+          - const: nxp,s32g3-pcie
+          - const: nxp,s32g2-pcie
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: dbi2
+      - const: atu
+      - const: dma
+      - const: ctrl
+      - const: config
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: msi
+      - const: dma
+    minItems: 1
+
+  pcie@0:
+    description:
+      Describe the S32G Root Port.
+    type: object
+    $ref: /schemas/pci/pci-pci-bridge.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+      phys:
+        maxItems: 1
+
+    required:
+      - reg
+      - phys
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - ranges
+  - pcie@0
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@40400000 {
+            compatible = "nxp,s32g3-pcie",
+                         "nxp,s32g2-pcie";
+            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
+                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
+                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
+                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
+                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
+                  <0x5f 0xffffe000 0x0 0x00002000>;   /* config space */
+            reg-names = "dbi", "dbi2", "atu", "dma", "ctrl", "config";
+            dma-coherent;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            device_type = "pci";
+            ranges =
+                     <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
+                     <0x82000000 0x0 0x00000000 0x58 0x00000000 0x0 0x80000000>,
+                     <0x82000000 0x1 0x00000000 0x59 0x00000000 0x6 0xfffe0000>;
+
+            bus-range = <0x0 0xff>;
+            interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "msi", "dma";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 2 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 3 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 4 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+
+            pcie@0 {
+                reg = <0x0 0x0 0x0 0x0 0x0>;
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+
+                device_type = "pci";
+                phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
+            };
+        };
+    };
-- 
2.43.0

