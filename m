Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435399;
	b=DVLvcIBOcwpe6zQuZMyRWuGhDnTn64+CQJyv35RpX7051c6b5COixWe3mtwDeFnXTPk4
	 rD2K97GNH5CIwGo8wJ160kJ+CF0cO9n5jaewMYb0RU3dxIIBrTL2LWF9rrcWF3GjpOPF8
	 YE8H62tiY/mRrI38K4SRqdi93slyPoEpjjbGvtHiwhX5lvU3nHLXJ76VLVQQ8SrnR+4mx
	 MR5PbWZzBnUVQk8jq6nr6QPyfD8N/zrfGE8Jy8N8kLTeepPF+DCfKw8i5ooU66sDxYfBO
	 pqCB6TSbafFQsGTvhdXUOyPVD8vD8I2SZoPJu16Ewsys4jfjprOkBo8ABTv57XT5z7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
	b=jtf6TAZA7+CrdBr7Q95DWRDGl/86ny+gIIZmSB5HdrbBAT97Qhb63Ch0QayhZZILo7Kc
	 YzsZZzJ3EMjm8kx+w3FaKDSQwBj+fDwHEJ3knl8f3OfPtmhHhq3/egUhhBdlwb10yBbYz
	 xY1Ije6t8l25pOh0aQtgasEp8N54YVR4fm+vDsxGgmAkqbySkd3WoF+ry4kivZpzNLPpi
	 W3tzYL34N+x6n2O8DEiBtlM5exDryC4xsHoBlgV+Y92peyz9Nz66Y8BMs3+Yx23hsp6WM
	 HLFm2kzG6Cpb+FFpk4swnoLJnccNzVLs+go02sWZjR7EOe4ZrlI5zQu8gtbdhlHw0pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcaVwGNy;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEADB606A891
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 22:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEADB606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcaVwGNy
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-53dda625f63so2364250b6e.1
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 14:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435398; x=1795040198; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=PcaVwGNy7cLQjMlUrkfgHd/MWTb2sruZ0BGcNVjWlNmzfBckaiWzYKcqWLyd++byQm
         8Z0Qe+7NjPm8G/g4eL84aIKiKu3U8HN84zkNaNJj95QVy2ep1BzHho/wxDZ/6nSTp70P
         HzJZ3ugXBijH0ByFi4AXpvHZ6bxjenIr/fosb0FDxf6KihHbGvxRLzIhY/adPd3aOBlm
         sYmLfpxxfhUCDlr3kuRYaGWohLDOM+njS9eFYAJNScUJrS64+h8GPD8O+CqUVwHarAK5
         1OIkonm0Msiw4Va+5cdffRl1s/9w78WafwJEbK2i9hiZP0hoipGrewvBPjBt7CA5KdeK
         sZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435398; x=1795040198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=wkpQ1ShbM722SF6Ov7rPk3gXTNjalrFsEfgBTIXHsBqzJqfAs8Ben8F8GbQG4kBlOe
         MwIsRXf+ih0QlJ1V1/JZBp78SwGzWVTtvu8TAjiR5dX+yyU9CRCqOZ+xR1Rg1Jt1hP6+
         Z3vGG7UZYuxwXSyrknfuKxPrY91vBCQSjDEEPhciltsOOtuKXCBW+hargq9wPp712gIJ
         uksfvG0hJt45tgL+fG+Zkj0eYQ2kAXrl+BCJNMq12KsWOgvGwF7jTOsZ2soBm7dQp+vl
         uSVgNcDK8OpahuPpkUaHsXflh3Ws/7xpd5EsvcaxYKzkyWCschJ4cTQuMy7bjwzaXXa0
         H36g==
X-Forwarded-Encrypted: i=1; AL+hErEE4h8RLth8Fho5PWzPXGAIKl+S8MiJ2gmpiuJ1iOcboA2kIkiPRSPbs/jCBF0t0bCayyU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9LVa9muD66RiYBBMFrnCOTbT5bgCdPR9AnbFQ1zeLxRjfR6yZh
	aveN5WRTolMIOSarGklOAgTtTC4LbQYV2s+ynYDxGh4yxszsGfnHFKFT
X-Gm-Gg: AYBFou3Z3uv+IpJJV/DjEfN287Nu/l+UCIBOqfZWNY3AIzAFrhKlKq9/XwGIS8XemvR
	dfp5TGhNHnOXOCxIMcaoTEEVlWb0aG30CiI71G+1tt7hKxkId7Y0+QP/+pUljIHHg8l/xDWORHm
	a+3t98+tJMGATu3gSCwFkzioWedENFb87P4M7MmjJ9Y4kNEsnFcofFGQl5yzA3kNu8l3b4VtXcF
	rk1sCQvyOucN/ycVWKYD2UzJcd3efXUQ2LSc85qantzPCLNi7oNMu0qQOn8A+1bawl6TCEUrIDW
	Rbd4dXgz5hRKxN/AoJ2nSU7Fm7lnUuzSePbjazdiqHc71vMCuzbW4XYnr/FN6uGzTRW+lOthzYs
	US49NZZ6jSxLvYuYE6vbpx0WIWsieVZhMuhWp6o46ioF6fYQFMiVBH6UnS0qS+4hcM/OvzF1Ghp
	vUhDKUqpP/4JJkfdXz6p18jwb+AJLmE7b+Dr2my7mpfIDeDbKvh0khpgGWjfbDg+RaJvWC8Kpo/
	CxkKQq20kF0uOhQcQCN3tFM98BaHqor/Lvy6dWwECcTV0Cs/W3bKAUgiuT08lih2734FaEQyqTC
	eEVpyWo7tUtpS6PkqHbnpAKsmNupnVeIWMFXunF7glNh6QGuOSNDGWMJP7+Ns7nOVZPxpYSU9aF
	p5fosBquqhEh9slQVYgEXEDv4K9tEdH4UuZ/Oe05xstV1zR9XiPeACw1BFsnTP+BBjDI752/tid
	3ojPEFriVcIX4flZSFD1cNYp2CWo6bFI7G3DaenewNuDbXPV+BEvw=
X-Received: by 2002:a05:6808:1a01:b0:4d6:92d4:c806 with SMTP id 5614622812f47-56b987289b0mr3147119b6e.62.1794435397786;
        Wed, 11 Nov 2026 14:16:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56902ae38ecsm5917498b6e.1.2026.11.11.14.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:16:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 15:16:28 -0700
Subject: [PATCH v12 3/8] serial: 8250_omap: serialize RX DMA completion and
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
Message-Id: <20261111-submit-serial-8250-dma-cancel-v1-v12-3-9e3456bc2555@gmail.com>
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

