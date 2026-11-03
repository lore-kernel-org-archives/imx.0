Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793729819;
	b=kW9cTuK4ZpN6zxV3xqMMwhPkCUX7V2O9lXI1w1WyPa2g9qIPy43V+wcBJaU22R9Wabaj
	 XoYaioELvzYhvPjB3DZIFzLFo6rbOpCpD1RjCPLAQ+gpBtPKoiAnQtUjE2BiZ0uZItUCm
	 3jKCkPYucc5JahyMjilixR9POzc1kfPr2WKrTuLe1QLtsJSRO2M9Xe+3Y8uMDSYSoilEG
	 C/+7b+YHvCvOjcMGqW/Cy6F+issOUnroLLcB+Z81tjweAyiGHgDPCXTCX4jlhP8M8OmQt
	 H9GsCOKfA5G0hN0jkGeFXHCC8+LJSYo5ugplyiHmANoDIb0yZXIvMrwvtnI2dJDDHcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bbvyH8U6X8W+XhLMtftlLqtY3X/eIGXG9T4SZ8xrjfM=;
	b=d3AJSGrqGT1gTdUKXUQ9MMDhfmkZ6uSf2ZBF8leRLW+QMWmsZMFMr2IVQzcBCV3m621F
	 xbFnkhKFy+vxjAdRQRWtwmfC/Wmmlx3BnshzAAM6U4ftK0qI10nHvglMbwBLh9jKVqoWo
	 i5/wA03wu8h5zDVfik1C2QbaVo1qIkjUijjFawzzWJS47zp1wt5J7N7nP7OsoAfsPQ6cS
	 Od47aR0Wycld1xqipgsAP4fPWtgzpUOh53qS8OxjGxYgBOLImHiwHrlsBLirFCpCQkLnE
	 iqM2FM5w4shiDCi7s79BBfsvA8DfGlhXqJbCAO6EsWfRlh5O0xM7iJjO+6qIDzYgUbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w9ctge5x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD81606A326
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 18:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACD81606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w9ctge5x
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eafb65e169so2839650e0c.1
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 10:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793729817; cv=none;
        d=google.com; s=arc-20260327;
        b=BflvdgcdNQk+KAb7VDUgQMcfbgDo7PcMv5NX4m6pqGc1wRjq/E4AkKYdfBF+e4szfn
         1rhOaDng6u1DFkSE5xUPa0ZKbOKu5UbeKqMtu1AMPkO4J79HyU+3spZUHwww2yZIR6ze
         cd4R2nzl4Zand/KIeF61cvlvFNzS17KsxbL3LwADnJ4Vsv0YSURX11CjL3hrX8EW/JTo
         FRMoYBOf9a4HOIWEUcHLSTnjBfeVrr1OjaOLgAYJ2/g2O8SPCf4ezwUrlWgFeeNZGQ9r
         RFttlNnLhnx4m5L+2s1/f8HxLQ51NQgkwxH1SQAqbGOqbnZahH8OBU20VuyRcpxnVe54
         FqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bbvyH8U6X8W+XhLMtftlLqtY3X/eIGXG9T4SZ8xrjfM=;
        fh=xolLx/hh/HutVqgES2TobYgzdoOabb5X5ovGvKSwR9M=;
        b=Ete+PLgP+BToBJk3fX0rqx9ZQ5HhCmskP+boKvz94lf//YWIlpBGPNVL8rGphzBa/5
         GhtAoJBDMkn5Ij1dnbPgVD8DkpLGzC5vhF4OIeljQbBSFJyFEYJH46PDioabcMTrhJYU
         LDHi1bBgBNxKFix2jpnyskdZx+Scfhq4L0roABQs9Mpm8miQdD1EBjA4xh1EhIPjM45L
         e7h20q5B0QlMGYIc3ZLd4W0ImJ9z5qaqFxuK1Ojo6JYRkXsCIjJTlVzQAAe3Bc7d5ZkQ
         0e4umyYW54JkAgdr1KJ8xQO7w3Ugr72Y0H24KEmp4AL2Tq3fqM1iGM3odXDOFBES9lqZ
         pZeQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729817; x=1794334617; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bbvyH8U6X8W+XhLMtftlLqtY3X/eIGXG9T4SZ8xrjfM=;
        b=w9ctge5xxcR63N8DIU7De2SvalGT32Qfb2d+ikDb5MjTO2hSIz+hZipOAB/bJMEaHr
         a0Tfo45gccCp995k12oj3w11QBuT0omN+UtjuQwlrgD+Ot8WhnGp5XK/wUjfrMmqvI3m
         h41tD4u98QdpJv7LkoFnqDf+poxFxMgwPvkr1WoEzuO5NX7RQ4qhgwi0eIxYPZXy9Pop
         DWVColhXSjSyJvPz75yqsH/QF1yZawcPBCnCMpnLN5L2LQ+mNlFOdhl1f08vutr9JZj2
         0yKeU9FX9iPzKthwOczA878Esq5jXQJVbycl318QnEk1SDIs0dkQC8arkADPnWWgHP5U
         J99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729817; x=1794334617;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbvyH8U6X8W+XhLMtftlLqtY3X/eIGXG9T4SZ8xrjfM=;
        b=0Rpq6gU/tKOIjot1Ys35h4wD03Uc3B+aq6B/XiPXYmTAIZRLoXb/CSOG6XzYIF+5zW
         rLf6U0GpYl3kN+irlVRB+y0PcxBCC0M7dU00FU0RjEAbzez4lME7+wAtV+aqZVdvsQZZ
         zbxF2PrqRmCZdzV9/My+I/YzxwsggYhbaAgecP/ScYZu1UtYfHv060mi/iWbRLawJDTs
         YIQqXCcHbD1c++IViHgwwUSFjbCvhnU1TftElIKp2QYy7Sz4Zjx0ucEf0fygDscltabN
         e4bRnbvKPQHdFssTveJm256cllATtyn5AsHRihHaKv6kCxMR3VUMcl30Rwvfje/pEyEH
         43Lw==
