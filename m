Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563611;
	b=cUKeT1jzgsqr0tN1LkoznfIV5mqtTqrym9fxUS7eIFsZ0WGj4TzSWShzLOSJ5JP0Y1m3
	 dzzQ/M4eq43uvo4wUOx6ToJxfWlJ7ecW46hRqgG9y/kXI4PQo2K45qi+PVxv07cxCLw5y
	 R7QCet86YphTFqv+LAJTYWJ3KUNSX5jEug+JA9qsPyNlVm18KkaZlie9YUdpqshHObZ4+
	 qG1wvSDhiQ6EE3B7ie/hkWazyx2Jt5XPUt91DSyTUQ7QG/+L17M4Tre91S2495izuDcIW
	 1TzzVWfQeFhsez1Zc585dh9ZIGqZgZQryIYyikAmNToYhF7hQzyuCgyNJWVxulRyU9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
	b=4/83VWPFErBFyP8FXi/4g59DN3WDUC1+XKC1fnpZ7qyENrj9FTsuQ4PND2HEtGe8qPS3
	 Qr1txuCYkoifytgJWiSEHLGqeazkWL5+1QOBlVQqC75TARXmJZ9n8RXj26e7Z/Iqy/YhY
	 RjiwuTGFqOnHoWBcYQFqtGLiCOFQmkGHwW886lETfqlcHZwf56AFIuzXyeS0H2C2Tmyyf
	 G8RTQOEOCk0YbawZtbmerVTfFSAI7bN49J52BGb3KP7rkSuxmwElXf93IGoRdmFpgiKl0
	 I/3V1Pu0b3LPZGf/E2ZsbhVLacrH1v+oPilMU8nwQcc35EZestK8OB3vB4Ntf9z52Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGsJZCMm;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A5C606A8AD
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 09:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A5C606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OGsJZCMm
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8470d7d430fso270045a34.3
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 01:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563610; x=1795168410; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
        b=OGsJZCMmaeHcWfapPtwKZe0njtJgdeJLIUnVq4RQLHt31408+076WCvaWOhmZyH+Fh
         TapewdZLJlTGYdZginoctCMvbhbaoTGQUWHTVgC+vn/QD/hvTJ1ZdIxx3CTWwY/z7tuH
         JFii1lVqQR4ttpT5C+89XDchBkGAesoNDFaExpda92bALciJUTtMcPL81URynoc7a+YX
         ORrIczh6QDKyeV6LC/jKo+iU3A9mXJnv4wHXDzsSUxl2utUu/AE+ny4TXgF0mHAa66Kd
         +DVOj7TjdnyILJb2mO41Mg0+Y1l3ixmcnlQhE88qWgIlqx9HbfOeDU+WohhpJFbamwi/
         qlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563610; x=1795168410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
        b=ETK9T+SMVHEErTu1xUQZn5BX4N5JjR0odT718p7nFZyawoXsXjvRWpA05OQIPdf6GX
         ThPTUhuN/DXAMmVcacimW38TB9FU6xvp4f1n1xhXuBvx/FSDTRGywQ9gHcdahLW/OAHL
         Lk5hcRL8uyfem04DmIAQjeevl7sy59/rVLw33+7uDMbsI+QFAx9gpVOFj9VZGIYgdW+E
         WYGvWps3NIoBbFYjZIP3wMrfb7kI0C3HjqINTAwhcb1/uU2ZsM/y5JemMxhuCTSz4bBj
         46dRBfCs5ZKmIK3qPhpjZIzUU9luBKtW/5LG6DvFGc8A34FnNbNWzUta3TkwrxOBN8gf
         HRMw==
X-Forwarded-Encrypted: i=1; AL+hErEa73IdlHCuifW2yIydH/lvr1yFDqFzdZJ/s0XjCJpXI/BkdbXngHL3n14ys+Fn4J/INXI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8n/APj0aa8D6UC+QvXxteSagkO6O6eirzTpWPMcL1JRAOhSa9c
	0JzVYRvhnRbIyyh0fiKgdhZe1mNXS6wDiFS93kHlnm6R8FsxMEu3lMCU
