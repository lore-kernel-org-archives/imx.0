Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D609726738C
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 10:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481184; cv=none; b=ZP38VJ+E42q9GDJd1CbuRyM6wRf1MT5Dqmt3q/DoFyp9VNih32zjDTpY//poNVAfGbUl3HZG//NxRJ9l7CSRtdeAywFVgY1CcgqdNQ4KaCJHKps7YT3UC6XX7xArUjmPhLI1sqTbHLXAAREKjtAP1NAPdGRwy+rS9tMMFYzPR4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481184; c=relaxed/simple;
	bh=PVRWCeqoQfFcGEkI94WpSvOM/jrm67OKH/kG9CG7SK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KeO6tfrd3ETrEx675Dn+S+UbkEz8WWTA3K++NeW09w8cqtPh5WnBMrjTHI1o5dPZ5KxP7oCrj68ilX68rbT8ax0MWmpLLrB8Vy7CSzKeKfXTTX6ioRfvdSk6PzUgYTuiLGdVZu61q+wWQjX9fTgiQgkA5kF1uQg6heSK0JgE0Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jr6CD+G4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jr6CD+G4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780481181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=szmw41mx+6XBYQACHrQkcIv+dFLdnR82AVyDnrz/Mp4=;
	b=Jr6CD+G4ZCq5DpBh0Na1Lhx0/nU7Mgh49own1itI5AOhHF/ekDzjEsYvBc/gL6GQv6LA8N
	Fn0+P8QIzJkudfk0sCWisSu7lUy1JMYR5V/n351OdLw8iPj1fgFEQcfe5sDMGusA7DF8R5
	91tnGSdsd3kXkmgYb268uMTbUwFmLx0=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-1_Iej1jgMvGhOPZKAcq5Gw-1; Wed, 03 Jun 2026 06:06:19 -0400
X-MC-Unique: 1_Iej1jgMvGhOPZKAcq5Gw-1
X-Mimecast-MFC-AGG-ID: 1_Iej1jgMvGhOPZKAcq5Gw_1780481178
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-39666ef4254so4113641fa.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 03:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481178; x=1781085978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=szmw41mx+6XBYQACHrQkcIv+dFLdnR82AVyDnrz/Mp4=;
        b=QV9Y4/UFWMbryEaxEdRP/RRKEPs/L9rmKbHZ5OXzvBDPxLHaqY5CECz8DtGQ4gRf5a
         wZ/Qj2Jt4NrvKfw1A5j2xaM0mgh7qruDR3o6L2xUEHmwnhxSbnOaWgNf45WSfjRE5ZJo
         EgNkOWTvCD0YnQ/gZgqwyH/Lx5N/5GHJVT5RQX76ZtdGh97KpBpxIkSTgWBgXxE8C91j
         kvCUs7wdxZ+JPfk1Ngs6qZoH1vd4XgTN9xEHB1hr0z0AU375HYg3wSFlBOnMFky0TFaE
         e5POGmDh8LshSQWRsJbOX0ZKsB+JbMfvTHwMTmqohKg5B5fojYeQrOvchfse1tdxcN3q
         oZTg==
X-Forwarded-Encrypted: i=1; AFNElJ+iBSpudnG8T6bkJgb0lAn/QnvfNWrT8Qk2rh9hosnMwYirhW6XhIXoBVmXnhEE6lLLgwc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/4Vbn9PKIynTbVUPwbTAAN2LkTsG1PXImnfoHDAdDlKWJ1TGJ
	QeB8wLaqOUJmL25ZOi/dVAJaQbrsQG5JJZU00biEOaJ2yINqxRxlAgbbtfhZUtFyqcbA4dKKpO7
	nYkbXXmgArfJ0zS9LSfIBccu6EsP2MYtjZpcyL0yxzBqhkD6qxC2pYqd6K96WDuBhqn7NCexg6v
	+kDaJmzvK1u5ELdxOzPluuFhzIkq75
