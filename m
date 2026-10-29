Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793261665;
	b=VAToF5gCIXBe+qqmSkw+5WIC2i1eZjZ3lJhMY6THO7EMx5KnJfyUtqLnup2z4LLxFrok
	 ylQDDtmHCHnJ7Uy/137TAPM5yOZZ6VAgP3sr6YFFNE50Zzr4CwsnEgElG3R2H3mhRpOKU
	 XdhpCsKGud31Euv0TXRkd4vtEkl1LwfpR8++xIXZ6ar8CLetJtvuu8svGhXUgP/tu7vh1
	 jJ/ogU6f58fHgtgUHZt7RgHTMykjQArKq8q5G/TBCzCPSpwVdb+mntbhk21eliTteDybL
	 p52NSRKN1RkkXapFcnt1bPml+onVJ5U0PVtWTmoPvxl69OprpaaExHCCabccBSzIELw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XRqdz8CmBop39zT0MOnXVWaLPZs5c98CxtCs0iCmyZ0=;
	b=TWMoYVQFuRQuzuxuX4/hbl+YH/dJNAujQEzo1xxA4wZYKWmJ5PT36ZZWeflJqulhZNew
	 XxukkWUxFUvrg11jruqTzewv83zau4o62MNBAMi86MAYlzGv/epBPrgfpVSHI9t4FIZos
	 OknTtcCC5rWt6Gpjliok+c0fGKKQyX14ht2ociNgRypY0Xr3ezpgjnKdQoJknCf1Ncw+i
	 Y344fYuUAQkKSDPiSD6bTm3dc0NCX/cU2F5MlRyo54Tx+EuSvDLRLVDIPCO9pV4RhDNI8
	 VfxuTIFTZT+nybc+8MCnqt7seXmhqcH71yzvLWt41464aFhoW5hLr/WTbshRcMfQtXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtyCK9II;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0A8606A31E
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 08:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B0A8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtyCK9II
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-98c7798ce74so609525241.1
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 01:14:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793261663; cv=none;
        d=google.com; s=arc-20260327;
        b=RIWGT3awST5rTOKZsO7ehUB+PybEL7EbfVjMlsxhfleIewWTBxgb20bEbVmUPjHcbU
         sHOLNCcoVNlk6ZhZtcm85aVlwB57Zefz6i39FI3gRRGWuXxnqii/lkTUx48+4M5B5VGM
         peiQJZOFJ7DwLwTjdFvl8MU59vOx56ovkRzouqINOrgl2aFNoc4DEh/dZ3T+KtTqYInO
         0V07d6N3nxuQbTOdjfyr+3DyjIrjWvbsicIUqyvJdTjttWRA/nfTs9GHrJqTYvy6UcyK
         92uQtOSOsA4puE3o1d0/IodxqaE4SjGNRThrw4IjCSKMapysykgg/2jkXGW68TY8OtTI
         A+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XRqdz8CmBop39zT0MOnXVWaLPZs5c98CxtCs0iCmyZ0=;
        fh=4yfkPiLHltJm/kuju6BfvHQ3Si8syvMT7ONiIRBEedU=;
        b=HLQ09QWJgY879O1oCXGSYxdqYy+4MD4YVk4KbYnyx3y9VKEzdGs5/DFprBRIgPlTZQ
         GIbDqRh3kQM23FdwRHtdJh+aR/+se4oD9fGPdx4jg4sn4Fsi+CG4Wdq0D6F+O8ExjISN
         ZkV+yEBZdre/TZbzDsvvHM/jHcHFJQR5CEDeMuGCS1tNfYupIEoJNFMET22hPScXZq5M
         o5iXkQdfI55Z4u+lg/h0lZPfnsx7IJAD15PsnrQaeMHzEQVIOg4wJZnVswMVxI7ZUyYv
         X9ijXaqj0OKnnEy02G1BC2/QHF3VC1Ymfno8Ixtm7TtGAP3xJISGeS/S8YUelLeJKs7i
         DHXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793261663; x=1793866463; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XRqdz8CmBop39zT0MOnXVWaLPZs5c98CxtCs0iCmyZ0=;
        b=dtyCK9IIvnq2k/TYAZarrF83g2LcdcZIf6qVuhLE3ZMLn1N9huod75ZSyM1WEvfiXw
         hRucgwPvAW1myCnzZlvcUY68MkA4Ghb7eampRPeR0I4+75Y8kq5W+yHeSrNEr/xhwGCs
         W9yt1A6+5yuY2mNaWtPk5u07K5JIrZsjEL6PIA1M0+m4D72R0nus1VLJGyiRyzVqze81
         rn4wBEYNY0zfqvSE5BLiBdCqvwaHG4Rr2qHF1N3O7Mr+Yqomca8MdldCxS/5fE9WnMC2
         kFcr1ekG5/37PpTawzbT5atrYGDQA24ioYLM6202fwyrJzFk4d3Q+MhFVEOm+2goLvPM
         wlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261663; x=1793866463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRqdz8CmBop39zT0MOnXVWaLPZs5c98CxtCs0iCmyZ0=;
        b=m4b53zq/SDEdFE/iZITAYRyjGX6XXhO8TNWm+dAdsdCS7l5NXeFr6NhMUqTTtIE/TI
         62k1wRvKPBujwBLD6rzZZXOMs1sTflUhY+UMkW1EqEzwgD25AxCO2KAEbbKtYrbFgWEP
         eKrwkliwsL8dKgWhCaK7T9diI6yR1VHuS0R54QGIKcVZ4V2teSSt3/ii27Jx55He3RWb
         e85Uk0H5XFfIeXQc8Svo8XZeVhri3HgRq57Jnqd3ihyP85j9PgngTpBu2bYRfyptUCrp
         EAPN3aDDcppoWHIWZ2Dx35T20SSFhdcobsEx+BCStCzu0NKvqqaIR1tAgE/ZO6d9noNe
         00bg==
