Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793646117;
	b=ziMXSV4wxdb+HRby+A1rNZFW5oibBVmHwm7A44z2dy6BQKOBoONj5Nl8/atVQ2n+AWol
	 gzMwDzMCKo9tycwHoCinXZSW4rBsKF1Q0chmpRl4q60BbU1Kwjmc2Y6Ad/I1QbApBDT62
	 HHybJHLRvI1vByiIpFhBc7/OBxGef53DCXWmQnZFfoJbbCDpEWLV9SgPdWAoqEDCvPVSv
	 iR4gPulrIyHp4BB+bt4f4NlpV/XLjgVGaq3dokImc/dWUjF9rAmyICaoAK23Fkw9PKCk2
	 XR88wd7fKIfiPdsNjUE7C9tAOPBRTF4tuBnc5k2PY4Ohqw/VBbtjqhnyYMr6eLN1FiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6x7C36ItNCE7Mv0HbSUEpY6Gibir1HyWLaQqqnLukwk=;
	b=kcI4DzpLAI8LbSjPGrzyc+PijGS4qoO6R9UYWbWg/wNNuHoWehJ+g8mOgPAVKxaHhmwC
	 JtuHBYeMP8mUd8/3gsrAxQcDGT4d+u723zTe8t2Qxwd446x8ktNSDCcwaLHO7ThW3FDWn
	 Y8JaQyygYYxa5mhomUkdpBVVZ1Uad2hHaGGgtYc5o7RClAQjTYE0qgd6yHcSfoPj4fbXh
	 eAVKkk/LV2sAzP7516LuY+Va/NK07rlmRFBpHKCyW9RIJ27rO0nKEc+yA82PkNQIvHduP
	 V3X3Hf6fc6dx4e3BCNOi3qLNLoEtE6y1n85diLhd+K9mGw+YqbFXQT0Uem7oWLbrYeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pf04zuLZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2957C606A327
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 19:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2957C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pf04zuLZ
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d06763335aso1094037137.2
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 11:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793646116; cv=none;
        d=google.com; s=arc-20260327;
        b=bMcc5C7TkLQqyN4F0tcbQUmGjP9K5EEfPfc4GGIOy2kzDeq2xNorg9QKy36bxBLkDp
         xUlSJgqzrVq/uEmWMatZ+gsS/qP4GaAfnsIYXV74FsEUr944Oc5sBFx4rkiR9Z5qhoH0
         HpgXRz5piELf3cgAtLWkF9DVP6nFeJEAoGL5cKmjnB3kV590B9Lwv05PrMkgLbXQW8e4
         xxjaHZPq3NU1lW6TQuzgVUrnCGpRNIsnHSXBR08mi/ft/obS5I+T271xn6h3dYztPkFH
         kVQb84Pk2mggykartX36spxuteJrHcCu51Bi7YkpRP8ngCT21zLGpyEA75nEm34XzwVF
         yS7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6x7C36ItNCE7Mv0HbSUEpY6Gibir1HyWLaQqqnLukwk=;
        fh=E4KTkKsE759XhWvb03fEDYb/YOiZtSpCVRabepYJouU=;
        b=YuyPiahOmlz6/pm+jnNcaqCnnEVmQTjAJCK+TILge5QyH9fjgU1QqlsPsbM4s3WQXz
         nKj4LqnPI22mqLAykOj20iZxFh1LvM8q9fHkrBYmaAVPsIPdjIwhnt6X6Dds1Uzve6jH
         kg0lsHQuQCipTNriVgh2KNd5QV5yzbDvWlRMU2o6ubQua/LmBL1wr+QVVtOwEe1uiZUv
         PonebYa/zfKRYoPHXQaE1GErjysBA6eHePXjjl2S9SUeegSA2Q7AyEa6AduMLywkA0mZ
         DISG3LHxa7BRVGnXjP0p0nPoTwMX0mXWGVEglouaY3OYjYLA198GXtN70hR9SVn5U8GI
         Ef7g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793646115; x=1794250915; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6x7C36ItNCE7Mv0HbSUEpY6Gibir1HyWLaQqqnLukwk=;
        b=Pf04zuLZcUwIl4IF7keG7qhXNp6NfkJnXspfRwHPN+8hcLZNI4zKJoGhbSLVS3SQQL
         xGUHoDXp/61nuyA26eb+SNbS5bx6hNV8+qNHGwkqy+lo7s3fJli83yF/9EEfi/Pditr0
         OaLSXGVonAiQsXL21nuCQEJMuKQXLJXu4sGhsUmR5NBzy4UGE7+aAGd4b6yqSho+mJgF
         wo6+WCxznyLfWmbEmX7JNwn+aw7CZD0ptB02ehfk22bDTA7/n9pH0Agxx3aAoUeDhw/N
         S0nIteRGI3B2ID6i9E403mEg5sJ+oBuFY1vnZS91i4miN9xGdE5/6DNIk+IQVh1PE7cC
         08pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646115; x=1794250915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6x7C36ItNCE7Mv0HbSUEpY6Gibir1HyWLaQqqnLukwk=;
        b=Y5Mx5kkFpf3BMPfbM9Qc7WYLcwa8D1rVDvhYqI9y9AEi662qZ5QKzAj0kLk+3dUJUE
         jNZhCXVXTcT0ssiyahVn+M/UU5x2eTkC5V+79+TgYSrGIV0F3PXSNl8TFEpZpisa2D4y
         RKjOGpO5gArt4az8mpw1bMPiijPOdo6BjAexXE/elO3PgIxsDwPejh7uH5zApU3Fi4z7
         BZ86V5jqjQRNr3D7Ik1YAf01bSvcL+pdo+9mDJ7VyQyJmmS+HlM4nrRbYq8wLrAOKINS
         42Mfujr3pupX0zGygZuxzX70sbT2Z7SSkGoWdgyDeUE35D5ZYgv872md5TdyFuo+gH5Q
         DiXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyu84pIL17cSuv0QQi4+RSKH3tJvXSL7foA9ac8NUAna5c41bGJTusLEZMPfsgHOzNreo=@lists.linux.dev
