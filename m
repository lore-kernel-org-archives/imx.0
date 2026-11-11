Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794435397;
	b=ID4Y528qgbD9seyOfe8gJznH6SH+0fiKlT12yprLUGMShKIwSQ4lJ5/rEX7550kIVV21
	 PuPVutUXEY9VPvD7auYrIZAyPb6dttAnDWoFbalBx2RD5SAdKDCTi7Nzh2BC2U3JVJ8Fo
	 zmJMQ0avD7XN5EEPQLqwYsFKXm0gZpgUgXObb+Sj6FKgATKnakZKYesov1BWyxZslNHI1
	 Oy6UG6ObEDmC+WlKCaybt9Y1X/R0V//F98KhKRfwoaIShFiPDjoUcb6qzdrNHUhOFyy/V
	 E+18DIFoBRLdT4AUgsnR2JkbXtpF3F5GYlUD7xsjxXtaZV1+SwRiZNDNVqtrrcDIs0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794435397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
	b=bI+3grN8yGxCyD0/Ls/DQ1P3J3/7zWAPLg2Pkx6aiFhMDfYaDV7joJXln6HS8/ax0l6r
	 64nztSqNwZXmzR18LBDKC1Lgu0S+NBvvFA9gISOHZECaL4yikOQdKCyktrYwOLwDWSoxi
	 4JtsZDFyPAeM0v3fThWs8o1smXalUkhOCfBRWijypjkjRIRD1mEOXa+AbKoilzBhqrPya
	 rvTu4kMO5rnXrohzjfC73vYFLD8UNFellry5lJEdtNGmzbrhzx9xu0dxK6Mj59d0bpH/o
	 RtlbSpQtQvhlwoN9NP0cy1WaGciDH4AaqDNS54Dus2gHj+H0vd219deIp8oppGW7SoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nM9An71X;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04361606A886
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 22:16:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04361606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nM9An71X
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-843cf077f10so4490068a34.1
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 14:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794435396; x=1795040196; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=nM9An71X8oViRLUysxPFIXiXtxi3eszJM60l1NR6qiEui1O6lelBD0TVzpugMSN6is
         xWnftV0uFuhNsOkvaG5Dk+2jt5snvaUhcPg52U29STnoTT0LZuExSb0u8xnO8oJoyRgo
         +bdha74F4dDCDMkWH/Wk8Km8iIeHgIpTIOvUjRh8qaWdiK3bV15X0QAlG2ZI1mZPixWm
         tvjQpWXRjQYKuWeot4Uvp3dzL9AI4/fv3rJuzWC7/IkaKoSWGtp5h3JxFNs9o8AFpUA5
         ZBZ6EmeHTFs5kaKjQ2Cojb0+apcKxvFGAixyuLM5h22vO0Vb7YqlWRIql4PaJNSIQauB
         vKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794435396; x=1795040196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=nRO2QDNIEB0pn+XPF6y7UGxtYfQgahNKa19ZPyLZGxFmyGm+y7tkBVOzQ/uwgWqYnq
         O0SzA93JcPvydo6nRcxg3YMv23Dst0n5INe4JL/S3D8RMCL2bpRE+ebgRIy7OkzgqWHU
         yoaEqGDevDMTJHa24vg+MEVU+e52uNwNQDTe0UqI/QfitHc34eQW/KleIBABsFbyDgUH
         T1MeMceI0Tj2uB/5SLmZeovHNyZMSxpkhN34jTYxBlfDUAwApesZmYZmnP7GFQCI6bqO
         eXmL7dT+MbQU5DMNDdooJoUgEeRsDVv2CwwiK0NiLlcve3AR7CRFpZx7TUnLZvxM6Q+O
         fpLg==
X-Forwarded-Encrypted: i=1; AL+hErGGWUyZU4zpmuoV7dUAve/HroS8ppyS5Iqraw5Nt7rLkHarkxa8cChHVg9RZszaCTUE+As=@lists.linux.dev
X-Gm-Message-State: APuU4Z/82+E1NTWqRyQ/ZYOkxuN9HpSa+w6TyDoSLdUqhPalAkd5lTxx
	q7nzsKd9mP5SVWfkiHurPTgBSHf1Mjvdk/SoImAUk/ppgHQbMNMxtS1v
X-Gm-Gg: AYBFou2lL1KfYduOZ8CfifThaHXuD1lLLhtNsQI9S/KOBrKgxjwNr2rl5SoXoU5WDAZ
	7+P1ppVzq3nTlau9S70x1xOEcNVVoSS7BjtTWuO06v21LPTplK+t286iYO7F8h8e79EJmGZB5dg
	w9UkXJRSLOBZLcfg7SG+V6v+UGzVk03HVdqnjDyPkXOd4qaJXAXydx50SO0XJ0kCeb6SCMygTlS
	JtN2GM05K/VVi+bQWAZsKRa3mty01NC5yANPf4+t25G5EsDVMLc34nuKluE1CgOZBIuVqBYVSBk
	fD668ijjfa0uk2NeO/50XpCIze8iYhYMugcFNSLFvKqEdLsq8BkM/imra1YmaNgiDieN1dOHBiM
	yPejjXtCjsWD/9paTuSI/d7okiS2w3I9gxvYQ2H/3poACxgRdSfFMPb2TexgomfaIhuuujoDrQv
	QgcUsjI3gT3yxsqlDHI/USSay4K2TAvO2ZRWnb88tVQLhNijVljENk3W5utJi0LH1nswJ/iXSRV
	a1+JYoWhZz+QWqmv4BXM0N1X7vOPIrQHgkN3V8+EO02hDyWYTZwhaskuCvnJ+r2st4aEG2Ya1VR
	jltDK4ymcASeOYXCQZx7thdirvEe8XnbmE9KJsQkap5BR0GgM44I5T+EZTRsG5EcpptadV/gn6/
	VBV4k0WtmGlvRV00ylWbZFOEH60KimxtN2Tjl72SFDSOXhClG0EJVAprHhfT9nXOEa+3S3R3M7/
	QOOOgPEBI7wkfe88BVuC3M+sxrOG7LlN81gytoPOZeFjL9HCyaHfQE45feNknOmgvfELqFfeL/
X-Received: by 2002:a05:6808:e8d:b0:4f1:7c39:8a7c with SMTP id 5614622812f47-56b982286b5mr3254065b6e.62.1794435394806;
        Wed, 11 Nov 2026 14:16:34 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56902ae38ecsm5917498b6e.1.2026.11.11.14.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:16:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 15:16:26 -0700
Subject: [PATCH v12 1/8] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261111-submit-serial-8250-dma-cancel-v1-v12-1-9e3456bc2555@gmail.com>
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

