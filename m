Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381800;
	b=Ws38QL0AAnBSW4C3ZdTeXdnYTjR/jAdya68icf2IDKMnYw3vzgcj/DuxYTl6B9hNTkXr
	 oDoKK6jWJYxtsmB1sApe7kemc2MquC8q3JQtuhMoanDx/S2iIN6tncIMUTcDOgW8jh/iD
	 gqwl7gpF46BxgQi3WkCSnzwAS7o+Iz0Vq8HtDDUURIX8k+GtGIVqBkh3IAOC+m7kdjMVY
	 07cqdgGypFXiBxNxQXu79dpK2VaxueLGkOCUiqamgtt41NrSi29avc+7wET0Qp8HUvGF7
	 HngSsXChD6+6IdBjfcPI6sDDrhE8Pl4EtMK4dv6eFh2DuLMogkOsSaPmy+zn+PEdegw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=r5fedtBZtI4w1DXYYWOd9TkcAOuj87FP9VlEYhTELuQ=;
	b=Oy/98+77otIJ3vZvxTkC9Xl5VxQq3tXFWQXp2T4kmcOaMAL+k0dq0PrFkxtT5iNF9I03
	 GZBcBUG4JGcmhiink/E0Vu/zi2ffHlEHcj53gwAUU6+uxJbMQSxSG3QO5wOPGCMnpN3hP
	 FrFoiUBNhFAcwXuxnWQ+BlSxOL47eSRI1zczy1nSnXD5ulkLjwMC9GzyDfsrT9aWv5jHx
	 eBIo2enHkGnh24/aYegGj1vcgehCyJnxcM5Iti8ev9z5jEcDaa890u6Rg1WYzmJc7azxl
	 wiwM7CIB6WosiAyGNRtMQo3603imahWFj0ZiDI+BXmLAk9lP8/RjnrkZdJSsiaYRO7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ohhCszky;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3AB606A31F
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 17:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED3AB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ohhCszky
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8470d7d430fso419113a34.3
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 10:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793381799; x=1793986599; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r5fedtBZtI4w1DXYYWOd9TkcAOuj87FP9VlEYhTELuQ=;
        b=ohhCszkyUJ543Kfbrsx7CcQGZ7hGpIrrYPUAuLB7HIe5QZBx9R+HmbdJefKT0MWeNT
         hLJGNTaxSDpijzND5uGs6RjjVOntcMthgRG+6SecldPc4suUvYpV1NpRkzV7rVyIrlxD
         4eMATB1URKJ/9mOHPizhxZkP/Z23vr7t5GSgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381799; x=1793986599;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r5fedtBZtI4w1DXYYWOd9TkcAOuj87FP9VlEYhTELuQ=;
        b=FYOY32RobU4oS4TjUaZTy9tpBOtvmQUy3j3W0wFhbNz9K1R9TDLrLACmg1o6O+7gaJ
         RFJ/W8cS/h1T8fvT98KWlKv6Mpzm41n5vcnj483ma6idbwO94bNUTieiQnyBBkf3GqwF
         P79Iy0wAhnMd1Dy/Kbb90QOyjGGK2K1+pKtEEgBjkWHhNqQ5imYMuQPZxyzR2Df7X5Q+
         cIUWkr+91Ev9Ns37PfVCXBjyd1iliSVf1o7MIL0Xza9xB7+ftjoMDgsOzh/kLNOtshwb
         5SX7Hu/39SF9uBCZsFrCGVFK8V3ad1t064dbhbjMdD4LRae7CLY3z59oSp/bsq9wM0CX
         DoqQ==
X-Forwarded-Encrypted: i=1; AKwUvBySssr61HWHyPqDy8GVgwfKsYfiI8qxNwFyoGp4aE6b5vnJBMbfk0f3d1/HvyVJK2YRlJM=@lists.linux.dev
X-Gm-Message-State: AFq9FYJrGXFIvBq/KnEvRGbgeU+vm4Oi/pRHas/tJ3gZeh9W7Cpil4Uj
	oT1rP3+b7e2o184mmEz5aUypBt6W5h4vj+O/1AcFcb67NAFt1b/pyv5NXqv3OT+Lrg==
