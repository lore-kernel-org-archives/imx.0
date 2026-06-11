Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36D0338936
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 03:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149161; cv=none; b=FdKMHIxaLxDpWMn+xDKwPTxox425YVUEggS80AmRxmiyMupgRMeRLzfCh2Ak7nJvG5KqB5L89XYV0BVCkvQPrKjKBhto/JRny5aDRGK/oXqH4cUt5+dL9YEwmKaF7Y1aVu21CIBRMuRkdn6bL3UHBkcv5CLuHsnlehS390Tg/ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149161; c=relaxed/simple;
	bh=KHFBKElH1lggN2sZB5oI+hYuA6tBhm4+ZNyZCHF4qaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FZlid1W4rXrGz01nVHnwv3fyEH5Zw3OpLgzUs8NTunuAqqz7vYjQtvDJhsGYzOdqosYhskxaPsl9ZRzfZoDdtLZsVdSvCnp+QhP0sdQreuoJglKe63xymaBM7pFj9Rn+vFvK4fzwWr/o4oEbSO8MnfdghzUkfXsrS85MT+Y+F5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brRZSpIS; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brRZSpIS"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c85d8615b09so4371110a12.3
        for <imx@lists.linux.dev>; Wed, 10 Jun 2026 20:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149159; x=1781753959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Enn6naQw+wLmV0GhfZ0seolUzIj1ObU+9VW8J0DyP44=;
        b=brRZSpIS/GS7JRAa/p4yEROuc5cYsmaDzXK48Zv9sl4Wg7J1odAK4yB3eAP+JLZLvW
         e3t61BXwQbEz10C5KmmQwlPy/G4xqd5W2FHi/aKXJ4OUCzcIG/iwOLX2Ez83hOYXi4b1
         iUI+5F1axfGFVt2j2nsbC88pIDLmw69a1DnNoYTauI9WFiHBFjwwJLoqnpW+2uVHJiOB
         4fjMRl7VtIgGdr9lehIGSPwtUksa+jsfx5Rzpae+SJq/lgDFIYYEZ2oUZAk5oAb5PbJu
         7XHgInh/SZMLQG/4laRxr7vT6k517DI6KIad9AiK6fgCEYhR0RqvNq5fLLcOKl0DDfMK
         hpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149159; x=1781753959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Enn6naQw+wLmV0GhfZ0seolUzIj1ObU+9VW8J0DyP44=;
        b=oxKajPoyzJCh2QiqoQ7CLe/OT9mbX3/EY5ea832i1BlXTuXG+XDhaOQDsgIcpe1xNa
         aDzycW8p3urZH+3VopH0BGpF7uU+wbNgmR0F2wLvUd28FitGXNGyqmns9Qg36n8351D7
         JMnxxc7ZTucWu9hfb9LXGkco3E9o1T5DFpmrT0gfkUNn3eBEnfNgDFeBNbMh6XtHMEa2
         UTN1dtPdu7VM1BYXlaPUn/MzfH4vYfbYU0FA4QS2ldwtpdjXt0JUZvOCzMZVIXRIJJno
         5JjcPFPVps5l+9la1JuJHXvgN4D3X56rWgarTpj012UwGxzdq5z5/DyUQ31vFceUfCrD
         v8Ag==
X-Forwarded-Encrypted: i=1; AFNElJ+4zgU7KdW3u7OZJ23s6rJgxBzsAK1YKDFfYALvJxgxMMSeLQZaRlfHvLXkSeJNz0ylag4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvgIdzxC9AlkvNmBknektoBQWayhzCnwdiPIUr7Zq9gSuzKtFh
	YVL/pmyg9nU8a4tEiepr+VtDptd8p4ZBF2DZNatE6OpklA5uk8D0jRKv
X-Gm-Gg: Acq92OF9KADz2g/kzThORKLzPrT+1H8PvAtWhgAz0Pq+/Iqq/MgXSmlgXQnjb+BapK1
	PRJgZo9cOOpjMxGhlbBheNdPch9FG4gSs9DkK+Kwh1S4+ppmyqG9P7nMDaamWjgPnx9V81BpdTb
	XHyxKP5ffNHT6tJmhUwzXFC67eb1tuxn+Asex+9MU55YFOIswDcGdgbbiXvU+JrADb9hzMTR9S2
	MAdYdwkYRSPH0vr2G7FZ8hWQid9S+8YGTgRcApaX6ecdxbplZHlpWZ73oXwcya/IDYkS3AVXo2B
	KOUxZR2LZRSYKkLfhtDOOvwBUHQn3SCmKhvwhjsMDBaiZpLdB7rahQLGm2r6/NhLfB+/WyAkXPY
	kFl4x0kepoQk9hhB+RIcTCDwDIJC9BXd66/Y7fWt2rDn6NdjclyqXBrlDBzLI1rmcRyt4HQyPvf
	3E4w7EWOhEwAwFrNX9kiAPia4Cogr92++LgCOaQnM3BpgTtM1LHj8Ma5lyBIPQgv+98tiwBq7eQ
	rVeNpHPVRLiHGycynPClWNQvTqUlEot0izSuCr+1nrpwLyQ9gk5Uz3N
