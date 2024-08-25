Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858E113E3F6
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 12:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724589396; cv=none; b=eOo2U62FkQjtZjLz+zyt29PUrphPzYA6nYJbumwsc5SNyDANrwsaPRriRFQZSuouSXYxDzX+tL0afeInnRCVz+C6hYMObA1ryTZ52eaQCPLgSEeSlUH59OQWRmN0/1HZ8Y3TLg78PoCPzP19ow7X/Qz/nwV/TSKA0+xAPFyF0Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724589396; c=relaxed/simple;
	bh=77c2NJVmdWrqGHVnDc3yMW37k+HNUe9SmurV/a/Bhrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNvWodKY71LLEdACbMv1Aisd+zE8D0Cm7eZUh0wFxsL2vUUiDgRnDsKXREyk/FZIJA9ZHOF2wzNwCRWu2bMcifh2l8aIZ0yHEz+kcp5q9Z+3LSPj2EwzfPpEOYbHQAChIHJ8v8TWMhLFvFLdYwuIM8ch3uewt0M4YIUAvibs8fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=GMfUVm8k; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="GMfUVm8k"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a869332c2c2so503548566b.0
        for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1724589393; x=1725194193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zf5APENb9JvqJNcRLDTY5Ylob0hcYN8J/GA4M8ib6BM=;
        b=GMfUVm8kuDNVxfxA0YaLlfWid+pZNoKcA2ZV2XgIZfXJL9sYMCdyXLPli4A18Xfi5F
         rOkHqBbvYviNcsc2F3vfhPu2fhLgnx5ZpXqfjX2pU5Cn2VTg4rh+NkAFoRvzc6S565jZ
         q0Nv4cshgU9PMyYdbmgCI8cpsjhLmpT+Vsry8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724589393; x=1725194193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zf5APENb9JvqJNcRLDTY5Ylob0hcYN8J/GA4M8ib6BM=;
        b=cI95WUR6FERAchdOKixQ3b00madgHCzfy6RhAmTn43wNbuJCMyNpennhsnehfNsKOr
         wauEG7ejxnst2D4zUYGRk6l3oiQYH9NUJYqTpQ6L6xirjv3hSFbLA7ic8LrnUKV6LH8P
         mEOv0vlw4ZBKNMGAAeMSz7rK46ORcTi6KI9Sco/0/pTBB/Hxn7+ZqjC5tbK/i8NN6xJL
         +PaKlIIOp1HMhZqIh++PR4nINWABLga3eeKpWgSLl8Wh3dSDr7EUEpmdTAd4XhXmTV/J
         v81jfGHbCi1w/bCeX03WHVR7xfSZ/SL4qCdD1jX6qf9gWrvErACjU1GT/ATfF1iRs8XD
         BEIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCAyExqTlC4LS3VHKjZg0yiqrjyVy4Y51rmFdSRnQmJCndAP11DV4W2ChV/3oZRCmkROs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYrE7YQTLpjZyRZ+gfw85ZDHOB2L0RQJRDtwDJkCVlJh1AI8yj
	/aVKiEq87IuBOh75j5LWTC2SI4MQROlAh49WTSrVrgW9E/WKpNL/MixMye63UVk=
X-Google-Smtp-Source: AGHT+IEbIXr1Vpjt4uEgQC8b02IKfOC9sMIl+fcxKuvrrz9/HoMBQxzPbmHf4J/JyeD54FTi1+274w==
X-Received: by 2002:a17:907:2d11:b0:a86:a30f:4b00 with SMTP id a640c23a62f3a-a86a30f4d3fmr825679566b.27.1724589392821;
        Sun, 25 Aug 2024 05:36:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-25-99-149.retail.telecomitalia.it. [79.25.99.149])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3e89ebsm4350404a12.43.2024.08.25.05.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 05:36:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jacky Bai <ping.bai@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 2/3] pmdomain: imx93-pd: don't unprepare clocks on driver remove
Date: Sun, 25 Aug 2024 14:36:15 +0200
Message-ID: <20240825123626.3877812-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240825123626.3877812-1-dario.binacchi@amarulasolutions.com>
References: <20240825123626.3877812-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The removed code was added to handle the case where the power domain is
already on during the driver's probing. In this use case, the "is_off"
parameter is passed as false to pm_genpd_init() to inform it not to call
the power_on() callback, as it's unnecessary to perform the hardware
power-on procedure since the power domain is already on. Therefore, with
the call to clk_bulk_prepare_enable() by probe(), the system is in the
same operational state as when "is_off" is passed as true after the
power_on() callback execution:

 probe() -> is_off == true  -> clk_bulk_prepare_enable() called by power_on()
 probe() -> is_off == false -> clk_bulk_prepare_enable() called by probe()

Reaching the same logical and operational state, it follows that upon
driver removal, there is no need to perform different actions depending
on the power domain's on/off state during probing.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/pmdomain/imx/imx93-pd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pmdomain/imx/imx93-pd.c b/drivers/pmdomain/imx/imx93-pd.c
index afc482ec563f..24e5bfb336ca 100644
--- a/drivers/pmdomain/imx/imx93-pd.c
+++ b/drivers/pmdomain/imx/imx93-pd.c
@@ -90,9 +90,6 @@ static void imx93_pd_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 
-	if (!domain->init_off)
-		clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
-
 	of_genpd_del_provider(np);
 	pm_genpd_remove(&domain->genpd);
 }
-- 
2.43.0

