Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5B83CFF73
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 19:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488425; cv=none; b=d9+ACEpRka1yWMArc5cffETsQijZkhpjeO7sfv8/FOEOUJsgeZu7VQ626FjRA2MERelj5FAa2QdYCgLIiJ4DGAXhRJdgpAvBnj3K0+0HM434w01JAWTCtviUlKI2j0jHuAhINLVtGD+6XiM3yYwaK7y9frZpvEvVDrGMWJxB/30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488425; c=relaxed/simple;
	bh=yeElXe5PuqMK9cXSg0q/mdekpBfVZljUalhMY591reQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMcbVLs55KdK9HqYwU7ApSuEQgKlZf8QE4OL1eiy1SZGU9uEpTRr4lX9Tp/eGesJQqfjdr3p0BPlLMB2GXYVhs//6MgHmn5mubPjcBfuTIaB630FUHnaaSU4QA9m6haY1sUN3h6bD+I/0NcS+pSR7NJofnS0a+YViKf26jB6tAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRk3ROrr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRk3ROrr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so58799375e9.2
        for <imx@lists.linux.dev>; Thu, 08 Oct 2026 12:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488418; x=1792093218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ne6jQNHZSute3MOl6uhvR02t4ZAiYz3hjPWK7wQg7Q=;
        b=nRk3ROrrg5y9acoOgCdbPMaIKNy6Z1Mw6yKR311ya+yrINWleg9QYfzoTlxmyuEYpg
         75+TeQ/xbry0r75zZdNsUSbayTZbuiHJA1DMMwglIGQRiIPaUmMyyryRSqjunQQlMSDK
         MHqSAdvHTzJ6AbkDr+vxDbBbdIRdz9dgSelkJVhUcqYP601eAeU0k+beODVPFTKHVcqV
         7kr2T6WpsEi36a1rk0hbMunKVoigp1OtZLcxmz4m6F64I7Yo75orCh1Bla49CHjHNla+
         tZVfCj+WAUbVuoIwwv5HVFZxir7mZS1bTMyDIgysLYbAHwa211hUjmvHufocmvJ3/JgW
         9ESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488418; x=1792093218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ne6jQNHZSute3MOl6uhvR02t4ZAiYz3hjPWK7wQg7Q=;
        b=Ogvlk1lLwxvur5EylOLi9fy32zJTj1yfNuTmSuZkrO8pRIoN1FNvE5kHyIbB3nt+Tc
         epEF3H9A1/f/n98fB/tI1Xqa3tzEHO6eiqUgSc/XFLFWVMiDjUiG/wn333lddr/kZ7yE
         Mon2S+B+M2ciA5SyDE3DZZvTcsf5mzLJH9lC1mrq/3I/SnYBa3a7qNDA7MDArX7DXxxz
         cF33c9BygUTZK7H5c11Lc/ZxPVY24xUOHk7aI2hLVdknEtlA38uKKY2UKZAlexOwJR2h
         BgYItrTu/dpNharGNBS7UquEUw11EfJjqc+eBaVHf7QPLRhKjXSBbxrEpSs8zuv56Q/t
         t8Iw==
X-Forwarded-Encrypted: i=1; AKwUvBzZOkaBG2cGyS+REfEYm4qrw8z4+mnz76Z7ocpgBI7lQWaLJdXuudPz+Aa63mIDhrPf3bo=@lists.linux.dev
X-Gm-Message-State: AFuF++mBf09h2WS/XFESDpfdmmWJh4olmCX8M249tbsSYm9N1kGvA9Xm
	4LJY/UebR2Jx75Ot65a/hNT2S4h4LY1/tHBjrqDooPkOKveAhG81aIc1
X-Gm-Gg: AYBFou1OjEvu6hUPNEZ/14Pzz++Bk7o2sXMMuA4Rj9nZTh1ALqu4gD8qijk170h8Maq
	xhyUscYuhyaVbPc2/RZD4Ufc9liuNN+J3Jex7XYGmEDabxWOgwmwvB0F76KSzIYoYybffHGAHhY
	saUhFIE5D4uSAoE/ngttLou9Nfa+oiVLW0T1+2ubg4W12MC6sDYYBiQMI1F9rrxMVBtgusUUJyV
	Dd6ld/fYZHguI6S4Qx7YAtHAQOgoIYPPdWpzm5Hq3KuEC/oSHSinBFomfPRLzuQUXW7y0m8Ku/U
	VxMOjaXVaZBW3Q8y+wqbpnyQVTkfFublYsGpqxZ15TJCQ8ceTGmWolSwzeyDDtYGdjK4hXzi3xc
	tMIj7RQ0369TCqdArt1L7cg9RQMmgG7nV/g0Zf8RLMgWRv50nEZEfF9iVPjgFIlOBQj0/AvNeME
	Fi8lw/dSgQYHAH+nqQCLyRsLekHSAPvSXHW7McTypzcHis9LCB1TXeeafCH3iDPWtml2JDTNDYX
	tZZgPo8dYsI7T8hCY8YjoO/Gw3DHPNGVj+C4EBC5JBYEqpLJQCFUs7z1xFUI9Mc8aicJy7i2qJc
	ZVYtg2LHOnGpTmc+3uCo8w==
X-Received: by 2002:a05:600c:5391:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a1802eab67mr140228155e9.10.1791488417829;
        Thu, 08 Oct 2026 12:40:17 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:17 -0700 (PDT)
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
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 02/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULL board variants
Date: Thu,  8 Oct 2026 21:37:42 +0200
Message-ID: <e5f0dc2bdf5574c907c0efdc8b5b9974a32e2cbf.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Document new VAR-SOM-6UL configurations on the already supported
Concerto carrier while retaining its legacy compatible. Add
VAR-SOM-6UL variants on Symphony and DART-6UL variants on
VAR-6ULCustomBoard.

The new compatibles identify the SoM storage, wireless and audio
options followed by the carrier, module and SoC compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Collect Krzysztof Kozlowski's Reviewed-by; no binding changes.

v3->v4:
 - Split the board binding by SoC, extend the existing VAR-SOM-6UL
   entry with new Concerto and Symphony variants, and add DART-6UL.
 - Drop the redundant -board suffix from the new carrier compatibles
   and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f044f6fce51f..ca6778b8777f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -835,9 +835,46 @@ properties:
           - const: phytec,imx6ull-pcl063        # PHYTEC phyCORE-i.MX 6ULL
           - const: fsl,imx6ull
 
+      - description: i.MX6ULL Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ull-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ull
+          - const: fsl,imx6ull
+
       - description: i.MX6ULL Variscite VAR-SOM-6UL Boards
         items:
-          - const: variscite,mx6ullconcerto  # Variscite VAR-SOM-6UL dev kit board
+          - enum:
+              - variscite,mx6ullconcerto  # Variscite VAR-SOM-6UL dev kit board
+              - variscite,var-som-imx6ull-emmc-sd-card-concerto
+              - variscite,var-som-imx6ull-emmc-sd-card-symphony
+              - variscite,var-som-imx6ull-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ull-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ull-nand-sd-card-concerto
+              - variscite,var-som-imx6ull-nand-sd-card-symphony
+              - variscite,var-som-imx6ull-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ull-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ull-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ull-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ull-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ull-nand-wifi-iw61x-symphony
           - const: variscite,var-som-imx6ull # Variscite VAR-SOM-6UL SoM (6ULL variant)
           - const: fsl,imx6ull
 
-- 
2.47.3

