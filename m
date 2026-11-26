Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697087;
	b=AATHSpwJ1UCZZeSH1aQV3U0Dxs9hx+UfGPsBBYqjIWCfa9LohiVxEsgmzXwRfXG+kLFw
	 3iDtpi9eYBWrT5vZAToWBnAx/SnxOwflCSxu7jrE+iJ+IaoTe1/UQ/S/Xoz3OwAHp3aBh
	 E/cSiPXlycoCpN/eOhqMIe1slwI+0Tc5SYpRjpn29qKrfUosGG48rB2e6tiX/eStM011b
	 2u4RAc6+SkorUANKaEk1mymoOlyRVpAPzm7uMCTsnYEcR5hxnXZ3wHpqYYBX/2+3Gzqhu
	 BnEE1LzEvtfMbcWMtJ3yX3FeNMUlEDhu3M1OI7mEeVHriExrk4PrNTJq1VPDEwctCaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697087;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=A20fLKROFsB+9jgy05kR5kKvj3tj2h6ibj4IHp/qrKg=;
	b=SzZK7FjRSi7bAxusZ8xSvamzXCL2x+xd4PYRrAPsbQhJSd0fM2AQGxSfKCmRGKKnn16j
	 2jBIZrQFiQHhKzC3vx3julX1QigZoaGYC2LxzDzsN1qVnCZG8ZKQNK/sSxXGC+svSvRTc
	 LvDm47tzhXGoe7TGJ/vV6gsH6a4v1NnkjUPeYSLnPCow+FxywgngZ3LCxJet/HOmo2cqq
	 8GM3Je7OaW3FzcrcQj7eBVxaaWRgg0PmypHwzY8wvwVAC1oImj9pWzw0gJcY335MH8l5t
	 qCNhZPhlH1fRTjgfCR/MyTw3sSsH8xOwYxnWHkO4hbkRQ7ZR8L0oGkuXZQeurQNDaew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=MNtN0JMY;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62365606A33C
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 12:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62365606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=MNtN0JMY
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77B17109597;
	Thu, 26 Nov 2026 13:44:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795697080; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=A20fLKROFsB+9jgy05kR5kKvj3tj2h6ibj4IHp/qrKg=;
	b=MNtN0JMYCosKEqcmPTVBuJrziYc0Q3Efs21+c88cNwqYcdpiCQblShv4j00diN5tgnciTD
	BgW97yBFnmvytnXB0B+B8PbUEfPdfBbjDNiJ7yBh418zf3e+bGXKRMvbhwubj7cQ+me3Lj
	rukBxyji42/ZrzvNbm+jzxB58Alp3QGO3yXzmd+xPrjRY/ZlLb8m0q4wtjGVMoaz57xWF7
	yuC8zXMnO5BsLBAx8e5KcM1RfSZi+gJxzimFzjFFW9W/U8zk5wfAJ5XxrpEnw7hdDz0TF3
	gmj1D3V3obqggFBr5LPDQAzFUC97mzkIGUtKbWjY8LtfaO4DmtrxBE1gKDw+Fg==
From: Lukasz Majewski <lukma@nabladev.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v5 2/3] dt-bindings: hwmon: Add National/TI LM77 temperature sensor
Date: Thu, 26 Nov 2026 13:44:01 +0100
Message-ID: <20261126124402.3015577-2-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126124402.3015577-1-lukma@nabladev.com>
References: <20261126124402.3015577-1-lukma@nabladev.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add binding description for National/TI LM77 temperature sensor.
When compared to LM75 - it has two output pins one for interrupt
and another one to signal the critical temperature alarm.

It also has only two I2C address pins (A0 and A1) - possible I2C
addresses are: 0x4[89ab].

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Guenter Roeck <linux@roeck-us.net>
---
Changes for v3:
- New patch, as this IC description is added to Documentation/hwmon
  as a separate entry and not to trivial devices

Changes for v4:
- Add Reviewed-by tag

Changes for v5:
- Add Acked-by tag
---
 .../bindings/hwmon/national,lm77.yaml         | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/national,lm77.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/national,lm77.yaml b/Documentation/devicetree/bindings/hwmon/national,lm77.yaml
new file mode 100644
index 000000000000..fbb6e711342c
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/national,lm77.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/national,lm77.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: National Semiconductor / TI LM77 Temperature Sensor
+
+maintainers:
+  - Guenter Roeck <linux@roeck-us.net>
+
+description: |
+  The LM77 is a 9-bit plus sign digital temperature sensor and thermal window
+  comparator with a 2-wire (I2C) interface.
+
+  Unlike the LM75, which has a single alert output, the LM77 features two
+  separate open-drain outputs: an Interrupt (INT) output and a Critical
+  Temperature Alarm (T_CRIT_A) output.
+
+properties:
+  compatible:
+    const: national,lm77
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C address of the device. Depending on the A0 and A1 pins, this
+      can be 0x48, 0x49, 0x4a, or 0x4b.
+
+  vs-supply:
+    description: +VS power supply regulator.
+
+  interrupts:
+    minItems: 1
+    maxItems: 2
+    description: |
+      The LM77 has two open-drain interrupt outputs.
+      - The first interrupt should be the INT pin (window comparator).
+      - The second (optional) interrupt is the T_CRIT_A pin (critical
+        over-temp limit).
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        temperature-sensor@49 {
+            compatible = "national,lm77";
+            reg = <0x49>;
+            vs-supply = <&vcc_3v3_reg>;
+            interrupt-parent = <&gpio1>;
+
+            /* INT routed to GPIO1_12, T_CRIT_A routed to GPIO1_13 */
+            interrupts = <12 IRQ_TYPE_LEVEL_LOW>,
+                         <13 IRQ_TYPE_LEVEL_LOW>;
+        };
+    };
-- 
2.39.5

