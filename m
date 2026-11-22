Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362928;
	b=FiX2W8Dh5DpJBZJxcrm84vFoDVvq4dUQxAh/M2AYMW9i578dEc5bx3qSNQxPwtl5ZyYJ
	 iBYOeq6v3ERqz3371JXb3Cjv1hx82qs4kbZmNyt/hrdPXCZjg/lQH6Lg6bL71zdexjFEG
	 zCZiTYkWDSkL7TN000B2XIi/aYANGaV/o2RpK9ufZTiAviN7QgY/Kuowf587qOy7eINzx
	 yQ0O9fKq2TnNrzHK7/9r6IoEooJXVhWQvZ6kP0tW2+Ser1KLzMdyWRoo6HFTAPymqt7VC
	 C8fhB7BbSPXeSPUNrzruzHYqSUIDQAi6TOecVjcb1W3nkcC52mfI0QY18ZXZFpNQr0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8K0cfCfqUv0w+a1bum5L9vcom6pDs+Jx7qFAqrqGDxc=;
	b=mHN/cghEdvJ9CUbdyhqTHS/zM6lmx4ZSkC1Gz4H7iFHhgKp+ir+QuIicS1WbkgUQnFu0
	 LRfYrqPW1AyJhsePqNSHsQ66rByEpH3rQf4UI6vs+UQj3Om3lmB4YGtF+bKE2s4izQbrz
	 L3USixrE2TUmeYh1mKmmrQcJQ60DT17YqZJVL3m58HytwKcRwgDCQEHSU8oCe2UPxmvsP
	 tdnE88LAN0hE9TsBvupK8D1zzOmonrcSuMKCH45WF/fTayNlU1qS4ggZhkM7/1Vagqv+O
	 b544rcojntUfSzyZI+//HTIw56RnHqzYXPFe3a6dfwTzBx9Gfz7oI5W0lfE1Q4Z0PbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=AsrQ6g+m;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C429F606A320
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 15:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C429F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=AsrQ6g+m
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so1997637f8f.0
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 07:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795362926; x=1795967726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8K0cfCfqUv0w+a1bum5L9vcom6pDs+Jx7qFAqrqGDxc=;
        b=AsrQ6g+mE0whZ74QJ4Vt1l3axk3nNjKHBD4abwlDfBQSCG5f8FHolVxSIWYG7pyNyO
         LBOeH8FsxWpv9sGlrhhobXUfcULad+pmlzBGSh6BUnMxyb4ws6ngh9CIqAsSeu+oIhjQ
         9Nk0siocjyFf0CJOHu/B8E5IYsVDy9gVMbK+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362926; x=1795967726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8K0cfCfqUv0w+a1bum5L9vcom6pDs+Jx7qFAqrqGDxc=;
        b=fdXHYuspHMporF6q9Ftd81ExF/W4U6cw33rNLfCGKDHO/0Xj5RvwK3gKOibJeZCkGb
         3H1NBmKO4AecfhYEDIFtkzvJ6XNRpETAUtmf4MCFRSG/cza+aLZ2Zzx9za6wMwsL9iT4
         XQ02/f+CMSBw4ccZLCs6YRkWTEsuqdwpAW+W+p9U/r2LKGwTZyK+9W5x3e+kvy+t6W7h
         /cq9q8m+pZYgiH6wgDCwzp0puTxE98siNPDcfek/qxvC5c0Eey7ijaPZ2IPduYhq7h/Z
         tpbL6z/3SJ+8/ju4FyPG88bJi6+yvT9+1umc+tYg+ZoWZqmaXfO6X08YDlA5Ucxl5VIn
         O0DQ==
X-Forwarded-Encrypted: i=1; AL+hErHMNHUIsCigftdYG9Umns77Qva8jYXrOgy7BcBPxkkGw7p33fNaP0oDP2d6fGB+LjABnIU=@lists.linux.dev
X-Gm-Message-State: APuU4Z/1r6DD220n5zkEmEiuFBGhky8kgo6lJGPC9ov07RoQ9itWOnr4
	hJko7fH1R1hDrNZjnTZsBYyjECTJ7uH5iloFOn68bPDJxk5hNQZc5e/8Y3Y6pFCJrjQ=
