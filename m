Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C17718F2C3
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128174; cv=none; b=Nyr2282HiMAu7Vz7ZrkuXCCl30SoPp4nu4gkFXUO8pcNlBFBo5Jw1osF57mMheGgaXDxZvG0qdN+cq2RanbTyfAVlHznO5iy7pfolD5QqZIodHOk33jMeUGm8FkuL2a4aAazf+C82EXkLa3if29NHJbxtNnw9QiCyfgi/gts/4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128174; c=relaxed/simple;
	bh=BM5NOBExieRXZnAEQvVUw0Kowl8OGVo6wjlq8o0hJrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CbDKqOYBLsBuPNn9/w+rEys/42USA/RsBsQs62dYKzesv8bKgB9a9JiuXPHZA84LaUnrOCSszVpPdc4fFRQExJ3qD59murroMrZ5N1iAwj/6hRdRkKfT0PmfCnNx+iqW4qt6DBVnkbAkZT3D5AafdSx4qaeh2RUqqmknxX/U+iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JU4k3MY/; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JU4k3MY/"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7aa212c1c9so143070566b.2
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128171; x=1723732971; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0KZBbN+nQ1FI8ntFiIPj9qlGXoBaHjCw819hVXcAjw=;
        b=JU4k3MY/+EdrvlH8xhAPQ7kEQtt7Et/oHrgGEGHAZeY6vsBQAsv6P8GQuCTp7fEJ4T
         BHul6+f8R7FW2EJh0V8MnRNyZtRcNTTIFMCPsYM9/figiBn4jMdI2vkGn4Rnks9SXBcd
         BlGnJJr/WGP/q8BkV316OzCq73K6FrEG3PHXx1jD7g+RCIh0jwb2fUdP/yuD5Zpobz/2
         HQ2l31BsZjHYauFUrdaKfXxZUH8rkXJMKq4tY8/zMtV2tspusFUBpElat9pwc6G2TQU4
         aWuejC5pbqE1G/rQ8gyy3cmhzZh/KKVOW9np6gzdPSCUgY5w4zHVGQsZyOP7nQg96ygT
         P/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128171; x=1723732971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0KZBbN+nQ1FI8ntFiIPj9qlGXoBaHjCw819hVXcAjw=;
        b=p2CBCb3/NplOd4h5ixABUITDgCTb2qb9DI2VSz/AUqMZphe6hkotT8NUue+Y2TITU5
         vVoNuUMezU1KNUdGcY9GRbZVd3417yomoi9kCAClqv+1hi8j7nMFY7tt8VtnwWjrR5w9
         v5gs2w37CdJd22PnjAP+bxB564me2DqeS61tZ70ZWe+RaGu8fHkdHkmWM0gSup5jj3tk
         F6hC8QSuU6UUqN20iMndG5wmKjqndU2wI5STkJ/Gu3W1J/ccynWIOf3urcv+1zo2XwKx
         5P3FMdD5y3skHw/G4en0TbMumHxHJ0m8UjqJmh1b9K1l8Pht7IfT8Dyt5CfWyR1bbk6K
         7kJA==
X-Forwarded-Encrypted: i=1; AJvYcCVNr44tI+P3M8Gcim0mhsjGpMkOcOnEZPSSGntbp110NpHonhpOT2cbmjY8IuRpU0BjXkCsGcp2CttZdeVXs9LplDG2
X-Gm-Message-State: AOJu0YyhR+p+qf1rMr5qUwWpzXNtiTKHrVbzOHSCSfRqGFxhk9zd/uBJ
	DH4DyY/fhrjO3+Bw+zlDHCIzkiBAeBsPmFnaZ88l+U5LvB99bPZm5Pa/NQZh9k4=
X-Google-Smtp-Source: AGHT+IF92aQdvuypDx1fq+tYFY5OivN5JbCVt20C0ukwfaeiDnLswwfjXsSThMmHvMSzFV280ksHCw==
X-Received: by 2002:a17:907:f1da:b0:a77:f2c5:84b3 with SMTP id a640c23a62f3a-a8090c828b5mr152030366b.22.1723128170682;
        Thu, 08 Aug 2024 07:42:50 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:47 +0100
Subject: [PATCH v6 06/20] clk: imx: imx5: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-6-e91c537acedc@linaro.org>
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

