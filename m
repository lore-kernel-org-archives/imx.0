Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266387;
	b=S3KgOimrozLSzznRzSYDTRg9JjK/XBAAndEXBoKXXmgnqJY/rL1k782lt+9plIAQK1bl
	 PZaSm++WKKnydrW0xZU63bqf8v6unbiLaHfeKCzNN5QOT0m5wfKOnobHCiJt6wb3Xx/Ds
	 ByvBSwZydk5JDfXASuBZXYL7Y8rC/HBnb7zl1tKy8t0+poCWyMYlWpdz2+uMDhjbdRIVC
	 Kw/oTp/7giQm1lMwKF4V2chB4CP05eYWCmvN3PxJolFt3TFQc3sE77LVpFYHmvDjlxB1t
	 h4dXcKGz61HEUaT/ebledLdIivkCb2wG+La39fAy0O5ujhkwIMMdRuQPxn+2IHvCirA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U33Eqi0MwkCHOyFx02ypgQ50QlY/YFdApS7Aq1x3HP4=;
	b=SE7uoHQagyg5eNxIQV3LmmuTwE7M9gxsY0HY+FqCMGVSofDxUqkH179KWzg1GpF6SJyY
	 Iy6UWwXyz8f0MmXJCW2/Y87EAdrnCZkbhtN1cLpeYdlbQaKrigNmb8lBzXlRI/E5iqcxT
	 5QyjrFK4lxz4I6/VrrD5XO0EH3bJKJrjrh51STajHOCk5l96L1SUfHfR7USpN4UuHcGaT
	 TZD7HmYGgjOzXHeKRAsuDip7ziRkpvCuWcYUPDAXAr8egCUhc2qbOoW8BJp4Nn2PhVd6h
	 eBvRuRl2SakyWBSj4ZjOkaXweYv4gHWhhsCF337unteGVTQj8GYdVeX9jMDDOc7yeuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=DXpCYwSe;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5DA606A331
	for <imx@lists.linux.dev>; Sat, 21 Nov 2026 13:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5DA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=DXpCYwSe
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-497614c95f0so1071307f8f.1
        for <imx@lists.linux.dev>; Sat, 21 Nov 2026 05:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795266386; x=1795871186; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U33Eqi0MwkCHOyFx02ypgQ50QlY/YFdApS7Aq1x3HP4=;
        b=DXpCYwSe3Y7wztxSgJeGgM8C2C4SFrsfRCaLGsBFoXJbczNQ+/NtKCbxryxFmhStCI
         N/UYcG2NHCoO77CqD1ieF3FVl0yUJTvGHwxXH4MYQpX2uF9IGK/Rdu3ZH/wo60eM7yW0
         kZQJShEqwjtCoExs4lWKdGMcaPjKrDrHuLNl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266386; x=1795871186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U33Eqi0MwkCHOyFx02ypgQ50QlY/YFdApS7Aq1x3HP4=;
        b=EsmQ6gB8ClEgZ40vw+jB6bLevF7cBEktfDPF8NZMXg4yOBaffQzXrPxds6vDOzmGyd
         9M0kbHh+oqj77ofVdMHNHzgzyr//wX0IXsbvavHjd4sgT+NafZhuHcgW+gI3HHEi2QJA
         aWTuNJQw+rCTgUmudygYaI3WblmREcsxABXUT7R4IoZqAq52MC52159jTp3NLgbuMYeg
         1jWpN4MLs8O7ip6QRdunH2HH5UAjiG/5YB59NQ5xWY6UJpymvZ9knqOADAgfJjCVYdx6
         clxsoTWHvigv+R4VmydUtqqtX6hHSORTol5LLeGL6PSloxiliJWu5rjQR3PpK994gzeZ
         9IFg==
X-Forwarded-Encrypted: i=1; AL+hErHzxWAeEROmdF2KhOJwBR/GSMcS70pJH8syDU/mn8mT9uRHTiLQaCF/i+644EjPFAiD3O4=@lists.linux.dev
X-Gm-Message-State: APuU4Z/8/ZT52dbAOZRYzrzC0rXlNWZsnb6Yp6jjdrRMFjBmoP3L2r7a
	cD8O+JD9bAKBaTlxibBvAuaExcDw+9qcs6/qtQbipLtgvRMBv9YJD4XmvFm8cWzERyg=
