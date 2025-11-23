Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9317921CC49
	for <imx@lists.linux.dev>; Sun, 23 Nov 2025 18:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763921694; cv=none; b=Q2bu9Wtqo0NZ5Am3t6SdNK1S/K0+h5lKnPTeQCeC/v6pga4wAainWA1WkUTU0xkPmTBCL2Maedn+mPPefaLJts4srxm2amc462h7YSzn8pIn+rg1Svl1PFweLRxeyJCzTngR6kSnO0aKRYY4AlB4zQMzY7oqxWviN6D0yFkaBBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763921694; c=relaxed/simple;
	bh=0PULvETt9z816gDcDVvusNHQVkAxlavjk0u7No+qGbo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L18cTu/MUhj6BJaulbmRsZVN9BM6huLBQrdL/uIXOzQyFYxSgoL69J5oBWTYwzDTGSd+qi+eAbWwaXE3xUdhx6UntzhlS6oNGmM6naRLVy21JKzuvYCgIitz5QNI4wreY2nlXrdsBVaWtIdDzAvCVXIk+pFBTjI1+KsNFqbnL2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAl0JKEw; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAl0JKEw"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b31a665ba5so333889885a.2
        for <imx@lists.linux.dev>; Sun, 23 Nov 2025 10:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763921691; x=1764526491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dCX6WT7m7rVOFFnbXXZfQ29NTD0s+0MEDDI8eQG4yUM=;
        b=GAl0JKEw4w+pBNcyFfUIGHbuu1loYA+WKXJTEHpT9OWa14yNRFIE68kKLwOc0u8Ymm
         fHuIhf8x1fawPW02xtCRRFl6OIjrfFQBrNZoQSY7WaxpOX+ZGM4jGBRCO1hSchCysdQk
         WfZM7jNIfx8+T09SegAGkPtxLrddUcra97Nub5PeOTaKGcyWz2ePxBd4NVi1LCWXzheO
         tzvvCBCA7XIM58O1qydSGf9h1+L2hknTrZahADjpT+ip48V+zekBoQuzQLSFlvU5fdFf
         aTlFTopZk97pzvULD1rtUs2DIHlQHtgwXtNqc7EcgfA8t8qVi/Aj5jibNRAgW6EitUi6
         41kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763921691; x=1764526491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCX6WT7m7rVOFFnbXXZfQ29NTD0s+0MEDDI8eQG4yUM=;
        b=DYzmPd9RhFnlAga9PAdE3HUaKYs1ruWrcGujaeth0XwBFFaeDH8QH+7hk2xZHiSKqs
         /0st5k/uAcY2W/uatl9n/oVsMwNtOnJx2gaszUN3V5OiJ9Z4Gu7VGy5Vhs4uXv0w/dvM
         25a6r2SyYiXDFcIPX6HpM+mPiO5mZgA0CQVfduiBHze/ZGVuT+ZjqVnWh/BAWTkb6tjr
         oTs84CyoVNARDmxUEam8ZTY+tH7blyZ+ZRLrf+PMIG6dN5aTeXwR0o/PlI+ETfOZj6Pn
         SBixmwlD9V47IPG7N1UXCYRmlOpBOGu8cNa+JgIbT68NwXfI3nNpLzEk+0EB0PlxBugp
         OX3w==
X-Forwarded-Encrypted: i=1; AJvYcCVc8BwPaIPvkODKqSDRm8+OE9+ftUylm537m46Z0Mp5dhBPpM/Wqt5Dwhx71DemtWhggqE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxO9LfTWzX3PG+K7lLPjrknIhcy/WLkwE0rg753kvbw0WmGQZWI
	RdgxmuFlNZ9nox/5MF6ITy+NWP7t8+cb0dwOHA9pb1DVzCPbJcpx9sX4
X-Gm-Gg: ASbGncsrVzUb0TWXIOa5U0zQfYRS6ywdjubJgCzdTHGy770zuf8luYAbOfJyKMLTaIt
	pJ1HrdjBwKWubFIj0hkdzJoH3hFy+T/wSpzpZM9ogZ/oLlggVEk9zs1ujImJlOsrIlAl5O7R6Ob
	OZf8ybWVGlRdGBwOiNsHk+NdRBsF3lh8VIsSgll5fxwoqae9Rgm755C8xvmCLHFcNJyM4gKQdNj
	UmwoAjo+SZySSa+C5qIZSyN1jBbRlOnM5qEjpWiSNeREy45YY2LxrcHWT13sgUbif3G2u2RhHHU
	d0tZXn9MiwqVf2BZVXWMcVTIrjaZyGdCWLF9I20GKaZHP2XOKbMxqP70YZfMlRwgIFvhDwC1Z/C
	hLEuLesJRN7WOAECDWsKRUxY3Ci/GdxqYp2MgDIA5SoPMv/PGrpTdhuy3aC17v2eU3sw9BewGss
	KGWMJoEGBkIGpLMcmhGXC0rqCrjCtK
X-Google-Smtp-Source: AGHT+IFCca9D0Nqlxq/e//g/tvSDD1qUyYElNo9V329H3YLMPI6JAiHun0zZOL76EY5TDf4OeItFbQ==
X-Received: by 2002:a05:620a:1a03:b0:8b0:f2bd:4764 with SMTP id af79cd13be357-8b33d4d84aemr1213451985a.63.1763921691498;
        Sun, 23 Nov 2025 10:14:51 -0800 (PST)
Received: from rogerio-laptop.home ([142.188.15.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3295f17dcsm782010085a.55.2025.11.23.10.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 10:14:50 -0800 (PST)
From: Rogerio Pimentel <rpimentel.silva@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	krzk@kernel.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	marex@denx.de,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rogerio Pimentel <rpimentel.silva@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/2] dt-bindings: arm: fsl: Add i.MX8MP FRDM board
Date: Sun, 23 Nov 2025 13:14:43 -0500
Message-Id: <20251123181444.266030-1-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree compatible string for the i.MX8MP FRDM board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
---
No changes in v6

Changes in v5:

 - Include Acked-by tag from Conor Dooley

No changes in v4

No changes in v3

No changes in v2

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..960c0ce8d128 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1099,6 +1099,7 @@ properties:
               - emcraft,imx8mp-navqp      # i.MX8MP Emcraft Systems NavQ+ Kit
               - fsl,imx8mp-evk            # i.MX8MP EVK Board
               - fsl,imx8mp-evk-revb4      # i.MX8MP EVK Rev B4 Board
+              - fsl,imx8mp-frdm           # i.MX8MP Freedom Board
               - gateworks,imx8mp-gw71xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw72xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw73xx-2x # i.MX8MP Gateworks Board
-- 
2.25.1

