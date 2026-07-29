Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AFD3254A0
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 22:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785363767; cv=none; b=SeShd4mdHV3g7m/UisAxgRFTEhDkmSukBmx5+LVgjmJUsUjA0JtukFc8ltSfnQqf3bhdCBDIyv2enUFVHvCVSuUi96xrcxx7KzLq/6/wDKxt4liT/NqvH0Q3gv5w6Ls3jqL8jQTDZVAp7zkkVCp72KpU+VyQC+jfHH4ug3fGuRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785363767; c=relaxed/simple;
	bh=gyyKuz69qD1r6ZoExFir+rMI60r0NqSDafYOUmdXO20=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=exbFsL5PBfiePNxk4SKtW/DGjn0P4Y8tZEIszpN+ByFgeqjsfAmOZoaLGBPFFYVratnNGnKYiBEO5Hs3kzPQv2ktTl8N4i60eGVSHwZhQz3Qs0JIs2mZZxMGCrB01YiWkFLb278SiVz+Ld2Y2aBRDq0nZAvsD2IB87/LD0+GQ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RqRAb5CW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqRAb5CW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B551F000E9;
	Wed, 29 Jul 2026 22:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785363766;
	bh=DXPa/U/20Kj2BNILwbtSCT5LnLWinhsu/HIqWrDShBk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RqRAb5CW9axPGCQ/yju8y1BQI3hhVsAmJ4Ja+Y32v5FIaX5pQGTkX+R4pl9aX0M4h
	 CHTLV35niyzT2uPfDYzoqrJ9jkeXMYoogwO+O3wS+K2gWxvF/diPaaLIYFsim2QU32
	 KQVBc5I3qsYAM1G7DnowIJ2bfXGQeTNGYJZ6v1bIInVSSGPVbcyL8J7e3L/wrUklB8
	 ex0357mzNOcSI5hH2WyHNTuXP0jz2f7Zy5MPj0z8ZQ+0fUjhJyOuLm4xD93926QMZW
	 NRuB31clvRoiAqsJaeFtkoE0TF0fhtGkfidSbm3Tvapc90BJD2fa4CYUPu6bYWqGo6
	 6Zp7svV0pYQyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] irqchip: imx-irqsteer: Convert to
 devm_pm_runtime_enable()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260729221416.499781-1-festevam@gmail.com>
References: <20260729221416.499781-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 22:22:45 +0000
Message-Id: <20260729222246.24B551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Adding devm_pm_runtime_enable() introduces a failure path that fai=
ls to deregister chained IRQ handlers, leading to a Use-After-Free.

Pre-existing issues:
- [High] The irq_domain created during probe is leaked and left registered =
on error paths, creating a dangling pointer risk.
--

--- Patch [1]: [PATCH v2] irqchip: imx-irqsteer: Convert to devm_pm_runtime=
_enable() ---
commit 3959004c7e2715ec92cba0eb90ac30fdaf1b65c2
Author: Fabio Estevam <festevam@gmail.com>
Subject: irqchip: imx-irqsteer: Convert to devm_pm_runtime_enable()

This commit converts the driver to use devm_pm_runtime_enable() to
automatically disable runtime PM when the device is removed, fixing an
unbalanced pm_runtime_enable warning.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 87b07f517be35..ba1203d3edd4d 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -263,7 +263,9 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
>  	platform_set_drvdata(pdev, data);
> =20
>  	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	ret =3D devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		goto out;

[Severity: High]
If devm_pm_runtime_enable() fails, does this new error path leave the chain=
ed
IRQ handlers registered?

Earlier in imx_irqsteer_probe(), we register the chained handlers:

    for (i =3D 0; i < data->irq_count; i++) {
        ...
        irq_set_chained_handler_and_data(data->irq[i],
                                         imx_irqsteer_irq_handler,
                                         data);
    }

When we jump to the "out" label on failure, devres will free the "data"
structure. If a parent IRQ fires after this, could imx_irqsteer_irq_handler=
()
dereference the freed pointer?

> =20
>  	return 0;
>  out:

[Severity: High]
This is a pre-existing issue, but does this error path also leak the IRQ
domain?

Earlier in probe, the domain is created:

    data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev), ...

The "out" label only disables the IPG clock, but doesn't call
irq_domain_remove(). Is it possible that the IRQ domain is left registered
in the system with its host_data pointing to the freed "data" structure,
leading to a use-after-free if IRQ mappings are attempted later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729221416.4997=
81-1-festevam@gmail.com?part=3D1
