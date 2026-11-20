Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167762;
	b=BIXp6m2uDvVqkX4qKl/qN5WelMcyC/geoUxGEO8a83nHjBpAuPh9rNX687pOC1CGUpzf
	 EYticH6dOKb7NOfJqa8VHy9IduqdbxwZD38bgFoSZGfncJKQsit6qqyZUjdhK8U9dDclA
	 m5+pLOE9YS+ZOqZW07Zsdv2pPd2GSkrLjLZsCrW32A9FYsrucs1db9F5YcEzPhxbwGvWv
	 CJ958WX3bC/dTyVPtoNqvisQNvrxt1ParfByUtemfTqb5cZ1UUT2bPpqh0vk+3KFqp3yy
	 NOKPiqZzpptRNpe/xLmY1HsgUBR+GFdluDe6/n4rJJ5rHnH7MP4+P8PKLtFb/v+ziNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167762;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=T2FuN5OiCxA4hG6OB6nRzse4ZJ0m2aVwtWaqqCKPDQ0=;
	b=WeLOav+NI23Htzi8o0QT4A8j6+Ntwhgaa79x1DtIzyqo+aCuUowYpLjc19nj38gPOIN9
	 U+3rLQivzlwo1Gtt8JSylHmJ5HnvQ6mkxuJvc8HEo6paso+Boe+UlAFqjNQB7+FPm6nDq
	 /lK18kdAUtyHVMxyABLTF1wa7s0dg1ejt+sXFYVNFb69FYATSIAlXBWb9Xd2aQR8HdV1c
	 v4qRGrDUAggkI1eGZXmN9jZ/vMrUhg6wo/eNul3Bq5JPgDE4eBqGSrZq6pVyLdIP8vhTQ
	 lAOGh51Mz5ySM7UzMNClLjmgrR8BmNQhfhcrgig8sEFzXSi+HJvdUnMeGRbgDo52P7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=apl6EJVO;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAD6606A32A
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 09:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FAD6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=apl6EJVO
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9BCE10BBEA;
	Fri, 20 Nov 2026 10:42:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795167754; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=T2FuN5OiCxA4hG6OB6nRzse4ZJ0m2aVwtWaqqCKPDQ0=;
	b=apl6EJVOflbfbhm2phWLnsDQmBXCnffH2gxv/fBL3tZsuwCtDV41AizZqWqgVqjKqACl/v
	kU3AI5aztTTd+F2XuL6LMt46Zv6cIGj5P5aQ4W7JdEvbBvJTqLZTGU3GRFbl+BXiSMUW4C
	2I0wuycTG4HySForzAqimVjvHIxtOSkZqFukEemH69Y5y3xV8zR7erfJNconmCsoDc1837
	Qugeanmn7C5XPhFyMm1vnGIvtXYHMRHCuzl+re4y7czTt8Xh+o7s2/3bSeoXAqtWmYvDMw
	mVCV53dNTyKI27Lg0WqaLKeLie3FHPWOyp+0ZOzRxxm8zQ/UrzcGekoS0Mhujg==
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
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
Date: Fri, 20 Nov 2026 10:42:09 +0100
Message-ID: <20261120094211.1742416-1-lukma@nabladev.com>
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

Changes for v4:
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

