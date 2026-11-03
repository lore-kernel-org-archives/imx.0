Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793669023;
	b=JOCyfAbp4b3ROVnf13F/NIPLdUTdmNuNhckt7+aEq1q1jX+wyjKSI7EJjSjwQbmUL4Sq
	 AXkoul5uTZcoYj+9hdj8ytAUhzUWuzi+fyCJ0sl4WWuGeaUL8J8nLnEZ+6J2k6oNbVWQQ
	 nr4e0ApygF4A/Z6um55EbEQgLqsz9D36Mv1TWx0xFjoFhNH6m5kLIGgVr3mu+dUuCrxQI
	 ZLLd12B6LxYvUyagyezdQOwiL3H9SKJMxq3/BJBnyR8Nl/1Evw1mnSFgn6ztSi349r/eO
	 UHXjltxiJO7mh7wnWpHBSiSHSc7zHcEStGPio7WSX2jPGEHusXaSQoQDTdon59iOMkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=j6X54P/n20M1/zDVnxESincFUnXpjUB5mtxgldEc2PE=;
	b=cNWQpHTFEWptIoKeg+iwuzt+RDLCZA2B6bTdVPpGKIIo4pztuGD5w2O3hDM24Zt6+1pH
	 reeoGkgn33YpCaLZEKoyqEGVgmqHQsCBVYONCmoFANccT+JO32USFMgmEaxZ+ZvQC/VZ5
	 Pq7i4ce5CUQoL/XqNHaGf2NF9UWRWw1ysVZnn/MI338vpbTCtxetqme5ZOs1M0XCgRgm0
	 M0n6fxU77qYkDAF80qJFlNVE/xHkmUE8MlAIPCU+CStmiVc9o/8Ti9akOZ59AESx+Rvdi
	 r2nXDeNNSQrWyzEcyCQwVvIINcYfG0LZHGgVG5YwV3uRleFub/+GDDzoPMn2hFtcFxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fwqopPjx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A19D606A326
	for <imx@lists.linux.dev>; Tue,  3 Nov 2026 01:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A19D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fwqopPjx
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7cc7938c5e9so76193137.0
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 17:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793669022; cv=none;
        d=google.com; s=arc-20260327;
        b=bq+qtm31JgqekItT/DuUQimphZ3hoP7RLQPnwUq4UkfUwPTwtWaGO1RGZVQ69mwfC1
         yIJwGI2kra0dbwSY/DxMSP++6TQwWRnRyh3pZ8Wl2HoJDf9cUTHqFZ3AbwF2WDtDV7U+
         dZi8Rd2i7vgF1SRkmbKrs+6B0gXThJvXv9sacn4WzV1KHQGy4/JwSlx3nMuvuI9ilBQQ
         Psh6vNUcZCH9oBoy5BlTf/rmjW3tLQFpa8qcCuSub4QlcfG1ZO9yxoj2mUPSR2Ig35tu
         7DT2dlMIMbGFX/+ZaOxfpZ0C3aZ5tjwSpUUdLenIoQUOl6t4F6X1frDRgNKr1vKCyU1D
         VCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j6X54P/n20M1/zDVnxESincFUnXpjUB5mtxgldEc2PE=;
        fh=u9R+2xTSbEr0LQlnuSSyoKvB27AeZ9TzlPaJJ6EHFWU=;
        b=UuoJmIsKDSnysrwf6LjUNrbycOFQRfmmqqXYY5PetxHj8OpuXAE2q9wVaPPkuA0PK0
         gSXFopTo2FO9CIweaCaWZWftC3lhOWD6C/wk//9+o1q/JjeYmTjJ471UrqR0uhoiqknT
         zkjQvYKb4kSMWBX5j9THh6aG7yYPN5yyWs4JpZSBG2rxIM9AmoStpT8SFWYUTXbUHK/r
         5w2ekqBUNpnOevkrwxpW8I8iU/z0drTjqAc8k7e2lOAgQVfK2oP7ZT9grI/zt2HjUD9r
         IaLqwuU4EKBnfO+/+zHfn81hFwGgETjt+LS92rjtBf3ujYXsAaaIJu/6IG4OSrLLgU8j
         lljQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793669022; x=1794273822; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j6X54P/n20M1/zDVnxESincFUnXpjUB5mtxgldEc2PE=;
        b=fwqopPjxjEqBkWFwicGM9vauOlIRO000CH4dFu+3oBQplkJ0mrhM1zUgAuyGut3eIi
         jORZ7q5w03hkltWPjXcqR8/q3jR8eFBdZasPuBr5UlyilYtCaG21SOwXPNlR5wriMKMv
         cK9B42sbGFOrdbVMTdE2uP3foJ5jIVOFDjMD1vIVrcTgpuHrQIqZ6vRQ4DYwFaI7ytVz
         abInEXs78n5SA/JzCjcD237WPTDyVMR0kgJbacQgcOuOdWcy11YCTjGyqXoY52ySZqWv
         ZokWJIOvsiH6Q0Zw/dbLGXlk6ijhtkK4Ifm06amPLSHnta0TZlrO+Ply6LFuI0UShDUI
         Bsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793669022; x=1794273822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6X54P/n20M1/zDVnxESincFUnXpjUB5mtxgldEc2PE=;
        b=F8QveZm4/qz4aSlUzMlp+rK1bKsr+ISz/xtSCaGlXbO3ryM+pW3Fv5uMmtC2XQr1cB
         I9+6A/1hIxZ0q1ElSfm4E8r0SNfQss/zLpKtBgb48jqVLKuMizKkPQ6COFjM1t9Zcb2Z
         QXOcUIR3Oxx4FNLi2eLsbUaoBQXey+MgMgctE6wOHbSJZiZVeAvPlEI1jr0B/qMMsoen
         pSlcu9gd/GMry2slaRxYziWYCoOi2KF0yJ/FcUr/1TYwKIHyChZJuAsLGACfrf44U10S
         RW1onyOGCOuwCOUY82SDwfHCLRUx2GwmmLQhnoO9lyzsps2IzD6ID9Jsu/rYAeuP5GNy
         VyDQ==
