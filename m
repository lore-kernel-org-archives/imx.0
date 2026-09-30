Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85F74BF932
	for <imx@lists.linux.dev>; Wed, 30 Sep 2026 21:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804884; cv=none; b=O7K/H8/iabGca8S4Eigw72aEWikHb+Ignpb7U0O1eSjPN1qJ0fSwVs2M4jk0DIUPwdLnbKVXTzdiEVQqyYCTxerEP6/u/LUe8XAGNGaZ0jpbhUBxoXE/HYUpmsP51QWAHsSe2XnHqYbN5aWHKTF/15hJd/36sU8QMKbae6+0WSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804884; c=relaxed/simple;
	bh=4Z+0xUl0MahDyaj8r1vUm49UxPAG3l/mzBM0cr8XgUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4OiVgvc0Ulcu73iZ4Pn6NxQ9tw9ynE0yr30UgbiHrUAcCZUogE6tbPgrZQRxAcES9j0eWNZ+iGN3xFB+jNe347GHndNv4MjplSLp7Fnr4FgDLCSPePg8iEQcMA95dMqP1SsVKBTrA14NUOzs5sVafn6g7tVYdMBP3Nx0NGxyX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=XfwUwhQT; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="XfwUwhQT"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9F7E107096;
	Wed, 30 Sep 2026 23:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790804875; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=8LeTSpTOh/a4F8BYpw89pOWNtfrWtr2Ni4MO60cCAus=;
	b=XfwUwhQTD8JxK32TKshp3VbyfErUsjYD86K91Yi4CnsuiVXb4lxV1Ea/+MGyfIb87PQ/oQ
	JOHQNv7SKsNeJyz5i+mXe0QUOaF+rBEAfyCvdNpCy07wTi1pQLz680iblvIwkO8ubYJ6PF
	6IsJlbWSdaObZ5il8FeipuKHRz42UBe5yvN97UGP/jxjMQ5lRlhFhVCLMwvBzwVI1RaPAM
	mfrrMKp+YzbeGBmtCc3CITRSxB2aq2p+q/7hdjHG/C/pks+numQsQNLM119iSDgk6Bx9iQ
	FXkrCoCK81DVOxUhF3Kj153UEOmw33OkOuX/WBV5Mz4UBE5vlromSfXG+W87fg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: phy: ti,tcan104x-can: Document Microchip ATA6563
Date: Wed, 30 Sep 2026 23:46:38 +0200
Message-ID: <20260930214729.809649-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Microchip ATA6563 is High-Speed CAN Transceiver with Standby Mode.
It is pin-compatible with TI TCAN1042 and has a compatible programming
model, therefore use ti,tcan1042 as fallback compatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Aswath Govindraju <a-govindraju@ti.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-can@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
V2: No change
V3: No change
V4: No change
V5: Add RB from Krzysztof
V6: No change
---
 Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
index 0cf5fa21106b6..e97b1bc0a2e45 100644
--- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - microchip,ata6561
+              - microchip,ata6563
               - ti,tcan1051
           - const: ti,tcan1042
       - items:
-- 
2.53.0

