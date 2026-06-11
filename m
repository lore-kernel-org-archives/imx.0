Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC057335066
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 04:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781150406; cv=none; b=MnYBGoVps+7v4JqI0vkcP5HdT9xmg6x8Yxo+uCnkOOIRqRXgsHXeDNcqrAtmpPzaSOF9GEyqHLOafv9zvHcunjVPd/YPJ5N/10csKB4ZGgQoYhchZhrUZuVeCmRiIRtq+I8OYlckjaYvfWyG2Z/to+aQQRGDzrkciRzyJZYyDkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781150406; c=relaxed/simple;
	bh=nBsbC12eXaI8QGE7Sqjgv+jCK0NLhG+vzRzQPi91XvI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kPlspvkh952UcqmXqz425jactpBvCE39NDXcAVZoZQL7oqZPpBNsoJ+cCEFqqLEAIsXSu7OdaG2LT2qSf3NQKUcnDPImG25/nBk7HLkCp0y000RHJkWu1znuLiIpo6r+O+/dHWafvrG1eKqL3n+2kdCHy3oPIjbV+yooqx73mB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kdE5Q41d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdE5Q41d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CDAE1F00893;
	Thu, 11 Jun 2026 04:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781150405;
	bh=CZhpETWEWooTfkFKAr7gGLF1rm75Z/PeRMMDKng3bE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kdE5Q41dv8rwy+41mYrrYH7IhhlPOJ1T0kQpJysgSRXI3sP7AltlY17HUn+X7J2fk
	 lqoWTTGc/8d4pQYJ/kJm4p/VVbM67Fk06vfJAggpuPpwTrzoA7iuN2ipwLJXBI7l4q
	 dy7jEGhd6Gk8nmtD6I9rQpmCWV4jo/4tITYagOAHU++7Nnza1gjfRHni1Ju2J6bHH/
	 ByNCEJEikej6LSahB6x55Rf/zd6Dg0+O+g7x/Ug3mr5xQlwzcyYNbW4PUMWD1RJDk7
	 sjvT6Ho9hqxwjYrlrub58/TrH7DG/FYWLJABkoubKquyG02pJW/1ScHSfgJCfNP7AU
	 GWptgHYKCr2UA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3 6/6] serial: mxs-auart: terminate DMA before releasing
 channels in exit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260611033856.6476-7-rosenp@gmail.com>
References: <20260611033856.6476-7-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 04:00:04 +0000
Message-Id: <20260611040005.1CDAE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Terminating DMA transfers prevents their completion callbacks from=
 executing, permanently leaking DMA scatterlist mappings.
- [High] The MXS_AUART_DMA_ENABLED flag is cleared too late, allowing concu=
rrent callbacks and transmit operations to trigger a use-after-free and NUL=
L pointer dereference on DMA channels/buffers.
- [High] Missing port lock in `mxs_auart_settermios` causes a read-modify-w=
rite race on shared hardware state.
- [High] DMA mappings are leaked on error paths in `mxs_auart_dma_tx` and `=
mxs_auart_dma_prep_rx`.
--

commit 0b036d5417b4eadfea5ff0f7490fcbdee3bda8bf
Author: Rosen Penev <rosenp@gmail.com>

serial: mxs-auart: terminate DMA before releasing channels in exit

The commit adds dmaengine_terminate_sync() to safely abort pending transfers
before releasing channels and freeing buffers, fixing a potential
use-after-free.

> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auar=
t.c
> index 693b491f1e755..a853fb908591f 100644
> --- a/drivers/tty/serial/mxs-auart.c
> +++ b/drivers/tty/serial/mxs-auart.c
> @@ -868,10 +868,12 @@ static int mxs_auart_dma_prep_rx(struct mxs_auart_p=
ort *s)
>  static void mxs_auart_dma_exit_channel(struct mxs_auart_port *s)
>  {
>  	if (s->tx_dma_chan) {
> +		dmaengine_terminate_sync(s->tx_dma_chan);

[Severity: High]
This isn't a bug introduced by this patch, but does terminating the transfe=
rs
here lead to a leak of DMA scatterlist mappings?

The driver maps the DMA buffers using dma_map_sg() when preparing RX and TX
transfers, and only unmaps them inside the completion callbacks
(dma_rx_callback and dma_tx_callback).

Because dmaengine_terminate_sync() explicitly aborts pending transfers, the
dmaengine API guarantees that their completion callbacks will not be invoke=
d.
As a result, the dma_unmap_sg() calls are skipped, leading to a persistent
leak of DMA mapping resources (e.g., IOVA space or SWIOTLB bounce buffers)
every time active transfers are terminated.

Furthermore, is it safe to call kfree() on memory while it is still actively
mapped via the DMA API?

>  		dma_release_channel(s->tx_dma_chan);
>  		s->tx_dma_chan =3D NULL;
>  	}
>  	if (s->rx_dma_chan) {
> +		dmaengine_terminate_sync(s->rx_dma_chan);
>  		dma_release_channel(s->rx_dma_chan);
>  		s->rx_dma_chan =3D NULL;
>  	}

[ ... ]

[Severity: High]
This is a pre-existing issue, but does clearing the MXS_AUART_DMA_ENABLED f=
lag
after freeing the buffers open a window for a use-after-free and NULL point=
er
dereference?

In mxs_auart_dma_exit(), mxs_auart_dma_exit_channel() is executed before the
MXS_AUART_DMA_ENABLED flag is cleared:

mxs_auart_dma_exit() {
    ...
    mxs_auart_dma_exit_channel(s);
    s->flags &=3D ~MXS_AUART_DMA_ENABLED;
}

Because this teardown is not protected by the port spinlock and can be invo=
ked
dynamically via mxs_auart_settermios(), it can race with concurrent transmit
operations.

Specifically, mxs_auart_tx_chars() (called under the port lock) checks
auart_dma_enabled(s), which will incorrectly return true. It then attempts =
to
access the freed s->tx_dma_buf and initiates a transfer on the NULL
s->tx_dma_chan via mxs_auart_dma_tx().

Should the MXS_AUART_DMA_ENABLED flag be cleared under the port spinlock
before dismantling the DMA channels and freeing the buffers?


[Severity: High]
This is a pre-existing issue, but is there a read-modify-write race on shar=
ed
hardware state in mxs_auart_settermios()?

The serial core calls the driver's .set_termios callback without holding the
port spinlock. The mxs_auart_settermios() function reads the shared hardware
register REG_CTRL2, modifies it locally, and later writes the full 32-bit
value back without holding uart_port_lock(&s->port):

mxs_auart_settermios() {
    ...
    ctrl2 =3D mxs_read(s, REG_CTRL2);
    ...
    mxs_write(ctrl2, s, REG_CTRL2);
}

If a concurrent context like mxs_auart_start_tx() or mxs_auart_stop_tx()
(which correctly hold the port lock) uses hardware-atomic bit operations
to enable or disable the transmitter during this window,
mxs_auart_settermios() will overwrite REG_CTRL2 with a stale cached value.

Can this unintentionally undo concurrent hardware changes and lead to a sta=
lled
transmitter or receiver?


[Severity: High]
This is a pre-existing issue, but do the error paths in mxs_auart_dma_tx()
and mxs_auart_dma_prep_rx() leak DMA mappings?

The driver maps its DMA buffers via dma_map_sg() in both functions. If the
subsequent calls to dmaengine_prep_slave_sg() fail (e.g., due to descriptor
exhaustion), the driver immediately returns an error without calling
dma_unmap_sg():

mxs_auart_dma_tx() {
    ...
    dma_map_sg(s->dev, sgl, 1, DMA_TO_DEVICE);
    desc =3D dmaengine_prep_slave_sg(channel, sgl,
        1, DMA_MEM_TO_DEV, DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
    if (!desc) {
        dev_err(s->dev, "step 2 error\n");
        return -EINVAL;
    }
    ...
}

Does this permanently leak the DMA mappings (such as IOMMU entries or SWIOT=
LB
bounce buffers) every time the preparation fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611033856.6476=
-7-rosenp@gmail.com?part=3D1
