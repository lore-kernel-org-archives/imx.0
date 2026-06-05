Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E784DA526
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661046; cv=none; b=ThZUDlSyyIvkaQ1U+SkRhm4nldismVG6pzgG+Bj2IxhKHLTCSrhIyzq1M4wMpnW3z1BxYQAftT1oDLwbsgIo4vviz/09fkRuG/ummR6NIQWRiGW2ju3q/JZuTvfLUoGuXAY+Sph2fGrJVlv9rKGYcF6i/T8oPQiPlfzEPorAqfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661046; c=relaxed/simple;
	bh=H2OmyfwLqa9q7uk7JCDbaguntJegL7Ou+kEy8cxuePU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W49vQtJbbz4eugdsqKrR6cMyMcKnd9LJMafuLLPA9uVI4ORfS5OdlKF9doowE/NCz2eizQpMK+GaXuGWC8jf7K8dsv3N4S6NYcWRgHmL00JEUyyUGdO2rNTl6IEBVFBQa6JQwXZd4uHBwT4mRCpOclyzXKg2LSSphxnIE6DS8pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVzMYBHV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVzMYBHV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BBD1F00893;
	Fri,  5 Jun 2026 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780661045;
	bh=LiobKirOKB1xrmPmD1Ax/udrBxe/KUlH8/zk9/Rngtg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NVzMYBHVrpaO0CNEy3s7aTaXJuFbIQnrl0he7XjlDp2jecgYXzCqLRLQNeyzWDQom
	 67twrkCaJ1+ccBbbSNfNtEropq+ftRbi0ioxfLh6/ODJsFKlMC0m8aM97wabu8CU0G
	 7PwEeSC5hmQ0gPj8OUSKl2x1n1gssKvdWqWG/gxkNXNnJYstHBx98g4ZW6YNO0Q8L1
	 O8NERVpQFGUykKR7g+h/C8C4ZlURyP9JOSQRUbVSPXZojRgD6bnbV8bG0rVokZj/J7
	 g4vCwVROxVPXSxdlBlN4SoO2O+83M7t9etF8PHTYCBzagVjo4x7qPQyAiX79dNITOa
	 n5NOlRiIf5E9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] phy: freescale: phy-fsl-imx8qm-lvds-phy: Fix missing
 pm_runtime_disable() on probe error path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felix Gu" <ustc.gu@gmail.com>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260605-lvds-v2-1-3ce7539d1104@gmail.com>
References: <20260605-lvds-v2-1-3ce7539d1104@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 12:04:04 +0000
Message-Id: <20260605120404.D1BBD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pending asynchronous suspend scheduled by `pm_runtime_put()` can b=
e cancelled by `pm_runtime_disable()` during probe failure, leaving the har=
dware permanently in an active power state.
--

commit 8ed1a4a5b60301f95aa6700ff6d900f3ad7141f0
Author: Felix Gu <ustc.gu@gmail.com>

phy: freescale: phy-fsl-imx8qm-lvds-phy: Fix missing pm_runtime_disable() o=
n probe error path

This commit replaces manual pm_runtime_disable() calls with
devm_pm_runtime_enable() to automatically clean up runtime PM during probe
failures or unbinds.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c b/drivers/ph=
y/freescale/phy-fsl-imx8qm-lvds-phy.c
> index ece3574435217..c662f91e598c7 100644
> --- a/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c

[ ... ]

> @@ -355,17 +357,15 @@ static int mixel_lvds_phy_probe(struct platform_dev=
ice *pdev)
> =20
>  	for (i =3D 0; i < PHY_NUM; i++) {
>  		lvds_phy =3D devm_kzalloc(dev, sizeof(*lvds_phy), GFP_KERNEL);
> -		if (!lvds_phy) {
> -			ret =3D -ENOMEM;
> -			goto err;
> -		}
> +		if (!lvds_phy)
> +			return -ENOMEM;
> =20
>  		phy =3D devm_phy_create(dev, NULL, &mixel_lvds_phy_ops);
>  		if (IS_ERR(phy)) {
>  			ret =3D PTR_ERR(phy);
>  			dev_err(dev, "failed to create PHY for channel%d: %d\n",
>  				i, ret);
> -			goto err;
> +			return ret;

[Severity: High]
This is a pre-existing issue, but will these error paths leave the hardware
powered on indefinitely if initialization fails?

Just prior to this loop, mixel_lvds_phy_probe() calls mixel_lvds_phy_reset(=
),
which finishes by queuing an asynchronous suspend:

drivers/phy/freescale/phy-fsl-imx8qm-lvds-phy.c:mixel_lvds_phy_reset() {
	...
	regmap_write(priv->regmap, PHY_CTRL, CTRL_RESET_VAL);

	pm_runtime_put(dev);

	return 0;
}

If a subsequent initialization step fails and returns an error, the devres
cleanup will immediately execute pm_runtime_disable() (which was also the
case previously with the goto err label).

Because pm_runtime_disable() calls __pm_runtime_barrier(), it cancels any
pending asynchronous idle or suspend work. This means the runtime suspend
callback might never execute, leaving the PHY hardware fully powered up.

Should mixel_lvds_phy_reset() use pm_runtime_put_sync() instead to
guarantee the device is properly suspended before a potential error
disables runtime PM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-lvds-v2-1-=
3ce7539d1104@gmail.com?part=3D1
