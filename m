Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E339B387569
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068386; cv=none; b=CRBA1sH5LhbDAySS+9RdsnHwS67k5hnDGc0QZaOpxM1AzNlnpU6IZrigsEUbsr3WkuYkw9plm2wapbUTPudXhGN4rSvWO3dopfImMRjQBgSbeY349YXKZfs4vH2UXxK5CTGx2cnNVsSLZ3qf/rrOG0u8xY1gIAaBI102cjl5Nx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068386; c=relaxed/simple;
	bh=tJqUeWhpGTg0obPJtpEawVuUyUQuPSm5Xsr2+4uUENI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOQrWbVko1lyTE///wY+JKrG/q/1WUDA9aj7CCbxN3gynFsyfW3PD4QK0tlOFTYF2+cDvw731pxJlyXYRzYaANwrrIZAYN8L7kzQOctq/zZDwn73JgBu1N3rgrQQH3RfzLRU/YH78/DNdBXMg84FZbJ2OUK0/9BYtdUd5qzPbTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r04m6+VW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r04m6+VW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b77b150aso2269205e9.2
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 01:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068382; x=1783673182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+y5W164dlcrJTGRumnXkL5RSs7h3mqolWsnSZSGBcDE=;
        b=r04m6+VWIvn+6jUU5d8Xpvdhf08zWAayBqAUwW/4bcQpLcOOz2QxSr9xI1sXmlpUsX
         6Q6EgitQOjp/VxIyv3zKLie3yl8zqzJSHTrctTuaZPasnQdAcpRgyGLgAIoofBlQCnfz
         jnL3rYYeZsJfmRGiYHOc49yG6YAGbaXkbV5sgnGFCcBdm9w/xzaZLOmJd+JajSwX2wxx
         RxIjv2zwAHuzjp3xRgseM9whzFp2QJYFzYOoE9jQ72kCs01B8jV5ntMxq1c1WC5Sni1o
         hkTdbGZwhtfxGOVmz788InUKMmGqJAnh4WwUHE/eDOmO6gCFWG0gempke7hAlYYVLdsP
         6grQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068382; x=1783673182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+y5W164dlcrJTGRumnXkL5RSs7h3mqolWsnSZSGBcDE=;
        b=pbI7AUjH4WaPZJOM4jC3zIHxsnL2h0z2P31y1iws4NbbYjvhJKGxsd1N6kzhkzCaTy
         VimkwMBLP5cKDZDWnkwEOk1NnPbE+DjP5uOhsa26ZVungN6r+dkGWF5fi4O1GNyVYBr2
         PRe8AD46Ztl/Ckr6lzoV2NA58QFO10K86mdd0zkzASM4ATgljCgCDn2jaq7l3udd+9zF
         NUjQMq1gbUGXS4Oy+PdrUwJnDYF2VNHXhiov9hzLsQn3lf5EfAo01SZL5eEM3QzCw33U
         luGoiihC2/KEsDCID5N20vMDt47B/skAvGwbBAzQHHMCeOWoc2R7qczUp0Ur9lEFLfP8
         rDrw==
X-Forwarded-Encrypted: i=1; AFNElJ/G7+fYH0Ji0jNRRpetdoVvpaO/ZX9hkMrlka4sC6sMY8POAC422+FnSjeRbcXWwyTzYTI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwKXpGsI/XgQCU7SkQSSUQlzAYfD22fxlu6QuOPDedhCXOtad5
	4/6sClFj7wNkqc9t6/UGRNzqLFfbmsDFqp9B2gj1dnMmGUzurwNm4QaD
X-Gm-Gg: AfdE7cmINH9hdI7UjyI96KnmqS1XD92f6u3pxZIZ2GoaGOSOyPvo4+BX2i2Sn1D6ic3
	LFx4VDQFMtp9wdugK8QhM4a6ZK3/FeI6/QJvpOiau6YaWQHPtMal8060Kq9Pm3x5OTo3HiotD40
	E8SM/OfXpv/Uw0ApvW1U/fMRo6hEeXI6kR5NRYvDSeg/w5YFmOyL4vXGLCCT35Iq/Y9ajq/aC4D
	uZ9tu115O5LnM6ZM7Msy0w56xHoqx9OREly3tM8Y2I1ENhc5Obv+ErBai/AjmmbG4XbHxqFSLW1
	G0MQ0QAI5nTKbC5h1/jHh4sI1b8v/3YxOasoTYxV39U6N+J2IvIJHO0slNbhhc8tM4giyYCJuhB
	T+jlWfgv8bAjfRSOjaUId45OQKFxaFEEL9Dlnwln9xLx33J5CcosG67gSCH0tcxEFD2p3N2xjUT
	/HML1PksZ5AxzqMQ4q/YKvsJniqIfTutqERMzao4/ghwmpEMzOM3EvdcPYmPsD+H2qWkj/tjCJg
	RBEJSczn6wUaXC5tv+MjYL4Sg==
X-Received: by 2002:a05:600c:60a:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-493c3cf8cc5mr79033825e9.32.1783068382118;
        Fri, 03 Jul 2026 01:46:22 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:21 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 13/15] arm64: dts: imx8mn-var-som-symphony: keep RGB_SEL low
Date: Fri,  3 Jul 2026 10:46:00 +0200
Message-ID: <2599c90338d72b3062b36b8c261493fe4ce5e589.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
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
 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index c98dca8e7889..ddd4651b35d7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -168,6 +168,14 @@ pca6408: gpio@21 {
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
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

