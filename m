Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793320533;
	b=xzemD3Lqm+JMw7n9m6S6tM+ftEWIMrdWHOmf82ZssbCdd3HLp7LBR4Yl3SHDV6ozwThh
	 P1QJ2xJPt6w5+mEkjH8j+Fq+LUl7FfAJpEtGAgJFbZQKJ3rstOskbxc4Q8laOhSE059/R
	 QVcwIRppF8fO7sHT2+x/ZkHD3eFZo9yvEKMtxZh9Y+3GvGQKYqakBZvxwwPyEw7ch6KsI
	 ONA8u0ruUpI3OKYmvvA+RS6xZUhTzHBSd+jifl2wZ5x6ageNI3w0ks1kmXs/RQJCdCpEh
	 VtNeUqcuoD0/T7phAdoV4kFvCq6Q3UmOJ4go062IUC0c/+NhP4bKk+grKQ30/5A81oQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793320533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vCXebNkndm9LBXsG81Q2mOpTPDq3UCuJ8oTq7IQkTYU=;
	b=FN7Z3uQEmLMqOoKbQ3gUTjKqi5J52UztydclAxLOMuxnYUwReUdYSCFKtzqlepsRhc0r
	 IVs2rc+jCSWVk0+p/3zoWytvvl3yqbu7+jJoZNiM55c4vCvx8fVcx2crYshJnyxAGDqmS
	 FMf9X/PHqmvvhAPmLMD+i5YEXEynBNFPAOKRQoq6Uj9dZbNURrJ8nBjBU9avbbXKweyya
	 9zddgXI/B/8qA1or01hu7C0TSykkZOA6KtbmGQUymnzE0u2WWvm19ZHdxYBns44kqY06m
	 gIsNtzTGek/LxS6XZD/EysXOhfXZIlF3RB8F1HSpYAR/VkZH2PGIs72TlkS5BQ8/DPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Me9++dg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B3E606A31E
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 00:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B3E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Me9++dg
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9909e82513fso156047241.0
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 17:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793320531; cv=none;
        d=google.com; s=arc-20260327;
        b=o6Og5lQCaSPdZsZjGgLrJhqAmsn8KhdJ24Zg8SkH/udDZImjnwLarv6p0qqZLweF66
         5EQiv81L0TM+y/P2QJsFjz8OeNV+jfmt7PX+Erkn+E+EfsluqHEq8jCYrHRjP/fh7tYD
         aDvHGjGRAH+FH6usU565oNfEFgOBzXc7LhncpWcZJgM74GCBrXaKZYe1SDcWFwoLg0ms
         Cm+mzO2HhI2TftQnsIxlsDsbo7UpU6cVSCiE2z8bB9RllegWcHlLaH5TPpGtK6avwQVA
         ZFkKHy9TSRYZsiiSu9v0w9VMFkA1vtYzlOpL8Hqokaten/hUOpvGX+3v2MRXuiotiCz7
         T4EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vCXebNkndm9LBXsG81Q2mOpTPDq3UCuJ8oTq7IQkTYU=;
        fh=aWSF5HgNRZBkO2EblxZA5uQOaHxd1rsOzLGw9wg/rjg=;
        b=FNivL7sNPN//fY+AK7BIM3puohGoFJIBPzN3twu/BS3NzSuP24hl2r3WuKYp0x42L6
         f7YmkQ2//T4UFCoaLUWPMTv+FMgCpZWRmi2UtyF9JIp/cqMKLRnBzv4SVTiKKQJ8L9j7
         Utj/0ECR30QS6a3w1hIZ+8w4F2TxjaRKhHwAYfyLrKYzSZoe6jSgxf9HqJdgkJ89cUPB
         9J2/I4If8v2We8gdR/W0YZ0pbNKLHhJDuH8cPHm5GyE9p3jVytC4/lUrLyht3K40AGjt
         zbnd0vlRTk5Z8/szadzcwK8BXseqTCaRvXCsNLPMeJoLBlZBcuV5fuj+d5WzymvBz/ww
         bFkw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793320531; x=1793925331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vCXebNkndm9LBXsG81Q2mOpTPDq3UCuJ8oTq7IQkTYU=;
        b=0Me9++dgWUwpXPVU1NNMvL2PqXOifm9q1hBoGGeTyx1Go/dC6cINmeaYG7fImqGLg5
         GPMevl4ANyo/TEJfDrombAfJ4ybmbATlT0BiQiT4mf8FEwUH3A1xbu1BFnFgI8JKDp6t
         1pu4w00gzAQ+HVyCra6N8XMUJb1pATH/ckaFalr5fzuQnfO4mbpfheSbvoLJ84wyBZJA
         QwyAi1Y0GCsBgZonWXmryE+ublz7koAJh2VVwVZtuJh3n6MRBdw1B1UAYklu08YzGU82
         RgthC2fdfzlsfpcXsAFjTfaVLp7XOxSX9S19Xz98bot7fCSZiK/kYJmgItMRbfOaFWwF
         W3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793320531; x=1793925331;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCXebNkndm9LBXsG81Q2mOpTPDq3UCuJ8oTq7IQkTYU=;
        b=FBESwBZ/YBqk8p9YTj97DmTtNjevRmtDr2OarY9iSGW7eqUo+UT/HRjYf5paN8Cl4j
         hKNkHwLWyohCPMB93sq8wZaGUigWfv0x8m+IlwZtcc+TEM+5EU+gAjBfWsME+nbC9zzK
         z1jhdotj5xqG350Y6xs5BZNuhNmz+BdOWy7PU2Dbfase1da10l6tlYt1gnO6+DN8Bsha
         cghmAq6IcXvWbjAibr9Cv6cNpzr0YCHGn1rrtw9mqCrpSdLRsBx1nPMNs+jRrGwHauPq
         yFX+DWXvK94Ky+uzPogCKZfn6pVRVZeCX5rE/fbAAhYDzrEGQOTWFEib64uEUasS+Fd7
         RJjg==
