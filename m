Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AF136EABE
	for <imx@lists.linux.dev>; Fri, 25 Sep 2026 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345012; cv=none; b=iRqrMq2SCzDgZfGxWQWE4LO0dNYlZ0UegJ5jk5VsL9//QJ/C1yQigOpZ/HT+X3w1Rh8/LukHqzG/l5IAV4qR/r90Tl3y0ki8u5zymrHTURTCBjS1ySK8i5F2nhhDsagYE6ya3I/gyQmXa9Y9Xch/Ku4j7EyWYWFglhaSnZQBs/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345012; c=relaxed/simple;
	bh=5T+a23aIGmK2iqABM7bsnn+JBjwEBOQqZO+RU3YCAIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pgwkhy+B3iO4IyMmZKrcfXMGOj3Z3Mp4GLZWCjYtqS/BYmuHIqNMlj3VeyOFxcip5dC+DIbNkEWmR/vtQuHVu+De3rJXXhkv+tVMiYAnQ+6/pD7NuM72lWOu91nqPXp3EldhWC1uUsbKjOmvDRCfbM1/z3HxtCYpdhjA4C5WQqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0qCekMo; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0qCekMo"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48877902c99so781111f8f.2
        for <imx@lists.linux.dev>; Fri, 25 Sep 2026 07:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790345007; x=1790949807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=U0qCekMoMyqJ+AxcjttBu8N5SMm0BSWbG0pFg+RpdnJz3pg+VqohkimpehbGhUEANt
         lX28cjIljy0hCBEV603ZLsG1bcThXMOMkmX0nWgOOZYLgtEdWU8B3xOExtGXrOlNQIzE
         F8ufuModdzAKm3+w5oeow5MDUPbk+02oLnX8maej9u71JGQ09KsLwmta6XZ6kjeUcIaj
         ROsxd9f4vS0NbrcxAyj1uEsNDzbchXzuTA6q0MBDnUFR2uKriCpLtlaeN/bCizfbRQOH
         r/aFdkhGXwWUh+O4ejBcBCWaUPAuemppLfuRDuOpeQ2DUJggeIFt/N9VBnl2tk1yjeo1
         IE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345007; x=1790949807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=hQYWZcnANg2sAf2J+X7AjB4mE14dXyw5o5njQ1KqcB/m2DeO8ZWwQpY5MU+7spDjpB
         VxMkEmnoLFw9qxSnvEVgpXBOQp2blyFcS7YRgqY1AfsHk6EG44SI3zqlOyWXnGKwPWCw
         bPBBwEHAlCN+kQojk3orSkMYcz7qdGIyZrAZpBj4692iwQLULKyyn9+TBDVBPE87xOMR
         RpYZ22CbWcFnH4tRJ5JhVt3LPO6gihVMxvOdTu1gvIexG2CLaJm0zXuLRhT+nainOeAz
         mbPvQsZYW+YbtMJQpS91tg3NyuC6TRvGLcRL3bB1l9bb8X87rGozF5WEEAwjfsz7facv
         dRxQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9rTC9fA70hoIU9XTs5Y8c7sldZwKSADcsdRtcA5OqAvc1FR1UR86vnoNDiva6noxz2hM=@lists.linux.dev
X-Gm-Message-State: AFuF++ml1en4W3NB3pEJZ4cSEvp71MQHGut6cRlws3Nf5fatzhURBUlc
	Q4kBiGMR8dx1ULSnwqS90Hgz4BL9SX1wAwLoi98iEM6OjpbPQMuQ/uys
X-Gm-Gg: AYBFou0Nr/fv5mTxwtyY6wEW6xtTltawJdEAavpJRKPUiylUNqLAD7Lb1cR10/Q3rir
	gw5lyNbkZIJUMelKLxaloD40KEpIaZ3aD5ylmbeh0wRCpeU8sY7oxUaiZOBXvv2s76xZ6g3Rbca
	JWPIaYiOK8GITFHEGO+yr5+EhkkBDTn5byCrgnx/sg7Pe0TgdH63bAQ2bc/V33xaq7oS82Ck3gJ
	ujYi+kRkUArR7VST00LIPjsgB/Wy/e+D1HxCsV5Jctq1ZhDnwxzRmWjsL3Dg43Ii6g7z16BOxuF
	o6glqGODxL6vOQr6sqMjDAgyOXUnLW8AfMPGxD9ryIKf3V9anRrdEZpYo2gSf0NCak/lsdVvvkD
	rhO1ebMY32vAfa/HUpvIn8yK4c2znh+5Ethc11I5PWZj7GLNOwqasPP8ixyA2MKEgKQxvPOgDNk
	xVlyftDSEUBbFLd2ksBoKRdldyUOd9d/DiPV3/NoEWAqDUB7dn23zMWAUYLnYG+FO3dhOK8G6Dz
	zBF5AKN+SDFd+1zmBFAC35DHOLtxb2E8HViLGrRfJ1YyjyhQ8aBjxunsIC1g26e103+x6G4+Oxr
	BolrI6kgzVJsc5rLJIGWNA==
X-Received: by 2002:a05:6000:2511:b0:487:27f9:840 with SMTP id ffacd0b85a97d-48871726b7cmr10342107f8f.53.1790345006448;
        Fri, 25 Sep 2026 07:03:26 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355c65sm7522431f8f.19.2026.09.25.07.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:03:25 -0700 (PDT)
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
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v1 02/11] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Fri, 25 Sep 2026 16:02:19 +0200
Message-ID: <6580cb8231c0ccada44d3e510374f6c21b65d283.1790344389.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790344389.git.stefano.r@variscite.com>
References: <cover.1790344389.git.stefano.r@variscite.com>
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

