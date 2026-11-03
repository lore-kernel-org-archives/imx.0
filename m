Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793729157;
	b=X9a1B3T06WcScWPUR04A2tYYly7TtzriO4AUuzKxzeICFPzfGp2wgK5AZWL+y5buTI/8
	 OSeBhoqfz7lxEKEpfLOuLfF2sYZG743iT82MCLv2VUTefdL8BbOIYYyYBMkJK5JglKiDV
	 nOYfITIBc94xsIDLVz0sOvIebQVoV2YZaC2YwVLcABLhC/cOuKDhDCtpuji3iDf0syS0b
	 ahXT/sv0GqLknnXpvClRaqQNdd6QThlNcYOQlW7ze/3vXULc91TH/OYCmP0jdTatWeS7s
	 nYOijjfZrkR4hDrk58WEVtbnu7+4nomJeQroG9Klh/cxtXbUDsCO/5BT8TB8YgOQU+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KNbjwm4E9DcWTobQLF+oFd4MAgDdWhobdyNW4zlZws4=;
	b=tmkmbrtdlEuXjTswlEYaGbOopXi49qUyco70WfgGsyOG+VblLG53nfaHbFLjHjRmqmxq
	 XHvrAE8CduTKYCs21NlmBe6dVfu1d51YrBzL1RCLMKchOK3dKFEOvdaOUb+W04fmaUu7n
	 /BIhIOp5DeIm1JVIzfi9WkkRB8T8a0c6MTrHYCZltd+pTMA8PXn3sHeyuvukl0KQLg4yK
	 U4nCdjCceRGBvd0SLct7PempTGqdXJAfLfhuuQLF2Mwvb+U8dOYuLC2SeW7Kyi84ogiMr
	 VvI4YCVFdolDt69dac/ZFb3i6l9ee5aOwycR3pbNECikEXLG5Hoz6wmf6WZz46ThTLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTXNR2rZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26FD606A32C
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 18:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F26FD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PTXNR2rZ
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-990a39ba4fbso995243241.0
        for <imx@lists.linux.dev>; Tue, 03 Nov 2026 10:05:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793729156; cv=none;
        d=google.com; s=arc-20260327;
        b=ILUbW75iJ1eiz/8FMGXSENn6kFGuTMMSnDfcdEHheodJ/rBvblEtZJSq9IYqRRhWJE
         pl7m6Dz2YzxmDMTpvdOWkkHuPF1JTK7hN01Xs0Vbi6XDKqQgPiQId61bmmeFxp7RKfWY
         rFWj+raPH9ddFth8Di/OKIoz2sRzPr7n/maIIdQWD/yzdBgEinvhYaAtDas2dwDK9yur
         QR2JBiO6JF1uaSlUWSOnv8uwK/1oVaPBgl9RHCB8R9k9lpQ4L0UcIrp/FU7Es2fcuqsc
         75sUMHL2DkfXOEbea6PoLVdBDc9EnTYv5pBnjBO8aWROdXcApzAAImpjDvCnelN/GDdO
         GR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KNbjwm4E9DcWTobQLF+oFd4MAgDdWhobdyNW4zlZws4=;
        fh=sWR+8/qdakbsBcfBsAYfZvGaexd8rKu6npt0QneOYzg=;
        b=Awi7/lfdiYmK/GzCvRKkvXNR+nrVe2HIvq29uiBSlEa0xLB6NFf9HM6YIcc0418wLT
         YaB/XOgLX7b+z6fbSyWZJjxPlY7N7g1HYZpm1Kbf64h8qPMWWBp4ie8u8k2VpPMgGFC6
         irZwue1Hwya1XGxaGjzHXszwk1VxC8lUB/N+xvaX1vujMh65SqBoPJzwoEyxJUiaEoF/
         jRB+VAUzGRF0CKjo8MJCzoI1CH3R7U0zFeoYOwBiPWmQck0lsT7o2KAFm2hJ5CjAFNB6
         LpJwucnkJnaCE/GKKd1DLL9ip4/26DiH3XgQ++eXT9wiUpo9YPKEcR+qK7OyBHsaEWi0
         EPFg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793729156; x=1794333956; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KNbjwm4E9DcWTobQLF+oFd4MAgDdWhobdyNW4zlZws4=;
        b=PTXNR2rZD3JC1wBdOGlryxWnEle4RF/x5l+oOtjWxtclb1BKEbvYV+L1fcxSTa3u0x
         FbJjBdb1yjFi1yroXrG+upS4hVNIvZk7OT5czroWr+7WSQZAfnMtPEgRvMVQlZN1tRZJ
         kbFdSFQG2X+ZJSZE5lvQGiyxcucCq+vJtHUV5Jeoa1ygJyHLYblh793NwJOIfqqZl7An
         s93Uy37lie/Q5GL7imQsuc5GhQv64trf49J+ulCdZOqLzcXBjAX0mW5ZJUwLY+3iEovv
         IydyRl2u8xASGpiMuw63YpIsGefYlaJ/qRRXjGM9hvRxc/RJj9cIRQWzl7BMYMRE4gap
         8xQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793729156; x=1794333956;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNbjwm4E9DcWTobQLF+oFd4MAgDdWhobdyNW4zlZws4=;
        b=c+22W2Unueq08FbqwplQ+iGedRDV5qNua98s1HYug0e28mQthR6xQkmZsUzmQ2b0mf
         0buBKKHtsflTZ0m4NnlMVRizrd5NuVnChVNrV3Jx8TfU21ndc2/CKs3D605gKMfHlLhF
         hLQT2uZB+xkgG/lH+BjzLTMEkJMdP/VTgGjcTlO4/7Ae0lC+1o0WWPaNrvgJWgSyPgNh
         OZfF2gNMCBRHqukqFOfqdMdcdMSbNJdVwPiZvr1oxUDl5q3qOI550wP8rn7/v5dWx60t
         Fw7LCPE1ud328vCv6P3j7GPjv2JrwUYhN6pKmgR2U/sCGbnZbxJCK3ZvDvhba1D83jHC
         jrrA==
