Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAD03A4F3C
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 10:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770285715; cv=none; b=M5xLottpLfWEwoD8uU6M60CYZeJb5Wiy9gcy417m2lmYDKbh0gsdiCkI7+JQ8uoFS+yrO4KoioK6ztUVap/R8hPNGPmAtElsE5YQwIClA0oevB9rbDq1x0gDhpRqLsJg4JOBuR2WXz/OTj9uu0bSmes0buOcsM4E+aTpwtHg+U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770285715; c=relaxed/simple;
	bh=sq2uUQQD3qgTIDW8Pm4AOknynWhEu6IZBgKRRJx1Iy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AIUGV8oqgk7m3b+n7JzQmy4bt6ZPW66u8QoR4p8guWdyY7AxT7kvsfSQu8orXxpQXMCjSHZbAsuyLobLqTF6bxvSc6PO6xYpM5EUaQMWKtHLnlUY5Ga5XABx/6CGMDlLHVM1cBQKmU4KxuKcrKp23hfXXu/oL3R0qY6yLZVypjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUtDfXiE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUtDfXiE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-432da746749so499811f8f.0
        for <imx@lists.linux.dev>; Thu, 05 Feb 2026 02:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770285714; x=1770890514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/+UNv1yjJPaLGJLxmiYByirfIe+2Dioc065dJfSUTI=;
        b=IUtDfXiE9p4cjRfqtPTXreKiFtRANYK8oZCsHfAKWdO7/jB8b7sI2nFmqxD1VoQm8u
         hwC+hNS+IDoHwfYWRc64r9KQci7u5D+lLsOAbuHPIb2gCSYtuGUZARGQLVJLsao2+QmA
         0aJiH+FQSfJwf7CpvGihyJe9iI6inLI8RfzPP/JUyxKJF/OeKQfRMM0cgmhBrItYuLEb
         KL8ZmYfmADV5DGvvgqAVPeNhU+qq5TTqm6VI02uyVf78bHAGyZfspRg2Po9PWR9IpYtB
         u7Q7hhrlUpLeXdhFvSFbyxC9SrCtkilR275N3FU5pz1BszT0TVniTrEodeQf+t7dMKCl
         iQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770285714; x=1770890514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K/+UNv1yjJPaLGJLxmiYByirfIe+2Dioc065dJfSUTI=;
        b=JPF+cb0ySR34Yn5VH4iO5JZ4LhQzbZanJJe7YAWlnHCYtl3Qp/8KH41ZA+B2Nbb8Zs
         FkSwmZ6MXGOYcyJdFH0LUPOuAD2LZ522wFOTmwFdykPWh9AJYoFs7shgoWOW+QNVpx48
         Lmgw4TwSPkLixP7YjHEgWIdK9pXR6XS5x8cm5fSeP+psR19//AezSMIK+bxqy7+FXyW3
         zYhgUt4usv3jLgbtj4wxBC1SwUi/IxoQ1fwwZIhlnUP1FTyqg3ejjwFF171W1OTC6eTR
         eLhyjuMBd97RVRwCDz+rocUtLkSJpU1gmtNKdAZskQnLgHsDQ7mTAHkV2r17j9d+dQez
         HOrA==
X-Forwarded-Encrypted: i=1; AJvYcCWHQrsER32xz3UGBLHy1wcNNRJXqTT1H2TGRfAYuugKDK6IO5mQvWYAKbNFLl7cvC1OcFI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3fVNatFJlifXU1278l2hk7vf+7bLcVkxa0v+DMNhe7Nux45yY
	AI9+P1IEL4/k0+K3XmLhUXihV0VIrX3Ij/wXMgKryyM9yRHnD4kIzIRx
X-Gm-Gg: AZuq6aJsAB5Wrn+qiUTsrb5GwAkdGpxZLxLuYXo+7P4fHXap2xjnaWQ2B05Zcs0crjh
	SQ4PqCemDcsPMTpZsaEGTOCA10/qLSmIK3Q3scf2hk931VezMbUNhxrrW+FgVEZwptcM8nQXaog
	nnE/C/d6+K2i5nAQtaoLnfLZzXmZrn+0GEE/JU1NJnDkzHejCMynWpYfqUFeDQ/cIzLtHfQRodO
	4r8A1q/HS1jNBsk3ohE5q9Dt+EvMWvlQurfBiNnHe+ex/SH9kW/aV9fMMAGvd3hg+6s+DVmkZIh
	DA3zTmWJbT3OcIKLe1lJpvX3gjhu54wS8MbrK1TwAz3kiyCnMbcBAg2Jv5l/unQzAUNgmsZ1XVm
	pTELO6NHQDTQm5s0ql3Tq4/nBee9Ub8svkzos3xUjFHojltDhKfQasRt3SKnNRdyAJNGmyPrPE6
	sMO2IfWqfQwP8SkPm8gkoOr2ucV5hkDvvAbIVyJ5DD/s7FXH7I2BDlZnfIP5j//2meHOHAdojWJ
	6Q7Kp52m2LyPtXjyPjJkNdIggMK
X-Received: by 2002:a05:6000:2c08:b0:432:5c43:76 with SMTP id ffacd0b85a97d-436180533ffmr8287887f8f.39.1770285713719;
        Thu, 05 Feb 2026 02:01:53 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4361805fbc5sm12025466f8f.34.2026.02.05.02.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 02:01:53 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com,
	primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
Date: Thu,  5 Feb 2026 11:01:23 +0100
Message-ID: <20260205100125.9095-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205100125.9095-1-stefano.r@variscite.com>
References: <20260205100125.9095-1-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX91 SoM and Variscite
development carrier Board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 336669e16d7a..4c200a67600e 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1524,6 +1524,12 @@ properties:
           - const: phytec,imx93-phycore-som # phyCORE-i.MX93 SoM
           - const: fsl,imx93
 
+      - description: Variscite DART-MX91 based boards
+        items:
+          - const: variscite,var-dart-mx91-sonata # Variscite DART-MX91 on Sonata Development Board
+          - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
+          - const: fsl,imx91
+
       - description: Variscite VAR-SOM-MX93 based boards
         items:
           - const: variscite,var-som-mx93-symphony
-- 
2.47.3

