Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220536;
	b=y0OteQqgv37b6DOsKM23JmXmsHnP39c86W76YQj/edhY3KgwKHcBnpo+XYazXXSpbPam
	 7zF3Hq1OlSvy3ZvdrforJMxlU8Q3ScMaFeUK+2W1KkFgjsh6bzravsaKYyw7hvpRB+aHK
	 rJhtFXQSkLwLVsD5OEDCdh9m8SEYq2yL+RUutBAJujXui1kapN9zbq+pxQFUF6uYle/70
	 NBPy7YSn9VCtCbLeUhUQD7pxbok3ehzO9dzqqlaArPGnNgPWplyplPY4bGtdZUa0w8/eR
	 pWPPXZUYrHuUy2ryqbOAMbW5xVBReLIlJ82FM8141SGEaeUbWchCIK+rUu1uwj0grGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220536;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vc9uFw9UVF1A8RYaaUz33Ia3H+vJB3EZ/DUe+0FMK90=;
	b=ZoC5gTSBdnQ2h2p9kTGHv5oKfuw3TBYTVExCNCj9VBULrhonHK4Vg2nVJR0y6WLhdalW
	 475Mdb61e/f86EidTs/7l7L77A1Fn461CRDTtCEr7JsHx6J44FOYZ0ZOSb4IsUe/VO0YI
	 4OBnfWI1jqWhd5EBYbmLG7ieEhXKWIz+cbH2PeeLa9fwGYAcQDC5mJuB92OqAbJRajglj
	 i8to5Z7W0Tx7oaFHYe5IezuN5nEcPEV78R0pSN+B0y3jx4xuY0rSqCkR28X+gocw4gMBK
	 uS8Zfb0P7qbDZ+BUwoWSgWO3ZtixP+ScfMYY23hjlWNN03cx7Rg1sG8GC6mOD8A6OSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hZn5XLqO;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1BA606A320
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 20:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB1BA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hZn5XLqO
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4a451915d8aso840361b6e.2
        for <imx@lists.linux.dev>; Wed, 28 Oct 2026 13:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793220535; x=1793825335; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vc9uFw9UVF1A8RYaaUz33Ia3H+vJB3EZ/DUe+0FMK90=;
        b=hZn5XLqOgHouXwo8h6/NpWJCM70t/oJxyVNIYebLx9n3eDLMuYi1bOizqOic6TyhFA
         9hQiPQrnNhfJn/6ZpFu3A/muv73i3yWnRLYHWTJ8E7s8A9ntq3N6wczqxNOgyBNqjcxB
         hqmBUvCQGH4PS2fnlmS60ruU+MZec7JvIr3Vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220535; x=1793825335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vc9uFw9UVF1A8RYaaUz33Ia3H+vJB3EZ/DUe+0FMK90=;
        b=tOy0fLf4+BIGSNpTk3KJan0QxsH0/VYF5ZlBgV2dxGSoFKVjXoPcLGhXKKcyhghJQd
         adILmEnQKf+1btJumO1UbgTJ7HgNUOPMhzgVtutcnZUVqMB+1x6q/YW7zKlbASVX5wpx
         RniVabSLPkpYUHzT2S42H+7HQUvvE2TtVweysQw9P/VkZj0yupvmddkiIZrobwR4Zwsu
         qlEOGvFUDn/PKDvviBEEED6cRk+ysSKZexyMeFoLODQtrO+BbwFcdNhNfF362CAQw6j8
         1XTJi73/v4M9xUrH8eIeMhg+okWrBR1O9ISKq4+FXsqNCdn7EGsqp+aYPHYrA2gjyQO/
         uYcw==
X-Forwarded-Encrypted: i=1; AKwUvBzSsRX7giU8z3TzS/Z4wrlIebB81YJ+Hz7gm548coDMJFIv/U8bNYiVg2a13L7xUEfcgYk=@lists.linux.dev
X-Gm-Message-State: AFq9FYIUPAlHaJ/RPa3NQGZe5FXnlcWe8UrvajD5//oRxX6qrrFWCuLA
	NUPvd4buWpNYsIV60D0OCO5CXgVq2cDgYdb+JGkbD8oiYUJCB+qCxtkHdRj2eIpSlg==
