Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84346449B2B
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 13:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541409; cv=none; b=nZ97hxRl535NjB+YDBPewVrV56XUVw0uJl8Hhnit9wIXzJ/RnPozYcgWh1ojKhihQtfCViqsaC6ixU7mPO7rJ0hE8BEPKBbBzzkiqM+UChhZY1npxriESDB/1dXLPUVyEEkdJnpdfd7vUNcVh1lbNmgjAy9w5ULOQ+zKfk+w8fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541409; c=relaxed/simple;
	bh=4OSfxiAVKKzJMMq5tJlfGhF6nM6Qer8TQOigtc3TMFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pT567fQ7s+0mLxJ0ioNyOj7IhWSoEBb6c5XtRJmytSEQcOlfHcrcbvauKjbkjGOH0PVUaht4ah+Jr6vLw5Jmg8jKZ8ofg+Cckx0qS/bGSbsAylx79Kwk1EzVhXjT2hUA5iESXjeJkt/EpC/XrL9WGk+x5dv/z7t5iLwzJurpc2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=GUYvcG2M; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="GUYvcG2M"
Received: from francesco-nb.. (93-33-22-216.ip42.fastwebnet.it [93.33.22.216])
	by mail11.truemail.it (Postfix) with ESMTPA id 4D7541F936;
	Wed, 12 Aug 2026 15:30:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786541402;
	bh=1RolWI4fvElrwLYrxLe8pGft2VSQ3MOLY+Ax4ZB5n5w=; h=From:To:Subject;
	b=GUYvcG2MAGpL9AlaHmaNSfXyaItzAgboR2AzfQ7v2Kf7qrrhEc1Jl9eKlIHY2y11c
	 rUzqNeBRBcNaDGCjVcfB9oKdSV01EID/utEozsSgiQE8duUTtxxDMX7JX7mTqxilMu
	 3DcVIbPdY2ZoWfdiYnmCCibsyw3o76IaLpd/dViLnQz1h6z/R1pW6+7rwvjYC2Z1ga
	 GaHB7BEiUIG7bs6QvxFg+xR9EF4+PSLsP0deMZlVYbk1k1+mDrVuyXhYeosSqsGzzw
	 EmKqaGh44BvlbbBc6Y6+21zkK1XOgLKLXrmxKeXR60Robh3oc6GxuXzqykXNQoN3Bx
	 ezTjiZ531C0bw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/4] dt-bindings: lcdif: Add endpoint bus-width property
Date: Wed, 12 Aug 2026 15:29:49 +0200
Message-ID: <20260812132954.148571-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812132954.148571-1-francesco@dolcini.it>
References: <20260812132954.148571-1-francesco@dolcini.it>
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

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v3: use video-interfaces.yaml
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 2dd0411ec651..1f3daf002707 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -71,6 +71,15 @@ properties:
     $ref: /schemas/graph.yaml#/properties/port
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

