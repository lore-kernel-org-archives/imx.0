Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F10233735
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761317382; cv=none; b=HGG4IXM0kUUYRAE427AatjaDyGr3C8kqWnMLnVyykypZ/oXm5Ap0+c7kc7IZzCQcJFsTg2cmb2Ikwc9pNHxOpsdVfDR6sH11bQR2C9En144FfanlSgq3zvMf7476fwzUCKhFiQSbruGkw1jOjExShoM8HHvSRagkIm5KQN5yR2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761317382; c=relaxed/simple;
	bh=bMfoKxUrTymEyBHW5+QxmB25fckpK+sT/m9bXrOFMcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCeIFsNVC6TkrwCLvIOuLeEohb0gRyklelgHp5D/7t7Fd19Z6922q/IQONotfuH8Xy+68sVaO5/Wkkas4HUI3ko0FXL9SFpuSQXWBGU24D1rLRzZL4O/aytWmCDhjUSoG/buDTfyudGV2dkuoxizj0aOLhhNuftfdVpI5Uk+uv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=BCZQjEja; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="BCZQjEja"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 37D6E25C78;
	Fri, 24 Oct 2025 16:49:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1761317370;
	bh=zva3FPKeFabbu2LtkeKWUVIEJqvYScNBl/WxN2/Nsvw=; h=From:To:Subject;
	b=BCZQjEja8kaPiU4A7pSr6CRYlMDXu+OBpYwswer+zxn7mOJ35Hr8HVmZaFHqY63Bt
	 XhXD0ao3G0BA7+kqXNcQuW9rLW//2blv2LF6nHjzjQNyihYALX5ZENi9teSfPLp0bK
	 LVJqmTxHmLH5QRLZD64Shedkl6qla70G1T7gYw04zHpUA0T8Zs0RTgSsdYDAgVc7lz
	 U+Elu4czZMmOIHqnNpE1ecb7Kl2qaUiohsoEcat3nS2sMQtDu9BJQjUbvimUyHU1Oq
	 Rh34YWZ8LrVoFqwkEHc165lHcBuYRyjGNOqnysnphLFTjAvqDamepUjU7+rN7BBJrC
	 iS/YAjnah2asw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: =?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1 1/2] dt-bindings: arm: fsl: add Toradex SMARC iMX95
Date: Fri, 24 Oct 2025 16:49:20 +0200
Message-Id: <20251024144921.77714-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251024144921.77714-1-francesco@dolcini.it>
References: <20251024144921.77714-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

Add DT compatible strings for Toradex SMARC iMX95 SoM and
Toradex SMARC Development carrier board.

Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/smarc-development-board-kit
Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 00cdf490b062..44dd93f1c674 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1439,6 +1439,12 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: Toradex Boards with SMARC iMX95 Modules
+        items:
+          - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board
+          - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:
-- 
2.39.5

