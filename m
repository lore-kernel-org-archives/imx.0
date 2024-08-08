Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5426018EFD4
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126285; cv=none; b=KaZYuPa8VholJHdteppWriuilkpn7Im8/ase0uqTyzgjUyxVhK9QE/Khm8Ef5M5IeoF2pudkUpTr+4lcBAHZM3V+GwttOyb3GwbnV5UapYu0QqPuZFzH8EgacU2xIhfO1kU8xQ0grppvPmX6FGuKLgMmdKgsfDaqWPLiH7CPdyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126285; c=relaxed/simple;
	bh=gR0CyM9a7lgnJr3lEM9JUrDdLahkhfxbkDJhWgDwKZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HA9izTASS5BSo95+W41Rnb+n2UHhM2R3GWkG1AlsNexIN3C/zB4FCIgl9vJzwmgjgqq3BvczxTDzOayqxs4uxdINzX6Zz95wgR4ZvHrFNsK927FqVryIGW/qBsuvNJXjfsbfPuAl67AprGX0Dq2T3EtBfFV6rHEXIiu6N0jwmhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E2sEe1bC; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E2sEe1bC"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a156556fb4so1189155a12.3
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126280; x=1723731080; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l83L9SwgjM7cQs40Ix45OsltdwbTgmJEPf1zQuQtrko=;
        b=E2sEe1bCXQwspiJryzjnS8GeBLLZG0SBCQG3l4SEaKWtVY8bMNDCLLnN8WdLi7yaeX
         rybLIMovjf3OYYXn34HknA4ERSYVo4kzjNSfKF44jc9Pij1WRRMHLlJX+Cmfvtm1+29t
         qh7y4jtqSRMtk7kiTfFd5H6PtgnZa/alXJJ6es1+9YiGgFkNrUgcL/9lx0c4TFo+qf3Z
         C3hjtretVqSksNoU6b6i/dIqYMH3O3HWVnm/lnyARhZgRVO3xwmoe31dXJcqQ1r0Tegt
         AC1t2q0W2VoZt8NRWv7WB/HJsdI+jDfblia/d7B+9tE0qJbI9r/2iHqOGpAEJyvDWKrC
         351A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126280; x=1723731080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l83L9SwgjM7cQs40Ix45OsltdwbTgmJEPf1zQuQtrko=;
        b=iX+1faoHZRqnB17WittXoByI0CX82OCYLIEzIw2ZSQn0oDFDlTdmdWsJOjuSXFjaC+
         jonn8uV3yU7W7jQchMhjIkgHooUj2JkUMNphLq/6LsQxyMaXp1ZqdDMIbqDGqLTyLnel
         s+iMUkAksQRdy/DZ9wqmKU+y/0czXHvBn2NDOBcTwP+mNeeU4FCCeW5dSDxJpaJTZwFd
         HVbUUWWACYiE9kgJThTbkLbxiSB4AWSGNNHcVIWzJWmk0gU5I29PNB7y7rp0DB3oFbbm
         2/OIKZ9N8kjFNbb8sTlSlQOww/yBZkI2KwJh+ft7JSpOzSEp7wEZTnJIQI/It5PJXBZ8
         BxGw==
X-Forwarded-Encrypted: i=1; AJvYcCU4CvKUsA1Dau369ZcZ5Y53zy8OmGm0ntw1Fj7ykwxDiDSYpUGCmYrzZkZ/5Nr+Fz8AWS/qPzLCX3bZxtl5nfm4ZBbN
X-Gm-Message-State: AOJu0Ywm3lV6NdFw0ni2P3MkAj/JHvJvzVdAi6hWnwRpaeHwRTm3p1cs
	PGhm32S9SMk5WnTSnKCOtQ60CBG8GbgSQw+Kb3IkG4+j+4bzejucJP27maV2dEc=
X-Google-Smtp-Source: AGHT+IHHbEYfKvz99NCzEnYTqfn7cB+94G7FgbH5KFNqsiOTBHtM9BvVoArHK526vLwSDjCHbxrRMA==
X-Received: by 2002:a05:6402:27d3:b0:5a7:48de:deb7 with SMTP id 4fb4d7f45d1cf-5bbb21a4daemr1489870a12.14.1723126280575;
        Thu, 08 Aug 2024 07:11:20 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:22 +0100
Subject: [PATCH v5 08/20] clk: imx: imx6sl: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-8-11cffef0634e@linaro.org>
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

