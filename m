Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793294138;
	b=hOoKU7GFtcmpCTWYIosHaMtOqERXKtNoHv1IY/GeKxFhivCoqrJsz7HI7tT+MNzd9mm0
	 ngfLKsy7iHMeIQVqg/MQiIcapllAY1ymMmZT3tYR3MSsoizxHIu/1ZtgHspZB1PdihaMw
	 mlGU7H8da+0clLIFvTMvvJ7DPSB8Q1o6WwDAcsxgV3XPJqlH2RTJp6+NAt68Rbzs8ad9g
	 GJS9flA4jyr5pGu1wQquX8mMkaVPul+Qm3SSIW2YU/uxzrutlQndFv8ambaoxDG+A/NOP
	 iGqaPkiobekakqEn4X3FMCupzAkc8QJo0c/nMP5xY6NgDReP1w58PnCLL9wvggc03Dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bfkoGr6eHduUtBaHwkrM0dSWX67wyi9EvMSHv231Bb8=;
	b=JVfQGlr4RXnQmK/ZwS1skREEWI4Hl8vX5IEHfoBzM2tOsrD1UhHI0o7nxYZWauxhkoY+
	 gpuFDtEcrZciNrb30or1m910Se4obufosGU+gLuSYtITBhDiiaX7fE9XDOu3V+e5c2Xvu
	 O6SjHakefP3/Mssx0z0pr8sHg2El/BF7YuKBPPkffq1gX/aAwYuxIwwZq38N3QWoocKNB
	 sdHLrfi951MBOI7HjZTy0M+sVn9V0Y8E+xu8QeSvUqOt/riFFZHnVYfOh9qGiM6UVFYy/
	 0RayvC8IOtbwptRa25uqXogZV5XyNIyoSFzLHT8K/tmMz1esYNXC+k8v1UDEdv05bgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nfZc1PV6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0F5606A31A
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 17:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A0F5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nfZc1PV6
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso3583326a12.2
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 10:15:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294137; cv=none;
        d=google.com; s=arc-20260327;
        b=CSMI/NKF9QTArSRSUPRLQX4ytz0yTwFOVuy02kf/ZCpCz4wvLfSbGxzy/3jui8e0Ms
         jOogPuUczQ9jbPuGzcOtAiVB6uo8oNYj3G7VrZC5ouwCbHdYFD18th7bmOw7NeTjUvLw
         gLdA9xjze4atWyxm9UMhIkTZK+9S6jp9WPeqZIttId68bPCP4fubuT9jRAEwvC54cYTt
         P/QiME9xGHHmpkkIFjJd49jp4vLVluJVIdEUVQcbxOWQbEeyq/1b279FgiGbKuESZ0Ej
         +oAyofovN04Q3YPBQnsXP0Qp4kixxwfSHImxakx4Qj1LXxtleQ2qDolGqL8qXstg1q+e
         aUNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfkoGr6eHduUtBaHwkrM0dSWX67wyi9EvMSHv231Bb8=;
        fh=iQZLPT8lD/a89vJVH4b3L0LfxZbMkAtwO0ktr+Ubfdo=;
        b=M7Ev8vGLmObIKemAf9WYqEoONKwzDjqb2c/YqtEGVdrBllLtmK7axhfq+a8L9S12Da
         RLxrUillS2apIQgvUWUY/HPEOVVeV+i1W9KF0HyeSgBVwkYvUHOpfXQkwGFuvuTuM8v+
         1xMtDBpctVadzfOzdiDj42HEbdWuI+Q/axuvIvtZQQnHyD+MXGAkn4BOtlbCD8fscqPA
         55WCyd8+YTrjFkMJgvrNVdnuCElOtuDjDqS8/Q6Eu+W7mdPIKHEntxboO/J1FC/TGKYr
         LHuCl5sBEmoGLdpM+Fvw+RKNO4f453rzMdyNElFS99lDFhNjPEVwqPNbJfnPpAQdfMPJ
         LCFA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294137; x=1793898937; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfkoGr6eHduUtBaHwkrM0dSWX67wyi9EvMSHv231Bb8=;
        b=nfZc1PV6JOGnXWRbIqzV+83aKD6PlztnetsI6ssGRVeIay49wM3hTMAq37hOf3AjXh
         IuPkZSMjn6cyVQVHOORTS3Ls5/pEsr04LuJ7RHqJ19Du6PUGjmvoqX0i7CLyEuSJGTqu
         8zYXfn3maFKg7Ct6DNZ1XKpswUBMgbp0BREXrqrbwTZQppau66wsLp99xgZGRZHXNyi8
         QI6ZKAJ9js73hu2mr+I86cHZkR8Mm1GVIEoqwjMQIxtEVyUSl7Y4XLbEZfjFMpalFck8
         BCOnPXjWghlRyMrM7BYms2UcdHo7ew9+co5q9sUCPREfRWUX4kYLcSMwzEPnS5o8douZ
         xdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294137; x=1793898937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfkoGr6eHduUtBaHwkrM0dSWX67wyi9EvMSHv231Bb8=;
        b=rHpX60VMldpeq1VeNGkTXSTdDAQWv+qSqu3vx4R8Ltr96u/2tOcJqYWfotRzaz8loC
         miTzbLcWCIJy7PBVW3NEiL2IGmTgUvVRLSZZbrf7tK0auvfk9R6WDDRuMn57z8dFqSev
         QjYHw+xniJFqdN8p3etMyKQfXPThkYCJSBs3SbXt1rSCFo6ASukzZVGXjo93m21/LEqa
         651JsG8VeA71bOgj8xUxg2NSV0gFrU/2VVsCZ1/doXJh/U4uGMKaiJI/h3Vy6yMFjtD9
         lWdcMBvt0al3m+1BsDgmHYp7tpKR4pLTXkI6uKBTHWIQk+tWF3YkFp3ittqFEfnkGFYI
         qmVg==
