Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CF71C463D
	for <imx@lists.linux.dev>; Sun, 15 Sep 2024 11:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726400649; cv=none; b=MaG3COiTTCN/YgcgQtENEBa8uIKk8kVslaUweD56xecn9hJv4Wpe/r2aKQ69f0fG999MHhQEdSdo/l/ojwI1MwvwmMSsfzUXqYo9kNP30DCLoFfierS5NwKRrrnZueFh0uic/J3tzu2RGPUm0dFrv417+cjt5OkSSBk6li+Q/aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726400649; c=relaxed/simple;
	bh=HgijeomsNGsoTD7HIIXQI6oJ83tlGGXVPPZwJNbDgRI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L0xlSKqOt9MgAOLpRO6BO9J7CLexmZmzD+a71ET9Q8ZNKypdHfo7DJafSZKxwuQ7GVZdmZfPeZZIc5n3WPHtMKcewlP6a+CRMdwZJwsEcEiMg51Oylkx5IisANNtcMSrV2HEg1pk9fZ+TecDNMetARWj97DhnrDZbjRTsi+7rpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkWoiE2O; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkWoiE2O"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8a6d1766a7so453842766b.3
        for <imx@lists.linux.dev>; Sun, 15 Sep 2024 04:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726400646; x=1727005446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMukAaRv6lsduEQXd5W1x8cQrcsYqXKgAlv5XHYkQXQ=;
        b=TkWoiE2OXxGRMa5Ie7vIAm7sWV0RdBJdABcCdBbWY+wno8yKYTQ6YG94QxPHHe5+ym
         0calll95+p+N+nVhlwkT2wdvs53iL/vT55NNXkhpCwxY+C7uHk+0z5fp12FD/RO1cG3K
         S6QKf4xS2dN/9yoxN/wkx8Glcb+tE30ckQeYFGb9VkP6fLhs4jNw3iE0qdTN19KWhgcX
         eDJt3txF/SFW9Fs1r/PIzgFEERDWPxV9IVZdH4VTt7ctkErmXuW1SWkDKNQr4uiKcl9z
         gEKaJvUkcDyE8nrmt5tteFaTpRqAOczLxttSOUy0C+4RHwQtYZrvEijHNbmDmXiNa7dQ
         ka3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726400646; x=1727005446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMukAaRv6lsduEQXd5W1x8cQrcsYqXKgAlv5XHYkQXQ=;
        b=eyua8PNXHVBNljb6dFmEbuCt4vzvfF7xIgQhCI1esxxhGAqe35v2MfYkWCw2j66pX8
         4DCfhpC8drDJ8n3WP/1eDJ3uNIWNRP2+1Hwo7+tu/KpQ52aQ2Tr9MSA/1wGvtepS0Rxy
         chaA3OVGB0s1CCB0w4MEWnQeIGh9KsKr1FGowQ8KHhA7YdpLYPulIUwvxapnchw3TUib
         rfQhyoYrko9WLik9c/4KDMI0/wRr79PnhXimnhQ2gMauXnTw2E9fVVduG07+1U7R9cuy
         qH0pO0cGTac/jChfvgvvKvhkyyu0ODYT60DuZWZ+Ecoja2SmgtMkVMiLKtLtBYqgVTbO
         fz/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtdw/r/jEFiL6VpbeekedNnynfTOdBrzs2LU3g//a+nAvOnAN8o5UIDwTHu6WO9vrWE/o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYzKUe+rBdQIvB7r+1zBk8Rf+26S/151t6xOugnojra1hMgKaz
	vBduvAwZzCOFFgnDWJu8IUXfUogWPiwQqKLvuu0LfsBM+hKGpewE7Z2JP23m
X-Google-Smtp-Source: AGHT+IE31cvGT/N6V95eA06b6sHMWCe5xvfNaDUEwVbsa4UyYKFSiLYAh+OpvI2B3F+xUi2OqHNUUQ==
X-Received: by 2002:a17:907:26c3:b0:a72:50f7:3c6f with SMTP id a640c23a62f3a-a9029432757mr1209442066b.14.1726400645566;
        Sun, 15 Sep 2024 04:44:05 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a906109676esm188778266b.33.2024.09.15.04.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 04:44:04 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
X-Google-Original-From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: reset: add schema for imx8ulp SIM reset
Date: Sun, 15 Sep 2024 07:43:09 -0400
Message-Id: <20240915114311.75496-2-laurentiu.mihalcea@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240915114311.75496-1-laurentiu.mihalcea@nxp.com>
References: <20240915114311.75496-1-laurentiu.mihalcea@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add schema for imx8ulp's SIM reset controller.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../reset/nxp,imx8ulp-avd-sim-reset.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml b/Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml
new file mode 100644
index 000000000000..f6797966fd35
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/nxp,imx8ulp-avd-sim-reset.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/nxp,imx8ulp-avd-sim-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8ULP System Integration Module Reset Controller
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description:
+  Some instances of i.MX8ULP's SIM may offer control over the reset of some
+  components of a certain domain (example - AVD-SIM).
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - nxp,imx8ulp-avd-sim-reset
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
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
+  - '#reset-cells'
+  - mux-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8ulp-clock.h>
+    syscon@2da50000 {
+      compatible = "nxp,imx8ulp-avd-sim-reset", "syscon";
+      reg = <0x2da50000 0x38>;
+      clocks = <&pcc5 IMX8ULP_CLK_AVD_SIM>;
+      #reset-cells = <1>;
+
+      mux-controller {
+        compatible = "mmio-mux";
+        #mux-control-cells = <1>;
+        mux-reg-masks = <0x8 0x00000200>;
+      };
+    };
-- 
2.34.1

