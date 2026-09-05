Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34200479868
	for <imx@lists.linux.dev>; Sat,  5 Sep 2026 10:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788605777; cv=none; b=UyF+hvPTEIDKoxj18pyR7t4+4bgRxgYdfCK1Dwlvi/I9MSHcVKqo8sBDP7kT6xxm9k9cXwFAnC51fh6mURV8FYSz5uSxtq4F8KCluzP+zw3eSZDXYOmTi+pvFU/Kv5tMVpsp0ZxTIp2aK4b/SRH934TK5IpLGJs+Ign5A/9DgnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788605777; c=relaxed/simple;
	bh=bGqyXPE75qnMF9eZSwvumB0OiRbTcmDY3Fg4LOfc+JU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D4APqMOLGJQYQHgy2FgwCADrhz9z9R+/9tvVcyR4udxxYZGPYnrf1vfiURXQ/kB2dH2UFeKIIGCQAvOMRP0mFhdDYbOgu+BvRT9aOdUY0kMZ4eG/cEIdKdDP66DRg8mjDViFd9VzvD8HkDWk9KTpviIGbLitnqa7mTgV3LaSyHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJll/o4s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJll/o4s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB061F00A3D;
	Sat,  5 Sep 2026 10:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788605768;
	bh=G87xqMP9tAecej3n4xPImfzUBPp1Cc4WXxGDRtr8GJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eJll/o4sJJ9a2csvod6vUQjBm8AweGENNru6OBzYRPCqka6SgLIWljf7fZoUcS64M
	 P/u5e7cBO3gKYdaHuduqR1D7r69ILhz7PmSY1mTvwfV3V83Kx+ZPoHKyqDT4n3Ly/D
	 uNaUKHz/TYOnvrL/pvrmL0AlSXSCtl2o15+X7Zoa+St8znCHiaCIk9yiO9OzT6MM5r
	 IClJNzKizoPwfoWEyL8t4YjApw41AnRzcC5mBfG2uexc5G7CKovvfxopapGOXBunc+
	 vexohSJ47zHV5J34QmKsYxTz7OY0QLzzIUCPsn3NKFT3AW+pY55AL2PfDZl97aqeGD
	 4aHR2zXPNyahg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v3] net: fec: Propagate PTP initialization errors
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260904105542.70540-1-phucduc.bui@gmail.com>
References: <20260904105542.70540-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 05 Sep 2026 10:56:08 +0000
Message-Id: <20260905105608.AAB061F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Direct return from `fec_probe()` upon IRQ lookup failure bypasses =
error handling cleanup, leading to resource leaks and a kernel panic.
- [High] Freeing `ndev` while the PPS `devm_request_irq` is still active ca=
uses a Use-After-Free if the interrupt fires.
--

commit 946f1eb0b16e1f7bba9a52ab3e2900be9173c0a8
Author: bui duc phuc <phucduc.bui@gmail.com>

net: fec: Propagate PTP initialization errors

Change fec_ptp_init() to return an error code instead of silently
ignoring failures during PTP initialization.

Link: https://lore.kernel.org/all/20260903092430.354186-1-phucduc.bui@gmail=
.com/

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index 794ec427b0ee6..a9a458703547d 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
[ ... ]
> @@ -5394,7 +5397,9 @@ fec_probe(struct platform_device *pdev)
>  	for (i =3D 0; i < irq_cnt; i++) {
>  		snprintf(irq_name, sizeof(irq_name), "int%d", i);
>  		irq =3D platform_get_irq_byname_optional(pdev, irq_name);
> -		if (irq < 0)
> +		if (irq < 0 && irq !=3D -ENXIO)
> +			return irq;

[Severity: High]
Does this direct return bypass the error handling cleanup at the end of
fec_probe()?

By returning directly instead of jumping to the failed_irq label, the driver
bypasses fec_ptp_stop(). This leaves the fep->time_keep delayed work
(scheduled earlier in fec_ptp_init()) active.

It also bypasses free_netdev(ndev), which leaks the net_device structure.

When the driver core cleans up devres allocations on probe failure, it unma=
ps
fep->hwp. If the un-canceled delayed work subsequently fires, will it attem=
pt
to access the unmapped memory at fep->hwp and cause a kernel panic?

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

[Severity: High]
Does this error return leave the devm-managed IRQ active while propagating =
an
error back to the probe function?

If ptp_clock_register() fails, fec_ptp_init() returns an error which
propagates to fec_probe(), causing it to jump to failed_reset.

The error path in fec_probe() manually frees ndev via free_netdev(ndev).

However, the PPS interrupt was registered just prior using devm_request_irq=
(),
so it remains active until fec_probe() returns and devres tears it down.

If the PPS interrupt fires between the manual free of ndev and the devres
cleanup, will fec_pps_interrupt() cast dev_id to ndev and attempt to
dereference the already-freed ndev structure, causing a use-after-free cras=
h?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904105542.7054=
0-1-phucduc.bui@gmail.com?part=3D1
