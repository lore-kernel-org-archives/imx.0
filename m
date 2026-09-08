Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E724D33344A
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 03:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788839145; cv=none; b=KsxMDMndKKrYg4zx5jvHN3+1AaSiMqnJLHN2NbFI9vT6aXRk8MbVPH+aJ/qKdmSIwxc1OSJ92xLBnH3HRt+BD36jYa0wMyRY3DiphUoe60CteaBBlud7Ee1C2FILLsMoHF39gn4ck9vfZo7GkslMa9qKlzg7naafdwIzDoBqLKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788839145; c=relaxed/simple;
	bh=NvrVeQu1SPDdAOFLfFRnwxSehNa7gDxj7uVY85fVbws=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uuw50/ia0zwYuppJkK+kvBAhG+OEqHD88L46fYYXDnmu4QUE7ZCIj6ZfaXoMhxiCCoGDg7tZ7vPhm4QlpQqTbXj8M96Ja1cmb+Ii/Bh+BwgbtQwG8bu2BQKodOC/k/t7X079lyk/2FP+lKDFsVw0Z7ClJXojyHqFWbpc9uzz0M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqSE/Vw6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqSE/Vw6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7F71F00A3D;
	Tue,  8 Sep 2026 03:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788839132;
	bh=b00MWKrcQqgZvUb15ZjvKFfAmP1pEbg5JcPsWm5gWoE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fqSE/Vw6HNav4id93mY0HNz29bK1/G86l0EE3AJEvJDdEHj/BTKr6gHmpabcZqQNm
	 BnX1CJoNvvzwDn8G6H2sKCXQS92JE6v2vcSoQQ0eXPKz10TbY5gvmsEMdWBOGQLyL1
	 n6ngzt3S/rdM0e1gjTGzArFny1SakViTPlZQfNqNmFlFvVfjHs2JY5H8qo93tqM8fx
	 BsImmZiWfmB7qdqbA21fPBdXKzi4v4mogHsONRg5h75EYQPj3yekSyANDfn9vCYO3/
	 Hv1SbUUdk15Igf2ev2+t7TPfLmLih15ezc78ph3VzhflEf6BkOW9cXKJy5Jng7PJbA
	 pTw0pi8PfA5Uw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v4] net: fec: Propagate PTP initialization errors
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260907034502.12619-1-phucduc.bui@gmail.com>
References: <20260907034502.12619-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 03:45:31 +0000
Message-Id: <20260908034531.CE7F71F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free when an interrupt fires during probe error cleanup.
--

commit c6180f28237530f0bd4b2e7e5386b744e16c2a6a
Author: bui duc phuc <phucduc.bui@gmail.com>

net: fec: Propagate PTP initialization errors

Changes fec_ptp_init() to return an error code instead of silently ignoring
failures during PTP initialization. This ensures proper propagation of
errors such as -EPROBE_DEFER.

Link: https://lore.kernel.org/all/20260820111416.97917-1-phucduc.bui@gmail.=
com/
Link: https://lore.kernel.org/all/20260903092430.354186-1-phucduc.bui@gmail=
.com/
Link: https://lore.kernel.org/all/20260904105542.70540-1-phucduc.bui@gmail.=
com/

> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethe=
rnet/freescale/fec_main.c
> index 794ec427b0ee6..f7636f23d1ebb 100644
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
> +	}

[Severity: High]
This is a pre-existing issue, but does jumping to the cleanup path on
fec_ptp_init() failure expose a use-after-free window?

When fec_ptp_init() successfully requests the PPS interrupt via
devm_request_irq() using ndev as dev_id, but then fails later at
ptp_clock_register(), it now returns an error back to fec_probe().

Jumping to failed_reset continues down the cleanup path:

fec_main.c:fec_probe() {
...
failed_ioremap:
    free_netdev(ndev);
    return ret;
}

Because the PPS interrupt is devm-managed, it won't be unregistered until
after fec_probe() returns and devres cleanup runs. If the hardware asserts
the PPS interrupt in the window between free_netdev(ndev) and devres
cleanup, won't the interrupt handler (fec_pps_interrupt) dereference the
freed ndev pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907034502.1261=
9-1-phucduc.bui@gmail.com?part=3D1
