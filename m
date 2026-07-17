Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262DF3002DC
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 08:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276188; cv=none; b=cZuIi8SiJBNVAiHqhh6oI5HfDy0tGNcxt91pdMv1f4dGYuYOlfgQgaO3W/B6y60qsg2ib05aoLFBF8g3cuuBwTvgxh6pG7gUSGTjWZ+4DwC6pVp/+pfVm5AnbFlk0XA8fLbty1gKpcttJsyJ7BTUCYD6/3xWLdw3TT8Z20dnHqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276188; c=relaxed/simple;
	bh=LlG3XdagHMLZT1ZrvrOajQUT4i6TPbt3TDDBZurXLaY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WZpWWcPjD+TdPNijbbngTRWZyKivDa/6/e8bv03gNfzkXaoL3GiJQga3NVSJOyMU4szOX+JByUeFB/fO0ZoH25Dk3rg+DW1I6Vae0XRnu0wL/nT+8uWCWmvsy3/8oPEnaQkVJGMY/8MSRZdTCl7JaS/bNt8nckk8J82xV/i5w4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFA2AMqf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFA2AMqf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA5101F000E9;
	Fri, 17 Jul 2026 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276186;
	bh=jcVcPTQggKrT5Cmqsvs+/KkNTh/8m3/7QKE0nXWMSOQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bFA2AMqfnwRef+LNPdGbnFKa9uZLKL4lDvwWakJAGsWUpL2/SGiy8ZxNJuME278fo
	 q/UUqcd2+k+oONB5k30CPDZzeYmKLKb8Rb3rw1+vj0rFw4zIvb3O9BejlxvXfpJ1tq
	 FVY+F0ezkdfyi+dmB08HAxFEA6vUZF3kpzudRM7ru4mkd7kgazYfIWwjprhtc5MJyJ
	 OlNslnYC2UPP29i8MbmMdxjfz3bMoX3iNz27/IG/NwQf2ZaZ5GYFifmS9LP/b0lwMl
	 RIaRv+Bg5PRX3pxV9mXuB9lVyJKGGsXU8vqbgrtc0nHm+lSnD700oW/dQW83ZCek2M
	 KfDeYeSdAyvZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/12] crypto: Remove redundant
 dev_err()/dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260717080045.191538-5-panchuang@vivo.com>
References: <20260717080045.191538-1-panchuang@vivo.com>
 <20260717080045.191538-5-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 08:16:25 +0000
Message-Id: <20260717081625.CA5101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Premature IRQ registration before clocks and driver state are init=
ialized
--

--- Patch [4]: [PATCH 04/12] crypto: Remove redundant dev_err()/dev_err_pro=
be() ---
commit 1a1461364ed2dcfb8ce0bfe3945b90a7c3d3835d
Author: Pan Chuang <panchuang@vivo.com>
Subject: crypto: Remove redundant dev_err()/dev_err_probe()

Since devm_request_irq() automatically logs detailed error messages on
failure, this patch removes the now-redundant driver-specific dev_err()
and dev_err_probe() calls across multiple crypto drivers.

> diff --git a/drivers/crypto/atmel-aes.c b/drivers/crypto/atmel-aes.c
> index b393689400b4c..1bf00df864e8f 100644
> --- a/drivers/crypto/atmel-aes.c
> +++ b/drivers/crypto/atmel-aes.c
> @@ -2369,10 +2369,8 @@ static int atmel_aes_probe(struct platform_device =
*pdev)
> =20
>  	err =3D devm_request_irq(&pdev->dev, aes_dd->irq, atmel_aes_irq,
>  			       IRQF_SHARED, "atmel-aes", aes_dd);

[Severity: High]
This is a pre-existing issue, but can this premature IRQ request cause a cr=
ash?

Since IRQF_SHARED is used here, if another device sharing this IRQ line tri=
ggers
an interrupt before the aes_clk is enabled, atmel_aes_irq() will unconditio=
nally
read from the AES_ISR register:

    atmel_aes_irq()
       reg =3D atmel_aes_read(aes_dd, AES_ISR);

Could this result in a bus fault because the hardware is still unclocked?

> -	if (err) {
> -		dev_err(dev, "unable to request aes irq.\n");
> +	if (err)
>  		goto err_tasklet_kill;
> -	}
> =20
>  	/* Initializing the clock */
>  	aes_dd->iclk =3D devm_clk_get_prepared(&pdev->dev, "aes_clk");

[ ... ]

> diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
> index 133ebc9982362..49cd6b036a86c 100644
> --- a/drivers/crypto/mxs-dcp.c
> +++ b/drivers/crypto/mxs-dcp.c
> @@ -1085,17 +1085,13 @@ static int mxs_dcp_probe(struct platform_device *=
pdev)
> =20
>  	ret =3D devm_request_irq(dev, dcp_vmi_irq, mxs_dcp_irq, 0,
>  			       "dcp-vmi-irq", sdcp);

[Severity: High]
This is a pre-existing issue, but does this request the IRQ too early?

If a pending interrupt from the bootloader fires immediately here, mxs_dcp_=
irq()
might access uninitialized data structures, as the locks in sdcp->completion
aren't initialized until later in the mxs_dcp_probe() function.

> -	if (ret) {
> -		dev_err(dev, "Failed to claim DCP VMI IRQ!\n");
> +	if (ret)
>  		return ret;
> -	}

[ ... ]

> diff --git a/drivers/crypto/omap-aes.c b/drivers/crypto/omap-aes.c
> index f31555c0d715b..711909de20130 100644
> --- a/drivers/crypto/omap-aes.c
> +++ b/drivers/crypto/omap-aes.c
> @@ -1172,10 +1172,8 @@ static int omap_aes_probe(struct platform_device *=
pdev)
> =20
>  		err =3D devm_request_irq(dev, irq, omap_aes_irq, 0,
>  				dev_name(dev), dd);

[Severity: High]
This is a pre-existing issue, but could this lead to a BUG_ON crash?

The IRQ is requested after the device is suspended via pm_runtime_put_sync(=
),
and dd->in_sg is still NULL. If a pending interrupt fires right after this
registration, could the handler try to access the suspended device or trip
a BUG_ON over the NULL scatterlist?

> -		if (err) {
> -			dev_err(dev, "Unable to grab omap-aes IRQ\n");
> +		if (err)
>  			goto err_irq;
> -		}
>  	}

[ ... ]

> diff --git a/drivers/crypto/sahara.c b/drivers/crypto/sahara.c
> index 533080b0cddc9..d586f1315de1f 100644
> --- a/drivers/crypto/sahara.c
> +++ b/drivers/crypto/sahara.c
> @@ -1305,8 +1305,7 @@ static int sahara_probe(struct platform_device *pde=
v)
>  	err =3D devm_request_irq(&pdev->dev, irq, sahara_irq_handler,
>  			       0, dev_name(&pdev->dev), dev);

[Severity: High]
This is a pre-existing issue, but can the handler execute before the
clocks are ready?

The ipg and ahb clocks are retrieved and enabled after this IRQ registratio=
n.
If a bootloader left an interrupt pending, could sahara_irq_handler() attem=
pt
to access unclocked hardware registers?

>  	if (err)
> -		return dev_err_probe(&pdev->dev, err,
> -				     "failed to request irq\n");
> +		return err;
> =20
>  	/* clocks */
>  	dev->clk_ipg =3D devm_clk_get_enabled(&pdev->dev, "ipg");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717080045.1915=
38-1-panchuang@vivo.com?part=3D4