X-Forwarded-Encrypted: i=1; AKwUvBz17AqX68M1EyElgboUL+kHj0JBFVc88usJzrMNiZF4BzrN7lYJXDGMPULC9zX81zGipFQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9zJKNyxvHMkcFvSPEglRqMqAH29BRiSmYYMjJGuSNOA+oisKAg
	zK4gqSG8uqQl1M9z9lXBKlZ3peE6z8DRoQsPCvC3U7pLUXy65vnrJ5JF7Eb53Lqyo4bN+j/J4zO
	YeWA1qSGJa0liq3rvVGyxgVJzmMgxuzY=
X-Gm-Gg: AYBFou0occYZxezsrVX7Q1V1AYRaAwZyzbAEjGsARlHwXVsbRyp6IKUH24asxbGdMm3
	yX1wtCW4ULhHO7Tpo/tJdEsfWOUWawQztcS+CzQrRfxs3HWfwepOIISgbB20QgbzmPFjv1XUv+t
	NYhTwdqTRJ3AroeLj+At5cINKsK9rZfumhAfJS+hWprayJ7cnDge8sFx/SxSLZD9VAcMo+lE6q5
	BF7NP4fS+D3mo1Q9R21fw2lL/YpEWA17klj8AHN0047b8TzdFSUYBc4VhyjMHpxJIx9HgNsQEhR
	yfje1wboYfLql2QjJIvg6Zufh1I78MnG28aEb+PanrHjBSoYJRuS8N4m57GaEHoUlh3ZRytlidh
	mng19MTZpVcld6W/TyG/he6/ZDwnUW5Yo3Z90CtHwnPJttACgtZEH3f6AGGkZuASeayHv3c4gqQ
	6Rv5xP+k1eEtLUzVwbuw0C+YZFuWiPYhKeSPBYidpJoU0AOeT9/PYyfhoTdq+7aAFDixlwyWAjw
	Cit17q34aOHJmFtFkmDakvTmQZ4sLqX/2g3wqpPQUWjjUGvVaw=
X-Received: by 2002:a05:6102:5cc8:b0:7c3:874d:60bb with SMTP id
 ada2fe7eead31-7d072bc027emr3228553137.5.1793669022111; Mon, 02 Nov 2026
 17:23:42 -0800 (PST)
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
 <20261102-submit-serial-8250-dma-cancel-v1-v9-7-9159caade148@gmail.com> <sashiko-outbox-194343@kernel.org>
In-Reply-To: <sashiko-outbox-194343@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 2 Nov 2026 18:23:30 -0700
X-Gm-Features: AclHuK_gt5lz7AswOV3gb8RGMWLh9TAATw8FhlHVD0RjFRvXQGOlI9L1gN2tR9Y
Message-ID: <CADvTj4rYqTXsZcSPfe7o1i_-nB1z1ZBkeySKua+f5CWR=7BzwA@mail.gmail.com>
Subject: Re: [PATCH v9 7/8] serial: 8250: retire canceled RX DMA before
 reusing the receive buffer
