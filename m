Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26CD3AB5DA
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 06:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785218455; cv=none; b=APe7R/nqrOKfQE+U1s28lqV0zMf0GZshvhOlt7wCaG4KPtBeECiBVqzXbd++5sauU+ovCB0/U9Le7I8cUki7Mqakzor4w8qTQ24da86PAliKvX6U4HB+T+lxnjHqiq0V8ZGk7LlPa2SEP5HluZVcGg4TKw7y+vgvWEowj6xN+5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785218455; c=relaxed/simple;
	bh=ZpSla08CxnsLamC4MDZa/Xusku6tT/HW+BITI2YhSy0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DS2U7E30s/VOoU6K0VFxbjZZEfCBHZ9lC9TG7TshOjBx7D4v4t7bWXBWYriOinFU7g//o10SR4mKwk/6OdsiN1gQNROQQ0NMzI7h6NsijqkQTu8UU548P0rAhRltulzI0D/Nl7km2Of11uCxgl1yrdFg3GpPE8K4MglRpYKo9pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEWIft06; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEWIft06"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45491F000E9;
	Tue, 28 Jul 2026 06:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785218452;
	bh=zXxixbn7wmodVioDBX/ZEXHnU4ep3HkM/7SZDlU/o+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oEWIft06FY76M5FnmaKg/quQFr+knXDCQYnfFlyFUiHoeaHbe8mbq3Zj+7ccIIYD3
	 U8XO/qgajLln8V2/rKSz7CDBwaGKXqF9D7wYwJrUo5LTUnvfYRIMh1hwuEExuSfXhL
	 2QHwRlmA8l3deBesx+7ZaZkVNPeDqA/GG6fX1fT8kbJpT/VUpa2wUW+pF0gY/iAHO9
	 4jcyGoZwmtLk3klfdn+0A/yk4BcVFh7hy3mdkPCLsuFp9fdT4J9sdfDyNAx/hfzRIe
	 WSulit5y77uePVAhvARRqR/ewjpao2hVMfCoGw65iWmyFMOtmELjbr0i+ntOleQ6Gd
	 4ArQR5+TzAdUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net] ptp: netc: fix potential interrupt storm caused
 by incorrect unbind order
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260727060348.1887464-1-wei.fang@oss.nxp.com>
References: <20260727060348.1887464-1-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 06:00:51 +0000
Message-Id: <20260728060051.B45491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to clear the hardware interrupt status register (=
NETC_TMR_TEVENT) during initialization and only clears unmasked events in t=
he ISR, permanently leaving masked events pending.
--

--- Patch [1]: [PATCH v2 net] ptp: netc: fix potential interrupt storm caus=
ed by incorrect unbind order ---
commit 31de617b2b5f4f30ac1afdcfbd8ebfecdf0a6a03
Author: Wei Fang <wei.fang@nxp.com>

ptp: netc: fix potential interrupt storm caused by incorrect unbind order

This commit attempts to fix an interrupt storm during driver unbind by
requesting the IRQ with IRQF_NO_AUTOEN and ensuring hardware interrupts
are disabled before unregistering the PTP clock. It also adds logic to
return IRQ_NONE when no unmasked events are pending.

Closes: https://sashiko.dev/#/patchset/20260720012508.23227-1-wei.fang%40os=
s.nxp.com

> diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
> --- a/drivers/ptp/ptp_netc.c
> +++ b/drivers/ptp/ptp_netc.c
> @@ -769,6 +769,7 @@ static void netc_timer_init(struct netc_timer *priv)
>  		   TMR_CTRL_TE | TMR_CTRL_FS;
>  	netc_timer_wr(priv, NETC_TMR_CTRL, tmr_ctrl);
>  	netc_timer_wr(priv, NETC_TMR_PRSC, priv->oclk_prsc);
> +	netc_timer_wr(priv, NETC_TMR_TEMASK, 0);

[Severity: High]
This is a pre-existing issue, but does this initialization also need to cle=
ar
the event register (NETC_TMR_TEVENT)?

If the hardware holds pending events from a previous unbind or an unclean
shutdown, clearing the mask here won't clear the pending bits themselves,
leaving stale interrupt status in the hardware.

[ ... ]

> @@ -901,6 +902,11 @@ static irqreturn_t netc_timer_isr(int irq, void *dat=
a)
>  	/* Clear interrupts status */
>  	netc_timer_wr(priv, NETC_TMR_TEVENT, tmr_event);
> =20
> +	if (!tmr_event) {
> +		spin_unlock(&priv->lock);
> +		return IRQ_NONE;
> +	}
> +

[Severity: High]
This is a pre-existing issue, but does writing back the masked tmr_event
fail to clear pending but masked hardware events?

Looking earlier in netc_timer_isr(), tmr_event is masked before being writt=
en
back to the register:

    tmr_event =3D netc_timer_rd(priv, NETC_TMR_TEVENT);
    tmr_event &=3D priv->tmr_emask;
    /* Clear interrupts status */
    netc_timer_wr(priv, NETC_TMR_TEVENT, tmr_event);

If NETC_TMR_TEVENT is a Write-1-to-Clear register, writing back 0 for
any masked events means they are never cleared.=20

If priv->tmr_emask is 0, the ISR will write 0 to NETC_TMR_TEVENT and then
return IRQ_NONE without clearing the actual hardware state. Could this
cause the unacknowledged hardware interrupt to re-trigger indefinitely,
forcing the kernel's spurious interrupt detector to permanently disable the
IRQ line?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727060348.1887=
464-1-wei.fang@oss.nxp.com?part=3D1
