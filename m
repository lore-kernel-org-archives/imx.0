Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144397;
	b=tSNtWEprlHM1M/BKWWSpRzQFDfg0k3Ngw+O1MzgSsp87AADLXqwAy0vlpkqHYT8IhMxN
	 d0CCl+QD1GzwKqeWgioTBwJJz9DJaqLNjkZdsmI1onYhFI5RVycMCCyMLMEpFEEfKBZWO
	 zlEIwfdhzXeKOS0aW2VemM28L0L5XGzfcZ31UdJXW3ChytV24siexrWp7KX3KWwnkHTQV
	 4lQ3DpJc2uqfSP8TuUi7J635mZdkf0Ugc41xn8CXdlKYKpLYvQ/dU+od3QERsszixng53
	 yPNntTIgO1OSQU+X0I8yBlbPFNO7unzwpy9pkn4b+IHeRsrMglWT6fCzUi1hPxx5VnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7ibGD5J4+YbwFcYYzsPowPew2t845WZbw3qqkRYdTOY=;
	b=sIthuVuGWJCuqRqdfEixdYIGUo5qeC212Yw7Lg2z98Ybidz38nGBtYA5+1ryU4ofV2Yu
	 uBtlFi2CvV6SmW49o63GHpK0yPAy2JXBi2Me1meqSr/5Sz9UVz0UD5bKWUovmissjH3A1
	 BefYnr1OX4kYSnn/19PVJ6lUeLBSopctM1lvvCSbrqLVfmwFhck7JHMnR7wBDgTgaNByq
	 /eFY+UDHUjQQwh1IgaR8jqIhxyMHmk6cHih09jbHPFOhlRJKp8g0mo1UBFUKublIUm0vW
	 vy5pEqakxldUNx1mkT7dYe56JGYharNo7aOZrb4fG7N6BOrQ8tDIr4pg0ctYINILu3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dXwztbX9;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683D2606A326
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 23:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 683D2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dXwztbX9
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b21f71613fso297487b6e.2
        for <imx@lists.linux.dev>; Tue, 27 Oct 2026 16:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144395; x=1793749195; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ibGD5J4+YbwFcYYzsPowPew2t845WZbw3qqkRYdTOY=;
        b=dXwztbX93kqgDo1jZC7bwV7VFFPC7L733TF7fEhnHwXQ7edlxQP35pajq1fCFauwDS
         /E8bV6cScCitP/3lYlyVJZ2S1KTr2PzL5U8aO5Pq6D/uUsvd/i4Y2PU4WoxUfMRg7Pdy
         oodh3wVnWqY3aWacuTVX2t++//zAONpzFIR6c31nUbwZv3AJJPNauIn3QlIMKVaPh8xR
         Jr2j1lL5OK1aYyvjfcSnPa0iqGBpfjA10CGZ6U3acnJhjKIP9reX/++AuCyJeycPafP2
         nqZqe3dMtMgRdvwpjPHSQKO8J98sHNLyxU/99cw/cDz73m5IbuhfWpLtBzOKUZeCYB8V
         VX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144395; x=1793749195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ibGD5J4+YbwFcYYzsPowPew2t845WZbw3qqkRYdTOY=;
        b=UiXWQFkVcHKW661CUDAesbg/0n8PlGPApEXyUnsvy1gN1Y2y/+GdVhVOKcqGiiR960
         BBV1aAlAZi8n37bMRToxd/arfXFy8LL51ymY5l8UMqmaP0HZPO3kfkIeaqHhmrKTNdMH
         pWWaDqRJ0YBx+Mp4UT88vd8YW2xllQUKjuSXjnKzn+Vrzv0oyV20MPHxqWJDyONnH92L
         RgBUByzknSGbRsWXyfmWhyidIpFnjLdUz+CPFkSHlKlk1R6BYJwv+ReFIYWZvc164wpV
         9idN6SBVP9Sm31UBvPdbQFgzJxempFxnb8BN4KB7zqDVbs0dQGVYPme/UMRvnfR7vLmP
         VWlA==
