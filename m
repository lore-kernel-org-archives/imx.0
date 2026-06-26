Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC523EB119;
	Fri, 26 Jun 2026 12:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782476932; cv=none; b=puEWSCuGzGTIgasElR532cS+rR8km+CTwHHpfYajDTtMrpOLFWk4a1sD9ALgs62fyNCf+sRmqwZf1OooNLyY4RF1Do3MzhGtZv2SAcJS07Wm7GPg1HPibttEaN8NdRPyQfuY03QarA3LEIH0yUMP/SLs9ETlvW5q8ElXBWK33Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782476932; c=relaxed/simple;
	bh=EuYHdDkxKv74QpXGITxG++N90FubIMTS8UX+4m68oKs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AR7pIH0weGbWQZMaP+hnEUF7AyNPApEY51vIbZvVQ/Sff+PGj28NtpE5/EaKNr/dTpGi6zsyrGDVUQlPStD6EbQmVCpLvKS/LBTWZ9XH5og67RftWVURldYxGs41h9EGDvGtrrswxbTalZsJxJRuhyEqXuSTw5GT5/qDOi9Sods=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScigcWiJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScigcWiJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25EB41F000E9;
	Fri, 26 Jun 2026 12:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782476931;
	bh=Oq7+vhyTYseavzzb/dsXp/Ko/erWkhnfnbiJKBRgnSg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ScigcWiJBMpP3xLzvb/kpfIHHLAzLOAbduAf7FY2FdxB/Bfn0HAZGxgj1b2gsg/Ng
	 KJ9vNYCb1EAQVnmsp+xWugVgzJ2KGQS2qRJnfVx0OpLl3uPJD+FikvTejlKSxTN1Pn
	 +Cc0VwvrSEp1PmY8mLH3Zrxc3tpSsVJ2JxAtWMc1U2KI3kvcBHAi4S0K7qYkZkknPJ
	 egO23Fg9X0tV9sCfdojmYzzMheDm/UXdA93Psopo3OAHbrwlWVDb/urhY6e/KgX+oN
	 SCokV2ip0BwOqYNuKXZdEnVBcyIFD3y0RJ3olXy7AZrmZPwsN5RQDPsIa3/aSQKVkR
	 VMcrJDAGx3UxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] drm: release panel reference after panel bridge
 creation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Albert Esteve" <aesteve@redhat.com>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260626-drm_refcount_wiring-v1-5-cca1a7b3bdef@redhat.com>
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-5-cca1a7b3bdef@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jun 2026 12:28:50 +0000
Message-Id: <20260626122851.25EB41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Medium] Memory leak of DRM panel reference when multiple endpoints defin=
e panels in pl111_modeset_init().

Pre-existing issues:
- [High] Uninitialized `tmp_bridge` can be used and dereferenced if `drm_of=
_find_panel_or_bridge` returns `-ENODEV`.
- [High] Passing an `ERR_PTR` to `drm_panel_bridge_remove()` in `tve200_mod=
eset_init()` error path causes a kernel panic.
- [High] Missing `IS_ERR()` check on bridge returned by `devm_drm_panel_bri=
dge_add_typed()` leads to `ERR_PTR` dereference in `ingenic_drm_bind()`.
- [High] Overwriting `bridge->funcs` corrupts external bridges and defeats =
`drm_panel_bridge_remove()` cleanup in `rockchip_lvds_bind()`.
--

commit ffb6fad5e4cf513ed7c3fe05c38be4669593628f
Author: Albert Esteve <aesteve@redhat.com>

drm: release panel reference after panel bridge creation

This commit updates drivers to release the panel reference after wrapping
it in a panel bridge, as the panel bridge now holds its own reference. It
also drops unused references on error paths.

> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/=
ingenic/ingenic-drm-drv.c
> index 42c86f195c66b..1887e01d29701 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1297,9 +1297,11 @@ static int ingenic_drm_bind(struct device *dev, bo=
ol has_components)
>  			goto err_drvdata;
>  		}
> =20
> -		if (panel)
> +		if (panel) {
>  			bridge =3D devm_drm_panel_bridge_add_typed(dev, panel,
>  								 DRM_MODE_CONNECTOR_DPI);
> +			drm_panel_put(panel);
> +		}

[Severity: High]
This is a pre-existing issue, but does this missing error check lead to a
panic?=20

devm_drm_panel_bridge_add_typed() returns an ERR_PTR on failure. By
not checking IS_ERR(), the error pointer is stored and later passed to
drm_bridge_attach(), which will try to dereference it since it only checks
for NULL.

