Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98918EFDC
	for <imx@lists.linux.dev>; Thu,  8 Aug 2024 14:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723128181; cv=none; b=qPo+aVgfGrlEnoFlmSIDF2sGRZ4ZcL95Jh5ytTW2T1BcjzVoSL5KpXkmwqLWFmWvi7vffteMtpTymqt2J0Rs801iCiIEmOW0YvXpP0ar+wstf1l/PbS0BlnyMC4OQ1dHIJz0YnKg59jisjq9+pmC4UPA3Lw6BeIUItf2SVb3gKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723128181; c=relaxed/simple;
	bh=1ir13MZl0az/9cRAPNM2xtHw/7Fiznd6AQuTHA91Vq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvY3Qx5Llmu1F6cSfZp+vQVe7Y9iatr+FrzMT6P1+i/8RL62UEhuhXOjQVUa1pP6IRL1T4khxK+EOFRLAHo7dqHwFJhGJUkKqNqRJzP4b3WZ0wXMcNEklqpgFtiMKn0CvxxQ+C5ourx1cSMQilVzIVHz7iZ9wOAKLYNDC4sl95I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lxj3ZuBm; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lxj3ZuBm"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5bb85e90ad5so911174a12.3
        for <imx@lists.linux.dev>; Thu, 08 Aug 2024 07:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723128175; x=1723732975; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1g12t0G6k+jblt/poXm1qsZh457ASaKEWb3Du9DwTI=;
        b=Lxj3ZuBmAjGp2tO09gS+ui3J4/Jua/SzaOvvv6kHjeNHzlcf0RBFBVlijK8ukurMFX
         ek8shRzoF0pK7kCX5DWfYvo4Od3FzrdLv1e9WXcmuXJlTwkiKIu6qAuuWZ1/2AYTIFXm
         i+xYkAHfl36wdzFEACqmYrpJ5RWPX5ep7bdsULgKRKCn19itUCLcDUYAlgv6WyjeO1so
         l08UcDZ/rPTAGAg/7Z+kSMgTCrkse/tc/LK/CAZHHiVDZ9WN/OZdHaaQkeGR8sHbB4Lh
         m/7GCugpmYhqo0eoH8GVx8hjygPCVmXpOhIMfb5qIMy6TvIbiec3bXAyFBRS4aMdNZY+
         ePlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723128175; x=1723732975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1g12t0G6k+jblt/poXm1qsZh457ASaKEWb3Du9DwTI=;
        b=ZvS8qQ4IkHqB8bcp83gckm4GNUEW51AK45VHs15lhoHIf8buRoOkXn5DPzGQb9SpTC
         v2NSccksE3mRDNT1gAqFLFcV2Li4ksyixww3YS1PHISHV42cHRQXfgBCAGHLO5VC9LHo
         2hvDvtEaU6jrrdQcpqasKDJ5X9i/ce7gZY+6F0US4xEsm858uUheTNaRNz5KzgDv0jxm
         EIK3SVlXBqvxC30JWzuWtWJj/rMH7TWNvfd7yj5iQdMSAoMgrYumqGD1N7YdOTPF0Sgf
         fwUwurHNaH6pV/aT9DRXymDC7g7P/RdJmqOVOufmtt9bUzQ9HVTrL/Gme6KJanSvkDJ2
         AAyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTk7/uqVp8n0DK3W6unCk4TddKk6xyrAptaAW6DcJxRlVrQD/c52yMxKJPVCLDcKjHeWqNinteo/tgbmFiH1YYzrou
X-Gm-Message-State: AOJu0YxHqQ8TKOvkCy8JHwfe6JfB4JFAf8Wz1U/hGvuYm1aEXO7zGK8Y
	fGqrZMUpxc0vv2Q7WfR63WnT31ET1e1doDHhOHuvRkW2ddWgto3eJsVHsg5pDDI=
X-Google-Smtp-Source: AGHT+IGAVsFCrxEa0nQ5OTtx9phtXWv1jG1gQdi9l9rawdN91kA1XKHVuXOiSginDsSrGNiBP3l5gA==
X-Received: by 2002:a17:907:c8a0:b0:a7a:83f8:cfd2 with SMTP id a640c23a62f3a-a8090c68ad0mr142902266b.17.1723128175026;
        Thu, 08 Aug 2024 07:42:55 -0700 (PDT)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e80e04sm759298966b.175.2024.08.08.07.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 07:42:54 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 08 Aug 2024 15:42:55 +0100
Subject: [PATCH v6 14/20] clk: imx: imx8mm: drop call to
 imx_register_uart_clocks()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240808-gs101-non-essential-clocks-2-v6-14-e91c537acedc@linaro.org>
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
 drivers/clk/imx/clk-imx8mm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 342049b847b9..3f649da0230d 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -609,8 +609,6 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 		goto unregister_hws;
 	}
 
-	imx_register_uart_clocks();
-
 	return 0;
 
 unregister_hws:

-- 
2.46.0.rc2.264.g509ed76dc8-goog

