Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196290;
	b=tuWOKtLex6oPQfE4PeNgC7s+0IRQ0eYsV8n05SB2SPS1dUD6D813lpnpCViEUt8cDFy9
	 sPQHGPwmRFxN1kfLXHIfKEL9NrNjVgM8tuGnvtY2074+kmpjgbNof+tX7+9Yjonre4nHl
	 b7wCTIrBVD1DBMbIHF4v+Mb83ZiFgQbqZ+wrlgOJX0G7KqqwSibD4Waq0CTTGNYmOogjT
	 euLrgIJLAT/0w+OGoVb9sYyDyaDnnXIk7C3EoJVUteNeIdw6BLGRDBHrv3GAsf4eR7LH+
	 VImjkMTdi9lUpxoyGwkD1DOGXq0Pa40Y4JJEZR69kKilSHkYO1OK7dWeZlOH5L7rLmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
	b=3mMY1H11w6SvQCo6mGskBc9Gt57m36gtv4+Vugr6stPR2DuiDuSgbFW7cs2xmfzpmy42
	 BRFz/892j2GIMJj5XyaaUmrX9/Je5ReuRvKGllF3pKuHWOCezCtOIx9I9lL/mFWQoaTgl
	 shr+butlcJHu6tcfN5iy0KGSGZ/pTV2Ty7P8NL42S8aUFygQKp86hCjGk0PI11xXCx52d
	 dWN97hIzIMEDj2jvzf4oAZqLy3aBH5BlAVniX69blYEQ668EPCCx1hqqPbbYdAmoDemu1
	 WdGL2FyC1ssBsaVlJeKnhy6+rR/6YmBzJs+5Q9hJaZ1bnYRdY8XfNLVmoWJguKu9qRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7oLMzSv;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045B6606A31C
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 03:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 045B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L7oLMzSv
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-8490a7d6696so210679a34.3
        for <imx@lists.linux.dev>; Sun, 08 Nov 2026 19:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196277; x=1794801077; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
        b=L7oLMzSvpsbz5oDR65R8DITUJXBS1yY2+SumH8BLulIuPasvdpAaUx6z3VDUywqugR
         s6PLPZ3Q7QACRbpbDi7p/0Y9wiiE1fjisCUzXICPhw/sNFxBOXnj2FHwgXV3Cb7adkaP
         Ji/owsBm29ov64tD7B0SOLHmdEWc7/6IQ1Go4+rHC9foKuvCfyUvqrpEBfgroJmXJYE7
         rhwYAZYR1KuKydGvtXQikgNT52D80wXkG4wLleXMPCH82GQOLWcFIYs0CDqIlSBOuU7u
         QXi+OfCKbVlvt4i6RPmSss/aK706J7orxvo3YoxnZGS7rlRv+7X6UrnIjwGYFGr0yKJo
         EdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196277; x=1794801077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
        b=BvLefPJJG3+iJChTE20MS4NJ20yBycxxSR05EBymxutYuHG+Ifd8gW1UdEqncgU9bH
         EH+u+iiK3+1qucxdrMx2Gid5jVZYRxJSUUVvvN8OKxJtIk1pcKDDgr5i/DxBhrUF/OI+
         GzF0+Z+qcl1ZHZbPBgcbHNlkjmfQcsjAEPKzJTyTsZRxGuuLD82x+b4lTD9j6U9qSDLt
         45aLg97+/RGd5VtYyqXB8E0oS2xC30thurCtjB1TLW0MSm/VliXvR++sI8CsnHBpaosv
         kZaDR4B1pTxfVteYRwRuxNv9YbFkGd8Wc/fDK4d2en1XKdPgBO2nuMfnakqg7F/J647A
         jEaQ==
