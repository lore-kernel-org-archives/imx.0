Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697082;
	b=bb6uGJJMs2ewlXAVkOuFS1P4ZJs62r24lkgFiZbheJA5Zdh3/sG0gvt9B+Cjy54UmMVK
	 FdNQRcYtE6opUbUxnrEkuJHhPL2GLXArUXL7E1ITlOWJjY9SBFyhH20IG7kkptGO7beiv
	 grancqBRg9vRLkmKko+d5oPiq7IiiupM+QWTAKPdSu08euWQlqcagb9Gbefp37hJqD3wi
	 ZkMlNtx8VClXB6sHi6XS6kiXvkyPYIRzwC/mleyvvROn2swmY9VUgbFRUfSt3iCp/GoYn
	 cLR0IFd7J6bGx//f6ODvIpsKNNILTBl1Nw/BmWFGJI1ddlJTBni5/NPrkccWAkUFSjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697082;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=gn8xExWn+s8bBabSkYazgCzac4ckX+g0DW2J0ueTK/E=;
	b=fBeqKHnZVKimYHiDv6CU/tAlV3bF7IIow/QYJ70hpId6bNwSKPZa+n+ety386Xh11Ona
	 Rpw7gPcU5x0aj9fFm3ep5EfMxgsi4zhQaGEjxx7gWpLeQJ50SUmHsY3MJQCo1ZvZS/fGz
	 KJISwmBIONBzZE++7ugrsmH2MFfiZXQA9KCoo06Y/yy1Fk8Dg0UYwQzUTsCPKkvgBsaKs
	 P819smxw3AneZLMBdO5pEiUtknOyg4SlpKcv+bdwy8o5X9GOwGnwW07eXrstMlhe+cWh7
	 Q6HxyAUrnKQvgSPE8CworGRqSAt/hnY1a7/pCkOY6K96ioukEOpbnj8OrRl0qIMyhWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=XHAeSdlM;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FB3606A31E
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 12:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4FB3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=XHAeSdlM
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A92C1108CC0;
	Thu, 26 Nov 2026 13:44:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795697075; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=gn8xExWn+s8bBabSkYazgCzac4ckX+g0DW2J0ueTK/E=;
	b=XHAeSdlM7qlEGC0Yj79oVW44I6CxjU84kG5R1C7g5mCIjK1M2pn4lT1J186tPoepcwPweh
	9ufPyFwXrSO29bCVy+uGCYBBxsIu+6UAKwMVQeRJPGWKRwjbcLcJqbywBYyIbeH2w/UoJJ
	uLfSmEr9rsxw/hIiVv+TXgIsrX5d/uJiGNz7WFZfdwyLGifxlu/5fE1Lb1cU3RZZq/p0TO
	AKB9cTvivoj82IqnKOGx0MO3YSwXThz0bLBN98JE2SjF7+PR0g0kC1OpX6wgOSjFxOHNQi
	gkBze/oykeAt6K+GBrwZjmODvvdFq4alPx/RLE6a5A6683zdieJML32q6kU+cg==
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
	linux-hwmon@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
Date: Thu, 26 Nov 2026 13:44:00 +0100
Message-ID: <20261126124402.3015577-1-lukma@nabladev.com>
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

Changes for v4, v5:
- None
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

