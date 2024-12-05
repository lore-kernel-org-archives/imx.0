Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E49F20E03C
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397615; cv=none; b=Tj+rZQZkblSJlWisVq989+9tcR/j5DnD0T7RfeTe4jJpykmbJOsH0fReiZuxtebLMgnW/yfBlrkzMtNCJ05HZ6hfDgXXoWwFHvM3viygSoYWcmLYaGzV5A/YMmp0nJKsQPdKExvxD2tVc2VxvUp9AzBwK83jZhFQBpWKYkEWOlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397615; c=relaxed/simple;
	bh=nZATu35jIwNzMOu/q32E4DVzYvYaOeYv03dex6aotrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/e+YOXBrnApeDXm/z/acQaLQGMrRhxCDWgP9KmF1hlbvtluuljJLmh1mP7Yj7dT4D2hTfKT6k6Jw/xIdRbHgOAB92RFvtnw8TwRTNjKmR2bjqCyXQegndLWzZVMvFlLaT8V5w1gYtAILZTa9rmqBhOU8TKYGoIHZpfamH6LCFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Ycs3G6bO; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Ycs3G6bO"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso94884566b.1
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 03:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397612; x=1734002412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=;
        b=Ycs3G6bOneNXzmURGfbLbeP6Yl2SyOmSX9r1qFDQb6Vg09iGYvPs6i9GN/elqWdUHd
         vEaHN+uFDOnq9cbn8Xy9+Np5O39JCnfN0grI1DPjaQMZoi8S+GcSI7/ouaYu7k6MPQRI
         SiR0OVkpmx2SU9L1KEe2yv6dGklr+73EVnEzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397612; x=1734002412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=;
        b=i58CwxjUOnpl1IRRUoTCc2X15nv4X9PVTW06WLYvP0NpPkbQklouy/8GgSvnZbSOb9
         LHLo484FLhYtKoZt8am/XJFwGNH29zs5kuEnXf/z8ZpVB4xxrNDDTZOok4S3ld8Pt0Lq
         oFrA8WB65WbRN8ziOPlJ5VnpjxZmBIRflv02Tph4wlgH54tmgjJb+piqwXgKBg+JNg8J
         Q71Jds7Jlkg6oXbsMCv1NjEinqzN6qtKDLUhwhg322ebQv4FDm6UqSSX5n/JFME9iz0r
         V+727GQkU9PKwPOCzbvpwGWKdNQhRGqf3ZQkUvK192ukJQV/cdKDzSRL+Oyzdh4HkJCm
         Wwmg==
X-Forwarded-Encrypted: i=1; AJvYcCVlvYr/cUTdIMAK1ccHARHReM9t1T/NU+13iQB9wnIowWG7UFOxsAffM8cJXqC4I9tpVA0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwF7WaQfvPAnmAw+t3xFmdv9Mih48axyGeXGcA8XOrQX+0rnYwq
	Y9BkHwPlsxCUdqyIbTufIBj20wh4+YkzDQraQdGKY+V6+DBb9hJn8xUCGmdZML0=
X-Gm-Gg: ASbGnctV90Vv45FZ16G9StL227Uq8XRfswuRcxEdTy5QNSRELHPqy0YurNTCBUsqVb8
	oro6ShVRJAV6qVeRwRwdtRDzuL+GcKC2Z765E0VSJ57JYEiXlAiuwctnC5xDgGXFx0aoi8xrEZd
	8G7Alb3To6YmK/2c6hPnvCXPnS9kvuoPcs9qIBbQoSiVJThHO8Wy+G67d1MpT6Xpk/bFht0RhEm
	i8+Edy21zqPSK78xVun4jpz6QaKceJdsc2bxJOoL0Nn8NGJZFadvvuF24YHruvB9uCm46aTEd+b
	eYsyRdEOTGHEvdV4mJ7o8UItvTrbqpy0FIbNA+9QJEJ8Qw==
X-Google-Smtp-Source: AGHT+IHkC2TdsvU53Arf9R3rEtIlqqSs2877Q+gumRy3NT+TL1A68HMegWO4XXkwBKx6SpYDp0zrGw==
X-Received: by 2002:a17:907:7841:b0:aa6:2987:9a4b with SMTP id a640c23a62f3a-aa629879b08mr105608066b.21.1733397612146;
        Thu, 05 Dec 2024 03:20:12 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:20:11 -0800 (PST)
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
Subject: [PATCH v5 20/20] clk: imx8mn: support spread spectrum clock generation
Date: Thu,  5 Dec 2024 12:17:55 +0100
Message-ID: <20241205111939.1796244-21-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
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

 drivers/clk/imx/clk-imx8mn.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 588cebce6c9d..c61368e724f7 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -306,6 +306,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -338,9 +339,21 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_SYS_PLL3_REF_SEL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MN_AUDIO_PLL1] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MN_AUDIO_PLL2] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MN_VIDEO_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MN_DRAM_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MN_GPU_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_GPU_PLL);
 	hws[IMX8MN_M7_ALT_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_M7_ALT_PLL);
 	hws[IMX8MN_ARM_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_ARM_PLL);
-- 
2.43.0

