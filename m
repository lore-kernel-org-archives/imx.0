Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEAF37DAA8
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 06:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780466557; cv=none; b=i6GBzcQVibpAmkhEeq2Mx/uC+l+EQzgxzekgjGJh4GPygdslhxR+HNG1EAJwSczdN3aHHb44e4sm3fO126Gc4Q8viFrfSR++N9Eain8esoRwuqr5Vcm33cyb6TrcFuDUm0oT93WHkXYP78BCXlRzc9DMQXhURTz5j2cNQ4vBX7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780466557; c=relaxed/simple;
	bh=ZHgFihFtHskDiAHMorMH0vogaXFq65qoyKaqxIRVbcc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wucat16Z/bRvwztxFlPGa10qMJlR2OnJ9P4plhJwloBUZWq9WqybGJO0pYS85korgULo72Txx+iStLxyv6dHvOYtDtr/ttc1R8TeD3mQWKh1D1CZV/1GaLZPJiwEN9cIAYe64Mede0shTphD0NcasNMtAMOQbsem2UYeHpsIo5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXRGaZsV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXRGaZsV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DEE1F00893;
	Wed,  3 Jun 2026 06:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780466555;
	bh=7ovt1AyFbPznYubKXLeOjpRsz3oBUSJsgWV/gbqXLP8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kXRGaZsVeqsfQSBLfhmUP3i1Gpn4HpkWdJ5SIytzPdutNKn2dllJ/3xSuTvL+tfwL
	 FlECahmX8MnQ0mIIcJWQGVQpWoRc8SYbhJSgLrowG0biWiF3crouwYF0qoAX5X1vMy
	 fVTuSfLeiffmYElidvdAZU5LEqwqQQQdXrjvszgdCXK2P+nw7ah2/KaqyskPJ1RFYj
	 DLh0ev0Sr7a3yksVq87XiKXsMjiqLAfnuH+53MDoUxeYez7qch1CHQBj3+T7DjS6aY
	 FOorIS2jJFPbc/0fztMUbsNpyf+ateY4iSmoAduV8Kt5VC+c9d/58IcSyPG2XLlwm2
	 qTK3SBXn1Jlhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/5] phy: fsl-imx8mq-usb: add runtime PM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, olteanv@gmail.com, neil.armstrong@linaro.org, vkoul@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260603-imx8mp-usb-phy-improvement-v3-3-7afb8f89abc6@nxp.com>
References: <20260603-imx8mp-usb-phy-improvement-v3-3-7afb8f89abc6@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 06:02:35 +0000
Message-Id: <20260603060235.94DEE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unchecked return value of `pm_runtime_get_sync()` via `guard(pm_ru=
ntime_active)` in `tca_blk_typec_switch_set()` leads to unsafe register acc=
ess.
- [High] Double disable of clocks (enable count underflow) on driver unbind=
 due to mixing `devm_clk_get_enabled()` with manual clock management in PM =
runtime suspend.
--

commit 3ca36d3b5ee797e587a615f9df482c7159a29d88
Author: Xu Yang <xu.yang_2@nxp.com>

phy: fsl-imx8mq-usb: add runtime PM support

Add runtime PM to ensure the PHY is properly powered and clocked during
register access, preventing potential system hangs.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index 591ddf3460618..b0092c34416e3 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
[ ... ]
> @@ -136,17 +137,13 @@ static int tca_blk_typec_switch_set(struct typec_sw=
itch_dev *sw,
>  {
>  	struct imx8mq_usb_phy *imx_phy =3D typec_switch_get_drvdata(sw);
>  	struct tca_blk *tca =3D imx_phy->tca;
> -	int ret;
> =20
>  	if (tca->orientation =3D=3D orientation)
>  		return 0;
> =20
> -	ret =3D clk_prepare_enable(imx_phy->clk);
> -	if (ret)
> -		return ret;
> +	guard(pm_runtime_active)(&imx_phy->phy->dev);

[Severity: High]
Does this wrapper ignore the return value of pm_runtime_get_sync()?

If the runtime resume fails (for example, if the underlying clock
enablement fails), the error appears to be swallowed here. Execution would
then proceed to tca_blk_orientation_set(), which performs MMIO accesses
on the unclocked TCA hardware registers.

On i.MX/ARM platforms, accessing unclocked register space triggers a
synchronous external abort (SError), resulting in a system hang.

Should this explicitly use pm_runtime_resume_and_get() or similar, and
verify the return value before proceeding?

> =20
>  	tca_blk_orientation_set(tca, orientation);
> -	clk_disable_unprepare(imx_phy->clk);
> =20
>  	return 0;
>  }
[ ... ]
> @@ -686,6 +671,7 @@ static int imx8mq_usb_phy_probe(struct platform_devic=
e *pdev)
>  	struct device *dev =3D &pdev->dev;
>  	struct imx8mq_usb_phy *imx_phy;
>  	const struct phy_ops *phy_ops;
> +	int ret;
> =20
>  	imx_phy =3D devm_kzalloc(dev, sizeof(*imx_phy), GFP_KERNEL);
>  	if (!imx_phy)
> @@ -693,13 +679,13 @@ static int imx8mq_usb_phy_probe(struct platform_dev=
ice *pdev)
> =20
>  	platform_set_drvdata(pdev, imx_phy);
> =20
> -	imx_phy->clk =3D devm_clk_get(dev, "phy");
> +	imx_phy->clk =3D devm_clk_get_enabled(dev, "phy");

[Severity: High]
Could mixing devm_clk_get_enabled() with manual clk_disable_unprepare()
in the runtime suspend callback cause a double-disable?

During driver unbind, the driver core may transition the device to the
suspended state, which invokes the runtime suspend callback and drops
the clock enable count to 0.

Immediately following this, devres teardown runs and unconditionally
calls clk_disable_unprepare() again for these devm_clk_get_enabled()
actions.

Would this drop the clock count to -1, triggering an enable count
underflow WARN in the clock core?

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
> @@ -735,11 +725,43 @@ static int imx8mq_usb_phy_probe(struct platform_dev=
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
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-imx8mp-usb=
-phy-improvement-v3-0-7afb8f89abc6@nxp.com?part=3D3
