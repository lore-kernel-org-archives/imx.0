Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC82C3ACA4B
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 09:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775728751; cv=none; b=X0rLl0T8a0M5Wr6DnCtaExUgJjbG8C7E8I9tn/Mr53rvWfNjYTHgZ/UBB/yPwjueMAJLMVrolQ6wjs0315aO/VOYNLpXj2jcCI0Z/M/QwY6ojJa5IyyCqYY90ppnbz78v73Tzutd1jiKDNqwwllmuDH4Xys2SPUC5NXS49AY8HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775728751; c=relaxed/simple;
	bh=iCjJdv6UmtR2mcMf7I6aIF5Z1PydaiALBEkkJRuYH8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvkyPgIbxRecuUTaTj9yCmpZRcpRWCZW8OiSd6m5dSl204SiOtwrT/myrpEgGJuwkzioB4l+LuB6BczAMrL2HgpkFL1+opDxMYYLtfdbsXQdKrXoY4pIkYMZoekvwplMZ4XVWKaX6RbXEFEVSTdEpW6hgAoS+bemO0hfGrKWQec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=QwkGgUIZ; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="QwkGgUIZ"
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id B72542035C;
	Thu,  9 Apr 2026 11:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1775728747;
	bh=VTCgxSY8g7O+dmDT3SEttIJvvi9A+fVxUT3Jnm4+5+k=; h=From:To:Subject;
	b=QwkGgUIZOcpmIbn5RFOOMTbPyXVkKsIZJePywxwj7j86zRjOhCIoFMLM76IQBz77v
	 mthY05LZZisrsGwGMaHJk6fp63B1QovXLzTrWsVcpk8HKPA3vdvndSDv/EPSxCZ3gY
	 VXAr65DtP2r98x5Hp966ZKBxlZlHxO4hnSPOenSVX9QDE42FL6SqRZ67UDUWL5xi0u
	 07INBL96zXhXxj2l3hZN94xP352wZYHlI7LIfq3j7Z8kHaB/v0Fq3LYT9mDYNHPGBa
	 AYajvK9x2cnW4DufPGoAbxn/pWsRC4twYIfBs250WGJUZG3RF1FTRhux4XxQIoGcfi
	 vS6+jyvimBS0g==
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
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/7] dt-bindings: arm: fsl: Add verdin imx8m[mp] and imx95 zinnia board
Date: Thu,  9 Apr 2026 11:58:47 +0200
Message-ID: <20260409095855.61252-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409095855.61252-1-francesco@dolcini.it>
References: <20260409095855.61252-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add Toradex Verdin Zinnia carrier board mated with Verdin
iMX8M Plus, Verdin iMX8M Mini and Verdin iMX95.

Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0023cd126807..f5429e6c86ff 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1025,6 +1025,7 @@ properties:
               - toradex,verdin-imx8mm-nonwifi-ivy    # Verdin iMX8M Mini Module on Ivy
               - toradex,verdin-imx8mm-nonwifi-mallow # Verdin iMX8M Mini Module on Mallow
               - toradex,verdin-imx8mm-nonwifi-yavia  # Verdin iMX8M Mini Module on Yavia
+              - toradex,verdin-imx8mm-nonwifi-zinnia # Verdin iMX8M Mini Module on Zinnia
           - const: toradex,verdin-imx8mm-nonwifi     # Verdin iMX8M Mini Module without Wi-Fi / BT
           - const: toradex,verdin-imx8mm             # Verdin iMX8M Mini Module
           - const: fsl,imx8mm
@@ -1037,6 +1038,7 @@ properties:
               - toradex,verdin-imx8mm-wifi-ivy    # Verdin iMX8M Mini Wi-Fi / BT Module on Ivy
               - toradex,verdin-imx8mm-wifi-mallow # Verdin iMX8M Mini Wi-Fi / BT Module on Mallow
               - toradex,verdin-imx8mm-wifi-yavia  # Verdin iMX8M Mini Wi-Fi / BT Module on Yavia
+              - toradex,verdin-imx8mm-wifi-zinnia # Verdin iMX8M Mini Wi-Fi / BT Module on Zinnia
           - const: toradex,verdin-imx8mm-wifi     # Verdin iMX8M Mini Wi-Fi / BT Module
           - const: toradex,verdin-imx8mm          # Verdin iMX8M Mini Module
           - const: fsl,imx8mm
@@ -1271,6 +1273,7 @@ properties:
               - toradex,verdin-imx8mp-nonwifi-ivy    # Verdin iMX8M Plus Module on Ivy
               - toradex,verdin-imx8mp-nonwifi-mallow # Verdin iMX8M Plus Module on Mallow
               - toradex,verdin-imx8mp-nonwifi-yavia  # Verdin iMX8M Plus Module on Yavia
+              - toradex,verdin-imx8mp-nonwifi-zinnia # Verdin iMX8M Plus Module on Zinnia
           - const: toradex,verdin-imx8mp-nonwifi     # Verdin iMX8M Plus Module without Wi-Fi / BT
           - const: toradex,verdin-imx8mp             # Verdin iMX8M Plus Module
           - const: fsl,imx8mp
@@ -1283,6 +1286,7 @@ properties:
               - toradex,verdin-imx8mp-wifi-ivy    # Verdin iMX8M Plus Wi-Fi / BT Module on Ivy
               - toradex,verdin-imx8mp-wifi-mallow # Verdin iMX8M Plus Wi-Fi / BT Module on Mallow
               - toradex,verdin-imx8mp-wifi-yavia  # Verdin iMX8M Plus Wi-Fi / BT Module on Yavia
+              - toradex,verdin-imx8mp-wifi-zinnia # Verdin iMX8M Plus Wi-Fi / BT Module on Zinnia
           - const: toradex,verdin-imx8mp-wifi     # Verdin iMX8M Plus Wi-Fi / BT Module
           - const: toradex,verdin-imx8mp          # Verdin iMX8M Plus Module
           - const: fsl,imx8mp
@@ -1515,6 +1519,7 @@ properties:
               - toradex,verdin-imx95-nonwifi-ivy    # Verdin iMX95 Module on Ivy
               - toradex,verdin-imx95-nonwifi-mallow # Verdin iMX95 Module on Mallow
               - toradex,verdin-imx95-nonwifi-yavia  # Verdin iMX95 Module on Yavia
+              - toradex,verdin-imx95-nonwifi-zinnia # Verdin iMX95 Module on Zinnia
           - const: toradex,verdin-imx95-nonwifi     # Verdin iMX95 Module without Wi-Fi / BT
           - const: toradex,verdin-imx95             # Verdin iMX95 Module
           - const: fsl,imx95
@@ -1527,6 +1532,7 @@ properties:
               - toradex,verdin-imx95-wifi-ivy     # Verdin iMX95 Wi-Fi / BT Module on Ivy
               - toradex,verdin-imx95-wifi-mallow  # Verdin iMX95 Wi-Fi / BT Module on Mallow
               - toradex,verdin-imx95-wifi-yavia   # Verdin iMX95 Wi-Fi / BT Module on Yavia
+              - toradex,verdin-imx95-wifi-zinnia  # Verdin iMX95 Wi-Fi / BT Module on Zinnia
           - const: toradex,verdin-imx95-wifi      # Verdin iMX95 Wi-Fi / BT Module
           - const: toradex,verdin-imx95           # Verdin iMX95 Module
           - const: fsl,imx95
-- 
2.47.3

