Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792824052;
	b=DfUD92A+gAs20RB9ohPZ7p3d6Z+DrwlMyX0JaEsyh4/HZLh3+KPSMWTfj9/WHW2Fpj1y
	 irSQm7+1wGtBqNlUabZdMIKTo6GO3yk1YGOMpHO7pK7GTmh3n5js8S2VnguxVnn4/a7jd
	 yd6MdDt2bmu/EyM4AgbUCAttwaLMByEcnPqfWfkNd10wrNKQsu+hdmBcZOrP0wCsnAPi/
	 jyFg0+dwYNuZj86QbAfzBCqnIjGxAz9Yu/eVTe0pa6QCIzRCvFtnIwo+p83hYNHAcVx+h
	 NViOZtW2bLCfQrQ6q7xx9Vu2eu+G5uq7UjvEFRDmKFJ1NxhpZ1R0XDlqJ9KmDhfXb4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792824052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
	b=xRh7HQ4A869pV523+MUSH9Aug5XES3fSXJGrTVaI3o6dGTNHqgjFelB7SATRJxqifgE/
	 CTEPVgGb3JNUzLvWV8YWsTndsKkpIJ36QDnjUIUFS3HJm5L18+G+UlibQKczGk+yOsFFt
	 ok2FQ2yWqVviscTpJSgmTpZzJ1aPtRgRFCPNQ0833U6USHJkt9NQnGNokNUHcdGIsYs6H
	 WalpH2+up9FGM7JMjOe8d5bU/VwARWxRDFcC9XzuGzbGhzNmDOT0yVV5Sz3LKWRl08y3s
	 Z8TmK+CHVTGf4LRE1aGmqOph/kpO69jEj6ynnZj2Mlh+s5QERSmFwjvj8SqRT1NhzQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RCgmHftz;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467E2606A329
	for <imx@lists.linux.dev>; Sat, 24 Oct 2026 06:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 467E2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RCgmHftz
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-82380b0f55dso638245a34.1
        for <imx@lists.linux.dev>; Fri, 23 Oct 2026 23:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792824051; x=1793428851; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=RCgmHftzBVTc+ZOH5TwdDBx/XDFKDJBvvKr/j7OW7aVyksnwWkIzcL5CeKKeWAeM1m
         qM3XneNJ6XzpjwT+cPrTRg7yh1zuZujFiMM390tzAZSob0YNt+cLyD8kPFPsgZmUJGW+
         FxeQH7ggJ55NIvd5PcFlcY0HUuLlS8L7Fho5b/yLJfjyxqv4X5W2j+nfJYRXP2VCwx4p
         4T1jiMe62IzTgrYVR6VX0PH6WA2ZHO0mV8m591bEVIoAI6odS2wzoBcX0qSG1XHnBRYy
         eXaksmHuuZeS7U+l6nlUHQHelRtYPLS0Grl7SPh+pyoEyPmIt5SgGgp+wClfIrY3Iusp
         Mmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792824051; x=1793428851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=pw8QNDlOM3G8pxeXvN+C4ECi/1i9JMd//+/bE/oBda+SaCOQlGmX6yoCRnuK9WydN8
         NKyJyfW5l2lZU+oXI5/DrSXLb+kUxXHgxlqivXRVbnhoBgENJs4qjQrsXNm33VxkPne7
         0Ii1JarYPapFi3CfQY7eRzmKA1KzQpGJ/uNpiHRXa5G/3MrJknGdz9LKtaVTJfprdqss
         P3VpfGAioWmrfjp/PVZhPyGnDl3vUEU6/hvxjg7B05Gqzxt2t4ro9x3E8vOPJYSUOSqe
         XBOfzRvtL09ZBZbblfWWp3HEZBhIFAnLWghuicLeXY4TLPNM26C61mlWgdn9LH8HpcG/
         lDOw==
X-Forwarded-Encrypted: i=1; AKwUvBwC4AK/TlsuY3CrbR787OkTfJwfawLf0c3Gtkgni+sZj+42uh5uI40J+kjI3ipDejAcmPo=@lists.linux.dev
X-Gm-Message-State: AFq9FYKImUwRe8vH4yrszklfyNpwXa3DIgKz13CvSqXVoUMKuiWWxsAi
	aIFvBfQtOahzmWFWsgQhtq+9g8+8mfOXbqwlc7fm4B9/knoJSfLNyrhbICsQOc6E
X-Gm-Gg: AYBFou2S/IF++VU9zldcwO/a/isOyqYy6LKIwaSQbVMgFwzyP9Xjaa5oZUi4RvJCdQy
	5AF2oCksp+xvVv7HYYtO2Tp02g9JRG7Sr3GfJXNwT6ppvqVBLzF9xlKD1YVXb2/X0FKmGGDK/4L
	+iL4/BUjh84VrFldLeSTxpReqs348at0AZrKpHNGsTI278A4PnU86tO5N2Wa1t6Etdw0MjJsNQ+
	omIQQ4QEbvlGdAUelXx0AWa6Y8xoIgWqVOk7nkqzqiHHjCaw1SeDstttaB0QlfbCUXGnPFqKnfL
	l8/D2VfGetsVWCWwta24OA4X7z6wZmFlzDZyG4jmd8IHY2ciwA++Sbmk87fInV2KsuNzovxUGIt
	lL4T0Wt7961n8xSsBosHjqoPqO2qGVEJadXFGQshESnkaaZWIzZ4BeMgaxJQSJwNVWch6thcNQ/
	npIuXCoMkL2kfyjFBIzx+jEQo8nFZb1kH24L+q/i300VArQkqiXDo+Sin4c+anv0n9flEIGrO6S
	Ak/tWxKKVJvR7xo/C9LeJB2uG4MR6tTGA9MThFtcJFpuiDXxM9HfV5CBs84r33Ob47M2f9nhu/1
	cqrlwhDrt1NO2r+yXjLDG5TCnMEquyn+qcp2maPnYVK93bMMcJTJp5BEpuvdN3qdDM1f4pfSg+g
	PTFAnQYCqe56TGN78kRcGnzJZe2VlqDA2Src085h6CbpAUJeKkCu1NHCyfAaPcH9TlPKMoVToer
	feWf6ot1rjYAUbomZm7gZyKyE=
X-Received: by 2002:a05:6808:4fe3:b0:4f0:1f76:8ca0 with SMTP id 5614622812f47-55c003e9dbbmr788058b6e.56.1792824051160;
        Fri, 23 Oct 2026 23:40:51 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0429c56asm864633b6e.9.2026.10.23.23.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:40:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 00:40:40 -0600
Subject: [PATCH v5 1/5] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261024-submit-serial-8250-dma-cancel-v1-v5-1-9e52968928d2@gmail.com>
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
In-Reply-To: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
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

