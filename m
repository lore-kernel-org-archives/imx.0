Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.217.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792954037;
	b=0UhLEBeuMjfRejJfuxSX2ZkpL82XOOFppd26F67KBi3gecuWSwnMnrGCDR3XqR2ZhTKf
	 +1Ze7sICvxghiqSmCwuroNIV07ID3EDzf6p8Lcnac59YMuJUJydDEsl50011flL1wr9ny
	 sTMdPQWE4t/c0yrhoxv4TqcdlM2kTomZL8eCvYywusTwKKBZGQKE8Ic4GL/ntBY68Us9V
	 n3iwNcLbkRZLsvdSaRS46t+JTy/CHeqW4SAbkpSt+kcHLvE9OtyxopKdeTit0At2fvMTi
	 xVAfR+ZH1H/bLyWAB9D8PFt8ZUt+YqiXzd2O00Sd07WdTn4Y8nTLeC4oJqHxfEqGTlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792954037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cd/Rf0PmOsf9SbzCT228kopwmzuVCMtn/HtZcsjTHHw=;
	b=myVwXbdGuIaQ/2Jmh8j4VeOLxylThe2SuYTA/gSLAhGS5TZK2irG2tQqACAg1tkbnsKv
	 XU78KGYTE76+ErGKUHCUYMdsxdnEFJi8v/VHt/SSK8QQl/ypcsMKyyCX3JPStMlc/deSO
	 YioMJDzMmVNDAKZolcpfvDb1EbB6EhwlhntlzBWkWiUU19AP5LNYZiijmun3voDxjIOhl
	 pILeguD3Qp8f0UBJWB3f+UFsck/DJZWWodDHxV7jSz6cOKGlERJ7sNlvwumiKz5kXUOD7
	 n4Rw9r5QWPtc5KRe4hJXs0/7wRbRqu0mxSuGC6cKD47vZTdT8Aq2yb1nStgiM9XBhfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qgMgfkI+;
	arc=fail smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E334A606A31E
	for <imx@lists.linux.dev>; Sun, 25 Oct 2026 18:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E334A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qgMgfkI+
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7ce78f9d6baso333203137.0
        for <imx@lists.linux.dev>; Sun, 25 Oct 2026 11:47:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792954036; cv=none;
        d=google.com; s=arc-20260327;
        b=b19XnxNPLSd30aVG64jkQecvXvNZsPIYnsc8+ECXcyurtPCYtTzzCrheVJDYexUSSF
         HZLvg1iECqTGjN77obbkVsZYnfXLWDRfgMtlpIhGVqZO7P26U9OIFRwk81xYyF4el6F5
         q6T8oJkZTORg+KXUFW4HX0/ob3637YnW4/vNnOViq1ZOCcXILLQexOf6QqtQAPo9lfYP
         Y2yjpTaXNLPzDNmn77SfDnRalQRLSfodDgmxhQOqx0LDgSAWVX6FYspUO8jmKvnAt2Ta
         wiJKl5plNossEeR603Z4Jv2FA6pIEhQuuwFk8QZBq10xvXL3m0bIJ+TaDBrb17/tIEw0
         1o5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cd/Rf0PmOsf9SbzCT228kopwmzuVCMtn/HtZcsjTHHw=;
        fh=hoP1eiOmIhPGT1lcYzsmGLISqXGHI6KeM9ArxTTDk+s=;
        b=FXM7e+eitMwC2r56y04HTVHYPv/Nb5H19CwQloLrgadpbEv7WdtZE89/7DdeqE1Rum
         1HRMiHg7xT264i83rjXXgOLjghIR8dOZIrXj9KWbo9cwml2U5hVjWWjR4U/w5Jq9Vh7Z
         5AafmiK4S48U1gconAUMnE7XSL23L0lZbDvAA7WaQdWJwsXFQ3Stx4H1osh+nsmkr6Jr
         qzeWmtHm3SDoHc8EOxbtpboIP1weVVHZ7zXTTlZKREQPanOrW3/AFuFJPfGtM8K3orJm
         1cqWAXDLqbOZA4LxdxeAPB7SPwbskHjYKnSsNE9dC/Uh9jkYu4EDhmwMF/qI/vmRCEDw
         2lkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792954036; x=1793558836; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cd/Rf0PmOsf9SbzCT228kopwmzuVCMtn/HtZcsjTHHw=;
        b=qgMgfkI+bRmuw3+ozG9ECdicDSjj0Iyjhj8Dj1m2Ke+wnIjxIEDLTngdX8S3H0QheQ
         ld0aZwgBSpAgwdZswnjjwVti2JyKP+EHZCQpCHPQDdsq2yhc2OXwKsdhVKpg6tTQQpV5
         3E5XsezRFwYflGjIeQ5G0PCHw/83KPwAkFyimHEHxDfrhxYXGfK2c1kWPO1J5N06qGc0
         1QDJ/yiZ+ADRTiycPKIWR40O+ipyk4deEj2QNF5EU4ifCO+XHggUCAzcVQhBxzLsDFe3
         umrod9MBBXfrnB3jILZmIbjeJ/fewog8LtsH76DyYeI7HaN6yy/3fFuARbkp+U39vjr5
         IJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792954036; x=1793558836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cd/Rf0PmOsf9SbzCT228kopwmzuVCMtn/HtZcsjTHHw=;
        b=k1qnof4cYV1/CS4BOwkxyfu54CoawYXWkQPZ+xGgD1w1wc2cbHiyrf0w81T8TZZfKd
         T7+mctjUTcKj3mJe/lZ27alUSTt6tyYS7OyXHjNU17vk9nKHf5aUDfxmASOoVphVJpJK
         0R7jWI0wcl9lXKgGLsLI9JoT4FyrzFXLlZlvYjzc0GSb6TqPGxEvtuqjGtVcEUXdETD/
         RA4Y+bU6ygqOSCJOPCqDkm1VDc3Vs23YVQo6CwYH1u0ZJOMajFEdDP4givrZ5Idi6WS+
         qKCvN7yrIFg7i9FJjsjk7RZjmZyeKOHS7YhimT8kLCPxLxwgqLPqsB3K5gOjjf8qT78S
         BflQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAlNDmVXXUdbO65Sltmzw8j689PtHmnMUfu1yvL7vLC9IfwCmBXMzYujpqSXjy7S6zYlo=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ3dRuPI4LN+pweQDpSz1C85Ab87nsaFx7uQ3b4xIYsY22qHZ7Y
	CFu0MKfDDJWM1mvGSa0WMRxuzrarntpznDc4B9zfPzXQuTZMXByYUv83F3gAtG4WCKevMukQIwS
	B9lIUXJHhPaNvhwDYLaQgUnMbfzHuNY0=
