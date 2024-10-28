Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E061D2F6F
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 10:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730111176; cv=none; b=bvnqqOjqQvF7n023p12mXhnyZlhnant+N1PxVPBe510ooYFs1TGBM7LzBjM02E/GAqgjk2tQYwADo4MVLLWdTxVNX6u3EN361btSUKrENYWPp1pJ9KUE2Egn1R3kYeXDi0IJHVETh8mSDiRRRAGLlisDDzhmSlJJsLw3F+W/Ib8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730111176; c=relaxed/simple;
	bh=jOASmNrBy0k5ebd7B11buXOeSSx1yKz2tcuTybTDs10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9imn61bTKafvr3OKaD0lKl3mGxSjepWFgfE9TFsVCJpY4B4kgnT94/f2KAFKHC/VKroJRYtLXOOhEcRNw2KerVao3TO2BMET8p1da3Bkbp3OXng7Qz0e+4+Ms5VWl9ItShERVmowsTj4v1XeI5SI8Ot6TIcV70/MiwOO+5ss7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=lRFpyRhs; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="lRFpyRhs"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c94c4ad9d8so5185545a12.2
        for <imx@lists.linux.dev>; Mon, 28 Oct 2024 03:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730111173; x=1730715973; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErPoXh63XrcFWpHe9zG8v9aPuGfFzlqWX+d+j6TRc4A=;
        b=lRFpyRhsxlC+ww3RusF5gdmgIi1fHSoGgvkx2Ju4kv9oI1+h0xfff0amfcJBXtI/Ry
         8BkIgMNGgKEz7emPEE09WddGfogQUtfN59MKkBH1Ufc/PDiNdCkqwK3qX+BBqVcNlahK
         q5F2Ac4vnKxoP0+zYdN4ZZaulnZI+W9Ifr/Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111173; x=1730715973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErPoXh63XrcFWpHe9zG8v9aPuGfFzlqWX+d+j6TRc4A=;
        b=MDZ9QVrbt05X8AQGJ/BK4g8Yo1haaYa0sWnLzpGQUllgaEpssRSkDydBkNEl/SH1bf
         9ACVY5rQWypC1FWcBDJuUhRS6WHGVIizvTZt9+zY7bI9PAX0w/TOjs8MIl9zsDGlv9Xx
         EoJFNV9Oi0zEr18hdkLO8FCNkZnaOAl3QO8mepAFIEh/iFL67ymYzBqbUyBzRXfL2FT/
         0SV6h/IBqbUpDXq/6UabPfRpNmQ8FuN97o5Kb+EvKjIYW2d8dNpMeNqT87wg75Vqu9Ju
         JJM1Wul/7C6ywezhdmphT9jMkO67bdI+8EFaQnateoP044/kLkvIWbHiq5aGKYgeoiqR
         wobQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlqWL4kyj2xdtl+h15yz1mqjAw+nwRvOm7hGa5xNWdQeyYZXG0WEIJ08bavHk/Ntql2Ic=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRPdcLWQr1efyqWGAci8m/FNLRZSz/M6aL/YcK1qTMz7ULl7qM
	fBD4S+hmO1En2dxmp3mvD0NWOLBsplOLJbE2Z45bW9ENTDecIl/7EZ2+l1Jjd0o=
X-Google-Smtp-Source: AGHT+IGCR28JnEaozP81Xbh2KLif47qmv9KNL7NMIxup/Qx2H3ia0ChVJ6kRCnNRLDGwqzzr1QgmvA==
X-Received: by 2002:a17:907:9712:b0:a9a:2afc:e4d7 with SMTP id a640c23a62f3a-a9de619d18bmr803160866b.44.1730111172695;
        Mon, 28 Oct 2024 03:26:12 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:26:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [RFC PATCH 02/10] pmdomain: imx8m-blk-ctrl: don't turn on a power domain already on
Date: Mon, 28 Oct 2024 11:25:25 +0100
Message-ID: <20241028102559.1451383-3-dario.binacchi@amarulasolutions.com>
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

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 51 ++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index ca942d7929c2..8dc1508571dd 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -166,6 +166,24 @@ static int imx8m_blk_ctrl_power_off(struct generic_pm_domain *genpd)
 
 static struct lock_class_key blk_ctrl_genpd_lock_class;
 
+static bool imx8m_blk_ctrl_is_off(struct device *dev, struct generic_pm_domain *genpd)
+{
+	struct device_node *node = dev->of_node;
+	struct imx8m_blk_ctrl_domain *domain = to_imx8m_blk_ctrl_domain(genpd);
+	const struct imx8m_blk_ctrl_domain_data *data = domain->data;
+	u32 boot_on;
+	int index;
+
+	index = of_property_match_string(node, "power-domain-names",
+					 data->gpc_name);
+	if (index < 0 || of_property_read_u32_index(node,
+						    "fsl,power-domains-boot-on",
+						    index, &boot_on))
+		return true;
+
+	return !boot_on;
+}
+
 static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 {
 	const struct imx8m_blk_ctrl_data *bc_data;
@@ -173,6 +191,8 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 	struct imx8m_blk_ctrl *bc;
 	void __iomem *base;
 	int i, ret;
+	bool init_off;
+	bool *pm_runtime_cleanup;
 
 	struct regmap_config regmap_config = {
 		.reg_bits	= 32,
@@ -221,6 +241,11 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 					     "failed to attach power domain \"bus\"\n");
 	}
 
+	pm_runtime_cleanup = devm_kcalloc(dev, bc_data->num_domains,
+					  sizeof(*pm_runtime_cleanup), GFP_KERNEL);
+	if (!pm_runtime_cleanup)
+		return -ENOMEM;
+
 	for (i = 0; i < bc_data->num_domains; i++) {
 		const struct imx8m_blk_ctrl_domain_data *data = &bc_data->domains[i];
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
@@ -274,7 +299,8 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 		domain->genpd.power_off = imx8m_blk_ctrl_power_off;
 		domain->bc = bc;
 
-		ret = pm_genpd_init(&domain->genpd, NULL, true);
+		init_off = imx8m_blk_ctrl_is_off(dev, &domain->genpd);
+		ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 		if (ret) {
 			dev_err_probe(dev, ret,
 				      "failed to init power domain \"%s\"\n",
@@ -283,6 +309,24 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 			goto cleanup_pds;
 		}
 
+		if (!init_off) {
+			ret = pm_runtime_get_sync(bc->bus_power_dev);
+			if (ret < 0) {
+				pm_runtime_put_noidle(bc->bus_power_dev);
+				dev_err_probe(dev, ret, "failed to power up bus domain\n");
+				goto cleanup_pds;
+			}
+
+			ret = pm_runtime_get_sync(domain->power_dev);
+			if (ret < 0) {
+				pm_runtime_put(bc->bus_power_dev);
+				dev_err_probe(dev, ret, "failed to power up peripheral domain\n");
+				goto cleanup_pds;
+			}
+
+			pm_runtime_cleanup[i] = true;
+		}
+
 		/*
 		 * We use runtime PM to trigger power on/off of the upstream GPC
 		 * domain, as a strict hierarchical parent/child power domain
@@ -324,6 +368,11 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 	of_genpd_del_provider(dev->of_node);
 cleanup_pds:
 	for (i--; i >= 0; i--) {
+		if (pm_runtime_cleanup[i]) {
+			pm_runtime_put(bc->domains[i].power_dev);
+			pm_runtime_put(bc->bus_power_dev);
+		}
+
 		pm_genpd_remove(&bc->domains[i].genpd);
 		dev_pm_domain_detach(bc->domains[i].power_dev, true);
 	}
-- 
2.43.0

