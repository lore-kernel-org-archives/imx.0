Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69262DB798
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290743; cv=none; b=uBlNmz1/hK5+g3kHPUkHw+kvfUxw/4BxJivg4U6N9xyG0ppKKjpHfHUjl1y7FvJybrxQzi5JMtiDfrermZRSQHRgcnH1t+pScgnU+eFJ19xmHw2KAArzJmMl5pi79o/xRPklqig+3ePqe+lGvOhqwUTq5Do8GuNCjFz5rmzBwDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290743; c=relaxed/simple;
	bh=0zykHfxN3gsFNssyfN/hTa2DI+fvV/ERYCvm+hmPwdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CY+zWaqfwnRWFf2Kb/k3ko4Ul78s+6dsd3I433JwsNAVfo0dkilAfEUGdz1JRJpAIhwVVfg6aGpg4L9s+LnAhfi3Em4rZ3AJzehOwNn9bIDPf+/6FmJbT5m/JecmWixCsgqJziOpF7txHAAI/prHJnCmxy5iysSaIOYG6Dx3SwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=SvW03pgf; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="SvW03pgf"
Received: from francesco-nb.. (unknown [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 8559B22734;
	Fri, 17 Jul 2026 14:18:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784290739;
	bh=tjucR87tClkz1l16S+aKThSWLFGeiCovQUE3GWKhawk=; h=From:To:Subject;
	b=SvW03pgfGHbcvlEjpleane2zkSv47jHysVnJ90Evye158m0l8ExpCNDEVu1VT94fd
	 LtEAmovQ7bafUBcJ9Z3655theSQ7+Q5qaD6NDlIhY37/HzrpOmKOVMB8x1ukBMGXxa
	 aRa/sAlNYI/VhFtVdFWFz/HGZY7gADbzQQZ7gAF2JTLo2bDpMTv/gWLTdOKBWO5HKL
	 11u4eb4Oz9XgAM3gLYM5ulNg8ufRhKCIKzQucqCqU41584bnhddYQ8TQVNLtcu6M4g
	 1SYa0yOTuYLJ/na8xJhY3A9V0TIEkvrl+x4S/Up2d0FKpyJS2WdvuOoR8xi330po9d
	 VG9Is131dc91Q==
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
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/4] dt-bindings: lcdif: Add interface pixel format
Date: Fri, 17 Jul 2026 14:18:43 +0200
Message-ID: <20260717121847.488148-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717121847.488148-1-francesco@dolcini.it>
References: <20260717121847.488148-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

LCDIF has a hardware-configurable LCD_DATABUS_WIDTH field which selects
the parallel data bus transfer width. The selected mode changes how color
component bits are assigned to the LCD_DATA pins.

This must match the board wiring. On Colibri iMX6ULL, for example, only
18 LCD data lines are routed. A 24-bit panel can still be connected by
wiring the available LCD_DATA signals to the appropriate panel inputs.
Without describing the resulting interface format, LCDIF may assign the
color components to different data lines, causing shifted colors.

Add interface-pix-fmt so the binding can describe the configured LCDIF
bus format. The same property is already used by
display/imx/fsl,imx-parallel-display.yaml.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 2dd0411ec651..209ee5a96e39 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -58,6 +58,13 @@ properties:
     items:
       - const: rx
 
+  interface-pix-fmt:
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - rgb24
+      - rgb565
+      - rgb666
+
   interrupts:
     items:
       - description: LCDIF DMA interrupt
-- 
2.47.3

