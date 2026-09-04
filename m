Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D20951E43E
	for <imx@lists.linux.dev>; Fri,  4 Sep 2026 20:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552980; cv=none; b=dQ0MThuZ/vhE21T6LpMQse8b4uwjMYt2Xz7KUsUt+Olk433hQGQ2ClLDwsy+n3JkapwRDayWm2MbXutWIkt9Ks0oeHk/NQn/smi+sEIgIHJlqkCkdc3fKEHUBhOqqn3DStt3v3glGwjHK1QHt8FJWCudha79MuEvingdbyy1rMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552980; c=relaxed/simple;
	bh=+U2ST693oS6QQZsmSqavHrr39874Ieq+wq2XvuQ9dJs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=F4cvT/cGV68VJC3X/CrnTDDsgPDQbD4viSCc4PjETbBfyWQoVyM2D7F/2fkSm4KMWzUUpVbmEXSjgX0FCTtMec2wuGBd8opJtD40P9+cTmYZtbNfUX4R+QC8RuEJb19jRLx4+mQROePNDGFcesWAQXzHutitZ2+vKc4l/CB5MZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKfYaLqk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKfYaLqk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B5A1F00A3D;
	Fri,  4 Sep 2026 20:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788552979;
	bh=X1FUuFJ8FnUitvaSGofZE83/e7KgiOqt855Keet7YKs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DKfYaLqkVw6G4gdX726v9MVeYVT6aCEtZiqldkIxVa2R8yIc3R6CEMgQfUTWlAMf8
	 VvPuBGueOITmudaOPWsTfTXhtBPZE/ku5FYQP6qJBhjuq0+zqZWeuEdwNGGpWiRwtQ
	 dScYi45Cj/aHR7M7Aujag9oinr1dgkWvL0QuqttMkGxX9kKfUi/r1AzIuH4Jqso5hS
	 2q2ZBqm+RtoV8E6xhxoIYsjinYcJNz561LC3a0o7yVCmLIXwvwWqBnzjo8H0c68E6+
	 isgeHbeKhfGGLGkpBqnnUs2o4QJbXNYKDs2W8j4iZJRe1J4wGHE9eX6EGymxBbKFJx
	 rSLPy8I8AehmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 2/2] net: fec: free the PPS interrupt before tearing
 down the PHC and netdev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260904-fec-ptp-pps-event-uaf-v1-2-9af446be4a11@cherr.cc>
References: <20260904-fec-ptp-pps-event-uaf-v1-0-9af446be4a11@cherr.cc>
 <20260904-fec-ptp-pps-event-uaf-v1-2-9af446be4a11@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 20:16:18 +0000
Message-Id: <20260904201619.00B5A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Cancelling timers before unregistering the PTP clock allows concur=
rent PTP API calls to re-arm the timer, leading to a use-after-free.
- [High] The main Ethernet interrupts (`fec_enet_interrupt`) are subject to=
 the exact same Use-After-Free vulnerability that this patch fixes for the =
PPS interrupt.
- [High] The hardirq handler fec_pps_interrupt accesses and modifies shared=
 state without holding fep->tmreg_lock, leading to data races.
- [High] System crash (synchronous external abort) in `fec_ptp_stop()` when=
 `pm_runtime_get_sync()` fails.
--

commit 5aee3b9548f47be5a93d234d09831dc38dd199c1
Author: Shengzhuo Wei <me@cherr.cc>

net: fec: free the PPS interrupt before tearing down the PHC and netdev

This patch explicitly frees the devm-managed PPS interrupt during
fec_ptp_stop() to prevent the interrupt handler from outliving the
network device. This resolves a use-after-free where an in-flight
handler could execute after free_netdev() is called.

> A handler already in flight can observe pps_enable before fec_ptp_stop()
> clears it and call ptp_clock_event() concurrently with
> ptp_clock_unregister().  A handler invoked after free_netdev() but before
> device-managed cleanup dereferences the freed netdev.

[Severity: High]
This isn't a bug introduced by this patch, but are the main Ethernet
interrupts (fec_enet_interrupt) subject to the exact same use-after-free
vulnerability that this patch fixes for the PPS interrupt?

