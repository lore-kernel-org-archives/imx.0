Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661279;
	b=R+uoUmIIrRs8hLcYpm+bZNcYx6eF3/EtdQcficT7xaBFvmZNbHeK4Shx0Klektqzvs3b
	 ezX4avROx9B/CEwfIBEHb/jAPu1i/DQRaBlyinl/qtITrdPHZbhXOAlS7zTge4LIs4dhF
	 qkqGy0S9y39RerXaIV2Sw7bkXoZNLwu+/bJgasxxRUOiK4hIDI3iacpIG4cUPEW/+4F5Y
	 KITsUaSRIlO4ImVgB+s2Gz8+Q9/wDBK8lkxluC+bBhss9rnVeO+9HGK4zAA+5nBXthbkM
	 WNvKCMb3j3me6wzQzDif+6XQ2fL0touey96QQTzSUKCj3auw6TsdLmi5yynyVuTqFzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
	b=UDnzY+XEJg1JfwKpFcHDAEQUDBGAw3Y1NGOGI0ubKzuLZPGUkbu/lV6K5NH6cdlBYhhn
	 ovC7XJBf9goEL6v5ZO6KFkMIVArMkupog7ROSDmg5Z1QDIpXWyGW6pDJ75HBm05YttNUr
	 odltoEPkUYWzv04fPjigzdpLIR2RMQPUYxVK9+n+nu18m6h08BObyUc7VW3f+R1vjumDE
	 oLhz9DLcjTDDoR9hH86cw1cehR+FB63eJVYGNgIJRv0i8ZfCgzDi3Rl1k6/Cp5kA9XZII
	 RCpeU8RmzUloUJ3Aaf4Q84Ms1hMIftVdsyfJ9Jpdcn71mt/yS0hwEbylzkuKhB/9D7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=czX04yBL;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2443A606D832
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 23:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2443A606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=czX04yBL
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6de2f213b7aso1542110eaf.0
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 15:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793661278; x=1794266078; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=czX04yBLWxkimGPyECotLY0wEWqIjj5xcoEFaiqRtcCMbNSljUHUYxdhKP63bmCM5F
         eeyBhGFibg2keITC6GtMvNg59SJyu1ZfJF0/HqYDvzC1n1tbuXkRCDHrEhenrHWR43hT
         UHZGSnsTkmJkchBON/piYLjoQwivx+JCnh1wEF82eIaIMXh3WA2JzrjVDuciKfXEmE3f
         jvDSIZXCLzgzx1bXsPWKZeNn7nPjiVv+7MeW+wH7yat5m4oZyPH/IkDlLfzLXyfW2Sfj
         QW/0rNyhFp1pVHhZ02GqW2Br9XaSQ+FkYTtQK9FnoNMaNKpO1hbiFeHDvlfIKlFrMuBr
         +LVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661278; x=1794266078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=fBh5jci0doLyfovdOonp2cEW63z3WaLHFsBpkJiQDVkYWt2tq+qx8MHjkegPuEeChh
         20dYB71l+Fweccb+RSMh7/LLhG5AVbFK8kxR/aXiNBiUWTaVDKKIfRi2FtMizCZx83ym
         BnH0XEKZMzlw+d6WfcM2qDoo72OC4nhnq46BOVJ2rswHdTq5dwzJ+JXvMlIRGqDl0gM8
         +vpFwFBlMXW5fLnSRl8GjfPNU/SEUJyyPDhnX8ci6ZhztBlS6DxKYF7Ff7V8FB5BibuP
         6SCffwdan3TAM699uX5wQbVUD+MuL5KXcSn57cV4vKQ2ymDw28/SjMnt2PLl2tbTcnJJ
         o3WQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoAlp0njbEs1EkThpsakrAsPNpC7/LHzKjG5CelILBFOlZO443b2ZhGf3/iKUw/+ASMmU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKhpK4SXX6fgm72girT40o1lcsoE7UOw1gzzKJJh3RmuHA69fE8
	/r6gyR81cyBOmUCOWq8SBvWb8NRw3wXXn7IV0mrEkHM0wQXSVYgSsKa3
X-Gm-Gg: AYBFou2m3xkIDwGJUTml73kWAdakiMX784pYB6yIIsYUnOc91KqYhQ0tDeN5XIOrHDH
	UV93+ccM2+GZ4Q+SggLnCdiXWwxjHGCpVV0274+0CURdbjL8pRk0/AYKNViFCApULlcLy+xt6Wm
	VPQEWWNLjtZuWC3eOAUeVo2nphytzHdIz1u2SFkiCaF40yZwhw1yc6P7ks3Rzs4yJmHKDhJNC4q
	oHQvuWR3m84uYFTFlk64ilssQxmNdwPjuO9tkzaUbk2p7qPpxIc5m9a61g++V7G3DZsFUGox/Hi
	C2kQuxbqWhtuFPPICxFgq7huE5eFETT2k6NwXANDiSUFzjftLMBck9hhczh4uqiC8tL7sX/17Ng
	J98bErw1CFsRDJ+FtxPdQEIJtdiHiqhKOwWHggOVO2z99uoRSwWMOcep/OKcy0MHl4NE7LmaaSX
	0/nI4nN1cUv/ty4lbM916ahBkGnxKMmeR/Y/cmGUXLdQjO1ycpMHlxDQMeFjDVh8+b97cNiQ+50
	Q5VQcVov/mKYCV40uvxhupcW4zDbtMXQqeyu4aHhZ1jlLI2EQukTxYRZU33RoW+2MkMu6YIQXLc
	YZXEGJ6ePolndT12MnKmu+0yOaTjvN4qdYA3Jr+598+rtW8dyHUnfrFCT3NnN/apyUnAsgZ4SEQ
	A/W3rlOC049JlbtMiIXHA0jGwYmaYj4up7y/z+aY+cFljVrSyRItNoYrpdSJIo714U0vtDApReC
	BEIijPxqLD6dFLLsStZfLs1CKO5t5ux5RJuqLNhl8UlLYhbpgDLik=
X-Received: by 2002:a05:6820:1621:b0:6b7:8396:f3cf with SMTP id 006d021491bc7-714f29e457fmr6317068eaf.49.1793661278004;
        Mon, 02 Nov 2026 15:14:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2ce869asm10134463eaf.4.2026.11.02.15.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:14:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 16:14:28 -0700
Subject: [PATCH v9 1/8] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261102-submit-serial-8250-dma-cancel-v1-v9-1-9159caade148@gmail.com>
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

