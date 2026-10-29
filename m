Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312864;
	b=e1iwCdRD4ArLine+TmRG67C6HgbRnfd5jhTtFdpectY/holAjbDqJnm6VmwvyQcWpX9q
	 Q9JiboYZrctOCct0P/33HUR72B8L22n8e3iMtNwv+yQ1TjbWuKmILc4kZXhiIv2X22GIP
	 x1K7HmNpZZpPOlUF9RCW5ZyJ1QRbibnjO3LqcjJTJo6dWw4mRxl+ClFKe5/as9bXljz7A
	 S/oqoADz9vRy0K4cB1JI0/Dv3qj4fX/F4QOQJd9LlO6LeDGTe50f6614dvSVu9XKBqZhv
	 rH0Mw5DNyiJC9inbn0eq5DRYzQWEYi9HdHP3uWV4xnkN0cpD14krdaUXd6uO5JevULw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sXO3ewVqFwoOGcXfkU3q3dcDer2CaAHOZmthFd8gt1s=;
	b=kOerswad6BS9VpvlbJwOT7wIM5q0c3AoPrewp42ETivmgK6mWxKZnEXsPwVCNV+MZ3FT
	 rnp3zEkYG0jaMMrG2KyGlvklvTii2L2LC/VBnZx3IU9z3UQQWS10h/BoYnju+Ttr/CLxU
	 kPykltMgpxyIuI9b/+nTOsGgAHXomjzTlH4/GnTXjYC3qhSJMnpCGwUG+9k+e47NdYwot
	 jNfblpENu9le01gmzw1pziM+p/b/JfROyNJaybPNaA/lO4A85KMd602Vgks1F5FURIu+y
	 ciRGUlKr4mx2fFD8o2zQCX79lkJWzf9ZemGd8YACGlLaUXdCnzXYHw7aXloxsccR6cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Fc7A/24R";
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ADF606A320
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 22:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48ADF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Fc7A/24R
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-844a8bf7e25so108514a34.1
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 15:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793312863; x=1793917663; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXO3ewVqFwoOGcXfkU3q3dcDer2CaAHOZmthFd8gt1s=;
        b=Fc7A/24RWD9fWBNGavC7YPa0fXawSSiZBl5OjX9OMpXKWU6HJimALZ9TGcBUk0IgvC
         uaxaFS3pncje3dEd6WILHk6L5jkmyX8Y2TamdHJB3B0sYsarsus4uQPXfXpzEPYEOhDS
         2exNNYz6rQaPgIXxOZ9RfM2xdfG7nMpIikZRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312863; x=1793917663;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXO3ewVqFwoOGcXfkU3q3dcDer2CaAHOZmthFd8gt1s=;
        b=Ka72JYq7/fmRcjhFG2IHH8KGqCuANUJdtTU8pFuSh7tOBYKGhpc2ij05sR9RifwHE2
         NaFc81ZXANp9sIE3ibzs2qwDsrpaNfJ7gx1gITI+7so3f+OTMzQ8VvwrtYOluN094lax
         up1peYZl1xbadg1pUg/cnDwWLrwyarbL3Vhi5jGyMs7uob2hi38JC7EBPmYSE82sUFFK
         ZtBm0CDKuMHOEKvQCBfcNvGlyVJijYbHr69gS/IUnePAPNU7W8iFiRIbWtRGjA353uxA
         9IrO2v+DFxHWU7JbtFYH1mwD5TOsUwGQL0C5gJ1Ch4zLZF1L3TEsMGE8hAtFrDqeQWMl
         dWIw==
X-Forwarded-Encrypted: i=1; AKwUvBw6I6JYjUUhHX1dyXuyGF+WnYhHmwCoiGdw2bX/AkC/E8ZQeKF0JJ6quCmGpatgM43DwnI=@lists.linux.dev
X-Gm-Message-State: AFq9FYL1+f/4gMk2ZI3MGSQtaDAtCrKWwnWbpbO31peOYndPWy8PNkMV
	gUcStUiaR1Nb00vokaIj4e0rZaVVkcHUj1PraeXort4EHQFqY5n//2XJvfxFgGPxNg==
X-Gm-Gg: AYBFou0O5IJ/bYHT+y2KcFK/NgKn2WIZkJIIo/4vOMuMFVuWteevxZpnA+RJx/i8BEr
	Ypb9eChNVDLkl6RuKPlRqWSjD+HLVh+bbj0f1V+yC9HRXq0qtIK/A3zgqaX2q+oa1YlAKmRnvVO
	ydcFHfFB7k6yFKCefeeg14PkTn5gOFqWfWBuGCkAYldCQXj3yQwbPKCWT8qJoFvgdtF9I2vaxEx
	+ky4NeV9WbYUOaeWb560tztlnOcHQqpqfj5QkLD8mLAreqd47arO9Ag65GxnFJLKbYg6OEYqRo7
	EViCLJBtQnqHAwcRKb2AdfpKVr0D8tI3jEBjGKxM7Fg/pU8DPjEln5fcYx6LwhxH97JDvnm7ors
	QP+2yQUPwpx3mtHlXgSWuk+JYy7VsQls0GNvAfsnCbcvotvActNdna5IMb6IeSOl5PZ8H9e5rLq
	UrFyCcT0MRWhPygj7zB1ZGwFHtHoEVVjI0SwhmMWm2oCV0a48MrcdwhuEg+39mWU4brvbkr1Txc
	jiVE5ZVT+gaokI0c8pCjvhpK9uKoJpGA6IolvtVW0FbDicBvjq9Z+oKkyOovlBSVFEmvNFVybib
	EVz7bFwsglKiC9Cgg5H1bnJCYmg2p8mVZ0uU46/IAjc+IXleZIH7ZYMI2stnd6TMYkAPEIiuSjg
	RpfqpT2n1/CAAGqs=
