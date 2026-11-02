Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661291;
	b=l9MfWihkjttAndNHOVjVgKkkuGMsUj2YWFoxOpuluhvLEd493JrZ4StF/x1wzyHIL+u5
	 Mk7TnCj5LirnrYD/WpjvR4GitOAo/dNMaI75u+/EHyzB/N9zivvPoXWq/mwYuu1B+wZi3
	 NS9PUf3qaVshLQDTaGUQ6qHuDUJKrE8yfrvVRTXuXTuDKY89zzmwZ6B+Q1C0xk6fJTqPo
	 o5ZFbXy/nJKS43DJ4qYEenx8NoLk7GMepX5BUTTJyyfRsnZs2YfTYl6uX+tfFTY0Azuc/
	 1eRFO/r+ek8zxH2xLx8eog953ZanPnPGfKAC6IjooMoOAKMUBJd5X1dRfQp0gvGH0yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+ORORHppGTPyJBRftk3KXjGyfdJJh/FdBHFC+AmjObY=;
	b=dRpn6K4too2D5cX9PkivAvIJcLBqXOqkVKz1owi/rs9vW4XlrjWs4wWojDu21MMWnh3s
	 vWLmwSJ3WtldTPBzF3XGkzyKtiF4z44iuieTUVrexqFHy/OgCa9qa9UFodTbduRbkkok8
	 qTWHaC2jW1XvdfOTfVXu2R1jaK9By9j0M668V4OldNyUIQbqZZVIyixzjuj25Ibhwild0
	 EbosntjfCoS5h4jWIzwJLFpmmW93rfTu6XCa13QaUp6lq7CNCGq4th2QvfTXzELxBDDHX
	 hyuwHcSlkK8nkf8oJPfAMm4Py3LJl3Z06US6gk3bUSkqbLEIwwVoPx+4LXlkJNz5hYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WFOPCyG/";
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031FE6083629
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 23:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 031FE6083629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WFOPCyG/
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6f5a0893610so2976693eaf.1
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 15:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793661290; x=1794266090; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ORORHppGTPyJBRftk3KXjGyfdJJh/FdBHFC+AmjObY=;
        b=WFOPCyG/69gtEl35YmA5EQq/qXA4a9H1eI0iNhj85jFOiYlxr1NrDg1acZsu3cvFGT
         z8meMxopf12Yo7Spq/gLvdOlaDFj7UYAe9DbKMInr/loV9I/tFpSNJ/qWYIseE7ACpmS
         aimx96XsyPFBEonq2W8tlkNIu1NzIUkBHXWzmKXmfLaybJL7f9muhkNRsD2LAKqAkztY
         axskER4jKYhQlSM6/sE3XPAGb7tNnnX1MD2xUpqszKk9RvzSQSdt4tEBCCo/3PW5/aSK
         v2fJokiZSEXkXlilKhkrerIMj0ZHXi7zeQUIltIA6wrAv7K2erpg3+QQoYecQO/F6R/k
         czDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661290; x=1794266090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ORORHppGTPyJBRftk3KXjGyfdJJh/FdBHFC+AmjObY=;
        b=ekYQbQ/3AME71dM2wGaWwFqzk4LkQzDze/lGmID1MQfm0aItGwtEwFJP4bRY+ihgEn
         ++u1p9utPhjPNqELU99vnJBs/L11J6+vEfuoQQ1u96O2A9azG3HKfLohPKTN4B4q4aj8
         SZmVMfPhq+maRx9MyGQYMhYP4t4msH/eQzuSiWU9a8fZg2fxjjYfDQ06hgg87zCuZWRt
         3tLaAJ9hhaoeE4XXmhpc2pbc2olo7SIAyhXTPz6dvKINfW3j7ukerPMqG1clvUWYAmoj
         RDNQmBuhwUxxaHo8MyvP2DCB43/VTPtZIXJD5wYwXF2hxndR/4pxWM/BYvP1G7J/2xnA
         ZxUA==
X-Forwarded-Encrypted: i=1; AKwUvBwjTefeEw2LAZ+VDYWakJPsjRLRdH4Srx1Z7Rv1+O0vYBb5wRsrcaK2o6ig8etumAmjc4g=@lists.linux.dev
X-Gm-Message-State: AFq9FYLjl1qZmUI6TXZT1OQF8CO9kxJOAbOQsZOAQrf+z1UCl/6qLk7n
	I0cdYLmwHOFvjbLPniCzZsLvGJo+BOj3hnihjWNrbX6FhVlRihA/+FoB
