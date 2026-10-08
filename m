Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71604FD7A3
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 19:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488430; cv=none; b=AbvPTayO1wa1NLVKIp9KVpu10J86AoDSUGkqvscTAgFHEMYsgC8rAImKqfkjB+EAilNI8cgf57Vk8ghwTAwihnKybQjuDxbztkl1aIsggCKkv6z5RULlIdS6EEquFB+BnR91qANCmrxaxtqK31WrA+WdVb5tK/rmy6v6Yeeccrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488430; c=relaxed/simple;
	bh=louYATGthOtYvcZekgYD8gJCu1Mw18vnkIVWgcBPVp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbuQGUzZ1IceauZoSAsmc07OXWhLAPwCqU4bIlse80zEKbtKOcSqHNSNhMCoS7yWW++iUzKKVxTzGTv923CCc50kukp8AeUtziIV31VNtHvrQlV67jKoHTnyNvenaTK0ZlQHcNiMe8PDVTD/gdP4+AkihG8KyWXW41XkIpINnn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qyQudsPe; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qyQudsPe"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso29013435e9.1
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 12:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488424; x=1792093224; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3V/KESF44OWIlxoBBD4DKvOD0PQK3Y0aOYvdpaZuhdA=;
        b=qyQudsPe173noWZw86miB+52QDqyYw8Lou4mMRESkPPQbeZ3B1/9FC627Jfp0q+Z5p
         FM8Ps580ourewAGRTfQE9S5aoFkVs1qrYOqdPipjm5EPjPzM6w5Qdapc39pMMf2X/Otp
         L4JPG6b+m3/s2n9K+pVj6s8OpUoJ+ahPmnPyPkm2hMzcE+NVhUDCkrdlSDCMxPePsL17
         EFWLnr4QQkXA5r7hV3ylqp/+NhbqN5CHwt3kE5R7qnfUSMcn1ath7wDxNMFdPvmwmBeJ
         JcZiE9rGpsPpYFh9YAgLQyk3O1HuxA9iX6yKmRTvWMWvQfB6XWdnou4g1Vn/qYWej0wJ
         KmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488424; x=1792093224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3V/KESF44OWIlxoBBD4DKvOD0PQK3Y0aOYvdpaZuhdA=;
        b=fQYhMZudSmM2MUyPR3hzJE70nDWTvSBh13SR3IaaaD78s8/9guuCAn8dNr8yHKxUAI
         3WYnNWPuMlcbrBhG7OogNAB4AbNhLYWh8JRenO4A5uvkZjLzlyY0J9D3BrpBeC2O8HBb
         sqnSSvvfxE6zIiG2JAZAJ+iMuIn0by00qiW3BduEN2F37fgN2JbDxFJkeDjKLkAlUYNL
         fuV0Kb5qZqb1H7LJRkJ633C9Lxbw4nPkTYhoCd+C7HO4oHfDVUM05WpZzE+a4rQ2R4Lu
         a3tPNa5DNyem05jKQUdFsVmblbeArX89OocaDn4azW5PnHuRXFbQ85HXPcvk1bMbmOOk
         Kyzg==
X-Forwarded-Encrypted: i=1; AKwUvBzooYopb0UDBM9X8ArdBydcWt85LiKpv+IYewUvEFX8VpaTqVZ2PFTGypDW5Rrclk8OuH0=@lists.linux.dev
X-Gm-Message-State: AFuF++mHUIeQijrMrxaeZ+A7HzyvaBGR+XLbIFyA3zWEpNCNgqeAUitJ
	LUNxD0/FMtovsL2ZlsqLP6PS+pNeE9MNvS9CLaN7/Fbf/lVbSu4wi/9T
