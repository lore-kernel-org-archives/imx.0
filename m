Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B955B19DF62
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 07:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749801588; cv=none; b=fTKwyIZveJUPj/5t0qkdT14/vG+PxEc+ckUQ8Nes7chPENUHcAntoliOa3a0D9ZuqnbI+aGgwaRf4g+uMIhk1Ovkqg34MNgCE3s0TWmfMtLsekGJGsaOL/6ufHka+ECpQ6wGyfVp6BDDeQ3DZx0AemUI59stGoSyfavs0WFomrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749801588; c=relaxed/simple;
	bh=c6dX2sgFdLDHE4jlcSg/9dMZ1jCJv0teKwm6uep1Bw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n+5HIMRTmyz6iZ3DR1lfW7XCwQRnAcx4ukTLXkeAakG510tAbz11xE+BQta+fbJSxH9ODcuZ7tvRCUTQv8GN7+SE5JTe9W3smPL5h6o5dCjod5D2119l9ptpxDveDbd3ab2ZG4Ycz4aAD6Db4AhN4X9GspYwu8rcR2eP7NnIYRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=SSUav9z0; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KscqKR3X reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="SSUav9z0";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KscqKR3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1749801586; x=1781337586;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DNSVoSPbN0xw1Vl35sz6w62zrgvAGm/58iSlaXRrh0A=;
  b=SSUav9z0GGJyVY9zr29zmLE9MBGkquFAUserXQVM1Hl2esE7t6vwaGvY
   0nKXDUUb0yerjgTgboguoFUEU4aOayuVfYdL2NJ94ygOpVVWvP77m5r5m
   DicDXn1mb1FvFGaccdaSMjjGy/LnA07mxH0HA36ovIiCwB13jxFv2j54a
   ZcIiJcrI5XaFjHtlP9fRtBxPbHM8I/Ibq1M0d8cXDyLQT53SbOCiNrxsE
   MHB0W8l16xU4hnfLKAAgDcQAw/HDAKZdzLSxWW66uelq2rJW0rsHltkeh
   4xqYpTSHIPPs7j8KRCBSiV1USlpTQgph9O3EkEmY33ywmoQchrv1zstoR
   g==;
X-CSE-ConnectionGUID: ohkuIZVGTPSxJQ2LAH775w==
X-CSE-MsgGUID: BXNNdm4PTICTcwQoF0kxSg==
X-IronPort-AV: E=Sophos;i="6.16,233,1744063200"; 
   d="scan'208";a="44619241"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 13 Jun 2025 09:59:37 +0200
X-CheckPoint: {684BDA69-2B-569BE4A0-ECC5EE08}
X-MAIL-CPID: 358E842842ABC3833C4F485B546D080D_3
X-Control-Analysis: str=0001.0A006371.684BDA7B.006E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D85A170669;
	Fri, 13 Jun 2025 09:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1749801573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DNSVoSPbN0xw1Vl35sz6w62zrgvAGm/58iSlaXRrh0A=;
	b=KscqKR3XLu8BOQs4LA8yo4NPygiDtQERFHDqqVTaDJv5+58YSJubHPc5DOm+nnFGutkwhZ
	gbwvlTrD2irSOqtzJu1X7SZA3UIHRl3kgx42EYylzJZbiJTNw76F0ViNG+vekOFqSrV9Ro
	6rkUoYitJl8w/dfmXES0lb+lRx+O2S4Ls/R/otX35AdLwJSC3SBT43C0fBTlxMArC++Ut/
	jvyrn1z2Y6vY04qVWIzEtjWWncqH+Dq5cpOR1KvzwsTp7pgTiV7AXOYYsD4cQEDqH7dgLt
	iFazszDIyG/veLC3MVqXvOaqdZ3ZMGd1TmIcyFrW/Ip0czOuN0OoDXPk554h2w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt: bindings: arm: add bindings for TQMLS1012AL
Date: Fri, 13 Jun 2025 09:59:24 +0200
Message-ID: <20250613075927.392499-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

TQMLS1012AL is a SOM using NXP LS1012A CPU. MBLS1012AL is a carrier
reference design.

[1] https://www.tq-group.com/en/products/tq-embedded/qoriq-layerscape/tqmls1012al

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* None

Changes in v2:
* Collected Conor's A-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 4fb323fb8ab4f..d828fbd4d988c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1553,6 +1553,12 @@ properties:
               - fsl,ls1012a-qds
           - const: fsl,ls1012a
 
+      - description: TQ Systems TQMLS12AL SoM on MBLS1012AL board
+        items:
+          - const: tq,ls1012a-tqmls1012al-mbls1012al
+          - const: tq,ls1012a-tqmls1012al
+          - const: fsl,ls1012a
+
       - description: LS1021A based Boards
         items:
           - enum:
-- 
2.43.0