X-Gm-Gg: Acq92OFBfYXGmXEfra6N9D7ZRm7mcdKMbqzXlVQL3i60jjeJxVo46SwNXML8Ptj53s5
	I7IhFxc416AkAx8a4EKQ+b0zAOjn0ACPeloJqpYIaIZF9XLSc8qeMxwbZi27TNBqFTiYk8ZDbj4
	l/+3MCPGHArEUjv8MzbhBauUG22I8Y1/sDzH+wlKTvQ6t+ptfWsfY9JBpCe7lA1ZxZLhBDrGwZc
	78ejrRpztB4o8EB
X-Received: by 2002:a05:651c:315:b0:396:87d2:3b1b with SMTP id 38308e7fff4ca-396ac1f9945mr3945611fa.2.1780481177996;
        Wed, 03 Jun 2026 03:06:17 -0700 (PDT)
X-Received: by 2002:a05:651c:315:b0:396:87d2:3b1b with SMTP id
 38308e7fff4ca-396ac1f9945mr3945461fa.2.1780481177385; Wed, 03 Jun 2026
 03:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603071342.641874-1-ciprianmarian.costea@oss.nxp.com> <20260603071342.641874-2-ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <20260603071342.641874-2-ciprianmarian.costea@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Wed, 3 Jun 2026 12:06:05 +0200
X-Gm-Features: AVHnY4LQCfd00tH5rxiK5efFUUkj2NKbx685IUyczLcBMy4pwr5STR5N8-L7DP8
Message-ID: <CALE0LRvQfsD7MZ2To5S1Yh90pVNKvqNWy=FGpXuGcPa1yEZSkA@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 1/8] can: flexcan: use dedicated IRQ handlers
 for multi-IRQ platforms
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4bZ5daBUjUhJ8ZKtoDhvZf2aD2hl-1C3wGZ-cQPIQ28_1780481178
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ciprian,

Thank you for the patch series.

On Wed, Jun 3, 2026 at 9:14=E2=80=AFAM Ciprian Costea
<ciprianmarian.costea@oss.nxp.com> wrote:
>
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> On platforms with multiple IRQ lines (S32G2, MCF5441X), all lines are
> registered to the same flexcan_irq() handler. Since these are distinct IR=
Q
> numbers, they can be dispatched concurrently on different CPUs. Both
> instances then read the same iflag and ESR registers unconditionally,
> leading to duplicate frame processing.
>
> Fix this by splitting the monolithic handler into focused parts:
> - flexcan_do_mb(): processes mailbox events
> - flexcan_do_state(): processes device state change events
> - flexcan_do_berr(): processes bus error events
>
> Introduce dedicated IRQ handlers for multi-IRQ platforms:
> - flexcan_irq_mb(): mailbox-only, used for mb-0, mb-1 IRQ lines
> - flexcan_irq_boff(): state-change-only, used for boff/state IRQ line
> - flexcan_irq_berr(): bus-error-only, used for berr IRQ line
>
> The combined flexcan_irq() handler is preserved for single-IRQ
> platforms with no functional change.
>
> Fixes: d9cead75b1c6 ("can: flexcan: add mcf5441x support")
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Adding here because it doesn't seem to have a cover letter. With the
full series applied on top of the current mainline

Tested-by: Enric Balletbo i Serra <eballetb@.redhat.com>

Tested on the NXP S32G399A-RDB3 with loopback and high-rate traffic.
No regressions observed: CAN frames transmit and receive correctly,
with no duplicates.
Frame reception showed no errors under stress testing.

Thanks,
   Enric
