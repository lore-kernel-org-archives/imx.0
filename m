Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BDB31CA72
	for <imx@lists.linux.dev>; Fri, 19 Sep 2025 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758297508; cv=none; b=jlOxcYXgZsunD5PfBHQc6+/3T3G4yl5fm9CCjF8BJGznijg9k3B+DSZN/bcrN7wEgrH7bxUZ+VZvgYgeXg9wJp+Co7TDKAmcbKjhIp0L5i/jhrXkozBOJncuMvdpY3Hwcjbj43M1n3cGlpo+Lu3b+jhVL7gDVXIZibJQhNlfibg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758297508; c=relaxed/simple;
	bh=AQJN1sqWPKdNdfpRB8nChb7U4dPNPEMlgzYPiyse1lU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u249lolX3ijlZUlXB9Wh88usdJyNuL0TGj/OMk4On1+F2GtlJV1eRW3eDBhofwF1eAd+/CK1HPdI7ZwcdcJ2M84Ya0+DCaI4fv7O+ibzPB12jpJp1T/jN0JjNhvyWn3hKDvNnfqhvjf1ekFElL3xBQgYQUzVO564f60lqUGJ5pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=at6OvzXM; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="at6OvzXM"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so989700f8f.3
        for <imx@lists.linux.dev>; Fri, 19 Sep 2025 08:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758297505; x=1758902305; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vS7mvhF1JO4dUjEbpDOATr6HeFKK48b7nTeLMm/UrOY=;
        b=at6OvzXMkpJ748AmMSzOpAjiI+se39/n2YdLKXvl4x/b7c0yVExDBYiPgxeA+lKYzD
         y6V/qE4lZYEZN8NsUSXAoW3SI5JPjWlfAM4k40eDqP/hYM33b5LXNFcSSlqKvw6v/CcR
         jk7BEbWA6Vgsz1FrfMJCvl3+K1QAMuIZSf4eSYjnloNiIkEh0P5Wq6ldaGe4AxmC5/Ez
         BPA4BSkgk4IUQVND5HEATHZMId8zG05B6PnljInYE1bv8fyV1WWyIuQhTD3VgjRMg37y
         J4p49w1JGvfY4RMPHwXv7nOeJP6az8BsJkQgeFWryUpsiHRqoKJJO4jWBgxzi+p3gIk3
         qC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758297505; x=1758902305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vS7mvhF1JO4dUjEbpDOATr6HeFKK48b7nTeLMm/UrOY=;
        b=sO7jz/62qyHQzF3F5VA/FwdvUmjgKQbGuJOBXKV3o5FsYP4PAtkElwcD3kMJGgU+s2
         fBomtvOL6rWkJmbHs/g1deD9fhgNn0NfXLXyAMpmziEctn2jLJTGi6mxKeyyGgEQ18wj
         i5U5o3Xc74Lo5PDBabBXsozW0jw+ag83frd6vl+rpowWFB/YqtGz1WQWWsoJzP4asHlY
         lGgI4W17ED+GfzXDLSAmv4IW8F3/4s20OYQWhpqpSO5K9SgkggadhN2hGWKDdyPzR9MP
         8/z2jbHm2UN+T6xQpkrQoTSz6ycKSIJ8TuX0AqGCqD1BN0cS+ZgPtrEX15eE5LAyxeDT
         e9XA==
X-Forwarded-Encrypted: i=1; AJvYcCVEzy4al1gr16cb09fBam9RmBuKe/cTOzrC/oKHrdyCFtrKID4YKsvocmD3tGOGvHHWsGc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzn7o78ZVrK6lsqbBtQTQ+40TO2J1JtQICqYCT5VXDWo5vjqsoB
	1amCL96fM3o+3ruEa6cy692HxbGQQQEdqdtOVQ4thdKRrmFRAelGHHftr5/CM+8sWig=
