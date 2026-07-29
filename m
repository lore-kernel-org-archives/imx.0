Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8178B3FD129
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 21:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785361663; cv=none; b=RHQVslZq93VsmuK/sTzzIHks2NxfBYwEnJipHB2u0WbeUk2xACR90OYNE6ixexFziEUivLuI8HjIUp0gqS6MTBwWK1rrQGVkl9CHFvomWHNAgbnCm22msHs8OSRDz9bAdZ1zbq2Tzsk7D9bM96FZMUMTXVA0iMa8Dwgx2qwqxLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785361663; c=relaxed/simple;
	bh=mxDxSaUP1Sv3B+e2aHvyE6MGV2/BAZzRDAxoF3VmiB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pip2dRz6wtFifT3dj9YbNQhGYnugosV2i2VSG0oTAP7bnd1rRzkuq+XFDNSP1iVvf/qXK0hs0EnSfyO2JJU2bF3vTNRhWIXqKrCNUSpIcCpgW8M5kxe48lLt6Pd767OfoZbT5LqPVgTkTGP8xUfA8Kmqh4ONkAj9d+MF+eX2LDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=ZWCk6Yxd; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="ZWCk6Yxd"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C9D1111B6E6;
	Wed, 29 Jul 2026 23:47:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785361654; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=HwdGaYIOoiYZyUHteMXpcmA6h4yUwCXgA4FVyVxNxhk=;
	b=ZWCk6Yxd0aiBc9nRkNuHdOgJfU0ffeu+PThFbtvq6tMVAny9+V5LvtaPH/EpFW8Cezs8VC
	VjC6Gm2qIVNF0X7h0aLHrqw8tbFepRKxCErUySU4hYCIfdvC0jIfY+Fb9glOmuxdMpeQqz
	WMBIN6jNpfneJKXg6T6+OyZDCfVsDpQNFe+6+7urEnc0GxIcHmCQzUIQIjyo2Je4d6tMHy
	ghOOArkiUYlVJHM/Wi08WKe8IjjVGw+NS9EwNVUbMuw9zVJXTx20Jpjs27fGrKbS9c9GNr
	UvK3sKeGVfsAd3XNCeLCKFS/toPnk9MtN1/G9Fdbv8Skg9T0r+pnZFSncHReTg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/7] arm64: dts: imx8mp: Add DT label to SPBA5 bus
Date: Wed, 29 Jul 2026 23:47:10 +0200
Message-ID: <20260729214723.557461-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DT label to SPBA5 bus for usage in board DTs.
No functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V6: New patch factored out of previous
    arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
V7: No change
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9cf9f6f08654d..bec64cbb36347 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1437,7 +1437,7 @@ aips5: bus@30df0000 {
 			#access-controller-cells = <3>;
 			ranges = <0x30c00000 0x30c00000 0x400000>;
 
-			spba-bus@30c00000 {
+			spba5: spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
 				reg = <0x30c00000 0x100000>;
 				#address-cells = <1>;
-- 
2.53.0

