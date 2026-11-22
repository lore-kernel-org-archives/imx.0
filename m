Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341578;
	b=duTRkFRFjVJhRl37kysALSH3i7BW+ac0CJPP44LnulM6AjfOE/+5jbh1mSDUHuizRA2s
	 pc0NQitvWTgmSJ3hir1kje7ZC08pkNSErg1h8e4fcCuWtn+jSEdn2Zes6hIlfYrHnRb7v
	 eWjSjP9566en9Krq9CnUNC9ucFrxjFxtWb1mh5WTFpAFPFvlzny8IwOf0MG6EXlgjNuZh
	 GPHJPqrySmLEDXHydC6ijXJlf+Qmt83CciYKXq9x6qAgI10JVnhFDY1yUDPMIZ9IcXge6
	 Y3GYoFPiiXWQnLUcLaUedkG6LxpN9sHpNfb6AOykB0sB0ppGxTYug/b5gJKMkYokk+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cF6KDJqu5o+VLH6VEzsmCco4XJ4A1kM2QuOlapez290=;
	b=uP3SEw8Y2JtI+Ukl1aztjflIPbUHnBiiu+Fx1sW03MxBF123vUsWj7GJdxdx+AsevQkY
	 ZZxvgCTYs+6SwDlrYJOOH5racKsJrOQQxe0UgmhSrTj9Hif2KBNUb68HV79zomocOgWf7
	 25KMdy8I+QpVEYbJTieTdpsiDnrToo73Dq1CEDXmF8jQK0whjJb8Ba+UIjVQh7cMAe8GV
	 l53MSwu7/X/no4xmgeJRqr4AIFeumCTlusCLZ3geqyYjg4Hs6MSsZdkm4L20LIOBsJddZ
	 EKJMEzM9IORSow88Nwh5pRAwFrRcRsBQmAJTmBP6zwMNMRa1ZVtvBjyGS769WPVia1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=HRUdH8PG;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB8B606A331
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 09:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB8B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=HRUdH8PG
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so25106065e9.1
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 01:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795341576; x=1795946376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cF6KDJqu5o+VLH6VEzsmCco4XJ4A1kM2QuOlapez290=;
        b=HRUdH8PGMme8hrRiA9BpV/ypv0XnAgS6yH9fsZaoy6dl8uZ2A7DR/w+bGcPs/vvaCn
         mRw3BupC7cIvqkoAWEjHvzc6CbV+qdaleQ8MGl88x/Y/cj1djmZ10tYK9DyF/HBQsyyC
         c36ryhNXPNKfIE7xV62ab/WuUbmc2GLVinAGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341576; x=1795946376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cF6KDJqu5o+VLH6VEzsmCco4XJ4A1kM2QuOlapez290=;
        b=hx1G2zjw5XsRryTDPqd6b6FTEGE8UUilbfo7VYAlhWnoo2fLcKJPitGCop3Vm1F5lR
         hnpdEriVlEPma3y2N645abU4UUG5ZUFWC+n3gJh8/MPYzftGHusZ+jlHNXEczxweiYiO
         +1+eHLXcTdRRM2maoJg1j7/6FgWLGht8CDlKyJTi/UvlQlvqhKUqGjq7K2E0LkGK2dNX
         TEzzbR1fGu9hB0PQyyOUZwfGi1Og2hdczcWRSyMqyPpTs9/rT8Jtcy0lWdQSyeEh+xJ7
         qcuhDJOPJU+w8RUSkzGwcHXMpUWljLBkWLjV8+U/gOO/DdmsMDphED6jtje5d7Eqk93n
         KV6Q==
X-Forwarded-Encrypted: i=1; AL+hErGcju4MxubSs/PL9FKKSviulpRIqYQTlwlDB86AiQihZnC3Xk+qKd4b7Js2BTV8niKRNGM=@lists.linux.dev
X-Gm-Message-State: APuU4Z8fod2hLuapeKFbRNXYFlIoZ5Uy5wNkP7wTkJaEImLuMbfmbtyw
	p61txdmj3ioRICU0vYmvp5h6j307aaz3oYEQgdDQVuF46EFjZSyaFiGQd8sn8JhctWQ=
X-Gm-Gg: AZFdTZfVC3lTK5ULo6sp1QE6QWDYSUmeE0F6OB4dur1ge5Nw5Kb4Bi4k8uNSxqQYrBs
	RsnzOoXcSwsP3yC4X6GqRwQHvx0tIZVZxvYD+0JmmFegJL8cDDdRTCH3Bnp0gRoGUPMjrGdoppE
	NgA6gwXjKtkV2rJXt9rE0d6uhQdKuhCXMx7DCs6j0n6q8GLTr751fVuzBXlN3zzv4+Y2yT/hVvs
	xRHsHuCJyYNVUa57eEWhXT7iRzU4FYE/sjmAn6WRL5iKxmU7yZIESwSmi9DMjFpeFayZtysCUZu
	9Rzw2XnwAzSNVMAXwokOKkfr3cBODz11Lw8s5bykw/OiRR3k5C5jKesQ2i7ur+XcBphp/zzwh6F
	1gpAF+qV+zIG53pcGxlwHwuUynXjPlJRomSZ+hodM0sRA/x1K90iHZZ0yMINjViNoTyWK5zl471
	+PXkut6960EYiI2KP0BKEz76BDK742EYlKfO33NaOCu9odKPnJ9s1wsPZt3iL1LXoti5N3vU9TE
	jTeQ16XSe34RHbrrTE2fsGRkhdkxgL9Hf3bUO/TN4ctxO6wnzbZWl8xB2Ih28DKnDfCo//CspsR
	06N7hdV+ylCwjzqWyE7f3rtFRACfLD+/VLQmyJRisGymaPChU4OB/+gfU2apYYvMzOgYdB3WSkA
	2+iAJNu7GttzHMZnxQKDoR5/YHzZHoXDkOe2fjHN1zB80ny92UN5zFlbhvJBmmHLbO1G/EkIYZt
	2MXyfXb6VuOWQTi+/rj8j/urkkgA==
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr35158925e9.2.1795341576638;
        Sun, 22 Nov 2026 01:59:36 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm342455265e9.13.2026.11.22.01.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:59:36 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 2/4] pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 10:59:17 +0100
