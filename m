Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B41E18E05A
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126285; cv=none; b=ZsU//QnJfkcOCeLmuyMblx76eT83zJ1cCUC5EF2UmTtOSvb1AlfFtjv4Vv83o9po8l9pCH6kwW752T0y7yW9eahthJuRcL3OVX7Sf13RLL2oSXhS1fLcpjR4oJbGm6eKUa+v/W7VoftSvS2t7dWSF1PoRumEe/9TFNlVzLpQA+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126285; c=relaxed/simple;
	bh=SiZ3szIGvyuxD1G7YmXCV9iLcepTAaj5c+gARHQ/bJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BWjH8jX5k9NFWCufNsgAmS0gLmYy0i/ngO0BC9nyPH/fdZnIaCpmp9/hJPTtoQ2Jdqk9aVecVZRkKv0leM+6buPi0F14Fr8OqCbtyXPN7uMnhGNbpf/+zO2QMorq7B2+0iWja58KHuBx18R6vkC5CQKgzW9Kg+ua3pZ+PTlZoAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uI1YmOac; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uI1YmOac"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-530e2235688so1091864e87.3
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126280; x=1723731080; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5MWL3cjgLEXuvIZC5lLXbB33GYudCtwZlnHK0GLdqg=;
        b=uI1YmOacR5ELvAg7lObn+jMiTGNXg7OLjZ6KM3kL7zQZji5ML0iYbD51VK5IV1LLd1
         HsEsy5fcorG8VNVfdeKymFvuJF8zc5BJlyXU/gQV3vEVkFviSLxI9/QImAtdEaNLbPsS
         IqdqUmR0H0KkNwruh+KwKbHjcH8qsSNIsmw72peRfKZ9vwqtIjpoBxiKXpPG01CzgToa
         aNVYPsg1K4+kQ14OJhGDDXUxusFQKkWBVIK8kBUF3BGFwJn6t4OoFwKasRUpwnxDu66L
         xTlvnSfselgYMfj/Mg+ddr0y5cqSlTyZ/9lVhqQC3ZGA/jZFE6J5U2kTduzn1MHVP1TL
         fNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126280; x=1723731080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5MWL3cjgLEXuvIZC5lLXbB33GYudCtwZlnHK0GLdqg=;
        b=ftsN+Bqa7Uch+wi1Zz8Zg6iO7mAPP8TXUhkVliACXJJgZ5oAN29NOambWqrhAkp8zN
         ewtB98V65irQlUhMNm6fzkugI2UyqPsbkTAab/d1B9xBtAQ2ztFU7mFLdxt16LGpGjVB
         fTrYktJILF3B7xh462FqZSfwi1KtXBKuJthSoKadEPAcJkYHRScP8SPGc3SCYeC32f1S
         fj1i3yW18DoVd7bD5VDG0lftfvMiUtKKuISt/wzi04aija8IRitzd5bW0lac39lzOocS
         7c0U/gPzAz41XAQy36aBL+9ZRpUQ9QBGqqFQsNHketx+wcKBbveGrZR1OaFdBorIP7d+
         bENA==
X-Forwarded-Encrypted: i=1; AJvYcCWgxO8RVXcCDHpHkTB3qHU1sYb0qXATeIhJj98F9twQmUrPya1zeHaqGhFoVGj59Hm7cqosEdLcdbW+vOxLqRXjmtom
X-Gm-Message-State: AOJu0YxVs6NyDZVpHwP2fLDOGMJPBwZy3NXg4s4y7lZsRNxsE+f7fx8P
	5AVx6WVOV7HNyKbXf9A6RfuVfCJtSGmJSf4MGPfVW9w9GWCpsgToOvqaQC2u6K4=
X-Google-Smtp-Source: AGHT+IH5Kf6gdlRKSpC6X2ZKv/aljG4na8Kr//uvGtQcNgodFdSqi5phhv7A8UtaPZwiOthbvaQKXA==
X-Received: by 2002:a05:6512:3d18:b0:530:aa53:60f6 with SMTP id 2adb3069b0e04-530e581ffb9mr1693230e87.15.1723126280108;
        Thu, 08 Aug 2024 07:11:20 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:19 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:21 +0100
Subject: [PATCH v5 07/20] clk: imx: imx6q: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-7-11cffef0634e@linaro.org>
References: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
In-Reply-To: <20240808-gs101-non-essential-clocks-2-v5-0-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx6q.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index bf4c1d9c9928..b436463e06d4 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -986,7 +986,5 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
 	}
 
 	clk_set_parent(hws[IMX6QDL_CLK_ENET_REF_SEL]->clk, hws[IMX6QDL_CLK_ENET_REF]->clk);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx6q, "fsl,imx6q-ccm", imx6q_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

