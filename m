Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B778231832
	for <imx@lists.linux.dev>; Sat, 30 May 2026 00:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102109; cv=none; b=crYkZPKpKe1VlaHfu5uSPiXL0napebsHXSguuOzFKXyT3sfAshUzgtpv7YEqTEpsjVvG22z4sZFSmlJS3dL4Zm7Tu69Yjhod4esJwX6MA2sGf5rhp5AjigfH1kE+UAVJ4FYxhP9Isgw8/YMWhUqA2TBSDxYWHD5U2Lqd8ddNJZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102109; c=relaxed/simple;
	bh=hPWy4V2twjoDwb1tyjaGgfXRbTZenrDdAq8+MtlKRrE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=muKKEXHzBk2y+vQL5cdwvu9dtT/OEKMTcNgaReOsNDvMuabZUF5SHyF+xPPG8N5NLeIVSrOFAWs46s5OOqF9/YNSrNqgN+6QwFEAEiSFAMPf/VJnZtUGppHNwJhiCN0VpooQSNqpOz0PNgQ0pwfOxzwB7j/GJb4512JmmQvsmng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejoZWQz9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejoZWQz9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D972B1F00893;
	Sat, 30 May 2026 00:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102108;
	bh=Nw1BBJ3cyZGkUg62gXxM1YlyHrLm8o0oySBtFG/QkUI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ejoZWQz9RpgYtnxsBkaOqM+4ubtpbpOZXKxHyuHWutZEgPNH8Vck8lJWEin9NTnd+
	 DMzysu5d8hDeDZqeb7AURAHwObR7gzrtSb82J1M0IxbtmLh01y6JvS6baBXmbt4f3g
	 GYuvvL0ApLv9rPrFER/ihMdClzM3lVX+s2SJLn8zBuys6dYeVWKE0G8rm/NAwqrGUh
	 4KBlrChP0T35iwuDGJMHWLz5GJrMbsWT54XCKqjkvWhY1xsbUpnmIIh2V+vSQYjb4I
	 9I2iKC7sCt0DR5sRsyDSiBv+6dDo8nBVVfOYrXBtTJPNhPDu7IfIMopHXLLQpMshLZ
	 ymK/ZMfAk+6ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] net: fec: fix pinctrl default state restore order on
 resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260526-b4-fec-resume-pinctrl-order-v1-1-f2f926325424@vaisala.com>
References: <20260526-b4-fec-resume-pinctrl-order-v1-1-f2f926325424@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:48:27 +0000
Message-Id: <20260530004827.D972B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Missing pinctrl state rollback in the non-WoL error path of fec_=
resume().

Pre-existing issues:
- [High] Unbalanced regulator_disable() in the error path of fec_resume() w=
hen Wake-on-LAN is enabled.
- [High] The return value of pm_runtime_force_resume() is ignored, leading =
to a potential kernel panic.
- [High] The device is left in a permanently broken state if pm_runtime_for=
ce_suspend() fails in fec_suspend().
--

commit 59a1dced7a285c5b42fbbe817f6f458b3076e059
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>
Subject: net: fec: fix pinctrl default state restore order on resume

This patch fixes the pinctrl default state restore order on resume for the
non-WoL path. It ensures the default pinctrl state is restored before
enabling clocks, which fixes PHY reset issues for PHYs using
PHY_RST_AFTER_CLK_EN.

Fixes: de40ed31b3c5 ("net: fec: add Wake-on-LAN support")

>     In fec_resume(), fec_enet_clk_enable() is called before
>     pinctrl_pm_select_default_state() in the non-WoL path, inverting the
>     ordering used in fec_suspend() which correctly switches to the sleep
>     pinctrl state before disabling clocks.

[Severity: High]
This is a pre-existing issue, but looking at fec_suspend(), the driver
performs destructive teardown operations (stopping the PHY, detaching the
net device, disabling hardware clocks) before calling
pm_runtime_force_suspend().

If pm_runtime_force_suspend() fails, fec_suspend() immediately returns the
error. Because the suspend callback returned an error, the PM core will
abort the system suspend but will not call the resume callback for this
specific device.

Does this leave the network interface in a half-suspended, detached state
with no rollback, rendering it permanently unusable until it is manually
reset or unbound?

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index f89aa94ce0202..723af4c057d7a 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -5594,12 +5594,12 @@ static int fec_resume(struct device *dev)
>  		if (fep->rpm_active)
>  			pm_runtime_force_resume(dev);

[Severity: High]
This is a pre-existing issue, but the return value of
pm_runtime_force_resume() is ignored here.=20

If clock enablement fails internally, the driver continues executing and
calls fec_restart(), which directly writes to hardware registers.

Can this trigger a synchronous external abort and a fatal kernel panic on
ARM/i.MX platforms when writing to unclocked peripheral registers?

> =20
> -		ret =3D fec_enet_clk_enable(ndev, true);
> -		if (ret) {
> -			rtnl_unlock();
> -			goto failed_clk;
> -		}
>  		if (fep->wol_flag & FEC_WOL_FLAG_ENABLE) {
> +			ret =3D fec_enet_clk_enable(ndev, true);
> +			if (ret) {
> +				rtnl_unlock();
> +				goto failed_clk;
> +			}
>  			fec_enet_stop_mode(fep, false);

[ ... ]

>  		} else {
>  			pinctrl_pm_select_default_state(&fep->pdev->dev);
> +			ret =3D fec_enet_clk_enable(ndev, true);
> +			if (ret) {
> +				rtnl_unlock();
> +				goto failed_clk;
> +			}
>  		}

[Severity: Medium]
If fec_enet_clk_enable() fails here, we jump to failed_clk and return an
error without restoring the pinctrl state back to the sleep state.=20

Could this leave the pins in the active/default state while the device
fails to resume, potentially causing power leaks or pin contention?

[ ... ]

>  failed_clk:
>  	if (fep->reg_phy)
>  		regulator_disable(fep->reg_phy);
>  	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but when Wake-on-LAN is enabled, the initial
regulator_enable() is intentionally skipped at the start of fec_resume()
because the regulator was kept on during suspend.

If a subsequent operation like fec_enet_clk_enable() fails and jumps to
failed_clk, regulator_disable() is called unconditionally.

Could this unbalanced disable drop the regulator use count without a
matching enable in the WoL path? This might eventually cause a negative
use count warning or unexpectedly power down other devices sharing the
regulator.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-b4-fec-res=
ume-pinctrl-order-v1-1-f2f926325424@vaisala.com?part=3D1