To: sashiko-reviews@lists.linux.dev
Cc: linux-serial@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 4:49=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] serial: 8250: unbounded pause retry loop in serial8250_rx_dma_fl=
ush_work()
> --
>
> commit 7216db0ad0fa3a64d9a52f2eff54fb53c9c43c75
> Author: James Hilliard <james.hilliard1@gmail.com>
>
> serial: 8250: retire canceled RX DMA before reusing the receive buffer
>
> This commit reserves the RX DMA receive buffer until a worker has drained
> canceled callbacks and adds retry and recovery logic for RX DMA pause and
> termination failures.
>
> > diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/82=
50/8250_dma.c
> > index 344f0dd24b416..fd2a0ed211657 100644
> > --- a/drivers/tty/serial/8250/8250_dma.c
> > +++ b/drivers/tty/serial/8250/8250_dma.c
> [ ... ]
> > +/* Try to obtain a stable residue before retiring the current descript=
or. */
> > +static int serial8250_rx_dma_try_flush(struct uart_8250_port *p)
> > +{
> > +     struct uart_8250_dma *dma =3D p->dma;
> > +     struct dma_tx_state state;
> > +     enum dma_status status;
> > +     int ret;
> > +
> > +     lockdep_assert_held_once(&p->port.lock);
> > +
> > +     ret =3D dmaengine_pause(dma->rxchan);
> > +     status =3D dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &stat=
e);
> > +     if (status =3D=3D DMA_ERROR) {
> > +             ret =3D -EIO;
> > +             goto recover;
> > +     }
> > +     if (ret && status !=3D DMA_COMPLETE) {
> > +             /*
> > +              * Hardware may be idle before the provider publishes com=
pletion.
> > +              * Leave the descriptor alive and retry outside interrupt=
 context;
> > +              * neither copying its buffer nor canceling it is safe ye=
t.
> > +              */
> > +             dma->rx_pause_pending =3D true;
> > +             serial8250_out_IER(p, p->ier);
> > +             return ret;
> > +     }
> [ ... ]
> > +static void serial8250_rx_dma_flush_work(struct work_struct *work)
> > +{
> > +     struct uart_8250_dma *dma =3D container_of(work, struct uart_8250=
_dma, rx_flush_work);
> > +     struct uart_8250_port *p =3D dma->port;
> > +     unsigned int delay_us =3D USEC_PER_MSEC;
> > +     ktime_t start =3D ktime_get();
> > +     bool recover, retry, restore_rx;
> > +     bool warned =3D false;
> > +     int ret;
> > +
> > +     guard(serial8250_rpm)(p);
> > +
> > +     for (;;) {
> > +             scoped_guard(uart_port_lock_irqsave, &p->port) {
> > +                     /* Shutdown cancels this work and drains both DMA=
 channels. */
> > +                     if (dma->shutting_down)
> > +                             return;
> > +                     /* Serialize reset with completion and shutdown n=
otifications. */
> > +                     WRITE_ONCE(dma->rx_pause_wakeup, false);
> > +                     retry =3D dma->rx_pause_pending && !dma->rx_termi=
nating;
> > +                     if (retry) {
> > +                             ret =3D serial8250_rx_dma_try_flush(p);
> > +                             retry =3D dma->rx_pause_pending && !dma->=
rx_terminating;
> > +                     }
> > +                     recover =3D dma->rx_err;
> > +             }
> > +             if (!retry)
> > +                     break;
> > +             if (!warned && ktime_ms_delta(ktime_get(), start) >=3D MS=
EC_PER_SEC) {
> > +                     dev_warn_ratelimited(p->port.dev,
> > +                                          "RX DMA pause stalled: %d; r=
etaining transfer and retrying\n",
> > +                                          ret);
> > +                     warned =3D true;
> > +             }
> > +             /* Notifications also cover completion or shutdown before=
 sleeping. */
> > +             wait_event_hrtimeout(dma->rx_pause_wait, READ_ONCE(dma->r=
x_pause_wakeup),
> > +                                  ns_to_ktime(delay_us * NSEC_PER_USEC=
));
> > +             delay_us =3D min(delay_us * 2, USEC_PER_SEC);
> > +     }
>
> [Severity: High]
> As reported by Raul E Rangel on v8 [1], when dmaengine_pause(dma->rxchan)
> persistently returns an error during a partial RX DMA transfer (where few=
er
> than dma->rx_size bytes have arrived and dmaengine_tx_status() remains
> DMA_IN_PROGRESS), serial8250_rx_dma_try_flush() sets dma->rx_pause_pendin=
g =3D
> true and masks RX interrupts via serial8250_out_IER().
>
> In serial8250_rx_dma_flush_work(), this causes the for (;;) loop to retry
> serial8250_rx_dma_try_flush() indefinitely until port shutdown instead of
> escalating to serial8250_rx_dma_recover() after a bounded retry budget.

The reason for retaining the descriptor is that a failed pause is not
necessarily a failed transfer. Hardware can finish receiving before the
provider publishes DMA_COMPLETE. At that point pause may fail because
there is no active transfer left to pause, while the cookie still
appears incomplete.

Treating that combination as fatal can discard an otherwise valid
receive buffer and disable RX DMA until reopen. The current approach
tries to preserve both the received data and the ability to continue
using DMA when the failure is transient.

Without a successful pause or reported completion, the consumer does
not yet have the stable receive snapshot needed for the normal flush.
The worker therefore retains ownership and retries after releasing
the port lock and enabling local interrupts, allowing the provider to
publish completion. Once pause succeeds or completion is reported, it
delivers the data and drains the old callbacks before buffer reuse.

The backoff limits repeated failed calls, while completion and shutdown
wake the worker without waiting for the next retry timeout. It does not
solve persistent pause failure: if the peer is idle and the provider
never pauses or completes, reception remains stalled. Retaining the
buffer is an ownership-safety measure, not a recovery guarantee.

> While a brief retry outside p->port.lock allows an already-completed tran=
sfer
> whose DMA interrupt was masked by p->port.lock to publish DMA_COMPLETE, o=
nce
> p->port.lock and local IRQs have been released across a few sleeps, any
> pending completion interrupt has already run. If dmaengine_pause() contin=
ues
> to fail while the remote peer is idle (for example, if dw-axi-dmac times =
out
> waiting for DWAXIDMAC_IRQ_SUSPENDED and leaves the channel hardware-suspe=
nded
> while returning -EAGAIN, or if tegra186-gpc-dma returns -ENOSYS when
> !hw_support_pause), dmaengine_tx_status() will never reach DMA_COMPLETE.
>
> While dma->rx_pause_pending remains stuck:
> - UART reception is permanently wedged until the port is closed because R=
X
>   interrupts stay masked in UART_IER and serial8250_rx_dma_recovering()
>   forces skip_rx =3D true in serial8250_handle_irq_locked(), preventing P=
IO
>   fallback.
> - serial8250_rx_dma_flush_work() holds a runtime PM reference via
>   guard(serial8250_rpm)(p) for the lifetime of the open port.
> - serial8250_rx_dma_flush() returns -EAGAIN, which causes dw8250_idle_ent=
er()
>   in drivers/tty/serial/8250/8250_dw.c to abort divisor and LCR updates:
>
> drivers/tty/serial/8250/8250_dw.c:dw8250_idle_enter() {
>         ...
>         if (up->dma) {
>                 ret =3D serial8250_rx_dma_flush(up);
>                 if (ret) {
>                         serial8250_out_IER(up, up->ier);
>                         d->in_idle =3D 0;
>                         return ret;
>                 }
>         ...
> }
>
> Since the recover path right after the loop in serial8250_rx_dma_flush_wo=
rk()
> already calls dmaengine_terminate_sync(dma->rxchan) and retains the buffe=
r
> with RX masked if synchronous termination fails, can this loop bound the
> number of pause retries and escalate to serial8250_rx_dma_recover(p) so t=
he
> port can terminate the transfer and fall back to PIO?

Successful synchronous termination would make subsequent buffer reuse
and PIO access safe under the DMAengine contract. The concern is not
that termination cannot establish safety, but that this recovery path
discards the pending data and sets rx_err until reopen.

A retry budget would make that an explicit, potentially lossy recovery
policy. It would not distinguish a permanent failure from a transient
one. However, continuing to retain ownership indefinitely also fails
to provide useful reception when the provider cannot recover.

The Tegra186 case should also be distinguished from a transient timeout:
advertising cmd_pause when the hardware cannot implement it allows
generic 8250 to select a DMA configuration whose requirements are not
met.

>
> [1] https://lore.kernel.org/r/20261029222734.3086943-1-rrangel@chromium.o=
rg
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-submit-s=
erial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com?part=3D7