X-Gm-Gg: AYBFou3VGFt1oFdRyZG/NElnnYdC5nqM1xk0SpC61EkDNs9HtSQ9/vxEvEu6nY4Kso4
	hylg14Xwj3vWJZW8N2XNHDbys9ZkuEg5qfrUgvnnKKKZi0ln9jGqrwTyHkZ2Y0l7rae7JxuKrh1
	BiwuMfOjRpXCK1a/twQVPtUwn3FkFyAMe5LDesmUeq0QaPClKvFTiOGxFPwYfSmQANlNtMBmamf
	h9CPoLTdO0ceiRlBl6r+Ab4K1oXdj8dJ86yZta8POsZe49bA9nbP9EPNQQZdzSowJN2bOzHJkt9
	E78jd3/k+C6nVo+WMWOAImyzA6u5oxpi8HGc8ZAVFVQEUCXWJXzp5EByLa6cTmQ1K9zwyXAbd8o
	6z9BG8DgaZBWpkSUvKraNVwphfXNpH1xhdMEbrlfHjrrhdb9QXYhQRY0K9ehayEXcrjzSk3gRAG
	6MS0WTXdr5ZEKsQVdqijTCDNIwJLMApYfJbZNM8RcYkK7CVWP7LhMo9ZdmUhQPF0UbvuwyW2WJS
	2Fiwztp2+PBo0ETXGcc5ca+YkOchTpdW0ZAboreo6AtcsT0NUzsQW1kJY8v2meT+AHILO94/1hZ
	XfgX4Keh6ESwWgo8U0HssQ==
X-Received: by 2002:a05:600c:8b51:b0:4a1:7d56:663b with SMTP id 5b1f17b1804b1-4a18066ca69mr110758385e9.24.1791488423759;
        Thu, 08 Oct 2026 12:40:23 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:22 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 05/13] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Thu,  8 Oct 2026 21:37:45 +0200
Message-ID: <759d62ee229f0cbb83a51cacbb70ed7dacf4ea3b.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The binding describes micrel,rmii-reference-clock-select-25-mhz as a
boolean. dt-schema requires properties ending in -mhz to contain an
unsigned integer value. A bare property therefore produces a
property-units.yaml type warning.

Describe 25 MHz selection as <1> and keep the property restricted to
KSZ8021, KSZ8031, KSZ8081 and KSZ8091 PHYs, which have the RMII
reference clock select bit. The driver checks only for the property
presence, so this does not change runtime behavior.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Collect Rob Herring's Acked-by; no binding changes.

 .../devicetree/bindings/net/micrel.yaml       | 27 ++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/micrel.yaml b/Documentation/devicetree/bindings/net/micrel.yaml
index 6fa568057b92..a1f876dc00de 100644
--- a/Documentation/devicetree/bindings/net/micrel.yaml
+++ b/Documentation/devicetree/bindings/net/micrel.yaml
@@ -63,6 +63,14 @@ properties:
     minimum: 0
     maximum: 3
 
+  micrel,rmii-reference-clock-select-25-mhz:
+    enum: [ 1 ]
+    description: |
+      RMII Reference Clock Select bit selects 25 MHz mode.
+
+      Setting the RMII Reference Clock Select bit enables 25 MHz rather
+      than 50 MHz clock mode.
+
 allOf:
   - $ref: ethernet-phy.yaml#
   - if:
@@ -90,6 +98,18 @@ allOf:
     then:
       properties:
         micrel,led-mode: false
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - ethernet-phy-id0022.1555
+                - ethernet-phy-id0022.1556
+                - ethernet-phy-id0022.1560
+    then:
+      properties:
+        micrel,rmii-reference-clock-select-25-mhz: false
   - if:
       properties:
         compatible:
@@ -105,13 +125,6 @@ allOf:
           description:
             The RMII reference input clock. Used to determine the XI input
             clock.
-        micrel,rmii-reference-clock-select-25-mhz:
-          type: boolean
-          description: |
-            RMII Reference Clock Select bit selects 25 MHz mode
-
-            Setting the RMII Reference Clock Select bit enables 25 MHz rather
-            than 50 MHz clock mode.
 
 dependentRequired:
   micrel,rmii-reference-clock-select-25-mhz: [ clock-names ]
-- 
2.47.3

