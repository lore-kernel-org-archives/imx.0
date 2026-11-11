Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435407;
	b=lUHlVgkPHgrwj83oCn8QsjbDrIIXEbyICfU+4OKDLECJVvVc+cS7ZnZv0vPeznx+nnp/
	 oRpAJ9QgRy9CVhA7q+Xnxh01hCR+N6KS1/hd0Cg5OlhlmzQmyPM7bVVr0hSJED/iI2Ze6
	 sCeLddc2+0m8tAurtGxVBsdS7eQFmnoeV6fC6j7VMmq+gg9/iMyCuBaKG4rFlWtgYY9LD
	 cBT6wVM7pQvjvQMbY4H+Xwe9aDvHqv/qv3xGDq8po68QpA/rIfQ/wnk1CKP4jOIYhXtzS
	 7cbtU9vPiKwujcA/wl9dd21pcAshZ7tK+vzH1fuUshq/JlBgh9yVJB6JCa2CRfmywzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
	b=AR+vMgWq5Zm4wD0+Trg+pJ/RRPwpYyVpqdAv8mh/AUdNCWqnOcO+TPKQ3fkZjyfDUr5t
	 JxvJCmjRmNMwjP4nQ+xOjow9/1tj4AbUDHZVif9V2SdyvLn4XEcgRqR411nLBb9u9QM/t
	 tZBf5U9zTZl3OkzB48D0nhb4SWBEfKcz5sZ5P/q4WVMdXV+5GSvUeJiRd8+aErn3iA0vk
	 /upX/LIO0F1eFUyByd0vCZACH20K3Naciv67rQmGxLXrBNr4IfFh3m3DHsEstWz5R1WCN
	 FfaQFl4Y04DsxESJ/vNcqgdYdFo7pd5iTjvuWhPGaAu8NrAHDNZj0k7AWeuqJR4j8Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=idge4uzu;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D65F60A2621
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 22:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D65F60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=idge4uzu
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4f488ba6e90so1365159b6e.3
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 14:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435405; x=1795040205; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
        b=idge4uzuQJhgr8twFz/W6wvcdauucvmzmw5LTt3z6K08lbOfxfJUOtcg+gxUrvILYi
         dbJ0aTGU8br6MjDTDIRVsyHEtL0aeAr1N/Mz+OaP3lyrVrd6//aQ7PosORhn85/s6ga+
         zLtSLwhEhikEEP3bvrrCZWyedL8UlkXvkBHTMHoAufSa4dFd8xWks0W3TtGB1qM6vYPK
         gM+4Ris3YCRQM8vHT+1HRyEtbonRwIXmOmN29JHpxgtZc1azBglx7hZj0CwdnXdS30QW
         mIenV8xeBshXm3YQcYJiriRTzZQoXyBRT6QJuREXWVw5dnZ0SOwFB7Cy1I1uLI8QzTni
         tJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435405; x=1795040205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
        b=O//qTIJfEsYiPRy/1+Mn3N9XKDq+eFgUAijeMm1h3mSEefqYHMKG6ugDjhypOcbyX6
         3qVW/fQvPJb+B08BXeSNuFS6J2RIwRxK/zoxSLwWw75XKtosmkD0iVmyeRtFAhNAjSsn
         8tlNN8sIWA6KN2eQKBZnDKs4ZRoqzSVbjBhmr/KRnc+R24iw4TbDd9JkXUgmsbzewWAq
         GQBc5WW6eh/FFf5IIMOBuFKKz1wMHPgWw4qYY6v4reIuGpM4TZSLPL5+cy0tazkUqZmv
         BeMrW5BEjzZaEVlof4EmtFz50VqdxmlFJRKvVIqsu/jYTRZKZdXimk3/4IklmUSOhYl4
         fVrg==
X-Forwarded-Encrypted: i=1; AL+hErEcO4/4R2dgvn3VqTQDOpIvSxOYLuNG1pkXbXAAf2d8VsRPGyDVhPxfKPBBVr7u2HQJuK4=@lists.linux.dev
X-Gm-Message-State: APuU4Z87WEWR1zRPCYzu791mCI9A7GwQLk4FEvzML5lXqyqAOmI/e9jy
	71v5ZzPqtUJJGMKVhDYAogSWpUc3fbqMHuk4uSUL+254pFhERhDWCCYJ
X-Gm-Gg: AYBFou31T01ybVpculoHMdDHwbSOMD2P5XPefLyyOevMZMJNcC8mkwe7+v1C+6alloy
	jj0kufUBY3aMHzdRiu8RkfZYhg4PPQpElUXp61hM+CWYh/bLoUgn83w9sePfO1ZD22VIohRS4Kn
	hGDQ8bFUfDa1fs2GEvsCdJIUUSeyMKTwqBfjSgq5aqqnq8/SLsvGhWcOU5Ski62ab14CCBMSHgR
	ztGt+vrZDThXUJHL22UfsuQP9pfNhu6xo8+M+eoslnEQHVV0/OchSom2kSBCeBCoZueLGOxYQXR
	VUL0dDRaKIKW8pMa2nnJh4zcp7CAnZ+tQ1ZEHJBqvYxQ3FC3rWlZG0kFU7s/oJ2cTVcSISwLUlp
	0RV0M29TsW/+2ezf11BvZVf+czlZ+HX9YVOVEgf+gv4VKKDplQdcK4j9gszB2K6xuaq8c51toMQ
	8Ufml3qAgEucfBQR2OW71dp9+lRiXrdKMxDS2u9wrlo/Snd0wl4haO0ZTASHgCfRfyyyIV0LBy2
	RozJDWC04SYxuvl7dhkTKrlbiQCuTVQ/TruZZ+0YVls5tlh/mBAGs8t4owq9IsXwWDTmK4SBgU2
	GvYNTHkzMPUifLpnxqAQJye0oJ54OIDWNh87Cnsz7BORKcHViSJ0R8DF/nw4EpdHdgTyfkyKMPZ
	ZupRImnuXw8RRkVpZ37rU1khgajI3W8eJS8zThlU+BVl6+hhPaXPTl1UesnwgCjY+xctIOVvwfv
	SzESeBwGgS8Bo1p8VGJJ6R/hkQFBBG1X5Fp24XdNjSvsu3rq8Q9s34M1iCJWXQHGG/MjfMH44F
X-Received: by 2002:a05:6808:1902:b0:4f9:6348:cd3b with SMTP id 5614622812f47-56b97101439mr3389720b6e.41.1794435404903;
        Wed, 11 Nov 2026 14:16:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56902ae38ecsm5917498b6e.1.2026.11.11.14.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:16:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 15:16:33 -0700
Subject: [PATCH v12 8/8] serial: 8250: retain DMA resources when
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
Message-Id: <20261111-submit-serial-8250-dma-cancel-v1-v12-8-9e3456bc2555@gmail.com>
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
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
---
 drivers/tty/serial/8250/8250_dma.c | 50 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index b1f2998e7735..6efeb16fd994 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -565,6 +565,53 @@ int serial8250_request_dma(struct uart_8250_port *p)
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
@@ -574,9 +621,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -588,7 +635,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0