X-Forwarded-Encrypted: i=1; AKwUvByVIPMwYtFiOfX+g5mUgAm91wdBd2ymMiwtx2Ip1m19jLkD+jcuVE2drZPGV9s43nIFJUU=@lists.linux.dev
X-Gm-Message-State: AFq9FYKlGA9D2lELI3U568O5uGo/92VMmAYdxDs9l5ziz/F9J2XFO0YK
	TcuJWElFhyhcVbUcQK1SMO5QhrL5nwMXYbJy9DH0qNmtG/LWsSru6zV+eqb2ZR2JMy/4qljCFw9
	04lJTYwq9HeoPDAAYeMp7XuwETDZwahI=
X-Gm-Gg: AYBFou3JgMcfmaJ3s1H2b08lcULAqJNFAIdNFk2GcgzlvjBRI+ebSBi+mzAMbEh7ZLl
	DurDS9mc+pnZUw6TZ4wvNuQeoOmEQbL4dEZ4fmNkIEc6Y5tYJhYJcG8lcUQcywiryjnHha3fZo0
	QJifVO0CdcjTXQ6G+6EUa2EFivWG8txgakgl/qecMTfiDH3sUzWPiWwi8cgzMjersS9NfrH2u0d
	sXD/FXd3daBcpgR6EYlZQCihQ+u0LFmG6zs1J7rSp4l724C9xXYAXyOdMBwrBPkzksmdcFuMQCn
	gFK9ywzwQKYh9THItgx+/iZT6oOq7ly+G5poLZx1zjn8F+LRB0WecfogWUVB8wIVJ9FDQmyPNit
	eYAtEAG6MzKrC9bLJFjmTm7ZF98ECrVz+zE7ryaJ35nkatUdc4JYCfboEhPMrV7j/2IpVL2emwB
	UI7IGl70Kz0j+libvfO1lJuMfdv6lQP2ZALwQU4m2rOKsu43zaShB6VpjP9QiKSJsrdyqn2TRp1
	/WUeD0yZRwGNB0pBYW8UmwkJpt51w==