Message-ID: <20261122095927.2631909-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
References: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PGC domains are all registered as off, so a domain left on by the
bootloader, e.g. DISPMIX to show a splash screen, is powered up again
by its first consumer. On the i.MX8MN this turns the display off and
hangs the system.

The GPC does not report the power state of a domain, but the ADB400
bridge acknowledges the power-up handshake only while the domain is
powered. Use it to register as on the domains left on by the
bootloader.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Release the resources of the domains left on when the driver is
  removed

 drivers/pmdomain/imx/gpcv2.c | 77 +++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 6a54ee734514..71e551f0471d 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -292,6 +292,7 @@ struct imx_pgc_domain {
 
 	const int voltage;
 	const bool keep_clocks;
+	bool boot_on;	/* Left on by the bootloader */
 	struct device *dev;
 
 	unsigned int pgc_sw_pup_reg;
@@ -488,6 +489,8 @@ static int imx_pgc_power_down(struct generic_pm_domain *genpd)
 
 	pm_runtime_put_sync_suspend(domain->dev);
 
+	domain->boot_on = false;
+
 	return 0;
 
 out_clk_disable:
@@ -1315,9 +1318,27 @@ static const struct imx_pgc_domain_data imx8mn_pgc_domain_data = {
 	.pgc_regs = &imx7_pgc_regs,
 };
 
+/*
+ * The GPC does not report the power state of a domain, but the ADB400
+ * acknowledges the power-up handshake only while the domain is powered.
+ */
+static bool imx_pgc_domain_is_on(struct imx_pgc_domain *domain)
+{
+	u32 val;
+
+	if (!domain->bits.hskack)
+		return false;
+
+	if (regmap_read(domain->regmap, domain->regs->hsk, &val))
+		return false;
+
+	return (val & domain->bits.hskack) == domain->bits.hskack;
+}
+
 static int imx_pgc_domain_probe(struct platform_device *pdev)
 {
 	struct imx_pgc_domain *domain = pdev->dev.platform_data;
+	bool init_off;
 	int ret;
 
 	domain->dev = &pdev->dev;
@@ -1348,12 +1369,44 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 		regmap_update_bits(domain->regmap, domain->regs->map,
 				   domain->bits.map, domain->bits.map);
 
-	ret = pm_genpd_init(&domain->genpd, NULL, true);
+	init_off = !imx_pgc_domain_is_on(domain);
+	ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 	if (ret) {
 		dev_err_probe(domain->dev, ret, "Failed to init power domain\n");
 		goto out_domain_unmap;
 	}
 
+	/* Balance the first imx_pgc_power_down() */
+	if (!init_off) {
+		ret = pm_runtime_resume_and_get(domain->dev);
+		if (ret < 0) {
+			dev_err_probe(domain->dev, ret,
+				      "Failed to resume domain\n");
+			goto out_genpd_remove;
+		}
+
+		if (!IS_ERR(domain->regulator)) {
+			ret = regulator_enable(domain->regulator);
+			if (ret) {
+				dev_err_probe(domain->dev, ret,
+					      "Failed to enable domain's regulator\n");
+				goto out_put_pm;
+			}
+		}
+
+		if (domain->keep_clocks) {
+			ret = clk_bulk_prepare_enable(domain->num_clks,
+						      domain->clks);
+			if (ret) {
+				dev_err_probe(domain->dev, ret,
+					      "Failed to enable domain's clocks\n");
+				goto out_regulator_disable;
+			}
+		}
+
+		domain->boot_on = true;
+	}
+
 	if (IS_ENABLED(CONFIG_LOCKDEP) &&
 	    of_property_present(domain->dev->of_node, "power-domains"))
 		lockdep_set_subclass(&domain->genpd.mlock, 1);
@@ -1362,11 +1415,20 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 					   &domain->genpd);
 	if (ret) {
 		dev_err_probe(domain->dev, ret, "Failed to add genpd provider\n");
-		goto out_genpd_remove;
+		goto out_clk_disable;
 	}
 
 	return 0;
 
+out_clk_disable:
+	if (!init_off && domain->keep_clocks)
+		clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
+out_regulator_disable:
+	if (!init_off && !IS_ERR(domain->regulator))
+		regulator_disable(domain->regulator);
+out_put_pm:
+	if (!init_off)
+		pm_runtime_put(domain->dev);
 out_genpd_remove:
 	pm_genpd_remove(&domain->genpd);
 out_domain_unmap:
@@ -1385,6 +1447,17 @@ static void imx_pgc_domain_remove(struct platform_device *pdev)
 	of_genpd_del_provider(domain->dev->of_node);
 	pm_genpd_remove(&domain->genpd);
 
+	if (domain->boot_on) {
+		if (domain->keep_clocks)
+			clk_bulk_disable_unprepare(domain->num_clks,
+						   domain->clks);
+
+		if (!IS_ERR(domain->regulator))
+			regulator_disable(domain->regulator);
+
+		pm_runtime_put_sync(domain->dev);
+	}
+
 	if (domain->bits.map)
 		regmap_update_bits(domain->regmap, domain->regs->map,
 				   domain->bits.map, 0);
-- 
2.43.0

