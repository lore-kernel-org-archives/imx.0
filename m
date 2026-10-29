Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259468;
	b=vSoiYdWkOlMqbOrX1a7rFBAfuZ1WjzcONSGFUQ3kkSAadc1slZF5CYvFOvq+FTIWzZmh
	 gFYMLHHXhlivrH4nbD9ojQVU56qnrzZyIDOTlw7lyzzRWt+PRlp9lKTjQ5wy5pG/c2pah
	 YZN8+wRcbeeMNir5rFz4eRnF/R7WZBb1ly5a5eESyYd53l1lq8pwCcjZECp7/Ul8/qtB1
	 EjKJt/u1WUN8RiCfmkbYoFodsImw3hoWy3EdWxkS7Mz6fvjI/HUcK4n/u8Cr1MAs/oGOD
	 6ABMTacSZtZgg7qE9TNuuGlmBHUhoj/8rL2J4iu5ZxKm0Udqhy7jvfIM3Wfmhu2iUMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
	b=wmNPkLfldbXc3i6/5A/EXMgJ6WEWLxtWiMDRt/fvl4R+9dVZiN1wxKUcm/glIST+zkqo
	 JXQJWfT/VbwpiMsHX7FvAcHreDIZi89SvZyAEOFmUe2XBNrJ6d4rCN1JtZw+p1ZEIk4W9
	 y7jLoigd7zr9cK7Z/YUKAIpHK1HLhbygcvKVbbnnlDfMS3cR7Mksze3F4XoeZt6H6j+Nn
	 dP+2Ds/OqetzOM+4Nk+WVs+xqhCHXdy/T6SOITymcDrA0LwvhKrC/MdmThtIGaCrIi8fQ
	 EDkVWC2j/NytJAOyYbMCczdq6i1zPlIN2slrqQe+hJG1uHAg5k5gqMPh7N4Z8WZi9tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hpfsBorx;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B266606A325
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 07:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B266606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hpfsBorx
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8451a619da7so1252512a34.1
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 00:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793259466; x=1793864266; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=hpfsBorxgym4GARNuKqHUy2xT2PoiC77dNwGf82/AA55OLTt0v5avfRHW0wVsKYScX
         a55b+/iWSHSc1W5VPTy+sXR9Y1ER8tHUr2KlyM0Z+8lFeXutHXg/BNgPuD6I2FzAmQnq
         /yx/pIYfPj865m41M0C6h/ynxyuRgoOQccv7iYQwj+KiHTu6jHbnoDdI1ePiIEvqyK3f
         TjqFId8LO00gOPGqGZlTAU96P9l29uapn8Rk6C4BgV1C7S/kboN6VsWkQevfhP5d+mt2
         tI9ffv1dBoZMZCYw3493aefSw2dP3nFzV5KRlbg2d7lguB3LYeeCFxD1HFix4bBBIJcT
         a2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793259466; x=1793864266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=ngaN/KuP8t8ZLJgTrqYUw/vhsRDKoOjaPizmxSj9hMsZCKrUhN2Qyr0Em+RhTrH04y
         q4wUFwmfmMpfPGw0GqqSHxr+ZzMCZL7dCC1MjvsUdx9CuAecULmrpAPFQLB9+FWMKmlL
         7TnxH94dJmd1WAAsSBL0tP9bUhUc/88LoWiiUYk3QPHsDEZBbtHUyqtFhKAwfYuPQBoZ
         wz4npbH9GYjb0qr0pgpKqmDBJt36VURgQe0wxAMBMSxdVAw69AaETnGTS8FElqQxsuGX
         /wtXXy+1aGdYv5canH2OHs33tPL/ZFXDgb0nKO887GODnyQBKHVQWqwzSJYy2jcNY999
         SdfA==
X-Forwarded-Encrypted: i=1; AKwUvBwb150JEqTzdkuto/YRR6cYJJDSL3ZVlnQwUAkfv4UDcgfxfDCPohlVuRdcbc7wp5Z5hZs=@lists.linux.dev
X-Gm-Message-State: AFq9FYLQSBaaAV+47taZE2PI6KZqE3fNd3oapj2E7zxErLk0pPhtUqr2
	ddBUHaVUfrwEO1XfHAfE3QdykRkN96IRUOMncPeEeeakSgZzem9xMb+/fwcroR/H
