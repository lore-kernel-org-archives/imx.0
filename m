Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461A036F8EA
	for <imx@lists.linux.dev>; Thu, 10 Sep 2026 06:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022870; cv=none; b=eLOJ6x60l2ztVj8co4w2Q5y/kCE4GpMkpiLAe0u8zZHw2qNlGnGD8OfnYxZYFX8+58H2FC9WK8PBnhqCnWj0nCNLyI7hxohuJ7qe5Y1E8iO3CQlvu9qiHwPJiOcVIRcKWE1EPidGHF2VpI+c8JUh+j1H1NcueJwrHvC4K03+7Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022870; c=relaxed/simple;
	bh=og8u/S3OGwJJOQ1Ov5qYWPNnOFb8GHKmizeZyH1HcwM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qa0vmNQAPkoqt/K5sDxekFEdN5Eu6gCr9o03IWFbnjHv9v55kpTKqgnNke0YRpru8ymIca2+xW7bfhk541pFkJdEDztFT9JXprr0vM5yglf3LFBgoSjQGA9CRFcE27EUB6l4hiOHRJw02hB91PfCVZnxEO3p3HxdX6WkWqfw3xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVxNy6ME; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVxNy6ME"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2FBB1F000FF;
	Thu, 10 Sep 2026 06:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789022868;
	bh=67L6iV+kxeoqyejG8PGavf7zjhc6naZ8D0gN24A1JgQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bVxNy6MEwxNZ4QKV3qpPPKK4BMvgG/IHjpqUJKUngUp5IRqw9MfDqVjWGSq7wUYgd
	 EXSV3lxU97jTC/PPP73px9uUf6ZXRlUg/HAf+LM5EMzlA0+tRk0HTAZgXY+mSt5yzT
	 nkwoWGqU3Wx5JpY64SNCEJUlx4UBEFGtOyxP3Awff6woMyVgIvOy926jNlyggW0DKn
	 noRsEexK3F46xBydL+SiOhRbRnf4ra0JAnb6kV3PFPMyt0k8mK/OD1/hs7mZvuHcgc
	 50G/eRDsWYLXuXu4dYpEdD9YrCOMDwLcSpoCF7ISfyfzjGvAYO4lFN1PpWZsRgEaJP
	 aAf/89mV5qZ6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v5 1/2] net: fec: Propagate PTP initialization
 errors
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260909064712.22539-1-phucduc.bui@gmail.com>
References: <20260909064712.22539-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 06:47:48 +0000
Message-Id: <20260910064748.B2FBB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-after-free and crash during probe error paths due to devm_requ=
est_irq() lifecycle mismatch with manual free_netdev() and clk_disable_unpr=
epare().
- [High] Missing synchronization in fec_ptp_stop causes a race condition le=
ading to a use-after-free of the ptp_clock structure in the PPS interrupt h=
andler.
--

commit 4b37ab3f35f3d2df1a812ad2d83b4453fa8b03f2
Author: bui duc phuc <phucduc.bui@gmail.com>

net: fec: Propagate PTP initialization errors

This patch changes fec_ptp_init() to return an error code instead of silent=
ly
ignoring failures during PTP initialization. It ensures that unavailable
optional IRQs are handled correctly, and propagates errors from
devm_request_irq() and ptp_clock_register().

Link v1: https://lore.kernel.org/all/20260820111416.97917-1-phucduc.bui@gma=
il.com/
Link v2: https://lore.kernel.org/all/20260903092430.354186-1-phucduc.bui@gm=
ail.com/
Link v3: https://lore.kernel.org/all/20260904105542.70540-1-phucduc.bui@gma=
il.com/
Link v4: https://lore.kernel.org/all/20260907034502.12619-1-phucduc.bui@gma=
il.com/

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index 794ec427b0ee6..c6e29b5c2abb4 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
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
> +	}
> =20
>  	ret =3D fec_enet_init(ndev);

[ ... ]

> diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ether=
net/freescale/fec_ptp.c
> index 56801c2009d59..557a76797ebaa 100644
> --- a/drivers/net/ethernet/freescale/fec_ptp.c
> +++ b/drivers/net/ethernet/freescale/fec_ptp.c

[ ... ]

> @@ -779,26 +779,32 @@ void fec_ptp_init(struct platform_device *pdev, int=
 irq_idx)

[ ... ]

> +	if (irq > 0) {
>  		ret =3D devm_request_irq(&pdev->dev, irq, fec_pps_interrupt,
>  				       0, pdev->name, ndev);
>  		if (ret < 0)
> -			dev_warn(&pdev->dev, "request for pps irq failed(%d)\n",
> -				 ret);
> +			return ret;
>  	}
> =20
>  	fep->ptp_clock =3D ptp_clock_register(&fep->ptp_caps, &pdev->dev);
>  	if (IS_ERR(fep->ptp_clock)) {
> +		ret =3D PTR_ERR(fep->ptp_clock);
>  		fep->ptp_clock =3D NULL;
>  		dev_err(&pdev->dev, "ptp_clock_register failed\n");
> +		return ret;
>  	}

[Severity: High]
This is a pre-existing issue, but could this new error path trigger a
use-after-free or a crash if an interrupt fires during probe teardown?

If ptp_clock_register() fails, we now return an error after the
PPS interrupt has already been requested via devm_request_irq().

Back in fec_probe(), this error causes a jump to the teardown path:

    ret =3D fec_ptp_init(pdev, irq_cnt);
    if (ret)
        goto failed_reset;

The teardown logic manually disables clocks and eventually frees the netdev:

failed_clk_ahb:
    clk_disable_unprepare(fep->clk_ipg);
...
    free_netdev(ndev);
    return ret;

Since the interrupt is managed by devm, it remains active until the probe
function fully returns. If the interrupt fires during this window, the
fec_pps_interrupt() handler can dereference the freed ndev structure and
read unclocked hardware registers.

Is it possible to explicitly release or disable the devm-managed interrupt
before returning the error here?

[Severity: High]
This is also a pre-existing issue, but does the teardown logic in=20
fec_ptp_stop() contain a race condition with the PPS interrupt?

When cleaning up, fec_ptp_stop() unregisters the clock without
synchronizing against the active PPS interrupt:

    if (fep->pps_enable)
        fec_ptp_enable_pps(fep, 0);
    ...
    if (fep->ptp_clock)
        ptp_clock_unregister(fep->ptp_clock);

Because the IRQ is devm-managed and not explicitly disabled,
fec_pps_interrupt() could execute concurrently. It reads fep->pps_enable
without a lock or memory barrier, meaning it might see a stale value and
dereference fep->ptp_clock after it has been freed.

Would it be safer to disable the interrupt or call synchronize_irq()
before unregistering the clock?

> =20
>  	schedule_delayed_work(&fep->time_keep, HZ);
> +
> +	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909064712.2253=
9-1-phucduc.bui@gmail.com?part=3D1