X-Gm-Gg: AZFdTZc4mNPp5DoRPHOovBSs4f4ml+w7BTny4UQYtRFSTp5FXkYuCJVLQ6GUn0hXzgX
	hPftx7EWIt1osmuE40cgMLLOnwNkLaI320/b1YxrFCK5JvVduVfybbQkyPLAuR9dskqG5JXWP3Z
	v0ybkp4Nwj5cXI8EyPhvrdt+2La3th5ZTE+3bsLp3St0B+8wAjtQvHg7YgQMVHlOA3xj9uxQMvf
	czbO7pd+Zndu/iz40/BytfTFE74Hu6e4C82YrgmqNGCc9A1tpRUd/cG1ICnf8igW6OnUxzqoj8l
	dbXycLfmTM4YtbhCB+XjGBf1b6CUlG1fOewNjkDywUJkGoIalubUKtYW2nVLCwHPLnc6Ygm9JxR
	qSLYcGxeFiEPErAurvtxd92vFr5hWdb0g2RJ2D1dgZilKO5+5H46SG3quCtd6MhDp6lg5cVMCZi
	Gb52D1opmh6szI1/CuMU0s0NwV6Pil6cep/29J5CZmp3gY2veMepPP+CTkpTk8POvjVT9s2sDh/
	s9/DeH24EFXSPHEyi7YN6DaYMUBVc8Tlf1qqaHxY2PmgnzLUBJdmhHKZnEI540PQ+ZLeeMk4M2v
	ARjTYNidaUbN3W7KhgQHRGtzvd1l1rZy+WI1oBQGfwbiarAv+eSft5ifSDD8QcvcBLHm62yoOYz
	NmpfRjlicdogFEGrWTbc9BibJHRZJmo3Fyzelz4SiDWHQ2hHnsleZVsCTaT86MSojj8WSOGAWfY
	NLdF9rf7a3YHWLZ8jm7RvHJs/ZZB4=
X-Received: by 2002:a05:600c:848a:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4bb8880993amr134343985e9.7.1795266385739;
        Sat, 21 Nov 2026 05:06:25 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm47196545e9.3.2026.11.21.05.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:06:25 -0800 (PST)
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
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 3/3] pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state
Date: Sat, 21 Nov 2026 14:06:10 +0100
Message-ID: <20261121130614.2482656-4-dario.binacchi@amarulasolutions.com>
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

The clocks of a domain left on by the bootloader have no user until
its consumers probe, so they are gated when the unused clocks are
disabled. On the i.MX8MN, with the LCDIF driver built as a module,
this stops the pixel clock of the U-Boot splash screen long before
the DRM driver probes.

Keep the clocks of these domains enabled until sync_state, i.e. until
all the consumers of the blk-ctrl have probed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 35087da43dd7..95b010505ded 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -84,6 +84,7 @@ struct imx8m_blk_ctrl_domain {
 	struct imx8m_blk_ctrl *bc;
 	int num_paths;
 	bool boot_on;	/* Left on by the bootloader */
+	bool boot_clks_held;	/* Until sync_state */
 };
 
 struct imx8m_blk_ctrl_data {
@@ -245,16 +246,33 @@ static int imx8m_blk_ctrl_get_boot_on(struct imx8m_blk_ctrl_domain *domain)
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
 	if (!domain->boot_on)
 		return;
 
+	imx8m_blk_ctrl_put_boot_clks(domain);
 	pm_runtime_put(domain->power_dev);
 	pm_runtime_put(domain->bc->bus_power_dev);
 	domain->boot_on = false;
@@ -452,6 +470,7 @@ static void imx8m_blk_ctrl_remove(struct platform_device *pdev)
 	for (i = 0; i < bc->onecell_data.num_domains; i++) {
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
 
+		imx8m_blk_ctrl_put_boot_clks(domain);
 		pm_genpd_remove(&domain->genpd);
 		dev_pm_domain_detach(domain->power_dev, true);
 	}
@@ -1032,11 +1051,24 @@ static const struct of_device_id imx8m_blk_ctrl_of_match[] = {
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

