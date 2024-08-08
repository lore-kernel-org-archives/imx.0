Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4722218E758
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126282; cv=none; b=RJD1cIX4pG/GeoHmen7MswrgkfCHexz1dSHhrWKk3AZpTbvccGufYM8ay5TW3HinuOKnARMArFAdz+Di16XEjMa4bTwAzxpEkqLQ+Jby1C/i1e2Tzt99JOEtUnTt0r+5z+XW/Jtuz/J5vUu3Gu5se5oZbgVhf42yMEi78vD9i/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126282; c=relaxed/simple;
	bh=0YLrrUzUpbGAZRD9K0JKJsJf0lqzpBPah1/3yREgZxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pJxqG+czKdVDZkWOUx7SzmKuADmb2LZJvvwS84fZrip+pJtFK9EMjLA7STXa/9BxuKedON1WuuDYPqxzqBRDQ0Wr3I78hAj3Nsa1j6XTWb5U+MIdgwtjibbh+SySKmg5yJX+FFD3kKOLvGBuqjZBd/i2UK8vhVHMzFENwTk6wmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=luFXmFdn; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="luFXmFdn"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eeb1ba0468so13044411fa.0
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126278; x=1723731078; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUt9AGf6xrjDYDkMTJVYo9C6PTxCMU+FJu9o1lmsxnc=;
        b=luFXmFdnqI+d/ysDIA3RTU3WqgZ9yJ3tP1am0aV3Y/aKZZbG6tEL0yeOS7fk4+ORQC
         4KhQ81CyFdqrPNF+1SYwg2BoV9i5KC8VQhh09uwDEozJ87jXmr2zymjVZyzYcUadEtzi
         xezVgtGD9E0N8NSVWD3e0CIxhG1tidA8Ro9wCzo9kpIYeKhRerdHvVvVyUXDA1yntBDZ
         Ubzaqhe+RbGUW5VkFxaqySPtpQ4koorlKntbjQubb9WMO31iP92NJ+Ywv9cI2BXU0mLa
         Sfghen0/Qfy6bv2A3Rm/IRTg9TuHqssA1wr3qLRrRTwnlkoNpGeLgUxv4n2vv+6/kYKY
         Bg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126278; x=1723731078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUt9AGf6xrjDYDkMTJVYo9C6PTxCMU+FJu9o1lmsxnc=;
        b=r2PYPn+I7b5dx+Aq21XjyLpJ/D5TIaXZPASyU+LM5AJu8Zk7GbUwRX4MzlA9yghppR
         t1oJrxRp7IaIiple88N8wYyaOq2geT6Uz1RjOstcp3uegvsui9Jy94TusN7UGSLvUJUc
         P7le+LKhkW5r5olnv7789xiDuMCA8Zzh9DjeVqwevO60UTJQjZr/B/Y6TnnQaxWqLsG1
         SsZzZqcfy9JCHsQUFD73hwg0te0ltt0mldzTP6CsNzJRxhR+LxcMftLud1AS77DxBqjI
         70ZZVPdDmWgdlKBZAfuigOPE5b23vONtD+LBkQf8atcFDcfEyi0HdIogZ4LjrNohf8Nc
         oLEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBCqCfNrXQhKiF4UlSLWHW7kcdvH8yK7OA/UMT4QQBSQNrcpgNxUoQa6n3e1xxq0qXG/i8thj1tdGmF65+Z0nGPR+i
X-Gm-Message-State: AOJu0Yy4neCuCjZ8NjH6vT4lzGp3aDtMiuTLBp+OYpaRV8stE2usuqZZ
	6BeBUMbjVPHUC8euT5L1GJxG2WFdbZXzEpKXLqk62Y9SGcFu9cHjSQdGpVSw/nk=
X-Google-Smtp-Source: AGHT+IEY2DAUwJrjHTEH10xM6JFqkX4gRZp5wutBA8Sn+BdIuNTzPwSCN+6Nbt1OGfGJKNwnn6NPhA==
X-Received: by 2002:a2e:b04c:0:b0:2f1:8624:a4c with SMTP id 38308e7fff4ca-2f19de79f8bmr13694521fa.47.1723126278097;
        Thu, 08 Aug 2024 07:11:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:17 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:17 +0100
Subject: [PATCH v5 03/20] clk: imx: imx25: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-3-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx25.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx25.c b/drivers/clk/imx/clk-imx25.c
index c566be848c2d..0474778f988f 100644
--- a/drivers/clk/imx/clk-imx25.c
+++ b/drivers/clk/imx/clk-imx25.c
@@ -219,8 +219,6 @@ static void __init __mx25_clocks_init(void __iomem *ccm_base)
 	 */
 	clk_set_parent(clk[cko_sel], clk[ipg]);
 
-	imx_register_uart_clocks();
-
 	imx_print_silicon_rev("i.MX25", mx25_revision());
 }
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

