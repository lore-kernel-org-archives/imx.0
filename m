Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.221.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793728490;
	b=MlJbvidxp8Z8yS0SK39pYqP3pKHy+nNvIn+EoHCYsAcNBcpO4roNzvjo2xt8CI6gRltY
	 WZvpPalfqM3AJkqUd2MSboas7cOr2iCmKb7BBzomTVp0DUlQX/nh3k5ceNwTyDwF8/7VN
	 8inarEpCMJ6pbojC0OXc4uMuc8fj9pKtZs3NsjYMtTbzxn5Lkgy0m2gUaTIswdt+ZAg0K
	 W6qCLbm7TOE7ICg6+1RBBfJny4a1vPc6FI4VRX1xIM7Kgzq9yUjR7DeVPQC9Jp5rXtfD3
	 +A3NZkLkFAov4yIjdAI/z6+3Ws19Li0XqR10JlSZkW3rdtLBKAz8baMmCx0fwbw7zdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iwVYSA8m7SCKsjhLjy1thrskeRAGo9CHO3+FfrfRAjg=;
	b=N/5jitO/ZwPRy3ZvBayW/1uf7gBAi28u5YtY0v9Xm6EbE8/0Fp4KQDbYpPgcVEGh0a6F
	 ra9InIfTZyZbGmAPfYNXFpUqrfh/36nU3+WIuY6aNM+nVMuNS+pvTGjLNpJ2b8HZ205m5
	 f6mPccguLsgZnwRQIzvj+0EJsTXg/KxYMIXDCc+CoObs9iAbQnBftPSNwFHUvCDxEThxk
	 fmyDrPwaCLW6EPZTaEgB+uSAdRc+S2uqlh1qThJS7BV1kLhXYhuy1UtgUDRN4nm5KBzYG
	 uUTOotiP7T5hsTpU98zh/2Z+WeRYtE/LHxT9+sm04QthCVnCEGntRzJzWfujtkzLmCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CPhJYLKq;
	arc=fail smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D22606A32C
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 17:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D22606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CPhJYLKq
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso1667017e0c.0
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 09:54:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793728489; cv=none;
        d=google.com; s=arc-20260327;
        b=nEP9JFhi3SB95AmVSec9t2C/iQ4s1gEpR+xv0QebkTIOGfgq5jQ4suTO6Ueb0hfEbT
         kss3q4xVzlCH6P3IUTqknxxSPD5VoN/29bPCL7JLNrv/JadXZyPZXSFZKiAVO0ZUHMkz
         OaT31q8f/AU/weS7wI+E9xfcpmbqZ5MO+AMV9EOvrHtY+a6aMg4n6Akze4CwMBc2a95s
         PpicwDp5KtluJh8GMKxGta5TiOO7bzVGPBJL+bCcCZW4yYeSpUISJLIuvwXYpehdxVX1
         RBhAoJYPAP8BNZ9dFkZeYGtkaefFG9AfhdmHw2HacxvkEhQdzfDTWcMOqeipTJoT6LNI
         k/Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iwVYSA8m7SCKsjhLjy1thrskeRAGo9CHO3+FfrfRAjg=;
        fh=5FcPVhvpvdbRTLJIUyjR8XWGMRIBb/OCWG0NadDPD7U=;
        b=GzQdkcMOjH6fsU64crVAChqgUzLP0wRt/vvXjGxC9X+AUp2vCHCHsOGfwCL7QUFoWk
         6b8nKv+LSg8MtO37R2rxE85HEhQVm+NkamkQKBMAmJ/n11YtVMz5EicBXvfYMYEjZdcO
         elb0mUGKRLKkW/Ag+lKNC9yatIo7MlhbdIAwXNXIP2IKGCLnZAzockY5giZ+rKaGe3Ph
         w3+7yOn0N8PfTV3cVd//ht+KOea+OC2/vQz3A9hXZlPl+1Flf9jkI0zGCSRRX+oYCIww
         3Ky2qGZ6T24LPittkVVoIpy193f8Nf/78lh85zth87BMvzWcVEivHavomGqIjHxV9i9Z
         doCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728489; x=1794333289; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iwVYSA8m7SCKsjhLjy1thrskeRAGo9CHO3+FfrfRAjg=;
        b=CPhJYLKq73JyI+98IbHD9anc8UUREgbU9otLar9KaOWrTerQrvMrplQF19PV0c1QAl
         r958bPIUiIHLkbUTGQInUjGXns9ojdhiaFDbEoVr4Dwuwwb4+KoLUslOnpQN13LKIkTs
         a/YcWO1sisdEfAPQtkO1bEThKMORqAsT8NESW0uivB0DqiDFMV5+RxfXGBs0Ggg2zx83
         xftyUiTkAzP8q4cGsw2MiOWxlETutZjhbuYxDV4ZVcbQnb69UVHz2tGqE6CkCrS9sVFo
         Buyb+LEeGZSBL1EpsLnFDg9OFnjF+nbEiI8WSTJ98+Vfwlz72+zAWAYNYquLEkpGQ5Ui
         uqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728489; x=1794333289;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwVYSA8m7SCKsjhLjy1thrskeRAGo9CHO3+FfrfRAjg=;
        b=Kang841D/FHFlfDrGbtcHStsHzn9MBEBumzzzjhj23HETycp1bGwephyzXr0n9+Ajp
         XTETWIXZ1ra4JaxUnSr/m5EqyAuDbcvYT+l0Qa1i1s/bjZsAjHn+K9rVIek6gXnh0+Wt
         2G+VFsI9YqUUaj8aHAXVKjhGjnLZgoL6bJxeDUz6JiDhjphyscUeqTLNaYuIRCueKRXl
         bJLpM8Krzc1fsZ4RTNtx5BnVmGefwv92oNHAtJ8qxpVkgbKyxXE4y0oz5THnQWnaTEkA
         CGmA0DcCxKoAX0wYvavX97AysfuEtGFA36MZjN1F9CxCMc3cUdVBEUkjbjP7oJaZYbAj
         Ul8A==
