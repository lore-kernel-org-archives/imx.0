Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB456265CA0
	for <imx@lists.linux.dev>; Sun, 10 Aug 2025 22:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754863813; cv=none; b=Vldxwv/S7RLjEyxgeNnhJJnV8DMdiQSPLFAhJNg3yP/6c/6zdk9hoc5pFzgLAJnIG9ETrHbvBrsqEiwg/378wIKaJp4FbusjygT2kYTuQr09T4v+irT+JavF05ccRrkPz/Jc4tkRlC2mGiJZEIPTyMBfMKy13h2WX7wdy9U+xIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754863813; c=relaxed/simple;
	bh=LHPFferjbDH9T0kN0a6xyFMEkYkvwnWXhtJdQjKXzyM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tg43VmQvvhbdd2AXFTeGeCkUq2a8Gl2CwvX9VqEqW4ojgjcV9p3iDzQeAAEIQBuBYaWnc3aseudPj3ljNJcQZXyFviFLVlEMoP4CHaJUWQQrWK+5T98Pt3vhNJnHLzM2iOMEj8b95Xm5mLhiT7/Kj0jqFcDLE2VTBVEK9wcstO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=willwhang.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31efc10bb03so3125911a91.0
        for <imx@lists.linux.dev>; Sun, 10 Aug 2025 15:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754863811; x=1755468611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+k5QpSf7/m1CpBtqnc0T1oblUwlFDKuqZ/ZF6inHpI=;
        b=wZvAX8jNByJOt3nvvvqpzLXM3na+7JQ/ng/9GWZkx7UTz4dNQryObnk+tRjd1CCcxh
         7S3TcAYb7jLDn4R4zA2IVihPxsQqTM10bdA0fYMqHW6/dihthFUZRE7Y8Pg5g/EwEa+p
         NqvibLllyV49pGFoioCSgAoqmHojtNenWtqcasA8Ceh78V2GNKWRdOiTzooaZs9vLOtT
         Rxzjn0hxWoxF3zsGTPytSF/L9rOVGEL/RqpjHV4VCTR9QfhMbVEJ7N9NjNL7RBNf45Eb
         3vWBpxMzuOpVdzBIn9oLVCI6xtJr7dS+JHQfxIYCaYeVpI93EGjexlVYiKEh0/wW9ywu
         aYdg==
X-Forwarded-Encrypted: i=1; AJvYcCV4e7YY80FGB/O/reMESlSduGia8mcpnXlaMI2gNpox+4SND9Bto9q3EkQt8Ci8myiGjHQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZZ7Qoh3LUNolOYs9ffbj2u2WBcQ9azXcYspeX3Ehvlwh9LfS0
	DvUaZMEQbdoiwQ/Ovfv6bUMoXd0HoKNF6apIOkLaPQ6Ho4v0mvTVZyj+
X-Gm-Gg: ASbGncsnm7N+Uy7eW3y31agnOFFeB4fHW+Yj9je0mQvnRt+kG3VjGRetGyiU/UVR7GZ
	t/t94Oe/u2o5i8IBZV5fk9Hs2oIeaDliCPvVke5F0lnCLeFn+OxXISqicRxjEFSqTo0FoZIcj6N
	1lJ1BUPM0MGw99RzLgyDvFRm2mZ88da2OiRlso0QMgF4MOosNLy4Gqji71tOwV8zRTwMf+T8ia0
	Fz+VPmRNw4f5AR4w6yb8qRMX8rRqvgfZ2+rjvqVa0ce2zlxgFg1cki1ShknvYz4kO+fMYzqZsAq
	5q+Hpm5lccD7NX3bUYr5ddA3Jg/NQR1BgdEwscBT+lapVgfm5FZdPKg7Uhx9LdiMUq4N+sirZfI
	C19k6moJCztTDkowAq7yMoI/sU0IPHDcSmOMq0E+EuVag/qprUUecD1DyKiUW1wTfKhM=
X-Google-Smtp-Source: AGHT+IGVl8CJiFWkklO6I5zI6wCxzAAtwQhz9tZ2vrCBq6WZrDk7LnhtS7MG6Mvb11mL11vcwI6Hpw==
X-Received: by 2002:a17:90b:2890:b0:321:38e0:d591 with SMTP id 98e67ed59e1d1-32183b3a218mr18565757a91.17.1754863810932;
        Sun, 10 Aug 2025 15:10:10 -0700 (PDT)
Received: from localhost.localdomain (c-24-4-34-163.hsd1.ca.comcast.net. [24.4.34.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611d6eeesm13150118a91.6.2025.08.10.15.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:10:10 -0700 (PDT)
From: Will Whang <will@willwhang.com>
To: Will Whang <will@willwhang.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image sensor
Date: Sun, 10 Aug 2025 23:09:18 +0100
Message-Id: <20250810220921.14307-2-will@willwhang.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250810220921.14307-1-will@willwhang.com>
References: <20250810220921.14307-1-will@willwhang.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document the devicetree binding for the Sony IMX585.  The schema
covers the CSI-2 data-lanes, the optional 'mono-mode' flag,
and the internal-sync properties used by the driver.

Signed-off-by: Will Whang <will@willwhang.com>
---
 .../bindings/media/i2c/sony,imx585.yaml       | 116 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
new file mode 100644
index 000000000..020b7cfb9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/sony,imx585.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony IMX585 CMOS image sensor
+
+maintainers:
+  - Will Whang <will@willwhang.com>
+
+description:
+  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
+
+properties:
+  compatible:
+    enum:
+      - sony,imx585
+      - sony,imx585-mono
+
+  reg:
+    maxItems: 1
+
+  assigned-clocks: true
+  assigned-clock-parents: true
+  assigned-clock-rates: true
+
+  clocks:
+    description: Clock frequency 74.25MHz, 37.125MHz, 72MHz, 27MHz, 24MHz
+    maxItems: 1
+
+  vana-supply:
+    description: Analog power supply (3.3V)
+
+  vddl-supply:
+    description: Interface power supply (1.8V)
+
+  vdig-supply:
+    description: Digital power supply (1.1V)
+
+  reset-gpios:
+    description: Sensor reset (XCLR) GPIO
+    maxItems: 1
+
+  sony,sync-mode:
+    description: |
+      Select the synchronisation mode of the sensor
+        0 – internal sync, leader (default)
+        1 – internal sync, follower
+        2 – external sync
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [ 0, 1, 2 ]
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imx585@1a {
+            compatible = "sony,imx585";
+            reg = <0x1a>;
+            clocks = <&imx585_clk>;
+
+            assigned-clocks = <&imx585_clk>;
+            assigned-clock-rates = <24000000>;
+
+            vana-supply = <&camera_vadd_3v3>;
+            vdig-supply = <&camera_vdd1_1v8>;
+            vddl-supply = <&camera_vdd2_1v1>;
+
+            port {
+                imx585: endpoint {
+                    remote-endpoint = <&cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <720000000>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 24c557ee0..ef04ee4ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23178,6 +23178,12 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
 F:	drivers/media/i2c/imx415.c
 
+SONY IMX585 SENSOR DRIVER
+M:	Will Whang <will@willwhang.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx585.yaml
+
 SONY MEMORYSTICK SUBSYSTEM
 M:	Maxim Levitsky <maximlevitsky@gmail.com>
 M:	Alex Dubov <oakad@yahoo.com>
-- 
2.39.5

