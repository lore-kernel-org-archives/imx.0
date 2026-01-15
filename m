Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0003A9018
	for <imx@lists.linux.dev>; Thu, 15 Jan 2026 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768490730; cv=none; b=KuCwXCb/rL3RsNdWNaJtcGuRjbce2riThgzMkdk8yclBYPhPAHJJaOZiGoKkQqAgavi9khNSEcUsUG7lflvbnDbm2Sm7/VZBunmQZv+s+DfnsrN/gKuVed676q91qXirR85aymhvDzECOGEdVVKUXEIKhdIgceoaefZcsBR2z5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768490730; c=relaxed/simple;
	bh=U49ly9oVcEoVcSNJ36hsLhpyUT4ecf7TGKt3La3DLVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lu4Vjp66/ZhEaPjgWwiaOqcL5b3Dmu74zeqrAW4bh0fFYkcbOQ2u7Z7s5OJN+cWzNYoiRlt7VUzGu3srfwiaL1xreTRnQIsEjTZIPl1bXrn2DMZdDjOk1GRWnTnaVB+RW2oyw3mtua1NAP9gRa4gop1M326Drx6yma0GuAf/PpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vgPDS-0003hw-Bo; Thu, 15 Jan 2026 16:24:54 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Thu, 15 Jan 2026 16:24:51 +0100
Subject: [PATCH v9 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-v6-18-topic-imx93-parallel-display-v9-1-2c5051e4b144@pengutronix.de>
References: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
In-Reply-To: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 luca.ceresoli@bootlin.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

From: Liu Ying <victor.liu@nxp.com>

i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
configures parallel display format by using the "PARALLEL_DISP_FORMAT"
field. Document the Parallel Display Format Configuration(PDFC) subnode
and add the subnode to example.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
[m.felsch@pengutronix.de: port to v6.18-rc1]
[m.felsch@pengutronix.de: add bus-width]
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 78 ++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index 34aea58094e55365a2f9c86092f637e533f954ff..d828c2e82965c7a4cd69a67136047d83c96b0a35 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -40,6 +40,58 @@ properties:
     minItems: 8
     maxItems: 10
 
+  dpi-bridge:
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        enum:
+          - nxp,imx91-pdfc
+          - nxp,imx93-pdfc
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: Input port node to receive pixel data.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/$defs/port-base
+            unevaluatedProperties: false
+            description: Output port node to downstream pixel data receivers.
+
+            properties:
+              endpoint:
+                $ref: /schemas/media/video-interfaces.yaml#
+                unevaluatedProperties: false
+
+                properties:
+                  bus-width:
+                    enum: [ 16, 18, 24 ]
+                    description:
+                      Specify the physical parallel bus width.
+
+                      This property is optional if the display bus-width
+                      matches the SoC bus-width, e.g. a 18-bit RGB666 (display)
+                      is connected and all 18-bit data lines are muxed to the
+                      parallel-output pads.
+
+                      This property must be set to 18 to cut only the LSBs
+                      instead of the MSBs in case a 24-bit RGB888 display is
+                      connected and only the lower 18-bit data lanes are muxed
+                      to the parallel-output pads.
+
+        required:
+          - port@0
+          - port@1
+
+    required:
+      - compatible
+      - ports
+
 allOf:
   - if:
       properties:
@@ -112,4 +164,30 @@ examples:
                clock-names = "apb", "axi", "nic", "disp", "cam",
                              "pxp", "lcdif", "isi", "csi", "dsi";
       #power-domain-cells = <1>;
+
+      dpi-bridge {
+        compatible = "nxp,imx93-pdfc";
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            pdfc_from_lcdif: endpoint {
+              remote-endpoint = <&lcdif_to_pdfc>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+
+            pdfc_to_panel: endpoint {
+              remote-endpoint = <&panel_from_pdfc>;
+              bus-width = <18>;
+            };
+          };
+        };
+      };
     };

-- 
2.47.3

