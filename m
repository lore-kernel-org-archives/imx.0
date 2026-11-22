Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380710;
	b=1S1XkQF5K3+kS78KNKcF1IqX+9Nhje4/NR88ZlvWUR47zEJ33/ZeC+rsCedUzmXg8yKI
	 tDJHefdsdwuRgMzDBAV/1vQ8GrDO3+r3hjUNHAmmh485VvbyHWs1kNYG0/rqTR3FiwUoQ
	 URRRAilyfgPu/VkkWbsWYIRwnNC4amyozob+2LoBGukY/gHPxEHlFDruCNtlki1ViZ0NT
	 FPiuaHYSAKRvqFI/Su8A8Rk++tnY044+yv4fEdM70frks2YhaLitf5hE59h5aO78EKtgu
	 o6OnmtO1mQ/DS2A9NOsT74zsMHFiUSDM5J06mnkdFUF/954MbEYlvPeHmbMjvvkT8UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6PicXai3zi/Jeul0tDyGLavGDqHdliZb/sSdP134yZc=;
	b=BCMvBleUfGAfgb0hiCeC7cgmg7J7imTu1y4VZHzOYShRr/dPxKkIR2lOtFr/Y91LNjnN
	 ttVIh1XeKHo6u4+lE93+DfmyRZy2UN2z2S3Ob/Qp9W/lJfnho00eDWL88mWQnu6/5DiEk
	 B2b2uN42Y/xj0LQjtEWual2qGaZz40Nj0wlLYZ5dR7PuwaUr2mbpmemlsB9BW4Xcz8vyp
	 V/TM5exkSYgID2Bl/d4XQdFjxG22LqvRLWJE721yZw8gFFjNOhBaNixFvmIw8XMrob+7Z
	 Mj4cKuqHEzttV8WK7Ueh0KR5XK4Y+qdedh29eukOm4swCM0pY+XXX/oCeOrfYM7xdEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=FDKSPdTh;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A80D606A68B
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 20:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A80D606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=FDKSPdTh
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so19408855e9.2
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 12:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795380707; x=1795985507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6PicXai3zi/Jeul0tDyGLavGDqHdliZb/sSdP134yZc=;
        b=FDKSPdThVLrjF8K1o7x7YyetFvQZdF6pvO3/OLwtydXTD6d5yVkN4yINE0YgDaIxIk
         QS+MpzGUHw3+sC9t5QAZNmJpwiece2yOfk65nXpVSV4yPp2Ec71vb/dZxdbbvfHMXlHe
         DJUhUs3a6wlJd1LERPhuvT/3uZiOpVEDhcdOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795380707; x=1795985507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6PicXai3zi/Jeul0tDyGLavGDqHdliZb/sSdP134yZc=;
        b=QGWAqj70pg71eq+k1uWHo8WwkxkGxcpWa2AWFOYGEQPXwrXptqIYGm26GpptajJIJ9
         hnmAPwe6gt3u60SQoq/6MsC09Q7PQ8PZq4jenMT7DLnadj38aW6FOJgC3PZK738hg25n
         UdGLvgnc4M8UwwpnKDi7bZARIonXOl6TZj61c1/sXqezbAHklBenB4qEZQ4IZxkMWQZk
         Nw6YY3xugu7wB7ubaKiXS3GfE7wnVDrxUV8SaCcUjlazSJzYGj4o1q754zIjJuoAT+3N
         xYIl2QDueDUs9X+baCQZbLw512rACuXusUpfBAOSnS52d4trv8dRQQjasRIeyUGU2fWN
         SLPg==
X-Forwarded-Encrypted: i=1; AL+hErGGhEq8R4ZOeQo5cH9AoWzGnI2tiOExgtG1vCO+jd68PGFiicNGL3T2r1LwULuZEt7LoFY=@lists.linux.dev
X-Gm-Message-State: APuU4Z8QSisFynNKJu8IaI9e5He8nUqi/Y1juigUYc089qKepTV2JDbs
	0BWamBhne0hkTUEcSEiCw6cJ0nYfTnPRyhVasG1Tn2lZc31ADqXS5AhMuEfMu43W9Y0=
