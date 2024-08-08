Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FFC18CC05
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126284; cv=none; b=p1hDUx6kOEXf0qnYlMKwBLVn4QTVuLZTN0pb9DShE54V4uXL1mV5gmNgc0qwwS2VHbuaN++CXbbKtPdKX3WnzzOvizSnQgLafNtcfqs92zobLzJji+0gjoNQJNVasrRVn2vD1nu1mGFPm4YO9YXAiUBEaEB17n1b3eZdyXDkuh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126284; c=relaxed/simple;
	bh=BM5NOBExieRXZnAEQvVUw0Kowl8OGVo6wjlq8o0hJrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQh1qJnZMwViG57kERxkrISrKZXmblmT/qgv89YrgrL7q7CL86rbMQcwZdHSFx/91neOyUG3oH7PTdwuSYI7UbciIjevPprDBrzvogkmb/1BJ3fD8X6J2zHzBNRd+kXMqBqVQBHDD8imu+oeAldMD/+llcZzwgbuJE+8ZN+XbM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FSNQkIk8; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FSNQkIk8"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bba25c1e15so1189342a12.2
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126280; x=1723731080; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0KZBbN+nQ1FI8ntFiIPj9qlGXoBaHjCw819hVXcAjw=;
        b=FSNQkIk8j+wh/qGEMezA7hvpzal7P6fFJnvGSXh8Vaklohulsgo97SQmcufdwJo9fz
         Vfgw0+5o5nvcb+vrVU6m7c8bioe2uYMJo+mxX5TbM2RTJOEwTxh4t3dbxRlJ3etrm1N9
         BRVJCkUgrJDG7xs1BBReUY71zsKfA+HDbLPnv6YNPnjR1pkeqysMgmApbN1TtdmvGZwW
         ZCo1u2FjFMDS+Dcpa1lO+PEwKLcWzXLSFhD5yexNEdMS/z6avOJB3L6nWG5QGVbukm7W
         7Y61iegVGqEwAf1/SzFW852ePYLEuu+eUpgf66KP57hB5JL0XeBEpPEJyCaD+WrjTOFA
         RxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126280; x=1723731080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0KZBbN+nQ1FI8ntFiIPj9qlGXoBaHjCw819hVXcAjw=;
        b=W4WgN5IoQhQpYcdmRzkDAVq35JW7RegwWprF9B87e7Jqm4bL997cMzF7OdAV411tpJ
         XIBTgR6eMwdxu5PSQGgOB1RuLmGcavssr6aymH0jpPweX7EMrcHT+8SlMCGHNfjRtEah
         bYJR3PBvwM6O1iEYQpQjdO+eVbFtMr0SWQDYuzCERRHQcjfLqGjDd3h9qxPSnsQXyNPd
         1lxanSM3bgQI/GfXGH7ltf53jrtLiDqtl9A+9n/ehOnAlFcXx5TCsP7y71ytkh1JU9h0
         M7YVdvhb5DEcPsbBUQv0ufS/BVQ1Wlelf6TyroWD2lWmv2mJvCsQ7kCMAHKxOqPka/QH
         MONw==
X-Forwarded-Encrypted: i=1; AJvYcCUBr62KbyfZ8rPuY5dVa7YYDG/PW0/I7SVhDOsB05t+12m81FmSWksg7ZYCrEO7sPVtGFiEOrhF0nuPhksOgRi2CTiX
X-Gm-Message-State: AOJu0YyuYEVYKWytH6saBl7jogSoc/EoyJV2mbrgIr0tqf9ameLo/uFR
	LhNR8wxYYc65IpSy9f5h7xhQauoPSWSERXx6zZzIuviXV8icoFiWMCCzwNFgwEM=
X-Google-Smtp-Source: AGHT+IGtyeiAxYcp18rF8HoQf16HSx6tLGtDmNJrCO+VQaF0ML3hsMyoqYty49GZM6aDNVCYElHp5w==
X-Received: by 2002:a05:6402:2695:b0:57c:7471:a0dd with SMTP id 4fb4d7f45d1cf-5bbb21a3148mr1640366a12.12.1723126279666;
        Thu, 08 Aug 2024 07:11:19 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:19 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:20 +0100
Subject: [PATCH v5 06/20] clk: imx: imx5: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-6-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx5.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/imx/clk-imx5.c b/drivers/clk/imx/clk-imx5.c
index b82044911603..163bed084a57 100644
--- a/drivers/clk/imx/clk-imx5.c
+++ b/drivers/clk/imx/clk-imx5.c
@@ -357,8 +357,6 @@ static void __init mx50_clocks_init(struct device_node *np)
 
 	r = clk_round_rate(clk[IMX5_CLK_USBOH3_PER_GATE], 54000000);
 	clk_set_rate(clk[IMX5_CLK_USBOH3_PER_GATE], r);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx50_ccm, "fsl,imx50-ccm", mx50_clocks_init);
 
@@ -463,8 +461,6 @@ static void __init mx51_clocks_init(struct device_node *np)
 	val = readl(MXC_CCM_CLPCR);
 	val |= 1 << 23;
 	writel(val, MXC_CCM_CLPCR);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx51_ccm, "fsl,imx51-ccm", mx51_clocks_init);
 
@@ -608,7 +604,5 @@ static void __init mx53_clocks_init(struct device_node *np)
 
 	r = clk_round_rate(clk[IMX5_CLK_USBOH3_PER_GATE], 54000000);
 	clk_set_rate(clk[IMX5_CLK_USBOH3_PER_GATE], r);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx53_ccm, "fsl,imx53-ccm", mx53_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

