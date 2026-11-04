Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779387;
	b=ugoUIUrOF+BZCLqAIuNdPnSj8w0Y63j25bQGFuFGRoUOf/5cLK8YVYuZR6GrdjIyF/Ge
	 pea4pGilVwmmJYDrs7i3EpBTlxzgQnJKRx1Z5T96uQjRnzHrAHniqEdKuUDRorOI0YPj7
	 T5GOqUHqTOLn78R8AykJkBS1fuNJ7VReyoWqlkVTuQziRBDnPnpAkPpQAp1QBYG/PGqG0
	 sMLvyUiib4eUzQ8/KchLFqYwPo85uRmG+4Eu6bu/Jfc/eGTJUtWMqLwvKpGAYFk6Jno2m
	 oeKvgD7fzGxWtOt6KdV5RI5oxsldig1yEXfXNu5Srpm81ecBv80piPXmuXI7GBWsk7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779387;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=E2/FCrEwTm7tw/V69sIUupNNwmMiN8JMgGcN8uo0UK0=;
	b=VWH7TMdwyWpc38Rw8qs9vdfPvqkpL++l40S45UIe8gxhzYb9T+tI3inpkCZVd4+m4cWV
	 uMkayKwsyBtLzpk98P/4ncw/F+GmvOGewyXpJtl9TnIkVDQuKqi14BFHu3vAMNE4Njo3A
	 9zL0y2l1yHQ/h3FZTLsCx/HXZGfUpe1+rRnd7GEG+N+PJV/Cqy62fJXUDtyQbFv1W6pWI
	 qiJYbnZ6C0IrqLyxatmJrJ4r/JRZ3PZvX6WYnLGRxKkf+PBJbAuYwSzxgfa60l9NXHKH0
	 vEjXtY6xnnhSxiBTTyTuEXc2pkvJSY/J8WgS1QpaXSne7ps/g4lrbkqiojS6x3rybsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VvoHDmiQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E15606A328
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 08:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VvoHDmiQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7DC1F00919;
	Wed,  4 Nov 2026 08:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793779387;
	bh=E2/FCrEwTm7tw/V69sIUupNNwmMiN8JMgGcN8uo0UK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VvoHDmiQOEP+pD2JRih3wPAXYWN+haFMXP6B85KbMCSK9sqo/H1UyNIkqWOVqdTid
	 MgXfsnYckuJc532vcTV6J8JDj6jMn+9VKcPLBcZbtlBF6S8qZbx8Lz8wJIvl30TGcR
	 j4e2IcSFtsj5ZEjSegyA5gF6EdEPd3qrZfYCuTc9mZYbnlZ/uDzwvv8QmcDcHLf1Bj
	 ynKyVMXPcSr93HNgj+e7EM/FTWnaEWOOlUeO5U8O3k8fLaD+kmnigG0XSZKNJqKSjn
	 eVUATGawsTpx+ADdj4w51YDR3GrdBeWeFET1xxWySUuOaAOGVekWa5k99KxDr62POC
	 gAm0fOPblJq/A==
Message-ID: <sashiko-outbox-196851@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/10] irqchip/imx-irqsteer: Let devres own the clock
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261104073759.386777-7-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
 <20261104073759.386777-7-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 08:03:06 +0000
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
- [Medium] irqchip/imx-irqsteer: clk_disable() in suspend breaks power doma=
in and SCMI clk
- [Medium] irqchip/imx-irqsteer: clock disable underflow if resume fails in=
 remove()
--

commit a2f4167d93e3f08a9310e23ef0e119f1d5e5a194
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

irqchip/imx-irqsteer: Let devres own the clock

