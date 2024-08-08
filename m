Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6218F2D9
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126287; cv=none; b=eGJrimdZinooUZshXCoV2G/aXBees8CISiRsFoHlDAGAYNGlCIqwXF167tkM5ZO4+WrW3sxWjP2wNRaTnQtXwv1DpOFdMJlT7B64an3K/XNzfot5v2ptrO9CfMoX/lkoMmsCGk9l8AfNt417W9cVBzaabSLryrUyXZ4l9zI7qos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126287; c=relaxed/simple;
	bh=k4Mp7OQtKEMyYQQBprE0etTznHJ6XNdrfUzHCPYj4Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CyAqIjWYEpd2xK1TyUQeZnrKrI3REm5wdlkf5yMGYKEQnZjSEuMOyVOAdjiu5fMU9EhKGjhl3AUkbMoQxxDBp5+LY6HNwefHyoI4/S5N5V93WdNxU0lOs+19AFHMPiACBNZzC5Nbrrzsh0cEyZkTTtGDKhtfAkTDEhK71Am5HSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m5UQHOJP; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m5UQHOJP"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso15496971fa.2
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126283; x=1723731083; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sTSIJgqJzgG9ZOeXhaBq4KjYwR+dgEfjYLq292FpHw=;
        b=m5UQHOJPq4sUj2VY9IVG4WitY1jbDoFLOUNo05JEWqVEtyQ6ypoho9CnT55SZePq3f
         d2jnFDeBh5HXQGSIksf3pvEGWRzHVxgzyrp1rv3VIgBaPcxXYhXQd4cknL19q7wj17yA
         dLFG4BrU/7QvrzH3Fns3z7BtuIpfnlfNOr8VCYpBnkyVnf8xPud/zkTeEt+X/i/lSYby
         mYUWl8L+h0QZPvPfaSinXhSRmwki/x6sSbvxxEbsjvdzSdiL1EhXGt20CzqsErcrNhLT
         Rzrbwo2FUmRfDDTnpfdl16mdXd25npfZv8gLWp//DssEB5Ph6hCyjBgivLxD2H1D5ycE
         EtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126283; x=1723731083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sTSIJgqJzgG9ZOeXhaBq4KjYwR+dgEfjYLq292FpHw=;
        b=a7AKegML2DuewrGxW8sTf3RKvwbMBhaEaOsYrK2Zj3uWACQdh+w26msl546HJ5goTX
         lDkJPG74XkDGkixEs59aIxwZqpkRh7+dzfBOX3qfBFIGKPL2FlLrkytom3vOsjb84o6/
         2x+afWv92ALVwWc3vg4efGngN90Wt7tChQJRGY3osQEXV5V2vPIkaaNAe1Aw7PusyS5d
         /WCzC/HTf2op5RfUoiImFEmr28+XY+RPjjB2+6vgV5zKrIiN/VrweyR9aq+R6THzlRg0
         FPzPgEAeFfRc3rkS3lHtSTWIJDKJx63JOtSYzAEVgSXf0N3uL6pNI3/XSJeUQWfXyhhV
         9NaA==
X-Forwarded-Encrypted: i=1; AJvYcCW4QAnvrUZRZWEAVJdG+g5jXeyIZ00MB/UOtqi/8PIWPLylHwPLYtLwUba4c/vwu/cQB2MNZTvHxKGcPEnY2ggcJQ+H
X-Gm-Message-State: AOJu0YyuhWJ+0e8tbqmXCIp11KKRosWVxrUUBrFsjwI+b0ON0O9kFU5H
	seQO7l8akRkwMAtHpx1mbcXfCTNkuadVK6looYZ/o3DV8yhNVWj6y09uewILq08=
X-Google-Smtp-Source: AGHT+IHzmyDjmbmh70t+LjuxJmyPnQb27LIwTkOn9wZAu/HD3ECQGEFR0hg5M02+6uogp0kQV3XniQ==
X-Received: by 2002:a2e:9cd1:0:b0:2ef:2490:46f1 with SMTP id 38308e7fff4ca-2f19de394famr17881011fa.23.1723126282528;
        Thu, 08 Aug 2024 07:11:22 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:22 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:26 +0100
Subject: [PATCH v5 12/20] clk: imx: imx7d: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-12-11cffef0634e@linaro.org>
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

