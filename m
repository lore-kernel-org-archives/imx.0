Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32EC53ECE2
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790695089; cv=none; b=HH09cQFksHgzKgdjr2BZsEK0phrVyj4DJQ5MjGtRbS7r1kWXdzR6NKpgzIqE5Vd7j1U983gRmOqJVGvWVGDZlIZ5rZIWduCBTwc4TduooydfAV2HGutN8ggG8q5pd/FMzAveb1FbuI6p6KxruvS9e4jdyLzUCMBol8unqSdA4lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790695089; c=relaxed/simple;
	bh=5T+a23aIGmK2iqABM7bsnn+JBjwEBOQqZO+RU3YCAIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMvwDGH6bna5lpyyT1+gcFjpmazq29zId1GjalC8y/ZK0fEH1LNAqBe3CNgn/Vpc17yCYA4NUMDON5PfQRntRHXnui8GZB7GDqEK7hx5XYu7/SJPUkNrHKg+Rl3avNNkC351pxQ8URcscVX+WVt75J/KxAALf8vHzmnZ4YMda+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TI5GRXLc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TI5GRXLc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so34037585e9.3
        for <imx@lists.linux.dev>; Tue, 29 Sep 2026 08:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695073; x=1791299873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=TI5GRXLcf0A13QJYRhv1PeZy44lb7l8dUaDZ6D5r1eot5AD4D++fkNeo7EXrZJNSVW
         lX+KoWUIp6loiZXSlrYVbXSje6tNAuhyNRx8El32wjRPoNHJSWSDdCqbJgZg1E7vxbuh
         bH4NuMb8WS9IzXaBVLg3yEjR6cCerDF4ONMGziaH0qnvyrEcuPm0ng7uhpkQwrA4W+xu
         Cse/UPVUVOr+f53PNgDPz0pQAbB0P0jIPKHAwHQlJ1Ccfy9jbdx8xP4gbHzp8kKqhtoj
         FF63bwZxMK7GwzI7bUkOIIeFk6Jfgi1l50NEDCaHEJM96fEnIn5D1xFFAKr6FzH9X9cm
         hHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695073; x=1791299873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=YmcibRSUEJuxebD/rQi0V3gITGlGit95WKwAJii+MTGyVbqOjUxO0h1hk3M+djRJ39
         sySQVIqnXKbBJOwP2WgRWvJdDY5JHwAO4bZZ/0bLuM/1As9WGw818E/WEk6ZXKCK9Osj
         Yc++wdHhiuBjU8ektW9ok+QdDttU1sv0zbEdxqoodPWmLR1AVuSVWNLnsbP/1c3Hj0JY
         oApXF7MHE+iGCmXxj6R0kLMvFKuAdMCOULefA2sV+JDeC+4AkjPpDbLE+OUZRrtZINl9
         lXKVXGS76zcODmB4K30AxPI8uOfxp53KrPCY6cm/8BFboGacL0qbPLb83y+JdgO0Czoj
         Wzwg==
X-Forwarded-Encrypted: i=1; AKwUvBwuBdLilCE1Ns2NEM+EQnf+BCmw1HNfnQ6/VZ7rAPVd8kZ9edXDTGauaa6fRunfyyjGQtw=@lists.linux.dev
X-Gm-Message-State: AFuF++mUWOImM4Gt5hM6KR6f9oO/iCIMtNBzVlgC7IcXUZpszT0X3PzI
	gSX3rUFy5s/Pf+kSefbG9Q5eqqVyNZgBZKCTujKaZo4TuxcUDh/+GvLl
X-Gm-Gg: AYBFou1x91O15XtnP8gDMYzIXzCkKDcwcpiau7f4rFq6Xzw9zq6zaVi2Gs7OIdqUyL1
	ovcFs3urmS8lDgKnilJNBs+MXAD/pITvbYtp9vMMUh7vd1fdAK8Yk9X7HuSHREZSiOmvrD/jhjF
	agEAShsJY+C8lCZPAE1RFl8WHi+GeMNodXV/1ekhtVikc/ucJsx76mmRMSt8+IehdPXMI8rJJyb
	Subritn/Ptd0FKuabrMM0+LDvTIA4Bnm8wsgVtR2neNZK3Wqg1lcn6ydMIy19ziIfct4UGGCD3q
	/AIFt189BmT7UaUg5SI8VEZnyO+WCzkCzMaQ9AXjZR1Ur1wra8AFS+2NRl4aprmveFBGnsKiZn5
	KE2G6eWOC++q2dv0BO5IG5t4V5YdN5cZnYh57guSqLC14u7hbA9y2lLULlXYyZOTu+pkFTi12/L
	NJMPR8d2+/ucaFIF3yh3W38RcXV+WQD4CzNN5Llz84m48buCp54kTneDLD7UNr2ryPUkhwNLSZV
	5FuvQDA/4gqOu+NSmEyu+0frvS5FRU9c6NktNcctxl4iphhX+ZJ74m/weNLlPzVclv7BRdrdjT4
	LMfVTXiZrmMWTh++S7DybydVp3Ned2WA
X-Received: by 2002:a05:600c:c3c1:10b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-49feaa1d628mr198851025e9.19.1790695073277;
        Tue, 29 Sep 2026 08:17:53 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:52 -0700 (PDT)
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
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 05/13] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Tue, 29 Sep 2026 17:17:32 +0200
Message-ID: <9a0f70dc168278a484bb336835bf2e419a9d089d.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
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

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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
