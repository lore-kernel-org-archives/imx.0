Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F0F15C13F
	for <imx@lists.linux.dev>; Sat, 12 Oct 2024 15:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728745379; cv=none; b=X429wm+VGCV71oC1ChTo54dqhSh/HUUwQnoDNSQ/7zHcPsByqfl0fLe8BCXTfifZBrMCZqtvPdESxv0olFddS/Zp9XL5ysqhfKmi3UnhbzrH8f+xcIzGlSF32uNmHTh8vXPLZ4bRaasLmo/QBesDL9v3m70oVnZv1CLW4y48N00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728745379; c=relaxed/simple;
	bh=7/wKzul0scp9pQ5g512GmaXU8tMjoZV1C9VucuWy3qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XHNnkqEFeb8glEQw3A2rtB0opNrBox6399mszsOPg3uQxrnzKdwMfddD+iTOzFBDQgZuqOmQdGZJmbqsOf6BfJlzqrUGwMPc4qXOwG21V3W6CwZI1Dd2LmC1QJ2Z4cYoUbGPuQ9ZwJ6OPds4riudLGbC9yBsVe2MJ/KmV7hYPyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b6jjCSXn; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b6jjCSXn"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso460700066b.3
        for <imx@lists.linux.dev>; Sat, 12 Oct 2024 08:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728745374; x=1729350174; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/n15P79kGSTnE8MuMR1LpYchP7c+rsbkgGOXacYIjPE=;
        b=b6jjCSXnNxZunQfrKpjiENF6vFf/ClBLrG5xd2khholSbKtQHAh90QYdskqQxvRr7a
         09ABZJHCXC5HFKzUosDLPJoEUk+nxzUiGgs+jWEPI4Rl2FE2XR3QHjFslhWTh12tPqUv
         DmoRKAFLl/p1UKsKuNRyZe/I+3IfwTRcYM5ihipWaFDCzM32JAWocTLMjAIuTplqmHYm
         UpiKcmOAuirVImetP/4NjEypNW7Eoh46Df5hLFB4w+OafoRLMl/H0DpxlyVlc1gAqUSL
         8bB659ouQTsTymAXR9n6pSfT9zS85PL5V3Mlt6lO99el+NnLUOexZFGp8fx0YYpR+25X
         N26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728745374; x=1729350174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/n15P79kGSTnE8MuMR1LpYchP7c+rsbkgGOXacYIjPE=;
        b=bJBbJQIU8nqsKObfYTgoYblGQX1BEVTzKr5zGtCXV2/oJCd3cqbFgyNKTChD6Pszbq
         0e0aRfXYDH67x+verCysjkAwWBwRusOhLQVIuEOp6ZfK/se+/dyC71LPZZtghWfRefl9
         k8f2TaQFZxw1w3QngistVu9GqLOmal2oEcUie2Xfw2KPV/t9SZJ9CSuhX7SUx9lHV8Ty
         Y4Y83lccqSdbXIwUje22N8B5P104YkUzN4Lo4Dflma9b66Zhez8LVbbqmr3Q4pZ8zEER
         gwgO2VNxMY7F2/meZUJ9yNANSXJ70a+p2iTEbl4YgZ3VTJP3/F76LNEaOGKNyhst99Yv
         FoOA==
X-Forwarded-Encrypted: i=1; AJvYcCWs1+rOaYTSAXhjsac1AzUPI9GZEIHHU8bmVI7668Gx2sXFh1lE2iqLTMcvbU6ZEr+1ONI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhRgjHYaTFOQcp9dRIwiEYBnPQzWYGGzYdDA9Hh4ngFmrdZ/iT
	u/dOb8hkaGGFmLK7smWWddpFXKuYPaHwWWI5wZjuVR7RfelH8x5qRiV0UGh69LM=
X-Google-Smtp-Source: AGHT+IHziNZj9PpTrQmX1i7t/EH8XoqG/RaNoa4pDWvdo14/Czfa5WvohIYfJG1PE2K4Y5haJ2eqOA==
X-Received: by 2002:a17:907:d17:b0:a99:ee42:1f38 with SMTP id a640c23a62f3a-a99ee421fdamr208327366b.31.1728745374508;
        Sat, 12 Oct 2024 08:02:54 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99f148b224sm63730166b.50.2024.10.12.08.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 08:02:54 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 12 Oct 2024 16:02:50 +0100
Subject: [PATCH 1/2] media: dt-bindings: Remove assigned-clock-* from
 various schema
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-1-a2bb12a1796d@linaro.org>
References: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
In-Reply-To: <20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Todor Tomov <todor.too@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8

Remove extraneous assigned-clock* from media/i2c/* schemas, retain in the
relevant examples.

Link: https://lore.kernel.org/linux-media/j7kgz2lyxnler5qwd7yiazdq6fmsv77kyozdrxf33h54ydakjz@uqjhwhoyv6re
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml | 8 --------
 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml | 8 --------
 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml | 8 --------
 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml | 4 ----
 Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 ----
 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml | 4 ----
 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml | 4 ----
 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 4 ----
 8 files changed, 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
index 60f19e1152b33128cf3baa15b8c70a874ca6d52e..d18ead8f7fc43bfacc291aed85b5ca9166c46edb 100644
--- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
@@ -28,12 +28,6 @@ properties:
     items:
       - description: Reference to the mclk clock.
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   reset-gpios:
     description: Reference to the GPIO connected to the RESETB pin. Active low.
     maxItems: 1
@@ -82,8 +76,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - vddio-supply
   - vdda-supply
   - vddd-supply
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
index 1f497679168c8395a94b3867beb49b251ef621fc..622243cae03caa5d14aa312df40ef5907e190d2c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
@@ -20,12 +20,6 @@ properties:
     items:
       - description: XVCLK Clock
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   dvdd-supply:
     description: Digital Domain Power Supply
 
@@ -68,8 +62,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - dvdd-supply
   - dovdd-supply
   - port
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
index 8a70e23ba6abed67d8b61c33bd7a261089bddda2..382d7de7a89bcea11be384a2a3800512994f9346 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
@@ -20,12 +20,6 @@ properties:
     items:
       - description: EXTCLK Clock
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   dvdd-supply:
     description: Digital Domain Power Supply
 
@@ -68,8 +62,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - dvdd-supply
   - avdd-supply
   - dovdd-supply
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
index 79a7658f6d0547e4d6fb2267e5757eedf49fd416..38325cf318f7bd2cd60a4c7bbb6a65b54b855e26 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
@@ -27,10 +27,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27MHz
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index c978abc0cdb35cfe2b85069946cf1be435a58cb8..f0f9726a2add89492b8c56e17ed607841baa3a0d 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -24,10 +24,6 @@ properties:
       - sony,imx258
       - sony,imx258-pdaf
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description:
       Clock frequency from 6 to 27 MHz.
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
index bce57b22f7b63bd73f08d8831d9bb04858ef03e0..872b8288948b2bba743f2365a55165181df156ae 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
@@ -24,10 +24,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
index 77bf3a4ee89db3b5d16149470c0380ef8f1aeac1..38bd1c7304a59bb5fea90954c1e4e626a7c86f2f 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
@@ -24,10 +24,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index d9b7815650fdb890418fc96c828acc9147dfb6e8..ece1e17fe34553671e61c965eb1833c5eb08131b 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -26,10 +26,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency 6MHz, 12MHz, 18MHz, 24MHz or 27MHz
     maxItems: 1

-- 
2.46.2

