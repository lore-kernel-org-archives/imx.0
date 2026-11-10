Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283243;
	b=jTABc8RqVvJad+pulVN0/IkvhUgeZW5vBQ8Rex+IqToCpNYCA/NezYJNHidDUC4Ec4PE
	 R6C0cAEpmXKca+aLw9MzBoieKIfoplwc5+9sAnfdWP+refYHJv7ybsgGIMhmDApnCub9G
	 duTfCY6rEUVToDQClAhw2YZrNyY0GE7aip72vIjQF2kuySJjG1f8MieKRNTPGUNQq7asc
	 RWoaFfqokJCrVTS6m/k0z6k5K+5XRBT8t40Xc1hum3yVtKjUlO9kK1moKJsQa97iKkpUG
	 X7WvVRkZXIJiRVa6MfydrBqCzwIi+SzVVhDbFNnVRfkq0xdnoSBFjwBTF3pEwFwO3Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YSVfOAqKK5p0/YvZ0th8a3OGvq1YnMSWrvyh5PsiYGg=;
	b=S9oNdHYzcxPSrTfWx7VnKAm1zhi/HMk5Ia3S6nxRPy9Y2s5FFiBmJ7pjShv4S2R9/2fb
	 CGumH6ntxsOw4QKeSdmIrGgxVhjpe+HY8G+8+oUMQ6OYO4qcGXwIIuUeyFeail/BOAiUf
	 sHNZYphYRLjYj6+SJhsbds2ppxQw9yge+mj04HU/oYLf8GoL3QyZRCF9Wb4fbxUPYjgcf
	 We8U8D+UvoR8Jt5vWAbJE6tGmtraHtt3wD3p2Ig7tg25IUQf8wEIMVwyaXjZMlvQQWKNz
	 YMi3bqGiLHYIKXQGM06Z2nwVp9atYjxOVo6E27PN3s4xj8zUcmpeXxQDnf3gPBnCLOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uLZLLd+8;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED03460A380B
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 04:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED03460A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uLZLLd+8
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-85d363fb73cso872053a34.1
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 20:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794283242; x=1794888042; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSVfOAqKK5p0/YvZ0th8a3OGvq1YnMSWrvyh5PsiYGg=;
        b=uLZLLd+8hXDEg8KdD7dOWFswgdZ6QrQ7lkFovQJyCfUE37nJoYUSYgvByUEOFDskTO
         2cIOEJyC4zMWib+ZHXJ8b80Dh+F/LP2XIoN2s6qYGGakS+iEhb2ZlzDXBFxTFMce22CX
         0Z/ofmbPpOOBEIrF0FS56V81eRewiRoSG61eaIsKr/FWRq3qunq67d3ZjI5v25J/X16b
         2MPqCNdnobF+2MKuq/TDMBJ0ZPjhgjlBIqLfxm0vrVc3L9lpu3RmL8LTVryjE47pPyv+
         4ijjpou7fDyaK/fBk9MpKpUVGXRUBofpsxAlIrynYShu0/XW/JAmKOLepCC8LmQRxl8L
         BR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283242; x=1794888042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YSVfOAqKK5p0/YvZ0th8a3OGvq1YnMSWrvyh5PsiYGg=;
        b=ZdZZuxBETV9ZL1bhM+cwrEL5HxRBVT3yg2Tl2tVEViLEoDQzBQb3mDesKWvoZOiCff
         RDcm4q4rf/i5uMR5WpGvYxgg3KXNgw3CEqEfVv3bVDlM1T7e/udy9HtVrr0UmAti3Y9K
         yATr6eHD9XIg/0vCwEVKKxu+/24EdbANYJscBm/VD7hyZk5Fp3oJUQ20I3ehA6wecdCg
         /Aed6QVXxli24kVVFdAFqoC6cpCLJU+kYTKmSTWOBE26JWUWlTD8vB9cLHTRIHkNwuC6
         lF0EfZAPuXfib590UuutZy+9GQDjbVp6VQotsbSlGANo7//VD9ttDigasn/zGfTyBWAa
         JEMg==
