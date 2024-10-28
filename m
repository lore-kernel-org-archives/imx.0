Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D63B1D6194
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 10:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730111182; cv=none; b=jJHoLZ7XU+oHOv0G9I54WW6g9vRAljs7SzZ/ec9o+tupszd+NkNVAuvRS5d7NuPLKguVAMCtquztUgIwWFQSC+btwu/mCMeL/Byz3PDuAlOI7/Xcj9cfVxYuyHQfWbjNQAx5sRkVuqpA+lkvITTsjmihZeEQo8AvyTR3nj1HOS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730111182; c=relaxed/simple;
	bh=js8gtoeOZlGeLq8295+lq+IHMiMRiPiXT/e6W18eRR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqIU6cRE1cFj/6CfnGLmC/G1oEfQZmK8QDJZiUpHk52G+L7RCrw5cevEaUZRoSl7mseqgG270bSkMx9w+5E8bmnpuzSXT7NdTIrPpSLjzRr8a2mmXMKbgwxXO6/SXSwl6COy5eBo+9abv3NWKlF2nGOtzjKC/2NqxY+87EfitIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=nhXk9vEx; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="nhXk9vEx"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c96b2a10e1so6471920a12.2
        for <imx@lists.linux.dev>; Mon, 28 Oct 2024 03:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730111176; x=1730715976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tF2Wj+vRMtC983z9w7XL42BV51oFEPPNHEhybEVd+Q=;
        b=nhXk9vExE5Bd4kqp8KgLjQ4kTd8FKv5YvF4DXMHVw8Q0gUZvXIMRef4HhLXYdHBVV7
         Ymk3W0X/Pj+707myzw6Yn+VWgdYgATGzDYLAbMCUdNjiijl2sgIlcFq2d6bHwMwNQEGw
         3Z3lNMMp/D/PElSp8MY1w2YM6DaMxCOI6DSEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111176; x=1730715976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tF2Wj+vRMtC983z9w7XL42BV51oFEPPNHEhybEVd+Q=;
        b=PUFrB3MjXRLwPWmVULLDFvV86JD8CO9HZFOMzEFr35eCzSrFIut/nAF9Csr3EaTUdJ
         BeTN4IcyI39x4fDTkxGQr8FeAZCqLBoWjcGsSR0HCdkmABj40gbbm4WV1MVIQraDh+HV
         QFfwMFgtnlVNH55LfKzYpgvAUU+HC2DIsjP4d0WKjnw0lCn0vcR0O07kE70KBrEbk4FW
         dBl72TVZ/itPIjeIajqMRqo0wOQ6xXiMU1Youqen6xOXiv4gB76vTNVBbIHw0JLAe0Ya
         qiKMeYCmWHgK5FYe3Bj8q4ZCIAibPncjsy+sKSqyzm9jemkC9kNntMqH180jhl5fn2Tg
         2rCw==
X-Forwarded-Encrypted: i=1; AJvYcCUxKPeJtMn3UJOFOK5z5CPR/iumbua5OhEiLeWAad4HavSH0PRslkFGV9D+CB6wQBbMabU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJuRJ7BMJO5H2DLuTsbPVKvCgpokZwmmplphzROiITE1gDRN+q
	FdxRfeSzp+hjrw6B7hSo4tB1RTu5P2OLRX4Bg/JH2uzGXqkKFgWag+QVcYNT8GM=
X-Google-Smtp-Source: AGHT+IFdXb6XtLDCZdRMrvkyA0aKsne7r7Yx41P1F2c1jET9YdgAPGWx1KeM7QlZRwkreW9voNIysQ==
X-Received: by 2002:a17:907:1c22:b0:a99:f1aa:a71f with SMTP id a640c23a62f3a-a9de5c90d49mr793546866b.11.1730111175841;
        Mon, 28 Oct 2024 03:26:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:26:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [RFC PATCH 04/10] pmdomain: imx: gpcv2: don't turn on a power domain already on
Date: Mon, 28 Oct 2024 11:25:27 +0100
Message-ID: <20241028102559.1451383-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch, by informing pm_genpd_init() with the "is_off" parameter that
the power domain is already on, prevents the power_on() callback from being
called, thus avoiding the unnecessary repetition of the hardware power-on
procedure. This feature is crucial when supporting the simple framebuffer,
as the power domains have already been initialized by the bootloader.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/pmdomain/imx/gpcv2.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 963d61c5af6d..bf9fe4af03c5 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1324,6 +1324,7 @@ static const struct imx_pgc_domain_data imx8mn_pgc_domain_data = {
 static int imx_pgc_domain_probe(struct platform_device *pdev)
 {
 	struct imx_pgc_domain *domain = pdev->dev.platform_data;
+	bool init_off;
 	int ret;
 
 	domain->dev = &pdev->dev;
@@ -1354,12 +1355,33 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 		regmap_update_bits(domain->regmap, domain->regs->map,
 				   domain->bits.map, domain->bits.map);
 
-	ret = pm_genpd_init(&domain->genpd, NULL, true);
+	init_off = !of_property_read_bool(domain->dev->of_node,
+					  "fsl,boot-on");
+	ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 	if (ret) {
 		dev_err(domain->dev, "Failed to init power domain\n");
 		goto out_domain_unmap;
 	}
 
+	if (!init_off) {
+		ret = pm_runtime_get_sync(domain->dev);
+		if (ret < 0) {
+			pm_runtime_put_noidle(domain->dev);
+			dev_err_probe(domain->dev, ret, "failed to power up bus domain\n");
+			goto out_genpd_remove;
+		}
+
+		if (domain->keep_clocks) {
+			ret = clk_bulk_prepare_enable(domain->num_clks, domain->clks);
+			if (ret) {
+				dev_err_probe(domain->dev, ret,
+					      "failed to enable clocks for domain: %s\n",
+					      domain->genpd.name);
+				goto out_pm_put;
+			}
+		}
+	}
+
 	if (IS_ENABLED(CONFIG_LOCKDEP) &&
 	    of_property_read_bool(domain->dev->of_node, "power-domains"))
 		lockdep_set_subclass(&domain->genpd.mlock, 1);
@@ -1368,11 +1390,17 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 					   &domain->genpd);
 	if (ret) {
 		dev_err(domain->dev, "Failed to add genpd provider\n");
-		goto out_genpd_remove;
+		goto out_clk_unprepare;
 	}
 
 	return 0;
 
+out_clk_unprepare:
+	if (!init_off && domain->keep_clocks)
+		clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
+out_pm_put:
+	if (!init_off)
+		pm_runtime_put(domain->dev);
 out_genpd_remove:
 	pm_genpd_remove(&domain->genpd);
 out_domain_unmap:
-- 
2.43.0

