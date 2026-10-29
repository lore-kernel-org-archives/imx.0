Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793294277;
	b=jBVAUhDGqX53pQom+sL4BEGKEqMfH77Qapz9AqQMi9mttSlob9mScE+2Vje+6Nhx6oCY
	 n5X8GH6WJ83c0yYrFaxl5LnUqy4RWFzcXOgroCBApCvMO+hwODJlSY2XifAiB2mmQxUSv
	 9sfJ1rMDGC86+Nt3/o98y8Par5ePTX8raOSAzoYrmQprULRz2MdHIM6axXK5RO/iR6KFQ
	 x649u/gUG86LKMXDloQa8oSAmFuwzaAcfoC0d1XLQTwc9m9YHzorgNUkM3ihuzfOhM5Sd
	 ZWQh2Ex6UFCPg7uy318nodIRMAVlR0x/XczoL7BVID330pzlHTOXlVa0LzZZQdEdGRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aVYR1R4XUuM03rk5Iesd5QgqyShDDveAkvO74xuMO/4=;
	b=MflUnMxb6t1FCos83hSlb2hXwmQumnmDhtz0tSJoBHf24Hl6uTj+E4Ql3oYtfbKA5nd4
	 RB6iFILGk6PCojG50iBM6mF77tMO3GwYkc9GgIsnqz3z4v8Tyh7cCSCID+XLIFIZGPVtJ
	 a4jzPsKgP7nHZl/tsHJbqJXHbgd5aO6wRZs/3bspOqRSD84/XVf9l6cCxNvEEnwLP+PHA
	 au8qbrjX4TRhM/hajQQ4mFeMQOwFrwxNbEXMrE649TvOJbe0OJSTj3n/CDk0qQfWQucDZ
	 H3rjabsu8Zu3cHX7ySDAiEmzb0k9TirmmQ767tstRPu9X1EiV4x5otnUOsC09DPA0Kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bw3sl43S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E082F606A31D
	for <imx@lists.linux.dev>; Thu, 29 Oct 2026 17:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E082F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bw3sl43S
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b413b0a974so3611217a12.2
        for <imx@lists.linux.dev>; Thu, 29 Oct 2026 10:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793294275; cv=none;
        d=google.com; s=arc-20260327;
        b=m2kC7ooZDU8D0XyLHaQmHzKJyBjyiKnFgvQEYlawVLjsssT0CdNET88t3/tUxQ/VbD
         8KUbpdqqIiaoVLKLb7rapsq5WI7pzySgDOBnCu03kU1vhvFvY/LmWQ1ExM0d60yNrZ7n
         gduwyximkjOKs0gMqhzTZKchl2vXsQZ3m48ktM1D4JFxA0c5SuS6IMnxetSByzxarCkt
         Zh9SBttPClZyB8Y9zYpR+/0UOhQTNtHfRIFZYcZML5hFnYvmAj2I42JpfvNcEIcOvTOC
         qygU5QFUfDYF8NXy3ypi2Yh6Zn3xzPZ2MjeoHDIOLgciQRqCa6psaTQr2QwXCGhkb90K
         6KLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aVYR1R4XUuM03rk5Iesd5QgqyShDDveAkvO74xuMO/4=;
        fh=b7xF3jRDKxigzaiCuPBeRmnkFNbc2pEURR/0zET5uPs=;
        b=guRIWHWMDc3NYUGB42EQAVPH9WiVkWELBXn5SRpb95kBYLPJEE2Pe7ZINQ3GgsRQWB
         PhgbEcmXjwmSBsrEnbeM3hSTOH1tYrAAUCcGqqJYrpFY9QpTOTWA8QC2kXKi/uCO+i7Q
         /rpB5dB75Sbcb8OrRg2wVioQIxB/KU8rWqfW0l2J4J5966NA7ikiwqOJLjJKCiz5UWxm
         eNd8fLfSJ3t4A0JXs1v0guzF/0j5JGaJQxZeTCsUahwFIbJJ6kTVeQE+hWiePqGTsO+b
         YtdqpdcHhu1ViSLZrlbIssYDGZ1EkG0LQ3FLCsoujQqqXTMSA6zt14XQzNO1OzGWawA9
         2KHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294275; x=1793899075; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aVYR1R4XUuM03rk5Iesd5QgqyShDDveAkvO74xuMO/4=;
        b=bw3sl43SjBJfabVD6wbDHiaVCsV3kP0im8x406QY1QuVG84xHbK+RikGWwUSyionud
         IAC2cSsg1sbnr0GAhTFeNyLnkrBbmk535fAdNd8ljyaINTHGSX/bdp8N3cdFDZ0fBurn
         t9ZzBEgGaK6oEO+CFUFxzhbp6vna55WQSXxK/x73TU+XiGnge2+KLqN4toVot7N3cY7U
         /2CpsxBPPQP0he9ibkGTyIEDp2Z4BKYOdIkvgMLykEzbtrtnx8wSpyxHtb51q0itXe6r
         BasfaqrD9JerKgswUN2IMwYfFgkGSDj/g12Hhec+0yJPjGvi8CT3eFP1oLH9I1CAtTk+
         bX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294275; x=1793899075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVYR1R4XUuM03rk5Iesd5QgqyShDDveAkvO74xuMO/4=;
        b=pU6kN7IwXG1zgi0XcpT1ONR/OAJLQ3grT20P6rRfDzx0TUaGeOm7ryy8IHMwsisruH
         In2QqwQRGCYbuGJO8p3SMWwaN7y75aVQl4xaFyRrCI5vhr5oQ/CaKbGUCJeFvLKOqb3l
         +xJYFZD58+nZVmHm0Vm7SLx5gBoVRGROKSPKRyg71665Dw1cdLQyncrDsqLe69IS3h86
         uZXdXjDxdg0JAGxPAKKjU42cDqjFQN2Ujct5XUszObp9NfgFWpUWdWCasI1gjMdzKrqj
         JJXf/oQqH2Q6Bg20JYjzJnqjVp5q2lT57ZPAygQNn4NNGx1+OYBnWgpqDorG7lx36nuK
         zFHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeBe4vcQzzNFUPXQoMxzZGsdWCO/Oh4ePhXN5kfPLtn+Md4rPYpArPhB98wE7UlkzOz8Y=@lists.linux.dev
