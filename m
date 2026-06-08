Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE1C3CC7CD
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913392; cv=none; b=cZjWD/TbuOcvHnVgAEI2C2aBzC9zhPlgUWIRkZ1M1PeCT4pC6gADp0R69dNp0y8dvg3WEPbYKDZUNpWQ0JsWQBKnfMkAYOSC7XZw1E6wHlKTBEa2PlRzOkmqZPGlNp1R66I+lQiksG3PrMdbZsOwPpt3OXO4xj6YJxaagFxSgzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913392; c=relaxed/simple;
	bh=9BQMrDtO9oBhFvxKCkIkL3CUfDVI9ihp3PrnLxkZbNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Osm9rVnO3iGysDtZOVVk7q8SiedsxKd+MUuItgEP2np9swDk29/K1+UxmBEvKZNLLWRt2ZOev70m6WmSI2tp53dtDL3726hsS3k+Wsikn7TEOp3wTfYfwtzNMP58oGrl0DGyRnNBqNWJBkcuunrL6mhCPzAEGefQYnKTEWJ+BHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6nArc3C; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6nArc3C"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so33358335e9.0
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913388; x=1781518188; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KA39cn/flypWKItQToPQ5sDUgjHNBdBr902xSalTxI8=;
        b=p6nArc3CX8vQJEH6yDKOs5w9ACPcGZLBeR4Ee/hAi+n4WkAkX1DNmxkyTTqPA2M+72
         z/CtNW8C3Ds045qTE6CyC4Z6gOnRhtVvkQvLd4WoXzreBL7CULhjKjRUzXhVXivwLdx+
         6FmDMexQ78DHUiYXhskJ5n1yYHBfMOncBwun+pyEgNkHbwZqLNSTvLH3V76YTFPy/ZGb
         GI6L6WHkSwHxZGzYyozR7iWaMf9xinyXIev2XljNdTLArzR1PpKElWrsIMnZs5/zBjZL
         fVQO2roPiOgMACfAGk2jX9MU6dXyrfW3C7ZSfivXvmN570ZYrI6tcs3K/WJBZBIeTYjD
         lORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913388; x=1781518188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KA39cn/flypWKItQToPQ5sDUgjHNBdBr902xSalTxI8=;
        b=eeM4fgDTnoa9TN+MI0Gkwak9W7tjaojYNZlxR0W6L8xS9+fG7EHwnKhKG3wtuMAcBP
         +ZRD08Qln2UjJhpPDS+J/e8kQHykgMA/d+HEsF7+Cs5YdwfClXI9qQHCQiakX6PgzfgV
         oUVb4CdkTN4w3usqUKbGhNQi6PCfHY90wfeyc/QPQGUKIOp6HBQdTFhAS/Iq2SNETiFG
         bea6Qp9MzAk7gm7m3Fa0yIhTPLAoNIIftu9m590Zg6JppZbiUzZ+JuhuAGLsj7mPCzit
         PYzS+LOrEDpvzJanGu/s+cFzM+z2Im0AvKg6g0wvirQvYQy1uXHPoUFc5hp+CRCDiIQe
         lsDA==
X-Forwarded-Encrypted: i=1; AFNElJ/EQqgHKlZz5e2rf8rMp6+8NNwmOJNq6JzwPlmuX+hn/WKuwqcgVjy1Q2RWEM/ADlJd1gU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzAOoHjDJ7Dj9aw4UA/MCJ1yfD8aSPpWspTI480G7wFYXg4kUbx
	3pk3w9+zyBZarcY9okjSDJj5WZSj9IpdwjQDCgMw6WTEAmHEZZSagqbF
X-Gm-Gg: Acq92OGXDwuMuhiUi+6/1qxyACSq9vPNzFAKaZwTuDzpBZVob4kK4Tc/TrZEffPRKNG
	LFWU/Yc7bGwd0m9z64mrkmxYgUOOQjFztZQl/HbPW4KnOos1abyOiCUwSBEdMkuYXAbSIAkov1j
	U0NE9SWQ3n+P+UH6Ca73VNW9s4Rk3D9aQbXeGWSnek8E1eAXDsJN2t++i9ZvIqircgvT0r2LH5Y
	RscYMx4MjLKOYFdZQc/U6VJbQqjlMBzlW18iFCHtxlxA153yby6TpBUQxqyLTC1EHRUkyawpqGM
	0sggZDuCF/t9JjL8yJwKcm5iTMxW8IisCExKqPFlqKjdUz7eLHLDab5E/uzkirZFsQ6mcXNmIdH
	7Wa6t2pe9cP5bAUoXCRRSHwkAM5+uq9RX2RCPTHw3CGhotnGVBBDJGFXVs47w8IiZKs7HCAZi/o
	6nl1WDv8clVoAjIIinpjk3vDdH9uViWIAlbm61KXlUjWX/Jzoi/0Y7DMEPqg3rT99f8Wzhf24OJ
	gLu2ybtUI/NP4Fj99MLEJUgfwzmIfRHlIHavYsobAT3UBV1
X-Received: by 2002:a05:600c:6096:b0:490:b115:e03f with SMTP id 5b1f17b1804b1-490c25ba56cmr246682905e9.8.1780913388321;
        Mon, 08 Jun 2026 03:09:48 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:47 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 10/14] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
Date: Mon,  8 Jun 2026 12:09:28 +0200
Message-ID: <46a145f964514cf82e340cb0acc38d4bc310d4d9.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index c7073fcb679e..4f1d61c55ffb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -193,6 +193,14 @@ pcal6408: gpio@21 {
 		reg = <0x21>;
 		#gpio-cells = <2>;
 		gpio-controller;
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "rgb_sel";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

