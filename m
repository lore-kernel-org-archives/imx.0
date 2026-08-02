Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC3B2DB7B4
	for <imx@lists.linux.dev>; Sun,  2 Aug 2026 22:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785710628; cv=none; b=KKvNQV+RWosB59RBvVCKZXOVRDv0/WfrYKNvpF6XAF6GS+ecBdsEV0CEyHT0i7GfsmH5slnEjXPk8Hs2SGUN8epGmVsJ58cqu9EcUyycHL3BcYSFa3H7EdwspUk+S4C/rWcsH6saP7IegAlmE5cGovPnj5KyWprrWRU866Sp9Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785710628; c=relaxed/simple;
	bh=IYKOvH58uavX1hMiGBawqnDidbBc2YT6RZrZKiDmdsk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZQzjn0KwG6PuaFebymw4kT3+XBKnQzRY5p12PmQPnnPtsilNSZmkIvXTdEyRwZlgDFcfZ5PDCN9lC6gmkfdwOoISy/c7OwMvBo3pFPxd1qomf79WXnd4bhQHfLlNtpApWTxhSxkLZVtLId8pKa3ZHwi0P1Wb+HlbUp+eQYTTItM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iys6hm38; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iys6hm38"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6FF1F00A3A;
	Sun,  2 Aug 2026 22:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785710627;
	bh=Bq7/2CIwJ7RV/8omdwNxCYQfSUH3KZ8/bwvvjInVxhE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iys6hm38THyhVHDxZvD19CPhDIHsKVLdQ76VBCm2Qair5nVX7l6q+BlfKsAyhBsRj
	 zC7/sx3QZWY/R4wlkun7dThj8Whgx33dYBKP2IDJLowMRsNBhtyktWr9kf8pkFSEDc
	 5CLSbOtbaYKu3X56CVOEilxSTUYCnaYCF6567DtYklhE1sysCT4I+1XC7Wr35XbvDf
	 mgphIa0q/63P9jeqbUu9w+SRrwjGhyI3g7UcO7QR7k19NgFxe/Pzw9HAdvwAfv0GpH
	 NUmYHdx6n6hJj9qo0/4I+mevk5AW6TZyLuUOaVUbXBfxdRrIIOZ2+1qWuB1qmNbmEh
	 NbfnhQYtyD9ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] hwrng: imx-rngc: Disable clock on registration
 failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yuho Choi" <dbgh9129@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260802222259.577200-1-dbgh9129@gmail.com>
References: <20260802222259.577200-1-dbgh9129@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 22:43:46 +0000
Message-Id: <20260802224346.EB6FF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The error path for `devm_hwrng_register()` introduces a potential =
double clock disable and PM state inconsistency by manually disabling the c=
lock but leaving the runtime PM state as `RPM_ACTIVE`.

Pre-existing issues:
- [High] If `set_current_rng()` fails during `hwrng_register()`, the RNG is=
 left in `rng_list` but an error is returned, leading to a freed object rem=
aining on the global list.
- [High] Clock leaked on driver unbind due to an asynchronous `pm_runtime_p=
ut()` being cancelled by `pm_runtime_disable()`.
- [High] Unclocked hardware register access in the IRQ handler risks bus fa=
ults.
- [Medium] The device clock is permanently leaked if the device is successf=
ully registered but not selected as the system's current RNG.
--

--- Patch [1]: [PATCH v1] hwrng: imx-rngc: Disable clock on registration fa=
ilure ---
commit b5aba9259f12063cf29726871d90c2519f6fb937
Author: Yuho Choi <dbgh9129@gmail.com>

hwrng: imx-rngc: Disable clock on registration failure
   =20
The RNGC clock is enabled manually before runtime PM is configured. If
devm_hwrng_register() fails, probe returns without disabling the clock.
The devm_pm_runtime_enable() cleanup only disables runtime PM and does not
call imx_rngc_suspend().
   =20
Disable the clock before returning from this failure path.

> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/i=
mx-rngc.c
> index 28c56c2d1bf6d..a2db26d7f790e 100644
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -313,8 +313,10 @@ static int __init imx_rngc_probe(struct platform_dev=
ice *pdev)
>  	devm_pm_runtime_enable(&pdev->dev);
> =20
>  	ret =3D devm_hwrng_register(&pdev->dev, &rngc->rng);
> -	if (ret)
> +	if (ret) {
> +		clk_disable_unprepare(rngc->clk);
>  		return dev_err_probe(&pdev->dev, ret, "hwrng registration failed\n");
> +	}

[Severity: High]
Does this manual clock disable leave the PM state inconsistent or risk a do=
uble
disable?

The device was previously set to RPM_ACTIVE and runtime PM was enabled. If
runtime PM asynchronously suspends the device before this failure path is
reached, imx_rngc_suspend() may have already disabled the clock. Additional=
ly,
leaving the PM state as RPM_ACTIVE while the hardware is powered down might
require calling pm_runtime_disable() and pm_runtime_set_suspended() to
synchronize the state.

[Severity: Medium]
This is a pre-existing issue, but does probe leak the clock if the device is
successfully registered but not selected as the system's current RNG?

Probe leaves the device in RPM_ACTIVE without queuing an autosuspend. If
hwrng_register() completes successfully but does not select this RNG as act=
ive,
its .init callback (which normally performs a PM put) is never invoked, lea=
ving
the device stranded in RPM_ACTIVE and the clock permanently enabled.


[Severity: High]
This isn't a bug introduced by this patch, but can a registration failure
corrupt the global rng_list?

If set_current_rng() fails during hwrng_register() because the RNG's .init
callback returns an error:

drivers/char/hw_random/core.c:hwrng_register() {
    ...
	list_add_tail(&rng->list, &rng_list);
    ...
		err =3D set_current_rng(rng);
		if (err)
			goto out_unlock;
    ...
out_unlock:
	mutex_unlock(&rng_mutex);
	return err;
}

The RNG is left in rng_list, but an error is returned. Devres will then free
the struct hwrng memory, leaving a freed pointer on the global list.


[Severity: High]
This is a pre-existing issue, but does driver unbind leak the clock?

During unbind, devm_hwrng_release() invokes the cleanup callback:

drivers/char/hw_random/imx-rngc.c:imx_rngc_cleanup() {
    ...
	pm_runtime_put(rngc->dev);
}

This performs an asynchronous put. The devres stack then cleans up
devm_pm_runtime_enable() by calling pm_runtime_disable(), which synchronous=
ly
cancels any pending async suspend work. Because imx_rngc_suspend() may never
execute, the hardware can remain powered indefinitely.


[Severity: High]
This is a pre-existing issue, but can the IRQ handler trigger a bus fault by
accessing unclocked hardware registers?

drivers/char/hw_random/imx-rngc.c:imx_rngc_irq() {
    ...
	status =3D readl(rngc->base + RNGC_STATUS);
	rngc->err_reg =3D readl(rngc->base + RNGC_ERROR);
    ...
}

Because the driver configures autosuspend and does not mask the interrupt
during runtime suspend, a spurious or delayed interrupt can fire concurrent=
ly
while the clock is disabled. Without synchronize_irq() in the suspend path =
or
pm_runtime_get_if_active() before register access, this causes a synchronous
external abort.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260802222259.5772=
00-1-dbgh9129@gmail.com?part=3D1
