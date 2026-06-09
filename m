Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AC540D577
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 22:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781045401; cv=none; b=e9W+OLMggPy2jZDGux+udGNsjHdqXwGqY++gOEJDz9w0H0GFYl/oeZZX01M7z11IFj6yfLt5xBKJoQtMNpxAuYyNJGA4HbxAdrxouGJ+frrOKGukge4T1ot8bl8sBnPgZzAwu/SqzffYnrNP/4CLzZSWlAWDgR3dj1HiNluBTC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781045401; c=relaxed/simple;
	bh=goJ7vEDHfYr3jOSGRacMEVJ1eUJ5jLZ/rMyhvDXAx+s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lDwqoyaQmXF5fKaKCCkGXgns12HWGgjL0TqKiPMobs80IHkoOcyZwzUzmLmveJUIX8ppykkakz44oDhFItsHCa1rvTTZqKbZuNzP2vn9ikA1iZjv5bar9oG+GigoDABnP5lbgwYqL/oy2CE4jnrF06kIu2dCC7YrIJ0x57NAK/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGemDq4n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGemDq4n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDD861F00893;
	Tue,  9 Jun 2026 22:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781045399;
	bh=24YFFV+86DRaAAU6eAuNaKZM5kppWq+h/veil4pVwhE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LGemDq4nGcrrg8MxPLMvq1zBKuiMGEK1AkdUyGX3FLCwq4LMHtW1XC9Xu/vv79ejH
	 wv8nNSZOliR9uH9lw8zsLjf/FLYvxY/IZu/3KAoEUo6Vn7nsVdzhadLAEnq+LxS12U
	 N1a67hiGCE63l1RtgAgGL8NSLmsFr277/1Dydu7BamkO7RJKcA+CGNOIhsVS4DFXrR
	 nTddRCPBQ70UequcuqyJWf9clYiZfbljdOdp8vktaes7BqZL09jkYoYuYcECclDwWh
	 O6eTkZCCmLpmdNMIqjxn+LiQoTVJNuNkRyfl+99d6K4QGWObXYbgeIoiFVreZJLi7W
	 eunonMd0j6v4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2 2/4] serial: mxs-auart: rework clock handling in
 mxs_get_clks and probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260609223717.41670-3-rosenp@gmail.com>
References: <20260609223717.41670-3-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 22:49:59 +0000
Message-Id: <20260609224959.BDD861F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Unconditional clock enablement in `probe` for non-ASM9260 devices =
causes a resource leak on driver unbind and defeats dynamic clock gating.

Pre-existing issues:
- [Critical] Out-of-bounds array write in error and remove paths due to mis=
matched array indexing (`pdev->id` vs `s->port.line`).
- [Critical] Missing bounds check on hardware-provided RX count leads to an=
 out-of-bounds read and information leak.
- [High] Missing explicit termination of in-flight DMA transfers causes Use=
-After-Free during shutdown/error.
--

commit 610c2d30ee113ae6d3222a8a5d42e3dc565ef441
Author: Rosen Penev <rosenp@gmail.com>

serial: mxs-auart: rework clock handling in mxs_get_clks and probe

This patch reworks the clock handling in the mxs-auart driver. It uses
devm_clk_get_enabled() for the AHB clock so its enable/disable lifetime
is managed by the driver model. It also moves the mod clock preparation
and enablement out of mxs_get_clks() and into the probe function.

> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auar=
t.c
> index 693b491f1e755..8d050ceb72d2f 100644
> --- a/drivers/tty/serial/mxs-auart.c
> +++ b/drivers/tty/serial/mxs-auart.c

[ ... ]

> @@ -1604,17 +1592,21 @@ static int mxs_auart_probe(struct platform_device=
 *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D clk_prepare_enable(s->clk);
> +	if (ret)
> +		return ret;
> +

[Severity: High]
This patch moves clk_prepare_enable(s->clk) from the ASM9260-specific porti=
on
of mxs_get_clks() to mxs_auart_probe(), which causes it to execute for all
device variants.

However, mxs_auart_remove() was not updated to unconditionally disable the
clock. Does this leak the clock reference for non-ASM9260 devices on unbind?

Additionally, by holding a baseline clock reference from probe to remove,
might the clock's reference count never reach zero when the UART port is
closed? This would unconditionally keep the clock running and defeat the
driver's dynamic clock gating logic in mxs_auart_startup() and
mxs_auart_shutdown(), potentially preventing SoC deep sleep states.

[ ... ]

> @@ -1697,10 +1686,8 @@ static void mxs_auart_remove(struct platform_devic=
e *pdev)
>  	auart_port[pdev->id] =3D NULL;

[Severity: Critical]
This is a pre-existing issue, but I noticed a potential out-of-bounds array
write here.

During registration in mxs_auart_probe(), the allocated port pointer is
saved using the device tree alias index:

    auart_port[s->port.line] =3D s;

However, in the out_free_qpio_irq error path and here in mxs_auart_remove(),
the code clears the slot using auart_port[pdev->id] =3D NULL.

For devices instantiated from a Device Tree, pdev->id is typically -1
(PLATFORM_DEVID_NONE). Could writing to index -1 cause an out-of-bounds
memory write in the BSS segment immediately preceding the auart_port array?
Also, does this leave the actual active pointer dangling instead of clearing
it?

>  	mxs_auart_free_gpio_irq(s);
>  	iounmap(s->port.membase);
> -	if (is_asm9260_auart(s)) {
> +	if (is_asm9260_auart(s))
>  		clk_disable_unprepare(s->clk);
> -		clk_disable_unprepare(s->clk_ahb);
> -	}
>  }

[Severity: High]
This is a pre-existing issue, but I noticed a potential use-after-free
during shutdown or error handling in mxs_auart_dma_exit_channel():

    if (s->tx_dma_chan) {
        dma_release_channel(s->tx_dma_chan);
        s->tx_dma_chan =3D NULL;
    }
    ...
    kfree(s->tx_dma_buf);
    kfree(s->rx_dma_buf);

The driver fails to call dmaengine_terminate_sync() before releasing the
channels. Since releasing a channel does not safely abort active transfers,
if an asynchronous DMA transfer is in flight, could the DMA controller
continue operating and execute the DMA callback after the buffers have been
freed?

[Severity: Critical]
This is also a pre-existing issue, but does dma_rx_callback() lack a bounds
check on the hardware-provided RX count?

    count =3D stat & AUART_STAT_RXCOUNT_MASK;
    tty_insert_flip_string(port, s->rx_dma_buf, count);

The mask is 0xFFFF, allowing values up to 65535. The driver passes this
unfiltered count to tty_insert_flip_string(), which copies count bytes
from s->rx_dma_buf.=20

Since s->rx_dma_buf is allocated with a fixed size of UART_XMIT_SIZE
(4096 bytes), could a hardware fault or a compromised peripheral reporting
a count larger than 4096 cause an out-of-bounds read, potentially copying
up to 61KB of kernel memory to userspace?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609223717.4167=
0-3-rosenp@gmail.com?part=3D1
