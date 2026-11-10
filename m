Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794283241;
	b=VLraWNTkStYiqhuizrMKkwsb8v5+bsbtHBPXbejXsHgz5nnGVMn8l9fTK+t/3o9t2oXH
	 +Ygn/fbV6Hf/JPm3XRCLE87HkM5SYCLszUbcaiER0LdIK3llpNCe3jrJTf0P0aINFYkhL
	 QoapFogD/y9Lf8A3MgNy/rnmiPGbH3Sc1zP5AAtMJTtPeqCKiKjbDs7aS1H7izgVIzSv8
	 FXsTcvCFT0FlGAPkXbG0SVzGZN1HqFLLny4/FJ9PJNNio3JdPtBYhAowj2A0gvJEAIPEg
	 5LidakZOPqyhMAS6wamGtfZUAvXVMXAxA9IqK26kiE66Cvo52v0SAjliDOT6jUtc7Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
	b=SZXyHWHbIkn6aW5KhjBQu7Khe0xdz1KhO05V6MmnI4pMJpsWhbd6I3782jQ4Xr3XZwBp
	 ZAt8hAFtmhHMOqKpW+INlHUuYEwKVytFYU7czLCP6whCKCTGaTDM17VImgvwo5COVno7A
	 udOYiN1LMJq5y6up44Xs4TzDKNxkuIziDvU9k+8Nss/Lgj5aQNiVWEMUCk3/f9wTJfok+
	 blBUccJvAoObSgLewxpVEDOZvuc4Fr4yI9vmEmvYrfatd++hWvLegfpeQeKjMjAG+kxTw
	 A2OKVXDzhVkgqVPYQUv4jndlpoO55wy66aqJBeFzW4fHi3XD0dJerw220JianaWQLtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HZMFqwCK;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E405160A2629
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 04:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E405160A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HZMFqwCK
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6aa9606ddadso885143eaf.0
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 20:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794283240; x=1794888040; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
        b=HZMFqwCKKERntudz2IRtRXFiB4maTArHniiRY9m9qMvxFk+8fFDZ1AY0bynrVg4gO8
         RHfeT1oboc5v/YO80bOf0fvGPbqbTNCt4XiPR6HwoJR5QumDAX1f7X6kCGBPpJOKoi8r
         TCZHyylqcwT1AYr+LiPYtbzmo3uDUNDHPvfH9fv6WUnk5XNu1527bXtUv219PHm5oRR2
         92sa84ZA2HC/nDYpLZ4zhxgojgvbDsVFbDyzZPox41b9bF/atE4Fec6r7bFDrzZUOiWX
         Qh53Oju4i1EK9zxoGqpxIf9wfXu6/IRTquWi9UmlQJrGBG7FI4lagTmYFpJfeGtxuQTN
         XFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283240; x=1794888040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUfxuzZXIT5avg6gl1nxcM7YkzRMwGmAk1oGIMF99rQ=;
        b=BtMFAHL9wj0Yohdm/2eZiCkOcnuGoKlOSpJpgiB6cxE/dD7jtl/luzWnHlk5Oh6WxW
         mI8LvNIPFrO6mQDNB7OsvTV0XH6KFR7fpna9Yb7JISl9uUWQAG4hgfc5IXQlE4qB5xjQ
         uWHEIZe6L3Z+g653FhvfLvy6I3NgbCfTLV+sLUspWPPcblfM/qBT3sAnvziGlMwVWMMN
         bOFtogEgHxs3q8YhWTRspdvRTGhUmf3TeDnJZRg5d2n3yDRKL8aETWsylovQG50Rv4pW
         KtrjvYYjXTKoayUEDOB0oa8cBVRz/APyJtMo2dTQOnOeK3wl7PYHJQ6EdqG7uLvVwIWL
         Ru/Q==
X-Forwarded-Encrypted: i=1; AL+hErHB7uTTRTMwHFBX/ZP0XAupIKXEBS5rJdg88LiaaMOySfAl/7XrOPT5CHr8GGEPj2aER3w=@lists.linux.dev
X-Gm-Message-State: APuU4Z/IF4/N8DWUGqYbCO49lTXi/2Q2YTup7aRk+xSUeSuI365uu3mD
	ieQezOoeFEFwv37WBUhytds8LUv35zSFLRKkQCk2DsDLb/2HpLA967grQ+959duF
X-Gm-Gg: AYBFou1EBqtNDsPzUnforAaqF1fIk5Gwpz/e7A7MuX+MVmy3P0Prqrreond4Q7mHMsV
	rW6Xt2USmJVtRm1nHOCnGvk8rRLLa5a/FKtXQodhgnt/vKigl/7ZIOeD4MyVQtsOn57kU0ykLqG
	cU1pbDH0UbYAHhqQrQh+Izg7agNeXKWo2zofdV9MUdxLZZTBviwaUx4We2XYACtpBJJhgPhHNgC
	5f4T8xbpxV9yOvxA9D0gwGs5+Jbzl3OECE150eRNjfqGBstMWV5WpEDjljkl98i6bROPsaJ6o2d
	bWqU3E47x7X/Iv0d3DGh/6GGwo1cGPlMjcEWb278QBhKQd/pfwooXMICczaS11HLM+aB14S1xAy
	nqmrrA4DvmfCKb61poekmT50XPEdiJGO3XtCN7emiHRSfM8tO4j3KIXp+yLm4rLdKbqsxrDJc9o
	2fwFf+rIXJciCEQtbQ4y4PXq2nFTGhkdgAK5JYlO4N9EY7iZnOQvn4PrA4uMeIlFsoCrEqP3CCs
	2Rhj+c5ZShtasd1SI0uw98EzTgm+W5/9mst258qkMPf0kSoomZQL2fnv0WY+bLSAOyK35IeO37l
	njdJgKBlaOawahetLLmN99xd1IyQ3yvLJgJsLaPZMKh5ZVEIPi58+G9IVvHrCyYbIvjzkF0LvIP
	zGQ3f9aljNROxlmcprEhakKmqhpLjSt0KC2bZtNgy0W0ZmVJqqrgawq+nx/MEUljqPCr2tIkke1
	B3eRpMyE2GExcbp8oXGjtHnEfxLXH64B1rcJYYIdK4WQZ4C7i4iywni3IV1EozlU0PsN63U4VX
X-Received: by 2002:a05:6820:f02a:b0:703:3ff5:ddc4 with SMTP id 006d021491bc7-718a188120cmr678015eaf.11.1794283239825;
        Mon, 09 Nov 2026 20:00:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860dcc1d759sm1028178a34.23.2026.11.09.20.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:00:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 21:00:19 -0700
Subject: [PATCH v11 4/8] serial: 8250_omap: quiesce DMA IRQ handling before
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
Message-Id: <20261109-submit-serial-8250-dma-cancel-v1-v11-4-6364edca63d6@gmail.com>
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
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_omap.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index 5e114dd8f9bf..51013dd2d851 100644
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