X-Forwarded-Encrypted: i=1; AKwUvBxYIvseraQqfgNqug76ysV10Uh67zu4sYJDF3h/qaG+naaMrYl+pJAAxXKVC+KGjaS0Pt8=@lists.linux.dev
X-Gm-Message-State: APuU4Z9u8zNSsW6NPjYnkGom35a6likgMiqL9r6p7OEtEZ221yZLXa0W
	ZsVL7PXS9VJeCO7fVAegARK0UTV4HL0NhS0i63EMjOmB3P3nMm6W1W5DIccQO1OlrOALjwITM4i
	oWMehoszl62yAajph4fmam+6H0iP5N5s=
X-Gm-Gg: AYBFou1kj7k3TbaQMLX8p1Y5CbDF6h8EkJITM3K5hBKOjJydVn5E9gYTVsuhRhaM3WB
	rrQ+5Xvs8OefVYopKj0czlxEzzCfj7RODn1qvA7W6u9PgFpQy682x+hQVlT/iC6AZyBlJbgHY1b
	kBr6vCCBbW4Y1EDttZKFzkLejz7A+hkonKiAWTXeC6ihif8hxJfzRqQpp7hOI0Picrd3AerlKZF
	3P9UdOdvoJ0cPDfXO/goCTxxRVA9T56mnD4JWyCFW2D9ruBoD4MvkXeHXNtRuBgW/PwEkmPZxGY
	4xbkv+B40rirqJjMmudQq61sLKBLOsy27OO1QPpDJUQJn5fiXBVsIzB1MJBzFUZZo7W08wo9Jli
	g48fUHh3y/Vfo2tSZpEKT0daQWCMEC4aD/MWhveW98cZP3jDeyvRT/V9lxLfgT5wkjNMqPoOv+1
	WSgyRRz3vpBVUuFsPpCoGznWY44YULzoGyO9DYN88HILScHcH+yci3dF++9satIH2gfpMjRQ4Eb
	sBGiMCt6dSTpWxRx79HIyo0JIXBKA==