X-Gm-Gg: AYBFou3hyNArFP9FTkncgCqPEj2lEEtRV+HuMALjDKcB073jpMeF1kKaDD5YKYxCc7h
	RzdpOHzp7mdtkBkbm/dkP+JszeMKYHzn3y4vi+Yytkr5z2NPnU0h92Qgg9WEfEc7EJ38M5Cflf1
	rEa65LPRWTxhIN0ZRme4XC7C0tFYA93yLOlAipT7ABSYFzUvtC/asewwEvNensyiiPYhNKJL5Bt
	MB+nWo2R8VE9uVfC3exwjD3QwRY9ayYOu9rDPrHw6hmCqEX03Jn0KJUuq2Hu/qeHShwRmMAMPMe
	ILRsP/4B7zi4mTrfuqDE6Ba/9LKBBMlfT98GyjMxl4osAoA3F4hwVIjk6T9U1v/SKJMMHBePoV2
	l6aM5FWnZQ56ur1V2hkHGs77geJIZO4o9PJzQfmUskfS5qpuiPcNXdw7jEAy9/2nLLIdhAS46e/
	NsFHAF6g77T6rD7pKEbx9epY9+S2OEyOTEOJjo6OwveCMJJ1/d4k9dc14Ty88rSoCWd2jIc+Vvt
	hMoDwtFejGu6pjt2/jAC1oNgnT+TA==
X-Received: by 2002:a05:6102:b04:b0:7b5:8fd9:27e9 with SMTP id
 ada2fe7eead31-7ce5d005cd0mr1043722137.2.1792954035832; Sun, 25 Oct 2026
 11:47:15 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com> <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 12:47:05 -0600
X-Gm-Features: AclHuK8RfnuoMKUL7_ChiQcwJjtxWWikUNjoVOQNx_xye2F4G1UoFeQQYjFC0tc
Message-ID: <CADvTj4ryYd91LYMCktJ6a8=ygm0BG6dd4ZyK6XByaVcWvFTvkw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Raul E Rangel <rrangel@chromium.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 11:10=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.=
uk> wrote:
>
> On Sat, 24 Oct 2026, James Hilliard wrote:
>
> > uart_write_wakeup() expects the UART port lock to be held. Several work=
er,
> > DMA completion and interrupt paths call it without that lock, including
> > indirect calls from uart_handle_cts_change() and the transmit helpers.
>
>  Fair enough, and thank you for the cleanup and spotting the issue in the
> first place, however...
>
> > diff --git a/drivers/tty/serial/sb1250-duart.c b/drivers/tty/serial/sb1=
250-duart.c
> > index b4e1b90e5960..b15f76acd06b 100644
> > --- a/drivers/tty/serial/sb1250-duart.c
> > +++ b/drivers/tty/serial/sb1250-duart.c
> > @@ -454,10 +454,12 @@ static irqreturn_t sbd_interrupt(int irq, void *d=
ev_id)
> >
> >               if (intstat & M_DUART_ISR_RX)
> >                       sbd_receive_chars(sport);
> > -             if (intstat & M_DUART_ISR_IN)
> > -                     sbd_status_handle(sport);
> > -             if (intstat & M_DUART_ISR_TX)
> > -                     sbd_transmit_chars(sport);
> > +             scoped_guard(uart_port_lock_irqsave, uport) {
> > +                     if (intstat & M_DUART_ISR_IN)
> > +                             sbd_status_handle(sport);
> > +                     if (intstat & M_DUART_ISR_TX)
> > +                             sbd_transmit_chars(sport);
> > +             }
>
> ... why do you think the whole functions need to be called with the lock
> held while they may or may not call the handlers in question even?

For sbd_transmit_chars(), locking only uart_write_wakeup() would leave the
empty-FIFO decision and TX interrupt masking racing with start_tx(). A
writer could queue data and enable TX after the empty check, then the
interrupt handler disables TX interrupts and leaves that output stalled.

The same lock protects x_char handling and FIFO consumption against
concurrent updates and flushing. These races predate this series, but
wakeup-only locking would leave them unresolved. I'd keep the complete TX
operation locked; each invocation sends at most one character without a
FIFO-drain wait.

> I
> think we should avoid excessive locking where possible to avoid holding
> execution elsewhere unnecessarily, shouldn't we?

For sbd_status_handle(), I'd read and filter the change status first, take
the lock around the CTS/DSR updates, and release it before waking
modem-status waiters.

I'd also move the TX lock into sbd_transmit_chars(), so RX-only interrupts
don't acquire it. That means two acquisitions when both status and TX need
servicing, in exchange for narrower critical sections.

>
>   Maciej
>
