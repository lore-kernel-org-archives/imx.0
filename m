Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5369D2DCF41
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 16:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766507328; cv=none; b=HkKakANpDcxofCF5eiVT2m2BuZVqPub6FmzxABBEP3sTf6Jv0jT8JkoR/xsTVfYO4a6xv0MPKfhspzEBaqPyIvgNQpfWdplWAOytR5RAr5RZ9+5tpTmMbRVhTxnT5kk6WsLYdqR5vFKCr4B5oW1Q5EadbtwyhGzt8VH7GX+8jiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766507328; c=relaxed/simple;
	bh=BSsEJxgd8NCNGQR41Rzr1FEvc1jIP1AIAushA+zKdDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHI8gh2lsBpNNOgUJFH4ze8J93wyU/iYUpU5B4c/bXzIrRmofiurCzSvTyT9HeccB9l00TBqDL13yLF/WEZF7UWeKQepg6WdFz3+rz5Rfj5kQgSrpUCdmIZ0vY9jJbtjMxNMWuVVLPFgpFjmMi/vUV97mZDFUKLuFwJnva+0QTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=yWHopKvJ; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="yWHopKvJ"
Received: from localhost.localdomain (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 053571FE0B;
	Tue, 23 Dec 2025 17:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1766507322;
	bh=3oK1IffVG2CPnfvTGGdHy1OT+9sPDiuPZUecdFiwUmc=; h=From:To:Subject;
	b=yWHopKvJ1ptTLiqfw4v4LBpnD+S2pdhJJKyNhjR4xzwz0wrIOVnUGF/XltwLsQPZA
	 BnSn8AF/kFimgsAwGbvMRMECRan4kHFbZPpOsZEfP0+vG1fYHCABlJSeDwG0uDncBQ
	 O0Y9+9wDibPktgFY0GXUfe+OIWM3BVyj7IJ84EZrntUwu/oSaVo77M1IBBjemguU0r
	 d97v627XQZKWQ2CxkFV7yzszYdujwJTf2JRBfkIvrTd2D/53ZXINjr1x3hCNvt+n2i
	 ROXcczZmbrpMiw8vOqyVYu6zH/vaAw8hVnFcqx1gw3sbGOLDyZXr/lLt0P+5QMMORD
	 gCn0/oDUL4KTw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/4] dt-bindings: arm: fsl: Add Apalis iMX8QP
Date: Tue, 23 Dec 2025 17:28:27 +0100
Message-ID: <20251223162833.138286-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251223162833.138286-1-francesco@dolcini.it>
References: <20251223162833.138286-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add binding documentation for the Apalis iMX8QP SoM mated with Apalis
Ixora and Apalis Evaluation board.

Apalis iMX8QP is a variant of the Apalis iMX8QM, using an NXP i.MX8QP
SoC instead of the i.MX8QM. The two SoCs are pin to pin compatible, with
the i.MX8QP being a lower end variant, with a slower GPU and one Cortex
A72 core instead of two.

The two Apalis SoMs variants share the same schematics and PCB, and the
iMX8QP variant exists only on revision V1.1 of board.

Link: https://www.nxp.com/products/i.MX8
Link: https://www.toradex.com/computer-on-modules/apalis-arm-family/nxp-imx-8
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..611fe36c2884 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1333,7 +1333,7 @@ properties:
           - const: toradex,apalis-imx8
           - const: fsl,imx8qm
 
-      - description: i.MX8QM Boards with Toradex Apalis iMX8 V1.1 Modules
+      - description: i.MX8QM/i.MX8QP Boards with Toradex Apalis iMX8 V1.1 Modules
         items:
           - enum:
               - toradex,apalis-imx8-v1.1-eval       # Apalis iMX8 V1.1 Module on Apalis Eval. V1.0/V1.1 Board
@@ -1341,7 +1341,9 @@ properties:
               - toradex,apalis-imx8-v1.1-ixora-v1.1 # Apalis iMX8 V1.1 Module on Ixora V1.1 C. Board
               - toradex,apalis-imx8-v1.1-ixora-v1.2 # Apalis iMX8 V1.1 Module on Ixora V1.2 C. Board
           - const: toradex,apalis-imx8-v1.1
-          - const: fsl,imx8qm
+          - enum:
+              - fsl,imx8qm
+              - fsl,imx8qp
 
       - description: i.MX8QXP based Boards
         items:
-- 
2.47.3