X-Forwarded-Encrypted: i=1; AKwUvBxFe/LqTMNoY7lcpP0hJmhgdeqZn3VWctyZe2UIIauPssuePB5/euoed4yZcCIIh1ebul8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8hncKRXMoBVlMsxu9AR533ZK73VOD7i1YesHtGCberGqqwj6xw
	ysNc6/PyZdPvq1FOZR2e4fzpTNdY+G7Hf96Ge7ZJC8NArLJzjkhSYrHkdu0n0poZNDE2x3eTAb9
	fqk/5IoIl0RloWYyQVVZTzo08papmHAk=
X-Gm-Gg: AYBFou0x9ZRkakYdWypJQP1S9oGruo+3gNPEBS8AT40E7lOoeSmT8eP0jlF9vAS+WrF
	TCW4CzA2mSv5JH9brG0iLsT6997XlLjzKCvvtXS0Knw+cKRo37PKrImkZiIdgsJgRlU4He7Codz
	iZ86AbaoIq+nMA4+V9ZGwbnydv7Ds/0BnYe53tM/9XeV3CmZOCJfClzlacU2MXxXga4BWwJ740z
	/nFALqoocuVwyopuqObRRxUNGBuP7WfLQXDJ4WVOcupav2x9JQYR4eO93+FMEEKZmTeqFf/y/g1
	J8ERO6HJHmiSCTprTQwQjoHkGfsu2iBZEylQ/jC6BxQO2k7QC2koMiZU4FVlGlist/5oCrYSB3J
	G6B9FVZiUCzB0JJciI48n3OaRZ8wTyHDwy6DfNirBoQmcqt7MslW/o5e69SavJtYrt5v9bPlwc1
	En39ZZ7UO/Zk+toK0b7VZpGZbNSzcGbiqziFGz0j1pOcjUYxsIj5PBI9Wiwdft6CvnggGFaM5aF
	nhQu0FNOMyzW5lqEu6R3hqnikF84M4=
X-Received: by 2002:a05:6122:4697:b0:5ea:fae8:e69e with SMTP id
 71dfb90a1353d-5ec688311c2mr6169989e0c.11.1793728489195; Tue, 03 Nov 2026
 09:54:49 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com>
 <20261102-submit-serial-8250-dma-cancel-v1-v9-7-9159caade148@gmail.com> <auoa8OWBxqaQuKRq@ashevche-desk.local>