X-Received: by 2002:aa7:c687:0:b0:6b3:f840:59b5 with SMTP id
 4fb4d7f45d1cf-6b49cc019b3mr3067325a12.27.1793294136580; Thu, 29 Oct 2026
 10:15:36 -0700 (PDT)
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
 <20261029-submit-serial-8250-dma-cancel-v1-v8-4-3fd56ba352ed@gmail.com> <auNV7Vco5O3vVwRH@ashevche-desk.local>
In-Reply-To: <auNV7Vco5O3vVwRH@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 11:15:23 -0600
X-Gm-Features: AclHuK8a3pNXQ_IsYXCQfDMZzFxdEUJPDH5qKP3q2TLb8CO-tQBpFEH7zYCUMxU
Message-ID: <CADvTj4oi6dFzWkjFXie1U49A70Y7Mb=4exga-=2SmG7fN2pLrA@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] serial: 8250: drain canceled TX DMA before reusing
 its buffer
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

On Thu, Oct 29, 2026 at 8:19=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 01:37:00AM -0600, James Hilliard wrote:
> > uart_flush_buffer() resets the transmit kfifo before calling the driver=
.
> > serial8250_tx_dma_flush() terminates DMA asynchronously and clears
> > tx_running, allowing a new write to replace tx_size while a detached
> > callback has not yet run. That callback can then consume bytes
> > from the new transmission. Reusing the reset kfifo can also overwrite t=
he
> > source of a transfer that has not stopped yet.
> >
> > Reserve the flushed FIFO storage through serial core before returning
> > from the flush callback. Keep tx_running set until a worker synchronize=
s
> > the terminated channel, suppressing old callbacks and new submissions
> > during that interval. Return the mapping to CPU ownership before releas=
ing
> > the reservation and waking writers. Normal transfers continue to use th=
e
> > FIFO directly.
> >
> > Reuse the locked completion processing after retirement, including OMAP
> > delayed register restoration and transmitter-empty handling. Take a run=
time
> > PM reference around worker UART accesses and drain the worker before
> > releasing the channels. Shutdown releases the FIFO reservation after
> > stopping DMA and unmapping its source. Serial core keeps writes and wak=
eups
> > gated until startup or resume makes the port ready again.
> >
> > Track a flushed FIFO separately from the transfer length. If terminatio=
n
> > fails, retain the reservation until normal completion and account the
> > completed bytes without advancing the reset FIFO. After successful
> > cancellation, process a zero-length completion once callbacks have drai=
ned.
> >
> > The race was found by inspecting cancellation and restart while prepari=
ng
> > H616 UART DMA support.
> >
> > Retain the tx_running check in both completion callbacks. Releasing the
> > reservation relies on the DMA provider draining detached callbacks when
> > dmaengine_synchronize() returns; provider callback-lifetime fixes suppl=
y
> > that guarantee for controllers which previously lacked it.
>
> ...
>
> > -     bool                    shutting_down;
> > +     bool                    shutting_down:1;
> > +     bool                    tx_terminating:1;
> > +     bool                    tx_flushed:1;
>
> What is the meaning of bool XXX:1? Have you checked with `pahole` the res=
ult?

These are one-bit boolean fields, intended to pack the state flags
into one byte.

I've now compared layout probes using the kernel type definitions and
saved build flags, changing only those bitfields to ordinary bools.
For the complete v8 structure, including the RX flags, pahole reports:

                            Bitfields   Plain bool
    ARM32 / Clang               212         220
    ARM64 / GCC                 368         376
    ARM64 / GCC / PREEMPT_RT     368         376

The sizes are in bytes. All six flags share one byte in the packed
version. This saves eight bytes in each checked configuration.

The packing is a layout choice, not an atomicity mechanism; updates
still require the UART port lock. Given the measured saving, I'd keep
it unless there is another concern with using bool bitfields here.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
