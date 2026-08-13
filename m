Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561CF3D6690
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 09:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613334; cv=none; b=jqtkzFkphc6fd+bfu765rC8wc2BCt3y8yNnvNhbA2I7LQizl+zOcY5RbBCwxtjT7zckrqx38adVJMy8qgNW+8vJCWOLEVEqsXyjdCJBkm937Eo6JdO10Ug3xXukVz61inFu3kjXPu/RHFbaTHzrY4Ayv78mBQJ/FiBMhBCU9dHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613334; c=relaxed/simple;
	bh=z+8F8eDNzKbFCSY2BG5dcuGU9parwTszYKX3j9tUbH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtqgJ3faS5TIMH+7FoNsOjmonHYnKctvOKJaH/7B0M3uxGLaD61/0wTnNV1ftqhnl6VcVyBAQI96QXe+gAahxMC/5xwgj9s1Nt7qstzhzrc1YWmB34wFcKp46mmXJ6RUdyp6h/Mm/kXlAdTwsnBolBqecNl3n+gASPNjiIcaMcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Z/h3p0rm; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Z/h3p0rm"
Received: from francesco-nb.. (2-224-16-253.ip168.fastwebnet.it [2.224.16.253])
	by mail11.truemail.it (Postfix) with ESMTPA id 3C56822BB4;
	Thu, 13 Aug 2026 11:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786613331;
	bh=8oRtz8j6WHCmwH9XsaEurPP37uBVzs7lIGw+sWlvKGA=; h=From:To:Subject;
	b=Z/h3p0rmyvxuZ60Dah646UY+0Tml/Zi5m0e44X9cjel+PlXVyDEBZK1lmds5b3X4P
	 U5TMnTT7lWTQAZdcUiL9RffBrzPBEBbzaBncSDP0gFcRmffiilWG3FTYikmuHMNZFk
	 ptkHN2oaAYZXY64uSmNMbW4ZR8AXRubLgsrQvCxHJ6S4Hf+BumnYoUrWBLtKchjrgG
	 JAdny/lJh7xONMU7dEVjAPbR0UpAqmC4fVfcjlCZ2RRaUAOOywTlesW6MeuSSfQkcf
	 S3OMZyw38PqKYSxKLL9RrHSppzXAJNqFDI37r7sEIRdCWyNOd/s1wGFO3E+KrpueDZ
	 h34n+0CWv7E7A==
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
Subject: [PATCH v4 4/4] ARM: dts: imx7-colibri: Set LCDIF bus-width
Date: Thu, 13 Aug 2026 11:28:34 +0200
Message-ID: <20260813092836.38367-5-francesco@dolcini.it>
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

The lcd DPI interface on colibri imx7 uses a 18-bit width bus, set
the bus-width property accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v4: no changes
v3: no changes
v2: use the common bus-width property instead of the legacy interface-pix-fmt
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index 8666dcd7fe97..c4088d3c5ab1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -537,6 +537,7 @@ &lcdif {
 
 	port {
 		lcdif_out: endpoint {
+			bus-width = <18>;
 			remote-endpoint = <&lcd_panel_in>;
 		};
 	};
-- 
2.47.3

