Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F81A18E76B
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126282; cv=none; b=G0660kClDmarpWa/PFC5pVUN6N0TM8xpOwZeOTn0AYoqMTxgYj0jVmlFKfOv6dbl93eGmRF0KfYwjtfe/zKOfZMebpCfU9f4YZm8VBD8/KXWNx6T1MLh/ET1IKguO5qVRPrgF3yDq7JwubQ+nwcsjDCt+qDMOuSDgcuoNBOk6ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126282; c=relaxed/simple;
	bh=F85JnWhsga2fKjX8ofqy8VS4HE5CVI70avGh7w8r0jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A47fwieZY5mvjXD2TidXU11TqCwDd48RhKyzesfNaUTcR81NWX86q6D1NNKV2X73rdcpnMiyA806xE26/dpecesPe/YM1fQS1z6omIJlXV2sjSAAnkPKuAxOy+8EayRrZrsOrQGg8urPNVMkMTb5RMI6W2EMVSV+TP5lD01ZufU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=laPsV/JA; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="laPsV/JA"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5a309d1a788so1021292a12.3
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126279; x=1723731079; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CR2/Ipvc98fbygDSdyGUwyP4a+VA03w16ijfH8oQ9sU=;
        b=laPsV/JAPVVpJ/rxn9eZ7bSCehJbxUo8AXKuPUhqidooKJeBj7uff9JXsPOhzwTdJm
         v9lXKCIvZqGdAaWhlHS0qgckQMYM29aCr4jEGbnegihc69rJ3zrClGEzpO4m7fpJkpff
         bUKS+lFon2RF2Sp7Y5pJctRVZcOss2AiKoIcWsh8Chrg2faz4cBKVlxe0ct4kO6R081S
         iqoLmdUsYGMWOelnJiOdj+mWL7cmHrRroCaVPjl9P1S7NIpVBYvEObhAH8oxa7fI7YWN
         gOcQ81gN/HOms8O+KLMUrWpDYyPRNmHF8iPuq81RF/M3i6pT/qu87IcozrrM1zyOHm8C
         ewVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126279; x=1723731079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR2/Ipvc98fbygDSdyGUwyP4a+VA03w16ijfH8oQ9sU=;
        b=exQafNEz0kp+WrJL/+aybfMVbv/QE9t8vQrYvLhGvYq2K9Bao8k18IxCZgtItBgnbO
         Wkxm1t8l4TaHD+vZZVE1LwxNy1m3eQzg8mRbP1haLvRyQ9FgPfucuqCsjzNsqJiKZuON
         LriEJD+SexbEdRuBYsE2VC3HqAF6t5oHGtRYT8MFnFsnQr+CGQOYtNOE/FcTT5Jnh6wt
         FBVx9JvD2aIq6os2zDTo9BJ8WRA8eCCMjWFhPToFHMibXyCnIJaEUkds2Wujr6ahTrep
         Y/JrgLLg/hblypa1wl6lfKA6zH+0SPGKmYZ7R5k1V5Jbs4uZjQw1O3vo/KCxkJ09g7Jx
         bf1g==
X-Forwarded-Encrypted: i=1; AJvYcCWBP0EwVOp7+Jg90UZeGs4/h+JYQ5j4WNRptSR18cXDevhceqgca1UBSYgxNyzLFIcUil0e1tJt4adbe92vPpiFtUcT
X-Gm-Message-State: AOJu0Yy3JcEqfXJAdfdu51TRhDlvracJcBIT2Wkq4YocoqQcEkT+Lm/0
	MAg13Yw+a+pEXH50Y4JyyUtSDYRfuLwtqoQZ79fxSMxZnD6R/f2oZqSOyot6PHc=
X-Google-Smtp-Source: AGHT+IGQvljBuJxnonICHpQDY/uQkKK/KV1ck0021rT8j6xJghx/FmB4/M4YPS1UIlFmnkBzuBf0oQ==
X-Received: by 2002:a05:6402:208a:b0:5a1:6c50:a35 with SMTP id 4fb4d7f45d1cf-5bbb2411412mr1631283a12.37.1723126278581;
        Thu, 08 Aug 2024 07:11:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:18 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:18 +0100
Subject: [PATCH v5 04/20] clk: imx: imx27: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-4-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx27.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx27.c b/drivers/clk/imx/clk-imx27.c
index 99618ded0939..53018e80ca51 100644
--- a/drivers/clk/imx/clk-imx27.c
+++ b/drivers/clk/imx/clk-imx27.c
@@ -164,8 +164,6 @@ static void __init _mx27_clocks_init(unsigned long fref)
 
 	clk_prepare_enable(clk[IMX27_CLK_EMI_AHB_GATE]);
 
-	imx_register_uart_clocks();
-
 	imx_print_silicon_rev("i.MX27", mx27_revision());
 }
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

