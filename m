Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8F4283FD5
	for <imx@lists.linux.dev>; Wed, 28 May 2025 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434395; cv=none; b=i+OTDt0BE0SEBK7+AjOmzhH0a36ep5gUm9sGA4jlHNaveOu84yqFA+TebNnaLnMwPxg/hsvDrxhbuKRyPNfwH2FMNX3eLmXmLwkKj0lWdq+VCM2CY4FIhPVv0dWWl+0VoLH+5Dj4mFBFBGdRCMMVdHZTyvaS8ZF13XWslUL4K9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434395; c=relaxed/simple;
	bh=he1Gp78HNEoR5dXor3HYkfWA+6sfD6S8tC2nJSPOYPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k9EiwnuYb156XkAq+AZL+CuwuwaGMw7LQFiY/sQOC2ujKGhgXb2WjlsqQz+wAGwNqtHxVnla4mGNTbwYnKNNaYE3bYojQ0YDI9mTLg+uqUoiI5sqLh+GQAFhBEZ78EeRktQPdqMCgFdO8Ty5IRdOjJdizDN81Mv28dl4BbHH5FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eaIil2MU; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eaIil2MU"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad88d77314bso361970266b.1
        for <imx@lists.linux.dev>; Wed, 28 May 2025 05:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748434392; x=1749039192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbcaZGbt/aOu/lBCcUk69RNM6cMf8NN5vQOyyRIAIOw=;
        b=eaIil2MUXDfnPmQK2Z9QKy4Rdhp7jGV3S5tUy4t6h6S0LFbnqUOFWjKYqXEst6eJNv
         EKJYkPPkzStw5tXdlw8O/oDyInoRnvjV1P4x+408Wmm+gsSnGNbXjmo4MhdgE3MeVnt/
         PkZuWvZTEHTzsj/OGpfJ0iP0pZM6eL1cCfNPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434392; x=1749039192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbcaZGbt/aOu/lBCcUk69RNM6cMf8NN5vQOyyRIAIOw=;
        b=ddvY87jVyzvhVszbMEyl69CqhGOi3utZLsONT2rIR9JvpcQqdD4tl9HNKSKRUDSk5b
         vnQxs+xbQMs0soX05ssjZzk1IGYQ8ajBM8vm+BBg3ituiuE755/k/9KV7JQAsHJqBxzi
         Es6N/GLiMxv4U44o0QEIj9BQS1leIYp+F9vn1jQEsGA9L7TJ6ZD4W5qKeUSLsZA/LNX2
         Og53zxSNKeKNPGiyGqFqhmtk0IfDUa/qG63WzQqhn9M2nIZUOW65MupblkSecyzWAWds
         iyjt5pfR1K98jHZKk+UezyjkW+Va4qvau0NVqvGLSTOOSBDeNRE7zgyz9i/2JTueUjPJ
         lCUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDPFgmyh1QwaSKpe1oVoDmLdA3Vt7/nBV3W8ChCGO3I4PPXwYY0muijl0+zy21G8IyMQI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5ZgWJAnlh8e3amL4vtI6UmbESwesdWqbQ9yqNk+SX9V2G/t+l
	OPQzEyncQlUg6RiJqtWUZFTAr3D543hO1WlqHvkWFEzIkOmPmLvBvApQnrJBtFC0uaU=
X-Gm-Gg: ASbGnctwDaLSLmLZPDPKYP3PB62XD/5sRJtqN+2mApYreVv/DgMzqLofOMbqY5EKPLr
	Qm92PNQgLViUbJD9Un0G7jlTE1FFIXNzGJJyZx0Aj3mCPC9giDTqj3Eto53Nu8G8f+fMWU/SWZK
	8Q5n17VpNbC6T0C+jINTaTyQaD99zXeIOl+ggZY67q3jSgRJpTZYD2Gs5PjhLkX4BP9YlQWSyNT
	Ap978jILOTcuF0SIg+bnPYOs8ZwA6n6GeY/7JXNhLShaLQsxn4gPlaR+gn2e2kZcsfEACpBIgyo
	F3V8wNEriNP7dNGbHkJasb31I7GILFNoLhm2LR1ZKa24Kty6/s0U0V+aqKXhF/MrIo7YXR9pqht
	TSWiyqXFGlEap
X-Google-Smtp-Source: AGHT+IH9dXEwPMbdH9wy3rWwV7hw5jvz1DJDb7y8RMmtXntuIkZHQwYgbcjzUf91UXx0NsuCLx/ImQ==
X-Received: by 2002:a17:907:2d0e:b0:ad8:89c7:2735 with SMTP id a640c23a62f3a-ad889c72964mr703027166b.58.1748434391971;
        Wed, 28 May 2025 05:13:11 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5631:61bf:398a:c492])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b5b8afsm98523266b.170.2025.05.28.05.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:13:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: mfd: convert mxs-lradc bindings to json-schema
