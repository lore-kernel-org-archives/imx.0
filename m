Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793383745;
	b=e3m3vzeisKT8GSlsNxzdmkMnnHUE68RKJ3sWChCaKl/vmgv7vuN1lmbunx83nI+bWcYR
	 dUJCwfroB24NB79CJ2hbIPCMtg9uU3B1tEq4CSjEzCxnZfchE2QcPOsv3h3h4nLITKaIh
	 hv8dFyQnodUsbb2wRWcvz0S4xayYaBVrjNrapP4KbHLydInGikDS4Mf3sN0L6My94vn9A
	 oR4Xt/IoYXjm4v6axyWm+tXIn6tioxJ+uFe3jJ/GWXqqA3mA30BU0LbI3xdM91019bAjJ
	 uirwgVCj75epIHCB2lyv0KpVYZUVbYJ4IEj6jSP9ydwer/hLd7vhm63wkAtS3RPn47Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zCM05k2C0awIth60s9Z4jRxjplzssn0gUpe0d+ZqU04=;
	b=vt3H6yvaXO7DDFff2Pcy7VHiQu0UzUZwiBxcZTmigUWCYHIUDhioOEPdh0JosfDEoHax
	 cFtcD3HwJb6Pv0jAa8yKi5jfgsM60SnDJ/57DMcsDHAD9XYMulY4Bzsl5/UbDBnnY5Yjx
	 cDRD+nMkSNyjzMu4PGCfAWYtPUBpogYUIBfcCHjYj6k3fZvtib3KW0we6glEtWMVI6wj1
	 +Mliph1TIiur7z+CPMKSv/QZsBwaXdpJkhim+GzUiZoqzAT87zB8VgJYxl1Xz3zkpDEiM
	 qFKdxQlWXiFf+RlNXhGeZkcCN9T8g+DGtGfCWAgCno64iDNkXO3zEqvGi6lbH5acxqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="oFwP/ThO";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.41
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFD0606A320
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 18:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEFD0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oFwP/ThO
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9908346255fso1183077241.1
        for <imx@lists.linux.dev>; Fri, 30 Oct 2026 11:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793383744; cv=none;
        d=google.com; s=arc-20260327;
        b=dk8xqntMhDKrdLFtExApj5CouoacS2eIDJ1mnBlsPUxWj7gDQ61a+plzRYLGjLDIRu
         qrOQPhoaGX2OLkQDel2nHxQJ5hSamXgU8TCUzyZDfxkiZxZS/ebfAtF3MpkuAKRbW77m
         9PXALr0HFa0h0Vx6kITAg70bgUxVdE4n5uxnbWIl4F0ZRp+2uLgt/ZEDXPADn6WBmibo
         b+F636QzglDCpeZB/a9elXNccaEHGiabSzwMBSibTsNf/LLxC019SmtelXIMROi/reAk
         VdEsU2UE4MWKeG7Xqj3SX+KMK/VYZV3BK/G8vlyrCqaaby17YrDlBNVWFjCO7tSQ7BFc
         IWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zCM05k2C0awIth60s9Z4jRxjplzssn0gUpe0d+ZqU04=;
        fh=JzXxuukHcT4CNRv1EhrE7Qw4EE6IL2Ln6ki5yW+MeMc=;
        b=fVWoIRNPyAKI4iprkRpQOkbV1kdS1cpxc5uxF6rPjLvNpD/fl1jiVfikPJ3z3+qq/V
         o5EXu21JakKFk86uEtq+olP4kUOihp6Dhb/dDWjGs2O8EX3RetBHLzokfZNY6DWxO2Hv
         QGZ3OI3bHLc5YkOChqCJ805zjO5yTNSK0gPgQK+YtDUclpLFSy0st7xaaclToDK5NjEk
         Hov3DMK72JqPqgEmHK/u0nsJ6n00YsSVHXVwvD5qIODfvHpkd+geUP+gyeEe7D8ztD9S
         yxEPhbg8EbVMj9P6khV0gOitJblafIIjRz0x3JRIZLSpAgdZLf3A2ir2uTLijrvIA600
         i+bQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793383743; x=1793988543; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zCM05k2C0awIth60s9Z4jRxjplzssn0gUpe0d+ZqU04=;
        b=oFwP/ThOHYQtHfF5ynEplHEnY0+Cqghkvx4FA90ul6+9r76u9Uo6nCD94YKhsnTMea
         QrjQYe3JWkegNOQsdOJ5r1M9c4VZc+OAayUJNwdygXKdedDSoTQTJ/nKKkj7jRS/HnzD
         UIb25y3No6aR4WVA0aCQaz9TAO+tl4UaTqDm0qjuzwDk+59MPs8cS2zTLhrn8+L6X26s
         HAEiChh9f2aReyDBNBIwajOHZfBeCdoGkSI+sntrvUymh2tCF25ClQo9rBfFGyTchR0M
         xkgQ/czfigqUlKjNhSRcyblzu6xr+VtwK8V/ErjYAz17tZiABTVBEqQRqAax1UF/KmNM
         K80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793383744; x=1793988544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCM05k2C0awIth60s9Z4jRxjplzssn0gUpe0d+ZqU04=;
        b=OmMYmpdVddLZ3x/W6JKBdeqW4SiCMU7NJcJ6UfxXP26wa7i0s5gABz73y5FhUakIKd
         6JBp2vkX3EznyOpj8twjy0YE+MnZGXoGpGg9NeCg+18Y7cBJWbgYBGJYVd8C6CnGcKVU
         udQrHzZbe37U54WUI7HDT7Y5tCHKDVCmW6SOF8/j24IHyt8ffQlGgDzPiXqBtzP3O86m
         Cc8eebtnbt1LmUh0BSucWxjLjB6FhSpkQ7RHB5XHIVCM+C5z5jrfsirdITW84Emoa0+A
         5Ly4H+A6ZZBMT/xmrRMKh2kVgoruWsb2Q28R2Ok1JZJbPcQcX1J7h9E96Vkpvz1RH/h4
         LYzg==
