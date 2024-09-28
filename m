Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614A814387B
	for <imx@lists.linux.dev>; Sat, 28 Sep 2024 23:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727567422; cv=none; b=QTlYL9WFvf+J100ui3cwN3Ky9gUthYd22MT6dze24tLLzZh90Eh3RWcF2fy8Twhq+Q3ah2BKut12fRNcCbx1y8n/ZeBCVPQ6AO5aaDf5jK/c8AzhGbkxtT8fqnTSKMlM4IMbiEdw16M9/nBQ6T9Yt4ByxdBRr9y7mGUprXKK/z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727567422; c=relaxed/simple;
	bh=MAXLRiW5fvxR3Tcyvd8+iENJysL/5MXZd91EbCDONxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=btiAOLasFy0jeMIRIsyUFXvJqYYbrWOB30tDs0JAvGnE/JYiMvLGlDZdoe7iw/jyJ2y+cKGt1BEuq/D6xZ6jT3NhHASiT/z4QkBB13kkKyYJ7b3FiFXemP1n9wljG4noVcmxesoR/fMo1nJFsAzHQFkewdu6X2wecYTF8lZYJ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=GlEgHzwi; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="GlEgHzwi"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 34C3488972;
	Sun, 29 Sep 2024 01:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727567413;
	bh=mvVcwj4kP03YMZk4e1ujC0JF26SHAyC8zjA22Sj6ab4=;
	h=From:To:Cc:Subject:Date:From;
	b=GlEgHzwiiufaqOGH2HuAgEUlWw2SH0NExOrwrR+ZsFLWcEhdi3sN+UFdSXqdIAawJ
	 U1sPI1lET1ApHya9oXtrjTK96CkDT575cInNCCQ49vSUMVTnFav/LlAxQ+s6qy+ZoD
	 J0XlKtjB++TaD3ZF0WzjKx4hH3z42zlv561lF6dlxKHRXCszKZd6xDVUUCGwExhmYh
	 ydoJgPEoIld5qM3nUyfIZCkaAUhCW46BtoXoq46T6iEmrUtTwjUBXW/nlOExu4oeIN
	 zAJ9wxk21hPuLZ9g5FBHhxLjZU9HjfPYWGq44rUGd5GbMSiBoK+pXQ54kyqBGjMwef
	 6f+P2GnaoFj/Q==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: kernel@dh-electronics.com,
	Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Document DH electronics i.MX8M Plus DHCOM PicoITX
Date: Sun, 29 Sep 2024 01:48:08 +0200
Message-ID: <20240928234949.357893-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Document support for DH electronics i.MX8M Plus DHCOM SoM on PicoITX carrier
board. This system is populated with serial console, EQoS ethernet, eMMC, SD,
SPI NOR, LEDs and USB 3.0 host used in USB 2.0 mode on PicoITX.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Gregor Herburger <gregor.herburger@ew.tq-group.com>
Cc: Hiago De Franco <hiago.franco@toradex.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Mathieu Othacehe <m.othacehe@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 09027a4ef515c..319dc8f0f5a63 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1103,6 +1103,7 @@ properties:
               - dh,imx8mp-dhcom-drc02        # i.MX8MP DHCOM SoM on DRC02 board
               - dh,imx8mp-dhcom-pdk2         # i.MX8MP DHCOM SoM on PDK2 board
               - dh,imx8mp-dhcom-pdk3         # i.MX8MP DHCOM SoM on PDK3 board
+              - dh,imx8mp-dhcom-picoitx      # i.MX8MP DHCOM SoM on PicoITX board
           - const: dh,imx8mp-dhcom-som       # i.MX8MP DHCOM SoM
           - const: fsl,imx8mp
 
-- 
2.45.2

