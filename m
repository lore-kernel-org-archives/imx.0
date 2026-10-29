Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793294050;
	b=IeunokZnQO9b7CDi2tX18a3J4F2mXgTdHKdPVjUKfoIXCdjX/Ppg4pZ3XNXgHfze1U++
	 6zAoYSAUQsUqW89QrwsTSHLYx2jztf117zQHW5JAi1hZsBk+BnDaRh8LKfzG+JI9S4ISo
	 pcJQEQZ3278BQSxzOzgrKgzCC8YF3FcyN5biG2CSfGVeVmDaG6lOzvnoVz5iswIqhe5VL
	 zKD5qVWqM4Z4Uo+35Xt5gVjwSh0RLylnnLzY7GBS7aT88Rjq4PIBY3LWVZl9u+mI/WA3T
	 ZmW3NcevQYj714oA4lY3RCa3VmA0Ep65lrJkdF+76E12PWt4BgS3mAjuooBbtVh+CWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FTbT3tgSxeUnwmRhmxtw1LLZfXKECJjTK/sp07zcT8c=;
	b=BjPnSBghtuzC9+WzYUQ1S8BRXfyN3upajiIcPJnmLSjvruanuSCERi12U1BDLAoBENAY
	 C6qXwfHzBHDkdCFE3XjOC4P0mvXvvmVmc9TJjTIMzs5+pUm4ezhGVTNcMM63keo2064OI
	 3UuveR6NVGtPpuFAY+PDgO0Tacdn+CrUwFqyOk2JwEZhbKHpPAeiIVpK9/dGA3jylaHKm
	 H3weV/UGgKx0ziXqDKD1yyT5Tthmy69ekDicPiYY0VjuGimdgTTiWLmU3W3FW81TetUfV
	 Bi83KAFSo/GBz5Mjd8DAK45AlcX7/zbBWs09USeisgrAZjE2wgUJTQPTebFC3LSJu/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC47606A320
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 17:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC47606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b413b0a974so3605329a12.2
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 10:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294049; cv=none;
        d=google.com; s=arc-20260327;
        b=gSL377LrjAwNg9xgxde+m0LTxOu8LsacjOuvcNPKlIBSSATCQPUctnoO8swcoPrWCx
         BnU5sZYFX7fSKFVr15vNxkm7L7YXxIwzZfEtTQ1DSdIaRYNl2ypiyokKdYIRhIhhNwh6
         P4HYBjcsvWj8ncCML4GsqzVTNs1mItd7KGO3PxeimYypv/irgckRnehmtNv6Z5L/FZZf
         2FiyakgM/RPqUG+GiHH5DZI4t00w9huDrM58OLP5bH2DkRy7j5rtBvEisteWzD/PoNSD
         Var7Y2chv1rAeC3FdIdsA9LcryXMwK2olBKUWCvAkS1V5fIq/hiUpiJVcLN3s79XuwLl
         me1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FTbT3tgSxeUnwmRhmxtw1LLZfXKECJjTK/sp07zcT8c=;
        fh=MGBq6AmqNbQwaUDTPNm0k9jLTyYdo0St9iWg+fUecu4=;
        b=JfeiQtmeez0NJVPgxC1f9DwbqnO+h/ghbjfHvbq/gx/RyY8+UMVyx9zgosD/L1uuq6
         Mk1Gdg89Ni7K89dM+NOEe0cHNhIkCXL7Wakk1GAcplwXId7+dQqnFhi+VHMirChlMA+i
         Lw8qzAO2hsxhJ570iI43mLOI6SGOH8O+VyybtKV1sghQC/LFb843yzDWpVzge9Rli+2Y
         Dka+95yfEvswGpgYOw8pymCq1BMAJYbhDTtdnWQn3wSrxAUXV/hZr3ZnvoB8+1PX6veM
         +UZrvLndaaFi55OJH73WQlxLYo8MbiHCV7mU57cf4P+YFXgP/BKJRk3OFMBnPDljf4L0
         2DVQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294049; x=1793898849; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FTbT3tgSxeUnwmRhmxtw1LLZfXKECJjTK/sp07zcT8c=;
        b=xAMdOlXnT+L4Ba9DCV2NgVKVTC9pGFdn/cr7RjPguegxEoqiyPHca04TxJxlGX6yfV
         Br0LNxe6et0QFOMRWKX6T89oqBK8ST3FlgSpTx3o2fBMZQXKm+SNdZ43gGfD1ncDIO+O
         MZX9vigg3qNZzBbLs9T53E02rBGVSQV68dhqzbAMHl0ArRQn7dXmbC6hKOLEiq86kRh+
         Jh/EJkj8P94SrqdsjvWHFBfV4wcAX8AsPHuW3D7gwayYU/sPpblPntRWmABzp77TdDaj
         HebON91zjXTZSgGBe+3+X8lMquldPW1PWVGma2+JTaTVXlGTvpc6JjxKFPaBlv5qjWaL
         pu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294049; x=1793898849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTbT3tgSxeUnwmRhmxtw1LLZfXKECJjTK/sp07zcT8c=;
        b=RQgGd7kvxYoz6KA3QasDsSMAH9cZf8GW01hJploT1a6y/RBrLkH69ULCeTtZbgp/nB
         yKH13XQty6VoaX6qNSiJuSPslFeY359y+L/pvF7jMt2B4edYFrzgc7tmxO+AEjO2AEoK
         hbV4XnC9ETdlgaROCt3mRqfN1WrA4KLzOLwdAf0pkD4rlnyWkFMjtJhx45jqRBcEEIx+
         Bvgml4R7sZuy8nSbqC84tWdtBO2Q7fJJHQxL4JtkPS9S+BxrR6T3NdaLJZiiwh/3XA5r
         xIZ5NQCI43KheBGbIDqUjMR+apGIO9kFnThvsdAuCSAmTmJHAXRKcGnLpqk922emC4Uu
         Q+EA==
