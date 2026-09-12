Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0173546F0
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 04:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789185809; cv=none; b=o1N1lDEIRJO6mmSRoJFLemwDNvJISX/hYvVU86oi+MYspFWNvvy4YZ0ELjMnzXMR+E70bvpG2uuIqbkWrtDnVzouoNV/LgpVbXAka8FCBe9ea9nhKiMgVFGIVlvPoNkpbWhgu3RJHBNuN32tD9/Dt6RwFKsZlLy04MeySsL0Hpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789185809; c=relaxed/simple;
	bh=FWyL90sz2zsdvsjaP3hS8aQgKfA3FDZs5zF1nbXmuCM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RayCgG6HvR0bx2PFLcxqBtVLmfftdWNfPa5XGwLnim+j4NTJuHdL2gKWd/1xPdxUn/F4NtRxlYHVM9DwtOWlKzAHvHGeg2ivp8gRWLjDBkTMxKfsP7Vuu4xIFTZHdLkrJ5QJvt6kd2maPYPoh8XfGtEkvZsO7u4EzlSzydJkq6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7PS6heJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7PS6heJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EED7A1F000FF;
	Sat, 12 Sep 2026 04:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789185804;
	bh=A7mrV1leXptm10LMDr9jtd3frWi43EsXNI0p5v6LbT4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y7PS6heJ3cj/3rYyMeHkGKroiBuCqa557Si2LO9sZTcDsI4wdGwP5QUpYKaB9UBz7
	 vAbhU6xlM+OBHsg4DYuv7eeJL3cv8NNAJgZdVkFI/T3eNUE3W9uQ067SlvnOqjF5GI
	 emX0S83b0aUlHL77zF+pnBKkpsWjDDG/YmI1GShNL9feaCkeTkJoGzDW7uHNg+dX13
	 fYlQ1UhtL6NZKv6RUSqUvetS2+GeRmLmGOnFZ1vgARteOn9RFe1LVUmPUWPQXJEfRB
	 OHPk0SbB2KekGyEkyCoWuu3nNNm0Cm+d3WLbkDmV/ZznWBXeSpK+p6Kn1vFhZhL1PB
	 cHrhSTrkHZqxg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 1/2] net: fec: Propagate PTP initialization
 errors
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260911040021.12289-1-phucduc.bui@gmail.com>
References: <20260911040021.12289-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 04:03:23 +0000
Message-Id: <20260912040323.EED7A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unsafe error paths leave the devm-managed PPS IRQ active while har=
dware clocks are disabled and `ndev` is freed.
--

commit 4a112d5fbd55881d0083cd7c88b9d35cd673b462
Author: bui duc phuc <phucduc.bui@gmail.com>

net: fec: Propagate PTP initialization errors

This commit changes fec_ptp_init() to return an error code instead of
silently ignoring failures during PTP initialization. It also propagates
failures from devm_request_irq() and ptp_clock_register().

Link: https://lore.kernel.org/all/20260909064712.22539-1-phucduc.bui@gmail.=
com/

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
[ ... ]
> @@ -5384,8 +5384,11 @@ fec_probe(struct platform_device *pdev)
>  		goto failed_reset;
> =20
>  	irq_cnt =3D fec_enet_get_irq_cnt(pdev);
> -	if (fep->bufdesc_ex)
> -		fec_ptp_init(pdev, irq_cnt);
> +	if (fep->bufdesc_ex) {
> +		ret =3D fec_ptp_init(pdev, irq_cnt);
> +		if (ret)
> +			goto failed_reset;

[Severity: High]
This isn't a bug introduced by this patch, but this new error path exposes a
pre-existing issue.

If fec_ptp_init() fails (for example, when ptp_clock_register() returns an
error), we jump straight to failed_reset. At this point, the PPS interrupt
has already been requested via devm_request_irq() inside fec_ptp_init().

The cleanup path under failed_reset disables hardware clocks (clk_ahb,
clk_ipg) and eventually frees ndev. Since the devm-managed IRQ is not freed
until fec_probe() returns, the interrupt remains active during this cleanup.

If a pending PPS interrupt fires during this window, fec_pps_interrupt()
will access hardware registers with clocks disabled and dereference the
freed ndev memory. Could this lead to a kernel panic or use-after-free
during a probe failure?

> +	}
> =20
>  	ret =3D fec_enet_init(ndev);
>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911040021.1228=
9-1-phucduc.bui@gmail.com?part=3D1
