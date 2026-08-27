Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19793F9287
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 10:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826934; cv=none; b=Hjrlp6slBsayZYkb9c+fuvWr9xCHzE8xboTRDq2bQffi7UQbdwXGeuyK01vxOIr4D6yjzP3ujtnpQWORakxH93vI1VOUJptv9rVLd/Jw1NcudoZlo8VMCQHpOjkbJRE3gksuJhnUX5B6XWh9BEMIblSTtY2zoHvSSLDIIqxgfrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826934; c=relaxed/simple;
	bh=IcM5iuMjxjTGinZeFjORo6UmefEXNjgyt5SQkssva/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lRjbeolGKBNhsljzzm8JQkNAPTJgEA7uVhRD2At5bFzsepAKtOcCJlIds4ZQz/MEyw1qE3nYORfC5qZVhWuCQeyOtSvRinR1BnUMCrFWWbJUvw3EzsPoXxlwMUUL6pnmcEGsnWxYEc/SixbxsaPrzuP6CHuGD2M2vFNZCtxFIQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXiQNqZS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXiQNqZS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3031F00A3A;
	Thu, 27 Aug 2026 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787826932;
	bh=qzc+huCYc/GioTWJm4RalmvHGPm+hAUKDIvi3Wkv3LE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nXiQNqZSmgXXzYuK1OZIPymDSDD0sbDQdOCX6HTHhO/PRzvgfMbS9RJ4Crj2HThH6
	 NpAxpJ3O3yspqexAaNaTJQHaX/nOKQu61FVg8hCa81swGDS82PT0EbnQywJw4Gi4/n
	 HmuG1WCLpBoxMa4S6hVpUvuGb424pVfCJ2tofpbRf+AX+MZwai/P+02+w5eIGZZCKA
	 2LckTIlK2BzVry2qUDKCQWadizoq3OPuJfwHJEy3KOF6gz/DI7YfPG01cylPS4tBv0
	 EWunKZlwKmSyCmIVIQcapt5bkJ9rXzB5sFuV2vY7e7ytoCCTC7pYWozvnlmzJ6qvQz
	 GmVaUblJDnv0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2] net: fec: only stop PTP if it was initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260826103428.32807-1-phucduc.bui@gmail.com>
References: <20260826103428.32807-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 10:35:31 +0000
Message-Id: <20260827103532.2E3031F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Hardware access with disabled clocks in `fec_drv_remove()` cau=
sing kernel panic
- [Critical] PTP clock ioctls access hardware directly without verifying cl=
ock status, leading to kernel panic
- [High] Race condition causing Use-After-Free during `fec_drv_remove()` wa=
tchdog teardown
- [High] Initialization order race in `fec_probe()` causing workqueue corru=
ption
- [High] Race condition causing Use-After-Free during PTP timer teardown in=
 `fec_ptp_stop()`
- [High] Use-After-Free in probe error path due to premature explicit freei=
ng of network device
- [High] Concurrent `fec_pps_interrupt` execution and `fec_ptp_stop` causes=
 Use-After-Free
--

commit e0b7dcf388492f09f947c8b3bfed37b87cb8fc59
Author: bui duc phuc <phucduc.bui@gmail.com>

    net: fec: only stop PTP if it was initialized

    fec_ptp_init() is only called when fep->bufdesc_ex is available.
    However, fec_probe() unconditionally calls fec_ptp_stop() on the
    failed_init path, and fec_drv_remove() unconditionally calls
    fec_ptp_stop() during device removal.
   =20
    Check fep->bufdesc_ex before calling fec_ptp_stop() in both paths
    to avoid stopping PTP when it was not initialized.

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index ced4dbf8cd90f..794ec427b0ee6 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -5457,7 +5457,8 @@ fec_probe(struct platform_device *pdev)
>  failed_irq:
>  	fec_enet_deinit(ndev);
>  failed_init:
> -	fec_ptp_stop(pdev);
> +	if (fep->bufdesc_ex)
> +		fec_ptp_stop(pdev);

[Severity: High]
This is a pre-existing issue, but does the initialization order in
fec_probe() create a race condition that corrupts the workqueue?

Currently, the device is registered and exposed to the system before the TX
timeout work is initialized:

fec_probe() {
    ...
    ret =3D register_netdev(ndev);
    if (ret)
        goto failed_register;
    ...
    INIT_WORK(&fep->tx_timeout_work, fec_enet_timeout_work);
    ...
}

If a fast userspace actor brings the interface up and triggers a TX timeout
after register_netdev() but before INIT_WORK(), .ndo_tx_timeout (fec_timeou=
t)
could call schedule_work() on an uninitialized work structure, potentially
corrupting the workqueue. Should INIT_WORK() run before register_netdev()?

