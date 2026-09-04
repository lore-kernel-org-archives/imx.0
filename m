Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB30E43637C
	for <imx@lists.linux.dev>; Fri,  4 Sep 2026 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513921; cv=none; b=bn1fqMf7SgHbKuliaMmH1rJTMNkK6lLzGMgfcyH5rbX81Ff/NfXhRThcNIPLhq+Zkj7C1hMYe5CpYV9b7Wd9eL8J71ZuKphQvLwlCPunRBvZBVhDbtBojWXDdAt0jqdmZTI/nuvlqUus9NAbDCor7c9qvooPY3gXY4V7NjKSRk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513921; c=relaxed/simple;
	bh=NVNp6C5OGOu8de9PLpPGNzFaGGGP9+ZVZ/VrxPCvAWo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=anrLWNQvGMC7Hp+xruAtEwoAyDYhIf7ELttr+kVOMs1bD21Spqxq1N94ncCWYIe8Okw4x3atcIaesEOMgxS5kzMmDaGd+8vlF+eHeN3Y5s/qQEQC3AkA/ZWEhsMr8L/qYVUozZNy48fF3SNWjdsFY19pCtspUASRAx+eQQIsdHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UF1fYmMn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UF1fYmMn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2644A1F00A3D;
	Fri,  4 Sep 2026 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788513919;
	bh=WZvyxOqjfsV7qF3zecF6hzl/BiftmP2vO3iHUDMKwq0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UF1fYmMnFE0iMZW10Jk25bsX2UO6RXgpVvLFiRvPwsgpWHpGL3KqEIsWcvkEnol+l
	 NGQbbycc6dpBfoheJdz5DPqz+JZT1VxXgJIkGvHZJsZXyCq86wGso+j609uSY4AnnT
	 OlABqtOZOHuUoErMYnT0bYOqVES6XczsLAMx3IhOUxpgCMURjfVVdYgovJtJLi6QCG
	 Bx85e5KUHE8+UAYfyIxCOE7QFUNh/Kd/8d5gXvEJ2tqGoq1W6sdBgnuuqY3oRXTraZ
	 t7uCNG8sWSvyAVJu98Eug+/Zs3DXpOjRI8IWY3hVxagC6IV58P1hbH6vFc6PguF7Cq
	 thLaKwuR/lERA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2] net: fec: Propagate PTP initialization
 errors
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260903092430.354186-1-phucduc.bui@gmail.com>
References: <20260903092430.354186-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 09:25:18 +0000
Message-Id: <20260904092519.2644A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The device interrupt handlers are exposed to a use-after-free wind=
ow on probe error paths because devm_request_irq() is used alongside manual=
 free_netdev().
- [High] Use-after-free on perout_timer due to incorrect teardown ordering =
in fec_ptp_stop().
--

commit c7933bca59e467b625e0e61dff17b0ea0651dbf8
Author: bui duc phuc <phucduc.bui@gmail.com>
Date:   Thu Sep 3 09:24:30 2026 +0000

    net: fec: Propagate PTP initialization errors

    This commit modifies fec_ptp_init() to return an error code instead of
    silently ignoring failures. It adds error propagation for devm_request_=
irq()
    and ptp_clock_register() up through the probe function.

    Link v1: https://lore.kernel.org/all/20260820111416.97917-1-phucduc.bui=
@gmail.com/

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

[Severity: High]
This isn't a bug introduced by this patch, but returning an error here
exposes a pre-existing use-after-free window in the error path.

Because both the PPS interrupt and MAC interrupts are registered using
devm_request_irq(), their lifetime is tied to the platform device. When we
jump to failed_reset, the cleanup code eventually calls free_netdev(ndev).

Since devm_request_irq() teardown happens via devres_release_all() only
after fec_probe() returns, the interrupts remain active while the netdevice
and driver private data are already freed.=20

If an interrupt fires during this window, wouldn't the handlers
(fec_pps_interrupt or fec_enet_interrupt) dereference the freed ndev and
fep pointers? Should the driver avoid mixing devm_request_irq() with manual
free_netdev() to prevent this?

> +	}
> =20
>  	ret =3D fec_enet_init(ndev);
>  	if (ret)

[ ... ]

> diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ether=
net/freescale/fec_ptp.c
> index 56801c2009d59..557a76797ebaa 100644
> --- a/drivers/net/ethernet/freescale/fec_ptp.c
> +++ b/drivers/net/ethernet/freescale/fec_ptp.c
[ ... ]
> @@ -779,26 +779,32 @@ void fec_ptp_init(struct platform_device *pdev, int=
 irq_idx)
>  		      HRTIMER_MODE_REL);
> =20
>  	irq =3D platform_get_irq_byname_optional(pdev, "pps");
> -	if (irq < 0)
> +	if (irq < 0 && irq !=3D -ENXIO)
> +		return irq;
> +	if (irq =3D=3D -ENXIO) {
>  		irq =3D platform_get_irq_optional(pdev, irq_idx);
> -	/* Failure to get an irq is not fatal,
> -	 * only the PTP_CLOCK_PPS clock events should stop
> -	 */
> -	if (irq >=3D 0) {
> +		if (irq < 0 && irq !=3D -ENXIO)
> +			return irq;
> +	}
> +
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
> =20
>  	schedule_delayed_work(&fep->time_keep, HZ);
> +
> +	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but since this patch handles the setup of
the PTP clock, it's worth noting the teardown path has a potential
use-after-free.

In fec_ptp_stop(), the driver cancels fep->perout_timer before calling
ptp_clock_unregister(fep->ptp_clock):

fec_ptp_stop() {
    ...
    hrtimer_cancel(&fep->perout_timer);
    if (fep->ptp_clock)
        ptp_clock_unregister(fep->ptp_clock);
    ...
}

Because the PTP clock device is still registered with the subsystem while
the timer is cancelled, could a concurrent userspace thread issue a
PTP_CLK_REQ_PEROUT ioctl and re-arm the timer just before the netdevice is
freed by the driver remove function?=20

If so, when the re-armed timer expires, its callback=20
(fec_ptp_pps_perout_handler) would execute on freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903092430.3541=
86-1-phucduc.bui@gmail.com?part=3D1
