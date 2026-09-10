Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016F74AB1DD
	for <imx@lists.linux.dev>; Thu, 10 Sep 2026 15:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054694; cv=none; b=Ypu1Mgk6KfBmPGwHfSttYx7prCNgvH7SPlS+X+AM905BgGeT87hM5KIRCfVVKoNWZqVLZAOMu21IuzoVqeTv2zuNImZDwjwhSrssoO3dpInr0FPVYzsA20BI5I58HrsB3vRqW6VVZ9xI6GoZwRXxGFr7+Fgb614xEVUj6G4tzF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054694; c=relaxed/simple;
	bh=n+VvfaxRRJUSeWj0E6gWMuoSXmp4pUY5fpFqR2Pl2rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HQDR8AilFhEFAl2+liBroM98gXu3KJefCKWFWBm8iOOB7QzZY6jAcXUasZHoBszvypjlTLLSaONIBFAqB+GIVi62NIZLOOpRb0u4AC4ne+RY+YJGaRgIjFo3HDtDDdai4XS2XwyYv7bcshhLbnjUsTmsRiS/jVqmaY7i43Xg7PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XR5PRqjx; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XR5PRqjx"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so824320f8f.2
        for <imx@lists.linux.dev>; Thu, 10 Sep 2026 08:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054688; x=1789659488; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sq6kdCRd09J8/wwZWCzwogvcDt1j5IWHfbvfSux7KiE=;
        b=XR5PRqjxE71IzcLoqfEsefcMfnZuMgKsQfKna7ZWtjbGPPYv0de/r6PSvxZDI40zQE
         xVvi2jM9ibh22GAI1+91t9P9HrkMlcs6OEJ9tzYNdW9PBPAT9/RuMUyC8h6F2gJw6TmZ
         G2Y/vK3wL8oQSU8ioYdXCSsQucOzflq1MX6nLpGO8pkw7ysXoG6ZMrXe7oIN5uMAr7mp
         hlkUbXvaeT3l/l/pKKth4Qoax65J6bu2y8vW+DtH1PnHlIUT+1ilAlo2DImAqOoOxvGk
         H0luk3qdJ5ZFhN+sAeuMhy/48NpDbDrfUghAYVaJKkGiDSgP3euwB1Jo+WtkuaAFe+Pv
         MzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054688; x=1789659488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sq6kdCRd09J8/wwZWCzwogvcDt1j5IWHfbvfSux7KiE=;
        b=djMkbdFXV2c6JdTh/IxQWS99lb8RLOfj7fVsWXmwX4eBn59txQkzVlmXyVR6Z5Wxz0
         GpVhiJCgvYPHvlUFOGJ1NOjftGxEF2tWkrTfh9acSaZzpzwLGrT8tjMufX8Dotnx1kt+
         YYLmjGq3I0jhsqyheA57+/Q7WHjHHbXoDWLw4Z00YzNrkrBMIU+hLXpvbhsYx1jD8KS6
         utgDuZezk8NG/dsV1GxYCMVL/9mERoewH8rYhHBkkeB9VKk5sIewc4UDhnKbHpMgVM6/
         Z/qbmUIITIoNkmwT9gIlAKNhaedomAAtTvU9p6Z1ZOqoxkCypDlLzbDEApR3ZxXM3Jsw
         FoqA==
X-Forwarded-Encrypted: i=1; AKwUvBxDVwN+BHfx1O03v2IndqgkO6a8mVWjQ4CA/h4VgeNr6GlB6JYLRM3SIYVvVIAjkoflFQI=@lists.linux.dev
X-Gm-Message-State: AFuF++mUEVIb7zAwORSbO1LYP4qHz+020F56C7yaaU5+6BJG2XRIkCJZ
	pMjz9uy1kE5kDN0TLdW2e2WsshNK27Cd4QHk+rXT7xFRoxjlco+DglhiWM6212qg
X-Gm-Gg: AYBFou20nICSZSC8SiuZF3ByyQeTfeunuFCBMp/Ounwf2CAOHuKqW3VTkgie/fEO2oA
	OQCu4vEu9eR6N52bxmbqwVyYdCKqE/ilOFi7lTSn8uXye7pf52g+9vVpy5t+PtAWYsX8Ut253S7
	0eny3gXLjW+kII+LxT+7PsmD8asru5bWUTdljE8yEnLF1uVthEemGnnwLOngR9/xrGXkMTBZvcw
	0hhDMp/h+iV9fMZJ2f03SG2hf13Vfg9LQOBfPl5Jaq7foGjjhDLGecU3dojJTrnrQ0svqHxTotq
	pMONdJVoMfJPqS1bV0zzW7Sl8tJKt3j6OCpGbxLsmutX185ICel4q1czeW0PC97Wy/o1tzqVPUI
	4fJiBgUyhGkdxtWIOeXlYZwm/S86Qd1yxdn2JSsvU+kVmPw/upUeQjPUHjM0tifQVWr5a/jzeup
	2/UBjpt1hNP9e07Uua7a0f9wcD2ewBS//fBjZtOmot7xeOv6bdXuohaf6lxyXDqofi0EkTaNJ+f
	kRYYQL8i2jejPFrIVgeDjb7ZkNBYr+QQwRQ2ub3h80SBwjnVSMuTIJGPf6IAPFo+HJhpSZcbA==
X-Received: by 2002:a05:600c:8b43:b0:49d:1f32:c911 with SMTP id 5b1f17b1804b1-49d258cda6bmr82799305e9.3.1789054688174;
        Thu, 10 Sep 2026 08:38:08 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:07 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:37:59 +0200
Subject: [PATCH 3/6] dt-bindings: connector: Add Toradex camera connector
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-3-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
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
 .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
new file mode 100644
index 000000000000..06e6836e1aa6
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/toradex,camera-connector.yaml
@@ -0,0 +1,86 @@
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
+  Toradex boards provide 24-pin camera connectors carrying MIPI CSI-2, I2C,
+  clock, power, and sideband GPIO signals. This binding describes the sideband
+  signals as a GPIO nexus. The other connector resources remain described by
+  the surrounding board device tree.
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
+    gpio1: gpio-controller {
+        #gpio-cells = <2>;
+        gpio-controller;
+    };
+
+...

-- 
2.43.0

