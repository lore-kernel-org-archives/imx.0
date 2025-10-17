Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B093451A9
	for <imx@lists.linux.dev>; Fri, 17 Oct 2025 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700113; cv=none; b=JvJtks9dsn9mVuqicRsYrvW8fXh0EPK5FWRwm326oTFcXxQHMDJwdao5fM3qPeWOGELbCJqx9fQkvDHCN0P2JFO0i/deIM6KFxc8cUWYAojLPw20NbRLRsSNuJ68Vf5AM9+5jYAETIpaP1qCxg6Q5VtsXBZqF4vsE5s77ppGrhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700113; c=relaxed/simple;
	bh=a/aoSr6OJ+vXil4ATAG/Gem8UWTO+xyhbN9HKM1V+QY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHvyzqEu2s2Jlo8d7D2q2RQZbnhlp0/cNaTcMcW4MtY0K0YjN//wVYGvRgqvpkJrX2jFERz6yTOWoZxROveN0apMqKMlwvjLT2qHz147RoHL2D+iiwl2hKROxFGsL22MS8xMBZV8K1RuVLtd56QSXgc7gHwqYxv7MhxISMMGZ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfVj+qUp; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfVj+qUp"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3da3b34950so287828766b.3
        for <imx@lists.linux.dev>; Fri, 17 Oct 2025 04:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700109; x=1761304909; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxZng1eP3nkpNL2x3zSCyGZ+U+wKEAYbZhmRCawRv6g=;
        b=LfVj+qUpg+oRYxYgGn70whGz+FJMkLhz3O+fvDhIkEchmVBRsclTACSwDbKvtq9s+3
         yV5ol1O2rS5QKlgrrWpDncFCqIY1ko+CQ/9/Af9OHNP6Fh7ZCW2EkHITH1ZVdf1wB6j5
         /WB2zMIELqukcpa3LUvNJ5lTH9U9MImk4lgRngGosyBFKLPLTV+vC2obmnjZHHpc6cXP
         v0rwkiRTpM6k86rI0PUV1sc8sOC0GPusnSuUKoHIY2PMo8Ix4xhte1klptVjIK5Esm+z
         9auqVmorry2srb56U8sc+CWSbAGs/NLaO+MdAz8ThhAll2ozew4CipGuLHGLAHAosHWm
         l9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700109; x=1761304909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxZng1eP3nkpNL2x3zSCyGZ+U+wKEAYbZhmRCawRv6g=;
        b=ap/xg2XZ978CtRLqUnVJcKMTfXIcA4eFnZ2GsYcEKygNr8DqGApnvF8R6Hjvd+cqWU
         ligubGH0Tq9EaCD+Sz2px1eos1DNXShytL/S++T5NKdGKFlx2OKBwCQRXxTaANkPyzVH
         QiK0sV44oLl0Ik8v8B7Mmxr2y+JjSoQd19MrTp6Jqw8RbZS7sgfOwSpHMq6/jYhg/qnO
         x2U15ff21DdYXkyHQC+3/d/P75TWBt+G2ygThDw/s9miuYGETj0ycgZ5zToRNaOkkLyx
         QQEmzD99c4vRDlB1D6hOe8LPtDPYnDyyD2XtEW5d/UxWaPV7YCg4R4A0XUu8rX0naAJ3
         5/Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUTya2J8NZBAF5JwBBdzpgWGJoX52ucYCfRiTG0qx6avDBQQ/lFirpdR2ugUd0kU5VWbbk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvCSFGwIv7ec/unZB6DIAhiancy0vk7+EWXAUc+juPo4Ejlc0I
	GCkyDW+7UmGBMAsXnZXzC/GD45Hx1dqNRRivNg7TaV+QvHdj4o9+K9sD
X-Gm-Gg: ASbGncsqX81eCzbb8OaKg0CH7XiarpFal7PlqeewvXmF7e+dKHCgjfkPu3FPMbc+whT
	n49g6W0UkRIuciXi847kFky2AlAzbIR4dQsplxPOV71M06FGLTw354veL7eot9z+ueukvI30khC
	9CR/wTCrliEdsw2N+UJ5J1fuHAQF/8oKJ10/ktB3NM+fvRzKpILsm4wry4+7QuuwNEf3zz3Y4Ps
	xmmPCnzqUtKl2KjwXZD/Pl7KQ2MB0GjYhmFXOWHboZGFZwcjTwZNLWs3fEd237BXUy2wRj2dCi7
	03HGqhnwZoBIRzx0utZBDvHfZMC/UZDfWih6kjaMCK/UgisIdNMt2H/JNxhY0grSi/6CbFAA8HR
	XZPCL4oupRMFJ3e1M/FgKsePGLnr0aphjh6ye0fE6Y8TE7ArgnZZREDAZFSreNv0G4kXhWmV6bG
	Ybfr9AmKyZ4tz+x7o4UYSJpKa9ycu7IAGypZchSA==
X-Google-Smtp-Source: AGHT+IHZNMQeXplbUH41+dThExjmzBGzSWreEUPNrbP0M9e+9ctpnllogrXxNq4uh1jLTdNf2mZ0sw==
X-Received: by 2002:a17:906:dc90:b0:b3d:98fa:b3fe with SMTP id a640c23a62f3a-b6475510fe2mr380187166b.63.1760700108569;
        Fri, 17 Oct 2025 04:21:48 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:48 -0700 (PDT)
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
Subject: [PATCH v2 2/8] dt-bindings: clock: document 8ULP's SIM LPAV
Date: Fri, 17 Oct 2025 04:20:19 -0700
Message-ID: <20251017112025.11997-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add documentation for i.MX8ULP's SIM LPAV module.

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
index 000000000000..fb3b9028a4c3
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
+      - const: lpav_bus
+      - const: hifi_core
+      - const: hifi_plat
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
+        clock-names = "lpav_bus", "hifi_core", "hifi_plat";
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

