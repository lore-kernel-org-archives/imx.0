Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A386A3DEFEC
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 02:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780455564; cv=none; b=Bf4+42UEzilXvGVm10tklkle17x/1FJc6G8x2Amz5J8cAbfzWMlBvjOwGd77c8YBbra9vw/nV07idmVL42lmNSznfo89Z7eee4U2eDBh2Hn+0s2F3rCEpte7HielLlj4Itrr/gTQHMIMla3/fV3rIrJLv8VF/2fe6gc183hCtTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780455564; c=relaxed/simple;
	bh=ro5ZEfTmRSMETPH4SY7HmpTDWhtnqn6QdkxvFDRAIY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OoPCBHFKQF0m1ereDLvCKkHkjlFzEccAqTjCYKd20CkRgWusTFBWfVWYiXcW6rwLtvMCkndyLat2IuOSdD3E71+wXrg6jPlL49KqcY1E1TvfaXUt753Ofh1V0WOtBvby2iJLgy7vKSeihvEeMYeQmRY2B0/1jHs8yS1xQxCKReE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekFr0CnE; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekFr0CnE"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf3781ca51so39016685ad.0
        for <imx@lists.linux.dev>; Tue, 02 Jun 2026 19:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780455558; x=1781060358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBVGXB/2UTdyKtSi19WHbufi1S2ilaO9ich5RG7k16s=;
        b=ekFr0CnEm2gR6+an7sA1R1C5wNRSARYTHZMr9NM43knSo1HjHReLHnBqrjNIcWHcpx
         UZqKSXBYKQ+ATtKk54LujzCReJPTA8LxSPSWm1ay3leFxHC+wqvGJpWb8jbtBNwMKRD4
         fYtS32NzuD0VeISbL0Oc2lyj5TsbJd9b0Dl/190a4Dr/aXOgoVuXsMx2KSmQeMimN62u
         aRC7xyK5818lhnjXIz048QsEl+Y/ZTw+USq82OIkN9oXxlLR9Z+J4oYMHEdfSMOT8QBY
         rohoGfbeDseYSxpf2fZDbT0IVRJDWtZe4Z4oICGPUyhMnutGQyuQo3Q4QntMpS5P69lp
         gf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780455558; x=1781060358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EBVGXB/2UTdyKtSi19WHbufi1S2ilaO9ich5RG7k16s=;
        b=VDEShWPMhxvE8H8RcyVQZLxeKoBa/lgS3H7w91KwARCib78/SbMRSTJr2bm9EGjduK
         PZZZmWaONbLesB7Focfm8A3saE08ucMzKfRJoYgMLpmgssirJDFPNTxRKfwIzj+Pioi/
         /ZbvfBAwxRHrKlMRgeoEH1Tk1pk7Pl9C6CxasbPCxIib1uGiPiZHXh0k6e3wrfKLhEhh
         nVuwFpwoegDU9Embi/0H7vMGoLgIndY1pDiWJ4sWF+xXl0/NBvykFPbb/Bgj2kEbvySZ
         eKFznrJZs/sa88jrLC3evYeJOS8LTrvdmw0wkTg2YvfwopBgBhcuUDLpXuKBurUx8hkX
         YVqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+LHBBFXlqE3pCscYz8fKU3hT5dGV4FrSFTp2jYv2JKEwa1Avai9sWIBtpxFJT+2HfqCc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhuvkkKV1nR8jqnJUGIgQel86aroF8td5utNpQoJkv1Rqx9zy5
	VCipEzm5LHMEg96ZBGdTpEXWEex4hCilfF9y3j56U8cHZuOJe9kM62ya
X-Gm-Gg: Acq92OHc9V4V0qiv2Tsw4PNjdRnUx8YlF7ZE/mY/A54avJ0dEMGFiiMbcrlcZ0tnLuX
	8e+eWcsoKkWg4wLgKDMw4J8+EzESO87SLP1NN/6tqKTqdNOK02OsA5O0B232YmclSCeWegMHI/H
	fvcz0iKrQHkaEVgrDAgZuPnQst9rIaOcm0WQuakNOH8M4tLsL+wHzqYH+FlPhEZQOtl7QLO5rYh
	r9m4m5v6Hvo5+CMaO8/6Kws8RaWMt9FU0R5WRvJtlcG5xNhcW2qVPLfPUslOWmJHu1aGO8fAn+x
	XNqGM/s4nYOd1IQfpLSYBXsFGJgT5HWBbTfrBRka9WcoBpnOWvwg4r3l33yGGo3d1zawrlJuyHi
	VNZ/8O5eFZtJraZ0vQkAZbHPcUtLptb6mF4nhvCEqIwQo0z+/WDNppiy1raWiZN0gK3ND7fadv+
	2n6hFyW3QhKwQj0nmDKo9NP8SMvIEPKJarJy7Akh7PFmvOgXLE0x1icKDw59MJO1seQpoI9u9ph
	NoUfTwVMC9q+bY1j9ty2cxYHnaARDepEaz66xFfH1uFLw==
X-Received: by 2002:a17:902:ccd1:b0:2c0:f807:56b6 with SMTP id d9443c01a7336-2c163a16bcdmr15056895ad.4.1780455557822;
        Tue, 02 Jun 2026 19:59:17 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm8093805ad.17.2026.06.02.19.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:59:17 -0700 (PDT)
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
Subject: [PATCH 2/3] serial: mxs-auart: use devm resources for iomem and GPIO IRQs
Date: Tue,  2 Jun 2026 19:58:56 -0700
Message-ID: <20260603025857.287148-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603025857.287148-1-rosenp@gmail.com>
References: <20260603025857.287148-1-rosenp@gmail.com>
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
 drivers/tty/serial/mxs-auart.c | 55 ++++++++--------------------------
 1 file changed, 12 insertions(+), 43 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 1390fa000a5b..4499e3206e85 100644
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
 
@@ -1586,7 +1569,7 @@ static int mxs_auart_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	s->devtype = (enum mxs_auart_type)of_device_get_match_data(&pdev->dev);
+	s->devtype = (unsigned long)of_device_get_match_data(&pdev->dev);
 
 	ret = mxs_get_clks(s, pdev);
 	if (ret)
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

