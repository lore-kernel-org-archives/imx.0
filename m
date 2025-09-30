Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBF9258EFC
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 17:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759252647; cv=none; b=Y8qWuCfZewEowjyW5YMJo58lAYpu2sC+Rq6cJJx4wNx01IG5OOVXCiLhIn8NrdgPx3RgkHC1K+OgysfenIU1d3LMNyipq/VGL/7Z8/PZKZ1GxXB40ng7rmGsCLNEbm6CvHJBnOl0e4MslZm4NwdUUzHhUOfspGLjG+9bw/IH9a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759252647; c=relaxed/simple;
	bh=+dDf6+3YhN4vz3PDVIAYw6UpFs5vKV8CVEAHEvVlH40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cXTzn3fnnplcDs5UmN1+tC4wv3Vd3x/3+UfUeUGkJSI+2su7rjj5YEbo1/oM2QnwdOlBTho4U4I9EPBFlI9rgHAZk9d9Kl3l/Hx+QDzypJcKCPsKSb66gaIhO13i3U+P4F8I2iyNBbpy4hd/wT1aCBqcgZPyTLokAm1xxaz3bp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bICNFngm; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bICNFngm"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e2e363118so59938115e9.0
        for <imx@lists.linux.dev>; Tue, 30 Sep 2025 10:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759252644; x=1759857444; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RNePBLAvYV3wK8ibZpgmHCPCbmbpde/eqvSInVk0KIc=;
        b=bICNFngmudwb0BP9C7o4gAux4qYZ3lr9F9MhV1ZdOMvq5guh3Fnp30+rte8hIC49SA
         Gcb7qIKIWKv2O5qVTHAisabtaIW8aGIzWG4x6bpJOsR4wmBxtCaPy0jMJbrYkvALHr1t
         1KndyxbcYFNsVTvt+k3zN118n/oLIUIu4t3zae9QPAODdfRqp9WRhgZDJHefpVUUMrNk
         gRGIoDX8U13ViIP/5XWJGTmIKESFtprNPn/FVvBw497TVCBEV0pcz0AfG0U1f7zpE1y5
         78Y5T5NAY1CwcMQvgn/TGLv7fS7ZocyUpD14xbCF1WUGA31OnjLUTJVHxrbmjAe3OD3s
         XJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759252644; x=1759857444;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNePBLAvYV3wK8ibZpgmHCPCbmbpde/eqvSInVk0KIc=;
        b=u7efeMbcm7g/Rm1jBNEJWMbUOVFwYHepLxfK96IOVwNnnAYK7RaCSI9srVLvNsImgJ
         OOrDRe8DINYKzlDSRAnsUjEvb7Fhyr38FbaVBgGk3z94X7KLfojjebKzvFYd2P2o4auA
         8cf6ZFFd9RBkwTSlLcSuDJBrRDzC8h4in6bEUNR3msQybDmCnuv5e4gjpp3l+Bmw8M8J
         T03T/PmRKzXttoEG6FMr+jm/I9H6JCuHONqMQ0qBy/iMFFPibHpwaqCigcXc0nhyh9B9
         1DK5dzxYN9JUou0rjn6gAMqHfsc8PBrSU7Ov1mweb+IiP94FrpWMCmiJtj7CJuHNG4Cd
         9qnw==
X-Forwarded-Encrypted: i=1; AJvYcCU/W8TFgPePNV+GYqB7Yk0mbKFJ/mfKM+CPoo7XbUV9tWntT3sLyWh1Y5ieFocGM2gMO6A=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk7w1j+TM2JC7aCKG/l6sHV8zZ80aXp/ZpsbXPA9dv4liA1IH4
	FlCbgedPvUrGvhFL95uOu8eghXG5p9WsDeH1fTrcGeL/YNeh7MFy+0gM6iwneAEj9X8=
