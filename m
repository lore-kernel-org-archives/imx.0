Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563619;
	b=pEHmDUB4rCVa3OjiBfViXoDgcroPQY8IITXT6uI2kDhDca8OXbpxYi1VlJRtXKeLy1BQ
	 L4VIR+WeZu6x/6RPxtyRABNkIT7Tzy58fA9UY8aQ4+hM9TDMeo5jB8S5dQdgPBNVv3n7x
	 PzvlhXx7ljciwb4MG7ePVX8LEMkONSeLufhNpJrgVXalAlUQL+PXlQKP7IWo6SVB2IzOd
	 eRsFW00WxmZGDM+iKBEZB5svpsHDiG2YAg3kcF91BdYukovnUZ6pbJfa8M6ixkPdUwmJ4
	 bEfhh3k2gbtblYZV0RDrAOwlJVwr/KXntRMCRgklQyt4BgF2z2DOParPnTM7kzcAd5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tKw63yp+LNfG2M5Iosvm2af5QjVi5+/3H0IZittDmk8=;
	b=oM1tHij23xpBHWDZdmshEWlZ+g91lfXZtRA0uvUvP+0LtbDFENMO8Qxxm6C/N4J3njWO
	 8FdLMDH5gNcqRUYRCQVW66C9Y2Bot4lXUdBRY+l2D9uc19g2Lorl1HU6T960hu50QZnNy
	 hfMwHmonHuZL9YytBJVeLFP/xC3KZRAhn86CSVneeoCAz+tLzXoTBB97XOMSjmX3Nkc+Q
	 43CV/hoCddrv+3Mid4ny22E6De0kzrv6V6KDKZUBkAqa5HFUgxmMsDEySvybcCaxVEO6e
	 27Xsygt+SW+vs6SlnHKUp4LI1MWJrCdoZlqOMFnT15vsn+MVD8MzdT0TNkPayLyz1aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xAZDJgFb;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C322260A2637
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 09:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C322260A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xAZDJgFb
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-51f2e9e6987so1759915b6e.1
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 01:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563617; x=1795168417; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKw63yp+LNfG2M5Iosvm2af5QjVi5+/3H0IZittDmk8=;
        b=xAZDJgFbzfs6FCFhSOf6I8V/a9D6KYko48nsp7O/6R0bgrz4lBF8a8YCktRFzCppRu
         hDYlqL16ZOHH10glkj+8W3Xk8e/1QBL1PV3FSflmUHGrjOmHWCaoTvj4HNndx6j3r2i9
         nSN/jVLElePLCxGSmaBIdddOo47E8Pgs6JqVekkZb8ef+yRhNN68ZEu4xa4OB3CbRdPR
         B/kmAaRVH1RSmaidwKFusrSePrEg3vSJfh03nyIOrfafSSGwfm3djFh1SoXmIZyKwmoU
         gaXEdCaao4XVJjuJxhSyiaEGaaBOdznXainSsXkmLfFixhN2m6xLyoQIR7ALaDBxxMaT
         7bTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563617; x=1795168417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKw63yp+LNfG2M5Iosvm2af5QjVi5+/3H0IZittDmk8=;
        b=evEA8sh66NvHUcLN0WQLfcYvdgn7+0MDhJgfm/H+vVyzUiC829hJWRYRfIFuPZLq/O
         ohwtyAITLMwGH/jfVPrPRrlFm1qAP+4jO8tCLa599EL2FSM9d9dFnL8SZUAj0ycMIziO
         Qqe5Nw9BUvPJjy9wGVigZey+80fYTqRqG8/cYSOuhQBphRPvoyEst+iqxv1wggYQy4Cs
         fMUhDtz39lJ3Q+Rt+WP3x+Z+T3yzOLuvnjAz6rNRt0+i97wI2LCp/0kJuYZH+ISn1Gn/
         a12su44JwL0HkyJUKpsZlviIz2zh5hdMEDCFlhNvkSlUclGNlw3704tOzp9F+xihLjWc
         uqmg==
X-Forwarded-Encrypted: i=1; AL+hErF8jLlwQNIM43JWCrT22XKDrJJ5Vca+LnkiKXOD4O7iM/H8qfB0bHOGZaCWynpoj9Esj30=@lists.linux.dev
X-Gm-Message-State: APuU4Z+GDnM/ctmOw02ky/Hv9vzGIdGdOoaaz0fKX1EmYn1yavYJzAez
	4ftY7gC+IlFL5yUKm6Rqb6T2DMKAB7nM69GiJWP2oYAgjNkNaOoln3jX
