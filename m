Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435400;
	b=QFMKfEaKLhdYLPe4tV3r9S2DGwEKNUjubr+Qg55E5PE7v3YeT86g+OZv0iazeqWfdBVO
	 k50ZdKIYTBk6PjwU1xJo1Si1zstZHadrKgLBOR4lIs/KLX8B1argPsldon4bMT0FOfYPN
	 L2CElZJlFTso4Hy7zcAWs+D4wDAcRLqDg4d3DaBD9d/Kfyjn201cGPe+sLXiRXDQb4V/d
	 GJLYu6M7RE/Fljbc6Zhiqu8w2tLUcQOD4hEnKJtdQOVe3/Y7o3CaFufp3KwUOumy+mcqC
	 /O0fH6Ei1sjFZvua5KYjQnmTrduavBh2Iv56VD5I3u9PTfQk+p6HXukJx1EBk4s6aaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
	b=iUVC4E8NjcI5RGw/xlKwMq4QhbXXRz4F4FujYoy2ixQkjCvUmc/fmzziZGD4zRKUvXWf
	 8sNDMHyuTlO66JDJwLFj3DPy20C67CBrxUl0zh4FQHUREuJqyVlTvzuBvWqjHUN6Ymj+g
	 9jswm2P00vUIfug3AVzMdLn3+/Nq0CEDJv1q/n5mOLOl4ws9j33gcW0APL37Nzr3wOdFV
	 NXAa+yzI7Zsw/kJhlP3hzlF2rn01bZmfcSCEQ5D9KqgG8lbZjBXjvL0MZxKwo0hPbj3V6
	 toxwdOVeGkwTr6dq61uhykLlVWKwK9VYqJWuWfu/ZhnJOqBvdPagdeJgXO1InTMr/1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cgzTL1cn;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1AA606A8A8
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 22:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B1AA606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cgzTL1cn
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4f699fe49b3so2407756b6e.3
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 14:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435399; x=1795040199; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
        b=cgzTL1cnREToyhCWelaH0bkIKaez/E3DHXPgkROwePNmwZQJVGSkBVp6QWOgIGVXLD
         7BZC2qPC8IxNCpxT+lvOD0crkACqcLPIdkRR5hJtQdLrwXlTAieoFrbsYbJ4S493L4K6
         OFaVQUg1qTcA+SoI/HMaJgOD+nDjyfVSuLLKhgOby6QQ6E+WO1SGU3dV/maw/RvYhYMq
         YzjR9Cb5s8ibBc+tnNew9DzBG5HxvRS32LsVJVhxk4rhcvU/FAcXG75WQCLFjFdHS5SK
         Vf5kzoqjGSun/uleb+X2f3c0kqdozMZmeRVD9/NiutgWDqsxSbYVYV391lu4pHSR3HMM
         VjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435399; x=1795040199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=snI99jPMkmuHdc8mcM4R4e7s0XOn07YSlMRthm825Sw=;
        b=hYz0j9qdLk/rQ7lDICkXES0tclARcNTeahsll1ylPP0LEtLwE9lLbrfN3DOC34UDvd
         V4k4BHQUjPQh96qw2+lLVQDM4GXGk3a0bsXMpmeCpMAJ9gHBHp6UfWBsHKENaWyWRYrv
         4TJyVcBkgt/WesLklPAF9rJfYrGAwFfsl99Ta38QWlP/jVTgu7Vw8TcrDnqcWXtw7l03
         6CY6piMVpCbJN/uNt79BZUEnZgFS3cSWyn1a5VVGnYblUralbs5kUZ1+3DaFx30iU8kI
         lIumkoXWOyeYC/DKxHGFM/UzNZYXaZluTv0cVfsDAkwqQQX9upCYQnxVezIu3zjSU/Ra
         86sg==
X-Forwarded-Encrypted: i=1; AL+hErFBFE5R9xm/L413QeVdCcisu+7Z3pC4RFsxLp0WLfv5dCKZSeDYmWyAR77Zz9Xvy37NBGs=@lists.linux.dev
X-Gm-Message-State: APuU4Z/LDy+6fdGqSzJenJSKCSxuABoAhcq79xDFWFMm2HpMp/F7Be6R
	MdZC/4KmpZtxnnRCcemEczhNB1sUYXB8u2PMWCEq4dgFIHeR0VF7S4nY
X-Gm-Gg: AYBFou0kbR6iIhEApAuZF4vkgI4fnshp8NP8E9ckIBUsYc41mSsAv3TrqGUE2B5T1+j
	Lld36ADX50ZsvCb7MXd/k3MltzMXoBGbL1/Xq8jRrJMEHo41Uix0x2JNPosRg/q36dK5rLtwEub
	UmUXPw9V8mg9LXDkBQK0tL/uTDlqBKY2P7SVa3r3ec/QEIMYiDPl0YLf5jw9i/6k4nhTAq/2A8l
	b2yPXfhjBPn8kbNMKT80k3UQi6HNOYvth6RqGsUoGnCKIzEpcYagQ7stuvutehL7x8Pn9EXrpos
	bz32cWal/U58qPmAD9Y7UYxm8mkEA+n4hFQp5r7bGCqBuoiO85DwF1xrLdDJm2SabSaPVnIf5XR
	juJx1BbKcdfYiAUX6/FMfQIfMOqcMqwoIAbIGcIer2K7FVcASXyJF/QGDICVHcYM8ugiEfL5Iye
	yRyuFxKPhHwO2rfUZiNzcdtZjjbPQfQSN5R0DoQzfZt3x0rBSiaxfuWQC5M9n9WyqWbpej0Xncq
	SR4SSajaJx/BbvkdNr9luENdHYwqYH9a889EpzZe7uOpTDcngmFM4m408pJ4rC8WLJ35wGRcw0G
	KtGK1TQtACzNnP1zo7LWBUIIqPCXpUbklmZ4h8uNy2zViZaLagTNRF3AGYriJ0+2iOoAOJ+ixvL
	V2bQ/0b0fsibhoqpKFDOwIbZD3hHQz2BcLFvfmVnX6o19I6/sUW2lwDRd8eGWTy1eUsK+Nh5Wv7
	J9gKy6qlZ+lbXaIckgWWlTe4jkGHQIkRSjbbpG9FUcf1RWJr2Eo7g=
X-Received: by 2002:a05:6808:c123:b0:4f1:a873:6efc with SMTP id 5614622812f47-56b98c19490mr3627751b6e.64.1794435399114;
        Wed, 11 Nov 2026 14:16:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56902ae38ecsm5917498b6e.1.2026.11.11.14.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:16:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 15:16:29 -0700
Subject: [PATCH v12 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
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
Message-Id: <20261111-submit-serial-8250-dma-cancel-v1-v12-4-9e3456bc2555@gmail.com>
References: <20261111-submit-serial-8250-dma-cancel-v1-v12-0-9e3456bc2555@gmail.com>
In-Reply-To: <20261111-submit-serial-8250-dma-cancel-v1-v12-0-9e3456bc2555@gmail.com>
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