X-Forwarded-Encrypted: i=1; AKwUvBwwdANvDbSHJ3jZPg6mpLe2QuJUzqETqXwkwkOAIuD/O1JSbbTtTbG13qB8wQR47wkLJrM=@lists.linux.dev
X-Gm-Message-State: AFq9FYJZzYuKIslLthjwapbuNfXfTjIla8Q+J9NNi7qBJ+UxtVL1a7Zz
	8NBVQvFScpRlFlG2Nfbb2ZoE2IuRufnpIfP8TctvpKdaggYfhi82yrafsCZ0IDNAHSGP4s6Vwu9
	BcNmyvDmsO/17yzOzr6gJbcYuJ7c9tNQ=
X-Gm-Gg: AYBFou32rzH7It+9Ktc6p2/vQCgLNV+dov0278Iln61E7zTiQGw8Ilbp5QRfo0HaUXb
	IkIxQWunNUGC3pggjyI4TNVZ5PmeU8zza9vYQXR9SfSJoR1YdWZLntbOYVX69LDVlG0wlShMHsz
	AgPpsD+aYtCUxW6089TZ5Qr3v2Se+CtXyQk+R+kg39GgfFtPIEaJl2vq7J2cACykD26yH/YU22h
	cdp+FhYLbL4sTTPW3G+AaTW2eKOpb6YK0uZdC1k3TfaeTCqwMY6QYUwk1dBBB0ZJziCtz/7XbSi
	8tXy4vB7CM9uOdegP8vhrEYaYQXO7k3BuWS6uRAQB4CllrM8sEaRFOlyl72k8CQgOIMt7qOGWtM
	1wP2d9ZGd9jOw5CGSLE/tb8S4dHarhQhSA8NRsvodi5J1qpfUGLf2TFe8tJVGfGP6pSptH0N7Xq
	j0TboOex2mEie/RWcrcZCLnGDlO4BZhLc0EbAu1i+6I28aSukaJg4hFzo3wYdmCJiOwFGW7ct6X
	YcVUgH3u5oqxzDA75FbyqU1dvTqlg==
X-Received: by 2002:a05:6102:424c:b0:7cc:2712:cafb with SMTP id
 ada2fe7eead31-7d03a5708f1mr2019992137.15.1793261663187; Thu, 29 Oct 2026
 01:14:23 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027-submit-serial-8250-dma-cancel-v1-v7-0-985a023ba4b4@gmail.com>
 <20261027-submit-serial-8250-dma-cancel-v1-v7-4-985a023ba4b4@gmail.com> <20261028204847.3471382-2-rrangel@chromium.org>
In-Reply-To: <20261028204847.3471382-2-rrangel@chromium.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 02:14:10 -0600
X-Gm-Features: AclHuK92fmKJThZ29uPEx3r2hwaWsXISrLYNiraGYBJq2R2TpOOpVIz5KsrBhR8
Message-ID: <CADvTj4pEo3uj2bLbP6RwD=P+hW2omQ9x_sn_ag_FHzxUknX-nQ@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] serial: 8250: drain canceled TX DMA before reusing
 its buffer
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

