Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D62E86352
	for <imx@lists.linux.dev>; Sun, 23 Nov 2025 00:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763858175; cv=none; b=AHEcom0uMGTooNPjh62YkTgGmOaiE+DCAGUUykdDH7OP4WX1sWdoA59E1WibV3qBVXettpUNoA42xJcc2Ml6evZPzHv3VxPSYF5y9fbGPY1xoNFRLTHn8+FEBoxl+Rav4vkdDPToB+mbZ/47tnsywL9POu+nZH2GAWoO7TeH+TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763858175; c=relaxed/simple;
	bh=+LbtG4wlTcCjP7l1QwV5muNNO5Z8XeSappL8ypkY+bY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FFkA0FCT3H4eivczu2PfloM3a9w3vpUP8y9jpUyHVcvmNIsHNrEZi9TLW5bDDFbkdVyqCIMTmll00kIPzTXF/GBBvlrVSfz0jrp+aijoM152KuA9/VEi1WxYDUdY65zpByvB1jwBYW39kvlIzmI3cD0aOIssnoFLfrA6trBjqFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEP3TGMN; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEP3TGMN"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b1e54aefc5so266607485a.1
        for <imx@lists.linux.dev>; Sat, 22 Nov 2025 16:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763858172; x=1764462972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5InH4LAtl8CDeHrHASMmG5Sayd0VJhxUyZTTym7Ptqs=;
        b=IEP3TGMNDM4AepXv79NqnyAswICg2qcKJKrlvhlds3NkdDhKMkna9xliT6o7BTEPZO
         XyE9brfyTbVM0g7FeSXEnjShmpDJN6HvMiJeZx1yg5mLS8RqeuUYrHiwje/zvXUKbG87
         QTA/DbSTHYa0qBfg6/9sWD8VTblczwYkycuuVV6kbNcwG9LXXkKX/I7wGnH2nlb+THnx
         3RcOkHQisP2WLAgm5hC9Y8VJYGXiV60Nc6oP2CLLQjsd8NL8cUNIA1AvfDr7Wh3Qbw8+
         vkVI2vWLlFb8aaadsvoJmzhlRGCwUrCPOBLTqsAGw93JL3Snz6VPbZ0iU55z511cdxJ8
         NoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763858172; x=1764462972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5InH4LAtl8CDeHrHASMmG5Sayd0VJhxUyZTTym7Ptqs=;
        b=RsI6q/hjwrvWDc3tpOAaPXMn+Q1I4UyZSJr8B0Pms53qbYSCK0ijFTRTXE/OwuE/xT
         8s3R065gbO5bj+rKnHMwA37oUkHUN72ZJjA6WeTSeVtiPVulhgM3L3rGC0OIzegrXslA
         JqcXdAuTmRevcYb+hfKEFcmQcdLFaoYnoK7CZwS2V+Dc2TWFATs7ZCy3HgatWI+Zaoel
         X/TwXmJw51wt45IlEc25dBVJAZOUsbb/EQoh3FoJc3aDGflHWvVWbAI5KgIqJ/J7yI2s
         kcndumu2akVCKFc2Qvh7g54klDqG+PtBwGy7g9SI9H9TkhizT9jqjSp/MA3KHQWFp0Xj
         Vnkg==
X-Forwarded-Encrypted: i=1; AJvYcCW8QX3QGl2z47A4i3OYXc1DBsZRsJiX+C+FjCZOzG2eWhMiO517/exfC/WEPTkit3EAS7E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTQHPxfhOO9xkDWmZ6mSPq5zVVzsFC0YvEuFMldDilsIRpi+rx
	QI1za2NVqeOXLu/E5InqKaRLpUfFGqyXiLCXLoC9HECW+zAZV+2AUGxd
X-Gm-Gg: ASbGncuTL5s+c1bqV10GcZ4cxDKNTJCdWD9UvNZBeou2CxRDoIsWcLf3Ona506Bg67s
	qZpFZE1iBMIPaXtH34qVWz+5CijzBmLrkt2mGierLP/394Gz9m3D8/dUAkgmKSfKxFTk9v19EHZ
	Bmy1404YkLPIsWbuKZKwf5iyAXgycbtJq/Rq2Cry5KrTbWxb1HXQL0tQ6WNDtP9Aj7NLY8xYeMj
	fFV/J2d+32XtcCxdQgammLEoR+cBSauYdg7kc+WoqGQeBdAQLyhyGjtCU2xim3g7N+8WALykHb5
	A2nnYV7MD7OR2OyEus5Szx/js6Kd79pjtnWNNFgOoBlt3L0gtJ8Otd3hybnyfAr8bVyhYrQIDin
	jQZV0Kh9bUbCDcHM0j8jxFGHeTIZEeAfJ/WpXZW7ds56ehmT2IoWMfHe9FrX3OxOwI4zrJ5WFhE
	4vd8d8iX7fTmqCutvjkbf60tabqkvOGSo=
X-Google-Smtp-Source: AGHT+IELZ8fwCDzMQSnKQNoR9E8KUcPXJ16Bu9cxH/L+PxSpCHeZevHF26bxZFfiNniZZE6RK9ZCPQ==
X-Received: by 2002:a05:620a:4611:b0:8b2:dafb:9089 with SMTP id af79cd13be357-8b33d469027mr939724285a.67.1763858172372;
        Sat, 22 Nov 2025 16:36:12 -0800 (PST)
Received: from localhost.localdomain ([142.188.15.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3294336besm657943885a.19.2025.11.22.16.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 16:36:11 -0800 (PST)
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	krzk@kernel.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	marex@denx.de,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rogerio Pimentel <rpimentel.silva@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Date: Sat, 22 Nov 2025 19:36:02 -0500
Message-Id: <20251123003603.246399-1-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree compatible string for the i.MX8MP FRDM board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
---

Changes in v5:

 - Include Acked-by tag from Conor Dooley

No changes in v4

No changes in v3

No changes in v2

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..960c0ce8d128 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1099,6 +1099,7 @@ properties:
               - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
               - fsl,imx8mp-evk-revb4      # i.MX8MP EVK Rev B4 Board
+              - fsl,imx8mp-frdm           # i.MX8MP Freedom Board
               - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw73xx-2x # i.MX8MP Gateworks Board
-- 
2.25.1