X-Gm-Message-State: AFq9FYL36CICJacJoTtbQ1ryHMTAjO1EhzYobGma3w9+HCeHJwmh8WB4
	W81YLvZ4AX5UjO9JK97XUXl4a+fW8Uo+FHCrdCvRXfUeZFPUdF2gnH/k+RUH17xN7XBpBj+2JWW
	Pa6OBflNLOVSW6ARQGQe38dm0GPYCc/U=
X-Gm-Gg: AYBFou1BaZIWxC6KwAvY8PZAApK2IWt7GrU7vLUVSLqNIc7jd4XjKUrKdpi6AN931Rf
	qhXhO3A1DGjN7/922haswEuzHVjDC8DfqBioZZkpBSLVi2RaTbXw5In0tW7zugx0Vuiw8PP7dwm
	3qQtYt9d9aabqjiF5J5SToxMxhkO8vAKFXZaNnjY8Ra6XHuZTJDDiFac5klKKd98IRySPivYFr5
	jmhFn1QdSYW5ujPvtT6rruSjCYlMWagGdiu0audAP6yvKWx5P2x28dGXQmATrbq9avpLm2XFwQV
	XFqDOndJPCSvxD3Izsphph4zue72KSRPWK36hOCrA0Qo8Xd+mskbWw4/3WVi5vPLREBMXheTDu/
	m4U/ln19tiZ6PYQTl4SuW5Xq2badSdlU/rMkMUok7E/trnU1cv9X6sdst8hED/29J5YwMWGXFoc
	Fwodx0byfH+A0oowb7tRpFcdptZ1F9cKqVP+EKEgU3uJGW481UF+jbgre6AGm31gwZonbfQtvnd
	3VgX7TkSYhepUXhRQ+F3gHguKecZg==
X-Received: by 2002:a05:6402:158f:b0:6b1:ba86:5f48 with SMTP id
 4fb4d7f45d1cf-6b49cb8e221mr4598429a12.36.1793294275082; Thu, 29 Oct 2026
 10:17:55 -0700 (PDT)
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
 <20261029-submit-serial-8250-dma-cancel-v1-v8-5-3fd56ba352ed@gmail.com> <auNWl_thBnE8JqBE@ashevche-desk.local>
In-Reply-To: <auNWl_thBnE8JqBE@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 11:17:42 -0600
X-Gm-Features: AclHuK9p5HgzHs6EyjP74wtBvDwmav_JmQ_V3uuDUu-UaTGXVkbTzXu0Rboi3LQ
Message-ID: <CADvTj4qR0j7f-79wTUb9LmwWdGKYz32vB3Bgfr9AnEfXMnMBdw@mail.gmail.com>
Subject: Re: [PATCH v8 5/6] serial: 8250: retire canceled RX DMA before
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
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 8:22=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Oct 29, 2026 at 01:37:01AM -0600, James Hilliard wrote:
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
> > transfer concurrently. Retries sleep outside the port lock and stop whe=
n
> > shutdown takes over. A provider which never pauses or completes retains
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
> >
> > For OMAP, publish the shutdown gate under the port lock before the fina=
l
> > RX flush and interrupt masking. Take the RX DMA lock inside the port lo=
ck
> > in the completion callback, and serialize the runtime-suspend flush wit=
h
> > the same order. Drain the UART IRQ before releasing DMA state so an
> > in-flight handler cannot retain up->dma across its release.
>
> Can this patch be split to smaller logically isolated (to some extent) pi=
eces?

The OMAP shutdown and locking changes look like they can be split
out.

The generic RX changes are more tightly coupled: the retirement
state, worker, IER filtering and FIFO-access guards must agree about
whether DMA still owns the receive path. Splitting those mechanically
could leave intermediate commits allowing PIO or another descriptor
to access a buffer that has not been retired.

>
> ...
>
> > +++ b/drivers/tty/serial/8250/8250_dma.c
>
> >  #include <linux/tty_flip.h>
> >  #include <linux/serial_reg.h>
> >  #include <linux/dma-mapping.h>
> > +#include <linux/delay.h>
>
> When adding a new header to an unsorted block, try to squeeze it the way =
that
> you get the longest ordered chain (yes, interleaved with some unsorted
> elements, but still).
>
> >  #include "8250.h"
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
