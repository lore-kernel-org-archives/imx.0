Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A67C3B5314
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613330; cv=none; b=ta6il15Q4b1XreIpP2w4epbaeM9lriVxxOhS/sTVGOVWYjA2zi/DpM1NiYGOOWNzhFNg3kO1SzlI1slJhJw2cwyTKbytk0eN4L8NugNxzANAOI6nc8kUjci516cwQkcYPU2EJuVCnIfS8hR+y+/G6vGUDXWPXrNEuQqkXSqHk0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613330; c=relaxed/simple;
	bh=OYCLo4WKcP3DOpyCUEt0U0m1/h8B7jGZ2DqFv2lzXFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8Al2I83ASxZZlrTsuolHVgsabaZ/64DKwW96kAPPsS3Gerf61xOSUFzVH8vuLuY1UE6A9VS4qA8rbLGSvs4q8T0GyIP7NiA600XCnSG2F614j8PVh57G/31xawYPsAoxtyM3BAzAzTeesaRBZn11M+2oxc8GetITvGoOiU0Z/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=mNsLEk45; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="mNsLEk45"
Received: from francesco-nb.. (2-224-16-253.ip168.fastwebnet.it [2.224.16.253])
	by mail11.truemail.it (Postfix) with ESMTPA id 6D29022BAE;
	Thu, 13 Aug 2026 11:28:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786613326;
	bh=WtGJJqGBw9t2amLZOKq5ohBuJoO0U3WkBDkcXauskNk=; h=From:To:Subject;
	b=mNsLEk45wtGZ7aqEPrHX3J98229fxaSgCn7Xrgufhvr8PO7kN7Fs5tVULfgctBTy8
	 zEMD3x5qOitTiWO8oCxRULHSr6Ps0HGURdwXnf581uJDRaJlON+8mctHQ9vfyS6pA3
	 uNA7uK3l5evpLGdXFv0RtxgaFKT+Zu3io48jLFphm+OkONI3jf20+1Gc6U1jVMEIMJ
	 vLz752LP/uUcQJQ8Y6ASUc/+d0ri5iHTjIsowYLen6ypMNrWX1Nb/whTgxhpL5GneX
	 ekTGOtDrJGqaxvw3rCyX8BM45J1oOwmGUdHDoUehXQHeg2J0q4UETZdmuBD/cfPHOy
	 oseSMlyFv3lcg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/4] dt-bindings: lcdif: Add endpoint bus-width property
Date: Thu, 13 Aug 2026 11:28:31 +0200
Message-ID: <20260813092836.38367-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260813092836.38367-1-francesco@dolcini.it>
References: <20260813092836.38367-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The DPI output of the LCD interface can be configured with a bus width
of 16, 18, or 24 bits. Introduce a bus-width property to the output
endpoint, specifying the number of parallel RGB bits connected.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v4: use /schemas/graph.yaml#/$defs/port-base
v3: use video-interfaces.yaml
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 .../devicetree/bindings/display/fsl,lcdif.yaml       | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 2dd0411ec651..89cea0c14cf1 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -68,9 +68,19 @@ properties:
     maxItems: 1
 
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
     description: The LCDIF output port
 
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml
+        unevaluatedProperties: false
+
+        properties:
+          bus-width:
+            enum: [ 16, 18, 24 ]
+
   display:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: phandle to display panel
-- 
2.47.3