On Wed, Oct 28, 2026 at 2:48=E2=80=AFPM Raul E Rangel <rrangel@chromium.org=
> wrote:
>
> Hi James,
>
> > @@ -37,26 +40,35 @@ static void __dma_tx_complete(void *param)
> >       struct uart_8250_port *p =3D param;
> >       struct uart_8250_dma *dma =3D p->dma;
> >
> >       guard(uart_port_lock_irqsave)(&p->port);
> >
> > -     if (dma->shutting_down)
> > +     if (serial8250_tx_dma_blocked(dma))
> >               return;
> > -
> > -     if (!dma->tx_running)
> > -             return;
> > -
> >       serial8250_tx_dma_complete(p);
> >  }
>
> Removing `if (!dma->tx_running) return;` and relying solely on
> dmaengine_synchronize(dma->txchan) to drain completion callbacks breaks o=
n
> DMAengine drivers used with 8250 UARTs that do not implement
> .device_synchronize (where dmaengine_synchronize() is a no-op), including=
:
> - drivers/dma/sun6i-dma.c (Allwinner H616, cited in the commit message)
> - drivers/dma/dw/core.c (dw_dmac)
> - drivers/dma/pl330.c
> - drivers/dma/mediatek/mtk-uart-apdma.c

The provider-side fixes are posted separately for DesignWare [0],
sun6i [1] and MediaTek [2]. The v8 consumer changes require those
callback-drain guarantees on the affected controllers; they cannot
compensate for a missing provider synchronization implementation.

>
> On those controllers, if Transfer #1's completion tasklet (vchan_complete=
,
> dw_dma_tasklet, or pl330_tasklet) has already dequeued the completed desc=
riptor
> on another CPU, dropped the channel lock, and is waiting on port->lock at=
 the
> start of __dma_tx_complete() when uart_flush_buffer() ->
> serial8250_tx_dma_flush() runs:
> 1. serial8250_tx_dma_flush_work() calls dmaengine_synchronize() (which re=
turns
>    immediately because .device_synchronize is NULL), acquires port->lock,
>    clears dma->tx_terminating =3D false, and calls serial8250_tx_dma_comp=
lete(p)
>    -> uart_xmit_unblock(&p->port).
> 2. If no new transfer has started yet (dma->tx_running =3D=3D 0), Transfe=
r #1's
>    in-flight callback acquires port->lock, sees !serial8250_tx_dma_blocke=
d(dma),
>    and runs serial8250_tx_dma_complete(p) a second time even though
>    dma->tx_running is 0.
> 3. If a writer has already started Transfer #2 (dma->tx_running =3D=3D 1,
>    dma->tx_flushed =3D=3D false), Transfer #1's stale callback runs
>    serial8250_tx_dma_complete(p) while Transfer #2 is still active in har=
dware,
>    syncing tx_addr for CPU, advancing xmit_fifo by Transfer #2's tx_size,=
 and
>    submitting Transfer #3 concurrently with Transfer #2.
>
> In addition to implementing .device_synchronize in the affected DMAengine
> drivers, __dma_tx_complete() (and omap_8250_dma_tx_complete() for symmetr=
y)
> should keep `if (!dma->tx_running) return;` and check
> `dmaengine_tx_status(dma->txchan, dma->tx_cookie, NULL) =3D=3D DMA_COMPLE=
TE`
> (matching dma_rx_complete()).

I have not added this check. It could reject some stale callbacks, but
dma->tx_cookie may already identify a replacement transfer, rather
than the transfer whose callback is executing. It therefore cannot
replace draining old callbacks before releasing or reusing storage.

There is also a complication with the existing classic DW provider:
its status path can scan descriptors and invoke completion callbacks.
Calling it from the callback with the UART port lock held therefore
risks re-entry. The DW series [0] removes that behavior, but callback
draining is still required independently of a status check.

The intended guarantee is that termination and callback draining
finish before a replacement transfer can reuse the canceled
transfer's storage.

[0] https://lore.kernel.org/r/20261023-submit-dw-dma-synchronize-v1-v3-0-c6=
2bf048f5ce@gmail.com/
[1] https://lore.kernel.org/r/20261023-submit-sun6i-dma-lifetime-next-v1-v3=
-8-ef1acb0be768@gmail.com/
[2] https://lore.kernel.org/r/20261027-submit-mtk-uart-dma-synchronize-v1-v=
3-0-aad7a6b3c62e@gmail.com/

> We modeled the v7 TX and RX DMA cancellation state machines in TLA+ to ve=
rify
> both the counterexample traces above and the fix:
> https://github.com/ismell/linux-8250-dma-tla

I extended this a bit as well:
https://github.com/ismell/linux-8250-dma-tla/pull/1

One issue in general I'm frequently running into is that there's such a
large amount of correctness issues with this driver that it's tricky to fin=
d
good boundaries to split fixes up into.

>
> Thanks,
> Raul
