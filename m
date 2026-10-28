Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793220534;
	b=wdR9O2cf5jcdWcJ/ew7ZtTdINIrYDziL+flOyzJr/z/2xxZMTz9cDwTtMrZWcOlyxQpY
	 W15SiAhwvb7BOmTzTaqmayzPDh/+t63s8LYuM9jfA8vCiao3uq7gkjqy4eZJfkujRsmOX
	 qmdB0NCDcGQgSeYsVtoX1/TmxI5qNSI3Np1T7kRjAvnYyVlYP/sWmkFz2ABJvYgL3XxMC
	 p6cVS4M3EhLsw6grlGQvmJUikUpbCkkSjDsQIWHlG9e3hhvcQ7llWWXAcgj6KgnDB36os
	 m19GfDb4Tuwo4VG+abd6d8STAJvdMqO6pqidwV4Zg1R1Djkye5HuZ0ipcZVqJl0h2tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793220534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KlFs5O5F58aRmAuOBc20ZN5pSWMjbwV9elx9B8mpSCE=;
	b=WcLM2+UF9UW4eI6tQ9G96QNJ2ByHyvJVT2/DYSvXxxNhWsI5mdX2ZbQNt67aOWpyAHTW
	 Z7bVdaWm/O8fAKFAQX0Olr+19Y3h4WRIfa5BbMnO4vz6mHhrfkZsTwqQ3DSEN8KzyNvP/
	 RhcYlrlsHpUZXgyZSRcdVH0Qi0TJR1jipN8frRcgi5kkhjvFw5ly29QgCKVDJKlPMS+kG
	 oX1OdCXd65rXcAh8DGQhDORXOl39qIjYb3LYTi5pLl9HBsizVkzG0lfVBtFtyQUAoXg/L
	 tJydKfsjQ+amJGY64U0t4ZkIZEgVjFZXGxOCqJpPMVf+G/gx4CiI6XTQmqGHhpzMgVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ltfYuzD0;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2269606A32C
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 20:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2269606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ltfYuzD0
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-55650fe1f0dso662812b6e.2
        for <imx@lists.linux.dev>; Wed, 28 Oct 2026 13:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793220533; x=1793825333; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KlFs5O5F58aRmAuOBc20ZN5pSWMjbwV9elx9B8mpSCE=;
        b=ltfYuzD0s+5RUO4+xiSuWg1FnqzTi0+ezKIJXxjrjF+pVp0U5LyI/KEHMiNGZ54zEO
         Lzf6Tr0yEzBEkx1/vbSXpi/h2lyf86C/LbUXKNlBbwWojFDTJJU184Wg0b5e21OCpTvV
         3YRlvzHBwcpBO2AU8JPAx4mN3fEiNrLk0ovwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793220533; x=1793825333;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KlFs5O5F58aRmAuOBc20ZN5pSWMjbwV9elx9B8mpSCE=;
        b=ZJBcCHgbAenQmpYruW8SsishSqFSSw4/aDxXkW0RTIpzLELVr9W4bFFSQdioi7Mxcq
         Ig9xNBu0ghyqRi7vpyIs7ByJxvjGuoZTV9H2cXhp0waC1EXNwxzGXUxAW+0m7Ra6deUt
         wQu9ChWj2m3+cYXFMYH+Zy9ZWEYZX+0vvIofYEHqy8WT4fPSXFdAe/RUtFUPcSdOISWM
         Z10pYJ2oTFPTWOpNLvm6Yy8KhEYlFgp6Z6OvMVA0MkEHMAPsiL/GvFN4fzve1C4hZkKf
         aWjJU1SfRli7tkEbQLkP76kQYtYydNqGBhmyoCNL4ZFFlx2js8ZRGa5MYFlBiIRahxHN
         1Xng==
X-Forwarded-Encrypted: i=1; AKwUvBzj91r4MzeBPMmlBnwlw1s9Ttoadm9Kp6k+70VeW3iPlBTMuVVgUWT32EONrs6dxEBxmxI=@lists.linux.dev
X-Gm-Message-State: AFq9FYLleM+ojb7z5aNQ4/pUbhUpRNb2i3idQjgHLPpYqUWy9Tcd33gV
	5+wqUTKiaTiNJTg3eicn5ntZtdDZk+9bkc/f1qLHMPAa0ys9pqP1agG0kPHOi4urUA==
