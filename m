Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EAF3C3C07
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 22:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788216948; cv=none; b=P9M3aUzGug4gxMh82PjdH4cwmVy3VCboKU1y79WF8OPKD45thz4uHg8GjRNww66nbzPJpUsJKJxpID1c10ZO8JFZcisF0jdLCYem/1/JHZj2uvO9en+q25JttmweVk31mtqINyhyTZJAvMuE+buRpdxdEnA1Mqz+2WRnSX0NtmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788216948; c=relaxed/simple;
	bh=dhXJ+FBhl0dUtNLwfVJ2+FMZJSif3+49a/oOSrqpjqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rTxcvmSQeTHuaaG00HCf5LTKqh7Z4RcYRhL4BR1dOnJNZ9dQvz1Y7AJTCpdQWEdVNWbqPn7iSyTeFpa6ebM57rSbc3gu1OSotEW6y3KYrLWzksxtZWDkckR9xyAg4ys0Lty6BIcdDBBDD/Hfzy+qN7S0hRXEWGSf3DUVZ/lBXXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKF1SrtI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKF1SrtI"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4957eefd361so1994175e9.1
        for <imx@lists.linux.dev>; Mon, 31 Aug 2026 15:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788216943; x=1788821743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrCJwvq4FJRDCkfm44Ye55Kq5POR7NnqJpsxGpwWsOs=;
        b=dKF1SrtI37PCE3w+l5H8h3UchXFPGvuWKKL+EiH0qm6rjf1RWRnAqmodXKcTvLFYgK
         JHXPpqcgnn0ZeaQciwMvBWW1R2NCiP90exdYHeDnvBqfbcxQKHxtuPM98za+0Vieuf0p
         Lcj3NSa8WPt789OcBRR/6U0HKzUOFNq8ieSTckdMerLQ4wIYCBBy0ZjLrxmPcyz4VNHX
         rDyO9ml8R9l8tUcid9iFhh5siC8oNButu23z/1w7mBJ/rXZOfrmGS2phWClj0Hoq/dE7
         hiTR6LSiFStITfLCEltV8ZMvt6v17y6Rupyb0+lPNZZXxVH/DujBAks17TlCISw8txfM
         w8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788216943; x=1788821743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PrCJwvq4FJRDCkfm44Ye55Kq5POR7NnqJpsxGpwWsOs=;
        b=gse/e/4/Qy9ZsSIO7DAcuxbC332PbQeq5HeLT6nMzsFHEO27e84Xg/JPx8IrHZrfWy
         W9P3zw6qCLzt2H4liBLaRaHgS8nhUJlDqBM7dMQ5oRPeTrmzKEViWx2CKYgf7F+afztI
         yh/5HQ08OF69a3hsSSRI6NiWP2zOptOyCJLCFJg1835VCAxnRHv/F3WAFCBylCTe1ST2
         A0T+R2rUxBrAfkoAlWMZL+6iOwbEQZZZgNmtNuxT5B+wjKrxRcraAh+Is11ZtpJZHkRG
         zKH9XzITzNJfEKbGc2eLH4yh8jHjv7MmeOW68mxX4sVLcZeKIo9PloC+UY0xlUSpD8Fs
         fvIg==
X-Forwarded-Encrypted: i=1; AHgh+Rp8Jfd/KuILOfL/G6jTWZP/teY6Wu02m72Tv9SiICkZ0+YEIJFu88JQTHPRHuWxcUcOWH0=@lists.linux.dev
X-Gm-Message-State: AFuF++lQOo8tWekEyl+NuG0AosJJemOGkHTmMkxeiH3EZeEJUXO4e8iJ
	w68z5bM47vuJPI7vLAX629IfNlAZqrdwvKS7y7vof+OvxctsDRu4McpZ
X-Gm-Gg: AR+sD12qSn1BqYV5D/0eIwTnXMLpk8PxR0vF6kTaq9Sarqi1bUrco9QmmzXqKJSQmRW
	EcF+lXf0bie6KcawTTm3fodD2G+U9fnP7H/A7M2mwP8PHXEj3uAkTIcs8WRWHEErK/Ux3HKzJJO
	t3EAiLfDUMFiqWMlWm2AfTe+xA8YLpHaojn5sLrNFnKhldQafoYMRjYjGchwhvLtxPe2if1d+EP
	yU4aIlcg45LgfPLKNa+aNZHZOB1Snvc28ND6nW7wohqB+gQQnfxF6bP1ZSuqVopoKVuV5oU6atC
	nieECukIPJlWeWjuG7xxJxBbFLKoGflxgj6e9iXZEpr+Fl0p1S/2kJibvF1l4wwAgjl9amfWs3C
	ldTG/vYc/lv7XtkdbKloUOyQszkncOyr3d/fB43b2EDR6OdncBcZxl/DbPSdUAclfEVjDIkY5E0
	E/Yp7oDTELNFeggqL0AEJgrtJpBBnuTADgJ41y9+t9VCQ9r5u9IzqUj50cDukS3Z4LzlFp/FuzO
	IzKc40ob0z/aaGmUwo4ZvLZag==
X-Received: by 2002:a05:600c:1d15:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-49b91c4338cmr399173455e9.10.1788216942522;
        Mon, 31 Aug 2026 15:55:42 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm24452615e9.4.2026.08.31.15.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:55:42 -0700 (PDT)
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
Subject: [PATCH v8 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Tue,  1 Sep 2026 00:55:18 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1788184274.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788184274.git.stefano.r@variscite.com>
References: <cover.1788184274.git.stefano.r@variscite.com>
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
v7->v8:
 - 

v6->v7:
 - 

v5->v6:
 - 

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

