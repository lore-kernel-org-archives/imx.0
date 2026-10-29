Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259470;
	b=WEhEjJ6hkxKLYGev7Zg+BqrClL5VBAh3VwVB9CP18MYek/dLk11QuQut2ymfNHnSuj5h
	 WO1ghXEoP2zoN/dFyIt5Y3Cc6f2TIx5hkM+5zf9eNsWD3E6dOwd3i61v3XAT5eTwutSlI
	 H23GJp9FKxXiAm6pth+AqDwWVeDRoi7C31SLdpn3JDnfUP8WCn0wJjHqXWdU7SF1ToFXc
	 LA343OoXbcB24SnVmW2LUEqm+Xj0rhrXueBVqohTM63MbQIfGQ0Pp5XeQmOvoT5pT+08R
	 KM/oLXyvXnjVEQzi21GsvdRk3vUW7K1k7+owUEj0FJk2vR03ecsXEoMF0cuooWlCa5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tekWrSBddWH/mxS51gI4XCBrQci+CpUsgVszjFogEtc=;
	b=vCbPk9JB7F+25KIiM6t2WFisb6dhoV7uY5dKb/Qv0VgBAYBul4Mv2Ti2xSrdm2Xrszkz
	 E/u5Galho/d7p5QjI1bPmFBjPfXJbmWKwrragv0ejHap63PEQlwlT6xZhEZsTT/xRO6/x
	 2xP13owXAv3UKGojghvYktrwwDTehkLrE3m1M1uLzLALQat8Mj5BcZIjkIjJSr6qBC0yP
	 DaucDO/KE1TZ6RBB7BWNRW9BRGO+k71IrBAF3vLvAHAXNMnrOD0AA5MbNHtLClPCRYRbG
	 kXzT//VGPF94i3V+pClSM9nW7+YDawfvSlMRmEWDnGg7SAeKRZqr7g8vwZl1YELnJyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c9P3owYZ;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506AA60A260B
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 07:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 506AA60A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c9P3owYZ
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-823b938464fso1250597a34.2
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793259469; x=1793864269; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tekWrSBddWH/mxS51gI4XCBrQci+CpUsgVszjFogEtc=;
        b=c9P3owYZpkatI/xbOt7PawwHtb1Y7TsHy0/YpzWahR1vj/CwTIPXf55J9HOcv9GsMy
         DY23eKculWP1axAsdLWa0Gubry2tjFXwQKzwYFnDX7uR1Yq9pCdJo1UFaxifV1GNo7BX
         LJYkmHZq+EEK3IJ+M54hNOEq71eOXqKL2OC315ycZYb7TY0I/Pv8E5MBx99tRiiE/t1D
         etLbwVxhoE7EATCQ3tmqP/VlCj4cN3HGdzliFNRa0csHJ6U6t+1rzr+Ho7tttlSF/kH4
         lRRZHHCKSHNzIDwwn+sD/bU8hE1ZA6+bN3rJbuHO91eEYpcIh4fJdswujXeoinAfeHLX
         M+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259469; x=1793864269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tekWrSBddWH/mxS51gI4XCBrQci+CpUsgVszjFogEtc=;
        b=h2Wi/Z6fc68jrZVD3OS9RuUq3rOem1glKAdekzQI9pcRIBjizT1YLYfAa758kCsf2t
         459v37pJuUlRl9dTgkjDN/LjXgo03ZKMvLsMSklDOdFSdOJEiW7sgfikTJ+430pA+6SN
         cXMwfAneJFAtrRP+T6uV5D/iaxtCSOBLNFgH18xmstP70H+dk29+8c0mNsXF8qJW4FHL
         /JufMWjW61wuJkBGyD7Oj2qNa30/CgY8wg6fK3HDu4Ua7OvkdpfkFQFyrAwFvNpPzC55
         ESOP1QleNnW02ZEVEPGf7k/OKErNnkhIUbTuFv0riKXDiMeBZDXF3v4g4cNZy6fYUofd
         OovQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOwLmybK1odZ6/nswfxMDghFDKwbMjzz5iEdmbI5jRRBMCAeWOoay1DCR+arWl5PyNuKI=@lists.linux.dev
