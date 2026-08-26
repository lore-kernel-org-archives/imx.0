Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F893B19B6
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 08:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732168; cv=none; b=uiXzwa14B/Ssw3uWzo218cMelXK56NhM0FmoWfZ5sruur42TdQsPnAotJ82TwSBc/H4CKmsBo7bS/ofXCfSgNTEww7+A5pZYzLD+OCOhSaTJOIXRgd8S1w56wjWB5pMcLTXCcGwqHt7a3RME1HAwcPjAOMRXnfn8ZbAhgw/EQPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732168; c=relaxed/simple;
	bh=//38RNGRI8cIGlNByhxtPiGRknwkc3/M+Mr5jgncyA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AU6mQGMZinxViXdPlKeNhCraGO2T8MSVBqt4CxrB0KgftczGB0CUYbKk7HnJ+czFmSm7vz+uVKBaPrdB35IhBuDK0jGPdUxx9OHrLBBn106uvbNuI+CZkb7C6SzKTQ+iQcgDFh6J316C3RHj/duHC7YtR3dseYYcgcubQx0fabw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0Fq8C2F; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0Fq8C2F"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c2022323c37so80296966b.0
        for <imx@lists.linux.dev>; Wed, 26 Aug 2026 01:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732161; x=1788336961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zB08SnEagvgroJBWvO8F5zjbyavejq+4YlAWaJHBEM4=;
        b=I0Fq8C2FUObcuUCr+7C4ZioQ1IGpYoeUpU14p8931HzZGR23DIg4JCes6WHeGBegRh
         zfXa4CzodZcxM/YVALc0z6z+S6eRea6y5NKMTbrOGwp3JTEsqs4VS5k02ibqnuKkEdpE
         iqAndDinUD8qorlf5zz8sDIWLx637KX3NCNWMigw6KiBbTOLmNNsPvve6+KeFSANVLBC
         JbiYjvQZs9V42o8ZxJMFTSPh54LbkpFVeUJNZf3HiegrAEcpeDDtkyacV0AjL0n3VtiF
         v/X0xkdQuOYHLi2k9tXsFd3GrXqlmFQ9440VKacQkfGV/TO7Ov+aG8yxbeJnwryfFuu6
         hk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732161; x=1788336961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zB08SnEagvgroJBWvO8F5zjbyavejq+4YlAWaJHBEM4=;
        b=Be5ihVP7iolG7thU83vmNarfVAQZRwAX5flowDs52XvuBcayCR3klGHytwrm6dQmBW
         zz31nnKJZCEcV2YMliOMSmZofCwt0KN9fyQauy0O5CPSGUg+8RotyH4/lv4k+THpnQg3
         iRoLDvuY7yXb+QXnfpJk5dPOLpGMfoQ9oPYeOzgGwrBvq0Rj/1NU8DXNyRzaA1huZQuS
         H6PgabqLCs6q3ZRakrjYz0rwhNvg3q5TcpXnJcS0zcCXRGhKyMti7/23wPJY81BFvI45
         0clzjJ1SVxvd96U1S22yJ5aTKpOtrQwM2Kdm0DjzwHiCCGqedgE4PU3XbXpDdEdUvcHU
         sWhw==
X-Forwarded-Encrypted: i=1; AHgh+RrMuD9ENuVsDoN2bdEvldsGzBv5njXu2GUr/hqa5qtzvGLAl6n5QgAZ3QtuaxrcVXf2aZw=@lists.linux.dev
X-Gm-Message-State: AFuF++m5GY6fJbXe/eVDPGaWmqeNZEjz9xbFq2ISGsEl2O1hb19LHEWo
	Y92gCGYW+jDA8x8U653jiz3Te9D3chTj5d8reM1NkN5RVpvKZft2rhjx
X-Gm-Gg: AR+sD12/ATvCdzTGlNm4EAXcGE+Jwt3gwRDK3BbNAopyWYScMirHWJS7ZYP3kOLEO9X
	hnKud3+BkdtJBDeZbIL6i5WnO/HnO79AWRopiILyvl5SHhbQV9wls1JdE0twll+7wvsT5nA1V6i
	8gRbHlBXDHe1tix5XvGGC3bwKdXuTgtu1uEocrycUGO6FDbmEkl/XoK/c068RYQLCTtvh6Gsevg
	FBXXl9jqE8GFDvYr9b6JXt9uSK+jgIBf9qp284lakHHDn5W2ypamXzxaHjIkjEjA8L9aiHt06lt
	BNTsCkx4CS5pLZYtecklQONaia6oOq4jGc3BMKrJvxLrYFR+oDhzferixZn7OCyS75Aka2N1Gp8
	ioii0Xqe+7lZByBT4kBez2KoVB0gAiJpqhq12NVZfJvNtBwxt/efMd5wW/7jSR1kIE3l+kHxJi0
	GGHhFIgU9O1zLzEGGs7bCUnC38rb07CnDQ4WNsBBXDOzeOqY5hulmi21/Goizv6azQkzADvvsF0
	TBEP3Gsx80fi34/TgcbHvE=
X-Received: by 2002:a17:907:3d44:b0:c12:74af:51f3 with SMTP id a640c23a62f3a-c250bb126c5mr640061466b.6.1787732160791;
        Wed, 26 Aug 2026 01:16:00 -0700 (PDT)
Received: from GLaDOS.station ([91.80.77.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab65sm360997566b.37.2026.08.26.01.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:16:00 -0700 (PDT)
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Wed, 26 Aug 2026 10:15:35 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787674237.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787674237.git.stefano.r@variscite.com>
References: <cover.1787674237.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for the Variscite VAR-SOM-MX7 SoM variants
used with the MX7CustomBoard carrier board.

Both the first and second hardware revisions are supported, including
eMMC and NAND configurations, with WM8731 variants available for the
first hardware revision.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - Fixed commit message
 - Fixed spacing

 Documentation/devicetree/bindings/arm/fsl.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..b732ff810265 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -950,6 +950,23 @@ properties:
           - const: toradex,colibri-imx7d-emmc
           - const: fsl,imx7d
 
+      - description: i.MX7D Variscite Boards based on VAR-SOM-MX7 Module
+        oneOf:
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-emmc-mx7customboard
+                  - variscite,var-som-imx7d-emmc-wm8731-mx7customboard
+                  - variscite,var-som-imx7d-nand-mx7customboard
+                  - variscite,var-som-imx7d-nand-wm8731-mx7customboard
+              - const: variscite,var-som-imx7d
+              - const: fsl,imx7d
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-v2-emmc-mx7customboard
+                  - variscite,var-som-imx7d-v2-nand-mx7customboard
+              - const: variscite,var-som-imx7d-v2
+              - const: fsl,imx7d
+
       - description: i.MX7ULP based Boards
         items:
           - enum:
-- 
2.47.3