X-Forwarded-Encrypted: i=1; AKwUvBxUi8vFjY4ShcAqiunA0MaC2iLh3POIUBASYeHcx5Rlhd3qElV+4XWILpeFNyCknyCBD+4=@lists.linux.dev
X-Gm-Message-State: APuU4Z8HqVhXpzYGik+v4kPSM88uO547YtnT9vTFl+H2WrTBJocMgEOk
	CLGFY6CS9mvnxawqs04RAYREPVRssz8fmo8JYzWi3IX4WaSL8AwpYYKQmjPXLkmAbwo8fHggtyM
	X2R01WX25q62wuulnAVcCtJg/VN93cYg=
X-Gm-Gg: AYBFou1ncs99ZksgCh++2TcpA/3i7eFrMJxyrZuG/kn4Z5BLBnpMuRS9Ovj4xnEkeEx
	Pb3LKJJX9mzqAaHWW4fBeLnQONZouy7rpbpM64eiXtBOUE6NVUG42srIiw12TXj0VXfPixo4k/f
	bVzwj8xTMWxSrQbjnTv+PFyf41TTPiWjayYpYCv/scCm2tlB9JLoA4PLQq/NoZKzGH8hHIqQE0w
	Z3uTe2hpagybhc37R/7Z7ZBZTagLfIqlVwm+9QuX2CvfmgdaEaC27PX8dXiS8pZHIThRDpAjWKD
	FU0gKbDwWwZY0lCQclXaH+64Ea37Rfbd67UAmJ6Cwz/wNKI+w0cgnyQp6qQrGXmL56gvh48PlFR
	1Nlm3qpMUyMyR/kz7IaUoXpBPm4+dj0WMPpDoT9fNOf0igcaaoGyMmVPzDI/Ivp7L8m9FzCbl5a
	4eQLp1Z83GS02+fS2qdtK8CTF72TwClZVg/XlXZMi0tkSBGcQkp2XGG83iV+V/Q8wSejKhsHctI
	DY5ZCIjlCsL2K/onvijpu0KwJgvB/muVDpoG06Hf5/rVKigW8s=
X-Received: by 2002:a05:6122:180a:b0:5ec:5f1b:f725 with SMTP id
 71dfb90a1353d-5ec689c4d7fmr6770861e0c.23.1793729817534; Tue, 03 Nov 2026
 10:16:57 -0800 (PST)
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
 <20261102-submit-serial-8250-dma-cancel-v1-v9-7-9159caade148@gmail.com>
 <auoa8OWBxqaQuKRq@ashevche-desk.local> <CADvTj4rL23q6eO8vjVe9vL1g6B8aoZqsbnThi2QJqkj=9e59sw@mail.gmail.com>
 <auoit0AkmVeCvXqk@ashevche-desk.local>
In-Reply-To: <auoit0AkmVeCvXqk@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 3 Nov 2026 11:16:46 -0700
X-Gm-Features: AclHuK8HW-CEs65d3UAbPyCnbzk3fKPiCpsZ9iT1lPWFV_I6MxwKEkb2VsX1bZo
Message-ID: <CADvTj4rwm5BH8veX9i5_4trvzQFRPbDrAby7sXuEth6H6zJH2A@mail.gmail.com>
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

