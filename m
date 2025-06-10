Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC50D23816B
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571346; cv=none; b=pWhQVNHXFNVMdtt7LCOlhJBeXkr4GjFPxjROmc6BIsO1t4/GgJe+hTD8rcwQ8T/DU6Zd2Em+j455SK0XlAG+KimSWjlFlteBLuJo5Smq/6zKhU+Lj02PclzOVSXLNx4UH7ZdMOkaAFkhUP/B9ZmVR3ZN0edZehPYOe3bJDxXdAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571346; c=relaxed/simple;
	bh=YogC5pr2hL+OWqcsJP5ip6Uo84tqBvA1fB7I5weMwGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mUtcKZI+otgoKyqiq0G71Oox+lZhhPq1fZvKc+IGDPCIFiZimpY9m10/7SzSc5svHRbgrNNEJTtgune+JwaRZjOlCZAmhhOj6QQaq2oZ87Nh4EDkum3fxtzFnTD3stiv9v18szX2k9gV5RBOcvVC5Wj92DjXyHReyZlueHSWt04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHiOVXHQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHiOVXHQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so36877895e9.1
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571343; x=1750176143; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xX68KJbJESDlbPv3DAVN3pAKIAf/xvWJN3LoAooAL8U=;
        b=lHiOVXHQ+/GsJKZWgWpTeOlqMVz2egYxZIjsk374jX+lay1fHh0V5rMGAOnAvdwDJG
         q972eAdKjz+kLFdXYMnl7qVVU33ZMZl8Wr/E0iMVwAd0zraWloQ+qu9Iohmd3eu/rBpn
         B+KH6Dd7816tcuAJcwm7Oph9czseMB1KdLL391WpxpGd8c3s641g70Tf1W8vDzxzP8fA
         8Nhk6g2zjg2HIbNG+3ht1A/ioUvz8ceUUIz05H0yqIbkAWKVR1BHnH/2zO598H3iJAP/
         Qi6RgIijAn0IiFcnKtzqjX0Ppc/eaQ+6cNPv/l0TOE4qjoVqzp4VEsy/9iWCHrAlKp6I
         og6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571343; x=1750176143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xX68KJbJESDlbPv3DAVN3pAKIAf/xvWJN3LoAooAL8U=;
        b=I17Qa3m6oz1vtTcO5hlbNYyUIiJ6DnSy3sXlSlwV3J0jWJ7xVcXtRkYO85cMpgytgs
         frzk0OJURBOtOMvOdPJejBfec+zsOeaGDvqFRMXzE/6eKjqbyKY86GMnkCSmhuXgGufD
         8jzPgC/6b3bIkB0C7+2iheiKf6w5qJwa5ZxrNzp1mZr7/TKIvxV32g2MfHrF6LpjFnaK
         Pi5cN5ptf1nSG/WAQcJF9VjZTVAQ2ryRV9KkJ8W04eOqhGWwLebhdTnu+X3fNErj64lO
         hR2dexYpL76oCVsZcwrRGX4UKlpUPykmyeyAm0/6rh14zVhMD2Crw08vH80kXHU4k/fr
         gPqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV06nFd0//hq+e3dvxAd/1yEufiEmTwBLaX4NrPKmx85j1j1qzkBkmmKmCnl8lc0koOWLU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDyyFfFQmlkdck540JYdIYK5PNRu4ZnUBfr1gIwrC8n5d+8gKu
	wLBMJPyXOHYLZ2nProLyE82IIJE58R1QTsMdVSMAaqaK36SQpk7NMi7+
X-Gm-Gg: ASbGnctaUndYW5o8aphzpERzckrkk+Zf0pYcpul2Ox4yXN1hLw8HJvXxt/enYvryBHa
	L19dIjxVNO07+tzrPSsoS0TcSNxLFfTV1KkbsDPvNdfBB5dB2WSCn7HWTLHXHL777y1Ssq/pqlC
	fHq0SaMCqYoWBgQoDYNCa7deFNbaOr8vzeDrvqe3kGZZMfTtUErTV+VmnasMCCF/TIzH9ugm3Jr
	Bej8F0lvGqlvJm2ivC+JBDuuZtWgkQ2bHkqmcGa6HBq4AMMD4URcbqF86guqlq4rVr5ImRoMzko
	ZT6wSArTiQ5vmPpJLltX/oGV8cKwIzDBJrCl2DVNvu3CpmZSX098iBK7pFQlntSyc+1nGnlHNju
	k1J9ssH3gqOGx+W8sKBW//tc=
X-Google-Smtp-Source: AGHT+IGIQmwoh/m9ZyExLKzTeQknfvMb3DhvDjf5fzdmS0IWnKQl4ojPR0BwLRuRbj4bK9JzjZBEpA==
X-Received: by 2002:a05:600c:8b72:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-4531de00a15mr33799315e9.13.1749571342603;
        Tue, 10 Jun 2025 09:02:22 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:22 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/6] dt-bindings: bus: document the IMX AIPSTZ bridge
Date: Tue, 10 Jun 2025 12:01:47 -0400
Message-Id: <20250610160152.1113930-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add documentation for IMX AIPSTZ bridge.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..993293ebc4d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Secure AHB to IP Slave bus (AIPSTZ) bridge
+
+description:
+  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters issuing
+  transactions to IP Slave peripherals. Additionally, this module offers access
+  control configurations meant to restrict which peripherals a master can
+  access.
+
+maintainers:
+  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8mp-aipstz
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  "#access-controller-cells":
+    const: 3
+    description:
+      First cell - consumer ID
+      Second cell - consumer type (master or peripheral)
+      Third cell - configuration value
+
+  ranges: true
+
+# borrowed from simple-bus.yaml, no additional requirements for children
+patternProperties:
+  "@(0|[1-9a-f][0-9a-f]*)$":
+    type: object
+    additionalProperties: true
+    properties:
+      reg:
+        items:
+          minItems: 2
+          maxItems: 4
+        minItems: 1
+        maxItems: 1024
+      ranges:
+        oneOf:
+          - items:
+              minItems: 3
+              maxItems: 7
+            minItems: 1
+            maxItems: 1024
+          - $ref: /schemas/types.yaml#/definitions/flag
+    anyOf:
+      - required:
+          - reg
+      - required:
+          - ranges
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - "#access-controller-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus@30df0000 {
+        compatible = "fsl,imx8mp-aipstz";
+        reg = <0x30df0000 0x10000>;
+        ranges = <0x30c00000 0x30c00000 0x400000>;
+        power-domains = <&pgc_audio>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #access-controller-cells = <3>;
+
+        dma-controller@30e00000 {
+            compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
+            reg = <0x30e00000 0x10000>;
+            #dma-cells = <3>;
+            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
+                     <&clk IMX8MP_CLK_AUDIO_ROOT>;
+            clock-names = "ipg", "ahb";
+            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
+        };
+    };
-- 
2.34.1