X-Gm-Gg: ASbGnctlhlY+aS90ZkAH08zIH/Miqq7qrpr355dW7axCwH19tK9Mc6zlQ+vvZT8Cyzm
	DyPlYVIROQ6yxuMAYXNg2NRghzl0fMs1yMzv0eGl3nFDInJ1/A5UGJELtfiMPh7oCogGtAE3Dtw
	58lo/zqAKt/XdLXayuoCm0xOrx++f+DUBipY+YnGJGAwhdza5bR8yX6r/GjRU1ui5izZVOguECq
	BuhyFyoTy7BD4gcYFvw+l9zyEHQg8FiFFSNJk/eLIBk7RrzSFpbevaBkKCrg1erWGXaINa2Wseb
	AFG60qGTKd0+AtMf6wkdsAHBkpDSzZbUGXJKSWjWD+0dwXjvjFsu64PDOmEofRET0VaC+lz4k4N
	Bhz4tLwuGIzI44Go+yuw2ocQY/NhxSH+H+v9QYyWm3w==
X-Google-Smtp-Source: AGHT+IGHpr7IbIupTqCPhLagR2/pjjAWy2NRyzBJWRNwFS3zhzcdJAYgjTcIo3v6JaXEdhyc34PL2g==
X-Received: by 2002:a05:6000:4029:b0:3eb:5245:7c1f with SMTP id ffacd0b85a97d-3ee7da56fdemr3546022f8f.2.1758297504630;
        Fri, 19 Sep 2025 08:58:24 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:9dd0:62bf:d369:14ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07407fa3sm8367224f8f.21.2025.09.19.08.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 08:58:23 -0700 (PDT)
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
Subject: [PATCH 1/3 v2] dt-bindings: PCI: s32g: Add NXP PCIe controller
Date: Fri, 19 Sep 2025 17:58:19 +0200
Message-ID: <20250919155821.95334-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919155821.95334-1-vincent.guittot@linaro.org>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the PCIe controller available on the S32G platforms.

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
 .../devicetree/bindings/pci/nxp,s32-pcie.yaml | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
new file mode 100644
index 000000000000..cabb8b86c042
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/nxp,s32-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2xx/S32G3xx PCIe controller
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
+          - nxp,s32g2-pcie     # S32G2 SoCs RC mode
+      - items:
+          - const: nxp,s32g3-pcie
+          - const: nxp,s32g2-pcie
+
+  reg:
+    maxItems: 7
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: dbi2
+      - const: atu
+      - const: dma
+      - const: ctrl
+      - const: config
+      - const: addr_space
+
+  interrupts:
+    maxItems: 8
+
+  interrupt-names:
+    items:
+      - const: link-req-stat
+      - const: dma
+      - const: msi
+      - const: phy-link-down
+      - const: phy-link-up
+      - const: misc
+      - const: pcs
+      - const: tlp-req-no-comp
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - ranges
+  - phys
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
+  - $ref: /schemas/pci/pci-bus.yaml#
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
+                  /*
+                   * RC configuration space, 4KB each for cfg0 and cfg1
+                   * at the end of the outbound memory map
+                   */
+                  <0x5f 0xffffe000 0x0 0x00002000>,
+                  <0x58 0x00000000 0x0 0x40000000>; /* 1GB EP addr space */
+            reg-names = "dbi", "dbi2", "atu", "dma", "ctrl",
+                        "config", "addr_space";
+            dma-coherent;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            device_type = "pci";
+            ranges =
+                  /*
+                   * downstream I/O, 64KB and aligned naturally just
+                   * before the config space to minimize fragmentation
+                   */
+                  <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
+                  /*
+                   * non-prefetchable memory, with best case size and
+                   * alignment
+                   */
+                  <0x82000000 0x0 0x00000000 0x58 0x00000000 0x7 0xfffe0000>;
+
+            bus-range = <0x0 0xff>;
+            interrupts =  <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+                          <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+                          <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+                          <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+                          <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
+                          <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+                          <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+                          <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "link-req-stat", "dma", "msi",
+                              "phy-link-down", "phy-link-up", "misc",
+                              "pcs", "tlp-req-no-comp";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 2 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 3 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 4 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+
+            phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
+        };
+    };
-- 
2.43.0

