Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253593EDE6E
	for <imx@lists.linux.dev>; Sun, 27 Sep 2026 12:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513201; cv=none; b=YEu2UFrnxdx30ChpdGSO6+ZR1vyXwnr3r9ECM7SiqlMu9LgVWvVAPXyI7+EivUP5XhxikFhs8QQlfdo4gS3NUN3LslHXl7SLlTpvqbn6a/TkB72KIzlhK74ZSSKOo096tD1yMHu7T6IVImyXVjS3jfqbvWeTX+cKMZHjoOtE6mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513201; c=relaxed/simple;
	bh=5T+a23aIGmK2iqABM7bsnn+JBjwEBOQqZO+RU3YCAIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYIbylbFJmvCbYOsQyXbsg5xWLxpG8u39aWBx3rpacEqNskOldcHzyeLPfWrVN0ysTWT1p2AF9F3sUTSrJNen+V079HwmK0BrG6NmwVyA/a/oX4voxwh8V5U8isYtGfR/L/8tey245rJHqq74+haUiXjEo7znmOcGtFWCza1oH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmrNP+65; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmrNP+65"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e83a388f8so16269725e9.1
        for <imx@lists.linux.dev>; Sun, 27 Sep 2026 05:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513197; x=1791117997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=cmrNP+65NyaisO9RQHYn3U9+sXsUg0OLDpCL/0DLpT+3BmTIgewlIGe58D5c13eab8
         x29Y2GpB0cpARvDJo8YrmnfqsOFBNzKHQMf9mO23YlXlcLf6/TZXKMK5BWH6lEpSBZew
         pExYMRyOvJH72XJzwssnUVwSbhamJ3/dlV++cvX3U6x4tsQHj1gZWRO3SfW/fz0l1a9L
         cFCXltmFXzm/c2JK/4paYGSMabaAHbHPoE2OANHYpv8PxpgYNrp6/W70PyN1JNF7RMDE
         IWC4JdzbXfpsQD4tid3qKKrUxoP9I/LEDjuOxoVe2ZqYAZbngEnI/2v/zluomO8OFp4y
         4Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513197; x=1791117997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=11jnztpMveI1ZN5/Eomse5KTXPkutiGhozbOIdfaS8UjYLOH8W04EAircYqMY2f4dm
         pU3ujHkCm/7YFTFvyEJawQSbFiTtyvg++Xbbk9+t/xeDYm2RVRqKJRn7QFu8v7T5StJf
         /vRM5pmsg3vbz4LmwLCmPsFZ684VGyniv3SNdMRxihVsyX6WxhDP6x/bo4Kwdvo4iplM
         YblLRY+ElbrTHPQWe1JlN+uJ3peEMeO6Pw4V3g96vJitf3kcm73lH5zhd1RvguXUCXHZ
         5+nDVFrCvEtBCIZ7G8eG32JALXf+CjF7L/6QOmFy03vDqWR+rDhxwwCw+8ebfMi0Bh8d
         TqtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzt906YgFCVeGImtcPNvmB8OLYvLPU2u6OfnZJ7oXzpNY5CHnoq+KPdrgZtvnROqmTzPyA=@lists.linux.dev
X-Gm-Message-State: AFuF++lNj4gpq12Q+rsY/gQjlAbTcc0ja1Y4RSNX35dguSJbdsF++gdf
	nfZMGAQntM2D4vuNxFBRwgJRXpH8OAHmqn60tpvc4JNM03mS7S1Gj0u4
X-Gm-Gg: AYBFou2GbS695Hx4Q9Fj8ic9Rx0jfKi6fXNGttf8QyZxhLxYKR8EKLh4xXb0zDdzVFm
	SPu3jwVHgFFM5IK1ZZetksbnxtn+7JFIL91UVsXRCxV9UDaiP8e/ShB1HCB88RaXdX7gWok7wkK
	HTFTRP1Ev7/R0dk6XZHS4UwcAFmMKTArUOsz4RRCYAz4tMeFTGX1SYAXWnlZ2tvtV27XGuusVXR
	2iY5u1uYei9+ibdsg6U8YDa9eKUuvGefaZBp9qb7sVWqW41qpE2ASz0yMbrDgbzZ8GXfWoo1hV6
	ErdRJaoWT1DIeGxrQxRa1g3ct+2VjUBUNyjcswqCgYHa6+CFYUbOcJ+9Sl4k7tJoO7n22lA+wAB
	a4voibqgou+qOb+61hbTcWDrxSJAvJSoX95KEq2UH889RSJ/w0tUaqBlmTq6JpobJ/WHbzhI4WI
	AdvBG+LrzJgd4k2fxajPfwQY2YWI9uLjRxyY/uuLeHGQS1bzuyNagdnmj0uIJR0y1TMPvMaaKFl
	iylwciVTcRQmmcP2Z1bzEhAXshG+rbloKKolI1mlLP6Buq5B7k7E+ZwFtsBqnoI00LFmSrE/hzE
	q2Ohc9G44/l+/nW/WuIgxg==
X-Received: by 2002:a05:600c:4ecc:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a001745829mr23006575e9.28.1790513197048;
        Sun, 27 Sep 2026 05:46:37 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm148440605e9.4.2026.09.27.05.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:46:36 -0700 (PDT)
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v3 03/12] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Sun, 27 Sep 2026 14:46:18 +0200
Message-ID: <2596c9e2fd59d04abb2eb4f4abb98767d2d2ebdb.1790512621.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
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
