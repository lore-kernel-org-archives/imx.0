Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8A828690
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 10:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782900367; cv=none; b=FWqwSHV8WXwIms3XPlKf0g6i2lcYTrXBtDUzN3k2f2/xfPGcKhomC+l06W9Oxk1PhsIxvr09q4Kn7o7DARQjBV3vLBqfiQAyYOpTuBRmoADXq5sWsx9XNLadJw2RDQnaWY+hLcnLqALfLmPgGh3oZOSTLLC12jVKrYHfKNK6LN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782900367; c=relaxed/simple;
	bh=x2CdFSHOT4xVAoOC0rjDQJLmZvW1D4gQ/CaVjwe1044=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IZwQnWJnuQLyATqFaY8B5MdqM22V+RMeFDHc4XO0+SS4tTanh3jeKx5VcAEgZhYbvfT+CInI9Tx2PgLCl4jzmvMwN1rI6Sah+ceGdmIb2sRheuPHzVRea8yRLUG9NJItEJOWgsebunqXaSv+pHK7RQ5pEazMffZdO8YG+0inNOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ppojopt/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ppojopt/"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4631679f204so956419f8f.0
        for <imx@lists.linux.dev>; Wed, 01 Jul 2026 03:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782900363; x=1783505163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqpG8fUz6FJIqGcUgu0aLyV6Ny8c0iIhvMW4sHx0yr4=;
        b=Ppojopt/UsPywyB/xMVIIhUnyahyXZT0+f0feFSeSmanCj1TMHQyKw4ac+AdiuRFxb
         G9F4EgV5wcmEy/J+KdExghcBNOmNDUxhY4S6xdYKgN2TZ0SZGBiLevgo3dQ6hxc60jst
         hfhsFYtv1aCFrTtNocLjI0PE0oPQ2N3qHkFvuNMMmvdgcjFEyO9ZDzXWy4r+GV2vlHsq
         Hg78yRzxMfZ4axE17O09PziTdxf6qFLDuV3Uv3I6c4UQZJtIDXaZIbvoJh/n+8NazF6h
         jTCaI3U4jwvoYYIzG2iVncm+WiuARPPHBVsP7bveHhCqgvi8xYnRzRkSVmnD/nPLG30Y
         Wfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782900363; x=1783505163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mqpG8fUz6FJIqGcUgu0aLyV6Ny8c0iIhvMW4sHx0yr4=;
        b=GhuaUIyhnYDrbwu7xMkmc4OBRkGJomGRRQJUSMbFNwjGT1JK5H1Og+NUZTGx0WO4s+
         oVp19GPR/rH+uI7FxNvJIyloiiRMKMNrilROE8QeVWVOkSPnxLHf00wl2Z187T1pFyiu
         BTftef5pwZeMP0a/vKudgjvxPuAe19/X8FP4aqYt9hujyi3u3cFhGN7P524whr+DcxjN
         vdwYAtbtyvUoBkOQXRx06MAUboh1Y01+PS84gvEctTF2J/7aN9C3ihwvo/IffBP3Agvh
         VJphR9/n8UybtKawvVW+4fCWLFVBnSPwnLoK4K0U+na3IqRV56S43tuNOIrGzx0azpWC
         3ErQ==
X-Forwarded-Encrypted: i=1; AHgh+RriLUohM3Ph3pH8NdVDTezX1lmfDAdwKECHeLZhl553tD2a1uJJwp6xhxV/D9Ena/8JTPg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsrL0VUTSBeWDHN1O1o8bIjLUOlIFF/gx+6P1TtcNIEVuMJOP4
	v34cLA4AainKASuOU3JTGSmpNPbgVUUE5ifHb54Le/vlzpJbBN27kBs/
X-Gm-Gg: AfdE7cn48/5M/Z04459w5g6LSThWVD0Z9Z6i1eg8c68/WdUCsG7URzIs2U5ML2MG5jC
	W+uLIJmQscVsHPM7Ml5JSsIViFDXFGzf9kTB+chLYgqBRd+Zt+/LQ43CV36Y1T4yIvx2ER5h2L0
	LIUjXQLi4NQBgs4cz3hBZ1JMyrCARCf8ZhZw3WB4h0ABeA/y6Tb9V0Ww/EOrsBVi4YUf6B20Ex3
	vcRka9M5ZbCuAru9sOwVVUV++helmO8koDaZUhiyYHiSFVNWtlhrBeF6RAaJwG/MOJre7b7iEBP
	NQhBsEf2E8FKKi/FmGYOh0RAgdRVF5OluJMzUuLJ3CTjiCOEn9HzeRZ9BG+wDVBkImP9oWCsfdY
	o5UfBnWEotmjHDRM70OWaQBQ+5fsh5vKf5N1/uRjDBlwSRS0yRW5Fl0Oil930O1+lA8UgleQD/g
	ESdqpuQHoK3w5RFxL/hahM5C3NjfknSM+932exKFCiCKGyNThYs3F4WsZFfhxWDzu6OJSgbThYR
	o4Kqjwcw4OjCJpiLfHAAZyfCg==
X-Received: by 2002:a05:6000:186b:b0:472:28f2:506c with SMTP id ffacd0b85a97d-475dea255famr8072839f8f.13.1782900363045;
        Wed, 01 Jul 2026 03:06:03 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm13742935f8f.19.2026.07.01.03.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:06:02 -0700 (PDT)
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
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M PLUS Boards
Date: Wed,  1 Jul 2026 12:05:55 +0200
Message-ID: <71dbce373c16b9a251ca316fd90ef232ba106e76.1782898728.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782898728.git.stefano.r@variscite.com>
References: <cover.1782898728.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX8MP SoM and Variscite
development carrier Board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v5->v6:
 - 

v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6237fb2ae50e..f96f3d31dac1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1322,6 +1322,12 @@ properties:
           - const: tq,imx8mp-tqma8mpqs            # TQ-Systems GmbH i.MX8MP TQMa8MPQS SOM
           - const: fsl,imx8mp
 
+      - description: Variscite DART-MX8M Plus based boards
+        items:
+          - const: variscite,var-dart-mx8mp-sonata # Variscite DART-MX8MP on Sonata Development Board
+          - const: variscite,var-dart-mx8mp # Variscite DART-MX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.47.3