X-Received: by 2002:a05:6830:25c6:b0:81f:827a:b1cf with SMTP id 46e09a7af769-85d3644f500mr541370a34.22.1793312863265;
        Thu, 29 Oct 2026 15:27:43 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545b89asm718163a34.6.2026.10.29.15.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:27:41 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when termination fails
Date: Thu, 29 Oct 2026 16:27:34 -0600
Message-ID: <20261029222734.3086943-2-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com> <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com> <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local> <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
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

On Thu, Oct 29, 2026 at 11:19 AM James Hilliard <james.hilliard1@gmail.com> wrote:
> On Thu, Oct 29, 2026 at 8:24 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > > +	while (rx_ret || tx_ret) {
> > > +		dev_err_ratelimited(p->port.dev,
> > > > +				    "DMA termination failed: RX %d, TX %d; retrying\n",
> > > > +				    rx_ret, tx_ret);
> > > > +		msleep(100);
> > > > +		if (rx_ret)
> > > > +			rx_ret = dmaengine_terminate_sync(dma->rxchan);
> > > > +		if (tx_ret)
> > > > +			tx_ret = dmaengine_terminate_sync(dma->txchan);
> > > > +	}
> > >
> > > Huh?!
> > >
> > > This is unacceptable. Sleeping is okay, but value should really match the
> > > baudspeed and other parameters of the transfer.
> ...
> Regardless of the retry interval, shutdown cannot release the buffers
> until the provider establishes that DMA and its callbacks have stopped.

Agreed that if dmaengine_terminate_sync() fails, shutdown must not free
dma->rx_buf, unmap dma->tx_addr, or kfree(port->xmit_buf) while hardware
or a detached callback may still touch them.

However, because serial8250_release_dma() runs under port->mutex in
uart_shutdown(), uart_tty_port_shutdown(), and uart_suspend_port(), an
unbounded `while (rx_ret || tx_ret) { msleep(100); ... }` loop means that
if a DMA provider returns a persistent error from dmaengine_terminate_sync()
(-ENOSYS, -EINVAL, -ENODEV, -ENXIO, -ETIMEDOUT, or a wedged controller),
close(), hangup(), and system suspend will hang forever in
TASK_UNINTERRUPTIBLE while holding port->mutex (triggering hung_task_panic
after 120 seconds).

Would it make sense to satisfy both constraints (no UAF on buffers/callbacks,
and no infinite sleep in close()/suspend()) by quarantining/leaking only the
failed channel's resources instead of looping forever? Specifically:
1. Bound the retry loop in serial8250_terminate_dma() (or do not loop on
   non-transient errors, checking `if (dma->rxchan)` / `if (dma->txchan)`).
2. If rx_ret or tx_ret is still non-zero, warn once (`dev_err` / `WARN_ON_ONCE`)
   and intentionally quarantine/leak only the failed channel's resources:
   - If rx_ret != 0, leave dma->rxchan non-NULL, keep dma->shutting_down = true,
     and skip dma_free_coherent() / dma_release_channel(dma->rxchan).
   - If tx_ret != 0, leave dma->txchan non-NULL, keep dma->shutting_down = true
     and state->xmit_blocked = true, skip dma_unmap_single() /
     uart_xmit_unblock() / dma_release_channel(dma->txchan), and in
     serial_core.c:uart_free_xmit_buf(), skip `kfree(xmit_buf)` if
     `state->xmit_blocked` is still set.
3. For a subsequent port reopen after a quarantined failure:
   - Remove the redundant `up->dma->shutting_down = false;` in
     serial8250_do_startup() before serial8250_request_dma(up) (which already
     clears shutting_down under port->lock), and have serial8250_request_dma()
     return -EBUSY if `dma->rxchan || dma->txchan` is still non-NULL so
     reopen falls back cleanly to PIO (`up->dma = NULL`).
   - Guard the DMA completion callbacks (`__dma_tx_complete`, `dma_rx_complete`,
     `omap_8250_dma_tx_complete`, `__dma_rx_complete`) with `if (!dma || ...)`
     so a late callback after `up->dma = NULL` is ignored safely.

That way, neither hardware nor a detached callback can ever UAF rx_buf or
xmit_buf, while close(), system suspend, and subsequent PIO reopen all
complete cleanly without an unbounded msleep() loop.

Thanks,
Raul
