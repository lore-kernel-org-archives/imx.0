Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A1D1F8664
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318650; cv=none; b=kWPev0B77Rx1rXCNTRPP8uihqvgFvFAuuIHbFoZywnq/MSUCZf1aoi9aMX/1BlgXBtlYKmb8SUwpeg6EORFV86ZZqV+3werpIYQ5fi29x86tMlD6mKlzZTZh+J58oF+QE0r+ktlK22fzuTYK5oMWmMXykBzTa4OmxEWp+kxQzPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318650; c=relaxed/simple;
	bh=+1wDCnUf6V6waC2u4F0CjceMoJUJQ3m5duPgNX1wMjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zs75AJOA9KEzVI2BYXUpAkK8X+iPVrqTImMQZgRtxFA5+/JMp0edDTUF5VncCSfgi9IMdl7t95FKCkd9Bx1C2HEZ84G0Q3/PMfZY7zEagqXFs5+TeAatPlb6NaV9BP+P9KwgB8wMcr+HEt8hUKQKiO7BmNYlb1MTwQAAdwF+eRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rKvp+bMx; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rKvp+bMx"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso1252176166b.2
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318645; x=1735923445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=rKvp+bMx+FpgbkjXv0VUJ8KVZPUlyiAsfjH/esl8df2YVgSu7mQHAXo6JMBuyBi90E
         4EEAvzdQkXst+c+hPdeYzS42KECbWUuzLEUJbkTzQ7bS91N7HOsTtj1XvYN97NchZ4Ql
         wj+ydzT9pxt6Z2caJO2Qqsy3V7/+8p4LXZdg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318645; x=1735923445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=pPBQ6TLblDSfaDuia/3KcRFpWt+Mi6vTOAdJ4WrPS2NndUvpsy89bPc/sBb+hsUrIB
         rfwOmZ2lXUnayBC/94SxYrTZyn+x+GX635QJKAOFs4NfoC37uF3yDzRuRHNiGNKnGwUK
         PFbd4q+LFV9Tg0tIs8eTXGnEBY9i+0DTJOpkzeBez5i6fwh74oJl9MmytuMpR/7ByPMY
         29JKvLHrpMyWeq5bLhwFxdxIitbsiZP1DbWE7R+wj6yDrX/GIx0W74rOMxpSESaCDpSt
         AIq/HDkHxM8ln0zgTB26H4EQUn8Q7HRBmDgHBSw8Pi9idX+PWZxlgPAsyvHAbYca11mp
         Rftg==
X-Forwarded-Encrypted: i=1; AJvYcCX3eqx0qPwns34Fd5qfpbfxfG/uYTi9duI6zniAkAqOM8/c174j5CD7ZdXqBgrr3NA+9qw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl6pEDjyoDpR0WBD9oHJ3rLmjt43/tOvU/fblH1f8kTVxawpmm
	JNjUzqfRyCJaBxD2D5mf0s9zD9PCwdx5ELNvBcIa85HvHzOv61agtUvE5jOfsuw=
X-Gm-Gg: ASbGnctIwKarx3soEL+0+HDuNJ+w+mAqbrhvE63LMTWttOcFKAZhTXYFcPMIdQhR6sh
	J28BgItxCLDuB7FMbS3krleJUOZpLJwop6iA2PWv5RG8qD5DUjSlRrI0VfAV/BxLfz1/eipGrG1
	kCaQTEP0HpiIQMe5IBE82++IBbrw4fpm/64A7FuL8I5jj+ice7oDHmbr69vHGpRUfniaUXyzcB+
	7+Wy83PVjyXHNl38YHdKhlc/iXvJIjreCp18EXwqWrKNUzF+P08qyCeye4ZimUaHOSlB1TRcZb/
	R79Zs8pRQXTdlA4Q/2y5sg==
X-Google-Smtp-Source: AGHT+IF2wAZiZXOhSk5ioYTNrzhfdCszg+K/Yp9x5T8NwwqXN7bzl3LV9Ed9BE9UWV7Fx+sow9CFjQ==
X-Received: by 2002:a17:906:c106:b0:aa6:7cae:db98 with SMTP id a640c23a62f3a-aac2d447333mr2312573666b.10.1735318645446;
        Fri, 27 Dec 2024 08:57:25 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:24 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v7 01/23] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Fri, 27 Dec 2024 17:56:04 +0100
Message-ID: <20241227165719.3902388-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MM_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MM_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v6)

Changes in v6:
- Add 'Acked-by' tag of Krzysztof Kozlowski

Changes in v5:
- New

 include/dt-bindings/clock/imx8mm-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
index 1f768b2eeb1a..102d8a6cdb55 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MM_CLK_EXT4				7
 #define IMX8MM_AUDIO_PLL1_REF_SEL		8
 #define IMX8MM_AUDIO_PLL2_REF_SEL		9
-#define IMX8MM_VIDEO_PLL1_REF_SEL		10
+#define IMX8MM_VIDEO_PLL_REF_SEL		10
+#define IMX8MM_VIDEO_PLL1_REF_SEL		IMX8MM_VIDEO_PLL_REF_SEL
 #define IMX8MM_DRAM_PLL_REF_SEL			11
 #define IMX8MM_GPU_PLL_REF_SEL			12
 #define IMX8MM_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MM_SYS_PLL3_REF_SEL			17
 #define IMX8MM_AUDIO_PLL1			18
 #define IMX8MM_AUDIO_PLL2			19
-#define IMX8MM_VIDEO_PLL1			20
+#define IMX8MM_VIDEO_PLL			20
+#define IMX8MM_VIDEO_PLL1			IMX8MM_VIDEO_PLL
 #define IMX8MM_DRAM_PLL				21
 #define IMX8MM_GPU_PLL				22
 #define IMX8MM_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MM_SYS_PLL3				27
 #define IMX8MM_AUDIO_PLL1_BYPASS		28
 #define IMX8MM_AUDIO_PLL2_BYPASS		29
-#define IMX8MM_VIDEO_PLL1_BYPASS		30
+#define IMX8MM_VIDEO_PLL_BYPASS			30
+#define IMX8MM_VIDEO_PLL1_BYPASS		IMX8MM_VIDEO_PLL_BYPASS
 #define IMX8MM_DRAM_PLL_BYPASS			31
 #define IMX8MM_GPU_PLL_BYPASS			32
 #define IMX8MM_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MM_SYS_PLL3_BYPASS			37
 #define IMX8MM_AUDIO_PLL1_OUT			38
 #define IMX8MM_AUDIO_PLL2_OUT			39
-#define IMX8MM_VIDEO_PLL1_OUT			40
+#define IMX8MM_VIDEO_PLL_OUT			40
+#define IMX8MM_VIDEO_PLL1_OUT			IMX8MM_VIDEO_PLL_OUT
 #define IMX8MM_DRAM_PLL_OUT			41
 #define IMX8MM_GPU_PLL_OUT			42
 #define IMX8MM_VPU_PLL_OUT			43
-- 
2.43.0

