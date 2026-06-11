Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C978B215075
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 03:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149781; cv=none; b=e4ndQYOQ8gskF0z9Hrb2h+N50BEzYjDrMK1ne8vcTf8h/oxknqp781QTVkQV+8pezLvFIk5oLbCXCkqAXM0SbVg6PfyldEF05hIbqt8DahF2Pobckwm5hMEzZFOOYYylbnNXtuT2t3QlMJUiMtsGdqV1njU8xXEJIhyFgl6OKjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149781; c=relaxed/simple;
	bh=4ZwBCAoEfg/JaVHSN22rQqyduthmvWLdRUc+4d5fGXs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RabnB74qqHwO//vj/mvxD6p0fy3JMtsFTivw+tSI7AnJ8JUmZ4Uzvy1Bs05yi/mqpnosQJ6gcw4FMkU0Fgt0Dao9LMEmdcx0jsNdXz8ATN60qivEkaJcmx/BYPZrIMZO41O4C0B3FfJBd7D6Vq1B9scAMMpwGFnRg6ru+ILgBM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgAhymLL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgAhymLL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C2C71F00893;
	Thu, 11 Jun 2026 03:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781149780;
	bh=TqB7UH4cGoUzJ8ktWCe32tp7zB9XHh7bWv5xBjX26g8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bgAhymLLEr8tpLv4HLhe+BnpJypulJvkFUmDvOr8pReSm4G4htJi+8MtgB7QMZt2b
	 TM/o8xecE1dpCMn0V+slq2dLF2dbYTbP5KnSg15RRlvAWl7YKsN1qjrCpJGt0C6tfJ
	 AqhCU+OKhJWYZfdyYo5k6dmY+udL+Dx+5AJQaTnF956DnR3rZrx+GX2uZhNWXMJR2i
	 Ld+RokxcB6f7OXmpqAnDECeS9DgCpywrIa0dw01XcZBWDC/4zfLohhHnWp3oiz99CQ
	 if5yyp4DbX74hXmeUCxHCu7KoNIksw/uYfyzutBQQgtxaWe0lUFUrozz3HLe/GOboU
	 EWKP0V4VuIA6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3 5/6] serial: mxs-auart: clamp RX DMA count to buffer
 size
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260611033856.6476-6-rosenp@gmail.com>
References: <20260611033856.6476-6-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 03:49:39 +0000
Message-Id: <20260611034940.3C2C71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds array write to the global `auart_port` array during =
error handling and removal due to `pdev->id` being `-1`.
- [High] The driver frees DMA buffers and releases channels without first t=
erminating active DMA transfers, leading to potential memory corruption or =
use-after-free in asynchronous callbacks.
- [High] If `mxs_auart_dma_tx()` fails, the error is ignored, leaving `MXS_=
AUART_DMA_TX_SYNC` set forever and locking up TX. Additionally, popped FIFO=
 data is permanently lost.
- [Medium] Attempting to free an unallocated GPIO IRQ on error rollback tri=
ggers a kernel warning.
- [Medium] DMA mappings are leaked in `mxs_auart_dma_prep_rx()` and `mxs_au=
art_dma_tx()` if the DMA engine descriptor preparation fails, and `dma_map_=
sg()` return values are unchecked.
--

commit 5c41f469d68450e9f6b63b5ed62412e5d03637ef
Author: Rosen Penev <rosenp@gmail.com>

serial: mxs-auart: clamp RX DMA count to buffer size

In dma_rx_callback(), the rx count from the hardware status register
is passed directly to tty_insert_flip_string() without any bounds check.
Since rx_dma_buf is allocated with the transmit size, a hardware fault or
compromised peripheral reporting a large count would cause an out-of-bounds
read. This clamps the count before use to prevent leaking kernel memory.

> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auar=
t.c
> index 693b491f1e755..7e5348e5d63f4 100644
> --- a/drivers/tty/serial/mxs-auart.c
> +++ b/drivers/tty/serial/mxs-auart.c
> @@ -819,7 +819,7 @@ static void dma_rx_callback(void *arg)
>  	stat &=3D ~(AUART_STAT_OERR | AUART_STAT_BERR |
>  			AUART_STAT_PERR | AUART_STAT_FERR);
> =20
> -	count =3D stat & AUART_STAT_RXCOUNT_MASK;
> +	count =3D min_t(u32, stat & AUART_STAT_RXCOUNT_MASK, UART_XMIT_SIZE);
>  	tty_insert_flip_string(port, s->rx_dma_buf, count);

[Severity: High]
This is a pre-existing issue, but does this callback risk a use-after-free
if a dma transfer is in progress during shutdown?

When the uart is shut down, mxs_auart_dma_exit_channel() frees the buffers:

mxs_auart_dma_exit_channel() {
    ...
    kfree(s->tx_dma_buf);
    kfree(s->rx_dma_buf);
    ...
}

It appears this happens without calling dmaengine_terminate_sync() or
dmaengine_terminate_all(). Could a hardware dma controller continue writing
to the freed memory, or a pending tasklet invoke dma_rx_callback() and
dereference s->rx_dma_buf after it is freed?

> =20
>  	mxs_write(stat, s, REG_STAT);

[Severity: High]
This is a pre-existing issue, but can the global auart_port array be
corrupted during error handling or removal?

When instantiated via device tree, pdev->id is implicitly -1. In
mxs_auart_probe(), the port is safely registered using its device tree
alias id:

mxs_auart_probe() {
    ...
    auart_port[s->port.line] =3D s;
    ...
}

However, the cleanup path and mxs_auart_remove() attempt to clear the
array entry using pdev->id:

mxs_auart_probe() {
    ...
out_free_qpio_irq:
    auart_port[pdev->id] =3D NULL;
}

Could this result in an out-of-bounds write to the array at index -1,
corrupting adjacent memory?

[Severity: Medium]
This is a pre-existing issue, but does the rollback loop in
mxs_auart_request_gpio_irq() attempt to free an unallocated irq?

When request_irq() fails, the loop increments before exiting:

mxs_auart_request_gpio_irq() {
    ...
    for (i =3D 0; !err && i < UART_GPIO_MAX; i++) {
        ...
        err =3D request_irq(irq[i], ...);
    }
    ...
}

The subsequent cleanup loop then decrements:

    while (err && (i-- > 0))
        if (irq[i] >=3D 0)
            free_irq(irq[i], s);

If request_irq() fails for index N, the for loop leaves i at N + 1. The
cleanup loop's first iteration operates on i =3D N, calling free_irq() on t=
he
interrupt that just failed to request. Does this trigger a warning for
trying to free an already-free irq?

[Severity: Medium]
This is a pre-existing issue, but do mxs_auart_dma_prep_rx() and
mxs_auart_dma_tx() leak dma mappings on failure?

In both functions, dma_map_sg() is called without checking its return value.
If dmaengine_prep_slave_sg() subsequently fails, the functions return
early:

mxs_auart_dma_prep_rx() {
    ...
    dma_map_sg(...);
    desc =3D dmaengine_prep_slave_sg(...);
    if (!desc) {
        dev_err(s->dev, "step 2 error\n");
        return -1;
    }
    ...
}

Should these failure paths call dma_unmap_sg() to prevent leaking mapping
entries and address space?

[Severity: High]
This is a pre-existing issue, but does ignoring the return value of
mxs_auart_dma_tx() risk permanently locking up transmit?

In mxs_auart_tx_chars(), data is popped from the fifo before calling
mxs_auart_dma_tx():

mxs_auart_tx_chars() {
    ...
    i =3D kfifo_out(&port->state->xmit.fifo, ...);
    if (i) {
        mxs_auart_dma_tx(s, i);
    } else {
    ...
}

If mxs_auart_dma_tx() fails and returns an error, mxs_auart_tx_chars()
ignores the return value and leaves the transmit sync flag set.
Will subsequent calls to mxs_auart_tx_chars() return immediately,
locking up the transmit path? Is the data popped from the fifo also
permanently lost?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611033856.6476=
-6-rosenp@gmail.com?part=3D1
