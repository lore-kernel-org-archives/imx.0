Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2741439320
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 09:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799506; cv=none; b=pII7sj9PzxlZLBKuxgUdgNF30uFwzhjP6ZxLBfCN+V7haLV66/Wo/pbImjuwVqJqlOaeiIMRgBjFcsvE5h4aP2eM+be5G4OZU62tKSwQyoOyigEeYdZRVIo4PAJAsKYYvTsxqqXECsxHPbHwLIfZXivEmO+O7oSjciiJjFHiUN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799506; c=relaxed/simple;
	bh=ljb8ujNnGH12ELtjl0psHaInYjNQrSuU7zw4Kropg/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwTgr0/vgQD1hVAtw+zrFJEi+ok/iayt40hUeFAFLooYHQ2f+mRdF4apZtQZMY05s4giZ5k+jMBvyR8x01G1qGuVrAfJskaBsfHfGsv/vbzN8DnZNImDUrkjCGcaVNLW9hz52lrJhYQAimPct7h0GB0voULz3darFHz5EuZOtis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=heYnw1Lp; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="heYnw1Lp"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2E0BB1FB78;
	Thu, 23 Jul 2026 11:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784799502;
	bh=aNn9to8BGMc2D1UguBTJNMsLB1vfj4Mi248eeCFZJW8=; h=From:To:Subject;
	b=heYnw1LpWwMjrkh1Rrxe3ZifWjH56zUGbOMkMOPkpRRsRBkAdba3zbWQhfAzCljmV
	 Flzyz0xwfNlbbRxZPVGpSMAX+U7MfF7s2LJxcjieJ9pWYJZg8Npp7I+FuRsMjpOWv/
	 R6Lau7GKPLmGlANiV1V29pbotqAvjfmlTLfSpK/OMBjwsBnn2n7SlcZ1oxz9bqqiJO
	 801+ASwSPdXjw2GBp9ZDEe1rYxqFXM2m+86yqIuRM+f8+HvegCtyRwYf7dCTBcnpcN
	 em2/hKrPib4GDQyQEcPzMA1k1cuYgLxgVAMZ9GAHfuVzeAr7UAAiGh9UPL8ZqogG5T
	 iSCv81GQnCuLg==
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
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: lcdif: Add endpoint bus-width property
Date: Thu, 23 Jul 2026 11:38:08 +0200
Message-ID: <20260723093813.180089-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723093813.180089-1-francesco@dolcini.it>
References: <20260723093813.180089-1-francesco@dolcini.it>
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
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 2dd0411ec651..6931f0ae3829 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -71,6 +71,15 @@ properties:
     $ref: /schemas/graph.yaml#/properties/port
     description: The LCDIF output port
 
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
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

