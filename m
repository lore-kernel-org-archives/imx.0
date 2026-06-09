Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971F835E1CA;
	Tue,  9 Jun 2026 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016178; cv=none; b=PM/ej98brH++SNcJmq8yVy/RCGQYLYP8uZnaq/IlYp/XyGPcupnTVnzKXZaFBAZ+keOYC3FzMZBHwyaNsmT7RvppDgTa4n3xJXw2IQpdUEy+4fmtaLG6kn2vaTWWexhODZJfcdeX4aeMPgzykmchuGrJd4Hri40Yf8kkuzFiJdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016178; c=relaxed/simple;
	bh=XOgJc3/qEaqHa3sWn8FEDI4RKE3UnBRG8+u8n/8EYtE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QIqrfdRHXpl17OH8EbcXX+8cwAZW6tpO2dUlQ+e37AmGpw61PtJui+UTRLGkXvCCjhv8/iMYydLvrV8NwgewLWybDGS517RjArDKWVItPrrkPHP3gr9OqSEF6igKZ/85/AaOdZLx4RGnOMb7nAALtPTmKJV0LiHRHCwHm8aOvdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LclZ5z2S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LclZ5z2S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0921F00893;
	Tue,  9 Jun 2026 14:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781016177;
	bh=aXGqLWFVx0iv5B/ESwngJKCkZeLpcm1xdXGVEtTA95Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LclZ5z2SYyBLTtTHXUHWrwhZWviGcbQ3CFLM47y6oHrnti5hXbfjHUjTdSh1HM1ot
	 x/IsVFQf7PoPUTqF7YILEgWHXx4GDgIEco0kYYw0wP8lCn3GfPwiUmULVe2G9RNr/5
	 4M1azpd7nFYbrAkTikS1z2mZNqPT7Al0nfJtFSHsOo4Innnxy9q7b1ORIJnwGXienS
	 swfNvwHLymYZbjR/hgOTUXewxiFNuDJBsH/7gKNRonvXHzgS0X4ZWzTiCFU6n5mIpf
	 DsCBXx+UOE00akS5NmqeQ/i+FX3etVeIShwaUX+Ccv3nlbZsWiutWthjVMpQbefhoN
	 FAzSPRyQJxpMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/8] can: flexcan: disable all IRQ lines in
 flexcan_chip_interrupts_enable()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Costea" <ciprianmarian.costea@oss.nxp.com>
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260609142954.1807421-3-ciprianmarian.costea@oss.nxp.com>
References: <20260609142954.1807421-3-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 14:42:56 +0000
Message-Id: <20260609144256.EC0921F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The bus-off recovery worker (`can_restart_work`) can execute concu=
rrently with the hardware teardown in `flexcan_close()`, leading to an unha=
ndled interrupt storm on a shared IRQ line.
--

commit fd331d38665dbbf68f2818faa72e3515deb0d5b3
Author: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

can: flexcan: disable all IRQ lines in flexcan_chip_interrupts_enable()

This commit modifies flexcan_chip_interrupts_enable() to disable all regist=
ered
IRQ lines around IMASK and CTRL register writes. Previously, only the prima=
ry
IRQ line was disabled, which left additional multi-IRQ lines active and cou=
ld
allow handlers to fire while registers were inconsistent.

> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index f73ff442d5304..7dde2e623defe 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -1519,14 +1519,28 @@ static void flexcan_chip_interrupts_enable(const =
struct net_device *dev)
>  {
>  	const struct flexcan_priv *priv =3D netdev_priv(dev);
>  	struct flexcan_regs __iomem *regs =3D priv->regs;
> +	u32 quirks =3D priv->devtype_data.quirks;
>  	u64 reg_imask;
> =20
>  	disable_irq(dev->irq);
> +	if (quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
> +		disable_irq(priv->irq_boff);
> +		disable_irq(priv->irq_err);
> +	}
> +	if (quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ)
> +		disable_irq(priv->irq_secondary_mb);
> +
>  	priv->write(priv->reg_ctrl_default, &regs->ctrl);
>  	reg_imask =3D priv->rx_mask | priv->tx_mask;
>  	priv->write(upper_32_bits(reg_imask), &regs->imask2);
>  	priv->write(lower_32_bits(reg_imask), &regs->imask1);
>  	enable_irq(dev->irq);
> +	if (quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ)
> +		enable_irq(priv->irq_secondary_mb);
> +	if (quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
> +		enable_irq(priv->irq_boff);
> +		enable_irq(priv->irq_err);
> +	}
>  }

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for
flexcan_chip_interrupts_enable() to be called after flexcan_close() has
already freed the IRQs?

If the bus-off recovery worker (can_restart_work) runs concurrently with the
hardware teardown in flexcan_close(), could it trigger an interrupt storm?

flexcan_close() frees the requested IRQs and stops the chip, and then calls
close_candev():

drivers/net/can/flexcan/flexcan-core.c:flexcan_close() {
	...
	free_irq(dev->irq, dev);
	can_rx_offload_disable(&priv->offload);
	flexcan_chip_stop_disable_on_error(dev);

	can_rx_offload_del(&priv->offload);
	flexcan_transceiver_disable(priv);
	close_candev(dev);
	...
}

Because close_candev() is where cancel_delayed_work_sync(&priv->restart_wor=
k)
is called, the worker can execute while flexcan_close() is running.

If the worker executes its hardware initialization after free_irq() is call=
ed
but before close_candev() cancels it:

can_restart_work()->flexcan_set_mode()->flexcan_chip_interrupts_enable()

Will this re-enable chip-level interrupts while no handler is registered,
permanently disabling the shared IRQ line via the kernel's spurious interru=
pt
detector?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609142954.1807=
421-1-ciprianmarian.costea@oss.nxp.com?part=3D2
