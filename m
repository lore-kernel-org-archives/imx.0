Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E472C1DEFD8
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204089; cv=none; b=in5QdlL33JnSXeBuA8ReT85Pt0mPDX2yCJ8bUHhpyexWzguRGVSiQpL+NY6OAPPfTpi9Yd2pDiojhskbpiAEjgYow26FQPHEONU9JKIbmWt9ekhGewGdUwiJDSyq5i4yU8nSIVa8XPIC5Dadk1Bn0QMwhS/hWES+x6ceSrhGjGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204089; c=relaxed/simple;
	bh=HjSEIAPz6maPpmKvBb0LoO5MDQbc6Gv+kkgBs4krCDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvM4U79d7bkJaYyY68UCFZZBssEtduG435448oJxeNwNzzRyzSVpLAC+4mu+oD9tF5JPUmhrpNVCmZ0aGJrwNiF10tiyOwQKmijtnfvnmae9oRakw5ntvPL/lDmzLar03KSY8wc27HM4nEy5RI8axsSUgq+cDgzRtCSbUn4/VtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=cIItvlVW; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cIItvlVW"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5da12190e75so6045801a12.1
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204086; x=1737808886; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vDdCPdsn7drrDVs6gkBxF2bAHBnCBAUvlTFeTtU0PY=;
        b=cIItvlVWU8j8LHNvCApsui3l2EXyxNd7shJIXbTdb+JOSaBaZz/Qv2xnR215P1p3+w
         593XOMYvYde2LqU0wKbCqE/zuWLMPJh94PpBih9ubwEIqbP08ysdWGGRXzGdCypmD6/Y
         7QUA9bo6hiWzZEbnZ2+25cxr+JdegTFdmir9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204086; x=1737808886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vDdCPdsn7drrDVs6gkBxF2bAHBnCBAUvlTFeTtU0PY=;
        b=xKWAvHbFhFKPOK3TeRMGWzqKyjH/VAZ5TCruxpcshMIww9kLejDCoXgyWKh34mazIM
         RNWDaWgm9ucJgrjDNPaPCWM9sj4balMdCNl93oKM3YXpiE9oOGm3NwhITZDF4urmwiJ6
         p27N4T9T2ueSYFf4srsVCSzpMZQmQu3FLJobIkQAocHeGUSAiz6FwpInR8WTKH2ekD7b
         5DwvFYOrVWjGylZoGABSi+dpcN6rPYheBlPY6vNhb90bmHxev6+BKG6p2vd8r7NV1eNA
         WHfAzZrak+JX0uvwgqmIohJkG+YxXl+86SkO5MuSmw4Ec19TtWxC5t1dXO+BkH2cXEcy
         j1qg==
X-Forwarded-Encrypted: i=1; AJvYcCWr9XOwLrH9JW0lr9GgcnCR6y10gjFahBr8EeQWYHCFMGvX8A3S0jMf6Duh9QdzUgxqv9k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzR5St5/meadUt9I54B/T0Iqe6J04TT+qzyyVFicdcN5X6H2AU3
	zvOkpfFMislqFgMOx0gZJmt41fpUvgUDX746iSqh+mKGBESomsfvG6BqYIMCZCM=
X-Gm-Gg: ASbGncvu2myuiCEMjOOTakybGZLBXOjO3m0+QNrc4lVgy3iH2LiU3KaYqDTvkPhZvr1
	iU5SzcStzKGkjcynSYnx8osryatrP3CPPI+TSslthPmjIZg/leypzlY732uMgsfcZTZ3Yw0GruX
	W74EO9NnEC3osSeONNTkcYCWCS9E2zeIBqCbswhVWtE98X4sxv2+edKBn6z74RsqEISuSq33deg
	wDaZ+j5bs1X2raE2hFHoUzMSfrHsdoafvYvCXd2MwTDLf1dswWq/KDMmUTe25vE5A0jloHuK92k
	qpOl6boUvJf0w5UqlD07V23Il11x7oy1zjQRNt1+JcNZeFu4o9w8OKjyBWMSwai5THtG/ydDdPk
	OVoB3enet3b5qjYjR2aOaqFdggHbnSCcB9yrq
X-Google-Smtp-Source: AGHT+IGXzRigtXsPzj90j/78YQbLG+CGAnKWwF2PQgfEJZOtJnmpVNVhi1AoGMgITGhf4fbDGSnoNw==
X-Received: by 2002:a17:907:3da0:b0:aab:d8df:9bbb with SMTP id a640c23a62f3a-ab38b42d8e0mr535640266b.41.1737204086146;
        Sat, 18 Jan 2025 04:41:26 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:25 -0800 (PST)
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
Subject: [PATCH v9 21/23] clk: imx8mp: support spread spectrum clock generation
Date: Sat, 18 Jan 2025 13:40:04 +0100
Message-ID: <20250118124044.157308-22-dario.binacchi@amarulasolutions.com>
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
---

(no changes since v1)

 drivers/clk/imx/clk-imx8mp.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 012cd3b52e3f..560f51d9232d 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -393,6 +393,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *anp;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int err;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -432,9 +433,21 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MP_SYS_PLL3_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MP_AUDIO_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MP_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MP_AUDIO_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MP_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MP_VIDEO_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MP_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MP_DRAM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MP_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MP_GPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_GPU_PLL);
 	hws[IMX8MP_VPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VPU_PLL);
 	hws[IMX8MP_ARM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_ARM_PLL);
-- 
2.43.0

