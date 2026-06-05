Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3064D8D9B
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 11:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780658946; cv=none; b=Ydnw44KRgYLyVKZXh2Uz/dP2TjQE8VBxhYA9y9/fbjox28F5TSQs6iiCk2Kun7zSQmwbmy9kvSOnIi4134o5Bmc5mj7g+Tr5eJQ14J9lJsT4hxeSvhnv6gEO7DogOQPgfB5Y/oEN85j4TcRSYNdIYtzrpBYfJPCkH7fIRBSPLvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780658946; c=relaxed/simple;
	bh=LIlzqYj/0hi5yClnSDj2iZDsSeLFJhijGRJWCkXpdsU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ukG2d8kP6TGjLHPoToxUpAcsbiyacEqoFrYO4fml2uQoC+u3khGvLsJwicP26XfilVKuuM4MHUU/ggDaolc4i0zu5gbpdwEjx2jFf2dgBQOSSJ492koo2DyfUHq3eh24ZIk2I2vaU8i7nbS6EtB2oH79raeJVZXg8jLHrIzaLAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpqJhmtD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpqJhmtD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A81D1F00893;
	Fri,  5 Jun 2026 11:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780658944;
	bh=nwJoYl4z9YwzrOTrGFnPw42XCXLrtKfU+4nGyfFmFoY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fpqJhmtDZkdpI9pAcGwwhL0HCYZcwewZm0w6wA2ZFbXHuo0Dlwue1Ya6FQ5m949zg
	 19otdqn4HJMawAlmpFARrHutaa7Q03qzHEXliBNPgbuVf0Nm43O3K6I+rjU/tG5D0h
	 PjfCp2dT0V2X0+N2LJiCzheKCxe/sTxnODYqDuqKR6SNaDkI24qz41Ig15KQMHE4RT
	 7Loxd/KtsOYhiJ2kmGafhJb888PtIlUBllCxaKPzm5W1IYVx1dTniqBZ+jvNgUXPRj
	 iXkpjUDta/GUvHC0NWD4oiO+eC2eU1tKI2ygMh+sS+r/l+yMv51JteodsDYLKmYIdW
	 Cx2k8XAY2UmTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] phy: fsl-imx8mq-usb: add control register regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, imx@lists.linux.dev
In-Reply-To: <20260605-imx8mp-usb-phy-improvement-v4-4-b2ddf2f3862c@nxp.com>
References: <20260605-imx8mp-usb-phy-improvement-v4-4-b2ddf2f3862c@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 11:29:03 +0000
Message-Id: <20260605112904.6A81D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Writes to the CR debugfs control registers are silently discarde=
d without error if the PHY is runtime suspended.

Pre-existing issues:
- [High] Clock reference count underflow on driver unbind due to devm_clk_g=
et_enabled() and Runtime PM.
--

commit 3bce0d41a4e2282036c6fa41e62f47cfe0788d65
Author: Xu Yang <xu.yang_2@nxp.com>

phy: fsl-imx8mq-usb: add control register regmap
   =20
The CR port is a simple 16-bit data/address parallel port that is
accessed through 32-bit MMIO registers for on-chip access to the
control registers inside the USB 3.0 femtoPHY. Add control register
regmap and export these registers by debugfs to help PHY's diagnostic.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index 27aa696f5dd40..e24f46d7924b6 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
[ ... ]
> @@ -667,6 +671,14 @@ static const struct of_device_id imx8mq_usb_phy_of_m=
atch[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, imx8mq_usb_phy_of_match);
> =20
> +static const struct regmap_config imx_cr_regmap_config =3D {
> +	.name =3D "cr",
> +	.reg_bits =3D 32,
> +	.val_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.max_register =3D 0x7,
> +};

[Severity: Medium]
Does this regmap configuration need a .cache_type?

Without one, it defaults to REGCACHE_NONE. Later in the patch,
imx8mq_usb_phy_runtime_suspend() puts the regmap into cache-only mode.
With REGCACHE_NONE, any debugfs writes while suspended will return success,
but the data is silently discarded because there is no cache backing it.

[ ... ]
> @@ -731,6 +750,9 @@ static int imx8mq_usb_phy_runtime_suspend(struct devi=
ce *dev)
>  {
>  	struct imx8mq_usb_phy *imx_phy =3D dev_get_drvdata(dev);
> =20
> +	if (imx_phy->cr_regmap)
> +		regcache_cache_only(imx_phy->cr_regmap, true);
> +
>  	clk_disable_unprepare(imx_phy->alt_clk);
>  	clk_disable_unprepare(imx_phy->clk);

[Severity: High]
This is a pre-existing issue, but can this lead to a clock enable_count
underflow on driver unbind?

The driver acquires the clock using devm_clk_get_enabled() in
imx8mq_usb_phy_probe(), meaning devm manages the enable state. However, it
manually disables the clock here during runtime suspend.

If the driver is unbound while the device is in the runtime suspended state,
the devm cleanup function will call clk_disable_unprepare() a second time on
the already disabled clock, since there is no .remove callback to resume the
device first.

> @@ -752,6 +774,9 @@ static int imx8mq_usb_phy_runtime_resume(struct devic=
e *dev)
>  		return ret;
>  	}
> =20
> +	if (imx_phy->cr_regmap)
> +		regcache_cache_only(imx_phy->cr_regmap, false);

[Severity: Medium]
Should there be a regcache_sync() call here after disabling cache-only mode?

If a valid cache type is added to imx_cr_regmap_config, the cache will need
to be synchronized here to flush any pending diagnostic writes to the hardw=
are
that occurred while the device was suspended.

> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-imx8mp-usb=
-phy-improvement-v4-0-b2ddf2f3862c@nxp.com?part=3D4
