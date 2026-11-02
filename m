Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661284;
	b=n7SC3/akjZCSJVuK8Gwa7efHVMdvnVuuKemvdCor9YuBJtgbOwpoShNW8oX07fQ/Fc6g
	 XcIZhlCkxcooOghUlmt3b6+zF66I3KVk53VkztOvkyodJU2676ZBJ1yCMHj57OjV1qEXj
	 ooNU6h0leU2E9Jk8yrDgGsTbVm48tqYsP8RIEukCMVKSKi14XmQnQjLQOfE3F4q6FIEye
	 2VBjd9teWkBJymRPOU5PpfLZpnpDOAa3x5uiAYCsuCs+/46GUyEjlJKJl3oo2jg8yy2Zf
	 yXWpiLc6BlZXpIB8AhRJd39PZrwxr9z+fVLL6SksAdsUszU/8NpVk/zDPSg1DJxMpjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xGWk144TqWPWYAhvtpbLeTIfJgjLiqjAQeYBDnQ9hsE=;
	b=k11Kt7O0DiEc7O9Oov4jtypUL3QiSXHVgx8WDIoKD2CTIHNm0Ygwr73rS2sTMDAe/fy2
	 ogFTbA9UeCba6j/qugInKpRYsDi4/u1iwh4r6+A42JdXuzCfbgGNBo3FVSFYcEEMEQe0t
	 7YyWecg6jomrqg3biPs0kr5mGG1Xld3sU68fCJK5PRRok1nqQY0ZqhfLWqLy7jVo2X2L4
	 +slrJwZ0Pb2GSvMx3lO2Epqz8XfXnih5WCMfWhylH/dMk9GbMVsF14Is4JIcDdjmEnK4N
	 XDd09DVxB8H2hAuIqnX94wfcadtVE1JuJT5SXp/+pLlwlwYwtrUB9A9a5Vw9IkKQ0Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LRRlH5/P";
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1706082BD6
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 23:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C1706082BD6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LRRlH5/P
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6df0b02fe91so97001eaf.0
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 15:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793661283; x=1794266083; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGWk144TqWPWYAhvtpbLeTIfJgjLiqjAQeYBDnQ9hsE=;
        b=LRRlH5/PP269MRhWoHFzoGj0cNfsgAHA+JMcImt1zv0/HzvNMs4VLf98lw6UfghkqG
         CSMzs6cYcLm/BoCx6gmmI3LyAoJr+3x7aBHOVTUZAQ6xkMgcJCcOG1vwIwJuIfdhaa/t
         fkOJhVRpKqVX1Aa92pzthOyhIYw3uFCto9BVX1BAON9XCbQ2m0/9RhyCxx11zUDev0dS
         cWykkAAIaVlQULinjG1Tl1fwLgKvcGvSStTKwyJuwgBthYbsDErZHlBYvhgsbQJfLDHv
         scOTD4k3qzhlv7j0QTG0EYrvTXd14CecAfXAu2jTbT139MyNBlv9e/7Ed2ccB6AYR3lV
         1V1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661283; x=1794266083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xGWk144TqWPWYAhvtpbLeTIfJgjLiqjAQeYBDnQ9hsE=;
        b=od9LLOBVfkJO7uvVyLfQhvRvSZfgAUwUvl6V4PNva5lPxvTGy4AO9he4LkCaRBn30R
         WlA4J6x1YLOp4maZfe83LbJgcluMZCP8tGgL4qmh1h5Y7WjUWpTnKPguwflRFwzZW04u
         slu5h8NznX/tLSWqCIkKsG2tC0XfRFr+K6qk80NyWSqnJVxOsN0XqmSrFiOnndhhVnha
         dPx+WEWZaGj7MexcRZa1N2vDo7aDWfV1hkOQhcMvKSW5kJhKPP0D3zb5bagDaePzteoG
         Ue1mKVCb6X7Qwm9YwY8qhrp8TvluFXf5e/1R5LI8MGkYIhyO9S35c2qx9Rya9Lz+JYJ+
         NWIw==
X-Forwarded-Encrypted: i=1; AKwUvBwyWxkqemDdgE46U6lBSmnm78BTBLvYisuCrw4bUxYjFE2p2aVyBYJy4AhZbXNeanUGmVU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKKsrY4u+/GWXAzJHy+TiZB823bi7V8FfX+O411d7lbkujbwIH2
	M8IHo2J6UmOxtFOvXiid8B3NjN6LzaUcBNTu6wi0o4DBszylC7UnOf/3
