Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DB941837D
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855070; cv=none; b=uxSuop4ALb7dTP/35gskZVQ93bsbexjHp0syupL1DIxX+VEP/5QupEJp23oA72tY/Q9OYWCccfnFueW824YLuK7ebbJataaT7h11z+eAsHUbTfK4pcCUc9H+VZ48Pk3QKw9FOsAVG8Hl7p1Sl7HZSupQgkmk2E0GjAlevD8+iQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855070; c=relaxed/simple;
	bh=t59HA6ckivCe/4YnKmDvJmeL7B0/skKgvWKi9ud/Zg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rWIcOvwP7cKLJRhHfvd3heGZ7bgDFuwvXGp8tehTPbVtsGbfZSCsf0hjAUYMCiMDvtAguGfX6hip8coQQWsL0Y6XiYz9b2yvCWsStb9i9zX14pABBN602Tq2EOGtBGMuiVkdu3NLDNdS402otStq36n0offFlHnf2E/OtPFJerk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8PUrVMJ; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8PUrVMJ"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882c1f2baso2192814f8f.1
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 04:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855058; x=1791459858; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmnXElFSJd4KcBqGRqP1X7uyQN8BRiiAkPdqtLDtOZY=;
        b=G8PUrVMJkxGhceCOJ63nhhCwJYW3GHFZRqguWNt77ZhSUAGv9hmRNZlrJjRoQdoWc3
         Y8Qujwf/2RYs7SxKyElAlciiT8n3ZYn8S3qeLHLKI2vW9dgvrHSYWx6CJvMm5QXkHRtV
         Qkm3O+tIyVD3ijQH7iiDrU0fxzIQMDRbJUP1daLYkBvfHXXCmbZ5j2WoFA70UvU0ihhs
         5T+hT5qaNDeKgLDVM+AaPTH1Lud94ggm3mzJ/o2pUKI/4F7/PjndFlZmmuhurdGauElu
         GXbJECCeX+ANk3YcPSnAvD7ZCnKik7A/X+ZCAwDrmkthuBUnaxnjtAxJ5Bxdy/e7vQMK
         HkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855058; x=1791459858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmnXElFSJd4KcBqGRqP1X7uyQN8BRiiAkPdqtLDtOZY=;
        b=f6Sd1lp1GhxWMMYaNji/t9u7cvLLpAajMJXZYtET/VQk6JN831W5juqnCmnFEv1GkP
         tHJdFH2bcT+1Ieqvd0WV9UBqCyx2Y3OVbpx9ZVXu5syRmvuYCZoQcEXAju2PcCFW4enm
         T9hPNXTEdS40u3lzm0MttivrSlCqy965U7sDlBxHlqrQCmpMQ+c0EsqObNTxcwVf90Xx
         HMq7NWlT0ESvpJxb1QEic7t0s6f0d4KA3mWRtYzT9ByPMMY3iGQYiF3QZha+bDKkzsGn
         dFl15VyktjC3+Yzpinz/8X6KABrjq+FUmNGRMjoz0lJZHN4pwy3Zanum93CbfXoxVGp0
         7p+w==
X-Forwarded-Encrypted: i=1; AKwUvByQn7RiIUciNYdo8b+RIluqVyV94S6xv0TaHwSdEh5Kc4ZwUdcPxo9whfJBov65KQRgJLQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYKaH+kChlOu9RnMDbIrzlZ0EvfGKMnMqlHQZNFmjWeEjlK71CP3
	jNgel0Zy48Ksfu2elJLCWYBaxlwGZHeYbx2hcO6nCwv4c+1Apu+jH8Rg