X-Gm-Gg: AZFdTZd4+iST4lkhC7b4d+L0VvobbiV/Yx4JPN2HC0FS9cXKTWcaalWuFhxioEVd64a
	bhQ8YA4zeR2YJl35dhW1PtxTpOftxRlOO97IiLoDlaazoQv2AdogT3t4SBrVS/w4LTTzIWV9EKy
	5cruFA3MbD76KJ7f++x9HuerA5hnTEN63QoA3kAvrKL36s6Kxi3IXaJheS0VHJwAnzDwF/tlHNm
	W9GqK33EwfuyBjeuZAZ5fQNvBjj6Yl3Cs0p+g2KAfuN54NdINxPPArWDrPqtxR/uqHX8qEcE1iD
	uFciGaDmEA8y5+swxEwbtm79uk+h0VajGqEXPt0FSX/tKtHA7mq4FVLE1cBehuSwQ3WJfxRvew/
	xrOrMrsM2tjh3RJ2l5WCwhMsWOAgFHvUh8aqtlE5l+BsH5LUy6MDTEvufxMUu3BZ8L9B19to2gE
	0UZ4J/AA6zc6iJRTd0Ec3MOY+H7dJPoWn8JWAvYbeAi7/d2Kp0RYsX3K+RC0MQxL1/cYlrP9P2w
	ZW3FiBATCalQICzSvvZGAsSxSdBncjLNPt/KR56fQNsSFMVTC1KS1lGty0CH/30raEZb1XJ7Y/R
	E6sFD4KxLSYSQG8/J2DuM+yXUkY4/nIar4waurLwbpm68AB0jzvML4MKtw75yvvsOjVCgd7NYCk
	64Ey2Jv3sc6qzIXDi8v993yyxc2711QcpkCb+5/oSsGevArfE/r1CTYUETWLpmJCu3N8BQKaNrj
	0VXjFS8opGSGzVVkjwyQ1l4jQiwg==
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr212608835e9.27.1795380706996;
        Sun, 22 Nov 2026 12:51:46 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm397355305e9.13.2026.11.22.12.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:51:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 3/4] pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 21:51:12 +0100
Message-ID: <20261122205136.138173-4-dario.binacchi@amarulasolutions.com>
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

The blk-ctrl domains are all registered as off, so a domain left on by
the bootloader is powered up again by its first consumer. On the
i.MX8MN this resets the display pipeline set up by U-Boot to show a
splash screen.

Read the state of the domains from the blk-ctrl registers and register
as on the ones left on by the bootloader.

Enable this only for the i.MX8MN DISP blk-ctrl, as on other blk-ctrls
(e.g. the i.MX8MP VPUMIX) the registers do not reset to 0.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Register the power notifier before powering up the bus domain

Changes in v3:
- Keep the bus domain on while the state of the domains is read
- Remove the domains before releasing their boot-on references

