Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721FD502D5A
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 11:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790680056; cv=none; b=RRtwuc2Uw0Hb13EuSOjQxsIKFB36srCLqicsjE80frhmKy9WIcrWZV+a7Z3GcfUGbLdfZ9/G7u85R7KD5bCe4e8u9vRRY1K+ERC8yDINvcNyOdCrwPKKR+kMTeLTQ9h7wCI2Mk4MZesrYsigla7Oc+baLZrm5fJLJjU1+4jGWak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790680056; c=relaxed/simple;
	bh=WyS6oXrtGPf6tATAuV7YayFH5FqEDoyKW58jIgc719U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mFa3I4J0kQFEqOIPC56lTDhPLi0XgLs+az0L2AQCe7SaapggGImzuD+q+KTpQ+6IkFyUd44uyo+JUmcwJABIgrFDT/OC9DrvyNed4d69drifOzgAcB5t3vP8ytZi4YHDbRgjnFAFxKQOld+uGulOFSVJntwCjm7F5YenDTRkJZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOotmrsr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOotmrsr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B93C1F000FF;
	Tue, 29 Sep 2026 11:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790680055;
	bh=xhBwNNCpXoQCpM0mTTJfiov/xOzj5LCov6hCtYp8syg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OOotmrsr4GWEjTGzC1JIYx/Fb6oLwJnAwWYmVYusUn9KI24/kde1kWfm3XoqqQZvF
	 ebOezHAeqHyg4filgNhP2bHht0h1uluyj8mbdw725CdhLYHuPr/e5rASIzTfXz/vAg
	 RWUkOW08MTfamN71QuwR6DvroMWtP4PRliRrWCjM4W/vEGal6iirhh3tuCkB5P3ae8
	 kE3aeizeMwSOsuPl2u6zfthoNpd+DKQohGpHmEPDN2imDlxM5ATUkyw9Neot4xPlEn
	 /6eNXEOJZw/Xo1fqWA9FmgpIsg1mBnxxXUGmwIbDRh2fOnTti5Vfv+6xNegtpuw0my
	 LBuNvznbMIXjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/7] drm/bridge: dw-mipi-dsi2: stop using deprecated
 devm_drm_of_get_bridge()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-4-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
 <20260929-drm-fix-of_get_bridge-build-regression-v1-4-ccb7e602daad@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 11:07:34 +0000
Message-Id: <20260929110734.9B93C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] drm/bridge: dw-mipi-dsi2: memory leak of downstream bridge refer=
ence
--

commit 3a105594a4d4f8c22ed3e9167fb40a2696227085
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: dw-mipi-dsi2: stop using deprecated devm_drm_of_get_bridge()

This commit replaces the deprecated devm_drm_of_get_bridge() function with
of_drm_get_bridge_by_endpoint(), which returns a refcounted bridge. It upda=
tes
the code to store the acquired bridge in the next_bridge field of the
drm_bridge structure so that the reference is automatically released when t=
he
parent bridge is destroyed.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu=
/drm/bridge/synopsys/dw-mipi-dsi2.c
> index 7fd2f1e60654f..a008450d83aa3 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
> @@ -528,12 +527,12 @@ static int dw_mipi_dsi2_host_attach(struct mipi_dsi=
_host *host,
>  	dsi2->format =3D device->format;
>  	dsi2->mode_flags =3D device->mode_flags;
> =20
> -	bridge =3D devm_drm_of_get_bridge(dsi2->dev, dsi2->dev->of_node, 1, 0);
> +	bridge =3D of_drm_get_bridge_by_endpoint(dsi2->dev->of_node, 1, 0);
>  	if (IS_ERR(bridge))
>  		return PTR_ERR(bridge);
> =20
>  	bridge->pre_enable_prev_first =3D true;
> -	dsi2->panel_bridge =3D bridge;
> +	dsi2->bridge.next_bridge =3D bridge;

[Severity: Medium]
Does this assignment potentially leak the bridge reference if the error pat=
h is
taken later in dw_mipi_dsi2_host_attach()?

The DRM core automatically drops the next_bridge reference when the parent
bridge is freed (at driver unbind). However, if pdata->host_ops->attach()
fails later in this function, the error path calls drm_bridge_remove() but
next_bridge is not explicitly cleared or manually put.

If the DSI peripheral later triggers another attach attempt, will a new
reference overwrite next_bridge, permanently leaking the previous one?

> =20
>  	drm_bridge_add(&dsi2->bridge);
> =20

[ ... ]

> @@ -565,8 +564,6 @@ static int dw_mipi_dsi2_host_detach(struct mipi_dsi_h=
ost *host,
> =20
>  	drm_bridge_remove(&dsi2->bridge);
> =20
> -	drm_of_panel_bridge_remove(host->dev->of_node, 1, 0);
> -
>  	return 0;
>  }

[Severity: Medium]
Does this detach path also leak the downstream bridge reference if the DSI
device is unbound and rebound?

Similar to the error path in dw_mipi_dsi2_host_attach(), detaching removes =
the
bridge from the list but leaves the refcounted pointer in
dsi2->bridge.next_bridge without putting it. On the next attach attempt, a =
new
reference will be acquired and assigned, potentially stranding the previous
reference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-drm-fix-of=
_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com?part=3D4
