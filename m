Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA10F35580B
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746169; cv=none; b=lMq5pR7vX4eNGHgw5jA1mzQXIfNvsCY949YlNQ4omtM//hJJZHV+Xx53+gD3CbmjiI8kvBEB/mZIMhFQBqoi0nOgDR5VdXkmBXep3tjM5yv8UK4J7xlTzP+778EUpi0B3S042eni4bZRrk427qA45knhM6SBIx95Vh/ScQzhd+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746169; c=relaxed/simple;
	bh=NlDVT84FRw/2mXN8rUhepff7GU8/kbx+go4sEcGg10w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ezm4I4XuIz12Eb7YCh4hVpvvorT60FVfFNLF3EYX2pAcvFf2GpywUDgWTemDS58JW02iQZhSQSD+q8iIuEnz7lI1sgzsqECQLrqL7slEH8pghcKEV33O88r7i/z+4D6gwXWjxeNYj6v/ijmj1jKP24D+66ms2w9PinE6Y4SjUdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c81yESSe; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c81yESSe"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b70406feed3so80805466b.3
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 06:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746164; x=1762350964; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63ONXHD7xxtFJR0GpIWYvdgt2ZZqq/c+9blnPN26amc=;
        b=c81yESSeXx7CDumy4JsmgxZ6x1DXpdQTtXr+yKWqJhuWrOgOYc8JydxFrXscKS5jm2
         uY+SZYWF/UdP7QF7ryWquDzCwqmxj0icvtSXfgkHIdgW4H+vc0cYjGHKbaW/95AB27tx
         +YlxVmOa3rjyS9U969LkyYokP5JhKD5S0x84hnOgbN3oVQaxN1AOZyx1+x+dIrUsUyUf
         Shi94uwJQZEPO8cNS2Zdmzjm52OtDfCb5Xt8MYRvLCXZ/7MhUlL8vpU71szCv5kcUiMt
         GhUvb3vebSPvqnY+heeoVXGjoyDFm/j7pamrxwnT9rJwPGNeQ4A36Y5fw/1YzGLO+9/9
         sHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746164; x=1762350964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63ONXHD7xxtFJR0GpIWYvdgt2ZZqq/c+9blnPN26amc=;
        b=NdZg8kILqbNoD0x+h3TV6UZq6wNn061teTdsd/vn+WjpKIWkPr81Nc3k978ZALEUWs
         UX4QEFkUHlyiY3NFaro0pGpsCQEoIJMQhMEjMj/ftjBi16yuVtwtjbkrfRcvc73ZX3ri
         oFmhyk9vNLZcyPfeQvXFsZUiaifbnyMN3oeJZBg19tWwG4PdNRDd9iiv17l9Goa3oiRM
         d1JV/dEp794Up4Mpsgw7MXQnJ3HRVfd0diRlCvMAUqUl9mXf4LIMFoVKvDrLvrK84xdy
         vAb4tjYnHvW2ZJPx4A3oGgyYEoGQ/OZGPD1A8i5mUuW4oPz8UJs5D4V6hO0ZCzrZHodc
         1ExA==
X-Forwarded-Encrypted: i=1; AJvYcCWKYNJgHRkItL8xANaM6BEOOLt7z6frv1Rary4WesS5s6yiDRew4i2YoIGp+8xYIahTJL4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPapXhVWHEJWoAzf4yfqGlUrIhe+SevVhz3OChDOI5CyOX51Dc
	eInrsxPxW6eZEd3ka1bP+rso2C+LqUEEDn8kf98YMF+l5Zo19dI5ORIW
