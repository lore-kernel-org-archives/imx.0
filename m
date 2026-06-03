Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2565247799B
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 12:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488015; cv=none; b=jYOQ2Q5mfLLWbA5LIb+e789L+/w9rCoMZTfE6Bg+1zNhyORRqYa3x1XWK6jrYBmOAg1vs8UQOJ9s5Ys2FZ1nLtdE6usM7Gj883N5sOv3u9kv8D1TxS/jFU5PZ9jpVCEd2cNRwa9igaCB9LPzQGej3KHZryfh/svEAPESjbs7wSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488015; c=relaxed/simple;
	bh=djxdJcvP+/gC7ugPG5aJz7mdTmGLHMqvFmMSqp0LYi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8IBtjIRpfvd6MV6ZVALqZewIp3MkQJ6PR3j5/ani2eeTu7l++ekqL9HurOagABSKRFQoAtjrvHUFvEm66ginAZ3792z1d5yK6I6gK3IJsJV9uLqd2Shc3zaGDTaVj9JKkwKFJ+a6XJ8FQ/m/svyOz0mQt+HK5DFVDA/v9UsYaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6ZA9ZVv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6ZA9ZVv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so11296845e9.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 05:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488011; x=1781092811; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxqoZSOsdKShySi9J5rcifIzmhLS2QDbh6Ass0cr7R8=;
        b=L6ZA9ZVvVC23QONB1wd0QrPUDwpUzDtB7L1g3U36XNsowzid7Sh6+9lqaoeVJPNJlz
         OO/HvacFoIPMGZD3C7THAfhjtArlgnckLFu0HmnDGDrYk1OXKDLLbcFQgPR5r31Cvhnc
         kfdzgyneULmrB7S0shALQGXJTY5w0IenaY0lgKaFpkhRa3KMvXKFn5BTqJ0BjrFCFw94
         YCwx1KbAh8o03RL9Bd7Dzc5O9ySTo+fiKvCVAnTjkayuX0mCvWlzMFFkGKfYTbfY3k7D
         EEh8bPXc2ulhoRcR3OuCXk5t3XloIbMIy2KzQ9ScI5YZ0F/8RROFSymNkdcW/QqHKFQm
         Eg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488011; x=1781092811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IxqoZSOsdKShySi9J5rcifIzmhLS2QDbh6Ass0cr7R8=;
        b=Ej2MX1tSpOUQ8m4Ww2W7S0DtiHNIDUfEf6I7J/CCR4UUUvI208UoKwXe64GajObrIF
         4/J902lP3EboE+9Q/cBLoTpg6dQtSud+wnJBpSxY8KXafQevWRl8i7Rr1KU96ev+IQgI
         5FDVeoOhUeF/vwFcBhsK60GRFxqMljPLsBMVZC+953KevxohGfZBpLxO7ZOdQIvsasmJ
         AFmWzbbRgvzvDgSZ7yH6p8nH7k39wPBskVlS3ATXhUHU8cIz8sWTGqZ6ry19JIvZ7jKe
         uRHrhELYZbAZL4AdrlEfvTp1zdXQAGBKpklY7YB6UFJ0qPhu4hnDNJT/qZa3d90+4WzW
         51zw==
X-Forwarded-Encrypted: i=1; AFNElJ8npHrE2uf0CZGsUpzu93mdKUh0l0tr4AFxAJfaI085q6MOdWIIB5IDiG3K1gcESn6g1hE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/CS0W/4pizug1pBQIuth4TeQqFRzadraUJ4u7wlKrIt7s/Yro
	Fb1VvqEWrY1UYpdTSsBVtIYDBGXOj9SHB5BNWgUgKg1dCFXIRhu8AJPU
X-Gm-Gg: Acq92OFT8amAgf0Bk3RcoW3Vz7RIlonX1GCHu/J3fejw5G/sPePfxpyImMM70S5b2iw
	yogkw/82MHqZ6hArg3e2mogJi2gnbMsgAf4qjwx3YqSZ1CioPCWUZZUonDgxd5l6K3hT+lQvNq1
	RpdH/X6v4ZHBPqfWKbMmRPfIq2X1Rq303HNt5V6lyxyHXaG+NlXsMRwRM/kNErnwtDskF/n8p9U
	CSsYbF7XzNwcZwSsamIO3S4Zs7LhTXNib4v9YixmykT318Lb+HvOLfXhMGLimgm/Asq9w/2UVDf
	Jfb9GHjeoDpc5wKG/E0hwF26ImpSikjorCl5FTWvRlqR/FQY/zKQDfHHHxwfPa/zAG/+o+BktjW
	Z3Fviq1RFTj1hBfMVSQu6X4vkxUo2h3D2V2HSWFMFZIBzRUYxkrhfGkpjzdl2k/XMrBrlIxKA1V
	hNbKGYj+cQ1OtGFFl/lSwtI0Ma6CJYUcrI5/LWr/K1TgrfUVYWGzFYEAe48sQ+Rxqn8meBMUGsg
	Bz4M9ZxnRJ2wN04olA5+CeS7rZBK2bFzdn1+4JrYQLF
X-Received: by 2002:a05:600c:4fcb:b0:48f:e230:1d12 with SMTP id 5b1f17b1804b1-490b60ff366mr49248825e9.31.1780488010942;
        Wed, 03 Jun 2026 05:00:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:10 -0700 (PDT)
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
Subject: [PATCH v1 10/12] arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
Date: Wed,  3 Jun 2026 13:55:48 +0200
Message-ID: <642c165fa5ce0951352d7d164ae7d871120e8631.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
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
 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index df4409af26a2..d796c32f50cc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -191,6 +191,14 @@ pcal6408: gpio@21 {
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