X-Gm-Gg: AYBFou3tx9jPLKsZpAGVbC/Aii+0RIiBJ/jwEj8NJIUoabx5oUUryjroHHH3QPZNMxd
	h7NtKGY2b9U/Jh3OtzMwAoL5c4pJC/kNFyA4AEZMopZfsta8th+sj+DJGHgIkL237k0fMBkIQb8
	+Da7NQDOEvdjlvV95zG314srPl6S0wN75V3nWLpNfXOiSiQ2lHRRhRpHVFZHBUmvzz4kOT0jJ0r
	E4lctHSOAGpXYAzQJ4X/vS/afUrWPdi4qGQnDBeOly8PMXxPf3k+W1uN4IvBXmjVCQavDgHlfr/
	JL9OKUHBQVc2KzET4hojO3WfC4T3xl0O50l+smldzkz8ojoWjBZvj9FgmCwCMkbpKNJ2QkxNMbM
	SJdbDJs4QdW19GyYPfQXmYfcwvzx6weVvYX0ItyZluARbsewlbPPPtNGZTfC42yWZ9+SFm/IZiT
	gI5T4gGooN91rribv6sIApVhKhNlAkxw05pXCcotSwSbjx+Nww3A2npH0Gt6PZoY2BGCZSjknOZ
	mlSmid1DLTvR3lOE9iNjsiochfQwQ9klhpWUbGbEpT5rt4xQq8g9uyzFuvyqhpQfTxl/fF1iXfw
	Mk7jg/XYrKlvgSbipI3bZWXsf0iIfDrC8UHxwzzRao0bk+u/t86y4EzBFL68S1CWe6xOu0vS+qY
	3EigmHbOmT5yqh8Y=
X-Received: by 2002:a05:6820:625:b0:709:529a:4775 with SMTP id 006d021491bc7-714f6e7ffc6mr1212713eaf.50.1793381798577;
        Fri, 30 Oct 2026 10:36:38 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354efebesm2497044a34.19.2026.10.30.10.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:36:37 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?UTF-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
	Pali =?UTF-8?Q?Roh=C3=A1r?= <pali@kernel.org>,
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
Date: Fri, 30 Oct 2026 11:36:34 -0600
Message-ID: <20261030173635.2186490-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <CADvTj4qK-1SX_+YZW1jdW-e5JOZ2iz3vAK_8UvkyZWb0rAeyiQ@mail.gmail.com>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com> <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com> <20261029222734.3086943-1-rrangel@chromium.org> <CADvTj4qK-1SX_+YZW1jdW-e5JOZ2iz3vAK_8UvkyZWb0rAeyiQ@mail.gmail.com>
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

On Thu, Oct 29, 2026 at 6:32 PM James Hilliard <james.hilliard1@gmail.com> wrote:
> With a persistent pause failure and an incomplete transfer, the
> worker keeps retrying. RX remains masked and the runtime PM reference
> is held until the condition resolves or shutdown takes over. There
> is no receive-progress guarantee if the peer remains idle and pause
> continues to fail.
...
> A failed pause with an incomplete cookie does not distinguish a
> persistent hardware fault from completion that has not yet been
> published. A fixed retry limit does not resolve that ambiguity.
>
> Terminating after the limit may discard received data, including a
> completed buffer whose completion is still unpublished. Successful
> termination would make subsequent buffer reuse safe, but would not
> recover those bytes. This would therefore be a potentially lossy
> error-recovery policy rather than a lossless timeout flush.

Checking the in-tree dmaengine providers shows why bounding the retry loop
and escalating to recovery is necessary in practice:

