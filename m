Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384793;
	b=ed2DQxSeHnItf3Lzd1Tkr9+2LqKFko+01VuRXSsy3rc0DIVWjOigh+kMq8GW/R7ZLtl3
	 y7N8QHlDWH82RDTGPeUwIzZbbGBkY5IjGEHeDtmZrAuqwXfNDCMvoL52drYcdY5L0NheI
	 8N9zjkf4E9UG9NruM/b+tLSeiYQMOTnIZnQc66qACwH1hYojCNCjk24fU1O0B4Ru1nME+
	 b2DRx6bXbu6fpCCiVNxfU40dvTg4DSL8Q/PChvfJM1hHhlFoIf2LG78ciyu1vmgkW02hn
	 VTJoi7ICkMNr0PGo7eL+7D5UKdE7ui/5oWkofFclBRjQnQTlVMTPxcRPn5FmtSOzFiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KPcuJ9giKkrlerWYcNE3whtnD+oxjr3nl+OlK6HR6lc=;
	b=rf2vnkUc5DP4zvzu20MG0fSi6Eq9El9J+8/atVEBx+S794uGUG7/9rXfMVvuZGS73MkD
	 d6CmXjEP74hH6Gyag7Ft33vPtcHLclhh0LcQfT9EcANKq4+OHHZDX4lcM9/2hNyaSSe1p
	 v4IIMASv2dPuF19Sr2hFq/XLzbWMBK1WtZnPkHiednXBOlu1OGlIoeOZS0Fi/+pzb6Z7R
	 8DCgFEMLZeXABHl6eC7bz4DduHxYtuslF6wYT/zpiLiN8xmu0jT2RrahPxQDZgagsktxh
	 HFt18cfnXf0Y/wmuA/rcVWhu9zewMCVCkexzzHLGgQQ4wk7X5YbgETnWObH/+295A7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AEZJdol7;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE3160A262B
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 08:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BE3160A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AEZJdol7
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so32822165e9.1
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 00:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384792; x=1794989592; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPcuJ9giKkrlerWYcNE3whtnD+oxjr3nl+OlK6HR6lc=;
        b=AEZJdol7piFnYmOU3v/xYnqeQLVXW2IrD0qdtz1pFJVMzkZAF06L5+Y5L5nxkNe3nM
         xjI8r+avaaqLqj12OpbpJIsh8DGvdX+c1omUMTqi1P7VuR0IGSsuxyPzsHLl6HnoQNM1
         apfNnMVNMvFfMwYo2+7CxXZAIT5ctiqupr8N+roF4MEwtqqRqQdfHd6KN3wkX8vOeQv0
         DpRasxhBO9czcNuU0IGoXLQUGesoiExGJUwcidj1+m8Vsb/AWN7JGzJt5OqaYSHUm5DU
         qiAYLp0+K4VCcGDxTdyH+3C/QJvVanWwkwGRjuP9FFFzr74D8jJbcxvDRgy32gC7mTJT
         e/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384792; x=1794989592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPcuJ9giKkrlerWYcNE3whtnD+oxjr3nl+OlK6HR6lc=;
        b=ZdcRlPkC6A/8O1YVn2aaQQMtt4zgVQZg7jjZ8XcynBu8z27aFbjyYMKHzmNpyrNlPf
         /bTcoCAZ4zeM7n9eLItVJmqEoyYu0FIFZNHPIqmWJub1m611PqMoZuSNI1S50YFiHXsf
         1LtAaavsKPj7b7Rhk4gmHFiZr2/+5BSRMrx6GZvXbl7LMNsfrfcUqreb9kPJ+NdoAmSy
         iyE3ghh92l5etkGdTAwExpqOI1HUf1NLL35ZC8Gv7D4W2QTDSjT6usYJZjpYK7+HQUve
         llcU7YDHHdSs50UTEpgDD1QTIY5g4BlH8+jZZhhlkNPvdLKJhuylhfZFFH4r+0b+hreo
         KGvQ==
X-Forwarded-Encrypted: i=1; AL+hErGi44NkZPOb9trZG890TN/FPsFsA8/AGfflyjTLJPonMrCQrQTwrAO1fFNT303HqLkYsk8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Ao7egNQaOQDBs5ZkcJbAgdhT1Kj6MiJzfLTB+rX2rHm9wzgEl
	EYECE1t79iEmHysfGQ56iZh+dt6yPjVUzpnZEQwI8/GdA2b94kjKhyphISpLmFM8uYw=
X-Gm-Gg: AYBFou39yD3msRRK8IXR1dZ3JRMrKsV8xuqdecYc6DePWIgCeHFCEZk50XZJJrJfAwY
	g5Fi/2NGBouDnd0E/xurKFI9ww7ZIlI0SEw1KJ4phfrPqAsdK2PSUwULhNN+K4rBRDcc5DszoUy
	MRiRQ0dpRnUU3LKVlvwjWMPghk/FbsEmaO748HHo2Abv25HorHk8l/Liwx9B/v73JGTDPWZMdlg
	mQeqY83IPx7Y9xQX4bC5x2mdYvK1DXyB3n+cI6VKGYdrn20pKfqbQzJ+0HhGJbkapszbqj9ZAxU
	nR8++j3NkgFau6jGd+dpk1Z0aSNjEEcgZo8tcHeFAQsjaxJIx29Y8uwP0C/Nw/XgpJjbyFNeQY7
	I5/+7bUU2KgJYJoy2z073RE/BvzsnPM0KCwjkf5X2bA2a+XuOeCsHtmX3e2utIDl89+ixACljnH
	BkynjiVJovY4LF49BHm177zm34gRmdyGi+zqRRvY1c7LEswT/bhK1v21UcVWUUbIxGevwS7QRnS
	jhvun090tXqKKqEhd9TYhItNDVwxsuCY1fWce5PqhTo+9v1jhhkcWfWqxgRG+4ECAmCPnruR7V5
	xIqKLDR5o0MQEtoAQ1/vKtndvDB7olsM4yVxEXbLI0FH3RhXLRGl1Rl0Gz45wzwVMCZYvXJu06v
	cMOmZmX1t7Q==
X-Received: by 2002:a05:600c:8b24:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4ba0938a10dmr25548105e9.19.1794384791851;
        Wed, 11 Nov 2026 00:13:11 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:11 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v2 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
Date: Wed, 11 Nov 2026 09:11:49 +0100
Message-ID: <20261111081150.950272-5-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
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

Document the vendor prefix for bytesatwork AG and add the compatible
strings for the byteENGINE i.MX93 System on Module (SoM) on the
byteDEVKIT carrier board.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 Documentation/devicetree/bindings/arm/fsl.yaml         | 7 +++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..e4be6fdb5808 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1555,6 +1555,13 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with bytesatwork byteENGINE and byteDEVKIT
+        items:
+          - enum:
+              - bytesatwork,bytedevkit-imx93
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
       - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ac2f54adde73..95f386db1d01 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -285,6 +285,8 @@ patternProperties:
     description: B&R Industrial Automation GmbH
   "^bytedance,.*":
     description: ByteDance Ltd.
+  "^bytesatwork,.*":
+    description: bytesatwork AG
   "^calamp,.*":
     description: CalAmp Corp.
   "^calao,.*":
-- 
2.47.3

