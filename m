Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196277;
	b=H1PB77QdHuU3wUxfwYCVrQ6kFEqFjEMC+Lry/eH06A9PgGcHh5UcU/doNYfeNwqukjL2
	 BqB1nRz3Hs+dAxXkhPognQC5Ur0/VolahU6Zcfo/Sg5St8a1p47TY10Rt1mop3an9OPIq
	 E5+UuSatxNQbi++JpCo3RFsWRE22yvAskWICPvg+QQwhl9JD+H5fPetvDViVafJtZKjy2
	 JQsh7Whhh2zLe5/8EbzMA6XNcnQkksRoG6x5B6UohjvQZT58p4gB2Pdzh7ZH8hwvnOIpH
	 ArG4bOq3t4etBKyif4g4Xd56j1H38uLjiMq36oj9VCU/Scunt6D1vlpcv3I9cwEeSFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
	b=OrOlqNJKC9dXoEvPUHa7HmQbGSHNSrTxI1Ppb5KJorNT/Ggfn3EsTziLc5Yg1l7UdInC
	 X/JGOLCrFjrpMf+o+eBLw6zD+bF8VeVmg1dRt/VkxSxAdlbzyJ69nh7pCgZZyz6ukyUeI
	 uMI9vmQ90CJNQTqY4atQlGbR81DcF2XdXERrwALeXZG/iLA6jWKjIRIsLt33FhwDPWXYT
	 6gyBRD70bzEpQqby4Ni00gdwEZiZv+ig8dShShfiyP82R/JajoMrYjgyKTQPiFkfB+jkW
	 +Esg+kExNJEF0RdQh/JdacNhyuoxC0bsBHEISPi/H1ZkVe4VznpjUntas09RTceCUtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uc80SKOF;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14D6606A33C
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 03:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14D6606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uc80SKOF
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-823e4047037so219405a34.2
        for <imx@lists.linux.dev>; Sun, 08 Nov 2026 19:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196276; x=1794801076; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=uc80SKOFWrNK9zi+re/CrHZ3Jpcv7O2QSppXBlHyoz4u12TX3ACH1xiU60AueRIotW
         olpwpWNrqIWDQ0Z8EoWSWizF6KXg+tq5NKQgKmN5pRBJrlhGktJaG8kPDKR53pRk+Q8s
         ooNnzggz+A2tyVgwieIBqd+bV4Sdfg/JYa3rLQ4Y5cEIikPPopaEoR7YxMtBvHmDHKkl
         oJN1yT2r/LZdDWMyBbxc3pIjGPnF73W9DORQKRpnphOP6WToS86cr9ldy5q/Z9T8mbWW
         3LlwhNL3IOUuJFpLpztVNNxXU0JtqcQ7mrnIPMVilV6akPdTfJTXfGh/G7Eg67lom7dz
         MiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196276; x=1794801076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=HvOMinL2F7uHmqzLGi+P+4NZnemgFo75u1l6iLxmHUsQOkaF3kPpf2w7MAnepRsdSJ
         31M3FH1uLXUxJi+1QICQknMw9CWgC6BsD34CdukkUYGLMxI2Lf4EHd/M+GyPRYOrdI+z
         mJec6AePvc8Rc1hlmB2XFTQXdd6TDT2Yp9ZJIiM3qxNwBJvla1vulxWgcNF9moVLWls0
         ocE2l6ah/SyvBMLFxjH49zTHisChnSi0NvxKpnBU5wS7RaNrxAExqPwfBhQZ4rQcxv3B
         sA4+zOvMy1xOpKsHiA+D82yFI4WqiFZK65fpuR80nEeMyTR9/J8MRDHT/FXkZV48NxCV
         vsfw==
X-Forwarded-Encrypted: i=1; AL+hErH+rX/WVDWasjJYm5VmACRBA/KoyHIitXtJ68OzCvYSsRAN8j8nJ355TG/70pEezMn9qNA=@lists.linux.dev
X-Gm-Message-State: APuU4Z+DyBdRAaexT1B21hgXV3hlUuBH4o3JJnWCtcg2fH+Bh7e4l4h5
	P8bn8guh4le8fzqchnGnb/kRXl2afaAb21UVNQi+00L/+plUf/4kHO5c
X-Gm-Gg: AYBFou21+bJuwWNCI//bmdr7NilpYb2ENawIDxI6JY3w4JL7BeNq8L1qPYqOeuzZWq4
	BotG+wfNWSSsp0Wj1JIFQoHOq48JbYFuV0j/SH337I9isKh//6/vc54oPmBdamquSiN7U+xlXIv
	QcG98oZzBnRThTcAXPIjgf1B6ETC517vzQV+6Tp6b7u9Eg+n80rjnDOAx5tUW5Y7oLyYIYeiZT2
	kF1u6wRotaZLeKe3dFCI35S0cZrMtWDS4HOzRE4PzQ63qjOFoIGiksZRVMoc4nqPChT1ffF0WSd
	QARi/tuV+nbXy0ZUPPuDl/xJJUc6wbN25lTVVdkMRT2TlxvTxek4fVlgIr56KZYSSaFdiqmgjhP
	f6+L3y3bEMpUtGvf8muCt3gGPDeR72VyDuyR+ktEvNVKUxBlkzHz7ZT5RyC7GrQqEkZZJb7FYb6
	Vw4DBswpoxBskrhjcS3wROoN1pMThahyxrV2ngpK67OIoMz+YCglxel5A87QNF/UQJu1fy1NpHo
	SUST8FfNzHWli0LXzCNLctMhxRUVz6C6Iff9AonUcbkTqK/t8BffrpHJWCkExBikAZ6GPgqX7W0
	Y0p1DC0AGS08uEevlcfLtWB9r1YO2fk5Am3PGQlUh1XEA911dpMaVUoDKvespGGGhC5TDt70uZh
	iN8bmVDfrqic7d0MLBW2ohwMjY6IvvX/mRF4HtCzR7D2++aSyr2cW2IM9Z/qM5KP5f3JYZn2oNv
	PwjY788DvMm8PGOd46G4EnTU7KbE7PVu89EnhIbyoLpiwkhJxgpUUT
X-Received: by 2002:a05:6830:2b2c:b0:821:c75e:5309 with SMTP id 46e09a7af769-85f506ac2damr2072062a34.7.1794196275699;
        Sun, 08 Nov 2026 19:51:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fad32cdsm2800428a34.6.2026.11.08.19.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:51:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 20:50:12 -0700
Subject: [PATCH v10 3/8] serial: 8250_omap: serialize RX DMA completion and
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
Message-Id: <20261108-submit-serial-8250-dma-cancel-v1-v10-3-e6227ddb95b1@gmail.com>
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

