Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0DF492E47
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 02:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788921520; cv=none; b=cjehCidh1pH8UlvOcHIj9CfugSCc8OGGcMyDuJTtWp+1ycz/Z0KEbtbQfFHU4/mEj7TwSupYRwHE1HMJnLFRL6UBd7ezTbEpZ5xyaPPYu1R2EFkl0mXXQ/2P1w6q/iE/GSexmczVcr7AtpZp9xEWhVzIQdg0DZBT92Z41hYnSNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788921520; c=relaxed/simple;
	bh=071RXVS8rconLOtPJQQjC5w4XHDZCLdnNCtHkzKI/2k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lygQo3KeRB1plDiCFUtU7xNYLij+gegf4gfGTb2HtGI+02xL94cIv7EZwIsO2N+hZMgAwRSTuWxTSKufiSMpKi0xfKvBIM7ct94jYoG/s4f8+SsF2Fac1u+EdqlNdjlUfR4Dce40jNSmvxho20WS47ELFHokgKZBapSwTb0CucA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eh9HyWug; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eh9HyWug"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1C81F00A3D;
	Wed,  9 Sep 2026 02:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788921519;
	bh=Q9aYTEBRAoE10+cLQE1GoTZNPokf+weuDNsJn9t0NMs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Eh9HyWugqsj9zvNstpjujH8+SIr3z9e8FOTVSkyBWtlyAQcTSaTrX7uip+OvE6Vi/
	 Uh5JR8+V0T5HCr+QbyORwcrfNSWkQ2NuDgvf0dPUKFbJhX4B56+iELgLNf2s8wSK7S
	 6RI3WZ1vbISvxKm1IJ/hsWsP5gqn7MWXJD/qJRBIyJClekTVSFPZk7reBLmc9OVqFr
	 hm6Vczf+Au3XcpIiwWR9br1It2VfAtVwts02Ez3pBJH9sdAIB5f5/dWKUbIhX7cSm+
	 fjsOGt9KhDi9+fK0HEGRo9ynZFvxvYr2+4g2BDNdStEzUfUcTPVhQt269GQhgTR7Fz
	 FrbM9CCwIcc2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2 1/2] net: fec: stop the PTP clock after the
 netdev is unregistered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260908-fec-ptp-pps-event-uaf-v2-1-2a1d57121ade@cherr.cc>
References: <20260908-fec-ptp-pps-event-uaf-v2-0-2a1d57121ade@cherr.cc>
 <20260908-fec-ptp-pps-event-uaf-v2-1-2a1d57121ade@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 02:38:38 +0000
Message-Id: <20260909023839.4B1C81F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Moving fec_ptp_stop() after unregister_netdev() introduces a race =
condition that can cause a hard CPU lockup in the PPS interrupt handler.

Pre-existing issues:
- [High] Calling cancel_work_sync(&fep->tx_timeout_work) before unregister_=
netdev() creates a race condition that allows the TX timeout work to be res=
cheduled, leading to a Use-After-Free.
- [High] Active devm-managed IRQ handlers are exposed to Use-After-Free bec=
ause `ndev` is explicitly freed before the devres device teardown phase com=
pletes.
- [High] Hardware accesses in PTP operations are performed without runtime =
PM protection and without checking the PTP clock state, leading to a potent=
ial Synchronous External Abort.
--

commit 2868dfdaff74bb5f34e63d5c554ad690f2b576c1
Author: Shengzhuo Wei <me@cherr.cc>

net: fec: stop the PTP clock after the netdev is unregistered

This commit addresses a race condition where a freed PTP clock could be
accessed during ethtool operations by moving fec_ptp_stop() after
unregister_netdev().

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index 794ec427b0ee6..a29c8ddbbf34d 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -5500,9 +5500,9 @@ fec_drv_remove(struct platform_device *pdev)
>  			ERR_PTR(ret));
> =20
>  	cancel_work_sync(&fep->tx_timeout_work);

[Severity: High]
This is a pre-existing issue, but does calling cancel_work_sync() before
unregister_netdev() leave a window for the work to be rescheduled?

While unregister_netdev() is running, the network interface and its transmit
watchdog timer (dev_watchdog) are still active. If the watchdog timer fires
during this window, could fec_timeout() re-queue the work via
schedule_work(&fep->tx_timeout_work)?

Since unregister_netdev() shuts down the interface but does not cancel newly
scheduled work, the delayed work could run after free_netdev() destroys
ndev, leading to a Use-After-Free.

[Severity: High]
This isn't a bug introduced by this patch, but does the error handling for
pm_runtime_get_sync() safely protect the hardware accesses?

If pm_runtime_get_sync() fails, the device remains suspended, but execution
continues into fec_ptp_stop(), which invokes fec_ptp_enable_pps() and
writes to FEC_TCSR.

Similarly, PTP ioctls or deferred timers might invoke functions like
fec_ptp_adjfine(), which unconditionally access hardware registers:

fec_ptp.c:fec_ptp_adjfine() {
    ...
    tmp =3D readl(fep->hwp + FEC_ATIME_INC) & FEC_T_INC_MASK;
    ...
}

Could accessing these registers while the device bus clocks are disabled
cause a Synchronous External Abort (bus fault)?

> +	unregister_netdev(ndev);

[Severity: High]
Does moving unregister_netdev() before fec_ptp_stop() introduce a race
condition that can cause a hard CPU lockup in the PPS interrupt handler?

Calling unregister_netdev() brings the device down and invokes
fec_enet_close(), which disables the PTP clock via
fec_enet_clk_enable(ndev, false).

During the window before fec_ptp_stop() is called, the hardware PPS
interrupt is still registered and unmasked. If the PPS interrupt fires
in this window, the CPU enters fec_pps_interrupt() and tries to clear
the interrupt flag by writing to FEC_TCSR in a do-while loop:

fec_ptp.c:fec_pps_interrupt() {
    ...
    do {
        writel(val, fep->hwp + FEC_TCSR(channel));
    } while (readl(fep->hwp + FEC_TCSR(channel)) & FEC_T_TF_MASK);
    ...
}

Since the functional timer clock (clk_ptp) is disabled, the timer IP block
might not process the clear operation. Will the TF_MASK bit never clear,
causing the interrupt handler to spin indefinitely?

>  	if (fep->bufdesc_ex)
>  		fec_ptp_stop(pdev);
> -	unregister_netdev(ndev);
>  	fec_enet_mii_remove(fep);
>  	if (fep->reg_phy)
>  		regulator_disable(fep->reg_phy);

[Severity: High]
This is a pre-existing issue, but does explicitly freeing the netdev later
in this function expose devm-managed IRQ handlers to a Use-After-Free?

The driver registers network interrupts using devm_request_irq() in
fec_probe(), passing ndev as the dev_id token. These devm-managed
resources are only released by devres after fec_drv_remove() returns.

However, fec_drv_remove() manually calls free_netdev(ndev) at the end
of the function:

fec_main.c:fec_drv_remove() {
    ...
    fec_enet_deinit(ndev);
    free_netdev(ndev);
}

If a spurious or shared interrupt fires between the free_netdev() execution
and the devres teardown phase, could the active IRQ handler be invoked with
a freed ndev pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-fec-ptp-pp=
s-event-uaf-v2-0-2a1d57121ade@cherr.cc?part=3D1
