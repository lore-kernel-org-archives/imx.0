Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D481DE2B3
	for <imx@lists.linux.dev>; Wed,  6 Nov 2024 09:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730883977; cv=none; b=PDhFVtJUUQUguOC77QpWQGL2KssDeBmk4ia5PG4I/2uBUBqbMNelgBfrY0yh93WpQfqJFzYJFTRa6uU1j0EteuNyOGL3squ1gISAJ2k7NTe1fobFY3W7QT5216hAmwKAS9Q9r4iwxdnCEPAIfLvZB3Y7MJhO+muyNJrM94NjAjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730883977; c=relaxed/simple;
	bh=TppeIDLKz2J3v9NGgQy7CfNROB4hnypZb4DnJxcFOxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KYtCzsiHXyZ2aKBIrbKHxer/eNt1OP5Ir/EaLw+FeTz/UorWj0eGadgiVUMoMmOq8DGGD7A4U+REWWg7YH0rGZluETzsCoMo6eS2qISiJ0F/LixIot/Tdm2B3a3raZn1uZnEh+F/bAbkpLGYO6wyYrlR7DzX0IiTol/2TljaBYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=bNag9Vyo; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bNag9Vyo"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso1106725266b.2
        for <imx@lists.linux.dev>; Wed, 06 Nov 2024 01:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730883974; x=1731488774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9/BOp61tpriPDyxNyMCGSbfD3+1Oa6yDDGnpxFC9Dw=;
        b=bNag9VyoaPP1yM24Lwib4zTem5JGgOwbZvXW6EL1okKxvYk0Dzxh5PzIQXpdqOWmnh
         vzu/moe9hG9eCJXUp2DtF0FhxSQNRK/DBDbpAHiJJTR7GFwca6QPXxxr/WpARg1Ni+9A
         TU12psRN9uwUdQt8/o6dhoGiv9xHPDFYAmBO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730883974; x=1731488774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9/BOp61tpriPDyxNyMCGSbfD3+1Oa6yDDGnpxFC9Dw=;
        b=Rg6ET1sMGLjHxvQI7eNesVv3P9SEtqubi7pqdPO40x4aoeyMuCVsDzVriBDHonm2Ky
         YgRSJuzHr5poDlvllx+nM/6gyQcE11WN9W/58cKYRHRvlVSzxX7hd2hEd5LAhBlli9O2
         Qj2L7vAK9kYYvLcA5Kr9l//aoP12tgjDEoS83WJejETo1Asi736KkAEor6/BcudyYYmQ
         ann8+0Do6Sj0lmlNoPooCNBnbsw9JuvK5tDN8dYSPbdHkjhgLDB8SUfrYyRIic2LGdc7
         JFRchP1DJ+oVHLaWPXCCaTwUZRI0zOzhULyoX5SwF7l4O4kvrftwaKwA32GFk7i2y+UE
         6+Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXLwMZeJvEURCcrxroGLVL2MokVrX1J+OcqkEbFIPqz2x15AkMV5q1iGwNEyGpcF5l8ZUo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvi8xf9ZzKAGLft8kM4Or/9EluazWqYu3i75ZoXurlGd6UpD4C
	/nyd3r21NWmvECZcX4hrrBepWzrHWW+AXTQT82rivEInHt6HlvYnw6n/8ZJGBR8=
X-Google-Smtp-Source: AGHT+IGbarReVcIseTtrWVGt5DsLJTc3HofctKlcKh62g7M+A86hpOYiju+giKRxbsLJxNh3bBiAbg==
X-Received: by 2002:a17:906:f58e:b0:a9a:2afc:e4cc with SMTP id a640c23a62f3a-a9de61a128amr3626458166b.58.1730883973693;
        Wed, 06 Nov 2024 01:06:13 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:afb5:f524:6416:8e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f9422sm247781366b.139.2024.11.06.01.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:06:13 -0800 (PST)
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
Subject: [PATCH v3 4/8] clk: imx8mm: support spread spectrum clock generation
Date: Wed,  6 Nov 2024 09:58:00 +0100
Message-ID: <20241106090549.3684963-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
References: <20241106090549.3684963-1-dario.binacchi@amarulasolutions.com>
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

Changes in v3:
- Use ccm node device

 drivers/clk/imx/clk-imx8mm.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index 0cf53b5b15c8..482e471d086b 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -302,6 +302,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct device_node *anatop_np;
 	void __iomem *base, *anatop_base;
+	struct imx_pll14xx_ssc pll1443x_ssc;
 	int ret;
 
 	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws,
@@ -335,10 +336,14 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MM_ARM_PLL_REF_SEL] = imx_clk_hw_mux("arm_pll_ref_sel", anatop_base + 0x84, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 	hws[IMX8MM_SYS_PLL3_REF_SEL] = imx_clk_hw_mux("sys_pll3_ref_sel", anatop_base + 0x114, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
 
-	hws[IMX8MM_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443x_pll);
-	hws[IMX8MM_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &imx_1443x_pll);
-	hws[IMX8MM_VIDEO_PLL1] = imx_clk_hw_pll14xx("video_pll1", "video_pll1_ref_sel", anatop_base + 0x28, &imx_1443x_pll);
-	hws[IMX8MM_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_1443x_dram_pll);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MM_AUDIO_PLL1, &pll1443x_ssc);
+	hws[IMX8MM_AUDIO_PLL1] = imx_clk_hw_pll14xx_ssc("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MM_AUDIO_PLL2, &pll1443x_ssc);
+	hws[IMX8MM_AUDIO_PLL2] = imx_clk_hw_pll14xx_ssc("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MM_VIDEO_PLL1, &pll1443x_ssc);
+	hws[IMX8MM_VIDEO_PLL1] = imx_clk_hw_pll14xx_ssc("video_pll1", "video_pll1_ref_sel", anatop_base + 0x28, &imx_1443x_pll, &pll1443x_ssc);
+	imx_clk_pll14xx_get_ssc_conf(np, IMX8MM_DRAM_PLL, &pll1443x_ssc);
+	hws[IMX8MM_DRAM_PLL] = imx_clk_hw_pll14xx_ssc("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_1443x_dram_pll, &pll1443x_ssc);
 	hws[IMX8MM_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", anatop_base + 0x64, &imx_1416x_pll);
 	hws[IMX8MM_VPU_PLL] = imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", anatop_base + 0x74, &imx_1416x_pll);
 	hws[IMX8MM_ARM_PLL] = imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", anatop_base + 0x84, &imx_1416x_pll);
-- 
2.43.0

