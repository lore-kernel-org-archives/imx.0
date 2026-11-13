Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563609;
	b=5fUwyRnnSgMAJzNuukS9/sCze2+ioX+aDFKJSxek/5uW2NGdgKP/JYndSBWSNBRu20Ky
	 9hR3MquqqB0eNWhXXNZNHuTxroIszv9LU8OEDZeE6vKSPSTbhY1alu+6Yh6jiaO8Nxv3x
	 y6XocQ2awVb+Pke6K1/lx+HukDvwzioh7/dc2uheOHktQZ6t4xT0c3V+CqnRyTIbl4yzn
	 dWekmew7hh8bCfhp2XxI/Ra0Rs9kzMZXHrydIrO83B+rktn9uxX4d/B8gYQqOkn9RIEhb
	 Rt/2q0k752e4K5UpBYvskT6c973Zuxf8GSM/Fs03UgYri9I+iqj4IGb2f+npEnY1/YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
	b=2Y1+WG3q+wQKsA2mcB4AxMcboxfdV9DduJEBdd1aU+9dhAbRm2JimLEU/oBcqINzdYCA
	 Yf9zA7BIT8uAmgO/TCAZ+caz4Cqo4o34epBwttiKs1X0b++YM1xT07FkMHcOoHJXYrgPz
	 X6CLqLFh3cTBY54ebwPP+C4N5AmmBhT+4Hpzj1uJhw18jr3IeYSbSaPWoPXYLRbSIMhXG
	 3M36BOaNIuwsrFwlC8FZ8TX8lSehrdWU/2jOmj3fBdjkBj5ySEvZOsqEIgaPToyN7fa8p
	 IQV3QWmjIgwQD91eYdQ2Z6tidN+M2qpkee8r/uOU0TA58/abqIQRiHP0umfZbRammSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nbf0vBLc;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F908606A896
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 09:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F908606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nbf0vBLc
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4af173320f9so955691b6e.2
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 01:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563608; x=1795168408; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=Nbf0vBLc7j4E8iePLj86lQGj6gygZiR/f7q11vGft2oUUCCeUOSYmGDjBfUd1wPohb
         YqzOUp83IyjkLXrNVFuu+Vpur1RtEQDbiQYqDQGIyOhJelSRxkFEtdGBl+/na+7LmZKU
         TJ7iA0aRLC1MnHU5JPxumnqGY9+be4AIIrgF1B0989046at8JCbMgaXVfJXe+ntjorsL
         J2zQJzO2QtC2wH0KMb1/jxwO+qfnSPFtZV4sItyfDCLmssMTD9JmPYF8fVxxflErKRtN
         1SjR2M3B7yU/du4LrxSgKNCCVmmXMIl3sDBVJ//n8xxW3XoomnkYSndvhBp//CrYNGZi
         rssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563608; x=1795168408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=ybgc+BHrTlNLhDkJZXBIKTz8WeB/7gM4ynPPg85xvDwz9RwWEAuHkFO7O8ZxHONwrX
         Ju09Hqc/ajKLQIZjjM3mNZrj1wf9gxZIpt8GNiiFN3tKZPzVECx7vGR++hPnxPlZRHqT
         Njy/sXtyRkIMy1lJe9j1AATXnBZKbOuNcPUAPXJFKf9l/plR9WDhWqGl6JpZWJYl1+nD
         +7pdKgcdRzPt+Y3z+z64e7EUefAv+IHuuPnushpKLupAi5xlxTSPmpYO6fGSMhF8F73V
         ZVXGw8EFSjQxlgB2Er7c0GcjWSipQzRX6f/yLOcCoi7+nCLj1BzE60L+R0tuDcWXynsb
         DAWA==
X-Forwarded-Encrypted: i=1; AL+hErGtqRrEQ4yvnP2Id0zAXTJAc0QKlnlRefqoH7OnfmuEIAfI2QJtYSIbceDF6maQgMPsEhI=@lists.linux.dev
X-Gm-Message-State: APuU4Z9k0tW95jxZO+SzzJSIfUHPXl3m+S71PzLOZ2mQb3h1+PJWjM14
	zLMN8eq5s11hDOSjDx0upTvGiPJqK+HrvkYAG43hUbB89k9Dce1qQX2z
