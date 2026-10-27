Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144395;
	b=phkGojdwjRMl0SvNiM5r2NbQPZBCtq0vZW7Rm9aApchxEntzYaXqTJtFOA7wCFqd7AKz
	 RLNj8gtFdKtqwI6eab0KOwHnSIGMcyqHJucppfMZ1OdxLt2TyV7Nyd8bN+Rg7UogMksTw
	 0+maE9CJK+iVPaA/hIo2KckPYBbfHZJ+r+uGROPzt93ziTKPzvZiCtB/+oEi8/IirMAU/
	 Iz+Iipa+WFPaniZzb95klGLwrWABHPRgTv0MiuXp8BDzWIzVUf5YYmmtVew+ab11U6YcC
	 23itBhnsDB0OkBkQ0FRDoaPjfhLm6YNPuJg7cpMItEsGnCHSHB7xf8iKVyhecknc2jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
	b=XiCSvJ/kDjdsYqyIqyukMrUU4/vK03zvMzMqkYavxpeZqEuCJA5mbWqQLGpIB3AosXbO
	 UCnb6yUokAsZbcmsy5/7lg0HvxrfQveorJwIX7dWpcj5SBnSZcvO0BhOL1koy1U6y7OcT
	 9py+o/ACNXy0sjkgrsJ1qrhFTqD3+B7/MqAuxRRdufhDLb66CxGMQO2AYX009eK4cVEW8
	 wRmbr9xWkpiC+RQrkdQy+WBDZfMELNOLqCC/8DRgvqQ4fUEvnA9qHazs9QxzK7z+f1Uaq
	 /xvZlgPROr4Xr2j24d369tD7wWTMY8vtAr3whCs5CCm+5pa5BEPz5nN+bkegxRfa+VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k1fSvEZo;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14E6606A323
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 23:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A14E6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k1fSvEZo
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-84621d8c7aaso204072a34.2
        for <imx@lists.linux.dev>; Tue, 27 Oct 2026 16:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144393; x=1793749193; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=k1fSvEZoqSEEKXAIm+kmugvCzbZ0a28JWlt1G0/UcOhRJkPcqMuNgCHAmKkQS+K+X7
         WUilWhQhnJWBslQIBPA8Qv5MgbeejJWN070ie2lD0iB5CXPN4jS0affFn6JRjnDeT9it
         ctzwiHHd9FvpXGFO4qx+0qKZdm+EDSm8W9v2dkHw7l9OWeIM2Qu1VrFTMchvF4MF2ZcU
         8RtjmJI2hOreGRhCFDObC5L0aJBHeirSq9NCeNjRwyRmeiuZrxTT9KLQxV+wa9hSnuGo
         KjpRWe6jJ8TOttJwwwm4JBiIqSm+x0lRdnm/C8JRYWh0/8+/bywutUgmipXnWsmsPsA2
         cvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144393; x=1793749193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=rYT1H8+EsseZo/1AHmMS+fClLG9rem5kVs6TILAi2owoSkXJczkRQ1moVrDZS/owYf
         IyO/FAEzJwVGl4XAl+72STa5V9eKU8HOS1D8hvIv7djr+oLTWw25MvJKV0+G/bJG6ToD
         wYfmWMIrOg8lL8IRvbWa9VktCL6e9eIlQ2Vx1vot3/SlY8uBRR5xiXfZeuUtBQ5U4Ov2
         81RajathlSG1/vaSTF5xwSnzl7bGW5Goj4MTf2mok2TrMVgpy1ddzsofmv55u+o/LqwT
         Ss6wNbqzRg9BiJ6bEzWCqfmUCvXIhYgHlw2AjXDsHvgbXxpwBqxd7dNyt8Fj6M1OngUR
         E0hg==
X-Forwarded-Encrypted: i=1; AKwUvBwSFD1V1WLMkIJFQFaQVAg3GMrQLZdlax3S8UqqO5Kt/0HcWXsDxTWCF4WemyoKgxRPBTU=@lists.linux.dev
X-Gm-Message-State: AFq9FYJcpxigHLlvAE5P4gXewTJn23uiskpt1fM6CB4sTUg6xjdTcxDN
	g3b8uW4oUGT2Hmr2EDqexwIKM1uxo2WiOoXh/tFulWyqfs7alCVdixLa
X-Gm-Gg: AYBFou3E5F2LDTGkx1yPfmpcAEcFyWn07sC94eOHzChlhpAwiXuuzTb+8KL21EaEyQL
	HVxZVFbiEvdHCAgN+MHBV4xCaU46ODhY6DjvgN477uALSqsHS4IHF0vLR+NfLqepjCICqpu5Wjm
	f43Z/XNiIhffEY7emC5oLfsNkxSK/9X59TP7HdCbfnHeuQAWKAsdqhbFiHCkOawAwJfQVYMXx3h
	JFagGhjFnprjVqws4VLegik9746zmr89WTBtDp4lV0PQXIIbQpktsTaYndsEifqmOD6f1lpeFxo
	RtqytukPmFiekQj4TTyjGENBlI7Q/RhFRFgPjo+LW3UNlq1gygQzsnhGM2KbaCWl0q0b64PzIpL
	BzykZdC7Fw5pUUgLwL/KmlcAYe54zPAfG9Q+kDVpfdgufI/2yRuka4xQE0vvxGNkMN4X2IU79LJ
	mfUb2BhxmrCnj66u5Xmf5qgdexvTs1uufGPlzmA0G37C5hPPn1gA7tZh+ruXp7RmLmBRTqZocyQ
	6kNfZtm7dF+qs/6cdVRfH7uFbfUJdavMtg93kyBEyzEemBoDT1uFMmLX7aMnYEbf52UThSJl6SY
	L33Urn48erCdEPRQrqyj6Sq7tE8xCRb2J93Vbgsa5v9TZvV1dl9AOB8fjDNmS7ISzbyG3AaKZ3/
	pOpWivLdM0OkVpfdIe8GJ7CsJsIO5AvrIwQZHhEz6xYtqODfuwErHtEwvzxweqaQOLX1nv44mXT
	r3R5M=
X-Received: by 2002:a05:6830:25d1:b0:82f:5471:4dd7 with SMTP id 46e09a7af769-85ac11bfa1cmr895947a34.30.1793144393599;
        Tue, 27 Oct 2026 16:39:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1fd31a6fsm62836a34.18.2026.10.27.16.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:39:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 17:39:46 -0600
Subject: [PATCH v7 1/5] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261027-submit-serial-8250-dma-cancel-v1-v7-1-985a023ba4b4@gmail.com>
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com>
In-Reply-To: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com>
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

