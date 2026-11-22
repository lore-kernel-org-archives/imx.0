Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341582;
	b=mfR9IGswsA+aCZrarsJzoALVcnnny//gPRWtZnW3mmpESlRj2xs1RWLSvxUpy0XO47EF
	 K25MoAUdC7+QR5cICUxYM7MpV1LS7tpfgjfzgoKOiQe7Izq5XKMo18zBgefUCXJxBvZOH
	 PpkNp+X7AdshOkAlmLDuEMwNqg1WabUy8nbtI9fsecFF6wRz5GioJIWDku035pvzkS+1Q
	 xXiyrQ/6fSOlxiRFcHLj/8GwnXXfXi7Z06NCka9CXfeTgmEhJ33pRMkefaqxq4nc55ms1
	 pxjb3x5ZKc1af+3RtZkdN1LmHaU1s+bJLehqE6PHtRIeWG09wsTKbaupu42lDeAGOLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P4BwB3GPSpT/AdzHng5SCwGK7VpozgBU8e5MfbG9wwI=;
	b=V+xWh6ckqgvUHBcopGlyPSfqxJp3MNxdrbbEMgHEWjEYSFm23Ffge13m0j5EriI/MBXP
	 ojmZ6EqpxRZ2XdPtC7Qhq57c9n+edAw6XUtfDzD2TRSn1EPhVWOHRqiSL1xAnQ0Vaslgf
	 fgevvgqZ0fCr3Caf7qgxitZh9oBLXhVVAvhcO4Z/d1KTq5g/PT+mjlQFU8M5JXORGD8J9
	 8p1d6MYo6l23GOfg9OY9bfe25LhPDFjHak3NjTOzAi2vOFz1vFt8eWjBgwD42aQdWqSaG
	 cOp0RslKPkzkLwjSNxgx3FgHBL27DC4L/1cbw3w+AFBuDqrYI+jabpO/7s+V45LjVAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=QbFXyOmj;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FC9606A32C
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 09:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FC9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=QbFXyOmj
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so12182935e9.1
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 01:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795341581; x=1795946381; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P4BwB3GPSpT/AdzHng5SCwGK7VpozgBU8e5MfbG9wwI=;
        b=QbFXyOmj6DpIMnHQ3Bvq5Ic0+rY33byzdEBp8NF+SlXcX3ePOv3jqHQdIXNIb/n1QI
         dEJ7x4JPgz68HpZ5GaaCRkf1prhKAemDrBLL1hmBFwvxiWpGKfbG26Su1a9OizUfTSmB
         N4lO75BTuH7cmsiIIuq71Q2tVQjYz3DVA9p+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341581; x=1795946381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P4BwB3GPSpT/AdzHng5SCwGK7VpozgBU8e5MfbG9wwI=;
        b=udkNoYjW0t1uzxi1kVDk1fjTECh7SgWt+aT/+oTXeQvmE5tFpXK6y7WzP6qMLl6gKk
         63g7TrBFEBDJZUJ3g4fpwIEmcfVcZONs6vCCLqE5lQiIcLqq2WxH4rMpirI3RXEK/En+
         IA6O80u8pEeTERXB0qiUAa2TOMmY+e40bZKWBCuyKi3q2uJt1CQVl1VcuLv4XVJ+khGh
         gS8YTsTpRHmwwGhLp2GgK7pg/oIh4brzMqGPWlLlaBnD5P+pWofYNenOLR17qkQD1ij1
         7RjYa9lMruu2i9dURR3bPA75jG38dqHVCuTV+JLKj09BO/+p8GCuV513CUAE6jkppjAg
         sbhA==
X-Forwarded-Encrypted: i=1; AL+hErE/vjW3KYDWHySD3kegeVXWswMKk21WwYpaXNxF3EcsktHW+T5b16NsntCLAPhY0OzF7wU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9UC8ekLU/EleM9UJRfj5UUNlpeKWiq2+zI4vManHB3TG/0bFTs
	VE2VeshusIkI44zI5lmzEyK2apuOqadVGd1amBhnutXVCplA15zJuRkvJctM8SXhZSI=
