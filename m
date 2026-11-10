Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283236;
	b=ozPfTNL1rB3LKXp1lZ8Wz03iQFkwo26BR/kKO8WPt7qjBiA+FnDrO2jvFWvf1U1SfEYp
	 +QNodw1bk4DuN7pMotmoEgc8+Mopj6uDrTBfqjhXTBkRKU3o6igu+htxKAjLYCWAYFzf1
	 O4tqdG+UazHhhoNW3u945cnGRkkwbFLLnezaWd3Z2nQOwh6AykWyUHoUBeJqD8i59GlMp
	 K64VYdfHeVYcv6KDQGHLJS7cuNVOj6l+q00k2oHYI0xYzf3zuPHTQZzrDIDxRm5aMk4OI
	 Vt2QNy0P8YblJXpRZY3RGDmOsWYtQ5cAmyqiVA6v5umuf8Yb7ydMXTdBw36OFeTV6Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
	b=a2iLgbrtL8uIi6QeZttorJYUet5XEQcUI0EyBgCv7C1f+UpqPTBCOvXK7KxNRtBdgOy1
	 63UxuqtwR1HQfV2mT0i9oMkNw9IQy8/hP1HyON/4AohocBl9fEY6+/CPtQXgpZgQwejHp
	 eLPceZQ/UqBxgjRhaUHx79U+aKlVWPsI8pzuRRqzXQyoXkV+l2mdE8HAbfu7NivCbBPPB
	 M9TbyNXtjXcqOi+XeVwjIV1M2XBB4x55dT2IJlszBqusYAyjyIAt6uOoLykmLMbBDjXXF
	 vtFovYCo52iTzKZlQfjsqPUDwpr5V8/sUn5Xgp9dhMM7TVyp5LLFm3DEs00a3B/fk6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1jtn2Lm;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C63606A334
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 04:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51C63606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r1jtn2Lm
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8470d7d430fso863700a34.3
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 20:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794283235; x=1794888035; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=r1jtn2Lmr0mhNtpiCq+NHhwey+EbpYhbe0tm+Y3BByOW6jwrmWervL/fsy9MqyxHOY
         rNX40rR+38ExLXp8Rvpo8vsb3a4LSH55CAgquchZcgHv6QKf33T2zOoSct2q+DNXYKpe
         0FIXKo2acla8NRY+BFDHEZ5mEqQdq4ScE4Xkmt8By9lqXhD32oJgNouT2LkjwFsFPXFF
         0fcPpkH37JHMNpepunw27ZodzP/F4nLH6soZB/ET4KuRPt87Av0MzRnTE1x0Ux1RrXia
         UJ7SFGrcAsghyFLedcbMDmMfRDr3wxfaGRdXEW+sHToMM0wAufTB3jtxzf9O3mJm41v2
         LeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283235; x=1794888035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=qZr0cf4HAccGVhFXCRIeByBrgYBtV7PCt3Fgh12c5v0hmgaQFv26B6s//9A2f3f/Tm
         YM97I7LUvccxzrh0yx8yQvjPbMm9R0PUYMWN2nDiK+69jwSmKryCNJvNw0x24Q5hpBS+
         caTFn8PQQemigTV3QerS7W6m40DuB8aEWKLIyfK6TboVvQj9/NqN18DfKrFOjEftNXHc
         17PFEtE81b5eZxm4ZThRE90A5eNaTe23sHti0cz2rT2JvOLsMHEGHL8iVjdD2BYVnvCe
         gCoKKdbD9Qp/jNlRTHqiWnzoQuPxt/DA+UHltjWyYU/ZkIMCZ7FQ+Z1UGph7sIHFC+yy
         dc8g==
X-Forwarded-Encrypted: i=1; AL+hErGHAIQW+i31uCJGcCgucic4Mw0jbaCR+cQx+ugwDyJNkUIM+u6FPig9I5IugBEo4AqD3Iw=@lists.linux.dev
X-Gm-Message-State: APuU4Z8NlfX2yk0SyEyv2atmUrGDEDKe5Oyb22eZVbBq64nSNw358jtn
	gDgBlHxU4WStmMnZ0Ot8fj8F2t/f8PVFrwWSdDZzWvwbh0qBrVCzKrKl
X-Gm-Gg: AYBFou00RUgA+jQr23B322B1DjC5k8mk4qUoDBulgNt25EzBNP23EK6nxqFyJ77W7Dd
	nY/ZVW4xSUv7akLOB+UokzXE8BYxdfx3s5qxi8Jbj+J5/PIAEpzyd/vl5jCgh3nK5krezAIn8kX
	ajL8NXNaLzTiKYH/VrRmj2TY88nqx07BM6vLCH+FyeWr4nJ6vRySCaJGU5AGXPy8T9/LxwS42zd
	75t5lxDkxqFb2Pj9FuHm7vn5mZ0md/QSqiTdFgDTZ5LJqeDsizsIVBK1KYxPDLV0lvelA6+uGuM
	SZyV7cNTB6j+i/RL6pKAjk8oBip2DHPJ53+epQx1jBuxjKvpc10UnuFyyMlC3IqKaylDcwp4hAA
	MFaOzf8KG7Ok7Bgm+/bICPhsxE7DIpB4n5OCkEFlwMD137a+EMXvgsp0mBfztSMgVlv3NNAb5nK
	oN20rlEe5vdx44X4Ogk4rdgJ3PWg3+pH5HgDzjb4PpY8se0EaiFUyUZfPCg4zt7rjt7TWSAfOLR
	Wk1c4nbjR2AFDNg3SpRlViZ/lXv/hYcPqBwQAW4KbDRiSygbNgur6BnqX1ZxHFLHBjYw3g3j9KD
	PsO3zU0EHoYPbX6Q/LWCXImFCpODDx93iB5bX8IhxrelZpFMwQYp5/4tVJKZVJUFOpOZSQzh8Qz
	kK2SwhqZ9XCy81N96KijISXJJ13gFOhanaj/eU+OlpPUhCxrKt7OGVc2YSR+WUr0rAj+uMys3FD
	tGf/dYjeRMLtMuV7HVFlnjk4B/ASU0fA6Lr+kRCk/a1EXdZDBGaqBti+QMXVPW3fKizo8CPdLj
X-Received: by 2002:a05:6830:906:b0:844:4959:e856 with SMTP id 46e09a7af769-860dc7c3282mr1426887a34.11.1794283235287;
        Mon, 09 Nov 2026 20:00:35 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcc1d759sm1028178a34.23.2026.11.09.20.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:00:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 21:00:16 -0700
Subject: [PATCH v11 1/8] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261109-submit-serial-8250-dma-cancel-v1-v11-1-6364edca63d6@gmail.com>
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

Separate the port-locked completion processing from the DMA callback
wrapper. Keep the shutdown check and locking in the callback, and retain
the existing FIFO accounting, delayed register restore and THRI handling
in the helper.

Reviewed-by: Raul E Rangel <rrangel@chromium.org>
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

