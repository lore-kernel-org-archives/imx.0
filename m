Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABAD20A5EA
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 02:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757469948; cv=none; b=NfpnaXzdCytYB4xHJnp1FYzNUiEe4j+4QJ0Vmt2FHnVqOQp5WBYqKbLig7ziPhheTZ4q6aNL3jd+aSLoJFOF63j0yxprO65DJU3AFaP3j8WHbVmigiljixPpD39gfOUOqNyivrsaQ2acs1JMx76AEH9BN6DjA7WThaG+ANTB4gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757469948; c=relaxed/simple;
	bh=xkJEEW5j9QHyLAqxT0upkCjVdPeAqyjifvngrl3OIJo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ir58b9XvInc2tnZcftnF3XiEkdJqUfUC2d97g6zl1P6dRl0ufiYZTcMwz13VcEq2gchmircE+6MaSCduHEXy+v1cuoQgcXdqnhoRHZd3RJ25SABP4vXSri4Tkciu2eHRx/X3iWSdkjwC0q9Sieyxb9rP6tTM7sJBqwD9JaKyq1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fWNLWoIK; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fWNLWoIK"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2570bf6058aso34426255ad.0
        for <imx@lists.linux.dev>; Tue, 09 Sep 2025 19:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757469946; x=1758074746; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zo4VEbVAw3LffR1rR6U74a6Y8xtKLk5HFuoBic2yQiI=;
        b=fWNLWoIK34JrzwpqQjbuZ2D93H86Yoc3Gltik6cgMCaaQsieTFOmHLSkFxOJ1+QO0i
         AZGWdev4aqjfUmNzLFQjOgLAxFQL1sZGn+wqTRu1beY5qwo/ib4luUSlhRldsDS9qawZ
         AAv5cV/2sHoQj4hesLyxOz3ITOAt/z1UjSsDnHbffDmnOEIK3ZtZIpgpMjtq6Jlcimxy
         10Fzyac02aJ503VfO2iRjPoKPCZBH4KouKDoHNqJA9QrZgZNe0bmbDFMdvW2WkNPGdOT
         jOoSHLhDgi6jEFSwDjM+bGC/H7osNJhddB+XsE//HA+woYgYPGa7RQPJkOJ4rgjEMNFf
         hjhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757469946; x=1758074746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zo4VEbVAw3LffR1rR6U74a6Y8xtKLk5HFuoBic2yQiI=;
        b=wY+dbh7VoQhptOtQPRahOuW5Okp40YXNi35+9QCvFNjRgSF5NFdqoFdaPDWjEpaVZ2
         OXH2VQQgk9jc88TuHlGHb46gwwafISLnhs736kHTIdCaNHunNmE1F1wLOM/A+MiiUmyU
         RDXV/ZWCww0NtL3cop8de4nmexK7rQ8728xgDVEKRUJg4F8f+9WdHyPVouELuV8k6jFL
         JQXGlD59RqAREgmF0Evm8qRYyCWoeSqifPNc8JVwuLSPN+fv/e75tYQyjkMrxF72xOAI
         ZpxzvUUJc0lTxVdcoiNfnnL6p+emEasZcbyxzOTCelWFe0/Z9GRFJ+Th42KkDBbhbZrO
         jrPw==
X-Forwarded-Encrypted: i=1; AJvYcCVup6uhwbFvEmFk8omCA6zY09LDZRp794y4+0kd2VyfQwDYc9qLKn+LO0BsvEJUsHca4aY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqeIj28T++E0/JzCiN+vwYKls337RPz26HEvZf32xbM3BmVNjj
	z+gZA/NuhrtxlOH2WxBF2C9W/Xn8wlMMuTjXB89lmB3juf05O6VdGGGl
X-Gm-Gg: ASbGncvH6tJLqbcIY/6r91s14R6ySKluQpxT5SbZtUqEyg9QXp0GmjOXuuK8BGGAKVY
	16hep1aWbXU8LPJEAaKkliqtmj1PymFyUSyWbmQou0tLlylFOb/P56y7lc1jnmDBir1RnY+F0xy
	QT9FmkhtH+kfcXz740Bzl3OF2rzNeBUOLH8q/lgY8yru/WcpSzbuwsU45hRUgzpHjmsc3hVn5GD
	YPEeOs0a8GULrEAmCTrCO7F0SaRD+FmOt/jd1WXHKdIgMd+o2hqguHl1dx/jSxrErnZWZitUfNz
	4AJS2ECkOyHdXh7va0XfHngSTXcVz4G5cYwKwe2r87fbqebQ07Vo0HR3xxwf1KWxkGLEKUbH7ui
	ZmxX1UXvvo4j8z51OPuPRmfaJAO3p/1H5EMNKg0+i2lwUFOsYGYR7X6WRlw==
X-Google-Smtp-Source: AGHT+IHwgIhELapLj8nq9Y1ltim4kH1wGUB2p36Co7UlpgEMhsiFminC6HNAiT+4BLErxh/4zd/+aw==
X-Received: by 2002:a17:902:d4d2:b0:24b:1f34:a64c with SMTP id d9443c01a7336-2516d52d12bmr169999525ad.10.1757469946427;
        Tue, 09 Sep 2025 19:05:46 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:58b2:c9cb:20c8:e698])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a27422bb7sm10607735ad.30.2025.09.09.19.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:05:46 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
Date: Tue,  9 Sep 2025 23:05:24 -0300
Message-Id: <20250910020525.342590-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910020525.342590-1-festevam@gmail.com>
References: <20250910020525.342590-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:

compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";

This causes dt-schema warnings as the current binding only
allow 'fsl,imx6sx-lcdif' as fallback.

['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long

The imx6sx-lcdif programming model has more advanced features, such
as overlay plane and the CRC32 support than the imx28-lcdif IP.

Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
fsl,imx28-lcdif fallback:

compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This helps keeping DT compatibility as well as using the more advanced
lcdif features found on imx6sl and imx6sll.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index ce31b873fb95..d665f3241e97 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -23,14 +23,18 @@ properties:
           - fsl,imx93-lcdif
       - items:
           - enum:
-              - fsl,imx6sl-lcdif
-              - fsl,imx6sll-lcdif
               - fsl,imx6ul-lcdif
               - fsl,imx7d-lcdif
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sl-lcdif
+              - fsl,imx6sll-lcdif
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
       - items:
           - enum:
               - fsl,imx6sx-lcdif
-- 
2.34.1

