Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793469665;
	b=LgMLlTxW8Cqf9oT3DKwX+1gC5hfnI7yPerPjPj0Nf6SJcO3Nqa8Hqf7sIzPKRwnSmNbB
	 bMRUjYrYG0ph1xLHlPUdGe4tmfT1sxx/SHvNy1NYEC9Vwvl+Evpict+Kjm+Ciy2vxbjEO
	 UZ/sI3mBrfZILbtsosovW/z5oGeF6avBpVg5DhMEtdAIeGHv+aZw9Cd3dlsA4kK9lRKqA
	 fTnTbRGZdFOlaXiaW11MbRpVZOm8/fOfPwYWxTdmb5iitSmkR6UaBQfmGC0V2/bp6ALXc
	 HJbkAE/GyqfziWDvZJsLDss++wEM00HwAehyG+wqDGoNK8uOtcRzUt5/1YDXYVOwisg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793469665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ztiV5c0DfuFx8uDKCLiUp5o+ivOB8cWRN0pJNXnNfZU=;
	b=bXFIwjYTSsUea9Xp/AQpbIL703DpkD/rH2sG/VDutlvO4p0CZ3RNg+5eHVWyOqBjzSNl
	 7axMSmqAaK8TbZcLiGPi+lmF7RcA+AhnGOft69Wvh4UmC2TMBQFO9BZhJKifEln+VfvNI
	 BDS9+PElteTGBG8D4/aKDIspsn1DL12tVy7XhftwmO7KqFzVBu3MqCSnx+ypBMPha9dom
	 stx9NFlMV/NhrC0k3g0EDAw5nZf0t5gQX3gVd1g8waibM1zhwSvfYjTaakySxMcKRFY28
	 6d4fV/TDbm37B0GmIS5/5/p8/neURnEi3AhZfMB6AbAZ+IOPC+LjREd+o01FcKn/kww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0It9zTfh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E45606A322
	for <imx@lists.linux.dev>; Sat, 31 Oct 2026 18:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E45606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0It9zTfh
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7c3cecbda48so377632137.3
        for <imx@lists.linux.dev>; Sat, 31 Oct 2026 11:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793469664; cv=none;
        d=google.com; s=arc-20260327;
        b=mEdA2KJQDSlFiZWxeu+8HPeE8PXaHomIOnCBsXVtUTzrvulLf181JDiara7Fb5QG91
         s1eVsQKWmVNgQLkmq8AU6Px8xNZuuuNpY6A7/zwBAy8eGOxA9l4iKZ/sAeqgnIvVVF+B
         Pc5vvdrQZ1GrCvAZOx2x/ajCMuH+nRrvTkMtjl4x91Q2S9j+A+3WAkRfbE5Z8zX7O9y+
         0wtG0FZKmq+678ceehBhHsm19dgu/JdTbLVU/AHCPTQp61Y5H46MzrXzhLXoU/X6/qPd
         GZih/VyzSdDB5/Q0Vqehp07PgTdQ21yb/ZF36s48x+dsCti2sN+OFRjMAkqMjfunovgS
         DqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ztiV5c0DfuFx8uDKCLiUp5o+ivOB8cWRN0pJNXnNfZU=;
        fh=PBrnDWiIq2En9SZxZlGxT+6zW69M4Jg5UP2CMxpTUpY=;
        b=hvFcWqCOhgtT/1FBnY1DhrpBv6DyFJ6TPfHYI8kFeL5a4hVePy8E8yjhgXHkm2gmSM
         z7FZVX5vylNCWgQcn0WzGpoA5SGoulEQkGK/WGIVPW1TqzQK6Lns8IRD8wBW830sKy+h
         +PqjF3WYQG+V2DrM86J9ncK6GUaBiD1ut93BV+lYhEWkQgwx8Wjr7kx0A5I5UzmIx0gg
         RCXctQTUUqaQlrF3uerUWwDBWN9nK1336UJKEDfNwWf9iVyBzau7ShA9LDkbXtQFI8QL
         /Jaz9c1+DmRuWgwaedO8yrpgWKiXTi6PcC0q9O7mXMZDohH2Dx14DRwWCi9mLWBG7CgJ
         ZHQQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793469664; x=1794074464; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ztiV5c0DfuFx8uDKCLiUp5o+ivOB8cWRN0pJNXnNfZU=;
        b=0It9zTfhiJuHM+pVis4PI9jIz4XbVYXx29PzaC7nmgYUcHNBCNwm4VO1DByshiqYry
         KsfbGbcxJN0O3pY1SoCacvCgIyLzGsheanRWHbCHXd1r4S/Qp+AHX29TfPdt98LmWboJ
         TU5WDOEUwbPRKFte2PRP9bGEFieZ7M2mmJBw4aANvwEViKS2L+TtB+FKuOxciXXFOUdm
         /u1j7Q5DtVGNKk9UqCkZ36Qxic0/aOHSvjcoo5XEIFO0hWGS2rtAjRQAFlYt5YARBl81
         QTujstNrmqWyawqVbGG4w7FdqtfuBLZi1gR+VySCs0DMUisy3Y23MxHnVHhAz3ejSTsZ
         OEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793469664; x=1794074464;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztiV5c0DfuFx8uDKCLiUp5o+ivOB8cWRN0pJNXnNfZU=;
        b=injPvDVmG0OUzVfZfdoEqjqgfqHqVjq0HvL/7T6fkDQSTPWM7x8RAX1t9eJAtRNqlv
         15SY0DDRBDFzBzgXmmZI/QUTIP6oO/uyIx7YSlYUeKIKsrtlFSZNPMhQlTRXVlUSezel
         7HjTLVOD6osBA5ZKnpGCAjIu6wmTYb4NgRUNB1ZOOwHAFzvtDr61g8iFDxAzC3n3utz3
         edgIAp/TJr+XDxgB1Oqa9bgBgNIUfK9wvMWW/EoWU068IRfOqrCBPnVyc6Kl+B2EnSbr
         xWLJcUcxcyl9M7zN3flZ+HgTvlHnGuvfc9+CYOJSwLILncUSIqyHpbhXZre/xvYzEGHH
         ReXg==
