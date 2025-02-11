Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B3627292E
	for <imx@lists.linux.dev>; Tue, 11 Feb 2025 22:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739314727; cv=none; b=n98v2KC5ZG3SXDkyJt55ho+YdtHR0PyDFLMqBlUfbTM7wz3lCbDBKZC+hj/MdyXHillU+ocZX/mLUUSUET5XIS98sVSvtuO/P2QtBWTSJjqqvt5J84xbyKLrcTeqXkMHEXI89BXxm6vcLIS49oW7JS9zkK13utv/OWbjAF37bVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739314727; c=relaxed/simple;
	bh=g8kvqIykxXFFp06R0/+Qfir6GGNvMp+sOZWTkvHPhh0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C8u1NxEOriXgYiN5kQjoTb2UsDbX+mqhFl1inXiSzctRMOhGLOuKb11ymwkYC1/v5qUEVP3W328ZReadblyRf75/qLub3+vNPLl7b4Uv/Hd6b3rMeMn9foYexGw8yWPVTtAtYaLWk0QBO+LTByBIMG2QdIEiVNqWIeggHzgojBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgL0EMQo; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgL0EMQo"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab7b80326cdso516672966b.3
        for <imx@lists.linux.dev>; Tue, 11 Feb 2025 14:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739314723; x=1739919523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvuS/3+qj3jrgC41XTgu3o3reZxECxd13x0obbo/vVw=;
        b=PgL0EMQoLv2A4rHsPQwKoENZJfID8Az9GBiRkkQuLfOSPX6zucSMTgfuCk57RGSXTu
         P5DZ0vsXtixZGm8aeZjf+PARgm7mprpm/1pSiNQfjCxdxelyK6H+ixxSyxGYhNlI9thh
         VuSAcYvOjNTboTdX1ufR+tuUup0RhbfBdf4MCPgY2nFwC0a64w0gheHJSYKAC6mu/kTD
         nF8lxy8y0ZakElzo/4r9tGgfxbJ/Fe+QbOzGUNFXY2mfVNYVL76uC4DduuueLVuVC29Q
         BHl9ZeIV81xjjjjXa+xEbdANuONXwJ6AF7P5KXyPCYng4cscdAjF946lsQ56EAVCNmDq
         8j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739314723; x=1739919523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvuS/3+qj3jrgC41XTgu3o3reZxECxd13x0obbo/vVw=;
        b=RFg4u/oq2biXQR0EgUl0F34gXk+Jw3n8jukRzQ9hb/zUgyk1j/ElKTKQjXiNfgvyRv
         9WivI+oKilislzxrjzL8Z0+Wb5dvsdfJmHXnmJKLOUglrano27MGyZmPMbomA7OoBgzS
         +2oWq/XIZLSfPLO2zoFAlOAysWohzGdDTeJp113FViF5irGotvlpkOYTWVFpahYY2AOi
         L6xbaVkbhFm4qiDMoyBERz/K0sSYbbNhD0gQ/otaDiy57cM3PkGJMW6D/e7vleI+KGoG
         Fcuhr5AHYfBwo4rOkZ6wTJmf6lHccG3JXAnsl3FWKSQ7+GslTSL7fFAk+4V0GicEunUb
         ncWg==
X-Forwarded-Encrypted: i=1; AJvYcCWwy/YgfIzMNBuxT59Z0+xk5XLZ3SMRhIInTvIujN826Z6DcQIFhb41NW8SjfPGKDLhPtY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyNFxWahQPj/TWTMTtEE0RCjw1/XCOJjcTehMDCj9UuYa6Ibx5
	2OJv/gNM5qSmFodyMrB+Wyw5/ZtWz71buOio3hWzubqqjLZdzCSM
X-Gm-Gg: ASbGnctGk/4qCzti545e8VVOh03engD95NA1I5jxli+QTntb98b0hMRFabccpOkuL6R
	4WOvxESBvO53k8hyCgcXeUNjo3cYnzkqlldRVHPuz5KbPaMHCamg0g7HZsc54FjC3fcD853snSl
	306n6TPBiZz4Wl1uzK73JR9Cfs5zYvzc+74zpCDME4xedL/WR9wkPSjI9ScjAO8gTEd/sLZlpEs
	eHrU0Jp/FY0YrQAIGzFnHc3KG9PhIJZ3TZHZGSNdHF49BYjfDuphku76wI5D/TCVFn9rr9G2zSp
	tqfibR4pdkTuk2r3xXeBLxiOzlcbB+79TuJl9bLwdAD5ohNcfCpAfg==
X-Google-Smtp-Source: AGHT+IFmYf1ZrXBMSFnoxbMnODcTZWJfKyjsmmdnqh4tb+GgTGoTQYeo7N465iZhYGFhSbbcOGz2yQ==
X-Received: by 2002:a17:907:6095:b0:aa6:a228:afaf with SMTP id a640c23a62f3a-ab7f34da6f5mr58459966b.52.1739314722882;
        Tue, 11 Feb 2025 14:58:42 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7e9fcd99csm131525166b.89.2025.02.11.14.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:58:42 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/3] ASoC: dt-bindings: support imx95's CM7 core
Date: Tue, 11 Feb 2025 17:58:06 -0500
Message-Id: <20250211225808.3050-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
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

