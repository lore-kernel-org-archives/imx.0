Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E5822DC48
	for <imx@lists.linux.dev>; Tue, 14 Jan 2025 10:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736852147; cv=none; b=qITIdKFl6DFXpgT1uDuvXXxp0KOrP9sXB9U5goeDqCLSuNaZh2bfhdU/3Q4h3SqI0bb5MRCTHD2rHjxidsYhvU14/Y0kgBpbpFAxTGoIp3zDz4CzowuoOLYFyHp2Nhq1MXxhNt+i2GpX/UgQbBSVt7sIqiSm67HvYCo9CkYiTpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736852147; c=relaxed/simple;
	bh=aSeZfaDwSFJIY4/vsKGZDV/+UPdIWOSQQL1Wnz64dx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hd3dumMEdXe4uIW3TtdvX9EwjLEWbHjRTHYSOCsK9gj5+Zq6yvHWgoMB0nmL7lHG5YfagzxhaGk11SFCsetRN4s0Mm/u7w/q2RjSKA/NearVZWDKxItYvn6JmFkd3Hla68JJX5Rqj/HLe9qsPjHjofT0jkffc6LiB9XOcncCN3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MlkL90mX; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MlkL90mX"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa6965ad2a5so76535866b.3
        for <imx@lists.linux.dev>; Tue, 14 Jan 2025 02:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736852144; x=1737456944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3rqPuNp/XAiHwmx1Pu2LDapqHlVBx3ScWZfxCOYmYA=;
        b=MlkL90mXLq12mPfYyAQ4Srn93sfbNTiaCkBYWvZG+SXPII0IObh9EF4QTp6xu2XIV5
         mX1sl7xqfni218upDNbOQWxZ10PW64DRzsywrXldtTeHKb/qNlNRE8vPBAs4vruaeD8+
         y1hBgra1aJ6m/xAlQMltvHaQgL2SzL+c+rf3jFmifWYPfdbDGF4p/JXlk2YU1RjC7Bgz
         sRekW21Y8rDrQdSxnqH45c3I/hFxpU5iZaV2DZZrtXGfoi0z0SJk6NspVvP6YnTCuGYm
         EPhnuywTMLoIlNBsgQ3UdhiteElHRLtqkA2u0T6hogcRjPQlBk9ZDL8ozGSTuDMRwD73
         5mHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852144; x=1737456944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3rqPuNp/XAiHwmx1Pu2LDapqHlVBx3ScWZfxCOYmYA=;
        b=PxcfE9/vz8TOK3tXvOcPDdUKNorTjciat8O6FJqqyHvxwPwFLmB6c6urv47ACWo1/+
         sWyuLPosOTPr8KyiKpY2LsZVnMPcHaRi3GMyw5m4Kh8h8Imf84FZYGMenZzOEYcFx8tq
         dgccLYzKGxt91UyMCF+IfvzeACyDD6u3TenP+Zp0tI/UJDpt6fK+q9mLiPdRZsDk59KL
         f+J7UPWfpFneaqiONm0eAruLXFnnj7FUC1TR/yZzevVjHftBNKERuTkfSiAT0emac+u4
         UzOPkl1zT8Q5bgDZhlF6wbKq8l/CnqrrfSDWh2vMiZH5MJ5O3PQh+YlBnae5UsyKNgcF
         05GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoYRgipHaEcj+0u72nD7yDVzA4ANouuGsEtrdqPw4JReaty6ox5u3Ebkq1xfVPhnCtsaw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmVvZYteOxqN5qoTQf2uhd2fBoiGGWaBz3rCZu5pM7szPoOrCK
	5w2pXXPpl8x7TOn2ZCJk5WSICgMrmeb0dgp/P8MLM0fW797jLCxCaUMCf/m6li8=
X-Gm-Gg: ASbGnctHb2QBsVimZnowWZrk7wZyhBerJhC4VoO/Yyw5+IFXuHuAf2U8iSQCZC+QNnf
	VJW0xNmAA7TOs3lg/+k1Vp28GnxugpGX1eRHI/Xh2QaUyxxhOYxOyBNJPbQ1el4+y98qK27x8Jl
	WNkeBkdwNEFgtJVgsy9+FW4EeGoWbGtDQJMVt5fMCCnMD7SmRxyMrU+6EHUYox29Yy1RAqBaMo8
	rt8MD40+kKjNtJ8ykBpg+I7WzyKYOc8M5oqlGnyxjcckxPXuuVPOBKKFAcCCFx489aIaYY=
X-Google-Smtp-Source: AGHT+IGGLNOo3Y6rZ9xm8aucjHmK0akRyTENMu3IpG6BrZjgAqoEyoZP/GxppQhWGAt606k5yDTcpQ==
X-Received: by 2002:a17:907:2d8f:b0:aa6:6386:44de with SMTP id a640c23a62f3a-ab2ab73b693mr726196966b.8.1736852144389;
        Tue, 14 Jan 2025 02:55:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95624e8sm611169266b.127.2025.01.14.02.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:55:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dmaengine: pxa: Enavle compile test
Date: Tue, 14 Jan 2025 11:55:38 +0100
Message-ID: <20250114105538.272963-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114105538.272963-1-krzysztof.kozlowski@linaro.org>
References: <20250114105538.272963-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PXA_DMA driver does not include any asm/mach headers, so it can be
compile tested for build coverage.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 8afea2e23360..cd856c990d17 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -546,7 +546,7 @@ config PL330_DMA
 
 config PXA_DMA
 	bool "PXA DMA support"
-	depends on (ARCH_MMP || ARCH_PXA)
+	depends on (ARCH_MMP || ARCH_PXA) || COMPILE_TEST
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	help
-- 
2.43.0

