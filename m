Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266386;
	b=Tfdqe77gchaueqmjZNcGYbr3CDdUnhn973LDPoYFQ9RmVFj2IKvtJpWrBlv/mAANIgHB
	 OXK8hd3KFYCHfw7qOv4nRETctHnToZkc9zj0x61qnsvHvuiyVfNL5KmAFAG+wBovsvLXP
	 f2I+K6Exe/nTVdmhiceahMcVTu1OhnimAUHE31slBwSf62QHTYZqLkvs5kg/c/r1ejNus
	 ZAaXJIDEhLCPas0dTqDN/fiWwd+QjweISs8nIGTRyaJvkUhI0BhFnGHzUhwKLOFHHSJ0D
	 VOm1LPnVoFOIp+0ApkAQm36mZwhMdo7jU0zl15FS42GJK5l3q4kS05892aOnS8h6qAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1h753CULixRQZV3ySqCP3XiaZBqrtw8lU8DJVEzgARQ=;
	b=noGO0eJx3SANZh0QVG0fqounTBuBRsw5pQiNgphHn75UctHQLPCs2ZOwbL1ubuAZJKOY
	 8lVfFJR+S4ebpHiKErAXqZLXTmIYm2IcP6BfrKWutWP+S8foUaktSE2dQMy1Ieo7ytoQh
	 /t1kxmQyLwnSMaS8+eHsfmsUn+5Ih+e9qi6U/a43Mg1ZIoOHKqy52ennSQw9ZfbDOnehN
	 q49wYi8JZXlsbYVR6S009wM3xv92lWySXVWEroy/1Uhnmfz16lC+opTygxe9QMCctw3p+
	 OXf0UPpwl9rDuYQEcSifXMZiNhfYyL6oAj+zlEKcnmoonhRyTFTGT8EreiCL0UBdV9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b="Et/mvTzK";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1C0606A32C
	for <imx@lists.linux.dev>; Sat, 21 Nov 2026 13:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C1C0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Et/mvTzK
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso17414285e9.3
        for <imx@lists.linux.dev>; Sat, 21 Nov 2026 05:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795266384; x=1795871184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1h753CULixRQZV3ySqCP3XiaZBqrtw8lU8DJVEzgARQ=;
        b=Et/mvTzKQL6DWGSsmpIxWs4orQzFNMIzpicBTSqR4vlcbM1cVvMDHcunq5Q77gkH5K
         pO+Urj+GzJ6rC2vZccFu0xO6eEweMks21LFG69EnJ7aYTzZkEcNYI6HGT4w8v1XrbIEJ
         yKTltzCrPI90VcpGJ9nGJtdZrkfKa+6n4d+Ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266384; x=1795871184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1h753CULixRQZV3ySqCP3XiaZBqrtw8lU8DJVEzgARQ=;
        b=BbWJTXnci4xZeCz5gPCRwnCsvXy5kNutVm8k6IwYIFXejppjyJi4V/ElCt0gCasE5X
         QgjoeDN/iqYG5MWmvyVmqcsZ66pf8jFGpre37ebmJTcguIiI/ACRq7ZOBWscmUfrqS1v
         Hi1OD4R7EwtlD004BC8CCwSqJPbcOZwAHIZKZhpjVSp4QPJViQVBjtA/ELCGzmqIN4AB
         +GPvi2mI+hRTrAth80tbgKZLdJL7/SuBxhSE5CvI2zqIG0nlLDOpjpQ9FoBer+UYSonD
         VS1dHuOwNdnc7u6QR4HyYVW7W/KmJXvR40mrc4yO0ilGL93Uj1pVJ23K+dkfwpBRkyWj
         9Uhw==
X-Forwarded-Encrypted: i=1; AL+hErEN4E1fLtyRP6aoZ9zNi/XAVyjtfv3byOAz4NgYhC6nOHYZrh1iyKwA0geb++H5pnH7dts=@lists.linux.dev
X-Gm-Message-State: APuU4Z9nU6KCQIojqnyA1OUAEDNqxHVXDQWDh3uAe5KtMgsyxK9qNlY2
	GymWoZa6hDLQ7I04HEiYt953x4wZSES4vihoI1fqwioZmdlzOFwpC5M+Pg851YPvZuM=
