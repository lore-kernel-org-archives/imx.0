Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283240;
	b=P7GFS9yV4Ku8PCYmusiADeLGwmyzyUasCxL8elZvfzqQB8ZSZRbZPDONir90ziYjmarA
	 70uSiOpNWWcjpNoomlFvs/sPHB3IXBt4w4aAzads4NnqVE7K4PUzsU4lz5zrZ+SKXlJ+p
	 IqN/D8cZC0Jysx/VUyzB3FbRZbx4xZxTaLlqHRGox7xbRmARI8dSVZtyU48Ick9xDDaql
	 4weVTIOsfUVB8xJGWCd8vozGG+Nb9su/1q2urzHnbgwo9raiCvv+lAmX1+W0xKBvXBCPX
	 nmyqVnYqc0xHp3O3zG5VLWi0fdP0niBJQyIPXTYn9LiwQIYUh+Av2+/xQAMz4M9evRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
	b=gqCYNLnnvqiePIl0a/pEEla+DDvjgR221YtyW+CtwSoP4ou4iTskwgGiC2RRuQcEtTCM
	 SZtXJI525GNzvYSeLHFlTtsnLkA81yQDebB/JicFubzRW/8E0h/GfEpOi588gLQ1jyVmz
	 a06DV89KH1F7kZirnCMjVX+ax6nziPLvwCInGVEtGSE3PP/mneBMnf9gkdiEOeHjPfoUn
	 MIxHkhYOgMdgj8wbozsxqrYiDQ8WsfRp4ifFJQWbCNfRVT3J9q+p4ZCrSa6UP6J9qY4lI
	 /AcqQe5iwrkBbylXn+YLcmOQoRxHN4JnO/81E6tzQiCPTaysxgcddfJ8Ev9aR5hunfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZspQRgk3;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5124B60A2618
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 04:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5124B60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZspQRgk3
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-85ac281604dso917913a34.0
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 20:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794283238; x=1794888038; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=ZspQRgk3LbF25jJP2WNoJrmkr7AAwslJLIQNhPOrayIAw8h4Cmq1QV2Sipe/ZyzI/j
         szEHwjGuKCYZX2024lTnzGu2hCiSOhngSBKlOmZzti8bX7lBIB+0VQ+JZlereYJ45qXy
         pvL4yFNmRtp7t995U9aGa0llm4ez6tYObJKMgi2d4mFqH5lfwXP+M3yFqDsi0UCoLBYG
         KSogRIXjdnCJQm6ozTPFfKtNm3QZd0GopTQ1B/H+kVQgwlRHkEJ3EMd0qxYM9QpeWIHG
         bJ4QBGKWugMvZq0jUFHrOBhwu+mUq83IwbuH3ufH1ZYzpynCL//Y8svsqV8N1SdYRK6j
         r6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283238; x=1794888038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RLeox9UCna+JAgQJPZ2ik+qyzedm8mitCUwWv3Rb40k=;
        b=OwqeZHdM15Y3jXtTy2c4qkf0GjCY11Gw05MoMX29o0BsMAqTr/QzXslCBnqRUbndbs
         bmTkKLjCJjXYfuVFOhH0E2dMdm0fOC0+QDYUeLMmlnQ/HDc1j9A7VIPpIHevfC3Px24V
         vUZlF7zZPX7kNVZpJ7C/FVUi/ljX1820lbR5Cyf5aWq50kt4aVyN8daJaYPcQH/wmNzg
         DaFWANnKQ8O9RoxR11QkFOrONGS1UQ88biHbJ92Chr/kGabrKh9PdXgGY4o0fuCaBMHE
         b/+T0LglunYwf77D/h/o4eQ8fCw6JeTBHq/Lkh3rQ4CKvTah5oTWMVoL0yAVl3+lkSRz
         LEDw==
X-Forwarded-Encrypted: i=1; AL+hErHIpYJYze71LXPT3kb868VtzPf5QAgOn999sSIugPxO9TA1CofI4nuqvihuMnIKJ83QQiU=@lists.linux.dev
X-Gm-Message-State: APuU4Z+ChFDR8a9BOm5i4GnZ4OTZadU/w5Z1bu45anXWZzBf1TadCK96
	vYrVitJ3Z12dAnjmKiUN4echdjxVZdhcgg6yn1DuEkRt1oNa39qu1KMw
X-Gm-Gg: AYBFou248i8/yi2Rg/TIc/Xi9KDOq+tyfC/JhGE2JoT9x5Y/dMH6eRZzPTy/4snq11A
	pSFWZNXx0wrW7iJ1AdK9yp8XxfZoUkKZl1SauzYzIs16zotCf/bYWkMnvXGZk3zvezsqb+wATpu
	417Z+sIFkm3rpr2Vn6SgSkBKxY46UOUQc66N8An9xquAwEzYf/pQ2/6XtB7zspTYfaTjfkPSZd4
	zDEYt6X8gtHgE7vRpI1xvxbP6EhUftat6Q6mJsjqDJtd9KBwD/S6mTrEQmrVfQKw8uog1DcbYw7
	kduf6H7o8RIh4xdazD/QJqR2/FNMCLWV+li52ArcfmUrQVpY6lluPbaEMeups+cdD+DsZ1w4B7I
	SrazBNzEugs1+MO6cIU2j4wPQBr+Nfyh7qekFwIZ+czCDmwwVOSsvv7EYKzUetyGgHTG1AokOes
	I3P55mye0DQ+lqerUTHqektjA1jRucv48UMxdFXAQHcFg62P3pqENRTKkj48MJzS1Cb2mfFK2jx
	NggFJsdpxA1e0ge9i0DVnCCuGox5+8kHW6zy39R2gt+IWK4s5Ks4LdTnwmyVWtbRgtrx9yPd+q3
	rPatn1iPnjq0tfKV6RJWnQKR28I6gIXxUmn9Oxay0Z/SGA/b8iVeWsqLB+kOstzZPgn8BoKzABW
	3PoVxeHskw66HFlqIVjCL7HFOhn96HQeA/6gE4pKf3PI9SwiVn7rKE601XiTW+C5lpoJ0/8xlPj
	4EfSBrF6nGrEC3v0hwZEt2wIzqyToLymk3Qe2rCBLbbl8YXnilHrY=
X-Received: by 2002:a05:6830:2693:b0:843:cc20:9d03 with SMTP id 46e09a7af769-860dc70cd38mr1124080a34.6.1794283238334;
        Mon, 09 Nov 2026 20:00:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcc1d759sm1028178a34.23.2026.11.09.20.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:00:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 21:00:18 -0700
Subject: [PATCH v11 3/8] serial: 8250_omap: serialize RX DMA completion and
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
Message-Id: <20261109-submit-serial-8250-dma-cancel-v1-v11-3-6364edca63d6@gmail.com>
References: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com>
In-Reply-To: <20261109-submit-serial-8250-dma-cancel-v1-v11-0-6364edca63d6@gmail.com>
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