In-Reply-To: <auoa8OWBxqaQuKRq@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 3 Nov 2026 10:54:38 -0700
X-Gm-Features: AclHuK9I_c4PO4aR4qFDRCjbioBe9CFVnX4O6YbacRovHX2KesJOnpsJ16Nbm6g
Message-ID: <CADvTj4rL23q6eO8vjVe9vL1g6B8aoZqsbnThi2QJqkj=9e59sw@mail.gmail.com>
Subject: Re: [PATCH v9 7/8] serial: 8250: retire canceled RX DMA before
 reusing the receive buffer
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Timur Tabi <timur@kernel.org>, 
	Peter Ujfalusi <peter.ujfalusi@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:34=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Nov 02, 2026 at 04:14:34PM -0700, James Hilliard wrote:
> > The generic RX timeout path pauses a transfer, copies its data and
> > terminates it asynchronously. Clearing rx_running at that point lets a
> > new receive reuse the buffer and cookie while the old callback has not
> > yet run. Inspecting the new cookie cannot distinguish that callback fro=
m
> > the completion of a new transfer.
> >
> > Reserve the receive buffer until a worker has drained the canceled
> > callbacks. Keep FIFO access separate from callback retirement: after a
> > successful pause and termination, clear rx_running while rx_terminating
> > prevents another descriptor from reusing the buffer. Deliver the paused
> > data before allowing the interrupt handler to drain the FIFO through PI=
O.
> > Normal retirement only releases ownership and leaves subsequent receive
> > handling to the UART interrupt.
> >
> > Preserve the normal completion-path LSR read and gate DMA resubmission =
on
> > the receive interrupt enable, so stop_rx() prevents another transfer wh=
ile
> > the status read retains its existing side effects.
> >
> > Reject new flush work and PIO receive handling during shutdown, includi=
ng
> > late Intel MID DMA timeouts. Stop and drain retirement work before free=
ing
> > the channels and buffer. Once RX has stopped, allow the idle flush used=
 by
