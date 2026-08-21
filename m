Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E852652A2
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 11:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787310884; cv=none; b=N4f/y1/CoRxjR4qvQk+qxqGxC81cJcRbsDkNB3BXvVWycR5epnoRsWrqiZ3i2X4R+mUtLuxK8cIoQjxv2m9vB/dgM17CrLLGyZQixuKXvtic9TDbZEs6MtlZ3Bv1MpYVfWwoRkBkGujNdHE3gZLl2ZQxxHAoQBBYrSxXb4ZgQK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787310884; c=relaxed/simple;
	bh=8JxB5V1RTtMbIbtW8zVaxjyVWz0RFJXUCsVF+JnbfeU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b1VQuszSO6QXL2cR9yXH2laOXZMZ4qMi8okYt35/vDCGPS6NcwwU4GbDyRyBddmQofq5GlRc1XVaJCdsmLFIWHlEoKWMwCtmcIZjE2Gt8YOYDy5CViBqyod3EWAk9nU1bg6vkLhxcqq4XlZrCfh2uluYOWdRCtEmHIiBx1hGnm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fa55QQQ4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fa55QQQ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAAED1F00A3A;
	Fri, 21 Aug 2026 11:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787310883;
	bh=jCrfQFVsbM+3+d61V5q6m2wy2OeYJUcHOFr9VqC8NvU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fa55QQQ4HMYIXlvDBFyl0qtiqJjjbZyVUX+dP1xD/CnTd+5fwabPpdeUFvHMza0Lw
	 LSL6JvW6Z3xy7pUG69TT+2YSp5++QZWOEE9oY/Y2bKyWRQdF/A4/pupKCRrbrMKoHk
	 Q/JpcsX4vHCzUp779U1o1qBMFmS5cMpQIF8Vo8GDwdlH20A4zZgDQahHo8S64HtxDO
	 V+QmKysV4d+T193gLHjoY+LPJNMPXk4imdOca2Dwj90QUfrgqAHLhW0TfkioTriNyw
	 0DAboTTal+EZT8hdelD3vNXvhfKLbpxse71DMafpQleFXSQY0ImO20cc2elQCk/LBK
	 ezrw/aLvRDVBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] net: fec: Propagate PTP initialization errors
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260820111416.97917-1-phucduc.bui@gmail.com>
References: <20260820111416.97917-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 11:14:42 +0000
Message-Id: <20260821111442.BAAED1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] `fec_ptp_init()` incorrectly returns 0 (success) instead of prop=
agating the actual error code when `ptp_clock_register()` fails.

Pre-existing issues:
- [High] Concurrent execution of the PPS interrupt handler and device teard=
own causes a use-after-free on `fep->ptp_clock`.
--

--- Patch [1]: [PATCH 1/2] net: fec: Propagate PTP initialization errors ---
commit 72db297960b04e49a3fe9e579f0ca646d2fb313b
Author: bui duc phuc <phucduc.bui@gmail.com>

net: fec: Propagate PTP initialization errors

Change fec_ptp_init() to return an error code instead of silently
ignoring failures during PTP initialization.

> diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ether=
net/freescale/fec_ptp.c
> index 56801c2009d59..8ad680411b0c3 100644
> --- a/drivers/net/ethernet/freescale/fec_ptp.c
> +++ b/drivers/net/ethernet/freescale/fec_ptp.c

[ ... ]

> @@ -779,26 +779,29 @@ void fec_ptp_init(struct platform_device *pdev, int=
 irq_idx)

[ ... ]

>  	if (irq > 0) {
>  		ret =3D devm_request_irq(&pdev->dev, irq, fec_pps_interrupt,
>  				       0, pdev->name, ndev);
>  		if (ret < 0)
> -			dev_warn(&pdev->dev, "request for pps irq failed(%d)\n",
> -				 ret);
> +			return ret;
>  	}

[Severity: High]
This is a pre-existing issue, but is it safe to use devm_request_irq() here
without synchronizing during teardown?

During module removal, fec_drv_remove() calls fec_ptp_stop(), which sets
fep->pps_enable =3D 0 and unregisters fep->ptp_clock. However, since the
interrupt is managed by devres, it isn't freed or synchronized until after
the remove function completes.

If the interrupt fires concurrently on another CPU:

CPU 1 (fec_ptp_stop)
    ptp_clock_unregister(fep->ptp_clock);

CPU 2 (fec_pps_interrupt)
    if (fep->pps_enable) {
        event.type =3D PTP_CLOCK_PPS;
        ptp_clock_event(fep->ptp_clock, &event);
    }

If CPU 2 reads fep->pps_enable as true just before CPU 1 clears it, could it
then dereference the freed fep->ptp_clock?

> =20
>  	fep->ptp_clock =3D ptp_clock_register(&fep->ptp_caps, &pdev->dev);
>  	if (IS_ERR(fep->ptp_clock)) {
>  		fep->ptp_clock =3D NULL;
>  		dev_err(&pdev->dev, "ptp_clock_register failed\n");
> +		return PTR_ERR(fep->ptp_clock);

[Severity: Medium]
Since fep->ptp_clock is set to NULL on the line directly above this one,
doesn't PTR_ERR(fep->ptp_clock) evaluate to 0 here?

This would cause the function to return success instead of propagating the
negative error code from ptp_clock_register().

>  	}
> =20
>  	schedule_delayed_work(&fep->time_keep, HZ);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260820111416.9791=
7-1-phucduc.bui@gmail.com?part=3D1
