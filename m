Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6DD2E7382
	for <imx@lists.linux.dev>; Sat, 30 May 2026 06:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780121761; cv=none; b=hBgE2l1XkD1jZCnhuLOjmUM3tlGtwJmaTX8NpYQNrPdWLa5zerM6O/cnw/7Rd6qcZLat/FTAltcfUv7f9VtFkHc3lOn0KFWmpeHews4+Cd+NFbvjS+bIThBTCojizuyQ00jz32qQAg5HdkH0sh/JHRUSl4CaMQaS+YFvJwhjGzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780121761; c=relaxed/simple;
	bh=tZGOXPDKfSSyyI0Lgg/01BFhszUYSu117RsFdOYugys=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rzDxxbsk4Yl2FlkUlFEoU73P2ZyTYSyNhkaofZ9yQkX1MlOPpv98Z+LPbI3Lkitf8AFTL92AS9yGzmVKZdl10O4O7bG/iN7rbdaHB2ltx6aaNzD95eP0KNcycbMG1D2y10UEJ4aALus/q6SOWtCQwK/26iCtdfALt3OXlFGNVTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6gEF4mv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6gEF4mv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596101F00893;
	Sat, 30 May 2026 06:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780121759;
	bh=E176dSys63O+Uz37YB6YNqFPO/3qNH2oDBSrqE6gh28=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j6gEF4mvBQ/xXL+LjbEqhX4V/nzy4pa1CLpH5DalFOsH/1W8OZyhqWw4uq7NKRvR9
	 qBHk+EYHeQ1FM1zzCBs5ei0LxFQP9xVchzOfTS3POkCMEQJhXyRQGZJvf63UTQfmMG
	 0n1QZy38FokqJQVHeFgQ8pXt86Q9Y7am+ECAw7KfkYXhXdspX0X1/NLyWaSdOKtsMt
	 6UpN51JtiPO6LAD6tb3EisZeBBjeHAnHgYUMWshkTlLlJhKmTnJiUkO25SrsZFz3R+
	 j7vRMH4wOh77fab3dZkYeyrtjkLPkt1F3nr514T15biVQyid0ZvG4oX+1MRVOC9jUg
	 TAcK92ZO/y3dg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] net: fec: fix pinctrl default state restore order on
 resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260529-b4-fec-resume-pinctrl-order-v3-1-56bb52b80ebf@vaisala.com>
References: <20260529-b4-fec-resume-pinctrl-order-v3-1-56bb52b80ebf@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 06:15:58 +0000
Message-Id: <20260530061559.596101F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The return value of `pm_runtime_force_resume()` is ignored in `fec=
_resume()`, potentially leading to a synchronous external abort.
- [High] Unbalanced `regulator_disable()` in the `fec_resume()` error path =
when Wake-on-LAN (WoL) is enabled.
- [High] Race condition in `fec_drv_remove()` with `tx_timeout_work` leadin=
g to a Use-After-Free.
- [High] The error path in `fec_resume()` fails to revert the effects of `p=
m_runtime_force_resume()`, leaking clocks and PM state.
--

commit c65b833021159f6537105f2b80073f286520673a
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>

net: fec: fix pinctrl default state restore order on resume

This commit changes the order in fec_resume() so that the default pinctrl
state is restored before enabling the clocks. This fixes an issue where PHYs
were not receiving a hardware reset pulse after clock enable because the
GPIO pin was still in sleep state.

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index f89aa94ce0202..6ebde65d7f1b8 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -5594,6 +5594,7 @@ static int fec_resume(struct device *dev)
>  		if (fep->rpm_active)
>  			pm_runtime_force_resume(dev);

[Severity: High]
This is a pre-existing issue, but the return value of
pm_runtime_force_resume() is ignored here. If this call fails (for example,
due to clock enablement failure), the bus clocks will remain disabled.

When fec_restart() is subsequently called, it directly accesses memory-mapp=
ed
hardware registers. Can accessing these registers without the bus clocks
enabled result in a synchronous external abort and a kernel panic?

> [ ... ]

While reviewing this code, I also noticed a few other pre-existing issues
related to the error path in fec_resume():

drivers/net/ethernet/freescale/fec_main.c:fec_resume() {
    ...
	if (fep->reg_phy && !(fep->wol_flag & FEC_WOL_FLAG_ENABLE)) {
		ret =3D regulator_enable(fep->reg_phy);
        ...
failed_clk:
	if (fep->reg_phy)
		regulator_disable(fep->reg_phy);
	return ret;
}

[Severity: High]
This isn't a bug introduced by this patch, but the error path appears to
have an unbalanced regulator_disable() call when Wake-on-LAN is enabled.

At the start of fec_resume(), the PHY regulator is only enabled if WoL is
NOT enabled. If a subsequent step like fec_enet_clk_enable() fails, the
code jumps to this failed_clk label and unconditionally disables the
regulator.

Does this corrupt the regulator's use count and potentially power off the
PHY unexpectedly?

[Severity: High]
This is another pre-existing issue in this same error path. If
pm_runtime_force_resume() succeeded earlier in the function, it
transitioned the device to RPM_ACTIVE and enabled the clocks.

If fec_enet_clk_enable() then fails, we return an error without calling
pm_runtime_force_suspend() or otherwise reverting the runtime PM state.

Does this leave the device stuck in an inconsistent active PM state with
leaked AHB/IPG clocks?


I also noticed an unrelated pre-existing issue in fec_drv_remove():

drivers/net/ethernet/freescale/fec_main.c:fec_drv_remove() {
    ...
	cancel_work_sync(&fep->tx_timeout_work);
	fec_ptp_stop(pdev);
	unregister_netdev(ndev);
    ...
}

[Severity: High]
This is a pre-existing issue, but calling cancel_work_sync() before
unregister_netdev() seems to create a race condition.

If a transmit timeout occurs immediately after this call but before
unregister_netdev() finishes taking the interface down, the networking
stack's watchdog timer will call the driver's ndo_tx_timeout callback,
which re-arms the work via schedule_work().

When the scheduled work eventually executes, it will access the freed
structures. Could this result in a Use-After-Free crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-b4-fec-res=
ume-pinctrl-order-v3-1-56bb52b80ebf@vaisala.com?part=3D1
