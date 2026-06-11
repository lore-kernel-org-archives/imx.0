Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B88215075
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 03:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149765; cv=none; b=HTCXFNIcXjthKiL1AARBnKAPp2t8Zpz5zbHGls58rlswmmpifp4dGHvFuPcfZEvYLQxgRZTjC82P7U2pndp0ZQYWtK8OORGwB8CyM4CaCGjFuEemoLvCqVAbKtzB4S7vZdBcbNKiuIlklKNohjno/LWJsGmX2XP5Esf2GG8fcZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149765; c=relaxed/simple;
	bh=gViqOGOYpJl/Yaw0pxU9u+9cBm7WDT9bD++ksCQ2j/M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d6UtIGKSW4xpuGcqkTWULRLgLQYlQN1lfDr7dJvMh5SsZ8NsYXc3Kf9GDsPCd+LFjgw//HQ4x749DEkvh/RYLrg1MEgnx1c/gFwS5lyitiNpT6v7uuggQ8WeF+f3XlXNkFmxaMkHyezlczvBVl71vtIGLxJI2EsiAflpaxE803g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J39Gp/iI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J39Gp/iI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20F01F00893;
	Thu, 11 Jun 2026 03:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781149764;
	bh=U8bNjso6GYuW65fvijXNcgR2MwOOOtwcaxRr2Igqbs4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J39Gp/iIhDGz5BaR+jPgnOhGqsdvlAlP3v7YoTw0G8PPJWcCU4a1Jp3/bNxbLHsfW
	 c8gPceveEfwBYKcW/jh8A1bBKJ0mzwvTVysBShfT+Su1oyTW9r/eHKBHg7WosFI+DF
	 /StNaIumbprjkLuDVQ4dXjMTHo4MjNeWuguNibsnlDzm688sSEbHOS71FoXLBUT5jx
	 eIvXYdHPcmIOknIln3mBKtzwFlXaUA7yHOybZDn44VPogUahL7jbp/V+B0dfY2lcRq
	 8pLLldAlyoPrsG/DG1uePLyKPR7UjpwoShbaO7gaGF1xLz6YtiCL/T3zGyoL1x+trF
	 oy1j/KB8FiDZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv3 2/6] serial: mxs-auart: rework clock handling in
 mxs_get_clks and probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260611033856.6476-3-rosenp@gmail.com>
References: <20260611033856.6476-3-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 03:49:23 +0000
Message-Id: <20260611034923.C20F01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Unconditional clock enablement in probe introduces a reference l=
eak and power management regression for non-ASM9260 devices on driver remov=
al.

Pre-existing issues:
- [Critical] Out-of-bounds array write or incorrect array cleanup due to a =
mismatch between `s->port.line` and `pdev->id`.
- [High] Potential kernel panic due to a Use-After-Unmap condition in the i=
nterrupt handler during device removal or probe failure.
--

commit 7ff1436c03e590a8440db3420eec3a2408bf70ee
Author: Rosen Penev <rosenp@gmail.com>

serial: mxs-auart: rework clock handling in mxs_get_clks and probe

This commit updates the driver to use devm_clk_get_enabled for the AHB
clock so its enable/disable lifetime is managed by the driver model. It
also moves the mod clock prepare_enable out of mxs_get_clks and into
probe to avoid CLK_SET_RATE_GATE failures.

> diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auar=
t.c
> --- a/drivers/tty/serial/mxs-auart.c
> +++ b/drivers/tty/serial/mxs-auart.c

[ ... ]

> @@ -1697,10 +1686,8 @@ static void mxs_auart_remove(struct platform_devic=
e *pdev)
>  	struct mxs_auart_port *s =3D platform_get_drvdata(pdev);
> =20
>  	uart_remove_one_port(&auart_driver, &s->port);
>  	auart_port[pdev->id] =3D NULL;

[Severity: Critical]
This isn't a bug introduced by this patch, but does this clear the wrong
array entry?

In mxs_auart_probe(), the entry is set using the alias ID:
    auart_port[s->port.line] =3D s;

If pdev->id is -1 for device tree instantiated platform devices, wouldn't
this cause an out of bounds memory write into the BSS segment?

>  	mxs_auart_free_gpio_irq(s);
>  	iounmap(s->port.membase);

[Severity: High]
This is a pre-existing issue, but can this cause a use-after-unmap during
device removal?

Since the interrupt was requested using devm_request_irq() in probe, the
devres core will keep it active until after mxs_auart_remove() fully return=
s.

If an interrupt fires during this window, wouldn't mxs_auart_irq_handle()
attempt to read from the hardware registers using the explicitly unmapped
membase?

> -	if (is_asm9260_auart(s)) {
> +	if (is_asm9260_auart(s))
>  		clk_disable_unprepare(s->clk);
> -		clk_disable_unprepare(s->clk_ahb);
> -	}
>  }

[Severity: Medium]
Since s->clk is now unconditionally prepared and enabled for all device
variants during mxs_auart_probe(), shouldn't it be unconditionally disabled
here?

Guarding it behind is_asm9260_auart() seems like it will permanently leak
the clock enable reference for non-ASM9260 devices on module unload.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611033856.6476=
-3-rosenp@gmail.com?part=3D1
