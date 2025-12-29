Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF638329383
	for <imx@lists.linux.dev>; Mon, 29 Dec 2025 15:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767020698; cv=none; b=jwZ0aAHI5R3W54jIbX07IhTFlidyKwfVoEvUTGhkiM+FFpupWGSwqzpRstgZS1QSEpDgYleOKiO9OaftJfzgud4Jr+GCnWJTAvFY4+/scOBN99stFF9RfFMIYCSAKjigQoCRG1SItfEVN+aUl072CMqQegH1yWy8nujnr+kV+LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767020698; c=relaxed/simple;
	bh=9ZMhYWvGA48//ElPB1w7XwWDNmtPnQojjM7SQ+np5lQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uyEerlq/dLYpZq9McHpv7zWyJeBy+RxUkdDsFPcPUvnJhavW3E8GXM/RalUGlb3xSSjDfDREe3JrT7oltinqET+O3m9s5v358EAON9y3AkMJL9QUNoAsJ4W2CaDGBM9HjIFWT30MJSs1KtzEOFgdRHITZ4vbotHfu+21JOd/CUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ba7JjSUm; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ba7JjSUm"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fbc305914so6089618f8f.0
        for <imx@lists.linux.dev>; Mon, 29 Dec 2025 07:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767020695; x=1767625495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEMVDwEDv+HPhVXY2LXDlZKQau7yTOfmnEyR/lVD/RA=;
        b=ba7JjSUmwSrCQmBfT7wVObnysMOKHKwNSxV/rV1h2mQK37h34FJd4y3ILe5CuyLUmF
         WKByQshOn7sJwJIm5Ql5jYTOqoVHOYJ33Fmu9NwmQmy70dmm7ciP5UntZNrtpvJVaYB7
         6JueBsQYK2MzOUNvv7uQzDNdmNQZvVLkBTQOPuEkixD1+WnjomYD2xrYVEfLiH3uRTEF
         NDe6ff28Ghoregn95Aoc+9Ww1lZ7C/gT7E6Hkqd0D79hKP3uxTuM7KdWnAaFVwd5pbfZ
         gPjpyxKFYG55ZS23NjSuDktlss7qqz8l4qwM1ydJ5XTZoraBe+5Pd/6oZsdBw6Knuhmp
         sfxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767020695; x=1767625495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uEMVDwEDv+HPhVXY2LXDlZKQau7yTOfmnEyR/lVD/RA=;
        b=esCDB+f/O/FMYddiwWMoNlrx0no3zjnic7t+6HCdDkTGNeF3/6E93gFbU/MsvcBS4U
         qvlnYL3/M24Jzx3KUk9o67h8Axgo0rmVbvEnw2u62eK5KowrXbmrr3dPzWAP/HuHbGsa
         00ZQYwLkgdtHACDq0n+Kww93fc4+ziT67PKThxjNqBUN4VlDJ3ajaXMceyVrZwj+K/+x
         Kjm33jXGvcYMVrRw25NqbIsHX3I1W6xM7U4C1keZOfC0qkeiTGjozvi+gNC9vdgyaZ5R
         lrv1+uLS0b6R/n7NIcZTFx0QGFjS2YCvgyu691vgFheRifaqwzIuslfNsjMRindLKDLn
         torg==
X-Forwarded-Encrypted: i=1; AJvYcCVLDRUxnCSvgnJupTYZBz/H40J0BWRuveWm1IP0Wz8bJDCIkErb3PYCrtEUjcu6WqGRC5A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy74LbrmFp3Lva+kH3cryneFx9ypRpOVcpb8J2AY5IxZVpZL/vR
	l3LzWHgV7xhWYIRPfBV+cRrmM3uoLZkY0KTobW7J8E/Tp4+yAY882yxd
X-Gm-Gg: AY/fxX7TFsdNn5echtr7E0PA3AwaRJjvRrl5D0Pch7INpvoD/pn9OLl/KghK1nvEPTg
	dH5YvZUku7f0C+xLWsrT3cwlWwWh+NuoZkxpR5jb3+g0l6pfDVLDI6S0RPw82DQ+rKV492I4j4m
	gpMjzD4WxU1Swu5ttQ4luFm2ASlL3abU0cxpfAdV2RxR4ah8Pj+kA39/PRC97aX/kg9QC2GKx4f
	k/MOJY2Km25Q9hl9bhH3wTgFIKj1k9YU2OtEjWF40rLhhFoHT58bjJ7p/0uh/Wz7GDBbtAEmo0h
	8DHvIBULkvE1ygkW9+zpOINPGJBW8y7s5gOE7hFH24aGfxcZBMM3jrm4c3Zv1lV6RlDArgGFUg4
	/YQHk6QKihmLLicFsFJjrczd5h55pGqkJirn26XHSAc62wVGhtcf+7C0OK73iR2BxJGKsar33/r
	ZJ4i2opu3WvVRI2VFLoDMMBB8pjXV/vG0kJX+U+vv1WUENh5GbKV2SODpV39oSV1BfHfqJD6T2M
	q12aOJObT6VoGdln2h9
X-Google-Smtp-Source: AGHT+IHQvAPLxhpI/fIrtRdA0CEG8n5wHY5t2lV2gupren/JOtxs3WLlDRopxfjEnT3s0+fhv7N8JQ==
X-Received: by 2002:a05:6000:40ce:b0:42f:bab5:953b with SMTP id ffacd0b85a97d-4324e4cbf86mr29308961f8f.16.1767020694920;
        Mon, 29 Dec 2025 07:04:54 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-220.cust.vodafonedsl.it. [5.94.28.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4325d10cc48sm52899902f8f.16.2025.12.29.07.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 07:04:54 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Yannic Moog <y.moog@phytec.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
Date: Mon, 29 Dec 2025 16:04:09 +0100
Message-ID: <20251229150421.57616-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229150421.57616-1-stefano.r@variscite.com>
References: <20251229150421.57616-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX95 SoM and Variscite
development carrier Board.

Link: https://variscite.com/system-on-module-som/i-mx-9/dart-mx95/
Link: https://variscite.com/carrier-boards/sonata-board/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..2a957a593abe 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1449,6 +1449,12 @@ properties:
           - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
           - const: fsl,imx95
 
+      - description: Variscite DART-MX95 based Boards
+        items:
+          - const: variscite,var-dart-mx95-sonata # Variscite DART-MX95 SOM on Sonata Development Board
+          - const: variscite,var-dart-mx95 # Variscite DART-MX95 SOM
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:
-- 
2.47.3

