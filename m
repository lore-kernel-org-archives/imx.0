Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E233CF970
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 06:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641032; cv=none; b=Scw7s2Wkhi2n6lQaFRjOiicqfxeMS/rdVuEO4HJFmbJFHgiXXTcfkuMOkNXHmld2sh2SDoybu78S0iXrnljmyVyf+9eq4Po9auOf/aaa7OZrR9a9McVuMELtj0erTrwfcMO/0ugjmDzD3xXRBNNCrKHHr4DGVguK8SxfiFIabbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641032; c=relaxed/simple;
	bh=eHF/gDNrw5iFCay8E+rL0YGQhFOOuxIopmoV3+XjG5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNeV1Z310Qlaq7hWLd8vKpcDm9D2Lx2NLUxuW6MJY+8NHRUjKrIB26RmrAq2lrhTZUAtmN2Lu+e898Be4ulMcqER3DDvmX0pcwA0c/tUwwAYN2ByhA1vnPnskD2bhax8qxHlUGGC/ZrYtkpm4UMwEYHx4otHqZYtgsHSi3+P3jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLC4ByhO; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLC4ByhO"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso681130566b.3
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 23:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787641029; x=1788245829; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGsywrVc7pNW0Md7H8+wlhF2HFeJ9iI14b9xdhdHZ1o=;
        b=GLC4ByhO1PgtlvBG5nCeMjGMwLPFiGkXYou/ln+W4IXsZzn3LoSskNMlJDCa6GkVES
         mSUKv2KlDYK1lWvA0+4aag6jSueyQGmT5aS3BMZv88MLwz/qSeF1KVjGg+e54pmKbMBE
         +vAlcfL8r9y+jB4gVp0E2263VrbxOAE/licNbi6x84E8R4PBsuqazg8NMung8mUI4Uhk
         e1C5sclRsCgCUV82TvzRpoy6SldZEWvvJUrpvft37Ur51d+pTpUGvQEwhmPK/GEz1Myo
         cnVaw4NBf7IbbrehlMzQhBcQ7Asxo++YZVXSGMQZZHuFDG9D79h3w+bOuu8Tqy2XiEW8
         G5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787641029; x=1788245829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aGsywrVc7pNW0Md7H8+wlhF2HFeJ9iI14b9xdhdHZ1o=;
        b=BNkWaBNy0ezVpL47BkcpxKEL+AyFviasO/ls1j2+DxBnaemzjqDb69zEd8pkSE3//+
         qLNCj9x2urfkrpe4/2KIce1yqv1zcY86xAOf7XfNdru0YXKsaYSgET/9tFFXnMh+R6jm
         oOaiYqyanTsVZ8NQkpP6zrgXBlrYqzRzDZXH+Vq5yT8jsFqPZgInlAtVW1zX6cEnVggg
         RC8kosKOVcyfvG27FzdqAc+FI7SwHsxhoKEqGnme31RHEmE3Hr/EdDOFBxvjBx6T/qvo
         P4c5FbXaHDqql4vrMd7n9DkiQhXfNPDneNEO7dpHKlI8XuTJZTM+STWu4Z2qXMrf/gap
         OlaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRnU261+1Yun89YU17WpqDTFUnq5ybYrQ4fV0+PJAPp+anQSc3NJWbIPwAaIYFTNzLTCQ=@lists.linux.dev
X-Gm-Message-State: AFuF++nHw/WxOamuvYvKyC210/uYnrxT7E0ycJ5GhdAeuphmhfimGVn3
	rx8faYN/tOBM/zpAHD6xAGiiTVhNm2mhTtCntlaz0VfjP/O9E+9O/I0v
X-Gm-Gg: AR+sD12VMiFo+4WBrFO5NNBTFddIm+GEEf7rR23WAzWakITRKivfD2euU1teFAcYVRe
	c41BluCgWz+37Bor9DU28phAJoJQ2bC951BkG5d01rfyqcADWxs7kE/X5WjTsU+ZRO+UR7zaMHa
	4gsEI4JbfrRgRO8YzgSXExX5Dw7wotzHVYwRBL480r5fhH/O7RBvygHilHJPKvbmYr5/AHvgy5J
	QbhMtDZCkHYoYxBXSevHR6jOX+olNZeXh0g6CAeHX3CL//vJznQhsA2DLIb9Uav0b+Wyxt3gieM
	CuLo3/qOhLzvbezgo2odwIq2EM5Nr8gzJqA6EoZ48PCdqy1RHK28InNtvlPEq8kxlRSU87zP+pG
	+rl8pNNKDJ9Ssn4HYQd4H+ZCjIxoZEo/IgP7LamwxMCh8jVqPu7GJhUNHfnAwXbX4I5C5DY8bqI
	rcG7kMHGxatZpzYeQFN+1DOXJ3YwOr5bbVp8i3Da6ohlNguKhoNmYbQKffZt/yA6QsGLUlDKHVD
	Ck76A5VYJh4vP5jpLS6hJCxksFS7ccA647V6kY15638CTt+wNwMuXQ2
X-Received: by 2002:a17:907:ea8f:b0:c20:ff26:336e with SMTP id a640c23a62f3a-c246a605cb7mr3318528066b.14.1787641028952;
        Mon, 24 Aug 2026 23:57:08 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-70-208.net.vodafone.it. [5.90.70.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24d6f203acsm613534266b.24.2026.08.24.23.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:57:08 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
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
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Tue, 25 Aug 2026 08:56:53 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787586961.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787586961.git.stefano.r@variscite.com>
References: <cover.1787586961.git.stefano.r@variscite.com>
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