X-Forwarded-Encrypted: i=1; AL+hErGLVMhfGocQMDDVBe/7A2Y+04t7rRRMJJAhMYV+02ttgzAwFTxJeWGcJycbOrU4XD34jF0=@lists.linux.dev
X-Gm-Message-State: APuU4Z98mb7Bp6mhS4R7DqEHmbtRLwerTdlIXZxPGZvTVsjYo0a/HS7S
	itFJ38C0TwKo7U/meOGQbMCoodBvF2hio7qq3i8BCbQ20KEGOy3PHf9J
X-Gm-Gg: AYBFou2CSsdGahYzzIv3JFgoCHm8ZfSCdvHrQdA2RcX9tHNHUn4f74ok7WDXkA3otzc
	GEB7WB86RQ54yA1No4FSbHY2tuWU1HVWMZZHTB15qKmzNDEOkk4zcx4ogU5W8y1Z8NYT9I+Pkoj
	N/l27VhPyfYawc5x2Phded0RYLppe1BCZpvCWQN7wbn1Qpd4bKX0Onvj5sxjEYLK4Qp9wRYXJU9
	RdEQH2O+cKRLVwnMDNZFu6V3KKI4Kp0wIjRwJ0WyVM3piry9Z9pkgI/WS0n8jeaLI2bcRuxpQv0
	R5Dyw0VChIqHiPV2QlPadltSjb+g4Pbo/EgXc2m0gWih/n2ZMcl6B08/oR23jFnGajCjG9Ng6M0
	2mCi9NDAKJj0JElOisJWiCFJlNiWQWBsLWRiXXng1uB1MLrwDSrPoE/iIZTPIrltpbmTeXG9qMX
	YzUMu+eLBTYQCi9I3oLOZqkzjKtLIyAzSpiFW8YPAMEVudd7wVgjvFNPk9DsPyNdRB4xaqv+JEN
	NDgPrSQSQlhdWYR/YSDW/apwxenE3dCm6AEke8tslPRk4uN8lhj1VdH5LgETUYbMR2dL7BgeRBG
	CWeHnEiNjElGTJNrcwGD9zNU4DYu3cgszBHYMfMd+f4ajz7trR6jVTeMiSuEjVgkIWheyHdTHdc
	sLJ7PbpcNXB8Acc4wixi5DmUGOIi08f8GMfUDRcsw1M/CeGhRGkLDbUhNidgBW0k1+LU7UziM3u
	b4hACKFyQw1tB/a6fNayi4mu4CyKp0KQFMt5cnNaGfzhIQpiChvMdc6w==
X-Received: by 2002:a05:6830:34a8:b0:85d:44ee:607d with SMTP id 46e09a7af769-85f501a3163mr2198462a34.0.1794196277001;
        Sun, 08 Nov 2026 19:51:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fad32cdsm2800428a34.6.2026.11.08.19.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:51:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 20:50:13 -0700
Subject: [PATCH v10 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
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
Message-Id: <20261108-submit-serial-8250-dma-cancel-v1-v10-4-e6227ddb95b1@gmail.com>
References: <20261108-submit-serial-8250-dma-cancel-v1-v10-0-e6227ddb95b1@gmail.com>
In-Reply-To: <20261108-submit-serial-8250-dma-cancel-v1-v10-0-e6227ddb95b1@gmail.com>
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

Fixes: fef4f600319e ("serial: 8250: omap: Fix life cycle issues for interrupt handlers")
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 5e114dd8f9bf..51013dd2d851 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -771,10 +771,6 @@ static void omap_8250_shutdown(struct uart_port *port)
 	guard(serial8250_rpm)(up);
 
 	flush_work(&priv->qos_work);
-	if (up->dma) {
-		guard(uart_port_lock_irq)(port);
-		omap_8250_rx_dma_flush(up);
-	}
 
 	serial_out(up, UART_OMAP_WER, 0);
 	if (priv->habit & UART_HAS_EFR2)
@@ -782,13 +778,16 @@ static void omap_8250_shutdown(struct uart_port *port)
 
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
 
 	serial8250_release_dma(up);
 	up->dma = NULL;
@@ -1330,6 +1329,11 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 
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

