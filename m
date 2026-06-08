Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CCC3101A6
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 16:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934406; cv=none; b=q0UQ2JDimU/36/OeeexV4qFd91vCzoZBjgoqZ9KVs16vKu2O3ekTmoHYP5+BpfxvbGTvXQcl9ykrLLreY4qnBas/yUm9MlAE7ENOVscTlziSg8zPa/xHOB0Y9o88WBdBNTvUPwRbkDMFcV6wVOw9+kTS2wDWGOmI7b+6+5zzKZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934406; c=relaxed/simple;
	bh=2mPZvtXpuPnYtcPssD9rCSzXNVvFlUIJfPaQznMjMDA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CDT77Cqoc08/bAK1G9EY0q4gU7GrcwShujUmIpfuqbsfu0YZM+EPlHQ8/kh8daMPRc34giX76zvTBdrauwfXpC3djC7l2IrHmDJ5BuyRFuGQ/43Azi3NXHlKmo0Y95N3rCD/fnLY375mOsgYzL2+cm3rGykHan2Q0gV+8U5iVSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkSh2iyz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkSh2iyz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC91C1F00893;
	Mon,  8 Jun 2026 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780934405;
	bh=S6StLvVzihFSKl6qSW+5rz+3FxzQcH+hyriKypXWyiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HkSh2iyzy4H6D2HllD+kpW9vokMdR9/oSZ0W1aahgtUqUMtYkClWuHhvlKC3HZbsA
	 PVw6YYvTIddbFckJO9KIkvpdoZmRfG+9fTTRKl1+5fwi2Rff29FAqv+7GVDbk+w6va
	 wzTRfGwyzfhS8M6UBen0R/PkGp04mCiKN+C8uCcmazcuEwd43e457fHjn9oWQwhn85
	 jWqLS1RBKeO5rwIynzECLAs8IOKgz5jgwM9hXZD7sECN3TOvc6oQTQEch8fQNJT0mS
	 /UJqrAAgsyrS5nQF64Qe4oVyUI9fxrLwhrn3P97B6kTIneRvW7qBMquLhiM/vwzPk9
	 tKAtWU6n/N7uA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 19/78] drm/bridge: imx8qxp-pxl2dpi: Switch to
 atomic_create_state
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maxime Ripard" <mripard@kernel.org>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-19-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-19-0a91018bf886@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 16:00:04 +0000
Message-Id: <20260608160004.EC91C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Global device state corruption in atomic_check.
--

commit e8d715f17c3f8417137a6f4c52d8a5d876a47307
Author: Maxime Ripard <mripard@kernel.org>

drm/bridge: imx8qxp-pxl2dpi: Switch to atomic_create_state

This commit replaces the deprecated atomic_reset callback and its helper
with the atomic_create_state callback and its counterpart.

> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/d=
rm/bridge/imx/imx8qxp-pxl2dpi.c
> index 87305d3e0c398..2fc9831f7e611 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
> @@ -210,7 +210,7 @@ imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts(str=
uct drm_bridge *bridge,
>  static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs =3D {
>  	.atomic_duplicate_state	=3D drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state	=3D drm_atomic_helper_bridge_destroy_state,
> -	.atomic_reset		=3D drm_atomic_helper_bridge_reset,
> +	.atomic_create_state		=3D drm_atomic_helper_bridge_create_state,
>  	.attach			=3D imx8qxp_pxl2dpi_bridge_attach,
>  	.destroy		=3D imx8qxp_pxl2dpi_bridge_destroy,
>  	.atomic_check		=3D imx8qxp_pxl2dpi_bridge_atomic_check,

[Severity: High]
This isn't a bug introduced by this patch, but does
imx8qxp_pxl2dpi_bridge_atomic_check() mutate global device state during the
atomic check phase?

In the DRM atomic framework, atomic_check can be executed for test-only
commits (DRM_MODE_ATOMIC_TEST_ONLY), which never proceed to the hardware
commit phase.

Looking at imx8qxp_pxl2dpi_bridge_atomic_check() in
drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:

    p2d->in_bus_format =3D bridge_state->input_bus_cfg.format;
    p2d->out_bus_format =3D bridge_state->output_bus_cfg.format;

For non-blocking commits, the commit tail executes in a background worker
without holding modeset locks. It then calls mode_set where this state is r=
ead:

drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c:imx8qxp_pxl2dpi_bridge_mode_se=
t() {
    ...
    switch (p2d->out_bus_format) {
    ...
}

Can a concurrent test-only commit overwrite this global state while an
ongoing non-blocking commit is reading it, leading to the display hardware
being misconfigured with test-only bus formats?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608-drm-no-mor=
e-bridge-reset-v2-0-0a91018bf886@kernel.org?part=3D19
