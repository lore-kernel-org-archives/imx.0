Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196285;
	b=DTPC1Av20CPacIZbNPEfsRijnt42jt3d49YDvZVQnwjfoSwXGIdm83WoSRVQsnMUUmae
	 WHfJ0MyEIBkF/Csh4qXXig3e23r4ACeBFEDezAUgl/I1cUaXXKUMUu5mJ0w8c0R+STXQv
	 2lE4uH1T933LUQ6pBdnbowtaFluEBEctyzxSZzztZ6kewgsWW/i6Szjwmtf/OP/5DytBF
	 ER1mcRqD1wHSgTKqmDMi7lY9C6IT78u/Zt74mJrK/Xb8G3/kqZTemfb/V6wk4oD6XBTQ5
	 mfGdyTt/K/I/83NQFWPIeMBf9nGYYJYV5iVVVjYXf7xaP7s4+1+ebnPppXrC3Xbl4Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PCXVp3TiouFUBp+9ys/g3hrJvGOqhB12mNnRiK6VjhQ=;
	b=XojVjNe5/JhkPePU/c+tWMQQ/MOeq16GgRnl4Wb0Ih5DQ6oP3uzvndc0uirQgURoE8gQ
	 2U6Dgz++RkDarg4PRX6am7EpxPhLT9PThQ0KzBqQGchPIM7E26gGVH5T0pmnKxN+/lYPZ
	 lzPcS7a7OJS11JwhS879Pr4JeSQ4XCC7KsrhIv9SsKNPQAww5q4i3/9jQUzp8kaP95hX3
	 b/qPRegu8Y81f1QeSVhF41/JB6KN/g39FFbkecVKuPAYHzv+rLAG89jZH4I3BAsLW8EYf
	 Acd0kXtwhJgGhU2W2pxmHBS6FPXmGcqu2AsBTtmbhVGEj5+CbdYbZdz295MPCwX6vdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVlikfhe;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F9B606D814
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 03:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F9B606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mVlikfhe
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f84a55e31aso210234a34.2
        for <imx@lists.linux.dev>; Sun, 08 Nov 2026 19:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196284; x=1794801084; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCXVp3TiouFUBp+9ys/g3hrJvGOqhB12mNnRiK6VjhQ=;
        b=mVlikfhe/I66xiCmqh/UYUGEONDvSgVj7Ld4bEQKFfnqMnkl80X7CsAjKIGv+F3LTR
         uv1qBwWpmiVGCr7+V7I30BUoscY9zaj1ZSWU3802pvgwRymva/OWYEa2u5BZ1O6/HI8U
         nf+hYFNcWhyt76KxVBJor13qTEpfbG5BitiFqOLLqKMPNjo3RoDjkgZOa+cja6i8M1Qn
         uyaeZDTX00WT4C3PamVsIyzvVCdi2oCPRvVjYnqOB1UCDsPU354CvKpCB2Lzj9+6fzC2
         Fukqtmi4m0nW5VE3/OGQxEFsap2cRAx+lccB27ajv35C4s2w6b5SwuajnY3bQBFKah5B
         wECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196284; x=1794801084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCXVp3TiouFUBp+9ys/g3hrJvGOqhB12mNnRiK6VjhQ=;
        b=uZxj70LeCPBZ03wseDfIJJUBHQLmRBLfTVPAwIk7OC4W+0flwpqvm6lEIG/EsZumo+
         k+kQZNmxk5g8JhvDqEDM2cNvV66q7Wn601XG9keUb+zdM22tV8+6WXj56WdXgWvw883F
         7PgGHJM4ILnJWV1bX2CTuJCdgKHtR+lq3Mx65AV7U3Nz8s0Sz68I60T4ZiR4+gmTosjG
         NHy//wXvfeaNgPuogB7/xUQU3IjwBvR8L/6J3VSzuo2TPPjkQIDk+MPpEDc1xPhmatuN
         vvxGfWLNEtu5s3Up0InIUny+b6HLdCLyZOkT6AWa2kfofhAnwuRCPJmceLLq4QwjOx2+
         OnGA==
X-Forwarded-Encrypted: i=1; AL+hErH+UU25XUj5TRMKDfz1ZGOuPBxDB8BTBPUxEG9oEUXSbwi1IRBL0ZPEbgyjUuNkyeeWVCA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Bl2FkZbNto4B/NN5XE40HQNkZLfhG0gk2u2HV9p4WyfkqbnsZ
	3WQWdGuyH3sAQABsHiBfQ1w/YPzCVa6qFgGUHI5pB15tWA3Wu2q/d4/T