X-Received: by 2002:a05:6a00:1812:b0:842:3801:47b with SMTP id d2e1a72fcca58-84336a29db5mr1024457b3a.18.1781149158983;
        Wed, 10 Jun 2026 20:39:18 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb47eesm334548b3a.13.2026.06.10.20.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:39:18 -0700 (PDT)
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
Subject: [PATCHv3 4/6] serial: mxs-auart: fix IRQ registration ordering and manage console clock
Date: Wed, 10 Jun 2026 20:38:54 -0700
Message-ID: <20260611033856.6476-5-rosenp@gmail.com>
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

Move the main UART IRQ registration after uart_add_one_port so that
s->port.state and s->port.lock are initialized before the interrupt
handler can run. Mask all UART interrupts before adding the port to
prevent spurious IRQs left by the bootloader.

After probe succeeds, disable the module clock for non-console ports
since startup will re-enable it on port open. For console ports, keep
the clock prepared so auart_console_write() can safely call
clk_enable() from atomic context.

Guard the IRQ handler and get_mctrl with clk_enable/clk_disable since
GPIO IRQs and serial-core status queries can fire while the clock is
disabled for non-console ports.

In remove, disable the clock for console ports to balance the enable
done in probe, preventing a clock leak on unbind.

Assisted-by: opencode:big-pickle
---
 drivers/tty/serial/mxs-auart.c | 49 +++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 4499e3206e85..e2b656638ab3 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -738,9 +738,13 @@ static u32 mxs_auart_modem_status(struct mxs_auart_port *s, u32 mctrl)
 static u32 mxs_auart_get_mctrl(struct uart_port *u)
 {
 	struct mxs_auart_port *s = to_auart_port(u);
-	u32 stat = mxs_read(s, REG_STAT);
+	u32 stat;
 	u32 mctrl = 0;
 
+	clk_enable(s->clk);
+	stat = mxs_read(s, REG_STAT);
+	clk_disable(s->clk);
+
 	if (stat & AUART_STAT_CTS)
 		mctrl |= TIOCM_CTS;
 
@@ -1079,6 +1083,7 @@ static irqreturn_t mxs_auart_irq_handle(int irq, void *context)
 	struct mxs_auart_port *s = context;
 	u32 mctrl_temp = s->mctrl_prev;
 
+	clk_enable(s->clk);
 	uart_port_lock(&s->port);
 
 	stat = mxs_read(s, REG_STAT);
@@ -1118,6 +1123,7 @@ static irqreturn_t mxs_auart_irq_handle(int irq, void *context)
 	}
 
 	uart_port_unlock(&s->port);
+	clk_disable(s->clk);
 
 	return IRQ_HANDLED;
 }
@@ -1603,10 +1609,6 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	}
 
 	s->port.irq = irq;
-	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
-			       dev_name(&pdev->dev), s);
-	if (ret)
-		goto out_disable_clk;
 
 	platform_set_drvdata(pdev, s);
 
@@ -1627,9 +1629,28 @@ static int mxs_auart_probe(struct platform_device *pdev)
 
 	mxs_auart_reset_deassert(s);
 
+	/* Mask all UART interrupts to prevent spurious IRQs from bootloader */
+	mxs_write(0, s, REG_INTR);
+
 	ret = uart_add_one_port(&auart_driver, &s->port);
-	if (ret)
-		goto out_free_qpio_irq;
+	if (ret) {
+		auart_port[s->port.line] = NULL;
+		goto out_disable_clk;
+	}
+
+	/*
+	 * Request the main IRQ after uart_add_one_port so that
+	 * s->port.state and s->port.lock are initialized before
+	 * the handler can run in response to a bootloader-left
+	 * interrupt.
+	 */
+	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
+			       dev_name(&pdev->dev), s);
+	if (ret) {
+		uart_remove_one_port(&auart_driver, &s->port);
+		auart_port[s->port.line] = NULL;
+		goto out_disable_clk;
+	}
 
 	/* ASM9260 don't have version reg */
 	if (is_asm9260_auart(s)) {
@@ -1641,10 +1662,16 @@ static int mxs_auart_probe(struct platform_device *pdev)
 			 (version >> 16) & 0xff, version & 0xffff);
 	}
 
-	return 0;
+	/*
+	 * Disable clock -- startup will re-enable when the port is opened.
+	 * For the console port the clock must stay prepared so that
+	 * auart_console_write() can safely call clk_enable() from
+	 * atomic context.
+	 */
+	if (!uart_console(&s->port))
+		clk_disable_unprepare(s->clk);
 
-out_free_qpio_irq:
-	auart_port[s->port.line] = NULL;
+	return 0;
 
 out_disable_clk:
 	clk_disable_unprepare(s->clk);
@@ -1657,6 +1684,8 @@ static void mxs_auart_remove(struct platform_device *pdev)
 
 	uart_remove_one_port(&auart_driver, &s->port);
 	auart_port[s->port.line] = NULL;
+	if (uart_console(&s->port))
+		clk_disable_unprepare(s->clk);
 }
 
 static struct platform_driver mxs_auart_driver = {
-- 
2.54.0

