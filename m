Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563605;
	b=sQO5onrS/VwzljbayZYKHXYpGMqxqZzp0FPvPk79D239p0sq8AVRjdFY2S4xT4NHWPMY
	 rlOjuKZtMh9A97DpdbJDwFBIdRy30931tPXtf/jX9Zc6HxzcILCaRqoiCUanlUPKViWsn
	 u7c0s5AoD6/oK2FgawEPZ62BPl4r0k4UVPlN88sWTFFr5PMuTiOzXug///ZBiHMw9oB7a
	 UtVSYc31I346WW9UiOEfcXZce2PxhWpFligrL6avM3ja+BWgfmOA1WRO0Tkm7MrtiOgpm
	 AN6goaGP96VfqCdh3CGNpoCfPzPK0PcRDbB8OJSSLivkGRwM/7V0PNAfhBg6Bck7nOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
	b=lrcmUeaM9t68aMCzVZnLbbizuZ4qllPFQMnE8nAIaJtqHbDl4ueBVa0P0ii8oKEmCrqH
	 zl7Tut40/OAikue19B3OdMAmgMvbbT5fmCOp2eStyiTcyLSRl3sLXDRklMymATVfXtT91
	 UQljxwPbWXNBWh8BOFDJc22pYl7BIzL7hNSKTwn/QGNm4FzIQ1fPrRmIiUs9BDDjAZ7bR
	 YNgUj6jIIgHlBmH4ThwABfJX5M5JH+sI7q2QHXKORhhc0HVUE0u+Dr1sSUBkOVtdWZ5cR
	 k4Wfc/zM4p/O7EJ0+BmVr0MDng6wkmG79iqVgV+OqK/bK/ToDmUtAmvJ5vHGwCTeWpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMbK7AWk;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CF8606A321
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 09:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84CF8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMbK7AWk
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-55651e7de9bso831712b6e.0
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 01:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794563604; x=1795168404; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=PMbK7AWk3bxaUdwKusezHlca3JnDzB21gIx/09MNRkaDXfrCdwva+I9v5FsTSCq6wQ
         uH2DI2XaF8diUJ41k4EZAF3lG0vCc8N9y5bd1WDS84apgwdpGN98b5L+j8BpfzAj68SN
         Uj1w4XGyhkMIrJIqHhJgA3jK21inM0kWoLbyiu7FPaXZE4A8xOhKtNU1HSP94KwjHIpt
         VwNPeXUPn62iHcV1N70GgnXtxPF48ucLR4R9PEe9SE73xb14hphK16p/mkP03TBFl7xp
         tCxVfy8bhdngDuzu/ll+VataAspdKlt/vWrb3xAJNeUaJ9Tpkp1y7401Gq5DIxjwdC2S
         DjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563604; x=1795168404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=f/wmTnzOSew06787pGBV+47vQ3H43ZahjRA9WZw76p8JuZvhOvl6hFiEUusBIfd8qO
         YuMAiXDW1AfbhZl4/GiGp8zXznOpRmNudyub/2vUAL55DlWRDE+prBmeBccsroXwHaO1
         +ul488ccXSLU2CpVrsFylCSY5ilKNJatydCrwl4vpG9N0AgNwW4sEhLpysZY1jCBMEE9
         4KT3CdVMyFPlnFw1emmpPK2arTzS47zlmTKeAGC/0kp7+uas/d6YotcnaRpIYOYHY0R2
         MnnUi+EP6yV8QkMF9RdQO8p6EL0gAr4qT+cvsMRrCSW5ZR2myGh44qe2JVCZQdkLfBTT
         Of4Q==
X-Forwarded-Encrypted: i=1; AL+hErGQynZTGb8Se6bBb7w5ILTuZbetSCk4L+0DsSveuE5MoaYX+Bc0Gxkj8nJhvYhm3NyeiFE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9oQew0iEUlzCNGLybb8urjh3TEXFIcRf3Fu1ebgNMCPrzsqHCb
	1u/CV8CNz1J83iOgZLUAL0841MV/73GXpDOkvhRiW3nUIrYM4xPGX9Dj
X-Gm-Gg: AYBFou20Kh33c0E0ZoKS2M1VtJycpn0bkfuf+NZpY4hGcdS9nVyQfAhRu/UoT2nAdQo
	UI7xpzEnt6idsee0bn4KsZMS/+Zy97PtVt1O5tH0w7iF5muxpmsvAOc4YKgN92xlySfeTrSLzRo
	2BNdgyWu0HiwCUqFfiDcwmWxzl5gJJx21aYb4oVBhVnewm9H3APCI5Tq81V6dqM5+UqOdtRxBrq
	Qc+96IFqWyMdvNsyiNzBnvz2AW82XH7t8x3Rc6DKeQp3qrNinBDoGa+0D91Y/IHqvvsp6eHGVMK
	GqEUkzJ9eX9USzJbzm0s2jiXy1JgGMC1UTOhDaxU300YpMrpZGD0ekf/e4PlH/nBMpofstl2stV
	r1NaSf2ygjSqVVC9jUp/SiDNsmSZZTpgPa5u4nF7kyINwko3v5SxIM5ETLK8lsumz90/cILQVRs
	WDcR9g/IvM0a4qGTA5JR7LJhiGM5GX1GB7gckvUCr2LMplTYarXcxb9XBJKsJHh7abm9qh96v5V
	eQ8JZNrJS3qUwPuy5a1B2JPzvGdYshN2WwXp3lmz1il4zMr1bDZKHaRrq/w5NAES0TaF6WCzEdu
	/AYEvY3aqNMawoVVXZi+zR+Lr9zwYFp9oZn13NkoNUhPXGUg8cQstLy9ed9VPsh87FsKz6MyaMa
	Uj+zsYh41IXGlclP3n6GwpQ8qze/Jv//OmSxVGe8OuO2AYRe0co6Emj+jqx8yCoX14T4t8DZ/6h
	XPcj6HPKUlwGJJDvLBl4gB1fB6SqXRovY/m7Ya9vQBO0gMojM6TOframFNuW0kVAzDSnimN9fl
X-Received: by 2002:a05:6808:c1b4:b0:4d5:27da:a492 with SMTP id 5614622812f47-56e65a26806mr1379942b6e.44.1794563604182;
        Fri, 13 Nov 2026 01:53:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7094aafcsm1609523b6e.12.2026.11.13.01.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:53:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:53:14 -0700
Subject: [PATCH v13 1/8] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261113-submit-serial-8250-dma-cancel-v1-v13-1-b857f2617ece@gmail.com>
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

