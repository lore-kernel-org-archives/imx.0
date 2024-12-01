Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2551DE4F9
	for <imx@lists.linux.dev>; Sun,  1 Dec 2024 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075277; cv=none; b=KkQ4QIJiGNp2IIHpEPmomzKDNvVS0HBQre13Qg78FDHU6d6Mg4wNbKzhS8RxCz31Lx8J/hDv4WWNmlxG+cXKd2esiDavzTQrd6xSPjxGI/AiF3/j0S7Ffax+7LF2BRpeHx5gobfEZ5AMWCAeBZwCSKq3JIgahGeSphS6csehRO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075277; c=relaxed/simple;
	bh=nZATu35jIwNzMOu/q32E4DVzYvYaOeYv03dex6aotrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tuCtrz7dWcmquWeXXJ3QAakaOK21X0i005wrwt+Qe+JOLYNvo13rsssHST4cEYP20SBOkvHGuQeb/ix/UppiJ0AZ/Vtv7cuX+QrRrIpCBSqbLyDNoD6CP5EX5eeTjbOLYpE9zb3eBpWxgFCwI1puS0MJkpNpxpN2YHYprO/onx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=BgrjUrsW; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BgrjUrsW"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5cf9ef18ae9so7940823a12.1
        for <imx@lists.linux.dev>; Sun, 01 Dec 2024 09:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075274; x=1733680074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=;
        b=BgrjUrsWa976R/NdBARICmgehg28nu6zjDrYH25VxgefpwIhT0Iy5NzOydZOMTQ1Iq
         k+P17YRUdBojdj5GuNoeae9cESK3eoj2iw6jZLuln0zq9ojguBChhiijtfL+9m0LThn2
         MdET/DOpQj45mJj78XbDHjQ7O+Y3tbCEO/B3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075274; x=1733680074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9yTySfaJQhr7Fo3SgjYPb/w7zlE9/XQ3JsIQbT3gRE=;
        b=bpDNS0pgl+SQGERV1WXxCt0QtObrVO1oRfoNDRJDIzGDrDYV3zi42eSHq4T/WekJsm
         Tn5g1D+F0+kRbyB1WV7uxK3h7H66ceyERovWhOfbaXqZRRgH2zW0KCaMtdFU3z3cGNzc
         jj8cwz+d3RBKoglvVA88mXab0J3HNnjygXncAvPBciFVDyA3YEJwmp5lGnE9oN5f3ljx
         grb9P4EIUbiwAyZzo7lpXqyNbZ0pyPbH3fV9W225MNyxwIUSwBOEY3PhPFdEsb3OQMfc
         UmmhVr3JysCzaYVUC/87IWa0HS9Pyksy/mov++uYKddC3BwmkgJwIxDs4XO4UINhlyaJ
         5wug==
X-Forwarded-Encrypted: i=1; AJvYcCWyKWcdEumQjcWWMwDowR8QNZlEIpjrRorlJ5OiE0oYmbMO6QywhzurNLenDGZyTUGCHrU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTDLJ1Ca694z90RywrfT5g4ZQ6BLs+woQK5YaUTbGM1RJhxDZD
	jzzvveu8aFEEgdF9mBw0nxEDmVgfgYHjTmiZ1jtDESiq35Fz2bIOXuDJOOaQIOw=
X-Gm-Gg: ASbGncsxPY1yW+qB9ZN0yQxELBtPPiBotNXqOMgvwcK60vTztM4YZke/Zdbwehx5YYY
	YIpXlxDtL2FgdgbLlAZAH0z8P80oKVEYLdUT2+qOxPw7QO4C9TDII+KTpzeSLk3YlR/wxhXFjLH
	Zt9/EGVWKXHV0Rha4BFJRYJJH/YqIR4rp7SSmU72gJAgrKHG+YGEKCAKaQQeCc5CsXZeze2S/LW
	+7C4UW0Ai4PV+o2TrBa6jb9bTLogov911UKPM6W8KvoA2f3EaBvEZElAZqMrcz1qGQC7uh/ML/K
	+4fH3HIzbkrMdBWXQgjhVDI1hg4Gyo9v+zLRveAzXNHu8S6p1tkg2GLef3iW1e4hwiv4EPqGECF
	pDK6MdgrlRV1837n1
X-Google-Smtp-Source: AGHT+IEHR1z9laXzqUjryQO8q5Ffq5yH85Q8LM2nOnrBHdiW2uHs2gYFItB4lX4kLCeuRgS8cGojqQ==
X-Received: by 2002:a17:907:3683:b0:aa5:500f:56b3 with SMTP id a640c23a62f3a-aa5945ea088mr1602165966b.18.1733075274323;
        Sun, 01 Dec 2024 09:47:54 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:53 -0800 (PST)
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
Subject: [PATCH v4 18/18] clk: imx8mn: support spread spectrum clock generation
Date: Sun,  1 Dec 2024 18:46:18 +0100
Message-ID: <20241201174639.742000-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
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