This commit switches the imx-irqsteer driver to acquire ipg_clk using
devm_clk_get_enabled() so that devres manages the clock's prepare and enable
state across probe and unbind. It also updates the runtime PM callbacks to
use clk_disable() and clk_enable() and resumes the device in remove() before
devres releases the clock.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 14fc56847a8c1..063a071ba1630 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -194,7 +194,7 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
>  		return PTR_ERR(data->regs);
>  	}
> =20
> -	data->ipg_clk =3D devm_clk_get(&pdev->dev, "ipg");
> +	data->ipg_clk =3D devm_clk_get_enabled(&pdev->dev, "ipg");
>  	if (IS_ERR(data->ipg_clk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
>  				     "failed to get ipg clk\n");

[ ... ]

> @@ -273,15 +266,23 @@ static int imx_irqsteer_probe(struct platform_devic=
e *pdev)
>  	}
> =20
>  	return 0;
> -out:
> -	clk_disable_unprepare(data->ipg_clk);
> -	return ret;
>  }
> =20
>  static void imx_irqsteer_remove(struct platform_device *pdev)
>  {
>  	struct irqsteer_data *irqsteer_data =3D platform_get_drvdata(pdev);
> -	int i;
> +	int i, ret;
> +
> +	/*
> +	 * The device may be runtime-suspended here, in which case the runtime
> +	 * suspend callback has already dropped the clock enable count. Resume
> +	 * it so the devres clk_disable_unprepare(), which runs after remove(),
> +	 * finds the clock enabled and stays balanced. On success drop the
> +	 * usage count again with pm_runtime_put_noidle(): it must not trigger a
> +	 * suspend (which would re-disable the clock) and must not leak to the
> +	 * next probe of this persistent device.
> +	 */
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> =20
>  	for (i =3D 0; i < irqsteer_data->irq_count; i++) {
>  		if (!irqsteer_data->irq[i])
> @@ -294,8 +295,8 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
> =20
>  	irq_domain_remove(irqsteer_data->domain);
> =20
> -	if (!pm_runtime_status_suspended(&pdev->dev))
> -		clk_disable_unprepare(irqsteer_data->ipg_clk);
> +	if (ret >=3D 0)
> +		pm_runtime_put_noidle(&pdev->dev);
>  }

[Severity: Medium]
As reported by Sashiko on v6 [1], what happens in imx_irqsteer_remove() if
the device is runtime-suspended and pm_runtime_resume_and_get() returns a
negative error (for example due to a power domain or supplier resume failur=
e,
or clk_enable() failing in imx_irqsteer_resume())?

When the device is runtime-suspended, imx_irqsteer_suspend() has already
called clk_disable(irqsteer_data->ipg_clk). If pm_runtime_resume_and_get()
fails, ipg_clk remains disabled when imx_irqsteer_remove() returns, but the
devres action registered by devm_clk_get_enabled() in imx_irqsteer_probe()
still runs unconditionally during device_unbind_cleanup() and calls
clk_disable_unprepare() on ipg_clk.

Wouldn't that underflow the clock enable count and trigger a warning in
clk_core_disable(), or prematurely gate ipg_clk if it is shared with another
active consumer?

>  #ifdef CONFIG_PM
> @@ -325,7 +326,7 @@ static int imx_irqsteer_suspend(struct device *dev)
>  	struct irqsteer_data *irqsteer_data =3D dev_get_drvdata(dev);
> =20
>  	imx_irqsteer_save_regs(irqsteer_data);
> -	clk_disable_unprepare(irqsteer_data->ipg_clk);
> +	clk_disable(irqsteer_data->ipg_clk);
> =20
>  	return 0;
>  }
> @@ -335,7 +336,7 @@ static int imx_irqsteer_resume(struct device *dev)
>  	struct irqsteer_data *irqsteer_data =3D dev_get_drvdata(dev);
>  	int ret;
> =20
> -	ret =3D clk_prepare_enable(irqsteer_data->ipg_clk);
> +	ret =3D clk_enable(irqsteer_data->ipg_clk);

[Severity: Medium]
Does replacing clk_disable_unprepare() and clk_prepare_enable() with
clk_disable() and clk_enable() in imx_irqsteer_suspend() and
imx_irqsteer_resume() cause power management regressions on i.MX8, i.MX94,
and S32N79 platforms?

Because imx_irqsteer_probe() acquires ipg_clk via devm_clk_get_enabled(),
only calling clk_disable() in imx_irqsteer_suspend() leaves core->prepare_c=
ount
at 1 while the device is runtime-suspended or in system sleep.

In drivers/clk/clk.c, clk_core_unprepare() only drops the runtime PM
reference on a runtime-PM-enabled clock provider device when prepare_count
reaches 0:

drivers/clk/clk.c:clk_core_unprepare() {
	...
	trace_clk_unprepare_complete(core);
	clk_core_unprepare(core->parent);
	clk_pm_runtime_put(core);
}

On i.MX8QM and i.MX8QXP (such as irqsteer_lvds1 in
arch/arm64/boot/dts/freescale/imx8-ss-lvds1.dtsi, as well as the LVDS0,
MIPI0, and MIPI1 subsystems), the irqsteer node and its fsl,imx8qxp-lpcg
clock controller share the same SCU power domain:

	clocks =3D <&lvds1_lis_lpcg IMX_LPCG_CLK_4>;
	clock-names =3D "ipg";
	power-domains =3D <&pd IMX_SC_R_LVDS_1>;

Since prepare_count never drops to 0 during runtime suspend,
clk_pm_runtime_put() is never called on the LPCG clock provider (or its
parent imx-scu-clk device), keeping the clock provider runtime-active and
preventing the shared power domain from ever powering off.

Additionally, on platforms where ipg_clk is provided by a non-atomic clock
controller=E2=80=94such as i.MX94 (where a55_irqsteer uses an SCMI clock ov=
er a
non-atomic mailbox transport), S32N79 (when atomic SCMI SMC transport is not
enabled), and i.MX8 SCU clocks=E2=80=94the clock provider only populates .p=
repare and
.unprepare and leaves .enable and .disable NULL:

drivers/clk/clk-scmi.c:scmi_clk_ops_alloc() {
	if (feats_key & BIT(SCMI_CLK_STATE_CTRL_SUPPORTED)) {
		if (feats_key & BIT(SCMI_CLK_ATOMIC_SUPPORTED)) {
			ops->enable =3D scmi_clk_atomic_enable;
			ops->disable =3D scmi_clk_atomic_disable;
		} else {
			ops->prepare =3D scmi_clk_enable;
			ops->unprepare =3D scmi_clk_disable;
		}
	}
}

On those platforms, calling clk_disable() and clk_enable() in
imx_irqsteer_suspend() and imx_irqsteer_resume() becomes a no-op and never
gates ipg_clk during runtime suspend or system sleep.

Since imx_irqsteer_suspend() and imx_irqsteer_resume() run in sleepable
context, should they keep calling clk_disable_unprepare() and
clk_prepare_enable()?

[1] https://lore.kernel.org/r/20261008090231.796511-7-Zhipeng.wang_1@oss.nx=
p.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104073759.3867=
77-1-Zhipeng.wang_1@oss.nxp.com?part=3D6
