Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283247;
	b=elOerCxD6hQTh7jUXCFbPPnPyKT8XBu3lBWO6iTwjAn8fcCTG/C1ep35bYgpXOL3B/rH
	 D5E/MPSEq5ix0cnZtu0OCisBsiqFp4tCLC/Zf3raLxOFAUKf1W13rUfy1NhKjRFYJ4hPS
	 reXdYjcWDYI4xIGtwfz5uAZUrqQPMKMFVsbGpsYwQwoX6MDhnz93mcbfC4Y97l4Tk/LBR
	 FM5NG22XUFRxD0Y+Ds16ymF1G6nw4KgdmuP85lfjg1lG4T78SfMGiiDyO83saq5d1W068
	 2A7w/EcLMbKjnsXeGvZAxaRxAdWQwoYZBn5p7ECx9TMD5OM26BgX/lpLydHkuJWrZyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
	b=MUxzPQPh5/VArmgh3dFVq1Mqy/aOPRwKoUN5933526nTzB5FtP3WKbrnZEj5wFdb3UEz
	 Br9iWr41mzCmTMVg6LmYwMY8blp/6Djy5HURSSiVF7bJ10Svzk3L3W4k8V7HMpPpn+9hW
	 fCrvz+pU6VV2UpF4pwQwKe7sY7zFEh7uIchxqk2MEIi4LWvrHqShLr5fwt+Ns0fD6ISCU
	 1dDgIgcFZIKzewUqWrwz6j4N/NCgTv+f47oo1S093lF9jhGG57fDnoacFuNELF2f3He4D
	 YJ5fk6T4rjDIcFNmgNfQgtSs7kY7Mw5CssOQ0A/upb1sTfxkCrcXn9Tjgxp/D/J35kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H0e2wgid;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F348360A3834
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 04:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F348360A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H0e2wgid
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8479f46ecd8so803362a34.0
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 20:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794283246; x=1794888046; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
        b=H0e2wgidWCgqeexMX44U0ZfvJfjXiDmsSg5eKDfazzwnUgSSuLptzj5TX4xJkiy9Tl
         t4TQ33mM2d4Z+CLauz82Gn/3w7PPcYmx2xpLh8aKKp14VcN/PaqJ03/44lJDjnzJPcNX
         NAZemGUwkMBpnWeQKu/7G5z6S3DAyN9E2anlwaSVoMaQaa1H9pRMe/UAYoQLL5yzPxdW
         nISyM5EYrxDVPqbKwGo0+FfL+h2m8vFbBczhl3FeLjzzFvvqudSzofnvsRk/lyw5loyv
         FGYfypiPPkYwWAjMm/ZDyE78A+sgdjf8luQkwIoZB6ULvoTybzAUrxN7p2IzlIfNFhM9
         7PVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283246; x=1794888046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMLfsgd2///WRofDujebt5cSA9Zf11vcK5RD88/TdEI=;
        b=kqQjw3X0TIhcRaE4USHMti1atymkZz9cyV6HjtiKSOrT/lOSJDrbTkBv2WUzldj3sH
         vV0+FnaWQcOJQQC17F196n8ZvGIgpRbz5xBbX4MfoYYvftBWNLQCSwAAyIv6t7YDk2C8
         Mtm1Rjqds+NEKOFZv50aXrJgtp7cVQqLvqrdIpDpqEq04oFUOSKzrgAKAO9t48yXXZ5J
         yXJRQ6sKBiQObjOB63IUnhTgIMnuaAYad8LfszOMwZF4JuVLwWoifLGC22LNhaQTQTly
         uByJt9h65YVJMYwPtc7M96xHeJ23so3OhPWICdzcQGq+hq5TncnTadMcK25OFWJWbZSl
         mJPA==