X-Forwarded-Encrypted: i=1; AKwUvByoHeBubtJC04y2BnaUS9Ov0PQotRlutG/ZsdV7g4UK+P00/Sg7txWuQ4hvqPYH2gIWVNg=@lists.linux.dev
X-Gm-Message-State: AFq9FYJzkP5ZLLvr5nG2lg0ydaeH9a17k040Ey9MQRjEGXuRLMxvJRIU
	h2T65XI67woEQHu+EZU6FCwhjkjFHYSXmI7G+nFX0dTB0u7e3JXwDyQjD18zEUOaoLT8wNvEhFr
	hT0DuDlL94p3n8a6inorPnbkPYuJh/If5JlmW
X-Gm-Gg: AYBFou1uE5/z1Bqt4DT9YPWHy0hWtwVNmO3R27HgfiGAhykeW6xWL0QU0wHnchH0Qze
	3uyzTTmMR8IrxSeiP9uO4/wmIkQZDuN3SsBAZ6FsAotLYGUN7IVOk9U68pmeagJCJ+yr0tcJKCJ
	hUB6bo5wqDjOrYhdDOsEIqEbjMA84Egmg9/ZQoUjn2JLgtOwqniU+1ckvHWrGq80EKfkcEkEwOf
	UNMu+YCGn05JlXT36Bq4SYjzjgWujHB5R0IwRZrd5DckMjudRoayxF/Y8/W7lW/o2sbOXujtFrF
	ytgdO9ZNoOTqzgi6YmR0tvpwOdeU3ZJwpk4oeY/S3WRR5wZFVyTcTr9Gr0K2qM8XznXdJju0TnX
	UDe6LEQbq2xKF6J+KLQTP0NT5JgfJE0Uie2RUhbPgeZwDuS4noTEgas+fmKf0mIbl3JFuxBs14s
	xlaWw8EV+HsrHdklJCe59WQqfEgloUeshShjK3OZK+lZMHetndWZqQ4EUqmBj925+b0xEcxIc1j
	ZXJrCDezeNqPsV3XMpTMx1h+ccR7w==
X-Received: by 2002:a05:6402:1cc4:b0:6aa:9830:aa21 with SMTP id
 4fb4d7f45d1cf-6b49cb8eabemr4436038a12.39.1793294048534; Thu, 29 Oct 2026
 10:14:08 -0700 (PDT)
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
 <20261029-submit-serial-8250-dma-cancel-v1-v8-2-3fd56ba352ed@gmail.com> <auNVk_Y8iiAXyFa3@ashevche-desk.local>
