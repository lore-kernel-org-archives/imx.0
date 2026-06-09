Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F104927467F;
	Tue,  9 Jun 2026 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016442; cv=none; b=jReNQfy/QVakdxW/XRzClGZUWPr9l1Ulm2MMkQruRnkubfC7a7h1v6zwAeZ2yLtWGfWIfNwdzLMP8k0vdMU4tYtG9+Qy7SLkNL6a08AVuev/B/ZSL2TXr3zs7bai36iEUhU6RZ/LNJiAnwbqJbOt2LwNc8PKo5D7YDpaEZymK28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016442; c=relaxed/simple;
	bh=t1vpnAbSGLp820XpKVohutFbqnCjXOM6fCkXXfUgU5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UD6fIQUlxZweHjXWqUqokFxHtmPS9ub0uoaF5BkeAuvPBx7SziTvHdECFxEaOvm++YZhHAEojWA7OLrlqBu+wKfiyC5+EFPccWS7hXYLCYKDgMNUFOLP8JGwTYRVsNy0ZfYdz81SL8L5Zf8Su46XaJZfBLdC3E+5SIEDrF9jYM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2+UKtds; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2+UKtds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12A2A1F00893;
	Tue,  9 Jun 2026 14:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781016439;
	bh=f2ElMdd3tG0ARH5AemkW3ZjBi3gTUARKJouTd4J8JJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G2+UKtdsI6LTxIPdmiZT/Dh3tw+ekvHpsJcFIbXo89lnk8ygQfDzvSWsGO8o4Hxne
	 XJhYTPgeSWduG5BuuI4ZPxdoEIgTvSnscUd52T4nxWf+UA0rGksQjbFRjnTkA4Y7RG
	 aZpMFfCqeJ+Tod3Xq6NlLLhcvFhACNlMmSpmv3RiRo52zk04dQEXIGcc2Ku1BUE5Hc
	 tGWoMgbwgTjTNOTtk26JqAECPAlJ5xY5br9VSMghnDlnOqJSd4wb2GQ8UNuqzxR7Ga
	 HXsDhKWy1EVI4xKH5yRe/Fd049LPyMkvNP1wSIQIQSTwXz5dBBibzFoc7sxWUzlaq/
	 TpHJU6Vw+FzBQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/8] can: flexcan: use dedicated IRQ handlers for
 multi-IRQ platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Costea" <ciprianmarian.costea@oss.nxp.com>
Cc: imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609142954.1807421-2-ciprianmarian.costea@oss.nxp.com>
References: <20260609142954.1807421-2-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 14:47:18 +0000
Message-Id: <20260609144719.12A2A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Splitting the IRQ handlers breaks `FLEXCAN_QUIRK_BROKEN_PERR_STATE=
` polling and strands state change SKBs.

Pre-existing issues:
- [Critical] Concurrent execution of split IRQ handlers corrupts the lockle=
ss CAN `rx_offload` queue.
--

commit bffb52105dbcdcc01b5331e294239af017d43aeb
Author: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

can: flexcan: use dedicated IRQ handlers for multi-IRQ platforms

This patch splits the monolithic flexcan IRQ handler into focused parts
and introduces dedicated IRQ handlers for multi-IRQ platforms to prevent
duplicate frame processing.

> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index f5d22c61503fa..f73ff442d5304 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -1188,6 +1218,65 @@ static irqreturn_t flexcan_irq(int irq, void *dev_=
id)
[ ... ]
> +/* Mailbox IRQ handler for multi-IRQ platforms */
> +static irqreturn_t flexcan_irq_mb(int irq, void *dev_id)
> +{
> +	struct net_device *dev =3D dev_id;
> +	struct flexcan_priv *priv =3D netdev_priv(dev);
> +	irqreturn_t handled;
> +
> +	handled =3D flexcan_do_mb(dev);

[Severity: High]
By splitting the handler, does this break the FLEXCAN_QUIRK_BROKEN_PERR_STA=
TE
polling mechanism? Before this patch, the monolithic flexcan_irq() naturally
polled flexcan_do_state() during mailbox interrupts. Now that flexcan_irq_m=
b()
bypasses flexcan_do_state(), it seems state transitions might no longer be
polled during active CAN traffic.

> +
> +	if (handled)
> +		can_rx_offload_irq_finish(&priv->offload);
> +
> +	return handled;
> +}
> +
> +/* Bus error IRQ handler for multi-IRQ platforms */
> +static irqreturn_t flexcan_irq_berr(int irq, void *dev_id)
> +{
> +	struct net_device *dev =3D dev_id;
> +	struct flexcan_priv *priv =3D netdev_priv(dev);
> +	irqreturn_t handled;
> +
> +	handled =3D flexcan_do_berr(dev);

[Severity: Critical]
This is a pre-existing issue, but does assigning dedicated handlers to
different IRQ lines lead to concurrent modifications of the lockless
rx_offload queue?

Since flexcan_irq_mb() and flexcan_irq_berr() can run concurrently on
different CPUs, flexcan_do_mb() and flexcan_do_berr() might concurrently
call can_rx_offload_queue_timestamp().

That function uses __skb_queue_add_sort(), which is a lockless primitive
that assumes strictly serialized execution. Could this lead to doubly-linked
list corruption and kernel panics, further exacerbated by concurrent unlock=
ed
splices in can_rx_offload_irq_finish()?

> +
> +	if (handled)
> +		can_rx_offload_irq_finish(&priv->offload);
> +
> +	return handled;
> +}
> +
> +/* Device state change IRQ handler for multi-IRQ platforms */
> +static irqreturn_t flexcan_irq_boff(int irq, void *dev_id)
> +{
> +	struct net_device *dev =3D dev_id;
> +	struct flexcan_priv *priv =3D netdev_priv(dev);
> +	irqreturn_t handled;
> +
> +	handled =3D flexcan_do_state(dev);
> +
> +	if (handled)
> +		can_rx_offload_irq_finish(&priv->offload);

[Severity: High]
If flexcan_do_state() queues an SKB but returns IRQ_NONE (e.g., if no ESR
bits are set), will this skip the can_rx_offload_irq_finish() call and
strand the state change SKB in the lockless queue?

> +
> +	return handled;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609142954.1807=
421-1-ciprianmarian.costea@oss.nxp.com?part=3D1
