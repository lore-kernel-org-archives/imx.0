Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380711;
	b=HQLzhoh9hklpJFYJOLSgAy5WhnkN5hNV+QljiifMgXteyiXz9KsEqpsfyD0tbIJD6LsV
	 UHJHfvMouintgM77ESHwPELuTNny5Q2hghrcu0rj/jHGNozRjmUbm7e8PUFPr2ZLFPiaH
	 bkRvRCoWNrNYo57ONXSQLV/upocBERlIKQt841gyqNybwShS7Rm1sEVAB6MLdogwK21pb
	 tFL3U/h7XGHlt66pX1Em57rX4xu0fLAPadaTUK7Z/isoL2/EwxJBYwgqnrWjjaXKZ1z+X
	 R6NeaNfKbR4yvWq7FO8LG9mD4GCIXHFVDxkaHfoMM4WwmXboJdzjtYFhoUOlb4JoYsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9qk8/ka9rPvexMaFJhcemSvfcHnBVEPtA/l1jjpp0TY=;
	b=gXVfLE+YDnSyICGlwKLrPkX0vkTHB9rFYNxR0r/BT8XJD5FF6rnKN5Fm69Kp5Ur7+k51
	 K5xWLHf+G182q4/CZR1C/0ntUtJEyOsONgdG6iRqYD5ymc0h70J+gHRERJn8wNr7j9yN1
	 XTspQ8vrWxGtfzsvopruTC1wR/fUWbrpW10Gl8uA8hSqQeZ0nXlWpgINYX90IEbctNIoM
	 vRNWpuV7nyiehZlCEcp/Ief4v5QiLmCinBLTz8tnr/IdTkGSZLBwEkfdENlma9wIxx7lx
	 l4sER2hjsgx8cxOmTRFcS2V4OfcGFArZ47tLPypeM0PFwPLpFpVbMqOQqB376j3IDbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=fc3jvU3n;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1E3606A68B
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 20:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F1E3606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=fc3jvU3n
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d05d51553so17972165e9.2
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 12:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795380709; x=1795985509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9qk8/ka9rPvexMaFJhcemSvfcHnBVEPtA/l1jjpp0TY=;
        b=fc3jvU3n6dDgyJsWH3wjyYLGlEX+EiN9fO5RBecqRImfDgX/1gJoGNYmjvi34BS1PQ
         eAxqugVnUe4S8YMtq4nb9HV++bX8VNEDJSl8xCh+6yLxHLrBGiItFiAxfKz4TaT45H3N
         BnCi4J/XvM966fEeU6GKzsiUlgg6rxFknOGo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795380709; x=1795985509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9qk8/ka9rPvexMaFJhcemSvfcHnBVEPtA/l1jjpp0TY=;
        b=z3p8VI9am6ClQzDgURTFR0o7A0hBNxOmltXlT6xrOBSHiaByps9MrpmVL8iKFC3DZn
         /o8clNo+O8Ohy1wNUh+Xq1xHmByjklY5YmLJGA/GWkUdnihQRWaKnf1BpZBZ+Fl6GLMa
         t1Zois476p5yxDC77jh0zKwEc3LD+vla3il3Lnw7Keku4qfAfIV6dLVGPf1SnkSU3Ulb
         hemsB0wF7//bUcBwip2Xhk4bTk8NwpAnqxP1iRVVm1SQJY//lstxfQs/RHpeG12K5uy6
         qNijSJ6WT/RUc+bLLB0k3qhZyoT5SoYRyaMhGX6dRGtjpOHz6ZRTJwydJ/LiErGkj6uL
         4ABw==
X-Forwarded-Encrypted: i=1; AL+hErFqR/z7dowyODbOwLeeKJJAvRUBHdenKoeKFqZ0kZqjG4o65ZZHvIVGqXlzrIu1iCYI4Ng=@lists.linux.dev
X-Gm-Message-State: APuU4Z8wpdY88cfmmCn1cUH7ipr3ccKFL+JdX0FqPKbkMlnnut96cEuV
	wNdfXl8fXdtn99uyzvkIUekksyemNoppCOFmP+2n1LRdb9UtRQGkhp4GyolHWeclq3w=
