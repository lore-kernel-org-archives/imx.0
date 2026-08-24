Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3063240681E
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 10:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567204; cv=none; b=uuVYhKKtTwwxzh02Nmjc37aPrtXindrPP7rchN4k/cMzeLWlUEeTztd4zPYni6Xx2gvl+H7tv73OkYtGP9U7CWnTg/rpiWhGqd/qiVdUnb875US/9aAyTZ0qWBW+5dWSaCQNeuDRpQ15XPqqPQxf2bkCZHLeOKv5USyQF9iaeJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567204; c=relaxed/simple;
	bh=DQUy3Z8MSDRzhWbIO8/PsqkelGTzQbuLOvc6UqBPiZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJGLVf4+i4efC5h0XzOj7quL7D+0VupJdf6uxOXG3Vg1k57y1B82GeBxsOM8d/bV+1Q5q0FOoDdt0ql6ZAuOEmfUzlDNoTMsVyUM4FgpAbT6PEuSA2audG3ScVLETL7w/ujYN5uc64VX223W94H4AdijB6aiLGSM+6VMf8+c+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dj8Qj+RL; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dj8Qj+RL"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c247f6687dcso368415666b.2
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 03:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787567201; x=1788172001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMBLFUaWOC8QtBFsW6WtJWF6RsbasTFv5BUIHUrRi68=;
        b=dj8Qj+RLb5U0GaCw6K0SZlFt33cOvacfjawLdqrobf/kfod2YVF/04v9BQOrkL7NPE
         s7DkGjvtt9WjWcNuh+MdFXkWuraNzSHeUwr1nZdxZwrKc86G+bA1nTU3WANIs7i4sQh+
         xO8YsWNyKjWSuPdL4KvQaygkKw101DauzADexu7w4j8hn77Ine6X3JUhjHCVevCvphU0
         MQDAFnAKKQI+nakNoAVF0dI5nkN5LxzEZARqOMwTl0hE4Nsd1HdNDi+8FIpLcaL8KK9a
         7ydyYjef2sG+izQLX8Ev/Ijnv3vYuhd1YSHpKPVK90TzKS87bEFsaJnrzgbkqWlgOA+o
         ETHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567201; x=1788172001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMBLFUaWOC8QtBFsW6WtJWF6RsbasTFv5BUIHUrRi68=;
        b=nfDbQcue/whMJ0O/Pkr2hyGEibJvLPdL4yGk8AdDNSx5+/wYhwm0D8ZDHKzdusOtZz
         LwKUXaFfZvcPa4lsMDxVbqwtin2wN0NtTE77VnCKOcvLo/UWxV8JX7aVXVwS/xz8gFGI
         8B6eEsm2D9oOduId/C5oHTjGsAQsrMzURdfyW2GInNCsSTYdcdHB3EtfxlsLi1GdBaQ+
         IMPBcRqEsmd/I3+H3He+bu5GMKziVumWZ7NnWw/Iq0SObyqyKr7wktmgu5yIp9Hic4ne
         Q5O2DKqW149T2akkbxCE0GZL0lYE6GpnQm05jBiZEtWPQUMGS2mrH8i4nSC+Bl/1tJ4c
         LS1g==
X-Forwarded-Encrypted: i=1; AHgh+Rqw9NTEOS6V8U3vE7WsfUYMLW6fsTQhQUjIJ2yB1NI96ufPx4JM8tD8CbsLX1K7dlqqtxs=@lists.linux.dev
X-Gm-Message-State: AFuF++n6TYrI31zBIZI6v7UGAjOAKiV0NRUGjr1blIlC7OFDatU0Gtmf
	ewjNWHi7XQhQvgKwH55D9TK7Z6F9bGMWsKCLgdrQNRvFJ/5aFhG3fjkR
X-Gm-Gg: AR+sD12ZmvfIgeui2wududwwaqnGZQX5YyyFChFlOjZ8kcAsnpKZAecuY4oPjPbCyDR
	zJD5E/CHfwGlPPBE/oCCa8xOADP8+F60I91a+umIOyCyD7C213h9QEvvTDC9uZX/skpYpALbV+d
	TzZrE+5WwizmYV3fFBKRkAYZeS4vpX3fgim4P0o9u1i2NbicnXWyjG+C0ExK7KA9tvdad+I+q9W
	o5jB6acoaE7PyaVFYsZb9ajEyC/XhCZm4K7cyam1KUfXenlG6M4wRM5wZ+cQLdJqb+/g7dBMN8C
	xhJtRvkRfdwCGYXl//+1rsNFc1l5hrYZnnOhHWdI8mSnwir5QbDAhU7KtCDBe00bIBoGeItrVoK
	J7mssJj+ohCe0KmUEToLesnd2nHarZwNi99OZuK1xdt2hZiveECAaGTURvGWzB3vDpso8EMTqjK
	mlpxAduvPF4W++cpAtPkUgpRBxIlq9l/sSeQAX3C8zymT7WpNuIzSGoWIgHkccxSD77plP7L1cU
	L2lMIaPRQOV90k4tUvkGzFbYg==
X-Received: by 2002:a17:906:f58b:b0:c1f:8021:deef with SMTP id a640c23a62f3a-c246a390c73mr2638439666b.10.1787567201145;
        Mon, 24 Aug 2026 03:26:41 -0700 (PDT)
Received: from GLaDOS.station ([109.55.72.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685c573sm1489234166b.51.2026.08.24.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:26:40 -0700 (PDT)
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Mon, 24 Aug 2026 12:26:28 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787566980.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787566980.git.stefano.r@variscite.com>
References: <cover.1787566980.git.stefano.r@variscite.com>
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

