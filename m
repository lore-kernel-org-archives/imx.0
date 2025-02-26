Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772F92236E0
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 16:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588868; cv=none; b=VKENe+IFxEJdYj8VMt7gv7hIo0zSdcCu9vB7mIhV5wov6f1vQq9xE3lYchAD7HDiZ2o4LE7bZPjfRRgIhY/M51vx1tFbnsdiaFubwZGjE4oIYrZ0djkbGNkTHQcUOzCOqHm2uwHdwGv3S8NErUuiPheQoDUltV5c0MFr9rH3ilo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588868; c=relaxed/simple;
	bh=pvVFF8LcYlrlCMpxO/aHUSZAY8oWsFTdA7hLOwF7t3k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AIh/R8wFlil+AMN/nPwHIoQvHAyTUxq7cNiL8QOYIqjATkePurzuVHIIGkRXkFcNj7ChS1Ui5wBC+SXkbcnVgxfDSDHYBUt43YAs7vxPzdC1b0kgwVuiFsvXBah9f/IVQqjmwgG9zFLPfN0p9vuy/jpEBWWX2rALEMbs3F+Yr4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7zbJEtr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7zbJEtr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so426245e9.1
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 08:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588865; x=1741193665; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtGcm5ZWKNh3uJM/zqclGCkk9N3iqiYtET6+2Cl2Q+U=;
        b=m7zbJEtrbeB4qoejATG1CQ88EN2HlsorUK7bjWTjp66e3ZConYI0K69koo62IL0emq
         LrHvt4O69gfSC7sh15gJ4GCp4tsm+AT0CMSjjDhKYEk+/JgebrcZhagjb67hF3Ze8HDW
         KZwtlILbvkLa48ehSD7aUbnOnpYqjEbU/Z0GSMFD2lslG0pYTenqfR/taX2el8C2BZmJ
         CLPaMnED5OAc01yeWuGgctPSGXR2zrOEFD8RGVrPYMLmr0Fl2BSeXZJ4CF/tNhRUlrSl
         PGQ6RtQXajb1PmfohJN7gqVfy6J4lb/mt8UZUxtEoKEVlztt6Mix7ZxzG5XXbgZdQp6s
         PhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588865; x=1741193665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtGcm5ZWKNh3uJM/zqclGCkk9N3iqiYtET6+2Cl2Q+U=;
        b=TNcK4FL/s+yySWwvSZFZlrlWAnj8i3N31Fo2EKkllwxzghpMrF1PUTYhDNRJoem0e+
         P/E+ZXlEgAT2VwovKoAWjqXgGFvNf91343sQRPldamJhGt99DcubQvKi2fqFGHA915Yk
         axGuJIjCBw5pNIY5DGHOkuKBl5zm/CkNlLvDI9ZFTbyb6JTb5cKDZ0JG7bKeEKTD/CWC
         52eEieH0m+SxDmeOuozoEWCBcfpPcFeY+Ti+2VhlVCE+XS0wprpE4HUbDNSwD8hAhJvT
         A1WrXrfYV4uhWVrNEYHjyg2vGzLzpHDo0SkCF6GcRu8kbktTpo0ZtrCmudP1MmwrMxnK
         BDbw==
X-Forwarded-Encrypted: i=1; AJvYcCVnM6qaDAJV2zlZE8lu0x8nnQ3kXy04204JLFRfJV20k57J6eVx9cKRHyml2uU4uU6Il88=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFDOxSJcOqEy8rNzSAmrUdGfKAhzf9MHMpRx8glNFD9hA8wGlc
	dFe8FLzZGhTsx0muSAirUgnAZVOfgQp/hB+Y1lC3d/Q/Y4vxVt/w
X-Gm-Gg: ASbGncsV4ANbw+OIrBm5274V5/mdRpVN1dThX8iUiMxrmnJ084aeP7TskUt+NYRQQGU
	2uCv8NZW1OEsYzXWNth3QdjIIj7uy/Ziyi7maa0dSFecA6pc0CZgKYvgJNGDracmw8qxUp0MmRZ
	eFQ6czo4DRrebWg7BGCM+EmMPzZKeab4V7SAfUIoXA3PdeExcEO+bKfCJhMQz5+KQ63NT+9OH5k
	zwwjZkRClkrCvtFOvk13jI3GcQZHmhaLbJO5e8m2Mzk2mQSYDstuOk1AAM8O3GL6lvgQkgqB7a4
	sWL21kmCbDTVyyIM84EdZCJeZUt/cNXdTbhYbasQSxP8XOdyB3NNHV1lYIlKywR9
X-Google-Smtp-Source: AGHT+IEr7k3hpbUucx2jKL4FfCjfgt288+HwWr+usBZ9kHZQ7fGw05QKWSeEYQ0zCCodSQZ6AYFIxA==
X-Received: by 2002:a05:600c:458d:b0:439:99e6:2ab with SMTP id 5b1f17b1804b1-439aebcfd58mr175600195e9.28.1740588864704;
        Wed, 26 Feb 2025 08:54:24 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba587163sm27672515e9.36.2025.02.26.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:54:24 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Wed, 26 Feb 2025 11:53:11 -0500
Message-Id: <20250226165314.34205-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Some DSP instances may have their access to certain peripherals
conditioned by a bus access controller such as the one from the
AIPSTZ bridge.

Add the optional 'access-controllers' property, which may be used
in such cases.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index ab93ffd3d2e5..869df7fcece0 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -82,6 +82,9 @@ properties:
     description:
       Phandle to syscon block which provide access for processor enablement
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1

