Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11CF2ECE8C
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 12:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257842; cv=none; b=E1yYqexPGdnW+Gk5PAYjVMi23B4ndYDejROhRhORn9x3niOcHcazkWiSoAUobv/3e8k13TChB988RXJjSGTbFXwXWYYQhCGXEiGYiJhkI4nTeMwho1VnjY6Fdikei67ss8/vsBNvOxhO5qJCh0Ns47t4ejmRmOfskzrQleCoQHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257842; c=relaxed/simple;
	bh=NlDVT84FRw/2mXN8rUhepff7GU8/kbx+go4sEcGg10w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XqkVm4Q8+ks/LMFMmR90/LJ9toeqm1/HvWHvhaXa/M8wDxL2BMgf8lhV6glQHOsdGgYUkQ/w5ObDyy5rW2B2Z70LWpMdZ4SP5i03o6zZJAEzaZO71S8xR7C4Bx3VgzDBjHkhm9pVPaSTC+/m2O6pxIPUuTQGfPncbNpduP0GdCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyOcxOyv; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyOcxOyv"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso1316207866b.0
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 04:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257839; x=1762862639; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63ONXHD7xxtFJR0GpIWYvdgt2ZZqq/c+9blnPN26amc=;
        b=hyOcxOyvojWtEb7YoOho8ckPk1g+c9t3ZqkAvYT/86XZcb7TcvzeNPbksGZ28EjnXk
         TCnn/hna+YTeDgSiYY8nslOhXViT8qsU7POJgCjRBOD0tfRbhPiny6nGenNPUvSv5Vtm
         LhdAKqIH5OYsDR8qveXl9T9rVrehqmIIReWCUEvV0B89ZlY2Yn+ZcELPB8cl6i3avDio
         CoZ3NaMhp94bZ07RF8X8rp8EbWkBRtTZ5CyHIb/HtKZcR9hFEzptt+eGxgT0K7jZF9fS
         oX0DMei9t9YsUt7RiHjECqmy5o42C17Rdo6S5BM66Gopuij7yG2v0T+sYhs2t6wEh422
         /BVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257839; x=1762862639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63ONXHD7xxtFJR0GpIWYvdgt2ZZqq/c+9blnPN26amc=;
        b=iNi68KIgWrLVT8tozEOzqhoM0ODCU63+0TQa3qZ7lXrDTcdv0FpuSHIitRsGKkTdy6
         jqafsEkJsaBJejFUPo7yVFNe2D5b5zNu/06Q2JqXKghgyOHp2BgrDNRneKJVHuN+6VOu
         HmKSRxLujEvpcU1ZWLdOtFN89iw7Ht8kfR0HmfekImT6J4wQ9Pr4grQ5Cnk7fdHUpcYe
         upSwRw+x28QEpxxHYyi4Ujw2JfvfNHcmdLAEaSYoOM790JRZu26a4bPhlTa5EaM5Qpid
         IDltkPBqduZRXLDu8KKeAV8cbNfeIbX41eU/tZnqo9y0bn6q/S2OdFy96isnqkIjdk85
         7U0w==
X-Forwarded-Encrypted: i=1; AJvYcCXZPqw74iBNY2uZIpT08rB88F/wPBlchllnicyu7JtAs/Utc5BNt6XJhSblRjmG0DTn9MI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxK81bEM4XpJKIjdcUejh7p3xLkOprCHZu8EjDnjBCg8mK+r3uD
	pXDLpWrM/tmyS0vgaBZawapr04M81my+wMQs/RfbVWsPvEzhFS6A9xHJ
X-Gm-Gg: ASbGncsfkL6x9LD5DaGXW4KiGShKMQra06w7Awc5KD0oA/IzYfKXDvGyU2KQ9AWmvR7
	auHT21Rl9xfYxC+hM3zCx+agFI4d1uHmooUloxVO/VX/Q9rmANbko59HAxOs1xdYV7n3xnrAJON
	bnJ9SK9UaDvfcr1CIOQWgaxpte18y4kkMZWZ3ecauNJUArC6P54SeG8YR7kg9zd5XG/SjyGaXun
	ZWKvZG32YvCE/r6ZedMBxkKcNzGAlvdSpPjAzNk5QQQSxcoByk4jtEMnuCYYxalSkyAwZdhvgjY
	+pD7ojSazYOtkxFipalLGnxn90lWjnUYl4AteZeWwSsppB7HBY0F7/glatCz9IylqrYWWcLS7oF
	L0DjJnEgzGCjoKm9JMtA4/CTepNSqBHeB0PwXsS3scBZDlkucQhJWh4pYqjfyJuXlFm0oQZ90dr
	DqWQM/+QPjvsfLAyrVerlVerdpPQ==
X-Google-Smtp-Source: AGHT+IG3QLmyCjtX5/Ko9tQsUxnNB5wR4XCiP6erukrj/bGwetEYdDQuHsOKUbEeVB4dKQgbNrFB5Q==
X-Received: by 2002:a17:907:72ce:b0:b6d:263c:22e1 with SMTP id a640c23a62f3a-b7217d7eb1dmr363856066b.31.1762257839139;
        Tue, 04 Nov 2025 04:03:59 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:03:58 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
Date: Tue,  4 Nov 2025 04:02:55 -0800
Message-ID: <20251104120301.913-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
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

