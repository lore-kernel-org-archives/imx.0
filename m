Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBDC3CE4B6
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451292; cv=none; b=Jeu7r2UryQommf0ECMxPOez+6W+GSiSuUiOyfMIU8e+izNdyQ7IhxcDP/i4AX10tG64qXHUHrc3A2+iS+73i7mMjvybExIKGDdWhvHOl4Yt4cB7OH6eZ+qxj18vKFPQkr48I+PiiQvZLEoNkKZtCbiJYoe0QGC5MrkZpuzKtoTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451292; c=relaxed/simple;
	bh=22I8Evx6+fn4DWTC2K8qgkz6YO6sBw8CyCEr/0jeyHE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sarnXrbU1a+ZS0l6PE2SWJy7XlZF31P8m1eZzpmFmrQ0i3BiNHdFz2ixiH4lFQgeriKtDytYetwMDmUdAJnpW1YGkxJPosmbdmRgHZJb+GXOdQXU8U+/NOojQIWIkVFixhll2SKUTf1UgglnwUhYHKanqLNIGpaaFDXGuFHaMSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTWyZ87o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTWyZ87o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9C81F000FF;
	Thu,  8 Oct 2026 09:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451285;
	bh=Mzsso3N/wjQZP+6/gYmTkAujwisEqp7hu/xFn70bKPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gTWyZ87oMTBZPigsZQJdUO9Q0+kJE4n2d9qIWzSVZy6YW4P6OSU9A+kCy1HknloKc
	 dVIber3eVqGvwVn4A0XxsCb20TtdUYtLTesjg+dminCWNikmBdCq0Sl3E2w2EmWIye
	 gbyavwRdJHX5znvdUecZMi1LA/CYEbbCzVJ+amKkkfVn860mwObeROfLkx54r64mc7
	 We6PbzpDgNjP1TWaSMTh0cbHcKoWdY9WudTtLUv4tSbudXKOpTFibcuBEKfhkVAcC9
	 w1sIgwtt3GxKF7eUN1lbbPnxE3nHWDFJjF7imh3iHrY89Ln/01Hl7XCs9KzwmbNR89
	 uv5ZW/TscgKXg==
Message-ID: <sashiko-outbox-163926@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/9] irqchip/imx-irqsteer: Convert to
 devm_pm_runtime_set_active_enabled()
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261008090231.796511-5-Zhipeng.wang_1@oss.nxp.com>
References: <20261008090231.796511-1-Zhipeng.wang_1@oss.nxp.com>
 <20261008090231.796511-5-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:21:24 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] irqchip/imx-irqsteer: NULL pointer dereference in suspend due to e=
arly PM enable
--

commit 5322ea0be538e254fa9c813752002c35702c23cf
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

irqchip/imx-irqsteer: Convert to devm_pm_runtime_set_active_enabled()

imx_irqsteer_probe() enables runtime PM with pm_runtime_enable(), but
imx_irqsteer_remove() never disables it. Runtime PM therefore stays
enabled after the device is unbound, and rebinding it triggers an
unbalanced pm_runtime_enable warning. This commit uses
devm_pm_runtime_set_active_enabled() to automatically disable runtime PM
on unbind, fixing the imbalance.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index d05de3d26fb28..5acc04504e520 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -239,6 +239,10 @@ static int imx_irqsteer_probe(struct platform_device=
 *pdev)
>  	if (irqsteer_has_chanctrl(data->devtype_data))
>  		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
> =20
> +	ret =3D devm_pm_runtime_set_active_enabled(&pdev->dev);
> +	if (ret)
> +		goto out;
> +

[Severity: High]
Does moving the PM runtime enablement before platform_set_drvdata() introdu=
ce
a race condition?

The PM runtime is now enabled early, and the IRQ domain is subsequently
created and exposed globally.

If a concurrent child device or userspace sysfs bind maps, requests, and
releases an IRQ from this domain before platform_set_drvdata() is reached,
releasing the IRQ invokes irq_bus_sync_unlock().

This in turn calls pm_runtime_put_autosuspend(), dropping the usage count to
zero and queuing a runtime suspend which invokes imx_irqsteer_suspend().

Since platform_set_drvdata() has not been called yet, will dev_get_drvdata()
return NULL in the suspend callback and cause a NULL pointer dereference wh=
en
passed to imx_irqsteer_save_regs()?

>  	data->domain =3D irq_domain_create_linear(dev_fwnode(&pdev->dev), data-=
>reg_num * 32,
>  						&imx_irqsteer_domain_ops, data);

[ ... ]

> @@ -260,9 +264,6 @@ static int imx_irqsteer_probe(struct platform_device =
*pdev)
> =20
>  	platform_set_drvdata(pdev, data);
> =20
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> -
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008090231.7965=
11-1-Zhipeng.wang_1@oss.nxp.com?part=3D4
