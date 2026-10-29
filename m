Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259474;
	b=L9gySEVavAbaLRaSuESM9UIHyB+8luZeILFuEsUDZCD0B6c1s12vItfZCmF5BQENy8rr
	 K/D1WuqIyu8V6OViyddI7SjrwjUfx3LhOB9+eHc316ClVY8RuxYi19m7SQI0VSMYQ7YAf
	 dcaj4esfqjVRRf0rMu75BZbme1VwfFMVnTvp7GU10oXpVuGCTMYC//MJUJZTPogmdkzfe
	 OAZoVS+Bu6kl+I+MLD2NU2CRP+Libt7HHmMgYmsAWThCnOFpFs1ioj5YtL9EglIR1s12P
	 Y0QPfBfdHPB9O+AHYfqyGto4hlwPinAtp0aGIkhcq9kg44Gwh4bYR6fbOMhI/YhU8Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ITA8CLqHA1tbelgUq4iAlzoGpEjCOXHXMqP1J6A1uQ0=;
	b=M4R3cOAAwajveXykP6wytG4QxEeJ/MyL28HH+hVyHrpKI/srgCCgw+mJLXzlukhUc8x1
	 IUqIqojRupJmO9/CiesaF2HwZ7CK2988UID/q+mXJytjsqBw4g5QLJWGBU2B/wBweNq+3
	 QXAv6X7PwBT7WQxpngOfI5+UaK7G+E325HpbNyM6dwI4X+cqFbsWrF1jOCH7hatPYB/Wa
	 dBOrAZN2WmUSw3C7iTIwlqdUplYdbPrJ3XvFu7k8tdlkQwR+JCiey0KyRp5xoUX25SEga
	 dFpGgc55lHQKS31NKgCfI08rIWwxNB9gb8OMDAJfCPP+yh3o7oFAKG8jED9NwGbxBbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RNNwTLeX;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F2D60A2600
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 07:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80F2D60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RNNwTLeX
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-85ac281604dso969370a34.0
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 00:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793259473; x=1793864273; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITA8CLqHA1tbelgUq4iAlzoGpEjCOXHXMqP1J6A1uQ0=;
        b=RNNwTLeX3qm64H5HywvhzW2HSe4EBMUarVYpIFDh+/S3znnZxFTF+s/GQrNO3z2U1w
         FuK7WlEtgXl4O3kNfuCvWDzTvWvwJA63VimHgkx5R83dsMNWSZV8VSfJdPV5g6FXhK6+
         cifpboLKwdNLQNYRQi/oYBEA92JMSZ3QFo0KFjMDuI/1VWqkeDuCtZFIb2S4NylMie+V
         d+CKRLwcv3occUF2xuEbrZi3Hq3GJ9pqM6tAQMWDp1XCvEbGsupcz+p6nfB0F879hoVp
         PaC0AaQxhH3X2Gs7GNktlr3iu0/iSjF0/C9wsmnHlRPt03HamnBSv7XA/W3cOWgXUftA
         FDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259473; x=1793864273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITA8CLqHA1tbelgUq4iAlzoGpEjCOXHXMqP1J6A1uQ0=;
        b=nC/AhRS3l7z4TtLOzTJGtFaB4nAyDCOViteKQiMBn/AE7cvfhSxDIhfiYmThRO1mu8
         iLv5MC7zlVyPs4QI5JH9w8EtS0ALs+bxWHGBWS+6CkcXCgJ8g7voWIzIVQUqNYLCdc05
         bVkv4P1Vf77T/8KpRuK0hnjbud/ITaMbMkJ3a09FGTL6RLP1/FNgHpI/CVGSw907oLzF
         +5us/OT5t2rTKSxxaU123REleZVk9rQbNPksI9wOfAyuyUwB92E7qELdHIFl7opFB36m
         jLu54SQ9CwS5HNbIPc/v3Xn09xEIVQZaJU/oY2O+rWligu0IfjaSVPW6tYZOfnNtWyaw
         Q0uQ==
