Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661283;
	b=lo0alhO70TAJ566AepZ7RviNXmlMzArBa+do8XDtwrYYtuZVTOak9xzG7WN5WF4RIGFz
	 b68GXGaDWkDsqyAgTFRCWe8Si1SWoKM37eFyY8LzPXKdYF4Ewh5JTsEB++ONtegwKGXlN
	 e2F1CVC7RTifrFDga4NMFF2O7+O+AedefNito09refHAksrCpjyZPy8wgFSSm3E+Tr3mr
	 dsiz0w+ks87oIGjqFFiRHyPfrHf+2abuwI9na13pyu6Wxb36QYqQv936epn0QNrnJz/tb
	 X+VYBOn08x6XXEKKWHrdjqIfiI2/2480vLnpM9Qg00/9vwOGD5RKUDxZQ5KJeASHYKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=A54gT3IO9WKmImwah9XNTHPRX08hDBc7sZs/pq9+S4c=;
	b=mdquWPT6JJhHCXQkpRAWMxZHyluDsVORKn+Q7gyG3a+7UZ6i1jcaTikf406MSKdXdBta
	 PuojVCuqYgt1bf9NptR5C2eE/9j4990ycv4RBJEN+Gobn/WCwnbVXytV/u3gFx4Ja4qvr
	 REwY4sMK2y2bPDq1V434ZP3gtokpSDl4OdXC11VQlxLjk+zRKQJV74tt6+5Y1bvvBB2my
	 dFJlmMYIlzKr4mpIlXpRCKTlkt3I4UEup7BMcD2hyv/kjug06xZ2+dZ/2sS9YjdRynXnp
	 XtWhk/xiHF0AWhkrgwfw9+iRBzTYyVRT5FliLzLWI8iwsKD5TfCvOs2ct5q3t4XxLOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NxmowUBx;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BBA606A326
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 23:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0BBA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NxmowUBx
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f48c750afcso2263795a34.0
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 15:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793661282; x=1794266082; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A54gT3IO9WKmImwah9XNTHPRX08hDBc7sZs/pq9+S4c=;
        b=NxmowUBxvPvRfvjKKc+d5B7g4r1/5oSYj2Y5KZOErfCoJ+cTeBiWHv2tcJw9xQ5GuZ
         +VdZyO0ENjAISOqidkj0Sobc+oK4VmOCyZ5AEw1GrSoYfgZj7ByMDnoSWzVQHD1pE/oA
         bl/E+qQJmHpMeD7Iwj/PILTnLdSlhuApjSXuRYGArWx8mgFt/7zkhjhTNnVXn/1eTcH5
         16cYD2HBV6Zu7VXCqJ0DTEgi25C8l1f13Tdp2SSGPnRw8kMhCY3Tm+1TTWqxDDIXPlYi
         ryD+1YgtmtL2aGLvitjN5Y+LuenaJdA/gBqt9OvOMGGzPkf5R8bU3E3X1/2nVIMRtOnh
         8vbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661282; x=1794266082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A54gT3IO9WKmImwah9XNTHPRX08hDBc7sZs/pq9+S4c=;
        b=dm13AZlGFz1EvL0Oy024HcGznlY6RIGjVRGuaxeX6gDZ8FHE0c4WPWs5V4QZ0H6Qx8
         cHOW2tYfA3mOJxzJYkAQRPtuzLHGXHcmMZVIqFv2kIi6pbVV+KTe9ibI60gA6/oOj5WP
         3hHtGRIfT2jnKeMKO+QaxRgT1ZJiEJIze1BoR+mTIr4EhyU9+NoRrAv5COLFx2kQQ1Wx
         8/wQG1q99IeYEkNqToSbpBLkxsvkv2n06CzOxTHthV0GtOnaMouaQOWUR57EGG7JrNiK
         ft2RVoYIiHRFwJe1ZVo2vHn8zfHJl5OwQTQDlSZAMmaahq5umzmYbnSxN+Np0LaoAe6P
         yL6Q==
X-Forwarded-Encrypted: i=1; AKwUvBw19fhCNRgI84ECzeOGD5DDEHFeqGqtmpJsiTb2V72K4H3EhcmNWiKz5JeIiccg1MC7ZWE=@lists.linux.dev
X-Gm-Message-State: AFq9FYJa8JYMiFdwafEKnGdLY3Czf7NPf8Iuqn3tjEKBwjw+pXQkWYnN
	lI6HAxgFuZeDFxpAhgZVcjhLnvJz2IeYMJ06Uq8SSD7Ev0ky9NAap54u
X-Gm-Gg: AYBFou0iSTnFGkWrmC+zSIE8XhhxyGMDkaHC4piOeYjL2Sq3PFSreL5aLvCUfUnrIuP
	Gv70sDg7Nsn63Vy0DBHs3s1/K2wwssEi0iwgv4JxfA+3yeUqjHzyWkDGTYlnu4rUHj6KmUOOvFh
	gZUvM2J+qudZK9lUtSb5UquMUyWI0+r7b1BTa36AfimqG7laeFb/nAvY1dMh244NSGm297iy7Lq
	LiU+lqKcRhTlQuR+uldzsUKL4CZyxuMGIDpmbFEF9t+oKBn8gmepV86OFdnJ+WiPIZ/YAF7BssC
	SnGEFTBjW5EWao0yurpfsiad8IUx4ZvfTSRbOxiDuxZr58V5Pis0HpNtBRZudSnWM2old6hVlZF
	boBhah2+/j3LuP1JL0KaFyCP7TFA/9o/KvR99/I2kpdfqrO9BqwyRdAhlLAHXEC/jLJdIr9AQsV
	RLx2wm1v03LFG9lo9LU5woclgYNhB9hxCmSOy/7Vpgs2uIeXHanqMDVK0m03M70WjEjI1Vr/v/3
	JhKRkUBqQzG/EOB2YSv4ygugTRTtEgOBb0dDAbLm+hzG7NMWXO0F0FZY89kUZ/UvhZJ2oNA4toK
	OwJVL2Vf8vbwyMA5KM37SxfXhyr++/gWJ73vnVofXsjKDbYtK152txe8c3A9RYL6nksGfKv9bVf
	EW/v74umQcVau58Sal7W1Sk2QpWNjIeEce/CKuAR/Gmg039tsLtFUPc+pOfWrFjt1mWVphR+lRG
	pqO0NymZEtqiPc6HfVTl31c3Gs1yWU8NHMn5pMm3wcPYPcbJr0G4w=
X-Received: by 2002:a05:6820:5717:20b0:6d8:57bf:57bf with SMTP id 006d021491bc7-714f2381e69mr4446915eaf.21.1793661281665;
        Mon, 02 Nov 2026 15:14:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce869asm10134463eaf.4.2026.11.02.15.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:14:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 16:14:30 -0700
Subject: [PATCH v9 3/8] serial: 8250_omap: serialize RX DMA completion and
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
Message-Id: <20261102-submit-serial-8250-dma-cancel-v1-v9-3-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
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
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index b6f108d34854..322403cec2de 100644
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
+/* Must be called with the port lock and priv->rx_dma_lock held. */
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

