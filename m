Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BC438AC88
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995886; cv=none; b=nQ3V1o4lRFLKWdBil37txlLrFjsAHS8s47XQsD3Pp8q04B92jEmizr+q1Sd0I02hhLUOWNi/KHaLheWjbWvtwvhCbLdtr9uYRGV/z5Xz8m4RObxpREcldMTuDg1US0OJCUCWwIrt9BLgsoHcd0jbmD5w0fspW6Qekf8DNRxKcDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995886; c=relaxed/simple;
	bh=zCQXimV53Ogl4RxIQLRoYFinY1tzwaZ3CpUI8WssViA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OPDYHgnIhE1ivJHCq1ys7s0EdbEiG1Xan/RyXh/+vW2LAmSaYn1YGQXQ+ckAm2zVnvKstWHesoMMenWUWI7yKhZvPx63oSoD6FdbeEyoO0e4Kyafjt/eXy9DCYGjGsxfaCAZ1VsD/Nm7sDsm8BCsWOPS6K3WOQ8tp2BY+yOmqqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOtOoCSk; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOtOoCSk"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45efa80e0afso4049736f8f.2
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 02:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995883; x=1781600683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cF7A4g2is+YIBTmHtbyYR50VO6KbJDHH8KlYg9QTGTo=;
        b=FOtOoCSk5xx16kx5VhQgYfYIqWc3mhL5tFaaWd7OU1rHSGyulw4O82bb+sEVAZQCyC
         8Rzgru68e5z2qLoYJ7NaT8D+89RHcfzFhYzlcswqSQ7GnrU5a39mGeNER3028ngCrJUg
         j9MBnyvoeGnL0qRfYFjombv64FcV3j0nBX5ZsuNVlUmgXVbgyH1AGzkQc3kzPufi6fT9
         V0b5kKtAqPbSEWWO5xJlywE8QG0g/dstnTMmtFEyASjhYDwu0jpz9s7x7TzJjgynG04y
         dAEhIm2x3tiwzTXamd/T0ie06+Oc5AqrW+EHI6GJlqn/15hl9xyDgGC4I/3w9sdtm/HX
         XTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995883; x=1781600683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cF7A4g2is+YIBTmHtbyYR50VO6KbJDHH8KlYg9QTGTo=;
        b=FhsLWJSytm/vwjaYxfOZlEn8rebIEre7H/dWanzy0eStmjXFAo1+GXGr0oVXpSMF3e
         1cSzdOV/YSAcfjrcxTq2HtVGp164ysdWRE0OSyOc/RtMYlU5f4yM4iFfg3MHoN//hSzp
         2ZGG9j8R04vXeeyQ1SmW3m5m4QMBJixR9lyUranfAuIHojq33IPx8JilsE7Lb76bChlE
         COfNjbhd81imLayhml883uGtK6X5kyo2CwhhWN2YP8gPvzvdGeXCCBEyNlgHrvGyOMtf
         USEyLUK82DktJvtGkJ1WRpW1yaESUEs2ZQ+NJ3k7teWH6bz2jYS8fBwnoXNnS9ncrgD0
         Wu9g==
X-Forwarded-Encrypted: i=1; AFNElJ+3k95SgeX0Zl/XPFYdR8nS2DBhGKEOllyey2dVkSbhL8zFLorQJm/YnkVG+08bSrOkk1w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5GIK+Qj+J9IcdiAWEF3s/IM0loMumhjvTeIyQiktIaSJv8foP
	a2BSj3dKeyUMRAEtFZUs27CQrgS2XEwOZnGiOafdY1lAMFX9XZTXoG4t
X-Gm-Gg: Acq92OH/3bGoODbPayxZdT+itTo/ZIyn2necjdHxV4yhoHUuI4gcwd70GGbPSySUCDs
	j6bPzJutcPVs6tbv/0eWfVQDXSc4Iz5fekISbcPVdvAWn6Ccd4vcmHoVOVPXpOw5vD9RQ7c2XVQ
	q4Uznw37N1eB4GSB0y6HPmD07iCY4qK0hKJz4WdnfSkY1G+xa1esBdp6ImRCGNjc1+Tdsg6ePWQ
	0rSzQeyFhLnXYyMWCSnGcMHVwFfT+zqDHNr86NKrhap923W8CblAcr5c5FbLt5RFDW0kcPwfjIk
	NpTMcFh14pGWEpQ0dgWH8knZFgUK+KefQJsF2UyF+bdxfzcS9TtsJLSks1wOv3ctN7fhsC6ycGD
	3JPY95S7YMP+dlEkp/CuDwTyuS/tPiALebY98kvgpm0BaYGHV91OLOCQk0FRbdvs9fkaThDuc0L
	wfAilSqKvXV0mEvWtmD/JA0Ca9g4Fk/IUYW35z7iZOszts+xixl5X7uOtLkJhjHRB7inDNTg4Vy
	JJOc9BQRUgPK/UTQEh465yNTgKv0wWVnJRXBEAXscrtgNKE
X-Received: by 2002:a05:6000:54f:b0:45e:b21e:f840 with SMTP id ffacd0b85a97d-460304ec0e8mr24408982f8f.8.1780995883449;
        Tue, 09 Jun 2026 02:04:43 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm64910543f8f.23.2026.06.09.02.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:04:43 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Tue,  9 Jun 2026 11:04:36 +0200
Message-ID: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780995737.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780995737.git.stefano.r@variscite.com>
References: <cover.1780995737.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
development carrier Board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..11629b9eafc5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1310,6 +1310,12 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description: Variscite DART-MX8M Plus based boards
+        items:
+          - const: variscite,var-dart-mx8mp-sonata # Variscite DART-MX8MP on Sonata Development Board
+          - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3

