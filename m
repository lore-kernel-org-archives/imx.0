Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795342834;
	b=a3LYnpruycrdooTE5dWXl8xnGXfoCgIjYM1xkl5GbPKXZ26LeHt1KibspUyIiA0psZhH
	 UjwxNpmDOs45Ctrb191HPntnwDx8lKcGlINXatn3P/CSixqYYCnQ03v2ecooKNyQyIpxZ
	 UAR+JmEeXwKJvsuJvQo4XALQrFbrvbmfb32/9yCfQVOW2aJvfadXLpg2pp9+xKoCsa8L+
	 lR4BJ7NKHsl2vQvENXEIvjUGy2GtqdMumI+t7ohbKkA6g6UrR2RWOaQqBdjlR1Uiv+/mq
	 KG3gqC+4lZqoCkYRJDbSz2WdkkB3mrzCe8LEgoq/w/9sOfuap3Oay39zdb8Ar3YQvkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795342834;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Wpvgzwn4vHuwpHwyEp7ZSp+VcB0zSaNfIZR6B9cElYk=;
	b=c95vSy2hxOzMdvH8SZ8xdqXgdxwCI2yg6T7HMy+YAlJ2hmdhg4rtpfb3yLGQtF41phVh
	 9DnV5tou4Y5EU+vL2qJc6+X8cB2i11CLv4ZiE5dpwAfs+YF2hD2etjWD6gY5ywqqWloP4
	 GVhvgcZnQpa4o9pU+9edVQLXoiE+vuNNO8ol8RkjOb+CO+u5LC7lg7VuG2EOmflwUbo36
	 e3nxkyKyve6PZZ5CxMSN8cSm6sjV0Z8KQiSyKqr5AuHOvxfD9Nl/IXgW9VJRUSa2DZuIt
	 /akkFLPWvLDy7ytqqBJ4eYmg9iCnbq9UlW5LAiC2djjy8cQjwuaaDR+mpiFimKufMGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nRcc0xSZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD86606A320
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nRcc0xSZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AB31F000C4;
	Sun, 22 Nov 2026 10:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795342834;
	bh=Wpvgzwn4vHuwpHwyEp7ZSp+VcB0zSaNfIZR6B9cElYk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nRcc0xSZQQM+oWmQDRcfMK8/fyC7+Ydmg0SzfmGlw8Bt726SsF6ZRqYISa5NLL1S3
	 PuOta4VBhyESe0TNMbf6sLJMgxm3smCl7bf/iZl0wmS9GuyTQ5ZyAsBpBhjt50FcYV
	 D4gIrGaBVRQJPtl9MgBnK5UnauAln/KRGG67Y3CC6MOcH+dMJRe1Qk0jlTrJAwUZbY
	 Ha3+H7jHzy7kXY8o9nbqhqSEoxDydJb0HSa47SHL3vYVdZWJQ/6flqXKoH45HSQZ8L
	 eFUuKQllYM8Hz8izKNC+ErsdIFb/FuZZZIoBY9HAdcRbs97kpdMzzbAn7By1epk8Co
	 pfE9aMMv7Hc8Q==
Message-ID: <sashiko-outbox-227889@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] pmdomain: imx8m-blk-ctrl: Keep the domains left
 on by the bootloader
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261122095927.2631909-4-dario.binacchi@amarulasolutions.com>
References: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
 <20261122095927.2631909-4-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 10:20:33 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] pmdomain: imx8m-blk-ctrl: unlocked bus domain check in
  imx8m_blk_ctrl_is_off()
- [Medium] pmdomain: imx8m-blk-ctrl: put_boot_on() races with genpd
  power_off_work
--

commit c08d94b261d674a0f3a8ba6bcb7abe4442f21fa6
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

pmdomain: imx8m-blk-ctrl: Keep the domains left on by the bootloader

This commit reads the blk-ctrl registers at probe time on supported SoCs
(i.MX8MN DISP) to keep power domains left on by the bootloader active
until their consumers release them.

> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 7d6735728d8c6..5ab201eefeb38 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
[ ... ]
> @@ -187,11 +190,80 @@ static int imx8m_blk_ctrl_power_off(struct generic_=
pm_domain *genpd)
>  	/* allow bus domain to suspend */
>  	pm_runtime_put(bc->bus_power_dev);
> =20
> +	domain->boot_on =3D false;
> +
>  	return 0;
>  }
> =20
>  static struct lock_class_key blk_ctrl_genpd_lock_class;
> =20
> +/*
> + * A domain left on by the bootloader has its resets deasserted and its
> + * clocks enabled. The registers can only be read if the bus domain is
> + * on, so a domain is considered off whenever the bus domain is off.
> + */
> +static bool imx8m_blk_ctrl_is_off(struct imx8m_blk_ctrl *bc,
> +				  const struct imx8m_blk_ctrl_data *bc_data,
> +				  const struct imx8m_blk_ctrl_domain_data *data)
> +{
> +	u32 rst, clk, mipi =3D 0;
> +
> +	if (!bc_data->boot_state_readable ||
> +	    !dev_pm_genpd_is_on(bc->bus_power_dev))
> +		return true;
> +
> +	if (regmap_read(bc->regmap, BLK_SFT_RSTN, &rst) ||
> +	    regmap_read(bc->regmap, BLK_CLK_EN, &clk))
> +		return true;
> +
> +	if (data->mipi_phy_rst_mask &&
> +	    regmap_read(bc->regmap, BLK_MIPI_RESET_DIV, &mipi))
> +		return true;
> +
> +	return (rst & data->rst_mask) !=3D data->rst_mask ||
> +	       (clk & data->clk_mask) !=3D data->clk_mask ||
> +	       (mipi & data->mipi_phy_rst_mask) !=3D data->mipi_phy_rst_mask;
> +}