1. `serial8250_request_dma()` (`8250_dma.c:428`) checks `caps.cmd_pause`,
   which `dma_get_slave_caps()` (`drivers/dma/dmaengine.c:614`) sets purely
   from `!!device->device_pause`. However, `drivers/dma/tegra186-gpc-dma.c`
   (lines 422-423, 1351, 1521) unconditionally assigns
   `tdma->dma_dev.device_pause = tegra_dma_device_pause` (so
   `caps.cmd_pause == true`), and then returns `-ENOSYS` at runtime on
   Tegra186 where `tdc->tdma->chip_data->hw_support_pause` is false. And on
   Tegra194/234/264 (`tegra186-gpc-dma.c:399-413`) and Tegra210
   (`tegra210-adma.c:574-579`), `.device_pause()` polls a hardware busy bit
   with an atomic timeout and returns `-ETIMEDOUT` or `-EBUSY` if an active
   burst does not pause in time.

2. In the in-tree providers where `.device_pause()` returns an error because
   a transfer already completed—such as `drivers/dma/ti/edma.c:870, 1468-1469`
   (returning `-EINVAL` when `!echan->edesc`) and
   `drivers/dma/stm32/stm32-dma.c:751-753, 836, 1432` (returning `-EPERM`
   when `chan->status != DMA_IN_PROGRESS`)—the DMA hardirq handler calls
   `vchan_cookie_complete()` *before* clearing the active descriptor, so
   `dmaengine_tx_status()` already reports `DMA_COMPLETE` on the very first
   check in `serial8250_rx_dma_try_flush()`.

   Even on a controller where hardware rejects `pause` the instant the 4096th
   byte finishes while its completion hardirq is still masked by `port->lock`,
   the only thing delaying `completed_cookie` publication is local IRQ masking
   under `port->lock`. Once `serial8250_rx_dma_flush_work()` drops `port->lock`
   (enabling local IRQs) and sleeps `usleep_range(1000, 2000)` in process
   context, any pending DMA completion hardirq runs in microseconds. Across
   5 retries (5-10 ms with `port->lock` released on each sleep), a completed
   4 KB transfer will have published `DMA_COMPLETE`.

   By contrast, leaving the `for (;;)` loop unbounded turns any persistent
   `dmaengine_pause()` error (`-ENOSYS`, `-EINVAL`, `-EBUSY`, `-ETIMEDOUT`) on
   a partial transfer into a guaranteed 100% loss of all current and future RX
   data until `close()`, a 500-1000 Hz `system_percpu_wq` spin, a permanent
   runtime-PM leak, and silently aborted `dw8250_set_divisor()` /
   `dw8250_check_lcr()` calls (`-EAGAIN`). Escalating to recovery after a
   bounded retry budget is strictly better than wedging the receiver forever.

> That requires termination to succeed and callbacks to be drained.
> If termination fails, the channel may still access the FIFO, so PIO
> must remain excluded.
>
> The recovery requirements depend on why the provider cannot pause.

Agreed—and `serial8250_rx_dma_flush_work()` in Patch 5/6 already enforces
that when `serial8250_rx_dma_recover(p)` is called (`8250_dma.c:210-216`):

	if (recover) {
		ret = dmaengine_terminate_sync(dma->rxchan);
		if (ret) {
			/* Retain ownership and keep RX masked if DMA cannot be stopped. */
			dev_err(p->port.dev, "failed to stop RX DMA: %d\n", ret);
			return;
		}
	}

When `serial8250_rx_dma_recover(p)` sets `dma->rx_err = true` and
`dma->rx_terminating = true`, the worker exits the retry loop and calls
`dmaengine_terminate_sync(dma->rxchan)`. If `dmaengine_terminate_sync()`
returns non-zero, the worker returns early at line 215 with
`dma->rx_terminating == true` and `dma->rx_running == 1`, keeping RX
interrupts masked in `IER` and keeping PIO excluded (`serial8250_rx_dma_flush()`
continues returning `-EIO`). It only clears `dma->rx_running = 0` and unmasks
`IER` for PIO fallback after `dmaengine_terminate_sync(dma->rxchan)` succeeds
(`ret == 0`).

Thanks,
Raul