X-Gm-Gg: AZFdTZd95L7Bd+1YGKZwmu/B7RfIp5PEzqAHctp9jKRHTrfKdI28WHZdoKxf8acTjG6
	o/ythKSOUKxPnnJZ/ytZT2tW3x8qL6PJJ9wZpL3LDwcrVJOUF3NKCqFjC68u2Fl6KzMG1rkaL8X
	tP9SUYD7fcchOfL2H+0TAdu/k2IlFq5Bgj9knZ+YML0YAZ1zqiqNjVqtU72/WLiXI0b8U1a8plB
	RBy4pRjY8Wrq5MUqbaEYD+ncPue/JRnVEhkI3xeHENmamcMim6Vz1WM/p4vfZqy1bolF+28ctna
	EZliwd1T3DeRrfamuiqyQEkPHbdyCbtXFqu1zqvZ6lRxyqvs3CijvMrLjbXD/Hnem96QtHp3Qbb
	KapypG+qf9HCSDUUqCzC/xEHqA4iKe2BM8FuICpgkR+GCi5pkQcEuw1hUicz57Z3zg3ifF0G7Vx
	iccfleWaddyLmDV8ihNQRft33ECejRnh3Bg4w4/1lvj1SJrmc7QykilVh9rrns2Fi+Yt+dK2SmD
	zdSy+vIXWlvuaB6xNPtXCncS0ipkDW1aGtNoEINbE3YFpr2QjUg0Q8iDDl220FPnXzxYNWVYjzF
	XujupJWBRnzPZN06D96LAyRrmbw2RyTDSmXiz0YJyBKLrMDGCWPY68eSav6U2OVxOtaw4Lb5U0e
	GowdIpuD3pLIbjlRu0bTxjOVR1bDVA9K7zO2KmzRBsUP+k7qnDaFy9ufFcXUocawNIg81JO0co6
	OjyozWdUuC+Skjc1OvXqoigl7GBw==
X-Received: by 2002:a05:600c:5308:b0:4bb:76d6:1f5d with SMTP id 5b1f17b1804b1-4bb887ca192mr144536875e9.2.1795266383641;
        Sat, 21 Nov 2026 05:06:23 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm47196545e9.3.2026.11.21.05.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:06:23 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 2/3] pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader
Date: Sat, 21 Nov 2026 14:06:09 +0100
Message-ID: <20261121130614.2482656-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121130614.2482656-1-dario.binacchi@amarulasolutions.com>
References: <20261121130614.2482656-1-dario.binacchi@amarulasolutions.com>
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

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 83 ++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 9df933a7a238..35087da43dd7 100644
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
@@ -192,6 +195,71 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
 
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
+	if (!bc_data->boot_state_readable ||
+	    !dev_pm_genpd_is_on(bc->bus_power_dev))
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
+	pm_runtime_put(domain->power_dev);
+	pm_runtime_put(domain->bc->bus_power_dev);
+	domain->boot_on = false;
+}
+
 static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 {
 	const struct imx8m_blk_ctrl_data *bc_data;
@@ -199,6 +267,7 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 	struct imx8m_blk_ctrl *bc;
 	void __iomem *base;
 	int i, ret;
+	bool init_off;
 
 	struct regmap_config regmap_config = {
 		.reg_bits	= 32,
@@ -303,7 +372,8 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 		domain->genpd.power_off = imx8m_blk_ctrl_power_off;
 		domain->bc = bc;
 
-		ret = pm_genpd_init(&domain->genpd, NULL, true);
+		init_off = imx8m_blk_ctrl_is_off(bc, bc_data, data);
+		ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 		if (ret) {
 			dev_err_probe(dev, ret,
 				      "failed to init power domain \"%s\"\n",
@@ -312,6 +382,15 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		if (!init_off) {
+			ret = imx8m_blk_ctrl_get_boot_on(domain);
+			if (ret) {
+				pm_genpd_remove(&domain->genpd);
+				dev_pm_domain_detach(domain->power_dev, true);
+				goto cleanup_pds;
+			}
+		}
+
 		/*
 		 * We use runtime PM to trigger power on/off of the upstream GPC
 		 * domain, as a strict hierarchical parent/child power domain
@@ -353,6 +432,7 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 	of_genpd_del_provider(dev->of_node);
 cleanup_pds:
 	for (i--; i >= 0; i--) {
+		imx8m_blk_ctrl_put_boot_on(&bc->domains[i]);
 		pm_genpd_remove(&bc->domains[i].genpd);
 		dev_pm_domain_detach(bc->domains[i].power_dev, true);
 	}
@@ -707,6 +787,7 @@ static const struct imx8m_blk_ctrl_domain_data imx8mn_disp_blk_ctl_domain_data[]
 
 static const struct imx8m_blk_ctrl_data imx8mn_disp_blk_ctl_dev_data = {
 	.max_reg = 0x84,
+	.boot_state_readable = true,
 	.power_notifier_fn = imx8mn_disp_power_notifier,
 	.domains = imx8mn_disp_blk_ctl_domain_data,
 	.num_domains = ARRAY_SIZE(imx8mn_disp_blk_ctl_domain_data),
-- 
2.43.0