X-Gm-Gg: AYBFou0KsqjXNRR/kt4SsUdsYgzRVAwG8ApY60vRG1qyFONORsI6GtdMjW95hDcITpR
	aHHt83nYgvNEiTJrTfcTZ3P3yLVBJMLhq1Ib41jgebXD8igsnbgYp/NIgN2W1SzHQS7+37GU+fi
	/n+osY59HcBgVy8/kmo05wzWC6a5DuIyFZj7lDQ+V87sFELdJs4+N8Pyk5qw2se4coCBNkmxPUp
	KcbV5cWV1Tqb5idJS42u1R+I5uTTt2ZT/qWUxVVmaWGQyQgJCT4mw2Rphv2qpmW86/tqYOV/VHl
	M/NXaFLuzWsGounVNhg6cP9L5K3rRRxKimGNXPE9J/+kxJQO8QBWNNPy2BuP7N75/WhVQPD0CFC
	jlINdXAC//xpLPQuMEKA94JnJUf/DUEBlQwiLPeMOHpIbHl4yqX9i3E1Jb1rYTLRudf+P+eGt8j
	0djDE0NCXXBsAUBu1nJzNI/PsTaYHOPWdGCkFovg6P/z5RPaYo3rBmKpodf6h+Y/WoHy7ujNdHZ
	pLvPdUVqEszdB8Lhfm/VVbUMgIe0K3wHUHBLKRTmHwDIhb7o4hrP9Qx4Ggf66Ja90oBPkeO5JkS
	bd1ck16RYkkdEnZBIUCHjtA4SCnt3xLJ/NeUVLH192Rn1VzkwidV7jv7NWnx8eS0/No+GxbV6hx
	GI5MdkEcLGShLXr7OIw==
X-Received: by 2002:a05:6808:5090:b0:4c3:9892:96c3 with SMTP id 5614622812f47-56385c45dbbmr2597003b6e.22.1793220534711;
        Wed, 28 Oct 2026 13:48:54 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c363902esm2281137b6e.2.2026.10.28.13.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:48:54 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 5/5] serial: 8250: retire canceled RX DMA before reusing the receive buffer
Date: Wed, 28 Oct 2026 14:48:47 -0600
Message-ID: <20261028204847.3471382-3-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261027-submit-serial-8250-dma-cancel-v1-v7-5-985a023ba4b4@gmail.com>
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com> <20261027-submit-serial-8250-dma-cancel-v1-v7-5-985a023ba4b4@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi James,

In serial8250_rx_dma_flush():

> +	ret = dmaengine_pause(dma->rxchan);
> +	status = dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
> +	/* A completed transfer may reject pause before its callback gets the lock. */
> +	if (ret && status != DMA_COMPLETE)
> +		goto recover;

Checking `status != DMA_COMPLETE` assumes that whenever the hardware DMA channel
has finished transferring the buffer (causing dmaengine_pause() to fail because
the channel is no longer active), dmaengine_tx_status() will already return
DMA_COMPLETE.

However, dma_cookie_status() only returns DMA_COMPLETE after the DMA driver's
interrupt handler has called dma_cookie_complete() / vchan_cookie_complete().
Because serial8250_rx_dma_flush() runs under uart_port_lock_irqsave() in the
UART ISR, if the RX DMA transfer finishes in hardware just before
dmaengine_pause() is called (or while local IRQs are masked on the same CPU
before the DMAC hardirq is serviced):
- On dw-axi-dmac (drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c, used with
  8250_dw), hardware clears CH_EN in DMAC_CHEN when the transfer completes, so
  dma_chan_pause() times out polling DWAXIDMAC_IRQ_SUSPENDED and returns
  -EAGAIN, while dma_chan_tx_status() still returns DMA_IN_PROGRESS because
  dw_axi_dma_interrupt() has not called vchan_cookie_complete() yet (and
  dma_chan_tx_status() also reports state.residue = length for non-cyclic
  transfers until dw_axi_dma_interrupt() runs).
- Similarly, tegra_adma_pause() (drivers/dma/tegra210-adma.c:696) returns
  -EBUSY and omap_dma_pause() (drivers/dma/ti/omap-dma.c:513) returns -EINVAL
  if the hardware channel cleared CCR_ENABLE before the DMA ISR ran, while
  dma_cookie_status() still returns DMA_IN_PROGRESS.

In that window, `if (ret && status != DMA_COMPLETE)` jumps to `recover:`,
dropping up to 4 KB of received data and permanently disabling RX DMA
(dma->rx_err = true) on a normal transfer completion.

Also, on a related shutdown note in drivers/tty/serial/8250/8250_omap.c:
omap_8250_shutdown() (line 775) still calls omap_8250_rx_dma_flush(up) before
taking port->lock to set up->dma->shutting_down = true and clear UART_IER = 0
(lines 783-786). Because __dma_rx_do_complete() clears
UART_OMAP_IER2_RHR_IT_DIS and dma->rx_running = 0, an RX interrupt or callback
in that window can see shutting_down == false and restart RX DMA right before
serial8250_release_dma(up).

We also published the TLA+ model and TLC counterexample trace
(Serial8250RxDmaV7_HwDoneBeforeIrq.cfg) here:
https://github.com/ismell/linux-8250-dma-tla

Thanks,
Raul
