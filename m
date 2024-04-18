Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601D8194C7B
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 20:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713472701; cv=none; b=Mtq+Pyi0jUn76YLniKC4pQgVEfoUWyqyRDiAUUUUa3t6T4mbGvRx6R/Yn5CDcuuMMbNCLNKtyFs9KMEKa1uFlb05aIAl19hs9xQdMDhr7uUrDljLrn8zRPV0JwE3dyxlpJsI9iFobwyU9GpEgLQphUeygsQUVzvPWeYMMpXM0tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713472701; c=relaxed/simple;
	bh=187YQzagItw83f6vADx4GNKdh6X9UWHJuAmasyW0jXg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tx9D8/kPaVk2E19fIlGcd/WDf9ZOoovw3aeQ4KN1Thok3HVOPLfPjIBAMsbnTG5z86EofeA96m6KlTG0spQtulVUaF3XsA2AQgxuv6tR4x32lxmRXWSVuzh/nGJ9h9cVyQyZd+tXQsbrmuRY+Fhf2c/ZeQ6G1EIbbAh4BPX+I2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aolj6X0Q; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aolj6X0Q"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-519ab23dd06so1137485e87.1
        for <imx@lists.linux.dev>; Thu, 18 Apr 2024 13:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713472699; x=1714077499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ef1j03PzQot24D7wGKXztI5BpkUJmrRiVGjdQcRoP/A=;
        b=aolj6X0Q5vnuwW0EI/nWEXhbiXpBcC7UzEe4pqCnfHWZ4kXIQequj9dFqlFYs5bfSj
         nkd2bzsJ6hR0pe542PaFr5kNyujCMx77G6pDGiQA1iebJ3tFiL9a/7ocGsYoV/t7kDzt
         XL5b1or3T5ID+yDUT+L2Ulr+xGxHMVYuJ3vFhtZRRm0Ou6JisnI22zNOgsHPaTAjILUe
         ajFjk81gXd3+ogvmvdMLots4ken2/hVOEEQZutCkRkk9EPoP4eoqsirPI1FyD0LKVgfj
         2eskLZiTNIo80BF2yqIgm5girTBs0F9EiyJf9xOoN4zzK3gcqwMV3In+cb7ERq6ollDv
         Oo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713472699; x=1714077499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ef1j03PzQot24D7wGKXztI5BpkUJmrRiVGjdQcRoP/A=;
        b=stxFoLOfsAeUZd1u3BViBY4RqYFwR4hg6cnODD0uQEKmPl+tv3HUtItrytZfYZGYVY
         OLQLbmyoDwPXL2fbj9Pk76wZkYFlXzrAMGfAptMNn486fxHM8EwCMX1EyfgWarOxwWNv
         hAa9Vs4qN7x62xxerGIaPCA/dMLOM8dS1qlAccNVLUvfe2zb2LpToezJcybDZjlV/zsb
         +tJ4oIEvnbGuDAYUkSjmMSOkPWoIqqv8D/uVjxLgGuZ10YoGenCVgrWhVgNMz/HuvNX3
         00uDb7OrN+SAGHKhvSWXdGiIvjgGcP3fwv3qYSopCsMCK52pdmCD144o8xNaFDKGNq+Q
         Z5pw==
X-Forwarded-Encrypted: i=1; AJvYcCXheit3n4AwNH8bu7YfBjWHNnNS8WuzVuEEPdyJXWBq1y9LlnQ2TPGZWYNiX8tzdh9ISjg5Uk79OZPAldPGfapge3bM
X-Gm-Message-State: AOJu0YzcpXsUQW2K+5gK4Eag/EmLvbKjV3VNNMCW7a1yZFHEnXnfffR0
	3omKLLdK7/AcEFnd1AwYNLd2UeW9Jxb8h1Sd2B1m+xPdCaGwozfC/kkBKldI
X-Google-Smtp-Source: AGHT+IFuUfTaQYJNQUWQD53YUOXbHss6h+ljXIMevbVCxM7rU+ASD0Lp3fuRW4KDMzSE3XGe604KaQ==
X-Received: by 2002:ac2:430b:0:b0:51a:a400:785e with SMTP id l11-20020ac2430b000000b0051aa400785emr68649lfh.43.1713472698372;
        Thu, 18 Apr 2024 13:38:18 -0700 (PDT)
Received: from lmc-playground.localdomain ([188.25.209.252])
        by smtp.gmail.com with ESMTPSA id l21-20020a170906079500b00a473774b027sm1305649ejc.207.2024.04.18.13.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 13:38:17 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Liu Ying <victor.liu@nxp.com>
Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: dsp: support imx8ulp dsp clocks
Date: Thu, 18 Apr 2024 23:37:18 +0300
Message-Id: <20240418203720.8492-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418203720.8492-1-laurentiumihalcea111@gmail.com>
References: <20240418203720.8492-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

i.MX8ULP DSP node needs a MU clock, but doesn't need
a debug clock. Change "clocks" and "clock-names" properties
to allow for this case.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 51 ++++++++++++++-----
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index 9af40da5688e..4a39d57b1cc6 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -30,22 +30,12 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: ipg clock
-      - description: ocram clock
-      - description: core clock
-      - description: debug interface clock
-      - description: message unit clock
     minItems: 3
+    maxItems: 5
 
   clock-names:
-    items:
-      - const: ipg
-      - const: ocram
-      - const: core
-      - const: debug
-      - const: mu
     minItems: 3
+    maxItems: 5
 
   power-domains:
     description:
@@ -93,6 +83,43 @@ required:
   - memory-region
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8ulp-hifi4
+    then:
+      properties:
+        clocks:
+          items:
+            - description: ipg clock
+            - description: ocram clock
+            - description: core clock
+            - description: message unit clock
+        clock-names:
+          items:
+            - const: ipg
+            - const: ocram
+            - const: core
+            - const: mu
+    else:
+      properties:
+        clocks:
+          items:
+            - description: ipg clock
+            - description: ocram clock
+            - description: core clock
+            - description: debug interface clock
+            - description: message unit clock
+          minItems: 3
+        clock-names:
+          items:
+            - const: ipg
+            - const: ocram
+            - const: core
+            - const: debug
+            - const: mu
+          minItems: 3
   - if:
       properties:
         compatible:
-- 
2.34.1