X-Gm-Gg: AYBFou2wDs182f/kp3SczYSTeJC04rUrV+eV7zQsJc2g8WpSXnLn9TgYnI3anJDd125
	Qq3fqx88JbUGRDEwFaKpeqDmHvJeo2bLaU23nVvPx4JioFnUf0LKHg2rLOtZGpK1pj5BpF9M7t2
	N1Jla1dlvzqFjdky58aAJNLhuXRpJp3VgD9HlYXmu10AippZndeWaxXM3qoFn9VKtXJwKFuA99i
	qsN6vm5jAbFlTG34R0R4u9a7V2jElHG8/DihsjL/yKOG3Vs1wtsRe/+RvViv8TjvTThivvBGjSq
	LcpWXSED1b3J9Ew/tPGYCz3Bcu5F9imjMY63YdVaOF6CbS+EXssQY9uIxoAZZ/hvQWfY+zd4ESJ
	PsnyQctvhtJ7PjbaXi8UHecQnp6iDArzQWTMB0BWs5QYznENymi2yTKHq5CS1ReY812KAmMpwYV
	rQLf8Xh0hZ30i6FD3cwS12JjXalHS1yMRMNjtRdq7hPRnChKemG7YG95kf7PR8CQeQ0++rGgEcB
	Fj+nxGc3DjMZCZDcdFGaOAffL+o6dlUuXsyYCaGaIoREcFmAs8YepHbw1LpGaZZ9I8PmmiHe3PU
	rg2BCpmue8Zd92xYZvjgyiGaB0LBjBJjWFgLDM1ZeoD1yhBC2nw279puOa+1P+HXZB98u56By1Q
	/dYGQ8B82Ugvr8UHZ1ckOgnEfwzsLpNYyeflv998cGl+ToNsRsyOcnSamVSqW8cScQefW2kmBAk
	c9N4+r0Hn+hgRRI8VJJeAAFWy6omhZptYcpn2stzJk1PjV1YQy91k=
X-Received: by 2002:a05:6808:2220:b0:4b3:7549:d3c0 with SMTP id 5614622812f47-56e648e778dmr1355898b6e.18.1794563608017;
        Fri, 13 Nov 2026 01:53:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7094aafcsm1609523b6e.12.2026.11.13.01.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:53:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:53:16 -0700
Subject: [PATCH v13 3/8] serial: 8250_omap: serialize RX DMA completion and
 flushing
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
Message-Id: <20261113-submit-serial-8250-dma-cancel-v1-v13-3-b857f2617ece@gmail.com>
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

Moving RX DMA locking out of __dma_rx_do_complete() left the DMA
completion callback calling it without rx_dma_lock. Shutdown and runtime
suspend flush RX under rx_dma_lock but without the port lock, allowing
these paths to overlap the callback's buffer accounting and flip-buffer
insertion. RX submission and UART interrupt handling also require the
port lock.

Take rx_dma_lock inside the port lock in the completion callback. Hold
the port lock around the shutdown and runtime-suspend flushes, matching
the existing interrupt-path lock order. Assert both locks in the common
completion helper and the port lock at the flush entry point.

Fixes: 789898416749 ("serial: 8250: 8250_omap: Move locking out from __dma_rx_do_complete()")
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index b6f108d34854..5e114dd8f9bf 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -771,8 +771,10 @@ static void omap_8250_shutdown(struct uart_port *port)
 	guard(serial8250_rpm)(up);
 
 	flush_work(&priv->qos_work);
-	if (up->dma)
+	if (up->dma) {
+		guard(uart_port_lock_irq)(port);
 		omap_8250_rx_dma_flush(up);
+	}
 
 	serial_out(up, UART_OMAP_WER, 0);
 	if (priv->habit & UART_HAS_EFR2)
@@ -898,7 +900,7 @@ static int omap8250_rs485_config(struct uart_port *port,
 #ifdef CONFIG_SERIAL_8250_DMA
 static int omap_8250_rx_dma(struct uart_8250_port *p);
 
-/* Must be called while priv->rx_dma_lock is held */
+/* Context: port lock and priv->rx_dma_lock held. */
 static void __dma_rx_do_complete(struct uart_8250_port *p)
 {
 	struct uart_8250_dma    *dma = p->dma;
@@ -911,6 +913,9 @@ static void __dma_rx_do_complete(struct uart_8250_port *p)
 	int			ret;
 	u32			reg;
 
+	lockdep_assert_held_once(&p->port.lock);
+	lockdep_assert_held_once(&priv->rx_dma_lock);
+
 	if (!dma->rx_running)
 		goto out;
 
@@ -977,7 +982,8 @@ static void __dma_rx_complete(void *param)
 	if (dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state) != DMA_COMPLETE)
 		return;
 
-	__dma_rx_do_complete(p);
+	scoped_guard(spinlock, &priv->rx_dma_lock)
+		__dma_rx_do_complete(p);
 	if (priv->throttled)
 		return;
 
@@ -995,6 +1001,8 @@ static void omap_8250_rx_dma_flush(struct uart_8250_port *p)
 	unsigned long		flags;
 	int ret;
 
+	lockdep_assert_held_once(&p->port.lock);
+
 	spin_lock_irqsave(&priv->rx_dma_lock, flags);
 
 	if (!dma->rx_running) {
@@ -1811,8 +1819,10 @@ static int omap8250_runtime_suspend(struct device *dev)
 		}
 	}
 
-	if (up && up->dma && up->dma->rxchan)
+	if (up && up->dma && up->dma->rxchan) {
+		guard(uart_port_lock_irqsave)(&up->port);
 		omap_8250_rx_dma_flush(up);
+	}
 
 	priv->latency = PM_QOS_CPU_LATENCY_DEFAULT_VALUE;
 	schedule_work(&priv->qos_work);

-- 
2.53.0