> ---
>  drivers/net/can/flexcan/flexcan-core.c | 128 +++++++++++++++++++++----
>  1 file changed, 111 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/net/can/flexcan/flexcan-core.c b/drivers/net/can/fle=
xcan/flexcan-core.c
> index f5d22c61503f..f73ff442d530 100644
> --- a/drivers/net/can/flexcan/flexcan-core.c
> +++ b/drivers/net/can/flexcan/flexcan-core.c
> @@ -1070,16 +1070,14 @@ static struct sk_buff *flexcan_mailbox_read(struc=
t can_rx_offload *offload,
>         return skb;
>  }
>
> -static irqreturn_t flexcan_irq(int irq, void *dev_id)
> +/* Process mailbox (RX + TX) events */
> +static irqreturn_t flexcan_do_mb(struct net_device *dev)
>  {
> -       struct net_device *dev =3D dev_id;
>         struct net_device_stats *stats =3D &dev->stats;
>         struct flexcan_priv *priv =3D netdev_priv(dev);
>         struct flexcan_regs __iomem *regs =3D priv->regs;
>         irqreturn_t handled =3D IRQ_NONE;
>         u64 reg_iflag_tx;
> -       u32 reg_esr;
> -       enum can_state last_state =3D priv->can.state;
>
>         /* reception interrupt */
>         if (priv->devtype_data.quirks & FLEXCAN_QUIRK_USE_RX_MAILBOX) {
> @@ -1131,25 +1129,57 @@ static irqreturn_t flexcan_irq(int irq, void *dev=
_id)
>                 netif_wake_queue(dev);
>         }
>
> +       return handled;
> +}
> +
> +/* Process bus error events */
> +static irqreturn_t flexcan_do_berr(struct net_device *dev)
> +{
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       struct flexcan_regs __iomem *regs =3D priv->regs;
> +       irqreturn_t handled =3D IRQ_NONE;
> +       u32 reg_esr;
> +
>         reg_esr =3D priv->read(&regs->esr);
>
> -       /* ACK all bus error, state change and wake IRQ sources */
> -       if (reg_esr & (FLEXCAN_ESR_ALL_INT | FLEXCAN_ESR_WAK_INT)) {
> +       /* ACK bus error interrupt source */
> +       if (reg_esr & FLEXCAN_ESR_ERR_INT) {
>                 handled =3D IRQ_HANDLED;
> -               priv->write(reg_esr & (FLEXCAN_ESR_ALL_INT | FLEXCAN_ESR_=
WAK_INT), &regs->esr);
> +               priv->write(FLEXCAN_ESR_ERR_INT, &regs->esr);
>         }
>
> -       /* state change interrupt or broken error state quirk fix is enab=
led */
> -       if ((reg_esr & FLEXCAN_ESR_ERR_STATE) ||
> -           (priv->devtype_data.quirks & (FLEXCAN_QUIRK_BROKEN_WERR_STATE=
 |
> -                                          FLEXCAN_QUIRK_BROKEN_PERR_STAT=
E)))
> -               flexcan_irq_state(dev, reg_esr);
> -
>         /* bus error IRQ - handle if bus error reporting is activated */
>         if ((reg_esr & FLEXCAN_ESR_ERR_BUS) &&
>             (priv->can.ctrlmode & CAN_CTRLMODE_BERR_REPORTING))
>                 flexcan_irq_bus_err(dev, reg_esr);
>
> +       return handled;
> +}
> +
> +/* Process device state change events */
> +static irqreturn_t flexcan_do_state(struct net_device *dev)
> +{
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       struct flexcan_regs __iomem *regs =3D priv->regs;
> +       irqreturn_t handled =3D IRQ_NONE;
> +       u32 reg_esr;
> +       enum can_state last_state =3D priv->can.state;
> +
> +       reg_esr =3D priv->read(&regs->esr);
> +
> +       /* ACK state change and wake IRQ sources */
> +       if (reg_esr & (FLEXCAN_ESR_ERR_STATE | FLEXCAN_ESR_WAK_INT)) {
> +               handled =3D IRQ_HANDLED;
> +               priv->write(reg_esr & (FLEXCAN_ESR_ERR_STATE | FLEXCAN_ES=
R_WAK_INT),
> +                               &regs->esr);
> +       }
> +
> +       /* state change interrupt or broken error state quirk fix is enab=
led */
> +       if ((reg_esr & FLEXCAN_ESR_ERR_STATE) ||
> +           (priv->devtype_data.quirks &
> +           (FLEXCAN_QUIRK_BROKEN_WERR_STATE | FLEXCAN_QUIRK_BROKEN_PERR_=
STATE)))
> +               flexcan_irq_state(dev, reg_esr);
> +
>         /* availability of error interrupt among state transitions in cas=
e
>          * bus error reporting is de-activated and
>          * FLEXCAN_QUIRK_BROKEN_PERR_STATE is enabled:
> @@ -1188,6 +1218,65 @@ static irqreturn_t flexcan_irq(int irq, void *dev_=
id)
>                 }
>         }
>
> +       return handled;
> +}
> +
> +/* Combined IRQ handler for single-IRQ platforms */
> +static irqreturn_t flexcan_irq(int irq, void *dev_id)
> +{
> +       struct net_device *dev =3D dev_id;
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       irqreturn_t handled;
> +
> +       handled =3D flexcan_do_mb(dev);
> +       handled |=3D flexcan_do_state(dev);
> +       handled |=3D flexcan_do_berr(dev);
> +
> +       if (handled)
> +               can_rx_offload_irq_finish(&priv->offload);
> +
> +       return handled;
> +}
> +
> +/* Mailbox IRQ handler for multi-IRQ platforms */
> +static irqreturn_t flexcan_irq_mb(int irq, void *dev_id)
> +{
> +       struct net_device *dev =3D dev_id;
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       irqreturn_t handled;
> +
> +       handled =3D flexcan_do_mb(dev);
> +
> +       if (handled)
> +               can_rx_offload_irq_finish(&priv->offload);
> +
> +       return handled;
> +}
> +
> +/* Bus error IRQ handler for multi-IRQ platforms */
> +static irqreturn_t flexcan_irq_berr(int irq, void *dev_id)
> +{
> +       struct net_device *dev =3D dev_id;
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       irqreturn_t handled;
> +
> +       handled =3D flexcan_do_berr(dev);
> +
> +       if (handled)
> +               can_rx_offload_irq_finish(&priv->offload);
> +
> +       return handled;
> +}
> +
> +/* Device state change IRQ handler for multi-IRQ platforms */
> +static irqreturn_t flexcan_irq_boff(int irq, void *dev_id)
> +{
> +       struct net_device *dev =3D dev_id;
> +       struct flexcan_priv *priv =3D netdev_priv(dev);
> +       irqreturn_t handled;
> +
> +       handled =3D flexcan_do_state(dev);
> +
>         if (handled)
>                 can_rx_offload_irq_finish(&priv->offload);
>
> @@ -1761,25 +1850,30 @@ static int flexcan_open(struct net_device *dev)
>
>         can_rx_offload_enable(&priv->offload);
>
> -       err =3D request_irq(dev->irq, flexcan_irq, IRQF_SHARED, dev->name=
, dev);
> +       if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3)
> +               err =3D request_irq(dev->irq, flexcan_irq_mb,
> +                                 IRQF_SHARED, dev->name, dev);
> +       else
> +               err =3D request_irq(dev->irq, flexcan_irq,
> +                                 IRQF_SHARED, dev->name, dev);
>         if (err)
>                 goto out_can_rx_offload_disable;
>
>         if (priv->devtype_data.quirks & FLEXCAN_QUIRK_NR_IRQ_3) {
>                 err =3D request_irq(priv->irq_boff,
> -                                 flexcan_irq, IRQF_SHARED, dev->name, de=
v);
> +                                 flexcan_irq_boff, IRQF_SHARED, dev->nam=
e, dev);
>                 if (err)
>                         goto out_free_irq;
>
>                 err =3D request_irq(priv->irq_err,
> -                                 flexcan_irq, IRQF_SHARED, dev->name, de=
v);
> +                                 flexcan_irq_berr, IRQF_SHARED, dev->nam=
e, dev);
>                 if (err)
>                         goto out_free_irq_boff;
>         }
>
>         if (priv->devtype_data.quirks & FLEXCAN_QUIRK_SECONDARY_MB_IRQ) {
>                 err =3D request_irq(priv->irq_secondary_mb,
> -                                 flexcan_irq, IRQF_SHARED, dev->name, de=
v);
> +                                 flexcan_irq_mb, IRQF_SHARED, dev->name,=
 dev);
>                 if (err)
>                         goto out_free_irq_err;
>         }
> --
> 2.43.0
>