X-Gm-Message-State: AFq9FYILoU4cOweG3OLGdyV4mEt741TS3g0S4v0URukB+BVRJXmDw24y
	BWVA3k1d7c++BiIUZiRYjtvgdmwCeV8JFaW4/OlC475IsYtMXi1VA4p8UH09JOLM
X-Gm-Gg: AYBFou3lVveOwRfWxs/Bkj7EAyqW7OYC+lmOh1VB+OkHLnQ9XOVtp/l+4tfkMs9AQbK
	4VXACJPGgPybswon37nj8Z/60D9CGC4R6vYUsV6KmXv84SrznpMj+1biRR9OhbUq1JuIlI43eKg
	h57ELdV3LhvqXE1ttrCBR4ypUA+1mZ3y2q7lA8xBN5+MTV8uatRt4YIFYhzX0xpBaNnHfIRYd/y
	1c+YeZsxtyJrg/XF+8BGhSIFKGs0BBRGUHs5yMq3uk6tlzJukmeQJ8Pl9Um++dOemFRlTStzOAr
	E5VyA2na6yAhkllDkq2HfQC9Noo9tmf/60dGa0LU0GFiTf8UQYEAsdOkpHHRX+R0q8mvv5u3X+h
	dLG8mDtE/MB24TGM3n2K9Jnz2x/Jp0BPkEcQCOCr8HbApflXqq78WWZwOKiuLNyzwRA8cDcnHyz
	p3I1krhUg+zmRojjNWdajTjc10Gv9n6ro+io65GebkAlTzjtaUpFK9rW19dQJQTyFquh0E77qys
	+oeEShS9U470EsOF592Zp4dV+NSSAd4GzMQcBN3Qn2Rw+UvZi3inC8jTBGq3TtOuRirWXFOggqN
	lFEvhbhBTHcwA09eVAr+HZBPXfKmhZqdd9K1D6juXt2l8xABcGv0bx8pCGgUTmYUCLtVzapPXlt
	ekD7c+TaCtUgmRkUU7xqT596ypiVl4zLqcQuIChRS+xMmQf04H5Qg+Wyrc0kUwqRL+QDYO0QQvR
	T1S3QdiDIMMJtcERKJC8vYV3O7DyJDqfAPknbVztR8VwVT0MZzrYd/
X-Received: by 2002:a05:6808:bc7:b0:55c:859:adc with SMTP id 5614622812f47-5638378ff28mr3065513b6e.55.1793259469207;
        Thu, 29 Oct 2026 00:37:49 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c3638604sm3321976b6e.1.2026.10.29.00.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:37:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 01:36:59 -0600
Subject: [PATCH v8 3/6] serial: core: allow drivers to reserve flushed
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
Message-Id: <20261029-submit-serial-8250-dma-cancel-v1-v8-3-3fd56ba352ed@gmail.com>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
In-Reply-To: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
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

uart_flush_buffer() resets the transmit FIFO before calling the driver's
flush callback. An asynchronous DMA transfer can still access that storage
after the callback returns, while a new write can immediately reuse it.

Add uart_xmit_block() and uart_xmit_unblock() so a driver can reserve the
flushed storage until its transfer and completion callbacks have retired.
Serialize the reservation with FIFO producers using the port lock.

While the storage is reserved, write_room() reports no space and write()
and put_char() accept no data. Defer write-ready notifications until the
reservation is released, preserving one-shot TTY wakeups. Keep the flush
wakeup under the port lock so it cannot race another reservation.

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
wakeup threshold.

Publish resume readiness under the same port lock as the TX restart,
without clearing any reservation. A concurrent flush can then reserve a
new transfer without resume releasing its storage prematurely.

Assert the port-lock requirement at uart_write_wakeup(), alongside the
reservation helpers, so callers cannot inspect readiness or release a
one-shot notification concurrently with a reservation change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/serial_core.c | 103 +++++++++++++++++++++++++++++++++++----
 include/linux/serial_core.h      |  18 ++++++-
 2 files changed, 110 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index c0deec0e6af4..11bd1260cdc6 100644
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
@@ -114,15 +119,79 @@ static inline struct uart_port *uart_port_check(struct uart_state *state)
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
+	/* Retained output must drain before consuming a write-ready notification. */
+	if (kfifo_len(&state->port.xmit_fifo) < WAKEUP_CHARS)
+		uart_write_wakeup(port);
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
+ * Write wakeups are deferred until the reservation is released.
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
@@ -141,7 +210,10 @@ static void __uart_start(struct uart_state *state)
 	struct serial_port_device *port_dev;
 	int err;
 