X-Forwarded-Encrypted: i=1; AKwUvByTq1ad5zo1x8ZKyPMK24QPruSSpWdV80rkFx/NHKmdoaHmUxhV9uCfr1wdwckjNaxOsjc=@lists.linux.dev
X-Gm-Message-State: AFq9FYKg1ZCu5ZvYUT+n5xHEXvJwJcO4KrnlxgdewBV2VMQG2YJuvTFf
	OGIHMw0umNV6MvKlylqj85UKSgjRrbtcRj+wndbMZZNkHHt98LQ51u7vUgwZNPSq
X-Gm-Gg: AYBFou2gKVBgNXllbyfQt6k3sywVCsroVSA91hpv6BczZMQC2/ea5BpYTWg1uGykG38
	WRl5q44RATy7KGe15f9zU+9DtSnIh3tygx0wbkPRVZUlRGnoxNqPgEYRWBX7qo0CYW0EVxlHQo4
	6WUsH/kqBJUmXkbPDR5XP4VR1nlC7QatTzJoqfote+wYru8AdXVg27Yyoo9JkhRRUPg+bn2Pn48
	d0HyGKLxFKLrIWnydQAju75Z0QceZD8lA/BkGqRAtKKerAMMNBZewESRZrin4NYm0O4kQyvJmEw
	giSynj9uRKWQNJy1T2yLZ/sxHjezU3qiwTRghl6vl9WTzlyL9elV+eSnGZsV/1rHZ0699cJtXCf
	rt+NPFnhGsfkYgZ79g7pPAmBFkBSiS8pc8NwmjEgQ5k5AWI/p4KT6feAcIztRLvbgGtwuMNy95B
	O1fUdomWnSAZ+u5k57O0OWjdRlf0mmhH0IOPfBpYeUeYJzfW2FhgNqyWlQcbYJt0T/0h9wGrPVM
	bp7QsjUgK3cFiNVyf9Y2edsu+/yl+pUzAWZ0yq1KnVpmRuBc/kAcUr1IKUY0vSKBNFZy4tDsGom
	JIY6DcBomh/Xd9pERIgbbfl4r+v3kbHjlTmppTxIBYNkcOVzBB0XMZ5mK8PpqAg++LBsXcsdmHC
	WGZSFuJG6w+TJCVuXCXu+tU6eIfroert4KVGGcXTM0KEEG8+syzsb3ECwMMbusW+L9N9JUeKtKj
	qdI9HCyS959JPr+jhnjRkZVesVnfpG8GD9fXyC5+U8yp4Ym9TKiAyBL4Gr1JNu4OSFgOvoWySNA
	g==
X-Received: by 2002:a05:6808:11c8:b0:4d6:2545:b12a with SMTP id 5614622812f47-56382682108mr3199317b6e.26.1793259473449;
        Thu, 29 Oct 2026 00:37:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c3638604sm3321976b6e.1.2026.10.29.00.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:37:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 01:37:02 -0600
Subject: [PATCH v8 6/6] serial: 8250: retain DMA resources when termination
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
Message-Id: <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
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

A permanently failed DMA engine blocks close or removal. This deliberately
retains the buffers, mappings, channels and callback context until the
provider can establish that they are no longer in use.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dma.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index f980b4faf6a3..ff7574b1be40 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -505,6 +505,32 @@ int serial8250_request_dma(struct uart_8250_port *p)
 }
 EXPORT_SYMBOL_GPL(serial8250_request_dma);
 
+static void serial8250_terminate_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	int rx_ret, tx_ret;
+
+	rx_ret = dmaengine_terminate_sync(dma->rxchan);
+	tx_ret = dmaengine_terminate_sync(dma->txchan);
+
+	/*
+	 * Shutdown cannot return while DMA owns storage or callback state:
+	 * serial core frees the TX FIFO afterwards, and removal frees the port.
+	 * Retain both channels and retry outside the port lock. A permanently
+	 * failed DMA engine therefore prevents teardown from completing.
+	 */
+	while (rx_ret || tx_ret) {
+		dev_err_ratelimited(p->port.dev,
+				    "DMA termination failed: RX %d, TX %d; retrying\n",
+				    rx_ret, tx_ret);
+		msleep(100);
+		if (rx_ret)
+			rx_ret = dmaengine_terminate_sync(dma->rxchan);
+		if (tx_ret)
+			tx_ret = dmaengine_terminate_sync(dma->txchan);
+	}
+}
+
 void serial8250_release_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
@@ -514,9 +540,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -528,7 +554,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0