X-Gm-Gg: ASbGncsnVD8Q015UtPfRzQYHAgT90x1bUh6Kvp6g4DCPbjO+TYrSzv/zy1vKtHpA6sV
	qu3OQH6GDl+7JqRSwumMNVN/D7+FHouMTeweLB4A/0imsqUzpd2zIet6EMxDDGDig8qi52LoG8c
	3oLw8pWq7i+vvcZulipdgLeHa0u9qkXWnKTKj71fmOeadDyQnD+PV8DVPWwX6BfWPKxCov4tARc
	C6AJXlz8GP8PdV+XdqCzzDSDxXPUR3NiHE4dZt+MF8fwoVtxWFriU62KbRnxmJ/hLczEfAV05nv
	qTQbJwAImyfzJFme/dwRCYwj7EiPVy4AknuKNIO+wYk6pIZetI5wAJIYcQkGSlY+L6wta8aasi/
	KDxqiUtGmW9JSpCB+CFcvrJL1QPthqy0ztJhNoLQ89y5vvPTqdSHwFMVszngvmv4nl9Q=
X-Google-Smtp-Source: AGHT+IElfAfSUmqbhDMTil+yEDuc0QOUeaDmYZur34EATX4bKiElLsQT72CWpqSOwiVb4bZzmxTvtQ==
X-Received: by 2002:a05:600c:8b18:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-46e612bfe6fmr4845315e9.19.1759252643701;
        Tue, 30 Sep 2025 10:17:23 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb017sm23443480f8f.3.2025.09.30.10.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 10:17:23 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 30 Sep 2025 19:17:21 +0200
Subject: [PATCH] dt-bindings: usb: switch: split out ports definition
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKAQ3GgC/x2NQQqDMBBFryKz7sBoTLG9SnGhcdRZqGnGViHk7
 gZXjweP/yMoB2GFdxEh8F9UtjVL+SjAzd06McqQHSqqLL0M4b55cahLc1rCUU78Lh5/2tdmuIl
 6yO5mJNfUTL0dzbOEvOYD5/p++rQpXbUAOVp5AAAA
X-Change-ID: 20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-0c84e0b5f361
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Romain Gantois <romain.gantois@bootlin.com>, Li Jun <jun.li@nxp.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11052;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=+dDf6+3YhN4vz3PDVIAYw6UpFs5vKV8CVEAHEvVlH40=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo3BCihvjWzPnZJlhuvLZ6p0GUKsLhNQeMd0D0Boz9
 8oDpIKmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaNwQogAKCRB33NvayMhJ0cCnD/
 4sX406R2aFjpxvYRVXxdYNHyWS+bQ0NWwtfX7a9BcMA2e/NxnIRA2upqPHp8CbtZUUdLxnqUkMwvic
 ZfWZLurSh3Zul3FvrDx77K5j6N+CCwx0VAwqb0B9dR7n4oSa0e+nnnYNTvZxaPMbIUHdmW9jSZvTWe
 sdiA6qZ2NdWWGyfPqNgbprHsJ9GulUpGM9Xf9ye4gMKcCUebeh46ztBXFuw2TyArwv5BboZRlEU8AT
 L5N+PgzSc+GBPFr5kJe0ENIAfwsX0YWZd9bLgDqtB25SJo9Au5qAi7AvSXLALF6IheULmjPlRp0cG8
 1rmQFE9OAXtVWOxjVh+Dk1Sol1IYqhO4l8Am2AlscIefWGo53l2HD2VPaWVUhpMQVMElX203eoqImR
 ALTvtipR5YQxqS2X9YSelreAAqYXhUO2wRwO6kCo+0YvC1rPRM6WdyY1A90WA2NXVVTlI82fK14d5q
 xm2GFOQOYqgA1ZSJpDzGhoR/52iP4KGPLkxTYEi910T3qUrcy2LxFOO5C5ub4FW+CS7+roF/o6hJFg
 396De3BB76e2uzLq/mJPxiu9xWL+zSRGa0DHxKiC6lJVNOsANguPUXa66G1OFllKVaydZNZKqQuBm0
 AwjcM/W3kSVdHdLFUUEwobhDutHxehRMz8PwFyh5SllOkzKHRBc5d09UMrWQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The ports definition currently defined in the usb-switch.yaml