X-Forwarded-Encrypted: i=1; AL+hErG+UqOqFkncm/rkE3QK+HaJQ2nqSEUw5p+LwMtTGsSRToPiFdRvfm7JaMiqkraEMtVbvB8=@lists.linux.dev
X-Gm-Message-State: APuU4Z9lnRjKs1GYqBxofWjqcmBkvZS0lPfilMyBkkJpvZRkR8tmSTo4
	PGhR77hQTlJ06BIsswSGuC71StGLwwR8kD1pBGKqL/J3k5uqgqIVRgMM
X-Gm-Gg: AYBFou1a7noe8XaKTU8Ic5TZBrT/MdGjFUxWFJaD5dxMqlG0nqH168q9se4nQLtO9cp
	C5dboOWCtu4VIWr8LDbDrj5lJtUDI/5K4cej7+82FC3AaGCUJZSXGMiIMHmi7RpD/3IDavqJNmV
	l9HBtwaiBqZ4Kc7mNPR702CxnK3nibHvor4qeLWMBC39n8LP0Xd61KkOwoLxQ8IWAXolhinQEOK
	+WZVwZ2doMoh3KAmimO1Qg42KQihDwp6cC43Z0gEJ28suuD5hIRG8C7wRVxIt1iQP+n0iWFjeTG
	VohfsgHXDxFw0bxtDnMvzGlVpfwfMPfldZwoAlkLa646++cd6brMZefVNcogWmW29OONfIyweFc
	ygyXSTIhcqJVaaJYXMeqw5UbKQhU92z+ozMjrFR/HLUv6aUGJqqA0A5QMlLdOFQouO8jdXu2m3J
	6HHfGF4B2s7wuiRBmvgtqg/TF+9Qh3ey15AgooouJBaNrUCEhCow8OGMEok2zCRdJYvqh7JA17L
	DIro1nfmNwKbHr2CpkWI8TrfrnYFnbNfdBgFzAqBUQcoZiKCPb1uRJ0ZyFidcj0pO0LIKRPH2MY
	r+GwsTn42xZwGnktimioGkRMlyhr+CQ/XV9ZPpe03UMCPbZVhPRgkjm7RiQEFe3Eu2N2tL8l1Y7
	vjL9O401/dpcTZH7SXhmusDtottrxfK6jMokw2rvVsR/6jC7DDgK2IhSHBZaiQSUXWEvGROGoub
	McBrtm/VbMTUqO1SFzaKLCGEsARJHjWzuTm9Qyl3n0ilyqqNV0XpHWR2pclOAW6dKQ3KiE8bA3
X-Received: by 2002:a05:6830:915:b0:7fa:ac4f:79a with SMTP id 46e09a7af769-860dc82c5ebmr1408302a34.22.1794283241759;
        Mon, 09 Nov 2026 20:00:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcc1d759sm1028178a34.23.2026.11.09.20.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:00:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 21:00:20 -0700
Subject: [PATCH v11 5/8] serial: core: allow drivers to reserve flushed
 transmit storage
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
Message-Id: <20261109-submit-serial-8250-dma-cancel-v1-v11-5-6364edca63d6@gmail.com>
References: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com>
In-Reply-To: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com>
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

uart_flush_buffer() resets the transmit FIFO before calling the driver's
flush callback. An asynchronous DMA transfer can still access that storage
after the callback returns, while a new write can immediately reuse it.

Add uart_xmit_block() and uart_xmit_unblock() so a driver can reserve the
flushed storage until its transfer and completion callbacks have retired.
Serialize the reservation with FIFO producers using the port lock.

While the storage is reserved, write_room() reports no space and write()
and put_char() accept no data. Defer write-ready notifications until the
reservation is released, preserving one-shot TTY wakeups. Keep the flush's
write-ready notification under the port lock so it cannot race another
reservation.

Wake tty->write_wait after flushing even when writes remain blocked.
tty_wait_until_sent() waits for the logical FIFO to empty, independently
of whether its storage can be reused. Notify these drain waiters without
invoking the line discipline's write_wakeup() callback, so a reservation
does not prevent a completed logical flush from waking a drain waiter or
consume a one-shot write-ready notification prematurely.

Suppress ordinary TX starts while the FIFO storage is blocked. Preserve
high-priority flow-control characters, which use separate storage.
Releasing the reservation wakes writers through the existing TTY wakeup
path. This preserves immediate logical flushing while applying write
backpressure until the storage is reusable.

