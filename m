Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614BD3EF661;
	Tue,  9 Jun 2026 14:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016235; cv=none; b=JWDLv/uOcj6e+Cp0ruRbMJCFiSXXpMPpTGmcatAnkdhLlWqdvwPiEGFBlMJQsm0BWDKHqICWOJhDSoCdu+DCLk8ts5pqTerEtg8W/eqDof1wIjUTU35tL8z3EEGBfpW+3XsgEcI5lkwekOvLd6DNxkSlnIlgfVi09fS6H/SwI3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016235; c=relaxed/simple;
	bh=1H+cUW1edupGS0g8mZXAhIw6/4q2zltIS6IYaXA9F+4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KUi+tdYG+nC7MbhdjG70NLtMXTUXWGXNCnYMPQMlwE2Nzb+W86n24imJnzeDxZx/zZfcb/CIdBDuSXNbtfrrC9qBu1GTXGlVN20Bl83D1ffNVMh9gjXEaVOMEVTqs9BUaOGatBPeRq5/UPpPLEUysdMLDuCoRQNtjlwNL9lJiaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VxKAgrKO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VxKAgrKO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF781F00893;
	Tue,  9 Jun 2026 14:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781016234;
	bh=zP4jVeBxULzSrL9v67SKwbn6qyRydyuRo3D+0gHsqZk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VxKAgrKOJICEajDCqR+1kwQ3ek3RqEpolXaIO8rwHClerSml81acxfw4cgAjpIZ3y
	 /+7kIlgZSMFKSvjt9Ku3EQNZQ94DqN+04gN+8ExfzQT3JkqFzNOGbjo4tHPMonuo1Q
	 VKAsAmC84xcVucGFGmgjKOc0GjDPLMIBr/PzS1Tv4GPFVIQU74Xvc3jJnuY6l6eJiP
	 Ci2z2G6f9BTyKbsPasXyh2ZPu7bbGn6SJ4Cn4NshofYiHi2B5pg+nmKUZcoe84V3v+
	 kmmZaCy3VycRu5AQ0lXBoNgCnTcZUQY8CN+Ku9LQ0XlM1C9dExc20cjQiCnCcf5eBx
	 f2PX9WeC/eJnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/8] can: flexcan: add FLEXCAN_QUIRK_IRQ_BERR quirk
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ciprian Costea" <ciprianmarian.costea@oss.nxp.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260609142954.1807421-6-ciprianmarian.costea@oss.nxp.com>
References: <20260609142954.1807421-6-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 14:43:52 +0000
Message-Id: <20260609144353.6BF781F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Concurrent lockless modification of `skb_irq_queue` due to mul=
tiple independent IRQ handlers.
--

commit 715613f4f6a66b4bd5ff74d8a150e7fa13ca4aa1
Author: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

can: flexcan: add FLEXCAN_QUIRK_IRQ_BERR quirk

This patch introduces the FLEXCAN_QUIRK_IRQ_BERR quirk for hardware that
has a dedicated interrupt line for bus errors and state changes. It adds
the flexcan_irq_esr() handler and updates IRQ enabling/disabling to
support the NXP S32N79 SoC.

> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -1300,6 +1300,22 @@ static irqreturn_t flexcan_irq_boff(int irq, void =
*dev_id)
>  	return handled;
>  }
> =20
> +/* Combined bus error and state change IRQ handler */
> +static irqreturn_t flexcan_irq_esr(int irq, void *dev_id)
> +{
> +	struct net_device *dev =3D dev_id;
> +	struct flexcan_priv *priv =3D netdev_priv(dev);
> +	irqreturn_t handled;
> +
> +	handled =3D flexcan_do_state(dev);
> +	handled |=3D flexcan_do_berr(dev);
> +
> +	if (handled)
> +		can_rx_offload_irq_finish(&priv->offload);
> +
> +	return handled;
> +}
> +

[ ... ]

> @@ -1902,6 +1919,13 @@ static int flexcan_open(struct net_device *dev)
>  			goto out_free_irq_boff;
>  	}
> =20
> +	if (priv->devtype_data.quirks & FLEXCAN_QUIRK_IRQ_BERR) {
> +		err =3D request_irq(priv->irq_err,
> +				  flexcan_irq_esr, IRQF_SHARED, dev->name, dev);

[Severity: Critical]
This isn't a bug introduced by this patch, but it expands a pre-existing
race condition to the S32N79 SoC by registering another concurrent hardware
IRQ handler.

Does registering multiple independent IRQ lines lead to concurrent lockless
modifications of the CAN rx-offload subsystem's skb_irq_queue?

If flexcan_irq_mb() and flexcan_irq_esr() trigger concurrently on different
CPUs:

CPU1 (flexcan_irq_mb)
flexcan_do_mb()
   can_rx_offload_queue_timestamp()
      __skb_queue_add_sort()  <-- lockless push

CPU2 (flexcan_irq_esr)
flexcan_do_state()
   can_rx_offload_queue_timestamp()
      __skb_queue_add_sort()  <-- concurrent lockless push

Or CPU1 could call can_rx_offload_irq_finish() (which splices the queue)
while CPU2 is pushing a new skb. Can this corrupt the doubly linked
skb_irq_queue pointers and cause kernel panics?

> +		if (err)
> +			goto out_free_irq_boff;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609142954.1807=
421-1-ciprianmarian.costea@oss.nxp.com?part=3D5
