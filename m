Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793380211;
	b=0d+Xrjm3WRw+Cl05BL7+jp741ewgrB9oXjLsZ7hXlD0dpDS0qjF/mcGDGI7C1dPJ/qN5
	 m7Atyqn42gWb2RAYwxqUy3f7XZkIjRZx39CXQtgvMWkJUDxh0zMXRDlxsXha93xyebUiM
	 q02FGkuIJGcua2NJI5RqMyiLyJUUYaHKH9X+F8sgZ0mYv8vEnDsviyuPHKle5v3uayecC
	 2VB9VId5O111GQV26Kc42w/rxf0klCFj+npb7PgR2CU2/yOJ4djZyyuPosXi1EzJ5t1S+
	 dGPy2fVBrp1WtVg6GwYK87wEnw/sc7h2SUYtCPHanp4nGX1v2Juxyr5Oxu+ZqCM3EKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=upOYi42AukgDUPkY3CbfHszXdyIJTLIGDSDpKiK4vxs=;
	b=NHduAbnxuemQi1A+3jNkXfBYhXL79/UNF1ZPUeMXoWNx9yVtkJbQbgpau92gawE/l7at
	 +hS5c7JKlGz7qczMHsmKOsp02n1jnJjYpMmlv97jH6zfJufnKN5dUv11i7Bj93FY/2mng
	 31AmsdFP+7Q+o3/EzPdvzD/zHDfszhTtfQvkqCRo3ZIwbPWT9A2q86LjxEBLOnv2wO6gN
	 2IUVy95qbd/vlGilsEyiD84cRLTCc1P4VaPhkkwSoO2LNC1WBztMgO5yVFX6mgFx77Z+i
	 OmSO21uzYPgt2rcY7XEFzj5ju2qH2bYmsvCFXLReh/rJJRyr3S+3OnZJj8qh3xwsXMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACE4606A330
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 17:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ACE4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7ccb2ffe333so627710137.2
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 10:10:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793380205; cv=none;
        d=google.com; s=arc-20260327;
        b=OycaKIGdzaeJaR1I1tlT5PtEyIRq8IU5hVlKEBT8tLQYjDEVXUyUf9OTO/ezu1Jzf9
         YSmswU930z+Ot1VE4QOdY/yKuyB8RYUHJOJX9B8yDX1oD5kQF69jSdlhr0I/0V1raGSv
         O/PhPliOMTG0gWfrEAvJBPe3wCyGAqj09nl2h+JtkdR1ARTrzeLirnAsB2C9B42z/8CC
         zph2MPDM1kdztNYLVMQx12cBPCAsx9wkNWoREEtUMOBlpJnQhtfi/WZAeW64bPA4RPYR
         M+lAjhURfMBuPOjiRsZyplXIc/eiVyi+lZFouGOIxxkddn2TUCVqtw1QVqDEiOszWIBN
         YKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=upOYi42AukgDUPkY3CbfHszXdyIJTLIGDSDpKiK4vxs=;
        fh=6TZWgA78jtzTBBvIcWnHkOw7+xMfkZjMYYJxU4WTf/k=;
        b=SQf7w1QMd1ibbFkMrHW4Jokmh2k2x4rMyUZPCIOqe6UOVs3O+u6F899w3hM+2uW+ym
         Eue44I/a/goTWiKLajcQv6hD3ueKRBAg+E6MbKzAhRwaDcU8keqKyceE89gkDh2LpJNK
         onLXgXv/up1ZMPlV5nBETxR1JXJPk58Li9pI4IlrPajfumnFNFeCids2ZsE/15WFGdbU
         r59h3vjjHeNNYIBgU5T7tIs7YQ+gB9FhLvG30aMWaKLEZiaI8HbUvJIjLO5NKBgg74ST
         F9bCijMcSg4hUj5VyL3tYMH6hqmoXzYNVoy1tuxqsLZKHKBml8K5vuTj7Fwa4cKRlWTr
         me9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793380205; x=1793985005; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=upOYi42AukgDUPkY3CbfHszXdyIJTLIGDSDpKiK4vxs=;
        b=eHnWzyCYQnoKkkDaJRzo4hJTHPxElJbzNMU1utSpz6hYbFNGtCefv3J8mkgspVG7vV
         3sWkAyRKyP5f3pq/KrrnOsBAzQOYNk8CMHC+PA95xvDDo5xG8AdPyWv1Y/9VzBAJGchz
         wHd/IlIkwrO8Nib89rv9EpypDfPUb2+T3ig2YpiB4Ld3FiEGJNX/jAzLO+3EFZaCp3nL
         oCVECA6l7G9sOo8SQJLGJyNxlwiLcgFl4KjJotzYPVHlipd8+5viVE4zpP+ViFJsZSTp
         IBNGDlaYQukyEPf3sufc53i7QTO6iJ8uDtHRw4yp0knFgenRmYfbgzdCASxQeRkViuty
         rqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380205; x=1793985005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upOYi42AukgDUPkY3CbfHszXdyIJTLIGDSDpKiK4vxs=;
        b=X8wFm+PDTUIbONKKOIiyU6wYJgZ7XupH8KlWo72o0Fx/kTewY6UoQNrolce6MdTYm9
         g3NY6JLaUEWitiQJjLoeQAJdRstzNU9PeFHpdzyuK8z89+ZFwGtvOsi0dbrIiSgO4+7f
         HUL4nxSWWHEqAqfiYRaHEzFMJ2eqyUDuWVW8ID/5a2ArIwDwyfAMlPWXkjxO/BDhOJQk
         ZztoCUOE8PbgOpNAinUQJEg3NHcCKYAHiX62qMbluXyBTokDuDDqB6uCv0kncg1quFwi
         HDYneJJwm1tlrem6HuMwZFHwz6vBGNMF3+Uimq4owEd/egBkMauKoMCG59O8dGRJyD1T
         4rlg==
