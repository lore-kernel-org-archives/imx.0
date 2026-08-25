Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390443F39D4
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 10:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652540; cv=none; b=mfh/JRqenwt8HgYpMIBh2fRVNqBiedmUotEV5aC75dIWM07sIgIg7mnjXE7rm88XHVAzmVeiB7Hgw8sPF/ch0MTiIU3eJh4HB+GSTY3f24/xFCbJGYTbMGZjYhEyXCDVmDNtfrcCXh7zJ69KoI89E4U4QgBHOSlkDR495TdIx8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652540; c=relaxed/simple;
	bh=wVZTcqcqcdSQnSU/+w3LlNB1rUtZi/d//9oYVZLFX1o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZfOiIjJjo+aYEFcFD27XciayeqQ8MOS2PKrnSWJdorko3kPeUZaeMpSz7YojdQmt5UBoUMMITDX6EOL4dJogT5a51oqv1lkKU4rZVTUu0OyoodYROBCABuhBs59vHS/i824cqOwbq3YA1tgQS9Ly4THUA/Or2k9RyzAXAlLnlQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igCD4/3f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igCD4/3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830171F00A3A;
	Tue, 25 Aug 2026 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787652538;
	bh=q/ZAlA77QzzHm6mhu2+J/EcTeMzZkuBjKln5jgwwJA8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=igCD4/3fcPtynQ2yaMOQYUMYQHqIBhEUUVO2r7EhclllR4wHXaX2c8r6/PlC3xK+R
	 YXxXgeM/5pyvs8qOMw5MwRVLZmTDH+PzQ0Mk5lyB3M0wdizmp7UqAcBbJjKUNzeDIP
	 zi9Pu9GNEzMCG4jHNOmMvpivPL8Iz2DYuQcaKmwm6SzzvPxCoJ245I23iJTJCE9itx
	 DouN82XmavyTOgO/l2JD20XwKlGeL2OxzroHl8PofFMAba3XoSXHPwqBbyrSHXJEr7
	 MXkcrVtcXcBFW/OIItdGedp2ZNmgkYjl1mqqEUI/py+GN0x3r3ynPMt6YP9Hws78rW
	 10lN6o+5AKSMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: fec: only stop PTP if it was initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260824100834.31655-1-phucduc.bui@gmail.com>
References: <20260824100834.31655-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 10:08:58 +0000
Message-Id: <20260825100858.830171F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incomplete fix leads to NULL pointer dereference in `fec_drv_remov=
e()` via uninitialized hrtimer cancellation.
- [High] Use-after-free (UAF) due to improper work cancellation order in `f=
ec_drv_remove()`.
- [High] Use-after-free (UAF) due to improper timer cancellation order in `=
fec_ptp_stop()`.
- [High] Unprotected hardware access leading to kernel panic on timer expir=
y with clocks disabled.
--

--- Patch [1]: [PATCH net] net: fec: only stop PTP if it was initialized ---
commit 1bdf32b63293bc50d538fd180f2074583880906f
Author: bui duc phuc <phucduc.bui@gmail.com>

net: fec: only stop PTP if it was initialized

fec_ptp_init() is only called when fep->bufdesc_ex is available.
However, fec_probe() unconditionally calls fec_ptp_stop() on the
failed_init path.

Check fep->bufdesc_ex before calling fec_ptp_stop() to avoid stopping
PTP when it was not initialized.

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
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
This is a pre-existing issue, but since this patch fixes the missing
check in the probe error path, should we also add the same check to
fec_drv_remove()?

fec_drv_remove() calls fec_ptp_stop() unconditionally:

fec_drv_remove()
        ...
        cancel_work_sync(&fep->tx_timeout_work);
        fec_ptp_stop(pdev);
        unregister_netdev(ndev);
        ...

If the device is unbound via sysfs and fep->bufdesc_ex is false, this
will call hrtimer_cancel() on an uninitialized perout_timer, which could
cause a null pointer dereference.

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a potential
use-after-free in the same device removal path:

fec_drv_remove()
        ...
        cancel_work_sync(&fep->tx_timeout_work);
        fec_ptp_stop(pdev);
        unregister_netdev(ndev);
        ...

Since cancel_work_sync() happens before unregister_netdev(), couldn't
a concurrent tx timeout call schedule_work(&fep->tx_timeout_work)
again before the network device is fully unregistered?

[Severity: High]
This is another pre-existing issue, but looking at fec_ptp_stop(), does the
order of cleanup create a race condition?

fec_ptp_stop()
        ...
        hrtimer_cancel(&fep->perout_timer);
        if (fep->ptp_clock)
                ptp_clock_unregister(fep->ptp_clock);

If a concurrent userspace PTP_CLK_REQ_PEROUT ioctl calls
fec_ptp_enable() before ptp_clock_unregister() finishes, could the
timer be re-armed after it was cancelled, leading to a use-after-free
when the timer expires later?

[Severity: High]
This is a pre-existing issue, but is it possible for the perout_timer
to fire when the hardware clocks are disabled?

When the interface is brought down, the clocks are disabled:

fec_enet_close()
        ...
        fec_enet_clk_enable(ndev, false);

If a delayed ptp perout timer expires after this, the timer callback
will unconditionally access hardware registers:

fec_ptp_pps_perout()
        ...
        /* Get the current ptp hardware time counter */
        ptp_hc =3D fec_ptp_read(&fep->cc);

Could this trigger a synchronous external abort on platforms where the
clocks are disabled?

>  failed_reset:
>  	pm_runtime_put_noidle(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824100834.3165=
5-1-phucduc.bui@gmail.com?part=3D1
