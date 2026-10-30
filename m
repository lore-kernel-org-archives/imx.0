Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793320349;
	b=4tf+SrFt11FwaR4yO8ue8x58O/cHadAThj6yOeTT07iOmL3Rb8yFVmxTy6NsbGL6D9qU
	 LOD8Rvbr4TeZRft/8ho+UcTZ5OenqUIH2jbTToCXjpxe1mv/e/IOI4Shw7BFUu7hxBQNS
	 Aaf4CaioPipJ6BN14PvtnX6bbynk6DFg1Xdk6gvzYg/+jHiRgOlJ4pbCePG0jgxMDa2lw
	 3bQzZEz7qQ+uitp4eoELwLWkfqv2bq+949kXBpOyn4kpg2o8jr8JmW57OugMKQSTk+kkE
	 9QOFH2h0lsl0S+F1EEMookdzXii3O01ZRTBAK0dSmjUi3aScPN4jhgsQbk1BAWkbenQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793320349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eL/J2+RjMW7d7peZHUwlj8fhC1xc2jm5N4kIcoYsMvg=;
	b=xHg/sL6CRU5DgKmitezfq3QiNUb2AeEqYn1yJkARKx3OA5UYRFVpyygqb0AcYc8q900i
	 SXH8OdI1ydl3GNTbQIxnqSCQVRRbMrngKoZlGLmRTMZn0yCQ2X7oW2CnrSIUVQAragAEn
	 x/4VWffZ++xiEv4ocye97rwVxGY8qetzgmlOo4OZtNcbA0TL9cr2xJ/Arx5VMx0i9eLDx
	 bcJIf00PGfHJpo0a+z4XiArIa8ykltCnKbugyXyksrOWcHcv8tyXsD89wtM+dBA0jfhMk
	 2eoIJuWj55lU3MBFPT7WbSHdY+XzW8bNX3pcxENsZ+IbNrPyh7w+nDYoS88I6BJImUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NlwaKvYr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7711606A31D
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 00:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7711606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NlwaKvYr
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7cc2bb73cd9so21831137.3
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 17:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793320347; cv=none;
        d=google.com; s=arc-20260327;
        b=KHKjJuuczA7tDQINo4TVKD0TTm00UYS+FRuEr134D8f3pHttnsz4jbq0G/xGKO/+K2
         nNZ53RnFIppRM+AZ8a0j+ue6Tgs5Y2TKMqh6aI6nlzsqg4I4BiLyuWt0TvqV5o4/uwY0
         tbWMmiiW73aFNC5pjpyUzcCeQb52jseP1kT45C3/3abG4NncmVzssrkaaRLRTfc3bMmb
         rB+8kMDRv1TaE5AkD4Z6dr1QmHY9cf5lBzMmtHN59Nyqx2YciNQ8MkujcaaFIkU8yeEi
         W/UQDnUBnTmFqcj5KSLTOoPb4rWTzktM9PObcb/4xEF9UQtwjg7x4wrbyF07zPqxq21F
         Ia3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eL/J2+RjMW7d7peZHUwlj8fhC1xc2jm5N4kIcoYsMvg=;
        fh=YvPA/QNjVZ8AOP9QyThjTA9nydL+1P9Wcymd5Aic3xc=;
        b=Muft2/kVhNDHpzoyHOLTvNkbQmSfoZ8Y909c3/Hq5+4D8BXhzzlm5KKB6DMe1fL+un
         CbKE3KX39Xgb3UZHUfK/hg0m2P+EkBRh6tCA4lm/OD6h56quIttFW3kEJi1xgFeL5nAv
         PLWNNcp7b22pLM+zosq+GH0YLaAev+pPqUxJ0AcQRl36sPvNnBq+XmtiBWnc+w8QxCW0
         fwnApOXkENe0U43WY794wT4n1IN+GJNZwMuABsnOAdoRDrXeFtGLLqX/BiYojgQvO5Fv
         8YOKzsvhWGmuBiXfDRbCnEQ+WyW65v4PLEDYCrSuRXdaNUc5uhiv3p63d14J0ZW/vP8Y
         ZF4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793320347; x=1793925147; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eL/J2+RjMW7d7peZHUwlj8fhC1xc2jm5N4kIcoYsMvg=;
        b=NlwaKvYrJkO9SMkV1XXE0roGMtcE0uJ18elW4woOGuntpzwJX8JB99ZO21fMO40/zv
         ILuSr5d8E8Jrm8yAVowtfwLtfSgu48uIetr8/QewBVsBYgsBj957kurbTT97In292mdA
         xie3nhH7msgQb2plL9hQooi09RP50Ww/KuADQNGeu6Nf934jSNO3WfCpuO79s2IaBBkd
         gZJCv4z3pp33fmHjX/RlmtRBqCIzunkBQ9HwhA5hsag/MT7LMk7w1y0qMttbfHmdZcEb
         6kWwWRj3kDz1VHsSWStpw6nkErra/YESlk8fGcIdmu9ihFBaxFn7x24xCT1f88oLh3xU
         wcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793320347; x=1793925147;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eL/J2+RjMW7d7peZHUwlj8fhC1xc2jm5N4kIcoYsMvg=;
        b=tIpQWhG5v2Lb8CF8gvlq79muxp354uIwY1qq1H2q0VggXTAvJWIl6uUYi34OuAuc1j
         N1fAlniK/K5P4LLXUZi28EU/q5rdaIbML35ZsHMY00Gq4g5h7S/kxwkhlBi6/mMYeyiA
         PqWv2mfTjIZZo68D4+CSNL+kIu7/t4ftcq3mkNRF8iiSKizCmGnRnJQGETX5stcEcb2h
         mDTViIuv1+dCaioDdqUtQty9PvLp/oc9tfE1597VMG7ynuglxpRWnIlQ+a1x3quYTr1q
         pWqrlVl9IMw8OYsutXCiT0R/nyU2u0T7rk3d9MbGzVWpFTDiguCSIuZH6aYSqXLwfmwh
         sLFQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/LniFvlx5GE+vLdYR+n4JO7rhhsX5BmTzUUoc/pjp8Z7g9+9nYTMUea3CIxgxsL3j7UM=@lists.linux.dev
