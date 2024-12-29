Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A754D2594A6
	for <imx@lists.linux.dev>; Sun, 29 Dec 2024 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483836; cv=none; b=ts3lglG2SRxECFrwmNmfZGUT71gbvdSVG6KIkDPC0sk8DamF/ai3YWttAzXdOaJcGanexS+7n6kA3lolxlTPpbbQeYHQ/UD0bsCQXtPFMPgtGShOFlde6cRutVzpU8FS9G18zPcpcnik94bmZUfZSt6FohkaNorsZ5ngglgeNk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483836; c=relaxed/simple;
	bh=+1wDCnUf6V6waC2u4F0CjceMoJUJQ3m5duPgNX1wMjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xd0zqGRwG/WFwH9yVvMnvA3XrPrh7x5M927+NMBkeYIqbQ5rdrOSaWli8RYgOHw5RbgDG9zbcVCP2PUd+2lPf6Sd9XGgkn3i/j4eXaUbvPEwoaiMW57Jail2cyMlPmEtFGZdW7w69RkqG7kW7d1MjZM32V1RJ/TqTs9sL607luY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=V9DZSOXz; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="V9DZSOXz"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa692211331so1632517066b.1
        for <imx@lists.linux.dev>; Sun, 29 Dec 2024 06:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483833; x=1736088633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=V9DZSOXzmA1we3YxUijE9QrTRNTRT5bi/ML4ImKGLQ/lSPWEmV7WoB2KQP76YK1nSy
         VQqhpvzmkSOgvCcJ1ArJ+chvqr4EGRmIP9yGxIm7fiYWABayc4z+6m0jw8Iuecws1tvQ
         XnKhoJB5e+0Cr0HFo5r0Zrojz5Q1nk2FNpnes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483833; x=1736088633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=grmqf23ZRPjMj2jWJy/zmlngZXjKvtv5dxdxQJXeeCqPQRU6Evi9i6QNIrV6oNmmN0
         Ae7Ca8J+08UuDo1mBvKo3MAnXqqy1RfckByEIRRhzug0t7SIFTXRPwsUo6DLXSmFx+c5
         GJfbp1bzMT5nukYHUCxzUYnB4wCm1nIhFkIIy1j8219F38xW4G2WzQlzBA8EYGazT6Q9
         XWDnoYjf5HndYdryxWh1Pq29idDIN+unR3meJzNB/NOoCvltHR9JlgP0fjOwVMz0Wd77
         IXsXVee2k5vkpxZMtXUosUPDlFoh0ozhm9deZQ4UKqykGScxC4JG2DfQokNEKjot2nbm
         cViw==
X-Forwarded-Encrypted: i=1; AJvYcCV+gHxSw0njx9AsxlCLi3DvZTAiM+MxCYz/9GEsi4yHq2FybqUrBwShSE5j20xzkAmh2Hg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeXBDZ3uMI5KIjT6TmpoMSlSeVH3xOVZfr0+Ks8cREBRjSulAy
	odVTgs2IaIPBlKxJ8SQa2C7uwcMTA4OGFtikZj9ScL78Zz9Gc35K/xXe8SPbOJQ=
X-Gm-Gg: ASbGncte4QPkFzLb2zonxTYKN1EzIoFUl9eBoBEHoKp7AMWeSqwS5Bb3WUWqZk0IoY1
	W2pN3D2kCzwBiAK8MXSR4VOVfRX4QeZIdocAsKExUwUNLkXSlUXoC5m9HbaGcTENmum/lmydMgz
	8sscBvVrRM0SKAk7Kgwf3MaeG//2/DfWaWAyR255ZcDW+OiLWCm68PuLnrDAYz3HZ2okaDuaXkS
	YIFOQjGAYRwmo4k0Wye41GdgkYLLKEP5a5Ld+W2So1qL+g0CZ2ttxgSCAJZN51KYBM7/bUgHVTO
	JfbmpNUDLvPywL1B0ABvfg==
X-Google-Smtp-Source: AGHT+IFV6+DUifWNgtI/l9xv/1AQmyY+vn0i8+uFyhjAZ8e8hW4Xl/fClO119sqnG2ifR6YSa9Jbvw==
X-Received: by 2002:a17:906:415a:b0:aaf:c0:be7e with SMTP id a640c23a62f3a-aaf00c0c9d4mr1166766266b.29.1735483833021;
        Sun, 29 Dec 2024 06:50:33 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:32 -0800 (PST)
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
Subject: [PATCH v8 01/18] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Sun, 29 Dec 2024 15:49:25 +0100
Message-ID: <20241229145027.3984542-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
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

