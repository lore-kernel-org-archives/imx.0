Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FED3DA7E4
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772039042; cv=none; b=oL2sZ/JWGWLHZ31QDSV1ebEETnEGJuf0HQZma9gSHfshjScbrqq8t0Ce6PsdrnWJDEytt7wigENYQ5WnKSxDYQrZZ+zmPl6SWFk5+eq1j0aPJWjYx5ubimekAC1jPxR8ppkCuSP0C4i9A3lf8HhiObvy+TkRNTDj48zNUTPEirw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772039042; c=relaxed/simple;
	bh=SoAJEqM7XsGclJLWSso4KF1eMXke7Fjb3a4FIxBmVyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MX/f1Ld6EvcV7QJqi7lDK/ivAekHixush0zpQfrHH8ZeiBGq+wuQgWdCm6jOTXuWh6piSx7Y3vBSLxGR4OkLh8SouvUrmnO0+SArmlhBaP+CEDi5kWW/nwL1hOXnR7tBoggCXVwu3qyOVYlS6/1RtR3uZMRIHnqCIdWDOe1wC+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxxbwWAr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxxbwWAr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so41574435e9.3
        for <imx@lists.linux.dev>; Wed, 25 Feb 2026 09:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772039039; x=1772643839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=BxxbwWArp3o7yEj0QG8P+Vc2waGBhbpHAa5kj/JSqYg+2yOiDLHcdsAeToP6gHyG2h
         2Yz+mVGvuzkPjY6WElHfII/POs49rEobCVNG3XXBgx5gjcPxtPD79kBsmP9iLdRiR68r
         qCTRezXGA1+y2y5/Ddmfx3oEK2Fv8lgX4326uOZ8Z1EGI/4eSjxnqT+6OBSiOssutDgf
         6fzSE/e1z74QqkZMN5atIG3qpQEeu+KHQYCOxvKTizYjqxOriP0zYCBaKenYvnI9RcY+
         JL1phfoSZusunD1WXfDlB2M8lbirX0RFah0muGC77bapsn271MGImS5YIzrG6TUJaqNV
         rhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039039; x=1772643839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=ARBExVbvFXWxYi2nfLNvPn3040wPIz7uQ5quljwel9spQP6ODnD7IV9qkrG7wHLgqg
         trmKZBSRTp2RgD+Y6Ftdhzb53xZUmf1xQ348thSm4SemEz27edmovfcl0QXDekZHCM8Q
         ctLt3RxfOynQhpi1tttRqB3fNsd3KkKbeqOU3pGrOdvR49ExmRh0EZVghgi7AGgmnUhT
         cT95ibBwC+asiJf6WuQZKdjt7cRJRpxMkI2S617pC2VwYAocii5REhBCw4nAGJ7RVh4V
         Z9hsfwUQpxuH7oNQ3DOS1uR9PeztfU1L8hTgzl/KqKQeBOHfa2b8zJUJwOLZQXt8513/
         QAuw==
X-Forwarded-Encrypted: i=1; AJvYcCVCk9qWIXAerrwlceGPcH23nwlxKo8u3gZ0YLMiTk1Ufo/rFnO7s+TYP1dtfdTODMUZOEk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6LETXbxIVF8K3AVl4qa0tlxm6d/9BET2r7QWK7F7CmwmzrlkH
	aS5kRtYUQwnDMQ2yyzbafAvVhZ4z+qmeVE5gES32Gt+rXKQKGxqV1b8T
X-Gm-Gg: ATEYQzyoCqZMXOI82hi2EaPkxwit77Vlw3GkgDb9ZS3iLwAlsvPDfJbWYyJNUVN0jRO
	2/bXe0+Fg6hOVynLSkOI5mCbL2d4+ZVhvXB20S8EyIiZSwHqq1Et8aCZo+TLmcJ49XXfDvraEkt
	3teBEZoUe83oJ2Jho3UTSYiTcKnBZtszMFsHiMd44VDJD4o6MNi2NCGVIGYcdsAZcV3oKXtDRh+
	I/N1oMEQeKRz90+XdZk10tbCQjhHB9vsvAR8iDtt87w1N88wKfCVSmMQE4bp4n2YGCkxpgL85B6
	k5VtaPQnr1+xk0WgGQDWElXfgCdTnNczNJ3EVBHWxwJC8S5UlArpirQgQz4RuJdXYRhPGy8W6Mn
	yNEuHkiwVPi8FlybNcCx4hdJW9cEDeIxbdExHZmrb5PMCdo/YLbd2Z/NLaUA2sZL3vGV4j0YUSW
	xCC3vey8oLp6onhOlVUAsKQcX3H25ubxOfta/V9CDHlk67O2+Q8OUPGrzvdINeqvqlxb+4zhX+w
	A0MtUIkJzSK+37AJdKmxPlV3w82mkpX/J0RQS4=
X-Received: by 2002:a05:600c:6094:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-483a95eab61mr271791555e9.24.1772039038835;
        Wed, 25 Feb 2026 09:03:58 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70b3f3sm88276935e9.6.2026.02.25.09.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:03:58 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 1/3] dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
Date: Wed, 25 Feb 2026 18:03:36 +0100
Message-ID: <20260225170347.77841-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225170347.77841-1-stefano.r@variscite.com>
References: <20260225170347.77841-1-stefano.r@variscite.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

