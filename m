Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793381801;
	b=LxljR+4OdYvO9gC24ORMCLeIB9ZGZXMCBnjblh1BjvvyWrB3PfoeQtChwf3uJusL/+gL
	 EXffLbDKzKeZVMAJf9DZL+Qg0RzFMhVNaNkl/wU/qKEwLdsMEFMTCO6ohjxGMkeXKPW2E
	 7cz4lD52zVnPzN2UPbsO8Zqf5USLV+NrfLBojUL+mp1+r36c1OHzbCAot775lKpXaCetU
	 FlEihIGyxxyaVSqQOKdKu9wTZD5XArCbMgvQ7CLGxXZ6LnnRjHDPuZCaboD8n8c9iP51Y
	 Vdz6fhX7xa32zxKU4P5/na+fHw24kwK8cK2JkQcNlCkg25vhHCOz/mGeog7vQkz7kJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793381801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=p+eb7dwaVi2e/2az0lhLRof2o3XdtzLR7+wZ1rytyEE=;
	b=QT9hEcK/0den1Md6MigmmERdIMKyU5UT/g8gEaf70OsHj547oTXfgTSrXKCWxz9xtirb
	 chqa+74aaGc+aJniWioTki2HocOUnPB6tX0Wr/P4LeO464jxyvQqv74H/QpG1NNjZKMWS
	 dqkqYWkqKDr5sHKdTQU+O+W1Pa7wg6sq5ogvRnq/aupQy8tipDxkrgNwhO8XP5U5PksUk
	 jz564YSPcEyNYH214Kx/pmYV2o0Zhhb6oUQSFEWyBVyc8eke7EzL1RmvI55xolICshfOo
	 TTMTHnV2C/QHFRmgFQl4ozNDo5K/gM/cdGLPIu89f+uLLTb5xdkbB7Flddbthg38Thg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Ud28B/vY";
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79F4606A31C
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 17:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B79F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ud28B/vY
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-844a8bf7e25so744036a34.1
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 10:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793381800; x=1793986600; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p+eb7dwaVi2e/2az0lhLRof2o3XdtzLR7+wZ1rytyEE=;
        b=Ud28B/vYi/LOa4OjzPsSLtHoVpVmJr2SzHrpjyZlv6bnv5mm8VybVsEyvxNHojl64Z
         kqIuMtUs4bQlg9NR7GFgDi5/bH6Nrmp40JM69ysbgtMFg4a6cpPzrGEHNnlwfVnhe3XC
         EpzLnfsIneClV+nLoV99gqZ7QXTrOOqwATpGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793381800; x=1793986600;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+eb7dwaVi2e/2az0lhLRof2o3XdtzLR7+wZ1rytyEE=;
        b=W7nvhwKH/gDpA+fTPh/BtoFqrMdhvrtnJzV8QVFN2iAr+k8EKFXDrS3joQV/oN/3kZ
         3gO3mxr01OTReC90px2TwtOW8RCwEGjs9tQVeL6WK32C7UEotjHpI86XlvQfNEv7Ekde
         yLjs8Sg3bCThm+qArYDQbE9sHBQJcAlcqaSSSGu1NH6IXqTzG6bf6QcSFLMLQwHzKhlc
         u5TDbKwg+i0vMQ2qGokbsmMP4Hi288NrWRPd8nXX+6j3bUfWd4ZKX8STXQcMbzibViYw
         LWWZ3mEIm4EFAHLzdM5lxwDAeqZFQBbHgxnCA70cz1JLrTtYsHAzXQ9Fe4NcCxeeouMJ
         L2yQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDrg1yEwrQeqxp3dNYsiaUzTBcgQ2UxnjQwOSrCKCWJVYNJRLPL57dPCh2xdEaNqvo2Eo=@lists.linux.dev
X-Gm-Message-State: AFq9FYKugvKPAeKn9jO3Zyf42OpCMrYIkvMsk1bmlKnrx6s79ZxVtgaj
	ooXg/FlVnlOD90kowMSBSU/GHMEFwkUuze8spulKmI/wzU+da0fXyg/ZyO9E3DT+4A==