X-Gm-Gg: AYBFou3LgLfYsxAl+A6l0fKvJV1BAALmAB+JnVFdGlBJ2StNBAQaH3e4CovvcaxS/le
	Q4ahZx+32BP1VRBgLewDRhc2K0n89qywU9EBK4wsQkmh3Qv9cw/gSF/IuG18NPAs7WFM0fDeTiJ
	oNcc4NxkiO8TNg76S3zYlsGjzh8X0ltWpH7oQbSUyuJxWk7dwprxk0xP4V9HVMTQIK8qcifcCrS
	bks3fs5r+7LUDKpcfOmsMkyn/tzelJ5pFuAoQRNeQ9KNaBoQBuOnOBxWwwBSzC8AahiPZvJ4Fbh
	UggRQ4U8TbQagfGxkrS9GHsBhkO4Vmh2uMSNn7pSsKQ7387HeiLkXUz0tO2cos01BvHZ8hnhJkT
	3mh+qHFUmZXD/l0b7jXOtbk4P6En2H6gjL+r+xvazCTl8VJCmzKOyZTe6WLJMxWBJlJxAsslLXP
	oNmxNpvhDR43XW8GktvzZEo1RrMR3I60IiYPnYH6iWEKcpEvJZvsOvcDChCrBdDDWc6H+4LZV3C
	+7qrSxCNnYe2X9qtqdL/tWITsOip08HuJd0mJYXVugqui9SL+95UCMuJlQjrWMqroGndZ/NKt6t
	dog+cMCy3SkJF5gbQoI/KJCHuPaCCl8YJ2eW6h21SpmjAw79BRxk2p76jmtF7PcZwS29nMtCvJU
	fPj+Jvm+qjBL6SDK+2g==
X-Received: by 2002:a05:6808:4fe6:b0:4d6:90d3:e18b with SMTP id 5614622812f47-56383e93e14mr3396274b6e.52.1793220532771;
        Wed, 28 Oct 2026 13:48:52 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c363902esm2281137b6e.2.2026.10.28.13.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:48:52 -0700 (PDT)
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
Subject: Re: [PATCH v7 4/5] serial: 8250: drain canceled TX DMA before reusing its buffer
Date: Wed, 28 Oct 2026 14:48:46 -0600
Message-ID: <20261028204847.3471382-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261027-submit-serial-8250-dma-cancel-v1-v7-4-985a023ba4b4@gmail.com>
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com> <20261027-submit-serial-8250-dma-cancel-v1-v7-4-985a023ba4b4@gmail.com>
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

> @@ -37,26 +40,35 @@ static void __dma_tx_complete(void *param)
>  	struct uart_8250_port *p = param;
>  	struct uart_8250_dma *dma = p->dma;
>  
>  	guard(uart_port_lock_irqsave)(&p->port);
>  
> -	if (dma->shutting_down)
> +	if (serial8250_tx_dma_blocked(dma))
>  		return;
> -
> -	if (!dma->tx_running)
> -		return;
> -
>  	serial8250_tx_dma_complete(p);
>  }

Removing `if (!dma->tx_running) return;` and relying solely on
dmaengine_synchronize(dma->txchan) to drain completion callbacks breaks on
DMAengine drivers used with 8250 UARTs that do not implement
.device_synchronize (where dmaengine_synchronize() is a no-op), including:
- drivers/dma/sun6i-dma.c (Allwinner H616, cited in the commit message)
- drivers/dma/dw/core.c (dw_dmac)
- drivers/dma/pl330.c
- drivers/dma/mediatek/mtk-uart-apdma.c

On those controllers, if Transfer #1's completion tasklet (vchan_complete,
dw_dma_tasklet, or pl330_tasklet) has already dequeued the completed descriptor
on another CPU, dropped the channel lock, and is waiting on port->lock at the
start of __dma_tx_complete() when uart_flush_buffer() ->
serial8250_tx_dma_flush() runs:
1. serial8250_tx_dma_flush_work() calls dmaengine_synchronize() (which returns
   immediately because .device_synchronize is NULL), acquires port->lock,
   clears dma->tx_terminating = false, and calls serial8250_tx_dma_complete(p)
   -> uart_xmit_unblock(&p->port).
2. If no new transfer has started yet (dma->tx_running == 0), Transfer #1's
   in-flight callback acquires port->lock, sees !serial8250_tx_dma_blocked(dma),
   and runs serial8250_tx_dma_complete(p) a second time even though
   dma->tx_running is 0.
3. If a writer has already started Transfer #2 (dma->tx_running == 1,
   dma->tx_flushed == false), Transfer #1's stale callback runs
   serial8250_tx_dma_complete(p) while Transfer #2 is still active in hardware,
   syncing tx_addr for CPU, advancing xmit_fifo by Transfer #2's tx_size, and
   submitting Transfer #3 concurrently with Transfer #2.

In addition to implementing .device_synchronize in the affected DMAengine
drivers, __dma_tx_complete() (and omap_8250_dma_tx_complete() for symmetry)
should keep `if (!dma->tx_running) return;` and check
`dmaengine_tx_status(dma->txchan, dma->tx_cookie, NULL) == DMA_COMPLETE`
(matching dma_rx_complete()).

We modeled the v7 TX and RX DMA cancellation state machines in TLA+ to verify
both the counterexample traces above and the fix:
https://github.com/ismell/linux-8250-dma-tla

Thanks,
Raul