X-Gm-Message-State: APuU4Z9+CGsa5E5P4q2IwQRc5guVgMIygX2RvfPIalgOe8c7ab4nG6qv
	3L6ghPVa5e3IuyiW6LCwMVVaxZstP+6RVzxkZ8V4B5Xg6l1wp9yfEjor6cMj3B0VlN5Xf5Yld0D
	U5b6q/sR/bSilgBtblaowEjxA21UoVtE=
X-Gm-Gg: AYBFou26B3gMKf2qRfCzAjqDzfZnVu4CDb8lxIYOGUL52nuhvPZCvpNimd4zZJhiw1G
	ei9acvU1UZpmiLxQuZ+dYsZbiDYT2T4ZbjcdjGsbHrPURIdya5zOOULhmxXGRyil0C+d9TUV5Lb
	bcaEx8biN+Cj2d0pMwImV/hki5O6G3szcRGpCHw7aoB+9KwUsDe+5xEmDcPJzoqSJT+ahk2EBqa
	wYV2bMhea6x7Q+3cwqhVFKFBqgjqDkl6zoVLsHzhn1+Tzngblmk5ew2jIBfrlFTpb+lyEqmZmbW
	qHGsvmp2+ap9SsyxTBhIWH+0ndqF18PQhdVU//sYpCM4LF1LzTMUGLtjq+K1fDuRT6v4nrORxUI
	ie0LLdZmoCsLhdLFS44SVGK9CmePcEeAyr+EtvGMtUVDTdXOuMcgQS6056I3Kt6nw15Z0eVtdEJ
	uZyiylWb4J2NlptewbuROEfbRBRDMAlGCHwiQZJLAhe8DXdQpEoS+zLV+IiodA63tc84R4qGlgo
	EgGhOOnqtd4jbS5nj3JiYxwtrzmuQ==
X-Received: by 2002:a05:6102:950:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d072bb3726mr4192494137.13.1793646113500; Mon, 02 Nov 2026
 11:01:53 -0800 (PST)
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
 <20261029222734.3086943-2-rrangel@chromium.org> <CADvTj4rRtKyq_7yhpfwGQrbOA=k_jxQymTpZSvdVBB0A-xR-Rw@mail.gmail.com>
 <20261030173635.2186490-2-rrangel@chromium.org>
In-Reply-To: <20261030173635.2186490-2-rrangel@chromium.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 2 Nov 2026 12:01:42 -0700
X-Gm-Features: AclHuK8hePvnISH49dlVrc4mCThAhAMYZDLctOcSiiJ-Xdrwl739zXGlDWt75pI
Message-ID: <CADvTj4op-tFqWmtzOQnt=q9aZttaWngYXLjfXEkdqcLirTMoXA@mail.gmail.com>
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