X-Forwarded-Encrypted: i=1; AL+hErEFs1GUgYgdBDPUg9j3xTqW68iJNLUjBISL52XM0/KpriGfEdMz7FwUFTpIBXSLusVeHJI=@lists.linux.dev
X-Gm-Message-State: APuU4Z9MhGC/gF5UNOhbLwWvP/rOsXgiAZKPaD6SU12NVXBbAWvkZYuz
	Lz0ZiK5hscjdm8NM2TKulsQ1oyY+Kody2cFhRlQrh+McyH9rpTK2XNFq
X-Gm-Gg: AYBFou2s6hJkGmMinlnuuIbt5gt1hmY4POqGXmNqSI8G8pVeEA4uYDqAT0ughwGj2I6
	FGbFjKchmbv2fBUIZwxIcpQVvBNoS95TYEpBAwNAf7gt/saXLmXTnT0cmaHLu1FGx8DvG4gBHFM
	WBxzY+awrgmq9GDMrFoMeDHnXhpoACAcUGTEvSCM0KC5ArpS40CUR19VkEkhzYLyLRjGG9pN80G
	oqPjBaov/uEWf5qEvzZdohKESBCbnbdNQ7zJwCIbkfAZfTCFZs266CNI27H0Xq1vBrss3QcgCUT
	ngm6dElgdEqQfeNuUbVksZapgsHS7iunCDDEMencpXe2Zl736VCmRI7veZ78w9rvFNOWSUuLn9O
	y4S445b5sUameO1vsacZRfmlMdPd1cZtw7xLBgPbWEGR5oenaAM4TlwmPmaLeC6oHexV6TfuQhc
	MycPc/7KyR1LKYgianVg/cNIUqdIG2RvVZTnSqW5onZuaBQ23ZMEaGiDEpF2BtYPDRjfU6aC+0B
	GmB2BUxOAGTV/cbrWEfcMyiFmDeUrhCpbdt0N+1Inee0v/muaiwXFKBv+zYkfAqbhvyPiPr5//G
	TEcdm4IpkODvgTuwtzlIr749QL7wgMGDzg0j+JF0JqSSf4sUYO1su6VmknwoCBfyon5RCCrWco3
	1OMNd9LfmffjrUqZmfDV1ikzrugvgm29YluLMedxq1EKkuiABuHinkbwYs4G/pDjjJrmGTuU9zl
	fqB+hNdX+UvarngG2xTYwlaK21LccjkwI+8qS71I1cS4jFe/eSFfVC5GDtjiMrzA1XOAIyO/jR
X-Received: by 2002:a05:6830:4aca:b0:7fa:ab72:9e01 with SMTP id 46e09a7af769-860dc8464a2mr1224823a34.25.1794283245936;
        Mon, 09 Nov 2026 20:00:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcc1d759sm1028178a34.23.2026.11.09.20.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:00:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 21:00:23 -0700
Subject: [PATCH v11 8/8] serial: 8250: retain DMA resources when
 termination fails
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
Message-Id: <20261109-submit-serial-8250-dma-cancel-v1-v11-8-6364edca63d6@gmail.com>
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

serial8250_release_dma() ignores the return from dmaengine_terminate_sync()
before freeing the coherent RX buffer, unmapping the TX FIFO and releasing
the channels. If the provider fails to stop a channel, the DMAengine
wrapper returns the error without synchronizing its callbacks. Hardware
or a detached callback can then access the released storage and state.

Checking the error and returning early would not preserve their lifetime:
serial core frees the TX FIFO after the driver's shutdown callback returns,
and port removal can then release the callback context as well.

Require successful synchronous termination of both channels before
releasing any DMA resources. Retry failed channels after a sleep outside
the port lock, leaving channels that have already stopped and drained
alone. Keep the shutdown gate and storage reservation in place throughout
the retries.

Start retries with a 1 ms sleep and double it up to one second. This
makes short-lived failures responsive while bounding sustained retry
activity; neither delay is a hardware timeout. Report the initial failure
and ongoing failures with the elapsed time and current RX/TX error codes.
Track the five-second progress-report interval separately for each
teardown, so failures on different ports are reported independently.
Report recovery once both channels have stopped and drained.

