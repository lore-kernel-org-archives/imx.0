Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF17520D4E2
	for <imx@lists.linux.dev>; Tue,  1 Apr 2025 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522354; cv=none; b=cB1UNjZXM9byR4xBOZ/2m3fIa1ajWLTC9h5tjpvIMA4kOcr0Xu84MNCegE8NE0n9g5bUabILY5pABngtKcYHE70bR4oiX0v16Cv5pghARsDSZDnT+6+UMUaKSaicxnez3d+dkoISaEagXW+VZUiBi6dROAejyIzX2yHZlH8CY0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522354; c=relaxed/simple;
	bh=jtozxlDlFArb33Vwn4r3NVMWeWlV1gMBeUBT/QzmsQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kWoGVFuuVTh6O3yZJsOvZi9iSJzwhZsz8vD1J6KZ+E2E2K/d7A8fTikjkEycgUfdY5QxzRzGaSHDAoOisfikh7m4x+UL5Y3deMLbNIpQTnJp6kKbLjeT6J/wTM3p0Pa7ppiwxlIIAkOQB6Z6z6mZlB7F8KLqxMuSPACxe4t3EGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLpbyrjK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLpbyrjK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so57599435e9.3
        for <imx@lists.linux.dev>; Tue, 01 Apr 2025 08:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522351; x=1744127151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=NLpbyrjKrQCbafMgjkbrSdZuKoCPmTo/GLWCljZ+bBU3SDH5b2uWauAFy9GDsaUzFr
         aqAamWVJ28oLL7B3ksMnOo00gRqDInb0xXFndHs9+td3hVu56OqMb6OQCXSPiDzMwpGQ
         ndesJVdtSiDEw7uucJceprhDPN77jah4qlOEZeVxDA8yGEnrBQkwkhlcexzUOALtbdni
         cTK52U06N7l3i3Kf7DmuQvjMj0zvT8wDzkR+mLf2PN6xWC3ZimSC8L+lL9WhQ1ZdTJb4
         qfL1E5pIbNsXgrILq7QibX7jQue2aaHlYdkkR498otpGMcLWqYFR+wD+lezC4V8j4pIn
         gpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522351; x=1744127151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=c1rcPuNUEMb6gGtdSuM2/oQQeLRl2jnnLzQgVZc6uCkwglku/XPa47TveFSoNOX6aM
         68LFSGOXhK/dQsUnniXUaay1IrhhhlSjVx6Ntcf09iI9NWxiAI404kWKgU0fK/e9r8qP
         zrtjwwIWyP+GoF+DrUVn8fQQpK+A3JayzBgI5TeGQD8Ij7yz9I8m/Dpiq1Edbv/asXuW
         yshA1uPUFKoCcijegmSkYeDnPsI8aOz+Wzm+6Nd8nT4L7VksepHCNIUlJ++YO4U2pT4r
         DRAV5MTD0L1un4Pi/uBgiExurNZ0m5gAo4hMg+ozP2kO89gQhjjFFfeYyA9GRnDsmGAD
         S8gA==
X-Forwarded-Encrypted: i=1; AJvYcCXGM0/7LGmpzARuMqY3E5sy/dS+n7RwovzsGtfnFIe2mA12j5y39uyJR0Rv/dWh7cgyDuQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2PGK9wBH+Oa6GQpNorznTnXsKi+kGsD33ARkd4kQFR6RtWI/4
	QwZv5Y9FMi1FYCYKxe6SvItHZDczboXq8F9L0tGdZNaHxapOUv/H
X-Gm-Gg: ASbGnctUTBN5SpGGLc3iY5dBAcxeUgy8VIOFbuq/zzJyGuSZPtt/J2KbcvyRbTjLZX9
	kkCkHTtfqrufXzNjsPWQ2lR/e3YNzsh5MsLum89ILJ3Q8GDK3zm6+c4H/wOmOS20pcnU/13SoAX
	N8gS3+r9LhWJ9XirY7OQcrrWetKU6eV2U2EPqwGOZ6lgil6RQlg70vaVB9WcYhomLOKnXdDW+XK
	8jVsvLCuLIY8kmAXzBgAFm1e3MBq4fwLW/zzCSk34mCM8l8IvBbA9Wb/DWu4DJ6IxoJ8fZ//lMh
	uLbYsrhjJdfW5MVX4PLA+yo0F41Ha2a4RJxon/qCNwx9cTj72jgOqADGrMc+Nit1iWgUHqiwrCR
	GLol8A74=
X-Google-Smtp-Source: AGHT+IHGjpv3EKCnHFF5eKJe9tjoaQRXwwsvagQBmS5kvWyHdixkP+Aak1uOZaWLdm7A5+xOdO8cRw==
X-Received: by 2002:a05:600c:310c:b0:43c:f575:e305 with SMTP id 5b1f17b1804b1-43db6227bb7mr114695995e9.8.1743522350993;
        Tue, 01 Apr 2025 08:45:50 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:50 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Tue,  1 Apr 2025 11:44:00 -0400
Message-Id: <20250401154404.45932-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
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
index b8693e4b4b0d..e610b7636a08 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -91,6 +91,9 @@ properties:
       - const: runstall
       - const: softreset
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1

