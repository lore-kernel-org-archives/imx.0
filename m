Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C7519F40C
	for <imx@lists.linux.dev>; Sat, 28 Sep 2024 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727512702; cv=none; b=CBfNm0Hjppe2dnmRgzUCx1B7w0U5jafvBE0d1In23DXDNJ8si0DTcjME+mjSxW8RGggHDnWyldyvK+3UQVZIW3habwWcWkNkbyiGAYBFid0cj6ODPgI8jPWR8VcLv88hElQWQMdYGh8my6+IJH1ThHABOO4xCwiya8x3tnyC+hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727512702; c=relaxed/simple;
	bh=+LIG3cg9UTPBwV/5p8kY6zB2pD8tcc+5yEpopWLpDMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EmrwVEGSh7Nba8FwHB4fxesbNW0X1aA3bTaYjYGiJWscdn1oLVBKizWBucrvEr0CvLuN8q+hvvBAq9RZejWV2IDaa+gNlenvLR6URD2N6hQ5iIfYJk0XD2L/Ek6QbFsClrMwnf+JYm6xbH06y7/QCXzUA0ExchO1LYMh/wrLHk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=HVsPmrJ6; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="HVsPmrJ6"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8d24f98215so404293366b.1
        for <imx@lists.linux.dev>; Sat, 28 Sep 2024 01:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727512699; x=1728117499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VEkdzuU9Qc4GQ7KPC08t+6l9YpInoSw+Q79uFbywaU=;
        b=HVsPmrJ6VB7tiP9+hbBV0FynLTzzU3MrDlzav+1PWIvW///eTINeLAclSu7eLfvz4z
         E8CxG5IZlTHaMUz4MJ9WPylGWj4WzqaBx0kOJ20atjXFBxBQmhX+oRTJ59mLpSgjdloa
         tRQJsHiuDALybXmULrVoqvHGkM6tt2VVUj2vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727512699; x=1728117499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VEkdzuU9Qc4GQ7KPC08t+6l9YpInoSw+Q79uFbywaU=;
        b=s7qE6WwlpFqAqH+Vo9yY8nXWdos3HzHIZQ6K1RDGf5bq8JWZWSsLCjc8TaijrtEvCL
         lEPNf1hsuGDAXOcU1+WqVR+pNa28n1kn2cxiwQQeYPe23XkL4QaAsk6y1Wl5LIVxyTit
         Y4UVmOPn5z06WeBupG3BXcoATtRh+FdPievu/0D7F2NTO5rjyTd/ZYBbzXPr/dpE38iM
         5ChIgYitSYkIGvALLqpxU3E61KxN3GNYQTUbEWPMt/8hRyQ5Qhhz3L9suFwrilu3euAx
         uP7hP28JAxI4+FKrfRABTyGrrpK7Eq5H4xjb1lbTIBJmsEyPzh3jsHkw1sskKuq8p9Sk
         7fDA==
X-Forwarded-Encrypted: i=1; AJvYcCWR8t1GNRnp8uHkI4AhyJJyeEomO+gdkGDGV/gLX+QlecZu7jsshd5EIyeRW/8SUaBSejw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUKOPk20Fylru5oXX5wm/idypc9rc3liy20VFurA23VALQgdy8
	O8xHLFz+ou6hxRz4g7Y+RXuXNbFldST9Ld3S29y559wYsNQqJNFGAtE3okplyHY=
X-Google-Smtp-Source: AGHT+IFa7csnZDelf35kuoatw+A4XX53RvHi8+qFq8X4RDr+Ud2jdFWJt1egnboit9+Z95EazZREyw==
X-Received: by 2002:a17:907:3f17:b0:a8d:c3b:b16 with SMTP id a640c23a62f3a-a93c49299c3mr607559266b.28.1727512698854;
        Sat, 28 Sep 2024 01:38:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2947a48sm223679466b.118.2024.09.28.01.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 01:38:18 -0700 (PDT)
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
Subject: [PATCH 3/6] clk: imx8mm: support spread spectrum clock generation
Date: Sat, 28 Sep 2024 10:37:51 +0200
Message-ID: <20240928083804.1073942-4-dario.binacchi@amarulasolutions.com>
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

 drivers/clk/imx/clk-imx8mm.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 342049b847b9..0acf2979c929 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -301,6 +301,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
+	struct imx_pll14xx_ssc pll1443x_ssc;
 	int ret;
 
 	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
@@ -334,10 +335,14 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MM_ARM_PLL_REF_SEL] = imx_clk_hw_mux("arm_pll_ref_sel", base + 0x84, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MM_SYS_PLL3_REF_SEL] = imx_clk_hw_mux("sys_pll3_ref_sel", base + 0x114, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 
-	hws[IMX8MM_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", base, &imx_1443x_pll);
-	hws[IMX8MM_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", base + 0x14, &imx_1443x_pll);
-	hws[IMX8MM_VIDEO_PLL1] = imx_clk_hw_pll14xx("video_pll1", "video_pll1_ref_sel", base + 0x28, &imx_1443x_pll);
-	hws[IMX8MM_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", base + 0x50, &imx_1443x_dram_pll);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MM_AUDIO_PLL1, &pll1443x_ssc);
+	hws[IMX8MM_AUDIO_PLL1] = imx_clk_hw_pll14xx_ssc("audio_pll1", "audio_pll1_ref_sel", base, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MM_AUDIO_PLL2, &pll1443x_ssc);
+	hws[IMX8MM_AUDIO_PLL2] = imx_clk_hw_pll14xx_ssc("audio_pll2", "audio_pll2_ref_sel", base + 0x14, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MM_VIDEO_PLL1, &pll1443x_ssc);
+	hws[IMX8MM_VIDEO_PLL1] = imx_clk_hw_pll14xx_ssc("video_pll1", "video_pll1_ref_sel", base + 0x28, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MM_DRAM_PLL, &pll1443x_ssc);
+	hws[IMX8MM_DRAM_PLL] = imx_clk_hw_pll14xx_ssc("dram_pll", "dram_pll_ref_sel", base + 0x50, &imx_1443x_dram_pll, &pll1443x_ssc);
 	hws[IMX8MM_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", base + 0x64, &imx_1416x_pll);
 	hws[IMX8MM_VPU_PLL] = imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", base + 0x74, &imx_1416x_pll);
 	hws[IMX8MM_ARM_PLL] = imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", base + 0x84, &imx_1416x_pll);
-- 
2.43.0