Changes in v2:
- Take the references once the probe can no longer be deferred
- Clear the boot-on state when the domain is powered off
- Release the references when the driver is removed

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 128 +++++++++++++++++++++++---
 1 file changed, 117 insertions(+), 11 deletions(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 7d6735728d8c..04383d7e40cb 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -83,10 +83,13 @@ struct imx8m_blk_ctrl_domain {
 	struct device *power_dev;
 	struct imx8m_blk_ctrl *bc;
 	int num_paths;
+	bool boot_on;	/* Left on by the bootloader */
 };
 
 struct imx8m_blk_ctrl_data {
 	int max_reg;
+	/* SFT_RSTN and CLK_EN reset to 0, so a domain left on can be detected */
+	bool boot_state_readable;
 	notifier_fn_t power_notifier_fn;
 	const struct imx8m_blk_ctrl_domain_data *domains;
 	int num_domains;
@@ -187,18 +190,87 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
 	/* allow bus domain to suspend */
 	pm_runtime_put(bc->bus_power_dev);
 
+	domain->boot_on = false;
+
 	return 0;
 }
 
 static struct lock_class_key blk_ctrl_genpd_lock_class;
 
+/*
+ * A domain left on by the bootloader has its resets deasserted and its
+ * clocks enabled. The registers can only be read if the bus domain is
+ * on, so a domain is considered off whenever the bus domain is off.
+ */
+static bool imx8m_blk_ctrl_is_off(struct imx8m_blk_ctrl *bc,
+				  const struct imx8m_blk_ctrl_data *bc_data,
+				  const struct imx8m_blk_ctrl_domain_data *data)
+{
+	u32 rst, clk, mipi = 0;
+
+	if (!bc_data->boot_state_readable)
+		return true;
+
+	if (regmap_read(bc->regmap, BLK_SFT_RSTN, &rst) ||
+	    regmap_read(bc->regmap, BLK_CLK_EN, &clk))
+		return true;
+
+	if (data->mipi_phy_rst_mask &&
+	    regmap_read(bc->regmap, BLK_MIPI_RESET_DIV, &mipi))
+		return true;
+
+	return (rst & data->rst_mask) != data->rst_mask ||
+	       (clk & data->clk_mask) != data->clk_mask ||
+	       (mipi & data->mipi_phy_rst_mask) != data->mipi_phy_rst_mask;
+}
+
+/* Take the references of imx8m_blk_ctrl_power_on() for a domain left on */
+static int imx8m_blk_ctrl_get_boot_on(struct imx8m_blk_ctrl_domain *domain)
+{
+	struct imx8m_blk_ctrl *bc = domain->bc;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(bc->bus_power_dev);
+	if (ret < 0) {
+		dev_err(bc->dev, "failed to power up bus domain\n");
+		return ret;
+	}
+
+	ret = pm_runtime_resume_and_get(domain->power_dev);
+	if (ret < 0) {
+		dev_err(bc->dev, "failed to power up peripheral domain\n");
+		pm_runtime_put(bc->bus_power_dev);
+		return ret;
+	}
+
+	if (icc_bulk_set_bw(domain->num_paths, domain->paths))
+		dev_err(bc->dev, "failed to set icc bw\n");
+
+	domain->boot_on = true;
+
+	return 0;
+}
+
+static void imx8m_blk_ctrl_put_boot_on(struct imx8m_blk_ctrl_domain *domain)
+{
+	if (!domain->boot_on)
+		return;
+
+	/* Sync, to power down the bus domain before its notifier is removed */
+	pm_runtime_put_sync(domain->power_dev);
+	pm_runtime_put_sync(domain->bc->bus_power_dev);
+	domain->boot_on = false;
+}
+
 static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 {
 	const struct imx8m_blk_ctrl_data *bc_data;
 	struct device *dev = &pdev->dev;
 	struct imx8m_blk_ctrl *bc;
 	void __iomem *base;
+	unsigned long boot_on = 0, bit;
 	int i, ret;
+	bool init_off;
 
 	struct regmap_config regmap_config = {
 		.reg_bits	= 32,
@@ -250,6 +322,23 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 					     "failed to attach power domain \"bus\"\n");
 	}
 
+	bc->power_nb.notifier_call = bc_data->power_notifier_fn;
+	ret = dev_pm_genpd_add_notifier(bc->bus_power_dev, &bc->power_nb);
+	if (ret) {
+		dev_err_probe(dev, ret, "failed to add power notifier\n");
+		goto cleanup_bus;
+	}
+
+	if (bc_data->boot_state_readable) {
+		/* Keep the bus domain on while the state is read */
+		ret = pm_runtime_resume_and_get(bc->bus_power_dev);
+		if (ret < 0) {
+			dev_err_probe(dev, ret,
+				      "failed to power up bus domain\n");
+			goto cleanup_notifier;
+		}
+	}
+
 	for (i = 0; i < bc_data->num_domains; i++) {
 		const struct imx8m_blk_ctrl_domain_data *data = &bc_data->domains[i];
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
@@ -303,7 +392,8 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 		domain->genpd.power_off = imx8m_blk_ctrl_power_off;
 		domain->bc = bc;
 
-		ret = pm_genpd_init(&domain->genpd, NULL, true);
+		init_off = imx8m_blk_ctrl_is_off(bc, bc_data, data);
+		ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 		if (ret) {
 			dev_err_probe(dev, ret,
 				      "failed to init power domain \"%s\"\n",
@@ -312,6 +402,9 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		if (!init_off)
+			boot_on |= BIT(i);
+
 		/*
 		 * We use runtime PM to trigger power on/off of the upstream GPC
 		 * domain, as a strict hierarchical parent/child power domain
@@ -328,37 +421,48 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 		bc->onecell_data.domains[i] = &domain->genpd;
 	}
 
+	/*
+	 * The probe can no longer be deferred. Releasing these references
+	 * would power down the domains left on by the bootloader.
+	 */
+	for_each_set_bit(bit, &boot_on, bc_data->num_domains) {
+		ret = imx8m_blk_ctrl_get_boot_on(&bc->domains[bit]);
+		if (ret)
+			goto cleanup_pds;
+	}
+
 	ret = of_genpd_add_provider_onecell(dev->of_node, &bc->onecell_data);
 	if (ret) {
 		dev_err_probe(dev, ret, "failed to add power domain provider\n");
 		goto cleanup_pds;
 	}
 
-	bc->power_nb.notifier_call = bc_data->power_notifier_fn;
-	ret = dev_pm_genpd_add_notifier(bc->bus_power_dev, &bc->power_nb);
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to add power notifier\n");
-		goto cleanup_provider;
-	}
-
 	dev_set_drvdata(dev, bc);
 
 	ret = devm_of_platform_populate(dev);
 	if (ret)
-		goto cleanup_notifier;
+		goto cleanup_provider;
+
+	if (bc_data->boot_state_readable)
+		pm_runtime_put(bc->bus_power_dev);
 
 	return 0;
 
-cleanup_notifier:
-	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
 cleanup_provider:
 	of_genpd_del_provider(dev->of_node);
 cleanup_pds:
 	for (i--; i >= 0; i--) {
 		pm_genpd_remove(&bc->domains[i].genpd);
+		imx8m_blk_ctrl_put_boot_on(&bc->domains[i]);
 		dev_pm_domain_detach(bc->domains[i].power_dev, true);
 	}
 
+	if (bc_data->boot_state_readable)
+		pm_runtime_put_sync(bc->bus_power_dev);
+
+cleanup_notifier:
+	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
+cleanup_bus:
 	dev_pm_domain_detach(bc->bus_power_dev, true);
 
 	return ret;
@@ -375,6 +479,7 @@ static void imx8m_blk_ctrl_remove(struct platform_device *pdev)
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
 
 		pm_genpd_remove(&domain->genpd);
+		imx8m_blk_ctrl_put_boot_on(domain);
 		dev_pm_domain_detach(domain->power_dev, true);
 	}
 
@@ -709,6 +814,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mn_disp_blk_ctl_domain_data[]
 
 static const struct imx8m_blk_ctrl_data imx8mn_disp_blk_ctl_dev_data = {
 	.max_reg = 0x84,
+	.boot_state_readable = true,
 	.power_notifier_fn = imx8mn_disp_power_notifier,
 	.domains = imx8mn_disp_blk_ctl_domain_data,
 	.num_domains = ARRAY_SIZE(imx8mn_disp_blk_ctl_domain_data),
-- 
2.43.0

