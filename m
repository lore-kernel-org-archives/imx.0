Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0E818EFF4
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126286; cv=none; b=vDHLpZjQcdgkRORbf3M1dN2mu1i5lnJP0gYk12no/9Xy4LDnHKFA0Dt6xphXY0fiOmsnqOrNjw4VhCnioFWWOEBLtPvWi/yeseUB9fRzURL0lTHXXmvPrE3GgEERyZK7sDF5Uy0VeKyjlt9XODD/6kN8DZPgHXd6qhZDbS0zq2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126286; c=relaxed/simple;
	bh=Aa36Al+8XL+o6jnCRaXGcn3QPeSfqDekEcFkrR4ZXoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W4kDhg8oirmSc+VRtjGhP1YfYqNUcNmqxFEgi2TYPqIp1TNf4JMMTYQOxoTBgYCmGB9qmkZqz0z/wdFJskKnUd704mn3XgwqSqaV3RyauxPYJwpv/OjTbpdaBccZ6BpZU+F8UAemJZHSwA4nKxTmZpWn5/tZBieL4MEWyOWbHpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tUwYJzvy; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tUwYJzvy"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5b5b67d0024so1168330a12.0
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126282; x=1723731082; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSaLptLfozVkUpjw1oRI9Gwlbl43zWvMUP09a2upKVw=;
        b=tUwYJzvya7KCkBR3WlUCBBVjKQXBp2khTnzmCI5FZcbm8c96cShn3Q0YmmIAuZfQEs
         IXNt5DwvVkbjujtaCubG/PG4u7txJGheZWO0xT0vC0ORHQfBGY5HOqwGB3IKxQGqdxmW
         pQIoA+x+9GoJRRFNWuKVV4yMFFj56a/Ur0aesCgk5DfC97DBQw2Vx/Ms6XGEvKLGxvia
         6/bIiJKgTA/+orhRkX8UkM/yibyioib9daxM41fscFYJn9VmHfQF2myFSTknuJSQ5pGi
         nOmWKs3xmkJhzWjj4g4Oj7+T4ViadWx2JTKdOGuaVCyQaifyCoYER94jub9Le+8gDLHY
         9Gmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126282; x=1723731082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSaLptLfozVkUpjw1oRI9Gwlbl43zWvMUP09a2upKVw=;
        b=Q4z1mLh2O94X1vVWB80XHkgyHsB33Bat+iUPtdl9sSEAssUXu2Z6zJftLd4q/7H5x3
         tOf0gLTpY07GkgAgrLWOhL82TzgTExrET3ZB+dtwxsewyrCDNmIxlPc22Rwn/Zo9V9/J
         JG0UbAQ3dcvLnVdhfeFdTaO3r5LkbgZ/MO+Yv8P0zAHKy4xuXoMDcJruQgE/+nQHNUqs
         I5wZN+QI29PVFrudG+W0MsQlVnwOiMOmpfTusuLHZHf4FUwc3ZyJ/8vItxStLbqMkS3k
         UxjJgkbUILHTL7AfVM2df6kng4MhKn41AJG+ghaSMJSB8fyR1gjxmifxnHRzIvnreKPM
         6wMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDbOFcUpNFWhLXLn1AKVq7fW/K/9orSc8OF7ybjw7hsgsZqTqfDi9j4A5zXcY0rZW4KfZycImWwHRa9ETQl7Fc9gjn
X-Gm-Message-State: AOJu0Yx7jbYvGOBoOG/NAaqC0dozuu+R1xsoxduzc0Y9/7r1jiQFQ8yN
	6tkRTZjJsRCI3/+MnmgiySVrtdr3YSsgiNZ1KMXwZ4AlB0O2AqtOKKAmcCXv0MQ=
X-Google-Smtp-Source: AGHT+IEfS7LGmhzwOfvg0WuiGG6clp5qzEGX5Jeh5uDmvlBV96anV1MuY8BGYSssk+Dyt3tkyKIdwQ==
X-Received: by 2002:a05:6402:3484:b0:5a7:464a:ac0 with SMTP id 4fb4d7f45d1cf-5bbb21bdde4mr1617742a12.11.1723126281574;
        Thu, 08 Aug 2024 07:11:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:21 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:24 +0100
Subject: [PATCH v5 10/20] clk: imx: imx6sx: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-10-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx6sx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
index 69f8f6f9ca49..4e42e30245b3 100644
--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -555,7 +555,5 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
 
 	clk_set_parent(hws[IMX6SX_CLK_QSPI1_SEL]->clk, hws[IMX6SX_CLK_PLL2_BUS]->clk);
 	clk_set_parent(hws[IMX6SX_CLK_QSPI2_SEL]->clk, hws[IMX6SX_CLK_PLL2_BUS]->clk);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx6sx, "fsl,imx6sx-ccm", imx6sx_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

