Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB255346A13
	for <imx@lists.linux.dev>; Wed, 13 May 2026 20:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704577; cv=none; b=WmEt1CPnR+7fY5JxbenWf2H3NgA+bDYI0xkMIaPFe4/8kAHneyafkmAH2qcHM4zcCXGzM3lDMtDv+nZ0zDzLjXGMrzMc3nITPyXsGXsGUyXIpeaDPQYhyiqfkli+I3Sornqf83KBrKZXVFuF2PBk68HYWhhSEVgDfX8c3VeCpi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704577; c=relaxed/simple;
	bh=igiAOqMJ+PW3iRFkkM/moq2giTXus4FGIzUG6jGZVPg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JJBdRXfe8+3fF4FMKk1LrGAjzwgv04s60p874KHQ5LVHgnJYcxY/AjbQ5tJ43meEFXdsyufKvL26AQ1LEqZKfPPybKT9j3dVSuXcfZtvhryUO0GwvpYh9UGjYytabqYCyxvMFvDGJQs3a/QbBj8mq6oIC3QrnT40cufyWIIXnA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FBqGrVjB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FBqGrVjB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A26ADC19425;
	Wed, 13 May 2026 20:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778704577;
	bh=igiAOqMJ+PW3iRFkkM/moq2giTXus4FGIzUG6jGZVPg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=FBqGrVjBBzQovIwUAfcUADANQYGn9IhJJLhb4VALKEY/YIcjsewx7xGR8Z7LKnzM3
	 v8cdMIjk2TBtvpXbUCAR4RCcdC8B64Uw8rWEQQvANmrHViKS778A/ATS/Zc7O1E8zW
	 2ny2fvq/oKyZkAmTF9iFHxeY9jMdBzJPzQ80GToAQf/MBQt3lv+DaVMG9qTjFQAGA/
	 RkzFWzTc1DR0RLkI+i5hmM9nPCvPDPvY7mK2TwCDpUWZhXovRn6+4oLTQg2/vZU6pC
	 kYcCbzMYVJWKsGyKcMAThUObXZ1lHE/gPhsjTYrobvpuB/H8gMQxxz16oXwJNMY09U
	 evC2j/UP0Kcyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] phy: fsl-imx8mq-usb: add control register regmap
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org, imx@lists.linux.dev, olteanv@gmail.com
In-Reply-To: <20260512101212.1498223-1-xu.yang_2@nxp.com>
References: <20260512101212.1498223-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 20:36:14 +0000
Message-Id: <20260513203615.A26ADC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Exporting the CR port regmap via debugfs without clock synchroniza=
tion allows unclocked MMIO accesses, leading to a synchronous external abor=
t (kernel panic).
- [Medium] Using a direct MMIO regmap for an indirect data/address parallel=
 port does not correctly expose the internal PHY registers, defeating the d=
iagnostic purpose of the patch.
--

commit ac06b61c8f793ff4f5693b009fbad15e95d82242
Author: Xu Yang <xu.yang_2@nxp.com>

phy: fsl-imx8mq-usb: add control register regmap

The CR port is a simple 16-bit data/address parallel port that is
provided for on-chip access to the control registers inside the
USB 3.0 femtoPHY. Add control register regmap and export these
registers by debugfs to help PHY's diagnostic.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> index b05d80e849a14..958d114b0c835 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
[ ... ]
> @@ -685,6 +689,14 @@ static const struct of_device_id imx8mq_usb_phy_of_m=
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
> +
>  static int imx8mq_usb_phy_probe(struct platform_device *pdev)
>  {
>  	struct phy_provider *phy_provider;
> @@ -713,6 +725,11 @@ static int imx8mq_usb_phy_probe(struct platform_devi=
ce *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
> =20
> +	imx_phy->cr_regmap =3D devm_regmap_init_mmio(dev, imx_phy->base + PHY_C=
RCTL,
> +						   &imx_cr_regmap_config);

Will accessing the debugfs file when the PHY is suspended or not yet powered
on cause a kernel panic?

The driver dynamically manages its clocks (imx_phy->clk and imx_phy->alt_cl=
k)
in imx8mq_phy_power_on() and imx8mq_phy_power_off() rather than using
pm_runtime.

Since devm_regmap_init_mmio() does not attach a clock to the regmap,
the regmap core won't enable clocks during debugfs register accesses. On
i.MX platforms, MMIO reads on an unclocked hardware block trigger a
synchronous external abort.

Could we delegate clock management to the regmap (e.g., by using
devm_regmap_init_mmio_clk()) or implement pm_runtime hooks?

Additionally, the commit message mentions the CR port is a 16-bit
data/address parallel port used to access internal PHY registers. Does
this direct MMIO regmap actually expose the internal PHY registers?

Since devm_regmap_init_mmio() creates a direct memory-mapped regmap over
the CR port's base MMIO registers, reading the debugfs file will simply
dump the CR port's Address and Data MMIO registers. It won't execute the
required address/data handshake protocol to read the internal PHY state,
which defeats the diagnostic purpose of the patch.

Would it be better to implement a custom regmap_bus to handle the atomic
address/data indirect read sequence?

Also, is max_register =3D 0x7 correct here? It seems misleading for a 32-bit
regmap with a stride of 4 if there are only a couple of MMIO registers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512101212.1498=
223-1-xu.yang_2@nxp.com?part=3D1