-	if (!port || port->flags & UPF_DEAD || uart_tx_stopped(port))
+	if (!port || port->flags & UPF_DEAD || uart_tx_stopped(port) || !state->xmit_ready)
+		return;
+	/* High-priority flow-control characters have their own storage. */
+	if (state->xmit_blocked && !port->x_char)
 		return;
 
 	port_dev = port->port_dev;
@@ -375,6 +447,11 @@ static int uart_startup(struct tty_struct *tty, struct uart_state *state,
 		return -EIO;
 
 	serial_base_port_startup(uport);
+	scoped_guard(uart_port_lock_irq, uport) {
+		uart_xmit_enable(uport);
+		if (!kfifo_is_empty(&port->xmit_fifo) || uport->x_char)
+			__uart_start(state);
+	}
 
 	return 0;
 }
@@ -397,8 +474,11 @@ static void uart_shutdown(struct tty_struct *tty, struct uart_state *state)
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
@@ -593,7 +673,7 @@ static int uart_put_char(struct tty_struct *tty, u8 c)
 		return 0;
 	}
 
-	if (port)
+	if (port && uart_xmit_writable(state))
 		ret = kfifo_put(&state->port.xmit_fifo, c);
 	uart_port_unlock_deref(port, flags);
 	return ret;
@@ -624,7 +704,7 @@ static ssize_t uart_write(struct tty_struct *tty, const u8 *buf, size_t count)
 		return 0;
 	}
 
-	if (port)
+	if (port && uart_xmit_writable(state))
 		ret = kfifo_in(&state->port.xmit_fifo, buf, count);
 
 	__uart_start(state);
@@ -640,7 +720,7 @@ static unsigned int uart_write_room(struct tty_struct *tty)
 	unsigned int ret;
 
 	port = uart_port_ref_lock(state, &flags);
-	if (!state->port.xmit_buf)
+	if (!state->port.xmit_buf || !uart_xmit_writable(state))
 		ret = 0;
 	else
 		ret = kfifo_avail(&state->port.xmit_fifo);
@@ -682,8 +762,9 @@ static void uart_flush_buffer(struct tty_struct *tty)
 	kfifo_reset(&state->port.xmit_fifo);
 	if (port->ops->flush_buffer)
 		port->ops->flush_buffer(port);
+	/* Serialize the wakeup with reservation changes, including another flush. */
+	uart_write_wakeup(port);
 	uart_port_unlock_deref(port, flags);
-	tty_port_tty_wakeup(&state->port);
 }
 
 /*
@@ -1748,8 +1829,10 @@ static void uart_tty_port_shutdown(struct tty_port *port)
 	if (WARN(!uport, "detached port still initialized!\n"))
 		return;
 
-	scoped_guard(uart_port_lock_irq, uport)
+	scoped_guard(uart_port_lock_irq, uport) {
+		state->xmit_ready = false;
 		uport->ops->stop_rx(uport);
+	}
 
 	serial_base_port_shutdown(uport);
 	uart_port_shutdown(port);
@@ -2391,9 +2474,10 @@ int uart_suspend_port(struct uart_driver *drv, struct uart_port *uport)
 		unsigned int mctrl;
 
 		tty_port_set_suspended(port, true);
-		tty_port_set_initialized(port, false);
 
 		scoped_guard(uart_port_lock_irq, uport) {
+			state->xmit_ready = false;
+			tty_port_set_initialized(port, false);
 			ops->stop_tx(uport);
 			if (!(uport->rs485.flags & SER_RS485_ENABLED))
 				ops->set_mctrl(uport, 0);
@@ -2498,8 +2582,9 @@ int uart_resume_port(struct uart_driver *drv, struct uart_port *uport)
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
index 4eeb8253752a..41598a38a408 100644
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
 
@@ -909,6 +921,8 @@ struct uart_driver {
 };
 
 void uart_write_wakeup(struct uart_port *port);
+void uart_xmit_block(struct uart_port *port);
+void uart_xmit_unblock(struct uart_port *port);
 
 /**
  * enum UART_TX_FLAGS -- flags for uart_port_tx_flags()

-- 
2.53.0

