Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F9B211A05
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571821; cv=none; b=REYa2+6ujHHx2dbrvf8Qair90+7Q594jA5NUoTzm9kujcVJ8/IpCdDcnYyNRjrG+Yctl4l6nv78Qfnbwt2RyzbSg3tLygg80Pxr+YGmvYXUQGqaceJ5Gi0yceMq14TyCY9EGKblJ5KTuSoI0drsc/lql5fRaFzJLt2yOd+r82wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571821; c=relaxed/simple;
	bh=dosS9pDdgnVcYrxQ6KebJvE9ghDY6SThkSzJfM3JnQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eb/r047jy1qAFvPn61r+rHmn+zgcyovelKh450plg8yz6vl5QqraBz7HfJVk2yuuCdVg0702u7yPUqfi7kilIwB1hWIqY3ZdO/MFFAR4PzK5AFBwpxw1GludSIsbWi2k5mEVysYW/YfYa0J3MaH+9y6WzCV3g3bCOmhc87Tc5X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=2Bj9cIoD; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="2Bj9cIoD"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-9444425cedcso246183039f.1
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571817; x=1762176617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8ni6EXakGblNMElr9yGEmr1BYrUDmPrrWLSAOgcMRI=;
        b=2Bj9cIoDPWCCJ4YD4QKkp1T/fjoj7H9OO07zPablA3I7ll5Q3SlaVZslr8CvASrcwS
         HmsGdIiShi52J15IYKF6U+YfXJXpbT+sgJGW96fHSfDP7SLgZmWS2NfWpwHQFHnrZliR
         GJ2KbUi9zzTx3w55eQKCVK0R6nnyN/uCLGrnQgBG6iFks2iiBZ4C3I7cs6tL03BBzgfS
         MBKKZGrTWNaIc27N0Sc1MBkwtN0icy89s+9fNQsCnkf7cTooaCUNMF2NHRFl4KdYMsXQ
         ydL7tIYkTboFeJLF6k3GJzZ6nwDl1riKsD4kMJ2zOo8jyARbkT0HlwW1uXfspT4ucECF
         8OuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571817; x=1762176617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8ni6EXakGblNMElr9yGEmr1BYrUDmPrrWLSAOgcMRI=;
        b=H0ofCjQdFiXH5bUJGXND3afHfvZkoJYPsJ2QgigKLjvsQxYB+ypMCwPcPw9vHmUGeR
         NqDCpIwP6h7FVlXFZeGPqjxkL9YNJuNv2YSPpZNuVeWHNufluhh1bzk9hutZKeLtTmyJ
         GzZI6ZSE0v4fex+qGstHf+F1l+GEY6IbWR41xiNieB648es3LwGUx3CpCPAMT3J3/xTR
         IathAXRoDcF70T8zMRdMmMksI2Xw54KUC+ppbUe0yldlVi5f9ojCb1rcl0cSSljUaYHH
         pw+pHzAQkBZ2jKtkYt1zo/UNK+TUXh+dgbcpGqOzlNGmJKYd+xGzY1mQaSvSm5hR4V51
         96vA==
X-Forwarded-Encrypted: i=1; AJvYcCV18NJwu0L6LoYUOrubzRAXAY4eVbJMJ09eCzfW1ba56on6q+sK9sXZE3PKQIqdcM0mLsI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy55z0JNLV8CZL7yEJyJg2mUMlCQ6V971SqX8UoQRJufVliRlmS
	VVKaK0mBtT1FOQBJTJCkBwi2+w/eKA0uK2J2VbaKnDkTil/5Dd3En9WkCfWgbTKmDeY=
X-Gm-Gg: ASbGnct8xjRv80ED+6Ep+3vRPM6xz6UiJTIMt7/6W7L06oIX2x2d8jMcQ+8AVVQeHCM
	aJgc9nUogw6ehW18McMaRR1MSeCQNi7cPCzw4QojZAbhjYf01gCNg0ggktDRlv0y7enqoJUAHhZ
	fNwp57EypuRagobCbyAnFS6yqHnvibiMyiFSveknqN7xMGokdFEsN0IqJtmXKv4uFU7BVd35MGP
	uVPYstoywKaKJok5ARhutdOZOrWd0F2a9A10fEAD48XrszZgze6gXUZJOvwKQVpTOBIQUfDayOW
	BcnTq0F90gUsmpDjwKrPEw3+JIsaZ52pXP6oGBpHjDDPhnI+Im1UPIHRt3i4jGvdcKt6gwXh3v8
	ouSOrVfiMtN8afQNYSPXE1D5YSF40R07Z/rSFDTINqyeEl35VXj9xdy3VJsAxVEEIP1VAY+NveX
	4i8ls9qowIV/isiwv5m7eJwqVisuU56oEsSJ3crmtn0Xc=
X-Google-Smtp-Source: AGHT+IF2HAyYtoY7tqjtENmVwo8nugPI2UtLxqpWE0EI0lLCgNJiG2I5oXemQ3pGAy09KPpQQnNXJw==
X-Received: by 2002:a05:6e02:12e1:b0:430:ca90:d0b with SMTP id e9e14a558f8ab-4320f7a8964mr1116135ab.26.1761571817075;
        Mon, 27 Oct 2025 06:30:17 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:16 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 2/9] dt-bindings: spi: fsl-qspi: add optional resets
Date: Mon, 27 Oct 2025 08:30:00 -0500
Message-ID: <20251027133008.360237-3-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251027133008.360237-1-elder@riscstar.com>
References: <20251027133008.360237-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow two resets to be defined to support the SpacemiT K1 SoC QSPI IP.
Move the allOf block down, below the required section.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v4: - Moved the allOf block below the required section
    - Added Frank Li's Reviewed-by

 .../bindings/spi/fsl,spi-fsl-qspi.yaml        | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 5e6aff1bc2ed3..1d10cfbad86c7 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -9,9 +9,6 @@ title: Freescale Quad Serial Peripheral Interface (QuadSPI)
 maintainers:
   - Han Xu <han.xu@nxp.com>
 
-allOf:
-  - $ref: spi-controller.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -55,6 +52,11 @@ properties:
       - const: qspi_en
       - const: qspi
 
+  resets:
+    items:
+      - description: SoC QSPI reset
+      - description: SoC QSPI bus reset
+
 required:
   - compatible
   - reg
@@ -63,6 +65,18 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: spacemit,k1-qspi
+    then:
+      properties:
+        resets: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.48.1

