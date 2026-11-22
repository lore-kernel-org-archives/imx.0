Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795342326;
	b=O1cl/VhpFkN5XQ2o/JLzwYfnHWF8fbxY6j39sp4GtasN2w6z1kT228Fzw1dDAUwjqT0R
	 UOQOgsAvLS3qRZHc96ARcuYtlkkI9mkKbPcYa8Ze4EL1u/PZhP00/zihctdtP8pKXk0vw
	 kug6xXy9Ee3ZKZwQpgADTalUqjvbMAz5S7H94yPGYhOtVI0kNpJLDFLRAkXfe4PfcV/56
	 9FmlUSEQ/VuiOaqMDj37Oaw+TXxOu3Oy4skXlXFCK7XpEtMV17I4LUjPBzMiwH6JEfWmo
	 jtACsEW0KP55AI92i/qUtn6w5B7QnKSb3flfssMJWTH/Gqzp6b9NyPRPVSDwY1VXlBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795342326;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hTeMf89tmg5eZpF6ZhqJT/r/4VK0oVSTXz0jJ12QdUQ=;
	b=wXhQboCu0gpAZmU6FyY7JNJho1J40kktL+Sifrkmc34zWdLEvDS+y1z9UKb2TdBo/Fc0
	 R0Nax7h7IiiocLntF8xvBnE7XGg8uKKXvM+e0LwvDrttYiqILkvc9XY9UvXFq+RELrhJ/
	 UxvwFx8g8fPH3dL9hrGeNghm5xLSIO6cPnEtnUgLD7J0zpcikJSvyARqTBO6gn2jDHEUT
	 1Z6pHq91FlN8qg2rB7cv2Ny1vrt/iUVm+TbNc8ncElAoG2SxoQ1hQTHF4f4NIbUo/92Qd
	 EcrF3hecAkzFSBfHfL3CHxfcZucDwiWe29nuW2ZwlgFm3zYHLS2WemivQSHfehZQNuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCt92yd0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35749606A330
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 10:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCt92yd0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF42E1F000CF;
	Sun, 22 Nov 2026 10:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795342325;
	bh=hTeMf89tmg5eZpF6ZhqJT/r/4VK0oVSTXz0jJ12QdUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nCt92yd0C/dyIQ4WWNZsYKUKXaUxi3zbfp3Mrm/zYtmi6dpwQOsaNojOhwt4p1t06
	 /TLSUoXAbleWWBRy4cdS9p63BhBQobVDhEDpytXqXTQEgy6sCqgvgnl8F2yvv+p0h6
	 /W9G6Mf+s60mCkdi4whmiJbzPDtFQDU4YvYzs8SIra07kFaxVKRUzuCi9pmDFFSCGi
	 vBdl2FQMGiFJ/lUc/oF4QFkHd1ablmK/vZSP2blZJZEimLiywjHXDjQPa9M8naoSNn
	 foj+v8cAWC9HXCVdGBn0siQuniKqMBzfsoLRKL/WGgX4NxQb8OQAzp3QQfS8mozvwj
	 TKyFEgrUsuA6g==
Message-ID: <sashiko-outbox-227887@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/4] pmdomain: imx: gpcv2: Keep the domains left on
 by the bootloader
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261122095927.2631909-3-dario.binacchi@amarulasolutions.com>
References: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
 <20261122095927.2631909-3-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 10:12:05 +0000
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
- [Medium] pmdomain: imx: gpcv2: async pm_runtime_put() before disable
  in probe()
--

commit bc7dd5905cdf54cdef1c1603983c4dca7eef08f7
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

pmdomain: imx: gpcv2: Keep the domains left on by the bootloader

This commit checks the ADB400 power-up handshake acknowledge bit during
probe to detect domains left on by the bootloader and registers them as
active in genpd while acquiring their runtime PM, regulator, and clock
resources.

> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index 6a54ee7345146..71e551f0471d2 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c

[ ... ]

> @@ -1362,11 +1415,20 @@ static int imx_pgc_domain_probe(struct platform_d=
evice *pdev)
>  					   &domain->genpd);
>  	if (ret) {
>  		dev_err_probe(domain->dev, ret, "Failed to add genpd provider\n");
> -		goto out_genpd_remove;
> +		goto out_clk_disable;
>  	}
> =20
>  	return 0;
> =20
> +out_clk_disable:
> +	if (!init_off && domain->keep_clocks)
> +		clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
> +out_regulator_disable:
> +	if (!init_off && !IS_ERR(domain->regulator))
> +		regulator_disable(domain->regulator);
> +out_put_pm:
> +	if (!init_off)
> +		pm_runtime_put(domain->dev);
>  out_genpd_remove:
>  	pm_genpd_remove(&domain->genpd);
>  out_domain_unmap:

[Severity: Medium]
Should out_put_pm use pm_runtime_put_sync(domain->dev) like
imx_pgc_domain_remove() does?

pm_runtime_put() queues an asynchronous runtime suspend work item that is
immediately canceled by the following pm_runtime_disable() call under
out_domain_unmap.  If regulator_enable(), clk_bulk_prepare_enable(), or
of_genpd_add_provider_simple() fails on a boot-on domain, domain->dev is
left in RPM_ACTIVE and leaks the active reference on its parent device and
any parent power domain.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122095927.2631=
909-1-dario.binacchi@amarulasolutions.com?part=3D2
