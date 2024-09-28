Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E76B19FA81
	for <imx@lists.linux.dev>; Sat, 28 Sep 2024 08:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727512706; cv=none; b=PjncQlhVtWLSnVXWx930u+LTR6xA28nzNsFcVOQiHO9mFfu+iIfqYMm9Chsj734kVMT4UtXbx2iqUhFVpqFZEFt89TCs4luCzvdbgygQnpTbDMfBt+2v6LX5V2YUk/5DbuLOYEh5EQw8YoiJzccsULeEL5WmJBK0v4kuxEr35R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727512706; c=relaxed/simple;
	bh=V3GcAzqNjwMg5/Hvh9jUbJqltmtUfAEm3aT6HuannLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PbEv6a52TJkXn2hWvv4ufKOFk6nAvDwrf6GXx6ckMjReuuf6y1/vPvt6ft1lbQZu+7lmMeMmTB4wfbnfzPlcblGHoDMQd5yqnMbIlPXi9vLniqermnONdloc2L0LOyAfwKqGHYTvU2TcaP3po4ivrvofbIvlPuEE36VP+jaULlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=gwZw9lry; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gwZw9lry"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a93a1cda54dso379293266b.2
        for <imx@lists.linux.dev>; Sat, 28 Sep 2024 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1727512703; x=1728117503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqdVHCjP2z3b3GmppGHkZvxobZmXnCslqoKDvGYxVNw=;
        b=gwZw9lryycCbWgpjXMIHdVaIP5OQEyXTBZoqg+zeW9FonVOYSKbrEK6AguwXZ5VL5P
         ssSguSDce+YNLOasXSqtXcwxV8bKCisjxGGzw42KfcPG+XO+NXAw+k5AeUI9IiSQCsj0
         4NUMTJaia8AGU9whD2DKkRJoozFoRxSXZWtjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727512703; x=1728117503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqdVHCjP2z3b3GmppGHkZvxobZmXnCslqoKDvGYxVNw=;
        b=ZdCyh6b9rBs78b5dFMBcYSGOHeIifbjKYaHxAkprho9m3i5x6rrgtLBEGr4zdVwcYC
         kJIlLZIkVG5+BpDsMFWlSIIrpOtr2P729woXQw0b4a6YVK/S9lZTya7v/KPxEx2hmLhP
         Zhs5vaHSLqnydQXz7mHPBQ1NakTIf2Jx/MLsfjcH0uM3/6ft9+biT7MEwE1y7d1tBJyd
         X7h64yPTSkAOe9L57B2rF9PtiCxSw2GUDn1pbc2K0dBqiKTqkKY5E4l3Qv4a7b0q8b3w
         TCW4/53Yjh2b5FGDVW9BI6UL5tOdTPNCmCBXloMW+LZ7snMRkJUCBrGSy4W6JLGHtoVF
         NXiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEsEt5l9xVavDwsKAC2SFJJWI8065MV2jH2OnXZZub0AkVNAgcQ7tVzf82yfkG9dfVc/o=@lists.linux.dev
X-Gm-Message-State: AOJu0YwB8e3Erle0Sj/vAQGDuTZJSYN02PvFoUd9E0RrbzLVduLHTca7
	/RQ0xRKIjot0kBPELF6p3KLvIRRzamMeN7uemd135uWZBmbQusnfokV9V3zIZcc=
X-Google-Smtp-Source: AGHT+IFep0uHWu7o5r2mN7w6qghEp9xGMWpGJDUw5UfEylXMOmM7N6REhb0d7hr9vD0ZU94R0/JpCA==
X-Received: by 2002:a17:907:74c:b0:a8a:3ece:d073 with SMTP id a640c23a62f3a-a93c48f1b54mr526812266b.10.1727512703361;
        Sat, 28 Sep 2024 01:38:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2947a48sm223679466b.118.2024.09.28.01.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 01:38:23 -0700 (PDT)
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
Subject: [PATCH 6/6] clk: imx8mp: support spread spectrum clock generation
Date: Sat, 28 Sep 2024 10:37:54 +0200
Message-ID: <20240928083804.1073942-7-dario.binacchi@amarulasolutions.com>
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

 drivers/clk/imx/clk-imx8mp.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index b2778958a572..460e8271def5 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -410,6 +410,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np, *anatop_np;
 	void __iomem *anatop_base, *ccm_base;
+	struct imx_pll14xx_ssc pll1443x_ssc;
 	int err;
 
 	anatop_np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
@@ -449,10 +450,14 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_SYS_PLL2_REF_SEL] = imx_clk_hw_mux("sys_pll2_ref_sel", anatop_base + 0x104, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MP_SYS_PLL3_REF_SEL] = imx_clk_hw_mux("sys_pll3_ref_sel", anatop_base + 0x114, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 
-	hws[IMX8MP_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443x_pll);
-	hws[IMX8MP_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &imx_1443x_pll);
-	hws[IMX8MP_VIDEO_PLL1] = imx_clk_hw_pll14xx("video_pll1", "video_pll1_ref_sel", anatop_base + 0x28, &imx_1443x_pll);
-	hws[IMX8MP_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_1443x_dram_pll);
+	imx_clk_pll14xx_get_ssc_conf(anatop_np, IMX8MP_AUDIO_PLL1, &pll1443x_ssc);
+	hws[IMX8MP_AUDIO_PLL1] = imx_clk_hw_pll14xx_ssc("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(anatop_np, IMX8MP_AUDIO_PLL2, &pll1443x_ssc);
+	hws[IMX8MP_AUDIO_PLL2] = imx_clk_hw_pll14xx_ssc("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(anatop_np, IMX8MP_VIDEO_PLL1, &pll1443x_ssc);
+	hws[IMX8MP_VIDEO_PLL1] = imx_clk_hw_pll14xx_ssc("video_pll1", "video_pll1_ref_sel", anatop_base + 0x28, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(anatop_np, IMX8MP_DRAM_PLL, &pll1443x_ssc);
+	hws[IMX8MP_DRAM_PLL] = imx_clk_hw_pll14xx_ssc("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_1443x_dram_pll, &pll1443x_ssc);
 	hws[IMX8MP_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", anatop_base + 0x64, &imx_1416x_pll);
 	hws[IMX8MP_VPU_PLL] = imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", anatop_base + 0x74, &imx_1416x_pll);
 	hws[IMX8MP_ARM_PLL] = imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", anatop_base + 0x84, &imx_1416x_pll);
-- 
2.43.0

