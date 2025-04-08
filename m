Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC6B253331
	for <imx@lists.linux.dev>; Tue,  8 Apr 2025 20:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744144193; cv=none; b=l1prasSH3Mj/O4kgsktyXWUgahDdzVwtu85HiSs0I8vZBx0b4X9jzbuaBOnxpReCmTQwQBRoTlnrXw2ECfisSSsqt9oKX0Z4BeHeBsPICNX9E78heL8C50lOeCH2FkRarEJevzJJ5es1oR6lRvdY3NMAeNtkKsYstn/QBEr2lDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744144193; c=relaxed/simple;
	bh=mIa7jVwadNiDyZ5ABZyjBRnpoIsoCuNlDg8BjuOS5iI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AE5HyoIv2LkgoHUtegSiP12oHWqB8dTsqe3fgpp04hKB85pysECf5w5XllrcvS74523oqzdOyMDx1JpgtWsd3uHEJrh5DGdw5czgxqNfYz9hETAu436ylBWjRBDXyC4wMzhneCqM2QV8XgIuWl35XEtBfpbtbJWSUnpDLvtdzk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ut9D8oqq; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ut9D8oqq"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2C21A1FB4D;
	Tue,  8 Apr 2025 22:29:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1744144188;
	bh=rbuSfZMlCXke2NoxpZ7BBY2YV7E+cslEawa7Eg1inps=; h=From:To:Subject;
	b=ut9D8oqqEa1vpgS5PSz1kbV2wc06nIfi82YWIsTv0FjqSt71rgT3p6SG4H08IOT4r
	 KawO7DDxIwL10JRd35ptLd/neiOBlEkflY1VbMaaaWxFR3svE0e+X6MtP19CfYmENY
	 KN71ApBFsCOAEgxrHv6PECIfPQEXBHYt2gceODjyw26NudOj41xxewsyFqzzx2m7j8
	 qxRxbM6Ykpj1BA0Sm2d2O+zmfRmptjZdYMns8Hek0ExAXauAcB6XsVMEnyz3OD5jg4
	 TKhzhBr0g0dR/UtC9SJVTM00a800zGApo6VSjXWGwDMd1x29Bn+GTKzjE7wDTtPEog
	 7qIV3HfODdjvQ==
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
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx8mp-verdin: Add EEPROM compatible fallback
Date: Tue,  8 Apr 2025 22:29:38 +0200
Message-Id: <20250408202939.6887-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250408202939.6887-1-francesco@dolcini.it>
References: <20250408202939.6887-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

According to the AT24 EEPROM bindings the compatible string should
contain first the actual manufacturer, and second the corresponding
atmel model.

Add the atmel compatible fallback accordingly.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index e3869efe4fd0..d43ba0087126 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -657,7 +657,7 @@ channel@7 {
 	};
 
 	eeprom@50 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x50>;
 	};
@@ -770,7 +770,7 @@ hwmon_temp: sensor@4f {
 
 	/* EEPROM on display adapter (MIPI DSI Display Adapter) */
 	eeprom_display_adapter: eeprom@50 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x50>;
 		status = "disabled";
@@ -778,7 +778,7 @@ eeprom_display_adapter: eeprom@50 {
 
 	/* EEPROM on carrier board */
 	eeprom_carrier_board: eeprom@57 {
-		compatible = "st,24c02";
+		compatible = "st,24c02", "atmel,24c02";
 		pagesize = <16>;
 		reg = <0x57>;
 		status = "disabled";
-- 
2.39.5

