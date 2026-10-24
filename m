Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792875154;
	b=wv27K2cix27XoqwOjz9hPekTccSuyK/MIbKKtUd927kSeAM77Ina6JXBKHKpAL1bmiSF
	 uZ30M8CrCdq98iiMSRn25xLF+PomVemHWyTuwwB3fC1QjTt/30gby/blBVR65LyfkgBiI
	 Ttt+56fylym9wnpuKarz6jzqGmbESjtQfN2xyYG8TjdSoFzvF8Bza9cj5Z7RvAlymtkey
	 GeINKRW1dtOREIuQ29ac7ZCHV7fMK4u9AEtTbWYOvHY9NWY5hogm85mAE29qz5j+kvaRT
	 Rme5IHPsY3vbyCF7pJ52e/AQxNnpmsODbHw4HPLVkQoNxiXN863gudaRxrYsaOxSblQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792875154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
	b=N5wdThgDpxLJzsmEk4YfDHTzHXx8Q1+nJdpCkLtK8UDCmiOUYmN/ezldtoIx2zVrd2EW
	 Re5Yo+3xbP4Tkx5gUiloFg9eOP/GChAYQPt3PsQlVjkFv2W0jlZIojNTY7BoVBvWJ83lC
	 FBN/rdhkIyQk66QATFi5y1pYFZfFOjd2/zAMWgCr0luCYmY+78A4rNCrm2WPtSrWOFVFr
	 49/GXDw/ykBV4O+y3it6TyyYACY7/UL+G469sg9Rvsc9CBCPgqb0k1HBcZ3f1uJub6Xja
	 7dMpA3W14Zmym/eVDhNkAdBdwn/w6tTrEm4ICgUvdtAT0NeY1o6f0i8zOU9onUjTnrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qBGViv+R;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD83606A327
	for <imx@lists.linux.dev>; Sat, 24 Oct 2026 20:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BD83606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qBGViv+R
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-843cf077f10so2115960a34.1
        for <imx@lists.linux.dev>; Sat, 24 Oct 2026 13:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792875153; x=1793479953; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=qBGViv+RTenbbzpeu2AtG1pbzMg+ETfv/PNOMm+zLvOgt1n4JSh6YcOSacLUNou5WC
         IbWzmvjasrrq8NXaJDX2wMf1ad23x4y6E9MOWVtvnUAcDDFGsSwaZPdBsk99fs2RboYo
         z3naHv/HR7/YmH0Crqb/ZXhI8MpKuD8oXPzo2yI4Ehvs8L8FNT0U+yLXPb4ALRzIRD8O
         AU5mwGHBeztH5UCAyr3mLmeZ5dzEXc6lVoO7aQ2xms1GCupXCv+hMWRgSHlPKJPjlOHk
         g6wON+cZs6CyaMjdrQtG4L/MqE+LiS87eA0TWrqCBbRO2yiWeQsiFbOxv647i+1YSdzC
         YaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792875153; x=1793479953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vTCI+nDxJukp6A5kK1BpAWHpCDcT464wzBcHkx0Jj0Y=;
        b=BhXyT5kuAQOsugxMc71+rgtIRLN7x25K1T1m7bq7npRNuxX+i9ViWknnpLH+msLT56
         75hq7PsrnTBmio3yHgbiILFhySO3YoOXDMIWPPblS4OA+a/MUbb2JYG9st6W4y3KQ+2o
         uOVGTNCBFuaytZVaZkB25BSr/2TeJF2L4CfLFmtVqq2NfEZ9166D+JRA8LOJCKCd2RlY
         3nOAvPu8V7kMwasP+7Q0vPe4RlEmR6ETFrRiO5HE1EbFEpRTFQWgvz2PbfCiHBo39jHQ
         WzYCDulJe55jsKmo4wPKJw3Ez9pZzEFgKwck/55vptzjzxCKUZCe4oYLondviLPIBGbT
         JZPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzE0ZuLA/YblY0+jsOFkhY/5YkLCDBz++9w19SnOE+dRduzXmHS1AXuI49FuqR0dBVmzEA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKewu2HesaRP6jWBfiklu9WKAlAu4KOPcR3Wxb+DPzJ3E5YAIfZ
	8bsjjnvt1MKgRRf/BX+dxXxJBmjGRwEL1Hy+qbBl2ljqFv53MibwM36Z
X-Gm-Gg: AYBFou3hD8wwK7lY5gC7pmtM/e152HDCR3Kd3juIB4EVcGbx4kdy/gP8pG2hcjL8fsO
	ZQXjSINXesxWkf121zw/x0xJCCefj8x8Bq5eoRKQlOJEySVtHtl/GKan37VmreJpRVfVLsy3FfU
	xXpmKe4SvnRbpr22wpo8zho7KZBqsrTDqLCiue8YpPv5WddP7nsDHbF7a7WOd3KZka2nsHq0fd/
	PXLUJxNBDqPeiV9ie1BxPfsU1tDm5hGv4/CiXTCrvQCtivg9Mrk8EYtmAODM2hufswUsQlXK3/l
	IHwhSc3yEmFYZWRPwXK9uTsPkurKVTLrUrrqzBFVCWzulw6QSW7SeOT6xfECWoXKtzoIlcKCSMV
	0bNtcBXCs5/8P6Vh9QpsNOWtAyKwxj75suhCCpW4zOZLox4kNLsJYY6ro+bQjxWvHEUurUXvjv/
	GW8T98Tz+gvpx3PtU0FeVCEQWzmA95enQ5fwQVrMBMZHsFLrw8pOxAxhvvUZKYoxo14MJWKyGKu
	2PzK4vvn8nL/G2t103lAT9/7BdUctFsZqfDG8do4UC3YbMkPgvfC4UgIh1WSv84k7YP95d/W/Ju
	NpUXEVJKxqkvU9aAlHRnklAM3vBrwZXhX5f2BVv3i5RWvPY3bMXknAPO/9URyGUZuRtqShTmO7j
	astW4Lei4hZh23KZ3ikh6vIkPblTniHDil5Ff3T5N4IFBBQ9oju20vG7W+2eg9N5wSnWNKhRqXo
	4kaQ==
X-Received: by 2002:a05:6808:c1c8:b0:549:a550:8acf with SMTP id 5614622812f47-55c003426f1mr2007470b6e.50.1792875153162;
        Sat, 24 Oct 2026 13:52:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0429c932sm1986785b6e.7.2026.10.24.13.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:52:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:52:26 -0600
Subject: [PATCH v6 1/5] serial: 8250_omap: separate locked TX DMA
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
Message-Id: <20261024-submit-serial-8250-dma-cancel-v1-v6-1-6f366591f566@gmail.com>
References: <20261024-submit-serial-8250-dma-cancel-v1-v6-0-6f366591f566@gmail.com>
In-Reply-To: <20261024-submit-serial-8250-dma-cancel-v1-v6-0-6f366591f566@gmail.com>
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

