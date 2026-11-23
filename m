Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451363;
	b=CzTn4cklUOrXpznhD9NzHD7CeUywObCj2MkZkGMDJhfNulq/+XN7xeEjLvP/ewHm/u27
	 7ic1rB7fRQIAm20ZC45E80kYbT7bSyxM0CkxLTRk2Em5E+O/0Et4VBrF3sejXj3pp0P0F
	 FOVFq8dYmvzIKUeEyMvffNxVdCIGX52qDgahtzah1bXhD4G+41AupPIDGYsmKDMyEjJmp
	 7fPfCIVz1+51l0o2fKt2L8M9dK5BH3V3JtPOsGJrBylOUsTbCbhKTkYsXAl7Zsad8KJrE
	 wOEEYkpbCZkp2QdS16b3y6zoviJQFDAV9V39W0jLDFIDKj/fSkbjHi1aXBk/5YNtGzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451363;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vQrGc4iAyhBqa4V3gtZ3K4iEvM4Y8dsZvqhscwx4s4w=;
	b=X13Z+P2+mJCoScEwYErDLmixy6Kx+K8u3oWcTy8YuSJj+PDyHbwm3KfPpa0g/aq1U/S8
	 EOZG/HFoyOUmMtB6LNa3qgyVthTQkyMG8h9dOV0XQuN62PecvzF9FHRBqkenrNK5569Ss
	 lPIUjQPuJKCGLlrYnGP61jzwI8vOnXozx8vYSXuvv2+AxJBMjMA7wPHQvTRV10M30ugAa
	 UVyH0Z5iikuAMwkLGZdLuZYIu44xWtZHJmuJTecFOzD0DcCZk2GODLI831z9IzoR1eofA
	 DKVS7Ov5J/Ni+hETxihoOK4iktoPrF+PDXq083tXU+MU+YBOTbqpMuab7Igrg3zR9iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SMqG7MTH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90440606A31E
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 16:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SMqG7MTH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CC61F000D3;
	Mon, 23 Nov 2026 16:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795451362;
	bh=vQrGc4iAyhBqa4V3gtZ3K4iEvM4Y8dsZvqhscwx4s4w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SMqG7MTHAGy3JJXxCci/3MWCm/+KlYYeAqPmknGgzivx9fzUHkyIVuEle4LODvHVM
	 z5k1+HwdFwAFTNB2QovFyMdZyLv6pFyYfn9FQ7/4Q1ditCjv4u8aOW1VFIEP2zqYuV
	 iu99PLp3G59JdHmWhjgSZh1CIRA4IIZq2/5wozTpbTPZyEQrnAUq+hDAHuJVIqXJlj
	 /Rddc3cZ6+TWlXDt1suenXghIerc+YV0T2IMbvbGwZ+WPvPIBmxYsvOvM51gh25W9i
	 nvrkBVHewOHNeEd5zojJZxQOWP/5CFkvapI24S0xU4P8kiTP8KD1R+/zrYwmgISLXs
	 07P+utHB/zOCQ==
Message-ID: <sashiko-outbox-229658@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] spi: imx: Use devm_clk_get_enabled() calls in
 spi_imx_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Markus Elfring" <Markus.Elfring@web.de>, imx@lists.linux.dev
Cc: Frank.Li@kernel.org
In-Reply-To: <895d50a6-3a42-44d2-8625-3b8cba8fbfff@web.de>
References: <895d50a6-3a42-44d2-8625-3b8cba8fbfff@web.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 16:29:22 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] spi: imx: double clk_disable_unprepare() on unbind in
  spi_imx_probe()
--

commit e7cc62f9e52ed65ab0fb34e0d12c2e19021d535c
Author: Markus Elfring <elfring@users.sourceforge.net>

spi: imx: Use devm_clk_get_enabled() calls in spi_imx_probe()

This commit replaces devm_clk_get() and clk_prepare_enable() for clk_ipg
and clk_per in spi_imx_probe() with devm_clk_get_enabled() and removes the
clk_disable_unprepare() calls from the probe error path.

> diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
> index 90d5b635c3822..76f5543adfd2e 100644
> --- a/drivers/spi/spi-imx.c
> +++ b/drivers/spi/spi-imx.c
> @@ -2320,22 +2320,14 @@ static int spi_imx_probe(struct platform_device *=
pdev)
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "can't get irq%d\n", irq);
> =20
> -	spi_imx->clk_ipg =3D devm_clk_get(&pdev->dev, "ipg");
> +	spi_imx->clk_ipg =3D devm_clk_get_enabled(&pdev->dev, "ipg");
>  	if (IS_ERR(spi_imx->clk_ipg))
>  		return PTR_ERR(spi_imx->clk_ipg);
> =20
> -	spi_imx->clk_per =3D devm_clk_get(&pdev->dev, "per");
> +	spi_imx->clk_per =3D devm_clk_get_enabled(&pdev->dev, "per");
>  	if (IS_ERR(spi_imx->clk_per))
>  		return PTR_ERR(spi_imx->clk_per);
> =20
> -	ret =3D clk_prepare_enable(spi_imx->clk_per);
> -	if (ret)
> -		return ret;
> -
> -	ret =3D clk_prepare_enable(spi_imx->clk_ipg);
> -	if (ret)
> -		goto out_put_per;
> -
>  	pm_runtime_set_autosuspend_delay(spi_imx->dev, MXC_RPM_TIMEOUT);
>  	pm_runtime_use_autosuspend(spi_imx->dev);
>  	pm_runtime_get_noresume(spi_imx->dev);

[Severity: High]
Does using devm_clk_get_enabled() here cause a double
clk_disable_unprepare() on clk_per and clk_ipg when the device is unbound?

spi_imx_probe() calls pm_runtime_set_active() right after enabling the
clocks, handing ownership of that initial prepare/enable reference to
runtime PM:

drivers/spi/spi-imx.c:spi_imx_remove() {
	...
	pm_runtime_dont_use_autosuspend(spi_imx->dev);
	pm_runtime_put_sync(spi_imx->dev);
	pm_runtime_disable(spi_imx->dev);
	...
}

drivers/spi/spi-imx.c:spi_imx_runtime_suspend() {
	...
	clk_disable_unprepare(spi_imx->clk_per);
	clk_disable_unprepare(spi_imx->clk_ipg);

	return 0;
}

When spi_imx_remove() runs with CONFIG_PM enabled, pm_runtime_put_sync()
invokes spi_imx_runtime_suspend() and disables both clocks.  The
devm_clk_get_enabled() release action then calls clk_disable_unprepare() a
second time on already-disabled clk_per and clk_ipg, triggering clock
enable/prepare count underflow warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/895d50a6-3a42-44d2-=
8625-3b8cba8fbfff@web.de?part=3D1
