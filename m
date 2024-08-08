Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADE718F2D4
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128181; cv=none; b=FcZNKbkb1B0Gv8W0vTgx62E6yf3lbLvLymU7fxyRb7OACrxoK4wv3LBbl/WyicCBYTQAh4Hg2EkmlRDZoDxfVf1f+mB2vD8egLN3K58EdK1ytCxzyVKh6rEzJopPErk8LC4mJR7QMVUqEWGQb8197wxSx7LtBDHoKJXtSc8bp+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128181; c=relaxed/simple;
	bh=IWr4xOLwFlcBBVMqbh/CeNYKnBYkZvyljj8xB0z/c08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJqMBgbZqtld2anNLBcEbzFTJifbF3qSbnwHRgfyu2BXhY2vzNcKW9rykH4Zbmh1btKcZrVUAhchVKbpzvtH7OC38r1ApY0GVUPsrFcpw+Iqyj19Ky4mPIahbhzPrChYBiz6DORi/Ia9V54rGH8gw4GbmgnoOvCKCbodZE7psbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TM/I24sG; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TM/I24sG"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a6135dso1405980a12.1
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128176; x=1723732976; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhprNA5ngdnDDPt6+AGX+wASXbiO8LYK4hmScrmWYDY=;
        b=TM/I24sGyC9JrCVfrgsGsGCOo01auWOzQNaJdDRp5b68HXQlkb/h/2RiLfI2QA9+Pk
         ZAalxU6RDejjEZ/DXkRvjxVs6Iv9RQj55oooqv8zMcLRck3qI7nW8Gej8ateKq3tyaMN
         VaT00Sp9NHtk+uld+RoabI1GoOadnHrrt6ks8kqoEhoWeuzhJWJwggQTr77LKaHteBc9
         NwgXm+UuHTa0un6A5dE7Cw31vf2h89j+m+Cwpi7zpU4Nlv5u3TsP7141ndi5OKM48M8U
         902OaIkeLNO+NCoUz2tti4WuYPADyB+a/cK4AOqN3tTI/JfqicU8ucUMTuaivmjQ2pL3
         PdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128176; x=1723732976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UhprNA5ngdnDDPt6+AGX+wASXbiO8LYK4hmScrmWYDY=;
        b=XFAwbfU5aPNvR2j94lgtBXBddJjYFNJ+Z1D4lkRixCHLkfRINBgBh4e7EK/MxKC6lw
         ARlw6JxsNA5+h1WGzTRl3r7wcUdnQZnzC42wj1HXVYMfrfB1pAXEHXjKWY/QP/23dIRp
         Ei0GhPvLXoNilRD4z/S3quvKBYskFK/9ZI6oWX20J2AzSfDJ5JEuiDBNNs3qwKvzDFnm
         +82RvRi6Yx6l5Tsq8g0WicthuQIxCuBM6wcM8/zqLqBgVYtI/Bhl8683wKq6j0vMN+/I
         nJmuQNw5DO0hsXcJcic/3AVDP8I/T+yNsoVfM/836c/FtHjbBkyMQJr9u2/rW3VKorr0
         nTZw==
X-Forwarded-Encrypted: i=1; AJvYcCWQhueszoG97ekiXkNNjILcfA7GL4uLr/V38fvjHsSe3mLcwXSVokgBkwQ+amULp0l5XTWspBPCUj33tgM82NpHclZ7
X-Gm-Message-State: AOJu0YwJKZtGum3/yARA7bPXB2IKoBQ9venxEONja/cfyuOrdapznsgj
	XHYTQLi0nZ3WffmZfkgoSC+O7wo0OIVkv1Tt82bOl+Aagc8Xna2Wh4lTug4kSRg=
X-Google-Smtp-Source: AGHT+IGqiI0vglxKcqyNtx/0toY2g/EAxqDpRfsnT3HZrYPk9OUoo9cgt0W0M6U+BQ788mgVAuOhmA==
X-Received: by 2002:a17:907:f1dc:b0:a7a:9d70:82b9 with SMTP id a640c23a62f3a-a8090c826fcmr135586466b.17.1723128176276;
        Thu, 08 Aug 2024 07:42:56 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:58 +0100
Subject: [PATCH v6 17/20] clk: imx: imx8mq: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-17-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx8mq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mq.c b/drivers/clk/imx/clk-imx8mq.c
index f70ed231b92d..db9aaec42800 100644
--- a/drivers/clk/imx/clk-imx8mq.c
+++ b/drivers/clk/imx/clk-imx8mq.c
@@ -604,8 +604,6 @@ static int imx8mq_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 
 unregister_hws:

-- 
2.46.0.rc2.264.g509ed76dc8-goog

