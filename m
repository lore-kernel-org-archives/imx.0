Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663DC2DC32A
	for <imx@lists.linux.dev>; Sat, 30 May 2026 00:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102169; cv=none; b=gCVHSunzFA5OR0JK0k6F2OMh5nWE8dRlNrRjin+MtYPvC4z2WsxwCvEoSLPAwREo1loStuG98BII12kn7D4bYDf4QgM0JZYRVgqSnWvX4GrE7/RJvfGcegrsZfATu+Qlapi/CBhDNCkqSqhYZe3k3wCxohnSm8n+Hl+E3hxbT7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102169; c=relaxed/simple;
	bh=9uXVcqVO4Vina2EnuX/IxhummzMPS9JQ/qxoFqM7GE8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mHEt4J/X1DKFBLhwwx/GBrut3J9mBMBjozmDRHZLGgMFqV3ubJ/B4JXEO2WG2fIuwU466R/wFdn41jOj8musFvVwKQjcyQAC5EN0Ixr9ew2QHbdG0fFcvc5Ydcv0J6uFot6qEe4E0I0YEqIJ+gn1tjkCpeYgNmDL+mCqcayjoJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUE8PQxZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUE8PQxZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 244E11F00899;
	Sat, 30 May 2026 00:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102168;
	bh=vK6QhBHig2XTi7d2mieZIyDaA8pNROIjRV+hLaijteo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TUE8PQxZT5zMD4FmfRcyWAaHsupl8nxRmKmUjm3dnJLTDLxL2R7fDHR5aw8uQzdMA
	 BRSL0w07Kpaw/bRxc/EKu9BbEVPkhLKqvwEN1dwnKTRdk2XZQ0OBEIp34hOTk55JCK
	 rPdsC4wMtHNlWuk9hQoQMcHNve6ScALyK5cEK/XA8d68/nIMGo1L5H5Yc6WJKglg3b
	 8JuW5vrliheJFJmRI99p82SDuqI+qNMvFoZxO+AfeYYN+H+CwmHxd1z53QmE6BO+23
	 IIC++7JvaLwZvPzdAerJbgNYY3x+rDldIoDdWUyKE7FEQ7yburKY4HZpDx/RntNJ7L
	 pRPcIHtd5xpIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] net: fec: fix pinctrl default state restore order on
 resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tapio Reijonen" <tapio.reijonen@vaisala.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260527-b4-fec-resume-pinctrl-order-v2-1-293096f48703@vaisala.com>
References: <20260527-b4-fec-resume-pinctrl-order-v2-1-293096f48703@vaisala.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:49:27 +0000
Message-Id: <20260530004928.244E11F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The pinctrl state is not reverted to the sleep state if `fec_ene=
t_clk_enable()` fails during the non-WoL resume path.

Pre-existing issues:
- [High] Unbalanced `regulator_disable()` in the error path of `fec_resume(=
)` when Wake-on-LAN (WoL) is enabled.
- [High] The return value of `pm_runtime_force_resume()` is ignored, which =
can lead to system crashes if clock enablement fails.
--

commit 31651e9d0db1a567cb015eadbc480a45cac209ed
Author: Tapio Reijonen <tapio.reijonen@vaisala.com>

net: fec: fix pinctrl default state restore order on resume

In fec_resume(), fec_enet_clk_enable() is called before
pinctrl_pm_select_default_state() in the non-WoL path, inverting the
ordering used in fec_suspend() which correctly switches to the sleep
pinctrl state before disabling clocks.

Fixes: de40ed31b3c5 ("net: fec: add Wake-on-LAN support")
Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index f89aa94ce0202..723af4c057d7a 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -5594,12 +5594,12 @@ static int fec_resume(struct device *dev)
>  		if (fep->rpm_active)
>  			pm_runtime_force_resume(dev);

[Severity: High]
This is a pre-existing issue, but should the return value of
pm_runtime_force_resume() be checked here?

If it fails, it returns a negative error code, but the result is ignored
and execution proceeds to fec_restart(). On i.MX platforms, accessing
memory-mapped registers without their clocks enabled causes a precise or
imprecise external abort, leading to a kernel panic.

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

[Severity: High]
This isn't a bug introduced by this patch, but will this error path cause
an unbalanced regulator_disable() if WoL is enabled?

At the start of fec_resume(), regulator_enable() is conditionally executed
only when WoL is NOT enabled:

	if (fep->reg_phy && !(fep->wol_flag & FEC_WOL_FLAG_ENABLE)) {
		ret =3D regulator_enable(fep->reg_phy);

However, if fec_enet_clk_enable() fails here, we jump to failed_clk which
unconditionally disables the regulator:

failed_clk:
	if (fep->reg_phy)
		regulator_disable(fep->reg_phy);

Since we are in the WoL enabled path, the regulator was never enabled. This
would incorrectly decrement the use count and trigger a WARN_ON in the
regulator core, potentially powering off a shared regulator prematurely.

> +			}
>  			fec_enet_stop_mode(fep, false);
>  			if (fep->wake_irq) {

[ ... ]

> @@ -5612,6 +5612,11 @@ static int fec_resume(struct device *dev)
>  			fep->wol_flag &=3D ~FEC_WOL_FLAG_SLEEP_ON;
>  		} else {
>  			pinctrl_pm_select_default_state(&fep->pdev->dev);
> +			ret =3D fec_enet_clk_enable(ndev, true);
> +			if (ret) {
> +				rtnl_unlock();
> +				goto failed_clk;

[Severity: Medium]
If fec_enet_clk_enable() fails here, should the pinctrl state be reverted
back to the sleep state?

The code jumps to failed_clk without reverting the state, leaving the pins
in the active state even though the device resume is aborted.

> +			}
>  		}
>  		fec_restart(ndev);
>  		netif_tx_lock_bh(ndev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-b4-fec-res=
ume-pinctrl-order-v2-1-293096f48703@vaisala.com?part=3D1