X-Forwarded-Encrypted: i=1; AKwUvByyBiWDarrvWKVPP9Dj2hiIJXujpT6PNtKDCK0C5QsSiTECnwpS76CXTHLEmJGFfKfjWZY=@lists.linux.dev
X-Gm-Message-State: AFq9FYIfzTObMwGzpd5nQz6QbYW0CFLOOdcNdVaaGKN3ER2c3aUsGLER
	fznKtYP+ylzd4POHM5hvAg2Cxm4AGfpdQpihHgeGC0g2AQbbKVTigugh5lSFwzFd4tkpovhJmDI
	+CYLGtbj2TAtKOlxeWGVvDE9BeIUyjnw=
X-Gm-Gg: AYBFou1US0MmGePoDtobSSPPJoxK4uH7HddozzwoiyGulDKbaw8VUCG/9xspVeV8Nh0
	qn1w3HbRrvZpkOkwYXUuT01BXjzIwP3SsHh+Pap9okf/K1/TqK0fH1hVIYBPXfRASFrAvMlCzJK
	i4FVTQu/omIhCeZuE/pRGQq/uwpjaeUtCmNUwdPDw8hMc/iNku3mAnJc1Z6vp6lRuB6If0PS2uT
	kgOCiyfrTgQ662869pVQLmn14ax38KgTaYIs541FoppcS2UTUA61da1IorqrndKpzD2OmyI1CJ5
	21y0fMrNMRjRYe4IoDcGlUwwrYwGRze/evXOeM4Mwxcd+rGHHtXrC9sG4VdRURFxw5dZ1RxzMKQ
	YZvaNECe5WhRW2yCj0Wrf3Y6qtCvnGTjLI9oJMrPdB1u7AevyPAn4TwxqO4d0h70kdSXd8gdgJQ
	P793tbBGfoZImVLBU4Cp0molP1z5zwiPn1KQZwxJ6yUoJQb4AxbjWEHpKdeqOP/lOvGNN2+ETDX
	Ybz3dy5rSaOQb5fr+dp9fsekmfU+A==
X-Received: by 2002:a05:6102:e07:b0:7b3:9d2e:c1a2 with SMTP id
 ada2fe7eead31-7d0543af600mr2250112137.42.1793383743550; Fri, 30 Oct 2026
 11:09:03 -0700 (PDT)
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
 <auRl9ztbav4nHi7U@ashevche-desk.local> <CADvTj4p8tjwdftg+H11ob0iaBZKxXrTdkSmhfZHjOYunm5tr9w@mail.gmail.com>
 <auTZtteCFnuoMD3p@ashevche-desk.local>
In-Reply-To: <auTZtteCFnuoMD3p@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 Oct 2026 12:08:52 -0600
X-Gm-Features: AclHuK8c5dKv2-dU28EFYCOPnAfJ1MA-zFVMtXg5QQ7p9buAg8gKSWCKNovPJxw
Message-ID: <CADvTj4rXXAEnTyu_AzpF41a2YSHHG1ANozCUSePBoH3QZYbBQg@mail.gmail.com>
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

