Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A379583ABD
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 16:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971650; cv=none; b=Qz5Qd0MPte3v1+DyjPciKsjfcEvJh5L8HGMSpiWy8dluC/dYHn4tNaQlkjCWjHyhw8iSNYWzJoxGNxRC7h7Aiaex5jJxCG/E2OiZdQ5JTs7tHtzMrA1uEkrTlIN0mktnUaVjPZEw96oObHbw65DMh0rxcVEa3Q+BBfr5sbBGQwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971650; c=relaxed/simple;
	bh=iFidE0fkJx0ZArqyC4Iu6g6INbmo65/jcXMKwU+ZxyI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tMIIb7J+HyuOFzCPG9nSEJPB52yksFxUrfRPkINZ9DGNYtctz7snr9neYtsJsexS5w7nLbwtT2HrStxO8L05285ik1PaUMVVRgdbepjZb9VJQ7S7ScQa+D1kjAvAZ95pHfeud0BCDkBryqHSLf/SaD+npEFVwSV0itDzbEebTNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cRvnnGGF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cRvnnGGF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CFC1F000FF;
	Wed,  9 Sep 2026 16:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788971649;
	bh=nY3zD8JiQWwWG4kT/WeQuAw/J4a/Q6SorQMWnC8bydo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cRvnnGGFMLl9/qj0dwITjfNhR3Flanom6fP6hSeF/W7C/8LatrhCPehlpqzUP0REn
	 J+kLoe72SZJ7OrRr0LDFXT0A2GjC3r7tOT9WicrwPUdKyOyKSJomiarQ9MDX13JiRB
	 YvUc8vjcMVYljXUMMIvLN4zcVMUORSv0j8OthvPLws9U1xp3jEnH47BEiPOUYpTT4Q
	 iCBzQCU4tCqkqjNaZkoo/dLPaA4JDVLvV8hcT921ymceiKEQnzyRghry3DWjztnSnp
	 UOl7kJeksoyEOtCpxb8+CuIJji3243prBX8S5V7p90ag/K4aMsHSkdycrHw1M3b0fQ
	 2x5D/lQ3/D/kQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3 2/2] net: fec: free the PPS interrupt before
 tearing down the PHC and netdev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260909-fec-ptp-pps-event-uaf-v3-2-bead12c29a16@cherr.cc>
References: <20260909-fec-ptp-pps-event-uaf-v3-0-bead12c29a16@cherr.cc>
 <20260909-fec-ptp-pps-event-uaf-v3-2-bead12c29a16@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 16:34:08 +0000
Message-Id: <20260909163409.12CFC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The main ethernet interrupts are managed via devres but `netdev` i=
s freed manually, causing a use-after-free if an interrupt fires after driv=
er removal.
- [High] Unregistering the PTP clock after canceling timers and freeing IRQ=
s allows concurrent ioctls to re-arm them, leading to Use-After-Free.
- [High] Race condition causing tx_timeout_work to be queued after it is ca=
ncelled, leading to a use-after-free when the work executes.
--

commit 30a91ed24b7ea8f3f822626082d9c49cb0b5b610
Author: Shengzhuo Wei <me@cherr.cc>

net: fec: free the PPS interrupt before tearing down the PHC and netdev

The devm-managed PPS interrupt remains registered until after the remove
callback returns, outliving both the PHC and the netdev. This patch uses
request_irq() and free_irq() to explicitly manage the interrupt lifetime.

> diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ether=
net/freescale/fec_ptp.c
> --- a/drivers/net/ethernet/freescale/fec_ptp.c
> +++ b/drivers/net/ethernet/freescale/fec_ptp.c
[ ... ]
> @@ -861,6 +863,12 @@ void fec_ptp_stop(struct platform_device *pdev)
> =20
>  	cancel_delayed_work_sync(&fep->time_keep);
>  	hrtimer_cancel(&fep->perout_timer);
> +
> +	if (fep->pps_irq >=3D 0) {
> +		free_irq(fep->pps_irq, ndev);
> +		fep->pps_irq =3D -1;
> +	}
> +
>  	if (fep->ptp_clock)
>  		ptp_clock_unregister(fep->ptp_clock);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
This is a pre-existing issue, but does unregistering the PTP clock after
canceling timers and freeing IRQs allow concurrent ioctls to re-arm them?

In fec_ptp_stop(), the driver cancels the perout_timer hrtimer before calli=
ng
ptp_clock_unregister(). Because the PTP char device is still registered and
active, a concurrent userspace thread can issue a PTP clock request ioctl
which calls fec_ptp_enable() and re-arms the timer via hrtimer_start().

fec_ptp_stop() finishes, and fec_drv_remove() frees the netdev. When the
re-armed timer fires, its callback fec_ptp_pps_perout_handler() accesses the
freed fep structure, leading to a use-after-free.

Should ptp_clock_unregister() be called before tearing down the timers and
interrupts to prevent them from being re-armed?


[Severity: High]
This is a pre-existing issue, but shares the same root cause as the PPS
interrupt bug this patch is fixing. Does the driver also have a use-after-f=
ree
risk with the main ethernet interrupts?

In fec_probe(), the main ethernet interrupts are requested using devres:

drivers/net/ethernet/freescale/fec_main.c:fec_probe() {
    ...
    ret =3D devm_request_irq(&pdev->dev, irq, fec_enet_interrupt,
                           0, pdev->name, ndev);
    ...
}

However, in fec_drv_remove(), the netdev is freed manually:

drivers/net/ethernet/freescale/fec_main.c:fec_drv_remove() {
    ...
    free_netdev(ndev);
    ...
}

Because devm_request_irq() ties the interrupt lifetime to the device rather
than the netdev lifecycle, the interrupts are not freed until after
fec_drv_remove() returns. If an interrupt fires in this window,
fec_enet_interrupt() will execute and dereference the freed ndev pointer.

Should the main ethernet interrupts also be converted to request_irq() and
freed explicitly in fec_drv_remove() before free_netdev() is called?


[Severity: High]
This is a pre-existing issue, but is there a race condition causing
tx_timeout_work to be queued after it is cancelled?

In fec_drv_remove(), cancel_work_sync() is called before unregister_netdev(=
):

drivers/net/ethernet/freescale/fec_main.c:fec_drv_remove() {
    ...
    cancel_work_sync(&fep->tx_timeout_work);
    unregister_netdev(ndev);
    ...
}

While unregister_netdev() is executing, the netdev is still active, allowing
the networking core watchdog to detect a transmit timeout and invoke
ndo_tx_timeout (fec_timeout()). This asynchronously re-queues tx_timeout_wo=
rk.

The driver continues teardown and frees the netdev. When the workqueue
executes fec_enet_timeout_work(), it accesses the freed fep pointer, causin=
g a
use-after-free.

Should unregister_netdev() be called before cancel_work_sync() to ensure no
new work is queued?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-fec-ptp-pp=
s-event-uaf-v3-0-bead12c29a16@cherr.cc?part=3D2
