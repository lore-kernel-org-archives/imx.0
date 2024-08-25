Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F39115574C
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724596477; cv=none; b=UDrFe5DXXV7TYzac3C+H5sGMlQCGg1u4Wu2hDDv93Lex9ZRZV4k7bGGpwP3JBDbm6GYCMjNVLBaTk9IxUkG8NkkJGUDrLghEJOVilVYbGPryUi6kxIrff1SNPlkfEMcLTCsvb/GpRzWsfO2GRCRdKm+Vf1r2e9lGdalJTCm5E/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724596477; c=relaxed/simple;
	bh=0lv2+/R/Y1kEilZQGwotVCHUco7bj6y3rAOycGgHMaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BqfLWFP0Uo+ka6Q5dAyDNf3h6qyXkNzgpHVE9gHmxdB1Bdj8eOPvzxJsq9wOhXjV52Lq1tsTDuUWIoj8VjqXjSIphEuXfdIAbeQit6MreO9s8MD7exZifLcIN1HWKRh2yTP8F9t38dJQvOf5qByt4ZzLUcF8/q5MU8OXheU2K60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=JkgUOJNC; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="JkgUOJNC"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a86859e2fc0so411073966b.3
        for <imx@lists.linux.dev>; Sun, 25 Aug 2024 07:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1724596474; x=1725201274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUP1tr1Biob0qdgqQZiV/8XgCxeEAXErXHQFm+tqx4M=;
        b=JkgUOJNC8yU0VVooTni8Cvk+slB3pJTLYkcybV5/XEftYGrJvcA9j9IFaJcS9qZI/H
         s8P49kPjEAgtb+Q3qBMQI7v3B0jdTSlf7TVpAp2wNcYUoloVTk6Rkl3crVpKY20tNPQ9
         xHjLJH8fJAK7PJ4NzqkEGBhtc351QEOtmnwEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724596474; x=1725201274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUP1tr1Biob0qdgqQZiV/8XgCxeEAXErXHQFm+tqx4M=;
        b=VfgLI/tEqMt2tsH3FLAWOH93LMLO+OYmPBkQNqyGqHW891PYSQ+39p9pck57ciDT8+
         7OBl5znU1Sa8b3zARbAYmPdnRUQ3uFjHXA9TmdFhDGkxCyJSGk2FJr0kDKJ3RgF49mxg
         PHgI/RQ7A/yaKJdp+FW3RmnHnDur4EnqUi/B4sjTu5Ymeep1404wPdQXf6cba09g/p/D
         4/vVdz3KVFGkJqqsiGfNPK4d9ZUZ6O539hTPFIIjhkBZDxP44iy3hWvkWrKrC+9dwBvn
         tZLbIuuP7/tBSF6hDM04co1AbJwEhLmiwBUZseXpTXdlRGScNkEqxiaLaeTOdgRLVq0m
         NRVA==
X-Forwarded-Encrypted: i=1; AJvYcCVEpYmyBYI3OxahoFDdPMzk2OYzJ9NzPLARg/alGrOnYNdKZOC17lXSCg9N+W/YrpeWJys=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv4APac53ABaCmeaZ5kPocFCccUOuMBbflabjJ9H+dD/TAqurX
	2wATGZ632LhH1khSspoNTVfTSb81n4ul/KJCKO69bF7X6O3B485k8yQLwF+LK3A=
X-Google-Smtp-Source: AGHT+IFgNRayDgp4fmiIWVjZ3HTGdr0hITo8YBBn478cm5P7zRV+7T0cFa+54xo2Bary5GIFiosIxA==
X-Received: by 2002:a17:906:c143:b0:a86:8368:860a with SMTP id a640c23a62f3a-a86a53005f6mr518996166b.35.1724596473780;
        Sun, 25 Aug 2024 07:34:33 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-25-99-149.retail.telecomitalia.it. [79.25.99.149])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4862b6sm550625566b.170.2024.08.25.07.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 07:34:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 3/3] pmdomain: imx93-pd: drop the context variable "init_off"
Date: Sun, 25 Aug 2024 16:34:02 +0200
Message-ID: <20240825143428.556439-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240825143428.556439-1-dario.binacchi@amarulasolutions.com>
References: <20240825143428.556439-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v1)

 drivers/pmdomain/imx/imx93-pd.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/imx/imx93-pd.c b/drivers/pmdomain/imx/imx93-pd.c
index fb53a8e359bc..25ab592945bd 100644
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
 		if (ret)
 			return dev_err_probe(domain->dev, ret,
@@ -128,7 +128,7 @@ static int imx93_pd_probe(struct platform_device *pdev)
 					     domain->genpd.name);
 	}
 
-	ret = pm_genpd_init(&domain->genpd, NULL, domain->init_off);
+	ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 	if (ret)
 		goto err_clk_unprepare;
 
@@ -144,7 +144,7 @@ static int imx93_pd_probe(struct platform_device *pdev)
 	pm_genpd_remove(&domain->genpd);
 
 err_clk_unprepare:
-	if (!domain->init_off)
+	if (!init_off)
 		clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
 
 	return ret;
-- 
2.43.0

