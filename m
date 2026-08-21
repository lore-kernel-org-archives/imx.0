Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B184F47FAE0
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787310884; cv=none; b=mAbOUPei49ragjFDnTN4E41wrLEXX3n09FPECRV98VqHndLaceRJn84P4Ol6rDG9JpM1owSm532Gty7HavtU5Rd7zkooQX313MfnLzAyEv48mhiAvAwV0LpryhjXRhQJgAkySZso4qCuekxo239Qed2PYirr0t0Y+mXp1GrnBsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787310884; c=relaxed/simple;
	bh=W4CXX9kTsaPHaJxhouEycsXS+NdmttJ+XrW2E7X6BQI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M0PoRwKvgLHqejMNFM9TSMLsNcg6ob5Aqomw4bASV7q+LMhbt0lWiUiOk1IHnbQP1dHv7Mkc9aJ4NFaGc2Q+y/riaiqhbehbp0T3/xuz6C3r7JfZR9m4oRpMFhHSyQVOgQ/FsA4IhDUhEH2syfJh0lSBqp3Ur+2Ifse+eiAgFQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fi6bFnb1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fi6bFnb1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237021F000E9;
	Fri, 21 Aug 2026 11:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787310882;
	bh=/AdlsIxDbXqo9SsPJe4sX2iUJfodygOmhe1xxCZXpVc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fi6bFnb1jYYOCEufEoKPIHN+nRItsmO021xCZ/k6O4J77R1MCEkGsVcZm2a9UEALg
	 3IsKVwqqwNTNwAgYPv/S0ouGOMpwURVkTuY2Q5iYp84Q0m8dILPqm4ZrstR/OwuSwN
	 P5or/PmT5UudDASXQK4TUo/nSEPKutPIJGoW+jwRhucyYeia9QA8t5DL9LgsSHxfgV
	 GFNX/VwSpUyIZLXyHTHt3sLWkoJD0Y8r1sxix58iK/P/NHRnamhl2wyIRIfa+hqxSH
	 +QziBIG4KXkrXmV7XYmJVJeh839nkWoy63UejKuUNql56yMqTP14b3QgabsHz85MIh
	 3x5fk4xVF+iLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] net: fec: Handle PTP initialization errors in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260820111416.97917-2-phucduc.bui@gmail.com>
References: <20260820111416.97917-1-phucduc.bui@gmail.com>
 <20260820111416.97917-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 11:14:41 +0000
Message-Id: <20260821111442.237021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch fixes an unconditional `fec_ptp_stop()` in the probe err=
or path but misses the identical bug in `fec_drv_remove()`, leading to a NU=
LL pointer dereference.
- [High] Use-after-free in devm-managed interrupt handlers during driver re=
moval due to premature `free_netdev()`.
- [High] PTP device is exposed to userspace before probe completes, leading=
 to potential bus faults on probe error paths.
- [High] `INIT_WORK(&fep->tx_timeout_work)` is called after `register_netde=
v()`, creating a race window where an uninitialized work queue can be sched=
uled.
--

--- Patch [2]: [PATCH 2/2] net: fec: Handle PTP initialization errors in pr=
obe ---
commit 41e2a49ed28a7c17df87f2ff80ee17b2b80b3801
Author: bui duc phuc <phucduc.bui@gmail.com>

net: fec: Handle PTP initialization errors in probe
   =20
Check the return value of fec_ptp_init() and abort the probe if PTP
initialization fails. Only call fec_ptp_stop() when PTP support was
initialized to avoid stopping an uninitialized PTP instance during error
handling.

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index ced4dbf8cd90f..b6c22d6c1e69a 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -5384,8 +5384,11 @@ fec_probe(struct platform_device *pdev)
>  		goto failed_reset;
> =20
>  	irq_cnt =3D fec_enet_get_irq_cnt(pdev);
> -	if (fep->bufdesc_ex)
> -		fec_ptp_init(pdev, irq_cnt);
> +	if (fep->bufdesc_ex) {
> +		ret =3D fec_ptp_init(pdev, irq_cnt);
> +		if (ret)
> +			goto failed_reset;
> +	}

[Severity: High]
This is a pre-existing issue, but does fec_ptp_init() expose the PTP device
to userspace before the probe completes?

drivers/net/ethernet/freescale/fec_ptp.c:fec_ptp_init() {
    ...
    fep->ptp_clock =3D ptp_clock_register(&fep->ptp_caps, &pdev->dev);
    ...
}

This makes the character device accessible to userspace before network devi=
ce
registration completes. If register_netdev() fails later in fec_probe(), the
error path shuts down hardware clocks.

If userspace accesses the PTP device concurrently during this window (e.g. =
by
issuing an ioctl), could the PTP callbacks attempt to access disabled
hardware registers?

> =20
>  	ret =3D fec_enet_init(ndev);
>  	if (ret)
[ ... ]
> @@ -5457,7 +5460,8 @@ fec_probe(struct platform_device *pdev)
>  failed_irq:
>  	fec_enet_deinit(ndev);
>  failed_init:
> -	fec_ptp_stop(pdev);
> +	if (fep->bufdesc_ex)
> +		fec_ptp_stop(pdev);

[Severity: High]
This isn't a bug introduced by this patch, but since you are fixing the
unconditional call to fec_ptp_stop() here in the probe error path, should we
also fix the exact same issue in fec_drv_remove()?

drivers/net/ethernet/freescale/fec_main.c:fec_drv_remove() {
    ...
    cancel_work_sync(&fep->tx_timeout_work);
    fec_ptp_stop(pdev);
    unregister_netdev(ndev);
    ...
}

When the driver is unbound from a device without PTP support,
fec_drv_remove() unconditionally calls fec_ptp_stop(). Since PTP was never
initialized, hrtimer_cancel() inside fec_ptp_stop() will read from a
zero-initialized timer, dereferencing a null base pointer.

[Severity: High]
This is a pre-existing issue, but does fec_drv_remove() have a use-after-fr=
ee
risk with devm-managed interrupts?

drivers/net/ethernet/freescale/fec_main.c:fec_drv_remove() {
    ...
    fec_enet_deinit(ndev);
    free_netdev(ndev);
}

The interrupt is requested with devm_request_irq() in fec_probe(), meaning
its lifetime extends beyond fec_drv_remove(). However, fec_drv_remove()
explicitly calls free_netdev(), freeing the ndev and fep structures.

If a spurious or shared interrupt fires after free_netdev() returns but
before devres executes free_irq(), could the interrupt handler dereference
the freed memory?

[Severity: High]
This isn't a bug introduced by this patch, but does the initialization order
in fec_probe() create a race window for tx_timeout_work?

drivers/net/ethernet/freescale/fec_main.c:fec_probe() {
    ...
    ret =3D register_netdev(ndev);
    if (ret)
        goto failed_register;
    ...
    INIT_WORK(&fep->tx_timeout_work, fec_enet_timeout_work);
    ...
}

Calling register_netdev() makes the network device visible to the system, so
userspace can configure the interface and start transmitting traffic.=20

If a hardware stall causes the ndo_tx_timeout callback to be invoked before
INIT_WORK() executes, could schedule_work(&fep->tx_timeout_work) operate on
an uninitialized work_struct?

>  failed_reset:
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820111416.9791=
7-1-phucduc.bui@gmail.com?part=3D2
