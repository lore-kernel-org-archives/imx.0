Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D253EF65B
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 22:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781044660; cv=none; b=SaMsSYP6p3/M5K4Jm8w5URipZfBD7tlNFObYfqPjk0IBUQghrt8tJU+jpWFw6ouKETIKc5vd3G74C5YAQxue4NhJrYWPl0o4HQ+daBrdmwOaqdiHdisV3WNJrzAlqQUQDThcAzkRsGP5jUqjyl8xThJuJg3LnkPupxWXoZr9iWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781044660; c=relaxed/simple;
	bh=VuqAk7fmE2Ltz5WBlY6dQwYowm3411vf/6KNWP2/3e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oTBjogwEeLG81wgfQlXilGQ30SZYDjxriMZu2D2FcG1g6uZKRoOMSLsR8XlOCu7tJndqVo6CAWLf1yytlpZF+cKT96iLvoswxsoNDtP/JDfVsMOS3HRyZ+Es7WRcx2YMGC74YN6fwydyPltkpYPDvAMnLONicWZQHIxgD/O25yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRXyFoNy; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRXyFoNy"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso42089375ad.0
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 15:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781044659; x=1781649459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jagaY783ZQexk/NjgnRY09dQ8WqyYDUPOGhKANIhzfg=;
        b=YRXyFoNybtaxwHvchv8iy5kaY0SKeQn8cg7UUDq1SOJ0pGX2zY+SD/ve5pS6eIgPyU
         U/FyoX35VRaV37CwpaBd+fCMPsV1NvWEDOREBOAg4GMkhJbH0rRK/bxKFFtN4M6jPT74
         2nd1qJOV8qN7fn5avBc+uqt49/aTBLdw59qowp7EhqFqZ9ofmma2/N6CkyZWOkZUAAQI
         DXszjRIPNqf6Hden3MvszkSV9kVvru5zXGBlP7AS7LNzfgvx/tC5UUUPFDeHL51BqfXR
         0hZEhi/mYyiN71ufOBM+hdrqEBLJbpF+o8x1Sy768TzodyEgVLlCXJ3bViBBQwasCiEi
         0mTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044659; x=1781649459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jagaY783ZQexk/NjgnRY09dQ8WqyYDUPOGhKANIhzfg=;
        b=TY/IMHNIk7SnvsuRg+GRLHZ9gfkSMhXD7k8f/PX1hbpQeoCtvpOCHzn/Z9f5RRZWzj
         TKyT8n7x17XCxdxde+eyRbxp3GPW8+OsPkv5CbsAruWMz3fh0SMamabUNiwT2OgSll76
         Ni9ytut91M5pBXtxlY3lgesUZLRI8gZ7Jel5bfAePvGKMJ2/rBqNA1AkgO3XbJNHYCud
         XnJ8oIWymj+IhLiNdZJx5WARqO9uxBhmVAuXVfe2HmOn7k25x1zzyeVwJydfq04iO/ZG
         WjX6BqiiwruLmMYdpEXu9B725SydRp2y/79VAtl0l/wRo2pC0/CimVqIo0NXA4ciGja1
         56KQ==
X-Forwarded-Encrypted: i=1; AFNElJ+AYSDPn6GWvOAKyzu0EDokvAV2q2ny0d4mT/fDRRMblfywVgUvS82wE/0h6ZM1nzlaw9g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLXuxLLavF1I16wensiN3SpylULwdPbyJdbPYZZFRa66DZR9uZ
	0KjvQlXaVlAlB2HcpVVMLicv5U9BmhUAA1myerNPjb6urM+mxBhtqSgS
X-Gm-Gg: Acq92OENqvD097c93UAJc9FpEdLapz3WnjXybXYzU2QBoPNnFFnIkI6a/oxZzxDtprO
	X5UUrQtuCepUYRDZpcQBBcGZPRWsKVwG5a5aSoMk5moHnQbjcHlYspiFBR+EWFFpN1cyrLwM9Qf
	WXivPk6pUfbSv7WXQBkevaT+PdCEawbSJslTJEy7d/jDT+fR1pgGJIlq3pCV35Kcv+TF8te1WOK
	vtrfx7COL+TttBMrPapfClEjHP8dkT7N03XI+63IZmFveLL6CyL2UMxUW5Qkr/mR2TV2SfV1G+j
	PJw8Mn+cWR5MN3mD3+/0gCgG4k4QZdWcAN8kIZZRNjy3bopHewVguHnZdbKNyXG8rXtQrX6xybQ
	WC6TSeOt7/NhpJ3js9MFslpuauzQF/Dn6j3B+in1jQLKjx+bzWhOUb+yOrHFW3HyW/YPJy+37b1
	0US/gFn0rCjYMeyX6BYNvL2ndmqawy3OhbfcblKEXKHBNUSFBEtmgGdxG0fIOdtfn0q5hLuzoFF
	w8LEAwfI3NTZIq75eo3XA4cILZsCI321sfPe5Ay/lfQrw==