X-Gm-Gg: AZFdTZe9xWM+97dyOoqafGvhyjeC2ojGvbX38VuCxcyHom5Np5N+daJwWeRwMn4K9Rq
	+H4PAG22YuVQyG2TjAtWCX93r72UN8rDyg/su7zvOdCykleQ/nFhSiJkmZCI6QzwZi6TgUf6rfu
	0cNPttVIAj4E3oaEyJEr00w5eQ05O114VJlzhU1jBRLEGi5JzquOAKniY4tnB5xRWMZjveO3aFf
	6++SLjGwurE0XckHNwGHk7RPBvO9xqbFo0Qv8dZcqYzjWdhO3q7954Y+iKIjF7P7RdAjRzTN3xY
	7yJO7GntXsaFL6lKR8vupYl0Q/6ESV0i/ws9EfPcb8hnlj4wTO/IHuDYd76Izbbq7zRpSt2XrzA
	FcZqbtiM997Dzq5xQ0LcRvzS6Ya9qI5OHosV8KnCovkzyTVaC81PbGloQ6wCfqv7Vk8lf5b/knT
	YsL8rpSlBzHAv2TJLdEYOp6z+4uqb/SCi8UOTNuqY2Os1Z/aFlULaI1utJqb6S6zaez8kEEeJFE
	ucy1aSOV26L5WuKg4ryI8ZjVt5O7xeTqJrZppDyA8/FUuMoUAPQEd+4ccT+AC/N/i4Rluoekxvk
	j/Wpnl7NYenihoaXJjuMBDqtAFTr8JUsoU0McB7dGT8G9afvqaV670HWu0KzwG38oCLflpEOE+t
	pPjaXWVpQ1ci+RklWJvL9Wyrlm+j03FnpMP0uHG8Ylh8vUOoCF0kpRWXBZ7X+v+IY1Dcbtw5GlD
	yFdsTRL/oRVzCRBWv7p11w8uQCaW0=
X-Received: by 2002:a05:6000:2dc7:b0:4a5:bb9f:9c3c with SMTP id ffacd0b85a97d-4abb4c7ac0dmr21854740f8f.53.1795362926211;
        Sun, 22 Nov 2026 07:55:26 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm20046526f8f.55.2026.11.22.07.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:55:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 3/4] pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
Date: Sun, 22 Nov 2026 16:55:10 +0100
Message-ID: <20261122155514.10289-4-dario.binacchi@amarulasolutions.com>
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

Changes in v3:
- Keep the bus domain on while the state of the domains is read
- Remove the domains before releasing their boot-on references

Changes in v2:
- Take the references once the probe can no longer be deferred
- Clear the boot-on state when the domain is powered off
- Release the references when the driver is removed

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 108 +++++++++++++++++++++++++-
 1 file changed, 107 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 7d6735728d8c..99d75bfb69e9 100644
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
@@ -250,6 +322,17 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 					     "failed to attach power domain \"bus\"\n");
 	}
 
+	if (bc_data->boot_state_readable) {
+		/* Keep the bus domain on while the state is read */
+		ret = pm_runtime_resume_and_get(bc->bus_power_dev);
+		if (ret < 0) {
+			dev_err_probe(dev, ret,
+				      "failed to power up bus domain\n");
+			dev_pm_domain_detach(bc->bus_power_dev, true);
+			return ret;
+		}
+	}
+
 	for (i = 0; i < bc_data->num_domains; i++) {
 		const struct imx8m_blk_ctrl_domain_data *data = &bc_data->domains[i];
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
@@ -303,7 +386,8 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 		domain->genpd.power_off = imx8m_blk_ctrl_power_off;
 		domain->bc = bc;
 
-		ret = pm_genpd_init(&domain->genpd, NULL, true);
+		init_off = imx8m_blk_ctrl_is_off(bc, bc_data, data);
+		ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 		if (ret) {
 			dev_err_probe(dev, ret,
 				      "failed to init power domain \"%s\"\n",
@@ -312,6 +396,9 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		if (!init_off)
+			boot_on |= BIT(i);
+
 		/*
 		 * We use runtime PM to trigger power on/off of the upstream GPC
 		 * domain, as a strict hierarchical parent/child power domain
@@ -328,6 +415,16 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
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
@@ -347,6 +444,9 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 	if (ret)
 		goto cleanup_notifier;
 
+	if (bc_data->boot_state_readable)
+		pm_runtime_put(bc->bus_power_dev);
+
 	return 0;
 
 cleanup_notifier:
@@ -356,9 +456,13 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 cleanup_pds:
 	for (i--; i >= 0; i--) {
 		pm_genpd_remove(&bc->domains[i].genpd);
+		imx8m_blk_ctrl_put_boot_on(&bc->domains[i]);
 		dev_pm_domain_detach(bc->domains[i].power_dev, true);
 	}
 
+	if (bc_data->boot_state_readable)
+		pm_runtime_put_sync(bc->bus_power_dev);
+
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

