Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427DB492E53
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 02:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788921520; cv=none; b=JHosi74DIO5IsOGKQJBvmTUdqpRS4kMnrYngsbJNiRakfJA6etmb+2KZaE13XQ/0rPeCid2HsZnrRGZvgxZtoCV+AAoQSsO+sG7htS41qfQjz+n/Fbyi1uh+nXY02oIwdOOalE8/+UduJMdjzhHZdXjbrrW/2U9vRV8wzbfA45k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788921520; c=relaxed/simple;
	bh=Knrx5j4exp2wMsnAS7ChlhkkDNQF9ZFvrWZX8iIh5HI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BVT9YYVPGvPCSQdBfZJX+z69bDsVTgrpEO5V4SRu2dlO8csjtEAFfQbRD4d1mw41+5APXtgz1Tkl7cSMS0UOohB+72QkaVX0uJFGuPzHQk7B9oicDtsSIyzIZBt8J7B5K1p2TwOM/a7laNkjWPpVmwL+j29hkEQdqEOMxd4DPV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTwqPyXf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTwqPyXf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961181F00A3A;
	Wed,  9 Sep 2026 02:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788921518;
	bh=e3gLjR0KbEy+JUYTEW4B6k29GXTnwm75TFd12V3bkzc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JTwqPyXfhhQ5a/tIAr81HPmIhSC787llW+ZC3sbWA1xa+mwpBHoUVzITQevUs8hN3
	 snm3PiF3QjzA7MUYwwl04Ie10z197zokhn5YRExygkTXr1ww1xkVkzveWYo44Wp5as
	 dcMwvxOf865ufY3RqZpZVHV4WVJIi0sjt6+pUtQ43Oe5FpEYi6ECCI5Pgp+xWuD5H7
	 sLtlwPQ3T+yM5W08DvKjgAaaUsBdLMKgpwJ95DD0SRzCgm7acS3AeXHITx7aYD3PIk
	 9XvV22zrEz6DlSBSDlApZYX14cyd2fWnp/0GeojcPDcAw11xlWflGsd1RZ7SphqabT
	 +dYhj+A+0KfrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2 2/2] net: fec: free the PPS interrupt before
 tearing down the PHC and netdev
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260908-fec-ptp-pps-event-uaf-v2-2-2a1d57121ade@cherr.cc>
References: <20260908-fec-ptp-pps-event-uaf-v2-0-2a1d57121ade@cherr.cc>
 <20260908-fec-ptp-pps-event-uaf-v2-2-2a1d57121ade@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 02:38:38 +0000
Message-Id: <20260909023838.961181F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The main ENET interrupts (`fec_enet_interrupt`) are vulnerable to =
a use-after-free because they are devm-managed and outlive `free_netdev()`.
- [High] Teardown asymmetry allows tx_timeout_work to be rescheduled after =
cancellation.
- [High] Teardown asymmetry allows perout_timer to be re-armed after cancel=
lation by a concurrent PTP ioctl.
--

commit e1540d76c9156ff39cff7d5d468d67d8d99e570a
Author: Shengzhuo Wei <me@cherr.cc>

net: fec: free the PPS interrupt before tearing down the PHC and netdev

This commit resolves a use-after-free issue by explicitly releasing the
PPS interrupt via devm_free_irq() in fec_ptp_stop(). This ensures the
interrupt handler is removed before the PHC and netdev are torn down.

> diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ether=
net/freescale/fec_ptp.c
> index 56801c2009d59..567ea2a461173 100644
> --- a/drivers/net/ethernet/freescale/fec_ptp.c
> +++ b/drivers/net/ethernet/freescale/fec_ptp.c
[ ... ]
> @@ -861,6 +865,12 @@ void fec_ptp_stop(struct platform_device *pdev)
> =20
>  	cancel_delayed_work_sync(&fep->time_keep);
>  	hrtimer_cancel(&fep->perout_timer);

[Severity: High]
This is a pre-existing issue, but does this teardown asymmetry allow the
perout_timer to be re-armed after cancellation?

In fec_ptp_enable(), the ptp_clk_mutex is unlocked before hrtimer_start()
is called:

drivers/net/ethernet/freescale/fec_ptp.c:fec_ptp_enable() {
    ...
    hrtimer_start(&fep->perout_timer, timeout, HRTIMER_MODE_REL);
}

fec_ptp_stop() cancels the timer here, but doesn't hold any locks preventing
fec_ptp_enable() from running, nor does it immediately block new ioctls. Co=
uld
a concurrent PTP ioctl pass the clock-enabled check, get preempted, and then
call hrtimer_start() after the hrtimer_cancel() call above, causing the tim=
er
to fire on freed memory?

> +
> +	if (fep->pps_irq >=3D 0) {
> +		devm_free_irq(&pdev->dev, fep->pps_irq, ndev);
> +		fep->pps_irq =3D -1;
> +	}
> +
>  	if (fep->ptp_clock)
>  		ptp_clock_unregister(fep->ptp_clock);
>  }

While reviewing this patch, I noticed a couple of other pre-existing teardo=
wn
issues in the FEC driver that might be vulnerable to similar races.

[Severity: High]
This isn't a bug introduced by this patch, but are the main ENET interrupts
vulnerable to a use-after-free during device removal?

The main interrupts are requested as devm-managed resources in fec_probe():

drivers/net/ethernet/freescale/fec_main.c:fec_probe() {
    ...
    ret =3D devm_request_irq(&pdev->dev, irq, fec_enet_interrupt, 0,
                           pdev->name, ndev);
    ...
}

In fec_drv_remove(), the netdev is freed before these devm-managed
interrupts are released:

drivers/net/ethernet/freescale/fec_main.c:fec_drv_remove() {
    ...
    free_netdev(ndev);
    ...
}

Since devm-managed resources are freed after the remove callback returns,
could an in-flight or spurious interrupt fire after free_netdev() and cause
fec_enet_interrupt() to dereference the freed ndev pointer?

[Severity: High]
This is also a pre-existing issue, but does the teardown sequence allow
tx_timeout_work to be rescheduled after it has been canceled?

In fec_drv_remove(), the work is canceled before the netdev watchdog is
stopped:

drivers/net/ethernet/freescale/fec_main.c:fec_drv_remove() {
    ...
    cancel_work_sync(&fep->tx_timeout_work);
    unregister_netdev(ndev);
    ...
}

If the netdev watchdog fires in this window before unregister_netdev()
executes, it calls the ndo_tx_timeout handler which re-arms the work:

drivers/net/ethernet/freescale/fec_main.c:fec_timeout() {
    ...
    schedule_work(&fep->tx_timeout_work);
    ...
}

Could this cause the work item to be executed after the netdev has been
freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908-fec-ptp-pp=
s-event-uaf-v2-0-2a1d57121ade@cherr.cc?part=3D2