X-Forwarded-Encrypted: i=1; AKwUvByFazb0vQNEJW+aJV7iNYXZpdq7BFZmtTsQ9LUMXCEspTizAOi9sLY1VUDvrmvgv1kvAbE=@lists.linux.dev
X-Gm-Message-State: AFq9FYKhi0jdR6a+d8ER90K/cAtEL2KvXf/lIxT1AlCFIZCYG7oXaE21
	sgcq36TLsjGCbwbkLgsfr4A8NB5Vub6AqfHuTjKncuQ2wed/6f7vR4qUwGLnPEE01BPUsSWfrrc
	lxwadfx4rRXblN5Csd34ZHRBE7OGW8t8=
X-Gm-Gg: AYBFou0kXSJlGJGYcXhQGSv/kUaB/mqI+RVA2ZRnbm+2SjNpmhheFAkZi96zn5aUxlT
	+SCRgXWAl7jO3OC4z1oRffU+PrkPiYgRoLp1LLBgrVck0ZzYBKrgM3VX6Pb5/u3v8L9TIlSbvyE
	IYzPvk6fRONFdVqTGpdKY/6aOLE+u7z7WP4nbTEOuGR9f96QXks33+ueadzymjIpN0C1LeqS7ze
	5+zOOC9ZdgCO/SJRht1KLGlgT9t0uN+VidPw0ux1I+jhj8R+cEEN+/F9cpKsw0enFuaT8BhFGCF
	rtiKP1BUAu1NfWGKBrPb1D+6+zSlU416UM4VPGWOa84UL1ffs7UVDMay2ySsTqOqvMkUYTPVZwS
	+NRUi/Cew3cceFvKhbSZHWVIVouioq+YCi6Rm2buHHbpsNQ8HS/AgcAG+ujeFaoWxrjPSaMKyaw
	Lp4LqChbP3f3J9I41Ui4nkxW5jztY8MVw4zCvQHvwCFZgYUR+hvdal1vaOZsQ+qGrL3g9cygvUm
	S9iG26pYhJzSCIladNJc2aqs0hJaA==
X-Received: by 2002:a05:6102:50a5:b0:7bb:64cc:1362 with SMTP id
 ada2fe7eead31-7d072c2b96amr253188137.6.1793320531134; Thu, 29 Oct 2026
 17:35:31 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261029-submit-serial-8250-dma-cancel-v1-v8-0-3fd56ba352ed@gmail.com>
 <20261029-submit-serial-8250-dma-cancel-v1-v8-6-3fd56ba352ed@gmail.com>
 <auNW_Oc-Ao5Iw-Gw@ashevche-desk.local> <CADvTj4pOg4w5LpFW_E3qzP7FZDnDgpB8LyR9xxhT_mZre21vFw@mail.gmail.com>
 <20261029222734.3086943-2-rrangel@chromium.org>
In-Reply-To: <20261029222734.3086943-2-rrangel@chromium.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 18:35:19 -0600
X-Gm-Features: AclHuK9fwQEf1FE2SE005DWVvtH9Aa6gi9TWL3-I0d1O0Zk2jQvC0qB4u35B3dg
Message-ID: <CADvTj4rRtKyq_7yhpfwGQrbOA=k_jxQymTpZSvdVBB0A-xR-Rw@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when
 termination fails