On Fri, Oct 30, 2026 at 11:54=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Oct 30, 2026 at 11:09:53AM -0600, James Hilliard wrote:
> > On Fri, Oct 30, 2026 at 3:40=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Oct 29, 2026 at 11:19:59AM -0600, James Hilliard wrote:
> > > > On Thu, Oct 29, 2026 at 8:24=E2=80=AFAM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrote:
>
> ...
>
> > > > > > +     while (rx_ret || tx_ret) {
> > > > > > +             dev_err_ratelimited(p->port.dev,
> > > > > > +                                 "DMA termination failed: RX %=
d, TX %d; retrying\n",
> > > > > > +                                 rx_ret, tx_ret);
> > > > >
> > > > > > +             msleep(100);
> > > > >
> > > > > Huh?!
> > > > >
> > > > > > +             if (rx_ret)
> > > > > > +                     rx_ret =3D dmaengine_terminate_sync(dma->=
rxchan);
> > > > > > +             if (tx_ret)
> > > > > > +                     tx_ret =3D dmaengine_terminate_sync(dma->=
txchan);
> > > > > > +     }
> > > > >
> > > > > This is unacceptable. Sleeping is okay, but value should really m=
atch the
> > > > > baudspeed and other parameters of the transfer.
> > > >
> > > > This sleep is backoff after dmaengine_terminate_sync() has returned
> > > > an error, rather than an estimate of UART transmission time. Each
> > > > retry asks the provider to stop the channel again; elapsed time is
> > > > never treated as evidence that the resources are safe to free.
> > > >
> > > > The particular 100 ms interval has no hardware-derived justificatio=
n.
> > > > However, I don't yet see a sound way to derive the retry cadence fr=
om
> > > > baud rate either. RX can be waiting for input, TX can be held by fl=
ow
> > > > control, and callback retirement is a separate requirement from
> > > > moving bytes through the UART.
> > > >
> > > > Do you have a particular provider failure mode in mind where retryi=
ng
> > > > termination should follow the serial transfer timing? I'd like to
> > > > base the interval on the condition that can make termination succee=
d,
> > > > rather than substitute a wire-time estimate for an arbitrary delay.
> > >
> > > Termination of DMA sometimes require to clean up internal FIFOs and o=
ther state
> > > machines. That's what happens on HW side. In the software waiting for=
 too much
> > > may lead to the very big undesired latencies. The value of 100ms soun=
ds insane
> > > to me for the HSUART cases (megabaud range of speed). Also note, not =
every PCB
> > > design uses HW flow control, so this may be even worse for them.
> >
> > The 100 ms interval can add unnecessary teardown latency if a failed
> > termination becomes retryable much sooner. There is no hardware-derived
> > justification for that particular value.
> >
> > The FIFO/state-machine draining is part of the provider's stop sequence=
.
> > For example, DW performs its FIFO-empty polling inside
> > dwc_terminate_all(). If termination succeeds, this patch proceeds witho=
ut
> > the retry sleep, regardless of baud rate. The sleep is only reached
> > after an error during DMA release, not during normal RX delivery.
> >
> > Baud rate can influence how quickly a transmit FIFO drains, even withou=
t
> > flow control. However, the termination error does not tell 8250 whether
> > that drain is still progressing, how much remains, or whether the
> > controller needs a different recovery operation. That distinction matte=
rs
> > when choosing a retry interval: a shorter interval reduces the added
> > latency, but does not establish that retrying can recover the channel.
> >
> > There is also a specific API detail here: dmaengine_terminate_sync()
> > returns immediately if device_terminate_all() fails, without reaching
> > dmaengine_synchronize(). Consequently, an error leaves callback drainin=
g
> > unconfirmed as well. The retry cadence can change, but resource release
> > still requires successful termination and synchronization.
>
> Most likely this is AI slop. I can't see the justification for 100ms.
> Can you explain that?

100 ms was an arbitrary backoff to avoid a tight retry loop if
termination keeps failing. It was not derived from the baud rate,
FIFO depth, or a DMA provider's recovery timing.

That motivation explains sleeping between retries, but not choosing
100 ms. I don't have evidence supporting that particular interval.

>
> > > > Regardless of the retry interval, shutdown cannot release the buffe=
rs
> > > > until the provider establishes that DMA and its callbacks have stop=
ped.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
