Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD071E5724
	for <imx@lists.linux.dev>; Fri, 10 Jul 2026 11:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681644; cv=none; b=MBjGKE2KIUUI+iMantiSnpAP8AZwsOy9niwMaPpOMHRT43t67BxTa9O8mM85WN6PPdPf/qHfpGX2a7sXUNNINUfqSQQI4oMhyoXSNkIL4DR9//E1mfMPSq325Eir0YL5TkpbOYiU8Nl4Km5c0WOdxH+ri+OauqubM9IlQI8ASxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681644; c=relaxed/simple;
	bh=xsr/lcHf3BuLDfe3OMcKgDL1faA9GS3ZRvU9EwFDN40=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q9K1P6qMLHmmDrYIsxjqU2mDMuru0n0dlc2B6EfXtYAUgN+NweuLGIFNgTBB3dV9mpFuD+jPN0shQaSk7LpQeOLc9+hHwsz3TChLRU5JRSpivZHHFrflWS1LVvJ4JHIykX/uiSKA1SR+jFrCmnIbVERSYbsYf0m90s1OdTOsDXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIbFTnbA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIbFTnbA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 514381F000E9;
	Fri, 10 Jul 2026 11:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783681642;
	bh=HXfRAU5NDwkAJ5u0QXSEgiV4MOI4qfr/keEqB231qSA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iIbFTnbAhtMLd0SwWiWMDBbLCkkzWhR562neiHPLsTOvlKxYZe3Kj60aDE1d0n+f7
	 GwaSzdJFhpz5guBMRacirA8bHjaYgw8970NRoGFiy0SS9RZMzwua3v3sOKMF3LkpKT
	 1lcND7VF1TBH+8mgph5s8EjK6TwklU4iKYPlsRu4GNMZbCMKJGTb2XXo9Gn0t0y9Po
	 PwgGxt+pjq7p5cTHuzFNdAyLcOjkGSGWXyHosXqqpYHlZMeJPwJWESCmm9EQe3bjDw
	 RWG/2b0Se5+ZQuASofiOdzizqCy0kjqyUy+oaGp+zg4sPvN9872trmQYDtL5hfLtue
	 t1QyZhbJh5Www==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] hwrng: drivers - Remove redundant
 dev_err()/dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260710105318.376496-2-panchuang@vivo.com>
References: <20260710105318.376496-1-panchuang@vivo.com>
 <20260710105318.376496-2-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:07:21 +0000
Message-Id: <20260710110722.514381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

Pre-existing issues:
- [High] PM runtime and clock reference leak when the second clock defers p=
robe.
- [High] Device IRQ is requested before hardware clocks and resets are read=
y.
- [High] Device IRQ is requested before the IP clock is enabled.
- [High] The driver leaks its PM runtime enablement, reset control deassert=
ion, and clock enablements upon driver unbind because it lacks a `remove` f=
unction.
- [High] The driver queues background works (`compwork` and `startwork`) bu=
t fails to cancel them during driver removal, leading to a Use-After-Free.
- [High] The driver starts a failure recovery timer but fails to delete it =
when the driver is removed, leading to a Use-After-Free.
- [Medium] Clock prepare/enable leak on error path during probe.
- [Medium] PM runtime reference leak on error path during probe.
--

--- Patch [1]: [PATCH 1/3] hwrng: drivers - Remove redundant dev_err()/dev_=
err_probe() ---
commit 5b0e3802decb80a4bd7c81e612150dfe5af3cc8a
Author: Pan Chuang <panchuang@vivo.com>

hwrng: drivers - Remove redundant dev_err()/dev_err_probe()
   =20
This patch removes driver-specific dev_err() and dev_err_probe() calls
following devm_request_irq() since the core now automatically logs these
errors.

