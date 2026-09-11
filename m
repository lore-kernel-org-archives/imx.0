Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882121A0BD0
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 06:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789107626; cv=none; b=O/zm4or+XUa9N/xgL51NMkLBvhAIb4yVgyclcaoLWWnyFCfZ75SMoi+/IALIw9BrY1SoO5Vj1QwxFIqxRXjkUjj0KHhxBARWAKiPchPIoDCgZfCYtWFxcmZYhsQlV5h23KNxDvAT3t+4qLWiHGuvAg0t2j+1L2SsZtj8vUyg+PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789107626; c=relaxed/simple;
	bh=27X4NTbKxPFwwJUMFqyU+dNmMfc3F0jyPHyFlPcVNNU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tubpx67Oy+xnLRlUgqcwc8/TWWSg66A0tb4kT80cnPigiCDAUcuAt2S0iwPzsy8WtD8VHfRz5sEvGVHf0reZkaEYzg/8R5pVE0o9CC4s3vOaRnVH9FJkQBgMLGCOGswXFBlCWs6DFQGI2/mf24aWq36IcCw44ejDavTqnmpyb2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lsi5D2BM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lsi5D2BM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91AB1F000FF;
	Fri, 11 Sep 2026 06:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789107625;
	bh=WPRkvT7oJ2JyPkd/3weREei3B3y40JU8rnAz2iUdiuM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lsi5D2BM/Gma7o2/Wr4/1nG4PZ6ZyaGP6D0cc9vmuX/0Ogc4q5J5l5SY3mLS4BpJw
	 n9aHV8+RmSPqPi1vLL7eoJQB7Dzp5w8FW92P2eAYnpc6a4FI9qYAZDxZGolhOGMPsx
	 +sgAh5KXC5/jd8ZJoI6vnxuc4UhuKPw9++o16papdETdYkjmnJRdS3P/9dMCQWQxcf
	 jdkko76jdlZS68FQ7M3j9Jl1BW98apznWQgLrzWq2IrNZll4F73ElbBw5px0wBk0i8
	 xl8Nbmma+Ok4nkXndlvy/yeVilokVU1QyFo1Xk/8ISCeihV3TSVAY5rF44rjEbwqkb
	 2U2KpvjCRo8Hg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC] pmdomain: imx: reject a missing bus power domain
Reply-To: sashiko-reviews@lists.linux.dev
To: "Slavin Liu" <bolin.liu@seu.edu.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260911060929.94481-1-bolin.liu@seu.edu.cn>
References: <20260911060929.94481-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 06:20:24 +0000
Message-Id: <20260911062024.E91AB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The error handling path in the probe function fails to remove the =
power domain notifier registered on `bc->bus_power_dev`, leading to a use-a=
fter-free in the genpd notifier chain.
--

commit 1bf3e63904f509711299c259aa62b9016d200e03
Author: Slavin Liu <bolin.liu@seu.edu.cn>

pmdomain: imx: reject a missing bus power domain
   =20
The named-domain attach API may return NULL for an absent name.
Treat that as -ENODEV before publishing bus_power_dev to later unwind
paths, without changing the handling of existing error pointers.

> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 479789009c7f4..9653a8ac9a6e9 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -228,6 +228,8 @@ static int imx8m_blk_ctrl_probe(struct platform_devic=
e *pdev)
>  		return -ENOMEM;
> =20
>  	bc->bus_power_dev =3D dev_pm_domain_attach_by_name(dev, "bus");
> +	if (!bc->bus_power_dev)
> +		return dev_err_probe(dev, -ENODEV, "missing bus power domain\n");

[Severity: High]
This is a pre-existing issue, but I noticed a potential problem in the error
handling path of imx8m_blk_ctrl_probe(). If a failure occurs after the power
notifier is added, for example during devm_of_platform_populate():

imx8m_blk_ctrl_probe()
    ...
	ret =3D dev_pm_genpd_add_notifier(bc->bus_power_dev, &bc->power_nb);
	if (ret) {
		...
		goto cleanup_provider;
	}

	dev_set_drvdata(dev, bc);

	ret =3D devm_of_platform_populate(dev);
	if (ret)
		goto cleanup_provider;
    ...
cleanup_provider:
	of_genpd_del_provider(dev->of_node);
cleanup_pds:
    ...
	dev_pm_domain_detach(bc->bus_power_dev, true);
	return ret;

The error path detaches the bus power domain but fails to unregister the
notifier. Is it possible this leaves a dangling pointer to bc->power_nb when
the device memory is freed, causing a use-after-free when the bus power
domain transitions power states? Should dev_pm_genpd_remove_notifier() be
called during cleanup?

>  	if (IS_ERR(bc->bus_power_dev)) {
>  		if (PTR_ERR(bc->bus_power_dev) =3D=3D -ENODEV)
>  			return dev_err_probe(dev, -EPROBE_DEFER,

[ ... ]

> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/im=
x/imx8mp-blk-ctrl.c
> index d255c20f58e21..e952b4ee75c00 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -655,6 +655,8 @@ static int imx8mp_blk_ctrl_probe(struct platform_devi=
ce *pdev)
>  		return -ENOMEM;
> =20
>  	bc->bus_power_dev =3D dev_pm_domain_attach_by_name(dev, "bus");
> +	if (!bc->bus_power_dev)
> +		return dev_err_probe(dev, -ENODEV, "missing bus power domain\n");

[Severity: High]
This isn't a bug introduced by this patch, but a similar issue appears in t=
he
error handling path of imx8mp_blk_ctrl_probe(). If bc_data->probe(bc) fails:

imx8mp_blk_ctrl_probe()
    ...
	ret =3D dev_pm_genpd_add_notifier(bc->bus_power_dev, &bc->power_nb);
	if (ret) {
		...
		goto cleanup_provider;
	}

	if (bc_data->probe) {
		ret =3D bc_data->probe(bc);
		if (ret)
			goto cleanup_provider;
	}
    ...
cleanup_provider:
	of_genpd_del_provider(dev->of_node);
cleanup_pds:
    ...
	dev_pm_domain_detach(bc->bus_power_dev, true);
	return ret;

Like in the i.MX8M driver, the error path detaches the bus power domain but
doesn't call dev_pm_genpd_remove_notifier() to unregister bc->power_nb. Cou=
ld
this also lead to a use-after-free when 'bc' is freed?

>  	if (IS_ERR(bc->bus_power_dev))
>  		return dev_err_probe(dev, PTR_ERR(bc->bus_power_dev),
>  				     "failed to attach bus power domain\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911060929.9448=
1-1-bolin.liu@seu.edu.cn?part=3D1
