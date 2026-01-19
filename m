Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD4038BF83
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 18:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768847791; cv=none; b=TSnvOv4Tewx7uoyZI1+Nf4RNyDbQvs/AhMIW0GnQElJ5w0Prs03DmOibrGJ/Ranyz3He11Awk3iWwz/tt7mbxRHNxJ1ZXXDbVcZFAk+oFw59eKzl/3PmcmdRpkDA6k+DJeIdT+9WIBzwhHdmNAGE3OXKACP2/nP9iTEzz8ZEpr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768847791; c=relaxed/simple;
	bh=SoAJEqM7XsGclJLWSso4KF1eMXke7Fjb3a4FIxBmVyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzAooDQh5zKUTn5WFvmmQSm8Ri0vrrsWC4efqJmoL9mKM8n+PGrAqJ120Webnu2Paf8N7ky1tj8jth4QohNN1SYiyPvifBQTzvgLyxldISsG0wErrWX1uN7HE3ZbCYgiHZK1EBRSevOkTwOGNgH06UIDdtMeXAjmxg18I9VouAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NMSmFon/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NMSmFon/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so29948335e9.1
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768847777; x=1769452577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=NMSmFon/JEmp+Q3r4SmykJlFNYbTRnsfMpoGJ6Wg6hTYku59ibqSPIKv3PKGEIpM3Q
         ZDG9Yn/HFTsv8NgVHpeZMkZbWb3zyeVvxlGAsApQ1aZ9RUtH0uhDSVva8KSNCDDRn3CN
         DFYC72/38u8v1tpSKGk41Q90O261n6yGE1oG57kYpwBYG/PxD1E2ylbRUW3EyKose2DA
         gTq9BovAWh+RsNDYlCnOd+/U8Jsr8em4paRzZu6cdKS04io6OSZEztksS6fCh36QlCb9
         rRdMj5PLou+2z6pyJUpy8wyT6yfO3cRUJu5ulk2rF550OAI8WRrPWpIR0nI8EBpKbUHc
         AdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768847777; x=1769452577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=XoN+Pq/b3LifPi7PXHS5hi+etA0kqVW5lLNRbL0Vj5RELUujG43QL246rS9Czzu4eH
         EhQbGd8+nfck3XS8x/ejmFp95XDGsIA8BR6SBuDee9rlJ8HCWyl6cXvoGRvI1FwqMd1D
         r5fgz/3Y8FHTmOBugOfa4qNg3uaXCOwcCJ5eb2rn1mAKGdcwOUHMPBqwbGDQTF/btA/D
         ArRauxTXPSLPDF66y35UVxJtZaFOcSoV4vgs7shWq2oPAfxfa4Cynpb7qLtJ83jfuxSm
         SoJTmZyEIXlth3JRTMjJnAhzzCfdA7lwjb1ZgwrlDCVTSPRznv5o3bDtVNCNMn5VcT/+
         ZAGw==
X-Forwarded-Encrypted: i=1; AJvYcCWyMGlQPy14ynYH32PDFscAchE9o2xf3T3nSNYs5TGj1Qr1qytJqx3KOH8MYOoT/RHCXIw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKrmWpNf8pza5oMb9rCNX4dPfVhPMi0beNbaA9NezZao1ZxWg7
	RMU//5gRY0hYZGskMCCbWQNvbcMbx4Y2ZjA6UMrVRyC/TudE9PT3o47R
X-Gm-Gg: AY/fxX5nVxrT5ogr3hNlAgh5VdWsOvK+syocP3av/RmHfe7jwN7FM+FU4hxgakoKq34
	MtgB1RHiChhaMvJiVPmNuVgUArrsBq4NUQs5TvAap/p9c3alpuuqD2+X/iuc8fLfrLuVeZgUvTk
	nPnnuK2/qeAUqiTnfr3Bwe1C8PJH92MEb7GuODk5SDmrGTUgtNlHAcj3x2MFJEWQoUIIFluxBrx
	w8B114MoE+KD4eRGXGsU+M4w2ya1Q5YydNpkHD5tHkjsUdrEicWKyOA//iLfksGETPFrFI4EKR+
	+msbJAXYgVC+YgFs/XEbjbhXOS6cfqpOKN+qoL7LPk+I9baMmiEL9lOn15Z07azGtA6s1lVsg4n
	1rCh5Sv6lQn0HH37ggqBvUyZ8EatMo+ACiGEV658tpbdUMo8sTn7ACBme1HmO7/13pNlyTJsg4j
	NvwUXg1Ps/hjQUxGCnzI/qxteR9FcJpG+Ixe9ZOOehXQwjnUr+X9WgKL64/KbOXIjDTbJ7tqY74
	cNNWqv1r1VYJ2JEvi5UcZLytA==
X-Received: by 2002:a05:600c:45d5:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-4801e30b8a6mr161135965e9.16.1768847776628;
        Mon, 19 Jan 2026 10:36:16 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm203965015e9.12.2026.01.19.10.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 10:36:16 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
Date: Mon, 19 Jan 2026 19:35:53 +0100
Message-ID: <20260119183604.88192-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119183604.88192-1-stefano.r@variscite.com>
References: <20260119183604.88192-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX95 SoM and Variscite
development carrier Board.

Link: https://variscite.com/system-on-module-som/i-mx-9/dart-mx95/
Link: https://variscite.com/carrier-boards/sonata-board/
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..2a957a593abe 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1449,6 +1449,12 @@ properties:
           - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
           - const: fsl,imx95
 
+      - description: Variscite DART-MX95 based Boards
+        items:
+          - const: variscite,var-dart-mx95-sonata # Variscite DART-MX95 SOM on Sonata Development Board
+          - const: variscite,var-dart-mx95 # Variscite DART-MX95 SOM
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:
-- 
2.47.3

