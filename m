Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196273;
	b=2NMTnwZFct32JKnrEc7i53VqyOKSQ5bTjbRmll/JeanehL3MpV3OX5HH485J9qOo9o+/
	 Pn7vbxu1PC8eVhJIvccBTG5YcHdkIGekvpj5WpVgkKft+lou0JmvRsRwchcIocBzb+Vus
	 ruonCUZO7iRSCLKDEiz4UGLOHhgHYWuhC828BrLqfh5jgZ2ffpgFeCxDG2oY/dnvdkeFc
	 U8aHEuRITo2V5Zz/gqUzyyzXUPRrcZgSzOFO5Y9qT++smSYPAcRHSkwxJdjdtRCGit5QO
	 p9DZvA/YMk22t1QKlaHzYQLKN8pqMxJDDN/Yb5jID3Vrnnq/87wdeNif64fQ5PplzUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
	b=ck3nWlgF3TO05gs6o3Dw9BBiVzEpFDh0KV/o8jzW1nOywA35VGNnDYLwR0YAtWBiR5XP
	 jVhBN3AmN2CMNTp45q2MlhuPDOfqshkjPli/o+9QiJNwqqPIxnbjo+HvMPM9LaGFH5Wtl
	 ttGF2vqbRFP6cjluDO4M2ooXdL2XX6GDZ1HnADxh2TiZKGzT+dZldK42BE+UQn8eRTkAV
	 qTEoLSGbckstf/7WgkRLDca9Dt5IOR4Ly/n4QNj8ihLBK4luhfcZ6/lIqJe2xeiGiff89
	 rUCcL2tGv/ryrkAfmCYRxqc/K5UtnVocPRyNgAcXC+xmshZlVN+3CkoR6i65JNzpomQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9Y0YQLl;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E7606A330
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 03:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C0E7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r9Y0YQLl
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-845788309b4so173852a34.1
        for <imx@lists.linux.dev>; Sun, 08 Nov 2026 19:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196272; x=1794801072; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=r9Y0YQLlSBQRDAMS3vyNB3s5x8dNiDxKoRnRyznuTd3AA2mchK+B1GWClPi2gw6jUx
         VF4dC0CWu2T+bZT2uSxE1mQm+W2Wxy5AtN/JOiKtjKdSJEWZo7ESmBvx+3ZAkojhPHRD
         WvKZk0fUKcuFPLlaX4MijRnpjLZNEYMqM/1gmIGX6LOM7FlS1cCIsvyuCY0oQFE2aFgA
         IIxuUpsTtHlTOYWS32N7dv1zdca/X5pShg+JtNLLiLWjBFHQkqyDBC+6fWCEirZ5psSu
         9GhwQ5r5/gKobBRjTLErtt9YiiSKJgOKVo3nBFLChMEEHyaSl5/XXdPnLLjAJTiVsUCq
         w0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196272; x=1794801072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+f3wqnZmmj2eYXbJU0o1qM9Y+NCisSMFy31udWGduqg=;
        b=1VgbRfuXwcgUXqxJ/w+EV4zUVKwpdJBngty/2qJaCxZT62ldg+4ithIV713JvEpIqJ
         DSczprEx2ljkjkMef48TMf+8M9P8VEYKBatTN8vG8j3zJEbVO2Dx3r3pVXirmwH5B3FP
         ENZ3se0for+OX3fxmYTh9VSzBEtWCDnN6W9kujcyl4DgFQtvvj+aUlVbl6pMZHetFzjp
         0ruRGFNL9Fq37ChzRgX3qQvhmjIY5tN0xgzjxDz9a8DQxI+V37Gz/jZNSZj3gSUZrARH
         NGRBuR44DjRmDrjB+bEHHedl9R6DO6K7UNMqO/pBT7mXzVnXOLjoChWGDsmOIiI+K1AF
         uP4A==
X-Forwarded-Encrypted: i=1; AL+hErFebOpmKj7wIkrGlmcwjYmfvOLmFmS1snRfCdFjvqz2lynBGDzON/D3HW59CiWmnkRotEQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z/MolVUQpWez29AOBbKz7HSoKhJybmFXFrqsvU23MGOvi0Amp0g
	UAtVRYWWgfzjYtEXpTSM8+EkhznPmZ1x00Jcjt0Z/X8dkZffDuec0Cd3
X-Gm-Gg: AYBFou0Z+wzsNMxqMlGOLsqjPgn+mdPlth1321V1J3z/zpcO+kWY5GP8UfbZ3+wQ7oG
	Gr15+GoGpKwkjbM0wA3FHxv06ainb0xB7GI1sDA6spEFzvSVftHYqBU2LuNRVruUuAspAshN4Xp
	Ypyy+Y8X8Hbu7zCL3lOytQDehu407O16Rsmmz0xiYBHmBD6qZAwgLiNXXiFmTL+jwKMQOdGpxsW
	IE73e+PpTIuvPD7I4yUA2yDem0+t82q59hn+gdvHzP5GknLtWYxd8GrkpR06mCNvXdEXR+CrIp4
	9sqKKKf4YgO68fUGh3AAlsqXCJZJkT0L2lh5FHCGwmlUYku7t+om/AGur+vYGIpf3+WM+U7JIFn
	g/R3pAgm9z8oIy45o1B9bGJwH9L5cGS+S1+Y8JbIf+DJYNt1SXj2i028L+dolZ0MTGg/CXWzE0V
	mQdQfi36FwVgqp40q4fw1LoIGN17THiORlfaDyCMdydeQjSqfbIMtmvuSaaISF1k8E6szIFyEG2
	BxmxImLfv21gf/ImzuQYUJQ6vgx0olbFce+SUWygPi0q/SXPkT6ETHMyJv1R2U6jWGiLMnQ26Xn
	noe0tno758KMx4TbD7wX8MxxrHlmhEehKaxjzfDb7iJvbYjdHZHPyccBtEaW6A8mF4MkXhu4+uz
	SSuDKVZ6q0Zls+mH5Mrmf8Sb2i58hfyDnOEI844xgV8gDOAbbFuBdNYbnjfz1d4Y8n21MyQgsuc
	kaclIpInVYXGT6xiGY35uEBoundLUSw0BmKGnUsZacuIeViHmKWW9c
X-Received: by 2002:a05:6830:2b22:b0:85f:49ec:c96b with SMTP id 46e09a7af769-85f507ef5eemr2216062a34.16.1794196272163;
        Sun, 08 Nov 2026 19:51:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fad32cdsm2800428a34.6.2026.11.08.19.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:51:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 20:50:10 -0700
Subject: [PATCH v10 1/8] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261108-submit-serial-8250-dma-cancel-v1-v10-1-e6227ddb95b1@gmail.com>
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