X-Gm-Gg: AYBFou3WPu3qRWT2czL3GPnJTQwqbQ8L6GqyFbKyYBKoAIxINGlwzo0T0mI+5dwMUSy
	2krKgZNnM/b0WOIxMoyX/wVWMPkaE+mz/v453T3eoDroqJh4egFa0orx/X66R27f9r3EJo2EXGA
	vXFkJDAIHv+6l2ngLJaCpFF9iio9pHF9GTC98zGiVMefrwE2ZAoCl3cKbzXXFDps8f/W/FxM4xx
	y9XIjbtGNWX0iBXYEO1xzpYHaVkD0ZvoWtocxW9Rf28ofImQyd0yxIiTeJyDBfDgAd6CzJqg5+E
	34X+nscSpdshk1IxkxsgQmEH0aLSg8fWyZa2ESY5+3upwD9V8RI/kze8mnMTmxCxapggWk+N/oA
	etIpnpEO7pcpQo4wiDKgJr/RBxhnAs6jJqW2wIOZaKpgEurhfryBiOjJkyXX+8EZX2UV1JGCvx4
	lUyyitBc2aF5bPF8tbu/lSoSY1GYpUxEjYj5Qtwx3K6dFupUK8ReRMHOWy2NJ9zIx3PAJo07H1Q
	nuGujruvLv2tPo+0MUAd6whfxYtLrar92Ne1RfIYhLgTua4PLhE1DK0MKosshRk3FppPfec/MsG
	S42/A016tr4HGTpC3pSD4A6QACjxrDq89sXUGNYWjNXQdanFlB/glmrXpxyKTYD/O34iLJVRHRJ
	F4AAPFG0c3w5SgKiM
X-Received: by 2002:a05:6830:7181:b0:81b:ac9a:5681 with SMTP id 46e09a7af769-85d3649ebddmr2330039a34.29.1793381799663;
        Fri, 30 Oct 2026 10:36:39 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354efebesm2497044a34.19.2026.10.30.10.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:36:39 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?UTF-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when termination fails
Date: Fri, 30 Oct 2026 11:36:35 -0600
Message-ID: <20261030173635.2186490-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <CADvTj4rRtKyq_7yhpfwGQrbOA=k_jxQymTpZSvdVBB0A-xR-Rw@mail.gmail.com>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com> <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com> <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local> <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com> <20261029222734.3086943-2-rrangel@chromium.org> <CADvTj4rRtKyq_7yhpfwGQrbOA=k_jxQymTpZSvdVBB0A-xR-Rw@mail.gmail.com>
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

On Thu, Oct 29, 2026 at 6:35 PM James Hilliard <james.hilliard1@gmail.com> wrote:
> That is the current behavior. Returning from shutdown allows serial
> core to free the TX buffer and removal to release the callback
> context. The retry loop prevents those releases, but a permanent
> termination failure blocks teardown indefinitely
...
> Retaining the buffers and channels does not preserve the complete
> callback context.
>
> The callbacks carry a uart_8250_port pointer. For DW, the DMA state is
> embedded in devm-managed private data, which can be freed after
> unbind. The registered 8250 port slot can also be reused. Retaining
> the DMA channel does not prevent either operation.
...
> Clearing up->dma does not stop hardware accesses. After unsuccessful
> termination, the channel may still access the UART FIFO, so reopening
> with PIO can introduce concurrent FIFO access.
>
> A hardware-specific stop/reset sequence could establish quiescence,
> but its implementation and effects on other channels depend on the
> controller. If the channel cannot be stopped, quarantine also needs
> to preserve callback-context lifetimes and prevent unsafe port reuse.
...
> The current callbacks fetch p->dma before acquiring the port lock.
> A callback can therefore retain the old non-NULL pointer across the
> assignment of NULL. Checking that cached pointer does not protect
> its backing allocation from being freed.
>
> When termination returns an error, dmaengine_terminate_sync() also
> returns without calling dmaengine_synchronize(), so callback draining
> has not been established.

Those are all good points. We added port reopen and a `NoConcurrentFifoAccess`
invariant to `Serial8250TxDmaV8.tla`
(`Serial8250TxDmaV8_QuarantinePioReopenHazard.cfg`), and TLC immediately
confirmed your point on FIFO contention: clearing `up->dma = NULL` and
falling back to PIO when reopening after a failed `dmaengine_terminate_sync()`
violates `NoConcurrentFifoAccess` in 7 states because the un-terminated DMA
descriptor can still access the hardware UART FIFO concurrently with PIO.

We can satisfy all three constraints while still preventing normal `close()`,
`hangup()`, and system `suspend()` from hanging forever in
`TASK_UNINTERRUPTIBLE` under `port->mutex` across the three lifecycle edges:

1. **On `close()` / `hangup()` / `uart_suspend_port()` (`serial8250_release_dma()` & `uart_free_xmit_buf()`)**:
   - Bound the retry loop in `serial8250_terminate_dma()` (with a short
     backoff rather than an unbounded `msleep(100)`, guarding
     `if (dma->rxchan)` / `if (dma->txchan)`) and release whichever
     channel(s) terminated cleanly (`rx_ret == 0` or `tx_ret == 0`).
   - If `rx_ret != 0` or `tx_ret != 0`, **keep `up->dma` intact** (do not set
     `up->dma = NULL`, including in `8250_omap.c:omap_8250_shutdown()`), keep
     `dma->shutting_down = true`, and retain the failed channel and its
     buffer (`dma->rxchan` / `dma->rx_buf` when `rx_ret != 0`; `dma->txchan`
     and mapped `dma->tx_addr` when `tx_ret != 0`).
   - When `tx_ret != 0`, explicitly call `uart_xmit_block(&p->port)` under
     `p->port.lock` (`state->xmit_blocked = true`, since `xmit_blocked` is
     otherwise only set when `uart_flush_buffer()` ran prior to `close()`),
     and in `serial_core.c:uart_free_xmit_buf()`, return early under
     `uport->lock` if `state->xmit_blocked` is set (without clearing
     `port->xmit_buf = NULL`, resetting `port->xmit_fifo`, or calling
     `kfree(xmit_buf)`).
   - Because `up->dma` is not cleared and `struct uart_8250_dma` /
     `struct uart_8250_port` remain allocated on the bound device during
     `close()`, `hangup()`, and `suspend()`, any callback that was not
     drained by `dmaengine_terminate_sync()` safely loads a valid `p->dma`,
     observes `dma->shutting_down == true` under `port->lock`, and returns
     without UAF—while `close()`, `hangup()`, and system `suspend()` return
     cleanly without hanging in `D` state or triggering `hung_task_panic`.

2. **On subsequent `open()` (`serial8250_do_startup()` & `omap_8250_startup()`)**:
   - At the very start of `serial8250_do_startup()` (`8250_port.c:2356`) and
     `omap_8250_startup()` (`8250_omap.c:724`)—after acquiring runtime PM,
     and **before** clearing `up->dma->shutting_down = false`, touching
     `UART_FCR` / `UART_RX` / `UART_TX`, or setting up IRQs/timers—if
     `up->dma && (up->dma->rxchan || up->dma->txchan)` is still non-NULL from
     a prior failed termination, retry `serial8250_release_dma(up)` first:
     - If `up->dma->rxchan || up->dma->txchan` is **still** non-NULL
       (termination still failed), immediately return `-EIO` and **fail
       `startup()`** (do *not* clear `up->dma = NULL` and do *not* fall back
       to PIO while the wedged DMA channel may still touch the UART FIFO).
     - If termination succeeded on retry (`rxchan == NULL && txchan == NULL`,
       which also unblocked `state->xmit_blocked`), reset `xmit_fifo` and
       proceed with normal startup and `serial8250_request_dma(up)`.

3. **On driver unbind (`serial8250_unregister_port()` / `serial_core_remove_one_port()`)**:
   - Driver removal is the *only* point where `devm`-allocated
     `struct uart_8250_dma` and the `serial8250_ports[]` slot are about to be
     freed/reused (note also that `serial_core_remove_one_port()` at
     `serial_core.c:3336` only calls `uart_shutdown()` when
     `tty_port_initialized(port)` is true, so if the port was already closed
     with a quarantined channel, unbind must still drain/release it).
   - Restricting blocking termination wait to driver unbind (when a channel is
     still active/quarantined) prevents `close()`, `hangup()`, and system
     `suspend()` from ever hanging the kernel in `msleep(100)`.

We verified this quarantine + `-EIO` reopen contract in
`Serial8250TxDmaV8_TerminateRetryHang_Fixed.cfg` (`AllowReopen = TRUE`,
`ReopenFallbackToPio = FALSE`), which passes all safety and liveness
properties (`NoUsersAtFree`, `BoundedTerminateRetries`,
`NoConcurrentFifoAccess`, `QuarantineImpliesXmitBlocked`, `ShutdownProgress`)
with 0 errors:
https://github.com/ismell/linux-8250-dma-tla

Thanks,
Raul
