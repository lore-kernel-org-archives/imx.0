Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8D03E022E
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 10:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284189; cv=none; b=J4+zkdbwHwKGGi0jh+TSEjVjZv+5qawlNR7A53UbpDdEZJfLIajlrYOKyiHldDcIs5/Uo8rGskTCLrxOKZD+XB1FTCKKb7qDhv6PNwi3R3AIafxLPk3Fa0fiexIDl7upYYOSOjbWg63GS4d14Vi8r7C2d6gPm2/yVmiT1Gxswy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284189; c=relaxed/simple;
	bh=85Z+ABgk8hWRiWuhGirsBv5g0ll/rHLrkR1oDZSccgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uiYqdMaqqHPP60z0WEB4k7/MBadwQtiRT9xhjMnn4C6Qehr/qdXTtDxxSihl/8UZYhJYpNnARf2gNU/yCHilqC+tAFlVCSES+UupZs879lgG1fOX7dWAtPBuivfzpdM88QC5mUBcOkUb9c92qgPwt69si2VjwgsTcFKIcjW4zUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0LRLxTt; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0LRLxTt"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so3368303f8f.3
        for <imx@lists.linux.dev>; Fri, 17 Jul 2026 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784284187; x=1784888987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reAbcqldKsv6m4zky3LvSNbWtVKFu22JGjwdfklQwuY=;
        b=D0LRLxTtMiEohlyfAzwQ5ooYhLiFHW5xG+vrgPrA/7s5uI8/+gxWJqMHvXOKA+yVVL
         6kbIo7Jgib6nSOEZ/0JSsGxq1xLa8/d71S5dq71HGlntZH7V3IaCVW06n/4w4sn9qPAu
         C9ZhlLa8UVhN/e7oU5SiQjtdTNJnjlTpapjWPItjc6uothspqHzJvzxxnyIsyMasAPnD
         CFrB+fRFBMZ6/YqCemFhj6Z0KXuZIaHzFwZEcUWad1U+0ogKILiMI/EP3K6AI4Z36Fw8
         zUM88hoBTmtu+bpWtCL62Jgzk3NEJlfQqa7VbcRZubyRqht8TF45ajn42j6C68GuYsH+
         tx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284187; x=1784888987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=reAbcqldKsv6m4zky3LvSNbWtVKFu22JGjwdfklQwuY=;
        b=J8meBMpzOnI0TRhXx5HRvZLz2Yet/ntPauwsdJcxFYBO1/DDbJ2Ql5sngmvTwHXov0
         2cNo2foPoAvNSq7I1EdDFLvGHYzQ8Igz+NqSPyQVxHlI4EQRtPcZSIMzphyxnhs8dSHV
         Osgv+xvl7dnTik32Fmm3998txjjhflYSTy7jTiiFhZ+gs4ooVfZga/39qqH9jE14ZSlO
         qs4jpfO9sa9Yy5eymmbN3qWJfgTLNwXYSrT0cu/bLa0YTbsJZgFD4VUoHAoIl3wwEa4T
         jFe8yw7f+XuOaPO7CHcROAh61SSFYJBee/sqgUoO1dtql746X3bgAtHEoYsgPwmmQSTi
         Q2EQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOs7Yw2u6L9Ddyum0RqS/8VR2WGRAWo0ImSjjSlC0S+tqcxrHtrVMNNLnbhFPajCIv0Wg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeXqP1rcHcxAWV0N+d6VKmUCnarsjCQB9PrCEPLTqmxREwh1AL
	BM/cbR4hcmaGGUNnrtZoRKfOW983TtDX2bdA4M+jzewGoffByc0BKAh+
X-Gm-Gg: AfdE7ckXpVLT6fCqDIvMLgAI86UOXpkyYDrgp5CpukJUvGHl3BHPia0GRHDVPbZ3fFK
	hHXPaKQATM3TB4Ks3l6j94w0sGWUOxt438sEu8HkZqF9qkdmNDqT3Qqjpxef5AT4YoB4QeviBmO
	OCMYMp8n1CrR91jw2i22bD+qgAUABnL4rjiyXo4G3F9wSzKyvYKyhdPgqzO4B6cRRekgRmi80Gb
	inQHNom93yS0LP8+HKWJUw2iuNv0AcPA1Cr+SHaspycDjzxdfjHgHS39kdr9RT/2+YiIDyNEHb4
	2OQR0aNC6ToSX1CYPMpehTgtFKoX+Eu8Ur5HIJpd32p4egY2eEiXQ6mP3aqUoPVglXrkxPOZfsR
	orMfn7C+TP+4lCADCyv3NqPNZyGC4jdnCjv6IA1/YKK2DuNOo+NmryVY4dOLg7XnlbRGqgdBbU3
	u6ZVQtl9grfFHXFDjX5i4mnJMgau8+0gncsoIESl9bFgBJRI1CPWYp3hrSX5tM0pCPNDEl3pk6q
	nJ7N8MNWIlawtk=
X-Received: by 2002:a05:600c:6a8a:b0:493:e46a:ab with SMTP id 5b1f17b1804b1-4954c9a0684mr6578525e9.34.1784284186204;
        Fri, 17 Jul 2026 03:29:46 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49549a3f07esm39931735e9.6.2026.07.17.03.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:29:45 -0700 (PDT)
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
Subject: [PATCH v6 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Fri, 17 Jul 2026 12:29:37 +0200
Message-ID: <488d2b31400d2814b8c7d61fafd02a7af5ffe443.1784284092.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784284092.git.stefano.r@variscite.com>
References: <cover.1784284092.git.stefano.r@variscite.com>
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
index 7b57a6ee1b50..52f08bc1f8ea 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1393,6 +1393,12 @@ properties:
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

