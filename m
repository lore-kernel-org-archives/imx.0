Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A21332ED27
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 13:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767704919; cv=none; b=OMK7wS6jmEYp+F6u1rq1Nrt3lAQ1SpebBJjo4SjIQMQZJwO/mYNnppc0mp/eTpymNKQOH49ShUaIb/4noFM9mpzFQI0qrloyYeCpfbjmCwJgQ5cbWKOSUcvKEsholwdWR148eezYOu10tmKPKAZ6z5yi30dt0mdS0+trjhIrzX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767704919; c=relaxed/simple;
	bh=SoAJEqM7XsGclJLWSso4KF1eMXke7Fjb3a4FIxBmVyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SkUQHKRHqP5fDBfY2Yf1cdnN7IPE7Tr9enWhnMeAeO20arHTqCt8P1Cgb/LCGUZuWdH54dEQtB0BIJggCFCa4KKOPfY9b7+uZraOof9dSPGMIKVHMA9QxQvavjjq+5as3+4yCkYfRO10+2Pb/ksd1h48ItKp81fQ65o+LlE2Mbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GA0sPGEb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GA0sPGEb"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso8934975e9.3
        for <imx@lists.linux.dev>; Tue, 06 Jan 2026 05:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767704916; x=1768309716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=GA0sPGEbM8xN4GbTYo4Y70JRyV/DiHoB5GZqZrrKYzkOl4WI41/W3/SHgXciWNXqAA
         ycCMWjHuC2+JNyS4aJRlnYsu4/h85Hc1G/JQtLvfcfuWfzDFgsMGbwRG5jyXqjwyLJGx
         zlakFLIrMc7fnf16Uzg9SlUs37KCJkvb0ZhMyXiCv1kOuMhsiUsA2gPzpl3/RSalvfTL
         m/GEJjF1JGcvlKyngiGg3sw1ZQT7A0gu8B95pW8xVN1AqLdETNGkU5O30f8UaR/rDjxD
         OcUQdBg5E1LGR/PgveJ3wYjUdB/IX99f1NEc/d/MLlNlfuHut6ypdLANoOpl2dj/5I1t
         uc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767704916; x=1768309716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=h5DCbgmopWb4XtdBVfT5Mqft+jeBNu5mds2AoDYZH/oArOwG6W2O9xPAmFzsJw88Dy
         43Rh8tmxh3w3cHddNTJ+YLJfkWWOPw34CCIyxJQb/d32EfqUQd2US0FdaZQVPOVk4ORT
         SlQLx7WyfQVTGfOSd7+HwsRGkL/fCn/6Km+JBpd81hzMzwwFzRYiIKcYWGiIGrgLgg/l
         jIIlYUpXTvLqJiKAnV5HJVdUMMORktDW50K1NNMqe1pesLhfqJncA9hpnRUy/dMeHHvk
         VE5/M6JqKtQhUqm+SOnafBKXHrUvriRmtPMZu47cDiILasFDIniU4m0+e7A8l+gLfbVU
         UIpw==
X-Forwarded-Encrypted: i=1; AJvYcCVN2BjKdE9cx/vrSWv8MOJIvu4sqpxHf8yvDaf2xJjM0X9yVI3HOcYBYqHaKyKKZkGS4uQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp5N7sqhCyaZnaII9bXE6so2U/3tiJp1Ti1KwLk6+t3RaXVRw5
	ykraqKTwgT1rRH7HM40hMV09CfIRM6cLjo9kVGPKTFPxvqrPItzgevkI
X-Gm-Gg: AY/fxX60qNTVoKLBhynfAztjePPqMsPm1LrFCH1SgCiNGS9AKoNTsFiqNHDfVeIsNMn
	kRW2mtj48Yz4rAXReCYzI5LzBEY1ah4vYnI6QvkKRMrbUimCsUrdVsgWpztVcXSg/UJiA4nRs81
	oAZEBol5HhaZblpJvCkgu4O4j9rdpJdPpeBat1My2wvLOpHieaqaXxiP7XAw2H7F+B3x/GSzNE8
	cVjLFdZS3dHIyTrs24KC0cIhsY4SrmgE/NvEnC/H8Sg1oNssTTE5a7NjeoTZjlLz1NM7eZsTJhh
	4/vXZLzvhrOsYSKixEQx9rtpmr+9V8uAWkjYNhcLKAokT2980NsNL9Z5FPdhHE3MjpFLBPnzPHG
	Qi/z9/czRovZNcDZsPxryVP5PInTVZJZIKHIzYeD/fWwcdpZsAEZiB3kpV/UXOSLhMNHe1vgV6M
	pUn57UoqObfDCOJjp5B5+yoskT8DOpGWjM8RU4GStIsjqXwoDMuBTaq08Ih3Cah2AiaSXfzPqm7
	LmCY0/XP80fdKq6iM1yCT+Mvg==
X-Google-Smtp-Source: AGHT+IF3dwzodQVxu/OJ1KFwSm2ssmdCm4Q/0W0IwVXzXdhGRs95TqIkNDIchCoIlCEBm89aLRYtuQ==
X-Received: by 2002:a05:600c:a10f:b0:479:1a0a:ebbe with SMTP id 5b1f17b1804b1-47d7f38038dmr21927105e9.14.1767704915405;
        Tue, 06 Jan 2026 05:08:35 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f70bc4fsm41601635e9.15.2026.01.06.05.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:08:35 -0800 (PST)
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
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
Date: Tue,  6 Jan 2026 14:07:30 +0100
Message-ID: <20260106130741.91532-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106130741.91532-1-stefano.r@variscite.com>
References: <20260106130741.91532-1-stefano.r@variscite.com>
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