On Fri, Oct 30, 2026 at 11:36=E2=80=AFAM Raul E Rangel <rrangel@chromium.or=
g> wrote:
>
> On Thu, Oct 29, 2026 at 6:35 PM James Hilliard <james.hilliard1@gmail.com=
> wrote:
> > That is the current behavior. Returning from shutdown allows serial
> > core to free the TX buffer and removal to release the callback
> > context. The retry loop prevents those releases, but a permanent
> > termination failure blocks teardown indefinitely
> ...
> > Retaining the buffers and channels does not preserve the complete
> > callback context.
> >
> > The callbacks carry a uart_8250_port pointer. For DW, the DMA state is
> > embedded in devm-managed private data, which can be freed after
> > unbind. The registered 8250 port slot can also be reused. Retaining
> > the DMA channel does not prevent either operation.
> ...
> > Clearing up->dma does not stop hardware accesses. After unsuccessful
> > termination, the channel may still access the UART FIFO, so reopening
> > with PIO can introduce concurrent FIFO access.
> >
> > A hardware-specific stop/reset sequence could establish quiescence,
> > but its implementation and effects on other channels depend on the
> > controller. If the channel cannot be stopped, quarantine also needs
> > to preserve callback-context lifetimes and prevent unsafe port reuse.
> ...
> > The current callbacks fetch p->dma before acquiring the port lock.
> > A callback can therefore retain the old non-NULL pointer across the
> > assignment of NULL. Checking that cached pointer does not protect
> > its backing allocation from being freed.
> >
> > When termination returns an error, dmaengine_terminate_sync() also
> > returns without calling dmaengine_synchronize(), so callback draining
> > has not been established.
>
> Those are all good points. We added port reopen and a `NoConcurrentFifoAc=
cess`
> invariant to `Serial8250TxDmaV8.tla`
> (`Serial8250TxDmaV8_QuarantinePioReopenHazard.cfg`), and TLC immediately
> confirmed your point on FIFO contention: clearing `up->dma =3D NULL` and
> falling back to PIO when reopening after a failed `dmaengine_terminate_sy=
nc()`
> violates `NoConcurrentFifoAccess` in 7 states because the un-terminated D=
MA
> descriptor can still access the hardware UART FIFO concurrently with PIO.
>
> We can satisfy all three constraints while still preventing normal `close=
()`,
> `hangup()`, and system `suspend()` from hanging forever in
> `TASK_UNINTERRUPTIBLE` under `port->mutex` across the three lifecycle edg=
es:

Keeping the DMA state intact and refusing PIO reuse addresses the earlier
reopen hazard. However, implementing quarantine safely requires changes
beyond retaining the buffers and rejecting startup.

For example, serial8250_do_shutdown() clears the FIFOs and reads UART_RX
after serial8250_release_dma() returns. Those operations also need to be
excluded while the retained channel may still access the UART. Close and
suspend subsequently enter power-down paths, so retaining the allocations
alone does not establish that either transition is safe.

There is also a serial-core exception to the proposed reopen contract:
startup errors permit an administrative open for CAP_SYS_ADMIN. That
allows reconfiguration paths which can release port resources. Returning
-EIO from the driver startup callback therefore does not by itself
enforce quarantine.