X-Gm-Message-State: AFq9FYJ622OBKrM6d2lwTY48b52IxOy8lgkAqP9D+CO2k+pxYojPj2Ax
	YZZdxdcNkWSKPop++1QDA5fJo+Pk3R2F5dKgA/rnsY/WTq4b/njoZHqu0bludSgPYTTDVU+au+v
	xZIHTdNGfXn3tXpzIx2DKnvh18mqWl0Q=
X-Gm-Gg: AYBFou2hkxwYBbuE1s3QmBlcMXGqfoPfuKOiIFjjwahUF8YUB5ZM2ixcRExbCa3rZYR
	nkHC8P8Jrc2xY1+PEtXqYqPHNKVG18i7gUJEkriC1hlqQK1RyWCKa57gwoQlP6LSyVxrJe65hK2
	RM9MRjCG4WclE9YJROkI09alQmIhjRMh8ae50q8YfpA3g6LtgscxBfzmZ7Z4ef7mp04Mil60yFA
	WbtglRg6d38+DA3ntdlUCt0td2iZ+mYXvnSBE9iEeAKWqNnW/SCVdEgZE0piEUnfB08RUNG7Uly
	tZvWbA/BSnXPJ702+Rr5l2EKfvI6Tax171L49/CApgZE1lYc5CUkNkl4NsgXwBnwsW2MJnCoP9L
	8N9WXAiBY1sk8YoVHR6ER7pJtfQzkI8VTQuCGaFwrx+12XepSojYzELZWT0YKHh+RtiyDEpWgS8
	WfjPLXSOIr8S+otU4kap0xS9Xp6RsHcHQn6VHJdkj1Guo1tAL9ICG3jY4H95siHvCffSyo2YUid
	oh0mGB1TAE5F7s1RcAOpDq2bc8aNXE=
X-Received: by 2002:a05:6102:290c:b0:779:5049:87b2 with SMTP id
 ada2fe7eead31-7d0723d710bmr492388137.0.1793320347401; Thu, 29 Oct 2026
 17:32:27 -0700 (PDT)
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
 <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com> <20261029222734.3086943-1-rrangel@chromium.org>
In-Reply-To: <20261029222734.3086943-1-rrangel@chromium.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 18:32:16 -0600
X-Gm-Features: AclHuK-iYJ6lzjlFUVN3seH1Gc5KBaAl343rbNN_d-8c384kErq2Nw5ubYUVG3Q
Message-ID: <CADvTj4qK-1SX_+YZW1jdW-e5JOZ2iz3vAK_8UvkyZWb0rAeyiQ@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] serial: 8250: retire canceled RX DMA before
 reusing the receive buffer