[Severity: High]
This is a pre-existing issue, but is there a use-after-free risk in the pro=
be
error path?

At the end of fec_probe():

failed_ioremap:
    free_netdev(ndev);
    return ret;

Since devm_request_irq() was used for the interrupt handler, the IRQ is not
freed until after fec_probe() returns. Because fec_enet_init() writes to the
MAC interrupt mask register to enable TX interrupts, a pending interrupt
could fire during this window.

If fec_enet_interrupt() executes, it would dereference the already-freed nd=
ev
pointer. Would it be safer to free the netdev via devres, or manually disab=
le
interrupts/free the IRQ before freeing ndev?

[Severity: High]
This is a pre-existing issue, but does the timer teardown sequence
in fec_ptp_stop() properly protect against concurrent ioctls?

fec_ptp_stop() {
    ...
    cancel_delayed_work_sync(&fep->time_keep);
    hrtimer_cancel(&fep->perout_timer);
    if (fep->ptp_clock)
        ptp_clock_unregister(fep->ptp_clock);
}

The PTP timers are cancelled before the PTP clock character device is
unregistered. Could a concurrent ioctl (like PTP_PEROUT_REQUEST) invoke
fec_ptp_enable() and re-arm the timers during unregistration?

If so, could the re-armed timers fire after the driver is removed and access
freed memory? Should ptp_clock_unregister() be called first to block new
ioctl requests?

[Severity: High]
This is a pre-existing issue, but does fec_ptp_stop() synchronize with a
currently running PPS interrupt handler?

fec_ptp_stop() disables the PPS interrupt at the hardware level but does not
call synchronize_irq(). It then unregisters the PTP clock:

    if (fep->ptp_clock)
        ptp_clock_unregister(fep->ptp_clock);

If a concurrent fec_pps_interrupt() is running on another CPU, could it
dereference fep->ptp_clock via ptp_clock_event(fep->ptp_clock, &event) after
the clock instance has been unregistered and freed?

[Severity: Critical]
This is a pre-existing issue, but do the PTP clock ioctls safely access
hardware when the device is runtime-suspended?

Functions like fec_ptp_adjfine() perform direct register writes:

fec_ptp_adjfine() {
    ...
    tmp =3D readl(fep->hwp + FEC_ATIME_INC) & FEC_T_INC_MASK;
    tmp |=3D corr_ns << FEC_T_INC_CORR_OFFSET;
    writel(tmp, fep->hwp + FEC_ATIME_INC);
}

Unlike fec_ptp_gettime(), which checks fep->ptp_clk_on under a mutex,
fec_ptp_adjfine() doesn't seem to verify if the underlying clocks are activ=
e.
If an ioctl triggers this while the network interface is down and clocks are
disabled, could this direct hardware access cause a synchronous abort
and crash the system?

>  failed_reset:
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);

[ ... ]

> @@ -5499,7 +5500,8 @@ fec_drv_remove(struct platform_device *pdev)
>  			ERR_PTR(ret));
> =20
>  	cancel_work_sync(&fep->tx_timeout_work);

[Severity: Critical]
This is a pre-existing issue, but does ignoring a runtime PM resume failure
here lead to a kernel panic?

Just above this context, pm_runtime_get_sync() is called:

    ret =3D pm_runtime_get_sync(&pdev->dev);
    if (ret < 0)
        dev_err(&pdev->dev, ...);

If pm_runtime_get_sync() fails, the device clocks remain disabled. However,
execution proceeds to fec_ptp_stop(), which eventually calls
fec_ptp_enable_pps() and performs direct register writes
(writel(0, fep->hwp + FEC_TCSR(fep->pps_channel))).

Could writing to the SoC registers while their backing clocks are disabled
cause a synchronous external abort? Should the teardown path gracefully
handle this resume failure?

> -	fec_ptp_stop(pdev);
> +	if (fep->bufdesc_ex)
> +		fec_ptp_stop(pdev);
>  	unregister_netdev(ndev);

[Severity: High]
This is a pre-existing issue, but does cancelling the timeout work before
unregistering the network device leave a race condition window?

In the current sequence:

    cancel_work_sync(&fep->tx_timeout_work);
    if (fep->bufdesc_ex)
        fec_ptp_stop(pdev);
    unregister_netdev(ndev);

The network device is still fully active when cancel_work_sync() is called.
Could the network core's watchdog timer fire right after the cancellation,
invoke .ndo_tx_timeout, and re-queue the work item via schedule_work()?

If that happens, and the driver subsequently unregisters and frees the devi=
ce,
could the re-armed work item execute later and cause a use-after-free?

>  	fec_enet_mii_remove(fep);
>  	if (fep->reg_phy)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826103428.3280=
7-1-phucduc.bui@gmail.com?part=3D1