[Severity: High]
Can the upstream bus domain (pgc_dispmix) power down asynchronously on
pm_wq between dev_pm_genpd_is_on(bc->bus_power_dev) and the regmap_read()
calls?

dev_pm_genpd_is_on() drops the genpd lock before returning, and no
runtime PM reference is held on bc->bus_power_dev during the domain loop
in imx8m_blk_ctrl_probe().  If DISPMIX was off at boot, an earlier probe
of a child domain such as pgc_mipi powers pgc_dispmix on with
PD_FLAG_ATTACH_POWER_ON, and dev_pm_domain_attach_by_name() in
imx8m_blk_ctrl_probe() queues pgc_dispmix->power_off_work on pm_wq right
before imx8m_blk_ctrl_is_off() runs:

CPU0                                  kworker (pm_wq)
imx8m_blk_ctrl_probe()
  dev_pm_domain_attach_by_name()
    genpd_queue_power_off_work()
  imx8m_blk_ctrl_is_off()
    dev_pm_genpd_is_on() -> true
                                      genpd_power_off_work_fn()
                                        imx_pgc_power_down(pgc_dispmix)
    regmap_read(bc->regmap, ...)  <-- MMIO read with DISPMIX powered off

Reading the disp_blk_ctrl registers after DISPMIX and its
DISP_AXI_ROOT/DISP_APB_ROOT clocks are disabled causes a bus hang or
synchronous external abort during boot.

> +
> +/* Take the references of imx8m_blk_ctrl_power_on() for a domain left on=
 */
> +static int imx8m_blk_ctrl_get_boot_on(struct imx8m_blk_ctrl_domain *doma=
in)
> +{
> +	struct imx8m_blk_ctrl *bc =3D domain->bc;
> +	int ret;
> +
> +	if (!domain->boot_on)
> +		return 0;
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
> +	return 0;
> +}
> +
> +static void imx8m_blk_ctrl_put_boot_on(struct imx8m_blk_ctrl_domain *dom=
ain)
> +{
> +	if (!domain->boot_on)
> +		return;
> +
> +	/* Sync, to power down the bus domain before its notifier is removed */
> +	pm_runtime_put_sync(domain->power_dev);
> +	pm_runtime_put_sync(domain->bc->bus_power_dev);
> +	domain->boot_on =3D false;
> +}
[ ... ]
> @@ -353,6 +439,10 @@ static int imx8m_blk_ctrl_probe(struct platform_devi=
ce *pdev)
>  	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
>  cleanup_provider:
>  	of_genpd_del_provider(dev->of_node);
> +cleanup_boot_on:
> +	while (i--)
> +		imx8m_blk_ctrl_put_boot_on(&bc->domains[i]);
> +	i =3D bc_data->num_domains;
>  cleanup_pds:
>  	for (i--; i >=3D 0; i--) {
>  		pm_genpd_remove(&bc->domains[i].genpd);
> @@ -374,6 +464,7 @@ static void imx8m_blk_ctrl_remove(struct platform_dev=
ice *pdev)
>  	for (i =3D 0; i < bc->onecell_data.num_domains; i++) {
>  		struct imx8m_blk_ctrl_domain *domain =3D &bc->domains[i];
> =20
> +		imx8m_blk_ctrl_put_boot_on(domain);
>  		pm_genpd_remove(&domain->genpd);
>  		dev_pm_domain_detach(domain->power_dev, true);
>  	}

[Severity: Medium]
Can imx8m_blk_ctrl_put_boot_on() race with domain->genpd.power_off_work
when called before pm_genpd_remove()?

Both imx8m_blk_ctrl_remove() and the cleanup_boot_on path in
imx8m_blk_ctrl_probe() call imx8m_blk_ctrl_put_boot_on() before
pm_genpd_remove() cancels power_off_work, without taking genpd_lock or
transitioning domain->genpd.status to GENPD_STATE_OFF.  If power_off_work
was queued on pm_wq (for example by genpd_power_off_unused() or when a
consumer detaches), both paths drop the same runtime PM references:

CPU0                                  kworker (pm_wq)
imx8m_blk_ctrl_remove()
  imx8m_blk_ctrl_put_boot_on(domain)
    pm_runtime_put_sync(power_dev)
    pm_runtime_put_sync(bus_power_dev)
    domain->boot_on =3D false
  pm_genpd_remove(&domain->genpd)
    cancel_work_sync(&power_off_work)
                                      genpd_power_off_work_fn()
                                        genpd_power_off()
                                          imx8m_blk_ctrl_power_off()
                                            regmap_clear_bits(...)
                                            pm_runtime_put(power_dev)
                                            pm_runtime_put(bus_power_dev)
                                              <-- double put & MMIO while
                                                  bus_power_dev is off

Calling pm_genpd_remove(&domain->genpd) before
imx8m_blk_ctrl_put_boot_on(domain) (matching imx_pgc_domain_remove() in
drivers/pmdomain/imx/gpcv2.c) ensures power_off_work is flushed before
checking domain->boot_on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122095927.2631=
909-1-dario.binacchi@amarulasolutions.com?part=3D3
