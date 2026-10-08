Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645E43BFAF7
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 17:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481521; cv=none; b=Gj2W7zF3so3ZbQ/DRhIQcSyiIqiewCqUNbpjB1Rd6r4t9UEOvCZmTs4ZtimtQeeDzzU02UVIBgLI4jc37zUwi5PK2Bvp2ski/q5pN1iFNeJb1VQkbgmiAQWmQaXcVp61Zrw8/cDux4d+a0GkNRSIVoyIjY/QwktacL4vDT0lMy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481521; c=relaxed/simple;
	bh=bEDEEvcSPLKTTJtxMvwHm4xSRcWE3t1ZDBQUjlNoDkA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gEhMHow7ofnL1Zee6pIJUsTjZ4sCGBbv8mRUqqKq/w3ZHJAJFTqVRiV4JQoAztWtUM92+o233eSltcuo5WbueiRATeAEaUoPBQvIk9718/gkpCJHRYdgH+970hTjG15b9yfLMJvsUYFcYKqhnZeq/ZDAJQzPrLNyrbKKJ+/kBDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nbkBuFoR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nbkBuFoR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4791F000FF;
	Thu,  8 Oct 2026 17:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791481518;
	bh=3NQxVpjlG2ioooQUFBxzLtfzr1RUdeqHuiFCvKppH5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nbkBuFoRLo2jhVaSzd+FoKsfsxOd7NxqvUWGHbBXabU38QH7WF43wVMcgMzDVA/yE
	 XnT8etNOPi+BjBMKx4T0e24h8uB4SDb6xLxvKI47p5PG3doCeaHGlHdnfqqM32aLbJ
	 kExFJ/FyNVq05CqKhpQNuFMUPrZTHG+i4SW5ZDgZ6j5xhs7+0UCU9w6Dhoq1qEvaRI
	 VX4wl3x8lkzZyhhg7ws68n0dJ3uaXZdY+Jo1y9V+3vtoFKxgIsOr0MY+/IFPqI1I3J
	 JlKSK5WES3XJOzFzX/x9jNhROC3CJMpzAjZlOYEPg7CGVQJkj/gHQwhLYQ0W6OhSC/
	 /psaoo8tHa1aQ==
Message-ID: <sashiko-outbox-164434@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clocksource/drivers/timer-imx-gpt: fix resource leak on
 init error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haotian Zhang" <vulab@iscas.ac.cn>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261008173604.2733975-1-vulab@iscas.ac.cn>
References: <20261008173604.2733975-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 17:45:17 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clocksource: Use-After-Unmap of timer base by sched_clock on init =
error
- [Medium] clocksource: missing irq_dispose_mapping on init error path
--

commit e37f50884f58329bb1905901be3a80315d582d01
Author: Haotian Zhang <vulab@iscas.ac.cn>

clocksource/drivers/timer-imx-gpt: fix resource leak on init error paths

mxc_timer_init_dt() maps the timer registers with of_iomap() and obtains
the ipg and per clocks with of_clk_get_by_name(), but every error path
jumps to err_kfree, which only frees the imx_timer structure.  The
ioremap'd mapping and the clock references are therefore leaked when
irq_of_parse_and_map() or _mxc_timer_init() fails.

Unmap the I/O region and release the clocks on those error paths.

> diff --git a/drivers/clocksource/timer-imx-gpt.c b/drivers/clocksource/ti=
mer-imx-gpt.c
> index 8335bd7f8c6ce..b8005054b30ae 100644
> --- a/drivers/clocksource/timer-imx-gpt.c
> +++ b/drivers/clocksource/timer-imx-gpt.c
> @@ -441,7 +441,7 @@ static int __init mxc_timer_init_dt(struct device_nod=
e *np,  enum imx_gpt_type t
>  	imxtm->irq =3D irq_of_parse_and_map(np, 0);
>  	if (imxtm->irq <=3D 0) {
>  		ret =3D -EINVAL;
> -		goto err_kfree;
> +		goto err_unmap;
>  	}
> =20
>  	imxtm->clk_ipg =3D of_clk_get_by_name(np, "ipg");
> @@ -455,12 +455,19 @@ static int __init mxc_timer_init_dt(struct device_n=
ode *np,  enum imx_gpt_type t
> =20
>  	ret =3D _mxc_timer_init(imxtm);
>  	if (ret)
> -		goto err_kfree;
> +		goto err_clk_put;
> =20
>  	initialized =3D 1;
> =20
>  	return 0;
> =20
> +err_clk_put:
> +	if (!IS_ERR_OR_NULL(imxtm->clk_per))
> +		clk_put(imxtm->clk_per);
> +	if (!IS_ERR_OR_NULL(imxtm->clk_ipg))
> +		clk_put(imxtm->clk_ipg);

[Severity: Medium]
Does this error path in mxc_timer_init_dt() leak the IRQ mapping allocated
earlier by irq_of_parse_and_map()?

If _mxc_timer_init() fails, the code jumps here to clean up the clocks and
the ioremap, but it does not call irq_dispose_mapping(imxtm->irq) to clean
up the IRQ mapping.

> +err_unmap:
> +	iounmap(imxtm->base);

[Severity: High]
Can this unmap in mxc_timer_init_dt() cause a fatal use-after-unmap page
fault in the core kernel?

If _mxc_timer_init() fails late in its execution, it might return an error
after mxc_clocksource_init() has already run successfully. For example:

drivers/clocksource/timer-imx-gpt.c:_mxc_timer_init()
    ret =3D mxc_clocksource_init(imxtm);
    if (ret)
        return ret;
    return mxc_clockevent_init(imxtm);

If mxc_clockevent_init() returns an error, mxc_clocksource_init() has
already called sched_clock_register() and registered the clocksource using
imxtm->base. Since there are no APIs to unregister the sched_clock or
clocksource, they will continue to access this memory from hot paths like
timekeeping. Unmapping it here leaves those subsystems reading from freed
memory.

>  err_kfree:
>  	kfree(imxtm);
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008173604.2733=
975-1-vulab@iscas.ac.cn?part=3D1
