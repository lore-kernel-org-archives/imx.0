Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EEE6F2F0
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724575793; cv=none; b=IcfYfIfpA7hEcmEv09sGMJnE/xMvjB13VXydVgBtZih08JWML2phmHyvcPA/dLVsTo6GBMqmlbUlcQZRHcZC8m/bvfGtnfZPKWngchRiszH8jmki912LJjKiOf+R6pqgr3kNCXeRJRCwNoi+OB6WprLnvvN9cu9jb45ebNQv1wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724575793; c=relaxed/simple;
	bh=jFbZBwvOwRIn52AfzwHiXcl99jHNvWYflv+t7ict3Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m9t/uMPNvSoNmAoru6GL4bWvCMOx8P/6F3OJT3Pwgs3gxOBE8Ge64ZHYmtQrt4/v39J40VzuZ9QJWfY07EeUP7YHm6LSIZTSotXqEcx8Npu7r8PbTGXMbKl0FY8Wns8AXPAxYGOUcokdUd3UjXpaVfRLgMZeujzzJPFU7U1VEqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KYfcKZoj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYfcKZoj"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4281da2cdaeso5163785e9.2
        for <imx@lists.linux.dev>; Sun, 25 Aug 2024 01:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724575790; x=1725180590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EFcadNGvy7x7r92tr7jHWl9lbifMfuT6t7Vxj8SP/Jk=;
        b=KYfcKZojWWpBg5jh1XxRTRlyAUvBhtmA0+qUYYv6BBfGuTaGbUhv3NTCErMQj9Dfns
         O39V7WO03DpS3IBMhRXLkfFxAZyMjzEIubscv5qmbJHw8mQpX0oP9R7I8Ds4U5B8KOpZ
         XCLkVLiAwUAVRCqa8ShBZaJZc+6uLUrzi/cJuwMvYpBPrYoBbaUpFe4saU+wOkK3MMue
         vNZMzjvhB63KmAZd4iwqD2BWd8HQbAl31Z8rm8rZKAZy76WZUh2d8E22FT1I4fym9e0P
         fAi+xrm/dCz052wS0ToE0Y8yF4YBI1oTMfy1VRIJnK8JbFDn1IeRclKXhSszjvPPdVKd
         Tlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724575790; x=1725180590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EFcadNGvy7x7r92tr7jHWl9lbifMfuT6t7Vxj8SP/Jk=;
        b=IB7KR/7+hX+jD8IIvFsSglb/NR7Ij2yax/TgztfoC+bgYuO+SuzcLE+XYB+frlKXII
         pTWax2wdIATSe3wgr0ccgOyJ7zyyTDWxcJXzUSWn60/nAVAvUR8pQksQVk3zmYFrl7ld
         lqVl8C7rw/gcorY9JU6j73AlYUEoaUd8SCyVAV0Yfmf7mBJ8i3A6UxX1ef/R6JlutWY8
         Fw99xKyb5S32ysX9VBkLt/WfJKc/gt2XqysmSpEO5CteSneH33ObXZhmGjRUP3WxbVw/
         +C4/dldZtGwIGKkPKG5awzYVYmNbBlZtfp42ceH0fwhLDpwR4iOdWTTAJPua5xiXhmjz
         u+gg==
X-Forwarded-Encrypted: i=1; AJvYcCUR6X7feDGpRfOUMDC2bUHxvx1VFHPk0LCB2zh+wrAMj5WV+9YwxhksHeAISJniFslZjfo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxEOijUqJXpeyfn+Jz2ShL56uZKSgMrQtA0jyTXd6cvb8IOGiz
	wZl6j4rbhi55emyz9eeKhCXaXOkPg08av0Fbvr3/PtHM+HxBNfsSY0eilFbRU3U=
X-Google-Smtp-Source: AGHT+IFqH0eWasXxHm3lqwZoRqKEelIfT6oDSORS7GZS6+5bcKfRtIe6ivTGxioz5piGW5U07J9kWg==
X-Received: by 2002:a5d:59a9:0:b0:36b:36aa:a14e with SMTP id ffacd0b85a97d-373118d1d2fmr3033528f8f.8.1724575789527;
        Sun, 25 Aug 2024 01:49:49 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730826b10bsm8108269f8f.114.2024.08.25.01.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 01:49:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] imx: MAINTAINERS: correct TQ Systems DTS patterns
Date: Sun, 25 Aug 2024 10:49:46 +0200
Message-ID: <20240825084946.20457-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix file patterns for TQ systems DTS after re-organizing the ARM DTS
structure to fix get_maintainers.pl self-tests like:

  ./MAINTAINERS:23329: warning: no file matches	F:	arch/arm/boot/dts/imx*mba*.dts*

Fixes: 724ba6751532 ("ARM: dts: Move .dts files to vendor sub-directories")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Shawn, can you grab it directly?
---
 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7cb909ffa1d..6574b4910f8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23326,9 +23326,8 @@ TQ SYSTEMS BOARD & DRIVER SUPPORT
 L:	linux@ew.tq-group.com
 S:	Supported
 W:	https://www.tq-group.com/en/products/tq-embedded/
-F:	arch/arm/boot/dts/imx*mba*.dts*
-F:	arch/arm/boot/dts/imx*tqma*.dts*
-F:	arch/arm/boot/dts/mba*.dtsi
+F:	arch/arm/boot/dts/nxp/imx/*mba*.dts*
+F:	arch/arm/boot/dts/nxp/imx/*tqma*.dts*
 F:	arch/arm64/boot/dts/freescale/fsl-*tqml*.dts*
 F:	arch/arm64/boot/dts/freescale/imx*mba*.dts*
 F:	arch/arm64/boot/dts/freescale/imx*tqma*.dts*
-- 
2.43.0