Track port readiness separately from DMA ownership. Retirement releases the
reservation even during startup or shutdown, while writes and wakeups stay
gated until successful startup or resume. Reopening or restarting a port
wakes deferred writers with either a new or retained FIFO. Restart queued
output when reusing a FIFO after suspension. Keep its write-ready
notification pending until the retained output drains below the normal
wakeup threshold. Share that threshold check with generic 8250 and OMAP
TX DMA completion through uart_write_wakeup_if_needed().

Publish resume readiness under the same port lock as the TX restart,
without clearing any reservation. A concurrent flush can then reserve a
new transfer without resume releasing its storage prematurely.

Assert the port-lock requirement at uart_write_wakeup(), alongside the
reservation helpers, so callers cannot inspect readiness or release a
one-shot notification concurrently with a reservation change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
---
 drivers/tty/serial/8250/8250_dma.c  |   4 +-
 drivers/tty/serial/8250/8250_omap.c |   3 +-
 drivers/tty/serial/serial_core.c    | 104 ++++++++++++++++++++++++++++++++----
 include/linux/serial_core.h         |  34 +++++++++++-
 4 files changed, 129 insertions(+), 16 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 57fc7915adac..43c55cb991a5 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -15,7 +15,6 @@ static void __dma_tx_complete(void *param)
 {
 	struct uart_8250_port	*p = param;
 	struct uart_8250_dma	*dma = p->dma;
-	struct tty_port		*tport = &p->port.state->port;
 	unsigned long	flags;
 	int		ret;
 
@@ -30,8 +29,7 @@ static void __dma_tx_complete(void *param)
 
 	uart_xmit_advance(&p->port, dma->tx_size);
 
-	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
-		uart_write_wakeup(&p->port);
+	uart_write_wakeup_if_needed(&p->port);
 
 	ret = serial8250_tx_dma(p);
 	if (ret || !dma->tx_running)
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 51013dd2d851..477d645be9b0 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1106,8 +1106,7 @@ static void omap_8250_tx_dma_complete(struct uart_8250_port *p)
 		omap8250_restore_regs(p);
 	}
 
-	if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
-		uart_write_wakeup(&p->port);
+	uart_write_wakeup_if_needed(&p->port);
 
 	if (!kfifo_is_empty(&tport->xmit_fifo) && !uart_tx_stopped(&p->port)) {
 		int ret;
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index c0deec0e6af4..0f6613814ce3 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -100,6 +100,11 @@ static inline struct uart_port *uart_port_check(struct uart_state *state)
 	return state->uart_port;
 }
 
+static bool uart_xmit_writable(const struct uart_state *state)
+{
+	return state->xmit_ready && !state->xmit_blocked;
+}
+
 /**
  * uart_write_wakeup - schedule write processing
  * @port: port to be processed
@@ -114,15 +119,77 @@ static inline struct uart_port *uart_port_check(struct uart_state *state)
 void uart_write_wakeup(struct uart_port *port)
 {
 	struct uart_state *state = port->state;
+
+	lockdep_assert_held_once(&port->lock);
+
 	/*
 	 * This means you called this function _after_ the port was
 	 * closed.  No cookie for you.
 	 */
 	BUG_ON(!state);
+	if (!uart_xmit_writable(state))
+		return;
 	tty_port_tty_wakeup(&state->port);
 }
 EXPORT_SYMBOL(uart_write_wakeup);
 