X-Forwarded-Encrypted: i=1; AKwUvBxejbKNotBa700PxOSY2zyVYNu01W9Um7sMKEk9J/z5p8dEMlEFM/SG/bQSVg8lJAeNwEA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKAD4zOWYo8G4mIBCHU6VZ9cIR6geobPhFZAqaHGPujkbKQjXtm
	8nOJ7QlJbr42E3sNUnCuy15c3cqanv/elogeZ1B7d0OJBaS+RgPXXovdcWnmsaDLu21Y2mYPvm1
	7Jwt/QYx7UXEmHjhoVBdje1kKIwkUIX8=
X-Gm-Gg: AYBFou2ZaY3KdIpefucJwpZKOR+kMjxvTblLxyE0pinKL2SUDUz4vL+ekkUv2HAjLQg
	JK4PLe3FArcl7El/o8XQL4NhoM003WnnuxWK2VQURPZu+DoRN+Ur3kPGYjZ2h7S+nlNmRvKwJKh
	mIZ1yCwo1r8bD0vT/D75wFEHizrl2XC62Dd50Fq+qEtPZx8d+c0z+gdCTIU8UCyJlBlVT7ymUU1
	dboIxS0yrRWexxRi5ZN9QAKF/ZUoC3xl81Gv9vwv+MtjQSBVOoQGboK6XKU1WnqMXVbutLptFC1
	5VVShsHqEoorBA2escgk0Gs5jVTFzIoB2IcyFYBMGL9fHNyDnRCEzLQ4d+L5gsAn2dM892WFC13
	UZ9t7+QTmMuI6k/d4QVgdbunIOMm7ycQr8WrHHfqK/DLakzoWcordd9c0XqH+miDBAsy0KCbC9R
	b16Hr+f9Ju+UJ/5Hxzc4NFd+5tcum7Y/g0e1FwWn97Ht9+/27enDBXb3kSNHZuJpZXLaCk/BIr8
	3AjpdmabXy7Ij7F4sdXLJfiQeiqm80=
