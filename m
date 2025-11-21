Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097E52F12C8
	for <imx@lists.linux.dev>; Fri, 21 Nov 2025 16:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763743767; cv=none; b=N50AhVSyse019y4CTmiJ8m1OA4dMy8VgjZM2zUmrrpQpEgYqpwoe6Js/MNjoo/ERGnJWT9ZSnqWRvhSoiD6aU2fXjZOpRct7FrXPaWgGwmhGEQaG1JTjNFIYlwTRa9J8EDrRZXIbi5pYmGATWxIKMrl48fuGVocWI6VXXjm0nuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763743767; c=relaxed/simple;
	bh=LwWTZn9G4hy02sLAgSOfSCz7oCKcDzwyTL4UJEUsAVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5MuCOND510VGJwjSPVmNd/SYvJYk1d63cpaQ+tvk3jS7UmQPBq8AjTvyN14gurZOB41fA03qMKVPRMgQ7TCOmraGPtLhKKgVY6PNsNIhFioL5hwYSN8FLSJHUfyhcrzOs1b5Lg1OKC/tLLYYVMdHrPbqmR0tE8sAI8McPWFduQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qRyclSoQ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qRyclSoQ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-429c7869704so1909010f8f.2
        for <imx@lists.linux.dev>; Fri, 21 Nov 2025 08:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763743763; x=1764348563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wYeT/h/1x9MvlSpVGuLkmVdHMW20C6ijQ2jijWX0wk=;
        b=qRyclSoQpZm9h2ax20d5LO9um9PyrkEjR+lTZ5xyMzqXrZo2wVNOQZDDZJK9F+Ejj4
         UdTlSLTGMA+eqKjXQqI6bMU6u0AR9k3vIeX7EYmta2aWPqftPS8/AdGFP4XkYJAM4Gyz
         xFba5Wm1zR/5b3tMQHeV1AwzW9hg8KS19p1iLiDRFGcGQPtakIfDnLEn9uGY4l4EEQnJ
         m20Q+n962uqK2CATqwVrWZFXJmcY9uQMO0B2TEJmVZmUSQqDqr4tZQ9OOodTv9SbCTX+
         pG8ObvLAqOwlyjPIRw/+On2mXplTwtFRod2MHf+qBOEXGG8+ZKkUzFFTxZo6u/+yGZ9s
         YfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763743763; x=1764348563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3wYeT/h/1x9MvlSpVGuLkmVdHMW20C6ijQ2jijWX0wk=;
        b=NgN63hSe3yq3R9zVzuxV7HyLC85sl22OV6azHT63EAf7kZ6rsRGGH7TweJbhWTu+o4
         BpxrtzU2WXnxmU07hbWec6gZJOx1axDFQrEdDgd80Cg32kCamlyv9ic7wYH90FzBwdmQ
         BQQ/wcPkbFag26+SDu6eDJuyktJ7L0XA5W0jQi1njoaZsyducy0SnoDpUPGP8WnUN/L8
         rgl9LrIeKWwAN6fdeeUGn6DNPuqGNU39ecnTWoA4xkAeUCDGmKOOIiMS3EguFuUHUyL3
         1YkZAKwZsO1I8M2fPaJLaWXWU5Iep0Ijm3e1u+2qi/4um3jHnpiCHVlvgqFt74ZBgoIN
         dThQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCXUHaC07lHjcTJRNjAC2GkZOPZorC5nkzkMq5aYjtgq7rx8oDxdLONeHM2ztziZE1oV4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWfaN5Any/fBuvnHjIH3bjedx34fmTNP7IiKmjXeV2N+igdC2l
	28v4vH6zFtJekDiEBa+HPdzPXr+Lc9ykcFkYed6grAoXQVaFrkXtIqujAxzeTsTZ6xM=
X-Gm-Gg: ASbGncvk71uHt0VxyQrh8TCC4nhwsZ9fr2Z492z2aqYFzecaHIjoKU71tamK3L8sE6W
	jziAveLIFuI6bCtV7gFphocduuihJhKtqcQx0WVz5OdV5VU+VawWF5WcSqk0DEXU0apSj+lfc5s
	Tz2/ruPlTAcOPuV5VZdoVux/oT2PP8FfPI2RbjkHJcUEZ84WANu9jcGFdcTAWCEOcSce1wrc/H+
	DksyhsxdnMfpUpAbUuPuCf62NSPIBQuNinFN5fugDWgiKQjo+WBpB0z4nYFcVElrb4193iSIqOj
	VhFiWftaeeT+UVoxAie67+AiVV43CHedyWN1PUqc+ETvHgvneG/BzJfT64YHfGZY8X5EoSlnwR4
	xAdRsDyOmRh1pHGC3x3qVs5SuTqb+rofEBWgz/r4uOMtIzQJTLoPiXNvUyspV6ryWYbDFFZNzpf
	vK2x2jrmseNjo9kyZvrqE=
X-Google-Smtp-Source: AGHT+IFTupEu7tQpaQcTp870nPjmfycov+d3eXmWpJglnNMzrHGGv2NoyhiwOnsqNMvhjJuRWF90yg==
X-Received: by 2002:a05:6000:290a:b0:429:d3e9:667 with SMTP id ffacd0b85a97d-42cc1ce47b9mr2775128f8f.18.1763743763176;
        Fri, 21 Nov 2025 08:49:23 -0800 (PST)
Received: from vingu-cube.. ([2a01:e0a:f:6020:803a:ae25:6381:a6fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb8ff3sm12938478f8f.29.2025.11.21.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:49:22 -0800 (PST)
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
Subject: [PATCH 1/4 v6] dt-bindings: PCI: s32g: Add NXP PCIe controller
Date: Fri, 21 Nov 2025 17:49:17 +0100
Message-ID: <20251121164920.2008569-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121164920.2008569-1-vincent.guittot@linaro.org>
References: <20251121164920.2008569-1-vincent.guittot@linaro.org>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/pci/nxp,s32g-pcie.yaml           | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
new file mode 100644
index 000000000000..66a050028278
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
+                     <0x01000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
+                     <0x02000000 0x0 0x00000000 0x58 0x00000000 0x0 0x80000000>,
+                     <0x02000000 0x1 0x00000000 0x59 0x00000000 0x6 0xfffe0000>;
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