X-Forwarded-Encrypted: i=1; AKwUvByOYOPRyK5arrGu0gDq+ujWrer269twL3d+mUoLtIHR4o5BOnUCEaUiqMAdvBVHSj6LmiA=@lists.linux.dev
X-Gm-Message-State: AFq9FYLnEYSqfu7bCpBVA6wMs1WWYKq30wcYuTo0CgfmqZYlo/CJSULP
	INAhN49JpEWPBI8H7Wp8paAiWUtkjr3wXFnNkh1LNcK2RXtw6HKTqsmR+DBRubEbGlHttExpeR4
	woz9pJMwXs3eZ0zbqCoHObjMQjkvTj2k=
X-Gm-Gg: AYBFou0npXbF5bb1Q2lLOldfQBW6Te34rgOf9ZRYeVqf0AqVNAp2PjjDGwwofEplUFQ
	dgi9w0VcpzfTH1VJWv3Ldl9rYuPLYoVTqe575rfKcfOi8KA9eQ2UTpnye2jM5lyH33efEPUs94T
	c8P2ynFuEfqe5jVgFlxIhGAGNpwXiXG/ciR0K8+Xs6kwrsnADgkpa4L3xvd7DGNuDWi96kB6Frm
	epc1sAnX/wBGE5dbOugFaFGOWgx+3XG9Ie/5SRj6KFSu3+b87WCKGOpX5iwVqicj7bTDSg83ekH
	h2RnWgSRy4KZ3atyAlWm/2uWHEOHhoLFbF/hs1hUB5MJX/qqIRvAs17pi/Tz1L6Q6cWnPXqrvfy
	T5JDUEj7dIzn/8T7nrtUYFXR+NrgtWe/3mVDMGsZEFNfOlagQoNcJ5S4i0d1ChFW9b98CsY1bss
	ROiY6vhgn84WdVVY+6J50MMSQosfpkVpODBibg0riUjyXi5JSluCCfFsFlrTCuMzVRVd3DpWerJ
	DMlRcabdGpjBW6UQXSGFbCRNvawWQ==
X-Received: by 2002:a05:6102:c4f:b0:7cc:3eb0:6ece with SMTP id
 ada2fe7eead31-7d072d53fa3mr3076240137.33.1793469664332; Sat, 31 Oct 2026
 11:01:04 -0700 (PDT)
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
 <auTZtteCFnuoMD3p@ashevche-desk.local> <CADvTj4rXXAEnTyu_AzpF41a2YSHHG1ANozCUSePBoH3QZYbBQg@mail.gmail.com>
 <auWqUIBUs0_7bnGU@ashevche-desk.local>
In-Reply-To: <auWqUIBUs0_7bnGU@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 31 Oct 2026 12:00:51 -0600
X-Gm-Features: AclHuK8CrIpMhatn91Js9Zu09dawz3gtrtGWd_ctbAp5jI12V9IMTbfHBekYVDc
Message-ID: <CADvTj4rej-zOtwwN8CtchQ8A9L-fdG0dL_XwBb0zTFv5m=+j4Q@mail.gmail.com>
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