X-Gm-Gg: AYBFou1Vhm4r3h8bPgD2CvBOrCIDDmMSNSf9HtIRfM3h+IWjjZxK0iRV/uXGp35622e
	K8VoWvP6qq5Z3E/4CeyQI/K6NsiewxWPCNL329PgFDAB6jVgGy2/MuzE1akERtBkVIY+ql5E5EZ
	ASA9U+bIxdQqtMClTYfKzw7jx930+cXH/qirCJca6T9dqL8D3+PoBAW68Ud2TuR1xKQlcjOEgmQ
	cy4ATfnYP+XgSjIdtO66eKXYJRULRuvVC2S8QZLLIp+n4qKKcfuuGR6vEe5FLlFaTT+5yW5VJ2W
	4hUfo2/VjqUki7tKEbVpX81zRixAbkZg2kGXsCzzfj+TeWKAUMG4r4q9BojuQwK6IodT9DVW/xp
	TLfsWNWD7cBPKfGoZZUghHZBxnN24p9bf85EesoYyCbUL9Byi+O3oCi7EnhGk1OXNiO+bnX/lG+
	NBLdKn+nL93v5ax8VMqwJPOJox0MB9pO4si4jDwGmJvEU/bsf+Ymt3uL9WM/muQchCuR2KgK8pi
	ccj94w/ICr9khNV8gDyEnVxs0N22ILIcptUE4d2jSHQNMQPWxdJY9S2v701yBb8UIDLOwW/dt2z
	HyuChlY31/Dns9bVxecbt9pLASIqpeS0A+YlN4mlmuQf5KoPvgkcB1V+Qkt25AvIEBOyRttlWZr
	/MoXaky7K8+TCcGcrbRs9mkTmixeTLoK7bsaHOryyW5aoY76y0pfRUdOuatrfSYNmpajON681+5
	6CqBHd9y5DGizooKmbnSN11BpKO1LSIu94/VBNmYKQVtJRZ0JiLAcc
X-Received: by 2002:a05:6820:a508:20b0:6cd:3fec:de76 with SMTP id 006d021491bc7-714f2ab9b3bmr4460157eaf.76.1793661289912;
        Mon, 02 Nov 2026 15:14:49 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce869asm10134463eaf.4.2026.11.02.15.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:14:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 16:14:35 -0700
Subject: [PATCH v9 8/8] serial: 8250: retain DMA resources when termination
 fails
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-submit-serial-8250-dma-cancel-v1-v9-8-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Tony Lindgren <tony@atomide.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
 Timur Tabi <timur@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

serial8250_release_dma() ignores the return from dmaengine_terminate_sync()
before freeing the coherent RX buffer, unmapping the TX FIFO and releasing
the channels. If the provider fails to stop a channel, the DMAengine
wrapper returns the error without synchronizing its callbacks. Hardware
or a detached callback can then access the released storage and state.

Checking the error and returning early would not preserve their lifetime:
serial core frees the TX FIFO after the driver's shutdown callback returns,
and port removal can then release the callback context as well.

Require successful synchronous termination of both channels before
releasing any DMA resources. Retry failed channels after a sleep outside
the port lock, leaving channels that have already stopped and drained
alone. Keep the shutdown gate and storage reservation in place throughout
the retries.

Start retries with a 1 ms sleep and double it up to one second. This
makes short-lived failures responsive while bounding sustained retry
activity; neither delay is a hardware timeout. Report the initial failure,
rate-limit ongoing failures with the elapsed time and current RX/TX error
codes, and report recovery once both channels have stopped and drained.

A permanently failed DMA engine blocks close or removal. This deliberately
retains the buffers, mappings, channels and callback context until the
provider can establish that they are no longer in use.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dma.c | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index fd2a0ed21165..6307d0261ceb 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -530,6 +530,46 @@ int serial8250_request_dma(struct uart_8250_port *p)
 }
 EXPORT_SYMBOL_GPL(serial8250_request_dma);
 
+static void serial8250_terminate_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	unsigned int delay_us = USEC_PER_MSEC;
+	ktime_t start;
+	int rx_ret, tx_ret;
+
+	rx_ret = dmaengine_terminate_sync(dma->rxchan);
+	tx_ret = dmaengine_terminate_sync(dma->txchan);
+	if (!rx_ret && !tx_ret)
+		return;
+
+	start = ktime_get();
+	dev_err(p->port.dev,
+		"DMA termination failed: RX %d, TX %d; teardown blocked\n",
+		rx_ret, tx_ret);
+
+	/*
+	 * Shutdown cannot return while DMA owns storage or callback state:
+	 * serial core frees the TX FIFO afterwards, and removal frees the port.
+	 * Retain both channels and retry outside the port lock. A permanently
+	 * failed DMA engine therefore prevents teardown from completing.
+	 */
+	while (rx_ret || tx_ret) {
+		fsleep(delay_us);
+		/* Retry promptly at first, then limit sustained retry activity. */
+		delay_us = min(delay_us * 2, USEC_PER_SEC);
+		if (rx_ret)
+			rx_ret = dmaengine_terminate_sync(dma->rxchan);
+		if (tx_ret)
+			tx_ret = dmaengine_terminate_sync(dma->txchan);
+		if (rx_ret || tx_ret)
+			dev_err_ratelimited(p->port.dev,
+					    "DMA termination still failing after %lld ms: RX %d, TX %d\n",
+					    ktime_ms_delta(ktime_get(), start), rx_ret, tx_ret);
+	}
+	dev_info(p->port.dev, "DMA termination recovered after %lld ms\n",
+		 ktime_ms_delta(ktime_get(), start));
+}
+
 void serial8250_release_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
@@ -539,9 +579,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -553,7 +593,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0

