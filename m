Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B1541CB31
	for <imx@lists.linux.dev>; Thu, 24 Sep 2026 06:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790233085; cv=none; b=a6amQYjT+Rdj7Raud6qCVtwveoLIitMQep+eRvZRfAgmT+zFNxxe+/6EGCSLUNYmlrGCfY8n+buDixFSpIdIl7hSmcdbqlFykDVW/k/x23Nc9mIDFMCqnpMPuveI2QVfFdzPrEMbAlIg8dolveJ97Z3AFQMh7HqCb0/Btnw77Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790233085; c=relaxed/simple;
	bh=nVIHNhZDkCd+I2iTIx0YOPpZR915Jmu4fKYZcpbCt9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PwJ8AS+GdCRFDX0ifGNLlBn5aU14nnjgrgkce2XCzcY1Iw+GsNmaB2kUedenKRbLX6h+wdk6R5wB+rcvs5XM97puujyEPjjl4GtDynRR64/6bnVnqLQQVq/bONsoev04XRK/nQwSGh6AHa+8XjEkYBBhhUe4v/nNsOn9rEAnk34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Qpey4FCw; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Qpey4FCw"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4FD2720230;
	Thu, 24 Sep 2026 08:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790233067;
	bh=uMiLzq9i2T7hnkODYgCpXEhyVPT7UC5o9DbVtj7kdfM=; h=From:To:Subject;
	b=Qpey4FCwcVeMI9QWXtX2RX7SLt8mPCtss3pODGJOXP78bTflpCLdKgJ/hTxTwkJcE
	 HbKwGZSdbNUtxu+VWgyJtZhSmM9Vr8DlVY9EwINCQtpwE8J0oivEuw2g+MsFN+bKeU
	 PXye/g/pyQQh00mpZ1KyzahbKYEJRhGwBbBPWSrzthN0wI+jh2isOA3/HZoaef2Sxh
	 qXxeSIxrLQhKKqWsmzUeZVN8cDzhcnhNNIIxkMFYzYVSjWjzBeH0WmHJVxFLbLkNCm
	 trqOGpUEs9PM6AR/p39aYcm4QsfvQhosfe82dF3QFhju2l9c3Q2LOiETJvjryloNK3
	 00aBxMK0bKHyA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/7] dt-bindings: arm: fsl: Add Toradex OSM iMX91/iMX93
Date: Thu, 24 Sep 2026 08:57:28 +0200
Message-ID: <20260924065735.17678-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924065735.17678-1-francesco@dolcini.it>
References: <20260924065735.17678-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add bindings for the Toradex OSM iMX91 and OSM iMX93 SoMs and the
OSM Development Board they can be mated with.

The Toradex OSM iMX91 and OSM iMX93 are OSM 1.2-compliant SoMs based
on the NXP i.MX91 and i.MX93 SoCs, respectively.

Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx91
Link: https://www.toradex.com/computer-on-modules/osm-arm-family/nxp-imx93
Link: https://www.toradex.com/products/carrier-board/osm-development-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v3: rebased
v2:
 - add acked-by
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f3c73510c18b..e563d96e4ff7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1537,6 +1537,12 @@ properties:
           - const: toradex,lino-imx91
           - const: fsl,imx91
 
+      - description: i.MX91 boards with Toradex OSM Modules
+        items:
+          - const: toradex,osm-imx91-dev # OSM iMX91 Module on OSM Dev Board
+          - const: toradex,osm-imx91
+          - const: fsl,imx91
+
       - description: i.MX93 based Boards
         items:
           - enum:
@@ -1557,6 +1563,12 @@ properties:
           - const: toradex,lino-imx93
           - const: fsl,imx93
 
+      - description: i.MX93 boards with Toradex OSM Modules
+        items:
+          - const: toradex,osm-imx93-dev # OSM iMX93 Module on OSM Dev Board
+          - const: toradex,osm-imx93
+          - const: fsl,imx93
+
       - description: i.MX94 based Boards
         items:
           - enum:
-- 
2.47.3