> > DesignWare LCR recovery during shutdown. Clear the shutdown guard befor=
e
> > startup configures the UART and tests its interrupts.
> >
> > Check pause failures before accessing the buffer. A successful pause is
> > the quiescence guarantee, even when a provider still reports IN_PROGRES=
S.
> > Also accept DMA_COMPLETE after a failed pause: completion can stop the
> > channel before its callback acquires the port lock, leaving nothing for
> > the provider to pause. Retire that completed transfer normally.
> >
> > A failed pause with an incomplete cookie is ambiguous: hardware may hav=
e
> > finished while its completion interrupt is still pending. Canceling tha=
t
> > descriptor can discard the entire completed receive buffer and switch
> > permanently to PIO. Retain the transfer and retry pause and status in t=
he
> > worker, with receive interrupts masked to prevent a timeout interrupt
> > storm. The worker copies only after a successful pause or reported
> > completion, then terminates and drains the old callback before reuse.
> > The pending-pause guard keeps callbacks from copying or resubmitting th=
e
> > transfer concurrently.
> >
> > Start pause retries at 1 ms and double the delay up to one second to li=
mit
> > CPU use during persistent failure. Sleep outside the port lock on a tim=
ed
> > waitqueue, with completion and shutdown publishing a wakeup under the
> > same lock as the worker's retry check. This also catches notifications
> > arriving just before the worker sleeps, avoiding a full backoff delay
> > after completion or during shutdown. Reset the delay for each new flush=
.
> > Report a stall lasting at least one second once per flush, rate-limited
> > across repeated stalls. A provider which never pauses or completes reta=
ins
> > RX ownership until an error or shutdown; a timeout alone cannot establi=
sh
> > that discarding the buffer is safe.
> >
> > On DMA_ERROR or termination failure, let the worker stop DMA before
> > handing the FIFO to PIO. Keep the requested enables in the existing IER
> > shadow and filter hardware writes during pause retries and recovery,
> > including termios, RS485 and overrun-backoff changes. Apply the current
> > enables after retirement so stop_rx() and shutdown remain effective.
> > Hold a runtime PM reference around worker register accesses and keep RX
> > on PIO until reopen after a confirmed error.
> >
> > Abort the DesignWare idle sequence when RX cannot be stopped. Allow
> > the empty-FIFO timeout workaround once DMA has released the FIFO, inclu=
ding
> > while callbacks retire. Exclude FIFO resets during RX DMA recovery. If =
the
> > provider still cannot terminate the channel in process context, retain
> > its buffer and leave receive interrupts masked.
>
> ...
>
> > +static inline bool serial8250_rx_dma_running(struct uart_8250_port *up=
)
> > +{
> > +     return up->dma && up->dma->rx_running;
> > +}
> > +
> > +static inline bool serial8250_rx_dma_recovering(struct uart_8250_port =
*up)
> > +{
> > +     return up->dma && (up->dma->rx_pause_pending ||
> > +                        (up->dma->rx_err && up->dma->rx_terminating));
>
> Slightly better formatting is to put some line breaks.
>
>         return up->dma &&
>                (up->dma->rx_pause_pending || (up->dma->rx_err && up->dma-=
>rx_terminating));
>
> Alternatively
>
>         if (!up->dma)
>                 return false;
>
>         return up->dma->rx_pause_pending || (up->dma->rx_err && up->dma->=
rx_terminating);
>
> > +}
>
> > +/* Keep the desired enables in up->ier while RX DMA recovery masks har=
dware. */
> > +static inline void serial8250_out_IER(struct uart_8250_port *up, u8 ie=
r)
> > +{
> > +     lockdep_assert_held_once(&up->port.lock);
> > +
> > +     if (up->dma && up->dma->shutting_down)
> > +             ier =3D 0;
> > +     else if (serial8250_rx_dma_recovering(up))
> > +             ier &=3D ~(UART_IER_RDI | UART_IER_RLSI | UART_IER_RTOIE)=
;
> > +     serial_out(up, UART_IER, ier);
> > +}
>
> ...
>
> >       struct tty_port         *tty_port =3D &p->port.state->port;
> > -     struct dma_tx_state     state;
> > -     enum dma_status         dma_status;
> > -     int                     count;
> > -
> > -     /*
> > -      * New DMA Rx can be started during the completion handler before=
 it
> > -      * could acquire port's lock and it might still be ongoing. Don't=
 to
> > -      * anything in such case.
> > -      */
> > -     dma_status =3D dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &=
state);
> > -     if (dma_status =3D=3D DMA_IN_PROGRESS)
> > -             return;
> > -
> > -     count =3D dma->rx_size - state.residue;
> > +     size_t                  count =3D dma->rx_size - state->residue;
>
> No need to put too many spaces between type and variable name.
> (Yes, the first one will be left untouched.)
>
> ...
>
> > +static void serial8250_rx_dma_flush_work(struct work_struct *work)
> > +{
> > +     struct uart_8250_dma *dma =3D container_of(work, struct uart_8250=
_dma, rx_flush_work);
> > +     struct uart_8250_port *p =3D dma->port;
> > +     unsigned int delay_us =3D USEC_PER_MSEC;
> > +     ktime_t start =3D ktime_get();
> > +     bool recover, retry, restore_rx;
> > +     bool warned =3D false;
> > +     int ret;
> > +
> > +     guard(serial8250_rpm)(p);
> > +
> > +     for (;;) {
> > +             scoped_guard(uart_port_lock_irqsave, &p->port) {
> > +                     /* Shutdown cancels this work and drains both DMA=
 channels. */
> > +                     if (dma->shutting_down)
> > +                             return;
> > +                     /* Serialize reset with completion and shutdown n=
otifications. */
> > +                     WRITE_ONCE(dma->rx_pause_wakeup, false);
> > +                     retry =3D dma->rx_pause_pending && !dma->rx_termi=
nating;
> > +                     if (retry) {
> > +                             ret =3D serial8250_rx_dma_try_flush(p);
> > +                             retry =3D dma->rx_pause_pending && !dma->=
rx_terminating;
> > +                     }
> > +                     recover =3D dma->rx_err;
> > +             }
> > +             if (!retry)
> > +                     break;
> > +             if (!warned && ktime_ms_delta(ktime_get(), start) >=3D MS=
EC_PER_SEC) {
> > +                     dev_warn_ratelimited(p->port.dev,
> > +                                          "RX DMA pause stalled: %d; r=
etaining transfer and retrying\n",
> > +                                          ret);
>
> _ratelimited() is a slop of AI without understanding the code. It makes n=
onsense
> in combination with warned.

The two controls have different scopes. warned is local to one invocation
of the flush worker and prevents repeated warning attempts while that
flush remains stalled. A later flush starts with warned cleared again.

The rate limit applies across worker invocations and UART ports. It limits
messages from separate stalls, rather than repeated retries of the same
stall.

>
> > +                     warned =3D true;
>
> Altogether NIH _once().

dev_warn_once() uses a static flag at the call site, shared by all ports.
After the first warning, subsequent stalls would remain silent even after
recovery or reopening the port, including stalls on another UART.

The intended behavior here is at most one warning attempt per prolonged
stall, while keeping later incidents diagnosable and limiting their
aggregate logging rate.

>
> > +             }
> > +             /* Notifications also cover completion or shutdown before=
 sleeping. */
> > +             wait_event_hrtimeout(dma->rx_pause_wait, READ_ONCE(dma->r=
x_pause_wakeup),
> > +                                  ns_to_ktime(delay_us * NSEC_PER_USEC=
));
> > +             delay_us =3D min(delay_us * 2, USEC_PER_SEC);
> > +     }
> > +
> > +     if (recover) {
> > +             ret =3D dmaengine_terminate_sync(dma->rxchan);
> > +             if (ret) {
> > +                     /* Retain ownership and keep RX masked if DMA can=
not be stopped. */
> > +                     dev_err(p->port.dev, "failed to stop RX DMA: %d\n=
", ret);
> > +                     return;
> > +             }
> > +     } else {
> > +             dmaengine_synchronize(dma->rxchan);
> > +     }
> > +
> > +     scoped_guard(uart_port_lock_irqsave, &p->port) {
> > +             restore_rx =3D recover || dma->rx_pause_pending;
> > +             dma->rx_pause_pending =3D false;
> > +             dma->rx_terminating =3D false;
> > +             dma->rx_running =3D 0;
> > +             if (dma->shutting_down)
> > +                     return;
> > +
> > +             if (!restore_rx)
> > +                     return;
> > +
> > +             /* Apply the current enables, including any intervening s=
top_rx(). */
> > +             serial8250_out_IER(p, p->ier);
> > +     }
> > +     if (recover)
> > +             dev_warn(p->port.dev, "RX DMA failed, using PIO\n");
> >  }
>
> ...
>
> > -void serial8250_rx_dma_flush(struct uart_8250_port *p)
> > +int serial8250_rx_dma_flush(struct uart_8250_port *p)
> >  {
> >       struct uart_8250_dma *dma =3D p->dma;
> > +     int ret;
> >
> > -     if (!dma || !dma->rxchan || !dma->rx_running)
> > -             return;
> > +     lockdep_assert_held_once(&p->port.lock);
> >
> > -     dmaengine_pause(dma->rxchan);
> > -     __dma_rx_complete(p);
> > -     dmaengine_terminate_async(dma->rxchan);
> > +     if (!dma || !dma->rx_running)
>
> You introduced a helper serial8250_rx_dma_running(). Use it.
>
> > +             return 0;
> > +     /* A late interrupt must not hand a still-active receiver to PIO.=
 */
> > +     if (dma->shutting_down)
> > +             return -ESHUTDOWN;
> > +     if (dma->rx_terminating)
> > +             return -EIO;
> > +     if (dma->rx_pause_pending)
> > +             return -EAGAIN;
> > +
> > +     ret =3D serial8250_rx_dma_try_flush(p);
> > +     schedule_work(&dma->rx_flush_work);
> > +     return ret;
> >  }
> >  EXPORT_SYMBOL_GPL(serial8250_rx_dma_flush);
>
> ...
>
> >       /* Manually stop the Rx DMA transfer when acting as flow controll=
er */
> > -     if (quirks & DW_UART_QUIRK_IS_DMA_FC && up->dma && up->dma->rx_ru=
nning && rx_timeout) {
> > +     if (quirks & DW_UART_QUIRK_IS_DMA_FC && rx_timeout &&
> > +         serial8250_rx_dma_running(up) && !up->dma->rx_terminating &&
> > +         !up->dma->rx_pause_pending) {
>
> Re-wrap it logically (also be consistent with parentheses
> when & versus && is used).
>
>         if ((quirks & DW_UART_QUIRK_IS_DMA_FC) && rx_timeout &&
>             serial8250_rx_dma_running(up) &&
>             !up->dma->rx_terminating && !up->dma->rx_pause_pending) {
>
> >       }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
