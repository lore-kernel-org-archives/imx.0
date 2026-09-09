Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D014F21CC5C
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 16:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971650; cv=none; b=aGYbPQzX4CN2dZTq8whK1Y8+SATYflns7IdT0JXT9ICRHFplXSnbaQPpxVvPKEv5wLdPUV1UWvYa3ZsS0im5eszByQqW4jyHiP3GZqk3GQfHrXmHT6ZkPTeQ40iPDufd+xCiW0wWXbtQ6cW7rgXexCjknr+ISlq2Ah0krWmxKOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971650; c=relaxed/simple;
	bh=P0OrzJmYkTSuAej7Eb491LjPILFLlDzEgjtAYx224vE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZMBy5wx9H5WvbcbLXOBXAypzsnoOA4GYyISbraWViVl/ESp1QFF3at9ae21KZtpdXmWt02C8h8VDXjUDFOXB3hU9Eqwd84HTPk5htn3w2djBkSZetLrbT6LyBL3nr8DkL1J1yKH+L+ritseUl9HxYzUmauvrITaTM8ICxBljqzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aCBycvxy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aCBycvxy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6DB1F00893;
	Wed,  9 Sep 2026 16:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788971648;
	bh=1ETxaHEB4Oqepp3a2ruYpkc423nqTJOrHlx/F+LqL70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aCBycvxyBolzYBq3QiNkv21LfzkJN796Bv4iRENXGcneC/dhTJ0osNaWevCBG0Pp/
	 U5i18gOvVqC8xYqC8/JiMkw6PXiUOYpicRLDI/Vxgxk2fSU5wMn0UZK78hODkhlSPJ
	 sxnC4o+45zNKIu+CX7UDFHZQL7i7kY/6qiBRjUWNE4Sl+chwC0Yf0C3yuOkUzXzGgK
	 FAO72nVHweFwgYMjX2/HqSqdGEjP6arfI8QzVNnzDENl5Ym9WtBogsPbpVlCei1L5R
	 SuDoeRdZwgljTMsiZVPpxw6zCqmAXAxHDELO56mftWYBceBlKUMLIxH5fmNdWxzA6n
	 eknB1eGwFrQmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3 1/2] net: fec: stop the PTP clock after the
 netdev is unregistered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260909-fec-ptp-pps-event-uaf-v3-1-bead12c29a16@cherr.cc>
References: <20260909-fec-ptp-pps-event-uaf-v3-0-bead12c29a16@cherr.cc>
 <20260909-fec-ptp-pps-event-uaf-v3-1-bead12c29a16@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 16:34:07 +0000
Message-Id: <20260909163408.4F6DB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The network device and its private data are freed before devm-mana=
ged interrupts are unregistered, leading to a potential Use-After-Free if a=
n interrupt fires during teardown.
- [High] The tx_timeout_work is cancelled before unregister_netdev, allowin=
g the watchdog to reschedule it before the device is fully closed, leading =
to a Use-After-Free.
- [High] PTP clock teardown race allows userspace to re-enable hardware int=
errupts and timers after they are disabled.
- [High] The PTP perout timer can fire and access hardware registers while =
the PTP clock is disabled.
- [Medium] The global variables `mii_cnt` and `fec0_mii_bus` are mutated wi=
thout locking during probe and remove.
--

commit d3e2d320b9d2d80773ed19690bcf91e7ed19f611
Author: Shengzhuo Wei <me@cherr.cc>

net: fec: stop the PTP clock after the netdev is unregistered

This commit moves the PTP clock stop function in the driver's remove
path to execute after the netdev is unregistered. This prevents a race
condition where concurrent ethtool callbacks might access a freed PTP
clock.

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
This is a pre-existing issue, but by cancelling tx_timeout_work before
unregister_netdev(ndev), is there a window where the network watchdog can
still fire and reschedule the work?

unregister_netdev() stops the network device watchdog via dev_close(). In
the window between cancel_work_sync() and dev_close(), a transmit timeout
can still occur. If this happens, fec_timeout() can run and reschedule
the work:

    schedule_work(&fep->tx_timeout_work);

Could this lead to a use-after-free on fep and ndev if the scheduled work
executes after the device teardown is complete?

> +	unregister_netdev(ndev);
>  	if (fep->bufdesc_ex)
>  		fec_ptp_stop(pdev);

[Severity: High]
This is a pre-existing issue, but could the PTP perout timer fire and
access hardware registers while the PTP clock is disabled?

When unregister_netdev() is called, it brings down the interface, which
calls fec_enet_close(). This in turn disables clk_ptp.

Because the perout_timer is not cancelled until later in fec_ptp_stop(),
the timer might fire after the clock is disabled. If this happens,
fec_ptp_pps_perout() will access PTP registers:

    temp_val =3D readl(fep->hwp + FEC_ATIME_CTRL);
    temp_val |=3D FEC_T_CTRL_PINPER;
    writel(temp_val, fep->hwp + FEC_ATIME_CTRL);

Without checking if the clock is running, wouldn't accessing these registers
trigger an external synchronous abort (kernel panic) on ARM?

[Severity: High]
This is also a pre-existing issue, but does fec_ptp_stop() leave a race=20
window that allows userspace to re-enable timers and interrupts?

Inside fec_ptp_stop(), timers and features are disabled before the PTP
clock is unregistered:

    hrtimer_cancel(&fep->perout_timer);

    if (fep->pps_irq >=3D 0) {
        free_irq(fep->pps_irq, ndev);
        fep->pps_irq =3D -1;
    }

    if (fep->ptp_clock)
        ptp_clock_unregister(fep->ptp_clock);

During this intermediate window, could concurrent userspace ioctls (such
as PTP_CLK_REQ_PPS) execute and re-enable the PPS hardware interrupt or
restart the hrtimer?

> -	unregister_netdev(ndev);
>  	fec_enet_mii_remove(fep);

[Severity: Medium]
This is a pre-existing issue, but is it safe to mutate the shared mii_cnt=20
variable without locking during probe and remove?

fec_enet_mii_init() increments mii_cnt, and fec_enet_mii_remove() decrements
it. The driver uses these static global variables to share a single MDIO
bus between multiple FEC MAC instances.

If instances probe or remove asynchronously, or via hotplug, could concurre=
nt
modifications corrupt the reference counter? This might lead to a memory le=
ak
or premature unregistration of an actively used MDIO bus.

>  	if (fep->reg_phy)
>  		regulator_disable(fep->reg_phy);

[Severity: High]
This isn't a bug introduced by this patch, but does the teardown sequence
leave the primary interrupt vulnerable to a use-after-free?

In fec_probe(), the primary interrupt is requested using a devm-managed
function:

    ret =3D devm_request_irq(&pdev->dev, irq, fec_enet_interrupt, 0,
                           pdev->name, ndev);

However, later in fec_drv_remove(), free_netdev(ndev) is called
synchronously. Since devres cleanup (which frees the IRQ) only happens afte=
r=20
fec_drv_remove() completes, the ndev pointer is freed while the IRQ is still
active. If a spurious or delayed interrupt fires in this window, it would
result in a use-after-free on ndev.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-fec-ptp-pp=
s-event-uaf-v3-0-bead12c29a16@cherr.cc?part=3D1
