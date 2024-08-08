Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7089A18F2D6
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128177; cv=none; b=ZN1aavsn6W7jh7oNkOtTRrmBQ0idPcabGqASREDwv393L8rWaTjHOJ9AI6GsXyKr2KtS2YGg+dv3oBqQPz1dhUAfX7HlnuwXEEeFC0nHlss5Q7aitGgG7r6mner8FGttaWb9k5mHopCpbuj1Yl5UFkc4zgY+GxR/+g9AowjxNsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128177; c=relaxed/simple;
	bh=gR0CyM9a7lgnJr3lEM9JUrDdLahkhfxbkDJhWgDwKZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SdlJiiZdIknhAOopLDmUN3Cdt3RwYm73NOJHbnNmkHk+uSFapxuRK3LbzKtGYwC0tUGDwpjaMgmf0bCOv6PEvPkNyX9GK8boLkdPLyoVuDPJAkyYYSH66hNoMz+H6r56o/Qm1iHAM8G+HlqCX7wDCnOULDQc6zGmDJ1C9TnkbEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jF+NhPdj; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jF+NhPdj"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a15692b6f6so1172152a12.0
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128171; x=1723732971; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l83L9SwgjM7cQs40Ix45OsltdwbTgmJEPf1zQuQtrko=;
        b=jF+NhPdj+KcNewLnPpV3gaci+ZM4Eucsd/2b7MtPpfAeXyoRoVOoWSnFguocDZe+lY
         mMkq/FsG53CXla8eROde04vnbvBzdjhY+e0aop9oSoL6/G0dq+Ys2BiULt7hhIqxgGTr
         KsjkTjdYmU0qyHgsXtj+G+lwE4HYipyMHUQSm1vW+zp3jqyzTUyHQAKxkwekC6sl6lqU
         xHfyFjb79dHRt69qTvOCotLf17OIPpefQ/zJvkWn483QHxyOgE1Pl+S5q4170cNAATcF
         DcqLr5zv9yzp9sRDHYAE/raO/MGsW7GoFIwGp76RY/IBpbrrDfOTEw6clRX4Y9VdHsdl
         UNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128171; x=1723732971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l83L9SwgjM7cQs40Ix45OsltdwbTgmJEPf1zQuQtrko=;
        b=vJWo/TgmcjKB3DuMN+m7yrlQKUZfms6LvSulTyvxV5N/P1sgFnWh4y1VJTcJoXK5zb
         eDUgKLAu/N945E9WMYdYfqBBjwR28YGuyW6ZIDd52FGfVKYuDPw0MY77uzD3D+svp8Qf
         NwoW9xGvdbEHihd87a3p74gcSW/rTqUbGMEembZ2MUh4th4ZQvZRrsx8GY31vOD6ZN7k
         Z/NtSHpTHSt9nbuNejJ7ZBnzntLaUWvVfOuUXTRoAVCVj7mCZ2heU77F6lY4/cALrEVq
         6lfyZlbEIWuQdxc+7CwdTFMx1T1yCxV9ft/E24Uow6IoRizcGnqyDY0W/li7mLtOKw0+
         2a2g==
X-Forwarded-Encrypted: i=1; AJvYcCWe5dMzivT0gU6r6rOdy6IaDfVU1IrV01MGFNjlcE5M1cNOwUpFjIfIaahC80ZwPXuEeRXVBBT4Litzwf87nudBNcja
X-Gm-Message-State: AOJu0YwZD38m9byXcp9q+rfYo/1Ky3rOUozt+Qm1XsathJu1YMNrIalG
	IkdC5XWkX/A4tg4lcj6T6ZSWBMAjVgFS9SU3rym/IXw0QBkDsnoQ0Pbkm305hfQ=
X-Google-Smtp-Source: AGHT+IFe5yBX51Jekzt7C2kWUzgmsjyVacpfri7mMLlLy1Lqvgq+tUY5fWelUbD2TlqgI0C0qNqzwA==
X-Received: by 2002:a17:907:2d26:b0:a7a:9171:88f4 with SMTP id a640c23a62f3a-a8090f0363dmr157822666b.68.1723128171552;
        Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:51 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:49 +0100
Subject: [PATCH v6 08/20] clk: imx: imx6sl: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-8-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx6sl.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sl.c b/drivers/clk/imx/clk-imx6sl.c
index 47b8667cfa3f..bc3e414eeadd 100644
--- a/drivers/clk/imx/clk-imx6sl.c
+++ b/drivers/clk/imx/clk-imx6sl.c
@@ -439,7 +439,5 @@ static void __init imx6sl_clocks_init(struct device_node *ccm_node)
 
 	clk_set_parent(hws[IMX6SL_CLK_LCDIF_AXI_SEL]->clk,
 		       hws[IMX6SL_CLK_PLL2_PFD2]->clk);
-
-	imx_register_uart_clocks();
 }
 CLK_OF_DECLARE(imx6sl, "fsl,imx6sl-ccm", imx6sl_clocks_init);

-- 
2.46.0.rc2.264.g509ed76dc8-goog