X-Received: by 2002:a05:6102:5121:b0:7cc:5c9d:7e07 with SMTP id
 ada2fe7eead31-7d072635de3mr4255291137.11.1793729155740; Tue, 03 Nov 2026
 10:05:55 -0800 (PST)
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
 <20261102-submit-serial-8250-dma-cancel-v1-v9-7-9159caade148@gmail.com> <20261103161104.2449407-7-rrangel@chromium.org>
In-Reply-To: <20261103161104.2449407-7-rrangel@chromium.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 3 Nov 2026 11:05:42 -0700
X-Gm-Features: AclHuK8ExVfXbcYLwfHHnCvMLw6HMi1Pim5AHzKRXmfuq3AFPdi8A4knMcfIqjI
Message-ID: <CADvTj4qXcOqS-wDrrN-x3sXUQr5BtFBeGzz_wqpW8WJ1DMPg+g@mail.gmail.com>
Subject: Re: [PATCH v9 7/8] serial: 8250: retire canceled RX DMA before
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
	Peter Ujfalusi <peter.ujfalusi@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:11=E2=80=AFAM Raul E Rangel <rrangel@chromium.org>=
 wrote:
>
> Hi James,
>
> Thanks for v9 =E2=80=94 fixing asc_startup() locking in Patch 2/8, waking
> tty->write_wait for drain waiters in Patch 5/8, splitting OMAP RX locking
> and IRQ quiescing into Patches 3/8 and 4/8, and adding rx_pause_wait with
> immediate wakeups from dma_rx_complete() and serial8250_do_shutdown() all
> look good. Waking rx_pause_wait under port->lock cleanly avoids delaying
> normal completion or cancel_work_sync(&dma->rx_flush_work) during shutdow=
n.
>
> Two remaining comments on Patch 7/8:
>
> 1. Escalating to serial8250_rx_dma_recover() after a bounded pause-stall
>    window on partial RX transfers:
>
>    The commit message notes:
>    > A provider which never pauses or completes retains RX ownership unti=
l
>    > an error or shutdown; a timeout alone cannot establish that discardi=
ng
>    > the buffer is safe.
>
>    I completely agree that a timeout alone cannot establish that *reusing=
*
>    or *freeing* dma->rx_buf is safe while the channel is still running.
>    However, calling serial8250_rx_dma_recover(p) under p->port.lock once
>    the retry budget expires does *not* reuse or free dma->rx_buf without
>    stopping the channel:

Successful dmaengine_terminate_sync() establishes the required stop and
callback-draining guarantees. The concern is not that the buffer remains
unsafe after successful termination, but that this recovery path discards
the pending receive data and disables RX DMA until reopen.

A failed pause followed by an incomplete status can be temporary, including
when completion has not yet been published. Retrying preserves the chance
to deliver that transfer without switching to PIO. Memory safety after
termination and the decision to discard the transfer are separate issues.

>    - Calling serial8250_rx_dma_recover(p) under p->port.lock inside the
>      worker's retry block sets dma->rx_err =3D true and
>      dma->rx_terminating =3D true (and keeps RX masked in UART_IER), whic=
h
>      causes serial8250_rx_dma_flush_work() to exit the for (;;) loop
>      (retry =3D false, recover =3D true) and call
>      dmaengine_terminate_sync(dma->rxchan) outside p->port.lock in proces=
s
>      context (8250_dma.c:233-239).
>    - If dmaengine_terminate_sync(dma->rxchan) succeeds (ret =3D=3D 0), th=
e
>      channel is stopped and its callbacks are drained, so clearing
>      rx_pause_pending/rx_terminating and restoring p->ier safely falls ba=
ck
>      to PIO ("RX DMA failed, using PIO\n").
>    - If dmaengine_terminate_sync(dma->rxchan) also fails (ret !=3D 0),
>      lines 235-239 already retain dma->rx_buf and return early with RX
>      interrupts masked.
>
>    Why does this matter in practice?
>    Look at drivers/dma/tegra186-gpc-dma.c:
>    - Line 1521 unconditionally assigns .device_pause =3D tegra_dma_device=
_pause,
>      so dma_get_slave_caps() (drivers/dma/dmaengine.c:614) sets
>      caps.cmd_pause =3D true and serial8250_request_dma() enables RX DMA.
>    - On Tegra186, tegra186_dma_chip_data sets .hw_support_pause =3D false
>      (line 1351), so tegra_dma_device_pause() (lines 420-423) uncondition=
ally
>      returns -ENOSYS. (On Tegra194/234/264, tegra_dma_pause() at lines
>      389-414 polls TEGRA_GPCDMA_STATUS_BUSY after setting
>      TEGRA_GPCDMA_CHAN_CSRE_PAUSE for 20 us and returns -ETIMEDOUT if the
>      channel does not pause.)