X-Gm-Gg: AZFdTZcugtvsDjvuNXTu3xVpirV2gvkb2JsrRQJP0f1v2yScrlT31pUl2YqOvohJbf1
	8cEtBU8llln4E/pXIQObGqabSOf4hyuq9Y93uKlZ66rc4fvCbDREGsVBUu4emxGU9V0fTjnC9M1
	dVf4wDVUxv/w9gOP2aZqObNcfLRLLaGQ5fe8M8utX9jHlPjOhOFRfm1bG2eeIJ5hOIhHDegwLKw
	tlCN09r29LHK5q8Na8rtsBpU8vSR/N5LHFYwr9rEiyiEJfPsrbp8VPRZtZ3WO0miXvlV2PI6RKw
	tTMCx3eSVEj2dCLNfsvBassoTTn/CnfKk6GYhca97f2wSzR4NO6IHOg4paR3SLOjyJdZH5b89/1
	n8pUMewGQ6KdI7oEUd376tzFGIkpsOQERxzFZQpvEiNOneSQxizWaxB95BIiovj7cYdqPhleoFd
	g4uaECKgCW+/eUeSLszqLu3DbKZ2NUNZ56JRxYWRFMDIi/mqJSk3W5b1rE5rdIooXuUKtU7mNaK
	6EQ5BV/pyTQBm+or+IRE2DVqaq0c4z/fu2OHUjoReM4WLvkMIZBkgEn4JaWuk1GlJjJROjpH09I
	EDDzRKL+x1UAVrpD5Mx9plq0AQ2CAzHdycY88NyjZEhOyOexLADfowFUffxAfSXGYGOCdoj7DiO
	hAcjWhzbDxQAuIDy9Oy34Kk7h/Wcmm6AOn9Ef8VmozdBkMp9TXZ7WSmO5cuwfZu1lZR92hSLxXk
	JE2LB38N9NTDRsp2Rgw/d7F75ZEw==
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb8880988cmr211812645e9.6.1795380708837;
        Sun, 22 Nov 2026 12:51:48 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm397355305e9.13.2026.11.22.12.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:51:48 -0800 (PST)
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
Subject: [PATCH v4 4/4] pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state
Date: Sun, 22 Nov 2026 21:51:13 +0100
Message-ID: <20261122205136.138173-5-dario.binacchi@amarulasolutions.com>
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

The clocks of a domain left on by the bootloader have no user until
its consumers probe, so they are gated when the unused clocks are
disabled. On the i.MX8MN, with the LCDIF driver built as a module,
this stops the pixel clock of the U-Boot splash screen long before
the DRM driver probes.

Keep the clocks of these domains enabled until sync_state, i.e. until
all the consumers of the blk-ctrl have probed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Rebase on the changes of the previous patch

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 04383d7e40cb..680a76b49ac4 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -84,6 +84,7 @@ struct imx8m_blk_ctrl_domain {
 	struct imx8m_blk_ctrl *bc;
 	int num_paths;
 	bool boot_on;	/* Left on by the bootloader */
+	bool boot_clks_held;	/* Until sync_state */
 };
 
 struct imx8m_blk_ctrl_data {
@@ -246,13 +247,31 @@ static int imx8m_blk_ctrl_get_boot_on(struct imx8m_blk_ctrl_domain *domain)
 	if (icc_bulk_set_bw(domain->num_paths, domain->paths))
 		dev_err(bc->dev, "failed to set icc bw\n");
 
+	/* Nobody else holds the clocks until the consumers probe */
+	if (clk_bulk_prepare_enable(domain->data->num_clks, domain->clks))
+		dev_warn(bc->dev, "failed to enable clocks of \"%s\"\n",
+			 domain->data->name);
+	else
+		domain->boot_clks_held = true;
+
 	domain->boot_on = true;
 
 	return 0;
 }
 
+static void imx8m_blk_ctrl_put_boot_clks(struct imx8m_blk_ctrl_domain *domain)
+{
+	if (!domain->boot_clks_held)
+		return;
+
+	clk_bulk_disable_unprepare(domain->data->num_clks, domain->clks);
+	domain->boot_clks_held = false;
+}
+
 static void imx8m_blk_ctrl_put_boot_on(struct imx8m_blk_ctrl_domain *domain)
 {
+	imx8m_blk_ctrl_put_boot_clks(domain);
+
 	if (!domain->boot_on)
 		return;
 
@@ -1059,11 +1078,24 @@ static const struct of_device_id imx8m_blk_ctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, imx8m_blk_ctrl_of_match);
 
+static void imx8m_blk_ctrl_sync_state(struct device *dev)
+{
+	struct imx8m_blk_ctrl *bc = dev_get_drvdata(dev);
+	int i;
+
+	/* This replaces the genpd provider sync_state */
+	of_genpd_sync_state(dev->of_node);
+
+	for (i = 0; i < bc->onecell_data.num_domains; i++)
+		imx8m_blk_ctrl_put_boot_clks(&bc->domains[i]);
+}
+
 static struct platform_driver imx8m_blk_ctrl_driver = {
 	.probe = imx8m_blk_ctrl_probe,
 	.remove = imx8m_blk_ctrl_remove,
 	.driver = {
 		.name = "imx8m-blk-ctrl",
+		.sync_state = imx8m_blk_ctrl_sync_state,
 		.pm = &imx8m_blk_ctrl_pm_ops,
 		.of_match_table = imx8m_blk_ctrl_of_match,
 		.suppress_bind_attrs = true,
-- 
2.43.0

