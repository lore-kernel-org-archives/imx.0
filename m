Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBE318FC82
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126290; cv=none; b=uxMl5teDFe2zUEdM9x2gOKU1ljWsaAAtWZOqeX9GARDZNHm57nhf46+IBNb8fnY2bQQFLnRAth9LobbK+BX+DXwPH3MINQaxvjR36p0CkeJ1kOAdDFWdIXIPMY6VpELin/94wmkTu9rxfENYe5P+/Al5wg2qGp/SZr7jhUSMrMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126290; c=relaxed/simple;
	bh=3MuovDtIRZorURIU9tYKQJVq47VGHfGnfR9ISQ9xJW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CaqdUh2UX33f5QXxaukYLMRJMAvjJkN9PzNn8sMLGVIb5Uk/wRutshN4Ecji0Ao11zjd6XFNtGLrLA05OPJkt8+z5QV1OCuP/T5LiDOaXspwZQzeHVFNEfk8W/OY9mqKWFdY8wdowOwYNVt7gqrLxCtWT2EEC2bPydgufNggHH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ixv+JJfe; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ixv+JJfe"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso1355160a12.1
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126285; x=1723731085; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZspTtdY5QAEUSn7UgNMVbYIWDm0rZtsqchGrqjMzsE=;
        b=Ixv+JJfev4YXOlO+Mf4d2V4no9XACVFU03nKKykAPnBrnkN+6yi2DG/fv7i9if95QB
         Vw4eDxDwU9lqUFadfgfse6mCmOLpsK0r1gFmBaqGAkp5jx7hnoQIgMke1ybrfKzprWWf
         +L/u5BULc/u9lUGZp5bAoilrF5Xl6n30xRomaiY3o0zJ483lvtaiPuBngMSzwWjfpxi7
         Fylk55SOxICdg4pQK2+8L1zeYkflW7LseWsfvlprqTtwIQKQGEVaa2jDaRJp6wi8Qj5Q
         rlBY4EjpgLu/E2mCiN+WEAE3NT1RoJPT88vCuE19lS9LJAjsHpVukVAnnVcpM6Yfs/3L
         PqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126285; x=1723731085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZspTtdY5QAEUSn7UgNMVbYIWDm0rZtsqchGrqjMzsE=;
        b=r3H/pwnTS9jvetUDU916cm5GD3iMJyiy3OkX6yq+FY8AVFDuJi9GrvMoMwNSUBXKvq
         7jeTFAsZVmgHXbRbzqzKTPCInygPwWwlRoEjHvGwzlgLeAzpyKlBSxmWrnTJjEx7I7UG
         E5T88/a31NtMJT3Z2gu8aCcFIM7Ov0nyVF3g8HyOLo8fz7jGfHbL529h+OoVQHZl2yyd
         1x3eUKSmQdxs447vEpbil7G/f5bM2Xjv6/02WqDtgFXSf3q612Dyk/cFnwga+BAHuMz5
         f4gfDOMj8aVO0e4PJLXINDS1lJMNUcXuO9gxLqwcpQc+eG6kqlye+ELX5KvPm9s7lTI8
         BLtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDfeAxY+cF4udw2QWwvXi7ZEbiIz0jgVZ24uivxM9ToOPAqn3Z27l3shogxbwq6RqIHUmZxemV3xdyift0GuYvj6b+
X-Gm-Message-State: AOJu0YyQQBjFxd1NaI7V/9THCSglm5B73JLDCOD5ek0Q7lIckbs3E7/9
	aGWs/MtBs71YjsOGx3yyCMqsBPEc0O7tZHKzVPjZO4Le8Q79KOMiiVW1E10O0ak=
X-Google-Smtp-Source: AGHT+IHNM0523YZN7FUzZaznT4lLi+UUQ6lIisgSbrEP+7eTyr4/ucborIocaVgNqxpxXRdnhPG6mQ==
X-Received: by 2002:a05:6402:51d0:b0:5a2:3453:aaf2 with SMTP id 4fb4d7f45d1cf-5bbb21a433dmr1559817a12.10.1723126285323;
        Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:32 +0100
Subject: [PATCH v5 18/20] clk: imx: imx8ulp: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-18-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx8ulp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8ulp.c b/drivers/clk/imx/clk-imx8ulp.c
index 535b6364ca7e..5531e51a1e80 100644
--- a/drivers/clk/imx/clk-imx8ulp.c
+++ b/drivers/clk/imx/clk-imx8ulp.c
@@ -385,8 +385,6 @@ static int imx8ulp_clk_pcc3_init(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	imx_register_uart_clocks();
-
 	/* register the pcc3 reset controller */
 	return imx8ulp_pcc_reset_init(pdev, base, pcc3_resets, ARRAY_SIZE(pcc3_resets));
 }

-- 
2.46.0.rc2.264.g509ed76dc8-goog

