Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC09F47141E
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091399; cv=none; b=IgVaxnnA6ZMY9En6hDMKBC9tjkJK0DV15oZUSpy28o/HYBoXL4EyUUowH76q2XdpO11KxEucgx2XiXBhprwI/ppkZUzrnaOqjjNZPVH3kUknWipm87qAyoUqDyRDGlVBf8L/e7L7WmPuljqNxjO23SeTVPrntJHFdrMbSgiR/+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091399; c=relaxed/simple;
	bh=hoZFacPuTLYSm+UKpnWSuyHJEbNkDNezz+9KwZRwbag=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tuV0lYeooPnXxFQGiovisvvh23QkPUZEiUJ2jGECfrU3zEXeaDAb7DPEURwuXnI/ePr20jntk44rZ7t0DoO9KxCQ3fE6NxvskbpGFexXygygSJnljJl+l09WchPI/MYv3xE1cAYt67FKtNGoq7TKzMJIoufDeRVzIHxUAh6QOME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3otAtPn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3otAtPn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A791F000E9;
	Fri,  7 Aug 2026 08:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786091397;
	bh=aVymmRkit+nA7ecwSxGmEFB924b/20/DPBVJdXQOBkE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F3otAtPnAHwvS5r8QSpOwvHuAPpua7QzR/7mCEWv6LBzUtLH6F4kvZCZAQXXM3i8K
	 rUUNFpYijDFKQ6nhESoHidymsderaLXACzLv37Vh63sktV3KKSbFqmO57WiZhgZ2gl
	 yTSTmRAN1L8A2mLqEjTWccFVNo0poKDUCQt5mCc6+HhL78GW5OVdsrgEXwah5k9FF4
	 CrBhU58j76u5gEROodtwuwmZH2pPrsqN+kqfTzFAkoegs+NuSkQJniWDYfPyvpKxud
	 De1x60dEfb8q+9gwZp4MjafQ2njSWzM5N83VVJ0y+bE9A0550J5IGRoF2rD46z5g/R
	 RpUE80pLbmuXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] irqchip/imx-irqsteer: Allow building as module
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260807072346.1222389-5-Zhipeng.wang_1@oss.nxp.com>
References: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
 <20260807072346.1222389-5-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:29:56 +0000
Message-Id: <20260807082957.49A791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Missing explicit runtime PM management in `remove()` causes a hard=
ware access crash and a clock enable count underflow during devres cleanup.

Pre-existing issues:
- [High] The chained IRQ handler accesses hardware registers unconditionall=
y without ensuring the device's clock is enabled, which can crash the syste=
m on spurious interrupts.
--

--- Patch [4]: [PATCH v3 4/4] irqchip/imx-irqsteer: Allow building as modul=
e ---
commit d2409da6cb54e5e7df533908b454c22db10f15a7
Author: Jindong Yue <jindong.yue@nxp.com>

irqchip/imx-irqsteer: Allow building as module

Make the driver buildable as a module by turning the Kconfig symbol into
a tristate and using module_platform_driver() instead of
builtin_platform_driver(). Let the driver core own the clock and runtime PM
lifetime so that remove() does not have to hand-balance them.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 0c9c99f1141a9..e62862617b8d1 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c

[ ... ]

> @@ -266,15 +260,22 @@ static int imx_irqsteer_probe(struct platform_devic=
e *pdev)
> =20
>  	platform_set_drvdata(pdev, data);
> =20
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
> +	if (ret)
> +		goto err_irq;

[Severity: High]
This is a pre-existing issue, but does the chained IRQ handler access hardw=
are
registers unconditionally without ensuring the device's clock is enabled?

If no child interrupts are requested by client drivers, the irqsteer device
drops its PM usage count to 0 and enters runtime suspend, disabling ipg_clk.
However, the parent interrupt handler imx_irqsteer_irq_handler remains
registered and active with the core IRQ subsystem.

If a spurious interrupt arrives while the device is suspended, the handler
executes and directly reads the CHANSTATUS register:

drivers/irqchip/irq-imx-irqsteer.c:imx_irqsteer_irq_handler() {
	...
	irqmap =3D readl_relaxed(data->regs + CHANSTATUS(idx, data->reg_num));
	...
}

Accessing memory-mapped registers of an IP block with a gated interface clo=
ck
can trigger a hardware fault (external abort / bus fault).

Should the handler use pm_runtime_get_if_active() to verify the power state
before accessing hardware?

[ ... ]

> @@ -302,8 +303,6 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
>  						     hwirq));
> =20
>  	irq_domain_remove(irqsteer_data->domain);
> -
> -	clk_disable_unprepare(irqsteer_data->ipg_clk);
>  }

[Severity: High]
Does this change cause a hardware access crash during driver unbind?

On driver unbind, the driver core drops its PM reference by calling
pm_runtime_put_sync() before invoking the driver's remove callback. Since no
children are holding PM references, the device suspends synchronously, and
imx_irqsteer_suspend() disables ipg_clk.

When imx_irqsteer_remove() executes, it writes to CHANMASK hardware registe=
rs
with a disabled clock, which can trigger a fatal bus fault:

drivers/irqchip/irq-imx-irqsteer.c:imx_irqsteer_remove() {
	...
	for (i =3D 0; i < irqsteer_data->reg_num; i++)
		writel_relaxed(0, irqsteer_data->regs +
			       CHANMASK(i, irqsteer_data->reg_num));
	...
}

Additionally, devres teardown runs after remove() in LIFO order and unwinds
devm_clk_get_enabled() by calling clk_disable_unprepare(). This decrements
the already-zero clock enable count, throwing a WARN and corrupting the clo=
ck
tree.

Should the driver explicitly wake the device in remove() (e.g., via
pm_runtime_get_sync()) before accessing registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807072346.1222=
389-1-Zhipeng.wang_1@oss.nxp.com?part=3D4