X-Gm-Gg: ASbGncuLPRmxxH49dmX3S2dPyknFvoYXfbyrZx+Pv0yeYZQbgScbn/imvhAT4jQWPwA
	4zM5c9jc2gMXdOwuHZNNFvEtmkIo4RJjcYdhnn1l+AqrW3TUVpRYBSHEPpMwsqTe6gYFwXYaJVu
	eSAcxNLCK6Gaa0/dS+KqhyLdQR6Yp9+i6fz4DGo5RTHO88NfiA+gltBPjR8BG4WMMDoB9y+ehiK
	S+OZobQ+GTP4TrLv3Qnx3PSJns96/es3meGfKkn/KlRBRDToiRcJf+SnfOe5WhB1V1vDp4dDY6g
	91z3mekj9SWJtqLwbyFQhA84uzHk8DnfQLHV0FRK594YQ8Us+HZs+0pzW06/6tk3DCbG+XJ8WRA
	vIfRPXx2v+M7a9PxeJ/z9bqv5Xm93EWi6/IsN/+4VOElL3/yDk9xR6lEc9eq6PKOuWP/QC0UVLC
	jpzoNeF+J6PAzDluTQDt87gLpExw==
X-Google-Smtp-Source: AGHT+IHH54LZbYTOXZg7mV9ntZU3iJVYCB8V/9k7x05K1JXFlb07Aw0IydcZp3Dr0TOMorMdCHGUFg==
X-Received: by 2002:a17:906:f58f:b0:b3d:b8c3:768d with SMTP id a640c23a62f3a-b703d2cc2c0mr267175966b.7.1761746163828;
        Wed, 29 Oct 2025 06:56:03 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:03 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
Date: Wed, 29 Oct 2025 06:52:23 -0700
Message-ID: <20251029135229.890-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add documentation for i.MX8ULP's SIM LPAV module.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/clock/fsl,imx8ulp-sim-lpav.yaml  | 72 +++++++++++++++++++
 include/dt-bindings/clock/imx8ulp-clock.h     |  5 ++
 .../dt-bindings/reset/fsl,imx8ulp-sim-lpav.h  | 16 +++++
 3 files changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
 create mode 100644 include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h

diff --git a/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
new file mode 100644
index 000000000000..662e07528d76
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fsl,imx8ulp-sim-lpav.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/fsl,imx8ulp-sim-lpav.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8ULP LPAV System Integration Module (SIM)
+
+maintainers:
+  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
+
+description:
+  The i.MX8ULP LPAV subsystem contains a block control module known as
+  SIM LPAV, which offers functionalities such as clock gating or reset
+  line assertion/de-assertion.
+
+properties:
+  compatible:
+    const: fsl,imx8ulp-sim-lpav
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: bus
+      - const: core
+      - const: plat
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  mux-controller:
+    $ref: /schemas/mux/reg-mux.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#reset-cells'
+  - mux-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8ulp-clock.h>
+
+    clock-controller@2da50000 {
+        compatible = "fsl,imx8ulp-sim-lpav";
+        reg = <0x2da50000 0x10000>;
+        clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+                 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+                 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+        clock-names = "bus", "core", "plat";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+
+        mux-controller {
+            compatible = "reg-mux";
+            #mux-control-cells = <1>;
+            mux-reg-masks = <0x8 0x00000200>;
+        };
+    };
diff --git a/include/dt-bindings/clock/imx8ulp-clock.h b/include/dt-bindings/clock/imx8ulp-clock.h
index 827404fadf5c..c62d84d093a9 100644
--- a/include/dt-bindings/clock/imx8ulp-clock.h
+++ b/include/dt-bindings/clock/imx8ulp-clock.h
@@ -255,4 +255,9 @@
 
 #define IMX8ULP_CLK_PCC5_END		56
 
+/* LPAV SIM */
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_CORE		0
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_PBCLK		1
+#define IMX8ULP_CLK_SIM_LPAV_HIFI_PLAT		2
+
 #endif
diff --git a/include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h b/include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h
new file mode 100644
index 000000000000..adf95bb26d21
--- /dev/null
+++ b/include/dt-bindings/reset/fsl,imx8ulp-sim-lpav.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H
+#define DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H
+
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST	0
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_RST		1
+#define IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL	2
+#define IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N		3
+#define IMX8ULP_SIM_LPAV_DSI_RST_ESC_N		4
+#define IMX8ULP_SIM_LPAV_DSI_RST_DPI_N		5
+
+#endif /* DT_BINDING_RESET_IMX8ULP_SIM_LPAV_H */
-- 
2.43.0

