Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E09118EFF5
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126286; cv=none; b=QBalIUte6+8BbkEs70Sg0bzrBFXEs2aqLhfbbZQOy1FU/zDoV8BfUmpvgep+pvhkZLX/4y8SOE0bNUtFNqopGYkvwUJuTUHWaTbLBHCnCRDbVr6efdsArww5rCHoBXpQiZW9ksOavQiqxnDJns9O5C1CAl85VnjMR8GposMf5RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126286; c=relaxed/simple;
	bh=F8XBaUKciL76OFnGIv5KAgXWQ49BMItLdMHThv/YF90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GAf43QDe+CJL3NLZumv3cE6D6002z7fho7eFDK9Vx9vXQARiCanPwG4ex/ZObp4CdQ8dmVsVJ5vCjaUYngiNOnhDMpgRm1UmHLK9iH/Mjb+2H5CXijv37m/fm+MsDjUJmil+RcJ/dRZwHjssfYrC3exZ/rRDRSoqYqnTTk3Lgn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uQltJrNo; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQltJrNo"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ef7fef3ccfso10277071fa.3
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126281; x=1723731081; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EG/ZG6dnK/7FkbT8sGSrbUNfGaArXZW8+ft27slBbKg=;
        b=uQltJrNoQd5GZrzgGJTwAt+2mqZWyIvc1Tt7RSiAd7t8yoFTSIEVlR3jC7cvRMjw/E
         QGpQIqL7Oyovsq8g1IjWHQrpo4DxMA9Ep2tg+2b5BLPvr/YTVFnkCU5ayPqvDMhI4TZs
         5UMsbr4x0D+f1cmm0fXwJI1+Sxl+l01udvQOQond1yBiPZ7Ki150ItL26Ex/ljkSzs46
         NJ8sUvVBGAlyqoSxLwaa0k2oYbd8NrZlIQgwMJtJIlXEz8onfdw9oFLAJ31x+Hy/K7Ri
         eQ4mDawVVodYLrkUWdYxcUIrWjOnDwAy8skcxGpg1Wx1b3oN8Lx5Ox4CZ41rm3+gWGNo
         Pb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126281; x=1723731081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EG/ZG6dnK/7FkbT8sGSrbUNfGaArXZW8+ft27slBbKg=;
        b=EucYuC+wdgiqlBLjm6TDCmstHHMAZC57RVFx/o15JpIQHTAbZE0RzmVRk1zHgI1WW2
         4g2GCGsQVnaAvWAeTNEKZuiUWUpOqMe+++aUhVJ1OdRvFbozCGtnNAy3Lf2jz9V1zDSf
         XEVsmhN7RejsLBHRhc1h+VyboUXAEWzPPV3zEsB5+rnU635mLSj9/kb7wDXfn44jT1C5
         NRD6/KTeAywh0cAAl78TyJk2jfIc3XwysXXMWjNPnQQzOyoTuFg6E5rK/QtbE9QkBVnW
         ZTZdFqj/UWxwbdQWp0DeTVxILgnj7ps/HDncd/5UB5yXtMWPNHOF26Hg8KHVkDJw4jR8
         Ni+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyGW2OSxscV2Ut99iaP8DZYNbKWVMPc220sBteVfIKCW0gqaegBoeFkgZ3jXDP69Tq8vklIOAAD3NNwfmpL3kRwvAV
X-Gm-Message-State: AOJu0Yycgrdcn/rvXjn+hG8Ni4aG6zi8Uo/exOPDv/pg/2zKdC82MmhO
	LoO2J7NDPgG3AdLrHwWS2Ik8P/va/8D4F1MwkyIK6dFIvF5EpS6FO040EP4EPBU=
X-Google-Smtp-Source: AGHT+IE+EuzjKtlzVGUkIG93q6FhwJZo7ntOcGAcERKFIalXABnZj7xmQM8pOykTOJhv2cPudFbycw==
X-Received: by 2002:a2e:f01:0:b0:2ef:2dac:9078 with SMTP id 38308e7fff4ca-2f19de2a28emr14087411fa.16.1723126281066;
        Thu, 08 Aug 2024 07:11:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:23 +0100
Subject: [PATCH v5 09/20] clk: imx: imx6sll: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-9-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx6sll.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sll.c b/drivers/clk/imx/clk-imx6sll.c
index 2fa70bf35e45..4310adc5d54f 100644
--- a/drivers/clk/imx/clk-imx6sll.c
+++ b/drivers/clk/imx/clk-imx6sll.c
@@ -340,8 +340,6 @@ static void __init imx6sll_clocks_init(struct device_node *ccm_node)
 
 	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
 
-	imx_register_uart_clocks();
-
 	/* Lower the AHB clock rate before changing the clock source. */
 	clk_set_rate(hws[IMX6SLL_CLK_AHB]->clk, 99000000);
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