> diff --git a/drivers/char/hw_random/cctrng.c b/drivers/char/hw_random/cct=
rng.c
> --- a/drivers/char/hw_random/cctrng.c
> +++ b/drivers/char/hw_random/cctrng.c
> @@ -509,7 +509,7 @@ static int cctrng_probe(struct platform_device *pdev)
>  	/* register the driver isr function */
>  	rc =3D devm_request_irq(dev, irq, cc_isr, IRQF_SHARED, "cctrng", drvdat=
a);
>  	if (rc)
> -		return dev_err_probe(dev, rc, "Could not register to interrupt %d\n", =
irq);
> +		return rc;

[Severity: Medium]
This is a pre-existing issue, but does this error path leave the PM runtime
reference count elevated?

In cctrng_probe(), cc_trng_pm_get() increments the PM runtime usage count.
If devm_hwrng_register() subsequently fails, the code jumps to post_pm_err:

drivers/char/hw_random/cctrng.c:cctrng_probe() {
    ...
    rc =3D devm_hwrng_register(dev, &drvdata->rng);
    if (rc) {
        dev_err(dev, "Could not register hwrng device.\n");
        goto post_pm_err;
    }
    ...
post_pm_err:
    cc_trng_pm_fini(drvdata);

    return rc;
}

Since cc_trng_pm_fini() only disables PM runtime but doesn't drop the usage
count, does this permanently prevent the device's power domain from ever
suspending?

[Severity: High]
This is a pre-existing issue, but does the driver queue background works th=
at
fail to cancel during driver removal?

The driver schedules asynchronous works (compwork and startwork) during
hardware operation. The teardown function only disables PM runtime:

drivers/char/hw_random/cctrng.c:cctrng_remove() {
    ...
    cc_trng_pm_fini(drvdata);

    dev_info(dev, "ARM cctrng device terminated\n");
}

Does this lead to a Use-After-Free if a work item is pending or executing
when the driver is unbound, since the devres framework will automatically
free the drvdata context memory?

> diff --git a/drivers/char/hw_random/imx-rngc.c b/drivers/char/hw_random/i=
mx-rngc.c
> --- a/drivers/char/hw_random/imx-rngc.c
> +++ b/drivers/char/hw_random/imx-rngc.c
> @@ -297,7 +297,7 @@ static int __init imx_rngc_probe(struct platform_devi=
ce *pdev)
>  			irq, imx_rngc_irq, 0, pdev->name, (void *)rngc);
>  	if (ret) {
>  		clk_disable_unprepare(rngc->clk);
> -		return dev_err_probe(&pdev->dev, ret, "Can't get interrupt working.\n"=
);
> +		return ret;
>  	}

[Severity: Medium]
This is a pre-existing issue, but does this error path fail to undo the
previous manual clock enablement?

In imx_rngc_probe(), rngc->clk is explicitly enabled via clk_prepare_enable=
().
If the subsequent call to devm_hwrng_register() fails, the function directly
returns the error:

drivers/char/hw_random/imx-rngc.c:imx_rngc_probe() {
    ...
    ret =3D devm_hwrng_register(&pdev->dev, &rngc->rng);
    if (ret)
        return dev_err_probe(&pdev->dev, ret, "hwrng registration failed\n"=
);
    ...
}

Does this leave the hardware clock perpetually enabled without calling
clk_disable_unprepare(rngc->clk)?

> diff --git a/drivers/char/hw_random/jh7110-trng.c b/drivers/char/hw_rando=
m/jh7110-trng.c
> --- a/drivers/char/hw_random/jh7110-trng.c
> +++ b/drivers/char/hw_random/jh7110-trng.c
> @@ -303,8 +303,7 @@ static int starfive_trng_probe(struct platform_device=
 *pdev)
>  	ret =3D devm_request_irq(&pdev->dev, irq, starfive_trng_irq, 0, pdev->n=
ame,
>  			       (void *)trng);
>  	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> -				     "Failed to register interrupt handler\n");
> +		return ret;
> =20
>  	trng->hclk =3D devm_clk_get(&pdev->dev, "hclk");

