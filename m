Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B7619F430
	for <imx@lists.linux.dev>; Sat, 28 Sep 2024 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727512703; cv=none; b=d636ADHXA9chwSUjF+wCgl3mroeC9BXGJSq7glqhJRBsyoQNkoCvKsWW8eHNbF1PdBUO9hS64OSX/acAjpxUjTsQ9nelcDVTI2fZVUj66J1E0Yo6czXw9lIf5fhBSL2clzwhVILHysc4eHju+1OVdD7TZSYeotxDLaN0HUguPpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727512703; c=relaxed/simple;
	bh=WnBuei5JYuZ25wbUZLj6WluWlAFoI6AsCHTUlKHiiiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBcq0MuUSnrM7Jw7dTLJP/3LYtKiUwkP/Yy/VOSszu7GpMyu2UGUlNp2NRYlm3ksY3wItOKCycH8OlFXEVvusP+GKN4l+J1MCbrX2qkYCCsEmAFp0Z/DqhGbpR7maRYWMH/cW/3zZZ+KekEuFsMejQeV9VrCVQFlM0QD1N6F2ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OyyLdkO3; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OyyLdkO3"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8d24f98215so404295966b.1
        for <imx@lists.linux.dev>; Sat, 28 Sep 2024 01:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727512700; x=1728117500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yZI1Cll/jgswR1C/8/RE7gUqkNMAx5u3jKxacFOTcY=;
        b=OyyLdkO39j4I1FAN0kh6cRorLQNEbrB3X2TjARbgDI+8hy0axFWRV+lVi7aQWDfc1b
         ihUyB3/LdKEKGLaU8w8GRo91RPegkQsPyv/Fr9/+w875OB/Yi1rEyD7ujQY6kYEyQst2
         mCzo8JFvrFsorjHyVEvnX8hgL7T+onjyQv1V0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727512700; x=1728117500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yZI1Cll/jgswR1C/8/RE7gUqkNMAx5u3jKxacFOTcY=;
        b=iGx1nW41brRDn564I0Nw419Dk/hJK4gFfV9d6uvfK7IDGkXK+LpScj1ufYx/5UmCRu
         zMzGWsvBfkWVek1B9+MVPBUxXWWDCPu1+DP8A4LjklIhpReGWbMEBuKmGNkN/+tlRMz+
         +3zfyvLq6n+xqPp5wnptjJKLVb2Xat0N7vJEWbM/MlAE90Ihh3uuvxF7FOCb7L7AAQ76
         0+5OUQyczdUHSUALro1UXw7T+niNZ9lhzKOsvBTpnrGg0eluUhaH4J8yO257FUEksypm
         FPYN9Ls46SBPTtdRVG0kCJXWv/HPGgbYP/1mmHdkIVaFuYk5uyrDYlh0Ze8aI1bczDqS
         Ei1w==
X-Forwarded-Encrypted: i=1; AJvYcCXIkwzMQm7e/TYp5X3RE4QFGMPxq44M2nnaVOLoZZpuevqBgCr6lW/qe0zRD7IqR+a/6mo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCkWnEFvNFYiyEpP6ObLn18vAxRrlzO0F7N8BV3CnkbAteN497
	DwAhCjnr0x/iZwq7HfAw02zpui0nz4Yedj9ldrt6Rs99QSfx9Sxq6EwPT39jUM4=
X-Google-Smtp-Source: AGHT+IEpHCIIkW74i8daN8Da+0LfjBKkKzdVA5122EIzP6PQGBfEDmDMRqPpOckP0H6LzAyxWWQDkQ==
X-Received: by 2002:a17:907:3203:b0:a86:851e:3a2b with SMTP id a640c23a62f3a-a93c49299e7mr544249166b.29.1727512700295;
        Sat, 28 Sep 2024 01:38:20 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2947a48sm223679466b.118.2024.09.28.01.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 01:38:20 -0700 (PDT)
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
Subject: [PATCH 4/6] clk: imx8mn: support spread spectrum clock generation
Date: Sat, 28 Sep 2024 10:37:52 +0200
Message-ID: <20240928083804.1073942-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
References: <20240928083804.1073942-1-dario.binacchi@amarulasolutions.com>
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

