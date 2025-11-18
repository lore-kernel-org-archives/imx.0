Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392CA36B065
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 16:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763481776; cv=none; b=c0Vxcpbp5W/R9KqVAZYJZdSUqSGTFKiKrtYSL2DN/M+VrZo1mTV0qsHE087gsB3CiXbkkx2xDecKpynl+GOPZvwD6y4UbPhtO7bQQcgv4usCt/BG8BR+0uh0FH6kyeIl6jgVpuQi8Yuyi9KdE5WFN9LaPtQ1Vsmb865yoKi7wsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763481776; c=relaxed/simple;
	bh=jYvQElvsgNDRjssWl/7N9i2M5c/4dLl+Leh5yhSj/xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwXj0pMLe5FHzX3fAnqqoeISmpYW+IrcIxyKNUh9PTIEsrT6AHeScpNjk3SepBXw4PsjvAShegirvhycTiElBvc1IdIff/FLHgfK9ABP0lnAY79aCqLLDN08cBplBJ4ZG2cpv+MY/JeZihv4dulvy2lv7AvUjpgVaT3t+NpY9GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YNkp3IpI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YNkp3IpI"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477770019e4so60776945e9.3
        for <imx@lists.linux.dev>; Tue, 18 Nov 2025 08:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763481772; x=1764086572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8rPc1Q7Ab5RULv9WRwCkjVSvPd0FRyIZ5xigzgSXKw=;
        b=YNkp3IpIlcM18zjiEDTODh461aqWOhgMldYePEunNWADmvTlpOfVhPhVGhWCaN9WzD
         qG621J3kmj2o2axc6nHGBw+nwFfcrelfhshMoCLWPDJtbYCm7flhYUHoy3NeJ5agdpyE
         bY9J4vqoDB8okmCR0I5OJJzDk1PtzeESpLR+8g1sPJkEy9iqZS+lrz/pdGPmeZ5THxVk
         r+hW1PbxWvyMT1oLrcqZE3blVpDKHBiWH6BPa5sLXUXlBAECC/IZFtX5JqhAzCKOVs0/
         XSO16z3XBIHszoG/Iefm3RwF6iCDEKRGh9wTFlOrfegklRAScjC78gfjawr91Hka3bfH
         37Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763481772; x=1764086572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p8rPc1Q7Ab5RULv9WRwCkjVSvPd0FRyIZ5xigzgSXKw=;
        b=FHlOccVZZakvsKCJUrPU9LwbLxM9xf/OZLoFGyjFtDDDI8+8yjwpaCWQ08x+0yAIHj
         gH1QSeLoFP9Ebp7YoOwGem/0LdNAHjcVCgTuPfcTTj2Slw4LV+/fdIkeLoeANv529a01
         n3Wr/baGxiiWFR04nD0JYRMvFEOKL+PfCpsYumxRMx5wzads2jou7MmlBxybYLjDQclM
         Wl6KhdIGjziDI1wFG+Afsh+xdArzLhi9rkJk7YToGfVP4xS2vkKHzCFfJyHpFQzm1myh
         1epvMmU6HmoB3GQgLnMT+/a4FfkHc26qy5eNxctwtreS8fz2JDHUn8FcBNMXefUuXX1V
         Vm/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAlTGfeCE7LEMR2SP/Xoi2awuoaTDsmZhFDNieT4HBygfEVWmbWtB01jD1xMI8MtTU0ZE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrQNczEL6zmm2eIrGN3RBAy/RlV6dP+rfnog43iGKMa/ebFTRe
	WsbKTfjxNiOD2PnFNhC8InHnv0+f6lYra1ORWcRm/221EsvdKL1iD+CaPiKW7+iPb+c=
X-Gm-Gg: ASbGncsJAO44M4gCJpHMHZm1aa+U7x3HlLiDDiQuGefOOJbWkNH1lsJsiNN6VytpTBW
	Y3Dn9DncAtSa1CXW1PJZMLXlaxUDeuy59lqfsGOunB5hvEDSRDcEvLKeZha/y41lvlfvczLe/DJ
	2husYPR2enPJPmjGhu7R7ibWaR1ETovfPka9Kpogt+s6r+j82LHIn3eQRH51Uk9GRrQXNCpTDP3
	P6aMwhTpd/4I4XnlRwGp6N/MATtLLJyplrqycdTWJXCZU1jJQr8+P6JrVFnAzvoU2+2AjzA/D9C
	2u1gcKrvN54Jv//+4RWoRayDa0XQBXVjGg5vKG2u4UzgBVGOpHedtAE6pdv0tGdMhFAqyAbAFqA
	v6LwQoDaVp/N4g6qkqrQR5RDBWk3+uqJD37hvdt9FlFsDwHuA18Sq+xjmUzhZme7HqTS/6FRSxC
	6viMVzOBeMOzGtBpx3y3SEPrO8zjUkAg==
X-Google-Smtp-Source: AGHT+IGyFoEL3zw1qZUaHUanPoDmy73Ha3AJCkV4FBXZ7E2g6BEcYZMSw2TPVNtzaY+tvbRM02dGsQ==
X-Received: by 2002:a05:600c:3593:b0:477:557b:6917 with SMTP id 5b1f17b1804b1-4778fe4fdecmr170047065e9.18.1763481772373;
        Tue, 18 Nov 2025 08:02:52 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:76db:cf5c:2806:ec0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779fc42f25sm171954575e9.6.2025.11.18.08.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:02:48 -0800 (PST)
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
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 1/4 v5] dt-bindings: PCI: s32g: Add NXP PCIe controller
Date: Tue, 18 Nov 2025 17:02:35 +0100
Message-ID: <20251118160238.26265-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118160238.26265-1-vincent.guittot@linaro.org>
References: <20251118160238.26265-1-vincent.guittot@linaro.org>
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
index 000000000000..da3106dfcf58
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
+    minItems: 1
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
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
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
+            compatible = "nxp,s32g3-pcie", "nxp,s32g2-pcie";
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