X-Received: by 2002:a17:903:290f:b0:2c0:f807:a760 with SMTP id d9443c01a7336-2c1e7e51dd8mr158956345ad.13.1781044658617;
        Tue, 09 Jun 2026 15:37:38 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm293750655ad.9.2026.06.09.15.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:37:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCHv2 3/4] serial: mxs-auart: use devm resources for iomem and GPIO IRQs
Date: Tue,  9 Jun 2026 15:37:16 -0700
Message-ID: <20260609223717.41670-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609223717.41670-1-rosenp@gmail.com>
References: <20260609223717.41670-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace platform_get_resource + ioremap with
devm_platform_get_and_ioremap_resource and convert GPIO IRQ
request_irq/free_irq to devm_request_irq. This eliminates the
mxs_auart_free_gpio_irq function and its call sites, and the
out_iounmap error label. Simplify the remove function accordingly.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 53 +++++++---------------------------
 1 file changed, 11 insertions(+), 42 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index aa59a48bfad7..4499e3206e85 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1517,15 +1517,6 @@ static int mxs_auart_init_gpios(struct mxs_auart_port *s, struct device *dev)
 	return 0;
 }
 
-static void mxs_auart_free_gpio_irq(struct mxs_auart_port *s)
-{
-	enum mctrl_gpio_idx i;
-
-	for (i = 0; i < UART_GPIO_MAX; i++)
-		if (s->gpio_irq[i] >= 0)
-			free_irq(s->gpio_irq[i], s);
-}
-
 static int mxs_auart_request_gpio_irq(struct mxs_auart_port *s)
 {
 	int *irq = s->gpio_irq;
@@ -1537,21 +1528,13 @@ static int mxs_auart_request_gpio_irq(struct mxs_auart_port *s)
 			continue;
 
 		irq_set_status_flags(irq[i], IRQ_NOAUTOEN);
-		err = request_irq(irq[i], mxs_auart_irq_handle,
-				IRQ_TYPE_EDGE_BOTH, dev_name(s->dev), s);
+		err = devm_request_irq(s->dev, irq[i], mxs_auart_irq_handle,
+				       IRQ_TYPE_EDGE_BOTH, dev_name(s->dev), s);
 		if (err)
 			dev_err(s->dev, "%s - Can't get %d irq\n",
 				__func__, irq[i]);
 	}
 
-	/*
-	 * If something went wrong, rollback.
-	 * Be careful: i may be unsigned.
-	 */
-	while (err && (i-- > 0))
-		if (irq[i] >= 0)
-			free_irq(irq[i], s);
-
 	return err;
 }
 
@@ -1596,18 +1579,12 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		ret = -ENXIO;
+	s->port.membase = devm_platform_get_and_ioremap_resource(pdev, 0, &r);
+	if (IS_ERR(s->port.membase)) {
+		ret = PTR_ERR(s->port.membase);
 		goto out_disable_clk;
 	}
-
 	s->port.mapbase = r->start;
-	s->port.membase = ioremap(r->start, resource_size(r));
-	if (!s->port.membase) {
-		ret = -ENOMEM;
-		goto out_disable_clk;
-	}
 	s->port.ops = &mxs_auart_ops;
 	s->port.iotype = UPIO_MEM;
 	s->port.fifosize = MXS_AUART_FIFO_SIZE;
@@ -1622,21 +1599,21 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = irq;
-		goto out_iounmap;
+		goto out_disable_clk;
 	}
 
 	s->port.irq = irq;
 	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
 			       dev_name(&pdev->dev), s);
 	if (ret)
-		goto out_iounmap;
+		goto out_disable_clk;
 
 	platform_set_drvdata(pdev, s);
 
 	ret = mxs_auart_init_gpios(s, &pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize GPIOs.\n");
-		goto out_iounmap;
+		goto out_disable_clk;
 	}
 
 	/*
@@ -1644,7 +1621,7 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	 */
 	ret = mxs_auart_request_gpio_irq(s);
 	if (ret)
-		goto out_iounmap;
+		goto out_disable_clk;
 
 	auart_port[s->port.line] = s;
 
@@ -1667,11 +1644,7 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	return 0;
 
 out_free_qpio_irq:
-	mxs_auart_free_gpio_irq(s);
-	auart_port[pdev->id] = NULL;
-
-out_iounmap:
-	iounmap(s->port.membase);
+	auart_port[s->port.line] = NULL;
 
 out_disable_clk:
 	clk_disable_unprepare(s->clk);
@@ -1683,11 +1656,7 @@ static void mxs_auart_remove(struct platform_device *pdev)
 	struct mxs_auart_port *s = platform_get_drvdata(pdev);
 
 	uart_remove_one_port(&auart_driver, &s->port);
-	auart_port[pdev->id] = NULL;
-	mxs_auart_free_gpio_irq(s);
-	iounmap(s->port.membase);
-	if (is_asm9260_auart(s))
-		clk_disable_unprepare(s->clk);
+	auart_port[s->port.line] = NULL;
 }
 
 static struct platform_driver mxs_auart_driver = {
-- 
2.54.0

