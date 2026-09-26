Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF89F42AFBE
	for <imx@lists.linux.dev>; Sat, 26 Sep 2026 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790420757; cv=none; b=oyjcpzL5191xWDusHSDgKUY5ZMpaLS2UXHYB8tfwV9Bkqrtj0vlnfmS1MvIbm1QO/6xM2qC5jYytN62JiGohK1U4Smeqy8ILHK7hpCY6HYzcQ8Sp3lkrt/7J+mtKlp6MSP8SfQapC2lGPmoiFzJspvhymh+CWIIQGaCVCPzikm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790420757; c=relaxed/simple;
	bh=GSQ3hDWXYSkg8hP0PKeLVBE+MKKwYtIsOLRtw6mZj1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mey70Jhqu1UVyi5FDT+AgprdVdBL5e3fcVxhIbhRuy1+t6Cal9YWCtU1JXrQmlqMUUWmxJPSH03mN5DCipFSgnixhtDeS1/BOEdgY2D9PD5xfYN96k59P57ks0xK8s2+lTR+H0LayUUWMRO7XETO9tIQtQMePm3FV2EzXny65NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhtGmRNu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhtGmRNu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d391aso11770105e9.2
        for <imx@lists.linux.dev>; Sat, 26 Sep 2026 04:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790420754; x=1791025554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OuCfL206+SFfyH6z1qMo483rq8R+i1flYwR2z4BngNg=;
        b=NhtGmRNu2/RJo4NVgwTEsC9hFG3qyOQTB/WEqtpKg+CxsYxcxn1THaZm2lXlSI5/Hn
         eZndzgTwWRVu4vXB+hHZBxCeOQv4LVatKmn9ani7AAkngJ2WNajYWNcTvIzMdVPeSHmW
         xm3fsleC4OeQ95PKsQeIQ/8k0Z/HojF1pS9AOSnFvPqwKj05eljMmeS0MtPEskZpn9dv
         9PqdXhTxzD811TozZNm3UKd/RqdF/fUYLuyGtN/HdvqygAlKx225GElEODJVgbX3Ssmk
         FHq80sJAifa1uB6lhP99mkur6SlJg/IHzAJB1hPmVCAMKXV0qboj4z+jcvND3NxGhm5u
         PNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790420754; x=1791025554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OuCfL206+SFfyH6z1qMo483rq8R+i1flYwR2z4BngNg=;
        b=bJ+ZKLwnOA4wyZB3P1KmF3owRDSw6C6cepA6j3UZqQ9/5G+vzeUCmLMGPhXuQKTBCM
         O6qvEoclPG5HYrl5vgx07tUqqoPzaf5kUaeBjt0rL0A2F7gs+LiVSQ7WTCxsbPgQNFE6
         qjug5761fnACuAA1iOJM+ctQhBu/1LTBAR54+uDS3F+vG2N0nYUf9bXtBXb0gOgyrJoj
         oK9/lzu40IPtYogZ5aA7CW+nj+kFApNe23h7lLQLSd/OZS9BbSEE3/GvTX9RizIS66lJ
         18yEOG416NLlha49Y97pjwiWHev9iNlnDGtRLdUMAEutd/lVPxKNoycpN2DQEEuxCy28
         WJGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqOY+45QxDQyUfKncNs0P69ufsAv6Wyp2jQQ0Jt9ZlCasmXHZNzDlw3v+T3zhggO3BlEo=@lists.linux.dev
X-Gm-Message-State: AFuF++nqJz+OPnGOuXTEWuYGdOuhDpvazA+bBeKx324i5P05LLoaZ0W/
	B2I0KrAamveI91bzWyJ9+npyKiMvZW6vGtsShDt0D/0m1l2RjOy1x17R
X-Gm-Gg: AYBFou2ZQxwKtlVCoaqxbGhgCwKvzIQ3FAV1NCUloqtyXcqQVZTaP03sT4kIen49UIV
	vdULbQfRUosCZhZc6h9ml5caviL2WSkegKdL5yNyVXYY2MLTiwoT9KygZyvY6dLTmfSBW1PyHQb
	GJLRgwhB5auae8gkLJbSE4tKRmXHk6zFhTTAgY6tvldj3ccRb33g6lG/t5Iyr2WosJLm0EPcoi5
	t67BXMP9Plo6sZzGkXqoQEJ2Covgwgb3PAfDqYXF1CrjOUNmvrqIOtOLHnB8E8IPz9mAO87IvGw
	KYjHin9yv9kSvanvrdNG8mle4MNS5drnlyTvLlm7E0sHVnMJ2zoxY/kcpTJs/QNE+xHqMtNPOkI
	1uGUmB3pvw6RQmVF80iNYbXnPTgOM/8YOagI4PQl2RXwbo68xWaVhTzZ+9htgFLIMZuEe/WpzRa
	COBXwmr1wKb+YycTNqtY4ZAzp9MKSQ/mfPXfyWXHpf3VzsniTCysblRne+yLGqKWYtSHwRdrj9F
	eb6LuOWAaTRLOZGYrG5q0Vg++JHAmC3ZvQrwRoDaOoLBhmOT+2f0lZYdqi/kWF7k5nOyBTuEzWO
	qAWlk3VOn+nEpDRNTaXYQA==
X-Received: by 2002:a05:600c:4754:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49fe66d1663mr148201725e9.12.1790420753924;
        Sat, 26 Sep 2026 04:05:53 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f795sm12124664f8f.31.2026.09.26.04.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:05:53 -0700 (PDT)
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
Subject: [PATCH v2 02/11] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Sat, 26 Sep 2026 13:05:30 +0200
Message-ID: <6580cb8231c0ccada44d3e510374f6c21b65d283.1790413032.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790413032.git.stefano.r@variscite.com>
References: <cover.1790413032.git.stefano.r@variscite.com>
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
v1->v2:
 - 

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