X-Gm-Gg: AYBFou0FsvZNxWZpUQ5jRof3YvOb1fSGuP40DpayNN5uNmCiC0uOjPcQHh1GMqedlXI
	ACSf9zRXsLhlcX+8l82O42p0ju7+Xs4vJXdGDZ2lVbqOqj9tzSQ3EBgfXkAeNuolWcXXT8bXpl7
	6Ug9hobwE0zoMSyr9jkeEVstg2b2hYhvYIvyW6SQ8AZMm5rxFC96XPAsesd/c3w28XhQKPUfaJG
	BLFBKempbgAiBg/Vf3VNvOrH0+d/6U4BIJItuSACK865+kI1WT4Nnrx1CqYHpEqxSFq2bcb0yYA
	LT0FmI5sMMUM8qeIjMpDnZmpBfT4pS31AoqQMWp229KuQyshl3PdWyebx1ewNcyndD9FPtnbiHu
	CU41cDbreJRN7kaMo17rgpoaPjXUG38pFvfsjQXCG4skCA7XPEZ/pmX3dR3yhk80+NUbs/udzMn
	J1c3GV3x+14w8lVqAoGEWCOu2CoSyX+i9IiWty18YN9j4AmSx9lk2ztEgc9kdhpy+roEgnEelHS
	2pdufkN+lxFVfbqC9cr0iDVgWTLylDWSkB2J63MffPIOjPUEFg1r3zE/L/2Ym/XF+DKihGtqRSN
	85F9gEjPU+i+XxWMcqa0GKCNbIRxHJ5k6XdxW2E0PJ3hE/OxjbPf4auA8NvqBRfag5ZDNzZyziF
	Dt0kZltN12YbbDU8UVBFrrfRS680OsXRGgbqSxYB8Jfq05az3fNgI8WHdNulFyRt/uPcC0SH1Y6
	MWu4P3cJYi7I8iORMzI23cimsOiIw6VjlTFHWh5n89l1zAY0ReR7Kk
X-Received: by 2002:a05:6830:928:b0:845:156f:58b1 with SMTP id 46e09a7af769-85f50847937mr2643447a34.24.1794196283700;
        Sun, 08 Nov 2026 19:51:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fad32cdsm2800428a34.6.2026.11.08.19.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:51:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 20:50:17 -0700
Subject: [PATCH v10 8/8] serial: 8250: retain DMA resources when
 termination fails
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
Message-Id: <20261108-submit-serial-8250-dma-cancel-v1-v10-8-e6227ddb95b1@gmail.com>
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
activity; neither delay is a hardware timeout. Report the initial failure
and ongoing failures with the elapsed time and current RX/TX error codes.
Track the five-second progress-report interval separately for each
teardown, so failures on different ports are reported independently.
Report recovery once both channels have stopped and drained.

A permanently failed DMA engine blocks close or removal. This deliberately
retains the buffers, mappings, channels and callback context until the
provider can establish that they are no longer in use.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dma.c | 50 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 1ea22954150c..a279e3a1a845 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -528,6 +528,53 @@ int serial8250_request_dma(struct uart_8250_port *p)
 }
 EXPORT_SYMBOL_GPL(serial8250_request_dma);
 
+static void serial8250_terminate_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	unsigned int delay_us = 1 * USEC_PER_MSEC;
+	ktime_t start, last_report;
+	int rx_ret, tx_ret;
+
+	rx_ret = dmaengine_terminate_sync(dma->rxchan);
+	tx_ret = dmaengine_terminate_sync(dma->txchan);
+	if (!rx_ret && !tx_ret)
+		return;
+
+	start = ktime_get();
+	last_report = start;
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
+		delay_us = min(delay_us * 2, 1 * USEC_PER_SEC);
+		if (rx_ret)
+			rx_ret = dmaengine_terminate_sync(dma->rxchan);
+		if (tx_ret)
+			tx_ret = dmaengine_terminate_sync(dma->txchan);
+		if (rx_ret || tx_ret) {
+			ktime_t now = ktime_get();
+
+			if (ktime_ms_delta(now, last_report) < 5 * MSEC_PER_SEC)
+				continue;
+			dev_err(p->port.dev,
+				"DMA termination still failing after %lld ms: RX %d, TX %d\n",
+				ktime_ms_delta(now, start), rx_ret, tx_ret);
+			last_report = now;
+		}
+	}
+	dev_info(p->port.dev, "DMA termination recovered after %lld ms\n",
+		 ktime_ms_delta(ktime_get(), start));
+}
+
 void serial8250_release_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
@@ -537,9 +584,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -551,7 +598,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0

