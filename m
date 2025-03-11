Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B5F260378
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741710863; cv=none; b=MdAfvZkXWSaGJpkWDWkvnvqJd7Uz7/OYRFl9pvheKkdw98TP5/rS4f7auDlL8TI/O/QayLHKmkzM2uqSebcPW0QOzUG97BbuxcDVr3hjk7GbiaY/jhsRzPLaDVLkq+hlGHv9tuF3ZRWRhNXU8udSErqlAJmOg//tdgdSTYKwkrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741710863; c=relaxed/simple;
	bh=S4hPGT0jGZAeQzZwSLwf//+D0vqIo3lmykYBuhF/ikA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J7rKEkj5xCB32Nh8PS8sWG+7QazCOUnVrB6n3w+oXeDjlXikhpZ1Fy/IL7sqWG9vmtcxJi2Mu6iyEltU3rMgriSyu+83WU3TWULNeYeDMpqV9E5mz8HIIEjjS+ga63E48JCWJpTro/Lk0M6zacfWytUW/jQawY4EvlFSV4vhYiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkPALYTi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkPALYTi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3913958ebf2so2975867f8f.3
        for <imx@lists.linux.dev>; Tue, 11 Mar 2025 09:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741710860; x=1742315660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bRH17cccG6/U4hLd0fePgcNIt42zxj9hdhIfpswv9sA=;
        b=VkPALYTigdRUI/jEUETQwEvd48L44W5usEsUn8WcD8kihd+9be0Ffzjt7ziUNziV3n
         K1TR7McS++KtGbX2MA02oo5GTji7d6e9iKuhb4Vz7cs7H9zteUnq83ts1XqDZJ2GGnyd
         1CAJsj9r5NHqY+uoNa5lCpiWs4l6hcI7eYz4p6+/GAfPhbeG9r2xyDoUnOkcJwVQxSRT
         VquDtx7ynwH0zlqxJOh5Xb/QyxawKHCYpE2z3R2CK5wPXMZeoFiyQrHKgLM9vsNcjTIE
         ELrIyj4K2ajckoqUuzQs0OKpBZ5jgdAdndQ0dmjfzcWApdv0XF/LlgmMa57NKb2FQGWW
         nAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710860; x=1742315660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRH17cccG6/U4hLd0fePgcNIt42zxj9hdhIfpswv9sA=;
        b=ZgOT+DzeKKA4ZWuhUXe6jCyp8crN6Ou3FzYis/YfGpwCUNc6Z/4/UUBV8+E8x0oQa7
         ADmMpDLZ/62BGJ56/mbHBtkiZjHkje4gdRpGHOx7AxXXxYB3VuAL2KljTOTo9UyE0Dtj
         HuVBXktY69xs1DEBq3n5ncNj0k4zBjsUgBhU9W/PoP4osiIYH9I/xWzzW9lVsCAUFESf
         7mklpb9HuKwa2laKcx68V3jpSmZFdqBahSbd3qmBpgoB++k0KFhjBzySR909pQLfvMQW
         a8xofD/2SxaeRbXVNkoiSFLv8b1qibtSvCWrzotYZ7qCLnvIh2ExSqDK0xym1K1AIAqu
         Qs0w==
X-Forwarded-Encrypted: i=1; AJvYcCWg8gZOQbvzGWh89RmAwhM2TEFaGb6by+pTBsN8Ok9tLG0uKjUKwhmdhPM9hREXbPYqY0o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb95BzmhiNivJlb/ng4svk6X2cuwJcw30tJnTwy937mRZOYoea
	oxY0DGYBu+2EKHNxMLpeeSH+36a+mOVGz8/mSJKDNhrpZuYJhCtk
X-Gm-Gg: ASbGncv26p4DMgrq8YIoUfqsIdhF/t6rtW3gr6m4MOGJQexTfA8CJNpjAK/vKQ7yL4U
	EwXhg+/lDal9H0Vobii9Er35FXPbpz5dTsBujXNZvn/zinR0Op1lcSnNxifVj4JlvMQYXyxRhHL
	my5acF6mMLvVNcHqrscidz6USADvHhG+o3W0kW8GyYxL5DpftfjNKemVTJv4S+hXyKAJKYSfYfb
	QDTVrCO9e8Ulw1u4u/SA3VP3Asua4l5Bb6jiaC/z5gDtzrWZw/3GpvvPE1lzIIjW22Gb6EMjx2R
	Hlcc8dCA7F7imMJ257uqFCwWhoIFVPNxvR0Fs94ftTeSIviBr3N+FswkAkTzVwJf13ZAC7HUOoy
	s6DZrGkU=
X-Google-Smtp-Source: AGHT+IHzNwv3pt//uPp+AK3oZyV5NFTP6P3+wVUbCg1pfACSK7yZfLYQfZuyJtz1MusPNtaNgle6HA==
X-Received: by 2002:a5d:6481:0:b0:390:e8e4:7e3e with SMTP id ffacd0b85a97d-39263bf6882mr4377953f8f.6.1741710860435;
        Tue, 11 Mar 2025 09:34:20 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d07fd046esm13398935e9.19.2025.03.11.09.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:34:20 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/3] ASoC: dt-bindings: support imx95's CM7 core
Date: Tue, 11 Mar 2025 12:32:53 -0400
Message-Id: <20250311163255.2664-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add binding for imx95's CM7 core, used for audio processing.
Additionally, introduce a common binding for NXP audio processors with
Sound Open Firmware (SOF) support.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 64 +++++++++++++++++++
 .../bindings/sound/fsl,sof-cpu.yaml           | 27 ++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
new file mode 100644
index 000000000000..f00ae3219e15
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,imx95-cm7-sof.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP imx95 CM7 core
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+description: NXP imx95 CM7 core used for audio processing
+
+properties:
+  compatible:
+    const: fsl,imx95-cm7-sof
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    const: sram
+
+  memory-region:
+    maxItems: 1
+
+  memory-region-names:
+    const: dma
+
+  port:
+    description: SAI3 port
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - memory-region
+  - memory-region-names
+  - port
+
+allOf:
+  - $ref: fsl,sof-cpu.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    cm7-cpu@80000000 {
+        compatible = "fsl,imx95-cm7-sof";
+        reg = <0x80000000 0x6100000>;
+        reg-names = "sram";
+        mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+        mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+        memory-region = <&adma_res>;
+        memory-region-names = "dma";
+        port {
+            /* SAI3-WM8962 link */
+            endpoint {
+                remote-endpoint = <&wm8962_ep>;
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
new file mode 100644
index 000000000000..31863932dbc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,sof-cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP audio processor common properties
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+properties:
+  mboxes:
+    maxItems: 4
+
+  mbox-names:
+    items:
+      - const: txdb0
+      - const: txdb1
+      - const: rxdb0
+      - const: rxdb1
+
+required:
+  - mboxes
+  - mbox-names
+
+additionalProperties: true
-- 
2.34.1

