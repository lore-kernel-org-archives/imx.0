Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79EE190479
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128182; cv=none; b=WS/bh1cus8aGsuAIRkQva/zif34kWZuUzmbNptt9mSH8PyoLFqsT6RuEZ6jK3ZGelhsTL8MlFeIy3WwY0duMdnphOxGkVit2HRA5IJ/2IZytFqWAiNlddjANK1DQOP6zqbUFjl5t62FaMGyMRuAsXP8GB1SwsUHe9PRWI/9OXzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128182; c=relaxed/simple;
	bh=nXzI2w3ThoiSRcRj8fOXuTW+n6yOdH+9/0PqUvo2i28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NB2jlvbXXbrROJq4QoKsymCQSRlv4wwiN0z1OGbBmFsR5eEo/atms6lTE4bnuFSdCwugbfMxmfUr7WmjkC4ANLSq4ADPEDsMNs0A9yYrTkHTC8qBLoeR/RyjMfVPE7sAKzqQebjlVVmeqqGo8oHmjZn3bW0LLG32CDQcd1M/4Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFEuKQoD; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFEuKQoD"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7a9a369055so106387066b.3
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128178; x=1723732978; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4eCyKnwzwhvgvotyhGHB+vsH3GCQ4YaY3HQS5YaZiA=;
        b=kFEuKQoD+lmlaeqol83mYG1qALHfRNCP4j93nvwnq3lx8VDUbIm2KNvzUFjATfVgtJ
         515uZXCm0IdBK8kJ7WKwfTr3yBT0/rvKhVe+LAgbHa29DoqT6eMB/w/wpn0g/Loz+21S
         WJvrj2ChnTsGP33w8XbYQjQxQY6ajslOqF+VHg3YNixtZnOVWY8Fx/tUly6FvKkQKsqY
         uCEPiJxKND+/RTYDzXr+qH/qa010ezuBM7ARDNJAB8d7gSTj9efVH55g1wL0rS13fPOh
         vPsiD3X7u4C821WL6zttZMoTk8UOQlJaaauYW90s0ZCQChPVfh5Sb4EfdT3yshsctxkb
         Iuig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128178; x=1723732978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4eCyKnwzwhvgvotyhGHB+vsH3GCQ4YaY3HQS5YaZiA=;
        b=FaR0lc5RfmhX6lA2K7O+CnksyHjhEq6XqbuEYFnRu4c5sII304obVgWjCE4GfGPnEQ
         VlguWAZk+TQYVgYSIqOOw6BV2l4CigToVsm0eWYuZXFNUnR2wG6QvPS1pGWTNTEtkGIN
         Hb00nyEHsUvHYhnaTZogNj7zB54Hz0ev7LIMVJipdY1wh8zxylzG4g+zOHYFp9chd8Q5
         R3vJEdrJ9oxjJ8QumRiywqCGrXcl/7xGu7B75VHOQoFS2tmwB1mvjsYuadF+jqiAOXa9
         /itfyiYok396w1YkDpUwLMtSL6we8MpsPPv3wWjR+KKR4vHH23NEmQNwRguy6oHU8a7Q
         jLQA==
X-Forwarded-Encrypted: i=1; AJvYcCUnFgsvznoSRjVG+OlpIkTQwciE59qX4Y12yvp8xWW0OUjjSY7ipzFQBsLXHe6sRKdg+E8P5N5v/yZFZZkwFylYYIRE
X-Gm-Message-State: AOJu0YxdOBM4MBJIfo6KmHmBcgDUFuA3PfUiQiUV4lj7je1+dwH42Rj9
	a+4xSHHXwb9NCyDvZRV8VR3o6Pd1Tp7ItHN7wvr8keixykFxjJzTiUWWL202UJE=
X-Google-Smtp-Source: AGHT+IHqbohN5vuse2tZu05wgsB0D/3481cW3wuuO9L9OkxukplhEORcbJpoFFUAYLw6KR5UnB87lg==
X-Received: by 2002:a17:907:da6:b0:a7a:c106:3640 with SMTP id a640c23a62f3a-a8090eff092mr152706366b.66.1723128177570;
        Thu, 08 Aug 2024 07:42:57 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:57 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:43:01 +0100
