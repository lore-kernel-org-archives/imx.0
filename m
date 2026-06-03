Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DF24028D4;
	Wed,  3 Jun 2026 07:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780472957; cv=none; b=MVj6PKxsiLeKENwTuiPESGcePeuIU0H8AkO2LH3ImtUi4XDfd3cfLdMzVZCRKIKAIIOflCN3DawXyS4jbJ3JzrT6wtY6fAyTl3/IhWPlPEHze2LlKOxdmGNWB742aBdhrKvdSo3AYJPwtqPPVPED5/VNqxxZavY8FV9tc4nNIj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780472957; c=relaxed/simple;
	bh=7QfLCj4CFXaGqjEMraF0zwOXfqC1zNxZT6Sv/tKg4jE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=djL/6RitLIXWZC8Q+Cu17Q+1dISA+lxwq0rAi3cPVIV/w1qjJV3fRPVlfGApaGFYifc3VYmmciHqTtdDxpR1dRS0IngGJzDpuoMbuMC/V0YEndBUccA1YDA8GK0mmci/NDKTSb7j2NVvNC2i9BTzNgb9oBDy/DlIsG30lyN5L90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EvX+JWoP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EvX+JWoP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79391F00893;
	Wed,  3 Jun 2026 07:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780472953;
	bh=SrsAWmrYR664q6+w6BjEm8ng723polNmVzNatrN6XEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EvX+JWoP4PDftVYY4w+L+JaDAP2Bzq5+LxDB8OvLYckBb3DwnU07bxsFAi78FAr2b
	 c9Irl1ibHlLQElI+35qLI4RigzKVTAPl+B9zDsACjBd7Za2Y7IsMq03SMQKCW6pSu3
	 SaPcdxQY1mz9PDiDxX9Pgc5ZCvNInuFCKtvYNNBUplKpikGekVsveojg5MeGFD1y2L
	 u+v7dDrqWNU5W84Pm6GkdWK1G/S4Ycbb87vob+p1LzFLRxmAM48tHPRY3jCIzLD1/B
	 xNZZ2z9r8XoKoQiBAVM3QfwtDICd+Zxvp9j2kHzb7X4nMUbEB1/DwbHbJ+5xHjzWPz
	 jRIHkMQZHXSeA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v4 3/8] can: flexcan: split rx/tx masks per
 mailbox IRQ line
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Costea" <ciprianmarian.costea@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260603071342.641874-4-ciprianmarian.costea@oss.nxp.com>
References: <20260603071342.641874-4-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 07:49:12 +0000
Message-Id: <20260603074912.C79391F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent execution of mailbox IRQ handlers corrupts the lockless=
 `skb_irq_queue` list and tears network statistics.
--

commit bbe7c1e92a358fe90eaccbfc4dbbf6d74daadadd
Author: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

can: flexcan: split rx/tx masks per mailbox IRQ line

This patch splits rx and tx masks per mailbox IRQ line for platforms like
S32G2 which have multiple mailbox IRQs. It introduces a struct to hold these
masks and updates the IRQ handlers to use the correct subset, preventing bo=
th
handlers from processing the full mask range.

> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index 7dde2e623defe..32e4d4da00a1c 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
[ ... ]
> @@ -1243,9 +1247,15 @@ static irqreturn_t flexcan_irq_mb(int irq, void *d=
ev_id)
>  {
>  	struct net_device *dev =3D dev_id;
>  	struct flexcan_priv *priv =3D netdev_priv(dev);
> +	const struct flexcan_mb_irq *mb_irq;
>  	irqreturn_t handled;
> +	int idx;
> =20
> -	handled =3D flexcan_do_mb(dev);
> +	idx =3D (priv->devtype_data.quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ &&
> +	       irq =3D=3D priv->irq_secondary_mb) ? 1 : 0;
> +	mb_irq =3D &priv->mb_irq[idx];
> +
> +	handled =3D flexcan_do_mb(dev, mb_irq);

[Severity: High]
This isn't a bug introduced by this patch, but since the S32G2 platform
supports multiple mailbox IRQ lines (mb-0 and mb-1), can these handlers exe=
cute
concurrently on different CPUs?

Both handlers invoke flexcan_do_mb(), which eventually calls
can_rx_offload_irq_offload_timestamp() using the shared priv->offload
structure. This performs a lockless list insertion:

drivers/net/can/dev/rx-offload.c:can_rx_offload_irq_offload_timestamp() {
    ...
    __skb_queue_add_sort(&offload->skb_irq_queue, skb,
                         can_rx_offload_compare);
    ...
}

Because __skb_queue_add_sort() does not take internal locks, concurrent
execution by multiple hardirq handlers could corrupt the list pointers.

> =20
>  	if (handled)
>  		can_rx_offload_irq_finish(&priv->offload);

Furthermore, one handler might be concurrently splicing the list while the
other is inserting:

drivers/net/can/dev/rx-offload.c:can_rx_offload_irq_finish() {
    ...
    spin_lock_irqsave(&offload->skb_queue.lock, flags);
    skb_queue_splice_tail_init(&offload->skb_irq_queue, &offload->skb_queue=
);
    ...
}

Does the driver need to ensure mutual exclusion between the mailbox IRQ
handlers when accessing the shared skb_irq_queue?

> =20
>  	return handled;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603071342.6418=
74-1-ciprianmarian.costea@oss.nxp.com?part=3D3
