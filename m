Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312862;
	b=cvekKHwHtVewktKQewvH9+EkDP6oWIcB4rLZcI8RyHBUCzOhYQ3gJgh/4z5mZBuPovN5
	 DzWybOKVzO/9n6qMjnogBrdp82P5pEKYGTI0qOfgE5isR+ycVOmWCtZmIh+ucdFIKUVHV
	 KuHtZVSWyKLO8ov/yOKaj7I3N2wRhmdSvaf1rH/ZrKkxfHtFREor4+tTasmi4bSRKitrS
	 pIWCqv047tNaw7XZjbzLfdSNTQmEltSXqVxZZwR3o3pdB19UclExxizrrP6El68g1c54x
	 qhI5G2PhMN0Rmv+ldHveb7/xrlxUQkXG82CuXe6C8gLggW69q5quPwfJpgl9Gj8x2+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=XxsrJQyS+nOjzlF7/QV42KG9lGt3qkw3rRZfnV8/yI0=;
	b=SeKjZeDTh2oCMwnlxVLArwHSdnK18Q3X6xLmvgfIeDwjRFG4sAXDyHm5IV1KfhFKs164
	 kVsQWFFT1qtXmCoJaKCUST7BaaKr/a6cuyEq8GZ9ZbtYv3eGG30fQHU1fv6MGvdVRGzDl
	 an5wJZ6XGaWQbTZ2lhuZ9b32pLJXnD+3e8Ip7z1c81PF20RI3cuGpsUGT2CFFdiYUYdky
	 g/0VvlgpEiiotLUV7FGLlH2cCh2xC5GmpVahtIth7HohbkBdx1JnqzMqPjUgoAjDCxBSj
	 B1CP3OA0GagfLelCBpWAuwJ+XeSJ6DQ4t+tls4kdxfF2BHzgy/rm9gPGhSnqLgTwpEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AMZmGHpM;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD7D606A31D
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 22:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BD7D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AMZmGHpM
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f48c750afcso113898a34.0
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 15:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793312860; x=1793917660; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxsrJQyS+nOjzlF7/QV42KG9lGt3qkw3rRZfnV8/yI0=;
        b=AMZmGHpMIM+C6SvaQKjBjOOLaGmQqT3cOcBkqojbAVBP8nXRHBcxOS1hdphCYMw/dx
         besBXjlbhbqB6CB/ewTttBlshByvtKQiwk89uhbNokWo2jftT2ixzik/i5PQe9E15pbF
         eDoDY+LNXFAIXX198BuV1M6FWDWUL8PHbzRkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312860; x=1793917660;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxsrJQyS+nOjzlF7/QV42KG9lGt3qkw3rRZfnV8/yI0=;
        b=rYQcDqaeTKv7fQO+4bsL1jRHMtiI9x+zqYd3nolxuS5itYFVHi9tj8LNZzwjMjbjjS
         o5nbJXnAaOKxIjiIJNzrRXz3E36oSwC4O2CMQdQREhV+88MZOS8Epbzq84LxMu/OOUvy
         tZ82uAU9hhMNLH9F+8tG8VcXQfOSOzLabgME0fXl0+lwdC1m+144I33EMgQcnOnHu3fg
         kGLbGj9xKuastp/8UdVIuTD5mGK7LHOXU8uuAyypSz5N+kON1YcIh5dqn1I7fovyLRyy
         Wbviv1byhVLkOejbxkysKer263yl1D/99W8Nu+/cniNGG6Jo/YzuOe3ttVWSgWnEsMK/
         PTBg==
X-Forwarded-Encrypted: i=1; AKwUvBxNiHpsuza1YOohoPi7EtYXUG6ME2Y/FGltcWQHR3FEP7q+8mhYNqRxpoouvy3Dhy5FpjE=@lists.linux.dev
X-Gm-Message-State: AFq9FYKuL+IzDhIhbqvFj0rh63hkRmrs7iaLPu71hqUgEKz8nFsUANIa
	N8QLdM8N6jlI+WmOEYTdkf1M57S6o1nm+gNEWY3KOgJ0KaMXoMxt5GgrbUBHNgq4sA==
X-Gm-Gg: AYBFou3u84/f8zFxbYvHOTUxrZd/4sObpsJ8LeEtM0/Jhm94Xa3fG2OIuZvFoIwLHZZ
	MIuxnBVPqhJm/+4unathnGSTrc3KweuPtW+iZdgLqTkKEPeVvy0piL+CdgYYiKJxAiG4y168z8v
	K16h5olCz2ASXFRe6NOoCHRHjiKaZ7vrGBbuvHUYIZKYWzP66n2IvszFCwj9BshH5Jt57JpF9hi
	BFS2WVb63bSm/tR9eXzVR2NCSHKqHrrswjR6W/JA52Xt/R80tchVl98Ka0Scvp1PWrfSvCkLPAi
	swFh9Wdplpzscf2/yQBPPcNIbJiLN11ClsEzT1u+uJTQuU2m4q9Uilx7FbGbNz0r3wYYW38xiZI
	PwxI87NKlgUZP04UEgZjcsOhp4rm9AlTKKxjPrmROHOcj4H0Deu+tgEACk8Se1gmoqD9g2nD7zS
	Q8dyN4HyfQQhc0jqiMcgt6rxi+ZAHQbbMrlmTYP6+Q+oLb4mVDJpBvXHyq4r//MSybGEc2pc4RQ
	VdOU+nmfZVcYrU2gdysOHttAUjDbmVTN9srB1A05akBaFfqCxqqvkv0NzqYKnG5PdR45b7n9L+K
	6tx5X+fVvT8bRcAppMb/GgiRV2e67CwIrI/usImKeoCOgYIGZauXXUb+8aPf10G90fh2zI24NXz
	eURFPvNKRyJ2N5rY8BotdtEKpHvhH/VsGg+Ld
