Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DF843155
	for <imx@lists.linux.dev>; Sun, 29 Sep 2024 17:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727630876; cv=none; b=ANloVhL0EI1Dql33nxj1RuQHjKApRZvjeNoODuBghOo67QlWT9PcyLzeUYgfffcA4CalOMOi6teqlq7RGw5aJnmZyvELP067fbZR62DdOnpiI9jqWXvRrM7dodG1sNigcKOZmwplv6ct0O3X0Qt7PY3cNlWgWpmX8bDLjsO06D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727630876; c=relaxed/simple;
	bh=Wgv+/HWcXNYqtqEA0RPOt5fYJas9b80J8xiOGZ09A/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZZs4E+kkDCN/sLI98Hz9+QPuc3TW9VKrMH9A1rKjjvyptCA7gADyFJG5ENdm0vZpG25tY87ulvIJzUMQom+fPJbppcWXHHZII1EL640wHd7mnDOn7dpSNOby2DovVuiCPzC4b8k2hmaPI/wN78psHhYZLMRFmJxlgL3D86nsiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Lg+bD4k0; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Lg+bD4k0"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8a7596b7dfso431046666b.0
        for <imx@lists.linux.dev>; Sun, 29 Sep 2024 10:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727630873; x=1728235673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7j0vOxwdIuLpD77WK2SWPTcyyL5hPZ0rRLo8GOdwiU=;
        b=Lg+bD4k0ewNIb11lacry3xbBYlkfg6V0QJH7d8VGRxdocke36/LZPTcF/S085PZeUS
         8dhgk+xAJ2wxsuayCEiHvVH3LShCazSaVNKDtF/KnKyrHOvovZbHUnQrVRkHBxykUkDH
         ZI8hmWuYJhZM9yTvDiziFMHbBG4eMk+Daal9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727630873; x=1728235673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7j0vOxwdIuLpD77WK2SWPTcyyL5hPZ0rRLo8GOdwiU=;
        b=XKLhWhwnlc/gP7xubkJIGcfocWzS6bLmxKVytlCGelMfet8+yVW8zyV+OEqEMueSN0
         g2I39POj8C174UWNQwBywGpuY7ZDVSdiTKm/lfv64af0V3BP8UUFhMTLcygStq7qmdZG
         Oy0iyQ5t8Rz88neu26B9JP8926A1uF5rW0o2/8z739xCUQ+rWlNjJhwqhi4xzWRnNOel
         JhdQmmqjPAtnp3cM4wfLqPH9mLWntfe+xSPdyNHbB9NGtdW9RYTJLuqNQC2mTPrmHUWw
         yxSdfASbeF6aLfuNcAhqp7hOZKu16inGg4gXUIt9qCyka3geq8zTiicwkY25qYfjXtLv
         Ve3A==
X-Forwarded-Encrypted: i=1; AJvYcCUmA0wanmtCIX/63umrxhDpqLENBaJTEXpNhlvO32ezcajsjZzZD4LbG2/S7O3eqRUU8sc=@lists.linux.dev
X-Gm-Message-State: AOJu0YykCihBL2KPakRLqkw++Iq2Kg2eKXNDYfvR4WNBRmB+eNkhESZ6
	sS2d+VFFjWFL8WwFMvzAAeGJtkZF4BpFt/ZXqkD6cD/fUgp0/VxJTgsQMHbOT0Q=
X-Google-Smtp-Source: AGHT+IFGFzdbP7v+VVZM0XVmIyCLSRIrz892t1qCo04UZ5WzOKuy2d0YwcdtUYh77K2CgaYdMJ8Ffg==
X-Received: by 2002:a17:907:749:b0:a8d:41d8:14ad with SMTP id a640c23a62f3a-a93b1679b22mr1493843566b.29.1727630872356;
        Sun, 29 Sep 2024 10:27:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27776a1sm403176866b.8.2024.09.29.10.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 10:27:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 4/6] clk: imx8mn: support spread spectrum clock generation
Date: Sun, 29 Sep 2024 19:27:14 +0200
Message-ID: <20240929172743.1758292-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240929172743.1758292-1-dario.binacchi@amarulasolutions.com>
References: <20240929172743.1758292-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch adds support for spread spectrum clock generation for the
audio, video, and DRAM PLLs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/imx/clk-imx8mn.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index ab77e148e70c..b33590a9b7b7 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -321,6 +321,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
+	struct imx_pll14xx_ssc pll1443x_ssc;
 	int ret;
 
 	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws,
@@ -356,10 +357,14 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_ARM_PLL_REF_SEL] = imx_clk_hw_mux("arm_pll_ref_sel", base + 0x84, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MN_SYS_PLL3_REF_SEL] = imx_clk_hw_mux("sys_pll3_ref_sel", base + 0x114, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 
-	hws[IMX8MN_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", base, &imx_1443x_pll);
-	hws[IMX8MN_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", base + 0x14, &imx_1443x_pll);
-	hws[IMX8MN_VIDEO_PLL] = imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel", base + 0x28, &imx_1443x_pll);
-	hws[IMX8MN_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", base + 0x50, &imx_1443x_dram_pll);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MN_AUDIO_PLL1, &pll1443x_ssc);
+	hws[IMX8MN_AUDIO_PLL1] = imx_clk_hw_pll14xx_ssc("audio_pll1", "audio_pll1_ref_sel", base, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MN_AUDIO_PLL2, &pll1443x_ssc);
+	hws[IMX8MN_AUDIO_PLL2] = imx_clk_hw_pll14xx_ssc("audio_pll2", "audio_pll2_ref_sel", base + 0x14, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MN_VIDEO_PLL, &pll1443x_ssc);
+	hws[IMX8MN_VIDEO_PLL] = imx_clk_hw_pll14xx_ssc("video_pll", "video_pll_ref_sel", base + 0x28, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MN_DRAM_PLL, &pll1443x_ssc);
+	hws[IMX8MN_DRAM_PLL] = imx_clk_hw_pll14xx_ssc("dram_pll", "dram_pll_ref_sel", base + 0x50, &imx_1443x_dram_pll, &pll1443x_ssc);
 	hws[IMX8MN_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", base + 0x64, &imx_1416x_pll);
 	hws[IMX8MN_M7_ALT_PLL] = imx_clk_hw_pll14xx("m7_alt_pll", "m7_alt_pll_ref_sel", base + 0x74, &imx_1416x_pll);
 	hws[IMX8MN_ARM_PLL] = imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", base + 0x84, &imx_1416x_pll);
-- 
2.43.0