X-Forwarded-Encrypted: i=1; AKwUvBx+ZfcUV7TUpjNw4CpjwwAL8gJcOv2YL9/A7c/2a5hgezW/YLBp77LrQeC7XwMPPsuAqSw=@lists.linux.dev
X-Gm-Message-State: AFq9FYKt6CNh/c2yy8CEegIba1p8jAWeZnSrJguMhTFGplPKmXhw8M/n
	Hb4DdbSbYIbQGb0WsM7Y8Q51sG+XtRZZv6l5/zztaCxQYvlO2WyrIsfh
X-Gm-Gg: AYBFou0OwvjimLU5CAIT3d2HBJsrswKPV+h/u4PYfcURumjWssliP/8Jsp3W35ZHYwc
	Ik8hIi0rBpnv8bdibn50Hn25Ahno9TE5xmWkH5XYbIAhI2MSahJUmbo1dXFbso7kOeYBu1O+wfu
	Ncp/BEIzHMqcl8wIJSzkLsIbD64qn4Yif5ULS5K1Kf1EkeyBzV+saEUaPPokOrjk38tHwcRQYcH
	PjuDt9KYOyuQOwEvpeypUpzu2JOIjxgQsgUEkohzA5gzGSpbBPfFd1ukPW/HKO7gIsymQO/Rjj6
	5RHY4KebZkvSi7j3qcpFlyzt/1ckisoGx5lTwgudlgqT/WS89QB2fXLV6gRlODbwxfvM5vbEH9l
	JVYqS3KfYVglNExXAI23DUt4Y4IlCPQdhiYJ4WycpHjyRf0mUWgWzHKZlMBKUkAIkBPtanCq1Qn
	UQkVWkTcpo9fP7W+h4x0gueg1igDQ++REPYFf4COr6oHMeqlWQLzr1RaOH9iPqOREywhSv6Yh+b
	rOtEgYmjvXlZe6kUh1aiiPib8EosZyjIKlcBepJIVVyBAl8DRqSTIo9uxPyGe37EACaaE4FNdWU
	Lu3Cw2JHY5LaKXCu66hPp6StKEpYZsp0kNXKPH1Hc23VOp8YpYJdmb5+lhTkSPBvhS35lvfZnxD
	w8tvRb3BZGSXsrH3e6hlnplR8Wme+eDNy25hkFxBWJga5mXay3Kxd7aUPJue0yOzGsHLijQG19A
	3ytIW2kkujk5q0U7U4iUUqCPrNZQTl2yFisx40p7va+vTWmcXRAZ7u
X-Received: by 2002:a05:6808:198e:b0:4cb:26a3:a0dc with SMTP id 5614622812f47-563a205fbd5mr268553b6e.20.1793144395270;
        Tue, 27 Oct 2026 16:39:55 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1fd31a6fsm62836a34.18.2026.10.27.16.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:39:54 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:39:47 -0600
Subject: [PATCH v7 2/5] serial: serialize asynchronous write wakeups with
 the port lock
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
Message-Id: <20261027-submit-serial-8250-dma-cancel-v1-v7-2-985a023ba4b4@gmail.com>
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com>
In-Reply-To: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com>
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
 Timur Tabi <timur@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

uart_write_wakeup() expects the UART port lock to be held. Several worker,
DMA completion and interrupt paths call it without that lock, including
indirect calls from uart_handle_cts_change() and the transmit helpers.

Take the port lock around these notifications or their transmit helper.
Keep sleeping SPI and regmap accesses outside the locked region, and keep
the FSL LPUART completion lock held through its wakeup. Acquire the port
lock after releasing private channel locks to preserve the ordering used
by UART callbacks. In the MUX timer, publish available FIFO space under
the port lock and keep the hardware FIFO-drain wait outside it.

Use IRQ-safe locking in the Atmel RX and TX tasklets and SB1250 termios
path, since their interrupt handlers now acquire the same port lock.
Preserve the caller's interrupt state when releasing those locks.

On SB1250, lock modem-state updates after reading and filtering the change
status, and wake modem-status waiters after unlocking. Take the TX lock
inside its service routine so RX-only interrupts need no acquisition.
Keep that lock across x_char handling, FIFO consumption and the decision
to mask TX interrupts: a writer must not enqueue data and enable TX between
the empty-FIFO check and the interrupt-mask write. Each TX invocation sends
at most one character.