X-Received: by 2002:a67:e10d:0:b0:7cc:1a41:20fe with SMTP id
 ada2fe7eead31-7d072cae2c9mr1521484137.25.1793380205451; Fri, 30 Oct 2026
 10:10:05 -0700 (PDT)
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
 <auRl9ztbav4nHi7U@ashevche-desk.local>
In-Reply-To: <auRl9ztbav4nHi7U@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 Oct 2026 11:09:53 -0600
X-Gm-Features: AclHuK8FtznzJujmH4YHgrWNDCpi98ee8eK0vX_qbau-y3ULhcsZAztidkT31Us
Message-ID: <CADvTj4p8tjwdftg+H11ob0iaBZKxXrTdkSmhfZHjOYunm5tr9w@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] serial: 8250: retain DMA resources when
 termination fails
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

On Fri, Oct 30, 2026 at 3:40=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 11:19:59AM -0600, James Hilliard wrote:
> > On Thu, Oct 29, 2026 at 8:24=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:
>
> ...
>
> > > > +     while (rx_ret || tx_ret) {
> > > > +             dev_err_ratelimited(p->port.dev,
> > > > +                                 "DMA termination failed: RX %d, T=
X %d; retrying\n",
> > > > +                                 rx_ret, tx_ret);
> > >
> > > > +             msleep(100);
> > >
> > > Huh?!
> > >
> > > > +             if (rx_ret)
> > > > +                     rx_ret =3D dmaengine_terminate_sync(dma->rxch=
an);
> > > > +             if (tx_ret)
> > > > +                     tx_ret =3D dmaengine_terminate_sync(dma->txch=
an);
> > > > +     }
> > >
> > > This is unacceptable. Sleeping is okay, but value should really match=
 the
> > > baudspeed and other parameters of the transfer.
> >
> > This sleep is backoff after dmaengine_terminate_sync() has returned
> > an error, rather than an estimate of UART transmission time. Each
> > retry asks the provider to stop the channel again; elapsed time is
> > never treated as evidence that the resources are safe to free.
> >
> > The particular 100 ms interval has no hardware-derived justification.
> > However, I don't yet see a sound way to derive the retry cadence from
> > baud rate either. RX can be waiting for input, TX can be held by flow
> > control, and callback retirement is a separate requirement from
> > moving bytes through the UART.
> >
> > Do you have a particular provider failure mode in mind where retrying
> > termination should follow the serial transfer timing? I'd like to
> > base the interval on the condition that can make termination succeed,
> > rather than substitute a wire-time estimate for an arbitrary delay.
>
> Termination of DMA sometimes require to clean up internal FIFOs and other=
 state
> machines. That's what happens on HW side. In the software waiting for too=
 much
> may lead to the very big undesired latencies. The value of 100ms sounds i=
nsane
> to me for the HSUART cases (megabaud range of speed). Also note, not ever=
y PCB
> design uses HW flow control, so this may be even worse for them.

The 100 ms interval can add unnecessary teardown latency if a failed
termination becomes retryable much sooner. There is no hardware-derived
justification for that particular value.

The FIFO/state-machine draining is part of the provider's stop sequence.
For example, DW performs its FIFO-empty polling inside
dwc_terminate_all(). If termination succeeds, this patch proceeds without
the retry sleep, regardless of baud rate. The sleep is only reached
after an error during DMA release, not during normal RX delivery.

Baud rate can influence how quickly a transmit FIFO drains, even without
flow control. However, the termination error does not tell 8250 whether
that drain is still progressing, how much remains, or whether the
controller needs a different recovery operation. That distinction matters
when choosing a retry interval: a shorter interval reduces the added
latency, but does not establish that retrying can recover the channel.

There is also a specific API detail here: dmaengine_terminate_sync()
returns immediately if device_terminate_all() fails, without reaching
dmaengine_synchronize(). Consequently, an error leaves callback draining
unconfirmed as well. The retry cadence can change, but resource release
still requires successful termination and synchronization.

>
> > Regardless of the retry interval, shutdown cannot release the buffers
> > until the provider establishes that DMA and its callbacks have stopped.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
