Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779234;
	b=wilFWpW1ajlmyxrX2duDxUktWh+2cTGWkb8xwEgAaef0Xsbn0HKqsLd5NC3kpL7LsJAz
	 e1UHTr42kps5hXHgfKdkMehdRcgp7837G0ghJ+1i4xidQDOEvdRU7q5/v0csJ8GSJWMot
	 SSVxWdRQPiWoaPGih6HG4GUYqOkEDEaVL/In2DVUO2rUVCEGEneXgY3xkDKp5jZnk65Rw
	 ZH74RzHf9dEnMc/r2TJGq8wt65unTIOUS6Gr8MBOw4oLlEzFrqj67e/CKtosICJEfjIRs
	 Vz3ZcJFFeaxzTHcX5PVWjKhKYDcyJGR5DaBurf142+kunnmqOfJMCWtWc7/aR7ggWRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779234;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IJ3DhxES8V0HA5op6i0ZgZFb6wZEBQoYraUbMH5DRms=;
	b=mGbXXhksJ3PaesxtO+VmNHv+kNiHs66mwF75oY9IzNC0Ij4tuQuJlpyYE7JjWY0vWxXJ
	 3rkd1cwCYjuAKlOlEUKWi6gvMCEmh3kXjFGNEo8oiQPyETiCYg64JAt0CigHs3gYWo0il
	 bj1AYezEmCnLfEuAFV5NskKipasen7IfIM4dh2gqKN/fM1nTLOJT74yWFEu3E/dyRPjUV
	 9yOauBi0mkfzLf6LttDyur/smzcFeRAo7xnDqp2qlPwEes1Bww9P3V5Yl2CvSiZ2XvdZI
	 ytTfIdHTHO6WHLQgVjkVqCgrMEVDwliCJgFDnM8Iv98sXBz+L6JwVqbq1M1oQRrT5BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VeCaHXAd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1B1606A326
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 08:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VeCaHXAd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7931F000C1;
	Wed,  4 Nov 2026 08:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793779233;
	bh=IJ3DhxES8V0HA5op6i0ZgZFb6wZEBQoYraUbMH5DRms=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VeCaHXAdgU57EJho8Tp6ppyc2oJ7xUMKXcsiov85rNJMaozBucZtPwoyEMolvvG1p
	 LHqj6JETKQrQ/Udl7U3sKsEq8Wf1prGk9SR36KafOm6gy5EfU07bRU0ZHZOD88D8j0
	 FNzoL6yiWXTaYxSSJkJqx/bUKnVBa20gWtGjKT+uA83TnLlRgYYYazSvub+JvV3P/4
	 QdV/fqum/2WFdz7YPY4bvClspBwfIP4gsV3RUxuahUPIrJOT2FF/feYUwQ4ZLKyAUR
	 aFL6/uhMaKZddhHSZd54V3fSpPgMhkmpuQP0HvVbHy4jN7g8ZCOekdTrUSKAXm9Zo7
	 gWacxAYzCbdUQ==
Message-ID: <sashiko-outbox-196843@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 04/10] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_set_active_enabled()
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261104073759.386777-5-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
 <20261104073759.386777-5-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 08:00:33 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] irqchip/imx-irqsteer: unclocked MMIO and double clk disable on pro=
be error
- [High] irqchip/imx-irqsteer: clk_disable_unprepare() while runtime PM sta=
ys active
--

commit a93bf35dd98879a3b9dded2ab2a28d635cdf7155
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

irqchip/imx-irqsteer: Convert to devm_pm_runtime_set_active_enabled()

This commit replaces manual pm_runtime_set_active() and pm_runtime_enable()
calls in imx_irqsteer_probe() with devm_pm_runtime_set_active_enabled(), and
guards clk_disable_unprepare() in imx_irqsteer_remove() with a runtime PM
status check.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index d05de3d26fb28..a0546f11936d8 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -239,6 +239,12 @@ static int imx_irqsteer_probe(struct platform_device=
 *pdev)
>  	if (irqsteer_has_chanctrl(data->devtype_data))
>  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> =20
> +	platform_set_drvdata(pdev, data);
> +
> +	ret =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
> +	if (ret)
> +		goto out;
> +
>  	data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev), data-=
>reg_num * 32,
>  						&imx_irqsteer_domain_ops, data);
>  	if (!data->domain) {
> @@ -258,11 +264,6 @@ static int imx_irqsteer_probe(struct platform_device=
 *pdev)
>  						 data);
>  	}
> =20
> -	platform_set_drvdata(pdev, data);
> -
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> -
>  	return 0;
>  out:
>  	clk_disable_unprepare(data->ipg_clk);

