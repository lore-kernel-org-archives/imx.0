Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6C7442131
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 11:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113700; cv=none; b=hD7qNEGOqdmWic7ABv2VpwBYRI31ZLsJjX/jvJ4EQVyNzN5ZL/N0zHDdUm9ckn2TJLeRUGLnbbV8D8eYyXcr4o0UDCyhCilrzCChcQiJIFKhc22pBws2eZWdkNzbfRePsX/jQFjAsDO0JymZ/cdrGBVEHFv4m/+Jy5LSrRCISnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113700; c=relaxed/simple;
	bh=uosAT7aWpyFdg4cLkRsjxRGVgBTy0TXCm3nIRaZP6zA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RWHFKb13IWMjEc81MGtfUKoLzvet11rSSzPUUnHYUWB87Y5QW1L9c0cw52WTaVoiD690cx3RBHVltVqsdGgUwoKlBCYCnsRZl77qQ9bp1kkTAQIZRDRQq05iLHDkoqMJM3MOz0+/COA3VGlSppRQ72bcAoORnIwzEe6pMm67a3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMib7ZRP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMib7ZRP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493f60208a5so45068555e9.3
        for <imx@lists.linux.dev>; Wed, 15 Jul 2026 04:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784113697; x=1784718497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qd0jgdEP7Eyx6NeLkQUSlxLKBmJIoJQHE/UWc0B4BPE=;
        b=EMib7ZRPcFz7XVgD+xV0jPG5gUJDQA+kJUJd4QaS8Xm52E46Xz2yY/xpG54Oms6pHv
         azLw/65I2DFGcRQ17gQVmq6n63DRFB+ph99LrfF1Hou9XDIe6Oo0/TFnPR1rPkstzAID
         gDnClDHhJQRc13Nn9jyMn2MP/r2vdHymIFWd2psfxAwXezr7iJgstxkTG+b6HpYCsXAz
         /7J52p/AYrARdIOfgZ4G2cEG4wPvHzlhVz+93fW4lothYntYor18D7NgpkjHyVFMDR+f
         ugulXEcbsfTaLjDgNChwOga7iNewNJx/7B4sS+fi06+oBKtRo+lnxpgjKqQz3U/PQ5lW
         Dh/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784113697; x=1784718497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qd0jgdEP7Eyx6NeLkQUSlxLKBmJIoJQHE/UWc0B4BPE=;
        b=Q6jl+7P5mZTin+yDoRCsUFCjHpkdUPUww+yDJPQShdPnQuoUMBI/sQ9X7fQ2ST1xvx
         PzukLYHpOscMeohdULW/Oz5W8d3xLwU/EsPUnxELcifAKaDm0jJvjgS5CS3AcxxS/j9s
         qHpdQj+JbkNEO/ECmct81xCDNCLmbJoMTBrslqDVXJ26RmELUoUQ4OSl41lag5DRTy9q
         eq6qZCq853LT+xJeNgHAVX0q6nkqyc9v9XZPVs3WSgC1knP9qqfnbwTksqTbgg4mMU1r
         aWp8IFW4WGSddGNb+N3sQfcT3pdcI/Mtgq0jXeT2Nxxq0PcfNmU959MjcHGy1mlf0XyQ
         ttDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqcwqb8Td3PJPo0vTxQ7F4JQo+ay59q7UYHgnsrKq1IZLEjHCOep8rY8eW8JS/xtdSkgtQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ6NoiBaCS6O3sxsc3rCMvL8Q8R1vYAg5DeZtkBp4Cdj2aWc8J
	XcBoRno+ZmfT7DrenpK9e6Md4yVyLQuMtGuwTsYZukBrtFGyLwJrQuYc
X-Gm-Gg: AfdE7cm9bj4A0mpy3BVtgwMdDriyuYlBnvKmW+kxwck/lZ+nFPx5ej8fv42QlZoKbHv
	s+EXsPjYXzkcSi5eGtFK6GkirvmXGoVUWdQdOe70cHQmkrRa1RivTMLCWm+c/L/9UlH9HslBaeP
	D4TSnze6Vc7mXBytFdIiuJTxkxwj8iYHyoaNpzBDUVjgCkAvWuUpa/m6D5476W/DONtP3uuiUfC
	PDFfwK/bVUh35+jGOqiqiMV7AvZ6xr6t3uA7/FvEsVKAyf/do1YAiQ9tf9XiOqlu8y5+edgGAqn
	1Ax0sUN9Csk0sY59oKhkioIAWwXoDuu8Vit7ih2ZwehhZnGiXLJYSNAWYk3mJPOKwc1Z2RUYl1B
	9jxIlqr0KQj7gVmRsitH4kSwKxBpD54AX2eikcMP5mzO4ZdNAe/PsQmG/UhcFN6HO34PWUync7F
	sgIl1oHOsoTt9D44DtHNbyno22Zr8Evf7dJprIvtGVe45213/bqjQKOm2Ncw==
X-Received: by 2002:a7b:c5d9:0:b0:493:e57e:7aa5 with SMTP id 5b1f17b1804b1-4953c27b35fmr19597025e9.22.1784113697474;
        Wed, 15 Jul 2026 04:08:17 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm151389875e9.14.2026.07.15.04.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:08:17 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Wed, 15 Jul 2026 13:08:10 +0200
Message-ID: <ab828fa11ee190cf703cf6a422c43fc2c2d60a60.1784113547.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784113547.git.stefano.r@variscite.com>
References: <cover.1784113547.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite VAR-SOM-MX8 QuadMax SoM and
Variscite Symphony development carrier Board.

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
index 6237fb2ae50e..532e4308dc46 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1381,6 +1381,12 @@ properties:
               - fsl,imx8qm-mek-revd      # i.MX8QM MEK Rev D Board
           - const: fsl,imx8qm
 
+      - description: i.MX8QM Variscite VAR-SOM-MX8 based Boards
+        items:
+          - const: variscite,var-som-imx8qm-symphony
+          - const: variscite,var-som-imx8qm
+          - const: fsl,imx8qm
+
       - description: i.MX8QM Boards with Toradex Apalis iMX8 Modules
         items:
           - enum:
-- 
2.47.3