A permanently failed DMA engine blocks close or removal. This deliberately
retains the buffers, mappings, channels and callback context until the
provider can establish that they are no longer in use.

Fixes: 9ee4b83e51f7 ("serial: 8250: Add support for dmaengine")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
---
 drivers/tty/serial/8250/8250_dma.c | 50 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
index b1f2998e7735..6efeb16fd994 100644
--- a/drivers/tty/serial/8250/8250_dma.c
+++ b/drivers/tty/serial/8250/8250_dma.c
@@ -565,6 +565,53 @@ int serial8250_request_dma(struct uart_8250_port *p)
 }
 EXPORT_SYMBOL_GPL(serial8250_request_dma);
 
+static void serial8250_terminate_dma(struct uart_8250_port *p)
+{
+	struct uart_8250_dma *dma = p->dma;
+	unsigned int delay_us = 1 * USEC_PER_MSEC;
+	ktime_t start, last_report;
+	int rx_ret, tx_ret;
+
+	rx_ret = dmaengine_terminate_sync(dma->rxchan);
+	tx_ret = dmaengine_terminate_sync(dma->txchan);
+	if (!rx_ret && !tx_ret)
+		return;
+
+	start = ktime_get();
+	last_report = start;
+	dev_err(p->port.dev,
+		"DMA termination failed: RX %d, TX %d; teardown blocked\n",
+		rx_ret, tx_ret);
+
+	/*
+	 * Shutdown cannot return while DMA owns storage or callback state:
+	 * serial core frees the TX FIFO afterwards, and removal frees the port.
+	 * Retain both channels and retry outside the port lock. A permanently
+	 * failed DMA engine therefore prevents teardown from completing.
+	 */
+	while (rx_ret || tx_ret) {
+		fsleep(delay_us);
+		/* Retry promptly at first, then limit sustained retry activity. */
+		delay_us = min(delay_us * 2, 1 * USEC_PER_SEC);
+		if (rx_ret)
+			rx_ret = dmaengine_terminate_sync(dma->rxchan);
+		if (tx_ret)
+			tx_ret = dmaengine_terminate_sync(dma->txchan);
+		if (rx_ret || tx_ret) {
+			ktime_t now = ktime_get();
+
+			if (ktime_ms_delta(now, last_report) < 5 * MSEC_PER_SEC)
+				continue;
+			dev_err(p->port.dev,
+				"DMA termination still failing after %lld ms: RX %d, TX %d\n",
+				ktime_ms_delta(now, start), rx_ret, tx_ret);
+			last_report = now;
+		}
+	}
+	dev_info(p->port.dev, "DMA termination recovered after %lld ms\n",
+		 ktime_ms_delta(ktime_get(), start));
+}
+
 void serial8250_release_dma(struct uart_8250_port *p)
 {
 	struct uart_8250_dma *dma = p->dma;
@@ -574,9 +621,9 @@ void serial8250_release_dma(struct uart_8250_port *p)
 
 	cancel_work_sync(&dma->tx_flush_work);
 	cancel_work_sync(&dma->rx_flush_work);
+	serial8250_terminate_dma(p);
 
 	/* Release RX resources */
-	dmaengine_terminate_sync(dma->rxchan);
 	scoped_guard(uart_port_lock_irqsave, &p->port) {
 		dma->rx_running = 0;
 		dma->rx_terminating = false;
@@ -588,7 +635,6 @@ void serial8250_release_dma(struct uart_8250_port *p)
 	dma->rxchan = NULL;
 
 	/* Release TX resources */
-	dmaengine_terminate_sync(dma->txchan);
 	dma_unmap_single(dmaengine_get_dma_device(dma->txchan), dma->tx_addr,
 			 UART_XMIT_SIZE, DMA_TO_DEVICE);
 	dma_release_channel(dma->txchan);

-- 
2.53.0

