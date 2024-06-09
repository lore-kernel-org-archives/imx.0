Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86CD17565
	for <imx@lists.linux.dev>; Sun,  9 Jun 2024 13:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717938072; cv=none; b=eSwOJ+VoGg3YLCwQccb0w2jFr7wKY8tBvPK7Ch37DAzYt1uZbdcIRPcwnlthsTFrGZ910oK1PJ9sExbfugGzUyIyb3fGwjHOGCE5x4gfsBgU6dNd06ESH0ibildj7NmL/zgI5YlPyFdwwJZ8uP0af21J9CXxp215n0asHSA4Gmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717938072; c=relaxed/simple;
	bh=j49VU9MU24LvpW7FfwuoiEMwbcnOP7x2EnhIo7iP/Mc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cOoVuasI5h/Fl2TcBg+8f/QFnqsSvsJCgZJm61vy6YbJ0xssTtA56W8uDVRDqrrinfaS+Z/nyOZm+9Owm+XT8SAgw/3YFI6FlcdAp9Wfy5sJV6fWARgPrUnbVqU/X/6PwrBR8syES0XchsXaMvFFPAP6wMmKzLHAhcNQxzw6uCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8hK7k5Z; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8hK7k5Z"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a6ef64b092cso180202866b.1
        for <imx@lists.linux.dev>; Sun, 09 Jun 2024 06:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717938069; x=1718542869; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REsRox1e0RuQ8D5QAaZjLhlhSVKgshVITv7B++1K8Ss=;
        b=I8hK7k5Z4MPe3c+kulk4gv/+C06+J50t8Rn9I1g+st230aOCXMcB2XFsVMLFiplfmD
         oQJG/0vpwMaao5enHGiITfBlGSwUb/wS134YIW6y9y/qrCcndBqrUWPhE6YgLSVbsKLb
         HfaCKU37kzC2ZIYM6PChV0jKZw00rPMgDC3Kk8kroeIVdxBuFHP4Xd8yfDabZ4OsOeTM
         CwpHk6L8gjnFlJpyBkPC2qdQoohJnyq0bKhom6YSoaeKjalKgKnNbBUTi09m5qQc9kEt
         iq9Be61op4oHNlbzH2GEUvCcRQfnde9toftxMLA6txzyztcHVqheU4sR2yCxGeHhC0M9
         kDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717938069; x=1718542869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REsRox1e0RuQ8D5QAaZjLhlhSVKgshVITv7B++1K8Ss=;
        b=OEE/pdcBf87C7XdNVcq3KV6W5kfEnBOKYH0WrGge4Vra8Z7FTM2jKBgksT22b8J88N
         6kVI0zepacWi4VYgbr/iJyUHpfFPhnhQpKiVgpcn7Wpl/szeME3ABLgnzmZyTBN6D3pm
         OX2zSH2MTFINkW0ymYbsLTEiLwjYnPLIH8UV+r5sdviJo6fVayDNvdxbxVKwp7RSVGri
         xixQ849qj1PH7FpLtw+KyxV7qtrJ+TYWOSO/vnYkrgahQs9FRNH/YsuqQMBJfRvhOOhX
         Ff9nUQ4JeWKzD9zWbckOJW2Cue9A1BaW72wsNd8r0QHAMA2V/QKPW8eAfVWPgMYzwFe/
         4HAA==
X-Forwarded-Encrypted: i=1; AJvYcCU1iQ9zckWaZUQ6B7r4z+zYAL3zYVh2Os45XtO0LpjYIEUHWxd+WptUo7d+tXnQPlhuaQGknwAzgTG7ZS+0IG7sTc15
X-Gm-Message-State: AOJu0YxoJRc8rbch1RWsbLN6J+bR5KDNrTzJhVFCbJpwToRJJWTZpnD+
	stHmP5RqT71YIABKUNXiwKJ++0eG4raZXLfAmlDkEWlbGgn49+wO
X-Google-Smtp-Source: AGHT+IHuwX9E4jd+uOP3g2E/VCQpCP2FwgjdCll+ONft/3eSl0lcdXlxqQ5XLFW8iIp/cysdKtueIQ==
X-Received: by 2002:a17:906:4a4a:b0:a6f:74:d389 with SMTP id a640c23a62f3a-a6f0074d52fmr240671266b.14.1717938068825;
        Sun, 09 Jun 2024 06:01:08 -0700 (PDT)
Received: from lmc-playground.localdomain ([188.25.209.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f1841fceasm85961266b.70.2024.06.09.06.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 06:01:08 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: laurentiu.mihalcea@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: reset: add schema for imx8ulp SIM reset
Date: Sun,  9 Jun 2024 15:58:59 +0300
Message-Id: <20240609125901.76274-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240609125901.76274-1-laurentiumihalcea111@gmail.com>
References: <20240609125901.76274-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add schema for imx8ulp's SIM reset controller.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/reset/nxp,imx8ulp-sim-reset.yaml | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx8ulp-sim-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/nxp,imx8ulp-sim-reset.yaml b/Documentation/devicetree/bindings/reset/nxp,imx8ulp-sim-reset.yaml
new file mode 100644
index 000000000000..e7faec55ff36
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/nxp,imx8ulp-sim-reset.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/nxp,imx8ulp-sim-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8ULP System Integration Module Reset Controller
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  Some instances of i.MX8ULP's SIM may offer control
+  over the reset of some components of a certain domain
+  (e.g: AVD-SIM).
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
+    $ref: ../mux/reg-mux.yaml
+
+required:
+  - compatible
+  - reg
+  - '#reset-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nxp,imx8ulp-avd-sim-reset
+    then:
+      required:
+        - mux-controller
+        - clocks
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