X-Gm-Gg: AYBFou3MCmJIp2vwT3eFrOEde1BUhWvGEd6y/0gnLbmqo5/BOmApXIi5SIXSCnL66qL
	ZNIWlswSZRnLyBV3iYPz1o0FLL8boF8kECW0XuqqWfg2xgZ/Ee4v1YS0ZR9VN/ZTpF8Vtg6Cfm/
	kNl6Kh3/3x4cpapTdz6Uns1H+XGT7EHbZSCRP775lpvz4F2M+9+Q0cKncPfUZuTdidKhTqLX5c7
	MWu2ae6lCxwzJq2admxSOu/EsG8MuBQMjkK7RMN/qVdwXIWuUWMSmDKrJqPFor0aqOrmxEvggtp
	VEgQaqUpNLmfkMgPQMa1fNUdlTUM+9A6GbcDAYUowkJyMeMsT/S5mFbx1wfoqhD3JAdlhTItAy1
	7OAj7l+XS65HvJJ7tI4U5FtlWR51XC7AD97LiQrNw98jwgbA1EbF4MEW09FFrpkod/ZTUvfM6Om
	d7R8H6wwBLW9W5eoAiPnfEZK9EwnnpHiAGe63pY2Y+sjrUjLbcbEJ4EhuaRIN8diFhI1/JJqTSm
	Wm+uWnjWwLRrgWROUho7h8Y4lFvkv2ppXLhf05ItSc0UztpuV5pfzltnoD66uKBittugEZcqW2Y
	MkQ9jbbSNFgln4duccUhgYu/e3lejE/hebYcbDmL1VuCRn42/RL6RFGPyZDnL6WUDYSDD2pmKHb
	vfhLiF+DlcfLaFzi+D1/XVz3CcePJMASEZ1P/C22m6yZzzPkB77LWGu2Hk/k7VH9miRKjTttblU
	nJKzkfG1DwQTdi4mEEhSjiiBSgjWEcNCGf5xM6p3bb8PRhW1cKmC4=
X-Received: by 2002:a05:6808:3383:b0:564:3e9e:b498 with SMTP id 5614622812f47-56e65624042mr1138531b6e.22.1794563617554;
        Fri, 13 Nov 2026 01:53:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7094aafcsm1609523b6e.12.2026.11.13.01.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:53:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:53:21 -0700
Subject: [PATCH v13 8/8] serial: 8250: retain DMA resources when
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
Message-Id: <20261113-submit-serial-8250-dma-cancel-v1-v13-8-b857f2617ece@gmail.com>
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
 drivers/tty/serial/8250/8250_dma.c | 48 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index 1d7c3c5b7564..0719fd4c3129 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -578,6 +578,51 @@ int serial8250_request_dma(struct uart_8250_port *p)
 }
 EXPORT_SYMBOL_GPL(serial8250_request_dma);
 
+static void serial8250_terminate_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	unsigned int delay_us = 1 * USEC_PER_MSEC;
+	ktime_t start = 0, last_report = 0;
+	bool first = true;
+	int rx_ret = 0, tx_ret = 0;
+
+	/*
+	 * Shutdown cannot return while DMA owns storage or callback state:
+	 * serial core frees the TX FIFO afterwards, and removal frees the port.
+	 * Retain both channels and retry outside the port lock. A permanently
+	 * failed DMA engine therefore prevents teardown from completing.
+	 */
+	do {
+		if (first || rx_ret)
+			rx_ret = dmaengine_terminate_sync(dma->rxchan);
+		if (first || tx_ret)
+			tx_ret = dmaengine_terminate_sync(dma->txchan);
+		if (rx_ret || tx_ret) {
+			ktime_t now = ktime_get();
+
+			if (first) {
+				start = now;
+				last_report = now;
+				first = false;
+				dev_err(p->port.dev,
+					"DMA termination failed: RX %d, TX %d; teardown blocked\n",
+					rx_ret, tx_ret);
+			} else if (ktime_ms_delta(now, last_report) >= 5 * MSEC_PER_SEC) {
+				dev_err(p->port.dev,
+					"DMA termination still failing after %lld ms: RX %d, TX %d\n",
+					ktime_ms_delta(now, start), rx_ret, tx_ret);
+				last_report = now;
+			}
+			fsleep(delay_us);
+			/* Retry promptly at first, then limit sustained retry activity. */
+			delay_us = min(delay_us * 2, 1 * USEC_PER_SEC);
+		}
+	} while (rx_ret || tx_ret);
+	if (!first)
+		dev_info(p->port.dev, "DMA termination recovered after %lld ms\n",
+			 ktime_ms_delta(ktime_get(), start));
+}
+
 void serial8250_release_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
@@ -587,9 +632,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -601,7 +646,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0

