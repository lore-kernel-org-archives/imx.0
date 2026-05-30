Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BC72EBBB7
	for <imx@lists.linux.dev>; Sat, 30 May 2026 06:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780121958; cv=none; b=P0dL8m8d3rATvTPfe7PQjyifQKhQ5+jBKPyjuXOBhVzIdQCv8iPAQX0IFScVprJx9jL6XfPLg7LLZCR2bFy0Xfb4M3c4Mg/Zv0KFAemT1PzEACognNI3N0JvBmQA1zuoVryk/N2HrFogGSAHGB/2q/g1sUEtV8hr3m2HUi2Rdeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780121958; c=relaxed/simple;
	bh=LU8R3grZS1HgFjYs0j+8cDmH6VU9MSyPhEnylDPnVSc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qbDZtWl8YjCUGGpGwxXeDxVLoaHNAAma9Qdcrtm5yPINU/Qu5RzmcFHbIV8sdA8NWYY/5craBdrO/CARsd27Xx5NfqalaeOVLk4Q9o0vIUuQGUXCHNa8xLzFz1mwPJBGqisq/0xi596fXTw0ruksasyyYMaAWQ64MLUFND23x5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3basPrU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3basPrU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261401F00893;
	Sat, 30 May 2026 06:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780121956;
	bh=1r46eJmJHvJpe8umtgrqO/hgJZY/a8H2KUXZFDHGoVE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B3basPrUM4UouOXrOnacWLjMrqNRwHIqIWCLKDvH9kI3b11UJ4JnH/wlewRAxqe8B
	 mxaFLqMoSyynK0XmDjSckNvI1jnvECyjg0NjWJ4pvD1bveWpRlXxstV7NUil4D73bz
	 19Hacdz4YJGCCR6yPE0V35zFYxwryPDF3eGc4XSh0wl1VzDAIkYEA0meZ+lunuHiFV
	 8qX0g9McTXJL978C6RoNHFgvFFFQP5r17rEoCjuFIyMUITeWG2mNPI/qg9YBkZCsRK
	 vSgkEBNMZRPqFWfow5LPNNqU8bSFUjrJbL0awAQ+FLGC1jlXrDK3D6N/i8lzADuf80
	 oXxrXUf2H0H2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] net: fec: fix pinctrl default state restore order on
 resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260529-b4-fec-resume-pinctrl-order-v3-1-6eda0f592fca@vaisala.com>
References: <20260529-b4-fec-resume-pinctrl-order-v3-1-6eda0f592fca@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 06:19:15 +0000
Message-Id: <20260530061916.261401F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [Medium] The error path for `fec_enet_clk_enable()` in `fec_resume()` lac=
ks a rollback for `pinctrl_pm_select_default_state()`, leaving pins active =
on failure.

Pre-existing issues:
- [High] The return value of `pm_runtime_force_resume(dev)` is ignored in `=
fec_resume()`, potentially leading to a kernel panic from unclocked registe=
r access.
- [High] Missing rollback and resource cleanup when `pm_runtime_force_suspe=
nd(dev)` fails in `fec_suspend()`.
- [High] Unbalanced `regulator_disable` in the `fec_resume()` error path if=
 Wake-on-LAN is enabled.
- [High] Incorrect teardown order of `tx_timeout_work` in `fec_drv_remove()=
` leads to a potential Use-After-Free.
- [High] NAPI is enabled after hardware interrupts are re-enabled in `fec_r=
esume()`, potentially causing lost interrupts.
--

commit 7f067374b27c3332158fb55d7eb7cfaf9e7c00c3
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>

net: fec: fix pinctrl default state restore order on resume

This commit reorders the pinctrl default state selection and clock enable
in fec_resume(). By restoring the default pinctrl state before enabling
clocks, it ensures that phy reset pulses have a physical effect and fixes
unreliable link establishment after system resume.

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index f89aa94ce0202..6ebde65d7f1b8 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -5594,6 +5594,7 @@ static int fec_resume(struct device *dev)
>  		if (fep->rpm_active)
>  			pm_runtime_force_resume(dev);

[Severity: High]
This is a pre-existing issue, but does ignoring the return value of
pm_runtime_force_resume() potentially lead to a kernel panic?

If fec_runtime_resume() is invoked and clk_prepare_enable() fails, an error
is returned, but it is ignored here. The code then proceeds to call
fec_restart(), which accesses hardware registers without the clocks enabled.
Could this cause a synchronous external abort?

> +		pinctrl_pm_select_default_state(&fep->pdev->dev);
>  		ret =3D fec_enet_clk_enable(ndev, true);
>  		if (ret) {

[Severity: Medium]
If clock enablement fails, the function jumps to failed_clk and returns
without reverting the pinctrl state via pinctrl_pm_select_sleep_state().

Does this cause a state leak where the device pins remain active
indefinitely despite the resume failing?

[Severity: High]
This is a pre-existing issue, but is the regulator disable balanced in the
fec_resume() error path if Wake-on-LAN is enabled?

The phy regulator is only enabled if Wake-on-LAN is disabled:

fec_resume() {
    if (fep->reg_phy && !(fep->wol_flag & FEC_WOL_FLAG_ENABLE)) {
        ret =3D regulator_enable(fep->reg_phy);
        ...

However, if fec_enet_clk_enable() fails, the failed_clk error path
unconditionally calls regulator_disable(fep->reg_phy).

If Wake-on-LAN was enabled, could this cause a regulator reference count
underflow, unexpectedly powering off other devices sharing the same
regulator?

>  			rtnl_unlock();

[ ... ]

> @@ -5610,8 +5611,6 @@ static int fec_resume(struct device *dev)
>  			val &=3D ~(FEC_ECR_MAGICEN | FEC_ECR_SLEEP);
>  			writel(val, fep->hwp + FEC_ECNTRL);
>  			fep->wol_flag &=3D ~FEC_WOL_FLAG_SLEEP_ON;
> -		} else {
> -			pinctrl_pm_select_default_state(&fep->pdev->dev);
>  		}
>  		fec_restart(ndev);

[Severity: High]
This is a pre-existing issue, but is it possible for an interrupt to be
lost here?

fec_restart() explicitly enables hardware interrupts, but napi_enable()
is called afterwards in fec_resume(). If an interrupt fires in this window:

fec_enet_interrupt()
   ...
   napi_schedule_prep()

Could it clear the hardware event but fail to schedule napi because
napi_schedule_prep() returns false, stalling packet processing?

>  		netif_tx_lock_bh(ndev);

[ ... ]

[Severity: High]
This is a pre-existing issue, but does fec_suspend() handle
pm_runtime_force_suspend() failures correctly?

If pm_runtime_force_suspend() fails, fec_suspend() unlocks rtnl_lock and
returns the error early. This skips regulator_disable() and leaves the
network interface permanently detached with napi and the phy stopped.

If the system aborts suspend, does the device remain broken?

[Severity: High]
This is a pre-existing issue, but is there a potential use-after-free
in fec_drv_remove()?

cancel_work_sync(&fep->tx_timeout_work) is called before
unregister_netdev(ndev). During unregister_netdev(), the networking core
watchdog can still fire and schedule tx_timeout_work.

Since the scheduled work item is left pending and executes after fep
has been freed, can this lead to a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-b4-fec-res=
ume-pinctrl-order-v3-1-6eda0f592fca@vaisala.com?part=3D1
