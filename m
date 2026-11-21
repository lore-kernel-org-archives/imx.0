Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267750;
	b=J9VQ8lJvIm3SUojeyao1zk8QfyiUNP3NNgH5noG6mqSnLi2b8aT5yOOfqMP3xDStqUmd
	 hBJaQmIZhmllhVYUW1geyM7viHLwGflWSfTko+Y+v9sQ3dn8nGDmIuHpae1uOWmWNTKXL
	 uc30IRld341PEAML0l1o+4Z+3dfJ61v624PqXoKWVv99ipXGkQMtaTGPzDC/c8ogRUv4c
	 0ysQnA/8KoFIYW033hFCXsWYci0ZOaDgmwr6iN8IOaaccCDhgLf7ZXX8xgwbbMr0PHiFq
	 jXKMsy3oLBImRMWWouaQBAccCmGfSqO6DjcfJElZ6+acObkB3tfRiHWFXRXSUgE37rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267750;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nQDs/oEx8M0h3UNsFjGlb0B8GpGboQtVmAnGbypPEMA=;
	b=DpOfPeed5GjCb2RgQo7p3tLln+rMxNP4qXc+LvlGwAcj/9jwuBNj6DV7wAJBKYHvY70p
	 SDkhYwN0HppzkwSm2jKMVEjHGnuoAwW/T1/bE3QjrYNoOOLiWH92r1R2MJrHb6wklP5XH
	 utNJ08EpBnMxxvxejf67wrOYI3ZQJWQcoxcCCqLmwStY6X3rzhJ6dykVjtBGmay+CiqVP
	 hrEkEnCGVWCPIJPVvF/Oghv0JtkyfLde6MgKzcRvW5Ud5hduC44789wStyKka4c3opTby
	 ruHK7z/IdaDJM9Z5sy5nwVfaeb+HpTu14LGpDNOEizYXltNGar2D7sXgjpCCC2qzXRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="GvIbA7/c";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E8C606A320
	for <imx@lists.linux.dev>; Sat, 21 Nov 2026 13:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GvIbA7/c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83EE1F000C4;
	Sat, 21 Nov 2026 13:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795267750;
	bh=nQDs/oEx8M0h3UNsFjGlb0B8GpGboQtVmAnGbypPEMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GvIbA7/cf6+3jf60Vx5wU3ipePoDw3y27OJfMAVqLSlCfCDczCBx0+E8MQEN0EsMb
	 PAt6m3kCr9xoR8jbY22XS+RS1Rw0h+9ldUxzuFd3HJvMtivPRCL1txIrgXv1qrpLK8
	 tTfwiLLb057zZKZcWPUVHSi/nFI4vxE70rfhhjlBK2QUN7HxlTECwsspcFl/Lk4oH4
	 pfj4siADKppDkvsDlmc3KjWRnMSANGV84ZCCUkv1wQkJ4FIsVrk2OeIkWoX8l8muV8
	 AKYbcYThZEUzZPoz4ugRaBHOxzp+DjLgSKfdAlkLJr9KA//xs73AXnLiLA6t1QyX7Q
	 LKt55HCsCntNQ==
Message-ID: <sashiko-outbox-227073@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] pmdomain: imx8m-blk-ctrl: Keep the domains left on
 by the bootloader
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261121130614.2482656-3-dario.binacchi@amarulasolutions.com>
References: <20261121130614.2482656-1-dario.binacchi@amarulasolutions.com>
 <20261121130614.2482656-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 13:29:09 +0000
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
- [Medium] pmdomain: imx8m-blk-ctrl: unbalanced boot_on state in remove
  and probe unwind
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Critical] pmdomain: imx: imx8m-blk-ctrl: use-after-free in
  imx8m_blk_ctrl_probe() [1]
--

commit 68404e36f0b266cabfa06ab2dfb79d11fc9d8d3f
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader

This commit reads the blk-ctrl registers during probe on i.MX8MN DISP
blk-ctrl to detect domains left on by the bootloader, initializes those
domains as powered on, and takes the corresponding runtime PM and
interconnect references.

> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 9df933a7a2380..35087da43dd72 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
[ ... ]
> @@ -192,6 +195,71 @@ static int imx8m_blk_ctrl_power_off(struct generic_p=
m_domain *genpd)
[ ... ]
> +/* Take the references of imx8m_blk_ctrl_power_on() for a domain left on=
 */