On Sat, Oct 31, 2026 at 2:44=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Oct 30, 2026 at 12:08:52PM -0600, James Hilliard wrote:
> > On Fri, Oct 30, 2026 at 11:54=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Oct 30, 2026 at 11:09:53AM -0600, James Hilliard wrote:
> > > > On Fri, Oct 30, 2026 at 3:40=E2=80=AFAM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Thu, Oct 29, 2026 at 11:19:59AM -0600, James Hilliard wrote:
> > > > > > On Thu, Oct 29, 2026 at 8:24=E2=80=AFAM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Thu, Oct 29, 2026 at 01:37:02AM -0600, James Hilliard wrot=
e:
>
> ...
>
> > > > > > > > +     while (rx_ret || tx_ret) {
> > > > > > > > +             dev_err_ratelimited(p->port.dev,
> > > > > > > > +                                 "DMA termination failed: =
RX %d, TX %d; retrying\n",
> > > > > > > > +                                 rx_ret, tx_ret);
> > > > > > >
> > > > > > > > +             msleep(100);
> > > > > > >
> > > > > > > Huh?!
> > > > > > >
> > > > > > > > +             if (rx_ret)
> > > > > > > > +                     rx_ret =3D dmaengine_terminate_sync(d=
ma->rxchan);
> > > > > > > > +             if (tx_ret)
> > > > > > > > +                     tx_ret =3D dmaengine_terminate_sync(d=
ma->txchan);
> > > > > > > > +     }
> > > > > > >
> > > > > > > This is unacceptable. Sleeping is okay, but value should real=
ly match the
> > > > > > > baudspeed and other parameters of the transfer.
> > > > > >
> > > > > > This sleep is backoff after dmaengine_terminate_sync() has retu=
rned
> > > > > > an error, rather than an estimate of UART transmission time. Ea=
ch
> > > > > > retry asks the provider to stop the channel again; elapsed time=
 is
> > > > > > never treated as evidence that the resources are safe to free.
> > > > > >
> > > > > > The particular 100 ms interval has no hardware-derived justific=
ation.
> > > > > > However, I don't yet see a sound way to derive the retry cadenc=
e from
> > > > > > baud rate either. RX can be waiting for input, TX can be held b=
y flow
> > > > > > control, and callback retirement is a separate requirement from
> > > > > > moving bytes through the UART.
> > > > > >
> > > > > > Do you have a particular provider failure mode in mind where re=
trying
> > > > > > termination should follow the serial transfer timing? I'd like =
to
> > > > > > base the interval on the condition that can make termination su=
cceed,
> > > > > > rather than substitute a wire-time estimate for an arbitrary de=
lay.
> > > > >
> > > > > Termination of DMA sometimes require to clean up internal FIFOs a=
nd other state
> > > > > machines. That's what happens on HW side. In the software waiting=
 for too much
> > > > > may lead to the very big undesired latencies. The value of 100ms =
sounds insane
> > > > > to me for the HSUART cases (megabaud range of speed). Also note, =
not every PCB
> > > > > design uses HW flow control, so this may be even worse for them.
> > > >
> > > > The 100 ms interval can add unnecessary teardown latency if a faile=
d
> > > > termination becomes retryable much sooner. There is no hardware-der=
ived
> > > > justification for that particular value.
> > > >
> > > > The FIFO/state-machine draining is part of the provider's stop sequ=
ence.
> > > > For example, DW performs its FIFO-empty polling inside
> > > > dwc_terminate_all(). If termination succeeds, this patch proceeds w=
ithout
> > > > the retry sleep, regardless of baud rate. The sleep is only reached
> > > > after an error during DMA release, not during normal RX delivery.
> > > >
> > > > Baud rate can influence how quickly a transmit FIFO drains, even wi=
thout
> > > > flow control. However, the termination error does not tell 8250 whe=
ther
> > > > that drain is still progressing, how much remains, or whether the
> > > > controller needs a different recovery operation. That distinction m=
atters
> > > > when choosing a retry interval: a shorter interval reduces the adde=
d
> > > > latency, but does not establish that retrying can recover the chann=
el.
> > > >
> > > > There is also a specific API detail here: dmaengine_terminate_sync(=
)
> > > > returns immediately if device_terminate_all() fails, without reachi=
ng
> > > > dmaengine_synchronize(). Consequently, an error leaves callback dra=
ining
> > > > unconfirmed as well. The retry cadence can change, but resource rel=
ease
> > > > still requires successful termination and synchronization.
> > >
> > > Most likely this is AI slop. I can't see the justification for 100ms.
> > > Can you explain that?
> >
> > 100 ms was an arbitrary backoff to avoid a tight retry loop if
> > termination keeps failing. It was not derived from the baud rate,
> > FIFO depth, or a DMA provider's recovery timing.
> >
> > That motivation explains sleeping between retries, but not choosing
> > 100 ms. I don't have evidence supporting that particular interval.
>
> Yep. And that's what my point is about. Any big sleeps has to be explaine=
d
> and justified.

100 ms was an arbitrary backoff for what I expected to be a rarely
exercised termination-error path. It avoids a tight retry loop, but
neither that nor the expected rarity justifies the particular value.
Successful termination on the first attempt adds no retry delay.

The constraint is that failed termination does not establish that DMA
and its callbacks have stopped. Returning from the current shutdown path
would let the serial core free the TX buffer while DMA might still own
it. Retrying preserves that ownership, but a permanently failing provider
can block shutdown indefinitely.

Would you suggest a different approach to handling termination failure
here, or a better basis for choosing the retry interval?

>
> > > > > > Regardless of the retry interval, shutdown cannot release the b=
uffers
> > > > > > until the provider establishes that DMA and its callbacks have =
stopped.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
