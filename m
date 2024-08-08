Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63AA18FC65
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126289; cv=none; b=KDIlK0xmL54Eyx8huNRPHVzoUIm1DCtRfN7IZh3HJkIr+dIf+kiY0eLB0RxSM6j9HP10vORQ9ztZhbfK3QqQ5C17qNACKl26hk4Ff+4QkOgqdHrS4avxBWJTD5JXjFs0mfevEAW5PbmDk8UcvJTa9FaJA01ftGoUoJhXPDHaQJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126289; c=relaxed/simple;
	bh=fgoFdUktN0AC8jt3vFeTIBwCbSQYaBCYL6rp147Iyig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hf3n/g538RyRWP1ZazY73VULJxj+j8z83dLcTiK6csGrMq9Hu+dCRTPWCCMW0LEf0mq+r3On7ASK3g6SE50gNExMj46Z4SffST0/RJdsxJUKBSIFLzGgf7RKGE/vQhGTUc/lTRsel7K7y9OnrqDwd9xwgfFtWKlpaywF67tNGdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o56FJZAI; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o56FJZAI"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a15692b6f6so1130830a12.0
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126284; x=1723731084; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Of9JwvhLlmcEUvlQcUj1kyU6mPikzafRwyTDPy8iQT8=;
        b=o56FJZAII1AfATLnVSu5U3ArGVL4IBXAmiPuxvciGU2vC9ZsdbNainCj8jO4JQ2pIx
         5xHFUJeKe+z2e2toQj0tVbXdYMJEgm1VWKrA3ha82pWVNX4St0njeJ3DH18N0rE9F/fp
         jxvinYtbY5W+Xi4PVm5wloUJuDM++Monhln50V59VfjV5kn6gYisRnOHUE+kyl3B1w/8
         U02iQUjaSz+4EJ+zent4+FWtFCKmXIBoeb9yO7gC0OM+hV392dTUn06RKRZvNiCZgjvc
         0zwJtpN0JbHqfIwzTCD8lf2GNh3NveWZHI4z/YmlMm8c2NCIFkTMlS+pmKUqjxhyUGdd
         qvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126284; x=1723731084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Of9JwvhLlmcEUvlQcUj1kyU6mPikzafRwyTDPy8iQT8=;
        b=Q3S7QPLEURrKoIwFgHSZxiCOM+/Ua7+7TBafMqzqiDh4LnXttcto20+80M5245r172
         CdkUg7S2xBs0IEfNAzvlz7FeneTRv3Qu4Yl5ZM0QAJDmBZf0rNOVH/To09FsOdpLA8fB
         80fGjfFRDQaBGeILGk0lxfz0htb4mGjg+c4xHpe77F3Wsh0i3Z79qU3v3w2AadkwIXt9
         cVoMUp1AOjqUFM4L0/n13a6lLC+vYAdTgtmekunZ9VtvtSzw2PKeJSxa6veTnD9KsIty
         Zui/vaCyn8KfIC6XVTdEM5PLLNLnZ7vJwDJTNEijHb422Gz0+nYeTTfmPpHx+W5RSNU2
         qf+w==
X-Forwarded-Encrypted: i=1; AJvYcCVawKWFgURVK6zKYndYIQ1GvwJPablR+4ctPMoiYmwAsjkPH+vVF/IlTH7UiiUOcz3e7AaE7AinOJkt4LoVC4ND5uqB
X-Gm-Message-State: AOJu0YxSMYxMFGUtjzWNte3pfZu3w7TmVeGmMARgTQxquluxRViONLjC
	NZuH3w6mK9LvwWcEg/ZKYdrYG9XoQY2tM9C32Nj52thvrLJNcLfLuo/dGWBtxfs=
X-Google-Smtp-Source: AGHT+IFf3g/jYuJvYQwgVJBe8vCrF8fGufVkSyYm1tnaBSWaG5CaYQLX35KDxCAtiZcxjnLr0qD2Ng==
X-Received: by 2002:a05:6402:210f:b0:5a2:f154:95f4 with SMTP id 4fb4d7f45d1cf-5bbb21d08d1mr1734856a12.22.1723126284388;
        Thu, 08 Aug 2024 07:11:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:24 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:30 +0100
Subject: [PATCH v5 16/20] clk: imx: imx8mp: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-16-11cffef0634e@linaro.org>
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

