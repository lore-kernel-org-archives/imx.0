Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827900;
	b=wk24w2qjjPZFhMkeHCMXp3kQFtF6J4GF7H0LrRvp05xc26jXVvVmVUnnRizEQeRTV5SH
	 VfcQlXtMTSBknG0gUbQ7cTC0xAQfx/Rj/cX5F+U+Iq5x/bK//Ubj8/FaiV0k8bgcpjWBL
	 RxZ8sbVM1pRr9phoBd2o4bzwrF0tAGaBn+GUsXv75o5tlXKr37q5NK+g25CIQOjvY9xRt
	 qLAZoaTczDrNODdNVxpDc1mhmCV/d7vmZdjDW2nQgpTThmmA8ov3NIb6LKRQfxIJwA7vA
	 gtw0RoSC5BcfDRkeodEYeAR8OlAVA6VzESM8wR96EmDwkZ3miuKcDPhMkEcBOBFISUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827900;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=a3AUKNlSVDZ39IZwLsl97UWsYGgmsYsDaAjeg9BZZYE=;
	b=Jq8Z988MMo0GNp7SNZPL4R1hcWJTM+e6gXoCXLub/es3h9KEmMc2/I69Qdp+p7yB4tTF
	 qd03r2jEEGpr3BFR4y70r+0KYC/ao0zzjY5aLtTVMxqS8mV1x3OpICxrw27hCA+a/LJqF
	 N6iUqcJP1JCLKxYWphyvXHtSobzf2Ebn4YUF5aFZtCP97qrYrNf6falbGmT8LMjtc8Pv0
	 l3dT6nzsnlLs3Df+z75J1hfZ1bEX666Ksk58EcW8vTxCMlewebvUd9DgJTLhCRO89rY5s
	 rNnyKrrdGruj7k6Qe+HPCvmKBMSRIfz0SkBdbKsgEnGnUFhBXnpZuYC1Dv6wzUJuRuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KkRYS7mp;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AED606FD87
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 11:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43AED606FD87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KkRYS7mp
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52A9110D21A;
	Mon, 16 Nov 2026 12:18:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794827897; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=a3AUKNlSVDZ39IZwLsl97UWsYGgmsYsDaAjeg9BZZYE=;
	b=KkRYS7mpH7UrflVNcXh9d6Y43DirBj6jis+xezcRiSpz5nfZ/ATIiLBUzkPM+7wMEhk2nT
	UOIRZRAaseM7yCeWo3MdW1retdbZGfCsCpZ9IXChCKSxekU0u7MscH9vyRBk8Kdg070u6V
	UNz8/EZ4RKbka4svVqh33oWxoZHFD7wQzISws98vjXsZVjhY+AC3ZGmsvhSSBDTThzv4HK
	2RejkcJJL+vhL6AF7HzC9LliXj9rL8YE1YEFaZYU3cDZFcJeFFEeTuf2fDTr9TG1G2f5Ub
	CLOVtKo8z+Oc0vPMTQMBkr4U0SawGXwvkkSgtb2Mhq+iMgkHYR/YCZEdMYFk7g==
From: Lukasz Majewski <lukma@nabladev.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
Date: Mon, 16 Nov 2026 12:18:00 +0100
Message-ID: <20261116111802.2442456-1-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add an entry for the i.MX8MM Cloos CBASE board.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes for v2:
- Place cbase in the correct order

Changes for v3:
- Add Acked-by
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..0fd10f1a1a58 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1101,6 +1101,7 @@ properties:
           one compatible is needed.
         items:
           - enum:
+              - cloos,imx8mm-cbase         # i.MX8MM Cloos CBASE Board
               - cloos,imx8mm-phg           # i.MX8MM Cloos PHG Board
               - tq,imx8mm-tqma8mqml-mba8mx # TQ-Systems GmbH i.MX8MM TQMa8MQML SOM on MBa8Mx
           - const: tq,imx8mm-tqma8mqml     # TQ-Systems GmbH i.MX8MM TQMa8MQML SOM
-- 
2.39.5