Serialize CLPS711x TX servicing and its interrupt-enable state with the
port lock. Disable TX interrupts without waiting in stop_tx(), since a
threaded handler may need that same lock. Have an already queued handler
leave stopped output untouched, and drain it outside the lock during
shutdown before the transmit FIFO can be released.

SCCNXP handles interrupts under a controller lock which its UART callbacks
acquire with the port lock already held. Collect the ports needing wakeups
in an unsigned long bitmap while servicing the controller, then release
that lock before visiting the set bits, taking each port lock and
rechecking the wakeup threshold. Removal drains the IRQ or timer before
unregistering the ports.

This serializes write notifications with port-locked serial-core state
changes, allowing readiness and transmit-storage reservations to gate the
notification without a check-versus-shutdown race.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/21285.c         |  2 ++
 drivers/tty/serial/atmel_serial.c  | 12 +++++-----
 drivers/tty/serial/clps711x.c      | 23 ++++++++++++++-----
 drivers/tty/serial/cpm_uart.c      |  2 ++
 drivers/tty/serial/fsl_lpuart.c    |  2 +-
 drivers/tty/serial/jsm/jsm_cls.c   |  3 ++-
 drivers/tty/serial/jsm/jsm_neo.c   |  9 +++++---
 drivers/tty/serial/lantiq.c        |  3 ++-
 drivers/tty/serial/ma35d1_serial.c |  6 +++--
 drivers/tty/serial/max3100.c       |  6 +++--
 drivers/tty/serial/max310x.c       |  9 +++++---
 drivers/tty/serial/mux.c           | 13 ++++++-----
 drivers/tty/serial/mvebu-uart.c    |  2 ++
 drivers/tty/serial/mxs-auart.c     |  2 ++
 drivers/tty/serial/sb1250-duart.c  | 25 ++++++++++++---------
 drivers/tty/serial/sccnxp.c        | 45 ++++++++++++++++++++++++++++----------
 drivers/tty/serial/ucc_uart.c      |  6 +++--
 17 files changed, 117 insertions(+), 53 deletions(-)

diff --git a/drivers/tty/serial/21285.c b/drivers/tty/serial/21285.c
index 4de0c975ebdc..e4149aea4f66 100644
--- a/drivers/tty/serial/21285.c
+++ b/drivers/tty/serial/21285.c
@@ -157,6 +157,8 @@ static irqreturn_t serial21285_tx_chars(int irq, void *dev_id)
 	struct uart_port *port = dev_id;
 	u8 ch;
 
+	guard(uart_port_lock_irqsave)(port);
+
 	uart_port_tx_limited(port, ch, 256,
 		!(*CSR_UARTFLG & 0x20),
 		*CSR_UARTDR = ch,
diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index c3880259e3bc..0433bc70f279 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -1371,6 +1371,8 @@ atmel_handle_status(struct uart_port *port, unsigned int pending,
 
 		if (status_change & (ATMEL_US_RI | ATMEL_US_DSR
 					| ATMEL_US_DCD | ATMEL_US_CTS)) {
+			guard(uart_port_lock_irqsave)(port);
+
 			/* TODO: All reads to CSR will clear these interrupts! */
 			if (status_change & ATMEL_US_RI)
 				port->icount.rng++;
@@ -1702,10 +1704,9 @@ static void atmel_tasklet_rx_func(struct tasklet_struct *t)
 							  tasklet_rx);
 	struct uart_port *port = &atmel_port->uart;
 
-	/* The interrupt handler does not take the lock */
-	uart_port_lock(port);
+	guard(uart_port_lock_irqsave)(port);
+
 	atmel_port->schedule_rx(port);
-	uart_port_unlock(port);
 }
 
 static void atmel_tasklet_tx_func(struct tasklet_struct *t)
@@ -1714,10 +1715,9 @@ static void atmel_tasklet_tx_func(struct tasklet_struct *t)
 							  tasklet_tx);
 	struct uart_port *port = &atmel_port->uart;
 
-	/* The interrupt handler does not take the lock */
-	uart_port_lock(port);
+	guard(uart_port_lock_irqsave)(port);
+
 	atmel_port->schedule_tx(port);