> +static int imx8m_blk_ctrl_get_boot_on(struct imx8m_blk_ctrl_domain *doma=
in)
> +{
> +	struct imx8m_blk_ctrl *bc =3D domain->bc;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(bc->bus_power_dev);
> +	if (ret < 0) {
> +		dev_err(bc->dev, "failed to power up bus domain\n");
> +		return ret;
> +	}
> +
> +	ret =3D pm_runtime_resume_and_get(domain->power_dev);
> +	if (ret < 0) {
> +		dev_err(bc->dev, "failed to power up peripheral domain\n");
> +		pm_runtime_put(bc->bus_power_dev);
> +		return ret;
> +	}
> +
> +	if (icc_bulk_set_bw(domain->num_paths, domain->paths))
> +		dev_err(bc->dev, "failed to set icc bw\n");
> +
> +	domain->boot_on =3D true;
> +
> +	return 0;
> +}
> +
> +static void imx8m_blk_ctrl_put_boot_on(struct imx8m_blk_ctrl_domain *dom=
ain)
> +{
> +	if (!domain->boot_on)
> +		return;
> +
> +	pm_runtime_put(domain->power_dev);
> +	pm_runtime_put(domain->bc->bus_power_dev);
> +	domain->boot_on =3D false;
> +}

[Severity: Medium]
Can this power down the MIPI PHY domain on probe deferral or leave
domain->boot_on stale across power-off and driver removal?

On i.MX8MN DISP blk-ctrl, domain 0 (IMX8MN_DISPBLK_PD_MIPI_DSI) attaches
domain->power_dev to pgc_mipi, which has no hskack bit in gpcv2.c and is
therefore initialized as GENPD_STATE_OFF with stay_on =3D false. Calling
pm_runtime_resume_and_get(domain->power_dev) in
imx8m_blk_ctrl_get_boot_on() transitions pgc_mipi to GENPD_STATE_ON. If a
later domain in the probe loop returns -EPROBE_DEFER, cleanup_pds calls
imx8m_blk_ctrl_put_boot_on() and dev_pm_domain_detach(), which queues
power_off_work on pgc_mipi and shuts down the MIPI PHY domain in hardware
while the bootloader splash screen is running.

In addition, imx8m_blk_ctrl_power_off() drops the runtime PM references
taken by imx8m_blk_ctrl_get_boot_on() without clearing domain->boot_on,
and imx8m_blk_ctrl_remove() never releases active boot_on references
before dev_pm_genpd_remove_notifier(bc->bus_power_dev). If
imx8m_blk_ctrl_remove() runs while a boot-on domain is still on without
attached consumers, pm_genpd_remove() does not invoke
imx8m_blk_ctrl_power_off(), so bc->bus_power_dev stays active until
dev_pm_domain_detach(bc->bus_power_dev, true) powers down pgc_dispmix
after imx8mn_disp_power_notifier() has already been unregistered.

[ ... ]

> @@ -353,6 +432,7 @@ static int imx8m_blk_ctrl_probe(struct platform_devic=
e *pdev)
>  	of_genpd_del_provider(dev->of_node);
>  cleanup_pds:
>  	for (i--; i >=3D 0; i--) {
> +		imx8m_blk_ctrl_put_boot_on(&bc->domains[i]);
>  		pm_genpd_remove(&bc->domains[i].genpd);
>  		dev_pm_domain_detach(bc->domains[i].power_dev, true);
>  	}

[Severity: Critical]
This problem wasn't introduced by this patch, but if
devm_of_platform_populate() fails in imx8m_blk_ctrl_probe() [1],
does jumping to cleanup_provider leave bc->power_nb registered on
bc->bus_power_dev after devres frees bc?

When dev_pm_genpd_add_notifier() succeeds and devm_of_platform_populate()
then fails, cleanup_provider does not call
dev_pm_genpd_remove_notifier(bc->bus_power_dev), leaving a dangling
notifier block in the bus power domain's notifier list that causes a
use-after-free on the next bus domain power transition.

[1] https://sashiko.dev/#/bug/linux-61d2c7f1-47af-4d61-8d2d-423ac38bf002

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121130614.2482=
656-1-dario.binacchi@amarulasolutions.com?part=3D2
