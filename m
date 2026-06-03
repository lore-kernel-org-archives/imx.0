Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7601240963B;
	Wed,  3 Jun 2026 07:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471753; cv=none; b=DLsB7BUv28MRjPHrbAAg+ItyzZTSJCQOedEqrlswPQCqhDeMzb1N7argT2862HJ7L2hYp+6QuKQarNAy4KkwXcImyOxFbs65Lt+IuSc/ot4eT1NsRQdwpdQYst8Ag+oQz0K2i2eW2KlSotZlkwgdhHOYPvgXLTI8Sa7oTqOlAII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471753; c=relaxed/simple;
	bh=LWiz2BU+RNYs3LAziMHIFL+WHdk9N5rbQMYNmXHDMVA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IpNCoCuhQvg2KqPJythYNlWq0wb1ps5o6KymFNlFb0Va6jbJ+Lm34KAnjN39oR/puHB/O39k5gEiy6o0o5vEANrkANTneE4SODht5AX8Z3gOF8MtYSakKcSE/6TOYXQAZ4+9U9/xiF1pxFdSX/U8AxzHjTCk/JZTPtN1uYOC83c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R8/QLjWv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R8/QLjWv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C9EF1F00893;
	Wed,  3 Jun 2026 07:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780471750;
	bh=WJ89UtOGtVsAGMkbaiUhf2lg9r4mGw2Q0ayuN1SACjE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R8/QLjWvg17WN76YxMt5WUOtSJwboY6pszbUq7Q+d25m9Bqwontdel/dOjB7Pw+0C
	 pSUAV4HjGpZgHdOTUKpH6sA9cfPv6joNCoZqWwd6hM81jumeKmJ4+CO4vEPxvQCzMt
	 exYzB1zY3QhXiDQEX3yUsa0/jrlaQUVDKeSCj3Yn0YwzE/Q5ifw6w8Hzi8eFuOzpQF
	 qdMTfXP9CBfuL6AHdX7IpC9wcwYGOUtf+3t4wbQTUIaMM/FeryimdX4jxhjDq1AWdj
	 w954kJZWYO91GRL9+Gm+Xapt+Jclo/7Brt6GB3vIHRw6k5ZA3Bu4uwXqu4G76vJDUt
	 OxqO7gaCQCUmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v4 1/8] can: flexcan: use dedicated IRQ handlers
 for multi-IRQ platforms
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Costea" <ciprianmarian.costea@oss.nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603071342.641874-2-ciprianmarian.costea@oss.nxp.com>
References: <20260603071342.641874-2-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 07:29:08 +0000
Message-Id: <20260603072909.0C9EF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The split IRQ handlers break the `FLEXCAN_QUIRK_BROKEN_PERR_STATE`=
 workaround on multi-IRQ platforms, causing silent error state transitions =
to go undetected.

Pre-existing issues:
- [Critical] Concurrent execution of split IRQ handlers on multi-IRQ platfo=
rms causes unsynchronized lockless list corruption in `skb_irq_queue`.
--

commit 1073dfa63bf3a027c9286d2f8ca8d2cf503134a2
Author: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

can: flexcan: use dedicated IRQ handlers for multi-IRQ platforms
   =20
On platforms with multiple IRQ lines (S32G2, MCF5441X), all lines are
registered to the same flexcan_irq() handler. Since these are distinct IRQ
numbers, they can be dispatched concurrently on different CPUs. Both
instances then read the same iflag and ESR registers unconditionally,
leading to duplicate frame processing.

> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index f5d22c61503fa..f73ff442d5304 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c

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
Does this change break the FLEXCAN_QUIRK_BROKEN_PERR_STATE workaround on
multi-IRQ platforms?

Before this patch, the single monolithic flexcan_irq() mitigated the hardwa=
re
erratum by unconditionally polling the error state via flexcan_do_state() on
every interrupt. By leveraging frequent mailbox TX/RX events, it could dete=
ct
silent state transitions.

With dedicated handlers, flexcan_irq_mb() now exclusively processes mailbox
events and skips calling flexcan_do_state(). Since the hardware bug prevents
the boff interrupt from firing during state transitions, will the device now
silently enter Error Passive or Bus Off without the software noticing?

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
This is a pre-existing issue, but does concurrent execution of these split =
IRQ
handlers on multi-IRQ platforms cause unsynchronized lockless list corrupti=
on?

On platforms with multiple IRQ lines, the distinct hardware interrupts (such
as MB and BERR) can be dispatched concurrently on different CPUs. The handl=
ers
flexcan_irq_mb() and flexcan_irq_berr() concurrently invoke can_rx_offload
functions. For example, flexcan_irq_berr() eventually calls
can_rx_offload_queue_timestamp() via flexcan_irq_bus_err().

These offload functions call __skb_queue_add_sort(&offload->skb_irq_queue, =
...),
which performs unsynchronized doubly-linked list pointer manipulation. Since
there are no locks protecting skb_irq_queue, concurrent enqueues from
different CPUs can corrupt the list pointers, resulting in use-after-free
or kernel panics.

While this patch explicitly tries to fix duplicate processing caused by
concurrency, the concurrent pushes to the lockless skb_irq_queue seem to
remain unhandled.

> +
> +	if (handled)
> +		can_rx_offload_irq_finish(&priv->offload);
> +
> +	return handled;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603071342.6418=
74-1-ciprianmarian.costea@oss.nxp.com?part=3D1
