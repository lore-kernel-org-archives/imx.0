Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6255A166F36
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 09:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837772; cv=none; b=ofd1Dc+OyRozmbiuNa0wLk5sYR9wN9mmptrxVW6o51SqZHzQb/oR92S3T0LJGtEt8y40sWbRO9KjMmTG3XjciVFHtyMq+XanD7+QSAxzbeQYJ03yAZMlq8QDIKuiHnqVX/Qw5QIq1mh37VrJcitQ3fiZMoUK5xQUODFDVxqfvtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837772; c=relaxed/simple;
	bh=kIOSKTwBhCJNE2xIsjLzrlpi4h7Kklqz+lUuDimv5hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QvUlmag5Fch6a52RtLnk/UdAkDxQ6LtQMxI1WIMnzMwltSQ8KQ1u/lKd8ypbEUuXGlTKIehrJXIzJ3i/3BLDhgmDTEKq4kQUu32fspUEePcu0/pfEM8Q+LlhosRHPqqXHqJ+YofogNmXyQbbv76HFiQoe2xKkyAP0FGVfXXQljw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AyJZ2u6q; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AyJZ2u6q"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4280772333eso9255375e9.0
        for <imx@lists.linux.dev>; Wed, 28 Aug 2024 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724837768; x=1725442568; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hC9j7IbumBMQnEMKyG95jmRuI5phudBOANwkQ4Y7dbw=;
        b=AyJZ2u6qLk8zQrkS6UWJ3OcUFlQ6Yv2+5UsNlyWqxWfdTZyqM9Ayho6SXJQ+W5iZeW
         xySGRgC9Rm7/aPa54yL9QUV8YnUmEC7m7MLV3caOdLUyzGzqcbGAn865pzNADl5Yn7/n
         iY3AbG6+1ZGBuGdkmJrFiDQ8QzOmX1B+SXiR/kQ8x3U9M+tfCKvvxU0Lr5BTbnExhqFI
         VlkRFOfmFOpRPrDDcu9usja7N/KRZZq+rQrwL87Nnk1AboARJ0A/auTAXATEWzGzs3w/
         y3YV+loJZneuVHUyNIrusaVIHo0NMUUZng/uO43v1XnD+FUbKT5LTwmOurBqw/A8pGd0
         Lx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837768; x=1725442568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hC9j7IbumBMQnEMKyG95jmRuI5phudBOANwkQ4Y7dbw=;
        b=qaGfYccorjno+9CS6uiuj0aMl5eRMbiq5TkdZNOK56CZc07+4D/WKGoYvhmDQqhZA8
         jFsqMYjWVFi4wgXw3xPKZQg86lrwIFfxvVIY+ht6+SERTyQxDXHuvW1MBDwyWX2omzXy
         c9Xz5NGxXccaW2yMPzkZzoYt3BT8vp6R43sJNZIbEIlDiZTj0TeDhg8gUh0ZrQl8+ob7
         Dpk0oyGmvnFF2B9Q2ojHjM6YP/KvUuWOmv7tU6xdg976WHqvjmHHZ7nLoHp/msdN03j4
         LcXGR4tC3hE+R+IjRDY8iD83wiP7PpRcjygNN0cHcvbu/i1sftuSp2d3kLdNJVr3eYjC
         1tSw==
X-Forwarded-Encrypted: i=1; AJvYcCWA508W7WP5ip30wVjPnGSaJ0UqEMd/b1uBd/sJgyXoN7wVDkp7unlbmKP0x4UyqPKKWY0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0vqSoMeFsEqUtsOB/8sSoKFiibZyW9G1Qe3f1ZUYW6RfnPbEx
	r59gMuJyGNYGMdmhgdDekQk0npXHLYsPORd/tJDI+SzWoa3ygDm9Vfuux9+wxJY=
X-Google-Smtp-Source: AGHT+IEB05FnP91FMO0l2HovbTESQKRe9ADpJRmnFhcHlQ0GZzcE4pg5vT+W4mPVe8NOnL+reyup/A==
X-Received: by 2002:a05:600c:4445:b0:425:7ac6:96f9 with SMTP id 5b1f17b1804b1-42acc8a55f3mr70030375e9.0.1724837767566;
        Wed, 28 Aug 2024 02:36:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63d7d3esm15270825e9.37.2024.08.28.02.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:36:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 Aug 2024 11:35:57 +0200
Subject: [PATCH 1/3] dt-bindings: gpio: fcs,fxl6408: add missing type to
 GPIO hogs
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=732;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kIOSKTwBhCJNE2xIsjLzrlpi4h7Kklqz+lUuDimv5hc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzu+BI3YnNLbD7GXCWVvb8IPUEsEVvnR7tGUMm
 fnaF2hkquWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZs7vgQAKCRDBN2bmhouD
 1y4RD/4kIDO9WQFkJe5J0o3puadA1mzoZjLceOTI/W6erd4nCkfkBl8dLOOsbEnNLqQdlS3svLt
 b3P4G7aRcKvhJxZkobZptlNOGxppkpJd4FD0JishQcRytMjO/fFUk70suDUcJBRJ0DjQ4IE3yv5
 0Dt0Typ6dj/ifqw3Y4jRd52LsawOxWfBpSkKGHPgTmpup6nVCsERkF4TY4rweGSasxFVpcXGi9Z
 Pihlg1+DTXQBEfVDFWZe5VuBX3aArl6cHPi9AlV9O2WpvNe2wYaGA8adpUChHqGUS1OQPsJDzq1
 I6FIZS3LCjCEBlFHHuCkchxpWB/3/W7+YqSNfRrS0qby+OCzMH6F55BpTQIAxxtanAJlC62naDv
 9bbxHIppITRogk9zPZTsSeh9IDSbYJ8wFoySiHQ81VlDi1VAnmpPbU7FiQIU+KeLoSGx8woo4b1
 0h46g4jd+wRdqAcUUqgdJ3wexn8BHvEz90abuaSm2KWEDSE+h1iTJ3LNDFnXRszUItkoxtqiqH2
 3HBN5FzPcaPowWVB3iHDgzn7VG6mM25RfaH3NZmvaPkYxoi44gVBwDRhaYzlAkjGwrlCsY4IUh0
 7HhPxrhF21phN/6UOi0Q9FP+lyJaZyhaDn7H33i0AWS30xtf62ttknUHPWO1lQtxaI4DsOwnfr1
 qb+psbOCgQcoMgQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

GPIO hog nodes should define type, otherwise "dummy-hog" boolean
properties would be allowed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml b/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
index 65b6970e42fb..b74fa81e7d05 100644
--- a/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
+++ b/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
@@ -28,6 +28,7 @@ properties:
 
 patternProperties:
   "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    type: object
     required:
       - gpio-hog
 

-- 
2.43.0