> =20
>  		ib =3D drmm_encoder_alloc(drm, struct ingenic_drm_bridge, encoder,
>  					NULL, DRM_MODE_ENCODER_DPI, NULL);

[ ... ]

> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl=
111_drv.c
> index ac7b1d12a0f59..8ec659b3c08eb 100644
> --- a/drivers/gpu/drm/pl111/pl111_drv.c
> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
> @@ -145,6 +145,7 @@ static int pl111_modeset_init(struct drm_device *dev)
>  	if (panel) {
>  		bridge =3D drm_panel_bridge_add_typed(panel,
>  						    DRM_MODE_CONNECTOR_Unknown);
> +		drm_panel_put(panel);

[Severity: Medium]
Could this leak panel references if multiple endpoints define panels?
Earlier in pl111_modeset_init(), it iterates through endpoints:

	for_each_endpoint_of_node(np, remote) {
		struct drm_panel *tmp_panel;
		...
		if (tmp_panel) {
			...
			panel =3D tmp_panel;
		}
	}

If the loop iterates multiple times and finds more than one panel, the
panel variable is overwritten without calling drm_panel_put() on the
previously found panel. Since this patch makes the panels return counted
references, does this introduce a leak for the overwritten panels?

[Severity: High]
This is a pre-existing issue, but could an uninitialized tmp_bridge cause a
crash here? In the same loop:

	for_each_endpoint_of_node(np, remote) {
		struct drm_panel *tmp_panel;
		struct drm_bridge *tmp_bridge;

		ret =3D drm_of_find_panel_or_bridge(..., &tmp_panel, &tmp_bridge);

If drm_of_find_panel_or_bridge() returns -ENODEV, the tmp_bridge parameter
is untouched. The code then evaluates if (tmp_bridge), which checks
uninitialized stack memory. If it evaluates to true, the garbage pointer is
assigned to the bridge variable and eventually dereferenced.

>  		if (IS_ERR(bridge)) {
>  			ret =3D PTR_ERR(bridge);
>  			goto finish;

[ ... ]

> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/r=
ockchip/rockchip_lvds.c
> index 7a0c4fa29f2f0..f754445d2631b 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -605,6 +605,7 @@ static int rockchip_lvds_bind(struct device *dev, str=
uct device *master,
> =20
>  	if (lvds->panel) {
>  		lvds->bridge =3D drm_panel_bridge_add_typed(lvds->panel, DRM_MODE_CONN=
ECTOR_LVDS);
> +		drm_panel_put(lvds->panel);
>  		if (IS_ERR(lvds->bridge)) {
>  			ret =3D PTR_ERR(lvds->bridge);

[Severity: High]
This is a pre-existing issue, but does overwriting the bridge functions
cause memory leaks or panel failures? Later in rockchip_lvds_bind(), the
code does:

	lvds->bridge->funcs =3D &rockchip_lvds_bridge_funcs;

Since lvds->bridge points to an external bridge or panel bridge created by
drm_panel_bridge_add_typed(), overwriting its function pointers modifies an
object owned by another driver.=20

Does this permanently disable the bridge's original operations? Additionall=
y,
would drm_panel_bridge_remove() in the error path skip freeing the bridge
since it checks if the funcs pointer matches the default panel bridge
functions?

>  			goto err_free_encoder;

[ ... ]

> diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200=
/tve200_drv.c
> index 562f3f11812a3..f858c58ccb994 100644
> --- a/drivers/gpu/drm/tve200/tve200_drv.c
> +++ b/drivers/gpu/drm/tve200/tve200_drv.c
> @@ -84,6 +84,7 @@ static int tve200_modeset_init(struct drm_device *dev)
>  	if (panel) {
>  		bridge =3D drm_panel_bridge_add_typed(panel,
>  						    DRM_MODE_CONNECTOR_Unknown);
> +		drm_panel_put(panel);
>  		if (IS_ERR(bridge)) {
>  			ret =3D PTR_ERR(bridge);
>  			goto out_bridge;

[Severity: High]
This is a pre-existing issue, but can the error path cause a panic?=20

If drm_panel_bridge_add_typed() fails and returns an ERR_PTR, we jump to
out_bridge:

out_bridge:
	if (panel)
		drm_panel_bridge_remove(bridge);

Since panel is not NULL, drm_panel_bridge_remove(bridge) is called with the
ERR_PTR. The removal function checks if (!bridge) which is false for an
ERR_PTR, and then immediately dereferences bridge->funcs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260626-drm_refcou=
nt_wiring-v1-0-cca1a7b3bdef@redhat.com?part=3D5
