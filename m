Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501447;
	b=Q+X8wqkcW7k4g+MqevJrbaSv51JPw75pAbpyNtADBwbP6xnuJyUW8SpkBEQtrD2m7l8U
	 pjMUo42T2i4kj9oCJAFa5knnduV9RUxU15FcjysJ7OvuYQQRL9Sd1xSGhfhC8coCKud5j
	 +7dUKIgPDl5xR7M5auK0vbeQcg4S1tHvyYDroBx6wceqqcgjPSCkeVIqCesBY9kdcP+mQ
	 +SKZ0M6xWK8ht9zxFAVIoGcuHSLCJW+OjI+tydoV+RbjqaKsSMMDClc5ouMaEp04eub5r
	 0sCMMCaxfGjEyjyvHDl6UHET43PAI/00KL+surFMPVqskltbFrdwvqfMvSs9gLR9YoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501447;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=M5yd3L4xpmBeVM5XoGF353kDrspRqwKbIMSF1r2WHMU=;
	b=cARSY37SOMDr8f2YaSoQwYADpjryzOZbefVXKtz7JMdYkpbJO8RmsNDi2XujUvM7pyhp
	 0ciiFlwTrKoCnD3tk6VAYH5GVRoSad+F5ijWelPfuuxqdcZoPiASAzqq9zMyRvVWu5c+b
	 t2gPAEicrjKKAt5AT0CD6ebpsjAKF224PWzG8RtyVWtVZA1MW+XVepWrwkzHc/Zy01nVQ
	 Y67t1/xC3myqFnrLImPxRH4dYPJHsRr9iGVdsdVsTeIRhTjc7SBnf5TpSpQQcW4WTuvI7
	 JTDjRGyZzwY0N2AOVN52/6wkNBLA26PPbYVT7KxXVjNnSpHvotU39PtFQTc0V+nIXGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b="Rd9h/v7r";
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B949606A323
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 16:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B949606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Rd9h/v7r
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB77310A716;
	Thu, 12 Nov 2026 17:37:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794501439; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=M5yd3L4xpmBeVM5XoGF353kDrspRqwKbIMSF1r2WHMU=;
	b=Rd9h/v7rSnKUtWdeUZfHA28W7NZgYmXtAD8dkv86sa2dlucShA2T3wevFF/tWU3aRF9b1i
	7aLHK91cSgMZmB5Df6N85bsuSjqtBQD1yJzQpMnfLRIn2oKtDUDx06D+Ebg7cLyN5sxhwe
	Esle93iKfga3Sspw3WDLKWvafkPlRHwcuQixxASjAR/VLaFKKB62k9QvuQ76C0GsUXZVAR
	8UU8Su9FDvAmNrtv6c6StyvMgFnCBEGODy5F5XLn196ZqKTSlk9E0sDaBKLZRjJmCLj1bj
	y0Mo5OuJWHndMyxa1ABh5AdC9muvQMidnHbj2t9P5xYAzCurDttjo3cO+f4XpQ==
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
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: Add an entry for Cloos CBASE board
Date: Thu, 12 Nov 2026 17:37:01 +0100
Message-ID: <20261112163703.3358164-1-lukma@nabladev.com>
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
---
Changes for v2:
- Place cbase in the correct order
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