-	uart_port_unlock(port);
 }
 
 static void atmel_init_property(struct atmel_uart_port *atmel_port,
diff --git a/drivers/tty/serial/clps711x.c b/drivers/tty/serial/clps711x.c
index 83186bf50002..06ed8ba7c9fb 100644
--- a/drivers/tty/serial/clps711x.c
+++ b/drivers/tty/serial/clps711x.c
@@ -73,7 +73,8 @@ static void uart_clps711x_stop_tx(struct uart_port *port)
 	struct clps711x_port *s = dev_get_drvdata(port->dev);
 
 	if (s->tx_enabled) {
-		disable_irq(port->irq);
+		/* The handler also takes the port lock. */
+		disable_irq_nosync(port->irq);
 		s->tx_enabled = 0;
 	}
 }
@@ -146,9 +147,16 @@ static irqreturn_t uart_clps711x_int_tx(int irq, void *dev_id)
 {
 	struct uart_port *port = dev_id;
 	struct clps711x_port *s = dev_get_drvdata(port->dev);
-	struct tty_port *tport = &port->state->port;
+	struct tty_port *tport;
 	unsigned char c;
 
+	guard(uart_port_lock_irqsave)(port);
+
+	if (!s->tx_enabled)
+		return IRQ_HANDLED;
+
+	tport = &port->state->port;
+
 	if (port->x_char) {
 		writew(port->x_char, port->membase + UARTDR_OFFSET);
 		port->icount.tx++;
@@ -157,10 +165,7 @@ static irqreturn_t uart_clps711x_int_tx(int irq, void *dev_id)
 	}
 
 	if (kfifo_is_empty(&tport->xmit_fifo) || uart_tx_stopped(port)) {
-		if (s->tx_enabled) {
-			disable_irq_nosync(port->irq);
-			s->tx_enabled = 0;
-		}
+		uart_clps711x_stop_tx(port);
 		return IRQ_HANDLED;
 	}
 
@@ -245,8 +250,14 @@ static void uart_clps711x_shutdown(struct uart_port *port)
 {
 	struct clps711x_port *s = dev_get_drvdata(port->dev);
 
+	scoped_guard(uart_port_lock_irqsave, port)
+		uart_clps711x_stop_tx(port);
+
 	/* Disable the port */
 	regmap_update_bits(s->syscon, SYSCON_OFFSET, SYSCON_UARTEN, 0);
+
+	/* Drain the non-waiting TX disable before releasing the FIFO. */
+	synchronize_irq(port->irq);
 }
 
 static void uart_clps711x_set_termios(struct uart_port *port,
diff --git a/drivers/tty/serial/cpm_uart.c b/drivers/tty/serial/cpm_uart.c
index 39f54bb7b485..028a01fa02a9 100644
--- a/drivers/tty/serial/cpm_uart.c
+++ b/drivers/tty/serial/cpm_uart.c
@@ -214,6 +214,8 @@ static void cpm_uart_int_tx(struct uart_port *port)
 {
 	pr_debug("CPM uart[%d]:TX INT\n", port->line);
 
+	guard(uart_port_lock_irqsave)(port);
+
 	cpm_uart_tx_pump(port);
 }
 
diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index c8575c965203..cb04571c3d0e 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -540,10 +540,10 @@ static void lpuart_dma_tx_complete(void *arg)
 
 	uart_xmit_advance(&sport->port, sport->dma_tx_bytes);
 	sport->dma_tx_in_progress = false;
-	uart_port_unlock_irqrestore(&sport->port, flags);
 
 	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
 		uart_write_wakeup(&sport->port);
+	uart_port_unlock_irqrestore(&sport->port, flags);
 
 	if (waitqueue_active(&sport->dma_wait)) {
 		wake_up(&sport->dma_wait);
diff --git a/drivers/tty/serial/jsm/jsm_cls.c b/drivers/tty/serial/jsm/jsm_cls.c
index 6e40792f92cf..7720796331c9 100644
--- a/drivers/tty/serial/jsm/jsm_cls.c
+++ b/drivers/tty/serial/jsm/jsm_cls.c
@@ -571,7 +571,8 @@ static inline void cls_parse_isr(struct jsm_board *brd, uint port)
 			spin_lock_irqsave(&ch->ch_lock, flags);
 			ch->ch_flags |= (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
 			spin_unlock_irqrestore(&ch->ch_lock, flags);
-			cls_copy_data_from_queue_to_uart(ch);
+			scoped_guard(uart_port_lock_irqsave, &ch->uart_port)
+				cls_copy_data_from_queue_to_uart(ch);
 		}
 
 		/*
diff --git a/drivers/tty/serial/jsm/jsm_neo.c b/drivers/tty/serial/jsm/jsm_neo.c
index e8e13bf056e2..cbd9af43c68b 100644
--- a/drivers/tty/serial/jsm/jsm_neo.c
+++ b/drivers/tty/serial/jsm/jsm_neo.c
@@ -740,7 +740,8 @@ static void neo_parse_isr(struct jsm_board *brd, u32 port)
 			spin_lock_irqsave(&ch->ch_lock, lock_flags);
 			ch->ch_flags |= (CH_TX_FIFO_EMPTY | CH_TX_FIFO_LWM);
 			spin_unlock_irqrestore(&ch->ch_lock, lock_flags);
-			neo_copy_data_from_queue_to_uart(ch);
+			scoped_guard(uart_port_lock_irqsave, &ch->uart_port)
+				neo_copy_data_from_queue_to_uart(ch);
 		}
 
 		if (isr & UART_17158_IIR_XONXOFF) {
@@ -895,7 +896,8 @@ static inline void neo_parse_lsr(struct jsm_board *brd, u32 port)
 		spin_unlock_irqrestore(&ch->ch_lock, lock_flags);
 
 		/* Transfer data (if any) from Write Queue -> UART. */
-		neo_copy_data_from_queue_to_uart(ch);
+		scoped_guard(uart_port_lock_irqsave, &ch->uart_port)
+			neo_copy_data_from_queue_to_uart(ch);
 	}
 	else if (linestatus & UART_17158_TX_AND_FIFO_CLR) {
 		spin_lock_irqsave(&ch->ch_lock, lock_flags);
@@ -903,7 +905,8 @@ static inline void neo_parse_lsr(struct jsm_board *brd, u32 port)
 		spin_unlock_irqrestore(&ch->ch_lock, lock_flags);
 
 		/* Transfer data (if any) from Write Queue -> UART. */
-		neo_copy_data_from_queue_to_uart(ch);
+		scoped_guard(uart_port_lock_irqsave, &ch->uart_port)
+			neo_copy_data_from_queue_to_uart(ch);
 	}
 }
 
diff --git a/drivers/tty/serial/lantiq.c b/drivers/tty/serial/lantiq.c
index 62cd9e0bb377..0d7e06c7d790 100644
--- a/drivers/tty/serial/lantiq.c
+++ b/drivers/tty/serial/lantiq.c
@@ -239,7 +239,8 @@ lqasc_tx_int(int irq, void *_port)
 	spin_lock_irqsave(&ltq_port->lock, flags);
 	__raw_writel(ASC_IRNCR_TIR, port->membase + LTQ_ASC_IRNCR);
 	spin_unlock_irqrestore(&ltq_port->lock, flags);
-	lqasc_start_tx(port);
+	scoped_guard(uart_port_lock_irqsave, port)
+		lqasc_start_tx(port);
 	return IRQ_HANDLED;
 }
 
