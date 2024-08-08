Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E66A18FC77
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128178; cv=none; b=j4iQ178sDPB3hHEcNJ9WH1t1BV1l2CApvDcotfHGAvoL8LB9k8guGlnTDk6wAfDStVx7C4GltoIjJprIOhEIFnC1of3n/OsqBt8gTP4eWshwx6zoDOZcX9dG3gBZ/5sg4X004f7BlGG6WH+0ahj8LjeueIUhuzDpLrFROq2g4wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128178; c=relaxed/simple;
	bh=RCzb4T7ygPujxOgSIHXjGoBW3H5sHyUhE9zlzlMY0qY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cYiQh5vK43gylcj4F/eSppFGYXz/b0rv2FDkh4/Xd9N8y18K7kxqgxwtLCoJHOmEbfaFR2ft8evhLXdUnW06uFTYGTyxUUZBGMPYGOG5PnU2ylW09+qsEzYHbLZS0oZfItedbORIv0TvydHXL+UyAO6pM1id33DBjBtDfWVKW3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hq5zu2VQ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hq5zu2VQ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7a9e25008aso129366366b.0
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128174; x=1723732974; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fELKcjyo4D+4io09ckq4Quxisz8/UoBpXMhoRi06ZaU=;
        b=hq5zu2VQkqOBU3vOExo4Ay/Imm5HwxVU+PumqS+VP/Q8qThI2A5d13AAzJK464obrP
         QC7m8/NxVCfxXAg93vdu4RSSZ82PVSPt17Ht4bCRWp8pz0JsV0EJJ5YnfT+dEmvh98gV
         brXP/SVnzFwKdm1OFoBsupt/39SIB/DM8Oi6l8Jj3gMrbwx6Nu6vb1CBvRR4j6egUDx/
         flGWeZ2EMLunxiDCSajvyZV3HuO+WkwLQsAa7ARhjd0KtTK+YMK9cBMvi6saEaDiUEei
         01uFt6diKphkOZg4jNNYeDf+9kK8vIVDL47nn+oAy2OYqyABN0li55LnAhug+ILRSO2a
         RNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128174; x=1723732974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fELKcjyo4D+4io09ckq4Quxisz8/UoBpXMhoRi06ZaU=;
        b=hOyOzgEArmoRrm09YfC0bOzWez4utmgS3Y8YYDCVsDr1OQ1hprjwqOXmg7zcGnxuaC
         Kk77MgRxeHr6ji1LlGf2IILKzbrTvtedEZbzb7SS59vbNC/WkDk42N7V3Oz3rf/F92uJ
         TASy1Ej01fh5PH6DUX7a8m54XwyYqnzZzlnzFwP70WVicEvU/3PyfmWAE6SW8ptFA+Sb
         KhoVZjOC9l3rL0frC9Co6WeLL3UetWaK2A/UmIbVBmPVjD0RMHmYUeQzaqVtfjcKXCcR
         JSs4eYNjOAHOS+S3q/RNPBmymL+MN5zbDx/bfVIG7r9X2qPiX7eWJP5lWbkHwiLPHULu
         J1iQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0im3jzJ+h4RNzJLQ8hQIjJmTAQ0+akypkkXkbE2gouzxxNxpGoiNzGeGdZyv28H4duxSwCYta2afRnRlScibLWfYX
X-Gm-Message-State: AOJu0YxRBQXOaNY4aCpVVAus15nL+wE58oferb1J8j6US2K2/dChCkRa
	LC+R83RU7iME38dHZGFy4dW4QPYvFPhoEI3c8WOGY5hdj4az5aS2q2lPCCXKmjw=
X-Google-Smtp-Source: AGHT+IEdiR2uqxL40ypq1eVBsdbq009S5HpqMJsLtiHNMyRcup08bUljMUs/bT8PIRSRi7Q4xYViWw==
X-Received: by 2002:a17:907:97cc:b0:a7a:b9dd:775f with SMTP id a640c23a62f3a-a8090e3cf84mr182258966b.55.1723128173566;
        Thu, 08 Aug 2024 07:42:53 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:52 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:52 +0100
Subject: [PATCH v6 11/20] clk: imx: imx6ul: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-11-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx6ul.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6ul.c b/drivers/clk/imx/clk-imx6ul.c
index 05c7a82b751f..b828cecd3690 100644
--- a/drivers/clk/imx/clk-imx6ul.c
+++ b/drivers/clk/imx/clk-imx6ul.c
@@ -544,8 +544,6 @@ static void __init imx6ul_clocks_init(struct device_node *ccm_node)
 
 	clk_set_parent(hws[IMX6UL_CLK_ENET1_REF_SEL]->clk, hws[IMX6UL_CLK_ENET1_REF_125M]->clk);
 	clk_set_parent(hws[IMX6UL_CLK_ENET2_REF_SEL]->clk, hws[IMX6UL_CLK_ENET2_REF_125M]->clk);
-
-	imx_register_uart_clocks();
 }
 
 CLK_OF_DECLARE(imx6ul, "fsl,imx6ul-ccm", imx6ul_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