Date: Wed, 28 May 2025 14:11:38 +0200
Message-ID: <20250528121306.1464830-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Freescale MXS Low-Resoulution ADC (LRADC) device tree
binding documentation to json-schema.

The clocks and #io-channel-cells properties have also been added; They
are present in the respective SoC DTSI files but were missing from the
old mxs-lradc.txt file.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 .../devicetree/bindings/mfd/mxs-lradc.txt     |  45 --------
 .../devicetree/bindings/mfd/mxs-lradc.yaml    | 106 ++++++++++++++++++
 2 files changed, 106 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml

diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt b/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
deleted file mode 100644
index 755cbef0647d..000000000000
--- a/Documentation/devicetree/bindings/mfd/mxs-lradc.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-* Freescale MXS LRADC device driver
-
-Required properties:
-- compatible: Should be "fsl,imx23-lradc" for i.MX23 SoC and "fsl,imx28-lradc"
-              for i.MX28 SoC
-- reg: Address and length of the register set for the device
-- interrupts: Should contain the LRADC interrupts
-
-Optional properties:
-- fsl,lradc-touchscreen-wires: Number of wires used to connect the touchscreen
-                               to LRADC. Valid value is either 4 or 5. If this
-                               property is not present, then the touchscreen is
-                               disabled. 5 wires is valid for i.MX28 SoC only.
-- fsl,ave-ctrl: number of samples per direction to calculate an average value.
-                Allowed value is 1 ... 32, default is 4
-- fsl,ave-delay: delay between consecutive samples. Allowed value is
-                 2 ... 2048. It is used if 'fsl,ave-ctrl' > 1, counts at
-                 2 kHz and its default is 2 (= 1 ms)
-- fsl,settling: delay between plate switch to next sample. Allowed value is
-                1 ... 2047. It counts at 2 kHz and its default is
-                10 (= 5 ms)
-
-Example for i.MX23 SoC:
-
-	lradc@80050000 {
-		compatible = "fsl,imx23-lradc";
-		reg = <0x80050000 0x2000>;
-		interrupts = <36 37 38 39 40 41 42 43 44>;
-		fsl,lradc-touchscreen-wires = <4>;
-		fsl,ave-ctrl = <4>;
-		fsl,ave-delay = <2>;
-		fsl,settling = <10>;
-	};
-
-Example for i.MX28 SoC:
-
-	lradc@80050000 {
-		compatible = "fsl,imx28-lradc";
-		reg = <0x80050000 0x2000>;
-		interrupts = <10 14 15 16 17 18 19 20 21 22 23 24 25>;
-		fsl,lradc-touchscreen-wires = <5>;
-		fsl,ave-ctrl = <4>;
-		fsl,ave-delay = <2>;
-		fsl,settling = <10>;
-	};
diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
new file mode 100644
index 000000000000..90391b02c715
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mxs-lradc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale MXS Low-Resoulution ADC (LRADC)
+
+maintainers:
+  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+description: |
+  The LRADC provides 16 physical channels of 12-bit resolution
+  for analog-to-digital conversion and includes an integrated
+  4-wire/5-wire touchscreen controller.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,imx23-lradc
+          - fsl,imx28-lradc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+  interrupts:
+    minItems: 9
+    maxItems: 13
+
+  fsl,lradc-touchscreen-wires:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Number of wires used to connect the touchscreen to LRADC.
+      If this property is not present, then the touchscreen is disabled.
+
+  fsl,ave-ctrl:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 32
+    default: 4
+    description: |
+      Number of samples per direction to calculate an average value.
+
+  fsl,ave-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 2
+    maximum: 2048
+    default: 2
+    description: |
+      Delay between consecutive samples.
+      It is used if 'fsl,ave-ctrl' > 1, counts at 2 kHz and its
+      default value (i. e. 2) is 1 ms.
+
+  fsl,settling:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 2047
+    default: 10
+    description: |
+      Delay between plate switch to next sample.
+      It counts at 2 kHz and its default (i. e. 10) is 5 ms.
+
+  "#io-channel-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - fsl,imx23-lradc
+then:
+  properties:
+    fsl,lradc-touchscreen-wires:
+      const: 4
+else:
+  properties:
+    fsl,lradc-touchscreen-wires:
+      enum: [4, 5]
+
+additionalProperties: false
+
+examples:
+  - |
+    lradc@80050000 {
+        compatible = "fsl,imx23-lradc";
+        reg = <0x80050000 0x2000>;
+        interrupts = <36>, <37>, <38>, <39>, <40>,
+                     <41>, <42>, <43>, <44>;
+        clocks = <&clks 26>;
+        #io-channel-cells = <1>;
+        fsl,lradc-touchscreen-wires = <4>;
+        fsl,ave-ctrl = <4>;
+        fsl,ave-delay = <2>;
+        fsl,settling = <10>;
+    };
-- 
2.43.0

