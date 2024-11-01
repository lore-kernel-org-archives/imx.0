Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C9216F900
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 13:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730469269; cv=none; b=fEcGhu8L9yK7oO3A7k1JG4W25bHiBgtbd6vaJ/MKdjEVGFdB/KbjNMCOJ88yRgAh4RZ3coripht/Y4iJG7hejk1P99mN59U5qHyvUALAus9xoTqM84GQKOc8SpLiEzpNzGYY+8NuuGwcdXTf8lP4LLaZUOXMa3LLnQ6qyyFTV7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730469269; c=relaxed/simple;
	bh=ws4rW8bFaNx06wbD3oHeLj71tdsss9ScLaCwl2/nnew=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T8s5aapbTbFEOSzW6yyBrnI7GxqjGO/yd+yszZO4DxC8YLp63q5GOuORfFumU1wN7xPbl/9pKzfIin/ZFlEPcm9hdTKWz0TNoDQt7VtXlG86e6PQbU5D+L1dF655tbp91RAu+xbp526dM0bdTNGO2S39iwXiAAaNOY8d36FoUYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=in2uBr3X; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="in2uBr3X"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-720d5ada03cso369970b3a.1
        for <imx@lists.linux.dev>; Fri, 01 Nov 2024 06:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730469266; x=1731074066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HB0jyIh0TpM+lkNAT16hmgBzXyipoZwfI6gr6Fte1kI=;
        b=in2uBr3XacbzX48wxHGpfhJwATxha+1YkNpnCEMQXJBxiT26BIJ8xjFHzapG9qoQ6D
         Kk+bD4/F8bV6g+xifedi6XoYs/mw16PCTkGowcPV86R1ISa5Fmq+8als7U3A8DZEVuDG
         YzX1I4Qvjl2lrCRL2hzKu6Y5b/+cZJG9yODfjBYhaBLxIZa35tgvXisZuXc4YwQf0El2
         DVcN/OjlE+5JjfiQc9lqRb0X2lI8ycV3+fdcMPCE4USxI8c9nv9icsrP8H9HS1Nhraix
         yN6mnSU7MCSI5efyZp3UYXQIStpxmZNHrzk6je+4bG6DjYUufkLco/gISRNJZqrvSYGt
         qSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730469266; x=1731074066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HB0jyIh0TpM+lkNAT16hmgBzXyipoZwfI6gr6Fte1kI=;
        b=Av7a+myb5e+U9WQNBak+nIeGCy80eaXbihwIv7EcAO+9JeRtZjkIacL2xnC+ouAZLw
         4SWDHDypp+7u0k4lSRA0KuEYBq3sutuL/VMgFqB99cWUJP+j2Tri1B/DWsuRd/jXgFei
         QV20aAUxd2UNNUB55TQkhZ2wuNeQv+nZiKEw2W+P4S++OEpxVjZqauY7pMV9g7O7wMG0
         1rf/7jDMLnZaos2z4i0pyIfvMHVqaOprOv5/g4lbdXgNPATh37Dl3R4e7FJfWTgq14v7
         E8vtOA8dg3CICWRK3+Y/k845evX27hDsdYFskO9VUdaal/kdea80vTvwGiFRUajbmOKz
         mXhw==
X-Forwarded-Encrypted: i=1; AJvYcCVMi0K9hOaMJET8aP2bO0sAT+DONJ+t0F1jheDisGQjCGTBqm3IaczPNXu3zPeTBus3lOA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyfzjmoKXdnYCQ7mXFYug+/9NTVI38aI1pAoTuMPOT5h6jVeA0
	EBzLKNfaaBzbdLm4/1fABCBM5NJmaVCB38RCh842PISA1tWzWMPR
X-Google-Smtp-Source: AGHT+IFDJu2muMMX574LjGpxqR6z30/n/2YRYNEjaDajZtXr5fX5zoOaIGrofmuOBUvyB3txoWtOUA==
X-Received: by 2002:a05:6a00:2d9c:b0:71e:6a57:7290 with SMTP id d2e1a72fcca58-720b99f28e8mr10309705b3a.0.1730469266034;
        Fri, 01 Nov 2024 06:54:26 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f81d:d4e5:9f89:77f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1eb3a7sm2656270b3a.81.2024.11.01.06.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 06:54:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	andreas@kemnade.info,
	kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
Date: Fri,  1 Nov 2024 10:54:04 -0300
Message-Id: <20241101135406.47836-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

imx6sx.dtsi has the following lcdif entries:

compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This causes the following dt-schema warning:

['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
'fsl,imx6sx-lcdif' fallback.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- Also update the example.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 8e3a98aeec32..aa3204b6aff9 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -19,7 +19,6 @@ properties:
       - enum:
           - fsl,imx23-lcdif
           - fsl,imx28-lcdif
-          - fsl,imx6sx-lcdif
           - fsl,imx8mp-lcdif
           - fsl,imx93-lcdif
       - items:
@@ -32,6 +31,10 @@ properties:
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
 
   reg:
     maxItems: 1
@@ -182,7 +185,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     display-controller@2220000 {
-        compatible = "fsl,imx6sx-lcdif";
+        compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
         reg = <0x02220000 0x4000>;
         interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
-- 
2.34.1

