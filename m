Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17CE4D8D96
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046868; cv=none; b=XVZOk2Kd7aCi9V/zYOJgZCBKA2/m5ZacJ+5RN/6blbFK1koahBrb9QSdFQTRhgBB09fZLrQ+hkZGRFAUN/JceaqX+ed5PvlKfUcbxA/w4dRkxLYXaencsx4QU6qfYNMaBq1hPaYUGUE1f+X5ZOGUPQTLgb5u2sLR9hgsAlVB9rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046868; c=relaxed/simple;
	bh=gnugYXD7/B+uvXdCh+3gHchQXe4XuDxcfGutPlljHMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRcYUWAYxAIs6xveyaymQnI5WitRaUSOZ+rvX+x9Jneo2yMdVI4Irdhe7w+RkeOIruonzZk4WycX1qbclFpC12jdMIVeDvNcVfCr8enl/ZDXyzGArYjV+lKZ02PTSC5GLcWjpTqvznakOGtU00nlUWwCyUMo00bkxE9ma4cyDr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2FurHvw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2FurHvw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so7977185e9.3
        for <imx@lists.linux.dev>; Tue, 14 Jul 2026 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784046865; x=1784651665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hSQVE/cIukvsNk0ljJyDr/74Kucww0/yScCm8r2HLQ=;
        b=O2FurHvwKeZWlOIXVOaym+vBQv88ma44mofl+CTvPV2nQKQrpHtN2quspPtblrm51m
         +ApTnH0erhedhn+Qpq0uVsIIM6PDjEGWearwkWMX/Frqg2xCDT+gLVGBLPsf5lUFtDPY
         UCLhT1hut01cKDrPCJHf9Ekj9U/APVghH6i7HQvCGcinOH6JF2DplpeDb4JU1skh4lrx
         14J5A9G6FCxRioTs9wTWJN32zUSmg+PDZtD49CIJuTnWyEZSFub2rt7/lfwbjla9FEng
         ivT0kPeDE79iYAjuLJh2bYB7Qy14bzhMa+tbp0P+qVYC2zsF4JGkk5IX+fPvuVueemVc
         e7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046865; x=1784651665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hSQVE/cIukvsNk0ljJyDr/74Kucww0/yScCm8r2HLQ=;
        b=ZHaWbwIebuZXpq5+0mGyLtQ/ZSumYjsF9Z2OcLm5kiYRq5k94pbn3sYh1fzNwv2fIM
         hBLBq+ctUUnvEuNnHoQoTZJT652AClNM//jW6iqDnS8UVmhoJ0qs0q0LL9iULTJfwmj8
         uCQFIAiWsQcdy+dEKDgeVU1d+GVfy5u8bjLdBlNlNBrxj4MiTypXgzC0bBRh2dpM+nJl
         nMSOqoCBFJwSE0ub0kFkiM6hBin/K1oZU18HI15RX5klXfoSLQ2DsI5ZAo8VW7hKm4Xa
         1A1Dd2Ij18gXHAFCPt4qHKSzwqaHdmDqd3lREEa1nMxjnyo1++uS6S9fSL0qY0yLQrvL
         aIUQ==
X-Forwarded-Encrypted: i=1; AHgh+RodT+ujtANS/ezMC8oVXSkUg8SG/ApeDREC5qeLt3lhMroR68QLZvEEhMsfkRHlremJOBg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOxVLbajKYKDloNTFWNK3EeANW+zE47qXpnbUMHPItgyN0Pfoo
	YDUUImfuk1gPq28Up1oWxF8EJuOPp7cxMk9e1f1oIToB4fm7X4Ku020H
X-Gm-Gg: AfdE7cnPbCSX88KnqEzO6s9E2eA45RuDuVxFFnQB3T18p96KXn+7x3+22uVoQUbmWYP
	tBK56SUPidAuEr56Qf9+0v0RT11LPaKS+W3nPXlbJm/PDGyjT/QJj/JxT/6G/oR/FGqoQ1vfL4C
	B/MnOWL5t77gSIAfwwOH94i1Y37KiNggJEuDG0JwjfESErQTnBKJUKmDPfk9ZyOd9MU6mw+0o6s
	JemyEvzzzRZjNoUWiNTMuiHCZ3sflJRrpijESYa2gXqiK4XswbCoaDAKw41EDQGui3QgHx/c4gp
	u0KFSz2XAYkh1i2SCyVICWCCA1Cn5y2nJR8ZsfD9vTGubWldJyel/4giH+RxwnkbZjW0dnZyYbx
	U9SJqZw9kKeoGJT+/ypFyU1mNyubMqzLOZQrWJAFrDDmpgGox0Vhf86olH+mEJNjiCKHxcnVv9O
	WjSOYCkZU3qgmem9SYRJ8df0omaP0GjkwZp5pheOhFqQz1kbwTcAtttsGprFp8mFnx2Y/CvRnFt
	d4kJUqeUX2J1i9CLhQhy1PBsg==
X-Received: by 2002:a05:600c:828c:b0:493:b8dd:9d68 with SMTP id 5b1f17b1804b1-493f87e6c8dmr141195505e9.10.1784046864939;
        Tue, 14 Jul 2026 09:34:24 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm11213909f8f.18.2026.07.14.09.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:34:24 -0700 (PDT)
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
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M-MINI Boards
Date: Tue, 14 Jul 2026 18:33:51 +0200
Message-ID: <3da78009acabb97ac871eb004319f08ebdcb7815.1784046629.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784046629.git.stefano.r@variscite.com>
References: <cover.1784046629.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MM SoM and Variscite
development carrier Board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6237fb2ae50e..648621348e55 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1064,6 +1064,12 @@ properties:
           - const: solidrun,imx8mm-sr-som
           - const: fsl,imx8mm
 
+      - description: Variscite DART-MX8MM based boards
+        items:
+          - const: variscite,var-dart-mx8mm-sonata # Variscite DART-MX8MM on Sonata Development Board
+          - const: variscite,var-dart-mx8mm # Variscite DART-MX8M-MINI SOM
+          - const: fsl,imx8mm
+
       - description: Variscite VAR-SOM-MX8MM based boards
         items:
           - const: variscite,var-som-mx8mm-symphony
-- 
2.47.3

