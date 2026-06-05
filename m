Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574742472B6
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658617; cv=none; b=BrsOhA00LkunmtTq9yfCTplF+BZ6HuTlcCKz6sv0VNPqb+VHssYeU1XOcshwKxrEbIkd2aMo3M8FGaPiOfqCpdWwxDRHulOKww1ZN9UT8Q9zZF8N/gmGkR8STMovGtdy46x25/kJuOWvskQauPuMu6/9RDaKhbRKvSlGzNKOdoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658617; c=relaxed/simple;
	bh=P8S0OCKHV5oomZYdS72kmH3uSqLg+3/T1qhqVz5gEGE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JFOIxD0SPU2Kih16o1Nm/8cMG7rxN+PpMIzuFGJeYtwgAeIoIRCCz9F5BDbA0fmlw/0GgMbf0iNCJlgh+A/My04wD+Qb7LpoI3UGn12SQV3UY9XNSF4alcs9/kl0tdmAtWVpKXo187ZFAEKh4EeDUXqDu3VRoJAR0fuPM7QmESw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4GDFGnN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4GDFGnN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FC2B1F00893;
	Fri,  5 Jun 2026 11:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780658616;
	bh=JN0rCQwtzUe8DzjX4ue1FESIXUvp/T+r9WwX3Jltj0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H4GDFGnN6CNWbwKXkcMrCRxWuGsgMTQKVBshKlx8zQSyi2B8pPXup6lnjpWEjNRwt
	 mmf6RztCsUk3YJQdXqKSl/CIf896Cx4kGYE7xDNet79Zu6DAQn5BKgY3qN3px4gUt2
	 CUcqgSBDXJHLkq82rSZYQDy+Fj48CemIQe0kBfxs7XmEc8mlIdcOzvN4CyVpjmjYV8
	 F6uAIyQxlrvILtXBa6yIjbwUffLEKelUsW/ljGiWa9nkIOUcB4YFp2KSOT9UCpROZg
	 77w/Fup9t94oMd9X4pv/GVEeJnEQZxIVCM9/qkeOyMFiPPk6pf70wwPeAXKEE5nHOA
	 hWp393Vf2rxYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] phy: fsl-imx8mq-usb: add runtime PM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: Frank.Li@kernel.org, olteanv@gmail.com, vkoul@kernel.org, imx@lists.linux.dev, linux-phy@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <20260605-imx8mp-usb-phy-improvement-v4-3-b2ddf2f3862c@nxp.com>
References: <20260605-imx8mp-usb-phy-improvement-v4-3-b2ddf2f3862c@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 11:23:35 +0000
Message-Id: <20260605112335.8FC2B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Mixing `devm_clk_get_enabled()` with manual `clk_disable_unprepare=
()` in runtime PM callbacks causes a clock enable count underflow during dr=
iver unbind.
--

commit 974b1a50a22e38e08aa5fd0139ae39d578c8f39c
Author: Xu Yang <xu.yang_2@nxp.com>

phy: fsl-imx8mq-usb: add runtime PM support

Add runtime PM to ensure the PHY is properly powered and clocked during
register access, preventing potential system hangs.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index 591ddf3460618..27aa696f5dd40 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c

[ ... ]

> @@ -693,13 +681,13 @@ static int imx8mq_usb_phy_probe(struct platform_dev=
ice *pdev)
> =20
>  	platform_set_drvdata(pdev, imx_phy);
> =20
> -	imx_phy->clk =3D devm_clk_get(dev, "phy");
> +	imx_phy->clk =3D devm_clk_get_enabled(dev, "phy");
>  	if (IS_ERR(imx_phy->clk)) {
>  		dev_err(dev, "failed to get imx8mq usb phy clock\n");
>  		return PTR_ERR(imx_phy->clk);
>  	}
> =20
> -	imx_phy->alt_clk =3D devm_clk_get_optional(dev, "alt");
> +	imx_phy->alt_clk =3D devm_clk_get_optional_enabled(dev, "alt");
>  	if (IS_ERR(imx_phy->alt_clk))
>  		return dev_err_probe(dev, PTR_ERR(imx_phy->alt_clk),
>  				    "Failed to get alt clk\n");

[ ... ]

> @@ -735,11 +727,43 @@ static int imx8mq_usb_phy_probe(struct platform_dev=
ice *pdev)
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  }
> =20
> +static int imx8mq_usb_phy_runtime_suspend(struct device *dev)
> +{
> +	struct imx8mq_usb_phy *imx_phy =3D dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(imx_phy->alt_clk);
> +	clk_disable_unprepare(imx_phy->clk);

[Severity: High]
Does this mix of devm_clk_get_enabled() and manual clk_disable_unprepare()
cause a clock enable count underflow during driver unbind?

During imx8mq_usb_phy_probe(), devm_clk_get_enabled() registers devres acti=
ons
that will unconditionally call clk_disable_unprepare() upon driver removal.

When the driver is unbound, the driver core calls pm_runtime_put_sync() bef=
ore
triggering devres cleanup. This suspends the device, invoking
imx8mq_usb_phy_runtime_suspend() which drops the clock enable counts to 0.

Subsequently, device_unbind_cleanup() executes the devres actions, calling
clk_disable_unprepare() again on the already-disabled clocks. In the clock
framework, checking an enable_count of 0 results in a kernel warning.

To avoid this, the driver could either handle clock initialization manually
without devm_*_enabled variants, or implement a .remove callback that
explicitly wakes the device via pm_runtime_get_sync() and disables runtime =
PM
to prevent devres from executing on a suspended device.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-imx8mp-usb=
-phy-improvement-v4-0-b2ddf2f3862c@nxp.com?part=3D3
