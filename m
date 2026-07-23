Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A523D4399C9
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 09:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799508; cv=none; b=JGZoCtxUqZLbP6nQm+nWVAQynyJtqY/T0Xzjx+lo4OKqvltPdcoSWKEOuwuoZMHjYQUnXMrT+1AvVAYLpfbkX9OrbWQdilW3QdLFe4ijHkDpGY5rQxHS75ZloPC5X9ye/hoQzxosm2y7ClAryJ6Y8Q6xgDInEQLyQ0lOAgUAXXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799508; c=relaxed/simple;
	bh=pikZJFmRJWW2Gqa6mAf7CRsxIjxeGbuQ3hy0TCEGWeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+1oF4gY1rLMYtoRHK53gYfiwhZxU2sxKbAevcTbekJ8tB9GoLFb+3R69D2HFNdXoDEVxBWgFy824aAKhyjIAi4CuILk2NSJe7/4cV+Fro3gtnGcrdRKuq2+I2sX6+IDLzMgdpO1sW+fp3uzPENVcCguOKHCJuok8CQ1+EbqRqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=O4Am82Ie; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="O4Am82Ie"
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1EA9D1FB8B;
	Thu, 23 Jul 2026 11:38:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784799504;
	bh=n+PO7sYjoqkoCNw3sBQCCaj+6WMmpLchwWbeVlk0qeM=; h=From:To:Subject;
	b=O4Am82IeMk1I8SyPwwCl0Z1iLy4C1fCxtV4MjISW7+wHk5F1/6B2R8DieCFvWLVqS
	 +mOUY2QwWlLkDOfyrMZpeZ3nXvpnESytQjmkoN74wASvXFgCvIQYBkOxlNuMAdBZq+
	 35ERA9JnXvzvOZrpbY2hwrQ90bRfb9AaqcoZ89iHT04xiR0KhoZXyeJdEejZjWcTll
	 lo+D25km4dYqhfDz1PXNKXC5Ya+osjV4xYewG0xVlaalOKf6Ij28/7r3TNtgwX+vKT
	 Pv/eQfcOqzt/WdImSMKA1GbDiqUgVCtBN/vLtnicm0epnybwyYkgU6Ttp1p0BjSaiI
	 BTm47u8IHpYxw==
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
Subject: [PATCH v2 3/4] ARM: dts: imx6ull-colibri: Set LCDIF bus-width
Date: Thu, 23 Jul 2026 11:38:10 +0200
Message-ID: <20260723093813.180089-4-francesco@dolcini.it>
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

The lcd DPI interface on colibri imx6ull uses a 18-bit width bus, set
the bus-width property accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
index ec3c1e7301f4..1eb1cf2d7395 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
@@ -229,6 +229,7 @@ &lcdif {
 
 	port {
 		lcdif_out: endpoint {
+			bus-width = <18>;
 			remote-endpoint = <&lcd_panel_in>;
 		};
 	};
-- 
2.47.3

