Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BBD40E8D6
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 13:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098475; cv=none; b=EvaGStWn9RpyYRIN4QCiDEeqgqhFql4AYkblNAo6G7Hxf1wKQVcnvkhitzEWponUzJqgfn4N0jYeTkwOIYeNLVYkVDl/IqRXsIJS6nk/B8g3JMx2OFvedaw9YHKB7IlUYyee448PXy40UGR5ZoBXUchIP0SZYZCKTtHLucOyIsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098475; c=relaxed/simple;
	bh=S2t8VxaSuVch/QFvk4cJeE1DS1qhJPfkOQMzkfPCIrE=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dKLGfav/u5a6HIp+CmYdjqJQN7WfsMEdSLwlbGz2JL3n0qRk2Cn3wBVnDfk1ixZzLaw+ViBe3JnLdYc8P2vJYNyag59bWEHL5oI1IZ++M52cvYqnW0QdhBuc3bBu5I1A6biH8q3bu7tQ1XpCJkIW1B18OFjD792PQydikSheJ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K5QHJXEr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K5QHJXEr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58471F00899;
	Wed, 10 Jun 2026 13:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781098469;
	bh=+9INhOvZA4nqA7lnBjbDQ7nfwDWpTdif8L50C0Vt7Xk=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=K5QHJXEreXRzI/kz8RguE0s1kWa/BFP1+bbx0it4lRA83vj/BsQ0/BodUHhqQ+/Eb
	 6121bp4qvLG5O0K7FAA/3xX49IXSBJ4o3F2/NYaAKYPRrjd/xnbH4zahPROsZm5qwi
	 TR0WH8aJhRqAXCiJ1s1pUkPT2VL841//rM4VrCCvBkzrqoNAOVAdWDWXpf2/TQi50I
	 isFiYE8Bb6esNrH2/dYjB7dSndk2/gJsxMrRQ1t+ygtUpayDg8OX9RmWg+KP7TyrQz
	 289/Ga1sf//XwseNK0S0NvorxNNw3RmGJ1PU+VqT5wMduOa2/LarZzJYDeKpbtUWqj
	 g91GlC5X2GP8w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] pmdomain: imx: Fix i.MX8MP VC8000E power up
 sequence
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-2-ea58ce929c84@nxp.com>
References: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-2-ea58ce929c84@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 13:34:28 +0000
Message-Id: <20260610133429.B58471F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] A registered PM domain power notifier is not removed if `devm_=
of_platform_populate()` fails during probe, leading to a Use-After-Free.
- [High] Missing `pm_runtime_put_noidle()` for `domain->power_dev` when `pm=
_runtime_get_sync()` fails in `imx8m_blk_ctrl_power_on()`.
--

commit 66b12e5f806bfaa002428850f133acef50ed1a55
Author: Peng Fan <peng.fan@nxp.com>

pmdomain: imx: Fix i.MX8MP VC8000E power up sequence

This patch addresses an errata for the i.MX8MP VPU_NOC power down handshake,
which may hang during power cycles due to timing issues between the VC8000E
reset and AXI clock. It introduces a boolean flag to apply a workaround that
clears the clock before powering up the GPC and enables it afterward.

> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index e13a47eeed75d..99d100e1d923f 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c

[ ... ]

> @@ -108,7 +117,11 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm=
_domain *genpd)
>  		dev_err(bc->dev, "failed to enable clocks\n");
>  		goto bus_put;
>  	}
> -	regmap_set_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> +
> +	if (data->is_errata_err050531)
> +		regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> +	else
> +		regmap_set_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> =20
>  	/* power up upstream GPC domain */
>  	ret =3D pm_runtime_get_sync(domain->power_dev);
> @@ -117,6 +130,9 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_=
domain *genpd)
>  		goto clk_disable;

[Severity: High]
This is a pre-existing issue, but does this error path leak the runtime PM
reference?

When pm_runtime_get_sync(domain->power_dev) fails, it returns a negative
error code but the usage counter remains incremented.

The error path jumps to the clk_disable label:

clk_disable:
	clk_bulk_disable_unprepare(data->num_clks, domain->clks);
bus_put:
	pm_runtime_put(bc->bus_power_dev);

	return ret;

Should there be a call to pm_runtime_put_noidle(domain->power_dev) here to
balance the counter and prevent the device from remaining permanently activ=
e?

>  	}
> =20
> +	if (data->is_errata_err050531)
> +		regmap_set_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
> +

[ ... ]

[Severity: Critical]
This is a pre-existing issue, but is there a use-after-free risk in the
imx8m_blk_ctrl_probe() error path?

If devm_of_platform_populate() fails, the code branches to the
cleanup_provider label:

	ret =3D devm_of_platform_populate(dev);
	if (ret)
		goto cleanup_provider;

The cleanup path explicitly detaches bc->bus_power_dev but never unregisters
the power_nb notifier from it:

cleanup_provider:
	of_genpd_del_provider(dev->of_node);
cleanup_pds:
	for (i--; i >=3D 0; i--) {
		pm_genpd_remove(&bc->domains[i].genpd);
		dev_pm_domain_detach(bc->domains[i].power_dev, true);
	}

	dev_pm_domain_detach(bc->bus_power_dev, true);

	return ret;

Since bc is devm-allocated, the memory containing bc->power_nb will be freed
when probe fails. When the PM domain later changes state, the core will
iterate over the notifier chain and dereference the freed memory.

Should dev_pm_genpd_remove_notifier() be called before returning to prevent
the freed notifier block from remaining in the generic PM domain's list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-b4-imx8mp-=
vc8000e-pm-v4-1-v4-0-ea58ce929c84@nxp.com?part=3D2