>
> 1. **On `close()` / `hangup()` / `uart_suspend_port()` (`serial8250_relea=
se_dma()` & `uart_free_xmit_buf()`)**:
>    - Bound the retry loop in `serial8250_terminate_dma()` (with a short
>      backoff rather than an unbounded `msleep(100)`, guarding
>      `if (dma->rxchan)` / `if (dma->txchan)`) and release whichever
>      channel(s) terminated cleanly (`rx_ret =3D=3D 0` or `tx_ret =3D=3D 0=
`).
>    - If `rx_ret !=3D 0` or `tx_ret !=3D 0`, **keep `up->dma` intact** (do=
 not set
>      `up->dma =3D NULL`, including in `8250_omap.c:omap_8250_shutdown()`)=
, keep
>      `dma->shutting_down =3D true`, and retain the failed channel and its
>      buffer (`dma->rxchan` / `dma->rx_buf` when `rx_ret !=3D 0`; `dma->tx=
chan`
>      and mapped `dma->tx_addr` when `tx_ret !=3D 0`).
>    - When `tx_ret !=3D 0`, explicitly call `uart_xmit_block(&p->port)` un=
der
>      `p->port.lock` (`state->xmit_blocked =3D true`, since `xmit_blocked`=
 is
>      otherwise only set when `uart_flush_buffer()` ran prior to `close()`=
),
>      and in `serial_core.c:uart_free_xmit_buf()`, return early under
>      `uport->lock` if `state->xmit_blocked` is set (without clearing
>      `port->xmit_buf =3D NULL`, resetting `port->xmit_fifo`, or calling
>      `kfree(xmit_buf)`).
>    - Because `up->dma` is not cleared and `struct uart_8250_dma` /
>      `struct uart_8250_port` remain allocated on the bound device during
>      `close()`, `hangup()`, and `suspend()`, any callback that was not
>      drained by `dmaengine_terminate_sync()` safely loads a valid `p->dma=
`,
>      observes `dma->shutting_down =3D=3D true` under `port->lock`, and re=
turns
>      without UAF=E2=80=94while `close()`, `hangup()`, and system `suspend=
()` return
>      cleanly without hanging in `D` state or triggering `hung_task_panic`=
.
>
> 2. **On subsequent `open()` (`serial8250_do_startup()` & `omap_8250_start=
up()`)**:
>    - At the very start of `serial8250_do_startup()` (`8250_port.c:2356`) =
and
>      `omap_8250_startup()` (`8250_omap.c:724`)=E2=80=94after acquiring ru=
ntime PM,
>      and **before** clearing `up->dma->shutting_down =3D false`, touching
>      `UART_FCR` / `UART_RX` / `UART_TX`, or setting up IRQs/timers=E2=80=
=94if
>      `up->dma && (up->dma->rxchan || up->dma->txchan)` is still non-NULL =
from
>      a prior failed termination, retry `serial8250_release_dma(up)` first=
:
>      - If `up->dma->rxchan || up->dma->txchan` is **still** non-NULL
>        (termination still failed), immediately return `-EIO` and **fail
>        `startup()`** (do *not* clear `up->dma =3D NULL` and do *not* fall=
 back
>        to PIO while the wedged DMA channel may still touch the UART FIFO)=
.
>      - If termination succeeded on retry (`rxchan =3D=3D NULL && txchan =
=3D=3D NULL`,
>        which also unblocked `state->xmit_blocked`), reset `xmit_fifo` and
>        proceed with normal startup and `serial8250_request_dma(up)`.
>
> 3. **On driver unbind (`serial8250_unregister_port()` / `serial_core_remo=
ve_one_port()`)**:
>    - Driver removal is the *only* point where `devm`-allocated
>      `struct uart_8250_dma` and the `serial8250_ports[]` slot are about t=
o be
>      freed/reused (note also that `serial_core_remove_one_port()` at
>      `serial_core.c:3336` only calls `uart_shutdown()` when
>      `tty_port_initialized(port)` is true, so if the port was already clo=
sed
>      with a quarantined channel, unbind must still drain/release it).
>    - Restricting blocking termination wait to driver unbind (when a chann=
el is
>      still active/quarantined) prevents `close()`, `hangup()`, and system
>      `suspend()` from ever hanging the kernel in `msleep(100)`.

This looks like a useful direction, but it introduces a broader lifecycle
contract across serial core, the individual drivers and power management.
In particular, suspend may need to fail until the hardware is quiescent,
rather than succeed with a quarantined channel.

The current retry loop still allows permanent termination failure to
block teardown; changing the backoff does not resolve that limitation.

Would it make sense to address quarantine separately, with that
limitation documented explicitly here? I would prefer not to fold this
larger redesign into the cancellation series before those paths have
been worked through.

>
> We verified this quarantine + `-EIO` reopen contract in
> `Serial8250TxDmaV8_TerminateRetryHang_Fixed.cfg` (`AllowReopen =3D TRUE`,
> `ReopenFallbackToPio =3D FALSE`), which passes all safety and liveness
> properties (`NoUsersAtFree`, `BoundedTerminateRetries`,
> `NoConcurrentFifoAccess`, `QuarantineImpliesXmitBlocked`, `ShutdownProgre=
ss`)
> with 0 errors:
> https://github.com/ismell/linux-8250-dma-tla
>
> Thanks,
> Raul
