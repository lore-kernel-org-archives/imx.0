Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90212E8B61
	for <imx@lists.linux.dev>; Mon, 29 Dec 2025 21:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767044259; cv=none; b=oCHGDBD2z5xgSzVFUIrT4shoLEjVD2XVWz7OpyhoenpSQ/PgPvT5xu1jDtoKXO/xlxBxwjOodwG9c0BNiKko+OIkL/RPdii1LMwnXmTJIx/nbNv1uglUuybqRiGF1013DRVlytFBymsQRl7H9CtyRBeO6K+ra7EFbGhApJHzO48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767044259; c=relaxed/simple;
	bh=9ZMhYWvGA48//ElPB1w7XwWDNmtPnQojjM7SQ+np5lQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLslNonIWQ6pnJURfTyf2H7fvQ0ifr7XndVxH8gImFsqj0gbBoPjgPGl5nMUOg/LGe7g7ydAQ0T6zrX1FnECG8Gpkljq9akmwBagwuJ/EHi1VOlq9Xwxr+MLxx/fOuVp/XxVjFaoM/RKDDAKiyven9DQ2ebgUzIHW6rXQpgU6nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4lJO+d2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4lJO+d2"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so61747015e9.2
        for <imx@lists.linux.dev>; Mon, 29 Dec 2025 13:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767044256; x=1767649056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEMVDwEDv+HPhVXY2LXDlZKQau7yTOfmnEyR/lVD/RA=;
        b=g4lJO+d2j3igY/y1/nxInlCIPxqiPRGwZOhVypV2JHw5vb9cXshuvZ3WpS7QpsbewJ
         r+PxagQYXDKs0IssaalN/RZxO9wIpoD8jRf9xyXTj7CFNtDEG9FLrwb7mji7f4Lsps2F
         i5BQ3MRElyhJPEoAt1qtQkUiTCsSy2mOloNwCerK8ANZBnIuwjA7zL7huO+klV+KglY6
         gFvOb0yf3yKsT4ELSqI1tKGvPqyP4oaXlS2W0QmSdeNs+OziIzTlmKRPpUYRaOOVFLDM
         omPUqfugwiOLmLa43MIp7jlXfIErlzxdLDj5S5CM8c3QBkJGiPjrnHN3v7NGuRULVF7H
         9krA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767044256; x=1767649056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uEMVDwEDv+HPhVXY2LXDlZKQau7yTOfmnEyR/lVD/RA=;
        b=ncRzNjfyxnMQ74N69p4+GYNkCd98zdxSDUWwSO2gCWUHMsFPMxOZ/m5vpNKFdnLpty
         CHepRC/2ZGralYxs1ndxgtq7X7qZknK8VITV66WvbahREXoGpQRREs6rWoHqxEFFZbwy
         7EH+RC5gkyMk3P8wvrhtZBmD6iYMnxznQBP0CeFnYJ2eTVHzhS9tXVm4X6ybKq8e4bUp
         I0qiKOFuL1scC75n8l7CNR7af3nqF9YVCOG9TDfKo3VotA4THgDGbITAzzidxBY6MYWA
         QQid0tmVrozIuaug5nNVpLeyJevNCjz/Ch+PuvQx2ckGBiCeuPe26VfaMEvDIypXZSoM
         MnUA==
X-Forwarded-Encrypted: i=1; AJvYcCWuWVf56+DiGcDyzn2SJFB5gSGMhe1LNnmDIeqkL3LqqK094Sr/Lg8EosHk1C057CH7MTg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRNYuU/UkQccdYpjXKYu57m0DtSjF78NcZadcoC/RzrsKHab9g
	Q2SLX2THHoDqePbIc4M0SxzZtYU+0fSynbveXZLBikkaXpCN3+SI1DfH
X-Gm-Gg: AY/fxX6SF7GQm/tNvAN3hoAJ3oVqLLN17W104KCXnMa3tQ+kF+ziMXhwGjponjZeffF
	AsBhXYBuLgzA000e0A2F3HrCHC5wIpLBTnia6VQRaqhPvoFqn20NnDEmrfBrtMWboesJU3gOe83
	jpmiRX8I1eOhfXIxmh6couIWbDgcxJQm/8CSO0uLB0/kflk5g9PUey+k0DLLd0ImyCpKxCgBMQM
	N6PinLJosDpxBWoVxyprTQVwPyP0LVHTY2ewCJNqYitr6t06p+U7IlcMMc1ngdFHBSulLhFzvsF
	gF5MFqVwzE4MhY43xdBkFhO3EgLAzyYk43gMGx+wvSqaQOcmQ17rcezCmthkUtZQ2x0ehh3YwG3
	6hzR8p1AdqXTOssCYmUBfWt6qdpePpr+KtGWL54nkh2QoN9hdAsfld/Ag5lTD2nAdvYcVa9EYmo
	oKoZ0d62nHbMFHPDi+Jn+PyWNIboIRg50cH2bf48G9GfCR4WVaZz9K1SpjNGMZqbMQIea9t0hNm
	AozsM9m5+KWQwC1pQOK
X-Google-Smtp-Source: AGHT+IEM9dsLV55UGCsXY4JibCS2ViZO1P66ipFVvqFYhEkKmsY1uN4e6nM9TXduuaQlPfzsV4ViRw==
X-Received: by 2002:a05:6000:2c06:b0:430:fd0f:28ff with SMTP id ffacd0b85a97d-4324e4d3764mr42020757f8f.26.1767044256097;
        Mon, 29 Dec 2025 13:37:36 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-220.cust.vodafonedsl.it. [5.94.28.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm64046230f8f.5.2025.12.29.13.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 13:37:35 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
Date: Mon, 29 Dec 2025 22:37:15 +0100
Message-ID: <20251229213726.79374-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229213726.79374-1-stefano.r@variscite.com>
References: <20251229213726.79374-1-stefano.r@variscite.com>
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