In-Reply-To: <auNVk_Y8iiAXyFa3@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 11:13:56 -0600
X-Gm-Features: AclHuK8vSM1CWTDsGeWZ16QtCofwiUc2xcHxHUC_tVZ5DI3qrKZF21jWZD2zp04
Message-ID: <CADvTj4pwVF7u-6z3RUiHWGyG3MZGFU2WkytMRh0G16pdFwaotQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] serial: serialize asynchronous write wakeups with
 the port lock
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
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 8:18=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 01:36:58AM -0600, James Hilliard wrote:
> > uart_write_wakeup() expects the UART port lock to be held. Several work=
er,
> > DMA completion and interrupt paths call it without that lock, including
> > indirect calls from uart_handle_cts_change() and the transmit helpers.
> >
> > Take the port lock around these notifications or their transmit helper.
> > Keep sleeping SPI and regmap accesses outside the locked region, and ke=
ep
> > the FSL LPUART completion lock held through its wakeup. Acquire the por=
t
> > lock after releasing private channel locks to preserve the ordering use=
d
> > by UART callbacks. In the MUX timer, publish available FIFO space under
> > the port lock and keep the hardware FIFO-drain wait outside it.
> >
> > Use IRQ-safe locking in the Atmel RX and TX tasklets and SB1250 termios
> > path, since their interrupt handlers now acquire the same port lock.
> > Preserve the caller's interrupt state when releasing those locks.
> >
> > On SB1250, lock modem-state updates after reading and filtering the cha=
nge
> > status, and wake modem-status waiters after unlocking. Take the TX lock
> > inside its service routine so RX-only interrupts need no acquisition.
> > Keep that lock across x_char handling, FIFO consumption and the decisio=
n
> > to mask TX interrupts: a writer must not enqueue data and enable TX bet=
ween
> > the empty-FIFO check and the interrupt-mask write. Each TX invocation s=
ends
> > at most one character.
> >
> > Serialize CLPS711x TX servicing and its interrupt-enable state with the
> > port lock. Disable TX interrupts without waiting in stop_tx(), since a
> > threaded handler may need that same lock. Have an already queued handle=
r
> > leave stopped output untouched, and drain it outside the lock during
> > shutdown before the transmit FIFO can be released.
> >
> > SCCNXP handles interrupts under a controller lock which its UART callba=
cks
> > acquire with the port lock already held. Collect the ports needing wake=
ups
> > in an unsigned long bitmap while servicing the controller, then release
> > that lock before visiting the set bits, taking each port lock and
> > rechecking the wakeup threshold. Removal drains the IRQ or timer before
> > unregistering the ports.
> >
> > This serializes write notifications with port-locked serial-core state
> > changes, allowing readiness and transmit-storage reservations to gate t=
he
> > notification without a check-versus-shutdown race.
> >
> > Cover DZ TX servicing and JSM Classic modem notifications as well. On
> > DECstation ZS, acquire the port lock before the SCC lock and notify wri=
ters
> > after releasing the SCC lock. Defer normal TX restart after console out=
put
> > to a worker, since console output can already run under the port lock.
> > Check transmitter readiness before consuming another character and drai=
n
> > the restart worker during shutdown and removal. Release Lantiq's hardwa=
re
> > lock through the transmit helper's completion hook before notifying the
> > line discipline.
>
> ...
>
> > static irqreturn_t serial21285_tx_chars(int irq, void *dev_id)
>
> >       struct uart_port *port =3D dev_id;
> >       u8 ch;
> >
> > +     guard(uart_port_lock_irqsave)(port);
>
> Why _irqsave?

For serial21285_tx_chars(), a plain uart_port_lock guard is sufficient.
It is only registered as an IRQ handler; saving and restoring the IRQ
state adds no protection on the hard-IRQ path. The necessary change
here is acquiring the port lock.

>
> >       uart_port_tx_limited(port, ch, 256,
> >               !(*CSR_UARTFLG & 0x20),
> >               *CSR_UARTDR =3D ch,
>
> ...
>
> Same Q everywhere (it might be legit in some cases,
> it might be too strong in others).

The other sites have different calling contexts. Workers and tasklets
can share the lock with a hard IRQ, and some helpers have callers with
different incoming IRQ states. Those need different treatment from
hard-IRQ-only handlers.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