To: Raul E Rangel <rrangel@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
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
> Hi James,
>
> Thanks for the v8 updates and for opening PR #1 on the TLA+ repo! Confirm=
ing
> that the v7 issues in Patch 2/6 (lantiq, dz, zs, jsm_cls), Patch 4/6
> (__dma_tx_complete tx_running check), and 8250_omap.c shutdown locking al=
l
> look resolved in v8.
>
> On Patch 5/6, we updated our TLA+ model for the new rx_pause_pending work=
er
> retry loop:
>
> > +     ret =3D dmaengine_pause(dma->rxchan);
> > +     status =3D dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &stat=
e);
> > +     if (status =3D=3D DMA_ERROR) {
> > +             ret =3D -EIO;
> > +             goto recover;
> > +     }
> > +     if (ret && status !=3D DMA_COMPLETE) {
> > +             dma->rx_pause_pending =3D true;
> > +             serial8250_out_IER(p, p->ier);
> > +             return ret;
> > +     }
> ...
> > +     for (;;) {
> > +             scoped_guard(uart_port_lock_irqsave, &p->port) {
> > +                     if (dma->shutting_down)
> > +                             return;
> > +                     if (dma->rx_pause_pending && !dma->rx_terminating=
)
> > +                             serial8250_rx_dma_try_flush(p);
> > +                     retry =3D dma->rx_pause_pending && !dma->rx_termi=
nating;
> > +                     recover =3D dma->rx_err;
> > +             }
> > +             if (!retry)
> > +                     break;
> > +             usleep_range(1000, 2000);
> > +     }
>
> This cleanly resolves the race where a full 4 KB transfer completed in
> hardware just before dmaengine_pause() ran while its DMA completion hardi=
rq
> was still pending (once serial8250_rx_dma_flush_work() drops port->lock a=
nd
> sleeps, the pending DMA hardirq runs and marks rx_cookie as DMA_COMPLETE)=
.
>
> However, what happens if dmaengine_pause() fails on a *partial* RX transf=
er
> (0 < count < 4096 bytes) during a normal UART_IIR_RX_TIMEOUT where the re=
mote
> peer stopped sending and is waiting for a reply?

With a persistent pause failure and an incomplete transfer, the
worker keeps retrying. RX remains masked and the runtime PM reference
is held until the condition resolves or shutdown takes over. There
is no receive-progress guarantee if the peer remains idle and pause
continues to fail.

> (In PR #1's Serial8250RxLifetime.tla, Spec puts WF_vars(ProviderProgress)=
 on
> Receive at lines 67-70, which forces the remote peer to always keep
> transmitting until count =3D=3D Capacity and CompleteInHw fires.)

That fairness assumption cannot establish progress for an idle peer.
The broader local RX lifecycle model includes permanent partial-
transfer pause failure, but checks ownership safety and close
progress, not eventual reception. Passing those checks does not
establish recovery from a permanently failing pause operation.

>
> When the peer is idle after sending a partial burst (< 4096 bytes):
> 1. Hardware never reaches 4096 bytes, so status remains DMA_IN_PROGRESS
>    (neither DMA_COMPLETE nor DMA_ERROR).
> 2. If dmaengine_pause(dma->rxchan) persistently returns an error (-ENXIO,
>    -EBUSY, -EAGAIN, -EINVAL, etc.) on that partial transfer,
>    serial8250_rx_dma_flush_work() loops forever in `for (;;)` calling
>    usleep_range(1000, 2000):
>    - It holds a runtime PM reference (`guard(serial8250_rpm)(p)`) and wak=
es a
>      system_percpu_wq worker 500-1000 times per second until the port is =
closed.
>    - RX interrupts remain masked in hardware (`rx_pause_pending =3D=3D tr=
ue`), the
>      partial bytes are never flushed, and the port never falls back to PI=
O.
>    - On 8250_dw, dw8250_idle_enter() gets -EAGAIN from serial8250_rx_dma_=
flush()
>      while rx_pause_pending is true, causing dw8250_set_divisor() and
>      dw8250_check_lcr() to silently abort baud-rate and LCR updates.
>
> Since the only reason to retry pause/status is to let an already-pending =
DMA
> completion hardirq run after port->lock (and local IRQs) are released, co=
uld
> we bound the retry loop in serial8250_rx_dma_flush_work() to a small numb=
er of
> iterations (e.g. 5 retries)?

A failed pause with an incomplete cookie does not distinguish a
persistent hardware fault from completion that has not yet been
published. A fixed retry limit does not resolve that ambiguity.

Terminating after the limit may discard received data, including a
completed buffer whose completion is still unpublished. Successful
termination would make subsequent buffer reuse safe, but would not
recover those bytes. This would therefore be a potentially lossy
error-recovery policy rather than a lossless timeout flush.

> If rx_pause_pending is still unresolved after the
> retry budget expires, calling serial8250_rx_dma_recover(p) under port->lo=
ck
> will set `dma->rx_err =3D true` and `dma->rx_terminating =3D true`, letti=
ng the
> worker exit the retry loop, run dmaengine_terminate_sync(dma->rxchan), an=
d
> switch cleanly to PIO.

That requires termination to succeed and callbacks to be drained.
If termination fails, the channel may still access the FIFO, so PIO
must remain excluded.

The recovery requirements depend on why the provider cannot pause.

>
> We pushed the updated v8 TLA+ models (`Serial8250RxDmaV8.tla`,
> `Serial8250TxDmaV8.tla`, and `./run_v8.sh`) to:
> https://github.com/ismell/linux-8250-dma-tla
>
> Thanks,
> Raul
