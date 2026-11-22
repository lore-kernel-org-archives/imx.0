Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362931;
	b=mPWd9jvmoxTGQy7py+QDbgBPVJMgYpjdnqTmy+xiJ5IW4aOrn+vjzATmV48Pl7ujpnqs
	 LLbv7IgIxUadJX+0mIeI4i55U515aJd+Ap+/EjUIy03smn7jdepGhcblJKBo7LKQp4g1o
	 G6vey3uUn3C19N8yrrXwG3GrdcAZxrWytyZyfkr7dM7sVwtmWPTz0oRPgpPULVFHYcwLm
	 Bp1WFxXMnJ53W/ztzSfBvmzWALUKtQ4lNmB5c50BAAGrux3yZLTJHTaP28EECaUxBSL6j
	 GsvSvN+EFGgDAAn9Psi9WvjYfk5F0RqJkUWlEVm/z1pLRpoiII/npeT9I3j7RqdBtKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YXPf/W4XcAqD9x9Cn0OV3MiVFNQRYObRCyBfE5aJVqU=;
	b=bFDp5Ls3WUfFKal6AKh0BwER3pefpHUTkIXCUK6BFGA6YgVaOcqI1VwaVZdJlnPmilbQ
	 NOjmMNB81QhJfqefD9tNJj1/8ur+yMJHmggRvJJ55RnHquf34dwOtFy+2/3ghL3ccCjwS
	 wr6iq0nUbgNxjQ1AKYxnXVW42t6QyBL9MiUd0ug4mGS24el2cB98W8hl/+6bD3rUZTDRK
	 6VJVNRnZPwOEaDstp+Mc3N5aFw2WPQc0q9/TqHw8mHRcKylcF/1zEP+n8qNdk8hHTNHtZ
	 gLcF3yJhYgsxj7Kdox5GTpC1J2wlVpDuhhPaOTaXbzyc+ZqboUvZeFZE3N9oWuFTT8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=fYxe6b71;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F21606A330
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 15:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37F21606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=fYxe6b71
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490d59c3edaso1639098f8f.1
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 07:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795362929; x=1795967729; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YXPf/W4XcAqD9x9Cn0OV3MiVFNQRYObRCyBfE5aJVqU=;
        b=fYxe6b71ltSDqZ7BSulqCWEcQPiGTxfBlu2AdNd+Y8bR4HpFgulJhJMlZtrSem1ztu
         jTSTyA6UkqwRy0y1uXecVEni687+JVTfFKOZelYmXgPXdiOMdSHacJjD7i8UaBaGALRz
         Zcm4b7CBurBzEksmPG6RwFIHFyo9NOF2PNI18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362929; x=1795967729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YXPf/W4XcAqD9x9Cn0OV3MiVFNQRYObRCyBfE5aJVqU=;
        b=LewwzTpONtkP/8h9rn9amqRoNFoLhbulKQ2Hd+9pzmlDyCfbwh1sAGkthTbHJZqaBq
         JVN97Q6gWB11AGOGskX2tA5lfzd0NjFN6nz+aPbnHi3G2yiULTwni8a4jw7XWjOvHFiA
         UMlBHit2vjkK0nHH1UmJbenkRiV54nTEZYXxbzZe+A0ZufeD9RRJudrQtcLbAJH8jco6
         TlAkEbtA32IzkHbSRuS3iO1Lq4LLvsYTRcxPdbUI09OAxQ+GJil1reBN0uutaStHj6vA
         gmmkOo+GBjuK7v/o7nkEM/f0niuSXN+7i2FpSbUs/pLYN3t2G9bVhJqm6qB1IReMDg0Y
         dGXw==
X-Forwarded-Encrypted: i=1; AL+hErGWs/3b/tXSdVkDJUOxHicpsm2k6NmGsXCChMH5JlPuE0iD1jpfnzcVlFNo/z1cLOluO4c=@lists.linux.dev
X-Gm-Message-State: APuU4Z/0/keQjp8onerXe46UMCz+eWQxbIuQpuPrwvlLEq2fLK1ZMeom
	jc8vVmp9XK1HPvX7K1PphRaZM381q+1be7llzm0CVgowAwKcradkqd5kbmAsFiS9gKM=
X-Gm-Gg: AZFdTZfS0wXrGuObv4wGlHshzfD5TgiTubhhYrZDZ6Uy2AROy6Lo7r6OcfF1LJ+z8Yx
	g1JJnMSF7vNnotMmtcJhhV05+E/iRmwU+BCg5fEDZa4u6YsqdWN7wZSWE5cQvX/dvKvNH3qPWiS
	SXpr4GmPkzh5Ug8+hPt43/2zbU0u5VgedxdxcuiduVBEWn0so4bGPPElwopA3PczjtNqbvtowS7
	2BXJkyizNBECh23ysVU39SlXyhUp1tyjqIsDQ5kh0wCuWU3Z2yIfdw49n3JToYh+giABNIC9HAo
	pdNGNwZHu2DVUCN0zxRwTS6BOVwgUjYdf9CoSBL2N7vP0I/r+wIq4Cw4L3jvzLAfApN6rw3+bAL
	+KgRvIgyo0v7eQo9tuMdx8UbtcMk9hztdw/BnrgVnx03Z0qmROVGkvSDfXiNF/0Tmu8u+TxU4bz
	6j2H7nXgEDBnqdzeH6DhzvIuDB2R7Lb4cER33PYWtxbAkKq8qSYdZUQC0B4A//2eJrFIxnrlZbH
	1wbaAPjNTXmQ4UH0lM1Ls5ITvTCk2AKAKpEImSiaod4w/UnltH4w54AHuiIcfVwl5KAmf65Zgkz
	w8loHrl9Qrl9kaC8bzklnhAgHFL7VWEZftfN263devoiRQ+BnOJajkrNb4f5ffPUVGQlwOThtQJ
	t/+IZ29csod61IqaV6JfVoMcM8mSF7IouwMNqvpBMtZGjpaE2uGwmGcJ/YdiaHJbpEyfW9ncIEH
	GGXhNi1kUrtTiNm+zOp7qbGNgIpA==
X-Received: by 2002:a05:6000:4012:b0:4a8:f1a5:efb3 with SMTP id ffacd0b85a97d-4aa550796b2mr23844832f8f.11.1795362929563;
        Sun, 22 Nov 2026 07:55:29 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm20046526f8f.55.2026.11.22.07.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:55:28 -0800 (PST)
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
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 4/4] pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state
Date: Sun, 22 Nov 2026 16:55:11 +0100
Message-ID: <20261122155514.10289-5-dario.binacchi@amarulasolutions.com>
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
index 99d75bfb69e9..e360cb038969 100644
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

