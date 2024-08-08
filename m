Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EE318FC65
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128178; cv=none; b=GMaN9LMAwugNzf7GCzlG9KplxDLgievu2dE0+09vjNk2NwZkw8sofDOlj61FuqjqJS5WfeDap3udCBiCh58lAvOrObJpI5sLUwppHpLdbpJqy7opPcy8lzuKDbIIvKkeKCuPs75eNbQO9IWy4TFWOv1aX+iL/HtSseZSx7Jvn0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128178; c=relaxed/simple;
	bh=Aa36Al+8XL+o6jnCRaXGcn3QPeSfqDekEcFkrR4ZXoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o5ItPcE6h2iigpLJMuKusQaQlxuSHjGnDfPVB3AqJ/2OEJQ+gpGNpbKLPig4f1RpX+OYjq0vI+7YnzyqAIFEy6iBmbFTO/swM0rvWJHay54lz1ZViMzcx87I45rBxrXHBlI+AOxewaoi8Zyoz9fDBVTtG5ACjY/xZXT5Jcn7ap4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dMi6zJV9; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dMi6zJV9"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5a1337cfbb5so1328150a12.3
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128172; x=1723732972; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSaLptLfozVkUpjw1oRI9Gwlbl43zWvMUP09a2upKVw=;
        b=dMi6zJV9D5lax3NN4JNdE/JpDP7p9uMvoejuZehoBvZAH6Zv5Tp1LIiaPpIDlLafFc
         C5Wj5UI8+fAcC+rJEI2FP5cSKPE/EQWF87PCwhosOjDjcNnVvshUbaHg63Yb3QIcDHIN
         ero/hZo23W1lWqjutiZcZlhI9lgOoV5Bt6rO/GA2bLUd2wHUPuahaQP1IVww5skspElr
         X05kazojhrgC46MdQ10z+0K/v8KILrf0owQ2csLYspB4dGUalA1oGRwdKEaEIzNT+Rl8
         E0loVyMVQ0a6FcPv32CRK6gmwHRzcyxVwN1FXCT0rXcMrU6ebhwxr7b3tcMCNny5w1CX
         q/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128172; x=1723732972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSaLptLfozVkUpjw1oRI9Gwlbl43zWvMUP09a2upKVw=;
        b=TwRbAzHcSnnsDXu4xjkrnpJG+pl0dYOVF8BTL1IL6+hCe4ANfJm7/RLsK7dxJNg5Pb
         JbLo8wIokB1qgwVQDCbS3h2q0k/LheJERK755ZJCLu20Tgu46UCDPHBBsqDhbqjLM1bQ
         8pVirAwBhq3b2R3tQaUhNXFhtv3l9emqsOcasOOwIX7Pcvr9wr/YDIzsr35jLYvNkw0y
         Z855dLUxOwGD80F4tASWzbPbRe9knPwUxCyTSq3kcC55PFufYHUx/1dvT5OO3ka/4zFu
         47l8RUHyiHqFHlpdZD/C8/Ac3Xkc3yJlc19KtbH/vVk62QQcuukE+YJuJXLbFZ7C3Y3+
         Zl8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXr/8NnMuy3EAmgR3iGtBiSb/MUaEOvN06IRnf3TH/RtjI8pDVKDCpu9kKCeAfnRVvdz/6aBwdGPQDHCeXDsHA/Gthq
X-Gm-Message-State: AOJu0YymiYH5EqN/cRjsSL5dsXQxpNs+Ew4lXe1bsgUZbMxBi1qgNwwd
	MyZHpSoupz0fjnJZ6B2jYP7gsAuD0YJAlC2YEQooWVRJeqHYskgCSqzJWFxxouU=
X-Google-Smtp-Source: AGHT+IFMK2qopGYBycdChfC/X1LoyzHCLARQBPYUBx9YA9oZBE8LNw3RFGiTAugu4rQMz79p2jq/4Q==
X-Received: by 2002:a17:906:6a04:b0:a6f:1036:98cf with SMTP id a640c23a62f3a-a8090e8a3fcmr157838366b.54.1723128172451;
        Thu, 08 Aug 2024 07:42:52 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:52 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:51 +0100
Subject: [PATCH v6 10/20] clk: imx: imx6sx: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-10-e91c537acedc@linaro.org>
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

The clk core now does something similar for us as part of
of_clk_add_provider() and of_clk_add_hw_provider() and this i.MX
specific call isn't necessary anymore.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/imx/clk-imx6sx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
index 69f8f6f9ca49..4e42e30245b3 100644
--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -555,7 +555,5 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
 
 	clk_set_parent(hws[IMX6SX_CLK_QSPI1_SEL]->clk, hws[IMX6SX_CLK_PLL2_BUS]->clk);
 	clk_set_parent(hws[IMX6SX_CLK_QSPI2_SEL]->clk, hws[IMX6SX_CLK_PLL2_BUS]->clk);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx6sx, "fsl,imx6sx-ccm", imx6sx_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