X-Gm-Gg: AYBFou14QgorR11fUpCm+zHa4RdAO34t+Ki9Cy1d1iWXrLfBb16g+y0ihkORtwdbUi+
	TiqLYQja0iGQrBuKk/OjBXojq0rT1QOPbIaWZ2wK6awSQu9SYMGtXty/Z9q8T/zCGsJDq8exTtG
	GivsFTTeF7C7WjfNpkOQEjrT+/OANtq3gOKxeKzxDGfIJRFnqi5KXB4InQWiyudKfsbPqTMCgK2
	aPdS2Kv2l0VCRTF2RubPCJUMQkBwzopz/5p3q1LLn6c8DmQWjLs5iEMbOTGKtSWdiUgmiurlx12
	xT9Cx1txKLIR7FeoMVlvRl+WWcxSnbw3NiFJpPiBn5t7YVQkr/KQGOx6/qtqazc8rhzJWmyxWCs
	RHbWGuxd3P8qcTUXs+Eusk/bt40eEO6kKFJh75AVzZmtS9oyjrcq/7f3dl3sr4B1+IhCNzSvC7K
	sjTWeLToFEKk++d5F2raWOrIDTQSsq9ugypraWsSl/EfpfDc/ffWnGSEDnKI65d3rQ3Fn5AXosX
	QTuQiXrnvAIlRWS5Tessw3QX1ulDa5ZifV+cXLmYlAK3y4vK6/1H172iCZpsAE0czergeHZXNt3
	BxPkykYflf/seRr7Mv4m+1F9gm4p2UAcm7/JzzrHjpxdRZWY9G3zwcJIBbeG9YIFeDjFBVRyXVV
	fW/WXQn+5kLJwYnRrVvCHtUgirC8Z3ikfzLxFExvdFi8GvFMbmt1VCMVJjo/Czi/kLW0taBs/OB
	jf5/ZahhjzWpjQ13TFQJmJwk4RhPL2eQjKVh6wVFh+hOt0XfMhkOAgWWYf30g6LUF9K/1dLMefG
	g==
X-Received: by 2002:a05:6808:2207:b0:568:c71:5338 with SMTP id 5614622812f47-56e63ba982emr1490761b6e.18.1794563609933;
        Fri, 13 Nov 2026 01:53:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7094aafcsm1609523b6e.12.2026.11.13.01.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:53:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:53:17 -0700
Subject: [PATCH v13 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
 shutdown
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
Message-Id: <20261113-submit-serial-8250-dma-cancel-v1-v13-4-b857f2617ece@gmail.com>
References: <20261113-submit-serial-8250-dma-cancel-v1-v13-0-b857f2617ece@gmail.com>
In-Reply-To: <20261113-submit-serial-8250-dma-cancel-v1-v13-0-b857f2617ece@gmail.com>
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

disable_irq_nosync() masks the UART interrupt without waiting for a
running handler. That handler can have observed up->dma and continue
using it while shutdown releases the DMA channels and clears the pointer.
Synchronizing the IRQ later in serial core does not protect those accesses.

Publish the DMA shutdown gate under the port lock before the final RX
flush and interrupt masking. Have DMA IRQ handling check the same gate
under the lock, so a queued interrupt cannot restart receive processing
after the final flush.

Drain the UART IRQ outside the port lock before releasing DMA state.
The lock excludes competing RX processing during the flush, while
disable_irq() also waits for a handler that observed up->dma before
acquiring the lock.

Clear EFR2 after draining the IRQ so an in-flight handler cannot restore
TIMEOUT_BEHAVE after shutdown has cleared it. This also waits for the PIO
timeout workaround, which updates EFR2 outside the port lock.

Fixes: fef4f600319e ("serial: 8250: omap: Fix life cycle issues for interrupt handlers")
Closes: https://lore.kernel.org/r/sashiko-outbox-206203@kernel.org/
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 5e114dd8f9bf..f1980c15f85a 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -771,24 +771,24 @@ static void omap_8250_shutdown(struct uart_port *port)
 	guard(serial8250_rpm)(up);
 
 	flush_work(&priv->qos_work);
-	if (up->dma) {
-		guard(uart_port_lock_irq)(port);
-		omap_8250_rx_dma_flush(up);
-	}
 
 	serial_out(up, UART_OMAP_WER, 0);
-	if (priv->habit & UART_HAS_EFR2)
-		serial_out(up, UART_OMAP_EFR2, 0x0);
 
 	/* Synchronize UART_IER access against the console. */
 	scoped_guard(uart_port_lock_irq, port) {
-		if (up->dma)
+		if (up->dma) {
 			up->dma->shutting_down = true;
+			omap_8250_rx_dma_flush(up);
+		}
 		up->ier = 0;
 		serial_out(up, UART_IER, 0);
 	}
 
-	disable_irq_nosync(port->irq);
+	/* An in-flight handler may still be using up->dma. */
+	disable_irq(port->irq);
+
+	if (priv->habit & UART_HAS_EFR2)
+		serial_out(up, UART_OMAP_EFR2, 0x0);
 
 	serial8250_release_dma(up);
 	up->dma = NULL;
@@ -1330,6 +1330,11 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 
 	uart_port_lock(port);
 
+	if (up->dma->shutting_down) {
+		uart_port_unlock(port);
+		return IRQ_HANDLED;
+	}
+
 	status = serial_port_in(port, UART_LSR);
 
 	if ((iir & 0x3f) != UART_IIR_THRI) {

-- 
2.53.0