diff --git a/drivers/tty/serial/ma35d1_serial.c b/drivers/tty/serial/ma35d1_serial.c
index 3be30fb05513..ac44681bcb73 100644
--- a/drivers/tty/serial/ma35d1_serial.c
+++ b/drivers/tty/serial/ma35d1_serial.c
@@ -295,8 +295,10 @@ static irqreturn_t ma35d1serial_interrupt(int irq, void *dev_id)
 
 	if (isr & (MA35_ISR_RDA_IF | MA35_ISR_RXTO_IF))
 		receive_chars(up);
-	if (isr & MA35_ISR_THRE_INT)
-		transmit_chars(up);
+	if (isr & MA35_ISR_THRE_INT) {
+		scoped_guard(uart_port_lock_irqsave, port)
+			transmit_chars(up);
+	}
 	if (fsr & MA35_FSR_TX_OVER_IF)
 		serial_out(up, MA35_FSR_REG, MA35_FSR_TX_OVER_IF);
 
diff --git a/drivers/tty/serial/max3100.c b/drivers/tty/serial/max3100.c
index f858a6669011..5a8817eb82ad 100644
--- a/drivers/tty/serial/max3100.c
+++ b/drivers/tty/serial/max3100.c
@@ -287,8 +287,10 @@ static void max3100_work(struct work_struct *w)
 			tty_flip_buffer_push(&s->port.state->port);
 			rxchars = 0;
 		}
