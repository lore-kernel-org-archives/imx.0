Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E66481249
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492831; cv=none; b=r8n/lAIE2FBFdIXOkJ0o+I5DCI6YbPXgRg4cZUhMnP+fOSBajF8lb1I76kaTvDHUr1vc7yotenI9xXx7gqH5KVfk02ANpSgMdE3/aLMNaVzyO8xy8UywbN1IXDOdNK6iglCSET5xF4yX2L5SqSe7dKhn0spoOtOGssLu+TBwsHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492831; c=relaxed/simple;
	bh=385eVkJ30p1mYMVcmz0/WhKzr3vYPVLgRh0bnjld+Jk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O2U8I8n38KKistJVC3p940Sj4NDZFGlU0UkiRphvD9lwniuvVHm20zryqD83EDXwxAMLmQO2oOsoL0k+F+64mLnK9XvRmHNtDURoYXU7PMbMxM60a6rQ2MPzOpWgkWD755cfmR4jDxD8XAT3E4Uks1Ng2NuFFCnUXVLLeXctw2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lj3b2nLd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lj3b2nLd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A3D1F00893;
	Wed,  3 Jun 2026 13:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780492829;
	bh=itXy7YcLZlJGtgptdj/De5v7QMCLiF8kDbvmrPqNf0I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lj3b2nLdJdnNSaW5Rc9BsiChpVQs+s6Mca6qW9zFaIeMO9lzLUsVTqaZ3Q5ivcv6N
	 JRMZuwk1nqLMDnpm6JSNO8oOAmS5LTz+pcTQ4wgifuN7gzDkmxSN9WdUfE3bM4jacF
	 hSp6A0L0jX67BrZCda2zBGsD9qYDlnI9a340Bhik/Lc7HBd8HGemeTTy4o6yqtqokg
	 /OcwOjCuEiVNkjgVxVdYYiKF+TlvekczmTKaHyuxrcqsOtVOTvP1XnKA6H4yM+1l4/
	 WHEouhvhquQ3ywXEbSnZhF+dSx2PkMY//NtFAUc7l/7xAVJ2MqHBamwQLZNUN4TsLW
	 Wgy1geha8qXRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/9] mailbox: imx: Add a channel shutdown field
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260603-imx_mbox_rproc-v2-1-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-1-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 13:20:28 +0000
Message-Id: <20260603132029.98A3D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Timeout in imx_mu_seco_rxdb() skips clearing the hardware inte=
rrupt status, causing an infinite IRQ storm.
- [High] The patch addresses a race where an RX interrupt can be re-enabled=
 during channel shutdown, but fails to fix the exact same race for TX chann=
els. This can result in an unhandled interrupt and the kernel disabling the=
 shared IRQ line.
- [High] Error paths in imx_mu_specific_rx() permanently wedge the RX chann=
el by leaving the receive interrupt disabled.
- [High] The driver performs a multi-second busy-wait polling loop inside R=
T-priority threaded handlers, triggering softlockups.
--

commit e0f87aaf04945c03d65f3581c6859712272ba596
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

mailbox: imx: Add a channel shutdown field

Introduce imx_mu_con_priv::shutdown to signal that the channel is shutting
down. This prevents a race condition where an RX event could be disabled in
shutdown() and then incorrectly re-enabled by the ISR.

> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> index 246a9a9e39520..34edc2f31dcb5 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
[ ... ]
> @@ -376,7 +407,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *pri=
v, struct imx_mu_con_priv *
>  		*data++ =3D imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
>  	}
> =20
> -	imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0), =
0);
> +	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->ty=
pe, 0));
>  	mbox_chan_received_data(cp->chan, (void *)priv->msg);
> =20
>  	return 0;

[Severity: High]
This isn't a bug introduced by this patch, but can error paths in
imx_mu_specific_rx() permanently wedge the RX channel by leaving the receive
interrupt disabled?

In the updated threaded interrupt architecture, the receive interrupt
(RIEn) is explicitly disabled in the primary handler. The threaded handler
(imx_mu_isr_th) invokes the channel callback and conditionally unmasks the
interrupt only if the callback returns 0:

    if (!priv->dcfg->rx(priv, cp))
        imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR,
                           IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx));

If imx_mu_specific_rx() encounters an error (such as exceeding the maximum
message size):

    if (size > max_size / 4) {
        dev_err(priv->dev, ...);
        return -EINVAL;
    }

It returns a non-zero error code. The threaded handler will evaluate the
condition as false and skip imx_mu_xcr_set_act(), leaving the receive
interrupt permanently disabled. The hardware will never generate another
receive interrupt for this channel, permanently deadlocking communication.