Subject: [PATCH v6 20/20] clk: imx: drop imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-20-e91c537acedc@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v6-0-e91c537acedc@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

There are no users of this anymore in the tree and the clk core
implements something similar now, we can remove
imx_register_uart_clocks().

Do so.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/imx/clk.c | 72 ---------------------------------------------------
 drivers/clk/imx/clk.h |  7 -----
 2 files changed, 79 deletions(-)

diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
index df83bd939492..5f998e56a4ed 100644
--- a/drivers/clk/imx/clk.c
+++ b/drivers/clk/imx/clk.c
@@ -154,77 +154,5 @@ void imx_cscmr1_fixup(u32 *val)
 	return;
 }
 
-#ifndef MODULE
-
-static bool imx_keep_uart_clocks;
-static int imx_enabled_uart_clocks;
-static struct clk **imx_uart_clocks;
-
-static int __init imx_keep_uart_clocks_param(char *str)
-{
-	imx_keep_uart_clocks = 1;
-
-	return 0;
-}
-__setup_param("earlycon", imx_keep_uart_earlycon,
-	      imx_keep_uart_clocks_param, 0);
-__setup_param("earlyprintk", imx_keep_uart_earlyprintk,
-	      imx_keep_uart_clocks_param, 0);
-
-void imx_register_uart_clocks(void)
-{
-	unsigned int num __maybe_unused;
-
-	imx_enabled_uart_clocks = 0;
-
-/* i.MX boards use device trees now.  For build tests without CONFIG_OF, do nothing */
-#ifdef CONFIG_OF
-	if (imx_keep_uart_clocks) {
-		int i;
-
-		num = of_clk_get_parent_count(of_stdout);
-		if (!num)
-			return;
-
-		if (!of_stdout)
-			return;
-
-		imx_uart_clocks = kcalloc(num, sizeof(struct clk *), GFP_KERNEL);
-		if (!imx_uart_clocks)
-			return;
-
-		for (i = 0; i < num; i++) {
-			imx_uart_clocks[imx_enabled_uart_clocks] = of_clk_get(of_stdout, i);
-
-			/* Stop if there are no more of_stdout references */
-			if (IS_ERR(imx_uart_clocks[imx_enabled_uart_clocks]))
-				return;
-
-			/* Only enable the clock if it's not NULL */
-			if (imx_uart_clocks[imx_enabled_uart_clocks])
-				clk_prepare_enable(imx_uart_clocks[imx_enabled_uart_clocks++]);
-		}
-	}
-#endif
-}
-
-static int __init imx_clk_disable_uart(void)
-{
-	if (imx_keep_uart_clocks && imx_enabled_uart_clocks) {
-		int i;
-
-		for (i = 0; i < imx_enabled_uart_clocks; i++) {
-			clk_disable_unprepare(imx_uart_clocks[i]);
-			clk_put(imx_uart_clocks[i]);
-		}
-	}
-
-	kfree(imx_uart_clocks);
-
-	return 0;
-}
-late_initcall_sync(imx_clk_disable_uart);
-#endif
-
 MODULE_DESCRIPTION("Common clock support for NXP i.MX SoC family");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index aa5202f284f3..314730f848f7 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -11,13 +11,6 @@ extern bool mcore_booted;
 
 void imx_check_clocks(struct clk *clks[], unsigned int count);
 void imx_check_clk_hws(struct clk_hw *clks[], unsigned int count);
-#ifndef MODULE
-void imx_register_uart_clocks(void);
-#else
-static inline void imx_register_uart_clocks(void)
-{
-}
-#endif
 void imx_mmdc_mask_handshake(void __iomem *ccm_base, unsigned int chn);
 void imx_unregister_hw_clocks(struct clk_hw *hws[], unsigned int count);
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

