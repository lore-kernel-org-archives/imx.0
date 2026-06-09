Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2266390212
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780999679; cv=none; b=jJ5t5dP0WbfO/ZcuBdNSwu2v5a5z+x+CGxMxHU3rPDrvmQDDwn4ng3A/QLD9+udrq3jVsgxbAz2f3rs7xrCcis5DV+NKUkKfq/23XgTpJu5haIQ18ygRCwlTVX+RiN1NnEolDDaVKzHIfDMq8XDWawrbSX5e3oumfEJfc2XXfBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780999679; c=relaxed/simple;
	bh=tr879JES90ns9VbIUgk3U1m6wXuz4MWLSqPCUfijc4w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m7rHSR1EGtQcqYQ38blVQNFPocFEj1aDItay10RN76ItFr1fQFcYgdG1x6gMqbKbZaSEGNGwl2jUc+nKL1Kkq0z9QYkYNBItVrZGB6WPaOTi5ACFUJ4MJIv6GhKmuv9tjDARMv7EUX2LKwXoa2gfOmYcy1qdHraHBM3U/rm/lOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4VH03Og; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4VH03Og"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B441F00893;
	Tue,  9 Jun 2026 10:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780999677;
	bh=jszxHNj6Bv1+voQhFJXAh7TmDv+0RmTK9vEp5qTGtwU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W4VH03Ogi49LjGK82fAzT7nhhOnN8BSwIXMCYIgDKAMjWdcUgmw4tjxiCYCoRvBqO
	 yQBOT46AGlK21Bb9Xi9CWzeZKoXXn+3BwBLep+tmt2c+GAHgjL8EZRnvEhNQoSbVBB
	 zL5s1sizF/6hCQ+s/0Dxg/fKNN0sJ1XIWW6AjEogDPnf/LaZUUi0K7nZGJRD7G2Px0
	 EMhXMJ6ewfQliLYhs2Ssdd3/pntakrt2oEApk9fPRRSrBdiSAIsVf3nEGLPqsKqRF4
	 vcZIL92jBZAEJuOc+4BSpowHS+qArgdngFg8Il+PRhV/LAV5bEQ+4/57l86RCsahNT
	 m+RlWU4ItQqNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] i2c: imx-lpi2c: properly unwind resources on
 probe failure
Reply-To: sashiko-reviews@lists.linux.dev
To: carlos.song@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260609095119.924029-2-carlos.song@oss.nxp.com>
References: <20260609095119.924029-2-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 10:07:56 +0000
Message-Id: <20260609100757.24B441F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] DMA channels allocated during probe are never released on probe fa=
ilure or device removal.
- [High] The driver requests its IRQ before enabling peripheral clocks and =
initializing waitqueues, creating a race condition that can crash the syste=
m.
- [High] Clock prepare and enable counts are permanently leaked on driver u=
nload.
- [High] The interrupt handler accesses hardware registers without verifyin=
g the device's PM runtime state.
- [High] The atomic transfer callback `lpi2c_imx_xfer_atomic` calls a sleep=
ing Runtime PM function, violating atomic context constraints.
--

commit cddc2104d2bff09cb4b19ffca23e425ce9b667ce
Author: Carlos Song <carlos.song@nxp.com>

i2c: imx-lpi2c: properly unwind resources on probe failure

When probe fails after clk_bulk_prepare_enable() succeeds but before
runtime PM is initialized, the enabled clocks are never disabled.
Additionally, calling pm_runtime_put_sync() in the error path can
trigger the runtime suspend callback, which may attempt to disable
clocks that have not been fully set up, leading to potential issues
during error unwinding.

> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index a01c236964819..540dc6cb664eb 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
[ ... ]
> @@ -1565,8 +1569,13 @@ static int lpi2c_imx_probe(struct platform_device =
*pdev)
> =20
>  rpm_disable:
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
> -	pm_runtime_put_sync(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
> +	pm_runtime_put_noidle(&pdev->dev);
> +clk_disable:
> +	clk_bulk_disable_unprepare(lpi2c_imx->num_clks, lpi2c_imx->clks);
> +free_irq:
> +	devm_free_irq(&pdev->dev, lpi2c_imx->irq, lpi2c_imx);

[Severity: High]
This is a pre-existing issue, but does explicitly placing clk_disable before
free_irq expose a window where an interrupt can arrive and cause a fault
during cleanup?

If a pending interrupt fires after clocks are disabled but before the inter=
rupt
is freed, lpi2c_imx_isr() in drivers/i2c/busses/i2c-imx-lpi2c.c will execute
and attempt to read hardware registers while clocks are disabled.

[Severity: High]
This isn't a regression introduced by this patch, but are dma channels leak=
ed
if probe fails after lpi2c_dma_init() succeeds?

The driver requests channels using dma_request_chan() in lpi2c_dma_init().
If a later probe step fails (such as i2c_add_adapter()), the error unwinding
path skips releasing the channels.

Additionally, lpi2c_imx_remove() in drivers/i2c/busses/i2c-imx-lpi2c.c appe=
ars
to lack cleanup, which could permanently leak two channels every time the
driver unbinds.

[Severity: High]
This is a pre-existing issue, but are clock prepare and enable counts retai=
ned
on driver unload?

Because lpi2c_imx_remove() in drivers/i2c/busses/i2c-imx-lpi2c.c only calls
pm_runtime_disable() without explicit clock unprepare or disable operations,
the actual clock counts might never be decremented. Devres will drop the cl=
ock
handles, but the clocks could remain enabled preventing deep sleep states.

[Severity: High]
This is a pre-existing issue, but could the interrupt handler access hardwa=
re
registers while the device is in a suspended state?

According to subsystem guidelines, interrupt handlers must use
pm_runtime_get_if_active() before accessing registers. Because the interrupt
is not explicitly disabled at the controller during runtime suspend, a spur=
ious
or delayed interrupt might fire in lpi2c_imx_isr() while clocks are gated.

[Severity: High]
This isn't a regression introduced by this patch, but is it possible for the
atomic transfer callback to sleep?

lpi2c_imx_xfer_atomic() in drivers/i2c/busses/i2c-imx-lpi2c.c delegates to
lpi2c_imx_xfer_common(), which then calls lpi2c_imx_master_enable(). This p=
ath
executes pm_runtime_resume_and_get(). If the device is suspended, the power
management runtime core will attempt to acquire a mutex and sleep in an ato=
mic
context where interrupts are disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609095119.9240=
29-1-carlos.song@oss.nxp.com?part=3D1