-		if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
-			uart_write_wakeup(&s->port);
+		scoped_guard(uart_port_lock_irqsave, &s->port) {
+			if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
+				uart_write_wakeup(&s->port);
+		}
 
 	} while (!s->force_end_work &&
 		 !freezing(current) &&
diff --git a/drivers/tty/serial/max310x.c b/drivers/tty/serial/max310x.c
index a0ed70185555..d9ce6ba53c7f 100644
--- a/drivers/tty/serial/max310x.c
+++ b/drivers/tty/serial/max310x.c
@@ -950,8 +950,10 @@ static void max310x_handle_tx(struct uart_port *port)
 		uart_xmit_advance(port, to_send);
 	}
 
-	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
-		uart_write_wakeup(port);
+	scoped_guard(uart_port_lock_irqsave, port) {
+		if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
+			uart_write_wakeup(port);
+	}
 }
 
 /*
@@ -1043,7 +1045,8 @@ static irqreturn_t max310x_port_irq(struct max310x_port *s, int portno)
 
 		if (ists & MAX310X_IRQ_CTS_BIT) {
 			lsr = max310x_port_read(port, MAX310X_LSR_IRQSTS_REG);
-			uart_handle_cts_change(port, lsr & MAX310X_LSR_CTS_BIT);
+			scoped_guard(uart_port_lock_irqsave, port)
+				uart_handle_cts_change(port, lsr & MAX310X_LSR_CTS_BIT);
 		}
 		if (rxlen)
 			max310x_handle_rx(port, rxlen);
diff --git a/drivers/tty/serial/mux.c b/drivers/tty/serial/mux.c
index 3a77a7e5c7bc..8be5b3031749 100644
--- a/drivers/tty/serial/mux.c
+++ b/drivers/tty/serial/mux.c
@@ -189,11 +189,14 @@ static void mux_write(struct uart_port *port)
 {
 	u8 ch;
 
-	uart_port_tx_limited(port, ch,
-		port->fifosize - UART_GET_FIFO_CNT(port),
-		true,
-		UART_PUT_CHAR(port, ch),
-		mux_tx_done(port));
+	scoped_guard(uart_port_lock_irqsave, port) {
+		uart_port_tx_limited(port, ch,
+			port->fifosize - UART_GET_FIFO_CNT(port),
+			true,
+			UART_PUT_CHAR(port, ch),
+			({}));
+	}
+	mux_tx_done(port);
 }
 
 /**
diff --git a/drivers/tty/serial/mvebu-uart.c b/drivers/tty/serial/mvebu-uart.c
index 33ea496c93b2..7bc0d0d3760e 100644
--- a/drivers/tty/serial/mvebu-uart.c
+++ b/drivers/tty/serial/mvebu-uart.c
@@ -334,6 +334,8 @@ static void mvebu_uart_tx_chars(struct uart_port *port, unsigned int status)
 {
 	u8 ch;
 
+	guard(uart_port_lock_irqsave)(port);
+
 	uart_port_tx_limited(port, ch, port->fifosize,
 		!(readl(port->membase + UART_STAT) & STAT_TX_FIFO_FUL),
 		writel(ch, port->membase + UART_TSH(port)),
diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 697318dbb146..6a310309b55d 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -521,6 +521,8 @@ static void dma_tx_callback(void *param)
 
 	dma_unmap_sg(s->dev, &s->tx_sgl, 1, DMA_TO_DEVICE);
 
+	guard(uart_port_lock_irqsave)(&s->port);
+
 	/* clear the bit used to serialize the DMA tx. */
 	clear_bit(MXS_AUART_DMA_TX_SYNC, &s->flags);
 	smp_mb__after_atomic();
diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1250-duart.c
index b4e1b90e5960..ff3019e1631d 100644
--- a/drivers/tty/serial/sb1250-duart.c
+++ b/drivers/tty/serial/sb1250-duart.c
@@ -387,6 +387,9 @@ static void sbd_transmit_chars(struct sbd_port *sport)
 	unsigned int mask;
 	int stop_tx;
 
+	/* Serialize FIFO consumption and interrupt masking with start_tx(). */
+	guard(uart_port_lock_irqsave)(uport);
+
 	/* XON/XOFF chars.  */
 	if (sport->port.x_char) {
 		write_sbdchn(sport, R_DUART_TX_HOLD, sport->port.x_char);
@@ -424,15 +427,19 @@ static void sbd_status_handle(struct sbd_port *sport)
 	delta = read_sbdshr(sport, R_DUART_INCHREG((uport->line) % 2));
 	delta >>= (uport->line) % 2;
 
-	if (delta & (M_DUART_IN_PIN0_VAL << S_DUART_IN_PIN_CHNG))
-		uart_handle_cts_change(uport, !(delta & M_DUART_IN_PIN0_VAL));
+	if (!(delta & ((M_DUART_IN_PIN2_VAL | M_DUART_IN_PIN0_VAL) <<
+		       S_DUART_IN_PIN_CHNG)))
+		return;
 
-	if (delta & (M_DUART_IN_PIN2_VAL << S_DUART_IN_PIN_CHNG))
-		uport->icount.dsr++;
+	scoped_guard(uart_port_lock_irqsave, uport) {
+		if (delta & (M_DUART_IN_PIN0_VAL << S_DUART_IN_PIN_CHNG))
+			uart_handle_cts_change(uport, !(delta & M_DUART_IN_PIN0_VAL));
 
-	if (delta & ((M_DUART_IN_PIN2_VAL | M_DUART_IN_PIN0_VAL) <<
-		     S_DUART_IN_PIN_CHNG))
-		wake_up_interruptible(&uport->state->port.delta_msr_wait);
+		if (delta & (M_DUART_IN_PIN2_VAL << S_DUART_IN_PIN_CHNG))
+			uport->icount.dsr++;
+	}
+
+	wake_up_interruptible(&uport->state->port.delta_msr_wait);
 }
 
 static irqreturn_t sbd_interrupt(int irq, void *dev_id)
@@ -611,7 +618,7 @@ static void sbd_set_termios(struct uart_port *uport, struct ktermios *termios,
 	else
 		aux &= ~M_DUART_CTS_CHNG_ENA;
 
-	uart_port_lock(uport);
+	guard(uart_port_lock_irqsave)(uport);
 
 	if (sport->tx_stopped)
 		command |= M_DUART_TX_DIS;
@@ -632,8 +639,6 @@ static void sbd_set_termios(struct uart_port *uport, struct ktermios *termios,
 	write_sbdchn(sport, R_DUART_AUXCTL_X, aux | oldaux);
 
 	write_sbdchn(sport, R_DUART_CMD, command);
-
-	uart_port_unlock(uport);
 }
 
 
diff --git a/drivers/tty/serial/sccnxp.c b/drivers/tty/serial/sccnxp.c
index cb31e3aceb62..50845e64d633 100644
--- a/drivers/tty/serial/sccnxp.c
+++ b/drivers/tty/serial/sccnxp.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/find.h>
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/console.h>
@@ -435,7 +436,7 @@ static void sccnxp_handle_rx(struct uart_port *port)
 	tty_flip_buffer_push(&port->state->port);
 }
 
