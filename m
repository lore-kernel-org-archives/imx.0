Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DACB3B5827
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772535084; cv=none; b=eyXWMzDr8DGNXI1iHR5+DANoa1MtdGG80ceLEoTv4w6wba7X8N/STm+FwUXLZrS1SOI29aUJEPOaAymp8G9sJ+9+J77Nd+ObMJfAgPN5qa5KrQPV3IAEBH004cwDpPbENbL1f7v6uG8YQeMOhHJECSrxST3aC8gN4GdgmwFCbrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772535084; c=relaxed/simple;
	bh=kMO1mUplPoeX2sAJ+bgJIIhKz7q/jcfABBVHbd7B8rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fB4MIk2j2KBQ58qg1Sd+9qTe1l/FWZKevqyUXlxDVvJskZIeyDUMZDZ5/aBqzeyFvF0MxGGxgqQXPS9JxINpm8YQ8cQ6+EAoJBjxVxSwPhV2qGmvLhb3m5vgBFb4OwHPgnhcmg9MgUFbWiGWXXFO9DtUxorL5JgVopy2BslXRNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCg/Rdeq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCg/Rdeq"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so65439885e9.1
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 02:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772535074; x=1773139874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRBxFrn7AC9wXOJpDQL0/mC0loZfyU6jw3bAKE+4IaY=;
        b=RCg/RdeqJvRKrq/wLg6s6zAVnekbhoaPqHMXPnOsmkzzs/SwxMiiZGw6TKRWyZFrn6
         H4apZiDgi+/IM9Uc9uM3eu1UUN+auNQBIz/sgdeUAtkyVd6abJnVABF4e2aoovB5zlvi
         EImYe207DA0AHv1EdbT0I//0v0EtIAW6+6UJfTDv1vFX6bNN1m/dgyFopeSv+w2Ojb5k
         125/kFKYYm3UwBa552a0Ve2AVbmyYCi+rB13v3OVFOtZxLKsHGnb9D0eo1lvVqXbkXLd
         fAzZ65wYoI1tQ7wsFfivSpiGRHpli3/e+Vpkm3C0/QxTvu5TB12Kj27bjOvtANcKZbkq
         hXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772535074; x=1773139874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRBxFrn7AC9wXOJpDQL0/mC0loZfyU6jw3bAKE+4IaY=;
        b=cRxD7LHwrr22r2aAwe4FY5zufTauwSF1w0U7etXa3gPmfPJlkd4XFbHXKNNrkXXOif
         x/tJwMpZqWFmVIZ138FU2exeRZBe4xv/bYb7CuVprSDOWmimYR3B9ubhnqPhPzVtj8ts
         JgnipCq0gNyJDi7S6PJ4rn+lbVwJNaYs2qcWmVy6HwojXTMSy8qDn9u2ncNLBo3zPCp7
         dU4zHs1Ym8GC7RamU1u0JQJfWp8ef38FXK/rs1vlDCBR7V3XPNHTX5kxZYAJPSMoFPhT
         Exkkq20UoMpe3MPJmVwCVCMXHyNXnO8OiAPJ/uT+/uyG2pb3k3tfWZtKbYJcs6yVzBtu
         7Jtw==
X-Forwarded-Encrypted: i=1; AJvYcCX7U9K315Boct2MGXqgDLgUzi+hQZubVK255ALqSiP9BVPTe5qmfg1FdI0PYsyilKOvmtM=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq5OtoQL3VDhQLA86oBa1geUG3kWXTIHY9m+55it7Fpho/nv0q
	yyc2TxGDx2o4kZiIHkl8LcFnVN4xKlIiv7M9Rq71P9+JCNMW8tf4qpbC
X-Gm-Gg: ATEYQzyvEbMN6UmRoBVtXvrcDRvFViJ836Tkd44Ghbm07BvH+yOSS9uCk1dZmwr5WIE
	9eLFvtDkEzMEjINkMe0da1pDrT3uvZ6Y3nQ/3thSmRgcD/c5aUQGSeeJ5HbelgukhbUa+wkdUfq
	yGNiBRh4rPnJUKsFJk1gdkfaJYj+sh5u3m5z7YLKTNKqPXJIs9gwABMZDTrjuYSkGXdK1w3x7sf
	yXOMf+u7lN5sY6FBeh2WMsNL7DzyM6RxtU4Xsq901wedQGvJnMS0vnf4JBELqbk5qlA04rL97r1
	ByHui+Gx6gRiMQPu6LNJtCaL1Zj8MKgct3lzHj3D61BxXavMiSku3i2ibbljeZDTfP+Nl47t/A6
	YohVp5Dl1rqwE3YQP+J1H8JjcrGN4DhXT2byGcHQib9UWwqJJg1L0Jowpcm5ghBlopw42cUHgcO
	OeNKRr6EIpaRE9QrlWdWMr3rixCBTMfIZ0zIb4o7TXPnzy0rIDPo5tFKL2q1KLGXK/ZOn6YwIvN
	y6VK2zT9lGYcxw/g1JvhvoiOQA7UsqqUFq5q7A=
X-Received: by 2002:a05:600c:c490:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-483c9c204b0mr264369755e9.31.1772535073748;
        Tue, 03 Mar 2026 02:51:13 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b3474dsm318916045e9.1.2026.03.03.02.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 02:51:13 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
Date: Tue,  3 Mar 2026 11:50:37 +0100
Message-ID: <3b6984f4cf47f98fe6aa69705b771e7aaf787f79.1772534362.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772534362.git.stefano.r@variscite.com>
References: <cover.1772534362.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX91 SoM and Variscite
development carrier Board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Rebased the series to fix DTS apply issues.

v1->v2:
 - Ordering by hex and node name.

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..be2b88c3d9ee 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1545,6 +1545,12 @@ properties:
           - const: phytec,imx93-phycore-som # phyCORE-i.MX93 SoM
           - const: fsl,imx93
 
+      - description: Variscite DART-MX91 based boards
+        items:
+          - const: variscite,var-dart-mx91-sonata # Variscite DART-MX91 on Sonata Development Board
+          - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
+          - const: fsl,imx91
+
       - description: Variscite VAR-SOM-MX93 based boards
         items:
           - const: variscite,var-som-mx93-symphony
-- 
2.47.3