To: Raul E Rangel <rrangel@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Timur Tabi <timur@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 4:27=E2=80=AFPM Raul E Rangel <rrangel@chromium.org=
> wrote:
>
> On Thu, Oct 29, 2026 at 11:19 AM James Hilliard <james.hilliard1@gmail.co=
m> wrote:
> > On Thu, Oct 29, 2026 at 8:24 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > > + while (rx_ret || tx_ret) {
> > > > +         dev_err_ratelimited(p->port.dev,
> > > > > +                                   "DMA termination failed: RX %=
d, TX %d; retrying\n",
> > > > > +                                   rx_ret, tx_ret);
> > > > > +               msleep(100);
> > > > > +               if (rx_ret)
> > > > > +                       rx_ret =3D dmaengine_terminate_sync(dma->=
rxchan);
> > > > > +               if (tx_ret)
> > > > > +                       tx_ret =3D dmaengine_terminate_sync(dma->=
txchan);
> > > > > +       }
> > > >
> > > > Huh?!
> > > >
> > > > This is unacceptable. Sleeping is okay, but value should really mat=
ch the
> > > > baudspeed and other parameters of the transfer.
> > ...
> > Regardless of the retry interval, shutdown cannot release the buffers
> > until the provider establishes that DMA and its callbacks have stopped.
>
> Agreed that if dmaengine_terminate_sync() fails, shutdown must not free
> dma->rx_buf, unmap dma->tx_addr, or kfree(port->xmit_buf) while hardware
> or a detached callback may still touch them.
>
> However, because serial8250_release_dma() runs under port->mutex in
> uart_shutdown(), uart_tty_port_shutdown(), and uart_suspend_port(), an
> unbounded `while (rx_ret || tx_ret) { msleep(100); ... }` loop means that
> if a DMA provider returns a persistent error from dmaengine_terminate_syn=
c()
> (-ENOSYS, -EINVAL, -ENODEV, -ENXIO, -ETIMEDOUT, or a wedged controller),
> close(), hangup(), and system suspend will hang forever in
> TASK_UNINTERRUPTIBLE while holding port->mutex (triggering hung_task_pani=
c
> after 120 seconds).

That is the current behavior. Returning from shutdown allows serial
core to free the TX buffer and removal to release the callback
context. The retry loop prevents those releases, but a permanent
termination failure blocks teardown indefinitely

>
> Would it make sense to satisfy both constraints (no UAF on buffers/callba=
cks,
> and no infinite sleep in close()/suspend()) by quarantining/leaking only =
the
> failed channel's resources instead of looping forever?

Retaining the buffers and channels does not preserve the complete
callback context.

The callbacks carry a uart_8250_port pointer. For DW, the DMA state is
embedded in devm-managed private data, which can be freed after
unbind. The registered 8250 port slot can also be reused. Retaining
the DMA channel does not prevent either operation.

> Specifically:
> 1. Bound the retry loop in serial8250_terminate_dma() (or do not loop on
>    non-transient errors, checking `if (dma->rxchan)` / `if (dma->txchan)`=
).
> 2. If rx_ret or tx_ret is still non-zero, warn once (`dev_err` / `WARN_ON=
_ONCE`)
>    and intentionally quarantine/leak only the failed channel's resources:
>    - If rx_ret !=3D 0, leave dma->rxchan non-NULL, keep dma->shutting_dow=
n =3D true,
>      and skip dma_free_coherent() / dma_release_channel(dma->rxchan).
>    - If tx_ret !=3D 0, leave dma->txchan non-NULL, keep dma->shutting_dow=
n =3D true
>      and state->xmit_blocked =3D true, skip dma_unmap_single() /
>      uart_xmit_unblock() / dma_release_channel(dma->txchan), and in
>      serial_core.c:uart_free_xmit_buf(), skip `kfree(xmit_buf)` if
>      `state->xmit_blocked` is still set.
> 3. For a subsequent port reopen after a quarantined failure:
>    - Remove the redundant `up->dma->shutting_down =3D false;` in
>      serial8250_do_startup() before serial8250_request_dma(up) (which alr=
eady
>      clears shutting_down under port->lock), and have serial8250_request_=
dma()
>      return -EBUSY if `dma->rxchan || dma->txchan` is still non-NULL so
>      reopen falls back cleanly to PIO (`up->dma =3D NULL`).

Clearing up->dma does not stop hardware accesses. After unsuccessful
termination, the channel may still access the UART FIFO, so reopening
with PIO can introduce concurrent FIFO access.

A hardware-specific stop/reset sequence could establish quiescence,
but its implementation and effects on other channels depend on the
controller. If the channel cannot be stopped, quarantine also needs
to preserve callback-context lifetimes and prevent unsafe port reuse.

>    - Guard the DMA completion callbacks (`__dma_tx_complete`, `dma_rx_com=
plete`,
>      `omap_8250_dma_tx_complete`, `__dma_rx_complete`) with `if (!dma || =
...)`
>      so a late callback after `up->dma =3D NULL` is ignored safely.

The current callbacks fetch p->dma before acquiring the port lock.
A callback can therefore retain the old non-NULL pointer across the
assignment of NULL. Checking that cached pointer does not protect
its backing allocation from being freed.

When termination returns an error, dmaengine_terminate_sync() also
returns without calling dmaengine_synchronize(), so callback draining
has not been established.

>
> That way, neither hardware nor a detached callback can ever UAF rx_buf or
> xmit_buf, while close(), system suspend, and subsequent PIO reopen all
> complete cleanly without an unbounded msleep() loop.
>
> Thanks,
> Raul