On Tue, Nov 3, 2026 at 11:06=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 03, 2026 at 10:54:38AM -0700, James Hilliard wrote:
> > On Tue, Nov 3, 2026 at 10:34=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Nov 02, 2026 at 04:14:34PM -0700, James Hilliard wrote:
>
> ...
>
> > > > +static void serial8250_rx_dma_flush_work(struct work_struct *work)
> > > > +{
> > > > +     struct uart_8250_dma *dma =3D container_of(work, struct uart_=
8250_dma, rx_flush_work);
> > > > +     struct uart_8250_port *p =3D dma->port;
> > > > +     unsigned int delay_us =3D USEC_PER_MSEC;
> > > > +     ktime_t start =3D ktime_get();
> > > > +     bool recover, retry, restore_rx;
> > > > +     bool warned =3D false;
> > > > +     int ret;
> > > > +
> > > > +     guard(serial8250_rpm)(p);
> > > > +
> > > > +     for (;;) {
> > > > +             scoped_guard(uart_port_lock_irqsave, &p->port) {
> > > > +                     /* Shutdown cancels this work and drains both=
 DMA channels. */
> > > > +                     if (dma->shutting_down)
> > > > +                             return;
> > > > +                     /* Serialize reset with completion and shutdo=
wn notifications. */
> > > > +                     WRITE_ONCE(dma->rx_pause_wakeup, false);
> > > > +                     retry =3D dma->rx_pause_pending && !dma->rx_t=
erminating;
> > > > +                     if (retry) {
> > > > +                             ret =3D serial8250_rx_dma_try_flush(p=
);
> > > > +                             retry =3D dma->rx_pause_pending && !d=
ma->rx_terminating;
> > > > +                     }
> > > > +                     recover =3D dma->rx_err;
> > > > +             }
> > > > +             if (!retry)
> > > > +                     break;
> > > > +             if (!warned && ktime_ms_delta(ktime_get(), start) >=
=3D MSEC_PER_SEC) {
> > > > +                     dev_warn_ratelimited(p->port.dev,
> > > > +                                          "RX DMA pause stalled: %=
d; retaining transfer and retrying\n",
> > > > +                                          ret);
> > >
> > > _ratelimited() is a slop of AI without understanding the code. It mak=
es nonsense
> > > in combination with warned.
> >
> > The two controls have different scopes. warned is local to one invocati=
on
> > of the flush worker and prevents repeated warning attempts while that
> > flush remains stalled. A later flush starts with warned cleared again.
> >
> > The rate limit applies across worker invocations and UART ports. It lim=
its
> > messages from separate stalls, rather than repeated retries of the same
> > stall.
>
> How? The whole _ratelimited() is nonsense here.

dev_warn_ratelimited() uses a static ratelimit_state at the call site,
shared by all ports. The intent was to limit warning bursts across ports
and separate flushes, while warned only covers one flush.

>
> > > > +                     warned =3D true;
> > >
> > > Altogether NIH _once().
> >
> > dev_warn_once() uses a static flag at the call site, shared by all port=
s.
> > After the first warning, subsequent stalls would remain silent even aft=
er
> > recovery or reopening the port, including stalls on another UART.
> >
> > The intended behavior here is at most one warning attempt per prolonged
> > stall, while keeping later incidents diagnosable and limiting their
> > aggregate logging rate.
>
> Yes, so what the point to use _ratelimited()?

It was intended to limit warning bursts across multiple ports and
separate stalls, while warned prevented repeated messages for one
stalled flush.

I'll use dev_warn() with the per-flush warned flag and one-second
threshold instead. That keeps one warning per prolonged stall and lets
each port report its own failure independently.

>
> > > > +             }
> > > > +             /* Notifications also cover completion or shutdown be=
fore sleeping. */
> > > > +             wait_event_hrtimeout(dma->rx_pause_wait, READ_ONCE(dm=
a->rx_pause_wakeup),
> > > > +                                  ns_to_ktime(delay_us * NSEC_PER_=
USEC));
> > > > +             delay_us =3D min(delay_us * 2, USEC_PER_SEC);
> > > > +     }
> > > > +
> > > > +     if (recover) {
> > > > +             ret =3D dmaengine_terminate_sync(dma->rxchan);
> > > > +             if (ret) {
> > > > +                     /* Retain ownership and keep RX masked if DMA=
 cannot be stopped. */
> > > > +                     dev_err(p->port.dev, "failed to stop RX DMA: =
%d\n", ret);
> > > > +                     return;
> > > > +             }
> > > > +     } else {
> > > > +             dmaengine_synchronize(dma->rxchan);
> > > > +     }
> > > > +
> > > > +     scoped_guard(uart_port_lock_irqsave, &p->port) {
> > > > +             restore_rx =3D recover || dma->rx_pause_pending;
> > > > +             dma->rx_pause_pending =3D false;
> > > > +             dma->rx_terminating =3D false;
> > > > +             dma->rx_running =3D 0;
> > > > +             if (dma->shutting_down)
> > > > +                     return;
> > > > +
> > > > +             if (!restore_rx)
> > > > +                     return;
> > > > +
> > > > +             /* Apply the current enables, including any interveni=
ng stop_rx(). */
> > > > +             serial8250_out_IER(p, p->ier);
> > > > +     }
> > > > +     if (recover)
> > > > +             dev_warn(p->port.dev, "RX DMA failed, using PIO\n");
> > > >  }
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
