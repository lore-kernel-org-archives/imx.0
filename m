Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228E8153BE4
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 12:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724589397; cv=none; b=fvqpXTXkja3a2TkWXzYNhxxQHhkPw/x0iZAup8hf8uSMChWoVzHaB53f6A8MvJQBdX5d4K802+3r0mMqkZd5jAMBOj4nzAvlZbRyj2NQ15nD32OLZGd7STKO7zApwQsXDkesUDFP6yDrFYuj91SS8LV7uiAj8JC6MOP004+oSF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724589397; c=relaxed/simple;
	bh=CAZxtuDPHzEmANcNibDepTfMA9FDdn6lpDoN/UtAh34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+K8aZ0cwpqVBeYCA1cSPnswN6yEK7okrqSTQup8X3X0k9exddzgFKL5YZpChckMq3yz+UkV7g9p96lWauhOaqJEzDZeDC5jdMn4v++TX4AP4WX3GNuGYpDxwmllY84krShcJnEFVntHdE1U7y7qLc5LW80+eBNBbA2E623RX2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=hJY1OXS7; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="hJY1OXS7"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5bed0a2ae0fso4252215a12.1
        for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1724589394; x=1725194194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShHuxvzlojPRFvc9Ew3ELQFtw3sKey+UcfnKn9H3f6E=;
        b=hJY1OXS7N+sCAr66YKHKJ8j3lPU7R+JUzK4gMr2R2iHNIhuk3uDCTNcL1GMTK/8+AJ
         2PUahzMKDv+wWaSE+vULcUoE2EH84fAYYsuO8ZcZMvkz3CLthmSSbc521J7gLzqUNqiC
         3VE60uFKur63Hk9RZ2mtozzzJrzjyZ4s8NvDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724589394; x=1725194194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShHuxvzlojPRFvc9Ew3ELQFtw3sKey+UcfnKn9H3f6E=;
        b=eqqT+qG7QjA2VquuTCB6PDEg/m5vOddcALvfrRD6Gb5P+QGh/odzAgvNmGUuY1e9ks
         KJKD5HQFcVhJlo2UtlcAHlkOF+t87ISneVAbfES/nvN4pwAhINBcFao8sKM69ch3fqhg
         j52o+D7K3WjRMDatsv/vV1tpGoT01oYg2/ul/H4TUiQJ8Z+zlhpiqbFFvkRJvXnEVKos
         xqyxGsSWiTD04Wcbxf0aUpNSIUX3MHC2Fqv5BXjgdX0l7NfzRYVp9Dg+kB3SuSF5HfDm
         //RUhhWMavGx7Qs29OG7uXu52M9BIN3cR6Wp9GFJMLJsgX1xcIP3jXaKHQPq5o8maM/x
         O8nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYJPERQL8wZaPh//Jf+jPCqBWnkhC/8Q03jXzubnXe9HGRd555dY0nsQ4flEyuwZi4opg=@lists.linux.dev
X-Gm-Message-State: AOJu0YysIGRzwmX1zM1/EldoU5yOUmIQfJoE4yo/OYgUhpffk4RB0oqB
	DcxUlkiQwkqmUA9dAaCX2TyMQMP9JSCBbHufIANrhzUy8F4313WbJIfAKvfjnM0=
X-Google-Smtp-Source: AGHT+IFk/IJXn74tutfj7Fq68cQQXgnAphQ1qnaQoukGQnyX10Zxsca/cXbss1Duy4H4M6p0Tyfk6g==
X-Received: by 2002:a05:6402:d06:b0:5bf:2577:32b8 with SMTP id 4fb4d7f45d1cf-5c089163827mr4756973a12.9.1724589394509;
        Sun, 25 Aug 2024 05:36:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-25-99-149.retail.telecomitalia.it. [79.25.99.149])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c04a3e89ebsm4350404a12.43.2024.08.25.05.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 05:36:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jacky Bai <ping.bai@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 3/3] pmdomain: imx93-pd: drop the context variable "init_off"
Date: Sun, 25 Aug 2024 14:36:16 +0200
Message-ID: <20240825123626.3877812-3-dario.binacchi@amarulasolutions.com>
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

This variable is only used within the probe() function, so let's remove
it from the context and define it locally within the same function.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/pmdomain/imx/imx93-pd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/imx/imx93-pd.c b/drivers/pmdomain/imx/imx93-pd.c
index 24e5bfb336ca..cc848f63219f 100644
--- a/drivers/pmdomain/imx/imx93-pd.c
+++ b/drivers/pmdomain/imx/imx93-pd.c
@@ -28,7 +28,6 @@ struct imx93_power_domain {
 	void __iomem *addr;
 	struct clk_bulk_data *clks;
 	int num_clks;
-	bool init_off;
 };
 
 #define to_imx93_pd(_genpd) container_of(_genpd, struct imx93_power_domain, genpd)
@@ -99,6 +98,7 @@ static int imx93_pd_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct imx93_power_domain *domain;
+	bool init_off;
 	int ret;
 
 	domain = devm_kzalloc(dev, sizeof(*domain), GFP_KERNEL);
@@ -118,9 +118,9 @@ static int imx93_pd_probe(struct platform_device *pdev)
 	domain->genpd.power_on = imx93_pd_on;
 	domain->dev = dev;
 
-	domain->init_off = readl(domain->addr + MIX_FUNC_STAT_OFF) & FUNC_STAT_ISO_STAT_MASK;
+	init_off = readl(domain->addr + MIX_FUNC_STAT_OFF) & FUNC_STAT_ISO_STAT_MASK;
 	/* Just to sync the status of hardware */
-	if (!domain->init_off) {
+	if (!init_off) {
 		ret = clk_bulk_prepare_enable(domain->num_clks, domain->clks);
 		if (ret) {
 			return dev_err_probe(domain->dev, ret,
@@ -129,7 +129,7 @@ static int imx93_pd_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = pm_genpd_init(&domain->genpd, NULL, domain->init_off);
+	ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 	if (ret)
 		goto err_clk_unprepare;
 
@@ -145,7 +145,7 @@ static int imx93_pd_probe(struct platform_device *pdev)
 	pm_genpd_remove(&domain->genpd);
 
 err_clk_unprepare:
-	if (!domain->init_off)
+	if (!init_off)
 		clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
 
 	return ret;
-- 
2.43.0

