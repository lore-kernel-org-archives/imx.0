Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660091AE875
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204085; cv=none; b=lHj5Yqn0hLQ/ECD+JmA4qVkqQGvnvgyT0gcBdZbb0VUrhu24uFxDifliSa2Hg4rneJ0AgiFOXNpmQtIFv3YyGjpryg2szfBaA2bV+SD68AVqUBTWSXl2eMZRmqg+51z8c6uWHqQJSUJJH+ayNyPwgBoTzkWS25WGQJ6SVPIS0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204085; c=relaxed/simple;
	bh=CxRffncRwH3IUaOFkDWEP7ifdyjoZqiynS9duHP0Dxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BTekrO6fVpSYNlSJII8211Xg4pvWg32wX3SXzMpFN5QpV/86oM7J287ikkL0u13DhVL4XyudKioSwLqj/3gndn6fvKMs/fYYyOEWoDZBmX93cJXaqpeKHUAz8P3PZ15AJcnqY5N1GyTgq22PORIlvCffdNu72T2ImE7b28k2P6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ehfgtkfM; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ehfgtkfM"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaf6b1a5f2bso790875766b.1
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204082; x=1737808882; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJL+gbh4MVrHU+PAYDL4LrbInhBcvCC67N3SxstDEjg=;
        b=ehfgtkfMinDyDa4syp9KUcNK3/Vvzp8GYNWxGOTgk3NTEkV3nvDVqvKdjXAd+uchKU
         /mIRt6uDFk2uPKCIsA7upNxtjoLCtM7r9/wW9uh5T7Ssi9mRI65QvaCYeFAx8DsZ21Dg
         ozEET8NcHvrZ9WV9KZnxfuUB/QlVW6ejfNl4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204082; x=1737808882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJL+gbh4MVrHU+PAYDL4LrbInhBcvCC67N3SxstDEjg=;
        b=dB4jEe+kXZclQ6+fobxU4eqpFre+J+3zwWYjqKcHqi53T7iqi54F3Im08iYzpPPknO
         Cvn/DiGpDYwzWzyCRP8ivWJyIc5qBXJn/4MKraAB31DcQh9uZ5keKeEPR+nnAt2DSl3/
         /fEZZcF5QPy9o27S5VzYLzEsdDGIuObhpThvSvF0v98tve8tEH1pXziGvJVQ9u3EL08e
         m3nNDSZ66SF/S23bbDNBXb0aavRH3EI2zALyTQoNLkLi6rr9FHuN6mBnewBJh76sSB6q
         oFEp3C1/2Pz05P+7RlAPI9SnLE4lsx2tJdSm5LBplI6nd9cktU3k4bDw2ZUewtEGNRIS
         6SKg==
X-Forwarded-Encrypted: i=1; AJvYcCUaMaOy9QdQxojlEwlUDIhbMP1uZzruwTHAcjLGCrbzwnd6IveK3W+wTtOC3v5SVOyMz6Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWGHwLclLGcP6kpAN8hfCojNYcrBDBN/bZFoziu2fV8WO9V7Kc
	RQFZ2szxxVIwzk9yG+6D/jOwU7m3PGh7u1bYLmwHrLWGSSTsoVR83a4Tnjxw9qY=
X-Gm-Gg: ASbGnct/OdLVN51rqQlCzCBC3tgdW0YmnKPF2l5rJy4iOg7iXIu1RTymql6PZkBwSdr
	VB+gOoyipj73bzenzN6a5yAVd8O3RfeGUdY/Lso7dSrI90b4Z+o99GMYx1psBfTXcjEx9Z1s9MU
	pZEEpLYGw3cL/MhkOUHqtVSfutV+yMisDxufy7YyKozclJ/KtRi8lo/Pxe/zK0bEzZXdViUkFRr
	mwy29FPo1TJxH+NQhxO1IWnuEewOJLqrVJ5PkAJvj5p14D4fVHPxc3p2pok5ab0BEgQUji3Sgwk
	jlQMzW9Y9prNmMZNdeBe7v/3RIHI8PARyzOmOzXJ7PyP1Yv7qWJiehhJIsQv/LLR9sQ0caFGGSp
	Zq6/QT3OnIw3AW65qGLLprUmJsz2NV66zlIV7
X-Google-Smtp-Source: AGHT+IFakVVyb3qn2Ua9YGWtJbN5eKC5RFuNg5nEGxiu48GboLMu20VoxuWeB6dsBEEmvDx4fcRxwA==
X-Received: by 2002:a17:907:971b:b0:aab:ef03:6d46 with SMTP id a640c23a62f3a-ab38cbabdc5mr485286466b.4.1737204081750;
        Sat, 18 Jan 2025 04:41:21 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:21 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v9 18/23] clk: imx8mn: support spread spectrum clock generation
Date: Sat, 18 Jan 2025 13:40:01 +0100
Message-ID: <20250118124044.157308-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for spread spectrum clock generation for the audio, video,
and DRAM PLLs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan

 drivers/clk/imx/clk-imx8mn.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index c3a3d063d58e..090b5924fa01 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -306,6 +306,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *anp;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -344,9 +345,21 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_SYS_PLL3_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MN_AUDIO_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MN_AUDIO_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MN_VIDEO_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MN_DRAM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MN_GPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_GPU_PLL);
 	hws[IMX8MN_M7_ALT_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_M7_ALT_PLL);
 	hws[IMX8MN_ARM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_ARM_PLL);
-- 
2.43.0

