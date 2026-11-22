Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380713;
	b=Gzj2dGUwjYWLgvqS5tfA5nasddxW+DVPZFbvzklJKwHIQea6WoXgQUgWnnI9ACnu8tmG
	 mzMRqZnqKE43mdJdS5Ge8hdtf5u3hVQUmRZt+pvVqIuWzCXBzyNHpHD8+y1VKU0cATklI
	 ltFSKfD2nUyk+eqVuoJgp4sYhHfKCBwuZPd2R7EZdzb4oAm685+Sz9XmHZuAubx6JvISz
	 bG137Xf1hVUHez6B8TfWmtfEbmqhIULOOYFcvCAW7wyht3Ar+Ni79NYruBO1ERjWy2pfZ
	 NQUOeP+03YYHG9DcRHKl5rqK/MzcWnUQaWXsKLj8nppSFrPYRtdpkeRdCyyqCB1UM1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EZ2863pKGWwBwjrMKzumFwAyyrjNnDcDdwgqcYg/Bpc=;
	b=lQ5oA14BCieCzPGZN9COAF22UtmCs6QYtqZ9OP0fh+mNBsnCoHm7GTbzYnzJ3zoZxTUV
	 RDYsNg53dWaGw8eLZP7ooHvJ71D+yriVVcynw8iuxEvHXYnjyq1gwSNJxx/EWI+y2qCVU
	 xs8xgNK9d6vK61npew586d8M/hSP69nMejyoq2sBB5xwPIGE14fKrmsYwll3V/93/w4lp
	 +qTiHcCgN6BSoixcDMc4WrO7WIHe6R6PDN63km0gSo9/PC64YzxUSB4HOdfMI9DjWFoKf
	 eG/0RsXKz1I79vs8CF/EC4kpABVTiCC/tSjLEepkQMromj3XD5mvmJmuj2+S9CdFX8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=fklCfLow;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A65606A69E
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 20:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A65606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=fklCfLow
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb606491faso14413885e9.3
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 12:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795380705; x=1795985505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZ2863pKGWwBwjrMKzumFwAyyrjNnDcDdwgqcYg/Bpc=;
        b=fklCfLowiQ8KcQyMlDYFM478EqZJEWS9l2OjjvEd95wujMLgeoVGvTbvyG2lrJgTrh
         Aan6UW59XcamV3XoPlvjFQIWPYD6v+9CWQP4+osMtFUXGSZ9vpIQgXacPmmhKS1dDcz2
         /LhULCaPL8/q9L2kCTJHbQoW4zIByKZhSzzfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795380705; x=1795985505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZ2863pKGWwBwjrMKzumFwAyyrjNnDcDdwgqcYg/Bpc=;
        b=SvaS2udfQL8f1vIgv4acBtysiPz6xI0SfOxuT6jQzkJBlx3mE/oZTFBPefSLtCI/PR
         hyqDcsV67WHY0sF9VVoM8nuWiMt/fgi7lT515EuW1K8CRt5igGzD17pgUy5vCJQgJGjY
         uqRETMegUCgYT/PGV3UGIbcc1/7P+ga0efrYtLbr639oIPPxG/VXRmE4H8k0RU/2Muxm
         bFzFl5V4SvzlVHgkpg5x4zs8n3M17gcySIi1QtMwf/1bNhlN/VRcBLTZe3RzE3uN5uE/
         UtJMm9w/gYBCBC//E0D5H82n3d9f1v/QwWIDfcdBsIUAhgfmyDLWf+BjpsSiRGk0RWwD
         muZQ==
X-Forwarded-Encrypted: i=1; AL+hErHq8LQwn7Pd4eoFMgFUSOmlqm9R+BIjPFMb8hRu2/EHReqH/u3u124O+0Uq/Zd9FzFhs2I=@lists.linux.dev
X-Gm-Message-State: APuU4Z9aHRUxrfZWDM0hhtBCG/GarhOzQI+ykrYm3uBOaaKphYUnt6aS
	eTmOo1osCfC/rN8Wz5SlTBNTRW9kA3WS31FZVITDI/h8aJ4Q6BtsOyMgQPYBUF1i+A9h6nAwOXl
	xZ8Kg
X-Gm-Gg: AZFdTZfx5MEubU4yNTmts7/aanDeYCS9X+XzC5Jkgp3BlgmbMFznVqgxRIptoiIbjCu
	LpeLfjvI44bGypjDFQ/Rb3pf6P2HLXLcnphMI0aOUzOf6zq/aIXGh6aW+8YcV350Md1BqTzmtTH
	2iD2lhKA0lmc93qo8KtPdiKM1SL+ttqf8R4uq+VI/BZ+/M8/GJKeiQRxhaztdl/LWR+WTrODwrC
	I0yOGA6K2lAonIPkVadRtblFiSVBdknplt//pq2OY5aLNZDoCWe9Ocg0YlEosOav9XCk5Q42gqq
	MAvMXQobv7I0lKBWVA3/zWKGKU+qXKU0Mbz4kgpk5PZUPo130x2eZ+elM91bG9U7RbzfCXWZqXM
	jVMHetAq/kaTFC5KxtDaMmMfXmnku3CPknSRLcZXHZXAwfpFVilwpg5WQkQYvjETJ6Z8Q69h/n3
	dTedZa3S5v/gwDJDxv2UBTQx0h7LibLravFLRrnask82VI5MHK8V4uSkK07awROKiwUH7GXoMnx
	mqSiPPi3JLNVK1hEy5seJAdcg+FDk5fRWgozh7mgWGexxR5LZBobfSWR3F4fJ/ujv27ABe692vM
	os5a9PkfzVH6ACpYcz/NHiucYFpGjie/amkGll8mqfOZPWFLKMYumnZ4u62BcS70nxBB1lEg0RU
	qbvm3HD9RQB8OKCF3Z752ERPLD/0ff+B+qgR9w1c74nUp5R/x15zWOSB6g+mhJyybpQTSXjz6Z/
	WpDu6DPcwvim8bYDQcME667E+Jqg==
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb8881b9d7mr201262775e9.19.1795380704844;
        Sun, 22 Nov 2026 12:51:44 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm397355305e9.13.2026.11.22.12.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:51:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v4 2/4] pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 21:51:11 +0100
Message-ID: <20261122205136.138173-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
References: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v3)

Changes in v3:
- Drop the runtime PM reference synchronously in the probe error path

Changes in v2:
- Release the resources of the domains left on when the driver is
  removed

 drivers/pmdomain/imx/gpcv2.c | 77 +++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 6a54ee734514..f8f2d38c1b2a 100644
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
+		pm_runtime_put_sync(domain->dev);
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