+/* Publish readiness without releasing any transfer's storage reservation. */
+static void uart_xmit_enable(struct uart_port *port)
+{
+	struct uart_state *state = port->state;
+
+	lockdep_assert_held_once(&port->lock);
+	if (state->xmit_ready)
+		return;
+	state->xmit_ready = true;
+	uart_write_wakeup_if_needed(port);
+}
+
+/**
+ * uart_xmit_block - reserve flushed transmit storage
+ * @port: port whose transmit storage is still in use
+ *
+ * A driver may call this from ->flush_buffer() if DMA still owns the old
+ * transmit data. The logical FIFO has already been emptied, but writers
+ * must not overwrite its storage until uart_xmit_unblock() is called.
+ * write_room() reports zero and write()/put_char() accept no data meanwhile.
+ * Line-discipline write wakeups are deferred until the reservation is released.
+ *
+ * The driver must unblock after retiring the transfer, including on shutdown.
+ * Serial core separately gates writes and wakeups until startup or resume
+ * has made the port ready.
+ * Repeated calls are idempotent, not nested reservations.
+ *
+ * Context: @port->lock held.
+ */
+void uart_xmit_block(struct uart_port *port)
+{
+	lockdep_assert_held_once(&port->lock);
+	port->state->xmit_blocked = true;
+}
+EXPORT_SYMBOL_GPL(uart_xmit_block);
+
+/**
+ * uart_xmit_unblock - release reserved transmit storage and wake writers
+ * @port: port whose storage is available again
+ *
+ * The old transfer must no longer access the FIFO storage, and any required
+ * DMA synchronization must have completed before this call.
+ * Retirement is recorded even while the port is inactive. Writes and wakeups
+ * remain deferred until startup or resume has made the port ready.
+ *
+ * Context: @port->lock held.
+ */
+void uart_xmit_unblock(struct uart_port *port)
+{
+	lockdep_assert_held_once(&port->lock);
+	if (!port->state->xmit_blocked)
+		return;
+	port->state->xmit_blocked = false;
+	uart_write_wakeup(port);
+}
+EXPORT_SYMBOL_GPL(uart_xmit_unblock);
+
 static void uart_stop(struct tty_struct *tty)
 {
 	struct uart_state *state = tty->driver_data;
@@ -141,7 +208,10 @@ static void __uart_start(struct uart_state *state)
 	struct serial_port_device *port_dev;
 	int err;
 
-	if (!port || port->flags & UPF_DEAD || uart_tx_stopped(port))
+	if (!port || port->flags & UPF_DEAD || uart_tx_stopped(port) || !state->xmit_ready)
+		return;
+	/* High-priority flow-control characters have their own storage. */
+	if (state->xmit_blocked && !port->x_char)
 		return;
 
 	port_dev = port->port_dev;
@@ -375,6 +445,11 @@ static int uart_startup(struct tty_struct *tty, struct uart_state *state,
 		return -EIO;
 
 	serial_base_port_startup(uport);
+	scoped_guard(uart_port_lock_irq, uport) {
+		uart_xmit_enable(uport);
+		if (!kfifo_is_empty(&port->xmit_fifo) || uport->x_char)
+			__uart_start(state);
+	}
 
 	return 0;
 }
@@ -397,8 +472,11 @@ static void uart_shutdown(struct tty_struct *tty, struct uart_state *state)
 	if (tty)
 		set_bit(TTY_IO_ERROR, &tty->flags);
 
-	if (uport)
+	if (uport) {
+		scoped_guard(uart_port_lock_irq, uport)
+			state->xmit_ready = false;
 		serial_base_port_shutdown(uport);
+	}
 
 	if (tty_port_initialized(port)) {
 		tty_port_set_initialized(port, false);
@@ -593,7 +671,7 @@ static int uart_put_char(struct tty_struct *tty, u8 c)
 		return 0;
 	}
 
-	if (port)
+	if (port && uart_xmit_writable(state))
 		ret = kfifo_put(&state->port.xmit_fifo, c);
 	uart_port_unlock_deref(port, flags);
 	return ret;
@@ -624,7 +702,7 @@ static ssize_t uart_write(struct tty_struct *tty, const u8 *buf, size_t count)
 		return 0;
 	}
 
-	if (port)
+	if (port && uart_xmit_writable(state))
 		ret = kfifo_in(&state->port.xmit_fifo, buf, count);
 
 	__uart_start(state);
@@ -640,7 +718,7 @@ static unsigned int uart_write_room(struct tty_struct *tty)
 	unsigned int ret;
 
 	port = uart_port_ref_lock(state, &flags);
-	if (!state->port.xmit_buf)
+	if (!state->port.xmit_buf || !uart_xmit_writable(state))
 		ret = 0;
 	else
 		ret = kfifo_avail(&state->port.xmit_fifo);
@@ -682,8 +760,12 @@ static void uart_flush_buffer(struct tty_struct *tty)
 	kfifo_reset(&state->port.xmit_fifo);
 	if (port->ops->flush_buffer)
 		port->ops->flush_buffer(port);
