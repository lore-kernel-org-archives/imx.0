Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A316218EFF8
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128180; cv=none; b=B9RpcYIPyLB1Hr3Kc9qgKpb01oYg7tVcx45DMo76/TmhXllG/RHaPNSqv0Y97LQL2dyeAxgjUvy+qU+3gBQGvmYbn3YPGxJcCb7p4p3TDScY05xMG0jbBxCVyCSLD0pN2w2YolIQqcegf8UgSjhLXONz0x+ZAQ1ZGyKdBAESG5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128180; c=relaxed/simple;
	bh=fgoFdUktN0AC8jt3vFeTIBwCbSQYaBCYL6rp147Iyig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=irVl2YEv8N7zDay752J+NJb6k6Ke84kdAjobjC4rTTTmAOT5wBkTTFaqgglrQR5xBGaiikfO7VAiKIiSVJx+qa95wVYKju7dDY/M+uulv0PZRRecEwDGCIL2tx1hGNbwuox0WKwOOKUI6ofJUuqNdHbudT9StmfOs1XjqaBHu30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2U15kZ+; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2U15kZ+"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa69dso1062260a12.3
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128176; x=1723732976; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Of9JwvhLlmcEUvlQcUj1kyU6mPikzafRwyTDPy8iQT8=;
        b=S2U15kZ+nyBbeh7XTq6wEMGSu6bjRD0rEvlwaMp8wgEJ6RcYoCf2GkWem5AWLL8VVd
         34d/TVpqpFCTHaT5WO/+R4om8joATnfFfGrsA2gWdH3PeDQSTtbgvu1Vo4yK8RDwjXKr
         okMPF3QOTnfH9Vr9bO2Qk5wJ4Y7+8R9unpdiE4gRxf/Svxw3v/z1DUuF5kouIrhN8b0y
         910Dmde2ry470Lknv07kgTA/iJW2FfMZo4UwHg7zyMw+CR8pxJnz68y+/fHC5Qfb88V9
         EZz8sEtwAhLKpY9jus3P8vnRzPbl5gYGNU2gYjBpNbdFZRTCeR8DecC1jqpfhu/jAQ5F
         SeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128176; x=1723732976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Of9JwvhLlmcEUvlQcUj1kyU6mPikzafRwyTDPy8iQT8=;
        b=ZHB0kIZNyBBzA+03KPr0pbAKTle2eo11d0IQe9tN2RFVcHhcg5B8aFNPgam+kVmvW1
         9KhpGzhdktnhbLgWFx9iNTNzgiI/wbwcveTqZMsv4Z6Ak9kyczyHHcfDeO6YSeobV7su
         zs7TQs2h4t8hpyBgwq+JrFl5v17xYO8JZEKNWmv9R5HV1c6BIg8GqwmwAJ0j+PWvysuz
         qHIUhSWS8Izz16YYkMFDLfITGBqkQW0Uv3afciBR/COq9tKPywceL9QCSOds6koOpBSN
         BD3AVoY2yNMRkw1UMLvobP74i9OojJ9ixyUeeP+vl6lSRN+vJ2SS8Gw/ZImbpL2i1MX4
         Kfqw==
X-Forwarded-Encrypted: i=1; AJvYcCXYUWciWy8VAu6e9iRxEX4hDZmKoqsJ3sAfckTOsCXk/J0omrmi10FPU2OgQyxIvpuPp1035Ddh8Eej+WmzBCms5TOI
X-Gm-Message-State: AOJu0Yw/nm23UOMClysJpzBJ/rMQNIC6rJuk79O8KpvUu51pI0Ky9sJ+
	v/47tZvC7aKF/611I3E5VpCH9Bs8e6TvbCaQRjOoiSaeYRxIgKQC/AdPTGhGkUU=
X-Google-Smtp-Source: AGHT+IFSPGIEwEerUResLzza1dskdeBStZ+yQq7ZShNAdphCslLhbLSN6wQiNk3FONRiktC7/rGCQA==
X-Received: by 2002:a17:907:a47:b0:a6f:33d6:2d45 with SMTP id a640c23a62f3a-a8090eb48a1mr160008266b.60.1723128175854;
        Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:57 +0100
Subject: [PATCH v6 16/20] clk: imx: imx8mp: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-16-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx8mp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 516dbd170c8a..1c128c051199 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -721,8 +721,6 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 }
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

