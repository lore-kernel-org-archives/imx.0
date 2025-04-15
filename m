Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B485021B905
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 17:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737666; cv=none; b=lt2VE+6UpWB9N5ms/bVi99rJuNVX4wC0ckvKi9AsWhFh507iBvT6byfalk1yhJZC9BTG/im5vskerfRyneWMzPFknGaF6xdCMGC4dRnkIJe4XLDQxHVvnJwLIpofHog8960y5iUyxIXBOlMrO15nSpsQt/r745/t5DfjN+ZZ1dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737666; c=relaxed/simple;
	bh=YogC5pr2hL+OWqcsJP5ip6Uo84tqBvA1fB7I5weMwGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WXyCfzphYiZ3fBvMR6ls23QPdhEsdqJPg9UXQpuQuZ82czsLIyewg9H/pPw/mKDaxxmoDrvA3Ck0hi0pD4xhbOl/w6R+5F0vTE3onVtZuFkVNIqyfhoZ5GceasG867+YdNTO0eF8MB1PCyK2M4TozxW+IjNFstv3pUW/74SP8oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1PcdnRW; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1PcdnRW"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-399749152b4so3397204f8f.3
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 10:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737662; x=1745342462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xX68KJbJESDlbPv3DAVN3pAKIAf/xvWJN3LoAooAL8U=;
        b=E1PcdnRWKNcqX/pnU2tM3EEaIhPzX8HGCkZh8+hp1E5jRfSg1NtZBBqCV3nkCgnGTY
         NTkWBbaE1IOujw6d1g1aHPlaApjLtCAkMT3garzyE3XzPV+vWfVYVXHxaQtVRL0cb3hF
         X4WLVbfPFQYC7Aj2Hqod2ZrHXCvrZN8EpDTiEpTndqAd7oGz8CPtd3WZFVrNBejh4dPV
         F/WMV1dKAUdK3TMBF8eEQCngGWS+BfU0seoEimoc+lIUHFGWorbrbw61xi1QGhsyTp9v
         swez92uuK5uJJcmM64560CHHT+rcC+bro/hee5DzRqSCGptZMB8/lpNiKD/Su/C8j0cN
         4c0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737662; x=1745342462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xX68KJbJESDlbPv3DAVN3pAKIAf/xvWJN3LoAooAL8U=;
        b=JBgYJZn3TrchLgkCWqXXROccFQCKAlHQowbPoQNd9jWuURSLY36e6V4ELXU4M8YufF
         t4E6qs3rH5Ou1zysDvb/k/mAK25txAKbMffs0QwXJG38qJJfzELrBGwzn3bYFmZO1jc8
         T0t+b70sKzIgy9ufBVtkTRFUIhL6sojySX1bnoJZD0tHKhT3WkFOV3O35D+vgvGE0JXS
         EsI1MPnrW8enJXt4MFAsFwEZUysfO9PjAEi1fmPJqEGZKWje7EwRjfQr74gPtBZQtq+W
         T2pegW8T1sKve9AoPET0Tv346pED2lqx4pk6N699ooukFB2aRv0qFIYm7uvgc0WI8M6T
         CNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7jpnXjwUbKLQPcmWEq6RrZhMsIyKmBnLZJtpfS1AO3UNkGEznm4Ug9sBIweGlqgjOyvA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdOoiCD1MLkzy2wOU2pQWSHTUVxGTAn68NTzbj2MI2QXMPNDtX
	mm99ao+l0QbxoPDYU35LOyBigDVU/mWKNRlXj6wu1w1pClT4acPW
X-Gm-Gg: ASbGnct/0EcGTo7PSzhPeV+fifuBWuUTK7YVP9h7yvyyTpFn7bxPqpcbeczmQx4vdJS
	CRwAZeAxTCBb89ErTU+415hZYIpVwalMrHQ9oNH3FLM7x2jg3yEwzM87qiDBbd6ncODW7lr8RA7
	B8GcpnpWEdmxRSuDxwe5HLrc/RO5l4i7HAt5NmPXl9QlUG2FBybMXC+S5DMTm4SeGwt9GhgL2t/
	6FJVDtyE4QMIWEQxepjyPHTiQ/X/beVEPXfK0UuwQg75ctavrryh4jqzFhHICeIhIJbvlkJNQk0
	j6kSP4HUlzU+wyGpIp8eiVVP/Pioq8Y4mBMI68C9wbS93ayOEGEzm9ohcCs0PeRmY+aOhBHcpNT
	cJ7M=
X-Google-Smtp-Source: AGHT+IGexATWs9xYEDx7R0R1qXjf6CfWHffvaeNqe3O3HPpjBxVxTLS162TjpjaZJdg9rRYGMFbrsA==
X-Received: by 2002:a05:6000:18ac:b0:397:8ef9:9963 with SMTP id ffacd0b85a97d-39ee2769360mr251985f8f.55.1744737661880;
        Tue, 15 Apr 2025 10:21:01 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:01 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/6] dt-bindings: bus: document the IMX AIPSTZ bridge
Date: Tue, 15 Apr 2025 13:19:14 -0400
Message-Id: <20250415171919.5623-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add documentation for IMX AIPSTZ bridge.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml

diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
new file mode 100644
index 000000000000..993293ebc4d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/fsl,imx8mp-aipstz.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Secure AHB to IP Slave bus (AIPSTZ) bridge
+
+description:
+  The secure AIPS bridge (AIPSTZ) acts as a bridge for AHB masters issuing
+  transactions to IP Slave peripherals. Additionally, this module offers access
+  control configurations meant to restrict which peripherals a master can
+  access.
+
+maintainers:
+  - Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
+
+properties:
+  compatible:
+    const: fsl,imx8mp-aipstz
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  "#access-controller-cells":
+    const: 3
+    description:
+      First cell - consumer ID
+      Second cell - consumer type (master or peripheral)
+      Third cell - configuration value
+
+  ranges: true
+
+# borrowed from simple-bus.yaml, no additional requirements for children
+patternProperties:
+  "@(0|[1-9a-f][0-9a-f]*)$":
+    type: object
+    additionalProperties: true
+    properties:
+      reg:
+        items:
+          minItems: 2
+          maxItems: 4
+        minItems: 1
+        maxItems: 1024
+      ranges:
+        oneOf:
+          - items:
+              minItems: 3
+              maxItems: 7
+            minItems: 1
+            maxItems: 1024
+          - $ref: /schemas/types.yaml#/definitions/flag
+    anyOf:
+      - required:
+          - reg
+      - required:
+          - ranges
+
+required:
+  - compatible
+  - reg
+  - power-domains
+  - "#address-cells"
+  - "#size-cells"
+  - "#access-controller-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    bus@30df0000 {
+        compatible = "fsl,imx8mp-aipstz";
+        reg = <0x30df0000 0x10000>;
+        ranges = <0x30c00000 0x30c00000 0x400000>;
+        power-domains = <&pgc_audio>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        #access-controller-cells = <3>;
+
+        dma-controller@30e00000 {
+            compatible = "fsl,imx8mp-sdma", "fsl,imx8mq-sdma";
+            reg = <0x30e00000 0x10000>;
+            #dma-cells = <3>;
+            clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SDMA3_ROOT>,
+                     <&clk IMX8MP_CLK_AUDIO_ROOT>;
+            clock-names = "ipg", "ahb";
+            interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
+        };
+    };
-- 
2.34.1