+	/* Serialize the wakeup with reservation changes, including another flush. */
+	uart_write_wakeup(port);
 	uart_port_unlock_deref(port, flags);
-	tty_port_tty_wakeup(&state->port);
+
+	/* Drain waiters observe FIFO emptiness, not write readiness. */
+	wake_up_interruptible(&tty->write_wait);
 }
 
 /*
@@ -1748,8 +1830,10 @@ static void uart_tty_port_shutdown(struct tty_port *port)
 	if (WARN(!uport, "detached port still initialized!\n"))
 		return;
 
-	scoped_guard(uart_port_lock_irq, uport)
+	scoped_guard(uart_port_lock_irq, uport) {
+		state->xmit_ready = false;
 		uport->ops->stop_rx(uport);
+	}
 
 	serial_base_port_shutdown(uport);
 	uart_port_shutdown(port);
@@ -2391,9 +2475,10 @@ int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
 		unsigned int mctrl;
 
 		tty_port_set_suspended(port, true);
-		tty_port_set_initialized(port, false);
 
 		scoped_guard(uart_port_lock_irq, uport) {
+			state->xmit_ready = false;
+			tty_port_set_initialized(port, false);
 			ops->stop_tx(uport);
 			if (!(uport->rs485.flags & SER_RS485_ENABLED))
 				ops->set_mctrl(uport, 0);
@@ -2498,8 +2583,9 @@ int uart_resume_port(struct uart_driver *drv, struct uart_port *uport)
 					if (!(uport->rs485.flags & SER_RS485_ENABLED))
 						ops->set_mctrl(uport, uport->mctrl);
 					ops->start_tx(uport);
+					tty_port_set_initialized(port, true);
+					uart_xmit_enable(uport);
 				}
-				tty_port_set_initialized(port, true);
 			} else {
 				/*
 				 * Failed to resume - maybe hardware went away?
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 4eeb8253752a..2297b870cb86 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -208,8 +208,17 @@ struct gpio_desc;
  *	Flush any write buffers, reset any DMA state and stop any ongoing DMA
  *	transfers.
  *
- *	This will be called whenever the @port->state->xmit circular buffer is
- *	cleared.
+ *	This is called after the transmit FIFO has been cleared, with @port->lock
+ *	still held. A driver whose asynchronous transfer can still access the
+ *	flushed storage must call uart_xmit_block() before returning. This keeps
+ *	write_room() at zero and prevents write() and put_char() from reusing the
+ *	storage until the driver calls uart_xmit_unblock().
+ *
+ *	Release the reservation only after the transfer and its callbacks have
+ *	retired and any required DMA synchronization has completed. Shutdown must
+ *	also retire the transfer and release the reservation before returning,
+ *	since serial core then frees the transmit buffer. Serial core separately
+ *	gates writes and wakeups until startup or resume has made the port ready.
  *
  *	Locking: @port->lock taken.
  *	Interrupts: locally disabled.
@@ -834,6 +843,9 @@ enum uart_pm_state {
  */
 struct uart_state {
 	struct tty_port		port;
+	/* TX readiness and storage ownership; protected by the UART port lock. */
+	bool			xmit_ready;
+	bool			xmit_blocked;
 
 	enum uart_pm_state	pm_state;
 
@@ -909,6 +921,24 @@ struct uart_driver {
 };
 
 void uart_write_wakeup(struct uart_port *port);
+void uart_xmit_block(struct uart_port *port);
+void uart_xmit_unblock(struct uart_port *port);
+
+/**
+ * uart_write_wakeup_if_needed - notify writers when queued output is low
+ * @port: port to be processed
+ *
+ * Keep one-shot write-wakeup notifications pending until fewer than
+ * %WAKEUP_CHARS remain in the transmit FIFO. This also applies to output
+ * retained across suspend and resume.
+ *
+ * Context: @port->lock held.
+ */
+static inline void uart_write_wakeup_if_needed(struct uart_port *port)
+{
+	if (kfifo_len(&port->state->port.xmit_fifo) < WAKEUP_CHARS)
+		uart_write_wakeup(port);
+}
 
 /**
  * enum UART_TX_FLAGS -- flags for uart_port_tx_flags()

-- 
2.53.0