In fec_main.c:fec_probe(), the main interrupts are requested via
devm_request_irq():

    ret =3D devm_request_irq(&pdev->dev, irq, fec_enet_interrupt, 0,
                           pdev->name, ndev);

However, in fec_drv_remove(), free_netdev(ndev) is called while these
interrupts are still registered and active, which means they could fire
and access freed memory before devres cleanup runs later.

[ ... ]
> diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ether=
net/freescale/fec_ptp.c
> index 0036549974fd3..5b1d58c85fcd2 100644
> --- a/drivers/net/ethernet/freescale/fec_ptp.c
> +++ b/drivers/net/ethernet/freescale/fec_ptp.c
> @@ -787,9 +787,12 @@ void fec_ptp_init(struct platform_device *pdev, int =
irq_idx)
>  	if (irq >=3D 0) {
>  		ret =3D devm_request_irq(&pdev->dev, irq, fec_pps_interrupt,
>  				       0, pdev->name, ndev);

[Severity: High]
This is a pre-existing issue, but does fec_pps_interrupt() access and
modify shared state without holding fep->tmreg_lock, leading to data
races?

When the interrupt fires, fec_pps_interrupt() updates fep->next_counter
locklessly in hardirq context:

    fep->next_counter =3D (fep->next_counter + fep->reload_period) & fep->c=
c.mask;
    writel(fep->next_counter, fep->hwp + FEC_TCCR(channel));

This can race with fec_ptp_enable_pps() and fec_ptp_pps_perout_handler(),
which correctly use spin_lock_irqsave(&fep->tmreg_lock, flags) to serialize
updates to the same state. Can this cause interleaved reads and writes that
corrupt the timer state and hardware registers on SMP systems?

> -		if (ret < 0)
> +		if (ret < 0) {
>  			dev_warn(&pdev->dev, "request for pps irq failed(%d)\n",
>  				 ret);
> +		} else {
> +			fep->pps_irq =3D irq;
> +		}
>  	}
> =20
>  	fep->ptp_clock =3D ptp_clock_register(&fep->ptp_caps, &pdev->dev);
> @@ -861,6 +864,12 @@ void fec_ptp_stop(struct platform_device *pdev)
> =20
>  	cancel_delayed_work_sync(&fep->time_keep);
>  	hrtimer_cancel(&fep->perout_timer);

[Severity: High]
This is a pre-existing issue, but does cancelling the timer before
unregistering the PTP clock allow concurrent PTP API calls to re-arm
the timer and cause a use-after-free?

Because ptp_clock remains registered, userspace can concurrently invoke
PTP ioctls that call fec_ptp_enable(), which re-arms perout_timer. If
this race occurs and the timer is re-armed, it can fire after
fec_drv_remove() completes and free_netdev() is called, dereferencing
the freed ndev and fep.

Should ptp_clock_unregister() happen at the beginning of the teardown
sequence?

> +
> +	if (fep->pps_irq > 0) {
> +		devm_free_irq(&pdev->dev, fep->pps_irq, ndev);
> +		fep->pps_irq =3D 0;
> +	}
> +
>  	if (fep->ptp_clock) {
>  		ptp_clock_unregister(fep->ptp_clock);

[Severity: High]
This isn't a bug introduced by this patch, but does unconditionally
calling fec_ptp_stop() during device removal lead to a synchronous
external abort if runtime PM fails?

In fec_main.c:fec_drv_remove(), pm_runtime_get_sync() is called, but if
it fails, execution continues and the device's clocks remain gated:

    ret =3D pm_runtime_get_sync(&pdev->dev);
    if (ret < 0)
        dev_err(&pdev->dev, ...);

    if (fep->bufdesc_ex)
        fec_ptp_stop(pdev);

If fep->pps_enable was left enabled, fec_ptp_stop() will attempt to
access raw hardware registers (via fec_ptp_enable_pps()) while the clocks
are gated, which triggers a kernel panic on i.MX platforms.

>  		fep->ptp_clock =3D NULL;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-fec-ptp-pp=
s-event-uaf-v1-0-9af446be4a11@cherr.cc?part=3D2