X-Received: by 2002:a05:6830:2641:b0:826:b77:adef with SMTP id 46e09a7af769-85d363b89f1mr545837a34.14.1793312860205;
        Thu, 29 Oct 2026 15:27:40 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545b89asm718163a34.6.2026.10.29.15.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:27:38 -0700 (PDT)
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
Subject: Re: [PATCH v8 5/6] serial: 8250: retire canceled RX DMA before reusing the receive buffer
Date: Thu, 29 Oct 2026 16:27:33 -0600
Message-ID: <20261029222734.3086943-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com> <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com>
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

Thanks for the v8 updates and for opening PR #1 on the TLA+ repo! Confirming
that the v7 issues in Patch 2/6 (lantiq, dz, zs, jsm_cls), Patch 4/6
(__dma_tx_complete tx_running check), and 8250_omap.c shutdown locking all
look resolved in v8.

On Patch 5/6, we updated our TLA+ model for the new rx_pause_pending worker
retry loop:

> +	ret = dmaengine_pause(dma->rxchan);
> +	status = dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
> +	if (status == DMA_ERROR) {
> +		ret = -EIO;
> +		goto recover;
> +	}
> +	if (ret && status != DMA_COMPLETE) {
> +		dma->rx_pause_pending = true;
> +		serial8250_out_IER(p, p->ier);
> +		return ret;
> +	}
...
> +	for (;;) {
> +		scoped_guard(uart_port_lock_irqsave, &p->port) {
> +			if (dma->shutting_down)
> +				return;
> +			if (dma->rx_pause_pending && !dma->rx_terminating)
> +				serial8250_rx_dma_try_flush(p);
> +			retry = dma->rx_pause_pending && !dma->rx_terminating;
> +			recover = dma->rx_err;
> +		}
> +		if (!retry)
> +			break;
> +		usleep_range(1000, 2000);
> +	}

This cleanly resolves the race where a full 4 KB transfer completed in
hardware just before dmaengine_pause() ran while its DMA completion hardirq
was still pending (once serial8250_rx_dma_flush_work() drops port->lock and
sleeps, the pending DMA hardirq runs and marks rx_cookie as DMA_COMPLETE).

However, what happens if dmaengine_pause() fails on a *partial* RX transfer
(0 < count < 4096 bytes) during a normal UART_IIR_RX_TIMEOUT where the remote
peer stopped sending and is waiting for a reply?

(In PR #1's Serial8250RxLifetime.tla, Spec puts WF_vars(ProviderProgress) on
Receive at lines 67-70, which forces the remote peer to always keep
transmitting until count == Capacity and CompleteInHw fires.)

When the peer is idle after sending a partial burst (< 4096 bytes):
1. Hardware never reaches 4096 bytes, so status remains DMA_IN_PROGRESS
   (neither DMA_COMPLETE nor DMA_ERROR).
2. If dmaengine_pause(dma->rxchan) persistently returns an error (-ENXIO,
   -EBUSY, -EAGAIN, -EINVAL, etc.) on that partial transfer,
   serial8250_rx_dma_flush_work() loops forever in `for (;;)` calling
   usleep_range(1000, 2000):
   - It holds a runtime PM reference (`guard(serial8250_rpm)(p)`) and wakes a
     system_percpu_wq worker 500-1000 times per second until the port is closed.
   - RX interrupts remain masked in hardware (`rx_pause_pending == true`), the
     partial bytes are never flushed, and the port never falls back to PIO.
   - On 8250_dw, dw8250_idle_enter() gets -EAGAIN from serial8250_rx_dma_flush()
     while rx_pause_pending is true, causing dw8250_set_divisor() and
     dw8250_check_lcr() to silently abort baud-rate and LCR updates.

Since the only reason to retry pause/status is to let an already-pending DMA
completion hardirq run after port->lock (and local IRQs) are released, could
we bound the retry loop in serial8250_rx_dma_flush_work() to a small number of
iterations (e.g. 5 retries)? If rx_pause_pending is still unresolved after the
retry budget expires, calling serial8250_rx_dma_recover(p) under port->lock
will set `dma->rx_err = true` and `dma->rx_terminating = true`, letting the
worker exit the retry loop, run dmaengine_terminate_sync(dma->rxchan), and
switch cleanly to PIO.

We pushed the updated v8 TLA+ models (`Serial8250RxDmaV8.tla`,
`Serial8250TxDmaV8.tla`, and `./run_v8.sh`) to:
https://github.com/ismell/linux-8250-dma-tla

Thanks,
Raul