[Severity: High]
This is a pre-existing issue, but is it safe to request the IRQ before the
hardware clocks and resets are ready?

If a shared or pending interrupt triggers immediately upon registration,
starfive_trng_irq() could execute and read STARFIVE_ISTAT while the hardware
is unpowered and in reset.

Could this lead to a synchronous external abort when the unclocked device
registers are accessed?

[Severity: High]
This is a pre-existing issue, but does the platform driver leak resources
upon driver unbind?

The driver registers with module_platform_driver() without a remove callbac=
k:

drivers/char/hw_random/jh7110-trng.c {
static struct platform_driver starfive_trng_driver =3D {
    .probe =3D starfive_trng_probe,
    .driver =3D {
        .name =3D "jh7110-trng",
...
}

During starfive_trng_probe(), the driver manually enables clocks, deasserts
reset, and enables PM runtime.

Since there is no remove callback, does devm automatically unregister the
hwrng while leaving the manually acquired clocks, reset, and PM runtime
states permanently active?

> diff --git a/drivers/char/hw_random/omap-rng.c b/drivers/char/hw_random/o=
map-rng.c
> --- a/drivers/char/hw_random/omap-rng.c
> +++ b/drivers/char/hw_random/omap-rng.c

[ ... ]

[Severity: High]
This is a pre-existing issue, but does the immediate return on -EPROBE_DEFER
bypass manual resource cleanup?

In omap_rng_probe(), PM runtime is enabled and priv->clk is manually enable=
d.
The driver then attempts to get the second clock:

drivers/char/hw_random/omap-rng.c:omap_rng_probe() {
    ...
    priv->clk_reg =3D devm_clk_get(&pdev->dev, "reg");
    if (PTR_ERR(priv->clk_reg) =3D=3D -EPROBE_DEFER)
        return -EPROBE_DEFER;
    ...
}

Does this early return bypass the err_register and err_ioremap cleanup labe=
ls,
leaving pm_runtime_put_sync(), pm_runtime_disable(), and
clk_disable_unprepare(priv->clk) uncalled?

> diff --git a/drivers/char/hw_random/xgene-rng.c b/drivers/char/hw_random/=
xgene-rng.c
> --- a/drivers/char/hw_random/xgene-rng.c
> +++ b/drivers/char/hw_random/xgene-rng.c
> @@ -337,7 +337,7 @@ static int xgene_rng_probe(struct platform_device *pd=
ev)
>  	rc =3D devm_request_irq(&pdev->dev, ctx->irq, xgene_rng_irq_handler, 0,
>  				dev_name(&pdev->dev), ctx);
>  	if (rc)
> -		return dev_err_probe(&pdev->dev, rc, "Could not request RNG alarm IRQ\=
n");
> +		return rc;
> =20
>  	/* Enable IP clock */
>  	clk =3D devm_clk_get_optional_enabled(&pdev->dev, NULL);

[Severity: High]
This is a pre-existing issue, but is the IRQ requested before the IP clock =
is
enabled?

An early interrupt execution during this window could cause the handler to
read the RNG_INTR_STS_ACK register.

Could accessing an unclocked APB/AHB register lead to a system crash or bus
error?

[Severity: High]
This is a pre-existing issue, but does the driver start a failure recovery
timer that fails to get deleted when the driver is removed?

The teardown function returns without canceling the asynchronous
failure_timer:

drivers/char/hw_random/xgene-rng.c:xgene_rng_remove() {
    ...
    rc =3D device_init_wakeup(&pdev->dev, 0);
    if (rc)
        dev_err(&pdev->dev, "RNG init wakeup failed error %d\n", rc);
}

After remove() completes, the devres framework automatically frees the
xgene_rng_dev context. If the timer later expires, could
xgene_rng_expired_timer() execute and dereference the freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710105318.3764=
96-1-panchuang@vivo.com?part=3D1
