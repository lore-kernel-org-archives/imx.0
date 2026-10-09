Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695BA1A38F9
	for <imx@lists.linux.dev>; Fri,  9 Oct 2026 02:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791513540; cv=none; b=MuLzwJxx1A9OZlsIAD0KdVC4rN4pBOVg0eP62V+G1TQ+5k3pY5gWHKXWnF5SIoJfUGOlgWwpMsRN7udk11+OJHhFFSkwXwbx22PxBMIUBH1WHZyE8IYvQof8N9yt2dgh05M/5x+vPdjPgaggzqKT+pKLF5U50z0mf5llsgJueuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791513540; c=relaxed/simple;
	bh=aOp3jys28fGZ4cPtLVkAqBmLK3WMhX/SJ+0g1Q70/Vk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SrHCuTAdJfS8xFd2ok8/7wEF7TlfWM56e6veNfgbzYQAeWljQjEAmj/a2mD6ONzKeR3GyagK80+zEbopfTw7tCWOA3axzs55clXXhoYSoDWRbtKy2F54k437GD5m27n+5jvKsredU//92B7WlHmAgdsnXex8OszJwe1mGJ8cQxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxF+nzcO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxF+nzcO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF851F000FF;
	Fri,  9 Oct 2026 02:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791513539;
	bh=ZlMU+EFRYd2O9DpK3enzXXwR8AHPMR4gvj9XwOi70YM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YxF+nzcOpocS3NC5AeIaDkZNiDU76GFdhM3HMVXF4ZRx36q2ofozVTVjt0D/tiWMw
	 JYcX8LL5uhGs/kq1JthheA/PNXfx3f7BChKuBQ3liez1wl9fBFEaCcJE6bcmoqLn+W
	 wj2dSOGxZwGpll8jN1i6n6xWGacjydXX/1SbvvQK4RE9E/rsfPSucc/egqbYp808Yx
	 +eYWWfv+/mDAyKqcDFg4aLBuXb7/QfWDs7HutF2v1YzgwU35IAi9k7XrYX8rGoCeg7
	 h2TZ+Czpsp2PmeuejPjgcj0syljc6k45qcod+R7WuPPvGI/w75Aekdzl6zhSqxLxzq
	 cRztrlr3LWwtg==
Message-ID: <sashiko-outbox-164731@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] clocksource/drivers/timer-imx-gpt: fix resource leak
 on init error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haotian Zhang" <vulab@iscas.ac.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20261009022818.3025610-1-vulab@iscas.ac.cn>
References: <20261009022818.3025610-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 02:38:58 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clocksource: timer-imx-gpt: system hang on error path due to clk_p=
ut() on active clocks
- [High] timer-imx-gpt: ID Use-After-Free of IRQ number on initialization e=
rror path
- [Medium] clocksource: memory and ioremap leak on early timer init failure
--

commit cb103e21afbdcd2ca471ec6f0a4a7ac98ff0a6eb
Author: Haotian Zhang <vulab@iscas.ac.cn>

clocksource/drivers/timer-imx-gpt: fix resource leak on init error paths

This commit attempts to fix a memory and mapping leak in the initialization
error paths of the i.MX GPT timer driver by reorganizing the cleanup
labels. It leaves the timer mapping intact if late initialization fails
because subsystems may already be registered and actively using it.

> diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/ti=
mer-imx-gpt.c
> --- a/drivers/clocksource/timer-imx-gpt.c
> +++ b/drivers/clocksource/timer-imx-gpt.c

[ ... ]

> @@ -455,12 +455,22 @@ static int __init mxc_timer_init_dt(struct device_n=
ode *np,  enum imx_gpt_type t
> =20
>  	ret =3D _mxc_timer_init(imxtm);
>  	if (ret)
> -		goto err_kfree;
> +		goto err_irq;
> =20
>  	initialized =3D 1;
> =20
>  	return 0;
> =20
> +err_irq:
> +	if (!IS_ERR_OR_NULL(imxtm->clk_per))
> +		clk_put(imxtm->clk_per);

[Severity: High]
Could this lead to a system hang if the provider module is unloaded?

If _mxc_timer_init() fails late (after sched_clock_register() or
clockevents_config_and_register()), the clocks are still actively in use
by those subsystems.

Calling clk_put() will drop the module reference to the clock provider,
potentially allowing it to be unloaded and disabling the hardware clocks
while the registered subsystems are still accessing them.

> +	if (!IS_ERR_OR_NULL(imxtm->clk_ipg))
> +		clk_put(imxtm->clk_ipg);
> +	irq_dispose_mapping(imxtm->irq);

[Severity: High]
Is it safe to dispose the IRQ mapping here if mxc_clockevent_init() has
already registered the clockevent device?

The clockevent device remains registered and the clockevents core retains
a reference to this IRQ.

If this virq is freed and subsequently reallocated to another driver via
irq_create_mapping(), could core operations like irq_set_affinity()
inadvertently alter the unrelated driver's IRQ state?

> +	return ret;

[Severity: Medium]
If _mxc_timer_init() fails early (for example, if it fails to get clk_per
and returns before registering any subsystems), does this return path leak
the imxtm allocation and the ioremap mapping?

The new err_irq label returns directly without cascading down to err_unmap
and err_kfree.

> +
> +err_unmap:
> +	iounmap(imxtm->base);
>  err_kfree:
>  	kfree(imxtm);
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009022818.3025=
610-1-vulab@iscas.ac.cn?part=3D1
