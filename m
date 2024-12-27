Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD501F8680
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318653; cv=none; b=TgqxkxP0QQuctqIMBewLa/izggTm1ElJAWgLXqO0taohjvr+lcWRL4hYUPZ1lD6pJi4+kyvQWqJDRAxMcG9YCMvOWxWJHm2BukYg52OOWRgDbNTrYGCW1TXyXlkIPbgV/8NcJYN/xiTj7lqEl5JeC256tSg4CSuQpPQBYKnlcus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318653; c=relaxed/simple;
	bh=xUBRrkr1aLPPwLeMGNd5Xto6SUkG0PhtvIzCxxAX118=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WykDsrgLE8oYhxsNEh+KD2fIqQ3wPwG6zmdWpCGrS4z0wo08+BMT3arDFtT6iIKDKmwpBv2wwBfTQZtdTNaA+IM8RGUBWjeB281yqWRczVz/a617kSpWWy+RMC7nywt6tlNiJ6h2cYeE0MrheSvZ7RHzEQJlXgSskzhoe1jAaEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=qjgSJZGW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qjgSJZGW"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa66e4d1d5aso1195204966b.2
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318649; x=1735923449; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=qjgSJZGW18kaGm/jk0jm0UQvlBCuQcYC8BsfoqoGG1ioh2Eii0CjDZeUtE2PnDKyKK
         olx9UM+VUa4npzFHhLWWb3nOntUzcitEQc7XSm4W6F2venM6fLa6f4Hx6je4VNOegVks
         tk0QUnV3uEuxwThT+ilRShEk0gLuWupFTJ2OM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318649; x=1735923449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T8/6J4AE7rdE7DvbcqL7lv8LvF8nVi/MJUfgoa9DfhY=;
        b=jGEkOHpyfxxLFoP90O1dEqaE38TmDfx1vNfD5Ud6YL5wxB1yP3j9jPdhUdcb4w+6kd
         N171yjVuRg2ssj3I1uo6GbGNjg3IGAY9rQsTOw/6FVCA2L3HkqLuv10sgK53WYHZgF0h
         W4qIyZoxXXoQxwykd5KJXZ3LPMAO+O+u3BAUTSkRWq4U4mrgysu+6bU6QjVPSVmTNKmY
         +a7J8zlNk46Y+8h4Q3NQJma3eb59gnUr3J9gRfzRk9ohchs6nMJKjd0KpZlSaJrJvkzS
         lMA2ai8tEPRypQP0Y6l/VhaRsdogbokLzmmK/Z5T/yEXWwP4yzgTY7jiD5kOEyGdDjMl
         kjBA==
X-Forwarded-Encrypted: i=1; AJvYcCUl3hg3ihvNhobT9mJMMGQtTlRa9oKG+Sl76FpXT+1phimMptpxoQgJRaZ7c0oB7iZBXoI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZSRYWrX6bWz8FTcnrjoIeh6tfhfPfux9pIUntCMFdPttAtw+b
	UZxRZ06Q/3wSo3iv9sLErSRZYqJRyqVKLuxOYed/QEfPQ+xWn1g7ZNb+1uUm14U=
X-Gm-Gg: ASbGncui4CZYSLCQ7v4ElOk+FGvAc49q5i/wYlUzpz35cmh+SQMoPlqlOt9Ptj5/19h
	qOlWRsNK5WrM4dORvAuP85yMRuTK4azOWNjiE4kUA7DN3nbDqLZEfkDd6hMBuaOvCFOD7q0akQE
	v7NTuZPH4uc+003QBAtDZp4kyIN64C7R/WewyvzAXegR9W3t4tD/HLl7p8zE4stXzGjz7sI4k/R
	zS6sWYe1ZhaupXzj0v5gF9XRd7r4JYoBi9gAxfmpSoqnjCCloRnJ6jmAAlG12w41bl97Eci4f9O
	7Q5DSSiiCllEiV/wk47KaA==
X-Google-Smtp-Source: AGHT+IFx+qy8M9nbBtV4lkWk1CHCAzysU4JJGTIU9Blyy6kuVAhYju8xODoJ5uqYIFLq0x7fFfprVQ==
X-Received: by 2002:a17:906:7312:b0:aa6:9461:a186 with SMTP id a640c23a62f3a-aac33549f50mr2397618866b.46.1735318649395;
        Fri, 27 Dec 2024 08:57:29 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:29 -0800 (PST)
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
Subject: [PATCH v7 03/23] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
Date: Fri, 27 Dec 2024 17:56:06 +0100
Message-ID: <20241227165719.3902388-4-dario.binacchi@amarulasolutions.com>
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
name used in the RM is video_pll. So, let's add the IMX8MP_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MP_VIDEO_PLL1* constants have not been removed to ensure
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

 include/dt-bindings/clock/imx8mp-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
index 7da4243984b2..3235d7de3b62 100644
--- a/include/dt-bindings/clock/imx8mp-clock.h
+++ b/include/dt-bindings/clock/imx8mp-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MP_CLK_EXT4				7
 #define IMX8MP_AUDIO_PLL1_REF_SEL		8
 #define IMX8MP_AUDIO_PLL2_REF_SEL		9
-#define IMX8MP_VIDEO_PLL1_REF_SEL		10
+#define IMX8MP_VIDEO_PLL_REF_SEL		10
+#define IMX8MP_VIDEO_PLL1_REF_SEL		IMX8MP_VIDEO_PLL_REF_SEL
 #define IMX8MP_DRAM_PLL_REF_SEL			11
 #define IMX8MP_GPU_PLL_REF_SEL			12
 #define IMX8MP_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MP_SYS_PLL3_REF_SEL			17
 #define IMX8MP_AUDIO_PLL1			18
 #define IMX8MP_AUDIO_PLL2			19
-#define IMX8MP_VIDEO_PLL1			20
+#define IMX8MP_VIDEO_PLL			20
+#define IMX8MP_VIDEO_PLL1			IMX8MP_VIDEO_PLL
 #define IMX8MP_DRAM_PLL				21
 #define IMX8MP_GPU_PLL				22
 #define IMX8MP_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MP_SYS_PLL3				27
 #define IMX8MP_AUDIO_PLL1_BYPASS		28
 #define IMX8MP_AUDIO_PLL2_BYPASS		29
-#define IMX8MP_VIDEO_PLL1_BYPASS		30
+#define IMX8MP_VIDEO_PLL_BYPASS			30
+#define IMX8MP_VIDEO_PLL1_BYPASS		IMX8MP_VIDEO_PLL_BYPASS
 #define IMX8MP_DRAM_PLL_BYPASS			31
 #define IMX8MP_GPU_PLL_BYPASS			32
 #define IMX8MP_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MP_SYS_PLL3_BYPASS			37
 #define IMX8MP_AUDIO_PLL1_OUT			38
 #define IMX8MP_AUDIO_PLL2_OUT			39
-#define IMX8MP_VIDEO_PLL1_OUT			40
+#define IMX8MP_VIDEO_PLL_OUT			40
+#define IMX8MP_VIDEO_PLL1_OUT			IMX8MP_VIDEO_PLL_OUT
 #define IMX8MP_DRAM_PLL_OUT			41
 #define IMX8MP_GPU_PLL_OUT			42
 #define IMX8MP_VPU_PLL_OUT			43
-- 
2.43.0

