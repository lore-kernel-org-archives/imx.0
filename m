Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F86F3148B8
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767608685; cv=none; b=JaLydO5rs+a6mrVPBWatAPf2mDbBnM2XFJ2WE9C0bF3dwFh8VxWWyvGi+SMx4KRO7KDNHP+ww3O/OSYRdJlS2alK2eSg8SG+WSgSSvyUXgaJnD0XMyZIVFzi5vA9j3Tp3a535FF8hSJaSkByzzfx7lXDGHPpP8gHNzZcotJIPqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767608685; c=relaxed/simple;
	bh=SoAJEqM7XsGclJLWSso4KF1eMXke7Fjb3a4FIxBmVyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FAXEGcqpiF5QetOKG2eEiuop65xp9cFt9isgs1dXzYscQExDm5em6v6ZbfFLcYR81fp9vby9EeRYcepMwg7D2wTeYOL8inqsEOIkSgzrvGrOI5UEOlZcrdtyiPYLNDmBupwC1/KOmm718Sj1klhWd4AobZePww6RPr5yjW7XJdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SN5c19EH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SN5c19EH"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47755de027eso83563445e9.0
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 02:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767608682; x=1768213482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=SN5c19EHG/LTchXlRbUSXwltQ8WjUZG3hbq1tOHFwHylXNAxmaxDHVl/GpvBT5CCvS
         fAi0/VDptHWhe0owuJo/9AB3jBFVUpiSPPWAhW8EXFCdYDL4vGekPJZlHOmDqr5OtwZy
         jihun70s8KSIoFz8n8pIP0N8Js3vOi1Cm4NZ+F2v+Pjv3n7m2TZrOJ62P0u+w8R1QInR
         V0cXkUgspm90Npb+pfN3ePhyM4Ouwtav5DxvI0iohjlzqtxnfxUutyJTAtpRQlh/adL9
         RbI0dM8AdDlkb2ck+KglGPBIGx6iIRji5tsJ6k6LFNbuULdPRHhHknt8WmLNWvVPiS4Z
         hhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767608682; x=1768213482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=MPpTXhZviGwQOXwmiD/dUp7c5ci6luck8jCoq4rNnfPhziaE+Ey+DmCKqdOFfpyU1f
         +VurSfzNxnskkQ9gRCltdiUaJ/rtUEdEDJAX6fSJZNvvJ89HjcfLDB6/hmeOeFd0NWbf
         pZp8HNgKnO9gTARC13J4o9mjrQmOigPvzI5wcMjUaAFbsvv4y7bxiuysxckpRwHn+Rvd
         7l5iJuYMfNESjyn2qURNZxJoHDeCDhNXWa2SkDgyZFCvDkahyPte+Eqnt0wlKJ7NQ+l7
         We/yCLxwyYJl7F7zue0Bl/eIsWyJIyYsBIusxDnTN0KcYYNRw4ccNHBfMeXYTkYAM2tD
         XwnQ==
X-Forwarded-Encrypted: i=1; AJvYcCViTzkFbkEm4d4BBPINdTXF7xLEH+lsYobsNmDoCTX4Z1P+bbGY6/AVX8pg/P/BNCVvESc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3RxpYCR2R96QahVTQuFOiDl6a4JUI7MqgDdDKF5b8rwsPlmpT
	lnoY1VIQersx5cNBvhWsZZgz6up7UnqgIrIsQc8ZiKs4VpGciynKP4by
X-Gm-Gg: AY/fxX5dXdZ44cjlmkNPRzY/psPm6219NlU0YXOf6gbMOkuk3u9X1DaY/6e46lcNNgk
	MsI3G8cftwg0YRwb4bUwz9RjxTVcYHMNw5yZ6AiyjAO7jpONscEN0P9UMfjpqTGpirBVodvDp5r
	LXAjNo4VDKIwfaIwnKrhsw8TpUHBsQBwtt5DmrAP7JWF7mePZVjO0Yq7cw1RtieQFCxwk9LZZPq
	F9kJMwmCt3sicZa5l/2FfQz8u6Vv4UTS8gwiKmu3b8oK8rClaDyTDvE/o+EsdoNSxxkeMK5VhOO
	g+jNiFPrgrjhNAIX3+eJ/Q09pLIhf/akBLYbWkZw5TY+RbhCpCA+/+nO3SXdQqr50lICjDBNYIa
	3eKaixbi/ce+gqxHDoRDSyNwaJ0N1zrbYsTPrJv/lEL+jiBZGbddaKB4OZTzN76s9X5z+QiIKVP
	exd1+2t4oe4n82c/GybvfCOF1enJqsCWY9z1QIhpRHANp/Urch3bi1H18EQhFRlGIjKYsWK3kds
	smiXUJYK2joye2nqVAkM02ftA==
X-Google-Smtp-Source: AGHT+IE4Fxb+mvxMSRFCwCVY2MMYAerRo0gqIhZGIaYDGKCF0+BDab5bAu8le/Ontz20bO5Qq/g95g==
X-Received: by 2002:a05:600c:4fce:b0:47a:935f:61a0 with SMTP id 5b1f17b1804b1-47d194c659emr571593275e9.0.1767608681857;
        Mon, 05 Jan 2026 02:24:41 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm145607205e9.10.2026.01.05.02.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:24:41 -0800 (PST)
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
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
Date: Mon,  5 Jan 2026 11:24:01 +0100
Message-ID: <20260105102412.6674-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105102412.6674-1-stefano.r@variscite.com>
References: <20260105102412.6674-1-stefano.r@variscite.com>
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