X-Gm-Gg: AZFdTZdjsDbv2ngxq/gREKH73g9o+a251VEFLFwUjYzcMUC/pPTIMFjfoWZ1IWhc3B0
	kHFPfxPIQetcNQX6Er6kVwXs+lreyNkaHHACxvvDZEXMOdMYuY7lr/sniK3NtwtyxV9bLH8Nk+R
	Y8YacRyBlxtWEeaQwVuV9/6kXGMBcX2/a0jDnm7yIU/o55MxfhKXBCO4sLfRCAfM5WJy863i1wE
	PFdmEpr29MhSlgCIiJCOojnwOJWWyUSV9SpjWknnXWhwzS6RX0Spo8Ssf3uNvvbin2Z6D0o+LCD
	wIxAoZWgiLEfVb2OoSLh1kRIK1CBqTU3lcbkjqT0M1axUrLvaB/iNjfZTvyF+qY18XfxnEiEDUh
	qVO6WKUFF3ie2EBwi7KXvRmLl752M7VlNS8mDIGlcUHfKuDIE7j+jZT4ez+xrtsFqAJ8Z+RdlHH
	4pALhTMEQGnfgNpQuitumiG8vSHVjrbyi0WzH27sjop2BUrc+oOWN5uFyDmK411Byzwln28J0/M
	+lutnzoLSJKoZJsk3lOacEFaIv58oXLEwBu2ykbPCctylArNYVEH+rzJ0DJ7jp2h5oqlOgK0ZzX
	iimZ02ilgHWuOaJ3ML0dFM21EYRMgoBy4Gc6OYEn8K8yldJ11Rd1Kq9En1vXUv9Exy04x5VgsXi
	+d8EUjgrBhwTDQ8b7GR7DBrZ0q907ia6JlqouiRmOkLrF58IQ+G+GLV/9WZ+F1bwkCLFqSghW5m
	X4KYHr93gE/jJJ4OakwowCPPntUXMzhn4GQZJBYfcSU1SOWPg=
X-Received: by 2002:a05:600c:5249:b0:4bb:665c:a078 with SMTP id 5b1f17b1804b1-4bb8893a89bmr173732335e9.28.1795341580916;
        Sun, 22 Nov 2026 01:59:40 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm342455265e9.13.2026.11.22.01.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:59:40 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
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
Subject: [PATCH v2 4/4] pmdomain: imx8m-blk-ctrl: Hold boot-on domain clocks until sync_state
Date: Sun, 22 Nov 2026 10:59:19 +0100
Message-ID: <20261122095927.2631909-5-dario.binacchi@amarulasolutions.com>
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

The clocks of a domain left on by the bootloader have no user until
its consumers probe, so they are gated when the unused clocks are
disabled. On the i.MX8MN, with the LCDIF driver built as a module,
this stops the pixel clock of the U-Boot splash screen long before
the DRM driver probes.

Keep the clocks of these domains enabled until sync_state, i.e. until
all the consumers of the blk-ctrl have probed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Rebase on the changes of the previous patch

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 5ab201eefeb3..bc69e7336526 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -84,6 +84,7 @@ struct imx8m_blk_ctrl_domain {
 	struct imx8m_blk_ctrl *bc;
 	int num_paths;
 	bool boot_on;	/* Left on by the bootloader */
+	bool boot_clks_held;	/* Until sync_state */
 };
 
 struct imx8m_blk_ctrl_data {
@@ -250,11 +251,29 @@ static int imx8m_blk_ctrl_get_boot_on(struct imx8m_blk_ctrl_domain *domain)
 	if (icc_bulk_set_bw(domain->num_paths, domain->paths))
 		dev_err(bc->dev, "failed to set icc bw\n");
 
+	/* Nobody else holds the clocks until the consumers probe */
+	if (clk_bulk_prepare_enable(domain->data->num_clks, domain->clks))
+		dev_warn(bc->dev, "failed to enable clocks of \"%s\"\n",
+			 domain->data->name);
+	else
+		domain->boot_clks_held = true;
+
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
 
@@ -1045,11 +1064,24 @@ static const struct of_device_id imx8m_blk_ctrl_of_match[] = {
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