fits standards devices which are either recipient of altmode
muxing and orientation switching events or an element of the
USB Super Speed data lanes.

This doesn't necessarely fit combo PHYs like the Qualcomm
USB3/DP Combo which has a different ports representation.

Move the ports definition to a separate usb-switch-ports.yaml
and reference it next to the usb-switch.yaml, except for
the Qualcomm USB3/DP Combo PHY bindings.

Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/phy/fsl,imx8mq-usb-phy.yaml           |  4 +-
 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  4 +-
 .../devicetree/bindings/usb/fcs,fsa4480.yaml       |  1 +
 .../devicetree/bindings/usb/gpio-sbu-mux.yaml      |  1 +
 .../devicetree/bindings/usb/nxp,ptn36502.yaml      |  1 +
 .../devicetree/bindings/usb/onnn,nb7vpq904m.yaml   |  1 +
 .../devicetree/bindings/usb/parade,ps8830.yaml     |  1 +
 .../bindings/usb/qcom,wcd939x-usbss.yaml           |  1 +
 .../devicetree/bindings/usb/ti,tusb1046.yaml       |  1 +
 .../devicetree/bindings/usb/usb-switch-ports.yaml  | 68 ++++++++++++++++++++++
 .../devicetree/bindings/usb/usb-switch.yaml        | 52 -----------------
 11 files changed, 81 insertions(+), 54 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index 6a47e08e0e97b286538798190225ca2966a7ab34..f9cffbb2df07d6fa352a844071af7cc894652d0c 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -142,7 +142,9 @@ allOf:
       required:
         - orientation-switch
     then:
-      $ref: /schemas/usb/usb-switch.yaml#
+      allOf:
+        - $ref: /schemas/usb/usb-switch.yaml#
+        - $ref: /schemas/usb/usb-switch-ports.yaml#
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index e906403208c02951ff2bf5ed8420d53ad70eb29c..ea1135c91fb74c01ba860b9588ca89e611701359 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -125,7 +125,9 @@ allOf:
           contains:
             const: google,gs101-usb31drd-phy
     then:
-      $ref: /schemas/usb/usb-switch.yaml#
+      allOf:
+        - $ref: /schemas/usb/usb-switch.yaml#
+        - $ref: /schemas/usb/usb-switch-ports.yaml#
 
       properties:
         clocks:
diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
index e3a7df91f7f15e9a6d8eb4971bc2b9646bdad0c6..89b1fb90aeebc0ccfc50ea52b67015034294e1a8 100644
--- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
+++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
@@ -76,6 +76,7 @@ required:
 
 allOf:
   - $ref: usb-switch.yaml#
+  - $ref: usb-switch-ports.yaml#
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
index e588514fab2d8c9d0d3717865fe2e733664fc28b..793662f6f3bff4a4b4b73b38983abca12e1e61d2 100644
--- a/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
+++ b/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml
@@ -52,6 +52,7 @@ required:
 
 allOf:
   - $ref: usb-switch.yaml#
+  - $ref: usb-switch-ports.yaml#
   - if:
       required:
         - mode-switch
diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
index d805dde80796f31a066cf52ba2f226ce2e9e9cc2..4d2fcaa718708fe5d0a05ebce211f0a729d6c617 100644
--- a/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
@@ -46,6 +46,7 @@ required:
 
 allOf:
   - $ref: usb-switch.yaml#
+  - $ref: usb-switch-ports.yaml#
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml b/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml
index 589914d22bf250ff94c98ed22b32616d2c0cca1c..25fab5fdc2cd712a8075c2ee20bdc80829c3b043 100644
--- a/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml
+++ b/Documentation/devicetree/bindings/usb/onnn,nb7vpq904m.yaml
@@ -91,6 +91,7 @@ required:
 
 allOf:
   - $ref: usb-switch.yaml#
+  - $ref: usb-switch-ports.yaml#
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
index aeb33667818eb0d116a3467d30220002a3b5df73..eaeab1c01a594e05666d01cf6b82a6d7127ae075 100644
--- a/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
+++ b/Documentation/devicetree/bindings/usb/parade,ps8830.yaml
@@ -81,6 +81,7 @@ required:
 
 allOf:
   - $ref: usb-switch.yaml#
