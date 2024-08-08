Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6F318E77B
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723126283; cv=none; b=LuTmImEladJdIhpe654Hr+rIXyOfk3Hv/QqFSh9vY4GCi5m7LKItQ2VUBPSEYN5bl9Gq4LOQyVLzGr59Kvjm7cv2PVsmC6VidLOTPRpKDmxxhlfLt9StxRyKZPI5kTOzgke4Ih7p1A11ZPS2aJqOhCKURDDIlCxlQzZpaTEzOus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723126283; c=relaxed/simple;
	bh=HMlBx4X05JcRgo1zDJUFrZT9TkayrN7B5twwxpWIidA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=daeZRrFkARYXdFUhsWuwc0FJfCDo22OdW9CNEGYqJH2Gc6Z9ZOOxTFy9JX/nl3KZ8CzekRvSyd9yIQWF8oHtIqPQAZGDIbZNi/XGZhgp+XWa/Q6tjAXXp1VVCtWovzV7PccDT1RUBKx14ZK9fdEsel0/gLWuzdyKbPfX6Pn3cHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lntpcp9X; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lntpcp9X"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f136e23229so10196871fa.1
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723126279; x=1723731079; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9to+L9bTdGJqYL9Sfh+XmsCrqySZTcdIgL2IwvTZdM=;
        b=Lntpcp9XGI8CiX7uwLShQ7Tp8sKxgdp0ThT+H6eHFKrxCp+H24HP1Y4lhydmzcHQKK
         nhdl+nas/KwDdYKkPao03xSmjQi9X3qomZDcQA03E7NZYBqToNJTqgaNu+wCHpdHYgDm
         miILG/4UVMZXqscgomdq0SkkFZhRsLBKbugO4CqaDP7/9BWrAmxwNdUnmwU2DNOj7hNN
         Ix+PErWZnx8slkJERY0BuYv4wswVBqA1RuYow2tAgF5xBVG+5RwMvNGcJK+ei/Hm6hfh
         e2XIMw01Xtepb3PPJBr91VSbCly+mpSq6Vyk+FXxI/Vy8SZlEWDO8yz/ieClhyxYI6lB
         PGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723126279; x=1723731079;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9to+L9bTdGJqYL9Sfh+XmsCrqySZTcdIgL2IwvTZdM=;
        b=pmiEFBLrdgA2ZoTYt3H4zA/aXMj0yHJR7KZE4JeoT3bagC5oFsm4hksIZhjnC6tJDM
         RLMCjI+KwvXVmIdNXnIRVN4U9j2WP7P+VHdBhhIrt4aFzoMN13bR8pLyCDnvY+ksNtbq
         /FIWM2KoIdcBiaJ5hSh7jbzCevhmaMIpQrlqEFtFJG77ZI+eqgDR9L47Gc73TGUkV/wt
         zK0N6EZeXwbV+BilucdIBoLXmCrOReRW7Ns2HT5W9f8Hqu8iOpQoXzmBjD4xZhdea1Tz
         Pij3TZXrK1xMi7GMDTjoYpd8Nbiiw6LeBsFwJSHkMmuaf7g5wL03xlSEP0SyoBVW74Mq
         YwHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvfTzWIC4x4H3Xcg0asaMOnUUV704G40UtbtP6I5eHEbtzytOGl0fg/FT/GcxxlGK7p+Q2qOnJJI+p+wcS6VUTBTnE
X-Gm-Message-State: AOJu0YzII98iG4lHklPqbeYhGG2la+xzZErpqCukiq+Znfuxnrnswdxq
	zEZpnb4rmZXiih2CXybJHjOrRghVI1VbnLwR6kM2XfJsE7BLXHsNVY7J65FEycc=
X-Google-Smtp-Source: AGHT+IGWH0S/ei/y1WthSRTTdpDm06f1SlUXQDUywXr6T6gJBaiJZrXYiF4RkJwrM9dehhv/LYiJsw==
X-Received: by 2002:a2e:7009:0:b0:2f1:597b:9aa4 with SMTP id 38308e7fff4ca-2f19de63496mr13785151fa.35.1723126279118;
        Thu, 08 Aug 2024 07:11:19 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c29f79sm671761a12.33.2024.08.08.07.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:11:18 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:11:19 +0100
Subject: [PATCH v5 05/20] clk: imx: imx35: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v5-5-11cffef0634e@linaro.org>
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
 drivers/clk/imx/clk-imx35.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx35.c b/drivers/clk/imx/clk-imx35.c
index 3b6fdb4e0be7..00355a187340 100644
--- a/drivers/clk/imx/clk-imx35.c
+++ b/drivers/clk/imx/clk-imx35.c
@@ -234,8 +234,6 @@ static void __init _mx35_clocks_init(void)
 	 */
 	clk_prepare_enable(clk[scc_gate]);
 
-	imx_register_uart_clocks();
-
 	imx_print_silicon_rev("i.MX35", mx35_revision());
 }
 

-- 
2.46.0.rc2.264.g509ed76dc8-goog

