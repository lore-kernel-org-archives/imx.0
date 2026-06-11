Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6294633B6E3
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 03:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149159; cv=none; b=F4jqBbBbAw+BvN88VEU9o07IuGjZ6gr0HWUY1X+1EQKHfriUz/Hx0M5inpNQS+/2R51KvchFeLz9bFEXGZJcHFU2Lgu/VVR09gp/zlIFMzykr4OEKzseZVjBnwOZM3pMJpWDYmr9nWLl2y2jmV6Wlb1fa1QUkj6G5htyi5NCTTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149159; c=relaxed/simple;
	bh=VuqAk7fmE2Ltz5WBlY6dQwYowm3411vf/6KNWP2/3e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WPj2Dlu3/bY1LGnBEzBP1AzDnf5XvQVZtUaEaAVA4jxYp4JKZWB3Fx0K9T3QZbwxspF96fASi4L85P5/u4fGrpQ3CrH4Ueb9fGmffahwv1Ib62Vc/k0ohHND426C0+WCSaVnYPBAWu/ZNBEjMBvSuP7em8JMRxAwIrM9T8IWxyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r6BdNT9p; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r6BdNT9p"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-842848fd613so6405453b3a.3
        for <imx@lists.linux.dev>; Wed, 10 Jun 2026 20:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149158; x=1781753958; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jagaY783ZQexk/NjgnRY09dQ8WqyYDUPOGhKANIhzfg=;
        b=r6BdNT9pR4Lz3U+0C+ajUzxmupAPWbRri4FC6zpHwIVsdQrnckH6OU+f/uZPwPvcL2
         MX5IfU9+2YzHlpNlmAF9VOrHLNKUfmgybLJd3mH23yJvi7U331WRbFd6KxZP4xBdnrna
         M/XqzheNMOCfbo1g0ClHENK3qBemMypAywcVDz8ELzz+Cc5Vg+ncpLJ2A7DtEd8ma2Xw
         PpitEMJ8Cxne9FEYET/J62i44LV1QcHHaPNvpR002BaYgSDtfTV28/DqnFbI32w7+ABw
         TcPXxr2S37smHMrbvlrTzcrHulxRttUW+RWw7Tsij0W+nzfZLYLlpVRvN+nULO3c7l8x
         qY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149158; x=1781753958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jagaY783ZQexk/NjgnRY09dQ8WqyYDUPOGhKANIhzfg=;
        b=hbV+12pyoLF1x6+nYRKGgV3+se8fwP6WcNRLKyGGBmBorZ0NgoS6LAYD8jVMX3SVmF
         FeVkB/9CYDnEcS1tctt5dIUi9OvcGKrwkKZ81NQIkwuHzsGx3+PElREeyfUN3lKexG2D
         VOtiGh1hm3hnXh+w3S+JBA7bBGojSFJJsjyrrzx9TObWfWqVgJWLrUS/oIMLCB4mqUJZ
         1NW9WAoOeRwEAKXSxRMA+TNOo8/FpBwbXRNwLgPA+zrBbSxf581/AufALjI/QKWmFrLa
         kB8sbmA7uqux2n7v7jplnIgHpm1wSq3lSDmhvCp5liYZOeDu865n6Q0aUPgF078ZwWtq
         V6zA==
X-Forwarded-Encrypted: i=1; AFNElJ8PXI1h/58+CPegHhshNMPRyJlsfO90hEa1O2VeEPxaPNLch54SRtC28dGhuLzGeVH+J2A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLnqlZqZ05pmbMZWkyExHc8NTHDe1lnydz1c/tspUhCD8CDcoN
	chxil35Si9A9etiie6jg4I8iSOp3uf7/avlhcUHpUGn7W4Om5YM3oOI4
X-Gm-Gg: Acq92OGIkcuWSRWFuNXViL17EUNf/Cx4f0/1GZFPEG/t5gdGv0he46S6CaYd8qPALg7
	ukl6GQeT/upSXLBiJu5fsGh+Ib491uORIxiB6nvnt/Vdk7k13ukaXencWYcF350yj0u4iTxXOuT
	LkPHP68wUVIb3MHaQU/eZo3BJ1D3Lu0p+p0MXkdVSGY501EckWYAqipcAnzc1nffqEwspLSYqxD
	YDBuB4HGT5wMSHANfIAHZ+GLoFqzmy163ff4eh98khS5yPkpvCZfv6cx78iO7FNtt4lmbIDFlvo
	RR8kovAzyO4QO6qQUdOLQBRcvJNVjPkssrVK5S/wlw9QU/mSarR8hEAS38T3plAwuyR3rfVSuA1
	41tbBVl0XkBg0yULjqfomhbJQlUjoT4zgWdp+c/mBE8Cb6sdCC8+96CqxqDk0A6wAuTEzjmTaLb
	g10KltWEfst/Y9rGG2wecdHcqpBZAn6ylLbbbnol9dv5I7j5CpBMnQp+STAKELCeeuqHLfSfENW
	+qKFZHxCS2GTHmxY08keaFkGZY8TldIMUCdGJL7LkGwoeOsYVO9wm8U
X-Received: by 2002:a05:6a00:88e:b0:842:48ae:1d56 with SMTP id d2e1a72fcca58-84336b9dc4amr1007360b3a.35.1781149157745;
        Wed, 10 Jun 2026 20:39:17 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb47eesm334548b3a.13.2026.06.10.20.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:39:17 -0700 (PDT)
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
Subject: [PATCHv3 3/6] serial: mxs-auart: use devm resources for iomem and GPIO IRQs
Date: Wed, 10 Jun 2026 20:38:53 -0700
Message-ID: <20260611033856.6476-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611033856.6476-1-rosenp@gmail.com>
References: <20260611033856.6476-1-rosenp@gmail.com>
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