[Severity: High]
If irq_domain_create_linear() fails in imx_irqsteer_probe() in
drivers/irqchip/irq-imx-irqsteer.c after devm_pm_runtime_set_active_enabled=
()
has succeeded, can this cause an unclocked MMIO access and a double
clk_disable_unprepare() on data->ipg_clk?

When irq_domain_create_linear() returns NULL, imx_irqsteer_probe() jumps to
the out label and calls clk_disable_unprepare(data->ipg_clk) while runtime =
PM
is still enabled, runtime_status is RPM_ACTIVE, and usage_count is 0.

When imx_irqsteer_probe() then returns an error, device_unbind_cleanup() ->
devres_release_all() executes pm_runtime_disable_action() in
drivers/base/power/runtime.c before clearing drvdata:

static void pm_runtime_disable_action(void *data)
{
	pm_runtime_dont_use_autosuspend(data);
	pm_runtime_disable(data);
}

Because pm_runtime_dont_use_autosuspend() is called while runtime PM is sti=
ll
enabled, __pm_runtime_use_autosuspend() -> update_autosuspend() ->
rpm_idle(dev, RPM_AUTO) -> rpm_suspend(dev, RPM_AUTO) runs synchronously and
invokes imx_irqsteer_suspend():

static int imx_irqsteer_suspend(struct device *dev)
{
	struct irqsteer_data *irqsteer_data =3D dev_get_drvdata(dev);

	imx_irqsteer_save_regs(irqsteer_data);
	clk_disable_unprepare(irqsteer_data->ipg_clk);

	return 0;
}

imx_irqsteer_save_regs() reads the CHANMASK MMIO registers while ipg_clk is
already gated, and imx_irqsteer_suspend() then calls clk_disable_unprepare()
on ipg_clk a second time. Similarly, if devm_add_action_or_reset() inside
devm_pm_runtime_enable() fails, it immediately runs
pm_runtime_disable_action() -> imx_irqsteer_suspend() and then the out path
disables ipg_clk a second time.

Note that later commits in this series ("irqchip/imx-irqsteer: Let devres o=
wn
the clock" and "irqchip/imx-irqsteer: Use devm_irq_domain_create_linear()")
do not fully avoid this on probe failure: if probe fails after
devm_pm_runtime_set_active_enabled(), devres_release_all() still runs
pm_runtime_disable_action() -> imx_irqsteer_suspend() -> clk_disable(ipg_cl=
k)
before devm_clk_release() calls clk_disable_unprepare(ipg_clk).

> @@ -285,7 +286,8 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
> =20
>  	irq_domain_remove(irqsteer_data->domain);
> =20
> -	clk_disable_unprepare(irqsteer_data->ipg_clk);
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		clk_disable_unprepare(irqsteer_data->ipg_clk);
>  }

[Severity: High]
As reported by Frank Li on v6 [1], does calling clk_disable_unprepare() in
imx_irqsteer_remove() in drivers/irqchip/irq-imx-irqsteer.c while runtime PM
is still enabled and RPM_ACTIVE cause imx_irqsteer_suspend() to read
unclocked MMIO registers and disable ipg_clk a second time during devres
teardown?

If imx_irqsteer_remove() runs while runtime_status is RPM_ACTIVE and
usage_count is 0 (for example under CONFIG_DEBUG_TEST_DRIVER_REMOVE or on p=
ost-probe failure paths in really_probe()), !pm_runtime_status_suspended(&p=
dev->dev) is true and imx_irqsteer_remove() calls clk_disable_unprepare(irq=
steer_data->ipg_clk) without disabling runtime PM or updating the runtime s=
tatus.

Immediately afterwards, device_unbind_cleanup() -> devres_release_all() runs
pm_runtime_disable_action() -> pm_runtime_dont_use_autosuspend() ->
update_autosuspend() -> rpm_idle() -> rpm_suspend(), which synchronously
calls imx_irqsteer_suspend(). That reads the CHANMASK registers via
imx_irqsteer_save_regs() with ipg_clk already disabled and unprepared, and
calls clk_disable_unprepare(irqsteer_data->ipg_clk) a second time.

In addition, in the follow-up commit "irqchip/imx-irqsteer: Let devres own
the clock", imx_irqsteer_remove() calls pm_runtime_resume_and_get(&pdev->de=
v)
followed by pm_runtime_put_noidle(&pdev->dev), which leaves the device in
RPM_ACTIVE with usage_count =3D=3D 0 on every normal unbind and triggers th=
e same
synchronous imx_irqsteer_suspend() -> clk_disable() before devm_clk_release=
()
runs clk_disable_unprepare().

[1] https://lore.kernel.org/r/asf_9lgB-ULFooH9@SMW015318

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104073759.3867=
77-1-Zhipeng.wang_1@oss.nxp.com?part=3D4