X-Gm-Gg: AYBFou3z+fsfG+7x4EC0Zg/LLTkR7AqGlV5gtwMsFrAbieGL8mwcCcotUPILVMrhvYD
	O6eHxIjgeUv9mf3sY438y/KHXyVwfxSCmDIL/vp5bn5bccfWZDWSBmibOGPnpXl2nUI1TwNoSiB
	QeF6RoKlRUSELqLUYIDQnGq2l7SIdOmazM9PWWjEOrRGb33pegYx2khS8IJzRyohFsneks/liOt
	8qoMzXgJoQzPzxahpAtJWPNAIbdkvFMDVrm77aHAlUe/wh1cgHJ1hJ97l4XccC2Cmh4APKNGkIZ
	oAgXFVfcmNXBubqizSJohslMdmrZKKepemvRKNOmQqiX8ZEILM/n6Iz5YkGN5NgWUJ65CiXcKzc
	gkodlL3STad2gh3oYLz84zEYY1esMaVp466BotjxadUSW46wdLcOggW21lT2kwIffE4YE/ejAj9
	UT9boeUuU7HtsDxVuF1rtYy9lmfygoXCbEqXZhn89AxVUvWaCtsiQHAzn7Y0PBtCpdvX6EihPhQ
	dW1ZZD0PJhEHvQz64SGxacOyFaDEAU3iof9CL+2InnXyVDwf0ZTIyzXulTwM8aRmQvsGEbDgbEw
	2IQB2MAW
X-Received: by 2002:a05:6000:230a:b0:48b:515:f94 with SMTP id ffacd0b85a97d-48b05151156mr5639332f8f.51.1790855057900;
        Thu, 01 Oct 2026 04:44:17 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:17 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 13:44:11 +0200
Subject: [PATCH v2 3/6] dt-bindings: connector: Add Toradex camera
 connector
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-3-7d1343ecd3ec@toradex.com>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Toradex boards route the sideband signals of their 24-pin camera
connectors to different GPIO controllers. Camera overlays which name
those controllers directly must therefore be duplicated for each host
board.

Describe reset, power-down, detection and power-control as
connector-local GPIO functions. This lets an accessory overlay remain
independent of the host wiring. MIPI CSI-2, I2C, clocks and supplies
remain described separately because the GPIO nexus does not abstract
them.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
new file mode 100644
index 000000000000..27fee3defde7
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/toradex,camera-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/base.yaml#
+
+title: Toradex camera connector GPIO nexus
+
+maintainers:
+  - Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
+  - Toradex Linux BSP Team <linux-bsp@toradex.com>
+
+description: |
+  Toradex carrier boards share a common 24-pin, 0.5 mm pitch FFC/FPC camera
+  connector carrying MIPI CSI-2, I2C, clock, power, and sideband GPIO signals.
+  This binding describes the sideband signals as a GPIO nexus. The other
+  connector resources remain described by the surrounding board device tree.
+
+  The nexus exposes connector-local GPIO function numbers to camera overlays
+  and maps the functions wired by a carrier board to their GPIO controllers.
+  GPIO specifiers contain a function number followed by standard GPIO flags.
+  A board may omit functions which it does not wire.
+
+  The function numbers are:
+    - 0: Camera reset, connector pin 11
+    - 1: Camera power-down, connector pin 22
+    - 2: Camera identification, connector pin 23
+    - 3: Camera power control, connector pin 24
+
+properties:
+  compatible:
+    const: toradex,camera-connector
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-map:
+    minItems: 1
+    maxItems: 4
+
+  gpio-map-mask:
+    items:
+      - const: 0xffffffff
+      - const: 0
+
+  gpio-map-pass-thru:
+    items:
+      - const: 0
+      - const: 0xffffffff
+
+required:
+  - compatible
+  - "#gpio-cells"
+  - gpio-map
+  - gpio-map-mask
+  - gpio-map-pass-thru
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    camera-connector {
+        compatible = "toradex,camera-connector";
+        #gpio-cells = <2>;
+        /*
+         * 0: Camera reset, connector pin 11
+         * 1: Camera power-down, connector pin 22
+         * 2: Camera identification, connector pin 23
+         * 3: Camera power control, connector pin 24
+         */
+        gpio-map = <0 0 &gpio1 0 GPIO_ACTIVE_HIGH>,
+                   <1 0 &gpio1 1 GPIO_ACTIVE_HIGH>,
+                   <2 0 &gpio1 2 GPIO_ACTIVE_HIGH>,
+                   <3 0 &gpio1 3 GPIO_ACTIVE_HIGH>;
+        gpio-map-mask = <0xffffffff 0x0>;
+        gpio-map-pass-thru = <0x0 0xffffffff>;
+    };
+
+...

-- 
2.43.0