+  - $ref: usb-switch-ports.yaml#
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml b/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
index 96346723f3e9c92c32325c7395eff49336cbcaf8..96dcec9b76204606397cc1e31338832e518816f3 100644
--- a/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,wcd939x-usbss.yaml
@@ -60,6 +60,7 @@ required:
 
 allOf:
   - $ref: usb-switch.yaml#
+  - $ref: usb-switch-ports.yaml#
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
index f713cac4a8ac8e89c017999bc11e4b3a38d3ac2e..e1501ea6b50bf76e4bac6cbc2a3243f7107029d0 100644
--- a/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,tusb1046.yaml
@@ -11,6 +11,7 @@ maintainers:
 
 allOf:
   - $ref: usb-switch.yaml#
+  - $ref: usb-switch-ports.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/usb/usb-switch-ports.yaml b/Documentation/devicetree/bindings/usb/usb-switch-ports.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..6bf0c97e30ae7069481e41ef8745804e5efde974
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/usb-switch-ports.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/usb-switch-ports.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: USB Orientation and Mode Switches Ports Graph Properties
+
+maintainers:
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+description:
+  Ports Graph properties for devices handling USB mode and orientation switching.
+
+properties:
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    description:
+      A port node to link the device to a TypeC controller for the purpose of
+      handling altmode muxing and orientation switching.
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+        unevaluatedProperties: false
+        properties:
+          data-lanes:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            minItems: 1
+            maxItems: 8
+            uniqueItems: true
+            items:
+              maximum: 8
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Super Speed (SS) Output endpoint to the Type-C connector
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Super Speed (SS) Input endpoint from the Super-Speed PHY
+        unevaluatedProperties: false
+
+        properties:
+          endpoint:
+            $ref: /schemas/graph.yaml#/$defs/endpoint-base
+            unevaluatedProperties: false
+            properties:
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                minItems: 1
+                maxItems: 8
+                uniqueItems: true
+                items:
+                  maximum: 8
+
+oneOf:
+  - required:
+      - port
+  - required:
+      - ports
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
index 89620191263023bec800dec114c0017c41b7c056..f77731493dc4901d0e95746b0cf1ffa3ee7ddfd0 100644
--- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
@@ -25,56 +25,4 @@ properties:
     description: Possible handler of SuperSpeed signals retiming
     type: boolean
 
-  port:
-    $ref: /schemas/graph.yaml#/$defs/port-base
-    description:
-      A port node to link the device to a TypeC controller for the purpose of
-      handling altmode muxing and orientation switching.
-
-    properties:
-      endpoint:
-        $ref: /schemas/graph.yaml#/$defs/endpoint-base
-        unevaluatedProperties: false
-        properties:
-          data-lanes:
-            $ref: /schemas/types.yaml#/definitions/uint32-array
-            minItems: 1
-            maxItems: 8
-            uniqueItems: true
-            items:
-              maximum: 8
-
-  ports:
-    $ref: /schemas/graph.yaml#/properties/ports
-    properties:
-      port@0:
-        $ref: /schemas/graph.yaml#/properties/port
-        description:
-          Super Speed (SS) Output endpoint to the Type-C connector
-
-      port@1:
-        $ref: /schemas/graph.yaml#/$defs/port-base
-        description:
-          Super Speed (SS) Input endpoint from the Super-Speed PHY
-        unevaluatedProperties: false
-
-        properties:
-          endpoint:
-            $ref: /schemas/graph.yaml#/$defs/endpoint-base
-            unevaluatedProperties: false
-            properties:
-              data-lanes:
-                $ref: /schemas/types.yaml#/definitions/uint32-array
-                minItems: 1
-                maxItems: 8
-                uniqueItems: true
-                items:
-                  maximum: 8
-
-oneOf:
-  - required:
-      - port
-  - required:
-      - ports
-
 additionalProperties: true

---
base-commit: 262858079afde6d367ce3db183c74d8a43a0e83f
change-id: 20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-0c84e0b5f361

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

