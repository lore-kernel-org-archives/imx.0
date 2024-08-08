Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8F918F2FC
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128179; cv=none; b=fs2Vy8T4Y7zwnvDn7NHz0QTSEX4d0NgdMdLF0HM4ix2qj6+Cc1WSQKPgKyRGwPP2xaTyF2txUwGzLVybaf8d6gCMcDozsaw/EbKHF3/ra+uc3NgNPl/KXTzDJo4ApB6tekZNc/xAQU+OZnGQm0Q/epAeJosLzHa/0rO8lYNJk2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128179; c=relaxed/simple;
	bh=dtBXWxh6pEv7DtMPsjNa6bKadgnceb0rxD2xntEHe8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1L9u7uz+961iLmp8aq1CERPT7G/x60Oos9NTq7kylXyZ9zNYAK88ELCJAO+3zLL9l/tDyfoWBjDJvzKYS7owqpMHMO1KbOuxe7Y0ffG6DMxenTyaFEojPVEfzn767J/DKZ27rBjm+jeOMyz79ak9dFBl8udMy91/X99B/aIVyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LVWtDdsn; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LVWtDdsn"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5afa207b8bfso1083678a12.0
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128175; x=1723732975; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=645sqhYxiGhlKPfMQkDqwsuRcG9BMBI/0rO4pG2w9xI=;
        b=LVWtDdsn+bEwGnth4eCFpkBTsRfs1Zf14NU0ptBUpZqm2D7POC1gy39nJlRmhwlEiL
         RmRwOOlV2KQmmdC77VML12TbKL7ju1L8I2P4AY9fX0dHPzsqDDE/36VEeWgpArBvSRNg
         HIbSXUDd0yIwKhZ8wq4J947nhdx2rriZmYMEKa5dLT10/2aly854OPiXO5qs5/JKlKvT
         mBPjal3pJJcfj49Uw+mrwfLRUpwZpYA12S0hbXhXPVC31Yq5COl5ejlyr6X2IpcR1ZPM
         J32znij3M8SJuhun82Y4RTNbZPd8bPpuXL1/hpNyqby7xvt2RJcgIBY9VSyV+wO3fbn4
         UgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128175; x=1723732975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=645sqhYxiGhlKPfMQkDqwsuRcG9BMBI/0rO4pG2w9xI=;
        b=lykRKBu5HCZL8CaZY/DdHzg43/S22aN3OgieVnk9t1mxmBpd3lfbrbixK9TrzZM6Hk
         dyon3aHoUm6G+TpinMECWuxOm89r+/5hBslUr183AaxJiIcTupf2XZSNLcv1JJHucUcf
         Qm6cz64cC/xO2w32465zttlvKo/beS84unF+rESBgqyaK8goQBfBH2CbvEgkteFVPVsE
         9E5sGmy36c4YiSlQrYx3636izOe/UbT/0jeSao2sMOMUaqWUaka7Bt86c6EbOitswvu5
         Lxe4zu4pLvekfnNdeu8jpQiqEMqoQXBMet1TXVrqE+dvgLGVGcltGM0OpaVa9n4MIsxw
         uJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzK7WGeqDYuNsDPJeZCLtEGo8PURMH5oA51o4RgkHoaDmZJ5P0jaIoi4wgDjHKzAw4oWqX8I9pLIF0CyTJ6wt5Mz9e
X-Gm-Message-State: AOJu0Yw8qXVflsRl1/D9TCucPedfhAzCmabr5smjXU8M6mYEMf5iW9Sp
	/S/6PLSDj1N+VQVEhwHlcU+Bop+D3qx1lrANeFMZDA/ESjxuYHI8tjb6QJoK9NI=
X-Google-Smtp-Source: AGHT+IHmAxlBw4O2VUn/A8heI+wfeEh/p3nxcqvtlZJmde0nHyNMStnoDpAJEr+6mWLx5is/WLQ66A==
X-Received: by 2002:a17:907:e6e7:b0:a7d:3de1:4ab2 with SMTP id a640c23a62f3a-a8090c829ecmr157391766b.27.1723128174551;
        Thu, 08 Aug 2024 07:42:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:54 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:54 +0100
Subject: [PATCH v6 13/20] clk: imx: imx7ulp: drop calls to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-13-e91c537acedc@linaro.org>
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

This should also plug a memory and clock reference leak due to multiple
calls to imx_register_uart_clocks(), one for each clock unit.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/imx/clk-imx7ulp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx7ulp.c b/drivers/clk/imx/clk-imx7ulp.c
index f4a48a42637f..517fb388ce85 100644
--- a/drivers/clk/imx/clk-imx7ulp.c
+++ b/drivers/clk/imx/clk-imx7ulp.c
@@ -175,8 +175,6 @@ static void __init imx7ulp_clk_pcc2_init(struct device_node *np)
 	imx_check_clk_hws(hws, clk_data->num);
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx7ulp_clk_pcc2, "fsl,imx7ulp-pcc2", imx7ulp_clk_pcc2_init);
 
@@ -222,8 +220,6 @@ static void __init imx7ulp_clk_pcc3_init(struct device_node *np)
 	imx_check_clk_hws(hws, clk_data->num);
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx7ulp_clk_pcc3, "fsl,imx7ulp-pcc3", imx7ulp_clk_pcc3_init);
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