[Severity: High]
This isn't a bug introduced by this patch, but is it safe to perform a
multi-second busy-wait polling loop inside RT-priority threaded handlers, or
could this trigger softlockups?

The driver uses multi-second busy-wait polling in functions called from the
threaded interrupt handler. imx_mu_specific_rx() uses readl_poll_timeout()
with a 5-second timeout:

    ret =3D readl_poll_timeout(..., 0, 5 * USEC_PER_SEC);

Similarly, imx_mu_rx_waiting_read() loops for 3 seconds without sleeping:

    } while (!can_read && time_is_after_jiffies64(timeout_time));

Because threaded IRQ handlers run as Real-Time tasks (SCHED_FIFO,
priority 50), spinning for up to 5 seconds will entirely stall the CPU
core, starve normal priority tasks, delay RCU grace periods, and
trigger softlockup and RCU stall panics.

[ ... ]
> @@ -638,13 +670,13 @@ static void imx_mu_shutdown(struct mbox_chan *chan)
> =20
>  	switch (cp->type) {
>  	case IMX_MU_TYPE_TX:
> -		imx_mu_xcr_rmw(priv, IMX_MU_TCR, 0, IMX_MU_xCR_TIEn(priv->dcfg->type, =
cp->idx));
> +		imx_mu_xcr_clr_shut(priv, cp, IMX_MU_TCR, IMX_MU_xCR_TIEn(priv->dcfg->=
type, cp->idx));
>  		break;

[Severity: High]
This isn't a bug introduced by this patch, but would the same race condition
exist for TX channels, potentially resulting in unhandled interrupts?

When shutting down a TX channel, imx_mu_shutdown() calls
imx_mu_xcr_clr_shut() to clear the TX interrupt enable bit (TIEn) and set
cp->shutdown =3D true. It then calls free_irq(), which waits for any running
threaded ISR to finish.

If the threaded ISR (imx_mu_isr_th) is running concurrently, it acknowledges
the interrupt and calls mbox_chan_txdone(). This can push the next queued
message via send_data(), invoking imx_mu_generic_tx() or
imx_mu_specific_tx().

Both of these TX functions unconditionally re-enable the TX interrupt using
imx_mu_xcr_rmw(), completely ignoring the cp->shutdown flag:

    imx_mu_xcr_rmw(priv, IMX_MU_TCR,
                   IMX_MU_xCR_TIEn(priv->dcfg->type, cp->idx), 0);

After the handler finishes, free_irq() unregisters the interrupt handler.
The hardware will eventually assert the TX interrupt because TIEn was
re-enabled. Since the IRQ is shared, other handlers will return IRQ_NONE,
leading to an interrupt storm and the kernel disabling the shared IRQ line.
Should the fix have used imx_mu_xcr_set_act() in the TX paths, just as it d=
id
for RX?

>  	case IMX_MU_TYPE_RX:
> -		imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, =
cp->idx));
> +		imx_mu_xcr_clr_shut(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->=
type, cp->idx));
>  		break;
>  	case IMX_MU_TYPE_RXDB:
> -		imx_mu_xcr_rmw(priv, IMX_MU_GIER, 0, IMX_MU_xCR_GIEn(priv->dcfg->type,=
 cp->idx));
> +		imx_mu_xcr_clr_shut(priv, cp, IMX_MU_GIER, IMX_MU_xCR_GIEn(priv->dcfg-=
>type, cp->idx));

[Severity: Critical]
This isn't a bug introduced by this patch, but does a timeout in
imx_mu_seco_rxdb() skip clearing the hardware interrupt status, causing an
infinite IRQ storm?

In imx_mu_seco_rxdb(), if imx_mu_rx_waiting_read() times out, the function
jumps to the error label:

    if (err) {
        dev_err(priv->dev, "Timeout rx %d\n", i);
        goto error;
    }

This bypasses the hardware write that clears the General Purpose Interrupt
Pending (GIPn) bit. The threaded handler (imx_mu_isr_th) ignores the error
return value from rxdb() and unconditionally unmasks the interrupt:

    priv->dcfg->rxdb(priv, cp);
    imx_mu_xcr_set_act(priv, cp, IMX_MU_GIER,
                       IMX_MU_xCR_GIEn(priv->dcfg->type, cp->idx));

Because the hardware interrupt is never acknowledged or disabled, the
interrupt controller will immediately re-trigger the ISR. This cycle repeats
infinitely: trigger, thread busy-waits 3 seconds, timeout, unmask, trigger
again, completely locking up the CPU.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-imx_mbox_r=
proc-v2-0-a0059dc3b69a@linutronix.de?part=3D1
