Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C30C18C32C
	for <imx@lists.linux.dev>; Sun, 22 Dec 2024 17:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887144; cv=none; b=hTQRN9Nwo9R/1eqpPlQcx/ZNehJOGlS5IC12YSbGYS36MGel938k4VPTM95XfbCGI58oAEtt/7i/fNWCC73sufUn7q2/6L/xemNYLzmEoAmweSE311f4yCctFPDZT48xckd+zsop3Mn2esIA9lfO4/ysRP3CtDw08gV/gttVsls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887144; c=relaxed/simple;
	bh=3RR7TtmT2tghjfLjtOiYGFW7M/pVGEzXb7TNNEfCgjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LYOl/9jrNVOJYeA4zOFxmYBzmitDsxwmeC6ReDL/LDq9q7FXJWjCK5eclcBPAiu1ut+FYE+cBBlBLvKrvQuP3foOdLra7GOtxwXkBAGj99bG9k9DLqipyqcm5MGZlo7nxg37bRlcIE8E+t3bKyTURvk5vosvboQCc2bOTSweOjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=USXKCUcz; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="USXKCUcz"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaec111762bso154119266b.2
        for <imx@lists.linux.dev>; Sun, 22 Dec 2024 09:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887140; x=1735491940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSqZmzfg82O+4dHUY/JUhUjoJ4s2N8toybCaelOQrvU=;
        b=USXKCUczOTnSeb07SAvE2ud1MDnG/hGvnvpCAE7qwmyDWRBK9dpynPdd1+/DLu17Wl
         aHcnGfe/S9pmdcBtm2NjrF8a+qZ8k2dlRai0SWvq0YqCZse3Rq3rU023Y1TpwlIGtNlP
         NPxW8CohEskAUUlrentCb3Z3pd6hvqQp/W1ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887140; x=1735491940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSqZmzfg82O+4dHUY/JUhUjoJ4s2N8toybCaelOQrvU=;
        b=p4Cp1qxO42ZWv/ef4BY1k1iS/Fy9zqrZqCML1HKS7L7tNHw7LAe/4Lh3r0lPXM/3gu
         bhPoCxOXayPy0TR5z/vEo9NxhPBVxfH6hDiX5a0gQMlE6aH90jQLdyvswF9K7z5Obatm
         uXuI4KEbZTSAkLUphNCQm1TI41OhScZnZMQJLBhZ+Sdcb/wD18ZvEqMy8ZWNVmFkHjEW
         f9GUhGiYnGVxMclh0EnN11bqOW3K4OPM3qPWrBqHjxEJJ69eXOZyorSoviEujTqlLWqZ
         qd7og/vdF9HK/W/yrjH6KZC4lrxPUxtB4IV2kR7c0FQmHAugqr2NFcbri4xRHzXoGs/a
         kw9g==
X-Forwarded-Encrypted: i=1; AJvYcCU2S4/aMPTMNp4OHwhMoumPtm8QDWB4ZGmZ2s+U/cdbTwqCUW65DT4aaRwyc56GlvsPtZU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2UemCtK1sglyaIu3lAKZHomdltSQvrd7aPDnZcsXEsunzUn43
	4NgNYEEBvCTLpttheCIj/Y9qXbiEtXGyFJIp7qjWMotV2+tjEk+XgMUQH6Swhkw=
X-Gm-Gg: ASbGncvX/33MaVnNRrI0g+lygFccUCuleIYbazH5mhvE+c8T5sqX2ICtQiiOoEUBgi3
	v+gijDJ2XJ1vh80GB9M4Nyh1XUi1DqVIdqSNFQPaoxHa13+JVceSN0Ol1tDi5pqGHSzY6Rtv1tw
	ui1SbsuWok8boQIp/WO6fgamuYxPqNowMM/WSAmiBYPRLsFI1qBInbeXNUoKsj1BuN2preNlxuo
	Dyp0KUZzd3MkcMnbwq812S88DQPRlJ1JF+NLa734PxuVj4R0HTo2wMZ63npcQsQzrOB3HCRLuNQ
	hi2Mis6C4b+Iy9RQYzMya4qLra9OydernNjnXunvndgKAw==
X-Google-Smtp-Source: AGHT+IGoSNLLXoUG9w9h5MwSnQKDCveLmkkQwCAObiEaQRbH9lAFBzDeGX6ULegdYk7dQYszNotN8w==
X-Received: by 2002:a17:906:730a:b0:aa6:a572:49fd with SMTP id a640c23a62f3a-aac3368c074mr1008129766b.54.1734887139810;
        Sun, 22 Dec 2024 09:05:39 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:39 -0800 (PST)
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
Subject: [PATCH v6 01/18] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Sun, 22 Dec 2024 18:04:16 +0100
Message-ID: <20241222170534.3621453-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
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

