Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA5B31578E
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 01:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785288633; cv=none; b=nx/D6zw719lEKRU3lzPwFu0t7a7CoQPQRp1OLa8AbsSTmChQH/UsUaMzxmX6o+NWF3Da0E1KOx+0VA60xthRBU9i8/C4YAiMXcP9fTf1m3CTf63IplBbeDDmi6XrmiP08INecOMM4tjHWG5a49VVo1k9JRlb/cYW9GVHLYiHaRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785288633; c=relaxed/simple;
	bh=PNk2g31F33/527wR9euDlUq6aquj/V9E3SeMvWGUdhQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IW/QZ3jbbcIAFJPQRP777FY+a0NV19+ugkw+I6ASL/lO/LiEo7VFGnzL2MNCneeV6pJSNdL5bU0uObBa2efg1aVUJF9cVL6N6UVsr6D1NOB6RPFBsWywEO5m2BpXGjzBSSsxE76Fgg/B0qav9WhPffrALOuyPGLfB1EFOAjQWw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juSzYjZn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juSzYjZn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A623C1F000E9;
	Wed, 29 Jul 2026 01:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785288625;
	bh=4Sb+rtkjwR08ZEdEzZSJZX4227ifUfKKoWB9ZoEfrno=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=juSzYjZn2Yo9yrkQ5eeKt9byjqm1sjy02d8TEnnE7WDFuabceaDRnC7B5XAmpKYj5
	 xM9GXrHN7gTcKpIPp1bvQICgO78tLi/nMiXyDQyDWqXy8wH00ZxqYNv/vlcr+75a6E
	 sZ1a7XxZByyLD5MTLfvyUTqX2BrCdlwGTwturtJCeyZWF3VC4I6WPHZXDGGpVNKv7c
	 VIGPPIzo9gJxE/ULYVUynZGO5pKvektDOapZ5lhb8K4yAoIzQ3rXMxDxxQGi5+FhY3
	 1JzcCXtrDMwSbJU0f49wbzkBFU2sNSGPSlWKTqTtKO4HaVerLy7qtfies2jmRKkai8
	 XAD02eTaGVc6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] EDAC/fsl_ddr: use non devm for request_irq()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260729012320.616174-1-rosenp@gmail.com>
References: <20260729012320.616174-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 01:30:25 +0000
Message-Id: <20260729013025.A623C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware state leak on error path in `fsl_mc_err_probe` can lead t=
o an interrupt storm.
--

--- Patch [1]: [PATCH] EDAC/fsl_ddr: use non devm for request_irq() ---
commit 8909bee5f3be8d2142784ef41571cbe3330c5c9a
Author: Rosen Penev <rosenp@gmail.com>

EDAC/fsl_ddr: use non devm for request_irq()

This commit changes the driver to use request_irq() instead of
devm_request_irq() so that the interrupt can be manually torn down before
edac_mc_free(), avoiding a use-after-free on teardown.

> diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
> index e4eaec0aa81d5..878d4a86a3c9c 100644
> --- a/drivers/edac/fsl_ddr_edac.c
> +++ b/drivers/edac/fsl_ddr_edac.c
[ ... ]
> @@ -623,7 +623,7 @@ int fsl_mc_err_probe(struct platform_device *op)
> =20
>  		/* register interrupts */
>  		pdata->irq =3D platform_get_irq(op, 0);
> -		res =3D devm_request_irq(&op->dev, pdata->irq,
> +		res =3D request_irq(pdata->irq,
>  				       fsl_mc_isr,
>  				       IRQF_SHARED,
>  				       "[EDAC] MC err", mci);
>  		if (res < 0) {
>  			pr_err("%s: Unable to request irq %d for FSL DDR DRAM ERR\n",
>  			       __func__, pdata->irq);
>  			res =3D -ENODEV;
>  			goto err2;

[Severity: High]
This is a pre-existing issue, but is it possible for this error path to lea=
ve
interrupts enabled in the hardware and cause an interrupt storm?

Earlier in fsl_mc_err_probe(), the hardware state is modified by clearing
FSL_MC_ERR_DISABLE and enabling interrupts in FSL_MC_ERR_INT_EN. If
request_irq() fails here, the goto err2 path cleans up the software state w=
ith
edac_mc_del_mc() and edac_mc_free(), but it does not appear to revert these
hardware registers.

Since the interrupt is requested with IRQF_SHARED, an unhandled interrupt
storm from this device could cause the kernel IRQ core to permanently
disable the shared IRQ line, potentially creating a denial of service for
other devices sharing it.=20

This path could easily be hit if platform_get_irq() returns -EPROBE_DEFER,
since its return value is not explicitly checked for errors before being
passed directly to request_irq().

Should the err2 path restore FSL_MC_ERR_DISABLE and disable FSL_MC_ERR_INT_=
EN
before returning?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729012320.6161=
74-1-rosenp@gmail.com?part=3D1
