Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E6418FC8C
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128178; cv=none; b=IGFp0PS+ez3RjpcofssigYXnQeLulwVgnGjA63osYDA/DadoxK0U+UQ+riEtCwrWZi6PRxOdlT/ux4whisG7aODcnEu4wiYPd631qSGxq2dfJ3Pxa3q4uGcMXqUOc0jWtX2csd1+VliAhneKDaTFJAhoTVlJ2wzSzG1+AATMtbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128178; c=relaxed/simple;
	bh=k4Mp7OQtKEMyYQQBprE0etTznHJ6XNdrfUzHCPYj4Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lrhp9iuz+BBOGAErGveX50NACK97+uqXLIbUr1y9US0Eqk7BPxvqAZRShDg+qamBqcLMn1dtNTbj2dduNT6Gj4COGK9PUFEQJ1hnupa/SC3aVwolNQXkrwSHPHtAWCExmHyuHbVQtiCigtGe0fUtFP1CmfqDiBxtfGTTM6EO3Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nz0zfDn3; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nz0zfDn3"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5a20de39cfbso1125693a12.1
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128174; x=1723732974; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sTSIJgqJzgG9ZOeXhaBq4KjYwR+dgEfjYLq292FpHw=;
        b=nz0zfDn3AiGxL8fJXS9xd0Bl9KQXpoA86cdlKtXhmd2MduMf7WajJDo8oGLt4JhRzq
         4Tal5tvAqSDxeDFP28RxzUymYYOpCo7IbDDFDdCSxyN9PTGjq8lDbBVZ6YtSFcs1u79j
         yUkvEs8QcYRdA7n0o7+M8r+Fbg9kV0z6DyYGc+aV919LdRkGBlpfzlUXhT/9XIBpTqMd
         vUb96gIwDMMPFZTjP07wfqZY48WYpPq+cNTtpgu8C4MQTAEjCt3rZsxnxD7zPxT15ubl
         dVaSQ/LkUNtXB5KpstPzWh/ayHpZCtf8FfVpNCVGwewCKwbl50YE66WxK4tro8veqgMr
         Y+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128174; x=1723732974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sTSIJgqJzgG9ZOeXhaBq4KjYwR+dgEfjYLq292FpHw=;
        b=N9csvcC3/lbneFfd8AMgV08UDOQzmgYa6nw56PL9eEsqLMf0mmphYsBDkTcnaNvP7M
         xJFiFxOc/FiZCb8NsNXZcHVkZJ1vM8IepHpG4g90S9UeJVEMbB4+yuRix6qcT55AN9zV
         PiexqL89CBro3v70csHu59TCkjxW7qIbgZ/uhwEUJLVhkeJSfx9c6uA1YhBJFoGOlb+n
         1b9iP83UbDO7KdwmItITbWEVEkimf0tRV9KjmDQw9i1pcQK/96uK08Og6izqVnDkFcI9
         zaZ/EUUbpZq5hETcJraLQ8hYSRPv7vBySJ+QAQHS/RkckWL+4deLNHpZJWKeWgEgDzOK
         ihvw==
X-Forwarded-Encrypted: i=1; AJvYcCXrpMf81YBuaHxTaVG+PUAx/9Ii32fGxsxVgNzFW8BzijRU4WKwKkIROkKx9aYK/nGXKLVd7aDZbP/gxL6YAa2svZfC
X-Gm-Message-State: AOJu0YyOhe0eRMIiSzwzWfd4kF3kEB0SkMDOa8cfs8KeAY6T0NmdRKSW
	FlQ0NxYjf9x+OUV4VN5ICXM641fhB/mf03kEQiCj+F3yeGPgCtaRR7FHKKw8Rcg=
X-Google-Smtp-Source: AGHT+IHR8FpJNdzuqaSJlCS0dga7rPYT+WlNUnJeQS1SMhIWL9rsDOEKxbf+CirVT6VIRhxUGlibjg==
X-Received: by 2002:a17:907:2d13:b0:a7a:952b:95b1 with SMTP id a640c23a62f3a-a8090c82bdemr182009266b.24.1723128174054;
        Thu, 08 Aug 2024 07:42:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:53 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:53 +0100
Subject: [PATCH v6 12/20] clk: imx: imx7d: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-12-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx7d.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
index 99adc55e3f5d..789cc3afd062 100644
--- a/drivers/clk/imx/clk-imx7d.c
+++ b/drivers/clk/imx/clk-imx7d.c
@@ -882,7 +882,5 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
 	hws[IMX7D_USB1_MAIN_480M_CLK] = imx_clk_hw_fixed_factor("pll_usb1_main_clk", "osc", 20, 1);
 	hws[IMX7D_USB_MAIN_480M_CLK] = imx_clk_hw_fixed_factor("pll_usb_main_clk", "osc", 20, 1);
 
-	imx_register_uart_clocks();
-
 }
 CLK_OF_DECLARE(imx7d, "fsl,imx7d-ccm", imx7d_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