The Tegra186 case is a permanent capability mismatch. dma_get_slave_caps()
derives cmd_pause from the presence of device_pause, but this provider
installs that callback even when hw_support_pause is false.

serial8250_request_dma() already rejects RX channels without cmd_pause.
Correcting the provider's capability reporting would prevent this
unsupported configuration from being enabled in the first place, rather
than discovering it after receiving data. That is different from a pause
timeout on hardware which supports the operation.

>    When an RX timeout interrupt (UART_IIR_RX_TIMEOUT) fires on a partial
>    transfer (e.g. a few bytes typed at an interactive console or a short
>    command waiting for a reply, count < 4096), hardware transfer completi=
on
>    will never occur while the remote peer is waiting for our response. Wi=
th
>    an unbounded for (;;) loop:
>    - Those partial bytes in dma->rx_buf are never delivered anyway (even =
if
>      we wait forever until the user closes the port, serial8250_release_d=
ma()
>      terminates the channel without copying dma->rx_buf).

For a provider which never pauses or completes, retries cannot restore
reception. A request/response peer can indeed leave the descriptor
incomplete indefinitely, and closing the port then loses those bytes.
Backoff and diagnostics limit the retry cost and expose the stall; they do
not solve that liveness problem.

For pause-capable hardware, a recovery timeout does not have to prove
that the failure is permanent. The concern is what happens after that
timeout: the current recovery path discards the pending transfer and
leaves RX on PIO until reopen.

Is there a recovery approach that avoids an indefinite RX stall without
turning a potentially temporary pause failure into loss of DMA for the
rest of the open session?

>    - UART RX remains permanently dead with RLSI/RDI masked and never fall=
s
>      back to PIO.
>    - serial8250_rx_dma_flush_work() holds a runtime PM reference
>      (guard(serial8250_rpm)(p)) for the lifetime of the open port.
>    - On 8250_dw, dw8250_idle_enter() (8250_dw.c:151) sees
>      serial8250_rx_dma_flush(up) =3D=3D -EAGAIN and silently aborts
>      dw8250_set_divisor() and dw8250_check_lcr(), breaking baud-rate and
>      LCR updates while rx_pause_pending is stuck.
>
>    If serial8250_rx_dma_flush_work() escalates to serial8250_rx_dma_recov=
er(p)
>    under p->port.lock once the stall threshold is reached (or immediately=
 when
>    dmaengine_pause() returns -ENOSYS / -EOPNOTSUPP), dmaengine_terminate_=
sync()
>    safely stops the channel before any buffer state is released and the U=
ART
>    recovers on PIO instead of wedging until close().
>
> 2. Minor nit in drivers/tty/serial/8250/8250_omap.c:783-784:
>    In omap_8250_shutdown():
>      WRITE_ONCE(up->dma->rx_pause_wakeup, true);
>      wake_up(&up->dma->rx_pause_wait);
>    8250_omap uses its own synchronous omap_8250_rx_dma_flush() and never
>    schedules rx_flush_work or sleeps on rx_pause_wait, so those two lines
>    in omap_8250_shutdown() can be dropped.
>
> Thanks,
> Raul
