Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362925;
	b=0mGEiKh09P+VPLbv8jZ7KZUxQBFjwXfN5CZY2FCzcG0WhftGopqle+022E/SA/kYRu3n
	 skUl4glnefXtRrVnppPCKup3KwPgSn0eWcOEdjGV56Uau4aN8DCijXUAYvPAvZFWyEva0
	 3KjN5dmTeDaiQtuHAaFir/G1g62cgaq9p+PIAZ4k11EwT9IIIUdL0vPeG8CKYAb+vfK73
	 zjli8LalLE/9ZfUi5hHdF1/xKRWeTPVJiTTXJu5DreC5bxC7mX/qSPxIT/2iOtI4MGXPy
	 WVoJL/ievMZKC1/0Tz1zXKikMRgJSxLXmeUoiouv5QymQyI2XJRuzzZGIxGvrwHutCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0VEXadRTs4mVJ4mB3xY7u+vAwlCzDe/yNMl9zPs8LH0=;
	b=klcAdwvdFNNOqq8O1F9vKrO3j2W4SJ4UDO7O+Y1hqBtOR/s4vhtUXbE7Ib/Ok0DicVyQ
	 XwhzBKrrJn06+PbAffyLbLC9/91VwWXcnPQOuiO1oXhcu50aNH+ad0cFPIDZ9e2PkQoSf
	 DBuLi3yMN9lN4G6yj62iUIlROCyYEvUPyp3dAt3z5JqEoRFujBDukYpDB/5QC+LrN0i6i
	 Np8ku5CqBgahxUFYZKtSxdtDhOeJy5RcabfvME7MWleR7StPir8DVOK43O3HbAWzOfolz
	 Vn4hiXjrSat8XGXTfbbEIaeu6S6/DqBRkI3J8SbqdFhIn+pz/7peMj0lxWhr4vNJjOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=c+gf2etz;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5E7606A320
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 15:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B5E7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=c+gf2etz
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso1886310f8f.0
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 07:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795362924; x=1795967724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0VEXadRTs4mVJ4mB3xY7u+vAwlCzDe/yNMl9zPs8LH0=;
        b=c+gf2etzO1UbTranMSSb4Sk9tbhJww2uxYmDwkEodT4TULrEKxh1gRrKj8Fp+b1pGA
         jWo/3MDiGvIlw+wb0DLNgD88zBuB4PEg32jDLJQ3kf2Q31GHmt5ZcIgMbH7cYGSAhFRK
         dIbRPJ7TQAiHIcMznOVBX6mmRySkV54JBIw8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362924; x=1795967724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0VEXadRTs4mVJ4mB3xY7u+vAwlCzDe/yNMl9zPs8LH0=;
        b=OQYKjJjnvq4SFNSP4hin6kfpPbzKCuJYYSZhG9kg1A4PvhAd8FZxue6rMXMCL9Cqub
         FitsHK7Hkz9ZBlgLihJHkL1E/d1qnDzoJlrRUTOf8cMhktoiTiMJ6SJtd91wRc3Z/Swm
         J4ByRx7FudkRPqrdS8Xmj64vcN90f3nZtnu/iMWa3pLRwUuuvUj1vYM5fNZVXAvS8MKM
         n0EPkrbiUJ2ZPt2RfD2SDLCbqPbBeI1zW6wbgtwg2fODi1/X7tKLaS8FXZ01SixbNPLj
         1Zr3t0L+JIYSBiYBxaYuneWiQPF+WEmq9sOGg7tany2xZek2cD3PFihhTWu30aUkHi8o
         r4zg==
X-Forwarded-Encrypted: i=1; AL+hErGcB2rzNXQ4T+Nvcm0czfvTYMUrCGS8shLnQ6XMkAFf9kdJylYakYXFScPjdrxi/vurfG4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/rKJyRCcpnhsW86xsZY1dyZUJI3PoM/ZAoHDLThGwhYmhSzQPf
	KO33MB4cVEZ4DnccKqIGC1WKgXjzhMEMM+A/Kz0duNh/DXzHagSM2E9iuRZQQQiPLB4=
X-Gm-Gg: AZFdTZfXYxWqM5DhltYBiAzzuMLwxxCVF8RUhKYLq4VLezw1KbIWk834jQxn0aE8DXt
	sTkYbO7xw9/HzkM19KM3vhUSJhphOgd0mMhzk0CWQJKvqJav/2sToeP/8BL5zxBQUzQY9rZvwpJ
	0hFEhdDDyTNUJt+zI8e9OQr68Josz3WIEjRCW2NcLXQU3/yYsilt4/jAn0bK3V6jXBXFREb6GZe
	sY5zySO616utygwKptPRKIdlQrHiKGMCstgFFTAo9uqmfIMDF0S/bZiRyZH+SF6TFl8s5Q7+0HV
	VjWm92Ho2PNV+Et/j9ASRhAzp6KvVuV4MYFdSqE33I9M2B5dmHSrK4f6r3qx/pjUrftKR3yVnOJ
	8FO/J9WeK1XLZGjXB3CzYEpDy3IrnPZ6hykOnpJMVFW4la/6W+kwAi+UbXnyu65R+DxjhXuoK35
	wuKACO5IWwAhi5H85257OqXRBReJDHCNUefsmbX5GJTlA8CXklZ4acpUJiR8uawTBoG61oOEtSm
	zVjbmawrxi6mq37NWkB8akBRNXS5OxVMJE9Hp7KSJuhjzlyyNGHQTHE3gtSMNfKnsyRJvejLOlo
	oAJYGXlN3Rn0mTUsdDsRo6m1HjL7DD77Bo1S16r6fRxrqXZruVkci58VVPt9MChr6yjFhp4odPl
	iaXaaYklH0vWKbfQSTvDoFO9q43Xqi03179LEN9Y2MXcBmYZKna1b5hPXKzV2O9bwh/n7DWxZiG
	v78bsjGlaxARqMHL5zbpW1+IBgfw==
X-Received: by 2002:a05:600c:4f07:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb88804d58mr224971215e9.9.1795362923616;
        Sun, 22 Nov 2026 07:55:23 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm20046526f8f.55.2026.11.22.07.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:55:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
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
Subject: [PATCH v3 2/4] pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 16:55:09 +0100
Message-ID: <20261122155514.10289-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
References: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
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

