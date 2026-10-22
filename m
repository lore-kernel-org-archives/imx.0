Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679491;
	b=36WYZ9pCD1J0IgxfZaAXoeyZkCgBNvAe++h0heRmlcCXdH4heY8Ckwbb35nB+FMvI9Ep
	 9OMwx8mf7t029J3qV25eWYRQgTIoezBX7/eo+hazcsdtbSNNId4G9TtmS8Ty0w+wOiYAP
	 5C14JkO4PlFlSdn4KWKT9jdDyxmgw3SAW+nZ9jQ978gHXkclWXtVqX25pPrKj04I+9PK1
	 8zZsTJw8aAnJk8IW7IspVufG0UemIdpANgxP0Qjrt+JOTvb/Y1EPLUdoKdoQnSOFOuJH5
	 K+SrXDt2US+NkjPJvuKyWpUMY+pxff2yN6s66M+yfUM+8teEHgZV0u/M7biPRt9romA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=VSDmw3zZL4GwSBLGTgTs+YZpiiLncoXUqRyZW9au3hs=;
	b=GQPDeisrWW9NU7GS0Q93+uYjHVRNy3/QNhmGfPOLEXn5Kqzf1pva9bYD9/7XjTf07E+d
	 hXtax/IbqjWcaBRKLHiAOpVrU6kQmD0WS2sF/8KWBD051N2EbliX0nUJZgGPfhGSTHkoM
	 XuOjgIBfDwdIciOs8T3gUmVzo5uc7h0avCW5PvVo9FIpaBdFBwUuaFxgdz0xxfzMPErxu
	 XU0tKqAVbXnYErP3gZ3l/xrzgWRkzT9p7KxL12JtoQ25BSFPKYwW4Do2KL1FKyn9JjNoL
	 6vxMXCIl3ZjKsBcIbnm/bhsCtulhkAT5+LM3jHxOT2dqHjTqhg9lToTyjwdgpp9SuSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="V0hr7Xr/";
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA8D606A322
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFA8D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V0hr7Xr/
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so15712475e9.0
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679489; x=1793284289; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSDmw3zZL4GwSBLGTgTs+YZpiiLncoXUqRyZW9au3hs=;
        b=V0hr7Xr/hEcB2FXAsTHmui35aui7vwshhORzzrlZTkpt5HshmlZEZ+u3+DK2t1KIXU
         jnqv1f96BKaKew83cQvWD/1mNo//VltHqGup60yUdNfuUhmCW0JLI+JDHvOUN6+YlNqm
         s3y8sLxnjSzgPzfRvCd6Omj+IiZHVGBC8Rb6XB6B932n0JhUr0DgMcdrp7TpaIrkfjuJ
         OmAf16yNBKgkKzfI/nqJ7ITuHQ7EjtGqp2/RjbMhLIMqUVKSV+z/+IotbdwKf4U8Ph71
         2YPydyOTeb+lG+nS+H79FpLa9Le7jR3ayzbcbQHZhdjbE2AlDawT/e2va1BEr7VdT63n
         2YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679489; x=1793284289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSDmw3zZL4GwSBLGTgTs+YZpiiLncoXUqRyZW9au3hs=;
        b=pp2FTYrFKgvK4dWaEEtW0WiYU52oKzpoWX4koTPEZtVR4+LA0ihS/l0XGhjViO88zj
         mqJj/7gsa4EiKUuma+1BlXgt7B6FFq2KRDRSzyLfE43CZ1SKewH6gYrOUksfjbVUa/YJ
         xevGoWmqua/PRk/inPlk38aJ4XpNeEQMNzpRseDdCKTWSEHexLjDUx3ZxVJCOB2akZzH
         EnLvpVxzMlSyHq5RLBJh5Bq8/PnuTdFNuB30BNAhjAjTBfFrR5ffN8e39kYgTZgxSyq5
         NsLLOcAVQvl0XxD7+vfMlYMhAQhJ33PdmPr1ymcf/p5rB9yjPu8SR3ZquzlJ8GJy7xoF
         kSIw==
X-Forwarded-Encrypted: i=1; AKwUvBzvpLo9gC2xPX1NHdhjAmR62xSJqh2PGMy5JXSBPI8rSuLQGv+H5Rv85ldRRqfQd4LKO9I=@lists.linux.dev
X-Gm-Message-State: AFq9FYLiy94bAZ0Rn1VXVLZM+Uy72XnQmiEC8OJdASL9yHPUCWlYqf/f
	N6TcA3Hf9mpiETxtBI8+t5uGuljyeEhTGIwhw45lxAIrlaCn7PyGBu9lJZgn9GW6
X-Gm-Gg: AYBFou1dTfLH3ECiAw0cZYjLQMbg3baAU9Sv3Eq4dej8OJrIRcRNcstzzh2Y3qNRYiR
	xb/zRpjx7CADN1lhru6XAQoM7f2M9mFFhVEs5HJ+LJtzVSMH9/GAhG8iUOcK94MJQIw8dx70kIC
	RCXieVII19iS0VMOBitG6qXeai1RA6SBwThAqQpNzQ4yYmSVWoNaSVJ8wFJHEo6KGy12e21dwil
	4Be8ADPl3asewN4nuL26WymnXTYRWuUehwR1zOivo1aS8096eUZp/uY4t6HrfaUq6p8PzKTZN7r
	J6rj6lyEaAfU8Z3UBO9sGI2tUXuCeaduuPctyHrpAWMS76i11slSzBF5DLl4y/8BwTcW2xcGtWJ
	JkRNSvrpPl3dWt3ynvhw/JQXFT6rpznb1gpQ4gkRym4WBnNf5IJf9IhmX7SLwp8Sp/yLj37kIy8
	aqnVZVzoGi3u6PKkWBDPAcG9VeP1hdyy8JEszVZy/EHNV8KSNPc/KBmmyvXpavPY7pMM0tYlaHm
	S/oeuahXe53a9Q/+6ZDcAGD5ELLHW2QRUgqiZr/LUCflVw3eMGz92ClvFHMdO6eiJ3PJHOI3p+Z
	goun7dyTUT8Q2t71q5rUnGczIyq7RWdXZiyqnBwyY6psjxPqiDsGx3sQ
X-Received: by 2002:a05:600c:4fd4:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4a1fdd53c8cmr107350405e9.27.1792679488862;
        Thu, 22 Oct 2026 07:31:28 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a200f4d16bsm85693745e9.2.2026.10.22.07.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:31:28 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:31:25 +0200
Subject: [PATCH v3 1/4] dt-bindings: connector: Add Toradex camera
 connector
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-verdin-imx8mp-hmp-camera-ready-v3-1-90a30b0b0d55@toradex.com>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
In-Reply-To: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