X-Gm-Gg: AYBFou3Z2oyrXZXgqr5SBw2Hqy33yOXx7ljAMir1OBzoF8ipawdXO3D+wOoLmEq0HAx
	K7xubo8DmA0Q9vVAP5g26VI19w2M06MLPCZZDmrBeX16SEyYuNd5k5sMsDqZD6qOvpscJxWp+Sl
	9XlRF2C1ADfxhB8yDdzJuLdfx//uzL13ru+Aa/UMwOEDSsB7Gj6CO5EU0epqlZL2uJ9IJ5Dl0F7
	NWIF3HxgugepT4jGh295z5llhElzGb7aZcrFFlveycWiHwvzuFoHD+Xl97Vw+JOXW3N+DArQr59
	GP/EVlFwHWFDpyhkMd4ohVYa6GQOSixbFfjbtN+QyUBp7dchK9xI16MPgrRQe6OeEiUWS1GeW/x
	YAX1rwVnPXiLTgVBFQjjacJ8oTUWSCE9DTT3WZQyeVfLjILWrIvstzllyhdt9E9UdJMBKKsSm1E
	sX6qTZnr579o+Ht5QraeaJxa6v7rY86EZXXyNk1BY1LEgIpatIctrNCSudak4CmVSd+Tc3pwS0o
	s85ddFBr32zmiubXqdkgbTJ+Uw5ZK8mzej7IjaO9g8YU61DDRE37VpE1Upry/Wxk2AsxHY99Ci9
	CUg+SuwPgT8ZmryFydRN5HR4X9MEQ2uLYvrWnkF6xTqLBt0rxqV8lNpSS8hMqJvbh2QUHpdHGDJ
	iFZIt7c/KeWq/mibIgdFVG3PBIQlewUfvIIBuiESLmznkLzV9LkEckIe8woxI0hQgtIbNQy4PUr
	2A0wTnhQCj7Lr6v3N5fTHzIFxCE2RDWOLsG5D7pyj8MwlxSveSHpm0faqh3wxWPtIgeJQIlMoua
	g==
X-Received: by 2002:a05:6808:508a:b0:4d5:295c:a831 with SMTP id 5614622812f47-56384191e36mr3343729b6e.62.1793259466485;
        Thu, 29 Oct 2026 00:37:46 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c3638604sm3321976b6e.1.2026.10.29.00.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:37:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 01:36:57 -0600
Subject: [PATCH v8 1/6] serial: 8250_omap: separate locked TX DMA
 completion processing
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
Message-Id: <20261029-submit-serial-8250-dma-cancel-v1-v8-1-3fd56ba352ed@gmail.com>
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

Separate the port-locked completion processing from the DMA callback
wrapper. Keep the shutdown check and locking in the callback, and retain
the existing FIFO accounting, delayed register restore and THRI handling
in the helper.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 4805b644ccb1..b6f108d34854 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -1080,18 +1080,13 @@ static int omap_8250_rx_dma(struct uart_8250_port *p)
 
 static int omap_8250_tx_dma(struct uart_8250_port *p);
 
-static void omap_8250_dma_tx_complete(void *param)
+static void omap_8250_tx_dma_complete(struct uart_8250_port *p)
 {
-	struct uart_8250_port	*p = param;
 	struct uart_8250_dma	*dma = p->dma;
 	struct tty_port		*tport = &p->port.state->port;
 	bool			en_thri = false;
 	struct omap8250_priv	*priv = p->port.private_data;
 
-	guard(uart_port_lock_irqsave)(&p->port);
-	if (dma->shutting_down)
-		return;
-
 	dma_sync_single_for_cpu(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 				UART_XMIT_SIZE, DMA_TO_DEVICE);
 
@@ -1123,6 +1118,18 @@ static void omap_8250_dma_tx_complete(void *param)
 	}
 }
 
+static void omap_8250_dma_tx_complete(void *param)
+{
+	struct uart_8250_port *p = param;
+	struct uart_8250_dma *dma = p->dma;
+
+	guard(uart_port_lock_irqsave)(&p->port);
+
+	if (dma->shutting_down)
+		return;
+	omap_8250_tx_dma_complete(p);
+}
+
 static int omap_8250_tx_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma		*dma = p->dma;

-- 
2.53.0