-static void sccnxp_handle_tx(struct uart_port *port)
+static bool sccnxp_handle_tx(struct uart_port *port)
 {
 	u8 sr;
 	struct tty_port *tport = &port->state->port;
@@ -445,7 +446,7 @@ static void sccnxp_handle_tx(struct uart_port *port)
 		sccnxp_port_write(port, SCCNXP_THR_REG, port->x_char);
 		port->icount.tx++;
 		port->x_char = 0;
-		return;
+		return false;
 	}
 
 	if (kfifo_is_empty(&tport->xmit_fifo) || uart_tx_stopped(port)) {
@@ -457,7 +458,7 @@ static void sccnxp_handle_tx(struct uart_port *port)
 			if (s->chip->flags & SCCNXP_HAVE_IO)
 				sccnxp_set_bit(port, DIR_OP, 0);
 		}
-		return;
+		return false;
 	}
 
 	while (1) {
@@ -473,13 +474,13 @@ static void sccnxp_handle_tx(struct uart_port *port)
 		sccnxp_port_write(port, SCCNXP_THR_REG, ch);
 	}
 
-	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
-		uart_write_wakeup(port);
+	return kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS;
 }
 
-static void sccnxp_handle_events(struct sccnxp_port *s)
+static unsigned long sccnxp_handle_events(struct sccnxp_port *s)
 {
-	int i;
+	unsigned long wakeup = 0;
+	unsigned int i;
 	u8 isr;
 
 	do {
@@ -491,20 +492,40 @@ static void sccnxp_handle_events(struct sccnxp_port *s)
 		for (i = 0; i < s->uart.nr; i++) {
 			if (s->opened[i] && (isr & ISR_RXRDY(i)))
 				sccnxp_handle_rx(&s->port[i]);
-			if (s->opened[i] && (isr & ISR_TXRDY(i)))
-				sccnxp_handle_tx(&s->port[i]);
+			if (s->opened[i] && (isr & ISR_TXRDY(i)) &&
+			    sccnxp_handle_tx(&s->port[i]))
+				wakeup |= BIT(i);
 		}
 	} while (1);
+
+	return wakeup;
+}
+
+static void sccnxp_write_wakeup(struct sccnxp_port *s, unsigned long wakeup)
+{
+	unsigned int i;
+
+	/* UART callbacks take s->lock with the port lock already held. */
+	for_each_set_bit(i, &wakeup, s->uart.nr) {
+		struct uart_port *port = &s->port[i];
+
+		scoped_guard(uart_port_lock_irqsave, port) {
+			if (kfifo_len(&port->state->port.xmit_fifo) < WAKEUP_CHARS)
+				uart_write_wakeup(port);
+		}
+	}
 }
 
 static void sccnxp_timer(struct timer_list *t)
 {
 	struct sccnxp_port *s = timer_container_of(s, t, timer);
 	unsigned long flags;
+	unsigned long wakeup;
 
 	spin_lock_irqsave(&s->lock, flags);
-	sccnxp_handle_events(s);
+	wakeup = sccnxp_handle_events(s);
 	spin_unlock_irqrestore(&s->lock, flags);
+	sccnxp_write_wakeup(s, wakeup);
 
 	mod_timer(&s->timer, jiffies + usecs_to_jiffies(s->pdata.poll_time_us));
 }
@@ -513,10 +534,12 @@ static irqreturn_t sccnxp_ist(int irq, void *dev_id)
 {
 	struct sccnxp_port *s = (struct sccnxp_port *)dev_id;
 	unsigned long flags;
+	unsigned long wakeup;
 
 	spin_lock_irqsave(&s->lock, flags);
-	sccnxp_handle_events(s);
+	wakeup = sccnxp_handle_events(s);
 	spin_unlock_irqrestore(&s->lock, flags);
+	sccnxp_write_wakeup(s, wakeup);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index 6b7dcbbacd13..60f72c19d67c 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -570,8 +570,10 @@ static irqreturn_t qe_uart_int(int irq, void *data)
 	if (events & UCC_UART_UCCE_RX)
 		qe_uart_int_rx(qe_port);
 
-	if (events & UCC_UART_UCCE_TX)
-		qe_uart_tx_pump(qe_port);
+	if (events & UCC_UART_UCCE_TX) {
+		scoped_guard(uart_port_lock_irqsave, &qe_port->port)
+			qe_uart_tx_pump(qe_port);
+	}
 
 	return events ? IRQ_HANDLED : IRQ_NONE;
 }

-- 
2.53.0