X-Gm-Gg: AYBFou343yJyq81i0D9T4NEEG6gc2oPArw+zCSppSTEU7r8r/QZx+T5lmi1Ae2EI4Yo
	azl6yKGwNdNbfekKpsRSy3WOULOn7XEgrHzESbIuZgmz0Wud9zBFaFvaxwJwtxfacqFgxOIpxOO
	MkfYwHJd7hHxikl/VlVvcE3mLOPz2/VMQlv+b66WFOMlOj4tL0j0V6epa8w6plu9COpFx/ZhLAd
	R3R9do6rFvjln/PVRh+VBCWIo2RjNib5E1n320BSD1/dblcSU1gKyQ0zMmLgn+6uQsD0bJ5CMXz
	hptxk+iPnj5Skufndgp93z4mUc8CGkQumgXxBv+PVYmZfxvAX40xD/QwhiHtAnFbSE8SLnOOYqd
	UjkVykNCdvWV06WXhPD41xH/rNkvsWK1Gy+x3iZekQN9Lb7ASlGWn3QaGFcU4r5YxFfr2FBdSVh
	T01OHNkxUhB/GHSSCL/AE0tHrOX2z6ZDs3yS84DG35+DDGU7l7mp7WdsAXJ/kIBqfDqX/tiq6wF
	KNjcfWFpEjU7o2yly9nVMrVZEJOybu87JiT7AZGZpkBocmH6QhUfqgnOWqnF6B4/Gu6JsOW0XUy
	RNIIeruU19nIrFFyidTmwDaAf1p/sMBfRofD2GL/tb0lc4kIl2+kpX6i0jAhkYhPLzNqboW/ZsD
	cRneU9azr6c4if5P1xb96ppBOKVJiPpTlKC4oCATBo7Dxu44H6RSORuziC11Cuh/qj1oK+FODsF
	ICELTfgmWqfzfowu+slffKY32SL3GM1C3LHtiOJ1Xl+jLyKULWcnS+T492a+In++6TPQdd0E35
X-Received: by 2002:a05:6820:571a:20b0:6f5:86e1:b020 with SMTP id 006d021491bc7-714f29fa61amr3266065eaf.26.1793661283331;
        Mon, 02 Nov 2026 15:14:43 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce869asm10134463eaf.4.2026.11.02.15.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:14:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 16:14:31 -0700
Subject: [PATCH v9 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
 shutdown
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
Message-Id: <20261102-submit-serial-8250-dma-cancel-v1-v9-4-9159caade148@gmail.com>
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

disable_irq_nosync() masks the UART interrupt without waiting for a
running handler. That handler can have observed up->dma and continue
using it while shutdown releases the DMA channels and clears the pointer.
Synchronizing the IRQ later in serial core does not protect those accesses.

Publish the DMA shutdown gate under the port lock before the final RX
flush and interrupt masking. Have DMA IRQ handling check the same gate
under the lock, so a queued interrupt cannot restart receive processing
after the final flush.

Drain the UART IRQ outside the port lock before releasing DMA state.
The lock excludes competing RX processing during the flush, while
disable_irq() also waits for a handler that observed up->dma before
acquiring the lock.

Fixes: fef4f600319e ("serial: 8250: omap: Fix life cycle issues for interrupt handlers")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 322403cec2de..fc1a83d6fa7c 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -771,10 +771,6 @@ static void omap_8250_shutdown(struct uart_port *port)
 	guard(serial8250_rpm)(up);
 
 	flush_work(&priv->qos_work);
-	if (up->dma) {
-		guard(uart_port_lock_irq)(port);
-		omap_8250_rx_dma_flush(up);
-	}
 
 	serial_out(up, UART_OMAP_WER, 0);
 	if (priv->habit & UART_HAS_EFR2)
@@ -782,13 +778,16 @@ static void omap_8250_shutdown(struct uart_port *port)
 
 	/* Synchronize UART_IER access against the console. */
 	scoped_guard(uart_port_lock_irq, port) {
-		if (up->dma)
+		if (up->dma) {
 			up->dma->shutting_down = true;
+			omap_8250_rx_dma_flush(up);
+		}
 		up->ier = 0;
 		serial_out(up, UART_IER, 0);
 	}
 
-	disable_irq_nosync(port->irq);
+	/* An in-flight handler may still be using up->dma. */
+	disable_irq(port->irq);
 
 	serial8250_release_dma(up);
 	up->dma = NULL;
@@ -1330,6 +1329,11 @@ static int omap_8250_dma_handle_irq(struct uart_port *port)
 
 	uart_port_lock(port);
 
+	if (up->dma->shutting_down) {
+		uart_port_unlock(port);
+		return IRQ_HANDLED;
+	}
+
 	status = serial_port_in(port, UART_LSR);
 
 	if ((iir & 0x3f) != UART_IIR_THRI) {

-- 
2.53.0

